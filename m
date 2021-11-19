Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02ECF4577C9
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 21:36:48 +0100 (CET)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1moAcp-0006Yb-7D
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 15:36:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51884)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1moAb5-0005pR-Oc
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:35:00 -0500
Received: from mga11.intel.com ([192.55.52.93]:43064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1moAay-0008Ly-Q1
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 15:34:56 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10173"; a="231971132"
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="231971132"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Nov 2021 12:34:47 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,248,1631602800"; d="scan'208";a="737354359"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga006.fm.intel.com with ESMTP; 19 Nov 2021 12:34:46 -0800
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] ui/gtk: new param monitor to specify target monitor for
 launching QEMU
Date: Fri, 19 Nov 2021 12:10:57 -0800
Message-Id: <20211119201057.22297-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211118225127.26147-1-dongwon.kim@intel.com>
References: <20211118225127.26147-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.93; envelope-from=dongwon.kim@intel.com;
 helo=mga11.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
 Dongwon Kim <dongwon.kim@intel.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing a new integer parameter to specify the monitor where the
Qemu window is placed upon launching.

Monitor can be any number between 0 and (total number of monitors - 1).

It can be used together with full-screen=on, which will make the QEMU
window full-screened on the targeted monitor.

v2: fixed typos and updated commit subject and msg
    (Philippe Mathieu-Daudé)

    changed param name to monitor, removed unnecessary condition check
    on the parameter
    (Paolo Bonzini)

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Cc: sweeaun <swee.aun.khor@intel.com>
Cc: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json    | 6 +++++-
 qemu-options.hx | 2 +-
 ui/gtk.c        | 8 ++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index d7567ac866..9dc1ad284f 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1099,13 +1099,17 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @monitor:     Indicate monitor where QEMU window is lauched. monitor
+#               could be any number from 0 to (total num of monitors - 1).
+#               since 7.0
 #
 # Since: 2.12
 #
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*monitor'       : 'uint32' } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 7749f59300..6d062b8aa1 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1852,7 +1852,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,monitor=<value>][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index d2892ea6b4..7abe1a69d8 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2314,6 +2314,14 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
                              vc && vc->type == GD_VC_VTE);
 #endif
 
+    if (opts->u.gtk.has_monitor &&
+        opts->u.gtk.monitor < gdk_display_get_n_monitors(window_display)) {
+        GdkRectangle mon_dest;
+        gdk_monitor_get_geometry(
+            gdk_display_get_monitor(window_display, opts->u.gtk.monitor),
+            &mon_dest);
+        gtk_window_move(GTK_WINDOW(s->window), mon_dest.x, mon_dest.y);
+    }
     if (opts->has_full_screen &&
         opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
-- 
2.30.2


