Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EC08062EB8E
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:01:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqgR-0006ve-0T; Thu, 17 Nov 2022 21:00:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqgA-0006qi-IA
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:00:35 -0500
Received: from mga01.intel.com ([192.55.52.88])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqg7-0007uB-Sx
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:00:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668736827; x=1700272827;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=LtssbtygmjzHpfF9OGz3VzYwF4F8brwNiH/OEBZLkFs=;
 b=jXiBVUoZhIqgnPlnb3SDeCskHF1CrNnq/8OJPTWyEbqpqZYWX29X9WUK
 CD/6Eu+2JJ1l9hVkfWDvT+0pFgzlZalMc9ojdCy4Arum3kLFvHK54+tlf
 4pJR4+Se/P3FtLhUl2jMVvT3odqjk+hGE+8vRpp3Z2zPWPA9z3hEZgyAE
 8UR72FqdUm0lMb1K+8xWoMMRjE/cae4QlKiEH20XIgWXRms38o1z62o9e
 CJOUps9RInvX9Hmd71aJwTae6Y3evA6py6l7Bht38Tr6seWyXV9alQhxt
 KqZK75X0RxbdKIhq6GfH+8Cl4goJQjowkGu1N8XxHzEa6yz9nw9iQ8/bQ g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="339863637"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="339863637"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:00:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="617844221"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="617844221"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:00:25 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>, Dongwon Kim <dongwon.kim@intel.com>
Subject: [PATCH v1] ui/gtk: Add support for extended absolute mode for the
 pointer device
Date: Thu, 17 Nov 2022 17:40:03 -0800
Message-Id: <20221118014003.182504-1-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Currently, the range of the absolute pointer device (usb-tablet) is
restricted to any one monitor. This presents a problem when there are
multiple VCs (Guest GTK windows) located on different monitors.
Therefore, it makes sense to extend the range of the absolute pointer
device to span all monitors. This would work nicely as long as the
monitors (aka outputs/connectors/displays) on the Host and Guest are
in alignment with each other (i.e, if the Host has monitor 2, 3, 4
to the right of monitor 1, then Guest's need to be arranged accordingly).

Relative mode could also be used in these situations but the user
experience is not as seamless as the absolute mode.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dongwon Kim <dongwon.kim@intel.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |  1 +
 qapi/ui.json     |  6 ++++-
 qemu-options.hx  |  5 +++-
 ui/gtk.c         | 63 +++++++++++++++++++++++++++++++++++-------------
 4 files changed, 56 insertions(+), 19 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index ae0f53740d..01eb560b0b 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -136,6 +136,7 @@ struct GtkDisplayState {
     VirtualConsole *ptr_owner;
 
     gboolean full_screen;
+    gboolean ext_abs_mode;
 
     GdkCursor *null_cursor;
     Notifier mouse_mode_notifier;
diff --git a/qapi/ui.json b/qapi/ui.json
index 0abba3e930..1ce2945c84 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1201,6 +1201,9 @@
 #               Since 7.1
 # @show-menubar: Display the main window menubar. Defaults to "on".
 #                Since 8.0
+# @extend-abs-mode: Extend the absolute mode across all monitors or
+#                   limit it to just one. Defaults to "off".
+#                   Since 8.0
 #
 # Since: 2.12
 ##
@@ -1208,7 +1211,8 @@
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool',
                 '*show-tabs'     : 'bool',
-                '*show-menubar'  : 'bool'  } }
+                '*show-menubar'  : 'bool',
+                '*extend-abs-mode'  : 'bool'  } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index eb38e5dc40..e6ef0634cd 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1980,7 +1980,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
     "            [,show-tabs=on|off][,show-cursor=on|off][,window-close=on|off]\n"
-    "            [,show-menubar=on|off]\n"
+    "            [,show-menubar=on|off][,extend-abs-mode=on|off]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
@@ -2075,6 +2075,9 @@ SRST
 
         ``show-menubar=on|off`` : Display the main window menubar, defaults to "on"
 
+        ``extend-abs-mode=on|off`` : Extend the absolute mode across all
+                                     monitors or limit it to just one.
+
     ``curses[,charset=<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
diff --git a/ui/gtk.c b/ui/gtk.c
index 2be9755b0a..a4644675b2 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -883,12 +883,42 @@ static gboolean gd_draw_event(GtkWidget *widget, cairo_t *cr, void *opaque)
     return TRUE;
 }
 
+static void gd_calc_width_height(VirtualConsole *vc,
+                                 uint32_t *max_w, uint32_t *max_h)
+{
+    GtkDisplayState *s = vc->s;
+    GdkDisplay *dpy = gtk_widget_get_display(vc->gfx.drawing_area);
+    GdkRectangle geometry;
+    int i;
+
+    if (s->ext_abs_mode) {
+        for (i = 0; i < gdk_display_get_n_monitors(dpy); i++) {
+            gdk_monitor_get_geometry(gdk_display_get_monitor(dpy, i),
+                                     &geometry);
+            if (geometry.x + geometry.width > *max_w) {
+                *max_w = geometry.x + geometry.width;
+            }
+            if (geometry.y + geometry.height > *max_h) {
+                *max_h = geometry.y + geometry.height;
+            }
+        }
+    } else {
+        *max_w = surface_width(vc->gfx.ds);
+        *max_h = surface_height(vc->gfx.ds);
+    }
+}
+
 static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
                                 void *opaque)
 {
     VirtualConsole *vc = opaque;
     GtkDisplayState *s = vc->s;
-    GdkWindow *window;
+    GdkScreen *screen = gtk_widget_get_screen(vc->gfx.drawing_area);
+    GdkDisplay *dpy = gtk_widget_get_display(widget);
+    GdkWindow *window = gtk_widget_get_window(widget);
+    GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, window);
+    GdkRectangle geometry;
+    uint32_t max_w = 0, max_h = 0;
     int x, y;
     int mx, my;
     int fbh, fbw;
@@ -901,7 +931,6 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     fbw = surface_width(vc->gfx.ds) * vc->gfx.scale_x;
     fbh = surface_height(vc->gfx.ds) * vc->gfx.scale_y;
 
-    window = gtk_widget_get_window(vc->gfx.drawing_area);
     ww = gdk_window_get_width(window);
     wh = gdk_window_get_height(window);
     ws = gdk_window_get_scale_factor(window);
@@ -916,17 +945,20 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
 
     x = (motion->x - mx) / vc->gfx.scale_x * ws;
     y = (motion->y - my) / vc->gfx.scale_y * ws;
+    gdk_monitor_get_geometry(monitor, &geometry);
 
     if (qemu_input_is_absolute()) {
-        if (x < 0 || y < 0 ||
-            x >= surface_width(vc->gfx.ds) ||
-            y >= surface_height(vc->gfx.ds)) {
+        if (s->ext_abs_mode) {
+            x = x + geometry.x;
+            y = y + geometry.y;
+        }
+
+        gd_calc_width_height(vc, &max_w, &max_h);
+        if (x < 0 || y < 0 || x >= max_w || y >= max_h) {
             return TRUE;
         }
-        qemu_input_queue_abs(vc->gfx.dcl.con, INPUT_AXIS_X, x,
-                             0, surface_width(vc->gfx.ds));
-        qemu_input_queue_abs(vc->gfx.dcl.con, INPUT_AXIS_Y, y,
-                             0, surface_height(vc->gfx.ds));
+        qemu_input_queue_abs(vc->gfx.dcl.con, INPUT_AXIS_X, x, 0, max_w);
+        qemu_input_queue_abs(vc->gfx.dcl.con, INPUT_AXIS_Y, y, 0, max_h);
         qemu_input_event_sync();
     } else if (s->last_set && s->ptr_owner == vc) {
         qemu_input_queue_rel(vc->gfx.dcl.con, INPUT_AXIS_X, x - s->last_x);
@@ -938,17 +970,9 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     s->last_set = TRUE;
 
     if (!qemu_input_is_absolute() && s->ptr_owner == vc) {
-        GdkScreen *screen = gtk_widget_get_screen(vc->gfx.drawing_area);
-        GdkDisplay *dpy = gtk_widget_get_display(widget);
-        GdkWindow *win = gtk_widget_get_window(widget);
-        GdkMonitor *monitor = gdk_display_get_monitor_at_window(dpy, win);
-        GdkRectangle geometry;
-
         int x = (int)motion->x_root;
         int y = (int)motion->y_root;
 
-        gdk_monitor_get_geometry(monitor, &geometry);
-
         /* In relative mode check to see if client pointer hit
          * one of the monitor edges, and if so move it back to the
          * center of the monitor. This is important because the pointer
@@ -2423,6 +2447,11 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.show_tabs) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
     }
+    if (opts->u.gtk.has_extend_abs_mode &&
+        opts->u.gtk.extend_abs_mode &&
+        qemu_input_is_absolute()) {
+        s->ext_abs_mode = TRUE;
+    }
     gd_clipboard_init(s);
 }
 
-- 
2.37.2


