Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0A23BA66F
	for <lists+qemu-devel@lfdr.de>; Sat,  3 Jul 2021 02:31:31 +0200 (CEST)
Received: from localhost ([::1]:58206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzTZA-0006hc-UA
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 20:31:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lzTXV-0004gu-FQ
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 20:29:45 -0400
Received: from mga05.intel.com ([192.55.52.43]:55262)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1lzTXR-00057o-HO
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 20:29:44 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10033"; a="294440820"
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="294440820"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Jul 2021 17:29:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,320,1616482800"; d="scan'208";a="482953725"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by FMSMGA003.fm.intel.com with ESMTP; 02 Jul 2021 17:29:36 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] ui/gtk-egl: un-tab and re-tab should destroy egl surface
 and context
Date: Fri,  2 Jul 2021 17:28:07 -0700
Message-Id: <20210703002809.26753-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

An old esurface should be destroyed and set to be NULL when doing
un-tab and re-tab so that a new esurface an context can be created
for the window widget that those will be bound to.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
---
 ui/gtk.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..bfb95f3b4b 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -1232,6 +1232,14 @@ static gboolean gd_tab_window_close(GtkWidget *widget, GdkEvent *event,
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
 
@@ -1261,6 +1269,14 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
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


