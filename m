Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CDFD334A479
	for <lists+qemu-devel@lfdr.de>; Fri, 26 Mar 2021 10:33:18 +0100 (CET)
Received: from localhost ([::1]:50892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lPiqD-0005hW-T3
	for lists+qemu-devel@lfdr.de; Fri, 26 Mar 2021 05:33:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPiiX-0006r2-Pu
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:25:21 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39872)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lPiiU-0001lT-2y
 for qemu-devel@nongnu.org; Fri, 26 Mar 2021 05:25:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616750716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N066lsqTxJlwVbeLr5hU8Uo5ILbNMRqMsOvx2wpPLYc=;
 b=Lf2apzeHJ8z28ltbnl5NPlL0DYGzCXdsyOLkZz7tTvEy5pDBKHwY0GPLTdZAGicfcKdM1Y
 5maH1aGlNg4tfgy02qD6LQDwKfD31Y3CeisvxFoBZhppBP8xH62NgWilY9lDFCdUTsjYIb
 jfqHePd5SePiGIQnmQn2JxFjOqC1rng=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-237-5UWeRmFvMDmEmU0zD7ByxA-1; Fri, 26 Mar 2021 05:25:13 -0400
X-MC-Unique: 5UWeRmFvMDmEmU0zD7ByxA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9EC66180FCA0
 for <qemu-devel@nongnu.org>; Fri, 26 Mar 2021 09:25:12 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-102.ams2.redhat.com
 [10.36.112.102])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D3CA50C0E;
 Fri, 26 Mar 2021 09:25:12 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 10023180038F; Fri, 26 Mar 2021 10:24:49 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 7/7] ui/gtk: add clipboard support
Date: Fri, 26 Mar 2021 10:24:48 +0100
Message-Id: <20210326092448.367016-8-kraxel@redhat.com>
In-Reply-To: <20210326092448.367016-1-kraxel@redhat.com>
References: <20210326092448.367016-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch adds clipboard support to the qemu gtk ui.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
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
index 000000000000..21f8b39e9c54
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
+    QemuClipboardInfo *info = qemu_clipboard_info_get(gd->cbinfo[s]);
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
+    qemu_clipboard_info_put(info);
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
+        qemu_clipboard_info_put(gd->cbinfo[s]);
+        gd->cbinfo[s] = qemu_clipboard_info_get(info);
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
+        qemu_clipboard_info_put(info);
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
index 6c0c6ddd74eb..9ec0c03b5ad1 100644
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
2.30.2


