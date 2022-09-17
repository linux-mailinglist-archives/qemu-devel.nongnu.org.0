Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F8565BB502
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 02:29:30 +0200 (CEST)
Received: from localhost ([::1]:49182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZLi5-0008Ql-1u
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 20:29:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgB-0005ky-0T
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:31 -0400
Received: from mga17.intel.com ([192.55.52.151]:23527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLg8-0000iY-Ag
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663374448; x=1694910448;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=9JsnKgMaT+NWlAlZc/hCPg1J/P2cW1jC9qrb4G6jxbU=;
 b=eOVQT4gFx5oODrhyzYgvO4Sh5Lpg6DZbneJjpQgOlU7GfIFJu/gwwLy2
 udBb2jdJRulzAC043nYg2zarTR8BlMy3Qp7va8decROXJJtA6D9QWPSdj
 xOTVd7U/K/rEQAEjkoaJvy77kizFFDLOomP5CYe1NoMD+GkpvKrMkSp8l
 /2M5AwtED87XDgzmjGa2i8Cr3DnIwfgi2dKQQ0LzIY2kwU6UwaamhyEMD
 ZD6L8g/7FYiQ36Hko74KBQVg1NsCFPQWtDTeN6/qcosT1iF/4KhXDFf06
 cmnPQ5Zc/kJbYFqansVeRSVyLAGJiWH+Og3/Knp+WhZgs75vnn11TF08j g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="279489395"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="279489395"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="760235124"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v1 2/3] ui/gtk: Factor out tab window creation into a separate
 function
Date: Fri, 16 Sep 2022 17:07:30 -0700
Message-Id: <20220917000731.465003-3-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220917000731.465003-1-vivek.kasireddy@intel.com>
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Pull the code that creates a new window associated with a notebook
tab into a separate function. This new function can be useful not
just when user wants to detach a tab but also in the future when
a new window creation is needed in other scenarios.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 ui/gtk.c | 65 +++++++++++++++++++++++++++++++-------------------------
 1 file changed, 36 insertions(+), 29 deletions(-)

diff --git a/ui/gtk.c b/ui/gtk.c
index 0ff31cb852..945c550909 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1335,6 +1335,41 @@ static gboolean gd_win_grab(void *opaque)
     return TRUE;
 }
 
+static void gd_tab_window_create(VirtualConsole *vc)
+{
+    GtkDisplayState *s = vc->s;
+
+    gtk_widget_set_sensitive(vc->menu_item, false);
+    vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
+#if defined(CONFIG_OPENGL)
+    if (vc->gfx.esurface) {
+	eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+	vc->gfx.esurface = NULL;
+    }
+    if (vc->gfx.esurface) {
+	eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+	vc->gfx.ectx = NULL;
+    }
+#endif
+    gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
+
+    g_signal_connect(vc->window, "delete-event",
+		     G_CALLBACK(gd_tab_window_close), vc);
+    gtk_widget_show_all(vc->window);
+
+    if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
+	GtkAccelGroup *ag = gtk_accel_group_new();
+	gtk_window_add_accel_group(GTK_WINDOW(vc->window), ag);
+
+	GClosure *cb = g_cclosure_new_swap(G_CALLBACK(gd_win_grab),
+					   vc, NULL);
+	gtk_accel_group_connect(ag, GDK_KEY_g, HOTKEY_MODIFIERS, 0, cb);
+    }
+
+    gd_update_geometry_hints(vc);
+    gd_update_caption(s);
+}
+
 static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
@@ -1346,35 +1381,7 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
                                        FALSE);
     }
     if (!vc->window) {
-        gtk_widget_set_sensitive(vc->menu_item, false);
-        vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
-#if defined(CONFIG_OPENGL)
-        if (vc->gfx.esurface) {
-            eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
-            vc->gfx.esurface = NULL;
-        }
-        if (vc->gfx.esurface) {
-            eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
-            vc->gfx.ectx = NULL;
-        }
-#endif
-        gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
-
-        g_signal_connect(vc->window, "delete-event",
-                         G_CALLBACK(gd_tab_window_close), vc);
-        gtk_widget_show_all(vc->window);
-
-        if (qemu_console_is_graphic(vc->gfx.dcl.con)) {
-            GtkAccelGroup *ag = gtk_accel_group_new();
-            gtk_window_add_accel_group(GTK_WINDOW(vc->window), ag);
-
-            GClosure *cb = g_cclosure_new_swap(G_CALLBACK(gd_win_grab),
-                                               vc, NULL);
-            gtk_accel_group_connect(ag, GDK_KEY_g, HOTKEY_MODIFIERS, 0, cb);
-        }
-
-        gd_update_geometry_hints(vc);
-        gd_update_caption(s);
+        gd_tab_window_create(vc);
     }
 }
 
-- 
2.37.2


