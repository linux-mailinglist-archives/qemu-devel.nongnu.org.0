Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 860CC456656
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 00:17:26 +0100 (CET)
Received: from localhost ([::1]:54362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnqej-0004Qd-5n
	for lists+qemu-devel@lfdr.de; Thu, 18 Nov 2021 18:17:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mnqco-0002oe-Fk
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 18:15:26 -0500
Received: from mga18.intel.com ([134.134.136.126]:15303)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1mnqcl-0002bj-Jo
 for qemu-devel@nongnu.org; Thu, 18 Nov 2021 18:15:26 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10172"; a="221191269"
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="221191269"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Nov 2021 15:15:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,246,1631602800"; d="scan'208";a="593973590"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga002.fm.intel.com with ESMTP; 18 Nov 2021 15:15:17 -0800
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] ui/gtk: mon_num parameter to specify target monitor for
 launching Qemu
Date: Thu, 18 Nov 2021 14:51:27 -0800
Message-Id: <20211118225127.26147-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dongwon.kim@intel.com; helo=mga18.intel.com
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
Cc: sweeaun <swee.aun.khor@intel.com>,
 Khairul Anuar Romli <khairul.anuar.romli@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing a new integer parameter to specify the monitor where the
Qemu window is placed upon launching.

Monitor index can start from 0 to (total number of monitors - 1).
Default value for the parameter is -1, which doesn't affect anything.

It can be used together with full-screen=on, which will make the Qemu
window full-screened on the targetted monitor.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: sweeaun <swee.aun.khor@intel.com>
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 10 ++++++++++
 3 files changed, 17 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index d7567ac866..7552b503b2 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1099,13 +1099,18 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @mon-num:     Indicate monitor where Qemu window is lauched. mon-num
+#               could be any number from -1 to (total num of monitors - 1).
+#               (default: -1: use default monitor)
+#               since 6.2
 #
 # Since: 2.12
 #
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*mon-num'       : 'int' } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 7749f59300..7a888b16b1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1852,7 +1852,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,mon-num=<value>][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index d2892ea6b4..8d8aa55822 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2314,6 +2314,16 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
                              vc && vc->type == GD_VC_VTE);
 #endif
 
+    if (opts->u.gtk.has_mon_num && opts->u.gtk.mon_num &&
+        opts->u.gtk.mon_num >= 0) {
+        GdkRectangle mon_dest;
+        if (opts->u.gtk.mon_num < gdk_display_get_n_monitors(window_display)) {
+            gdk_monitor_get_geometry(
+                gdk_display_get_monitor(window_display, opts->u.gtk.mon_num),
+                &mon_dest);
+            gtk_window_move(GTK_WINDOW(s->window), mon_dest.x, mon_dest.y);
+        }
+    }
     if (opts->has_full_screen &&
         opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
-- 
2.30.2


