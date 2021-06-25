Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C90063B3FC1
	for <lists+qemu-devel@lfdr.de>; Fri, 25 Jun 2021 10:50:12 +0200 (CEST)
Received: from localhost ([::1]:39532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lwhXP-0006V3-SC
	for lists+qemu-devel@lfdr.de; Fri, 25 Jun 2021 04:50:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwhV1-0003l7-Vt
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:47:43 -0400
Received: from mga03.intel.com ([134.134.136.65]:10653)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <swee.aun.khor@intel.com>)
 id 1lwhUy-00077s-2C
 for qemu-devel@nongnu.org; Fri, 25 Jun 2021 04:47:43 -0400
IronPort-SDR: EU1cN6WXidOEvwo1yzQE+MZxXfRctGKR+eh30biH0E7I/TEoQk11e/JpH63oZhfh4hrqxkOTVm
 TvPk0nIBRAtw==
X-IronPort-AV: E=McAfee;i="6200,9189,10025"; a="207670445"
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="207670445"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Jun 2021 01:47:29 -0700
IronPort-SDR: FpdJfFDN40hMHhqijXtD2Re1ATPGJ+wXrnLGfJjBdLgVXLoGJ0OTf4y2d45RHPk4/qAya/6L6t
 7by6YJTE0Uww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,298,1616482800"; d="scan'208";a="474812697"
Received: from pedgms.png.intel.com ([10.221.121.150])
 by fmsmga004.fm.intel.com with ESMTP; 25 Jun 2021 01:47:27 -0700
From: "Khor, Swee Aun" <swee.aun.khor@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5] ui/gtk: New -display gtk option 'full-screen-on-monitor'.
Date: Fri, 25 Jun 2021 16:24:32 +0800
Message-Id: <20210625082432.55842-1-swee.aun.khor@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.65;
 envelope-from=swee.aun.khor@intel.com; helo=mga03.intel.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) AC_FROM_MANY_DOTS=2.519, BAYES_00=-1.9,
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
Cc: swee.aun.khor@intel.com, khairul.anuar.romli@intel.com,
 Hazwan.Arif.Mazlan@intel.com, vivek.kasireddy@intel.com, armbru@redhat.com,
 kraxel@redhat.com, eblake@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This lets user select monitor number to display QEMU in full screen
with -display gtk,full-screen-on-monitor=<value>.

v2:
 - https://patchew.org/QEMU/20210617020609.18089-1-swee.aun.khor@intel.com/.
 - Added documentation for new member.
 - Renamed member name from monitor-num to monitor.

v3:
- Changed commit message subject.
- Cleaned up signed-off format.
- Renamed member name from monitor to full-screen-on-monitor to make clear this option automatically enables full screen.
- Added more detail documentation to specify full-screen-on-monitor option index started from 1.
- Added code to check windows has been launched successfully at specified monitor.

v4:
- Used PRId64 format specifier for int64_t variable in warn_report().

v5:
- Removed gdk_screen and gdk_monitor variables as it used once only.
- Fixed issue where v3 and v4 doesn't showing up in https://patchew.org/QEMU/.

Signed-off-by: Khor Swee Aun <swee.aun.khor@intel.com>
---
 qapi/ui.json    | 10 +++++++---
 qemu-options.hx |  2 +-
 ui/gtk.c        | 30 ++++++++++++++++++++++++++++++
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..d775c29534 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1035,13 +1035,17 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
-#
+# @full-screen-on-monitor: Monitor number to display QEMU in full screen.
+#                          Monitor number started from index 1. If total number
+#                          of monitors is 3, possible values for this option are
+#                          1, 2 or 3.
 # Since: 2.12
 #
 ##
 { 'struct'  : 'DisplayGTK',
-  'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+  'data'    : { '*grab-on-hover'          : 'bool',
+                '*zoom-to-fit'            : 'bool',
+                '*full-screen-on-monitor' : 'int' } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 14258784b3..29836db663 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1787,7 +1787,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
     "            [,window_close=on|off][,gl=on|core|es|off]\n"
 #endif
 #if defined(CONFIG_GTK)
-    "-display gtk[,grab_on_hover=on|off][,gl=on|off]|\n"
+    "-display gtk[,grab-on-hover=on|off][,gl=on|off][,full-screen-on-monitor=<value>]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..4da904a024 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2189,6 +2189,8 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GdkDisplay *window_display;
     GtkIconTheme *theme;
     char *dir;
+    int monitor_n;
+    bool monitor_status = false;
 
     if (!gtkinit) {
         fprintf(stderr, "gtk initialization failed\n");
@@ -2268,6 +2270,34 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
     gd_clipboard_init(s);
+
+    if (opts->u.gtk.has_full_screen_on_monitor) {
+        monitor_n = gdk_display_get_n_monitors(window_display);
+
+        if (opts->u.gtk.full_screen_on_monitor <= monitor_n &&
+            opts->u.gtk.full_screen_on_monitor > 0) {
+            gtk_window_fullscreen_on_monitor(GTK_WINDOW(s->window),
+                gdk_display_get_default_screen(window_display),
+                opts->u.gtk.full_screen_on_monitor - 1);
+
+            if (gdk_display_get_monitor(window_display,
+                                        opts->u.gtk.full_screen_on_monitor
+                                        - 1) != NULL) {
+                monitor_status = true;
+            }
+        }
+        if (monitor_status == false) {
+            /*
+             * Calling GDK API to read the number of monitors again in case
+             * monitor added or removed since last read.
+             */
+            monitor_n = gdk_display_get_n_monitors(window_display);
+            warn_report("Failed to enable full screen on monitor %" PRId64 ". "
+                        "Current total number of monitors is %d, "
+                        "please verify full-screen-on-monitor option value.",
+                        opts->u.gtk.full_screen_on_monitor, monitor_n);
+        }
+    }
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
-- 
2.24.3


