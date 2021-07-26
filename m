Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EDB3D6911
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Jul 2021 23:55:45 +0200 (CEST)
Received: from localhost ([::1]:42674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m88Zc-0004Tc-8U
	for lists+qemu-devel@lfdr.de; Mon, 26 Jul 2021 17:55:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39750)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m88YV-0002q9-Ri
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:54:35 -0400
Received: from mga18.intel.com ([134.134.136.126]:20211)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1m88YT-0001t6-69
 for qemu-devel@nongnu.org; Mon, 26 Jul 2021 17:54:35 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10057"; a="199551418"
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="199551418"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2021 14:54:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.84,272,1620716400"; d="scan'208";a="455897847"
Received: from dw-tiger-lake-client-platform.fm.intel.com ([10.105.205.215])
 by orsmga007.jf.intel.com with ESMTP; 26 Jul 2021 14:54:27 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] ui/gtk: detach_all option for making all VCs detached
 upon starting
Date: Mon, 26 Jul 2021 14:52:46 -0700
Message-Id: <20210726215246.26435-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210719214157.5863-1-dongwon.kim@intel.com>
References: <20210719214157.5863-1-dongwon.kim@intel.com>
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dongwon.kim@intel.com; helo=mga18.intel.com
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

With "detach-all=on" for display, all VCs are detached from the beginning.
This is useful when there are multiple displays assigned to a guest OS.

v2: Move "detach-all" option to under DisplayGTK as it's GTK specific
    (Thomas Huth)

Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Khairul Anuar Romli <khairul.anuar.romli@intel.com>
---
 qapi/ui.json | 5 ++++-
 ui/gtk.c     | 7 +++++++
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 1052ca9c38..e37af91683 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1035,13 +1035,16 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @detach-all:  Detach all VirtualConsoles when starting Qemu (default: off).
+#               Since 6.0
 #
 # Since: 2.12
 #
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*detach-all'    : 'bool'  } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/ui/gtk.c b/ui/gtk.c
index 98046f577b..48c1fff54f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2189,6 +2189,7 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GdkDisplay *window_display;
     GtkIconTheme *theme;
     char *dir;
+    int i;
 
     if (!gtkinit) {
         fprintf(stderr, "gtk initialization failed\n");
@@ -2268,6 +2269,12 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
     }
     gd_clipboard_init(s);
+
+    if (opts->u.gtk.detach_all) {
+        for (i = 0; i < s->nb_vcs - 1; i++) {
+            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
+        }
+    }
 }
 
 static void early_gtk_display_init(DisplayOptions *opts)
-- 
2.17.1


