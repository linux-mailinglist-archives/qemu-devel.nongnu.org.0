Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E35545BB509
	for <lists+qemu-devel@lfdr.de>; Sat, 17 Sep 2022 02:33:59 +0200 (CEST)
Received: from localhost ([::1]:59478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oZLmQ-00036o-IT
	for lists+qemu-devel@lfdr.de; Fri, 16 Sep 2022 20:33:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58526)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgG-0005qQ-OR
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:37 -0400
Received: from mga17.intel.com ([192.55.52.151]:23527)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1oZLgD-0000iY-IL
 for qemu-devel@nongnu.org; Fri, 16 Sep 2022 20:27:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663374453; x=1694910453;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OVXOpEVHfZJ/ouyAPRX1Ee0x/0NohO6TmCyWheTQUMo=;
 b=JHXgGeNFg6IHkIIbtxPiyLqlCp0HKg8SvZO0hdKerasLwtu1Kr7EgIvw
 XHhkVmtBITT4YKnrZCj7m1iDBqg3rMdCb9E8gIetPk8U95gh+PjEz558v
 6xvlTLqU8QNlHgquk/IY6k1+9BgwyjU7SoOeEIt/vj643TniKdwsc5WVa
 KgvjTICMK/lOsDOT7rBZUNm9hr4uNi7wURvDccGTpDIdi+DITl+bIAts7
 ue2WvZj3BIiICLv+1t5o6NBC69aWJpLSOVE5V5SZvGwwgKWH+/aT/0u/R
 DLD/Ce1W9BIfbF0MuKDLmL6+NPMpMSZR0moC6XxJm7Ei1lBjcv/kquF2J g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10472"; a="279489396"
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="279489396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
X-IronPort-AV: E=Sophos;i="5.93,321,1654585200"; d="scan'208";a="760235127"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Sep 2022 17:27:20 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Dongwon Kim <dongwon.kim@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH v1 3/3] ui/gtk: Add a new parameter to assign
 connectors/monitors to GFX VCs
Date: Fri, 16 Sep 2022 17:07:31 -0700
Message-Id: <20220917000731.465003-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220917000731.465003-1-vivek.kasireddy@intel.com>
References: <20220917000731.465003-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

The new parameter named "connector" can be used to assign physical
monitors/connectors to individual GFX VCs such that when the monitor
is connected or hotplugged, the associated GTK window would be
fullscreened on it. If the monitor is disconnected or unplugged,
the associated GTK window would be destroyed and a relevant
disconnect event would be sent to the Guest.

Usage: -device virtio-gpu-pci,max_outputs=2,blob=true,xres=1920,yres=1080...
       -display gtk,gl=on,connector.0=eDP-1,connector.1=DP-1.....

Cc: Dongwon Kim <dongwon.kim@intel.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Daniel P. Berrangé <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>
Cc: Marc-André Lureau <marcandre.lureau@redhat.com>
Cc: Thomas Huth <thuth@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 qapi/ui.json    |   9 ++-
 qemu-options.hx |   1 +
 ui/gtk.c        | 168 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+), 1 deletion(-)

diff --git a/qapi/ui.json b/qapi/ui.json
index 286c5731d1..86787a4c95 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1199,13 +1199,20 @@
 #               interfaces (e.g. VGA and virtual console character devices)
 #               by default.
 #               Since 7.1
+# @connector:   List of physical monitor/connector names where the GTK windows
+#               containing the respective graphics virtual consoles (VCs) are
+#               to be placed. If a mapping exists for a VC, it will be
+#               fullscreened on that specific monitor or else it would not be
+#               displayed anywhere and would appear disconnected to the guest.
+#               Since 7.2
 #
 # Since: 2.12
 ##
 { 'struct'  : 'DisplayGTK',
   'data'    : { '*grab-on-hover' : 'bool',
                 '*zoom-to-fit'   : 'bool',
-                '*show-tabs'     : 'bool'  } }
+                '*show-tabs'     : 'bool',
+                '*connector'     : ['str']  } }
 
 ##
 # @DisplayEGLHeadless:
diff --git a/qemu-options.hx b/qemu-options.hx
index 31c04f7eea..576b65ef9f 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1945,6 +1945,7 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #if defined(CONFIG_GTK)
     "-display gtk[,full-screen=on|off][,gl=on|off][,grab-on-hover=on|off]\n"
     "            [,show-tabs=on|off][,show-cursor=on|off][,window-close=on|off]\n"
+    "            [,connector.<id of VC>=<connector name>]\n"
 #endif
 #if defined(CONFIG_VNC)
     "-display vnc=<display>[,<optargs>]\n"
diff --git a/ui/gtk.c b/ui/gtk.c
index 945c550909..651aaaf174 100644
--- a/ui/gtk.c
+++ b/ui/gtk.c
@@ -37,6 +37,7 @@
 #include "qapi/qapi-commands-misc.h"
 #include "qemu/cutils.h"
 #include "qemu/main-loop.h"
+#include "qemu/option.h"
 
 #include "ui/console.h"
 #include "ui/gtk.h"
@@ -115,6 +116,7 @@
 #endif
 
 #define HOTKEY_MODIFIERS        (GDK_CONTROL_MASK | GDK_MOD1_MASK)
+#define MAX_NUM_ATTEMPTS 5
 
 static const guint16 *keycode_map;
 static size_t keycode_maplen;
@@ -126,6 +128,15 @@ struct VCChardev {
 };
 typedef struct VCChardev VCChardev;
 
+struct gd_monitor_data {
+    GtkDisplayState *s;
+    GdkDisplay *dpy;
+    GdkMonitor *monitor;
+    QEMUTimer *hp_timer;
+    int attempt;
+};
+typedef struct gd_monitor_data gd_monitor_data;
+
 #define TYPE_CHARDEV_VC "chardev-vc"
 DECLARE_INSTANCE_CHECKER(VCChardev, VC_CHARDEV,
                          TYPE_CHARDEV_VC)
@@ -1385,6 +1396,147 @@ static void gd_menu_untabify(GtkMenuItem *item, void *opaque)
     }
 }
 
+static void gd_monitor_fullscreen(GdkDisplay *dpy, VirtualConsole *vc,
+                                  gint monitor_num)
+{
+    GtkDisplayState *s = vc->s;
+
+    if (!vc->window) {
+        gd_tab_window_create(vc);
+    }
+    gtk_window_fullscreen_on_monitor(GTK_WINDOW(vc->window),
+                                     gdk_display_get_default_screen(dpy),
+                                     monitor_num);
+    s->full_screen = TRUE;
+    gd_update_cursor(vc);
+}
+
+static int gd_monitor_lookup(GdkDisplay *dpy, char *label)
+{
+    GdkMonitor *monitor;
+    const char *monitor_name;
+    int i, total_monitors;
+
+    total_monitors = gdk_display_get_n_monitors(dpy);
+    for (i = 0; i < total_monitors; i++) {
+        monitor = gdk_display_get_monitor(dpy, i);
+        if (monitor) {
+            monitor_name = gdk_monitor_get_model(monitor);
+            if (monitor_name && !strcmp(monitor_name, label)) {
+                return i;
+            }
+        }
+    }
+    return -1;
+}
+
+static void gd_monitor_check_vcs(GdkDisplay *dpy, GdkMonitor *monitor,
+                                 GtkDisplayState *s)
+{
+    VirtualConsole *vc;
+    const char *monitor_name = gdk_monitor_get_model(monitor);
+    int i;
+
+    for (i = 0; i < s->nb_vcs; i++) {
+        vc = &s->vc[i];
+        if (!strcmp(vc->label, monitor_name)) {
+            gd_monitor_fullscreen(dpy, vc, gd_monitor_lookup(dpy, vc->label));
+            gd_set_ui_size(vc, surface_width(vc->gfx.ds),
+                           surface_height(vc->gfx.ds));
+            break;
+        }
+    }
+}
+
+static void gd_monitor_hotplug_timer(void *opaque)
+{
+    gd_monitor_data *data = opaque;
+    const char *monitor_name = gdk_monitor_get_model(data->monitor);
+
+    if (monitor_name) {
+        gd_monitor_check_vcs(data->dpy, data->monitor, data->s);
+    }
+    if (monitor_name || data->attempt == MAX_NUM_ATTEMPTS) {
+        timer_del(data->hp_timer);
+        g_free(data);
+    } else {
+        data->attempt++;
+        timer_mod(data->hp_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 50);
+    }
+}
+
+static void gd_monitor_add(GdkDisplay *dpy, GdkMonitor *monitor,
+                           void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    gd_monitor_data *data;
+    const char *monitor_name = gdk_monitor_get_model(monitor);
+
+    if (!monitor_name) {
+        data = g_malloc0(sizeof(*data));
+        data->s = s;
+        data->dpy = dpy;
+        data->monitor = monitor;
+        data->hp_timer = timer_new_ms(QEMU_CLOCK_REALTIME,
+                                      gd_monitor_hotplug_timer, data);
+        timer_mod(data->hp_timer, qemu_clock_get_ms(QEMU_CLOCK_REALTIME) + 50);
+    } else {
+        gd_monitor_check_vcs(dpy, monitor, s);
+    }
+}
+
+static void gd_monitor_remove(GdkDisplay *dpy, GdkMonitor *monitor,
+                              void *opaque)
+{
+    GtkDisplayState *s = opaque;
+    VirtualConsole *vc;
+    const char *monitor_name = gdk_monitor_get_model(monitor);
+    int i;
+
+    if (!monitor_name) {
+        return;
+    }
+    for (i = 0; i < s->nb_vcs; i++) {
+        vc = &s->vc[i];
+        if (!strcmp(vc->label, monitor_name)) {
+            gd_tab_window_close(NULL, NULL, vc);
+            gd_set_ui_size(vc, 0, 0);
+            break;
+        }
+    }
+}
+
+static void gd_connectors_init(GdkDisplay *dpy, GtkDisplayState *s)
+{
+    VirtualConsole *vc;
+    strList *connector = s->opts->u.gtk.connector;
+    gint page_num = 0, monitor_num;
+
+    gtk_notebook_set_show_tabs(GTK_NOTEBOOK(s->notebook), FALSE);
+    gtk_widget_hide(s->menu_bar);
+    for (; connector; connector = connector->next) {
+        vc = gd_vc_find_by_page(s, page_num);
+        if (!vc) {
+            break;
+        }
+        if (page_num == 0) {
+            vc->window = s->window;
+        }
+
+        g_free(vc->label);
+        vc->label = g_strdup(connector->value);
+        monitor_num = gd_monitor_lookup(dpy, vc->label);
+        if (monitor_num >= 0) {
+            gd_monitor_fullscreen(dpy, vc, monitor_num);
+            gd_set_ui_size(vc, surface_width(vc->gfx.ds),
+                           surface_height(vc->gfx.ds));
+        } else {
+            gd_set_ui_size(vc, 0, 0);
+        }
+        page_num++;
+    }
+}
+
 static void gd_menu_show_menubar(GtkMenuItem *item, void *opaque)
 {
     GtkDisplayState *s = opaque;
@@ -1705,7 +1857,14 @@ static gboolean gd_configure(GtkWidget *widget,
                              GdkEventConfigure *cfg, gpointer opaque)
 {
     VirtualConsole *vc = opaque;
+    GtkDisplayState *s = vc->s;
+    GtkWidget *parent = gtk_widget_get_parent(widget);
 
+    if (s->opts->u.gtk.has_connector) {
+        if (!parent || !GTK_IS_WINDOW(parent)) {
+            return FALSE;
+        }
+    }
     gd_set_ui_size(vc, cfg->width, cfg->height);
     return FALSE;
 }
@@ -2038,6 +2197,12 @@ static void gd_connect_signals(GtkDisplayState *s)
                      G_CALLBACK(gd_menu_grab_input), s);
     g_signal_connect(s->notebook, "switch-page",
                      G_CALLBACK(gd_change_page), s);
+    if (s->opts->u.gtk.has_connector) {
+        g_signal_connect(gtk_widget_get_display(s->window), "monitor-added",
+                         G_CALLBACK(gd_monitor_add), s);
+        g_signal_connect(gtk_widget_get_display(s->window), "monitor-removed",
+                         G_CALLBACK(gd_monitor_remove), s);
+    }
 }
 
 static GtkWidget *gd_create_menu_machine(GtkDisplayState *s)
@@ -2402,6 +2567,9 @@ static void gtk_display_init(DisplayState *ds, DisplayOptions *opts)
         opts->u.gtk.show_tabs) {
         gtk_menu_item_activate(GTK_MENU_ITEM(s->show_tabs_item));
     }
+    if (s->opts->u.gtk.has_connector) {
+        gd_connectors_init(window_display, s);
+    }
     gd_clipboard_init(s);
 }
 
-- 
2.37.2


