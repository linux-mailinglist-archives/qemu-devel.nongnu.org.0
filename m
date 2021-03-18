Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9106234040B
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Mar 2021 11:57:52 +0100 (CET)
Received: from localhost ([::1]:60602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lMqLf-0008Us-LU
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 06:57:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMqJQ-0007uW-2Q
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:55:32 -0400
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632]:37502)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@gmail.com>)
 id 1lMqJH-00031Y-Iy
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 06:55:31 -0400
Received: by mail-ej1-x632.google.com with SMTP id w3so3191381ejc.4
 for <qemu-devel@nongnu.org>; Thu, 18 Mar 2021 03:55:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XoPj6iQO84uO2oKB1YKcgIKLV7SSmutwWWCUS2X5HEM=;
 b=PeoftYYy+Rhn3aq79IS1FXAdBO17iPQd5CJV6NaoF+zDKLSb4+QPSfa5Lfx7E5RLCV
 8I6RwoMZzAjOFgC8JOJoHmrmebhEnMVuzOf1FGvu3XVGXa2Y72ftlUdiUCNYXjvTpBS7
 M4SsSNsKGV6q/LcUVfjTHbS0m+2PiICpo0ld8ZXKY3VBCDBphLxzSBUULE1z9oHaOIme
 jqNiD6qgaO1heA0WKtFsuikRUn4jT1gA/zRZekCgnrgVZfg+kcQ2+eHTlxR/faQiO2ML
 dhcOB7n5cS3vNiH7wE/jrtst2l/zMZYlt5B3gSwoBHLWHJUlhNcxsHfbypH6xdy/cycd
 jjyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XoPj6iQO84uO2oKB1YKcgIKLV7SSmutwWWCUS2X5HEM=;
 b=M6oV8vk2/X3tcj2j+a1+WSDyiPkj3bhVCag7XUJkdbaYP48nd7CvXzeUcf1Dye6YFg
 ft4Dz34uc7u7c4W45DdQku8rmTpOHfC8oof7eA2LO7trA6APEyo3n1D/K687Tijufge+
 Fk8RtkDwNB4/x/v6N1s1Gpj95dOP2nkWj3ePs8tRrBV2osREZOruv8dGojJyzk6/XIsX
 7UCH331pgNkCh67U5Jcz1taAMEFdE0iWORg7mwtRa8vtxneMSmsVbavmqAb6xuOkhf+K
 S/pGKFWQgzR4qFF0cEeykMgj0S9gnHuV3Es7RXx78AlRAknCEEcrvadHQeOwZeUkzhVX
 SngQ==
X-Gm-Message-State: AOAM532LRQFMNjFzSBFDgC0k2Xa8pCcjSNGxV04a+Y044zF8bxFWf8Lt
 GOEuT9lUMqpgWE74iaBKTOTN9m+43OhyWB9k9UA=
X-Google-Smtp-Source: ABdhPJyXAKGOcL7CpayihvxhSIc4kEqlIuOGzbiBi4iZrsQyxzytHTA0Ied+Did3TSLM3TrDf1LHCtUBas6g9yDSzig=
X-Received: by 2002:a17:906:a1c8:: with SMTP id
 bx8mr39316731ejb.381.1616064920983; 
 Thu, 18 Mar 2021 03:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20210318091647.3233178-1-kraxel@redhat.com>
 <20210318091647.3233178-8-kraxel@redhat.com>
In-Reply-To: <20210318091647.3233178-8-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date: Thu, 18 Mar 2021 14:55:09 +0400
Message-ID: <CAJ+F1CJqhUX1vnbXOAo8adpkb=rNcJSzMpeGVQnTGT5UuuALJg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] ui/gtk: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Content-Type: multipart/alternative; boundary="0000000000008c9d4905bdcd6f9e"
Received-SPF: pass client-ip=2a00:1450:4864:20::632;
 envelope-from=marcandre.lureau@gmail.com; helo=mail-ej1-x632.google.com
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

--0000000000008c9d4905bdcd6f9e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi

On Thu, Mar 18, 2021 at 1:25 PM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds clipboard support to the qemu gtk ui.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> ---
>  include/ui/gtk.h   |  10 +++
>  ui/gtk-clipboard.c | 189 +++++++++++++++++++++++++++++++++++++++++++++
>  ui/gtk.c           |   1 +
>  ui/meson.build     |   2 +-
>  4 files changed, 201 insertions(+), 1 deletion(-)
>  create mode 100644 ui/gtk-clipboard.c
>
> diff --git a/include/ui/gtk.h b/include/ui/gtk.h
> index 6e751794043f..9516670ebc87 100644
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
> @@ -137,6 +138,12 @@ struct GtkDisplayState {
>
>      bool external_pause_update;
>
> +    QemuClipboardPeer cbpeer;
> +    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    GtkClipboard *gtkcb[QEMU_CLIPBOARD_SELECTION__COUNT];
> +    bool cbowner[QEMU_CLIPBOARD_SELECTION__COUNT];
> +
>      DisplayOptions *opts;
>  };
>
> @@ -207,4 +214,7 @@ void gtk_gl_area_init(void);
>  int gd_gl_area_make_current(DisplayChangeListener *dcl,
>                              QEMUGLContext ctx);
>
> +/* gtk-clipboard.c */
> +void gd_clipboard_init(GtkDisplayState *gd);
> +
>  #endif /* UI_GTK_H */
> diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
> new file mode 100644
> index 000000000000..3585e27cab78
> --- /dev/null
> +++ b/ui/gtk-clipboard.c
> @@ -0,0 +1,189 @@
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
> +#include "qemu/main-loop.h"
> +
> +#include "ui/gtk.h"
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
> +static void gd_clipboard_get_data(GtkClipboard     *clipboard,
> +                                  GtkSelectionData *selection_data,
> +                                  guint             selection_info,
> +                                  gpointer          data)
> +{
> +    GtkDisplayState *gd =3D data;
> +    QemuClipboardSelection s =3D gd_find_selection(gd, clipboard);
> +    QemuClipboardType type =3D QEMU_CLIPBOARD_TYPE_TEXT;
> +    QemuClipboardInfo *info =3D qemu_clipboard_info_get(gd->cbinfo[s]);
> +
> +    qemu_clipboard_request(info, type);
> +    while (info =3D=3D gd->cbinfo[s] &&
> +           info->types[type].available &&
> +           info->types[type].data =3D=3D NULL) {
> +        main_loop_wait(false);
>

Added to the list of reasons not to want running the clipboard  (or shall I
say any UI code) inside qemu.

(gtk4 is supposed to have improved that, fwiw)

+    }
> +
> +    if (info =3D=3D gd->cbinfo[s] && gd->cbowner[s]) {
> +        gtk_selection_data_set_text(selection_data,
> +                                    info->types[type].data,
> +                                    info->types[type].size);
> +    } else {
> +        /* clipboard owner changed while waiting for the data */
> +    }
> +
> +    qemu_clipboard_info_put(info);
> +}
> +
> +static void gd_clipboard_clear(GtkClipboard *clipboard,
> +                               gpointer data)
> +{
> +    GtkDisplayState *gd =3D data;
> +    QemuClipboardSelection s =3D gd_find_selection(gd, clipboard);
> +
> +    gd->cbowner[s] =3D false;
> +}
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
> +            GtkTargetList *list;
> +            GtkTargetEntry *targets;
> +            gint n_targets;
> +
> +            list =3D gtk_target_list_new(NULL, 0);
> +            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
> +                gtk_target_list_add_text_targets(list, 0);
> +            }
> +            targets =3D gtk_target_table_new_from_list(list, &n_targets)=
;
> +
> +            gtk_clipboard_clear(gd->gtkcb[s]);
> +            gd->cbowner[s] =3D true;
> +            gtk_clipboard_set_with_data(gd->gtkcb[s],
> +                                        targets, n_targets,
> +                                        gd_clipboard_get_data,
> +                                        gd_clipboard_clear,
> +                                        gd);
> +
> +            gtk_target_table_free(targets, n_targets);
> +            gtk_target_list_unref(list);
> +        }
> +        return;
> +    }
> +
> +    if (self_update) {
> +        return;
> +    }
> +
> +    /*
> +     * Clipboard got updated, with data probably.  No action here, we
> +     * are waiting for updates in gd_clipboard_get_data().
> +     */
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

From v1:
text might be NULL if it failed.

And you must free it.

+        break;
> +    default:
> +        break;
> +    }
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
> +    if (gd->cbowner[s]) {
> +        /* ignore notifications about our own grabs */
> +        return;
> +    }
> +
> +
> +    switch (event->owner_change.reason) {
> +    case GDK_SETTING_ACTION_NEW:
> +        info =3D qemu_clipboard_info_new(&gd->cbpeer, s);
> +        if (gtk_clipboard_wait_is_text_available(clipboard)) {
> +            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available =3D true;
> +        }
>

Same comment as v1:
So after gtk_clipboard_set_text() the client side is actually taking
the ownership away from the guest clipboard I presume. That might have some
weird interaction issues. Hopefully the other side isn't playing the same
game...


If we don't address it now, I think it deserves a warning comment, possibly
a FIXME.

+
> +        qemu_clipboard_update(info);
> +        qemu_clipboard_info_put(info);
> +        break;
> +    default:
> +        break;
> +    }
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

Why not use GDK_SELECTION_* ?

+    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =3D
> +        gtk_clipboard_get(gdk_atom_intern("PRIMARY", FALSE));
> +    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =3D
> +        gtk_clipboard_get(gdk_atom_intern("SECONDARY", FALSE));
> +
> +    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD],
> +                     "owner-change", G_CALLBACK(gd_owner_change), gd);
> +    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY],
> +                     "owner-change", G_CALLBACK(gd_owner_change), gd);
> +    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY],
> +                     "owner-change", G_CALLBACK(gd_owner_change), gd);
> +}
> diff --git a/ui/gtk.c b/ui/gtk.c
> index 7da288a25156..98046f577b9d 100644
> --- a/ui/gtk.c
> +++ b/ui/gtk.c
> @@ -2267,6 +2267,7 @@ static void gtk_display_init(DisplayState *ds,
> DisplayOptions *opts)
>          opts->u.gtk.grab_on_hover) {
>          gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
>      }
> +    gd_clipboard_init(s);
>  }
>
>  static void early_gtk_display_init(DisplayOptions *opts)
> diff --git a/ui/meson.build b/ui/meson.build
> index 6c0c6ddd74eb..9ec0c03b5ad1 100644
> --- a/ui/meson.build
> +++ b/ui/meson.build
> @@ -65,7 +65,7 @@ if gtk.found()
>    softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'=
))
>
>    gtk_ss =3D ss.source_set()
> -  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
> +  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
>    gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
>    gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true:
> files('gtk-gl-area.c'))
>    gtk_ss.add(when: [x11, opengl, 'CONFIG_OPENGL'], if_true:
> files('gtk-egl.c'))
> --
> 2.30.2
>
>
>

--=20
Marc-Andr=C3=A9 Lureau

--0000000000008c9d4905bdcd6f9e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi<br></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Mar 18, 2021 at 1:25 PM Ger=
d Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&g=
t; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This p=
atch adds clipboard support to the qemu gtk ui.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br>
---<br>
=C2=A0include/ui/gtk.h=C2=A0 =C2=A0|=C2=A0 10 +++<br>
=C2=A0ui/gtk-clipboard.c | 189 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A04 files changed, 201 insertions(+), 1 deletion(-)<br>
=C2=A0create mode 100644 ui/gtk-clipboard.c<br>
<br>
diff --git a/include/ui/gtk.h b/include/ui/gtk.h<br>
index 6e751794043f..9516670ebc87 100644<br>
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
@@ -137,6 +138,12 @@ struct GtkDisplayState {<br>
<br>
=C2=A0 =C2=A0 =C2=A0bool external_pause_update;<br>
<br>
+=C2=A0 =C2=A0 QemuClipboardPeer cbpeer;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];<=
br>
+=C2=A0 =C2=A0 uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];<br>
+=C2=A0 =C2=A0 GtkClipboard *gtkcb[QEMU_CLIPBOARD_SELECTION__COUNT];<br>
+=C2=A0 =C2=A0 bool cbowner[QEMU_CLIPBOARD_SELECTION__COUNT];<br>
+<br>
=C2=A0 =C2=A0 =C2=A0DisplayOptions *opts;<br>
=C2=A0};<br>
<br>
@@ -207,4 +214,7 @@ void gtk_gl_area_init(void);<br>
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
index 000000000000..3585e27cab78<br>
--- /dev/null<br>
+++ b/ui/gtk-clipboard.c<br>
@@ -0,0 +1,189 @@<br>
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
+#include &quot;qemu/main-loop.h&quot;<br>
+<br>
+#include &quot;ui/gtk.h&quot;<br>
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
+static void gd_clipboard_get_data(GtkClipboard=C2=A0 =C2=A0 =C2=A0*clipboa=
rd,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GtkSelectionData *selection_d=
ata,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 guint=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0selection_info,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gpointer=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 data)<br>
+{<br>
+=C2=A0 =C2=A0 GtkDisplayState *gd =3D data;<br>
+=C2=A0 =C2=A0 QemuClipboardSelection s =3D gd_find_selection(gd, clipboard=
);<br>
+=C2=A0 =C2=A0 QemuClipboardType type =3D QEMU_CLIPBOARD_TYPE_TEXT;<br>
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D qemu_clipboard_info_get(gd-&gt;c=
binfo[s]);<br>
+<br>
+=C2=A0 =C2=A0 qemu_clipboard_request(info, type);<br>
+=C2=A0 =C2=A0 while (info =3D=3D gd-&gt;cbinfo[s] &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[type].available &a=
mp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[type].data =3D=3D =
NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 main_loop_wait(false);<br></blockquote><div><b=
r></div><div>Added to the list of reasons not to want running the clipboard=
=C2=A0 (or shall I say any UI code) inside qemu.</div><div><br></div><div>(=
gtk4 is supposed to have improved that, fwiw)<br></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (info =3D=3D gd-&gt;cbinfo[s] &amp;&amp; gd-&gt;cbowner[s=
]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_selection_data_set_text(selection_data,<br=
>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[type].d=
ata,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[type].s=
ize);<br>
+=C2=A0 =C2=A0 } else {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* clipboard owner changed while waiting for t=
he data */<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+}<br>
+<br>
+static void gd_clipboard_clear(GtkClipboard *clipboard,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0gpointer data)<br>
+{<br>
+=C2=A0 =C2=A0 GtkDisplayState *gd =3D data;<br>
+=C2=A0 =C2=A0 QemuClipboardSelection s =3D gd_find_selection(gd, clipboard=
);<br>
+<br>
+=C2=A0 =C2=A0 gd-&gt;cbowner[s] =3D false;<br>
+}<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GtkTargetList *list;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 GtkTargetEntry *targets;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gint n_targets;<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 list =3D gtk_target_list_new(NUL=
L, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if (info-&gt;types[QEMU_CLIPBOAR=
D_TYPE_TEXT].available) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_target_list_ad=
d_text_targets(list, 0);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targets =3D gtk_target_table_new=
_from_list(list, &amp;n_targets);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_clear(gd-&gt;gtkcb=
[s]);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;cbowner[s] =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_set_with_data(gd-&=
gt;gtkcb[s],<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 targets,=
 n_targets,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gd_clipb=
oard_get_data,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gd_clipb=
oard_clear,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gd);<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_target_table_free(targets, n=
_targets);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_target_list_unref(list);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 if (self_update) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 /*<br>
+=C2=A0 =C2=A0 =C2=A0* Clipboard got updated, with data probably.=C2=A0 No =
action here, we<br>
+=C2=A0 =C2=A0 =C2=A0* are waiting for updates in gd_clipboard_get_data().<=
br>
+=C2=A0 =C2=A0 =C2=A0*/<br>
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
kquote><div><br></div><div>From v1:</div><div>text might be NULL if it fail=
ed.<br><br>And you must free it.</div><div><br> </div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
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
+=C2=A0 =C2=A0 if (gd-&gt;cbowner[s]) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 /* ignore notifications about our own grabs */=
<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 return;<br>
+=C2=A0 =C2=A0 }<br>
+<br>
+<br>
+=C2=A0 =C2=A0 switch (event-&gt;owner_change.reason) {<br>
+=C2=A0 =C2=A0 case GDK_SETTING_ACTION_NEW:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 info =3D qemu_clipboard_info_new(&amp;gd-&gt;c=
bpeer, s);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (gtk_clipboard_wait_is_text_available(clipb=
oard)) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 info-&gt;types[QEMU_CLIPBOARD_TY=
PE_TEXT].available =3D true;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br></blockquote><br></div><div class=3D"gmai=
l_quote">Same comment as v1:<br></div><div class=3D"gmail_quote">So after g=
tk_clipboard_set_text() the client side is actually taking<br></div><div cl=
ass=3D"gmail_quote"><div>the ownership away from the guest clipboard I pres=
ume. That might have some<br>weird interaction issues. Hopefully the other =
side isn&#39;t playing the same<br>game...<br>=C2=A0</div><div><br></div><d=
iv>If we don&#39;t address it now, I think it deserves a warning comment, p=
ossibly a FIXME.<br></div><div><br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_put(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 default:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 break;<br>
+=C2=A0 =C2=A0 }<br>
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
ARD&quot;, FALSE));<br></blockquote><div><br></div><div>Why not use GDK_SEL=
ECTION_* ?</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-lef=
t:1ex">
+=C2=A0 =C2=A0 gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_get(gdk_atom_intern(&quot;PRIMAR=
Y&quot;, FALSE));<br>
+=C2=A0 =C2=A0 gd-&gt;gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =3D<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gtk_clipboard_get(gdk_atom_intern(&quot;SECOND=
ARY&quot;, FALSE));<br>
+<br>
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
=A0&quot;owner-change&quot;, G_CALLBACK(gd_owner_change), gd);<br>
+}<br>
diff --git a/ui/gtk.c b/ui/gtk.c<br>
index 7da288a25156..98046f577b9d 100644<br>
--- a/ui/gtk.c<br>
+++ b/ui/gtk.c<br>
@@ -2267,6 +2267,7 @@ static void gtk_display_init(DisplayState *ds, Displa=
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
index 6c0c6ddd74eb..9ec0c03b5ad1 100644<br>
--- a/ui/meson.build<br>
+++ b/ui/meson.build<br>
@@ -65,7 +65,7 @@ if gtk.found()<br>
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
iles(&#39;gtk-gl-area.c&#39;))<br>
=C2=A0 =C2=A0gtk_ss.add(when: [x11, opengl, &#39;CONFIG_OPENGL&#39;], if_tr=
ue: files(&#39;gtk-egl.c&#39;))<br>
-- <br>
2.30.2<br>
<br>
<br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature">Marc-Andr=C3=A9 Lureau<br></div></div>

--0000000000008c9d4905bdcd6f9e--

