Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E01D040EE4F
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 02:19:01 +0200 (CEST)
Received: from localhost ([::1]:35620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR1am-0005n2-Jn
	for lists+qemu-devel@lfdr.de; Thu, 16 Sep 2021 20:19:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1XX-0003Yu-UZ
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:39 -0400
Received: from mga03.intel.com ([134.134.136.65]:56724)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mR1XO-0002sS-FI
 for qemu-devel@nongnu.org; Thu, 16 Sep 2021 20:15:39 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10109"; a="222743996"
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="222743996"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2021 17:15:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,299,1624345200"; d="scan'208";a="434688342"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.202])
 by orsmga003.jf.intel.com with ESMTP; 16 Sep 2021 17:15:24 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/4] ui/gtk-egl: un-tab and re-tab should destroy egl surface
 and context
Date: Thu, 16 Sep 2021 17:13:17 -0700
Message-Id: <20210917001320.6515-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210917001320.6515-1-dongwon.kim@intel.com>
References: <20210917001320.6515-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=dongwon.kim@intel.com; helo=mga03.intel.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An old esurface should be destroyed and set to be NULL when doing
un-tab and re-tab so that a new esurface an context can be created
for the window widget that those will be bound to.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
---
 ui/gtk.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index b0564d80c1..92df3d4c5c 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1242,6 +1242,14 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
                                     vc->tab_item, vc->label);
     gtk_widget_destroy(vc->window);
     vc->window = NULL;
+    if (vc->gfx.esurface) {
+        eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+        vc->gfx.esurface = NULL;
+    }
+    if (vc->gfx.ectx) {
+        eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+        vc->gfx.ectx = NULL;
+    }
     return TRUE;
 }
 
@@ -1271,6 +1279,14 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
     if (!vc->window) {
         gtk_widget_set_sensitive(vc->menu_item, false);
         vc->window = gtk_window_new(GTK_WINDOW_TOPLEVEL);
+        if (vc->gfx.esurface) {
+            eglDestroySurface(qemu_egl_display, vc->gfx.esurface);
+            vc->gfx.esurface = NULL;
+        }
+        if (vc->gfx.esurface) {
+            eglDestroyContext(qemu_egl_display, vc->gfx.ectx);
+            vc->gfx.ectx = NULL;
+        }
         gd_widget_reparent(s->notebook, vc->window, vc->tab_item);
 
         g_signal_connect(vc->window, "delete-event",
-- 
2.17.1


