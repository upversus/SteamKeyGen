unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.ExtCtrls, FMX.Controls.Presentation, FMX.StdCtrls, System.Actions,
  FMX.ActnList, FMX.TabControl, FMX.Layouts, FMX.ListBox, FMX.ScrollBox,
  FMX.Memo,windows, FMX.Colors, FMX.Objects,VCL.clipbrd;

type
  TForm1 = class(TForm)
    Button1: TButton;
    PopupBox1: TPopupBox;
    Edit1: TEdit;
    Button2: TButton;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    TabItem2: TTabItem;
    Memo1: TMemo;
    Timer1: TTimer;
    Memo2: TMemo;
    Label1: TLabel;
    Timer2: TTimer;
    CheckBox1: TCheckBox;
    Button3: TButton;
    CheckBox2: TCheckBox;
    Button4: TButton;
    Memo3: TMemo;
    Memo4: TMemo;
    CheckBox3: TCheckBox;
    Button5: TButton;
    Timer3: TTimer;
    Panel1: TPanel;
    Edit2: TEdit;
    Label2: TLabel;
    Button6: TButton;
    Edit3: TEdit;
    Button7: TButton;
    StyleBook1: TStyleBook;
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Memo1Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure CheckBox1Change(Sender: TObject);
    procedure TabControl1Change(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox2Change(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Timer3Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox3Change(Sender: TObject);
    procedure Button6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

  Cur: TPoint;
    I,Y: integer;
    x1,x2,x3:integer;
    y1,y2,y3:integer;
      typeKey:integer;
implementation

{$R *.fmx}
{$R *.Windows.fmx MSWINDOWS}

procedure TForm1.Button1Click(Sender: TObject);
var

  keyCount:integer;
  resultCode:integer;

  Ho,M,S,Ms:Word;
  simbol:integer;
  key:string;
begin
Memo1.Lines.Clear;

Button1.Enabled:=false;
Button2.Enabled:=true;
val(Edit1.Text,keyCount,resultCode);
   DecodeTime(Time,Ho,M,S,Ms);
   RandSeed:=Ms;
   typeKey:=25;
case PopupBox1.ItemIndex of
0: typeKey:=25;
1: typeKey:=15;
end;

for I := 1 to keyCount do
begin
Application.ProcessMessages;
 key:='';
 for Y := 1 to typeKey do
 begin
  Application.ProcessMessages;
 simbol:=Random(26)+48;
 if (simbol>57) and (simbol<65) then simbol:=Random(26)+65;
 // if (simbol>57) and (simbol<97) then simbol:=Random(26)+97;


  key:=key+chr(simbol);
  if (y mod 5)=0 then key:=key+'-';
 end;
 if typeKey=25 then Delete(key,30,1);
 if typeKey=15 then Delete(key,18,1);
  Memo1.Lines.Add(key);
  key:='';

end;
Button1.Tag:=1;
Button1.Enabled:=true;
Edit3.Text:=Memo1.Lines[0];
Clipboard.AsText:=Edit3.Text;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
if Memo1.Lines.Count=0 then Exit;

TabControl1.TabIndex:=TabControl1.TabIndex+1;
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
CheckBox2.Enabled:=CheckBox1.IsChecked;
end;

procedure TForm1.Button4Click(Sender: TObject);
begin
CheckBox3.Enabled:=CheckBox2.IsChecked;
end;


procedure Delay(dwMilliseconds: Longint);
 var
   iStart, iStop: DWORD;
 begin
   iStart := GetTickCount;
   repeat
     iStop := GetTickCount;
     Application.ProcessMessages;
   until (iStop - iStart) >= dwMilliseconds;
 end;

procedure TForm1.Button6Click(Sender: TObject);
var
interval,tmp1,lengthKey:integer;
keyStr:string;
key:word;
begin
val(Edit2.Text,interval,tmp1);
//Timer3.Interval:=interval;
//Timer3.Enabled:=True;

  Timer1.Enabled:=false;
  Timer2.Enabled:=false;
for tmp1 := 1 to 3 do

//for I := 1 to Memo1.Lines.Count-1 do
  begin

 // SetCursorPos(x1,y1);
  //жмем кнопку мышки
  mouse_event(MOUSEEVENTF_LEFTDOWN,x1,y1,0,0);
  mouse_event(MOUSEEVENTF_LEFTUP,x1,y1,0,0);
  mouse_event(MOUSEEVENTF_LEFTDOWN,x1,y1,0,0);
  mouse_event(MOUSEEVENTF_LEFTUP,x1,y1,0,0);

 Clipboard.asText:=Memo1.Lines[tmp1];

   keybd_event(VK_LCONTROL, 0, 0, 0); //Нажатие левого Ctrl.
    keybd_event(Ord('V'), 0, 0, 0); //

  keybd_event(Ord('V'), 0, KEYEVENTF_KEYUP, 0); //Отпускание 'z'.
   keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); //Отпускание левого Ctrl.

 // SetCursorPos(x2,y2);
  //жмем кнопку мышки
  mouse_event(MOUSEEVENTF_LEFTDOWN,x2,y2,0,0);
  mouse_event(MOUSEEVENTF_LEFTUP,x2,y2,0,0);

  Delay(interval+1000);

 //    SetCursorPos(x3,y3);
  //жмем кнопку мышки
  mouse_event(MOUSEEVENTF_LEFTDOWN,x3,y3,0,0);
  mouse_event(MOUSEEVENTF_LEFTUP,x3,y3,0,0);

  end;
  Timer3.Enabled:=false;
end;

procedure TForm1.CheckBox1Change(Sender: TObject);
begin
Button3.Enabled:=CheckBox1.IsChecked;
if not CheckBox1.IsChecked then CheckBox2.Enabled:=CheckBox1.IsChecked;
end;

procedure TForm1.CheckBox2Change(Sender: TObject);
begin
Button4.Enabled:=CheckBox2.IsChecked;
end;

procedure TForm1.CheckBox3Change(Sender: TObject);
begin
Button5.Enabled:=CheckBox3.IsChecked;
end;

procedure TForm1.FormCreate(Sender: TObject);
var
key:word;

begin
key:=VK_CAPITAL;
keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP,0);
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY,0);
  keybd_event(Key,0,KEYEVENTF_EXTENDEDKEY or KEYEVENTF_KEYUP,0);
end;

procedure TForm1.Memo1Click(Sender: TObject);
begin
Memo1.Lines.Add('Click');
end;

procedure TForm1.TabControl1Change(Sender: TObject);
begin
if TabControl1.Index>0 then
  begin
    Timer1.Enabled:=true;
    Timer2.Enabled:=true;
  end
  else
  begin
    Timer1.Enabled:=false;
    Timer2.Enabled:=false;
  end



end;

procedure TForm1.Timer1Timer(Sender: TObject);

begin
// Получаю координаты курсора
GetCursorPos( Cur );

//Memo1.Lines.Add(IntToStr(Cur.x)+' '+IntToStr(Cur.y));
//mouse_event(MOUSEEVENTF_LEFTDOWN,Cur.X,Cur.Y,0,0);
//mouse_event(MOUSEEVENTF_LEFTUP,Cur.X,Cur.Y,0,0);
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var
  State : TKeyboardState;
  pressCTRL:boolean;
begin
  GetKeyboardState(State);
  pressCTRL := ((State[vk_Control] and 128) <> 0);
  if not CheckBox1.IsChecked then
  begin
      if pressCTRL then CheckBox1.Text:=IntToStr(Cur.x)+':'+IntToStr(Cur.y);
      x1:=Cur.x;y1:=Cur.Y;
  end;

  if (CheckBox2.Enabled and not CheckBox2.IsChecked) then
  begin
         if pressCTRL then CheckBox2.Text:=IntToStr(Cur.x)+':'+IntToStr(Cur.y);
            x2:=Cur.x;y2:=Cur.Y;
  end;

  if (CheckBox3.Enabled and not CheckBox3.IsChecked) then
  begin
     if pressCTRL then CheckBox3.Text:=IntToStr(Cur.x)+':'+IntToStr(Cur.y);
        x3:=Cur.x;y3:=Cur.Y;
  end;


end;

procedure TForm1.Timer3Timer(Sender: TObject);
var
key:word;

begin
Memo1.SetFocus;

   keybd_event(VK_LCONTROL, 0, 0, 0); //Нажатие левого Ctrl.
    keybd_event(Ord('V'), 0, 0, 0); //Нажатие 'z'.

  keybd_event(Ord('V'), 0, KEYEVENTF_KEYUP, 0); //Отпускание 'z'.
   keybd_event(VK_LCONTROL, 0, KEYEVENTF_KEYUP, 0); //Отпускание левого Ctrl.
end;

end.
