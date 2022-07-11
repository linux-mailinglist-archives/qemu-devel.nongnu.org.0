Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52D11570E6E
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jul 2022 01:51:57 +0200 (CEST)
Received: from localhost ([::1]:53940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oB3C0-0006kJ-D0
	for lists+qemu-devel@lfdr.de; Mon, 11 Jul 2022 19:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oB37Y-0002Ks-Le
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:47:20 -0400
Received: from mga18.intel.com ([134.134.136.126]:53563)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1oB37W-0003wX-EB
 for qemu-devel@nongnu.org; Mon, 11 Jul 2022 19:47:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1657583238; x=1689119238;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=V+7PTKQ8m4pcVDRJPFwCzzAfBycw9fEs+LjqDgV0ybU=;
 b=DqtNqYsZY8F+7HfGpJuu+YLt6GrJrpsaClXfJ1v2z8FNRVgUsBVrlm+a
 LrEQYTWgH7Hk/6Qp4S971Nxbf67pLEjowB9aPQz5a/LKStkIYOVi+W1Jp
 iiwgGTXvY0jonnzPzFmDLvEesB1jaEt6oB3vEeDd1co21jKEgLGnVSz4I
 sKO9Qbb0kYqUEfsb2L6u31plg35N8vJvOf2Cpvz4Q24tB5jRcfTXoJvaz
 FvQIZ1qPpo6Arx5LwnuYtA2iEmHQ3cpMdZ4KabKJAc4YUcfD3HvhlzrGG
 qbPSRQkXivE92SEXtGIF1N6oI9aHdrYKnFQ2KtQVdwSbrRPuwgELF2S3a A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10405"; a="267836263"
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="267836263"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Jul 2022 16:47:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,264,1650956400"; d="scan'208";a="569973005"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga006.jf.intel.com with ESMTP; 11 Jul 2022 16:47:16 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, berrange@redhat.com, kraxel@redhat.com,
 pbonzini@redhat.com, f4bug@amsat.org, vivek.kasireddy@intel.com,
 Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v4 2/2] ui/gtk: a new array param monitor to specify the
 target displays
Date: Mon, 11 Jul 2022 16:39:59 -0700
Message-Id: <20220711233959.32219-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220711233959.32219-1-dongwon.kim@intel.com>
References: <20220711233959.32219-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=dongwon.kim@intel.com; helo=mga18.intel.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
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

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json    |  9 ++++++++-
 qemu-options.hx |  3 ++-
 ui/gtk.c        | 30 ++++++++++++++++++++++++++++--
 3 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 413371d5e8..ee0f9244ef 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1195,12 +1195,19 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @monitor:     Array of numbers, each of which represents physical
+#               monitor where GTK window containing a given VC will be
+#               placed. Each monitor number in the array will be
+#               associated with a virtual console starting from VC0.
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
index e6878c3209..598ab4970f 100644
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
 
@@ -2393,10 +2397,32 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
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
+                if (opts->full_screen) {
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
+    } else if (opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
     }
+
     if (opts->u.gtk.has_grab_on_hover &&
         opts->u.gtk.grab_on_hover) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->grab_on_hover_item));
-- 
2.30.2


