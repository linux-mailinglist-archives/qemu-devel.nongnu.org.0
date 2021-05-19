Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AE944388B06
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 11:49:11 +0200 (CEST)
Received: from localhost ([::1]:44376 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljIpC-0006MP-0Y
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 05:49:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44554)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ljInM-0004L3-6A
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:47:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31710)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mlureau@redhat.com>)
 id 1ljInE-00077G-G9
 for qemu-devel@nongnu.org; Wed, 19 May 2021 05:47:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621417626;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=xRDANo6K2Su0lUksuKn5+D774zRXLkjOwHav8ogB2wM=;
 b=YdS6v6IDJ6EzBZHs2ARj6JsO6yB5n0fmeIwhPvLrkNKjWgDYzyxm8xICaIN+Dbleea+n0c
 I7yxjbwmpxpsjqP3uSoiRhVYXHGGZj4kxuLF4c+s3vn6UnWAkVNrNqlzH02EMOj3ouD6bp
 KlUFjZyO/1Z5Mb9CArvVN0WhxUPakDM=
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com
 [209.85.216.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-RMq3FzDcNhSVhIW57xSIXg-1; Wed, 19 May 2021 05:47:02 -0400
X-MC-Unique: RMq3FzDcNhSVhIW57xSIXg-1
Received: by mail-pj1-f72.google.com with SMTP id
 w12-20020a17090a528cb029015d7f990752so3575896pjh.0
 for <qemu-devel@nongnu.org>; Wed, 19 May 2021 02:47:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=xRDANo6K2Su0lUksuKn5+D774zRXLkjOwHav8ogB2wM=;
 b=IMmC/DX+YcyFgw/90yluUMl9hKjSRDMJdkNU3ItmZikfTBC/kV3Zxhjp8qW95Xb8va
 fuYOID2yvk5XOt3TVAj/tiIcNCZanAas0YKJwQcloPUAcCos6YzzBjBid1yL51h8uqFu
 7tg+dvM920DOB6myO8DvyL1Bjy3wQWc77y6n75cpv16cvdKNdj3VIzWc/lMjlL3ftBDs
 AlSqr2cQ2PlghjIfzgXZ/Y2xd/2q34o5dnNCgQo/eTKp4AUXt1rYSNmP2K+TJzfzEk6C
 fAzX9gl8ew0ot2aklRE8sVzkmuEY2BTaHhs/DD683rC8uQYiOvpVeYjSa1u7Cws/xaw0
 phFA==
X-Gm-Message-State: AOAM531ubefQ0ZhHGabvwUrT1me7wtZq0xFJEkZZ0AkyLobYcUuNaKH+
 FB1RuLJV4irIs5LxxqIQKRs3iRy7q2Tjg8uHlUJ8Mkhet/fiJTHMfigu3JHUuLeRvuRalgBur7Q
 idyGjZyQlu6uAsTrtGFdxV3lZNoW5WsU=
X-Received: by 2002:a17:903:31d3:b029:ee:bccd:e686 with SMTP id
 v19-20020a17090331d3b02900eebccde686mr10051419ple.1.1621417621676; 
 Wed, 19 May 2021 02:47:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzKO004VBosWXYDZpRl/4XbF+UO0/6yFgEcRp+MFi5c4F6gSo1IbfpGigQ104UZB9Zh0n5HFt7D0/Tw0jw1J4c=
X-Received: by 2002:a17:903:31d3:b029:ee:bccd:e686 with SMTP id
 v19-20020a17090331d3b02900eebccde686mr10051401ple.1.1621417621377; Wed, 19
 May 2021 02:47:01 -0700 (PDT)
MIME-Version: 1.0
References: <20210519053940.1888907-1-kraxel@redhat.com>
 <20210519053940.1888907-10-kraxel@redhat.com>
In-Reply-To: <20210519053940.1888907-10-kraxel@redhat.com>
From: =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>
Date: Wed, 19 May 2021 13:46:50 +0400
Message-ID: <CAMxuvaxfQchy8zuqY1J4yjbNCSj1UnL=AxOfvJaQAuECDjV59g@mail.gmail.com>
Subject: Re: [PATCH v6 9/9] ui/gtk: add clipboard support
To: Gerd Hoffmann <kraxel@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mlureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: multipart/alternative; boundary="0000000000005ae8a605c2abb551"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mlureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

--0000000000005ae8a605c2abb551
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 9:40 AM Gerd Hoffmann <kraxel@redhat.com> wrote:

> This patch adds clipboard support to the qemu gtk ui.
>
> Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
>

Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

---
>  include/ui/gtk.h   |  10 +++
>  ui/gtk-clipboard.c | 192 +++++++++++++++++++++++++++++++++++++++++++++
>  ui/gtk.c           |   1 +
>  ui/meson.build     |   2 +-
>  4 files changed, 204 insertions(+), 1 deletion(-)
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
> index 000000000000..bff28d203014
> --- /dev/null
> +++ b/ui/gtk-clipboard.c
> @@ -0,0 +1,192 @@
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
> +    QemuClipboardInfo *info =3D qemu_clipboard_info_ref(gd->cbinfo[s]);
> +
> +    qemu_clipboard_request(info, type);
> +    while (info =3D=3D gd->cbinfo[s] &&
> +           info->types[type].available &&
> +           info->types[type].data =3D=3D NULL) {
> +        main_loop_wait(false);
> +    }
> +
> +    if (info =3D=3D gd->cbinfo[s] && gd->cbowner[s]) {
> +        gtk_selection_data_set_text(selection_data,
> +                                    info->types[type].data,
> +                                    info->types[type].size);
> +    } else {
> +        /* clipboard owner changed while waiting for the data */
> +    }
> +
> +    qemu_clipboard_info_unref(info);
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
> +        qemu_clipboard_info_unref(gd->cbinfo[s]);
> +        gd->cbinfo[s] =3D qemu_clipboard_info_ref(info);
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
> +        if (text) {
> +            qemu_clipboard_set_data(&gd->cbpeer, info, type,
> +                                    strlen(text), text, true);
> +            g_free(text);
> +        }
> +        break;
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
> +
> +        qemu_clipboard_update(info);
> +        qemu_clipboard_info_unref(info);
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
> +    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =3D
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
> index f37ef882e0e3..b5aed14886cf 100644
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
> 2.31.1
>
>

--0000000000005ae8a605c2abb551
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, May 19, 2021 at 9:40 AM Gerd =
Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com">kraxel@redhat.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">This pat=
ch adds clipboard support to the qemu gtk ui.<br>
<br>
Signed-off-by: Gerd Hoffmann &lt;<a href=3D"mailto:kraxel@redhat.com" targe=
t=3D"_blank">kraxel@redhat.com</a>&gt;<br></blockquote><div><br></div><div>=
Reviewed-by: Marc-Andr=C3=A9 Lureau &lt;<a href=3D"mailto:marcandre.lureau@=
redhat.com">marcandre.lureau@redhat.com</a>&gt;=C2=A0 <br></div><div><br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
---<br>
=C2=A0include/ui/gtk.h=C2=A0 =C2=A0|=C2=A0 10 +++<br>
=C2=A0ui/gtk-clipboard.c | 192 ++++++++++++++++++++++++++++++++++++++++++++=
+<br>
=C2=A0ui/gtk.c=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 +<br=
>
=C2=A0ui/meson.build=C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A02 +-<br>
=C2=A04 files changed, 204 insertions(+), 1 deletion(-)<br>
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
index 000000000000..bff28d203014<br>
--- /dev/null<br>
+++ b/ui/gtk-clipboard.c<br>
@@ -0,0 +1,192 @@<br>
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
+=C2=A0 =C2=A0 QemuClipboardInfo *info =3D qemu_clipboard_info_ref(gd-&gt;c=
binfo[s]);<br>
+<br>
+=C2=A0 =C2=A0 qemu_clipboard_request(info, type);<br>
+=C2=A0 =C2=A0 while (info =3D=3D gd-&gt;cbinfo[s] &amp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[type].available &a=
mp;&amp;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info-&gt;types[type].data =3D=3D =
NULL) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 main_loop_wait(false);<br>
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
+=C2=A0 =C2=A0 qemu_clipboard_info_unref(info);<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_unref(gd-&gt;cbinfo[s]);<b=
r>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 gd-&gt;cbinfo[s] =3D qemu_clipboard_info_ref(i=
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if (text) {<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_set_data(&amp;gd-=
&gt;cbpeer, info, type,<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 strlen(text), text, tr=
ue);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 g_free(text);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
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
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 }<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_update(info);<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 qemu_clipboard_info_unref(info);<br>
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
ARD&quot;, FALSE));<br>
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
index f37ef882e0e3..b5aed14886cf 100644<br>
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
2.31.1<br>
<br>
</blockquote></div></div>

--0000000000005ae8a605c2abb551--


