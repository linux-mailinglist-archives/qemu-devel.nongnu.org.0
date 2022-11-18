Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4B8562EBA4
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Nov 2022 03:06:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovqkr-0007t9-P3; Thu, 17 Nov 2022 21:05:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkp-0007sG-Ru
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:19 -0500
Received: from mga18.intel.com ([134.134.136.126])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1ovqkn-0008UX-Bv
 for qemu-devel@nongnu.org; Thu, 17 Nov 2022 21:05:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668737117; x=1700273117;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5V55llVN3tmjBUlqhrT2ZTUetXSq55cgYaFxBSP/MvQ=;
 b=e/GUDN/oqluXjwg2sPuxOscn7KijhboPXKJ3Y5n3hre6xHzWRSG6nCq0
 RWAzfvOPaNZbKYrsaBCCnhXQhhT8nWY2NJlhr2vUA6VM17hal4KRsWiP/
 few3tBUalbSQpOw93kN67OR1nTlXig++T/MaTyzIH+OimsXRG2ZdD62kK
 lceHBgv9loUYJf5kkrf+H6dNZWY03dsckq5UgMGtM1QQdPRRPdACG5PJD
 uTFRIBEDKLMKWvgYeyEvvmlBt2VcQp5X14aFyXpBk3w1kN4XWZa4Teenv
 xA8/gyW7vguMdwVHVqGG7qz/JGjcJYZqq0xy5NwMRgex/71c8wIzPMqKp w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="296393531"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="296393531"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:06 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10534"; a="634270872"
X-IronPort-AV: E=Sophos;i="5.96,172,1665471600"; d="scan'208";a="634270872"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Nov 2022 18:05:05 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v2 6/6] ui/gtk: Add a new parameter to assign
 connectors/monitors to GFX VCs (v2)
Date: Thu, 17 Nov 2022 17:44:26 -0800
Message-Id: <20221118014426.182599-7-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118014426.182599-1-vivek.kasireddy@intel.com>
References: <20221118014426.182599-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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

The new parameter named "connector" can be used to assign physical
monitors/connectors to individual GFX VCs such that when the monitor
is connected or hotplugged, the associated GTK window would be
moved to it. If the monitor is disconnected or unplugged, the
associated GTK window would be destroyed and a relevant disconnect
event would be sent to the Guest.

Usage: -device virtio-gpu-pci,max_outputs=2,blob=true,...
       -display gtk,gl=on,connectors.0=eDP-1,connectors.1=DP-1.....

v2:
- Make various style improvements suggested by Markus.
- Fullscreen the window only if the fullscreen option is enabled.

Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Markus Armbruster <armbru@redhat.com> (QAPI schema)
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 include/ui/gtk.h |   1 +
 qapi/ui.json     |  10 +-
 qemu-options.hx  |   5 +-
 ui/gtk.c         | 260 +++++++++++++++++++++++++++++++++++++++++++++--
 4 files changed, 268 insertions(+), 8 deletions(-)

diff --git a/include/ui/gtk.h b/include/ui/gtk.h
index f8df042f95..bbea0316fb 100644
--- a/include/ui/gtk.h
+++ b/include/ui/gtk.h
@@ -83,6 +83,7 @@ typedef struct VirtualConsole {
     GtkWidget *menu_item;
     GtkWidget *tab_item;
     GtkWidget *focus;
+    GdkMonitor *monitor;
     VirtualConsoleType type;
     union {
         VirtualGfxConsole gfx;
diff --git a/qapi/ui.json b/qapi/ui.json
index 0abba3e930..a4d1616445 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1201,6 +1201,13 @@
 #               Since 7.1
 # @show-menubar: Display the main window menubar. Defaults to "on".
 #                Since 8.0
+# @connectors:  List of physical monitor/connector names where the GTK
+#               windows containing the respective graphics virtual consoles
+#               (VCs) are to be placed. If a mapping exists for a VC, it
+#               will be moved to that specific monitor or else it would
+#               not be displayed anywhere and would appear disconnected
+#               to the guest.
+#               Since 8.0
 #
 # Since: 2.12
 ##
@@ -1208,7 +1215,8 @@
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool',
                 '*show-tabs'     : 'bool',
-                '*show-menubar'  : 'bool'  } }
+                '*show-menubar'  : 'bool',
+                '*connectors'    : ['str'] } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index eb38e5dc40..ae6289e4f3 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1980,7 +1980,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
     "            [,show-tabs=on|off][,show-cursor=on|off][,window-close=on|off]\n"
-    "            [,show-menubar=on|off]\n"
+    "            [,show-menubar=on|off][,connectors.<index>=<connector name>]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
@@ -2075,6 +2075,9 @@ SRST
 
         ``show-menubar=on|off`` : Display the main window menubar, defaults to "on"
 
+        ``connectors=<conn name>`` : VC to connector mappings to display the VC
+                                     window on a specific monitor
+
     ``curses[,charset=<encoding>]``
         Display video output via curses. For graphics device models
         which support a text mode, QEMU can display this output using a
diff --git a/ui/gtk.c b/ui/gtk.c
index 6b0369e3ed..03fc454a1f 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -37,6 +37,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
+#include "qemu/option.h"
 
 #include "ui/console.h"
 #include "ui/gtk.h"
@@ -116,6 +117,11 @@
 
 #define HOTKEY_MODIFIERS        (GDK_CONTROL_MASK | GDK_MOD1_MASK)
 
+/* Upper limit on number of times to check for a valid monitor name */
+#define MAX_NUM_RETRIES 5
+/* Max num of milliseconds to wait before checking for a valid monitor name */
+#define WAIT_MS 50
+
 static const guint16 *keycode_map;
 static size_t keycode_maplen;
 
@@ -126,6 +132,14 @@ struct VCChardev {
 };
 typedef struct VCChardev VCChardev;
 
+typedef struct gd_monitor_data {
+    GtkDisplayState *s;
+    GdkDisplay *dpy;
+    GdkMonitor *monitor;
+    QEMUTimer *hp_timer;
+    int num_retries;
+} gd_monitor_data;
+
 #define TYPE_CHARDEV_VC "chardev-vc"
 DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
                          TYPE_CHARDEV_VC)
@@ -461,7 +475,7 @@ static void gd_mouse_set(DisplayChangeListener *dcl,
      * and return right away as we do not want to move the cursor
      * back to the old vc (at 0, 0).
      */
-    if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+    if (GDK_IS_WAYLAND_DISPLAY(dpy) || s->opts->u.gtk.has_connectors) {
         if (s->ptr_owner != vc || (x == 0 && y == 0)) {
             return;
         }
@@ -962,11 +976,11 @@ static gboolean gd_motion_event(GtkWidget *widget, GdkEventMotion *motion,
     s->last_set = TRUE;
 
     /*
-     * When running in Wayland environment, we don't grab the cursor; so,
-     * we want to return right away as it would not make sense to warp it
-     * (below).
+     * When running in Wayland environment or when has_connectors is set,
+     * we don't grab the cursor; so, we want to return right away as it
+     * would not make sense to warp it (below).
      */
-    if (GDK_IS_WAYLAND_DISPLAY(dpy)) {
+    if (GDK_IS_WAYLAND_DISPLAY(dpy) || s->opts->u.gtk.has_connectors) {
         if (s->ptr_owner != vc) {
             s->ptr_owner = vc;
         }
@@ -1017,10 +1031,13 @@ static gboolean gd_button_event(GtkWidget *widget, GdkEventButton *button,
     /* Implicitly grab the input at the first click in the relative mode.
      * However, when running in Wayland environment, some limited testing
      * indicates that grabs are not very reliable.
+     * And, when has_connectors is set, we also do not want to grab the cursor
+     * as it would be tedious to grab/ungrab when drag-and-dropping or moving
+     * apps from one vc to another -- which may be on a different monitor.
      */
     if (button->button == 1 && button->type == GDK_BUTTON_PRESS &&
         !qemu_input_is_absolute() && s->ptr_owner != vc &&
-        !GDK_IS_WAYLAND_DISPLAY(dpy)) {
+        !GDK_IS_WAYLAND_DISPLAY(dpy) && !s->opts->u.gtk.has_connectors) {
         if (!vc->window) {
             gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
                                            TRUE);
@@ -1450,6 +1467,228 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
     }
 }
 
+static void gd_window_show_on_monitor(GdkDisplay *dpy, VirtualConsole *vc,
+                                      gint monitor_num)
+{
+    GtkDisplayState *s = vc->s;
+    GdkMonitor *monitor = gdk_display_get_monitor(dpy, monitor_num);
+    GdkWindow *window;
+    GdkRectangle geometry;
+
+    if (!vc->window) {
+        gd_tab_window_create(vc);
+    }
+    if (s->opts->has_full_screen && s->opts->full_screen) {
+        s->full_screen = TRUE;
+        gtk_widget_set_size_request(vc->gfx.drawing_area, -1, -1);
+        gtk_window_fullscreen_on_monitor(GTK_WINDOW(vc->window),
+                                         gdk_display_get_default_screen(dpy),
+                                         monitor_num);
+    } else {
+        gd_update_windowsize(vc);
+        gdk_monitor_get_geometry(monitor, &geometry);
+        /*
+         * Note: some compositors (mainly Wayland ones) may not honor a
+         * request to move to a particular location. The user is expected
+         * to drag the window to the preferred location in this case.
+         */
+        gtk_window_move(GTK_WINDOW(vc->window), geometry.x, geometry.y);
+    }
+
+    vc->monitor = monitor;
+    window = gtk_widget_get_window(vc->gfx.drawing_area);
+    gd_set_ui_size(vc, gdk_window_get_width(window),
+                   gdk_window_get_height(window));
+    gd_update_cursor(vc);
+}
+
+static int gd_monitor_lookup(GdkDisplay *dpy, char *label)
+{
+    GdkMonitor *monitor;
+    int total_monitors = gdk_display_get_n_monitors(dpy);
+    int i;
+
+    for (i = 0; i < total_monitors; i++) {
+        monitor = gdk_display_get_monitor(dpy, i);
+        if (monitor && !g_strcmp0(gdk_monitor_get_model(monitor), label)) {
+            return i;
+        }
+    }
+    return -1;
+}
+
+static gboolean gd_vc_is_misplaced(GdkDisplay *dpy, GdkMonitor *monitor,
+                                   VirtualConsole *vc)
+{
+    GdkWindow *window = gtk_widget_get_window(vc->gfx.drawing_area);
+    GdkMonitor *mon = gdk_display_get_monitor_at_window(dpy, window);
+    const char *monitor_name = gdk_monitor_get_model(monitor);
+
+    if (!vc->monitor) {
+        if (!g_strcmp0(monitor_name, vc->label)) {
+            return TRUE;
+        }
+    } else {
+        if (vc->monitor != mon) {
+            return TRUE;
+        }
+    }
+    return FALSE;
+}
+
+static void gd_monitor_check_vcs(GdkDisplay *dpy, GdkMonitor *monitor,
+                                 GtkDisplayState *s)
+{
+    VirtualConsole *vc;
+    gint monitor_num;
+    int i;
+
+    /*
+     * We need to call gd_vc_is_misplaced() after a monitor is added to
+     * ensure that the Host compositor has not moved our windows around.
+     */
+    for (i = 0; i < s->nb_vcs; i++) {
+        vc = &s->vc[i];
+        monitor_num = vc->label ? gd_monitor_lookup(dpy, vc->label) : -1;
+        if (monitor_num >= 0 && gd_vc_is_misplaced(dpy, monitor, vc)) {
+            gd_window_show_on_monitor(dpy, vc, monitor_num);
+        }
+    }
+}
+
+static void gd_monitor_hotplug_timer(void *opaque)
+{
+    gd_monitor_data *data = opaque;
+    const char *monitor_name;
+
+    monitor_name = GDK_IS_MONITOR(data->monitor) ?
+                   gdk_monitor_get_model(data->monitor) : NULL;
+    if (monitor_name) {
+        gd_monitor_check_vcs(data->dpy, data->monitor, data->s);
+    }
+    if (monitor_name || data->num_retries == MAX_NUM_RETRIES) {
+        timer_del(data->hp_timer);
+        g_free(data);
+    } else {
+        data->num_retries++;
+        timer_mod(data->hp_timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + WAIT_MS);
+    }
+}
+
+static void gd_monitor_add(GdkDisplay *dpy, GdkMonitor *monitor,
+                           void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    gd_monitor_data *data;
+
+    /*
+     * It is possible that the Host Compositor or GTK would not have
+     * had a chance to fully process the hotplug event and as a result
+     * gdk_monitor_get_model() could return NULL. Therefore, check for
+     * this case and try again later.
+     */
+    if (GDK_IS_MONITOR(monitor) && gdk_monitor_get_model(monitor)) {
+        gd_monitor_check_vcs(dpy, monitor, s);
+    } else {
+        data = g_new0(gd_monitor_data, 1);
+        data->s = s;
+        data->dpy = dpy;
+        data->monitor = monitor;
+        data->hp_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
+                                      gd_monitor_hotplug_timer, data);
+        timer_mod(data->hp_timer,
+                  qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + WAIT_MS);
+    }
+}
+
+static void gd_monitor_remove(GdkDisplay *dpy, GdkMonitor *monitor,
+                              void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    VirtualConsole *vc;
+    int i;
+
+    for (i = 0; i < s->nb_vcs; i++) {
+        vc = &s->vc[i];
+        if (vc->monitor == monitor) {
+            vc->monitor = NULL;
+            if (vc->window == s->window) {
+                gdk_window_hide(gtk_widget_get_window(vc->window));
+            } else {
+                gd_tab_window_close(NULL, NULL, vc);
+            }
+            gd_set_ui_size(vc, 0, 0);
+            break;
+        }
+    }
+}
+
+static VirtualConsole *gd_next_gfx_vc(GtkDisplayState *s)
+{
+    VirtualConsole *vc;
+    int i;
+
+    for (i = 0; i < s->nb_vcs; i++) {
+        vc = &s->vc[i];
+        if (vc->type == GD_VC_GFX &&
+            qemu_console_is_graphic(vc->gfx.dcl.con) &&
+            !vc->label) {
+            return vc;
+        }
+    }
+    return NULL;
+}
+
+static void gd_vc_free_labels(GtkDisplayState *s)
+{
+    VirtualConsole *vc;
+    int i;
+
+    for (i = 0; i < s->nb_vcs; i++) {
+        vc = &s->vc[i];
+        if (vc->type == GD_VC_GFX &&
+            qemu_console_is_graphic(vc->gfx.dcl.con)) {
+            g_free(vc->label);
+            vc->label = NULL;
+        }
+    }
+}
+
+static void gd_connectors_init(GdkDisplay *dpy, GtkDisplayState *s)
+{
+    VirtualConsole *vc;
+    strList *conn;
+    gint monitor_num;
+    gboolean first_vc = TRUE;
+
+    gtk_notebook_set_show_tabs(GTK_NOTEBOOK(s->notebook), FALSE);
+    gtk_check_menu_item_set_active(GTK_CHECK_MENU_ITEM(s->grab_item),
+                                   FALSE);
+    gd_vc_free_labels(s);
+    for (conn = s->opts->u.gtk.connectors; conn; conn = conn->next) {
+        vc = gd_next_gfx_vc(s);
+        if (!vc) {
+            break;
+        }
+        if (first_vc) {
+            vc->window = s->window;
+            first_vc = FALSE;
+        }
+
+        vc->label = g_strdup(conn->value);
+        monitor_num = gd_monitor_lookup(dpy, vc->label);
+        if (monitor_num >= 0) {
+            gd_window_show_on_monitor(dpy, vc, monitor_num);
+        } else {
+            if (vc->window) {
+                gdk_window_hide(gtk_widget_get_window(vc->window));
+            }
+            gd_set_ui_size(vc, 0, 0);
+        }
+    }
+}
+
 static void gd_menu_show_menubar(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
@@ -2103,6 +2342,12 @@ static void gd_connect_signals(GtkDisplayState *s)
                      G_CALLBACK(gd_menu_grab_input), s);
     g_signal_connect(s->notebook, "switch-page",
                      G_CALLBACK(gd_change_page), s);
+    if (s->opts->u.gtk.has_connectors) {
+        g_signal_connect(gtk_widget_get_display(s->window), "monitor-added",
+                         G_CALLBACK(gd_monitor_add), s);
+        g_signal_connect(gtk_widget_get_display(s->window), "monitor-removed",
+                         G_CALLBACK(gd_monitor_remove), s);
+    }
 }
 
 static GtkWidget *gd_create_menu_machine(GtkDisplayState *s)
@@ -2472,6 +2717,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.show_tabs) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
     }
+    if (s->opts->u.gtk.has_connectors) {
+        gd_connectors_init(window_display, s);
+    }
     gd_clipboard_init(s);
 }
 
-- 
2.37.2


