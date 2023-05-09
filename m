Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 04D336FC56C
	for <lists+qemu-devel@lfdr.de>; Tue,  9 May 2023 13:53:25 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwLtQ-0006Fl-KF; Tue, 09 May 2023 07:52:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pwLtO-0006FD-EN
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:52:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1pwLtI-0003rL-BG
 for qemu-devel@nongnu.org; Tue, 09 May 2023 07:52:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683633143;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+ejeH6SRXQhsn30WqP/ocLeyczcZWOcfESXn4PldEMI=;
 b=XOi/BPNNp9FxbfAbhWCdKcnoFPz05QikZDYL/RwHUgjm5Yk/DuUhSeLNkvuu6KEms/GIXm
 MM7ifN5/9S+foUT7eqtqAziroNcX9uMcdMN5cFfcwYFKD6Es/J/qkaPw6cWp2a4lB082bL
 CtK4R5pw7di0nvYCHlpfHU7A01MQIV8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-619-3u1aQfJUMVSutJ8tsFt7iQ-1; Tue, 09 May 2023 07:52:22 -0400
X-MC-Unique: 3u1aQfJUMVSutJ8tsFt7iQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-966329c872bso341766766b.1
 for <qemu-devel@nongnu.org>; Tue, 09 May 2023 04:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683633140; x=1686225140;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+ejeH6SRXQhsn30WqP/ocLeyczcZWOcfESXn4PldEMI=;
 b=R6N409FqvbWWDhZT8eZvgCLKndzaHentkcbNTmN9PtjBeiFtbyJPx283HlXc0nCtUW
 AbGvGlBqnxXqgiiolnZztkYDS6LMkw3X1lOhEcWFDP5r7pUWeLRk0Z2Rh8ghDf54eD2j
 BOnHZrfTppdzy1NZ8bD9JuBvxZgLxVA50hctk6hu9n780v2Hyr7blA9jK7JxeSf0AHjr
 y2oRByrUia6ou0Ql0eQeIxrCj6ynqOwN70n3j83EZ+u4PMA2QRrpUVIQVWy4dJHvC94H
 8g3sEmdcEwOAfp3OJdu4PujDPptiVkp3kpvtfJrHUN3k/KvOCVaThBAk9x/O2MR/0GUT
 pPrA==
X-Gm-Message-State: AC+VfDyvmyJze6bzjclTGH+LTFTUOouOXR2sSbsiNhk2NLtvCpjvKJzR
 v0ki7P7Z1IIwklW2rD6kjhJM+rcZioCAMBE4Un1o5RrMes5Xaq9qvV8KufNuSgugU57rHZQJolt
 7D5rfA5VWkkNKaRXkK6LQm5eAgcFdpZ2bSfVyGotyhQ==
X-Received: by 2002:a17:907:6da3:b0:969:9118:a991 with SMTP id
 sb35-20020a1709076da300b009699118a991mr3913225ejc.42.1683633139840; 
 Tue, 09 May 2023 04:52:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4IL7htT9A3rW5NzwolfmA8HI+yk9oz5MWFmnEBndhGtiNGiLw7P1/TBmyc6GnPSAOEYuv0jn2GxnjHdR1Jkmw=
X-Received: by 2002:a17:907:6da3:b0:969:9118:a991 with SMTP id
 sb35-20020a1709076da300b009699118a991mr3913206ejc.42.1683633139498; Tue, 09
 May 2023 04:52:19 -0700 (PDT)
MIME-Version: 1.0
References: <168363109623.17426.18065034431761880917-0@git.sr.ht>
In-Reply-To: <168363109623.17426.18065034431761880917-0@git.sr.ht>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 9 May 2023 15:52:07 +0400
Message-ID: <CAMxuvazVBMmqLeY6A-Tzbid+iOBK8-hfZvj-MR9ArYiifvsNew@mail.gmail.com>
Subject: Re: [PATCH qemu] ui/dbus: Implement damage regions for GL
To: "~bilelmoussaoui" <bil.elmoussaoui@gmail.com>
Cc: qemu-devel@nongnu.org, chergert@redhat.com
Content-Type: multipart/alternative; boundary="0000000000003659e605fb416301"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

--0000000000003659e605fb416301
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Tue, May 9, 2023 at 3:25=E2=80=AFPM ~bilelmoussaoui <bilelmoussaoui@git.=
sr.ht>
wrote:

> From: Christian Hergert <chergert@redhat.com>
>
> Currently, when using `-display dbus,gl=3Don` all updates to the client
> become "full scanout" updates, meaning there is no way for the client to
> limit damage regions to the display server.
>
> Instead of using an "update count", this patch tracks the damage region
> and propagates it to the client.
>
> This was less of an issue when clients were using GtkGLArea for
> rendering,
> as you'd be doing full-surface redraw. To be efficient, the client needs
> both a DMA-BUF and the damage region to be updated.
>
> In the future, when additional methods are allowed on the D-Bus
> interface,
> this should likely be updated to send damage regions as a single RPC to
> avoid additional message processing.
>

Yes, I am not sure what is best. Either we introduce extra interfaces
(org.qemu.Display1.Listener.UpdateWithRegions ?), or we add the method as
part of the existing Listener interface. Either approach will need some
introspection mechanism. It may be worth to avoid the need for parsing the
introspect XML (just like
https://dbus.freedesktop.org/doc/dbus-specification.html#message-bus-proper=
ties-interfaces
did)


>
> Currently, Linux does not propagate damage rectangles when using the
> virtio-gpu drm driver. That means compositors such as Mutter which
> utilize
> drmModePageFlip() will be sending full or near-full surface damages.
>
> https://lists.freedesktop.org/archives/dri-devel/2023-March/395164.html
> contains a patch to fix that too.
>

It's in the tree now:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?=
id=3D01f05940a9a75e11a2be64993c44ad8dd06e6e26

>
> Signed-off-by: Bilal Elmoussaoui <belmouss@redhat.com>
> ---
>  meson.build        |  8 ++++++++
>  ui/dbus-listener.c | 25 +++++++++++++++++++------
>  ui/meson.build     |  2 +-
>  3 files changed, 28 insertions(+), 7 deletions(-)
>
> diff --git a/meson.build b/meson.build
> index 229eb585f7..72678ef78e 100644
> --- a/meson.build
> +++ b/meson.build
> @@ -1761,6 +1761,14 @@ dbus_display =3D get_option('dbus_display') \
>             error_message: '-display dbus is not available on Windows') \
>    .allowed()
>
> +cairo =3D not_found
> +if dbus_display
> +  cairo =3D dependency('cairo',
> +                     kwargs: static_kwargs,
> +                     method: 'pkg-config',
> +                    )
>

cairo is a pretty large for -display dbus. I wouldn't introduce it for such
a small task of tracking rectangular updated regions. Given that the dbus
code is meant to be used locally, I think it's fine if we simply keep and
send a list of damaged rectangles (without any smart code to try to
optimize it - which I assume cairo would do)


> +endif
> +
>  have_virtfs =3D get_option('virtfs') \
>      .require(targetos =3D=3D 'linux' or targetos =3D=3D 'darwin',
>               error_message: 'virtio-9p (virtfs) requires Linux or macOS'=
)
> \
> diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
> index 911acdc529..047be5cb3a 100644
> --- a/ui/dbus-listener.c
> +++ b/ui/dbus-listener.c
> @@ -25,6 +25,7 @@
>  #include "qemu/error-report.h"
>  #include "sysemu/sysemu.h"
>  #include "dbus.h"
> +#include <cairo.h>
>  #include <gio/gunixfdlist.h>
>
>  #ifdef CONFIG_OPENGL
> @@ -43,9 +44,10 @@ struct _DBusDisplayListener {
>
>      QemuDBusDisplay1Listener *proxy;
>
> +    cairo_region_t *gl_damage;
> +
>      DisplayChangeListener dcl;
>      DisplaySurface *ds;
> -    int gl_updates;
>  };
>
>  G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
> @@ -226,10 +228,17 @@ static void dbus_gl_refresh(DisplayChangeListener
> *dcl)
>          return;
>      }
>
> -    if (ddl->gl_updates) {
> -        dbus_call_update_gl(ddl, 0, 0,
> -                            surface_width(ddl->ds),
> surface_height(ddl->ds));
> -        ddl->gl_updates =3D 0;
> +    if (ddl->gl_damage) {
> +        int n_rects =3D cairo_region_num_rectangles(ddl->gl_damage);
> +
> +        for (int i =3D 0; i < n_rects; i++) {
> +            cairo_rectangle_int_t rect;
> +
> +            cairo_region_get_rectangle(ddl->gl_damage, i, &rect);
> +            dbus_call_update_gl(ddl, rect.x, rect.y, rect.width,
> rect.height);
> +        }
> +
> +        g_clear_pointer(&ddl->gl_damage, cairo_region_destroy);
>      }
>  }
>  #endif
> @@ -245,7 +254,11 @@ static void dbus_gl_gfx_update(DisplayChangeListener
> *dcl,
>  {
>      DBusDisplayListener *ddl =3D container_of(dcl, DBusDisplayListener,
> dcl);
>
> -    ddl->gl_updates++;
> +    if (ddl->gl_damage =3D=3D NULL) {
> +        ddl->gl_damage =3D cairo_region_create();
> +    }
> +    cairo_region_union_rectangle(ddl->gl_damage,
> +                                 &(cairo_rectangle_int_t) {x, y, w, h});
>  }
>  #endif
>
> diff --git a/ui/meson.build b/ui/meson.build
> index 330369707d..8b4004ff01 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -85,7 +85,7 @@ if dbus_display
>                                            '--generate-c-code', '@BASENAM=
E@
> '])
>    dbus_display1_lib =3D static_library('dbus-display1', dbus_display1,
> dependencies: gio)
>    dbus_display1_dep =3D declare_dependency(link_with: dbus_display1_lib,
> include_directories: include_directories('.'))
> -  dbus_ss.add(when: [gio, pixman, dbus_display1_dep],
> +  dbus_ss.add(when: [gio, pixman, dbus_display1_dep, cairo],
>                if_true: [files(
>                  'dbus-chardev.c',
>                  'dbus-clipboard.c',
> --
> 2.38.4
>
>

--0000000000003659e605fb416301
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, May 9, 2023 at 3:25=E2=80=
=AFPM ~bilelmoussaoui &lt;<a href=3D"mailto:bilelmoussaoui@git.sr.ht">bilel=
moussaoui@git.sr.ht</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">From: Christian Hergert &lt;<a href=3D"mailto:chergert@r=
edhat.com" target=3D"_blank">chergert@redhat.com</a>&gt;<br>
<br>
Currently, when using `-display dbus,gl=3Don` all updates to the client<br>
become &quot;full scanout&quot; updates, meaning there is no way for the cl=
ient to<br>
limit damage regions to the display server.<br>
<br>
Instead of using an &quot;update count&quot;, this patch tracks the damage =
region<br>
and propagates it to the client.<br>
<br>
This was less of an issue when clients were using GtkGLArea for<br>
rendering,<br>
as you&#39;d be doing full-surface redraw. To be efficient, the client need=
s<br>
both a DMA-BUF and the damage region to be updated.<br>
<br>
In the future, when additional methods are allowed on the D-Bus<br>
interface,<br>
this should likely be updated to send damage regions as a single RPC to<br>
avoid additional message processing.<br></blockquote><div><br></div><div>Ye=
s, I am not sure what is best. Either we introduce extra interfaces (org.qe=
mu.Display1.Listener.UpdateWithRegions ?), or we add the method as part of =
the existing Listener interface. Either approach will need some introspecti=
on mechanism. It may be worth to avoid the need for parsing the introspect =
XML (just like <a href=3D"https://dbus.freedesktop.org/doc/dbus-specificati=
on.html#message-bus-properties-interfaces">https://dbus.freedesktop.org/doc=
/dbus-specification.html#message-bus-properties-interfaces</a> did)</div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Currently, Linux does not propagate damage rectangles when using the<br>
virtio-gpu drm driver. That means compositors such as Mutter which<br>
utilize<br>
drmModePageFlip() will be sending full or near-full surface damages.<br>
<br>
<a href=3D"https://lists.freedesktop.org/archives/dri-devel/2023-March/3951=
64.html" rel=3D"noreferrer" target=3D"_blank">https://lists.freedesktop.org=
/archives/dri-devel/2023-March/395164.html</a><br>
contains a patch to fix that too.<br></blockquote><div><br></div><div>It&#3=
9;s in the tree now:</div><div>=C2=A0<a href=3D"https://git.kernel.org/pub/=
scm/linux/kernel/git/torvalds/linux.git/commit/?id=3D01f05940a9a75e11a2be64=
993c44ad8dd06e6e26">https://git.kernel.org/pub/scm/linux/kernel/git/torvald=
s/linux.git/commit/?id=3D01f05940a9a75e11a2be64993c44ad8dd06e6e26</a></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Signed-off-by: Bilal Elmoussaoui &lt;<a href=3D"mailto:belmouss@redhat.com"=
 target=3D"_blank">belmouss@redhat.com</a>&gt;<br>
---<br>
=C2=A0meson.build=C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 8 ++++++++<br>
=C2=A0ui/dbus-listener.c | 25 +++++++++++++++++++------<br>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A03 files changed, 28 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/meson.build b/meson.build<br>
index 229eb585f7..72678ef78e 100644<br>
--- a/meson.build<br>
+++ b/meson.build<br>
@@ -1761,6 +1761,14 @@ dbus_display =3D get_option(&#39;dbus_display&#39;) =
\<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;-display dbus=
 is not available on Windows&#39;) \<br>
=C2=A0 =C2=A0.allowed()<br>
<br>
+cairo =3D not_found<br>
+if dbus_display<br>
+=C2=A0 cairo =3D dependency(&#39;cairo&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0kwargs: static_kwargs,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0method: &#39;pkg-config&#39;,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 )<br=
>
</blockquote><div><br></div><div>cairo is a pretty large for -display dbus.=
 I wouldn&#39;t introduce it for such a small task of tracking rectangular =
updated regions. Given that the dbus code is meant to be used locally, I th=
ink it&#39;s fine if we simply keep and send a list of damaged rectangles (=
without any smart code to try to optimize it - which I assume cairo would d=
o)<br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">+endif<br>
+<br>
=C2=A0have_virtfs =3D get_option(&#39;virtfs&#39;) \<br>
=C2=A0 =C2=A0 =C2=A0.require(targetos =3D=3D &#39;linux&#39; or targetos =
=3D=3D &#39;darwin&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 error_message: &#39;virtio=
-9p (virtfs) requires Linux or macOS&#39;) \<br>
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c<br>
index 911acdc529..047be5cb3a 100644<br>
--- a/ui/dbus-listener.c<br>
+++ b/ui/dbus-listener.c<br>
@@ -25,6 +25,7 @@<br>
=C2=A0#include &quot;qemu/error-report.h&quot;<br>
=C2=A0#include &quot;sysemu/sysemu.h&quot;<br>
=C2=A0#include &quot;dbus.h&quot;<br>
+#include &lt;cairo.h&gt;<br>
=C2=A0#include &lt;gio/gunixfdlist.h&gt;<br>
<br>
=C2=A0#ifdef CONFIG_OPENGL<br>
@@ -43,9 +44,10 @@ struct _DBusDisplayListener {<br>
<br>
=C2=A0 =C2=A0 =C2=A0QemuDBusDisplay1Listener *proxy;<br>
<br>
+=C2=A0 =C2=A0 cairo_region_t *gl_damage;<br>
+<br>
=C2=A0 =C2=A0 =C2=A0DisplayChangeListener dcl;<br>
=C2=A0 =C2=A0 =C2=A0DisplaySurface *ds;<br>
-=C2=A0 =C2=A0 int gl_updates;<br>
=C2=A0};<br>
<br>
=C2=A0G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJE=
CT)<br>
@@ -226,10 +228,17 @@ static void dbus_gl_refresh(DisplayChangeListener *dc=
l)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0return;<br>
=C2=A0 =C2=A0 =C2=A0}<br>
<br>
-=C2=A0 =C2=A0 if (ddl-&gt;gl_updates) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_call_update_gl(ddl, 0, 0,<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 surface_width(ddl-&gt;ds), surface_height(ddl-&gt;=
ds));<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;gl_updates =3D 0;<br>
+=C2=A0 =C2=A0 if (ddl-&gt;gl_damage) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 int n_rects =3D cairo_region_num_rectangles(dd=
l-&gt;gl_damage);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for (int i =3D 0; i &lt; n_rects; i++) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cairo_rectangle_int_t rect;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 cairo_region_get_rectangle(ddl-&=
gt;gl_damage, i, &amp;rect);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 dbus_call_update_gl(ddl, rect.x,=
 rect.y, rect.width, rect.height);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 g_clear_pointer(&amp;ddl-&gt;gl_damage, cairo_=
region_destroy);<br>
=C2=A0 =C2=A0 =C2=A0}<br>
=C2=A0}<br>
=C2=A0#endif<br>
@@ -245,7 +254,11 @@ static void dbus_gl_gfx_update(DisplayChangeListener *=
dcl,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0DBusDisplayListener *ddl =3D container_of(dcl, DBusDisp=
layListener, dcl);<br>
<br>
-=C2=A0 =C2=A0 ddl-&gt;gl_updates++;<br>
+=C2=A0 =C2=A0 if (ddl-&gt;gl_damage =3D=3D NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 ddl-&gt;gl_damage =3D cairo_region_create();<b=
r>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 cairo_region_union_rectangle(ddl-&gt;gl_damage,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&amp;(cairo_rectangle_int_t) {=
x, y, w, h});<br>
=C2=A0}<br>
=C2=A0#endif<br>
<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index 330369707d..8b4004ff01 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -85,7 +85,7 @@ if dbus_display<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0&#39;--generate-c-code&#39;, &#39;@BASENAME@&#39;])<br>
=C2=A0 =C2=A0dbus_display1_lib =3D static_library(&#39;dbus-display1&#39;, =
dbus_display1, dependencies: gio)<br>
=C2=A0 =C2=A0dbus_display1_dep =3D declare_dependency(link_with: dbus_displ=
ay1_lib, include_directories: include_directories(&#39;.&#39;))<br>
-=C2=A0 dbus_ss.add(when: [gio, pixman, dbus_display1_dep],<br>
+=C2=A0 dbus_ss.add(when: [gio, pixman, dbus_display1_dep, cairo],<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if_true: [files(<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dbus-cha=
rdev.c&#39;,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&#39;dbus-cli=
pboard.c&#39;,<br>
-- <br>
2.38.4<br>
<br>
</blockquote></div></div>

--0000000000003659e605fb416301--


