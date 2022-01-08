Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEE1B48844D
	for <lists+qemu-devel@lfdr.de>; Sat,  8 Jan 2022 16:46:23 +0100 (CET)
Received: from localhost ([::1]:59366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n6DvD-0001EK-3e
	for lists+qemu-devel@lfdr.de; Sat, 08 Jan 2022 10:46:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6Drb-0002rI-F6
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:42:39 -0500
Received: from [2a00:1450:4864:20::52f] (port=40837
 helo=mail-ed1-x52f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dpetroff@gmail.com>)
 id 1n6DrZ-0007Kv-8m
 for qemu-devel@nongnu.org; Sat, 08 Jan 2022 10:42:39 -0500
Received: by mail-ed1-x52f.google.com with SMTP id a18so33427086edj.7
 for <qemu-devel@nongnu.org>; Sat, 08 Jan 2022 07:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=DyEBOfPMRpDo0JhFvKAw77FbPxkFc8vqDnGnefKOy94=;
 b=VqQfWiz/ORYglGGmd8qMesOup7ZipFCv2shUNzlrOOioabt2MBMiMMuUEkW53751L/
 I7CCHJR3++jIbk9NFWy5+dTvJ7ofwX1lDv7VDHNNKVPaLDVaNbzgHIEi4vHQs4B7080M
 DEdwHiVpPuihxbOKhTQKDx0pO6P4xj+lQBRZb1lgwdeGrzZQXuYh79sbPtpcxkjd22fI
 7AfsXyfVDnov/Fhz6++L8BESTVuzVrC65I/3bn4ztVDI/WoDU0TWBdi4BUX/LOPjU1lq
 S6FPgWNZjsiUxzlCJs2wTs9yIdHjl42AQ8cHYloq21ZygCLFWx6NfJcxy+MCwhbNUxb8
 XzrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=DyEBOfPMRpDo0JhFvKAw77FbPxkFc8vqDnGnefKOy94=;
 b=jVU+gjIPIczQf4bPbAybzJ3cVofUVc8tZMfhRKjkUmHO+BWL3qtr3JYOKCczfdESEn
 CWr5g+UPPWGrp0g37re6reiRJUt24a5W28wLEGQbtVxPjWIYR6qlTzKZzSZCo3f7YY0X
 MZPij1Kg/DtPyeHABB6FT9YpRKCnueLDhBRWd3k+BFAPzsPWOJCzDaM1vZ5q/vHUVf+F
 yfuDkeym/iPjqwd2qtSNq9nJSq1RJvJBfB08Eorsfsmug2Z1o+B0XZQTdf3QRzbWYnvz
 SKCSvgaZ/lH9I+Gi80nBaw/KsQ+ntsoAmdnkkt8osD1x5GgZAKwt/D2RKQHIj7iVNqFH
 Peug==
X-Gm-Message-State: AOAM532wHdtuixbmyEiTITld8L+2hYHyj+UuENookKflBiAE+//Sw3Zx
 etVAW77YvLCpDM7Mng1X89auAP37hsAzLDEvG03kSuJF
X-Google-Smtp-Source: ABdhPJxxDXfjWcriQxhmXfVCWE6xrhqyBhwmEjvPSK667RjuTRiIDEXjEmvPOX+h1kFgjYIkLyP9kR2XTb/T+bEbFRo=
X-Received: by 2002:a05:6402:2026:: with SMTP id
 ay6mr59636226edb.273.1641656555856; 
 Sat, 08 Jan 2022 07:42:35 -0800 (PST)
MIME-Version: 1.0
References: <20211222010647.1332479-1-dpetroff@gmail.com>
 <YdRL/ElWwJURqkQC@redhat.com>
In-Reply-To: <YdRL/ElWwJURqkQC@redhat.com>
From: Dmitry Petrov <dpetroff@gmail.com>
Date: Sat, 8 Jan 2022 15:42:24 +0000
Message-ID: <CADufsaSGhdOrpMXCaqkKwdBW7Wp0Dy+kMuNzhB01WzKHvGaEBg@mail.gmail.com>
Subject: Re: [PATCH v2 1/5] ps2: Initial horizontal scroll support
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000dae61f05d513f375"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::52f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=dpetroff@gmail.com; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: QEMU <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000dae61f05d513f375
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

Thanks for the link! I've sent a v4 patch with a cover letter that includes
it as well
as the latest comments by Marc-Andr=C3=A9 to v2 of the patch.

Kind regards, Dmitry

On Tue, 4 Jan 2022 at 13:30, Daniel P. Berrang=C3=A9 <berrange@redhat.com> =
wrote:

> On Wed, Dec 22, 2021 at 02:06:43AM +0100, Dmitry Petrov wrote:
> > v2:
> >   - Patch is split into a sequence
> >   - value is clamped to 31 for horizontal scroll
> >
> > This patch introduces horizontal scroll support for the ps/2
> > mouse.
> >
> > The patch is based on the previous work
> > by Brad Jorsch done in 2010
> > but never merge, see
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D579968
>
> The bugs attached to that ticket don't have any Signed-off-by
> from Brad. Fortunately at the time he did re-submit them on
> qemu-devel with Signed-off-by present.
>
> Can you include this link to his patches in your commit
> message to get the paper trail
>
>   https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg00223.html
>
> > This change adds support for horizontal scroll to ps/2 mouse device
> > code. The code is implemented to match the logic of linux kernel
> > which is used as a reference.
> >
> > Signed-off-by: Dmitry Petrov <dpetroff@gmail.com>
> > ---
> >  hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++-------
> >  qapi/ui.json   |  2 +-
> >  2 files changed, 50 insertions(+), 9 deletions(-)
> >
> > diff --git a/hw/input/ps2.c b/hw/input/ps2.c
> > index 9376a8f4ce..6236711e1b 100644
> > --- a/hw/input/ps2.c
> > +++ b/hw/input/ps2.c
> > @@ -123,6 +123,7 @@ typedef struct {
> >      int mouse_dx; /* current values, needed for 'poll' mode */
> >      int mouse_dy;
> >      int mouse_dz;
> > +    int mouse_dw;
> >      uint8_t mouse_buttons;
> >  } PS2MouseState;
> >
> > @@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
> >      /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes */
> >      const int needed =3D s->mouse_type ? 4 : 3;
> >      unsigned int b;
> > -    int dx1, dy1, dz1;
> > +    int dx1, dy1, dz1, dw1;
> >
> >      if (PS2_QUEUE_SIZE - s->common.queue.count < needed) {
> >          return 0;
> > @@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
> >      dx1 =3D s->mouse_dx;
> >      dy1 =3D s->mouse_dy;
> >      dz1 =3D s->mouse_dz;
> > +    dw1 =3D s->mouse_dw;
> >      /* XXX: increase range to 8 bits ? */
> >      if (dx1 > 127)
> >          dx1 =3D 127;
> > @@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
> >      /* extra byte for IMPS/2 or IMEX */
> >      switch(s->mouse_type) {
> >      default:
> > +        /* Just ignore the wheels if not supported */
> > +        s->mouse_dz =3D 0;
> > +        s->mouse_dw =3D 0;
> >          break;
> >      case 3:
> >          if (dz1 > 127)
> > @@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *s=
)
> >          else if (dz1 < -127)
> >                  dz1 =3D -127;
> >          ps2_queue_noirq(&s->common, dz1 & 0xff);
> > +        s->mouse_dz -=3D dz1;
> > +        s->mouse_dw =3D 0;
> >          break;
> >      case 4:
> > -        if (dz1 > 7)
> > -            dz1 =3D 7;
> > -        else if (dz1 < -7)
> > -            dz1 =3D -7;
> > -        b =3D (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
> > +        /*
> > +         * This matches what the Linux kernel expects for exps/2 in
> > +         * drivers/input/mouse/psmouse-base.c. Note, if you happen to
> > +         * press/release the 4th or 5th buttons at the same moment as =
a
> > +         * horizontal wheel scroll, those button presses will get lost=
.
> I'm not
> > +         * sure what to do about that, since by this point we don't kn=
ow
> > +         * whether those buttons actually changed state.
> > +         */
> > +        if (dw1 !=3D 0) {
> > +            if (dw1 > 31) {
> > +                dw1 =3D 31;
> > +            } else if (dw1 < -31) {
> > +                dw1 =3D -31;
> > +            }
> > +
> > +            /*
> > +             * linux kernel expects first 6 bits to represent the valu=
e
> > +             * for horizontal scroll
> > +             */
> > +            b =3D (dw1 & 0x3f) | 0x40;
> > +            s->mouse_dw -=3D dw1;
> > +        } else {
> > +            if (dz1 > 7) {
> > +                dz1 =3D 7;
> > +            } else if (dz1 < -7) {
> > +                dz1 =3D -7;
> > +            }
> > +
> > +            b =3D (dz1 & 0x0f) | ((s->mouse_buttons & 0x18) << 1);
> > +            s->mouse_dz -=3D dz1;
> > +        }
> >          ps2_queue_noirq(&s->common, b);
> >          break;
> >      }
> > @@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)
> >      /* update deltas */
> >      s->mouse_dx -=3D dx1;
> >      s->mouse_dy -=3D dy1;
> > -    s->mouse_dz -=3D dz1;
> >
> >      return 1;
> >  }
> > @@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev,
> QemuConsole *src,
> >              } else if (btn->button =3D=3D INPUT_BUTTON_WHEEL_DOWN) {
> >                  s->mouse_dz++;
> >              }
> > +
> > +            if (btn->button =3D=3D INPUT_BUTTON_WHEEL_RIGHT) {
> > +                s->mouse_dw--;
> > +            } else if (btn->button =3D=3D INPUT_BUTTON_WHEEL_LEFT) {
> > +                s->mouse_dw++;
> > +            }
> >          } else {
> >              s->mouse_buttons &=3D ~bmap[btn->button];
> >          }
> > @@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)
> >          /* if not remote, send event. Multiple events are sent if
> >             too big deltas */
> >          while (ps2_mouse_send_packet(s)) {
> > -            if (s->mouse_dx =3D=3D 0 && s->mouse_dy =3D=3D 0 && s->mou=
se_dz =3D=3D
> 0)
> > +            if (s->mouse_dx =3D=3D 0 && s->mouse_dy =3D=3D 0
> > +                    && s->mouse_dz =3D=3D 0 && s->mouse_dw =3D=3D 0) {
> >                  break;
> > +            }
> >          }
> >      }
> >  }
> > @@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)
> >      s->mouse_dx =3D 0;
> >      s->mouse_dy =3D 0;
> >      s->mouse_dz =3D 0;
> > +    s->mouse_dw =3D 0;
> >      s->mouse_buttons =3D 0;
> >  }
> >
> > diff --git a/qapi/ui.json b/qapi/ui.json
> > index d7567ac866..9dac1bf548 100644
> > --- a/qapi/ui.json
> > +++ b/qapi/ui.json
> > @@ -905,7 +905,7 @@
> >  ##
> >  { 'enum'  : 'InputButton',
> >    'data'  : [ 'left', 'middle', 'right', 'wheel-up', 'wheel-down',
> 'side',
> > -  'extra' ] }
> > +  'extra', 'wheel-left', 'wheel-right' ] }
> >
> >  ##
> >  # @InputAxis:
> > --
> > 2.32.0
> >
> >
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-
> https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-
> https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-
> https://www.instagram.com/dberrange :|
>
>

--000000000000dae61f05d513f375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Daniel,</div><div><br></div><div>Thanks for the li=
nk! I&#39;ve sent a v4 patch with a cover letter that includes it as well</=
div><div>as the latest comments by Marc-Andr=C3=A9 to v2 of the patch.</div=
><div><br></div><div>Kind regards, Dmitry<br></div></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 4 Jan 2022 at 13=
:30, Daniel P. Berrang=C3=A9 &lt;<a href=3D"mailto:berrange@redhat.com">ber=
range@redhat.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Wed, Dec 22, 2021 at 02:06:43AM +0100, Dmitry Petrov wro=
te:<br>
&gt; v2:<br>
&gt;=C2=A0 =C2=A0- Patch is split into a sequence<br>
&gt;=C2=A0 =C2=A0- value is clamped to 31 for horizontal scroll<br>
&gt; <br>
&gt; This patch introduces horizontal scroll support for the ps/2<br>
&gt; mouse.<br>
&gt; <br>
&gt; The patch is based on the previous work<br>
&gt; by Brad Jorsch done in 2010<br>
&gt; but never merge, see<br>
&gt; <a href=3D"https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=3D579968"=
 rel=3D"noreferrer" target=3D"_blank">https://bugs.debian.org/cgi-bin/bugre=
port.cgi?bug=3D579968</a><br>
<br>
The bugs attached to that ticket don&#39;t have any Signed-off-by<br>
from Brad. Fortunately at the time he did re-submit them on<br>
qemu-devel with Signed-off-by present.<br>
<br>
Can you include this link to his patches in your commit<br>
message to get the paper trail<br>
<br>
=C2=A0 <a href=3D"https://lists.gnu.org/archive/html/qemu-devel/2010-05/msg=
00223.html" rel=3D"noreferrer" target=3D"_blank">https://lists.gnu.org/arch=
ive/html/qemu-devel/2010-05/msg00223.html</a><br>
<br>
&gt; This change adds support for horizontal scroll to ps/2 mouse device<br=
>
&gt; code. The code is implemented to match the logic of linux kernel<br>
&gt; which is used as a reference.<br>
&gt; <br>
&gt; Signed-off-by: Dmitry Petrov &lt;<a href=3D"mailto:dpetroff@gmail.com"=
 target=3D"_blank">dpetroff@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/input/ps2.c | 57 +++++++++++++++++++++++++++++++++++++++++++-=
------<br>
&gt;=C2=A0 qapi/ui.json=C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 2 files changed, 50 insertions(+), 9 deletions(-)<br>
&gt; <br>
&gt; diff --git a/hw/input/ps2.c b/hw/input/ps2.c<br>
&gt; index 9376a8f4ce..6236711e1b 100644<br>
&gt; --- a/hw/input/ps2.c<br>
&gt; +++ b/hw/input/ps2.c<br>
&gt; @@ -123,6 +123,7 @@ typedef struct {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int mouse_dx; /* current values, needed for &#39;p=
oll&#39; mode */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int mouse_dy;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 int mouse_dz;<br>
&gt; +=C2=A0 =C2=A0 int mouse_dw;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t mouse_buttons;<br>
&gt;=C2=A0 } PS2MouseState;<br>
&gt;=C2=A0 <br>
&gt; @@ -715,7 +716,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* IMPS/2 and IMEX send 4 bytes, PS2 sends 3 bytes=
 */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 const int needed =3D s-&gt;mouse_type ? 4 : 3;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 unsigned int b;<br>
&gt; -=C2=A0 =C2=A0 int dx1, dy1, dz1;<br>
&gt; +=C2=A0 =C2=A0 int dx1, dy1, dz1, dw1;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (PS2_QUEUE_SIZE - s-&gt;common.queue.count &lt;=
 needed) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0;<br>
&gt; @@ -724,6 +725,7 @@ static int ps2_mouse_send_packet(PS2MouseState *s)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dx1 =3D s-&gt;mouse_dx;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dy1 =3D s-&gt;mouse_dy;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 dz1 =3D s-&gt;mouse_dz;<br>
&gt; +=C2=A0 =C2=A0 dw1 =3D s-&gt;mouse_dw;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* XXX: increase range to 8 bits ? */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 if (dx1 &gt; 127)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dx1 =3D 127;<br>
&gt; @@ -740,6 +742,9 @@ static int ps2_mouse_send_packet(PS2MouseState *s)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* extra byte for IMPS/2 or IMEX */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 switch(s-&gt;mouse_type) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 default:<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* Just ignore the wheels if not supporte=
d */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case 3:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dz1 &gt; 127)<br>
&gt; @@ -747,13 +752,41 @@ static int ps2_mouse_send_packet(PS2MouseState *=
s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (dz1 &lt; -127)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D =
-127;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ps2_queue_noirq(&amp;s-&gt;common, d=
z1 &amp; 0xff);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case 4:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dz1 &gt; 7)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D 7;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 else if (dz1 &lt; -7)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D -7;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dz1 &amp; 0x0f) | ((s-&gt;mouse_bu=
ttons &amp; 0x18) &lt;&lt; 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* This matches what the Linux kerne=
l expects for exps/2 in<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* drivers/input/mouse/psmouse-base.=
c. Note, if you happen to<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* press/release the 4th or 5th butt=
ons at the same moment as a<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* horizontal wheel scroll, those bu=
tton presses will get lost. I&#39;m not<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* sure what to do about that, since=
 by this point we don&#39;t know<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* whether those buttons actually ch=
anged state.<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw1 !=3D 0) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dw1 &gt; 31) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw1 =3D 31;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (dw1 &lt; -31) {<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dw1 =3D -31;<=
br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /*<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* linux kernel expect=
s first 6 bits to represent the value<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* for horizontal scro=
ll<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*/<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dw1 &amp; 0x3f) | 0x=
40;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dw -=3D dw1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (dz1 &gt; 7) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D 7;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (dz1 &lt; -7) {<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dz1 =3D -7;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 b =3D (dz1 &amp; 0x0f) | ((=
s-&gt;mouse_buttons &amp; 0x18) &lt;&lt; 1);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br=
>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ps2_queue_noirq(&amp;s-&gt;common, b=
);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -764,7 +797,6 @@ static int ps2_mouse_send_packet(PS2MouseState *s)=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 /* update deltas */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dx -=3D dx1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dy -=3D dy1;<br>
&gt; -=C2=A0 =C2=A0 s-&gt;mouse_dz -=3D dz1;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 return 1;<br>
&gt;=C2=A0 }<br>
&gt; @@ -806,6 +838,12 @@ static void ps2_mouse_event(DeviceState *dev, Qem=
uConsole *src,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (btn-&gt;but=
ton =3D=3D INPUT_BUTTON_WHEEL_DOWN) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mo=
use_dz++;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (btn-&gt;button =3D=3D I=
NPUT_BUTTON_WHEEL_RIGHT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_d=
w--;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else if (btn-&gt;button =
=3D=3D INPUT_BUTTON_WHEEL_LEFT) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_d=
w++;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 } else {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_buttons &a=
mp;=3D ~bmap[btn-&gt;button];<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt; @@ -833,8 +871,10 @@ static void ps2_mouse_sync(DeviceState *dev)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /* if not remote, send event. Multip=
le events are sent if<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0too big deltas */<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 while (ps2_mouse_send_packet(s)) {<b=
r>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mouse_dx =3D=3D 0=
 &amp;&amp; s-&gt;mouse_dy =3D=3D 0 &amp;&amp; s-&gt;mouse_dz =3D=3D 0)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (s-&gt;mouse_dx =3D=3D 0=
 &amp;&amp; s-&gt;mouse_dy =3D=3D 0<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 &amp;&amp; s-&gt;mouse_dz =3D=3D 0 &amp;&amp; s-&gt;mouse_dw =3D=3D 0) {<b=
r>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
&gt;=C2=A0 }<br>
&gt; @@ -1036,6 +1076,7 @@ static void ps2_mouse_reset(void *opaque)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dx =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dy =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_dz =3D 0;<br>
&gt; +=C2=A0 =C2=A0 s-&gt;mouse_dw =3D 0;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 s-&gt;mouse_buttons =3D 0;<br>
&gt;=C2=A0 }<br>
&gt;=C2=A0 <br>
&gt; diff --git a/qapi/ui.json b/qapi/ui.json<br>
&gt; index d7567ac866..9dac1bf548 100644<br>
&gt; --- a/qapi/ui.json<br>
&gt; +++ b/qapi/ui.json<br>
&gt; @@ -905,7 +905,7 @@<br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 { &#39;enum&#39;=C2=A0 : &#39;InputButton&#39;,<br>
&gt;=C2=A0 =C2=A0 &#39;data&#39;=C2=A0 : [ &#39;left&#39;, &#39;middle&#39;=
, &#39;right&#39;, &#39;wheel-up&#39;, &#39;wheel-down&#39;, &#39;side&#39;=
,<br>
&gt; -=C2=A0 &#39;extra&#39; ] }<br>
&gt; +=C2=A0 &#39;extra&#39;, &#39;wheel-left&#39;, &#39;wheel-right&#39; ]=
 }<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 ##<br>
&gt;=C2=A0 # @InputAxis:<br>
&gt; -- <br>
&gt; 2.32.0<br>
&gt; <br>
&gt; <br>
<br>
Regards,<br>
Daniel<br>
-- <br>
|: <a href=3D"https://berrange.com" rel=3D"noreferrer" target=3D"_blank">ht=
tps://berrange.com</a>=C2=A0 =C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D"http=
s://www.flickr.com/photos/dberrange" rel=3D"noreferrer" target=3D"_blank">h=
ttps://www.flickr.com/photos/dberrange</a> :|<br>
|: <a href=3D"https://libvirt.org" rel=3D"noreferrer" target=3D"_blank">htt=
ps://libvirt.org</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-o-=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://fstop138.berrange.com" rel=3D"n=
oreferrer" target=3D"_blank">https://fstop138.berrange.com</a> :|<br>
|: <a href=3D"https://entangle-photo.org" rel=3D"noreferrer" target=3D"_bla=
nk">https://entangle-photo.org</a>=C2=A0 =C2=A0 -o-=C2=A0 =C2=A0 <a href=3D=
"https://www.instagram.com/dberrange" rel=3D"noreferrer" target=3D"_blank">=
https://www.instagram.com/dberrange</a> :|<br>
<br>
</blockquote></div>

--000000000000dae61f05d513f375--

