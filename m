Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F54444F99
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Nov 2021 08:21:26 +0100 (CET)
Received: from localhost ([::1]:51718 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1miX3t-0003m0-Su
	for lists+qemu-devel@lfdr.de; Thu, 04 Nov 2021 03:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56832)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1miWyg-0004dI-T1
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:16:02 -0400
Received: from mga17.intel.com ([192.55.52.151]:65404)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1miWyb-0000gF-EI
 for qemu-devel@nongnu.org; Thu, 04 Nov 2021 03:16:02 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10157"; a="212405211"
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="212405211"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Nov 2021 00:15:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,208,1631602800"; d="scan'208";a="639171347"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga001.fm.intel.com with ESMTP; 04 Nov 2021 00:15:48 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/6] ui/gtk-egl: un-tab and re-tab should destroy egl
 surface and context
Date: Wed,  3 Nov 2021 23:51:48 -0700
Message-Id: <20211104065153.28897-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
References: <20211103053937.on4dg37wmkx2f2t5@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dongwon.kim@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An old esurface should be destroyed and set to be NULL when doing
un-tab and re-tab so that a new esurface an context can be created
for the window widget that those will be bound to.

v2: enabling opengl specific routines only when CONFIG_OPENGL is set

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
---
 ui/gtk.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index b0564d80c1..8da673c18c 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1242,6 +1242,16 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
                                     vc->tab_item, vc->label);
     gtk_widget_destroy(vc->window);
     vc->window = NULL;
+#if defined(CONFIG_OPENGL)
+    if (vc->gfx.esurface) {
+        eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+        vc->gfx.esurface = NULL;
+    }
+    if (vc->gfx.ectx) {
+        eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+        vc->gfx.ectx = NULL;
+    }
+#endif
     return TRUE;
 }
 
@@ -1271,6 +1281,16 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
     if (!vc->window) {
         gtk_widget_set_sensitive(vc->menu_item, false);
         vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
+#if defined(CONFIG_OPENGL)
+        if (vc->gfx.esurface) {
+            eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+            vc->gfx.esurface = NULL;
+        }
+        if (vc->gfx.esurface) {
+            eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+            vc->gfx.ectx = NULL;
+        }
+#endif
         gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
 
         g_signal_connect(vc->window, "delete-event",
-- 
2.30.2


