Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D17232570C
	for <lists+qemu-devel@lfdr.de>; Thu, 25 Feb 2021 20:48:40 +0100 (CET)
Received: from localhost ([::1]:55910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lFMco-0006TQ-Ta
	for lists+qemu-devel@lfdr.de; Thu, 25 Feb 2021 14:48:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34246)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFMZe-0004cy-Nz
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:45:23 -0500
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:33144)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lFMZZ-0004BN-Or
 for qemu-devel@nongnu.org; Thu, 25 Feb 2021 14:45:22 -0500
Received: by mail-ed1-x532.google.com with SMTP id c6so8442630ede.0
 for <qemu-devel@nongnu.org>; Thu, 25 Feb 2021 11:45:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9mwRLNIn92SdH/1W7fkQ5zYQ+X4mfq1llP3yUn2+3Sc=;
 b=U8+TPUQGDjXqCkH4WJPcGgphyNcW2ULF5l18O439hJxrLgo/cYuf3lGlUsPB6VM5qI
 5VvI7l7K1wn0zbHzF6f33BrtK9WR0YPWvGo6iyAsfevgnKt3x61Z0rs5CObJqHSRMMpI
 n4RwwzqcbMj8qEVMIWmoZCRPOvX7J8KOnx4uxhQUUbbkiqiwLFxpqe1gRURHIsP/OLnE
 3olbdZASaiP5pqucBtpqTy+Hz2eZQa/uwd6Aik3NWB+z1thrQcIxWgGCvPFdhfvzE5rz
 UkBWhyv4shDpKuQHWDLzA0PGtZUlb3LY+WdsyeYaYnVSe/P3w9jidxVMVWr7IJumvJj4
 V0jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9mwRLNIn92SdH/1W7fkQ5zYQ+X4mfq1llP3yUn2+3Sc=;
 b=VClneNbVU7xj88YCvoB1eTXoaKtOwnrYCL/202jx5mmRHjVAXTdv4INphNQDXn9Lz7
 6SYfYm7K8l7UlkjNoCpdiDvFbKIk3FHpDcknwJSvv8R7eATBn8eIumOnzwVhdtdnpAed
 po0CAPHTGZzzf6wutdh6RIotJECLTi8tb2xxrnND40dk2BhYHePsbAfPe9cqAsaGqMpM
 vZeE4Cwg6SwNjePAJcBawP/xprBmWFOYll+GPwwF+M0YvA7OikRFxvbfDZlPbE1UXJ4+
 QOgoLmrzj5QimlivyNpX3eZJmvl9HXaEHQ4pnD58aHk9Vr78OwGy2DxNahbq6IE6n1V2
 InRw==
X-Gm-Message-State: AOAM533hwonr0gDMXOcIAVvP57IA6Z0oqSYxkMIzmnTY8LhzzVkmoWVu
 8yRk2vkbOISS9ZQb+jDMGaQetkseW1GSnTyMbaM=
X-Google-Smtp-Source: ABdhPJx23WBllSiY7P+w8dEXABZzVzuJ4oI9GODwA382Ie+dXIDk+OPiClogOKqmj9pBBMXbjsCaFB2XNqzzXfz6EiA=
X-Received: by 2002:aa7:cd94:: with SMTP id x20mr4863322edv.53.1614282315621; 
 Thu, 25 Feb 2021 11:45:15 -0800 (PST)
MIME-Version: 1.0
References: <20210219131349.3993192-1-kraxel@redhat.com>
 <20210219131349.3993192-8-kraxel@redhat.com>
In-Reply-To: <20210219131349.3993192-8-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 25 Feb 2021 23:45:03 +0400
Message-ID: <CAJ+F1C+7aZyDOGB+CD2CubxzTexJ0kBkMx76Zk4zpHiQZuEx9Q@mail.gmail.com>
Subject: Re: [PATCH 7/7] ui/gtk: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="000000000000fd69ed05bc2e637a"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 HTML_MESSAGE=0.001, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, QEMU <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

--000000000000fd69ed05bc2e637a
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 19, 2021 at 5:29 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds clipboard support to the qemu gtk ui.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/gtk.h   |   9 ++++
>  ui/gtk-clipboard.c | 124 +++++++++++++++++++++++++++++++++++++++++++++
>  ui/gtk.c           |   1 +
>  ui/meson.build     |   2 +-
>  4 files changed, 135 insertions(+), 1 deletion(-)
>  create mode 100644 ui/gtk-clipboard.c
>
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index 55319843758d..08999f8835e6 100644
> --- a/include/ui/gtk.h
> +++ b/include/ui/gtk.h
> @@ -18,6 +18,7 @@
>  #include <gdk/gdkwayland.h>
>  #endif
>
> +#include "ui/clipboard.h"
>  #include "ui/console.h"
>  #include "ui/kbd-state.h"
>  #if defined(CONFIG_OPENGL)
> @@ -137,6 +138,11 @@ struct GtkDisplayState {
>
>      bool external_pause_update;
>
> +    QemuClipboardPeer cbpeer;
> +    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    GtkClipboard *gtkcb[QEMU_CLIPBOARD_SELECTION__COUNT];
> +
>      DisplayOptions *opts;
>  };
>
> @@ -208,4 +214,7 @@ QEMUGLContext
> gd_gl_area_get_current_context(DisplayChangeListener *dcl);
>  int gd_gl_area_make_current(DisplayChangeListener *dcl,
>                              QEMUGLContext ctx);
>
> +/* gtk-clipboard.c */
> +void gd_clipboard_init(GtkDisplayState *gd);
> +
>  #endif /* UI_GTK_H */
> diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
> new file mode 100644
> index 000000000000..4a7f44b25818
> --- /dev/null
> +++ b/ui/gtk-clipboard.c
> @@ -0,0 +1,124 @@
> +/*
> + * GTK UI -- clipboard support
> + *
> + * Copyright (C) 2021 Gerd Hoffmann <kraxel@redhat.com>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License as published by
> + * the Free Software Foundation; either version 2 of the License, or
> + * (at your option) any later version.
> + *
> + * This program is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * General Public License for more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses/>.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "qemu-common.h"
> +
> +#include "ui/gtk.h"
> +
> +static void gd_clipboard_notify(Notifier *notifier, void *data)
> +{
> +    GtkDisplayState *gd =3D container_of(notifier, GtkDisplayState,
> cbpeer.update);
> +    QemuClipboardInfo *info =3D data;
> +    QemuClipboardSelection s =3D info->selection;
> +    bool self_update =3D info->owner =3D=3D &gd->cbpeer;
> +
> +    if (info !=3D gd->cbinfo[s]) {
> +        qemu_clipboard_info_put(gd->cbinfo[s]);
> +        gd->cbinfo[s] =3D qemu_clipboard_info_get(info);
> +        gd->cbpending[s] =3D 0;
> +        if (!self_update) {
> +            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
> +                qemu_clipboard_request(info, QEMU_CLIPBOARD_TYPE_TEXT);
>

Always requesting the clipboard is a bit harsh, isn't it?

+            }
> +        }
> +        return;
> +    }
> +
> +    if (self_update) {
> +        return;
> +    }
> +
> +    if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available &&
> +        info->types[QEMU_CLIPBOARD_TYPE_TEXT].data) {
> +        gtk_clipboard_set_text(gd->gtkcb[s],
> +                               info->types[QEMU_CLIPBOARD_TYPE_TEXT].dat=
a,
> +
>  info->types[QEMU_CLIPBOARD_TYPE_TEXT].size);
> +    }
> +}
> +
> +static void gd_clipboard_request(QemuClipboardInfo *info,
> +                                 QemuClipboardType type)
> +{
> +    GtkDisplayState *gd =3D container_of(info->owner, GtkDisplayState,
> cbpeer);
> +    char *text;
> +
> +    switch (type) {
> +    case QEMU_CLIPBOARD_TYPE_TEXT:
> +        text =3D gtk_clipboard_wait_for_text(gd->gtkcb[info->selection])=
;
> +        qemu_clipboard_set_data(&gd->cbpeer, info, type,
> +                                strlen(text), text, true);
>

text might be NULL if it failed.

And you must free it.

+        break;
> +    default:
> +        break;
> +    }
> +}
> +
> +static QemuClipboardSelection gd_find_selection(GtkDisplayState *gd,
> +                                                GtkClipboard *clipboard)
> +{
> +    QemuClipboardSelection s;
> +
> +    for (s =3D 0; s < QEMU_CLIPBOARD_SELECTION__COUNT; s++) {
> +        if (gd->gtkcb[s] =3D=3D clipboard) {
> +            return s;
> +        }
> +    }
> +    return QEMU_CLIPBOARD_SELECTION_CLIPBOARD;
> +}
> +
> +static void gd_owner_change(GtkClipboard *clipboard,
> +                            GdkEvent *event,
> +                            gpointer data)
> +{
> +    GtkDisplayState *gd =3D data;
> +    QemuClipboardSelection s =3D gd_find_selection(gd, clipboard);
> +    QemuClipboardInfo *info;
> +
> +    info =3D qemu_clipboard_info_new(&gd->cbpeer, s);
> +    if (gtk_clipboard_wait_is_text_available(clipboard)) {
> +        info->types[QEMU_CLIPBOARD_TYPE_TEXT].available =3D true;
> +    }
>

Hmm, so after gtk_clipboard_set_text() the client side is actually taking
the ownership away from the guest clipboard I presume. That might have some
weird interaction issues. Hopefully the other side isn't playing the same
game...

+
> +    qemu_clipboard_update(info);
> +    qemu_clipboard_info_put(info);
> +}
> +
> +void gd_clipboard_init(GtkDisplayState *gd)
> +{
> +    gd->cbpeer.name =3D "gtk";
> +    gd->cbpeer.update.notify =3D gd_clipboard_notify;
> +    gd->cbpeer.request =3D gd_clipboard_request;
> +    qemu_clipboard_peer_register(&gd->cbpeer);
> +
> +    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =3D
> +        gtk_clipboard_get(gdk_atom_intern("CLIPBOARD", FALSE));
>

GDK_SELECTION_CLIPBOARD


> +    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =3D
> +        gtk_clipboard_get(gdk_atom_intern("PRIMARY", FALSE));
>

 GDK_SELECTION_PRIMARY

+    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =3D
> +        gtk_clipboard_get(gdk_atom_intern("SECONDARY", FALSE));
>

 GDK_SELECTION_SECONDARY


> +
> +    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD],
> +                     "owner-change", G_CALLBACK(gd_owner_change), gd);
> +    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY],
> +                     "owner-change", G_CALLBACK(gd_owner_change), gd);
> +    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY],
> +                     "owner-change", G_CALLBACK(gd_owner_change), gd);
>


Might be worth having a deinit for signals, peer registration etc, even if
nothing is hooked yet in gtk.c..

Overall, calling wait & set variants of clipboard functions makes things
quite simpler to deal with. Hopefully it can stay that way...

+}
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 7b412dd4fe0b..0ae3ec20f594 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2252,6 +2252,7 @@ static void gtk_display_init(DisplayState *ds,
> DisplayOptions *opts)
>          opts->u.gtk.grab_on_hover) {
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>      }
> +    gd_clipboard_init(s);
>  }
>
>  static void early_gtk_display_init(DisplayOptions *opts)
> diff --git a/ui/meson.build b/ui/meson.build
> index a98f89b48978..3ea969a6210b 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -64,7 +64,7 @@ if gtk.found()
>    softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'=
))
>
>    gtk_ss =3D ss.source_set()
> -  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
> +  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
>    gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
>    gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'=
,
> 'gtk-gl-area.c'))
>    ui_modules +=3D {'gtk' : gtk_ss}
> --
> 2.29.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--000000000000fd69ed05bc2e637a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Feb 19, 2021 at 5:29 PM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pat=
ch adds clipboard support to the qemu gtk ui.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/ui/gtk.h=C2=A0 =C2=A0|=C2=A0 =C2=A09 ++++<br>
=C2=A0ui/gtk-clipboard.c | 124 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A04 files changed, 135 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 ui/gtk-clipboard.c<br>
<br>
diff --git a/include/ui/gtk.h b/include/ui/gtk.h<br>
index 55319843758d..08999f8835e6 100644<br>
--- a/include/ui/gtk.h<br>
+++ b/include/ui/gtk.h<br>
@@ -18,6 +18,7 @@<br>
=C2=A0#include &lt;gdk/gdkwayland.h&gt;<br>
=C2=A0#endif<br>
<br>
+#include &quot;ui/clipboard.h&quot;<br>
=C2=A0#include &quot;ui/console.h&quot;<br>
=C2=A0#include &quot;ui/kbd-state.h&quot;<br>
=C2=A0#if defined(CONFIG_OPENGL)<br>
@@ -137,6 +138,11 @@ struct GtkDisplayState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool external_pause_update;<br>
<br>
+=C2=A0 =C2=A0 QemuClipboardPeer cbpeer;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];<=
br>
+=C2=A0 =C2=A0 uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];<br>
+=C2=A0 =C2=A0 GtkClipboard *gtkcb[QEMU_CLIPBOARD_SELECTION__COUNT];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0DisplayOptions *opts;<br>
=C2=A0};<br>
<br>
@@ -208,4 +214,7 @@ QEMUGLContext gd_gl_area_get_current_context(DisplayCha=
ngeListener *dcl);<br>
=C2=A0int gd_gl_area_make_current(DisplayChangeListener *dcl,<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QEMUGLContext ctx);<br>
<br>
+/* gtk-clipboard.c */<br>
+void gd_clipboard_init(GtkDisplayState *gd);<br>
+<br>
=C2=A0#endif /* UI_GTK_H */<br>
diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c<br>
new file mode 100644<br>
index 000000000000..4a7f44b25818<br>
--- /dev/null<br>
+++ b/ui/gtk-clipboard.c<br>
@@ -0,0 +1,124 @@<br>
+/*<br>
+ * GTK UI -- clipboard support<br>
+ *<br>
+ * Copyright (C) 2021 Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.co=
m" target=3D"_blank">kraxel@redhat.com</a>&gt;<br>
+ *<br>
+ * This program is free software; you can redistribute it and/or modify<br=
>
+ * it under the terms of the GNU General Public License as published by<br=
>
+ * the Free Software Foundation; either version 2 of the License, or<br>
+ * (at your option) any later version.<br>
+ *<br>
+ * This program is distributed in the hope that it will be useful,<br>
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of<br>
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.=C2=A0 See the GNU<=
br>
+ * General Public License for more details.<br>
+ *<br>
+ * You should have received a copy of the GNU General Public License<br>
+ * along with this program; if not, see &lt;<a href=3D"http://www.gnu.org/=
licenses/" rel=3D"noreferrer" target=3D"_blank">http://www.gnu.org/licenses=
/</a>&gt;.<br>
+ *<br>
+ */<br>
+<br>
+#include &quot;qemu/osdep.h&quot;<br>
+#include &quot;qemu-common.h&quot;<br>
+<br>
+#include &quot;ui/gtk.h&quot;<br>
+<br>
+static void gd_clipboard_notify(Notifier *notifier, void *data)<br>
+{<br>
+=C2=A0 =C2=A0 GtkDisplayState *gd =3D container_of(notifier, GtkDisplaySta=
te, cbpeer.update);<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D data;<br>
+=C2=A0 =C2=A0 QemuClipboardSelection s =3D info-&gt;selection;<br>
+=C2=A0 =C2=A0 bool self_update =3D info-&gt;owner =3D=3D &amp;gd-&gt;cbpee=
r;<br>
+<br>
+=C2=A0 =C2=A0 if (info !=3D gd-&gt;cbinfo[s]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(gd-&gt;cbinfo[s]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;cbinfo[s] =3D qemu_clipboard_info_get(i=
nfo);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;cbpending[s] =3D 0;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (!self_update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;types[QEMU_CLIPBOAR=
D_TYPE_TEXT].available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_req=
uest(info, QEMU_CLIPBOARD_TYPE_TEXT);<br></blockquote><div><br></div><div>A=
lways requesting the clipboard is a bit harsh, isn&#39;t it?</div><div> <br=
></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;=
border-left:1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (self_update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (info-&gt;types[QEMU_CLIPBOARD_TYPE_TEXT].available &amp;=
&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU_CLIPBOARD_TYPE_TEXT].data)=
 {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_set_text(gd-&gt;gtkcb[s],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[QEMU_CLIPBOARD_TYPE_TE=
XT].data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[QEMU_CLIPBOARD_TYPE_TE=
XT].size);<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static void gd_clipboard_request(QemuClipboardInfo *info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0QemuClipboardType type)<br>
+{<br>
+=C2=A0 =C2=A0 GtkDisplayState *gd =3D container_of(info-&gt;owner, GtkDisp=
layState, cbpeer);<br>
+=C2=A0 =C2=A0 char *text;<br>
+<br>
+=C2=A0 =C2=A0 switch (type) {<br>
+=C2=A0 =C2=A0 case QEMU_CLIPBOARD_TYPE_TEXT:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 text =3D gtk_clipboard_wait_for_text(gd-&gt;gt=
kcb[info-&gt;selection]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_set_data(&amp;gd-&gt;cbpeer, in=
fo, type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlen(text), text, true);<br></bloc=
kquote><div><br></div><div>text might be NULL if it failed.</div><div><br><=
/div><div>And you must free it.</div><div> <br></div><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
+}<br>
+<br>
+static QemuClipboardSelection gd_find_selection(GtkDisplayState *gd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 GtkClipboard *clipboard)<br>
+{<br>
+=C2=A0 =C2=A0 QemuClipboardSelection s;<br>
+<br>
+=C2=A0 =C2=A0 for (s =3D 0; s &lt; QEMU_CLIPBOARD_SELECTION__COUNT; s++) {=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gd-&gt;gtkcb[s] =3D=3D clipboard) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 return s;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 return QEMU_CLIPBOARD_SELECTION_CLIPBOARD;<br>
+}<br>
+<br>
+static void gd_owner_change(GtkClipboard *clipboard,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 GdkEvent *event,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 gpointer data)<br>
+{<br>
+=C2=A0 =C2=A0 GtkDisplayState *gd =3D data;<br>
+=C2=A0 =C2=A0 QemuClipboardSelection s =3D gd_find_selection(gd, clipboard=
);<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info;<br>
+<br>
+=C2=A0 =C2=A0 info =3D qemu_clipboard_info_new(&amp;gd-&gt;cbpeer, s);<br>
+=C2=A0 =C2=A0 if (gtk_clipboard_wait_is_text_available(clipboard)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU_CLIPBOARD_TYPE_TEXT].avail=
able =3D true;<br>
+=C2=A0 =C2=A0 }<br></blockquote><div><br></div>Hmm, so after gtk_clipboard=
_set_text() the client side is actually taking the ownership away from the =
guest clipboard I presume. That might have some weird interaction issues. H=
opefully the other side isn&#39;t playing the same game...<br></div><div cl=
ass=3D"gmail_quote"><br></div><div class=3D"gmail_quote"><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
+<br>
+=C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+}<br>
+<br>
+void gd_clipboard_init(GtkDisplayState *gd)<br>
+{<br>
+=C2=A0 =C2=A0 gd-&gt;<a href=3D"http://cbpeer.name" rel=3D"noreferrer" tar=
get=3D"_blank">cbpeer.name</a> =3D &quot;gtk&quot;;<br>
+=C2=A0 =C2=A0 gd-&gt;cbpeer.update.notify =3D gd_clipboard_notify;<br>
+=C2=A0 =C2=A0 gd-&gt;cbpeer.request =3D gd_clipboard_request;<br>
+=C2=A0 =C2=A0 qemu_clipboard_peer_register(&amp;gd-&gt;cbpeer);<br>
+<br>
+=C2=A0 =C2=A0 gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_get(gdk_atom_intern(&quot;CLIPBO=
ARD&quot;, FALSE));<br></blockquote><div><br></div><div>GDK_SELECTION_CLIPB=
OARD</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+=C2=A0 =C2=A0 gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_get(gdk_atom_intern(&quot;PRIMAR=
Y&quot;, FALSE));<br></blockquote><div><br></div><div>=C2=A0GDK_SELECTION_P=
RIMARY</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">
+=C2=A0 =C2=A0 gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_get(gdk_atom_intern(&quot;SECOND=
ARY&quot;, FALSE));<br>
</blockquote><div><div><br></div><div>=C2=A0GDK_SELECTION_SECONDARY</div>=
=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">+<br>
+=C2=A0 =C2=A0 g_signal_connect(gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPB=
OARD],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;owner-change&quot;, G_CALLBACK(gd_owner_change), gd);<br>
+=C2=A0 =C2=A0 g_signal_connect(gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMA=
RY],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;owner-change&quot;, G_CALLBACK(gd_owner_change), gd);<br>
+=C2=A0 =C2=A0 g_signal_connect(gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_SECON=
DARY],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0&quot;owner-change&quot;, G_CALLBACK(gd_owner_change), gd);<br></blockqu=
ote><div><br></div><div></div><div><br></div><div>Might be worth having a d=
einit for signals, peer registration etc, even if nothing is hooked yet in =
gtk.c..</div><div><br></div><div>Overall, calling wait &amp; set variants o=
f clipboard functions makes things quite simpler to deal with. Hopefully it=
 can stay that way...<br></div><div><br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">
+}<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 7b412dd4fe0b..0ae3ec20f594 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -2252,6 +2252,7 @@ static void gtk_display_init(DisplayState *ds, Displa=
yOptions *opts)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0opts-&gt;u.gtk.grab_on_hover) {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gtk_menu_item_activate(GTK_MENU_ITEM(s-&g=
t;grab_on_hover_item));<br>
=C2=A0 =C2=A0 =C2=A0}<br>
+=C2=A0 =C2=A0 gd_clipboard_init(s);<br>
=C2=A0}<br>
<br>
=C2=A0static void early_gtk_display_init(DisplayOptions *opts)<br>
diff --git a/ui/meson.build b/ui/meson.build<br>
index a98f89b48978..3ea969a6210b 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -64,7 +64,7 @@ if gtk.found()<br>
=C2=A0 =C2=A0softmmu_ss.add(when: &#39;CONFIG_WIN32&#39;, if_true: files(&#=
39;win32-kbd-hook.c&#39;))<br>
<br>
=C2=A0 =C2=A0gtk_ss =3D ss.source_set()<br>
-=C2=A0 gtk_ss.add(gtk, vte, pixman, files(&#39;gtk.c&#39;))<br>
+=C2=A0 gtk_ss.add(gtk, vte, pixman, files(&#39;gtk.c&#39;, &#39;gtk-clipbo=
ard.c&#39;))<br>
=C2=A0 =C2=A0gtk_ss.add(when: x11, if_true: files(&#39;x_keymap.c&#39;))<br=
>
=C2=A0 =C2=A0gtk_ss.add(when: [opengl, &#39;CONFIG_OPENGL&#39;], if_true: f=
iles(&#39;gtk-egl.c&#39;, &#39;gtk-gl-area.c&#39;))<br>
=C2=A0 =C2=A0ui_modules +=3D {&#39;gtk&#39; : gtk_ss}<br>
-- <br>
2.29.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--000000000000fd69ed05bc2e637a--

