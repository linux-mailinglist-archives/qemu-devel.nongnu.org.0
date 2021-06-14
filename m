Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F5693A66F7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 14:49:52 +0200 (CEST)
Received: from localhost ([::1]:56272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsm2J-0002DP-JV
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 08:49:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lshwa-0001Mn-EG
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:27:40 -0400
Received: from mga17.intel.com ([192.55.52.151]:2077)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lshwY-00046l-Bb
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 04:27:39 -0400
IronPort-SDR: mvPbUiCtvoFg7O0EfKknxxuENRNwiFPmGBKrjILXr+9Hy+Kd6Y1mumWvAPabX1OH+EpcD98Kq7
 /ibKSKqfLXAw==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="186150029"
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="186150029"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 01:27:26 -0700
IronPort-SDR: pWCAoBbcHlrMXjqHVgpRYfWgt+gZLQ8Z4hCLYzpo2+E6RqBl7svH4jUIFCeS7vlchmhRTOMyML
 ecnWXf0+RP3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,272,1616482800"; d="scan'208";a="636719413"
Received: from pedgms.png.intel.com ([10.221.121.158])
 by fmsmga006.fm.intel.com with ESMTP; 14 Jun 2021 01:27:25 -0700
From: sweeaun <swee.aun.khor@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: Allow user to select monitor number to display qemu
 in full screen through new gtk display option
Date: Mon, 14 Jun 2021 16:05:42 +0800
Message-Id: <20210614080542.5905-1-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=swee.aun.khor@intel.com; helo=mga17.intel.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 14 Jun 2021 08:48:03 -0400
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
Cc: swee.aun.khor@intel.com, khairul.anuar.romli@intel.com,
 vivek.kasireddy@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 -display gtk,monitor-num=<value>

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 qapi/ui.json    |  3 ++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 15 +++++++++++++++
 3 files changed, 18 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..c3363c7ad5 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1041,7 +1041,8 @@
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+		'*monitor-num' : 'int' } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..6bd524c8c2 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "            [,window_close=on|off][,gl=on|core|es|off]\n"
 #endif
 #if defined(CONFIG_GTK)
-    "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
+    "-display gtk[,grab_on_hover=on|off][,gl=on|off][,monitor-num=<value>]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..0716b3abbc 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2268,6 +2268,21 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
     gd_clipboard_init(s);
+
+    if (opts->u.gtk.has_monitor_num) {
+        int n_monitor;
+        n_monitor = gdk_display_get_n_monitors(window_display);
+
+        if ((opts->u.gtk.monitor_num <= n_monitor) &&
+            (opts->u.gtk.monitor_num > 0)) {
+            GdkScreen *gdk_screen;
+            gdk_screen = gdk_display_get_default_screen(window_display);
+            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_screen,
+                                             (opts->u.gtk.monitor_num - 1));
+        } else {
+            fprintf(stderr, "Invalid GTK monitor-num argument\n");
+        }
+    }
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
-- 
2.24.3


