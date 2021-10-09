Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C72A427DAA
	for <lists+qemu-devel@lfdr.de>; Sat,  9 Oct 2021 23:31:08 +0200 (CEST)
Received: from localhost ([::1]:40450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mZJvv-0003Uw-98
	for lists+qemu-devel@lfdr.de; Sat, 09 Oct 2021 17:31:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38442)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJgS-0007st-Ic
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:15:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55231)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mZJgQ-0000SC-3w
 for qemu-devel@nongnu.org; Sat, 09 Oct 2021 17:15:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633814104;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rkVh0AN+w9Ii+TsDFvYEr2ubaOfCPuSF5lQ4wYtThbs=;
 b=gB5OgL4xNuWEKvSNa7uUjESF1kzHAkI8IfZaLrYCtKoYqyYVgPARGzeGJJKdP3AVJTm3AD
 115B/SK9Uaj5X2M5N9IJXN+5N3mFAihyzxZo0oia3vsmCPfxK1FNuP/VW9WFH4Prp694F2
 LN+Uoo9nICxYI2utkMxdxM4pMkWtmpo=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-307-3gA0U_a7PyG6Sc_g0eW9aw-1; Sat, 09 Oct 2021 17:15:03 -0400
X-MC-Unique: 3gA0U_a7PyG6Sc_g0eW9aw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9FE731005E4D
 for <qemu-devel@nongnu.org>; Sat,  9 Oct 2021 21:15:02 +0000 (UTC)
Received: from localhost (unknown [10.39.208.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 45C115D9D3;
 Sat,  9 Oct 2021 21:14:52 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 27/37] ui/dbus: add p2p=on/off option
Date: Sun, 10 Oct 2021 01:08:28 +0400
Message-Id: <20211009210838.2219430-28-marcandre.lureau@redhat.com>
In-Reply-To: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
References: <20211009210838.2219430-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add an option to use direct connections instead of via the bus. Clients
are accepted via QMP add_client.

This allows to provide the D-Bus display without a bus. It also
simplifies the testing setup (some CI have issues to setup a D-Bus bus
in a container).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 qapi/misc.json            |   4 +-
 qapi/ui.json              |   6 ++-
 include/qemu/cutils.h     |   5 ++
 include/ui/dbus-display.h |  17 +++++++
 include/ui/dbus-module.h  |  11 ++++
 ui/dbus.h                 |   2 +
 monitor/qmp-cmds.c        |  13 +++++
 ui/dbus-console.c         |   2 +-
 ui/dbus-listener.c        |   2 +-
 ui/dbus-module.c          |  35 +++++++++++++
 ui/dbus.c                 | 104 ++++++++++++++++++++++++++++++++++++--
 qemu-options.hx           |   2 +
 ui/meson.build            |   3 ++
 13 files changed, 196 insertions(+), 10 deletions(-)
 create mode 100644 include/ui/dbus-display.h
 create mode 100644 include/ui/dbus-module.h
 create mode 100644 ui/dbus-module.c

diff --git a/qapi/misc.json b/qapi/misc.json
index 5c2ca3b556..887bcf54bb 100644
--- a/qapi/misc.json
+++ b/qapi/misc.json
@@ -14,8 +14,8 @@
 # Allow client connections for VNC, Spice and socket based
 # character devices to be passed in to QEMU via SCM_RIGHTS.
 #
-# @protocol: protocol name. Valid names are "vnc", "spice" or the
-#            name of a character device (eg. from -chardev id=XXXX)
+# @protocol: protocol name. Valid names are "vnc", "spice", "@dbus-display" or
+#            the name of a character device (eg. from -chardev id=XXXX)
 #
 # @fdname: file descriptor name previously passed via 'getfd' command
 #
diff --git a/qapi/ui.json b/qapi/ui.json
index 5ca604bd90..f23d012cb8 100644
--- a/qapi/ui.json
+++ b/qapi/ui.json
@@ -1131,12 +1131,16 @@
 # @rendernode: Which DRM render node should be used. Default is the first
 #              available node on the host.
 #
+# @p2p: Whether to use peer-to-peer connections (accepted through
+#       ``add_client``).
+#
 # Since: 6.2
 #
 ##
 { 'struct'  : 'DisplayDBus',
   'data'    : { '*rendernode' : 'str',
-                '*addr': 'str' } }
+                '*addr': 'str',
+                '*p2p': 'bool' } }
 
  ##
  # @DisplayGLMode:
diff --git a/include/qemu/cutils.h b/include/qemu/cutils.h
index 986ed8e15f..320543950c 100644
--- a/include/qemu/cutils.h
+++ b/include/qemu/cutils.h
@@ -209,4 +209,9 @@ int qemu_pstrcmp0(const char **str1, const char **str2);
  */
 char *get_relocated_path(const char *dir);
 
+static inline const char *yes_no(bool b)
+{
+     return b ? "yes" : "no";
+}
+
 #endif
diff --git a/include/ui/dbus-display.h b/include/ui/dbus-display.h
new file mode 100644
index 0000000000..88f153c237
--- /dev/null
+++ b/include/ui/dbus-display.h
@@ -0,0 +1,17 @@
+#ifndef DBUS_DISPLAY_H_
+#define DBUS_DISPLAY_H_
+
+#include "qapi/error.h"
+#include "ui/dbus-module.h"
+
+static inline bool qemu_using_dbus_display(Error **errp)
+{
+    if (!using_dbus_display) {
+        error_set(errp, ERROR_CLASS_DEVICE_NOT_ACTIVE,
+                  "D-Bus display is not in use");
+        return false;
+    }
+    return true;
+}
+
+#endif /* DBUS_DISPLAY_H_ */
diff --git a/include/ui/dbus-module.h b/include/ui/dbus-module.h
new file mode 100644
index 0000000000..ace4a17a5c
--- /dev/null
+++ b/include/ui/dbus-module.h
@@ -0,0 +1,11 @@
+#ifndef DBUS_MODULE_H_
+#define DBUS_MODULE_H_
+
+struct QemuDBusDisplayOps {
+    bool (*add_client)(int csock, Error **errp);
+};
+
+extern int using_dbus_display;
+extern struct QemuDBusDisplayOps qemu_dbus_display;
+
+#endif /* DBUS_MODULE_H_*/
diff --git a/ui/dbus.h b/ui/dbus.h
index d3c9598dd1..4698d32463 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -34,6 +34,7 @@ struct DBusDisplay {
     Object parent;
 
     DisplayGLMode gl_mode;
+    bool p2p;
     char *dbus_addr;
     DisplayGLCtx glctx;
 
@@ -41,6 +42,7 @@ struct DBusDisplay {
     GDBusObjectManagerServer *server;
     QemuDBusDisplay1VM *iface;
     GPtrArray *consoles;
+    GCancellable *add_client_cancellable;
 };
 
 #define TYPE_DBUS_DISPLAY "dbus-display"
diff --git a/monitor/qmp-cmds.c b/monitor/qmp-cmds.c
index 5c0d5e116b..aa6b012313 100644
--- a/monitor/qmp-cmds.c
+++ b/monitor/qmp-cmds.c
@@ -24,6 +24,7 @@
 #include "chardev/char.h"
 #include "ui/qemu-spice.h"
 #include "ui/console.h"
+#include "ui/dbus-display.h"
 #include "sysemu/kvm.h"
 #include "sysemu/runstate.h"
 #include "sysemu/runstate-action.h"
@@ -281,6 +282,18 @@ void qmp_add_client(const char *protocol, const char *fdname,
         skipauth = has_skipauth ? skipauth : false;
         vnc_display_add_client(NULL, fd, skipauth);
         return;
+#endif
+#ifdef CONFIG_DBUS_DISPLAY
+    } else if (strcmp(protocol, "@dbus-display") == 0) {
+        if (!qemu_using_dbus_display(errp)) {
+            close(fd);
+            return;
+        }
+        if (!qemu_dbus_display.add_client(fd, errp)) {
+            close(fd);
+            return;
+        }
+        return;
 #endif
     } else if ((s = qemu_chr_find(protocol)) != NULL) {
         if (qemu_chr_add_client(s, fd) < 0) {
diff --git a/ui/dbus-console.c b/ui/dbus-console.c
index 1ccf638c10..e062f721d7 100644
--- a/ui/dbus-console.c
+++ b/ui/dbus-console.c
@@ -219,7 +219,7 @@ dbus_console_register_listener(DBusDisplayConsole *ddc,
     DBusDisplayListener *listener;
     int fd;
 
-    if (g_hash_table_contains(ddc->listeners, sender)) {
+    if (sender && g_hash_table_contains(ddc->listeners, sender)) {
         g_dbus_method_invocation_return_error(
             invocation,
             DBUS_DISPLAY_ERROR,
diff --git a/ui/dbus-listener.c b/ui/dbus-listener.c
index 20094fc18a..81c119b13a 100644
--- a/ui/dbus-listener.c
+++ b/ui/dbus-listener.c
@@ -440,7 +440,7 @@ dbus_display_listener_init(DBusDisplayListener *ddl)
 const char *
 dbus_display_listener_get_bus_name(DBusDisplayListener *ddl)
 {
-    return ddl->bus_name;
+    return ddl->bus_name ?: "p2p";
 }
 
 DBusDisplayConsole *
diff --git a/ui/dbus-module.c b/ui/dbus-module.c
new file mode 100644
index 0000000000..c8771fe48c
--- /dev/null
+++ b/ui/dbus-module.c
@@ -0,0 +1,35 @@
+/*
+ * D-Bus module support.
+ *
+ * Copyright (C) 2021 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU General Public License as
+ * published by the Free Software Foundation; either version 2 or
+ * (at your option) version 3 of the License.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "ui/dbus-module.h"
+
+int using_dbus_display;
+
+static bool
+qemu_dbus_display_add_client(int csock, Error **errp)
+{
+    error_setg(errp, "D-Bus display isn't enabled");
+    return false;
+}
+
+struct QemuDBusDisplayOps qemu_dbus_display = {
+    .add_client = qemu_dbus_display_add_client,
+};
diff --git a/ui/dbus.c b/ui/dbus.c
index 12da8ffe31..56e284fb97 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -22,10 +22,12 @@
  * THE SOFTWARE.
  */
 #include "qemu/osdep.h"
+#include "qemu/cutils.h"
 #include "qemu/dbus.h"
 #include "qemu/option.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/sysemu.h"
+#include "ui/dbus-module.h"
 #include "ui/egl-helpers.h"
 #include "ui/egl-context.h"
 #include "qapi/error.h"
@@ -33,6 +35,8 @@
 
 #include "dbus.h"
 
+static DBusDisplay *dbus_display;
+
 static QEMUGLContext dbus_create_context(DisplayGLCtx *dgc,
                                          QEMUGLParams *params)
 {
@@ -73,9 +77,14 @@ dbus_display_finalize(Object *o)
 
     g_clear_object(&dd->server);
     g_clear_pointer(&dd->consoles, g_ptr_array_unref);
+    if (dd->add_client_cancellable) {
+        g_cancellable_cancel(dd->add_client_cancellable);
+    }
+    g_clear_object(&dd->add_client_cancellable);
     g_clear_object(&dd->bus);
     g_clear_object(&dd->iface);
     g_free(dd->dbus_addr);
+    dbus_display = NULL;
 }
 
 static bool
@@ -115,7 +124,10 @@ dbus_display_complete(UserCreatable *uc, Error **errp)
         return;
     }
 
-    if (dd->dbus_addr && *dd->dbus_addr) {
+    if (dd->p2p) {
+        /* wait for dbus_display_add_client() */
+        dbus_display = dd;
+    } else if (dd->dbus_addr && *dd->dbus_addr) {
         dd->bus = g_dbus_connection_new_for_address_sync(dd->dbus_addr,
                         G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_CLIENT |
                         G_DBUS_CONNECTION_FLAGS_MESSAGE_BUS_CONNECTION,
@@ -151,10 +163,80 @@ dbus_display_complete(UserCreatable *uc, Error **errp)
                  "console-ids", console_ids,
                  NULL);
 
-    g_dbus_object_manager_server_set_connection(dd->server, dd->bus);
-    g_bus_own_name_on_connection(dd->bus, "org.qemu",
-                                 G_BUS_NAME_OWNER_FLAGS_NONE,
-                                 NULL, NULL, NULL, NULL);
+    if (dd->bus) {
+        g_dbus_object_manager_server_set_connection(dd->server, dd->bus);
+        g_bus_own_name_on_connection(dd->bus, "org.qemu",
+                                     G_BUS_NAME_OWNER_FLAGS_NONE,
+                                     NULL, NULL, NULL, NULL);
+    }
+}
+
+static void
+dbus_display_add_client_ready(GObject *source_object,
+                              GAsyncResult *res,
+                              gpointer user_data)
+{
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GDBusConnection) conn = NULL;
+
+    g_clear_object(&dbus_display->add_client_cancellable);
+
+    conn = g_dbus_connection_new_finish(res, &err);
+    if (!conn) {
+        error_printf("Failed to accept D-Bus client: %s", err->message);
+    }
+
+    g_dbus_object_manager_server_set_connection(dbus_display->server, conn);
+}
+
+
+static bool
+dbus_display_add_client(int csock, Error **errp)
+{
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GSocket) socket = NULL;
+    g_autoptr(GSocketConnection) conn = NULL;
+    g_autofree char *guid = g_dbus_generate_guid();
+
+    if (dbus_display->add_client_cancellable) {
+        g_cancellable_cancel(dbus_display->add_client_cancellable);
+    }
+
+    socket = g_socket_new_from_fd(csock, &err);
+    if (!socket) {
+        error_setg(errp, "Failed to setup D-Bus socket: %s", err->message);
+        return false;
+    }
+
+    conn = g_socket_connection_factory_create_connection(socket);
+
+    dbus_display->add_client_cancellable = g_cancellable_new();
+
+    g_dbus_connection_new(G_IO_STREAM(conn),
+                          guid,
+                          G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+                          NULL,
+                          dbus_display->add_client_cancellable,
+                          dbus_display_add_client_ready,
+                          NULL);
+
+    return true;
+}
+
+static bool
+get_dbus_p2p(Object *o, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    return dd->p2p;
+}
+
+static void
+set_dbus_p2p(Object *o, bool p2p, Error **errp)
+{
+    DBusDisplay *dd = DBUS_DISPLAY(o);
+
+    dd->p2p = p2p;
 }
 
 static char *
@@ -196,6 +278,7 @@ dbus_display_class_init(ObjectClass *oc, void *data)
     UserCreatableClass *ucc = USER_CREATABLE_CLASS(oc);
 
     ucc->complete = dbus_display_complete;
+    object_class_property_add_bool(oc, "p2p", get_dbus_p2p, set_dbus_p2p);
     object_class_property_add_str(oc, "addr", get_dbus_addr, set_dbus_addr);
     object_class_property_add_enum(oc, "gl-mode",
                                    "DisplayGLMode", &DisplayGLMode_lookup,
@@ -222,11 +305,19 @@ dbus_init(DisplayState *ds, DisplayOptions *opts)
 {
     DisplayGLMode mode = opts->has_gl ? opts->gl : DISPLAYGL_MODE_OFF;
 
+    if (opts->u.dbus.addr && opts->u.dbus.p2p) {
+        error_report("dbus: can't accept both addr=X and p2p=yes options");
+        exit(1);
+    }
+
+    using_dbus_display = 1;
+
     object_new_with_props(TYPE_DBUS_DISPLAY,
                           object_get_objects_root(),
                           "dbus-display", &error_fatal,
                           "addr", opts->u.dbus.addr ?: "",
                           "gl-mode", DisplayGLMode_str(mode),
+                          "p2p", yes_no(opts->u.dbus.p2p),
                           NULL);
 }
 
@@ -251,6 +342,9 @@ static QemuDisplay qemu_display_dbus = {
 
 static void register_dbus(void)
 {
+    qemu_dbus_display = (struct QemuDBusDisplayOps) {
+        .add_client = dbus_display_add_client,
+    };
     type_register_static(&dbus_display_info);
     qemu_display_register(&qemu_display_dbus);
 }
diff --git a/qemu-options.hx b/qemu-options.hx
index 1a927458e6..b3352a7fbc 100644
--- a/qemu-options.hx
+++ b/qemu-options.hx
@@ -1901,6 +1901,8 @@ SRST
 
         ``addr=<dbusaddr>`` : D-Bus bus address to connect to.
 
+        ``p2p=yes|no`` : Use peer-to-peer connection, accepted via QMP ``add_client``.
+
         ``gl=on|off|core|es`` : Use OpenGL for rendering (the D-interface will
         share framebuffers with DMABUF file descriptors).
 
diff --git a/ui/meson.build b/ui/meson.build
index 6270aa768b..80f21704ad 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -14,6 +14,9 @@ softmmu_ss.add(files(
   'qemu-pixman.c',
   'util.c',
 ))
+if dbus_display
+  softmmu_ss.add(files('dbus-module.c'))
+endif
 softmmu_ss.add([spice_headers, files('spice-module.c')])
 softmmu_ss.add(when: spice_protocol, if_true: files('vdagent.c'))
 
-- 
2.33.0.721.g106298f7f9


