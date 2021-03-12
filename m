Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A82943389F6
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:23:02 +0100 (CET)
Received: from localhost ([::1]:57616 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKewf-00026Q-OC
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:23:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34916)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKeeF-00016e-OM
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:03:59 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:21087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKee6-0003Li-9E
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:03:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543428;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=raAfJTt7SIJXtuPeXu6ObzdzXeSU3RI0/3D9VMQvfgU=;
 b=En0qt9AH6GCGocsVv5NoStV5KME9vskCLC6/Y/IWLWYd3pqtMWJryKuOJvqR3IFSvXlqZd
 P7DvmSRP7yq0g9EkjsC25TV3oN7uhVJhLMI5/I/YIsTLEOuEVDTEC+2xG/l/vhmY2sDLtQ
 KdZiNJCw/47ZEoMKU87Z2EJAKA09WmM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-261-SyZQbrroP9ub73C5zMc2fA-1; Fri, 12 Mar 2021 05:03:44 -0500
X-MC-Unique: SyZQbrroP9ub73C5zMc2fA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B5E04E5760
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:03:43 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B475D69FB5;
 Fri, 12 Mar 2021 10:03:34 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 14/27] ui: add a D-Bus display backend
Date: Fri, 12 Mar 2021 14:00:55 +0400
Message-Id: <20210312100108.2706195-15-marcandre.lureau@redhat.com>
In-Reply-To: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
References: <20210312100108.2706195-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

The "dbus" ui/display backend exports the QEMU consoles over a currently
unstable D-Bus protocol defined in ui/dbus-display1.xml (it is subject
to changes at each releases, so only client shipped with the same QEMU
release will be fully compatible).

By default, the connection is done on the session bus, but you can
specify a different bus with the "addr" option.

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
org.qemu.Display1.Keyboard          interface -         -               -
.Press                              method    u         -               -
.Release                            method    u         -               -
.Modifiers                          property  u         0               emits-change writable
org.qemu.Display1.Mouse             interface -         -               -
.Press                              method    u         -               -
.Release                            method    u         -               -
.SetAbsPosition                     method    uu        -               -

The "RegisterListener" method takes a FD as argument and expect the
client to implement the org.qemu.Display1.Listener D-Bus p2p interface
over it. This allows to notify of display updates, sending big chunk of
data if necessary without going through the bus. However, DMABUF updates
are preferred.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 meson.build          |   5 +
 qapi/ui.json         |  24 ++-
 include/qemu/dbus.h  |  20 ++
 ui/dbus.h            |  68 ++++++
 ui/dbus-console.c    | 457 ++++++++++++++++++++++++++++++++++++++++
 ui/dbus-error.c      |  45 ++++
 ui/dbus-listener.c   | 480 +++++++++++++++++++++++++++++++++++++++++++
 ui/dbus.c            | 255 +++++++++++++++++++++++
 util/module.c        |   2 +
 qemu-options.hx      |   8 +
 ui/dbus-display1.xml | 123 +++++++++++
 ui/meson.build       |  17 ++
 ui/trace-events      |  11 +
 13 files changed, 1513 insertions(+), 2 deletions(-)
 create mode 100644 ui/dbus.h
 create mode 100644 ui/dbus-console.c
 create mode 100644 ui/dbus-error.c
 create mode 100644 ui/dbus-listener.c
 create mode 100644 ui/dbus.c
 create mode 100644 ui/dbus-display1.xml

diff --git a/meson.build b/meson.build
index a7d2dd429d..b6f680bd34 100644
--- a/meson.build
+++ b/meson.build
@@ -1861,6 +1861,11 @@ if 'CONFIG_VHOST_USER' in config_host
   vhost_user = libvhost_user.get_variable('vhost_user_dep')
 endif
 
+# FIXME enable_modules shouldn't be necessary, but: https://github.com/mesonbuild/meson/issues/8333
+if enable_modules and config_host.has_key('CONFIG_GIO') and config_host.has_key('GDBUS_CODEGEN')
+  config_host += {'CONFIG_UI_DBUS': 'y'}
+endif
+
 subdir('qapi')
 subdir('qobject')
 subdir('stubs')
diff --git a/qapi/ui.json b/qapi/ui.json
index d08d72b439..bdfab800c0 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1068,6 +1068,23 @@
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
+# Since: X.X
+#
+##
+{ 'struct'  : 'DisplayDBus',
+  'data'    : { '*rendernode' : 'str',
+                '*addr': 'str' } }
+
  ##
  # @DisplayGLMode:
  #
@@ -1133,13 +1150,15 @@
 #             application to connect to it. The server will redirect
 #             the serial console and QEMU monitors. (Since 4.0)
 #
+# @dbus: Start a D-Bus service for the display. (Since X.X)
+#
 # Since: 2.12
 #
 ##
 { 'enum'    : 'DisplayType',
   'data'    : [ 'default', 'none', 'gtk', 'sdl',
                 'egl-headless', 'curses', 'cocoa',
-                'spice-app'] }
+                'spice-app', 'dbus'] }
 
 ##
 # @DisplayOptions:
@@ -1165,7 +1184,8 @@
   'discriminator' : 'type',
   'data'    : { 'gtk'            : 'DisplayGTK',
                 'curses'         : 'DisplayCurses',
-                'egl-headless'   : 'DisplayEGLHeadless'} }
+                'egl-headless'   : 'DisplayEGLHeadless',
+                'dbus'           : 'DisplayDBus'} }
 
 ##
 # @query-display-options:
diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
index 9d591f9ee4..c2d7f55379 100644
--- a/include/qemu/dbus.h
+++ b/include/qemu/dbus.h
@@ -12,6 +12,26 @@
 
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
+#define DBUS_DISPLAY_ERROR (dbus_display_error_quark ())
+GQuark dbus_display_error_quark (void);
+
+typedef enum
+{
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
index 0000000000..f554084a27
--- /dev/null
+++ b/ui/dbus.h
@@ -0,0 +1,68 @@
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
+    DBusDisplayDisplay1VM *iface;
+    GPtrArray *consoles;
+};
+
+#define TYPE_DBUS_DISPLAY "dbus-display"
+OBJECT_DECLARE_SIMPLE_TYPE(DBusDisplay, DBUS_DISPLAY)
+
+#define DBUS_DISPLAY_TYPE_CONSOLE dbus_display_console_get_type()
+G_DECLARE_FINAL_TYPE(DBusDisplayConsole, dbus_display_console, DBUS_DISPLAY, CONSOLE, GDBusObjectSkeleton)
+
+DBusDisplayConsole *dbus_display_console_new(DBusDisplay *display, QemuConsole *con);
+int dbus_display_console_get_index(DBusDisplayConsole *self);
+
+#define DBUS_DISPLAY_TYPE_LISTENER dbus_display_listener_get_type()
+G_DECLARE_FINAL_TYPE(DBusDisplayListener, dbus_display_listener, DBUS_DISPLAY, LISTENER, GObject)
+
+DBusDisplayListener *dbus_display_listener_new(const char *bus_name,
+                                               GDBusConnection *conn,
+                                               DBusDisplayConsole *console);
+
+DBusDisplayConsole *dbus_display_listener_get_console(DBusDisplayListener *self);
+const char *dbus_display_listener_get_bus_name(DBusDisplayListener *self);
+
+extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
+extern const DisplayChangeListenerOps dbus_dcl_ops;
+
+#endif /* UI_DBUS_H_ */
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
new file mode 100644
index 0000000000..3487a8f5cb
--- /dev/null
+++ b/ui/dbus-console.c
@@ -0,0 +1,457 @@
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
+    DBusDisplayDisplay1Console *iface;
+
+    DBusDisplayDisplay1Keyboard *iface_kbd;
+    QKbdState *kbd;
+
+    DBusDisplayDisplay1Mouse *iface_mouse;
+    gboolean last_set;
+    guint last_x;
+    guint last_y;
+};
+
+G_DEFINE_TYPE(DBusDisplayConsole, dbus_display_console, G_TYPE_DBUS_OBJECT_SKELETON)
+
+static void
+dbus_display_console_set_size(DBusDisplayConsole *self, uint32_t width, uint32_t height)
+{
+    g_object_set(self->iface,
+                 "width", width,
+                 "height", height,
+                 NULL);
+}
+
+static void
+dbus_gfx_switch(DisplayChangeListener *dcl,
+                struct DisplaySurface *new_surface)
+{
+    DBusDisplayConsole *self = container_of(dcl, DBusDisplayConsole, dcl);
+
+    dbus_display_console_set_size(self,
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
+    DBusDisplayConsole *self = container_of(dcl, DBusDisplayConsole, dcl);
+
+    dbus_display_console_set_size(self, w, h);
+}
+
+static void
+dbus_gl_scanout_dmabuf(DisplayChangeListener *dcl,
+                       QemuDmaBuf *dmabuf)
+{
+    DBusDisplayConsole *self = container_of(dcl, DBusDisplayConsole, dcl);
+
+    dbus_display_console_set_size(self,
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
+    DBusDisplayConsole *self = DBUS_DISPLAY_CONSOLE(object);
+
+    self->listeners = g_hash_table_new_full(g_str_hash, g_str_equal,
+                                            NULL, g_object_unref);
+    self->dcl.ops = &dbus_console_dcl_ops;
+}
+
+static void
+dbus_display_console_dispose(GObject *object)
+{
+    DBusDisplayConsole *self = DBUS_DISPLAY_CONSOLE(object);
+
+    unregister_displaychangelistener(&self->dcl);
+    g_clear_object(&self->iface_kbd);
+    g_clear_object(&self->iface);
+    g_clear_pointer(&self->listeners, g_hash_table_unref);
+    g_clear_pointer(&self->kbd, qkbd_state_free);
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
+    DBusDisplayConsole *self = dbus_display_listener_get_console(listener);
+    const char *name = dbus_display_listener_get_bus_name(listener);
+
+    trace_dbus_listener_vanished(name);
+
+    g_hash_table_remove(self->listeners, name);
+    qkbd_state_lift_all_keys(self->kbd);
+}
+
+static gboolean
+dbus_console_set_ui_info(DBusDisplayConsole *self,
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
+    if (!dpy_ui_info_supported(self->con)) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_UNSUPPORTED,
+                                              "SetUIInfo is not supported by guest");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    dpy_set_ui_info(self->con, &info);
+    dbus_display_display1_console_complete_set_uiinfo(self->iface, invocation);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_console_register_listener(DBusDisplayConsole *self,
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
+    if (g_hash_table_contains(self->listeners, sender)) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_INVALID,
+                                              "`%s` is already registered!",
+                                              sender);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    fd = g_unix_fd_list_get(fd_list, g_variant_get_handle(arg_listener), &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_FAILED,
+                                              "Couldn't get peer fd: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    socket = g_socket_new_from_fd(fd, &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_FAILED,
+                                              "Couldn't make a socket: %s", err->message);
+        close(fd);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+    socket_conn = g_socket_connection_factory_create_connection(socket);
+    /* return now: easier for the other end, as it may handle priv dbus synchronously */
+    dbus_display_display1_console_complete_register_listener(self->iface, invocation, NULL);
+
+    listener_conn = g_dbus_connection_new_sync(G_IO_STREAM(socket_conn),
+                                               guid,
+                                               G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+                                               NULL, NULL, &err);
+    if (err) {
+        error_report("Failed to setup peer connection: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    listener = dbus_display_listener_new(sender, listener_conn, self);
+    if (!listener) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    g_hash_table_insert(self->listeners,
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
+dbus_kbd_press(DBusDisplayConsole *self,
+               GDBusMethodInvocation *invocation,
+               guint arg_keycode)
+{
+    QKeyCode qcode = qemu_input_key_number_to_qcode(arg_keycode);
+
+    trace_dbus_kbd_press(arg_keycode);
+
+    qkbd_state_key_event(self->kbd, qcode, true);
+
+    dbus_display_display1_keyboard_complete_press(self->iface_kbd, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_kbd_release(DBusDisplayConsole *self,
+                 GDBusMethodInvocation *invocation,
+                 guint arg_keycode)
+{
+    QKeyCode qcode = qemu_input_key_number_to_qcode(arg_keycode);
+
+    trace_dbus_kbd_release(arg_keycode);
+
+    qkbd_state_key_event(self->kbd, qcode, false);
+
+    dbus_display_display1_keyboard_complete_release(self->iface_kbd, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static void
+dbus_kbd_modifiers_changed(DBusDisplayConsole *self,
+                           GParamSpec *pspec)
+{
+    guint modifiers = dbus_display_display1_keyboard_get_modifiers(self->iface_kbd);
+
+    trace_dbus_kbd_modifiers_changed(modifiers);
+}
+
+static void
+dbus_kbd_qemu_leds_updated(void *data, int ledstate)
+{
+    DBusDisplayConsole *self = DBUS_DISPLAY_CONSOLE(data);
+
+    // FIXME: what about self->kbd state?
+    dbus_display_display1_keyboard_set_modifiers(self->iface_kbd, ledstate);
+}
+
+static gboolean
+dbus_mouse_set_pos(DBusDisplayConsole *self,
+                   GDBusMethodInvocation *invocation,
+                   guint x, guint y)
+{
+    int width, height;
+
+    trace_dbus_mouse_set_pos(x, y);
+
+    width = qemu_console_get_width(self->con, 0);
+    height = qemu_console_get_height(self->con, 0);
+    if (qemu_input_is_absolute()) {
+        if (x >= width || y >= height) {
+            g_dbus_method_invocation_return_error(invocation,
+                                                  DBUS_DISPLAY_ERROR,
+                                                  DBUS_DISPLAY_ERROR_INVALID,
+                                                  "Invalid mouse position");
+            return DBUS_METHOD_INVOCATION_HANDLED;
+        }
+        qemu_input_queue_abs(self->con, INPUT_AXIS_X, x, 0, width);
+        qemu_input_queue_abs(self->con, INPUT_AXIS_Y, y, 0, height);
+        qemu_input_event_sync();
+    } else if (self->last_set) {
+        qemu_input_queue_rel(self->con, INPUT_AXIS_X, x - self->last_x);
+        qemu_input_queue_rel(self->con, INPUT_AXIS_Y, y - self->last_y);
+        qemu_input_event_sync();
+    }
+
+    self->last_x = x;
+    self->last_y = y;
+    self->last_set = TRUE;
+
+    dbus_display_display1_mouse_complete_set_abs_position(self->iface_mouse, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_mouse_press(DBusDisplayConsole *self,
+                 GDBusMethodInvocation *invocation,
+                 guint button)
+{
+    trace_dbus_mouse_press(button);
+
+    qemu_input_queue_btn(self->con, button, true);
+    qemu_input_event_sync();
+
+    dbus_display_display1_mouse_complete_press(self->iface_mouse, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_mouse_release(DBusDisplayConsole *self,
+                   GDBusMethodInvocation *invocation,
+                   guint button)
+{
+    trace_dbus_mouse_release(button);
+
+    qemu_input_queue_btn(self->con, button, false);
+    qemu_input_event_sync();
+
+    dbus_display_display1_mouse_complete_release(self->iface_mouse, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+int dbus_display_console_get_index(DBusDisplayConsole *self)
+{
+    return qemu_console_get_index(self->con);
+}
+
+DBusDisplayConsole *
+dbus_display_console_new(DBusDisplay *display, QemuConsole *con)
+{
+    g_autofree char *path = NULL;
+    g_autofree char *label = NULL;
+    char device_addr[256] = "";
+    DBusDisplayConsole *self;
+    int idx;
+
+    assert(display);
+    assert(con);
+
+    label = qemu_console_get_label(con);
+    idx = qemu_console_get_index(con);
+    path = g_strdup_printf(DBUS_DISPLAY1_ROOT "/Console_%d", idx);
+    self = g_object_new(DBUS_DISPLAY_TYPE_CONSOLE,
+                        "g-object-path", path,
+                        NULL);
+    self->display = display;
+    self->con = con;
+    /* we should handle errors, and skip non graphics? */
+    qemu_console_fill_device_address(con, device_addr, sizeof(device_addr), NULL);
+
+    self->iface = dbus_display_display1_console_skeleton_new();
+    g_object_set(self->iface,
+        "label", label,
+        "type", qemu_console_is_graphic(con) ? "Graphic" : "Text",
+        "head", qemu_console_get_head(con),
+        "width", qemu_console_get_width(con, 0),
+        "height", qemu_console_get_height(con, 0),
+        "device-address", device_addr,
+        NULL);
+    g_object_connect(self->iface,
+        "swapped-signal::handle-register-listener", dbus_console_register_listener, self,
+        "swapped-signal::handle-set-uiinfo", dbus_console_set_ui_info, self,
+        NULL);
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(self),
+        G_DBUS_INTERFACE_SKELETON(self->iface));
+
+    self->kbd = qkbd_state_init(con);
+    self->iface_kbd = dbus_display_display1_keyboard_skeleton_new();
+    qemu_add_led_event_handler(dbus_kbd_qemu_leds_updated, self);
+    g_object_connect(self->iface_kbd,
+        "swapped-signal::handle-press", dbus_kbd_press, self,
+        "swapped-signal::handle-release", dbus_kbd_release, self,
+        "swapped-signal::notify::modifiers", dbus_kbd_modifiers_changed, self,
+        NULL);
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(self),
+        G_DBUS_INTERFACE_SKELETON(self->iface_kbd));
+
+    self->iface_mouse = dbus_display_display1_mouse_skeleton_new();
+    g_object_connect(self->iface_mouse,
+        "swapped-signal::handle-set-abs-position", dbus_mouse_set_pos, self,
+        "swapped-signal::handle-press", dbus_mouse_press, self,
+        "swapped-signal::handle-release", dbus_mouse_release, self,
+        NULL);
+    g_dbus_object_skeleton_add_interface(G_DBUS_OBJECT_SKELETON(self),
+        G_DBUS_INTERFACE_SKELETON(self->iface_mouse));
+
+    register_displaychangelistener(&self->dcl);
+    return self;
+}
diff --git a/ui/dbus-error.c b/ui/dbus-error.c
new file mode 100644
index 0000000000..9575bb6aa9
--- /dev/null
+++ b/ui/dbus-error.c
@@ -0,0 +1,45 @@
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
+static const GDBusErrorEntry dbus_display_error_entries[] =
+{
+  { DBUS_DISPLAY_ERROR_FAILED, "org.qemu.Display1.Error.Failed" },
+  { DBUS_DISPLAY_ERROR_INVALID, "org.qemu.Display1.Error.Invalid" },
+  { DBUS_DISPLAY_ERROR_UNSUPPORTED, "org.qemu.Display1.Error.Unsupported" },
+};
+
+G_STATIC_ASSERT(G_N_ELEMENTS(dbus_display_error_entries) == DBUS_DISPLAY_N_ERRORS);
+
+GQuark
+dbus_display_error_quark(void)
+{
+  static volatile gsize quark_volatile = 0;
+  g_dbus_error_register_error_domain("dbus-display-error-quark",
+                                     &quark_volatile,
+                                     dbus_display_error_entries,
+                                     G_N_ELEMENTS(dbus_display_error_entries));
+  return (GQuark)quark_volatile;
+}
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
new file mode 100644
index 0000000000..2ef8e0e921
--- /dev/null
+++ b/ui/dbus-listener.c
@@ -0,0 +1,480 @@
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
+struct _DBusDisplayListener
+{
+    GObject parent;
+
+    char *bus_name;
+    DBusDisplayConsole *console;
+    GDBusConnection *conn;
+
+    DBusDisplayDisplay1Listener *proxy;
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
+    DBusDisplayListener *self = user_data;
+
+    if (!dbus_display_display1_listener_call_update_dmabuf_finish(self->proxy, res, &err)) {
+        error_report("Failed to call update: %s", err->message);
+    }
+
+    graphic_hw_gl_block(self->dcl.con, false);
+    g_object_unref(self);
+}
+
+static void dbus_call_update_gl(DBusDisplayListener *self,
+                                int x, int y, int w, int h)
+{
+    graphic_hw_gl_block(self->dcl.con, true);
+    glFlush();
+    dbus_display_display1_listener_call_update_dmabuf(self->proxy,
+        x, y, w, h,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL,
+        dbus_update_gl_cb,
+        g_object_ref(self));
+}
+
+static void dbus_scanout_disable(DisplayChangeListener *dcl)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    self->ds = NULL;
+    dbus_display_display1_listener_call_disable(
+        self->proxy, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void dbus_scanout_dmabuf(DisplayChangeListener *dcl,
+                                QemuDmaBuf *dmabuf)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GUnixFDList) fd_list = NULL;
+
+    fd_list = g_unix_fd_list_new();
+    if (g_unix_fd_list_append(fd_list, dmabuf->fd, &err) != 0) {
+        error_report("Failed to setup dmabuf fdlist: %s", err->message);
+        return;
+    }
+
+    dbus_display_display1_listener_call_scanout_dmabuf(
+        self->proxy,
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
+    dmabuf.fd = egl_get_fd_for_texture(tex_id, (EGLint *)&dmabuf.stride,
+                                       (EGLint *)&dmabuf.fourcc, &dmabuf.modifier);
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
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+    DisplaySurface *ds;
+    GVariant *v_data = NULL;
+    egl_fb cursor_fb;
+
+    if (!dmabuf) {
+        dbus_display_display1_listener_call_mouse_set(
+            self->proxy, 0, 0, false, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
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
+    dbus_display_display1_listener_call_cursor_define(
+        self->proxy,
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
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    dbus_display_display1_listener_call_mouse_set(
+        self->proxy, pos_x, pos_y, true, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
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
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    dbus_call_update_gl(self, x, y, w, h);
+}
+
+static void dbus_gl_refresh(DisplayChangeListener *dcl)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    if (!self->ds || qemu_console_is_gl_blocked(self->dcl.con)) {
+        return;
+    }
+
+    graphic_hw_update(dcl->con);
+    if (self->gl_updates) {
+        dbus_call_update_gl(self, 0, 0,
+                            surface_width(self->ds), surface_height(self->ds));
+        self->gl_updates = 0;
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
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    if (self->ds) {
+        surface_gl_update_texture(self->gls, self->ds, x, y, w, h);
+    }
+
+    self->gl_updates++;
+}
+
+static void dbus_gfx_update(DisplayChangeListener *dcl,
+                            int x, int y, int w, int h)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+    pixman_image_t *img;
+    GVariant *v_data;
+    size_t stride;
+
+    assert(self->ds);
+    stride = w * DIV_ROUND_UP(PIXMAN_FORMAT_BPP(surface_format(self->ds)), 8);
+
+    trace_dbus_update(x, y, w, h);
+
+    /* make a copy, since gvariant only handles linear data */
+    img = pixman_image_create_bits(surface_format(self->ds),
+                                   w, h, NULL, stride);
+    pixman_image_composite(PIXMAN_OP_SRC, self->ds->image, NULL, img,
+                           x, y, 0, 0, 0, 0, w, h);
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        pixman_image_get_data(img),
+        pixman_image_get_stride(img) * h,
+        TRUE,
+        (GDestroyNotify)pixman_image_unref,
+        img);
+    dbus_display_display1_listener_call_update(self->proxy,
+        x, y, w, h, pixman_image_get_stride(img), pixman_image_get_format(img),
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+}
+
+static void dbus_gl_gfx_switch(DisplayChangeListener *dcl,
+                               struct DisplaySurface *new_surface)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    if (self->ds) {
+        surface_gl_destroy_texture(self->gls, self->ds);
+    }
+    self->ds = new_surface;
+    if (self->ds) {
+        int width = surface_width(self->ds);
+        int height = surface_height(self->ds);
+
+        surface_gl_create_texture(self->gls, self->ds);
+        dbus_scanout_texture(&self->dcl, self->ds->texture, true,
+                             width, height, 0, 0, width, height);
+    }
+}
+
+static void dbus_gfx_switch(DisplayChangeListener *dcl,
+                            struct DisplaySurface *new_surface)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+    GVariant *v_data = NULL;
+
+    self->ds = new_surface;
+    if (!self->ds) {
+        /* why not call disable instead? */
+        return;
+    }
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        surface_data(self->ds),
+        surface_stride(self->ds) * surface_height(self->ds),
+        TRUE,
+        (GDestroyNotify)pixman_image_unref,
+        pixman_image_ref(self->ds->image));
+    dbus_display_display1_listener_call_scanout(self->proxy,
+        surface_width(self->ds),
+        surface_height(self->ds),
+        surface_stride(self->ds),
+        surface_format(self->ds),
+        v_data,
+        G_DBUS_CALL_FLAGS_NONE,
+        DBUS_DEFAULT_TIMEOUT, NULL, NULL, NULL);
+}
+
+static void dbus_mouse_set(DisplayChangeListener *dcl,
+                           int x, int y, int on)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
+
+    dbus_display_display1_listener_call_mouse_set(
+        self->proxy, x, y, on, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+}
+
+static void dbus_cursor_define(DisplayChangeListener *dcl,
+                               QEMUCursor *c)
+{
+    DBusDisplayListener *self = container_of(dcl, DBusDisplayListener, dcl);
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
+    dbus_display_display1_listener_call_cursor_define(
+        self->proxy,
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
+    DBusDisplayListener *self = DBUS_DISPLAY_LISTENER(object);
+
+    unregister_displaychangelistener(&self->dcl);
+    g_clear_object(&self->conn);
+    g_clear_pointer(&self->bus_name, g_free);
+    g_clear_object(&self->proxy);
+    g_clear_pointer(&self->gls, qemu_gl_fini_shader);
+
+    G_OBJECT_CLASS(dbus_display_listener_parent_class)->dispose(object);
+}
+
+static void
+dbus_display_listener_constructed(GObject *object)
+{
+    DBusDisplayListener *self = DBUS_DISPLAY_LISTENER(object);
+
+    if (display_opengl) {
+        self->gls = qemu_gl_init_shader();
+        self->dcl.ops = &dbus_gl_dcl_ops;
+    } else {
+        self->dcl.ops = &dbus_dcl_ops;
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
+dbus_display_listener_init(DBusDisplayListener *self)
+{
+}
+
+const char *
+dbus_display_listener_get_bus_name(DBusDisplayListener *self)
+{
+    return self->bus_name;
+}
+
+DBusDisplayConsole *
+dbus_display_listener_get_console(DBusDisplayListener *self)
+{
+    return self->console;
+}
+
+DBusDisplayListener *
+dbus_display_listener_new(const char *bus_name,
+                          GDBusConnection *conn,
+                          DBusDisplayConsole *console)
+{
+    DBusDisplayListener *self;
+    QemuConsole *con;
+    g_autoptr(GError) err = NULL;
+
+    self = g_object_new(DBUS_DISPLAY_TYPE_LISTENER, NULL);
+    self->proxy =
+        dbus_display_display1_listener_proxy_new_sync(conn,
+            G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+            NULL,
+            "/org/qemu/Display1/Listener",
+            NULL,
+            &err);
+    if (!self->proxy) {
+        error_report("Failed to setup proxy: %s", err->message);
+        g_object_unref(conn);
+        g_object_unref(self);
+        return NULL;
+    }
+
+    self->bus_name = g_strdup(bus_name);
+    self->conn = conn;
+    self->console = console;
+
+    con = qemu_console_lookup_by_index(dbus_display_console_get_index(console));
+    assert(con);
+    self->dcl.con = con;
+    register_displaychangelistener(&self->dcl);
+
+    return self;
+}
diff --git a/ui/dbus.c b/ui/dbus.c
new file mode 100644
index 0000000000..089a92cedf
--- /dev/null
+++ b/ui/dbus.c
@@ -0,0 +1,255 @@
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
+    DBusDisplay *self = DBUS_DISPLAY(o);
+    g_autoptr(GDBusObjectSkeleton) vm = NULL;
+
+    self->glctx.ops = &dbus_gl_ops;
+    self->iface = dbus_display_display1_vm_skeleton_new();
+    self->consoles = g_ptr_array_new_with_free_func(g_object_unref);
+
+    self->server = g_dbus_object_manager_server_new(DBUS_DISPLAY1_ROOT);
+
+    vm = g_dbus_object_skeleton_new(DBUS_DISPLAY1_ROOT "/VM");
+    g_dbus_object_skeleton_add_interface(vm, G_DBUS_INTERFACE_SKELETON(self->iface));
+    g_dbus_object_manager_server_export(self->server, vm);
+}
+
+static void
+dbus_display_finalize(Object *o)
+{
+    DBusDisplay *self = DBUS_DISPLAY(o);
+
+    g_clear_object(&self->server);
+    g_clear_pointer(&self->consoles, g_ptr_array_unref);
+    g_clear_object(&self->bus);
+    g_clear_object(&self->iface);
+    g_free(self->dbus_addr);
+}
+
+static bool
+dbus_display_add_console(DBusDisplay *self, int idx, Error **errp)
+{
+    QemuConsole *con;
+    DBusDisplayConsole *dbus_console;
+
+    con = qemu_console_lookup_by_index(idx);
+    assert(con);
+
+    if (qemu_console_is_graphic(con) &&
+        self->gl_mode != DISPLAYGL_MODE_OFF) {
+        qemu_console_set_display_gl_ctx(con, &self->glctx);
+    }
+
+    dbus_console = dbus_display_console_new(self, con);
+    g_ptr_array_insert(self->consoles, idx, dbus_console);
+    g_dbus_object_manager_server_export(self->server,
+                                        G_DBUS_OBJECT_SKELETON(dbus_console));
+    return true;
+}
+
+static void
+dbus_display_complete(UserCreatable *uc, Error **errp)
+{
+    DBusDisplay *self = DBUS_DISPLAY(uc);
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
+    if (self->dbus_addr && *self->dbus_addr) {
+        self->bus = g_dbus_connection_new_for_address_sync(self->dbus_addr,
+                        G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
+                        G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
+                        NULL, NULL, &err);
+    } else {
+        self->bus = g_bus_get_sync(G_BUS_TYPE_SESSION, NULL, &err);
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
+        if (!dbus_display_add_console(self, idx, errp)) {
+            return;
+        }
+        g_array_append_val(consoles, idx);
+    }
+
+    console_ids = g_variant_new_from_data(G_VARIANT_TYPE("au"),
+                                          consoles->data, consoles->len * sizeof(guint32), TRUE,
+                                          (GDestroyNotify)g_array_unref, consoles);
+    g_steal_pointer(&consoles);
+    g_object_set(self->iface,
+                 "name", qemu_name ?: "QEMU " QEMU_VERSION,
+                 "uuid", uuid,
+                 "console-ids", console_ids,
+                 NULL);
+
+    g_dbus_object_manager_server_set_connection(self->server, self->bus);
+    g_bus_own_name_on_connection(self->bus, "org.qemu", G_BUS_NAME_OWNER_FLAGS_NONE,
+                                 NULL, NULL, NULL, NULL);
+}
+
+static char *
+get_dbus_addr(Object *o, Error **errp)
+{
+    DBusDisplay *self = DBUS_DISPLAY(o);
+
+    return g_strdup(self->dbus_addr);
+}
+
+static void
+set_dbus_addr(Object *o, const char *str, Error **errp)
+{
+    DBusDisplay *self = DBUS_DISPLAY(o);
+
+    g_free(self->dbus_addr);
+    self->dbus_addr = g_strdup(str);
+}
+
+static int
+get_gl_mode(Object *o, Error **errp)
+{
+    DBusDisplay *self = DBUS_DISPLAY(o);
+
+    return self->gl_mode;
+}
+
+static void
+set_gl_mode(Object *o, int val, Error **errp)
+{
+    DBusDisplay *self = DBUS_DISPLAY(o);
+
+    self->gl_mode = val;
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
diff --git a/util/module.c b/util/module.c
index c65060c167..f228067d0d 100644
--- a/util/module.c
+++ b/util/module.c
@@ -183,6 +183,7 @@ static const struct {
     { "ui-spice-app",   "chardev-spice" },
 
 #ifdef CONFIG_OPENGL
+    { "ui-dbus",         "ui-opengl"    },
     { "ui-egl-headless", "ui-opengl"    },
     { "ui-gtk",          "ui-opengl"    },
     { "ui-sdl",          "ui-opengl"    },
@@ -294,6 +295,7 @@ static struct {
     const char *prefix;
     const char *module;
 } const qom_modules[] = {
+    { "dbus-display",          "backends-", "dbus"            },
     { "ccid-card-passthru",    "hw-", "usb-smartcard"         },
     { "ccid-card-emulated",    "hw-", "usb-smartcard"         },
     { "usb-redir",             "hw-", "usb-redirect"          },
diff --git a/qemu-options.hx b/qemu-options.hx
index 90801286c6..9b42f15f53 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1765,6 +1765,10 @@ DEF("display", HAS_ARG, QEMU_OPTION_display,
 #endif
 #if defined(CONFIG_OPENGL)
     "-display egl-headless[,rendernode=<file>]\n"
+#endif
+#if defined(CONFIG_UI_DBUS)
+    "-display dbus[,addr=<dbusaddr>]\n"
+    "             [,gl=on|core|es|off][,rendernode=<file>]\n"
 #endif
     "-display none\n"
     "                select display backend type\n"
@@ -1827,6 +1831,10 @@ SRST
         Start QEMU as a Spice server and launch the default Spice client
         application. The Spice server will redirect the serial consoles
         and QEMU monitors. (Since 4.0)
+
+    ``dbus``
+        Start a D-Bus service for the display. (Since X.X)
+
 ERST
 
 DEF("nographic", 0, QEMU_OPTION_nographic,
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
new file mode 100644
index 0000000000..df2ffcea07
--- /dev/null
+++ b/ui/dbus-display1.xml
@@ -0,0 +1,123 @@
+<?xml version="1.0" encoding="utf-8"?>
+<node>
+  <!-- on /org/qemu/Display1/VM -->
+  <interface name="org.qemu.Display1.VM">
+    <property name="Name" type="s" access="read"/>
+    <property name="UUID" type="s" access="read"/>
+    <property name="ConsoleIDs" type="au" access="read"/>
+  </interface>
+
+  <!-- on /org/qemu/Display1/Console_N -->
+  <interface name="org.qemu.Display1.Console">
+    <method name="RegisterListener">
+      <arg type="h" name="listener" direction="in"/>
+    </method>
+    <method name="SetUIInfo">
+      <arg name="width_mm" type="q" direction="in"/>
+      <arg name="height_mm" type="q" direction="in"/>
+      <arg name="xoff" type="i" direction="in"/>
+      <arg name="yoff" type="i" direction="in"/>
+      <arg name="width" type="u" direction="in"/>
+      <arg name="height" type="u" direction="in"/>
+    </method>
+    <property name="Label" type="s" access="read"/>
+    <property name="Head" type="u" access="read"/>
+    <property name="Type" type="s" access="read"/>
+    <property name="Width" type="u" access="read"/>
+    <property name="Height" type="u" access="read"/>
+    <property name="DeviceAddress" type="s" access="read"/>
+  </interface>
+
+  <interface name="org.qemu.Display1.Keyboard">
+    <method name="Press">
+      <arg type="u" name="keycode" direction="in"/>
+    </method>
+    <method name="Release">
+      <arg type="u" name="keycode" direction="in"/>
+    </method>
+    <!--
+       scroll = 1 << 0
+       num    = 1 << 1
+       caps   = 1 << 2
+    -->
+    <property name="Modifiers" type="u" access="readwrite"/>
+  </interface>
+
+  <interface name="org.qemu.Display1.Mouse">
+    <!--
+       left = 0
+       middle = 1
+       right = 2
+       wheel-up = 3
+       wheel-down = 4
+       side = 5
+       extra = 6
+    -->
+    <method name="Press">
+      <arg type="u" name="button" direction="in"/>
+    </method>
+    <method name="Release">
+      <arg type="u" name="button" direction="in"/>
+    </method>
+    <method name="SetAbsPosition">
+      <arg type="u" name="x" direction="in"/>
+      <arg type="u" name="y" direction="in"/>
+    </method>
+  </interface>
+
+  <!-- on client /org/qemu/Display1/Listener -->
+  <interface name="org.qemu.Display1.Listener">
+    <method name="Scanout">
+      <arg type="u" name="width" direction="in"/>
+      <arg type="u" name="height" direction="in"/>
+      <arg type="u" name="stride" direction="in"/>
+      <arg type="u" name="pixman_format" direction="in"/>
+      <arg type="ay" name="data" direction="in">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
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
+    <method name="UpdateDMABUF">
+      <arg type="i" name="x" direction="in"/>
+      <arg type="i" name="y" direction="in"/>
+      <arg type="i" name="width" direction="in"/>
+      <arg type="i" name="height" direction="in"/>
+    </method>
+    <method name="Disable">
+    </method>
+    <method name="MouseSet">
+      <arg type="i" name="x" direction="in"/>
+      <arg type="i" name="y" direction="in"/>
+      <arg type="i" name="on" direction="in"/>
+    </method>
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
index 97cdd58856..fe75c40f38 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -59,6 +59,23 @@ if config_host.has_key('CONFIG_OPENGL') and gbm.found()
   ui_modules += {'egl-headless' : egl_headless_ss}
 endif
 
+if 'CONFIG_UI_DBUS' in config_host
+  dbus_ss = ss.source_set()
+  dbus_display1 = custom_target('dbus-display gdbus-codegen',
+                                output: ['dbus-display1.h', 'dbus-display1.c'],
+                                input: files('dbus-display1.xml'),
+                                command: [config_host['GDBUS_CODEGEN'],
+                                          '@INPUT@',
+                                          '--glib-min-required', '2.64',
+                                          '--output-directory', meson.current_build_dir(),
+                                          '--interface-prefix', 'org.qemu.',
+                                          '--c-namespace', 'DBusDisplay',
+                                          '--generate-c-code', '@BASENAME@']).to_list()
+  dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
+              if_true: files('dbus.c', 'dbus-console.c', 'dbus-listener.c', 'dbus-error.c') + dbus_display1)
+  ui_modules += {'dbus' : dbus_ss}
+endif
+
 if gtk.found()
   softmmu_ss.add(when: 'CONFIG_WIN32', if_true: files('win32-kbd-hook.c'))
 
diff --git a/ui/trace-events b/ui/trace-events
index 0ffcdb4408..a821f51dc3 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -108,3 +108,14 @@ xkeymap_extension(const char *name) "extension '%s'"
 xkeymap_vendor(const char *name) "vendor '%s'"
 xkeymap_keycodes(const char *name) "keycodes '%s'"
 xkeymap_keymap(const char *name) "keymap '%s'"
+
+# dbus.c
+dbus_registered_listener(const char *bus_name) "peer %s"
+dbus_listener_vanished(const char *bus_name) "peer %s"
+dbus_kbd_press(unsigned int keycode) "keycode %u"
+dbus_kbd_release(unsigned int keycode) "keycode %u"
+dbus_kbd_modifiers_changed(unsigned int modifiers) "modifiers %u"
+dbus_mouse_press(unsigned int button) "button %u"
+dbus_mouse_release(unsigned int button) "button %u"
+dbus_mouse_set_pos(unsigned int x, unsigned int y) "x=%u, y=%u"
+dbus_update(int x, int y, int w, int h) "x=%d, y=%d, w=%d, h=%d"
-- 
2.29.0


