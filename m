Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB873CEE89
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Jul 2021 23:45:55 +0200 (CEST)
Received: from localhost ([::1]:37962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m5b5G-00025p-7R
	for lists+qemu-devel@lfdr.de; Mon, 19 Jul 2021 17:45:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35100)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5b3H-0000mb-LV
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:43:51 -0400
Received: from mga12.intel.com ([192.55.52.136]:65076)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m5b3F-0005qj-Bb
 for qemu-devel@nongnu.org; Mon, 19 Jul 2021 17:43:50 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10050"; a="190722725"
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="190722725"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Jul 2021 14:43:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,253,1620716400"; d="scan'208";a="657044416"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by fmsmga006.fm.intel.com with ESMTP; 19 Jul 2021 14:43:45 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/2] ui/gtk: detach_all option for making all VCs detached
 upon starting
Date: Mon, 19 Jul 2021 14:41:56 -0700
Message-Id: <20210719214157.5863-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
Received-SPF: pass client-ip=192.55.52.136; envelope-from=dongwon.kim@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

With "detach-all=on" for display, all VCs are detached from the beginning.
This is useful when there are multiple displays assigned to a guest OS.

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
---
 qapi/ui.json | 4 +++-
 ui/gtk.c     | 7 +++++++
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..ff14bb2f46 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1141,6 +1141,7 @@
 # @show-cursor:   Force showing the mouse cursor (default: off).
 #                 (since: 5.0)
 # @gl:            Enable OpenGL support (default: off).
+# @detach-all:    Detatch all VirtualConsoles from beginning (default: off).
 #
 # Since: 2.12
 #
@@ -1150,7 +1151,8 @@
                 '*full-screen'   : 'bool',
                 '*window-close'  : 'bool',
                 '*show-cursor'   : 'bool',
-                '*gl'            : 'DisplayGLMode' },
+                '*gl'            : 'DisplayGLMode',
+                '*detach-all'    : 'bool' },
   'discriminator' : 'type',
   'data'    : { 'gtk'            : 'DisplayGTK',
                 'curses'         : 'DisplayCurses',
diff --git a/ui/gtk.c b/ui/gtk.c
index ce885d2ca3..a07e5a049e 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2211,6 +2211,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GdkDisplay *window_display;
     GtkIconTheme *theme;
     char *dir;
+    int i;
 
     if (!gtkinit) {
         fprintf(stderr, "gtk initialization failed\n");
@@ -2290,6 +2291,12 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
     gd_clipboard_init(s);
+
+    if (opts->detach_all) {
+        for (i = 0; i < s->nb_vcs - 1; i++) {
+            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
+        }
+    }
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
-- 
2.17.1


