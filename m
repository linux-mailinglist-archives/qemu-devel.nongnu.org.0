Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91004ACC0C
	for <lists+qemu-devel@lfdr.de>; Mon,  7 Feb 2022 23:28:13 +0100 (CET)
Received: from localhost ([::1]:53816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHCUW-0005ca-DO
	for lists+qemu-devel@lfdr.de; Mon, 07 Feb 2022 17:28:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nHCRY-0004Rf-Ea
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:25:08 -0500
Received: from mga18.intel.com ([134.134.136.126]:34272)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nHCRV-0003Bz-5E
 for qemu-devel@nongnu.org; Mon, 07 Feb 2022 17:25:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1644272705; x=1675808705;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=T6sHHrxgmDqB7HmKtRbkFoL1xVQ95FBmVxJ4k+0EECM=;
 b=POdHpW1b4KuFvFvdr4iOvkCPamzg69soqPheduozRuNWAmih8pjKh01B
 JpLyWvYl2LJRETi1ZyCprnadFQ8oVOCSRUVibk+nN8fekgvghtOtw+f8u
 0rxGgj1IE3j+GnZfjd7edJVJSiklcZnie/WHSpD4E8gjTrt3xxgMnUu0f
 7hJIP+H/r3DaThn+siV8bXBYDCFE72+Png3usnOXaObyPrFUeVIOcZ9UN
 ge/De2mGEc4EzX0U+Lu7MC1OAMoBX+sfmyr7BECwlG61InSZFvsueJUWt
 gzULDuA5B7roPYNtlGllnk2HRJYb/JN9r7860wcXpYdQ/MXqI4NAY7FBS g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10251"; a="232387253"
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="232387253"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2022 14:24:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,351,1635231600"; d="scan'208";a="536361980"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga007.fm.intel.com with ESMTP; 07 Feb 2022 14:24:59 -0800
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/5] ui/gtk: new param monitor to specify target monitor for
 launching QEMU
Date: Mon,  7 Feb 2022 14:24:55 -0800
Message-Id: <20220207222455.11449-1-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dongwon.kim@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
 Khairul Anuar Romli <khairul.anuar.romli@intel.com>, dongwon.kim@intel.com,
 Klaus Kiwi <kkiwi@redhat.com>, Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
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
Cc: Klaus Kiwi <kkiwi@redhat.com>
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
index d7567ac866..c2c677bb1c 100644
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


