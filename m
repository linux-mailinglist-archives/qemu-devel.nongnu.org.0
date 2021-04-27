Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5172B36C1DA
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Apr 2021 11:37:58 +0200 (CEST)
Received: from localhost ([::1]:57798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lbKAH-0000QK-6y
	for lists+qemu-devel@lfdr.de; Tue, 27 Apr 2021 05:37:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53788)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbK7V-0007fN-QM
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:35:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23479)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1lbK7R-0007jI-Pv
 for qemu-devel@nongnu.org; Tue, 27 Apr 2021 05:35:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619516101;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=86c2gRSgteVDFwGLyBjFJFEp6J/EPLoAoBbCmYO4//A=;
 b=Swx4CK9o7ViM82dt1ydlxae9FbsTmFhDoy06/0uNF4uCdpM/MsvrbfCndfB2+woh8KCN1y
 Oc4sv5b1OCuFG2GrHDfLzJIKQncsBO6ECV5K+w95f+tmet6EVgngu20hQK9IdBA4FnZMdF
 723hkNi7USvl3eczV2VIzgPkNi3gAlA=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-RC6b7UbFM6a0gqCzjYbXfA-1; Tue, 27 Apr 2021 05:34:58 -0400
X-MC-Unique: RC6b7UbFM6a0gqCzjYbXfA-1
Received: by mail-pl1-f199.google.com with SMTP id
 z2-20020a1709030182b02900eca55a002dso12682514plg.0
 for <qemu-devel@nongnu.org>; Tue, 27 Apr 2021 02:34:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=86c2gRSgteVDFwGLyBjFJFEp6J/EPLoAoBbCmYO4//A=;
 b=M3NKMOFT1l2X+hx2X4Gaoi4U55BkvQL15E8eJUayRQ3hJmOucEL6pr7sQfqraZEEB4
 UtToA7I3D9/9kGyXCW393CPf+VxWV9QaKwz9oMPDxlkQjzSzF7tz4L2PqUatuTTx84i7
 APlweEpPobhFa1aKdSlJ1Ue5kQPr6dTjb3fIYWpeuaP31jtdPrn8heKhL+RcTP4B9oGx
 F6TjKSv/SKkrFG0KesRmLmzLFXLm1ugjQMwFDKO2kAm2XG+i2twUrNEJiE9XJL1wM6Z0
 75TqfwqMYbfMDFT7N8Y4DJR1yTRupEQWIRJVKIPKBdR1TuCm/60JBLZxQtFHoRjDn9ry
 8zLg==
X-Gm-Message-State: AOAM533oaKWJllLH0xzMEHfaeNCCBvjfNq4OFxxgiZjuxw0tQNEsKDmI
 Nv2nm3XQCqFl7uYtBaXbwkycYbfeq7rtLIxDqzIvFUpBJnxoMU6YcEI978CO+viofIINeXhOF8S
 jsJ2oNmwbVPNI8Wac6ieoRx5jOXhnk98=
X-Received: by 2002:aa7:9af7:0:b029:264:b19e:ac9c with SMTP id
 y23-20020aa79af70000b0290264b19eac9cmr21998054pfp.59.1619516097418; 
 Tue, 27 Apr 2021 02:34:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwTk5OzIgCQVaURbVXYqsmb2BJMQQtKrU1erG8Mety62BiPQ64YmxGOPukXV1TQ9tJXcHd+bEXK6cDdIkjBMUI=
X-Received: by 2002:aa7:9af7:0:b029:264:b19e:ac9c with SMTP id
 y23-20020aa79af70000b0290264b19eac9cmr21998038pfp.59.1619516097153; Tue, 27
 Apr 2021 02:34:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210423083351.2096734-1-kraxel@redhat.com>
 <20210423083351.2096734-9-kraxel@redhat.com>
In-Reply-To: <20210423083351.2096734-9-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Tue, 27 Apr 2021 13:34:46 +0400
Message-ID: <CAMxuvayXsKn6gAwndRcTprovFoDWDpDJWA5rwFoqFCO8QwUqmw@mail.gmail.com>
Subject: Re: [PATCH v4 8/9] ui/gtk: move struct GtkDisplayState to ui/gtk.h
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="000000000000add6ae05c0f0f984"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.219,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-devel <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000add6ae05c0f0f984
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 23, 2021 at 12:34 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> Want place gtk clipboard code in a separate C file, which in turn
> requires GtkDisplayState being in a header file.  So move it.  No
> functional change.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/ui/gtk.h | 57 ++++++++++++++++++++++++++++++++++++++++++++++++
>  ui/gtk.c         | 55 ----------------------------------------------
>  2 files changed, 57 insertions(+), 55 deletions(-)
>
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index 5ae0ad60a600..6e751794043f 100644
> --- a/include/ui/gtk.h
> +++ b/include/ui/gtk.h
> @@ -18,12 +18,15 @@
>  #include <gdk/gdkwayland.h>
>  #endif
>
> +#include "ui/console.h"
>  #include "ui/kbd-state.h"
>  #if defined(CONFIG_OPENGL)
>  #include "ui/egl-helpers.h"
>  #include "ui/egl-context.h"
>  #endif
>
> +#define MAX_VCS 10
> +
>  typedef struct GtkDisplayState GtkDisplayState;
>
>  typedef struct VirtualGfxConsole {
> @@ -83,6 +86,60 @@ typedef struct VirtualConsole {
>      };
>  } VirtualConsole;
>
> +struct GtkDisplayState {
> +    GtkWidget *window;
> +
> +    GtkWidget *menu_bar;
> +
> +    GtkAccelGroup *accel_group;
> +
> +    GtkWidget *machine_menu_item;
> +    GtkWidget *machine_menu;
> +    GtkWidget *pause_item;
> +    GtkWidget *reset_item;
> +    GtkWidget *powerdown_item;
> +    GtkWidget *quit_item;
> +
> +    GtkWidget *view_menu_item;
> +    GtkWidget *view_menu;
> +    GtkWidget *full_screen_item;
> +    GtkWidget *copy_item;
> +    GtkWidget *zoom_in_item;
> +    GtkWidget *zoom_out_item;
> +    GtkWidget *zoom_fixed_item;
> +    GtkWidget *zoom_fit_item;
> +    GtkWidget *grab_item;
> +    GtkWidget *grab_on_hover_item;
> +
> +    int nb_vcs;
> +    VirtualConsole vc[MAX_VCS];
> +
> +    GtkWidget *show_tabs_item;
> +    GtkWidget *untabify_item;
> +    GtkWidget *show_menubar_item;
> +
> +    GtkWidget *vbox;
> +    GtkWidget *notebook;
> +    int button_mask;
> +    gboolean last_set;
> +    int last_x;
> +    int last_y;
> +    int grab_x_root;
> +    int grab_y_root;
> +    VirtualConsole *kbd_owner;
> +    VirtualConsole *ptr_owner;
> +
> +    gboolean full_screen;
> +
> +    GdkCursor *null_cursor;
> +    Notifier mouse_mode_notifier;
> +    gboolean free_scale;
> +
> +    bool external_pause_update;
> +
> +    DisplayOptions *opts;
> +};
> +
>  extern bool gtk_use_gl_area;
>
>  /* ui/gtk.c */
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 1ea12535284a..7da288a25156 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -60,7 +60,6 @@
>  #include "chardev/char.h"
>  #include "qom/object.h"
>
> -#define MAX_VCS 10
>  #define VC_WINDOW_X_MIN  320
>  #define VC_WINDOW_Y_MIN  240
>  #define VC_TERM_X_MIN     80
> @@ -119,60 +118,6 @@
>  static const guint16 *keycode_map;
>  static size_t keycode_maplen;
>
> -struct GtkDisplayState {
> -    GtkWidget *window;
> -
> -    GtkWidget *menu_bar;
> -
> -    GtkAccelGroup *accel_group;
> -
> -    GtkWidget *machine_menu_item;
> -    GtkWidget *machine_menu;
> -    GtkWidget *pause_item;
> -    GtkWidget *reset_item;
> -    GtkWidget *powerdown_item;
> -    GtkWidget *quit_item;
> -
> -    GtkWidget *view_menu_item;
> -    GtkWidget *view_menu;
> -    GtkWidget *full_screen_item;
> -    GtkWidget *copy_item;
> -    GtkWidget *zoom_in_item;
> -    GtkWidget *zoom_out_item;
> -    GtkWidget *zoom_fixed_item;
> -    GtkWidget *zoom_fit_item;
> -    GtkWidget *grab_item;
> -    GtkWidget *grab_on_hover_item;
> -
> -    int nb_vcs;
> -    VirtualConsole vc[MAX_VCS];
> -
> -    GtkWidget *show_tabs_item;
> -    GtkWidget *untabify_item;
> -    GtkWidget *show_menubar_item;
> -
> -    GtkWidget *vbox;
> -    GtkWidget *notebook;
> -    int button_mask;
> -    gboolean last_set;
> -    int last_x;
> -    int last_y;
> -    int grab_x_root;
> -    int grab_y_root;
> -    VirtualConsole *kbd_owner;
> -    VirtualConsole *ptr_owner;
> -
> -    gboolean full_screen;
> -
> -    GdkCursor *null_cursor;
> -    Notifier mouse_mode_notifier;
> -    gboolean free_scale;
> -
> -    bool external_pause_update;
> -
> -    DisplayOptions *opts;
> -};
> -
>  struct VCChardev {
>      Chardev parent;
>      VirtualConsole *console;
> --
> 2.30.2
>
>

--000000000000add6ae05c0f0f984
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 23, 2021 at 12:34 PM Gerd=
 Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Want pl=
ace gtk clipboard code in a separate C file, which in turn<br>
requires GtkDisplayState being in a header file.=C2=A0 So move it.=C2=A0 No=
<br>
functional change.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/ui/gtk.h | 57 +++++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| 55 ----------------------=
------------------------<br>
=C2=A02 files changed, 57 insertions(+), 55 deletions(-)<br>
<br>
diff --git a/include/ui/gtk.h b/include/ui/gtk.h<br>
index 5ae0ad60a600..6e751794043f 100644<br>
--- a/include/ui/gtk.h<br>
+++ b/include/ui/gtk.h<br>
@@ -18,12 +18,15 @@<br>
=C2=A0#include &lt;gdk/gdkwayland.h&gt;<br>
=C2=A0#endif<br>
<br>
+#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;ui/kbd-state.h&quot;<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
=C2=A0#include &quot;ui/egl-helpers.h&quot;<br>
=C2=A0#include &quot;ui/egl-context.h&quot;<br>
=C2=A0#endif<br>
<br>
+#define MAX_VCS 10<br>
+<br>
=C2=A0typedef struct GtkDisplayState GtkDisplayState;<br>
<br>
=C2=A0typedef struct VirtualGfxConsole {<br>
@@ -83,6 +86,60 @@ typedef struct VirtualConsole {<br>
=C2=A0 =C2=A0 =C2=A0};<br>
=C2=A0} VirtualConsole;<br>
<br>
+struct GtkDisplayState {<br>
+=C2=A0 =C2=A0 GtkWidget *window;<br>
+<br>
+=C2=A0 =C2=A0 GtkWidget *menu_bar;<br>
+<br>
+=C2=A0 =C2=A0 GtkAccelGroup *accel_group;<br>
+<br>
+=C2=A0 =C2=A0 GtkWidget *machine_menu_item;<br>
+=C2=A0 =C2=A0 GtkWidget *machine_menu;<br>
+=C2=A0 =C2=A0 GtkWidget *pause_item;<br>
+=C2=A0 =C2=A0 GtkWidget *reset_item;<br>
+=C2=A0 =C2=A0 GtkWidget *powerdown_item;<br>
+=C2=A0 =C2=A0 GtkWidget *quit_item;<br>
+<br>
+=C2=A0 =C2=A0 GtkWidget *view_menu_item;<br>
+=C2=A0 =C2=A0 GtkWidget *view_menu;<br>
+=C2=A0 =C2=A0 GtkWidget *full_screen_item;<br>
+=C2=A0 =C2=A0 GtkWidget *copy_item;<br>
+=C2=A0 =C2=A0 GtkWidget *zoom_in_item;<br>
+=C2=A0 =C2=A0 GtkWidget *zoom_out_item;<br>
+=C2=A0 =C2=A0 GtkWidget *zoom_fixed_item;<br>
+=C2=A0 =C2=A0 GtkWidget *zoom_fit_item;<br>
+=C2=A0 =C2=A0 GtkWidget *grab_item;<br>
+=C2=A0 =C2=A0 GtkWidget *grab_on_hover_item;<br>
+<br>
+=C2=A0 =C2=A0 int nb_vcs;<br>
+=C2=A0 =C2=A0 VirtualConsole vc[MAX_VCS];<br>
+<br>
+=C2=A0 =C2=A0 GtkWidget *show_tabs_item;<br>
+=C2=A0 =C2=A0 GtkWidget *untabify_item;<br>
+=C2=A0 =C2=A0 GtkWidget *show_menubar_item;<br>
+<br>
+=C2=A0 =C2=A0 GtkWidget *vbox;<br>
+=C2=A0 =C2=A0 GtkWidget *notebook;<br>
+=C2=A0 =C2=A0 int button_mask;<br>
+=C2=A0 =C2=A0 gboolean last_set;<br>
+=C2=A0 =C2=A0 int last_x;<br>
+=C2=A0 =C2=A0 int last_y;<br>
+=C2=A0 =C2=A0 int grab_x_root;<br>
+=C2=A0 =C2=A0 int grab_y_root;<br>
+=C2=A0 =C2=A0 VirtualConsole *kbd_owner;<br>
+=C2=A0 =C2=A0 VirtualConsole *ptr_owner;<br>
+<br>
+=C2=A0 =C2=A0 gboolean full_screen;<br>
+<br>
+=C2=A0 =C2=A0 GdkCursor *null_cursor;<br>
+=C2=A0 =C2=A0 Notifier mouse_mode_notifier;<br>
+=C2=A0 =C2=A0 gboolean free_scale;<br>
+<br>
+=C2=A0 =C2=A0 bool external_pause_update;<br>
+<br>
+=C2=A0 =C2=A0 DisplayOptions *opts;<br>
+};<br>
+<br>
=C2=A0extern bool gtk_use_gl_area;<br>
<br>
=C2=A0/* ui/gtk.c */<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 1ea12535284a..7da288a25156 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -60,7 +60,6 @@<br>
=C2=A0#include &quot;chardev/char.h&quot;<br>
=C2=A0#include &quot;qom/object.h&quot;<br>
<br>
-#define MAX_VCS 10<br>
=C2=A0#define VC_WINDOW_X_MIN=C2=A0 320<br>
=C2=A0#define VC_WINDOW_Y_MIN=C2=A0 240<br>
=C2=A0#define VC_TERM_X_MIN=C2=A0 =C2=A0 =C2=A080<br>
@@ -119,60 +118,6 @@<br>
=C2=A0static const guint16 *keycode_map;<br>
=C2=A0static size_t keycode_maplen;<br>
<br>
-struct GtkDisplayState {<br>
-=C2=A0 =C2=A0 GtkWidget *window;<br>
-<br>
-=C2=A0 =C2=A0 GtkWidget *menu_bar;<br>
-<br>
-=C2=A0 =C2=A0 GtkAccelGroup *accel_group;<br>
-<br>
-=C2=A0 =C2=A0 GtkWidget *machine_menu_item;<br>
-=C2=A0 =C2=A0 GtkWidget *machine_menu;<br>
-=C2=A0 =C2=A0 GtkWidget *pause_item;<br>
-=C2=A0 =C2=A0 GtkWidget *reset_item;<br>
-=C2=A0 =C2=A0 GtkWidget *powerdown_item;<br>
-=C2=A0 =C2=A0 GtkWidget *quit_item;<br>
-<br>
-=C2=A0 =C2=A0 GtkWidget *view_menu_item;<br>
-=C2=A0 =C2=A0 GtkWidget *view_menu;<br>
-=C2=A0 =C2=A0 GtkWidget *full_screen_item;<br>
-=C2=A0 =C2=A0 GtkWidget *copy_item;<br>
-=C2=A0 =C2=A0 GtkWidget *zoom_in_item;<br>
-=C2=A0 =C2=A0 GtkWidget *zoom_out_item;<br>
-=C2=A0 =C2=A0 GtkWidget *zoom_fixed_item;<br>
-=C2=A0 =C2=A0 GtkWidget *zoom_fit_item;<br>
-=C2=A0 =C2=A0 GtkWidget *grab_item;<br>
-=C2=A0 =C2=A0 GtkWidget *grab_on_hover_item;<br>
-<br>
-=C2=A0 =C2=A0 int nb_vcs;<br>
-=C2=A0 =C2=A0 VirtualConsole vc[MAX_VCS];<br>
-<br>
-=C2=A0 =C2=A0 GtkWidget *show_tabs_item;<br>
-=C2=A0 =C2=A0 GtkWidget *untabify_item;<br>
-=C2=A0 =C2=A0 GtkWidget *show_menubar_item;<br>
-<br>
-=C2=A0 =C2=A0 GtkWidget *vbox;<br>
-=C2=A0 =C2=A0 GtkWidget *notebook;<br>
-=C2=A0 =C2=A0 int button_mask;<br>
-=C2=A0 =C2=A0 gboolean last_set;<br>
-=C2=A0 =C2=A0 int last_x;<br>
-=C2=A0 =C2=A0 int last_y;<br>
-=C2=A0 =C2=A0 int grab_x_root;<br>
-=C2=A0 =C2=A0 int grab_y_root;<br>
-=C2=A0 =C2=A0 VirtualConsole *kbd_owner;<br>
-=C2=A0 =C2=A0 VirtualConsole *ptr_owner;<br>
-<br>
-=C2=A0 =C2=A0 gboolean full_screen;<br>
-<br>
-=C2=A0 =C2=A0 GdkCursor *null_cursor;<br>
-=C2=A0 =C2=A0 Notifier mouse_mode_notifier;<br>
-=C2=A0 =C2=A0 gboolean free_scale;<br>
-<br>
-=C2=A0 =C2=A0 bool external_pause_update;<br>
-<br>
-=C2=A0 =C2=A0 DisplayOptions *opts;<br>
-};<br>
-<br>
=C2=A0struct VCChardev {<br>
=C2=A0 =C2=A0 =C2=A0Chardev parent;<br>
=C2=A0 =C2=A0 =C2=A0VirtualConsole *console;<br>
-- <br>
2.30.2<br>
<br>
</blockquote></div></div>

--000000000000add6ae05c0f0f984--


