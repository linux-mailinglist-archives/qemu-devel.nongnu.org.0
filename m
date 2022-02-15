Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 73E464B6E21
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 14:54:45 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJyI0-0003bz-Au
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 08:54:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58958)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nJxwe-0004Q9-8Z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:32:40 -0500
Received: from [2a00:1450:4864:20::432] (port=40735
 helo=mail-wr1-x432.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1nJxwb-0006Vj-6Z
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 08:32:39 -0500
Received: by mail-wr1-x432.google.com with SMTP id j26so21300856wrb.7
 for <qemu-devel@nongnu.org>; Tue, 15 Feb 2022 05:32:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=5+a5XAms5ez2c2XK1I3K1Q4qUg3sjxoM/uo5TzLOS+c=;
 b=jOmSpcYtO4qdn47s2EJd9mEWmQHFUnH5zOmUDorAM+EdzsQZnZGe5XXiMdtoAsMRgD
 KQ4GEDqVheV5lZZMcZwUVIEDO+4Z+HHiFLa3Lw2TurYUNJ+HFjlXIM+giSNs7gQAiz75
 rrO5LmTHCzQ1v5luq2n7FPnE2xB/g4P4SlE5Qvjgl+SceSW2wnS6FOY3hBF1DYslh+Hd
 5sP/2oQMJqKH3kVBwjElHYkBXittm2oSO9TlfPIIZmP06v7VzblWjiP8/zGyRTEqeuJy
 gIqmie+EeE7PEAOsN0hBQBLQqr5nQjKB33wrCW8cFBsUm67rOXCpALjTfFvubRXPSavC
 kgJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+a5XAms5ez2c2XK1I3K1Q4qUg3sjxoM/uo5TzLOS+c=;
 b=Unoc3Ts9Yad4zzfUvulWYHft2nXhxxVh1tUwOUYOL89ZZQ3Yp/di9I/yDzqYUQF+rx
 xzmDPGUP30N0GsiifzCZuIn6j5DowsIQgGoR/NAhtf06qAQrtlprYr2g6m/bZhQ47YY1
 AxqD8oc21RRlWyjUWp6A+JkxEI7pULb1qLxY3D9h10Yc1wdIq9a3jzf6N0VeVrmPz7rN
 8eWcpDO6i3TJpc2hgDo1fH0UVxjkwRW0Cf/AiGeKVY1syd/e6do1SI/mlbpB5/GZVCVB
 KNjRwe4CC58V2pzr1VxDiA2s5uh5/2dwQTujktVBeJwIqSzetl+eEGutl1jONR30SWgV
 IkuA==
X-Gm-Message-State: AOAM531Wig79JOHT+X8ypvt5W2uiFRToZL6VhGmm7STismaSQfFoc1TX
 brSkU/6ggXUr8IbqdL5pcoVNxlqKwE9R2yi9GL8=
X-Google-Smtp-Source: ABdhPJz97hELJOUlU3JbXhXa1lEuvftLKpijzxZ2/vdO4RwnBPILjQGdtBdHhtUk3t38EfBOP9uEM19ulaXGeVOaQic=
X-Received: by 2002:adf:ce85:: with SMTP id r5mr3418897wrn.343.1644931955108; 
 Tue, 15 Feb 2022 05:32:35 -0800 (PST)
MIME-Version: 1.0
References: <20220213024222.3548-1-akihiko.odaki@gmail.com>
 <CAJ+F1C+3NyD+8Z8XGLBDLDGMfXh+MG+SOB_OY=ZXyLRHHNDTfg@mail.gmail.com>
 <CAMVc7JXcUNNnD75f3VO5Vy+MyUfKQhBkM-xHqrXMDUGoh4ALKA@mail.gmail.com>
 <CAJ+F1CKxwycO56NNFtZV8-anadCEOxYY3vwZ1xx+_v2y-z8XgA@mail.gmail.com>
 <fe618e4c-0817-a86d-58d2-c80a878195b4@gmail.com>
In-Reply-To: <fe618e4c-0817-a86d-58d2-c80a878195b4@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 15 Feb 2022 17:32:22 +0400
Message-ID: <CAJ+F1CKOkTqFBkDF7VTjeE8LX=wFgsrPrmuvnj0L1vMThyWGUQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] ui/dbus: Share one listener for a console
To: Akihiko Odaki <akihiko.odaki@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000dd2e3405d80e909c"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::432
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wr1-x432.google.com
X-Spam_score_int: 6
X-Spam_score: 0.6
X-Spam_bar: /
X-Spam_report: (0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001, FREEMAIL_REPLY=1,
 HTML_MESSAGE=0.001, PDS_HP_HELO_NORDNS=0.904, RCVD_IN_DNSWL_NONE=-0.0001,
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

--000000000000dd2e3405d80e909c
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, Feb 15, 2022 at 7:09 AM Akihiko Odaki <akihiko.odaki@gmail.com>
wrote:

>
>
> On 2022/02/15 4:49, Marc-Andr=C3=A9 Lureau wrote:
> > Hi
> >
> > On Mon, Feb 14, 2022 at 5:15 PM Akihiko Odaki <akihiko.odaki@gmail.com
> > <mailto:akihiko.odaki@gmail.com>> wrote:
> >
> >     On Mon, Feb 14, 2022 at 9:07 PM Marc-Andr=C3=A9 Lureau
> >     <marcandre.lureau@gmail.com <mailto:marcandre.lureau@gmail.com>>
> wrote:
> >      >
> >      > Hi Akihiko
> >      >
> >      > On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki
> >     <akihiko.odaki@gmail.com <mailto:akihiko.odaki@gmail.com>> wrote:
> >      >>
> >      >> ui/dbus required to have multiple DisplayChangeListeners
> >     (possibly with OpenGL)
> >      >> for a console but that caused several problems:
> >      >> - It broke egl-headless, an unusual display which implements
> >     OpenGL rendering
> >      >>   for non-OpenGL displays. The code to support multiple
> >     DisplayChangeListeners
> >      >>   does not consider the case where non-OpenGL displays listens
> >     OpenGL consoles.
> >      >
> >      >
> >      > Can you provide instructions on what broke? Even better write a
> >     test, please.
> >
> >     The following command segfaults. Adding a test would be nice, but i=
t
> >     would need a binary which uses OpenGL.
> >     qemu-system-x86_64 -device virtio-gpu-gl-pci -display egl-headless
> >     -vnc :0 -m 8G -cdrom Fedora-Workstation-Live-x86_64-34-1.2.iso -acc=
el
> >     kvm
> >
> >
> > Thanks!
> >
> > This is clearly a mistake from commit 7cc712e98 ("ui: dispatch GL event=
s
> > to all listener").
> >
> > It should have taken into account that some listeners do not have GL
> > callbacks, and guard the call.
> >
> > We should wrap the missing ops->dpy_gl_call() with a if
> > (ops->dpy_gl_call) ? I'll send a patch for that.
>
>
> The assumption that OpenGL DisplayChangeListener and non-OpenGL
> DisplayChangeListener are exclusive is now broken so we have to examine
>

Before the changes, there was already such a GL & non-GL listener mixed
situation. It's only because the first listener with GL would be registered
in register_displaychangelistener() that it "worked".

if the whole patch series works correct without the assumption. Other
> problem I have found (and forgot to mention) is:
> - that console_select and register_displaychangelistener may not call
> dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is
> incompatible with non-OpenGL displays and
>

Can you translate that to a reproducible test with expected outcome?


> - that the compatibility check breaks if egl-headless is present and a
> non-OpenGL DisplayChangeListener with con field is being added.
>
>
Same, thanks


> By the way, dbus registers a DisplayChangeListener for the size
> detection, apparently it fails to set "con" field, making it an
> accidental user of console_select.
>

I need more details, please.


>
> >
> >      >
> >      > "make check-avocado AVOCADO_TESTS=3Dtests/avocado/virtio-gpu.py"=
,
> >     which covers egl-headless usage, works.
> >      >
> >      >>
> >      >> - Multiple OpenGL DisplayChangeListeners of dbus shares one
> >     DisplaySurface and
> >      >>   modifies its texture field, causing OpenGL texture leak and
> >     use-after-free.
> >      >
> >      >
> >      > Again, please provide instructions. I have regularly run -displa=
y
> >     dbus with multiple clients and qemu compiled with sanitizers. I
> >     don't see any leak or use after free.
> >
> >     I doubt sanitizers can find this because it is an OpenGL texture. Y=
ou
> >     may add a probe around surface_gl_create_texture and
> >     surface_gl_destroy_texture.
> >
> >
> > Indeed, a surface is created on each frame, because we create a 2d
> > surface on each qemu_console_resize(), which is called at each virgl
> > scanout. This is a regression introduced by commit ebced09185 ("console=
:
> > save current scanout details"). I can propose an easy fix, please check
> it.
> >
> > And the root of the leak is actually surface_gl_create_texutre(), it
> > should be idempotent, just like destroy().
>
> That is not enough since it may leave the texture present after
> unregister_displaychangelistener. And calling
> surface_gl_destroy_texture() before unregister_displaychangelistener may
> break the other listeners.
>

The texture is shared, but owned by the console. It is not leaked.

However, given that it is shared, it would be indeed better to refcount the
users to avoid destroying the texture by one listener going away.


> >
> >
> >      >
> >      >>
> >      >> - Introduced extra code to check the compatibility of OpenGL
> >     context providers
> >      >>   and OpenGL texture renderers where those are often inherently
> >     tightly coupled
> >      >>   since they must share the same hardware.
> >      >
> >      >
> >      > So code checks are meant to prevent misusage. They might be too
> >     limited or broken in some ways, but reverting is likely going to
> >     introduce other regressions I was trying to fix.
> >
> >     The misuse will not occur because DisplayChangeListeners will be
> >     merged with OpenGL context providers.
> >
> >
> > Ok, but aren't the checks enough to prevent it already? I have to check
> > the use cases and differences of design, but you might be right that we
> > don't need such a split after all.
>
> Yes, the point is that it requires extra code.
>
> >
> >
> >      >
> >      >> - Needed extra work to broadcast the same change to multiple
> >     dbus listeners.
> >      >>
> >      >
> >      > Compared to what?
> >
> >     Compared to sharing one DisplayChangeListener for multiple dbus
> >     listeners.
> >
> >
> > Well, you just moved the problem to the dbus display, not removed any
> work.
> >
> > What we have currently is more generic, you should be able to add/remov=
e
> > various listeners (in theory, we only really do it for dbus at this
> point).
>
> The each DisplayChangeListeners have to upload the DisplaySurface to the
> graphics accelerator, create a DMA-BUF file descriptor, and make it
> suitable for D-Bus delivery. The duplicate work can be just done once if
> we have only one DisplayChangeListener for one console.
>

And we should avoid duplicating the texture/resources if possible. This is
not specific to DBus, it's the reason why I would rather have the logic in
the console code so we avoid code duplication and we can do further
improvement at the lower-level.


>
> >
> >
> >      >
> >      >>
> >      >> This series solve them by implementing the change broadcast in
> >     ui/dbus, which
> >      >> knows exactly what is needed. Changes for the common code to
> >     support multiple
> >      >> OpenGL DisplayChangeListeners were reverted to fix egl-headless
> >     and reduce
> >      >> the code size.
> >      >
> >      >
> >      > Thanks a lot for your work, I am going to take a look at your
> >     approach. But please help us understand better what the problem
> >     actually is, by giving examples & tests to avoid future regressions
> >     and document the expected behaviour.
> >
> >     The thing is really complicated and I may miss details so please fe=
el
> >     free to ask questions or provide suggestions.
> >
> >
> > Reverting changes and proposing an alternative implementation requires
> > detailed explanation and convincing arguments. It may take a while, but
> > we will try to get through the problems and evaluate the alternative
> > designs. Thanks again for your help!
>
> Rather, I think proposing a large change to common console code requires
> thorough examination and it should be reverted before it reaches the
> release if it is doubtful that it is correct and reduces the complexity
> of a few displays (possibly in the future). "No regression" should come
> first before fix and feature. We can always revisit the change land it
> in a proper form even after reverting the change.
>
>
That's not how we usually work, there was a long RFC&PATCH review period
during which testing was done. It's true that Gerd, the maintainer, didn't
do a thorough review though. If we have to revert, we can do it before the
release. However, I would rather fix the current design since it is meant
to be more generic & flexible. We still have some time.

Thanks again for your help

Regards,
> Akihiko Odaki
>
> >
> >     Regards,
> >     Akihiko Odaki
> >
> >
> >      >
> >      >>
> >      >> Akihiko Odaki (6):
> >      >>   ui/dbus: Share one listener for a console
> >      >>   Revert "console: save current scanout details"
> >      >>   Revert "ui: split the GL context in a different object"
> >      >>   Revert "ui: dispatch GL events to all listeners"
> >      >>   Revert "ui: associate GL context outside of display listener
> >      >>     registration"
> >      >>   Revert "ui: factor out qemu_console_set_display_gl_ctx()"
> >      >>
> >      >>  include/ui/console.h       |  60 +-----
> >      >>  include/ui/egl-context.h   |   6 +-
> >      >>  include/ui/gtk.h           |  11 +-
> >      >>  include/ui/sdl2.h          |   7 +-
> >      >>  include/ui/spice-display.h |   1 -
> >      >>  ui/console.c               | 258 +++++++----------------
> >      >>  ui/dbus-console.c          | 109 ++--------
> >      >>  ui/dbus-listener.c         | 417
> >     +++++++++++++++++++++++++++----------
> >      >>  ui/dbus.c                  |  22 --
> >      >>  ui/dbus.h                  |  36 +++-
> >      >>  ui/egl-context.c           |   6 +-
> >      >>  ui/egl-headless.c          |  20 +-
> >      >>  ui/gtk-egl.c               |  10 +-
> >      >>  ui/gtk-gl-area.c           |   8 +-
> >      >>  ui/gtk.c                   |  25 +--
> >      >>  ui/sdl2-gl.c               |  10 +-
> >      >>  ui/sdl2.c                  |  14 +-
> >      >>  ui/spice-display.c         |  19 +-
> >      >>  18 files changed, 498 insertions(+), 541 deletions(-)
> >      >>
> >      >> --
> >      >> 2.32.0 (Apple Git-132)
> >      >>
> >      >>
> >      >
> >      >
> >      > --
> >      > Marc-Andr=C3=A9 Lureau
> >
> >
> >
> > --
> > Marc-Andr=C3=A9 Lureau
>


--=20
Marc-Andr=C3=A9 Lureau

--000000000000dd2e3405d80e909c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Feb 15, 2022 at 7:09 AM Aki=
hiko Odaki &lt;<a href=3D"mailto:akihiko.odaki@gmail.com">akihiko.odaki@gma=
il.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex"><br>
<br>
On 2022/02/15 4:49, Marc-Andr=C3=A9 Lureau wrote:<br>
&gt; Hi<br>
&gt; <br>
&gt; On Mon, Feb 14, 2022 at 5:15 PM Akihiko Odaki &lt;<a href=3D"mailto:ak=
ihiko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:akihiko.odaki@gmail.com" target=3D"_blank=
">akihiko.odaki@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Feb 14, 2022 at 9:07 PM Marc-Andr=C3=A9 Lur=
eau<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:marcandre.lureau@gmail.com" t=
arget=3D"_blank">marcandre.lureau@gmail.com</a> &lt;mailto:<a href=3D"mailt=
o:marcandre.lureau@gmail.com" target=3D"_blank">marcandre.lureau@gmail.com<=
/a>&gt;&gt; wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Hi Akihiko<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; On Sun, Feb 13, 2022 at 6:44 AM Akihiko Odaki=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:akihiko.odaki@gmail.com" targ=
et=3D"_blank">akihiko.odaki@gmail.com</a> &lt;mailto:<a href=3D"mailto:akih=
iko.odaki@gmail.com" target=3D"_blank">akihiko.odaki@gmail.com</a>&gt;&gt; =
wrote:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; ui/dbus required to have multiple Display=
ChangeListeners<br>
&gt;=C2=A0 =C2=A0 =C2=A0(possibly with OpenGL)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; for a console but that caused several pro=
blems:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; - It broke egl-headless, an unusual displ=
ay which implements<br>
&gt;=C2=A0 =C2=A0 =C2=A0OpenGL rendering<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0for non-OpenGL displays. The =
code to support multiple<br>
&gt;=C2=A0 =C2=A0 =C2=A0DisplayChangeListeners<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0does not consider the case wh=
ere non-OpenGL displays listens<br>
&gt;=C2=A0 =C2=A0 =C2=A0OpenGL consoles.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Can you provide instructions on what broke? E=
ven better write a<br>
&gt;=C2=A0 =C2=A0 =C2=A0test, please.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The following command segfaults. Adding a test woul=
d be nice, but it<br>
&gt;=C2=A0 =C2=A0 =C2=A0would need a binary which uses OpenGL.<br>
&gt;=C2=A0 =C2=A0 =C2=A0qemu-system-x86_64 -device virtio-gpu-gl-pci -displ=
ay egl-headless<br>
&gt;=C2=A0 =C2=A0 =C2=A0-vnc :0 -m 8G -cdrom Fedora-Workstation-Live-x86_64=
-34-1.2.iso -accel<br>
&gt;=C2=A0 =C2=A0 =C2=A0kvm<br>
&gt; <br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; This is clearly a mistake from commit 7cc712e98 (&quot;ui: dispatch GL=
 events <br>
&gt; to all listener&quot;).<br>
&gt; <br>
&gt; It should have taken into account that some listeners do not have GL <=
br>
&gt; callbacks, and guard the call.<br>
&gt; <br>
&gt; We should wrap the missing ops-&gt;dpy_gl_call() with a if <br>
&gt; (ops-&gt;dpy_gl_call) ? I&#39;ll send a patch for that.<br>
<br>
<br>
The assumption that OpenGL DisplayChangeListener and non-OpenGL <br>
DisplayChangeListener are exclusive is now broken so we have to examine <br=
></blockquote><div><br></div><div>Before the changes, there was already suc=
h a GL &amp; non-GL listener mixed situation. It&#39;s only because the fir=
st listener with GL would be registered in register_displaychangelistener()=
 that it &quot;worked&quot;.</div><div><br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
if the whole patch series works correct without the assumption. Other <br>
problem I have found (and forgot to mention) is:<br>
- that console_select and register_displaychangelistener may not call <br>
dpy_gfx_switch and call dpy_gl_scanout_texture instead. It is <br>
incompatible with non-OpenGL displays and<br></blockquote><div><br></div><d=
iv>Can you translate that to a reproducible test with expected outcome?<br>=
</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
- that the compatibility check breaks if egl-headless is present and a <br>
non-OpenGL DisplayChangeListener with con field is being added.<br>
<br></blockquote><div><br></div><div>Same, thanks<br></div><div>=C2=A0</div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
By the way, dbus registers a DisplayChangeListener for the size <br>
detection, apparently it fails to set &quot;con&quot; field, making it an <=
br>
accidental user of console_select.<br></blockquote><div><br></div><div>I ne=
ed more details, please.</div><div>=C2=A0<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &quot;make check-avocado AVOCADO_TESTS=3Dtest=
s/avocado/virtio-gpu.py&quot;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0which covers egl-headless usage, works.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; - Multiple OpenGL DisplayChangeListeners =
of dbus shares one<br>
&gt;=C2=A0 =C2=A0 =C2=A0DisplaySurface and<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0modifies its texture field, c=
ausing OpenGL texture leak and<br>
&gt;=C2=A0 =C2=A0 =C2=A0use-after-free.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Again, please provide instructions. I have re=
gularly run -display<br>
&gt;=C2=A0 =C2=A0 =C2=A0dbus with multiple clients and qemu compiled with s=
anitizers. I<br>
&gt;=C2=A0 =C2=A0 =C2=A0don&#39;t see any leak or use after free.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0I doubt sanitizers can find this because it is an O=
penGL texture. You<br>
&gt;=C2=A0 =C2=A0 =C2=A0may add a probe around surface_gl_create_texture an=
d<br>
&gt;=C2=A0 =C2=A0 =C2=A0surface_gl_destroy_texture.<br>
&gt; <br>
&gt; <br>
&gt; Indeed, a surface is created on each frame, because we create a 2d <br=
>
&gt; surface on each qemu_console_resize(), which is called at each virgl <=
br>
&gt; scanout. This is a regression introduced by commit ebced09185 (&quot;c=
onsole: <br>
&gt; save current scanout details&quot;). I can propose an easy fix, please=
 check it.<br>
&gt; <br>
&gt; And the root of the leak is actually surface_gl_create_texutre(), it <=
br>
&gt; should be idempotent, just like destroy().<br>
<br>
That is not enough since it may leave the texture present after <br>
unregister_displaychangelistener. And calling <br>
surface_gl_destroy_texture() before unregister_displaychangelistener may <b=
r>
break the other listeners.<br></blockquote><div><br></div><div>The texture =
is shared, but owned by the console. It is not leaked.</div><div><br></div>=
<div>However, given that it is shared, it would be indeed better to refcoun=
t the users to avoid destroying the texture by one listener going away.<br>=
</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; - Introduced extra code to check the comp=
atibility of OpenGL<br>
&gt;=C2=A0 =C2=A0 =C2=A0context providers<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0and OpenGL texture renderers =
where those are often inherently<br>
&gt;=C2=A0 =C2=A0 =C2=A0tightly coupled<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0since they must share the sam=
e hardware.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; So code checks are meant to prevent misusage.=
 They might be too<br>
&gt;=C2=A0 =C2=A0 =C2=A0limited or broken in some ways, but reverting is li=
kely going to<br>
&gt;=C2=A0 =C2=A0 =C2=A0introduce other regressions I was trying to fix.<br=
>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The misuse will not occur because DisplayChangeList=
eners will be<br>
&gt;=C2=A0 =C2=A0 =C2=A0merged with OpenGL context providers.<br>
&gt; <br>
&gt; <br>
&gt; Ok, but aren&#39;t the checks enough to prevent it already? I have to =
check <br>
&gt; the use cases and differences of design, but you might be right that w=
e <br>
&gt; don&#39;t need such a split after all.<br>
<br>
Yes, the point is that it requires extra code.<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; - Needed extra work to broadcast the same=
 change to multiple<br>
&gt;=C2=A0 =C2=A0 =C2=A0dbus listeners.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Compared to what?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Compared to sharing one DisplayChangeListener for m=
ultiple dbus<br>
&gt;=C2=A0 =C2=A0 =C2=A0listeners.<br>
&gt; <br>
&gt; <br>
&gt; Well, you just moved the problem to the dbus display, not removed any =
work.<br>
&gt; <br>
&gt; What we have currently is more generic, you should be able to add/remo=
ve <br>
&gt; various listeners (in theory, we only really do it for dbus at this po=
int).<br>
<br>
The each DisplayChangeListeners have to upload the DisplaySurface to the <b=
r>
graphics accelerator, create a DMA-BUF file descriptor, and make it <br>
suitable for D-Bus delivery. The duplicate work can be just done once if <b=
r>
we have only one DisplayChangeListener for one console.<br></blockquote><di=
v><br></div><div>And we should avoid duplicating the texture/resources if p=
ossible. This is not specific to DBus, it&#39;s the reason why I would rath=
er have the logic in the console code so we avoid code duplication and we c=
an do further improvement at the lower-level.<br></div><div>=C2=A0<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; This series solve them by implementing th=
e change broadcast in<br>
&gt;=C2=A0 =C2=A0 =C2=A0ui/dbus, which<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; knows exactly what is needed. Changes for=
 the common code to<br>
&gt;=C2=A0 =C2=A0 =C2=A0support multiple<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; OpenGL DisplayChangeListeners were revert=
ed to fix egl-headless<br>
&gt;=C2=A0 =C2=A0 =C2=A0and reduce<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; the code size.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Thanks a lot for your work, I am going to tak=
e a look at your<br>
&gt;=C2=A0 =C2=A0 =C2=A0approach. But please help us understand better what=
 the problem<br>
&gt;=C2=A0 =C2=A0 =C2=A0actually is, by giving examples &amp; tests to avoi=
d future regressions<br>
&gt;=C2=A0 =C2=A0 =C2=A0and document the expected behaviour.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0The thing is really complicated and I may miss deta=
ils so please feel<br>
&gt;=C2=A0 =C2=A0 =C2=A0free to ask questions or provide suggestions.<br>
&gt; <br>
&gt; <br>
&gt; Reverting changes and proposing an alternative implementation requires=
 <br>
&gt; detailed explanation and convincing arguments. It may take a while, bu=
t <br>
&gt; we will try to get through the problems and evaluate the alternative <=
br>
&gt; designs. Thanks again for your help!<br>
<br>
Rather, I think proposing a large change to common console code requires <b=
r>
thorough examination and it should be reverted before it reaches the <br>
release if it is doubtful that it is correct and reduces the complexity <br=
>
of a few displays (possibly in the future). &quot;No regression&quot; shoul=
d come <br>
first before fix and feature. We can always revisit the change land it <br>
in a proper form even after reverting the change.<br>
<br></blockquote><div><br></div><div>That&#39;s not how we usually work, th=
ere was a long RFC&amp;PATCH review period during which testing was done. I=
t&#39;s true that Gerd, the maintainer, didn&#39;t do a thorough review tho=
ugh. If we have to revert, we can do it before the release. However, I woul=
d rather fix the current design since it is meant to be more generic &amp; =
flexible. We still have some time.</div><div><br></div><div>Thanks again fo=
r your help<br></div><div><br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
Regards,<br>
Akihiko Odaki<br>
<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0 =C2=A0Akihiko Odaki<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; Akihiko Odaki (6):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0ui/dbus: Share one listener f=
or a console<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Revert &quot;console: save cu=
rrent scanout details&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: split the GL=
 context in a different object&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: dispatch GL =
events to all listeners&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: associate GL=
 context outside of display listener<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0 =C2=A0registration&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 =C2=A0Revert &quot;ui: factor out q=
emu_console_set_display_gl_ctx()&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 include/ui/console.h=C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 60 +-----<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 include/ui/egl-context.h=C2=A0 =C2=
=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 include/ui/gtk.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 include/ui/sdl2.h=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A07 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 include/ui/spice-display.h |=C2=A0 =
=C2=A01 -<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/console.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 258 +++++++----------------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/dbus-console.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 | 109 ++--------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/dbus-listener.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 417<br>
&gt;=C2=A0 =C2=A0 =C2=A0+++++++++++++++++++++++++++----------<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/dbus.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 22 --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/dbus.h=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 36 +++-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/egl-context.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A06 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/egl-headless.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 |=C2=A0 20 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/gtk-egl.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/gtk-gl-area.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A08 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 25 +--<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/sdl2-gl.c=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 10 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/sdl2.c=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 14 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 ui/spice-display.c=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0|=C2=A0 19 +-<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;=C2=A0 18 files changed, 498 insertions(+)=
, 541 deletions(-)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt; 2.32.0 (Apple Git-132)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;&gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; --<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Marc-Andr=C3=A9 Lureau<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; Marc-Andr=C3=A9 Lureau<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000dd2e3405d80e909c--

