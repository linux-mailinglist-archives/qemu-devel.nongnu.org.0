Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A23A238C76D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 May 2021 15:03:42 +0200 (CEST)
Received: from localhost ([::1]:35688 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lk4oX-0006v6-NO
	for lists+qemu-devel@lfdr.de; Fri, 21 May 2021 09:03:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52896)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4fC-0007ko-K4
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:54:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:38173)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lk4fA-00080N-Dp
 for qemu-devel@nongnu.org; Fri, 21 May 2021 08:54:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621601639;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6Y4ytJuH80Or3DbAQbf2oSzUq7hUCXYqfH5uGxcQFrU=;
 b=BpzyK6feBeKwkz2ZXYXvelaOIuTU4OwRCOtVQQXzdTmTEEaFQ/uJ+PVLTxhZf4aeKW0Lhc
 XFkL1PirviE45+5z5D6OkaQyQQr1Wozr3K91/are0GFYHdXHt7PRt8Ym6x2fVzTcBKsPK6
 ArcP3medb3f3Fa//LZdg16ZfgHYZUYA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-26-CW8AuaNePtWYpB-2LYJZ7Q-1; Fri, 21 May 2021 08:53:58 -0400
X-MC-Unique: CW8AuaNePtWYpB-2LYJZ7Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 465388A9F45
 for <qemu-devel@nongnu.org>; Fri, 21 May 2021 12:53:57 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 06B9860D4B;
 Fri, 21 May 2021 12:53:50 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id E5EFC1800903; Fri, 21 May 2021 14:51:19 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 11/11] ui/gtk: add clipboard support
Date: Fri, 21 May 2021 14:51:19 +0200
Message-Id: <20210521125119.3173309-12-kraxel@redhat.com>
In-Reply-To: <20210521125119.3173309-1-kraxel@redhat.com>
References: <20210521125119.3173309-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds clipboard support to the qemu gtk ui.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Message-id: 20210519053940.1888907-1-kraxel@redhat.com
Message-Id: <20210519053940.1888907-10-kraxel@redhat.com>
---
 include/ui/gtk.h   |  10 +++
 ui/gtk-clipboard.c | 192 +++++++++++++++++++++++++++++++++++++++++++++
 ui/gtk.c           |   1 +
 ui/meson.build     |   2 +-
 4 files changed, 204 insertions(+), 1 deletion(-)
 create mode 100644 ui/gtk-clipboard.c

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index 6e751794043f..9516670ebc87 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -18,6 +18,7 @@
 #include <gdk/gdkwayland.h>
 #endif
 
+#include "ui/clipboard.h"
 #include "ui/console.h"
 #include "ui/kbd-state.h"
 #if defined(CONFIG_OPENGL)
@@ -137,6 +138,12 @@ struct GtkDisplayState {
 
     bool external_pause_update;
 
+    QemuClipboardPeer cbpeer;
+    QemuClipboardInfo *cbinfo[QEMU_CLIPBOARD_SELECTION__COUNT];
+    uint32_t cbpending[QEMU_CLIPBOARD_SELECTION__COUNT];
+    GtkClipboard *gtkcb[QEMU_CLIPBOARD_SELECTION__COUNT];
+    bool cbowner[QEMU_CLIPBOARD_SELECTION__COUNT];
+
     DisplayOptions *opts;
 };
 
@@ -207,4 +214,7 @@ void gtk_gl_area_init(void);
 int gd_gl_area_make_current(DisplayChangeListener *dcl,
                             QEMUGLContext ctx);
 
+/* gtk-clipboard.c */
+void gd_clipboard_init(GtkDisplayState *gd);
+
 #endif /* UI_GTK_H */
diff --git a/ui/gtk-clipboard.c b/ui/gtk-clipboard.c
new file mode 100644
index 000000000000..bff28d203014
--- /dev/null
+++ b/ui/gtk-clipboard.c
@@ -0,0 +1,192 @@
+/*
+ * GTK UI -- clipboard support
+ *
+ * Copyright (C) 2021 Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/main-loop.h"
+
+#include "ui/gtk.h"
+
+static QemuClipboardSelection gd_find_selection(GtkDisplayState *gd,
+                                                GtkClipboard *clipboard)
+{
+    QemuClipboardSelection s;
+
+    for (s = 0; s < QEMU_CLIPBOARD_SELECTION__COUNT; s++) {
+        if (gd->gtkcb[s] == clipboard) {
+            return s;
+        }
+    }
+    return QEMU_CLIPBOARD_SELECTION_CLIPBOARD;
+}
+
+static void gd_clipboard_get_data(GtkClipboard     *clipboard,
+                                  GtkSelectionData *selection_data,
+                                  guint             selection_info,
+                                  gpointer          data)
+{
+    GtkDisplayState *gd = data;
+    QemuClipboardSelection s = gd_find_selection(gd, clipboard);
+    QemuClipboardType type = QEMU_CLIPBOARD_TYPE_TEXT;
+    QemuClipboardInfo *info = qemu_clipboard_info_ref(gd->cbinfo[s]);
+
+    qemu_clipboard_request(info, type);
+    while (info == gd->cbinfo[s] &&
+           info->types[type].available &&
+           info->types[type].data == NULL) {
+        main_loop_wait(false);
+    }
+
+    if (info == gd->cbinfo[s] && gd->cbowner[s]) {
+        gtk_selection_data_set_text(selection_data,
+                                    info->types[type].data,
+                                    info->types[type].size);
+    } else {
+        /* clipboard owner changed while waiting for the data */
+    }
+
+    qemu_clipboard_info_unref(info);
+}
+
+static void gd_clipboard_clear(GtkClipboard *clipboard,
+                               gpointer data)
+{
+    GtkDisplayState *gd = data;
+    QemuClipboardSelection s = gd_find_selection(gd, clipboard);
+
+    gd->cbowner[s] = false;
+}
+
+static void gd_clipboard_notify(Notifier *notifier, void *data)
+{
+    GtkDisplayState *gd = container_of(notifier, GtkDisplayState, cbpeer.update);
+    QemuClipboardInfo *info = data;
+    QemuClipboardSelection s = info->selection;
+    bool self_update = info->owner == &gd->cbpeer;
+
+    if (info != gd->cbinfo[s]) {
+        qemu_clipboard_info_unref(gd->cbinfo[s]);
+        gd->cbinfo[s] = qemu_clipboard_info_ref(info);
+        gd->cbpending[s] = 0;
+        if (!self_update) {
+            GtkTargetList *list;
+            GtkTargetEntry *targets;
+            gint n_targets;
+
+            list = gtk_target_list_new(NULL, 0);
+            if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
+                gtk_target_list_add_text_targets(list, 0);
+            }
+            targets = gtk_target_table_new_from_list(list, &n_targets);
+
+            gtk_clipboard_clear(gd->gtkcb[s]);
+            gd->cbowner[s] = true;
+            gtk_clipboard_set_with_data(gd->gtkcb[s],
+                                        targets, n_targets,
+                                        gd_clipboard_get_data,
+                                        gd_clipboard_clear,
+                                        gd);
+
+            gtk_target_table_free(targets, n_targets);
+            gtk_target_list_unref(list);
+        }
+        return;
+    }
+
+    if (self_update) {
+        return;
+    }
+
+    /*
+     * Clipboard got updated, with data probably.  No action here, we
+     * are waiting for updates in gd_clipboard_get_data().
+     */
+}
+
+static void gd_clipboard_request(QemuClipboardInfo *info,
+                                 QemuClipboardType type)
+{
+    GtkDisplayState *gd = container_of(info->owner, GtkDisplayState, cbpeer);
+    char *text;
+
+    switch (type) {
+    case QEMU_CLIPBOARD_TYPE_TEXT:
+        text = gtk_clipboard_wait_for_text(gd->gtkcb[info->selection]);
+        if (text) {
+            qemu_clipboard_set_data(&gd->cbpeer, info, type,
+                                    strlen(text), text, true);
+            g_free(text);
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void gd_owner_change(GtkClipboard *clipboard,
+                            GdkEvent *event,
+                            gpointer data)
+{
+    GtkDisplayState *gd = data;
+    QemuClipboardSelection s = gd_find_selection(gd, clipboard);
+    QemuClipboardInfo *info;
+
+    if (gd->cbowner[s]) {
+        /* ignore notifications about our own grabs */
+        return;
+    }
+
+
+    switch (event->owner_change.reason) {
+    case GDK_SETTING_ACTION_NEW:
+        info = qemu_clipboard_info_new(&gd->cbpeer, s);
+        if (gtk_clipboard_wait_is_text_available(clipboard)) {
+            info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
+        }
+
+        qemu_clipboard_update(info);
+        qemu_clipboard_info_unref(info);
+        break;
+    default:
+        break;
+    }
+}
+
+void gd_clipboard_init(GtkDisplayState *gd)
+{
+    gd->cbpeer.name = "gtk";
+    gd->cbpeer.update.notify = gd_clipboard_notify;
+    gd->cbpeer.request = gd_clipboard_request;
+    qemu_clipboard_peer_register(&gd->cbpeer);
+
+    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD] =
+        gtk_clipboard_get(gdk_atom_intern("CLIPBOARD", FALSE));
+    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY] =
+        gtk_clipboard_get(gdk_atom_intern("PRIMARY", FALSE));
+    gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY] =
+        gtk_clipboard_get(gdk_atom_intern("SECONDARY", FALSE));
+
+    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_CLIPBOARD],
+                     "owner-change", G_CALLBACK(gd_owner_change), gd);
+    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_PRIMARY],
+                     "owner-change", G_CALLBACK(gd_owner_change), gd);
+    g_signal_connect(gd->gtkcb[QEMU_CLIPBOARD_SELECTION_SECONDARY],
+                     "owner-change", G_CALLBACK(gd_owner_change), gd);
+}
diff --git a/ui/gtk.c b/ui/gtk.c
index 7da288a25156..98046f577b9d 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2267,6 +2267,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.grab_on_hover) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
+    gd_clipboard_init(s);
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
diff --git a/ui/meson.build b/ui/meson.build
index f37ef882e0e3..b5aed14886cf 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -65,7 +65,7 @@ if gtk.found()
   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
   gtk_ss = ss.source_set()
-  gtk_ss.add(gtk, vte, pixman, files('gtk.c'))
+  gtk_ss.add(gtk, vte, pixman, files('gtk.c', 'gtk-clipboard.c'))
   gtk_ss.add(when: x11, if_true: files('x_keymap.c'))
   gtk_ss.add(when: [opengl, 'CONFIG_OPENGL'], if_true: files('gtk-gl-area.c'))
   gtk_ss.add(when: [x11, opengl, 'CONFIG_OPENGL'], if_true: files('gtk-egl.c'))
-- 
2.31.1


