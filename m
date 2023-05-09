Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC16C6FC9CD
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 17:05:11 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwOtM-0000ph-Rp; Tue, 09 May 2023 11:04:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belmouss@redhat.com>)
 id 1pwOtK-0000pG-FC
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:04:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <belmouss@redhat.com>)
 id 1pwOtH-00055f-J5
 for qemu-devel@nongnu.org; Tue, 09 May 2023 11:04:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683644674;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=tyvqenqq+p0xj5Int7Diq1bEqMQJr8fM03BnOB9HLoY=;
 b=ZBjIoufUbj/Qo2+KtsXyd5czNzRgLSivT+Cpkrn6TjB9cM/ZOSTBu59HexQiLm95Djal07
 lk5BdtYRnuQU0wxxCHewMSBRnTTl3ezSC9qKh8Rjy+5Thau2XrQHVNdiMkQzEXhpg+DwdU
 1ztTMPFek4QTMahu8MqE1KIMrbfoalI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-52-CoNmRKzmMpW1xbnJh1kPdA-1; Tue, 09 May 2023 11:04:27 -0400
X-MC-Unique: CoNmRKzmMpW1xbnJh1kPdA-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso3620405e9.2
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 08:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683644661; x=1686236661;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tyvqenqq+p0xj5Int7Diq1bEqMQJr8fM03BnOB9HLoY=;
 b=ca45BMcD/zXdJvUPnGhbngisj2FcGBc04XtiUUbMkyoPwGF2d0xoC1jVr2B+wSg6Ki
 2ILbHR6DS5xcqVIwRQzhJHOvkDCiOzSEAIJl2w8AesJEkbpTR7/Lx7v/A6jJtY7XjejK
 unQ0t+YgkJOW1gRnMw6eFfrotC6VtXI7LiTdn1YbqHZ+1DwdlN9mXhTVFJ+XVoHqZY3Y
 f4exfVU/Th4vmsp9vrJgKwGK2qc2N9M+dBF+BeBdbzhzi9zv1P7EYqfCVORNcgYzCvRP
 gDfcKEtlOTpTcsJIYU1AxeDGr61lvJfuD9dwaPJ2u5TlzSDuR0R8g/6uEtZYnHQNUe0b
 vQNg==
X-Gm-Message-State: AC+VfDwVBlqy0N33zYydSiUMHKcx8kl9aOjQM+bZnXYG2oC0XnjynoTf
 Xc1HvxSRmmh0sotc/52F4jc3SZdHRqOHYVLiezxllmy4Sucvvmr/wYtW/npWpSW2QH2KJJXucAu
 dz/8HCJkPc3mubGe3bJ36HS8MHYTdzT4=
X-Received: by 2002:a05:600c:2306:b0:3f4:27d5:a6dc with SMTP id
 6-20020a05600c230600b003f427d5a6dcmr4035293wmo.31.1683644661560; 
 Tue, 09 May 2023 08:04:21 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6oO4bpkswsBhR9Qy7Y9+AWBnGH+T/k3ymmS0QvOgODjQi8OTT8YeJVKEmT0mh99muuHqXpEh0BCPw3oWAZ/VA=
X-Received: by 2002:a05:600c:2306:b0:3f4:27d5:a6dc with SMTP id
 6-20020a05600c230600b003f427d5a6dcmr4035271wmo.31.1683644661293; Tue, 09 May
 2023 08:04:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230509115940.114033-1-belmouss@redhat.com>
 <00958ee1-4c47-20e9-bcd0-ed92179ee831@linaro.org>
In-Reply-To: <00958ee1-4c47-20e9-bcd0-ed92179ee831@linaro.org>
From: Bilal Elmoussaoui <belmouss@redhat.com>
Date: Tue, 9 May 2023 17:04:10 +0200
Message-ID: <CALz9Gza8v5XSx1fgc53ihm6bgP6UvRXJiS6YFd7FoAh2C85K9A@mail.gmail.com>
Subject: Re: [PATCH] ui/dbus: Implement damage regions for GL
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
 chergert@redhat.com, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000f6ff2f05fb4411b8"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=belmouss@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

--000000000000f6ff2f05fb4411b8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

>
> cairo declared as optional dep, ...
>

I don't see where cairo is marked as an optional dependency, the `cairo =3D
not_found` part could probably be dropped to make it clearer.

On Tue, May 9, 2023 at 4:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 <philmd@=
linaro.org>
wrote:

> Hi,
>
> On 9/5/23 13:59, Bilal Elmoussaoui wrote:
> > From: Christian Hergert <chergert@redhat.com>
> >
> > Currently, when using `-display dbus,gl=3Don` all updates to the client
> > become "full scanout" updates, meaning there is no way for the client t=
o
> > limit damage regions to the display server.
> >
> > Instead of using an "update count", this patch tracks the damage region
> > and propagates it to the client.
> >
> > This was less of an issue when clients were using GtkGLArea for
> > rendering,
> > as you'd be doing full-surface redraw. To be efficient, the client need=
s
> > both a DMA-BUF and the damage region to be updated.
> >
> > In the future, when additional methods are allowed on the D-Bus
> > interface,
> > this should likely be updated to send damage regions as a single RPC to
> > avoid additional message processing.
> >
> > Currently, Linux does not propagate damage rectangles when using the
> > virtio-gpu drm driver. That means compositors such as Mutter which
> > utilize
> > drmModePageFlip() will be sending full or near-full surface damages.
> >
> > https://lists.freedesktop.org/archives/dri-devel/2023-March/395164.html
> > contains a patch to fix that too.
> >
> > Signed-off-by: Bilal Elmoussaoui <belmouss@redhat.com>
> > ---
> >   meson.build        |  8 ++++++++
> >   ui/dbus-listener.c | 25 +++++++++++++++++++------
> >   ui/meson.build     |  2 +-
> >   3 files changed, 28 insertions(+), 7 deletions(-)
> >
> > diff --git a/meson.build b/meson.build
> > index 229eb585f7..72678ef78e 100644
> > --- a/meson.build
> > +++ b/meson.build
> > @@ -1761,6 +1761,14 @@ dbus_display =3D get_option('dbus_display') \
> >              error_message: '-display dbus is not available on Windows'=
)
> \
> >     .allowed()
>
> ^ dbus strictly required deps, ...
>
> > +cairo =3D not_found
> > +if dbus_display
> > +  cairo =3D dependency('cairo',
> > +                     kwargs: static_kwargs,
> > +                     method: 'pkg-config',
> > +                    )
>
> cairo declared as optional dep, ...
>
> > +endif
> > +
> >   have_virtfs =3D get_option('virtfs') \
> >       .require(targetos =3D=3D 'linux' or targetos =3D=3D 'darwin',
> >                error_message: 'virtio-9p (virtfs) requires Linux or
> macOS') \
> > diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> > index 911acdc529..047be5cb3a 100644
> > --- a/ui/dbus-listener.c
> > +++ b/ui/dbus-listener.c
> > @@ -25,6 +25,7 @@
> >   #include "qemu/error-report.h"
> >   #include "sysemu/sysemu.h"
> >   #include "dbus.h"
> > +#include <cairo.h>
>
> cairo used unconditionally.
>
> Shouldn't we now declared it as a strict dependency in meson?
>
> >   #include <gio/gunixfdlist.h>
> >
> >   #ifdef CONFIG_OPENGL
>
>

--000000000000f6ff2f05fb4411b8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><span class=3D"gmail-im"></span>
cairo declared as optional dep, ...<span class=3D"gmail-im"><br></span></bl=
ockquote></div><div><br></div><div>I don&#39;t see where cairo is marked as=
 an optional dependency, the `<span class=3D"gmail-im">cairo =3D not_found`=
 part could probably be dropped to make it clearer.<br></span></div><div><b=
r></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Tue, May 9, 2023 at 4:34=E2=80=AFPM Philippe Mathieu-Daud=C3=A9 &lt;<a hre=
f=3D"mailto:philmd@linaro.org">philmd@linaro.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
<br>
On 9/5/23 13:59, Bilal Elmoussaoui wrote:<br>
&gt; From: Christian Hergert &lt;<a href=3D"mailto:chergert@redhat.com" tar=
get=3D"_blank">chergert@redhat.com</a>&gt;<br>
&gt; <br>
&gt; Currently, when using `-display dbus,gl=3Don` all updates to the clien=
t<br>
&gt; become &quot;full scanout&quot; updates, meaning there is no way for t=
he client to<br>
&gt; limit damage regions to the display server.<br>
&gt; <br>
&gt; Instead of using an &quot;update count&quot;, this patch tracks the da=
mage region<br>
&gt; and propagates it to the client.<br>
&gt; <br>
&gt; This was less of an issue when clients were using GtkGLArea for<br>
&gt; rendering,<br>
&gt; as you&#39;d be doing full-surface redraw. To be efficient, the client=
 needs<br>
&gt; both a DMA-BUF and the damage region to be updated.<br>
&gt; <br>
&gt; In the future, when additional methods are allowed on the D-Bus<br>
&gt; interface,<br>
&gt; this should likely be updated to send damage regions as a single RPC t=
o<br>
&gt; avoid additional message processing.<br>
&gt; <br>
&gt; Currently, Linux does not propagate damage rectangles when using the<b=
r>
&gt; virtio-gpu drm driver. That means compositors such as Mutter which<br>
&gt; utilize<br>
&gt; drmModePageFlip() will be sending full or near-full surface damages.<b=
r>
&gt; <br>
&gt; <a href=3D"https://lists.freedesktop.org/archives/dri-devel/2023-March=
/395164.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedeskto=
p.org/archives/dri-devel/2023-March/395164.html</a><br>
&gt; contains a patch to fix that too.<br>
&gt; <br>
&gt; Signed-off-by: Bilal Elmoussaoui &lt;<a href=3D"mailto:belmouss@redhat=
.com" target=3D"_blank">belmouss@redhat.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++++++<=
br>
&gt;=C2=A0 =C2=A0ui/dbus-listener.c | 25 +++++++++++++++++++------<br>
&gt;=C2=A0 =C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
&gt;=C2=A0 =C2=A03 files changed, 28 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meson.build b/meson.build<br>
&gt; index 229eb585f7..72678ef78e 100644<br>
&gt; --- a/meson.build<br>
&gt; +++ b/meson.build<br>
&gt; @@ -1761,6 +1761,14 @@ dbus_display =3D get_option(&#39;dbus_display&#=
39;) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-d=
isplay dbus is not available on Windows&#39;) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0.allowed()<br>
<br>
^ dbus strictly required deps, ...<br>
<br>
&gt; +cairo =3D not_found<br>
&gt; +if dbus_display<br>
&gt; +=C2=A0 cairo =3D dependency(&#39;cairo&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0kwargs: static_kwargs,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0method: &#39;pkg-config&#39;,<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 )<br>
<br>
cairo declared as optional dep, ...<br>
<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 =C2=A0have_virtfs =3D get_option(&#39;virtfs&#39;) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0.require(targetos =3D=3D &#39;linux&#39; or =
targetos =3D=3D &#39;darwin&#39;,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: =
&#39;virtio-9p (virtfs) requires Linux or macOS&#39;) \<br>
&gt; diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c<br>
&gt; index 911acdc529..047be5cb3a 100644<br>
&gt; --- a/ui/dbus-listener.c<br>
&gt; +++ b/ui/dbus-listener.c<br>
&gt; @@ -25,6 +25,7 @@<br>
&gt;=C2=A0 =C2=A0#include &quot;qemu/error-report.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
&gt;=C2=A0 =C2=A0#include &quot;dbus.h&quot;<br>
&gt; +#include &lt;cairo.h&gt;<br>
<br>
cairo used unconditionally.<br>
<br>
Shouldn&#39;t we now declared it as a strict dependency in meson?<br>
<br>
&gt;=C2=A0 =C2=A0#include &lt;gio/gunixfdlist.h&gt;<br>
&gt;=C2=A0 =C2=A0<br>
&gt;=C2=A0 =C2=A0#ifdef CONFIG_OPENGL<br>
<br>
</blockquote></div></div>

--000000000000f6ff2f05fb4411b8--


