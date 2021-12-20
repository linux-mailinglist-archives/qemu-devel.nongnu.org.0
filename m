Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 835BA47B1B0
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Dec 2021 17:56:51 +0100 (CET)
Received: from localhost ([::1]:50824 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzLxy-0004YJ-8d
	for lists+qemu-devel@lfdr.de; Mon, 20 Dec 2021 11:56:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:57286)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mzKet-00005W-UB
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:33:04 -0500
Received: from [2607:f8b0:4864:20::a35] (port=42774
 helo=mail-vk1-xa35.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <venture@google.com>)
 id 1mzKeq-0004jG-LD
 for qemu-devel@nongnu.org; Mon, 20 Dec 2021 10:33:03 -0500
Received: by mail-vk1-xa35.google.com with SMTP id s1so6361566vks.9
 for <qemu-devel@nongnu.org>; Mon, 20 Dec 2021 07:32:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=sqTVDiQarJDkJV8sWIIC0qPMKiRF2uN22/aqEpOa7ts=;
 b=RbMhjEVe1YIZUD/gNwg6FvGbBTdD//vyryGmifX27Z+fqnXlc3SI2p8cvM5yiDWfcX
 jeiMCq73KW7pH8B+GvpjRLQWN7W+1nBizecWaBxm/haXgxU+5gFEwH5tMzGisb1s8Yy6
 NSUZx4kkbSYFLFQePpYvIdKp+flzSdqR69nW5sKGBuFMQt6H9vWMAqTzKuqmE6UVTpCx
 8vX5jGz2XSJf75mEc4eLZQpBlvxL7jkjRkJHorBL0hZZMQv39lej8pZLLDPD4sWXYSro
 0KCwLROebusnwRNR+Nl8Q/PlYBYmU/dTRh8kME8OnaEldFoNTHO7zW+gN/P3rp2nOUQy
 lRGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=sqTVDiQarJDkJV8sWIIC0qPMKiRF2uN22/aqEpOa7ts=;
 b=1zlFh7Y1ufBzazXJyJlRi6X7syYv2h7WEYQzc/KS2wwZi54GOdv5nnx6+V+kJlGLcZ
 GSqPqprq4AB6MUALqIu5vV5XOB912+SL9H4F0b8OdPG+a54B12oznCNE0OEpkTruKNR+
 Sz4PhhDxhbp/ruNj00UJi1jcVGBaNWt3QXn9rfpCsPJw6aY1S1XieAjaHQwJqk0l9+X+
 mV80FOln9WUy+nrc5lZyNg4n88pl8B4YikA4Oi3GD9HoV10qR6a82Tl96TAAWAIoubQv
 RtIvwo/YmjtnHvFN25uYimU374a1xemWAR0i3+ooqFo27yA+eQKXSe6BTk9uB81cX+ND
 xHug==
X-Gm-Message-State: AOAM5315Bjtxcr0I1gbTRJ4+JTPXRvLdCqM45VMawbkR97F3XSHwMfL5
 GoMZtbq9K8NSuGpQqtHQXBNCDE8+lSDoW/5f366Qlg==
X-Google-Smtp-Source: ABdhPJy0pPy/Ix+DWYU7DcRuhQuM1cqJal7YGSR0Z6N7fdN+uOPXy0M4JR7M+YPlpp8U5T3xLRXwVRWeNuCH6WvkyJI=
X-Received: by 2002:a1f:c9c5:: with SMTP id z188mr5707373vkf.6.1640014355582; 
 Mon, 20 Dec 2021 07:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20211220003240.1081986-1-venture@google.com>
 <498f2e14-607a-afc3-d73a-58e7f6dad8e2@redhat.com>
In-Reply-To: <498f2e14-607a-afc3-d73a-58e7f6dad8e2@redhat.com>
From: Patrick Venture <venture@google.com>
Date: Mon, 20 Dec 2021 07:32:23 -0800
Message-ID: <CAO=notwf2X4e3BH_xnC_7GkGz1STe=jrkosmBiFXqGV6FT0U3A@mail.gmail.com>
Subject: Re: [PATCH] hw/nvram: at24 return 0xff if 1 byte address
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Cc: cminyard@mvista.com, qemu-devel@nongnu.org
Content-Type: multipart/alternative; boundary="00000000000017a3b305d39599ca"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::a35
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=venture@google.com; helo=mail-vk1-xa35.google.com
X-Spam_score_int: -167
X-Spam_score: -16.8
X-Spam_bar: ----------------
X-Spam_report: (-16.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000017a3b305d39599ca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 20, 2021 at 1:12 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
wrote:

> Hi Patrick,
>
> On 12/20/21 01:32, Patrick Venture wrote:
> > The at24 eeproms are 2 byte devices that return 0xff when they are read
> > from with a partial (1-byte) address written.  This distinction was
> > found comparing model behavior to real hardware testing.
> >
> > Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next
> > byte
> >
> > Signed-off-by: Patrick Venture <venture@google.com>
> > ---
> >  hw/nvram/eeprom_at24c.c | 8 +++++++-
> >  1 file changed, 7 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c
> > index a9e3702b00..184fac9702 100644
> > --- a/hw/nvram/eeprom_at24c.c
> > +++ b/hw/nvram/eeprom_at24c.c
> > @@ -62,7 +62,9 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event
> event)
> >      case I2C_START_SEND:
> >      case I2C_START_RECV:
> >      case I2C_FINISH:
> > -        ee->haveaddr =3D 0;
> > +        if (event !=3D I2C_START_RECV) {
> > +            ee->haveaddr =3D 0;
> > +        }
>
> Alternatively (matter of taste, I find it easier to read):
>
>        case I2C_START_SEND:
>        case I2C_FINISH:
>            ee->haveaddr =3D 0;
>            /* fallthrough */
>        case I2C_START_RECV:
>

That may be easier to read :) I'm not sure, but I'm willing to bend and
change my patch to behave this way.  Sometimes the fallthrough things leads
to compiler annoyances in my experience.  We might  need
__attribute__(fallthrough) or the like to convince the system that's what
we really want.

>
> >          DPRINTK("clear\n");
> >          if (ee->blk && ee->changed) {
> >              int len =3D blk_pwrite(ee->blk, 0, ee->mem, ee->rsize, 0);
> > @@ -86,6 +88,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)
> >      EEPROMState *ee =3D AT24C_EE(s);
> >      uint8_t ret;
> >
> > +    if (ee->haveaddr =3D=3D 1) {
> > +        return 0xff;
>
> Don't we need to increase ee->haveaddr?
>

We don't because the call to recv doesn't set any addr bytes.  This patch
is primarily a behavioral fix to handle the device being treated as 8-bit
addressable.  This is typically tested by writing a 1 byte address and then
trying to read.  The chip itself will not have enough address bytes and
reject this read by returning 0xff.  The haveaddr variable is strictly
updated when they've written another byte to the address, or they've
changed states in such a way that should clear any previously written
address.  You can read from an eeprom by just reading or by setting an
address and then reading.


>
> > +    }
> > +
> >      ret =3D ee->mem[ee->cur];
> >
> >      ee->cur =3D (ee->cur + 1u) % ee->rsize;
>
> Here for parity with send, what about:
>
>     if (ee->haveaddr < 2) {
>         ret =3D 0xff;
>         ee->haveaddr++;
>     } else {
>         ret =3D ee->mem[ee->cur];
>         ee->cur =3D (ee->cur + 1u) % ee->rsize;
>     }
>
> ?
>
>

--00000000000017a3b305d39599ca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 20, 2021 at 1:12 AM Phili=
ppe Mathieu-Daud=C3=A9 &lt;<a href=3D"mailto:philmd@redhat.com">philmd@redh=
at.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">Hi Patrick,<br>
<br>
On 12/20/21 01:32, Patrick Venture wrote:<br>
&gt; The at24 eeproms are 2 byte devices that return 0xff when they are rea=
d<br>
&gt; from with a partial (1-byte) address written.=C2=A0 This distinction w=
as<br>
&gt; found comparing model behavior to real hardware testing.<br>
&gt; <br>
&gt; Tested: `i2ctransfer -f -y 45 w1@85 0 r1` returns 0xff instead of next=
<br>
&gt; byte<br>
&gt; <br>
&gt; Signed-off-by: Patrick Venture &lt;<a href=3D"mailto:venture@google.co=
m" target=3D"_blank">venture@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 hw/nvram/eeprom_at24c.c | 8 +++++++-<br>
&gt;=C2=A0 1 file changed, 7 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/hw/nvram/eeprom_at24c.c b/hw/nvram/eeprom_at24c.c<br>
&gt; index a9e3702b00..184fac9702 100644<br>
&gt; --- a/hw/nvram/eeprom_at24c.c<br>
&gt; +++ b/hw/nvram/eeprom_at24c.c<br>
&gt; @@ -62,7 +62,9 @@ int at24c_eeprom_event(I2CSlave *s, enum i2c_event e=
vent)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case I2C_START_SEND:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case I2C_START_RECV:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 case I2C_FINISH:<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;haveaddr =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (event !=3D I2C_START_RECV) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;haveaddr =3D 0;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
<br>
Alternatively (matter of taste, I find it easier to read):<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_START_SEND:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_FINISH:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ee-&gt;haveaddr =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0/* fallthrough */<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0case I2C_START_RECV:<br></blockquote><div><br></=
div><div>That may be easier to read :) I&#39;m not sure, but I&#39;m willin=
g to bend and change my patch to behave this way.=C2=A0 Sometimes the fallt=
hrough things leads to compiler annoyances in my experience.=C2=A0 We might=
=C2=A0 need __attribute__(fallthrough) or the like to convince the system t=
hat&#39;s what we really want.=C2=A0</div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 DPRINTK(&quot;clear\n&quot;);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (ee-&gt;blk &amp;&amp; ee-&gt;cha=
nged) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 int len =3D blk_pwrite=
(ee-&gt;blk, 0, ee-&gt;mem, ee-&gt;rsize, 0);<br>
&gt; @@ -86,6 +88,10 @@ uint8_t at24c_eeprom_recv(I2CSlave *s)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 EEPROMState *ee =3D AT24C_EE(s);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 uint8_t ret;<br>
&gt;=C2=A0 <br>
&gt; +=C2=A0 =C2=A0 if (ee-&gt;haveaddr =3D=3D 1) {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 return 0xff;<br>
<br>
Don&#39;t we need to increase ee-&gt;haveaddr?<br></blockquote><div><br></d=
iv><div>We don&#39;t because the call to recv doesn&#39;t set any addr byte=
s.=C2=A0 This patch is primarily a behavioral fix to handle the device bein=
g treated as 8-bit addressable.=C2=A0 This is typically tested by writing a=
 1 byte address and then trying to read.=C2=A0 The chip itself will not hav=
e enough address bytes and reject this read by returning 0xff.=C2=A0 The ha=
veaddr=C2=A0variable is strictly updated when they&#39;ve written another b=
yte to the address, or they&#39;ve changed states in such a way that should=
 clear any previously written address.=C2=A0 You can read from an eeprom by=
 just reading or by setting an address and then reading.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 }<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0 =C2=A0 ret =3D ee-&gt;mem[ee-&gt;cur];<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 =C2=A0 =C2=A0 ee-&gt;cur =3D (ee-&gt;cur + 1u) % ee-&gt;rsize;<b=
r>
<br>
Here for parity with send, what about:<br>
<br>
=C2=A0 =C2=A0 if (ee-&gt;haveaddr &lt; 2) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D 0xff;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;haveaddr++;<br>
=C2=A0 =C2=A0 } else {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ret =3D ee-&gt;mem[ee-&gt;cur];<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 ee-&gt;cur =3D (ee-&gt;cur + 1u) % ee-&gt;rsize=
;<br>
=C2=A0 =C2=A0 }<br>
<br>
?<br>
<br>
</blockquote></div></div>

--00000000000017a3b305d39599ca--

