Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A602A513EF7
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:18:11 +0200 (CEST)
Received: from localhost ([::1]:47934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDOk-0006C2-Q8
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:18:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNU-0004TV-JL
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:57367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNR-0007hA-Ka
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651187809; x=1682723809;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bvgntPgi5PNZ9KMn1hCz7dObNdZfyMNO/RM6gVV+Fa4=;
 b=f3t2H7BNaaQMxuK5O0H/MrVPChuFHH5BzLhM70AfFy3anlB2kJLInOVB
 Th9Apd3CagZgtsqkUIIk+8kmtDPDWr3fpNbmGGzOIiEuRmdsjrdXFmiTw
 +nUo11+oIVrigXTaJbtI6omZiQQRSIZsg1ixVoWVvBNZiuARLEDDeeaHk
 fvR2m6WoE5R5z/ESJxF0chzZGOrHAlEynpzERjn34zE4rNC6a7asu5Lqj
 oz5B4I1Mpm6ianK6AY6h5UuITMkk50X+/URES9OnqMXhA6tivuy1VRXc7
 A5OnjY3lmTPD+rhyeUhRsvKwqr/V1u5JWEfcJ2prWe7AvYVf1/+8TYHxj A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="352887474"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="352887474"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 16:16:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="731758635"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 16:16:42 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org, dongwon.kim@intel.com, philmd@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: [PATCH 1/3] ui/gtk: new param monitor to specify target monitor for
 launching QEMU
Date: Thu, 28 Apr 2022 16:13:02 -0700
Message-Id: <20220428231304.19472-2-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220428231304.19472-1-dongwon.kim@intel.com>
References: <20220428231304.19472-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=dongwon.kim@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
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

v3: updated Since version to 7.1 for monitor parameter

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json    | 6 +++++-
 qemu-options.hx | 2 +-
 ui/gtk.c        | 8 ++++++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 059302a5ef..ddcea7349b 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1204,13 +1204,17 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @monitor:     Indicate monitor where QEMU window is lauched. monitor
+#               could be any number from 0 to (total num of monitors - 1).
+#               since 7.1
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
index 5f69b94b8e..dbf9b223dd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1908,7 +1908,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,monitor=<value>][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index c57c36749e..d9971d65ac 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2375,6 +2375,14 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
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


