Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6815F5397F7
	for <lists+qemu-devel@lfdr.de>; Tue, 31 May 2022 22:32:09 +0200 (CEST)
Received: from localhost ([::1]:48534 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nw8XA-0005MH-EG
	for lists+qemu-devel@lfdr.de; Tue, 31 May 2022 16:32:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39868)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Ts-0002uA-OY
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:28:44 -0400
Received: from mga02.intel.com ([134.134.136.20]:3289)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nw8Tq-0000Ag-Vo
 for qemu-devel@nongnu.org; Tue, 31 May 2022 16:28:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654028922; x=1685564922;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tRxRjWlo8SJYepvcZxLZ4wGw3OmNEluPn5ksCiJ9wUg=;
 b=DywqP0/8GLWtkAdMdjVCVxBlaE3BbZjdNV6rJtNTgotH32GHjRQmw9Oa
 hCBMSxMPVwbby3jr+MqCUSCRCxTKzJspqqKyq2eDqDHwkuL2XAf+jHiK+
 kNQld7lgZlWh20l97z9n/PQWj1X9S+OO0Qt2Nzu83GtEj4emXEsyvB3Gp
 SzyYDdDauc8rfbUw5TVrAphrGi9zxeGjJ8nZB6FOJCeiABfYEGfc+lmm1
 YvqX/aJcEPFpI119u130ko1msu6C5eyZwAM/RK+OM4R0zx5EcoiWtz81w
 LihqS2g5zEzMjo6p0dVbhEHr1XQI1yT5XMumMqYFY7/sHsGOrNvnBJVlo g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10364"; a="263010887"
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="263010887"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2022 13:28:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,266,1647327600"; d="scan'208";a="611998608"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga001.jf.intel.com with ESMTP; 31 May 2022 13:28:37 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org
Cc: Dongwon Kim <dongwon.kim@intel.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>
Subject: [PATCH 2/2] ui/gtk: a new array param monitor to specify the target
 displays
Date: Tue, 31 May 2022 13:23:27 -0700
Message-Id: <20220531202327.14636-3-dongwon.kim@intel.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20220531202327.14636-1-dongwon.kim@intel.com>
References: <20220531202327.14636-1-dongwon.kim@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.20;
 envelope-from=dongwon.kim@intel.com; helo=mga02.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
displays where individual QEMU windows are placed upon launching.

The array contains a series of numbers representing the monitor where
QEMU windows are placed.

Numbers in the array are mapped to QEMU windows like,

[1st detached window, 2nd detached window,.... Main window]

Usage example: -display gtk,monitor.0=0,monitor.1=1.....

Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json    |  7 ++++++-
 qemu-options.hx |  2 +-
 ui/gtk.c        | 32 +++++++++++++++++++++++++++++++-
 3 files changed, 38 insertions(+), 3 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 11a827d10f..94546cfe84 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1195,12 +1195,17 @@
 #               assuming the guest will resize the display to match
 #               the window size then.  Otherwise it defaults to "off".
 #               Since 3.1
+# @monitor:     Array of numbers, each of which represents physical
+#               monitor where individual QEMU window is placed in case
+#               there are multiple of them
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
index a664baaa18..c2523ae0da 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1943,7 +1943,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
-    "            [,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,monitor.<order>=<value>][,show-cursor=on|off][,window-close=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index abfcf48547..fcd0e08c16 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2304,6 +2304,10 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GtkDisplayState *s = g_malloc0(sizeof(*s));
     GdkDisplay *window_display;
     GtkIconTheme *theme;
+    GtkWidget *win;
+    GdkRectangle dest;
+    uint16List *mon;
+    int n_mon;
     int n_gfx_vcs = 0;
     int i;
     char *dir;
@@ -2384,7 +2388,33 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
             n_gfx_vcs++;
         }
     }
-    if (opts->has_full_screen &&
+    if (opts->u.gtk.has_monitor) {
+        i = 0;
+        n_mon = gdk_display_get_n_monitors(window_display);
+        for (mon = opts->u.gtk.monitor; mon; mon = mon->next) {
+            if (mon->value < n_mon) {
+                for (; i < s->nb_vcs; i++) {
+                    win = s->vc[i].window ? s->vc[i].window : s->window;
+                    if (opts->has_full_screen && opts->full_screen) {
+                        gtk_window_fullscreen_on_monitor(
+                            GTK_WINDOW(win),
+                            gdk_display_get_default_screen(window_display),
+                            mon->value);
+                    } else {
+                        gdk_monitor_get_geometry(
+                            gdk_display_get_monitor(window_display, mon->value),
+                            &dest);
+                        gtk_window_move(GTK_WINDOW(win),
+                                        dest.x, dest.y);
+                    }
+                    i++;
+                    break;
+                }
+            }
+        }
+    }
+    if (!opts->u.gtk.has_monitor &&
+        opts->has_full_screen &&
         opts->full_screen) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
     }
-- 
2.30.2


