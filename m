Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302DC47BB56
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:53:56 +0100 (CET)
Received: from localhost ([::1]:49320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZy7-0008A5-8H
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:53:55 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZEM-0001G1-T0
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:06:38 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:57438)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZEH-0002MM-Cz
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:06:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070392;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L43UXHFl9AJKt0xZGOscmkcnvj9RZGQmyZoN8rAsbH4=;
 b=Mnl/cIRRoFBtifq9IYwj6pye2Zd0GCQtBrnA6sVlLJRZt8MariZDNc7FYSOmhDfQG0zcOr
 D9X0XUO/HtXce0/eS75maMfyur+DfCVy2BYav2rICN5bYq3b1MyCtMfbdszBKql/JH2D+O
 hK5m1b1vrLDsLSTPB3P5YLbRYsJctVY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-170-a2HcscAUPLSCpPSl-wKGIA-1; Tue, 21 Dec 2021 02:06:27 -0500
X-MC-Unique: a2HcscAUPLSCpPSl-wKGIA-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C2FE1023F4E;
 Tue, 21 Dec 2021 07:06:26 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1CCEC87953;
 Tue, 21 Dec 2021 07:06:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 25/36] ui: add a D-Bus display backend
Date: Tue, 21 Dec 2021 10:58:44 +0400
Message-Id: <20211221065855.142578-26-marcandre.lureau@redhat.com>
In-Reply-To: <20211221065855.142578-1-marcandre.lureau@redhat.com>
References: <20211221065855.142578-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.203,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "dbus" display backend exports the QEMU consoles and other
UI-related interfaces over D-Bus.

By default, the connection is established on the session bus, but you
can specify a different bus with the "addr" option.

The backend takes the "org.qemu" service name, while still allowing
further instances to queue on the same name (so you can lookup all the
available instances too). It accepts any number of clients at this
point, although this is expected to evolve with options to restrict
clients, or only accept p2p via fd passing.

The interface is intentionally very close to the internal QEMU API,
and can be introspected or interacted with busctl/dfeet etc:

$ ./qemu-system-x86_64 -name MyVM -display dbus
$ busctl --user introspect org.qemu /org/qemu/Display1/Console_0

org.qemu.Display1.Console           interface -         -               -
.RegisterListener                   method    h         -               -
.SetUIInfo                          method    qqiiuu    -               -
.DeviceAddress                      property  s         "pci/0000/01.0" emits-change
.Head                               property  u         0               emits-change
.Height                             property  u         480             emits-change
.Label                              property  s         "VGA"           emits-change
.Type                               property  s         "Graphic"       emits-change
.Width                              property  u         640             emits-change
[...]

See the interfaces XML source file and Sphinx docs for the generated API
documentations.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 meson.build                   |  11 +
 qapi/ui.json                  |  27 +-
 include/qemu/dbus.h           |  19 ++
 ui/dbus.h                     |  83 ++++++
 ui/dbus-console.c             | 497 ++++++++++++++++++++++++++++++++++
 ui/dbus-error.c               |  48 ++++
 ui/dbus-listener.c            | 486 +++++++++++++++++++++++++++++++++
 ui/dbus.c                     | 262 ++++++++++++++++++
 meson_options.txt             |   2 +
 qemu-options.hx               |  15 +
 scripts/meson-buildoptions.sh |   3 +
 ui/dbus-display1.xml          | 378 ++++++++++++++++++++++++++
 ui/meson.build                |  22 ++
 ui/trace-events               |  11 +
 14 files changed, 1862 insertions(+), 2 deletions(-)
 create mode 100644 ui/dbus.h
 create mode 100644 ui/dbus-console.c
 create mode 100644 ui/dbus-error.c
 create mode 100644 ui/dbus-listener.c
 create mode 100644 ui/dbus.c

diff --git a/meson.build b/meson.build
index c37eb92ebeaa..73d4b241df1a 100644
--- a/meson.build
+++ b/meson.build
@@ -1397,6 +1397,15 @@ endif
 have_host_block_device = (targetos != 'darwin' or
     cc.has_header('IOKit/storage/IOMedia.h'))
 
+dbus_display = false
+if not get_option('dbus_display').disabled()
+  # FIXME enable_modules shouldn't be necessary, but: https://github.com/mesonbuild/meson/issues/8333
+  dbus_display = gio.version().version_compare('>=2.64') and config_host.has_key('GDBUS_CODEGEN') and enable_modules
+  if get_option('dbus_display').enabled() and not dbus_display
+    error('Requirements missing to enable -display dbus (glib>=2.64 && --enable-modules)')
+  endif
+endif
+
 have_virtfs = (targetos == 'linux' and
     have_system and
     libattr.found() and
@@ -1506,6 +1515,7 @@ config_host_data.set('CONFIG_SPICE_PROTOCOL_MICRO', spice_protocol.version().spl
 endif
 config_host_data.set('CONFIG_SPICE', spice.found())
 config_host_data.set('CONFIG_X11', x11.found())
+config_host_data.set('CONFIG_DBUS_DISPLAY', dbus_display)
 config_host_data.set('CONFIG_CFI', get_option('cfi'))
 config_host_data.set('CONFIG_SELINUX', selinux.found())
 config_host_data.set('QEMU_VERSION', '"@0@"'.format(meson.project_version()))
@@ -3229,6 +3239,7 @@ summary_info += {'Trace backends':    ','.join(get_option('trace_backends'))}
 if 'simple' in get_option('trace_backends')
   summary_info += {'Trace output file': get_option('trace_file') + '-<pid>'}
 endif
+summary_info += {'D-Bus display':     dbus_display}
 summary_info += {'QOM debugging':     config_host.has_key('CONFIG_QOM_CAST_DEBUG')}
 summary_info += {'vhost-kernel support': config_host.has_key('CONFIG_VHOST_KERNEL')}
 summary_info += {'vhost-net support': config_host.has_key('CONFIG_VHOST_NET')}
diff --git a/qapi/ui.json b/qapi/ui.json
index d7567ac86683..80855328b1d4 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1121,6 +1121,23 @@
 { 'struct'  : 'DisplayEGLHeadless',
   'data'    : { '*rendernode' : 'str' } }
 
+##
+# @DisplayDBus:
+#
+# DBus display options.
+#
+# @addr: The D-Bus bus address (default to the session bus).
+#
+# @rendernode: Which DRM render node should be used. Default is the first
+#              available node on the host.
+#
+# Since: 7.0
+#
+##
+{ 'struct'  : 'DisplayDBus',
+  'data'    : { '*rendernode' : 'str',
+                '*addr': 'str' } }
+
  ##
  # @DisplayGLMode:
  #
@@ -1186,6 +1203,8 @@
 #             application to connect to it. The server will redirect
 #             the serial console and QEMU monitors. (Since 4.0)
 #
+# @dbus: Start a D-Bus service for the display. (Since 7.0)
+#
 # Since: 2.12
 #
 ##
@@ -1199,7 +1218,10 @@
               'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
     { 'name': 'curses', 'if': 'CONFIG_CURSES' },
     { 'name': 'cocoa', 'if': 'CONFIG_COCOA' },
-    { 'name': 'spice-app', 'if': 'CONFIG_SPICE'} ] }
+    { 'name': 'spice-app', 'if': 'CONFIG_SPICE' },
+    { 'name': 'dbus', 'if': 'CONFIG_DBUS_DISPLAY' }
+  ]
+}
 
 ##
 # @DisplayOptions:
@@ -1227,7 +1249,8 @@
       'gtk': { 'type': 'DisplayGTK', 'if': 'CONFIG_GTK' },
       'curses': { 'type': 'DisplayCurses', 'if': 'CONFIG_CURSES' },
       'egl-headless': { 'type': 'DisplayEGLHeadless',
-                        'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } }
+                        'if': { 'all': ['CONFIG_OPENGL', 'CONFIG_GBM'] } },
+      'dbus': { 'type': 'DisplayDBus', 'if': 'CONFIG_DBUS_DISPLAY' }
   }
 }
 
diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
index 9d591f9ee4ad..c0cbb1ca44d3 100644
--- a/include/qemu/dbus.h
+++ b/include/qemu/dbus.h
@@ -12,6 +12,25 @@
 
 #include <gio/gio.h>
 
+/* glib/gio 2.68 */
+#define DBUS_METHOD_INVOCATION_HANDLED TRUE
+#define DBUS_METHOD_INVOCATION_UNHANDLED FALSE
+
+/* in msec */
+#define DBUS_DEFAULT_TIMEOUT 1000
+
+#define DBUS_DISPLAY1_ROOT "/org/qemu/Display1"
+
+#define DBUS_DISPLAY_ERROR (dbus_display_error_quark())
+GQuark dbus_display_error_quark(void);
+
+typedef enum {
+    DBUS_DISPLAY_ERROR_FAILED,
+    DBUS_DISPLAY_ERROR_INVALID,
+    DBUS_DISPLAY_ERROR_UNSUPPORTED,
+    DBUS_DISPLAY_N_ERRORS,
+} DBusDisplayError;
+
 GStrv qemu_dbus_get_queued_owners(GDBusConnection *connection,
                                   const char *name,
                                   Error **errp);
diff --git a/ui/dbus.h b/ui/dbus.h
new file mode 100644
index 000000000000..d3c9598dd133
--- /dev/null
+++ b/ui/dbus.h
@@ -0,0 +1,83 @@
+/*
+ * QEMU DBus display
+ *
+ * Copyright (c) 2021 Marc-André Lureau <marcandre.lureau@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#ifndef UI_DBUS_H_
+#define UI_DBUS_H_
+
+#include "qemu/dbus.h"
+#include "qom/object.h"
+#include "ui/console.h"
+
+#include "dbus-display1.h"
+
+struct DBusDisplay {
+    Object parent;
+
+    DisplayGLMode gl_mode;
+    char *dbus_addr;
+    DisplayGLCtx glctx;
+
+    GDBusConnection *bus;
+    GDBusObjectManagerServer *server;
+    QemuDBusDisplay1VM *iface;
+    GPtrArray *consoles;
+};
+
+#define TYPE_DBUS_DISPLAY "dbus-display"
+OBJECT_DECLARE_SIMPLE_TYPE(DBusDisplay, DBUS_DISPLAY)
+
+#define DBUS_DISPLAY_TYPE_CONSOLE dbus_display_console_get_type()
+G_DECLARE_FINAL_TYPE(DBusDisplayConsole,
+                     dbus_display_console,
+                     DBUS_DISPLAY,
+                     CONSOLE,
+                     GDBusObjectSkeleton)
+
+DBusDisplayConsole *
+dbus_display_console_new(DBusDisplay *display, QemuConsole *con);
+
+int
+dbus_display_console_get_index(DBusDisplayConsole *ddc);
+
+#define DBUS_DISPLAY_TYPE_LISTENER dbus_display_listener_get_type()
+G_DECLARE_FINAL_TYPE(DBusDisplayListener,
+                     dbus_display_listener,
+                     DBUS_DISPLAY,
+                     LISTENER,
+                     GObject)
+
+DBusDisplayListener *
+dbus_display_listener_new(const char *bus_name,
+                          GDBusConnection *conn,
+                          DBusDisplayConsole *console);
+
+DBusDisplayConsole *
+dbus_display_listener_get_console(DBusDisplayListener *ddl);
+
+const char *
+dbus_display_listener_get_bus_name(DBusDisplayListener *ddl);
+
+extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
+extern const DisplayChangeListenerOps dbus_dcl_ops;
+
+#endif /* UI_DBUS_H_ */
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
new file mode 100644
index 000000000000..1ccf638c1061
--- /dev/null
+++ b/ui/dbus-console.c
@@ -0,0 +1,497 @@
+/*
+ * QEMU DBus display console
+ *
+ * Copyright (c) 2021 Marc-André Lureau <marcandre.lureau@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "ui/input.h"
+#include "ui/kbd-state.h"
+#include "trace.h"
+
+#include <gio/gunixfdlist.h>
+
+#include "dbus.h"
+
+struct _DBusDisplayConsole {
+    GDBusObjectSkeleton parent_instance;
+    DisplayChangeListener dcl;
+
+    DBusDisplay *display;
+    QemuConsole *con;
+    GHashTable *listeners;
+    QemuDBusDisplay1Console *iface;
+
+    QemuDBusDisplay1Keyboard *iface_kbd;
+    QKbdState *kbd;
+
+    QemuDBusDisplay1Mouse *iface_mouse;
+    gboolean last_set;
+    guint last_x;
+    guint last_y;
+    Notifier mouse_mode_notifier;
+};
+
+G_DEFINE_TYPE(DBusDisplayConsole,
+              dbus_display_console,
+              G_TYPE_DBUS_OBJECT_SKELETON)
+
+static void
+dbus_display_console_set_size(DBusDisplayConsole *ddc,
+                              uint32_t width, uint32_t height)
+{
+    g_object_set(ddc->iface,
+                 "width", width,
+                 "height", height,
+                 NULL);
+}
+
+static void
+dbus_gfx_switch(DisplayChangeListener *dcl,
+                struct DisplaySurface *new_surface)
+{
+    DBusDisplayConsole *ddc = container_of(dcl, DBusDisplayConsole, dcl);
+
+    dbus_display_console_set_size(ddc,
+                                  surface_width(new_surface),
+                                  surface_height(new_surface));
+}
+
+static void
+dbus_gfx_update(DisplayChangeListener *dcl,
+                int x, int y, int w, int h)
+{
+}
+
+static void
+dbus_gl_scanout_disable(DisplayChangeListener *dcl)
+{
+}
+
+static void
+dbus_gl_scanout_texture(DisplayChangeListener *dcl,
+                        uint32_t tex_id,
+                        bool backing_y_0_top,
+                        uint32_t backing_width,
+                        uint32_t backing_height,
+                        uint32_t x, uint32_t y,
+                        uint32_t w, uint32_t h)
+{
+    DBusDisplayConsole *ddc = container_of(dcl, DBusDisplayConsole, dcl);
+
+    dbus_display_console_set_size(ddc, w, h);
+}
+
+static void
+dbus_gl_scanout_dmabuf(DisplayChangeListener *dcl,
+                       QemuDmaBuf *dmabuf)
+{
+    DBusDisplayConsole *ddc = container_of(dcl, DBusDisplayConsole, dcl);
+
+    dbus_display_console_set_size(ddc,
+                                  dmabuf->width,
+                                  dmabuf->height);
+}
+
+static void
+dbus_gl_scanout_update(DisplayChangeListener *dcl,
+                       uint32_t x, uint32_t y,
+                       uint32_t w, uint32_t h)
+{
+}
+
+static const DisplayChangeListenerOps dbus_console_dcl_ops = {
+    .dpy_name                = "dbus-console",
+    .dpy_gfx_switch          = dbus_gfx_switch,
+    .dpy_gfx_update          = dbus_gfx_update,
+    .dpy_gl_scanout_disable  = dbus_gl_scanout_disable,
+    .dpy_gl_scanout_texture  = dbus_gl_scanout_texture,
+    .dpy_gl_scanout_dmabuf   = dbus_gl_scanout_dmabuf,
+    .dpy_gl_update           = dbus_gl_scanout_update,
+};
+
+static void
+dbus_display_console_init(DBusDisplayConsole *object)
+{
+    DBusDisplayConsole *ddc = DBUS_DISPLAY_CONSOLE(object);
+
+    ddc->listeners = g_hash_table_new_full(g_str_hash, g_str_equal,
+                                            NULL, g_object_unref);
+    ddc->dcl.ops = &dbus_console_dcl_ops;
+}
+
+static void
+dbus_display_console_dispose(GObject *object)
+{
+    DBusDisplayConsole *ddc = DBUS_DISPLAY_CONSOLE(object);
+
+    unregister_displaychangelistener(&ddc->dcl);
+    g_clear_object(&ddc->iface_kbd);
+    g_clear_object(&ddc->iface);
+    g_clear_pointer(&ddc->listeners, g_hash_table_unref);
+    g_clear_pointer(&ddc->kbd, qkbd_state_free);
+
+    G_OBJECT_CLASS(dbus_display_console_parent_class)->dispose(object);
+}
+
+static void
+dbus_display_console_class_init(DBusDisplayConsoleClass *klass)
+{
+    GObjectClass *gobject_class = G_OBJECT_CLASS(klass);
+
+    gobject_class->dispose = dbus_display_console_dispose;
+}
+
+static void
+listener_vanished_cb(DBusDisplayListener *listener)
+{
+    DBusDisplayConsole *ddc = dbus_display_listener_get_console(listener);
+    const char *name = dbus_display_listener_get_bus_name(listener);
+
+    trace_dbus_listener_vanished(name);
+
+    g_hash_table_remove(ddc->listeners, name);
+    qkbd_state_lift_all_keys(ddc->kbd);
+}
+
+static gboolean
+dbus_console_set_ui_info(DBusDisplayConsole *ddc,
+                         GDBusMethodInvocation *invocation,
+                         guint16 arg_width_mm,
+                         guint16 arg_height_mm,
+                         gint arg_xoff,
+                         gint arg_yoff,
+                         guint arg_width,
+                         guint arg_height)
+{
+    QemuUIInfo info = {
+        .width_mm = arg_width_mm,
+        .height_mm = arg_height_mm,
+        .xoff = arg_xoff,
+        .yoff = arg_yoff,
+        .width = arg_width,
+        .height = arg_height,
+    };
+
+    if (!dpy_ui_info_supported(ddc->con)) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_UNSUPPORTED,
+                                              "SetUIInfo is not supported");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    dpy_set_ui_info(ddc->con, &info, false);
+    qemu_dbus_display1_console_complete_set_uiinfo(ddc->iface, invocation);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_console_register_listener(DBusDisplayConsole *ddc,
+                               GDBusMethodInvocation *invocation,
+                               GUnixFDList *fd_list,
+                               GVariant *arg_listener)
+{
+    const char *sender = g_dbus_method_invocation_get_sender(invocation);
+    GDBusConnection *listener_conn;
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GSocket) socket = NULL;
+    g_autoptr(GSocketConnection) socket_conn = NULL;
+    g_autofree char *guid = g_dbus_generate_guid();
+    DBusDisplayListener *listener;
+    int fd;
+
+    if (g_hash_table_contains(ddc->listeners, sender)) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_INVALID,
+            "`%s` is already registered!",
+            sender);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    fd = g_unix_fd_list_get(fd_list, g_variant_get_handle(arg_listener), &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Couldn't get peer fd: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    socket = g_socket_new_from_fd(fd, &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Couldn't make a socket: %s", err->message);
+        close(fd);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+    socket_conn = g_socket_connection_factory_create_connection(socket);
+
+    qemu_dbus_display1_console_complete_register_listener(
+        ddc->iface, invocation, NULL);
+
+    listener_conn = g_dbus_connection_new_sync(
+        G_IO_STREAM(socket_conn),
+        guid,
+        G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+        NULL, NULL, &err);
+    if (err) {
+        error_report("Failed to setup peer connection: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    listener = dbus_display_listener_new(sender, listener_conn, ddc);
+    if (!listener) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    g_hash_table_insert(ddc->listeners,
+                        (gpointer)dbus_display_listener_get_bus_name(listener),
+                        listener);
+    g_object_connect(listener_conn,
+                     "swapped-signal::closed", listener_vanished_cb, listener,
+                     NULL);
+
+    trace_dbus_registered_listener(sender);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_kbd_press(DBusDisplayConsole *ddc,
+               GDBusMethodInvocation *invocation,
+               guint arg_keycode)
+{
+    QKeyCode qcode = qemu_input_key_number_to_qcode(arg_keycode);
+
+    trace_dbus_kbd_press(arg_keycode);
+
+    qkbd_state_key_event(ddc->kbd, qcode, true);
+
+    qemu_dbus_display1_keyboard_complete_press(ddc->iface_kbd, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_kbd_release(DBusDisplayConsole *ddc,
+                 GDBusMethodInvocation *invocation,
+                 guint arg_keycode)
+{
+    QKeyCode qcode = qemu_input_key_number_to_qcode(arg_keycode);
+
+    trace_dbus_kbd_release(arg_keycode);
+
+    qkbd_state_key_event(ddc->kbd, qcode, false);
+
+    qemu_dbus_display1_keyboard_complete_release(ddc->iface_kbd, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static void
+dbus_kbd_qemu_leds_updated(void *data, int ledstate)
+{
+    DBusDisplayConsole *ddc = DBUS_DISPLAY_CONSOLE(data);
+
+    qemu_dbus_display1_keyboard_set_modifiers(ddc->iface_kbd, ledstate);
+}
+
+static gboolean
+dbus_mouse_rel_motion(DBusDisplayConsole *ddc,
+                      GDBusMethodInvocation *invocation,
+                      int dx, int dy)
+{
+    trace_dbus_mouse_rel_motion(dx, dy);
+
+    if (qemu_input_is_absolute()) {
+        g_dbus_method_invocation_return_error(
+            invocation, DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_INVALID,
+            "Mouse is not relative");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    qemu_input_queue_rel(ddc->con, INPUT_AXIS_X, dx);
+    qemu_input_queue_rel(ddc->con, INPUT_AXIS_Y, dy);
+    qemu_input_event_sync();
+
+    qemu_dbus_display1_mouse_complete_rel_motion(ddc->iface_mouse,
+                                                    invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_mouse_set_pos(DBusDisplayConsole *ddc,
+                   GDBusMethodInvocation *invocation,
+                   guint x, guint y)
+{
+    int width, height;
+
+    trace_dbus_mouse_set_pos(x, y);
+
+    if (!qemu_input_is_absolute()) {
+        g_dbus_method_invocation_return_error(
+            invocation, DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_INVALID,
+            "Mouse is not absolute");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    width = qemu_console_get_width(ddc->con, 0);
+    height = qemu_console_get_height(ddc->con, 0);
+    if (x >= width || y >= height) {
+        g_dbus_method_invocation_return_error(
+            invocation, DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_INVALID,
+            "Invalid mouse position");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+    qemu_input_queue_abs(ddc->con, INPUT_AXIS_X, x, 0, width);
+    qemu_input_queue_abs(ddc->con, INPUT_AXIS_Y, y, 0, height);
+    qemu_input_event_sync();
+
+    qemu_dbus_display1_mouse_complete_set_abs_position(ddc->iface_mouse,
+                                                          invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_mouse_press(DBusDisplayConsole *ddc,
+                 GDBusMethodInvocation *invocation,
+                 guint button)
+{
+    trace_dbus_mouse_press(button);
+
+    qemu_input_queue_btn(ddc->con, button, true);
+    qemu_input_event_sync();
+
+    qemu_dbus_display1_mouse_complete_press(ddc->iface_mouse, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_mouse_release(DBusDisplayConsole *ddc,
+                   GDBusMethodInvocation *invocation,
+                   guint button)
+{
+    trace_dbus_mouse_release(button);
+
+    qemu_input_queue_btn(ddc->con, button, false);
+    qemu_input_event_sync();
+
+    qemu_dbus_display1_mouse_complete_release(ddc->iface_mouse, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static void
+dbus_mouse_mode_change(Notifier *notify, void *data)
+{
+    DBusDisplayConsole *ddc =
+        container_of(notify, DBusDisplayConsole, mouse_mode_notifier);
+
+    g_object_set(ddc->iface_mouse,
+                 "is-absolute", qemu_input_is_absolute(),
+                 NULL);
+}
+
+int dbus_display_console_get_index(DBusDisplayConsole *ddc)
+{
+    return qemu_console_get_index(ddc->con);
+}
+
+DBusDisplayConsole *
+dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
+{
+    g_autofree char *path = NULL;
+    g_autofree char *label = NULL;
+    char device_addr[256] = "";
+    DBusDisplayConsole *ddc;
+    int idx;
+
+    assert(display);
+    assert(con);
+
+    label = qemu_console_get_label(con);
+    idx = qemu_console_get_index(con);
+    path = g_strdup_printf(DBUS_DISPLAY1_ROOT "/Console_%d", idx);
+    ddc = g_object_new(DBUS_DISPLAY_TYPE_CONSOLE,
+                        "g-object-path", path,
+                        NULL);
+    ddc->display = display;
+    ddc->con = con;
+    /* handle errors, and skip non graphics? */
+    qemu_console_fill_device_address(
+        con, device_addr, sizeof(device_addr), NULL);
+
+    ddc->iface = qemu_dbus_display1_console_skeleton_new();
+    g_object_set(ddc->iface,
+        "label", label,
+        "type", qemu_console_is_graphic(con) ? "Graphic" : "Text",
+        "head", qemu_console_get_head(con),
+        "width", qemu_console_get_width(con, 0),
+        "height", qemu_console_get_height(con, 0),
+        "device-address", device_addr,
+        NULL);
+    g_object_connect(ddc->iface,
+        "swapped-signal::handle-register-listener",
+        dbus_console_register_listener, ddc,
+        "swapped-signal::handle-set-uiinfo",
+        dbus_console_set_ui_info, ddc,
+        NULL);
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
+        G_DBUS_INTERFACE_SKELETON(ddc->iface));
+
+    ddc->kbd = qkbd_state_init(con);
+    ddc->iface_kbd = qemu_dbus_display1_keyboard_skeleton_new();
+    qemu_add_led_event_handler(dbus_kbd_qemu_leds_updated, ddc);
+    g_object_connect(ddc->iface_kbd,
+        "swapped-signal::handle-press", dbus_kbd_press, ddc,
+        "swapped-signal::handle-release", dbus_kbd_release, ddc,
+        NULL);
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
+        G_DBUS_INTERFACE_SKELETON(ddc->iface_kbd));
+
+    ddc->iface_mouse = qemu_dbus_display1_mouse_skeleton_new();
+    g_object_connect(ddc->iface_mouse,
+        "swapped-signal::handle-set-abs-position", dbus_mouse_set_pos, ddc,
+        "swapped-signal::handle-rel-motion", dbus_mouse_rel_motion, ddc,
+        "swapped-signal::handle-press", dbus_mouse_press, ddc,
+        "swapped-signal::handle-release", dbus_mouse_release, ddc,
+        NULL);
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(ddc),
+        G_DBUS_INTERFACE_SKELETON(ddc->iface_mouse));
+
+    register_displaychangelistener(&ddc->dcl);
+    ddc->mouse_mode_notifier.notify = dbus_mouse_mode_change;
+    qemu_add_mouse_mode_change_notifier(&ddc->mouse_mode_notifier);
+
+    return ddc;
+}
diff --git a/ui/dbus-error.c b/ui/dbus-error.c
new file mode 100644
index 000000000000..85a9194d57e8
--- /dev/null
+++ b/ui/dbus-error.c
@@ -0,0 +1,48 @@
+/*
+ * QEMU DBus display errors
+ *
+ * Copyright (c) 2021 Marc-André Lureau <marcandre.lureau@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "dbus.h"
+
+static const GDBusErrorEntry dbus_display_error_entries[] = {
+    { DBUS_DISPLAY_ERROR_FAILED, "org.qemu.Display1.Error.Failed" },
+    { DBUS_DISPLAY_ERROR_INVALID, "org.qemu.Display1.Error.Invalid" },
+    { DBUS_DISPLAY_ERROR_UNSUPPORTED, "org.qemu.Display1.Error.Unsupported" },
+};
+
+G_STATIC_ASSERT(G_N_ELEMENTS(dbus_display_error_entries) ==
+                DBUS_DISPLAY_N_ERRORS);
+
+GQuark
+dbus_display_error_quark(void)
+{
+    static gsize quark;
+
+    g_dbus_error_register_error_domain(
+        "dbus-display-error-quark",
+        &quark,
+        dbus_display_error_entries,
+        G_N_ELEMENTS(dbus_display_error_entries));
+
+    return (GQuark)quark;
+}
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
new file mode 100644
index 000000000000..20094fc18abe
--- /dev/null
+++ b/ui/dbus-listener.c
@@ -0,0 +1,486 @@
+/*
+ * QEMU DBus display console
+ *
+ * Copyright (c) 2021 Marc-André Lureau <marcandre.lureau@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "sysemu/sysemu.h"
+#include "dbus.h"
+#include <gio/gunixfdlist.h>
+
+#include "ui/shader.h"
+#include "ui/egl-helpers.h"
+#include "ui/egl-context.h"
+#include "trace.h"
+
+struct _DBusDisplayListener {
+    GObject parent;
+
+    char *bus_name;
+    DBusDisplayConsole *console;
+    GDBusConnection *conn;
+
+    QemuDBusDisplay1Listener *proxy;
+
+    DisplayChangeListener dcl;
+    DisplaySurface *ds;
+    QemuGLShader *gls;
+    int gl_updates;
+};
+
+G_DEFINE_TYPE(DBusDisplayListener, dbus_display_listener, G_TYPE_OBJECT)
+
+static void dbus_update_gl_cb(GObject *source_object,
+                           GAsyncResult *res,
+                           gpointer user_data)
+{
+    g_autoptr(GError) err = NULL;
+    DBusDisplayListener *ddl = user_data;
+
+    if (!qemu_dbus_display1_listener_call_update_dmabuf_finish(ddl->proxy,
+                                                               res, &err)) {
+        error_report("Failed to call update: %s", err->message);
+    }
+
+    graphic_hw_gl_block(ddl->dcl.con, false);
+    g_object_unref(ddl);
+}
+
+static void dbus_call_update_gl(DBusDisplayListener *ddl,
+                                int x, int y, int w, int h)
+{
+    graphic_hw_gl_block(ddl->dcl.con, true);
+    glFlush();
+    qemu_dbus_display1_listener_call_update_dmabuf(ddl->proxy,
+        x, y, w, h,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL,
+        dbus_update_gl_cb,
+        g_object_ref(ddl));
+}
+
+static void dbus_scanout_disable(DisplayChangeListener *dcl)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    ddl->ds = NULL;
+    qemu_dbus_display1_listener_call_disable(
+        ddl->proxy, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void dbus_scanout_dmabuf(DisplayChangeListener *dcl,
+                                QemuDmaBuf *dmabuf)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GUnixFDList) fd_list = NULL;
+
+    fd_list = g_unix_fd_list_new();
+    if (g_unix_fd_list_append(fd_list, dmabuf->fd, &err) != 0) {
+        error_report("Failed to setup dmabuf fdlist: %s", err->message);
+        return;
+    }
+
+    qemu_dbus_display1_listener_call_scanout_dmabuf(
+        ddl->proxy,
+        g_variant_new_handle(0),
+        dmabuf->width,
+        dmabuf->height,
+        dmabuf->stride,
+        dmabuf->fourcc,
+        dmabuf->modifier,
+        dmabuf->y0_top,
+        G_DBUS_CALL_FLAGS_NONE,
+        -1,
+        fd_list,
+        NULL, NULL, NULL);
+}
+
+static void dbus_scanout_texture(DisplayChangeListener *dcl,
+                                 uint32_t tex_id,
+                                 bool backing_y_0_top,
+                                 uint32_t backing_width,
+                                 uint32_t backing_height,
+                                 uint32_t x, uint32_t y,
+                                 uint32_t w, uint32_t h)
+{
+    QemuDmaBuf dmabuf = {
+        .width = backing_width,
+        .height = backing_height,
+        .y0_top = backing_y_0_top,
+    };
+
+    assert(tex_id);
+    dmabuf.fd = egl_get_fd_for_texture(
+        tex_id, (EGLint *)&dmabuf.stride,
+        (EGLint *)&dmabuf.fourcc,
+        &dmabuf.modifier);
+    if (dmabuf.fd < 0) {
+        error_report("%s: failed to get fd for texture", __func__);
+        return;
+    }
+
+    dbus_scanout_dmabuf(dcl, &dmabuf);
+    close(dmabuf.fd);
+}
+
+static void dbus_cursor_dmabuf(DisplayChangeListener *dcl,
+                               QemuDmaBuf *dmabuf, bool have_hot,
+                               uint32_t hot_x, uint32_t hot_y)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    DisplaySurface *ds;
+    GVariant *v_data = NULL;
+    egl_fb cursor_fb;
+
+    if (!dmabuf) {
+        qemu_dbus_display1_listener_call_mouse_set(
+            ddl->proxy, 0, 0, false,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        return;
+    }
+
+    egl_dmabuf_import_texture(dmabuf);
+    if (!dmabuf->texture) {
+        return;
+    }
+    egl_fb_setup_for_tex(&cursor_fb, dmabuf->width, dmabuf->height,
+                         dmabuf->texture, false);
+    ds = qemu_create_displaysurface(dmabuf->width, dmabuf->height);
+    egl_fb_read(ds, &cursor_fb);
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        surface_data(ds),
+        surface_width(ds) * surface_height(ds) * 4,
+        TRUE,
+        (GDestroyNotify)qemu_free_displaysurface,
+        ds);
+    qemu_dbus_display1_listener_call_cursor_define(
+        ddl->proxy,
+        surface_width(ds),
+        surface_height(ds),
+        hot_x,
+        hot_y,
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        -1,
+        NULL,
+        NULL,
+        NULL);
+}
+
+static void dbus_cursor_position(DisplayChangeListener *dcl,
+                                 uint32_t pos_x, uint32_t pos_y)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    qemu_dbus_display1_listener_call_mouse_set(
+        ddl->proxy, pos_x, pos_y, true,
+        G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void dbus_release_dmabuf(DisplayChangeListener *dcl,
+                                QemuDmaBuf *dmabuf)
+{
+    dbus_scanout_disable(dcl);
+}
+
+static void dbus_scanout_update(DisplayChangeListener *dcl,
+                                uint32_t x, uint32_t y,
+                                uint32_t w, uint32_t h)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    dbus_call_update_gl(ddl, x, y, w, h);
+}
+
+static void dbus_gl_refresh(DisplayChangeListener *dcl)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    graphic_hw_update(dcl->con);
+
+    if (!ddl->ds || qemu_console_is_gl_blocked(ddl->dcl.con)) {
+        return;
+    }
+
+    if (ddl->gl_updates) {
+        dbus_call_update_gl(ddl, 0, 0,
+                            surface_width(ddl->ds), surface_height(ddl->ds));
+        ddl->gl_updates = 0;
+    }
+}
+
+static void dbus_refresh(DisplayChangeListener *dcl)
+{
+    graphic_hw_update(dcl->con);
+}
+
+static void dbus_gl_gfx_update(DisplayChangeListener *dcl,
+                               int x, int y, int w, int h)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    if (ddl->ds) {
+        surface_gl_update_texture(ddl->gls, ddl->ds, x, y, w, h);
+    }
+
+    ddl->gl_updates++;
+}
+
+static void dbus_gfx_update(DisplayChangeListener *dcl,
+                            int x, int y, int w, int h)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    pixman_image_t *img;
+    GVariant *v_data;
+    size_t stride;
+
+    assert(ddl->ds);
+    stride = w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format(ddl->ds)), 8);
+
+    trace_dbus_update(x, y, w, h);
+
+    /* make a copy, since gvariant only handles linear data */
+    img = pixman_image_create_bits(surface_format(ddl->ds),
+                                   w, h, NULL, stride);
+    pixman_image_composite(PIXMAN_OP_SRC, ddl->ds->image, NULL, img,
+                           x, y, 0, 0, 0, 0, w, h);
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        pixman_image_get_data(img),
+        pixman_image_get_stride(img) * h,
+        TRUE,
+        (GDestroyNotify)pixman_image_unref,
+        img);
+    qemu_dbus_display1_listener_call_update(ddl->proxy,
+        x, y, w, h, pixman_image_get_stride(img), pixman_image_get_format(img),
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+}
+
+static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
+                               struct DisplaySurface *new_surface)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    if (ddl->ds) {
+        surface_gl_destroy_texture(ddl->gls, ddl->ds);
+    }
+    ddl->ds = new_surface;
+    if (ddl->ds) {
+        int width = surface_width(ddl->ds);
+        int height = surface_height(ddl->ds);
+
+        surface_gl_create_texture(ddl->gls, ddl->ds);
+        /* TODO: lazy send dmabuf (there are unnecessary sent otherwise) */
+        dbus_scanout_texture(&ddl->dcl, ddl->ds->texture, false,
+                             width, height, 0, 0, width, height);
+    }
+}
+
+static void dbus_gfx_switch(DisplayChangeListener *dcl,
+                            struct DisplaySurface *new_surface)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    GVariant *v_data = NULL;
+
+    ddl->ds = new_surface;
+    if (!ddl->ds) {
+        /* why not call disable instead? */
+        return;
+    }
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        surface_data(ddl->ds),
+        surface_stride(ddl->ds) * surface_height(ddl->ds),
+        TRUE,
+        (GDestroyNotify)pixman_image_unref,
+        pixman_image_ref(ddl->ds->image));
+    qemu_dbus_display1_listener_call_scanout(ddl->proxy,
+        surface_width(ddl->ds),
+        surface_height(ddl->ds),
+        surface_stride(ddl->ds),
+        surface_format(ddl->ds),
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+}
+
+static void dbus_mouse_set(DisplayChangeListener *dcl,
+                           int x, int y, int on)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+
+    qemu_dbus_display1_listener_call_mouse_set(
+        ddl->proxy, x, y, on, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void dbus_cursor_define(DisplayChangeListener *dcl,
+                               QEMUCursor *c)
+{
+    DBusDisplayListener *ddl = container_of(dcl, DBusDisplayListener, dcl);
+    GVariant *v_data = NULL;
+
+    cursor_get(c);
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        c->data,
+        c->width * c->height * 4,
+        TRUE,
+        (GDestroyNotify)cursor_put,
+        c);
+
+    qemu_dbus_display1_listener_call_cursor_define(
+        ddl->proxy,
+        c->width,
+        c->height,
+        c->hot_x,
+        c->hot_y,
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        -1,
+        NULL,
+        NULL,
+        NULL);
+}
+
+const DisplayChangeListenerOps dbus_gl_dcl_ops = {
+    .dpy_name                = "dbus-gl",
+    .dpy_gfx_update          = dbus_gl_gfx_update,
+    .dpy_gfx_switch          = dbus_gl_gfx_switch,
+    .dpy_gfx_check_format    = console_gl_check_format,
+    .dpy_refresh             = dbus_gl_refresh,
+    .dpy_mouse_set           = dbus_mouse_set,
+    .dpy_cursor_define       = dbus_cursor_define,
+
+    .dpy_gl_scanout_disable  = dbus_scanout_disable,
+    .dpy_gl_scanout_texture  = dbus_scanout_texture,
+    .dpy_gl_scanout_dmabuf   = dbus_scanout_dmabuf,
+    .dpy_gl_cursor_dmabuf    = dbus_cursor_dmabuf,
+    .dpy_gl_cursor_position  = dbus_cursor_position,
+    .dpy_gl_release_dmabuf   = dbus_release_dmabuf,
+    .dpy_gl_update           = dbus_scanout_update,
+};
+
+const DisplayChangeListenerOps dbus_dcl_ops = {
+    .dpy_name                = "dbus",
+    .dpy_gfx_update          = dbus_gfx_update,
+    .dpy_gfx_switch          = dbus_gfx_switch,
+    .dpy_refresh             = dbus_refresh,
+    .dpy_mouse_set           = dbus_mouse_set,
+    .dpy_cursor_define       = dbus_cursor_define,
+};
+
+static void
+dbus_display_listener_dispose(GObject *object)
+{
+    DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
+
+    unregister_displaychangelistener(&ddl->dcl);
+    g_clear_object(&ddl->conn);
+    g_clear_pointer(&ddl->bus_name, g_free);
+    g_clear_object(&ddl->proxy);
+    g_clear_pointer(&ddl->gls, qemu_gl_fini_shader);
+
+    G_OBJECT_CLASS(dbus_display_listener_parent_class)->dispose(object);
+}
+
+static void
+dbus_display_listener_constructed(GObject *object)
+{
+    DBusDisplayListener *ddl = DBUS_DISPLAY_LISTENER(object);
+
+    if (display_opengl) {
+        ddl->gls = qemu_gl_init_shader();
+        ddl->dcl.ops = &dbus_gl_dcl_ops;
+    } else {
+        ddl->dcl.ops = &dbus_dcl_ops;
+    }
+
+    G_OBJECT_CLASS(dbus_display_listener_parent_class)->constructed(object);
+}
+
+static void
+dbus_display_listener_class_init(DBusDisplayListenerClass *klass)
+{
+    GObjectClass *object_class = G_OBJECT_CLASS(klass);
+
+    object_class->dispose = dbus_display_listener_dispose;
+    object_class->constructed = dbus_display_listener_constructed;
+}
+
+static void
+dbus_display_listener_init(DBusDisplayListener *ddl)
+{
+}
+
+const char *
+dbus_display_listener_get_bus_name(DBusDisplayListener *ddl)
+{
+    return ddl->bus_name;
+}
+
+DBusDisplayConsole *
+dbus_display_listener_get_console(DBusDisplayListener *ddl)
+{
+    return ddl->console;
+}
+
+DBusDisplayListener *
+dbus_display_listener_new(const char *bus_name,
+                          GDBusConnection *conn,
+                          DBusDisplayConsole *console)
+{
+    DBusDisplayListener *ddl;
+    QemuConsole *con;
+    g_autoptr(GError) err = NULL;
+
+    ddl = g_object_new(DBUS_DISPLAY_TYPE_LISTENER, NULL);
+    ddl->proxy =
+        qemu_dbus_display1_listener_proxy_new_sync(conn,
+            G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+            NULL,
+            "/org/qemu/Display1/Listener",
+            NULL,
+            &err);
+    if (!ddl->proxy) {
+        error_report("Failed to setup proxy: %s", err->message);
+        g_object_unref(conn);
+        g_object_unref(ddl);
+        return NULL;
+    }
+
+    ddl->bus_name = g_strdup(bus_name);
+    ddl->conn = conn;
+    ddl->console = console;
+
+    con = qemu_console_lookup_by_index(dbus_display_console_get_index(console));
+    assert(con);
+    ddl->dcl.con = con;
+    register_displaychangelistener(&ddl->dcl);
+
+    return ddl;
+}
diff --git a/ui/dbus.c b/ui/dbus.c
new file mode 100644
index 000000000000..12da8ffe31e0
--- /dev/null
+++ b/ui/dbus.c
@@ -0,0 +1,262 @@
+/*
+ * QEMU DBus display
+ *
+ * Copyright (c) 2021 Marc-André Lureau <marcandre.lureau@redhat.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "qemu/dbus.h"
+#include "qemu/option.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/sysemu.h"
+#include "ui/egl-helpers.h"
+#include "ui/egl-context.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+#include "dbus.h"
+
+static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
+                                         QEMUGLParams *params)
+{
+    eglMakeCurrent(qemu_egl_display, EGL_NO_SURFACE, EGL_NO_SURFACE,
+                   qemu_egl_rn_ctx);
+    return qemu_egl_create_context(dgc, params);
+}
+
+static const DisplayGLCtxOps dbus_gl_ops = {
+    .compatible_dcl          = &dbus_gl_dcl_ops,
+    .dpy_gl_ctx_create       = dbus_create_context,
+    .dpy_gl_ctx_destroy      = qemu_egl_destroy_context,
+    .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
+};
+
+static void
+dbus_display_init(Object *o)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+    g_autoptr(GDBusObjectSkeleton) vm = NULL;
+
+    dd->glctx.ops = &dbus_gl_ops;
+    dd->iface = qemu_dbus_display1_vm_skeleton_new();
+    dd->consoles = g_ptr_array_new_with_free_func(g_object_unref);
+
+    dd->server = g_dbus_object_manager_server_new(DBUS_DISPLAY1_ROOT);
+
+    vm = g_dbus_object_skeleton_new(DBUS_DISPLAY1_ROOT "/VM");
+    g_dbus_object_skeleton_add_interface(
+        vm, G_DBUS_INTERFACE_SKELETON(dd->iface));
+    g_dbus_object_manager_server_export(dd->server, vm);
+}
+
+static void
+dbus_display_finalize(Object *o)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    g_clear_object(&dd->server);
+    g_clear_pointer(&dd->consoles, g_ptr_array_unref);
+    g_clear_object(&dd->bus);
+    g_clear_object(&dd->iface);
+    g_free(dd->dbus_addr);
+}
+
+static bool
+dbus_display_add_console(DBusDisplay *dd, int idx, Error **errp)
+{
+    QemuConsole *con;
+    DBusDisplayConsole *dbus_console;
+
+    con = qemu_console_lookup_by_index(idx);
+    assert(con);
+
+    if (qemu_console_is_graphic(con) &&
+        dd->gl_mode != DISPLAYGL_MODE_OFF) {
+        qemu_console_set_display_gl_ctx(con, &dd->glctx);
+    }
+
+    dbus_console = dbus_display_console_new(dd, con);
+    g_ptr_array_insert(dd->consoles, idx, dbus_console);
+    g_dbus_object_manager_server_export(dd->server,
+                                        G_DBUS_OBJECT_SKELETON(dbus_console));
+    return true;
+}
+
+static void
+dbus_display_complete(UserCreatable *uc, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(uc);
+    g_autoptr(GError) err = NULL;
+    g_autofree char *uuid = qemu_uuid_unparse_strdup(&qemu_uuid);
+    g_autoptr(GArray) consoles = NULL;
+    GVariant *console_ids;
+    int idx;
+
+    if (!object_resolve_path_type("", TYPE_DBUS_DISPLAY, NULL)) {
+        error_setg(errp, "There is already an instance of %s",
+                   TYPE_DBUS_DISPLAY);
+        return;
+    }
+
+    if (dd->dbus_addr && *dd->dbus_addr) {
+        dd->bus = g_dbus_connection_new_for_address_sync(dd->dbus_addr,
+                        G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+                        G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+                        NULL, NULL, &err);
+    } else {
+        dd->bus = g_bus_get_sync(G_BUS_TYPE_SESSION, NULL, &err);
+    }
+    if (err) {
+        error_setg(errp, "failed to connect to DBus: %s", err->message);
+        return;
+    }
+
+
+    consoles = g_array_new(FALSE, FALSE, sizeof(guint32));
+    for (idx = 0;; idx++) {
+        if (!qemu_console_lookup_by_index(idx)) {
+            break;
+        }
+        if (!dbus_display_add_console(dd, idx, errp)) {
+            return;
+        }
+        g_array_append_val(consoles, idx);
+    }
+
+    console_ids = g_variant_new_from_data(
+        G_VARIANT_TYPE("au"),
+        consoles->data, consoles->len * sizeof(guint32), TRUE,
+        (GDestroyNotify)g_array_unref, consoles);
+    g_steal_pointer(&consoles);
+    g_object_set(dd->iface,
+                 "name", qemu_name ?: "QEMU " QEMU_VERSION,
+                 "uuid", uuid,
+                 "console-ids", console_ids,
+                 NULL);
+
+    g_dbus_object_manager_server_set_connection(dd->server, dd->bus);
+    g_bus_own_name_on_connection(dd->bus, "org.qemu",
+                                 G_BUS_NAME_OWNER_FLAGS_NONE,
+                                 NULL, NULL, NULL, NULL);
+}
+
+static char *
+get_dbus_addr(Object *o, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    return g_strdup(dd->dbus_addr);
+}
+
+static void
+set_dbus_addr(Object *o, const char *str, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    g_free(dd->dbus_addr);
+    dd->dbus_addr = g_strdup(str);
+}
+
+static int
+get_gl_mode(Object *o, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    return dd->gl_mode;
+}
+
+static void
+set_gl_mode(Object *o, int val, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    dd->gl_mode = val;
+}
+
+static void
+dbus_display_class_init(ObjectClass *oc, void *data)
+{
+    UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
+
+    ucc->complete = dbus_display_complete;
+    object_class_property_add_str(oc, "addr", get_dbus_addr, set_dbus_addr);
+    object_class_property_add_enum(oc, "gl-mode",
+                                   "DisplayGLMode", &DisplayGLMode_lookup,
+                                   get_gl_mode, set_gl_mode);
+}
+
+static void
+early_dbus_init(DisplayOptions *opts)
+{
+    DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
+
+    if (mode != DISPLAYGL_MODE_OFF) {
+        if (egl_rendernode_init(opts->u.dbus.rendernode, mode) < 0) {
+            error_report("dbus: render node init failed");
+            exit(1);
+        }
+
+        display_opengl = 1;
+    }
+}
+
+static void
+dbus_init(DisplayState *ds, DisplayOptions *opts)
+{
+    DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
+
+    object_new_with_props(TYPE_DBUS_DISPLAY,
+                          object_get_objects_root(),
+                          "dbus-display", &error_fatal,
+                          "addr", opts->u.dbus.addr ?: "",
+                          "gl-mode", DisplayGLMode_str(mode),
+                          NULL);
+}
+
+static const TypeInfo dbus_display_info = {
+    .name = TYPE_DBUS_DISPLAY,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(DBusDisplay),
+    .instance_init = dbus_display_init,
+    .instance_finalize = dbus_display_finalize,
+    .class_init = dbus_display_class_init,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static QemuDisplay qemu_display_dbus = {
+    .type       = DISPLAY_TYPE_DBUS,
+    .early_init = early_dbus_init,
+    .init       = dbus_init,
+};
+
+static void register_dbus(void)
+{
+    type_register_static(&dbus_display_info);
+    qemu_display_register(&qemu_display_dbus);
+}
+
+type_init(register_dbus);
+
+#ifdef CONFIG_OPENGL
+module_dep("ui-opengl");
+#endif
diff --git a/meson_options.txt b/meson_options.txt
index 4114bfcaa474..921967eddbb9 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -66,6 +66,8 @@ option('cfi_debug', type: 'boolean', value: 'false',
        description: 'Verbose errors in case of CFI violation')
 option('multiprocess', type: 'feature', value: 'auto',
        description: 'Out of process device emulation support')
+option('dbus_display', type: 'feature', value: 'auto',
+       description: '-display dbus support')
 
 option('attr', type : 'feature', value : 'auto',
        description: 'attr/xattr support')
diff --git a/qemu-options.hx b/qemu-options.hx
index 489b58e15110..38983a919b12 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1862,6 +1862,10 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
+#endif
+#if defined(CONFIG_DBUS_DISPLAY)
+    "-display dbus[,addr=<dbusaddr>]\n"
+    "             [,gl=on|core|es|off][,rendernode=<file>]\n"
 #endif
     "-display none\n"
     "                select display backend type\n"
@@ -1889,6 +1893,17 @@ SRST
         application. The Spice server will redirect the serial consoles
         and QEMU monitors. (Since 4.0)
 
+    ``dbus``
+        Export the display over D-Bus interfaces. (Since 7.0)
+
+        The connection is registered with the "org.qemu" name (and queued when
+        already owned).
+
+        ``addr=<dbusaddr>`` : D-Bus bus address to connect to.
+
+        ``gl=on|off|core|es`` : Use OpenGL for rendering (the D-interface will
+        share framebuffers with DMABUF file descriptors).
+
     ``sdl``
         Display video output via SDL (usually in a separate graphics
         window; see the SDL documentation for other possibilities).
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index ae8f18edc2ed..50bd7bed4df8 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -33,6 +33,7 @@ meson_options_help() {
   printf "%s\n" '  coreaudio       CoreAudio sound support'
   printf "%s\n" '  curl            CURL block device driver'
   printf "%s\n" '  curses          curses UI'
+  printf "%s\n" '  dbus-display    -display dbus support'
   printf "%s\n" '  docs            Documentations build support'
   printf "%s\n" '  dsound          DirectSound sound support'
   printf "%s\n" '  fuse            FUSE block device export'
@@ -131,6 +132,8 @@ _meson_option_parse() {
     --disable-curl) printf "%s" -Dcurl=disabled ;;
     --enable-curses) printf "%s" -Dcurses=enabled ;;
     --disable-curses) printf "%s" -Dcurses=disabled ;;
+    --enable-dbus-display) printf "%s" -Ddbus_display=enabled ;;
+    --disable-dbus-display) printf "%s" -Ddbus_display=disabled ;;
     --enable-docs) printf "%s" -Ddocs=enabled ;;
     --disable-docs) printf "%s" -Ddocs=disabled ;;
     --enable-dsound) printf "%s" -Ddsound=enabled ;;
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
index e69de29bb2d1..0f0ae92e4d57 100644
--- a/ui/dbus-display1.xml
+++ b/ui/dbus-display1.xml
@@ -0,0 +1,378 @@
+<?xml version="1.0" encoding="utf-8"?>
+<node>
+  <!--
+      org.qemu.Display1.VM:
+
+      This interface is implemented on ``/org/qemu/Display1/VM``.
+  -->
+  <interface name="org.qemu.Display1.VM">
+    <!--
+        Name:
+
+        The name of the VM.
+    -->
+    <property name="Name" type="s" access="read"/>
+
+    <!--
+        UUID:
+
+        The UUID of the VM.
+    -->
+    <property name="UUID" type="s" access="read"/>
+
+    <!--
+        ConsoleIDs:
+
+        The list of consoles available on ``/org/qemu/Display1/Console_$id``.
+    -->
+    <property name="ConsoleIDs" type="au" access="read"/>
+  </interface>
+
+  <!--
+      org.qemu.Display1.Console:
+
+      This interface is implemented on ``/org/qemu/Display1/Console_$id``. You
+      may discover available consoles through introspection or with the
+      :dbus:prop:`org.qemu.Display1.VM.ConsoleIDs` property.
+
+      A console is attached to a video device head. It may be "Graphic" or
+      "Text" (see :dbus:prop:`Type` and other properties).
+
+      Interactions with a console may be done with
+      :dbus:iface:`org.qemu.Display1.Keyboard` and
+      :dbus:iface:`org.qemu.Display1.Mouse` interfaces when available.
+  -->
+  <interface name="org.qemu.Display1.Console">
+    <!--
+        RegisterListener:
+        @listener: a Unix socket FD, for peer-to-peer D-Bus communication.
+
+        Register a console listener, which will receive display updates, until
+        it is disconnected.
+
+        Multiple listeners may be registered simultaneously.
+
+        The listener is expected to implement the
+        :dbus:iface:`org.qemu.Display1.Listener` interface.
+    -->
+    <method name="RegisterListener">
+      <arg type="h" name="listener" direction="in"/>
+    </method>
+
+    <!--
+        SetUIInfo:
+        @width_mm: the physical display width in millimeters.
+        @height_mm: the physical display height in millimeters.
+        @xoff: horizontal offset, in pixels.
+        @yoff: vertical offset, in pixels.
+        @width: console width, in pixels.
+        @height: console height, in pixels.
+
+        Modify the dimensions and display settings.
+    -->
+    <method name="SetUIInfo">
+      <arg name="width_mm" type="q" direction="in"/>
+      <arg name="height_mm" type="q" direction="in"/>
+      <arg name="xoff" type="i" direction="in"/>
+      <arg name="yoff" type="i" direction="in"/>
+      <arg name="width" type="u" direction="in"/>
+      <arg name="height" type="u" direction="in"/>
+    </method>
+
+    <!--
+        Label:
+
+        A user-friendly name for the console (for ex: "VGA").
+    -->
+    <property name="Label" type="s" access="read"/>
+
+    <!--
+        Head:
+
+        Graphical device head number.
+    -->
+    <property name="Head" type="u" access="read"/>
+
+    <!--
+        Type:
+
+        Console type ("Graphic" or "Text").
+    -->
+    <property name="Type" type="s" access="read"/>
+
+    <!--
+        Width:
+
+        Console width, in pixels.
+    -->
+    <property name="Width" type="u" access="read"/>
+
+    <!--
+        Height:
+
+        Console height, in pixels.
+    -->
+    <property name="Height" type="u" access="read"/>
+
+    <!--
+        DeviceAddress:
+
+        The device address (ex: "pci/0000/02.0").
+    -->
+    <property name="DeviceAddress" type="s" access="read"/>
+  </interface>
+
+  <!--
+      org.qemu.Display1.Keyboard:
+
+      This interface in implemented on ``/org/qemu/Display1/Console_$id`` (see
+      :dbus:iface:`~org.qemu.Display1.Console`).
+  -->
+  <interface name="org.qemu.Display1.Keyboard">
+    <!--
+        Press:
+        @keycode: QEMU key number (xtkbd + special re-encoding of high bit)
+
+        Send a key press event.
+    -->
+    <method name="Press">
+      <arg type="u" name="keycode" direction="in"/>
+    </method>
+
+    <!--
+        Release:
+        @keycode: QEMU key number (xtkbd + special re-encoding of high bit)
+
+        Send a key release event.
+    -->
+    <method name="Release">
+      <arg type="u" name="keycode" direction="in"/>
+    </method>
+
+    <!--
+        Modifiers:
+
+        The active keyboard modifiers::
+
+          Scroll = 1 << 0
+          Num    = 1 << 1
+          Caps   = 1 << 2
+    -->
+    <property name="Modifiers" type="u" access="read"/>
+  </interface>
+
+  <!--
+      org.qemu.Display1.Mouse:
+
+      This interface in implemented on ``/org/qemu/Display1/Console_$id`` (see
+      :dbus:iface:`~org.qemu.Display1.Console` documentation).
+
+      .. _dbus-button-values:
+
+      **Button values**::
+
+        Left       = 0
+        Middle     = 1
+        Right      = 2
+        Wheel-up   = 3
+        Wheel-down = 4
+        Side       = 5
+        Extra      = 6
+  -->
+  <interface name="org.qemu.Display1.Mouse">
+    <!--
+        Press:
+        @button: :ref:`button value<dbus-button-values>`.
+
+        Send a mouse button press event.
+    -->
+    <method name="Press">
+      <arg type="u" name="button" direction="in"/>
+    </method>
+
+    <!--
+        Release:
+        @button: :ref:`button value<dbus-button-values>`.
+
+        Send a mouse button release event.
+    -->
+    <method name="Release">
+      <arg type="u" name="button" direction="in"/>
+    </method>
+
+    <!--
+        SetAbsPosition:
+        @x: X position, in pixels.
+        @y: Y position, in pixels.
+
+        Set the mouse pointer position.
+
+        Returns an error if not :dbus:prop:`IsAbsolute`.
+    -->
+    <method name="SetAbsPosition">
+      <arg type="u" name="x" direction="in"/>
+      <arg type="u" name="y" direction="in"/>
+    </method>
+
+    <!--
+        RelMotion:
+        @dx: X-delta, in pixels.
+        @dy: Y-delta, in pixels.
+
+        Move the mouse pointer position, relative to the current position.
+
+        Returns an error if :dbus:prop:`IsAbsolute`.
+    -->
+    <method name="RelMotion">
+      <arg type="i" name="dx" direction="in"/>
+      <arg type="i" name="dy" direction="in"/>
+    </method>
+
+    <!--
+        IsAbsolute:
+
+        Whether the mouse is using absolute movements.
+    -->
+    <property name="IsAbsolute" type="b" access="read"/>
+  </interface>
+
+  <!--
+      org.qemu.Display1.Listener:
+
+      This client-side interface must be available on
+      ``/org/qemu/Display1/Listener`` when registering the peer-to-peer
+      connection with :dbus:meth:`~org.qemu.Display1.Console.Register`.
+  -->
+  <interface name="org.qemu.Display1.Listener">
+    <!--
+        Scanout:
+        @width: display width, in pixels.
+        @height: display height, in pixels.
+        @stride: data stride, in bytes.
+        @pixman_format: image format (ex: ``PIXMAN_X8R8G8B8``).
+        @data: image data.
+
+        Resize and update the display content.
+
+        The data to transfer for the display update may be large. The preferred
+        scanout method is :dbus:meth:`ScanoutDMABUF`, used whenever possible.
+    -->
+    <method name="Scanout">
+      <arg type="u" name="width" direction="in"/>
+      <arg type="u" name="height" direction="in"/>
+      <arg type="u" name="stride" direction="in"/>
+      <arg type="u" name="pixman_format" direction="in"/>
+      <arg type="ay" name="data" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+
+    <!--
+        Update:
+        @x: X update position, in pixels.
+        @y: Y update position, in pixels.
+        @width: update width, in pixels.
+        @height: update height, in pixels.
+        @stride: data stride, in bytes.
+        @pixman_format: image format (ex: ``PIXMAN_X8R8G8B8``).
+        @data: display image data.
+
+        Update the display content.
+
+        This method is only called after a :dbus:meth:`Scanout` call.
+    -->
+    <method name="Update">
+      <arg type="i" name="x" direction="in"/>
+      <arg type="i" name="y" direction="in"/>
+      <arg type="i" name="width" direction="in"/>
+      <arg type="i" name="height" direction="in"/>
+      <arg type="u" name="stride" direction="in"/>
+      <arg type="u" name="pixman_format" direction="in"/>
+      <arg type="ay" name="data" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+
+    <!--
+        ScanoutDMABUF:
+        @dmabuf: the DMABUF file descriptor.
+        @width: display width, in pixels.
+        @height: display height, in pixels.
+        @stride: stride, in bytes.
+        @fourcc: DMABUF fourcc.
+        @modifier: DMABUF modifier.
+        @y0_top: whether Y position 0 is the top or not.
+
+        Resize and update the display content with a DMABUF.
+    -->
+    <method name="ScanoutDMABUF">
+      <arg type="h" name="dmabuf" direction="in"/>
+      <arg type="u" name="width" direction="in"/>
+      <arg type="u" name="height" direction="in"/>
+      <arg type="u" name="stride" direction="in"/>
+      <arg type="u" name="fourcc" direction="in"/>
+      <!-- xywh? -->
+      <arg type="t" name="modifier" direction="in"/>
+      <arg type="b" name="y0_top" direction="in"/>
+    </method>
+
+    <!--
+        UpdateDMABUF:
+        @x: the X update position, in pixels.
+        @y: the Y update position, in pixels.
+        @width: the update width, in pixels.
+        @height: the update height, in pixels.
+
+        Update the display content with the current DMABUF and the given region.
+    -->
+    <method name="UpdateDMABUF">
+      <arg type="i" name="x" direction="in"/>
+      <arg type="i" name="y" direction="in"/>
+      <arg type="i" name="width" direction="in"/>
+      <arg type="i" name="height" direction="in"/>
+    </method>
+
+    <!--
+        Disable:
+
+        Disable the display (turn it off).
+    -->
+    <method name="Disable">
+    </method>
+
+    <!--
+        MouseSet:
+        @x: X mouse position, in pixels.
+        @y: Y mouse position, in pixels.
+        @on: whether the mouse is visible or not.
+
+        Set the mouse position and visibility.
+    -->
+    <method name="MouseSet">
+      <arg type="i" name="x" direction="in"/>
+      <arg type="i" name="y" direction="in"/>
+      <arg type="i" name="on" direction="in"/>
+    </method>
+
+    <!--
+        CursorDefine:
+        @width: cursor width, in pixels.
+        @height: cursor height, in pixels.
+        @hot_x: hot-spot X position, in pixels.
+        @hot_y: hot-spot Y position, in pixels.
+        @data: the cursor data.
+
+        Set the mouse cursor shape and hot-spot. The "data" must be ARGB, 32-bit
+        per pixel.
+    -->
+    <method name="CursorDefine">
+      <arg type="i" name="width" direction="in"/>
+      <arg type="i" name="height" direction="in"/>
+      <arg type="i" name="hot_x" direction="in"/>
+      <arg type="i" name="hot_y" direction="in"/>
+      <arg type="ay" name="data" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+  </interface>
+</node>
diff --git a/ui/meson.build b/ui/meson.build
index a9df5b911ec8..6270aa768b6a 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -65,6 +65,28 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found()
   ui_modules += {'egl-headless' : egl_headless_ss}
 endif
 
+if dbus_display
+  dbus_ss = ss.source_set()
+  dbus_display1 = custom_target('dbus-display gdbus-codegen',
+                                output: ['dbus-display1.h', 'dbus-display1.c'],
+                                input: files('dbus-display1.xml'),
+                                command: [config_host['GDBUS_CODEGEN'],
+                                          '@INPUT@',
+                                          '--glib-min-required', '2.64',
+                                          '--output-directory', meson.current_build_dir(),
+                                          '--interface-prefix', 'org.qemu.',
+                                          '--c-namespace', 'QemuDBus',
+                                          '--generate-c-code', '@BASENAME@'])
+  dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
+              if_true: [files(
+                'dbus-console.c',
+                'dbus-error.c',
+                'dbus-listener.c',
+                'dbus.c',
+              ), dbus_display1])
+  ui_modules += {'dbus' : dbus_ss}
+endif
+
 if gtk.found()
   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
diff --git a/ui/trace-events b/ui/trace-events
index e832c3e3659d..b1ae30159a53 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -136,3 +136,14 @@ vdagent_peer_cap(const char *name) "cap %s"
 vdagent_cb_grab_selection(const char *name) "selection %s"
 vdagent_cb_grab_type(const char *name) "type %s"
 vdagent_cb_serial_discard(uint32_t current, uint32_t received) "current=%u, received=%u"
+
+# dbus.c
+dbus_registered_listener(const char *bus_name) "peer %s"
+dbus_listener_vanished(const char *bus_name) "peer %s"
+dbus_kbd_press(unsigned int keycode) "keycode %u"
+dbus_kbd_release(unsigned int keycode) "keycode %u"
+dbus_mouse_press(unsigned int button) "button %u"
+dbus_mouse_release(unsigned int button) "button %u"
+dbus_mouse_set_pos(unsigned int x, unsigned int y) "x=%u, y=%u"
+dbus_mouse_rel_motion(int dx, int dy) "dx=%d, dy=%d"
+dbus_update(int x, int y, int w, int h) "x=%d, y=%d, w=%d, h=%d"
-- 
2.34.1.8.g35151cf07204


