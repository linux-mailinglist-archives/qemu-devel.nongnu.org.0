Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F26C547BB4A
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:49:40 +0100 (CET)
Received: from localhost ([::1]:42160 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZu0-000398-1o
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:49:40 -0500
Received: from eggs.gnu.org ([209.51.188.92]:33198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzZZ8-0002Mg-Ix; Tue, 21 Dec 2021 02:28:08 -0500
Received: from [2a00:1450:4864:20::32d] (port=55083
 helo=mail-wm1-x32d.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1mzZZ6-0004TU-KC; Tue, 21 Dec 2021 02:28:06 -0500
Received: by mail-wm1-x32d.google.com with SMTP id i12so8427071wmq.4;
 Mon, 20 Dec 2021 23:28:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jF8DkO2cy9W45icSbyEnpTsSHUiuu/71kvV+CqKRQ8k=;
 b=HAm2sEBdFFDghRpTcLC3dO+PNTEvemIhXH6Vt/VYQBihsyZqM1aD92NN9GUdZIep6e
 fygMY8GiMjV6hCIlQwZRat1Q7mrWlKEzVdiYVgMFTv/5mKm88/9Lp3YehnUpGtoPnh4R
 BFuxwHD0xN/glGKnoUC7bdB/ZYdixdcIzjJRJWZSXL3gIGYzY2yfY0CGQgNtanbPrEHk
 aInFhyE4Gv/qKL5eGIZ385VqFYLcwEVg7KlUqve8cv8iXS+39rKH/vReqN6Is2ix+PsX
 VvDBrUWmYBv2tZxSqRpEVBfVdE1Qb4fHvpQ+2+z82D5X1hbxKiY6oYKj9C6dQr1pvKzm
 Si0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jF8DkO2cy9W45icSbyEnpTsSHUiuu/71kvV+CqKRQ8k=;
 b=4dFfk7VIuAJwwJvry14cnpBzoXSczTVupyE+zdZLPJ3mEjDSEv+rorYn5jqKxkC5wc
 vZ5g2+L0SPL++t8G7MPu1szy3A1kZdXQWFo394ih+JuO+ALhzgqLbbs2+0Bm17t/BvQM
 aFgDh27ZJSzrMaJ219KwFC/2mAPmg0nM4KP1wXS5FNZB5nCdTqS7JDMTMYioIIbZruI/
 WdP+Lp+TtT+q57g1Q8avM7zXoY047pfpfroQ9SdwaULLHUFP5DBHYP3pJ25ly0efyqU/
 tn44ED3R8l3BqUUfazpnOA+aUGlKaqAN777t56d3nL9jvojjB3L3LaWSCzyelVcZRwEi
 C3iw==
X-Gm-Message-State: AOAM533J3Vbu0MjBFdE3+kVENrMMIxmQz3nkdvbQmhP99LARcyEt1Jb/
 xBHL6hKzU4kMDXzWRogd8nqL1en7hVxF+SE7SGU=
X-Google-Smtp-Source: ABdhPJyiX6MPcmgy2werCana0nOzHAM8jPFxsHV3q+2JjzxlF880LjXKbsXfXc5eZfqshDVhr/VB2mueFJlrHXBOU58=
X-Received: by 2002:a05:600c:511c:: with SMTP id
 o28mr1471206wms.96.1640071681718; 
 Mon, 20 Dec 2021 23:28:01 -0800 (PST)
MIME-Version: 1.0
References: <20211219023006.124530-1-orzechowski.alexander@gmail.com>
 <20211219023006.124530-2-orzechowski.alexander@gmail.com>
In-Reply-To: <20211219023006.124530-2-orzechowski.alexander@gmail.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Tue, 21 Dec 2021 11:27:49 +0400
Message-ID: <CAJ+F1CJnf0Ksm6PoRoucmjx0D08zsXA4ckascDQvGJY906BiPA@mail.gmail.com>
Subject: Re: [PATCH 1/4] ui: Use allocated size instead of window size
To: Alexander Orzechowski <orzechowski.alexander@gmail.com>
Content-Type: multipart/alternative; boundary="000000000000febe1305d3a2f111"
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32d
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-wm1-x32d.google.com
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
Cc: qemu trival <qemu-trivial@nongnu.org>, QEMU <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000febe1305d3a2f111
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Sun, Dec 19, 2021 at 6:33 AM Alexander Orzechowski <
orzechowski.alexander@gmail.com> wrote:

> In these cases, we only care about the size of the virtual console
> itself. Previously, these calculations were made using the size of
> the entire window, which would include the size of the virtual console
> plus all the ui elements around it.
>
> Signed-off-by: Alexander Orzechowski <orzechowski.alexander@gmail.com>
>

It's not obvious to me that the drawing area doesn't have its own window.

Nonetheless, it is better to use the allocated size.

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  ui/gtk.c | 26 ++++++++++----------------
>  1 file changed, 10 insertions(+), 16 deletions(-)
>
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 428f02f2df..824334ff3d 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -340,8 +340,8 @@ static void gd_update_full_redraw(VirtualConsole *vc)
>  {
>      GtkWidget *area =3D vc->gfx.drawing_area;
>      int ww, wh;
> -    ww =3D gdk_window_get_width(gtk_widget_get_window(area));
> -    wh =3D gdk_window_get_height(gtk_widget_get_window(area));
> +    ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area);
> +    wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area);
>  #if defined(CONFIG_OPENGL)
>      if (vc->gfx.gls && gtk_use_gl_area) {
>          gtk_gl_area_queue_render(GTK_GL_AREA(vc->gfx.drawing_area));
> @@ -387,7 +387,6 @@ static void gd_update(DisplayChangeListener *dcl,
>                        int x, int y, int w, int h)
>  {
>      VirtualConsole *vc =3D container_of(dcl, VirtualConsole, gfx.dcl);
> -    GdkWindow *win;
>      int x1, x2, y1, y2;
>      int mx, my;
>      int fbw, fbh;
> @@ -414,12 +413,8 @@ static void gd_update(DisplayChangeListener *dcl,
>      fbw =3D surface_width(vc->gfx.ds) * vc->gfx.scale_x;
>      fbh =3D surface_height(vc->gfx.ds) * vc->gfx.scale_y;
>
> -    win =3D gtk_widget_get_window(vc->gfx.drawing_area);
> -    if (!win) {
> -        return;
> -    }
> -    ww =3D gdk_window_get_width(win);
> -    wh =3D gdk_window_get_height(win);
> +    ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area);
> +    wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area);
>
>      mx =3D my =3D 0;
>      if (ww > fbw) {
> @@ -788,8 +783,8 @@ static gboolean gd_draw_event(GtkWidget *widget,
> cairo_t *cr, void *opaque)
>      fbw =3D surface_width(vc->gfx.ds);
>      fbh =3D surface_height(vc->gfx.ds);
>
> -    ww =3D gdk_window_get_width(gtk_widget_get_window(widget));
> -    wh =3D gdk_window_get_height(gtk_widget_get_window(widget));
> +    ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area);
> +    wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area);
>
>      if (s->full_screen) {
>          vc->gfx.scale_x =3D (double)ww / fbw;
> @@ -838,7 +833,6 @@ static gboolean gd_motion_event(GtkWidget *widget,
> GdkEventMotion *motion,
>  {
>      VirtualConsole *vc =3D opaque;
>      GtkDisplayState *s =3D vc->s;
> -    GdkWindow *window;
>      int x, y;
>      int mx, my;
>      int fbh, fbw;
> @@ -851,10 +845,10 @@ static gboolean gd_motion_event(GtkWidget *widget,
> GdkEventMotion *motion,
>      fbw =3D surface_width(vc->gfx.ds) * vc->gfx.scale_x;
>      fbh =3D surface_height(vc->gfx.ds) * vc->gfx.scale_y;
>
> -    window =3D gtk_widget_get_window(vc->gfx.drawing_area);
> -    ww =3D gdk_window_get_width(window);
> -    wh =3D gdk_window_get_height(window);
> -    ws =3D gdk_window_get_scale_factor(window);
> +    ww =3D gtk_widget_get_allocated_width(vc->gfx.drawing_area);
> +    wh =3D gtk_widget_get_allocated_height(vc->gfx.drawing_area);
> +    ws =3D gdk_window_get_scale_factor(
> +            gtk_widget_get_window(vc->gfx.drawing_area));
>
>      mx =3D my =3D 0;
>      if (ww > fbw) {
> --
> 2.34.1
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000febe1305d3a2f111
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Dec 19, 2021 at 6:33 AM Ale=
xander Orzechowski &lt;<a href=3D"mailto:orzechowski.alexander@gmail.com">o=
rzechowski.alexander@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">In these cases, we only care about the size o=
f the virtual console<br>
itself. Previously, these calculations were made using the size of<br>
the entire window, which would include the size of the virtual console<br>
plus all the ui elements around it.<br>
<br>
Signed-off-by: Alexander Orzechowski &lt;<a href=3D"mailto:orzechowski.alex=
ander@gmail.com" target=3D"_blank">orzechowski.alexander@gmail.com</a>&gt;<=
br></blockquote><div><br></div><div>It&#39;s not obvious to me that the dra=
wing area doesn&#39;t have its own window.</div><div><br></div><div>Nonethe=
less, it is better to use the allocated size.</div><div><br></div><div>Revi=
ewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@redh=
at.com">marcandre.lureau@redhat.com</a>&gt;</div><div><br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0ui/gtk.c | 26 ++++++++++----------------<br>
=C2=A01 file changed, 10 insertions(+), 16 deletions(-)<br>
<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 428f02f2df..824334ff3d 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -340,8 +340,8 @@ static void gd_update_full_redraw(VirtualConsole *vc)<b=
r>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0GtkWidget *area =3D vc-&gt;gfx.drawing_area;<br>
=C2=A0 =C2=A0 =C2=A0int ww, wh;<br>
-=C2=A0 =C2=A0 ww =3D gdk_window_get_width(gtk_widget_get_window(area));<br=
>
-=C2=A0 =C2=A0 wh =3D gdk_window_get_height(gtk_widget_get_window(area));<b=
r>
+=C2=A0 =C2=A0 ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_are=
a);<br>
+=C2=A0 =C2=A0 wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_ar=
ea);<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
=C2=A0 =C2=A0 =C2=A0if (vc-&gt;gfx.gls &amp;&amp; gtk_use_gl_area) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_gl_area_queue_render(GTK_GL_AREA(vc-&=
gt;gfx.drawing_area));<br>
@@ -387,7 +387,6 @@ static void gd_update(DisplayChangeListener *dcl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0int x, int y, int w, int h)<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VirtualConsole *vc =3D container_of(dcl, VirtualConsole=
, gfx.dcl);<br>
-=C2=A0 =C2=A0 GdkWindow *win;<br>
=C2=A0 =C2=A0 =C2=A0int x1, x2, y1, y2;<br>
=C2=A0 =C2=A0 =C2=A0int mx, my;<br>
=C2=A0 =C2=A0 =C2=A0int fbw, fbh;<br>
@@ -414,12 +413,8 @@ static void gd_update(DisplayChangeListener *dcl,<br>
=C2=A0 =C2=A0 =C2=A0fbw =3D surface_width(vc-&gt;gfx.ds) * vc-&gt;gfx.scale=
_x;<br>
=C2=A0 =C2=A0 =C2=A0fbh =3D surface_height(vc-&gt;gfx.ds) * vc-&gt;gfx.scal=
e_y;<br>
<br>
-=C2=A0 =C2=A0 win =3D gtk_widget_get_window(vc-&gt;gfx.drawing_area);<br>
-=C2=A0 =C2=A0 if (!win) {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
-=C2=A0 =C2=A0 }<br>
-=C2=A0 =C2=A0 ww =3D gdk_window_get_width(win);<br>
-=C2=A0 =C2=A0 wh =3D gdk_window_get_height(win);<br>
+=C2=A0 =C2=A0 ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_are=
a);<br>
+=C2=A0 =C2=A0 wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_ar=
ea);<br>
<br>
=C2=A0 =C2=A0 =C2=A0mx =3D my =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0if (ww &gt; fbw) {<br>
@@ -788,8 +783,8 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_=
t *cr, void *opaque)<br>
=C2=A0 =C2=A0 =C2=A0fbw =3D surface_width(vc-&gt;gfx.ds);<br>
=C2=A0 =C2=A0 =C2=A0fbh =3D surface_height(vc-&gt;gfx.ds);<br>
<br>
-=C2=A0 =C2=A0 ww =3D gdk_window_get_width(gtk_widget_get_window(widget));<=
br>
-=C2=A0 =C2=A0 wh =3D gdk_window_get_height(gtk_widget_get_window(widget));=
<br>
+=C2=A0 =C2=A0 ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_are=
a);<br>
+=C2=A0 =C2=A0 wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_ar=
ea); <br>
<br>
=C2=A0 =C2=A0 =C2=A0if (s-&gt;full_screen) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0vc-&gt;gfx.scale_x =3D (double)ww / fbw;<=
br>
@@ -838,7 +833,6 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkE=
ventMotion *motion,<br>
=C2=A0{<br>
=C2=A0 =C2=A0 =C2=A0VirtualConsole *vc =3D opaque;<br>
=C2=A0 =C2=A0 =C2=A0GtkDisplayState *s =3D vc-&gt;s;<br>
-=C2=A0 =C2=A0 GdkWindow *window;<br>
=C2=A0 =C2=A0 =C2=A0int x, y;<br>
=C2=A0 =C2=A0 =C2=A0int mx, my;<br>
=C2=A0 =C2=A0 =C2=A0int fbh, fbw;<br>
@@ -851,10 +845,10 @@ static gboolean gd_motion_event(GtkWidget *widget, Gd=
kEventMotion *motion,<br>
=C2=A0 =C2=A0 =C2=A0fbw =3D surface_width(vc-&gt;gfx.ds) * vc-&gt;gfx.scale=
_x;<br>
=C2=A0 =C2=A0 =C2=A0fbh =3D surface_height(vc-&gt;gfx.ds) * vc-&gt;gfx.scal=
e_y;<br>
<br>
-=C2=A0 =C2=A0 window =3D gtk_widget_get_window(vc-&gt;gfx.drawing_area);<b=
r>
-=C2=A0 =C2=A0 ww =3D gdk_window_get_width(window);<br>
-=C2=A0 =C2=A0 wh =3D gdk_window_get_height(window);<br>
-=C2=A0 =C2=A0 ws =3D gdk_window_get_scale_factor(window);<br>
+=C2=A0 =C2=A0 ww =3D gtk_widget_get_allocated_width(vc-&gt;gfx.drawing_are=
a);<br>
+=C2=A0 =C2=A0 wh =3D gtk_widget_get_allocated_height(vc-&gt;gfx.drawing_ar=
ea);<br>
+=C2=A0 =C2=A0 ws =3D gdk_window_get_scale_factor(<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_widget_get_window(vc-&gt;gfx=
.drawing_area));<br>
<br>
=C2=A0 =C2=A0 =C2=A0mx =3D my =3D 0;<br>
=C2=A0 =C2=A0 =C2=A0if (ww &gt; fbw) {<br>
-- <br>
2.34.1<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000febe1305d3a2f111--

