Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 430924BA6BE
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Feb 2022 18:08:56 +0100 (CET)
Received: from localhost ([::1]:33924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nKkH1-0004yq-C9
	for lists+qemu-devel@lfdr.de; Thu, 17 Feb 2022 12:08:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nKkG1-0004Bm-1O
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:07:54 -0500
Received: from [2a00:1450:4864:20::32f] (port=35740
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nKkFr-00015t-75
 for qemu-devel@nongnu.org; Thu, 17 Feb 2022 12:07:52 -0500
Received: by mail-wm1-x32f.google.com with SMTP id
 l123-20020a1c2581000000b0037b9d960079so6734757wml.0
 for <qemu-devel@nongnu.org>; Thu, 17 Feb 2022 09:07:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XH+gZYXfDmh2RwFEYbTen/VpV8jVok3q+PvGXo1GJok=;
 b=QAR8YXZ+dk8I/q81KbNO2yF7D/o42gdfd3Rp65K9dkUmg2Blj00s/8zHyvR3/QyTlK
 l5OeubRjA1+wyl63q6abRDjltxyXwyF3N3ysk5thSruogxnQE5ZK0NswiiBxW189lcBC
 lESBzPr+WrhBOuP5KdcD9sokX+SO/ba2fu7iSDESz6xpdsQAtLEfySti5lePznqwTRYM
 7Te5POQXRGamppfXujkKAzVbjKIGsW9R4LeNC/izt/lu0vunqjYtAbOSFFx7BAFjwqmE
 ZCljc2TGMIxHzvIqMQORkPSGoRL0peHdm3ADoAKEBpy07lF2jmXXY1UBGqd4MBDsBCcL
 eveQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XH+gZYXfDmh2RwFEYbTen/VpV8jVok3q+PvGXo1GJok=;
 b=vehYqm8/EJ9jyQ6YipDufF1QeG+AQs8P4iw6IBxTfYYt5jKMIGU1Ow092XVAZYhPkl
 huJIuQ61ehNV0pNa4CbxqX6NjTP1hQMIPmRFmvoohrcF0PdowOOAP15MTOV47sNjzJI5
 0rS+OQaovxvVncV4QpIEhGGJZqgZlme70aMTU59bzITmWxK97g86capdhGg8248qXMwm
 jICeq9rKPNX8te/uidP9kA90CWYSUwoOv2Lop+DH9tqZpBdiPX1qoMnh5qc+k/5F6kuA
 RRRs7a18lOR7GWe0gL+k/Fp4zyZZME4ZxKpdk+9mlUkzDCrmEPXNBArra8HuEKrMoL1k
 L+lw==
X-Gm-Message-State: AOAM5300fQgAMTyFFA+1lk9KOC8WNKpJoCVivShOHRs79AHaDdCI9klN
 S0PNcnsEKomwr5Fha11Pm45M78iPyVGIJPmeRVY=
X-Google-Smtp-Source: ABdhPJwNDb4/fpPt5fm6kkP2Bz+Vcckm/rxXcrwHeVgXCQIyh8nb2vfGQa4gdFJp0Q5Rkvhz+H2+GbmNA1hkDQHxe+Y=
X-Received: by 2002:a05:600c:3546:b0:37d:1bcf:de2c with SMTP id
 i6-20020a05600c354600b0037d1bcfde2cmr3681537wmq.96.1645117650724; Thu, 17 Feb
 2022 09:07:30 -0800 (PST)
MIME-Version: 1.0
References: <20220217115829.2314347-1-marcandre.lureau@redhat.com>
 <CAMVc7JVOJxkqLpvRu7JLNP48C5Kmu0JRYUSR8xP+dAtGp_n=_A@mail.gmail.com>
 <CAJ+F1CKgvcA97kLdxVodSoAFbk1_kB3_po8vn4kX_gPZgKYxbg@mail.gmail.com>
 <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
In-Reply-To: <CAMVc7JU1rfBEHgofiveNopLkyXRLSEG8dA=6cn_qY52BqLB3iw@mail.gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 17 Feb 2022 21:07:18 +0400
Message-ID: <CAJ+F1CJsrfL-PiPM5W4Ydp4WLMfrZOaYydUp4wrX1LbFCxiSaA@mail.gmail.com>
Subject: Re: [PATCH v2 00/12] GL & D-Bus display related fixes
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="0000000000002f6ca905d839cdcd"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001,
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
Cc: qemu Developers <qemu-devel@nongnu.org>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--0000000000002f6ca905d839cdcd
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Feb 17, 2022 at 8:39 PM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

> On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki <akihiko.odaki@gmail.com>
> wrote:
> >>
> >> On Thu, Feb 17, 2022 at 8:58 PM <marcandre.lureau@redhat.com> wrote:
> >> >
> >> > From: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> >> >
> >> > Hi,
> >> >
> >> > In the thread "[PATCH 0/6] ui/dbus: Share one listener for a
> console", Akihiko
> >> > Odaki reported a number of issues with the GL and D-Bus display. His
> series
> >> > propose a different design, and reverting some of my previous generi=
c
> console
> >> > changes to fix those issues.
> >> >
> >> > However, as I work through the issue so far, they can be solved by
> reasonable
> >> > simple fixes while keeping the console changes generic (not specific
> to the
> >> > D-Bus display backend). I belive a shared infrastructure is more
> beneficial long
> >> > term than having GL-specific code in the DBus code (in particular, t=
he
> >> > egl-headless & VNC combination could potentially use it)
> >> >
> >> > Thanks a lot Akihiko for reporting the issues proposing a different
> approach!
> >> > Please test this alternative series and let me know of any further
> issues. My
> >> > understanding is that you are mainly concerned with the Cocoa
> backend, and I
> >> > don't have a way to test it, so please check it. If necessary, we ma=
y
> well have
> >> > to revert my earlier changes and go your way, eventually.
> >> >
> >> > Marc-Andr=C3=A9 Lureau (12):
> >> >   ui/console: fix crash when using gl context with non-gl listeners
> >> >   ui/console: fix texture leak when calling
> surface_gl_create_texture()
> >> >   ui: do not create a surface when resizing a GL scanout
> >> >   ui/console: move check for compatible GL context
> >> >   ui/console: move dcl compatiblity check to a callback
> >> >   ui/console: egl-headless is compatible with non-gl listeners
> >> >   ui/dbus: associate the DBusDisplayConsole listener with the given
> >> >     console
> >> >   ui/console: move console compatibility check to
> dcl_display_console()
> >> >   ui/shader: fix potential leak of shader on error
> >> >   ui/shader: free associated programs
> >> >   ui/console: add a dpy_gfx_switch callback helper
> >> >   ui/dbus: fix texture sharing
> >> >
> >> >  include/ui/console.h |  19 ++++---
> >> >  ui/dbus.h            |   3 ++
> >> >  ui/console-gl.c      |   4 ++
> >> >  ui/console.c         | 119
> ++++++++++++++++++++++++++-----------------
> >> >  ui/dbus-console.c    |  27 +++++-----
> >> >  ui/dbus-listener.c   |  11 ----
> >> >  ui/dbus.c            |  33 +++++++++++-
> >> >  ui/egl-headless.c    |  17 ++++++-
> >> >  ui/gtk.c             |  18 ++++++-
> >> >  ui/sdl2.c            |   9 +++-
> >> >  ui/shader.c          |   9 +++-
> >> >  ui/spice-display.c   |   9 +++-
> >> >  12 files changed, 192 insertions(+), 86 deletions(-)
> >> >
> >> > --
> >> > 2.34.1.428.gdcc0cd074f0c
> >> >
> >> >
> >>
> >> You missed only one thing:
> >> >- that console_select and register_displaychangelistener may not call
> >> > dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
> >> > incompatible with non-OpenGL displays
> >>
> >> displaychangelistener_display_console always has to call
> >> dpy_gfx_switch for non-OpenGL displays, but it still doesn't.
> >
> >
> > Ok, would that be what you have in mind?
> >
> >  --- a/ui/console.c
> > +++ b/ui/console.c
> > @@ -1122,6 +1122,10 @@ static void
> displaychangelistener_display_console(DisplayChangeListener *dcl,
> >      } else if (con->scanout.kind =3D=3D SCANOUT_SURFACE) {
> >          dpy_gfx_create_texture(con, con->surface);
> >          displaychangelistener_gfx_switch(dcl, con->surface);
> > +    } else {
> > +        /* use the fallback surface, egl-headless keeps it updated */
> > +        assert(con->surface);
> > +        displaychangelistener_gfx_switch(dcl, con->surface);
> >      }
>
> It should call displaychangelistener_gfx_switch even when e.g.
> con->scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders the conten=
t
> to the last DisplaySurface it received while con->scanout.kind =3D=3D
> SCANOUT_TEXTURE.
>

I see, egl-headless is really not a "listener".


> >
> > I wish such egl-headless specific code would be there, but we would nee=
d
> more refactoring.
> >
> > I think I would rather have a backend split for GL context, like
> "-object egl-context". egl-headless-specific copy code would be handled b=
y
> common/util code for anything that wants a pixman surface (VNC, screen
> capture, non-GL display etc).
> >
> > This split would allow sharing the context code, and introduce other
> system specific GL initialization, such as WGL etc. Right now, I doubt th=
e
> EGL code works on anything but Linux.
>
> Sharing the context code is unlikely to happen. Usually the toolkit
> (GTK, SDL, or Cocoa in my fork) knows what graphics accelerator should
> be used and how the context should be created for a particular window.
> The context sharing can be achieved only for headless displays, namely
> dbus, egl-headless and spice. Few people would want to use them in
> combination.
>

Ok for toolkits, they usually have their own context. But ideally, qemu
should be "headless". And the GL contexts should be working on other
systems than EGL Linux.

Any of the spice, vnc, dbus display etc may legitimately be fixed to work
with WGL etc. Doing this repeatedly on the various display backends would
be bad design.

Although my idea is that display servers (spice, vnc, rdp, etc) & various
UI (gtk, cocoa, sdl, etc) should be outside of qemu. The display would use
IPC, based on DBus if it fits the job, or something else if necessary.
Obviously, there is still a lot of work to do to improve surface & texture
sharing and portability, but that should be possible...


>
> >
> >>
> >> Anything else should be addressed with this patch series. (And it also
> >> has nice fixes for shader leaks.)
> >
> >
> > thanks
> >
> >>
> >>
> >> cocoa doesn't have OpenGL output and egl-headless, the cause of many
> >> pains addressed here, does not work on macOS so you need little
> >> attention. I have an out-of-tree OpenGL support for cocoa but it is
> >> out-of-tree anyway and I can fix it anytime.
> >
> >
> > Great!
> >
> > btw, I suppose you checked your DBus changes against the WIP
> "qemu-display" project. What was your experience? I don't think many peop=
le
> have tried it yet. Do you think this could be made to work on macOS? at
> least the non-dmabuf support should work, as long as Gtk4 has good macOS
> support. I don't know if dmabuf or similar exist there, any idea?
>
> I tested it on Fedora. I think it would probably work on macOS but
> maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in
> macOS but its situation is bad; it must be delivered via macOS's own
> IPC mechanisms (Mach port and XPC), but they are for server-client
> model and not for P2P. fileport mechanism allows to convert Mach port
> to file descriptor, but it is not documented. (In reality, I think all
> of the major browsers, Chromium, Firefox and Safari use fileport for
> this purpose. Apple should really document it if they use it for their
> app.) It is also possible to share IOSurface with a global number, but
> it can be brute-forced and is insecure.
>
>
Thanks, the Gtk developers might have some clue. They have been working on
improving macOS support, and it can use opengl now (
https://blogs.gnome.org/chergert/2020/12/15/gtk-4-got-a-new-macos-backend-n=
ow-with-opengl/
).


> Regards,
> Akihiko Odaki
>
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--0000000000002f6ca905d839cdcd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Feb 17, 2022 at 8:39 PM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">On Fri, Feb 18, 2022 at 1:12 AM Marc-Andr=C3=A9 Lureau<br>
&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" target=3D"_blank">marcand=
re.lureau@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; Hi<br>
&gt;<br>
&gt; On Thu, Feb 17, 2022 at 5:09 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt; wr=
ote:<br>
&gt;&gt;<br>
&gt;&gt; On Thu, Feb 17, 2022 at 8:58 PM &lt;<a href=3D"mailto:marcandre.lu=
reau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt; wrot=
e:<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; From: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.=
lureau@redhat.com" target=3D"_blank">marcandre.lureau@redhat.com</a>&gt;<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Hi,<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; In the thread &quot;[PATCH 0/6] ui/dbus: Share one listener f=
or a console&quot;, Akihiko<br>
&gt;&gt; &gt; Odaki reported a number of issues with the GL and D-Bus displ=
ay. His series<br>
&gt;&gt; &gt; propose a different design, and reverting some of my previous=
 generic console<br>
&gt;&gt; &gt; changes to fix those issues.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; However, as I work through the issue so far, they can be solv=
ed by reasonable<br>
&gt;&gt; &gt; simple fixes while keeping the console changes generic (not s=
pecific to the<br>
&gt;&gt; &gt; D-Bus display backend). I belive a shared infrastructure is m=
ore beneficial long<br>
&gt;&gt; &gt; term than having GL-specific code in the DBus code (in partic=
ular, the<br>
&gt;&gt; &gt; egl-headless &amp; VNC combination could potentially use it)<=
br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Thanks a lot Akihiko for reporting the issues proposing a dif=
ferent approach!<br>
&gt;&gt; &gt; Please test this alternative series and let me know of any fu=
rther issues. My<br>
&gt;&gt; &gt; understanding is that you are mainly concerned with the Cocoa=
 backend, and I<br>
&gt;&gt; &gt; don&#39;t have a way to test it, so please check it. If neces=
sary, we may well have<br>
&gt;&gt; &gt; to revert my earlier changes and go your way, eventually.<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; Marc-Andr=C3=A9 Lureau (12):<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: fix crash when using gl context with =
non-gl listeners<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: fix texture leak when calling surface=
_gl_create_texture()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui: do not create a surface when resizing a GL sc=
anout<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: move check for compatible GL context<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: move dcl compatiblity check to a call=
back<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: egl-headless is compatible with non-g=
l listeners<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/dbus: associate the DBusDisplayConsole listene=
r with the given<br>
&gt;&gt; &gt;=C2=A0 =C2=A0 =C2=A0console<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: move console compatibility check to d=
cl_display_console()<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/shader: fix potential leak of shader on error<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/shader: free associated programs<br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/console: add a dpy_gfx_switch callback helper<=
br>
&gt;&gt; &gt;=C2=A0 =C2=A0ui/dbus: fix texture sharing<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;=C2=A0 include/ui/console.h |=C2=A0 19 ++++---<br>
&gt;&gt; &gt;=C2=A0 ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A03 ++<br>
&gt;&gt; &gt;=C2=A0 ui/console-gl.c=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 ++<=
br>
&gt;&gt; &gt;=C2=A0 ui/console.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 119 +++=
+++++++++++++++++++++++-----------------<br>
&gt;&gt; &gt;=C2=A0 ui/dbus-console.c=C2=A0 =C2=A0 |=C2=A0 27 +++++-----<br=
>
&gt;&gt; &gt;=C2=A0 ui/dbus-listener.c=C2=A0 =C2=A0|=C2=A0 11 ----<br>
&gt;&gt; &gt;=C2=A0 ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 33 +++++++++++-<br>
&gt;&gt; &gt;=C2=A0 ui/egl-headless.c=C2=A0 =C2=A0 |=C2=A0 17 ++++++-<br>
&gt;&gt; &gt;=C2=A0 ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 18 ++++++-<br>
&gt;&gt; &gt;=C2=A0 ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=
=A0 =C2=A09 +++-<br>
&gt;&gt; &gt;=C2=A0 ui/shader.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =
=C2=A09 +++-<br>
&gt;&gt; &gt;=C2=A0 ui/spice-display.c=C2=A0 =C2=A0|=C2=A0 =C2=A09 +++-<br>
&gt;&gt; &gt;=C2=A0 12 files changed, 192 insertions(+), 86 deletions(-)<br=
>
&gt;&gt; &gt;<br>
&gt;&gt; &gt; --<br>
&gt;&gt; &gt; 2.34.1.428.gdcc0cd074f0c<br>
&gt;&gt; &gt;<br>
&gt;&gt; &gt;<br>
&gt;&gt;<br>
&gt;&gt; You missed only one thing:<br>
&gt;&gt; &gt;- that console_select and register_displaychangelistener may n=
ot call<br>
&gt;&gt; &gt; dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is=
<br>
&gt;&gt; &gt; incompatible with non-OpenGL displays<br>
&gt;&gt;<br>
&gt;&gt; displaychangelistener_display_console always has to call<br>
&gt;&gt; dpy_gfx_switch for non-OpenGL displays, but it still doesn&#39;t.<=
br>
&gt;<br>
&gt;<br>
&gt; Ok, would that be what you have in mind?<br>
&gt;<br>
&gt;=C2=A0 --- a/ui/console.c<br>
&gt; +++ b/ui/console.c<br>
&gt; @@ -1122,6 +1122,10 @@ static void displaychangelistener_display_conso=
le(DisplayChangeListener *dcl,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 } else if (con-&gt;scanout.kind =3D=3D SCANOUT_SUR=
FACE) {<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dpy_gfx_create_texture(con, con-&gt;=
surface);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 displaychangelistener_gfx_switch(dcl=
, con-&gt;surface);<br>
&gt; +=C2=A0 =C2=A0 } else {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* use the fallback surface, egl-headless=
 keeps it updated */<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 assert(con-&gt;surface);<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 displaychangelistener_gfx_switch(dcl, con=
-&gt;surface);<br>
&gt;=C2=A0 =C2=A0 =C2=A0 }<br>
<br>
It should call displaychangelistener_gfx_switch even when e.g.<br>
con-&gt;scanout.kind =3D=3D SCANOUT_TEXTURE. egl-headless renders the conte=
nt<br>
to the last DisplaySurface it received while con-&gt;scanout.kind =3D=3D<br=
>
SCANOUT_TEXTURE.<br></blockquote><div><br></div><div>I see, egl-headless is=
 really not a &quot;listener&quot;.<br></div><div><br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt; I wish such egl-headless specific code would be there, but we would ne=
ed more refactoring.<br>
&gt;<br>
&gt; I think I would rather have a backend split for GL context, like &quot=
;-object egl-context&quot;. egl-headless-specific copy code would be handle=
d by common/util code for anything that wants a pixman surface (VNC, screen=
 capture, non-GL display etc).<br>
&gt;<br>
&gt; This split would allow sharing the context code, and introduce other s=
ystem specific GL initialization, such as WGL etc. Right now, I doubt the E=
GL code works on anything but Linux.<br>
<br>
Sharing the context code is unlikely to happen. Usually the toolkit<br>
(GTK, SDL, or Cocoa in my fork) knows what graphics accelerator should<br>
be used and how the context should be created for a particular window.<br>
The context sharing can be achieved only for headless displays, namely<br>
dbus, egl-headless and spice. Few people would want to use them in<br>
combination.<br></blockquote><div><br></div><div>Ok for toolkits, they usua=
lly have their own context. But ideally, qemu should be &quot;headless&quot=
;. And the GL contexts should be working on other systems than EGL Linux.</=
div><div><br></div><div>Any of the spice, vnc, dbus display etc may legitim=
ately be fixed to work with WGL etc. Doing this repeatedly on the various d=
isplay backends would be bad design.<br></div><div><br></div><div>Although =
my idea is that display servers (spice, vnc, rdp, etc) &amp; various UI (gt=
k, cocoa, sdl, etc) should be outside of qemu. The display would use IPC, b=
ased on DBus if it fits the job, or something else if necessary. Obviously,=
 there is still a lot of work to do to improve surface &amp; texture sharin=
g and portability, but that should be possible...<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt; Anything else should be addressed with this patch series. (And it =
also<br>
&gt;&gt; has nice fixes for shader leaks.)<br>
&gt;<br>
&gt;<br>
&gt; thanks<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; cocoa doesn&#39;t have OpenGL output and egl-headless, the cause o=
f many<br>
&gt;&gt; pains addressed here, does not work on macOS so you need little<br=
>
&gt;&gt; attention. I have an out-of-tree OpenGL support for cocoa but it i=
s<br>
&gt;&gt; out-of-tree anyway and I can fix it anytime.<br>
&gt;<br>
&gt;<br>
&gt; Great!<br>
&gt;<br>
&gt; btw, I suppose you checked your DBus changes against the WIP &quot;qem=
u-display&quot; project. What was your experience? I don&#39;t think many p=
eople have tried it yet. Do you think this could be made to work on macOS? =
at least the non-dmabuf support should work, as long as Gtk4 has good macOS=
 support. I don&#39;t know if dmabuf or similar exist there, any idea?<br>
<br>
I tested it on Fedora. I think it would probably work on macOS but<br>
maybe require some tweaks. IOSurface is a counterpart of DMA-BUF in<br>
macOS but its situation is bad; it must be delivered via macOS&#39;s own<br=
>
IPC mechanisms (Mach port and XPC), but they are for server-client<br>
model and not for P2P. fileport mechanism allows to convert Mach port<br>
to file descriptor, but it is not documented. (In reality, I think all<br>
of the major browsers, Chromium, Firefox and Safari use fileport for<br>
this purpose. Apple should really document it if they use it for their<br>
app.) It is also possible to share IOSurface with a global number, but<br>
it can be brute-forced and is insecure.<br>
<br></blockquote><div><br></div><div>Thanks, the Gtk developers might have =
some clue. They have been working on improving macOS support, and it can us=
e opengl now (<a href=3D"https://blogs.gnome.org/chergert/2020/12/15/gtk-4-=
got-a-new-macos-backend-now-with-opengl/">https://blogs.gnome.org/chergert/=
2020/12/15/gtk-4-got-a-new-macos-backend-now-with-opengl/</a>).</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000002f6ca905d839cdcd--

