Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BD7C762EBA5
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:06:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqkq-0007sE-SA; Thu, 17 Nov 2022 21:05:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkn-0007rI-4t
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:17 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkk-0008UF-K3
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737114; x=1700273114;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=zZ8y1d1FbFTlcvDvNWsNgEr/73NLZ1JW9us3UExtaEI=;
 b=M31wLLlzaaSrwVqyUxMwLlJnmmE5p9B9WErrCboygoPLup/xiWFBcdNb
 47wuvAQcMIUXhFaBNGX9u/OvaYNAPpLcTtiQuMUDYKjMi378e7csRWuZi
 avcXc8C8H7zeGu0kQFG2Q3G+zDsC32R2Va1AfNZsiHIQpp4TUseLQ0Wxe
 59HJIUt4en9vfAO+H58CMal31mg8FFU5e5xNMFrvA0C6z04QIDNvrKN6W
 ZNNhYUgLg7XLS6ApiBkg0aedforv2J7KBGDm3gguV0RyVMraN8Bh5li/S
 OeSNhM+KrlJkLo4uD3TtkRiOG1K112Evu8gzS2oO90rFJUQDiQgKHfVhr g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393530"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393530"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270868"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270868"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v2 5/6] ui/gtk: Factor out tab window creation into a separate
 function
Date: Thu, 17 Nov 2022 17:44:25 -0800
Message-Id: <20221118014426.182599-6-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118014426.182599-1-vivek.kasireddy@intel.com>
References: <20221118014426.182599-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 4ac3655694..6b0369e3ed 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1400,6 +1400,41 @@ static gboolean gd_win_grab(void *opaque)
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
@@ -1411,35 +1446,7 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
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


