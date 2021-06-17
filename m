Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FB93AA8F4
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:29:11 +0200 (CEST)
Received: from localhost ([::1]:43938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lthmI-00022W-2J
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:29:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33232)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lthlG-0001MK-8O
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:28:06 -0400
Received: from mga07.intel.com ([134.134.136.100]:21534)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lthlD-0007Ro-OD
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:28:05 -0400
IronPort-SDR: QUPSqHkmQVihud7DXTV+8u8YbQx3MM2cM65DT80z+LDe6H9UexoAgxAduJuz8Rn/07txwPlSn/
 dkE+aSnnZY2A==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="270139496"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="270139496"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:27:57 -0700
IronPort-SDR: W4s6TU8pVHkj1cw7b4M+5oOnjWwMqGisCVpHJ8dXlJDC2jWwwzCqFdCFlcYZnrYi7RPd5qm4Tr
 gGYMxxpy9KjA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="637692011"
Received: from pedgms.png.intel.com ([10.221.121.158])
 by fmsmga006.fm.intel.com with ESMTP; 16 Jun 2021 19:27:55 -0700
From: sweeaun <swee.aun.khor@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] ui/gtk: Allow user to select monitor number to display
 qemu in full screen through new gtk display option
Date: Thu, 17 Jun 2021 10:06:09 +0800
Message-Id: <20210617020609.18089-1-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.100;
 envelope-from=swee.aun.khor@intel.com; helo=mga07.intel.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) AC_FROM_MANY_DOTS=2.996, BAYES_00=-1.9,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: swee.aun.khor@intel.com, khairul.anuar.romli@intel.com, eblake@redhat.com,
 vivek.kasireddy@intel.com, armbru@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

 -display gtk,monitor=<value>

Signed-off-by: sweeaun <swee.aun.khor@intel.com>
---
 qapi/ui.json    |  4 +++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 15 +++++++++++++++
 3 files changed, 19 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..1616f3ffbd 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1035,13 +1035,15 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @monitor: Monitor number to display qemu in full screen.
 #
 # Since: 2.12
 #
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*monitor' : 'int' } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..e4b89b6a72 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "            [,window_close=on|off][,gl=on|core|es|off]\n"
 #endif
 #if defined(CONFIG_GTK)
-    "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
+    "-display gtk[,grab_on_hover=on|off][,gl=on|off][,monitor=<value>]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..84da126611 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2268,6 +2268,21 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
     gd_clipboard_init(s);
+
+    if (opts->u.gtk.has_monitor) {
+        int n_monitor;
+        n_monitor = gdk_display_get_n_monitors(window_display);
+
+        if ((opts->u.gtk.monitor <= n_monitor) &&
+            (opts->u.gtk.monitor > 0)) {
+            GdkScreen *gdk_screen;
+            gdk_screen = gdk_display_get_default_screen(window_display);
+            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window), gdk_screen,
+                                             (opts->u.gtk.monitor - 1));
+        } else {
+            fprintf(stderr, "Invalid GTK monitor argument\n");
+        }
+    }
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
-- 
2.24.3


