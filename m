Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED2D4B4FB2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Feb 2022 13:11:26 +0100 (CET)
Received: from localhost ([::1]:33118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJaCT-0005wi-34
	for lists+qemu-devel@lfdr.de; Mon, 14 Feb 2022 07:11:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:41308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nJa8Q-0002ux-QB
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:07:18 -0500
Received: from [2a00:1450:4864:20::42c] (port=46660
 helo=mail-wr1-x42c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nJa8O-0007Ad-Tc
 for qemu-devel@nongnu.org; Mon, 14 Feb 2022 07:07:14 -0500
Received: by mail-wr1-x42c.google.com with SMTP id q7so26356137wrc.13
 for <qemu-devel@nongnu.org>; Mon, 14 Feb 2022 04:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2mEmMhFJGqoSQuUdi+ePer6AEJOqXlRwLZpbsFNWvCc=;
 b=a9D6wFs4NJzXDTrqWXunB4/Mf20bYQXWqwZ9ls02DlQtLfoB7EOLeKIzQwrR3oFzq2
 abs9hjInD1dryev9soNoXJBEnH7GRfsRJvxcDN7XHROMgKXC6KwGMK+1Le894q/AjMgT
 VdjbHoViH6PNT4ADFOH5efr73zlsS7xd0BrONiNsjS+6+5KQeqOzt6jqPoDqucQvkfn1
 Z0d3IbmmYIEd3hszzq9dfBoIPL+Y0oYB1zgwtOO7XVc2sFRUZ+KLDIdOgpY3AygXZcdt
 xIMEf4mIqZsVzd+eWYciFRSF10TS5xtiyZ6kWjmUAxOf/BpPbYOUyV/AqWCG8KJIlcwg
 ogDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2mEmMhFJGqoSQuUdi+ePer6AEJOqXlRwLZpbsFNWvCc=;
 b=E71Phhc85vdZSh3c0yIxoEW3Y5gMFnL2+L6W4OgbuY8RB3kcN7+McOy/HkSUVKnQ8+
 H9j8/XnYgpKeh7yV0Vi18W2HqW/Cf3OHNg4KukGwv72BqQiUIp3o12O0UA4LAsrmsp+N
 B6a2VpCrJS7Cjg8nSlTx2ku/PBu9HD4E2fW9FUFaF69xsdn1EWuzpoRPzVdFyXwNyApl
 rnX9UjWtDsix+20cZnht2kb4hdE02pYfHjvUmvdEFoRI+qXBiYqQkOxO4u2zvFLSBsr4
 kCpA9aOsG2Y1sO5RqMemtWzfsAPR6hgtYURc7fhhr5dU0v3pGI8xCmdOKQYyzu+8mTW1
 Ma3w==
X-Gm-Message-State: AOAM5306GRWVA2U3S/LBwySdvW2PE6FvtvFqKn6PXeJ9yi6BFJqrIU+a
 OZRL9g5TmTZ8AS+gwUEcj+QNokK60u6ZBb9fndg=
X-Google-Smtp-Source: ABdhPJwroQy6ughjy8PiKU4yTdmuhVU7YqZynGdXpZmjBmkLTP6oZ9ud8GSkzWbReniyPFsB6t6f0MINlX6drA5nvaM=
X-Received: by 2002:adf:fac1:: with SMTP id a1mr10687665wrs.469.1644840428674; 
 Mon, 14 Feb 2022 04:07:08 -0800 (PST)
MIME-Version: 1.0
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
In-Reply-To: <20220213024222.3548-1-akihiko.odaki@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Mon, 14 Feb 2022 16:06:57 +0400
Message-ID: <CAJ+F1C+3NyD+8Z8XGLBDLDGMfXh+MG+SOB_OY=ZXyLRHHNDTfg@mail.gmail.com>
Subject: Re: [PATCH 0/6] ui/dbus: Share one listener for a console
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="00000000000076a41705d7f9415a"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42c
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.785, RCVD_IN_DNSWL_NONE=-0.0001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: QEMU <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--00000000000076a41705d7f9415a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Akihiko

On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> ui/dbus required to have multiple DisplayChangeListeners (possibly with
> OpenGL)
> for a console but that caused several problems:
> - It broke egl-headless, an unusual display which implements OpenGL
> rendering
>   for non-OpenGL displays. The code to support multiple
> DisplayChangeListeners
>   does not consider the case where non-OpenGL displays listens OpenGL
> consoles.
>

Can you provide instructions on what broke? Even better write a test,
please.

"make check-avocado AVOCADO_TESTS=3Dtests/avocado/virtio-gpu.py", which
covers egl-headless usage, works.


> - Multiple OpenGL DisplayChangeListeners of dbus shares one DisplaySurfac=
e
> and
>   modifies its texture field, causing OpenGL texture leak and
> use-after-free.
>

Again, please provide instructions. I have regularly run -display dbus with
multiple clients and qemu compiled with sanitizers. I don't see any leak or
use after free.


> - Introduced extra code to check the compatibility of OpenGL context
> providers
>   and OpenGL texture renderers where those are often inherently tightly
> coupled
>   since they must share the same hardware.
>

So code checks are meant to prevent misusage. They might be too limited or
broken in some ways, but reverting is likely going to introduce other
regressions I was trying to fix.

- Needed extra work to broadcast the same change to multiple dbus listeners=
.
>
>
Compared to what?


> This series solve them by implementing the change broadcast in ui/dbus,
> which
> knows exactly what is needed. Changes for the common code to support
> multiple
> OpenGL DisplayChangeListeners were reverted to fix egl-headless and reduc=
e
> the code size.
>

Thanks a lot for your work, I am going to take a look at your approach. But
please help us understand better what the problem actually is, by giving
examples & tests to avoid future regressions and document the expected
behaviour.


> Akihiko Odaki (6):
>   ui/dbus: Share one listener for a console
>   Revert "console: save current scanout details"
>   Revert "ui: split the GL context in a different object"
>   Revert "ui: dispatch GL events to all listeners"
>   Revert "ui: associate GL context outside of display listener
>     registration"
>   Revert "ui: factor out qemu_console_set_display_gl_ctx()"
>
>  include/ui/console.h       |  60 +-----
>  include/ui/egl-context.h   |   6 +-
>  include/ui/gtk.h           |  11 +-
>  include/ui/sdl2.h          |   7 +-
>  include/ui/spice-display.h |   1 -
>  ui/console.c               | 258 +++++++----------------
>  ui/dbus-console.c          | 109 ++--------
>  ui/dbus-listener.c         | 417 +++++++++++++++++++++++++++----------
>  ui/dbus.c                  |  22 --
>  ui/dbus.h                  |  36 +++-
>  ui/egl-context.c           |   6 +-
>  ui/egl-headless.c          |  20 +-
>  ui/gtk-egl.c               |  10 +-
>  ui/gtk-gl-area.c           |   8 +-
>  ui/gtk.c                   |  25 +--
>  ui/sdl2-gl.c               |  10 +-
>  ui/sdl2.c                  |  14 +-
>  ui/spice-display.c         |  19 +-
>  18 files changed, 498 insertions(+), 541 deletions(-)
>
> --
> 2.32.0 (Apple Git-132)
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--00000000000076a41705d7f9415a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Akihiko<br></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Feb 13, 2022 at 6:4=
4 AM Akihiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.o=
daki@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">ui/dbus required to have multiple DisplayChangeListeners (pos=
sibly with OpenGL)<br>
for a console but that caused several problems:<br>
- It broke egl-headless, an unusual display which implements OpenGL renderi=
ng<br>
=C2=A0 for non-OpenGL displays. The code to support multiple DisplayChangeL=
isteners<br>
=C2=A0 does not consider the case where non-OpenGL displays listens OpenGL =
consoles.<br></blockquote><div><br></div><div>Can you provide instructions =
on what broke? Even better write a test, please.<br></div><div><br></div><d=
iv>&quot;make check-avocado AVOCADO_TESTS=3Dtests/avocado/virtio-gpu.py&quo=
t;, which covers egl-headless usage, works.<br></div><div>=C2=A0</div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
- Multiple OpenGL DisplayChangeListeners of dbus shares one DisplaySurface =
and<br>
=C2=A0 modifies its texture field, causing OpenGL texture leak and use-afte=
r-free.<br></blockquote><div><br></div><div>Again, please provide instructi=
ons. I have regularly run -display dbus with multiple clients and qemu comp=
iled with sanitizers. I don&#39;t see any leak or use after free.<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- Introduced extra code to check the compatibility of OpenGL context provid=
ers<br>
=C2=A0 and OpenGL texture renderers where those are often inherently tightl=
y coupled<br>
=C2=A0 since they must share the same hardware.<br></blockquote><div><br></=
div><div>So code checks are meant to prevent misusage. They might be too li=
mited or broken in some ways, but reverting is likely going to introduce ot=
her regressions I was trying to fix.</div><div><br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
- Needed extra work to broadcast the same change to multiple dbus listeners=
.<br>
<br></blockquote><div><br></div><div>Compared to what?<br></div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
This series solve them by implementing the change broadcast in ui/dbus, whi=
ch<br>
knows exactly what is needed. Changes for the common code to support multip=
le<br>
OpenGL DisplayChangeListeners were reverted to fix egl-headless and reduce<=
br>
the code size.<br></blockquote><div><br></div><div>Thanks a lot for your wo=
rk, I am going to take a look at your approach. But please help us understa=
nd better what the problem actually is, by giving examples &amp; tests to a=
void future regressions and document the expected behaviour.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Akihiko Odaki (6):<br>
=C2=A0 ui/dbus: Share one listener for a console<br>
=C2=A0 Revert &quot;console: save current scanout details&quot;<br>
=C2=A0 Revert &quot;ui: split the GL context in a different object&quot;<br=
>
=C2=A0 Revert &quot;ui: dispatch GL events to all listeners&quot;<br>
=C2=A0 Revert &quot;ui: associate GL context outside of display listener<br=
>
=C2=A0 =C2=A0 registration&quot;<br>
=C2=A0 Revert &quot;ui: factor out qemu_console_set_display_gl_ctx()&quot;<=
br>
<br>
=C2=A0include/ui/console.h=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 60 +-----<br>
=C2=A0include/ui/egl-context.h=C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
=C2=A0include/ui/gtk.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +=
-<br>
=C2=A0include/ui/sdl2.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +=
-<br>
=C2=A0include/ui/spice-display.h |=C2=A0 =C2=A01 -<br>
=C2=A0ui/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| =
258 +++++++----------------<br>
=C2=A0ui/dbus-console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | 109 ++--------<=
br>
=C2=A0ui/dbus-listener.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 417 +++++++++++=
++++++++++++++++----------<br>
=C2=A0ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 22 --<br>
=C2=A0ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 36 +++-<br>
=C2=A0ui/egl-context.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A06 +-<br>
=C2=A0ui/egl-headless.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 20 +-<br>
=C2=A0ui/gtk-egl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
=C2=A0ui/gtk-gl-area.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=
=A08 +-<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0|=C2=A0 25 +--<br>
=C2=A0ui/sdl2-gl.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
=C2=A0 10 +-<br>
=C2=A0ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 14 +-<br>
=C2=A0ui/spice-display.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
=C2=A018 files changed, 498 insertions(+), 541 deletions(-)<br>
<br>
-- <br>
2.32.0 (Apple Git-132)<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--00000000000076a41705d7f9415a--

