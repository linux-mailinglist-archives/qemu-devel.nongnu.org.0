Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 02110560E70
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Jun 2022 03:00:15 +0200 (CEST)
Received: from localhost ([::1]:46456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o6iXW-0005LL-3M
	for lists+qemu-devel@lfdr.de; Wed, 29 Jun 2022 21:00:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37960)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o6iUv-0001R9-ER
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:57:33 -0400
Received: from mga17.intel.com ([192.55.52.151]:14897)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1o6iUt-0005gp-BS
 for qemu-devel@nongnu.org; Wed, 29 Jun 2022 20:57:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1656550651; x=1688086651;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8ANK1lrdY7RN0iRgbqACrYJbC0OlyXg5Q9O4zPsO0C0=;
 b=M9nRqtlopI/tPE2NCRA3z3gWyvQXamoLCbHIG/cR9VFc0ZC2Fau4aVqi
 jqDz9SJW68Xlua5Mmym+4moitSZh7WPVg+QBg6mcYGGxIvW1w8+kUfR3D
 NFbiL2TYzSs2qyiUakOXFidugRjgXd+Wp5FfqLGZ5WJxINOOYMmLUKg4z
 4asba5RDFYB1TXzLsXCD5OknHTqvfjIgYTK6Gc0W6IyN2hn7aV9/3Y2Uc
 R/ITFz/i3+5oC+xbQbaA/jN/PKsOdxkiQjwBkdnCNO1mj/B8Tz7MHyesn
 +7B/V7eKGei4/eVW4HFAkYZaNIOUmQKZm76BQ8T/nnr2fPMpeRQgUEtDi g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10393"; a="262611183"
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; d="scan'208";a="262611183"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Jun 2022 17:57:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,232,1650956400"; d="scan'208";a="693828128"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by fmsmga002.fm.intel.com with ESMTP; 29 Jun 2022 17:57:30 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH v3 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Date: Wed, 29 Jun 2022 17:51:41 -0700
Message-Id: <20220630005141.16680-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220630005141.16680-1-dongwon.kim@intel.com>
References: <20220630005141.16680-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=dongwon.kim@intel.com;
 helo=mga17.intel.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

New integer array parameter, 'monitor' is for specifying the target
monitors where individual GTK windows are placed upon launching.

Monitor numbers in the array are associated with virtual consoles
in the order of [VC0, VC1, VC2 ... VCn].

Every GTK window containing each VC will be placed in the region
of corresponding monitors.

Usage: -display gtk,monitor.<id of VC>=<target monitor>,..
       ex)-display gtk,monitor.0=1,monitor.1=0

v3: - Revised commit message
    - Rewrote desription of the new parameter (Markus Armbruster)
    - Replaced unnecessary 'for' loop with 'if' condition
      (Markus Armbruster)

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json    |  9 ++++++++-
 qemu-options.hx |  3 ++-
 ui/gtk.c        | 31 +++++++++++++++++++++++++++++--
 3 files changed, 39 insertions(+), 4 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 413371d5e8..7b4c098bb4 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1195,12 +1195,19 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @monitor:     Array of numbers, each of which represents physical
+#               monitor where GTK window containing a given VC will be
+#               placed. Each monitor number in the array will be
+#               associated with a virtual-console starting from VC0.
+#
+#               since 7.1
 #
 # Since: 2.12
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
-                '*zoom-to-fit'   : 'bool'  } }
+                '*zoom-to-fit'   : 'bool',
+                '*monitor'       : ['uint16']  } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 377d22fbd8..aabdfb0636 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1938,7 +1938,8 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,monitor.<id of VC>=<monitor number>][,show-cursor=on|off]"
+    "            [,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index e6878c3209..935176e614 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2316,6 +2316,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     GdkDisplay *window_display;
     GtkIconTheme *theme;
+    GtkWidget *win;
+    GdkRectangle dest;
+    uint16List *mon;
+    int n_mon;
     int i;
     char *dir;
 
@@ -2393,10 +2397,33 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
             gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
         }
     }
-    if (opts->has_full_screen &&
-        opts->full_screen) {
+
+    if (opts->u.gtk.has_monitor) {
+        i = 0;
+        n_mon = gdk_display_get_n_monitors(window_display);
+        for (mon = opts->u.gtk.monitor; mon; mon = mon->next) {
+            if (mon->value < n_mon && i < s->nb_vcs) {
+                win = s->vc[i].window ? s->vc[i].window : s->window;
+                if (opts->has_full_screen && opts->full_screen) {
+                    gtk_window_fullscreen_on_monitor(
+                        GTK_WINDOW(win),
+                        gdk_display_get_default_screen(window_display),
+                        mon->value);
+                } else {
+                    gdk_monitor_get_geometry(
+                        gdk_display_get_monitor(window_display, mon->value),
+                        &dest);
+                    gtk_window_move(GTK_WINDOW(win),
+                                    dest.x, dest.y);
+                }
+                i++;
+            }
+        }
+    } else if (opts->has_full_screen &&
+               opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
     }
+
     if (opts->u.gtk.has_grab_on_hover &&
         opts->u.gtk.grab_on_hover) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
-- 
2.20.1


