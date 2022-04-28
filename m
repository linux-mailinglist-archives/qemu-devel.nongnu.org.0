Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2747513F01
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 01:23:14 +0200 (CEST)
Received: from localhost ([::1]:60510 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkDTd-0006Jb-Ta
	for lists+qemu-devel@lfdr.de; Thu, 28 Apr 2022 19:23:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNW-0004Tn-Ky
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:54 -0400
Received: from mga05.intel.com ([192.55.52.43]:57365)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dongwon.kim@intel.com>)
 id 1nkDNU-0007gu-Fm
 for qemu-devel@nongnu.org; Thu, 28 Apr 2022 19:16:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651187812; x=1682723812;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6gIEvtZ3DZc5Fy391n3vPfgueX5FKYs9eaL9PsfJz80=;
 b=a4FNdynYEv3EV+lbUyQDvX78E6PwjxXUpukhQFVmxs/ghYCV2kZthCU3
 c0hYGFbfAdWkkMvglHL57MshZ+y617FrNjZ6x4i6161MOPhKUHgRQKlMC
 5nixP/XwuB5KQ6rcjPFuWZ8WjYDuiXirpBdC+79XGMN+ULBY8SwQSh/nM
 9chl21/Aed6fqkYfO0x0WcIyGGLaqifH/hzfku7txUPIG26alxKPNOxBG
 VHb9E2h4h7CaLE8mlem1KhWpsgM7nr+SLdESYO50MRFRPB6hSDwV1VRlT
 fay/7tTPSMOYayy5mWmo2HsKZHO3JvokHgoZTsGo746nzXwsWFk8KhhOH g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10331"; a="352887476"
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="352887476"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Apr 2022 16:16:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,296,1647327600"; d="scan'208";a="731758641"
Received: from dongwonk-z390-aorus-ultra-intel-gfx.fm.intel.com
 ([10.105.129.122])
 by orsmga005.jf.intel.com with ESMTP; 28 Apr 2022 16:16:43 -0700
From: Dongwon Kim <dongwon.kim@intel.com>
To: qemu-devel@nongnu.org, dongwon.kim@intel.com, philmd@redhat.com,
 kraxel@redhat.com, pbonzini@redhat.com
Subject: [PATCH 2/3] ui/gtk: detach_all option for making all VCs detached
 upon starting
Date: Thu, 28 Apr 2022 16:13:03 -0700
Message-Id: <20220428231304.19472-3-dongwon.kim@intel.com>
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

With "detach-all=on" for display, QEMU starts with all VC windows
detached automatically.

If used with "full-screen=on", it places individual windows (from
top window) starting from monitor 0 or monitor n in case monitor=n.

In case # mon < # VCs, only same number of VCs as # mon will be sent to
the monitors for full-screen while others are remaining in windowed-mode.

Target monitor number for individual VC is rotated in case monitor=n
(n != 0) (e.g. if monitor=1 and # VCs = 2, the top window will be
full-screened on monitor 1 and top second window will be full-screened
on monitor 0.)

v2: update Since version to 7.1

Cc: Philippe Mathieu-Daudé <philmd@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Signed-off-by: Dongwon Kim <dongwon.kim@intel.com>
---
 qapi/ui.json |  5 ++++-
 ui/gtk.c     | 47 ++++++++++++++++++++++++++++++++++++++++++++---
 2 files changed, 48 insertions(+), 4 deletions(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index ddcea7349b..a5b1550937 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1378,6 +1378,8 @@
 # @show-cursor:   Force showing the mouse cursor (default: off).
 #                 (since: 5.0)
 # @gl:            Enable OpenGL support (default: off).
+# @detach-all:    Start QEMU with all VC windows detached (default: off)
+#                 (since: 7.1)
 #
 # Since: 2.12
 #
@@ -1387,7 +1389,8 @@
                 '*full-screen'   : 'bool',
                 '*window-close'  : 'bool',
                 '*show-cursor'   : 'bool',
-                '*gl'            : 'DisplayGLMode' },
+                '*gl'            : 'DisplayGLMode',
+                '*detach-all'    : 'bool' },
   'discriminator' : 'type',
   'data'    : {
       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
diff --git a/ui/gtk.c b/ui/gtk.c
index d9971d65ac..f1ca6a7275 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -2305,6 +2305,8 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     GdkDisplay *window_display;
     GtkIconTheme *theme;
     char *dir;
+    int num_mon;
+    int i;
 
     if (!gtkinit) {
         fprintf(stderr, "gtk initialization failed\n");
@@ -2374,18 +2376,57 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
     gtk_widget_set_sensitive(s->copy_item,
                              vc && vc->type == GD_VC_VTE);
 #endif
-
     if (opts->u.gtk.has_monitor &&
-        opts->u.gtk.monitor < gdk_display_get_n_monitors(window_display)) {
+        opts->u.gtk.monitor <
+        (num_mon = gdk_display_get_n_monitors(window_display))) {
         GdkRectangle mon_dest;
         gdk_monitor_get_geometry(
             gdk_display_get_monitor(window_display, opts->u.gtk.monitor),
             &mon_dest);
         gtk_window_move(GTK_WINDOW(s->window), mon_dest.x, mon_dest.y);
     }
+    if (opts->has_detach_all &&
+        opts->detach_all) {
+        for (i = 0; i < s->nb_vcs - 1; i++) {
+            gtk_menu_item_activate(GTK_MENU_ITEM(s->untabify_item));
+        }
+    }
     if (opts->has_full_screen &&
         opts->full_screen) {
-        gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
+        bool no_mon_left = 0;
+        int next_mon = 0;
+        if (!opts->u.gtk.has_monitor ||
+	    (opts->u.gtk.has_monitor && opts->u.gtk.monitor < num_mon)) {
+            next_mon = (opts->u.gtk.has_monitor) ? opts->u.gtk.monitor : 0;
+            for (i = 0; i < s->nb_vcs - 1; i++) {
+                if (!s->vc[i].window) {
+                    continue;
+                }
+
+                gtk_window_fullscreen_on_monitor(
+                    GTK_WINDOW(s->vc[i].window),
+                    gdk_display_get_default_screen(window_display),
+                    next_mon++);
+
+                if (next_mon == opts->u.gtk.monitor) {
+                    no_mon_left = true;
+                    break;
+                }
+
+                if (next_mon == num_mon) {
+                    next_mon = 0;
+                }
+            }
+        }
+
+        if (!no_mon_left) {
+            GdkRectangle mon_dest;
+            gdk_monitor_get_geometry(
+                gdk_display_get_monitor(window_display, next_mon),
+                &mon_dest);
+            gtk_window_move(GTK_WINDOW(s->window), mon_dest.x, mon_dest.y);
+            gtk_menu_item_activate(GTK_MENU_ITEM(s->full_screen_item));
+        }
     }
     if (opts->u.gtk.has_grab_on_hover &&
         opts->u.gtk.grab_on_hover) {
-- 
2.30.2


