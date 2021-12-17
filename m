Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AF89478F61
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Dec 2021 16:21:10 +0100 (CET)
Received: from localhost ([::1]:39330 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1myF2i-0007PL-K8
	for lists+qemu-devel@lfdr.de; Fri, 17 Dec 2021 10:21:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEUM-0006sJ-9Y
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:45:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1myEUH-0002mc-9q
 for qemu-devel@nongnu.org; Fri, 17 Dec 2021 09:45:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639752315;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O6w22weP47HiKXqlpTAQeQBBopu3ZSeBGmXShYll/QU=;
 b=fd86UWCVOTcMy6dm9Rf1ekAVwrbTTFGMrkr0EfQEXC+n4H6zyj77LnsoEfwVgsM+VdoN/n
 Qj9PSHd8XAePwbaD74doiSPSIJBPor+UonRNsDTBowOHh+RL4VGhFKqIeXAU4rbGWZUqMh
 Gg/bB6YOWx1NAAhOfjxfBbYyqCQRBIw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-G_Q0tmXlO9KbQQFc2RoOtA-1; Fri, 17 Dec 2021 09:45:11 -0500
X-MC-Unique: G_Q0tmXlO9KbQQFc2RoOtA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C3EAF1018720;
 Fri, 17 Dec 2021 14:45:10 +0000 (UTC)
Received: from localhost (unknown [10.39.208.10])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D5E574BC76;
 Fri, 17 Dec 2021 14:45:08 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL 34/36] ui/dbus: add chardev backend & interface
Date: Fri, 17 Dec 2021 18:37:54 +0400
Message-Id: <20211217143756.1831099-35-marcandre.lureau@redhat.com>
In-Reply-To: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
References: <20211217143756.1831099-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.718,
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, kraxel@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Add a new chardev backend which allows D-Bus client to handle the
chardev stream & events.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 qapi/char.json                |  27 ++++
 include/chardev/char-socket.h |   2 +
 include/qemu/dbus.h           |   5 +
 ui/dbus.h                     |  44 +++++
 ui/dbus-chardev.c             | 296 ++++++++++++++++++++++++++++++++++
 ui/dbus.c                     |  26 +++
 ui/dbus-display1.xml          |  75 +++++++++
 ui/meson.build                |   1 +
 8 files changed, 476 insertions(+)
 create mode 100644 ui/dbus-chardev.c

diff --git a/qapi/char.json b/qapi/char.json
index f5133a5eeb37..6ed424d07ced 100644
--- a/qapi/char.json
+++ b/qapi/char.json
@@ -358,6 +358,20 @@
   'base': 'ChardevCommon',
   'if': 'CONFIG_SPICE' }
 
+##
+# @ChardevDBus:
+#
+# Configuration info for DBus chardevs.
+#
+# @name: name of the channel (following docs/spice-port-fqdn.txt)
+#
+# Since: 6.2
+##
+{ 'struct': 'ChardevDBus',
+  'data': { 'name': 'str' },
+  'base': 'ChardevCommon',
+  'if': 'CONFIG_DBUS_DISPLAY' }
+
 ##
 # @ChardevVC:
 #
@@ -422,6 +436,7 @@
 # @spicevmc: Since 1.5
 # @spiceport: Since 1.5
 # @qemu-vdagent: Since 6.1
+# @dbus: Since 6.2
 # @vc: v1.5
 # @ringbuf: Since 1.6
 # @memory: Since 1.5
@@ -447,6 +462,7 @@
             { 'name': 'spicevmc', 'if': 'CONFIG_SPICE' },
             { 'name': 'spiceport', 'if': 'CONFIG_SPICE' },
             { 'name': 'qemu-vdagent', 'if': 'CONFIG_SPICE_PROTOCOL' },
+            { 'name': 'dbus', 'if': 'CONFIG_DBUS_DISPLAY' },
             'vc',
             'ringbuf',
             # next one is just for compatibility
@@ -535,6 +551,15 @@
   'data': { 'data': 'ChardevQemuVDAgent' },
   'if': 'CONFIG_SPICE_PROTOCOL' }
 
+##
+# @ChardevDBusWrapper:
+#
+# Since: 6.2
+##
+{ 'struct': 'ChardevDBusWrapper',
+  'data': { 'data': 'ChardevDBus' },
+  'if': 'CONFIG_DBUS_DISPLAY' }
+
 ##
 # @ChardevVCWrapper:
 #
@@ -582,6 +607,8 @@
                            'if': 'CONFIG_SPICE' },
             'qemu-vdagent': { 'type': 'ChardevQemuVDAgentWrapper',
                               'if': 'CONFIG_SPICE_PROTOCOL' },
+            'dbus': { 'type': 'ChardevDBusWrapper',
+                      'if': 'CONFIG_DBUS_DISPLAY' },
             'vc': 'ChardevVCWrapper',
             'ringbuf': 'ChardevRingbufWrapper',
             # next one is just for compatibility
diff --git a/include/chardev/char-socket.h b/include/chardev/char-socket.h
index 1a9274f2e3ac..6b6e2ceba1d7 100644
--- a/include/chardev/char-socket.h
+++ b/include/chardev/char-socket.h
@@ -43,6 +43,8 @@ typedef enum {
     TCP_CHARDEV_STATE_CONNECTED,
 } TCPChardevState;
 
+typedef ChardevClass SocketChardevClass;
+
 struct SocketChardev {
     Chardev parent;
     QIOChannel *ioc; /* Client I/O channel */
diff --git a/include/qemu/dbus.h b/include/qemu/dbus.h
index c0cbb1ca44d3..08f00dfd5342 100644
--- a/include/qemu/dbus.h
+++ b/include/qemu/dbus.h
@@ -12,6 +12,11 @@
 
 #include <gio/gio.h>
 
+#include "qom/object.h"
+#include "chardev/char.h"
+#include "qemu/notify.h"
+#include "qemu/typedefs.h"
+
 /* glib/gio 2.68 */
 #define DBUS_METHOD_INVOCATION_HANDLED TRUE
 #define DBUS_METHOD_INVOCATION_UNHANDLED FALSE
diff --git a/ui/dbus.h b/ui/dbus.h
index 3e89eafcab6e..64c77cab4441 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -24,6 +24,7 @@
 #ifndef UI_DBUS_H_
 #define UI_DBUS_H_
 
+#include "chardev/char-socket.h"
 #include "qemu/dbus.h"
 #include "qom/object.h"
 #include "ui/console.h"
@@ -56,11 +57,15 @@ struct DBusDisplay {
     QemuDBusDisplay1Clipboard *clipboard;
     QemuDBusDisplay1Clipboard *clipboard_proxy;
     DBusClipboardRequest clipboard_request[QEMU_CLIPBOARD_SELECTION__COUNT];
+
+    Notifier notifier;
 };
 
 #define TYPE_DBUS_DISPLAY "dbus-display"
 OBJECT_DECLARE_SIMPLE_TYPE(DBusDisplay, DBUS_DISPLAY)
 
+void dbus_display_notifier_add(Notifier *notifier);
+
 #define DBUS_DISPLAY_TYPE_CONSOLE dbus_display_console_get_type()
 G_DECLARE_FINAL_TYPE(DBusDisplayConsole,
                      dbus_display_console,
@@ -95,6 +100,45 @@ dbus_display_listener_get_bus_name(DBusDisplayListener *ddl);
 extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
 extern const DisplayChangeListenerOps dbus_dcl_ops;
 
+#define TYPE_CHARDEV_DBUS "chardev-dbus"
+
+typedef struct DBusChardevClass {
+    SocketChardevClass parent_class;
+
+    void (*parent_chr_be_event)(Chardev *s, QEMUChrEvent event);
+} DBusChardevClass;
+
+DECLARE_CLASS_CHECKERS(DBusChardevClass, DBUS_CHARDEV,
+                       TYPE_CHARDEV_DBUS)
+
+typedef struct DBusChardev {
+    SocketChardev parent;
+
+    bool exported;
+    QemuDBusDisplay1Chardev *iface;
+} DBusChardev;
+
+DECLARE_INSTANCE_CHECKER(DBusChardev, DBUS_CHARDEV, TYPE_CHARDEV_DBUS)
+
+#define CHARDEV_IS_DBUS(chr) \
+    object_dynamic_cast(OBJECT(chr), TYPE_CHARDEV_DBUS)
+
+typedef enum {
+    DBUS_DISPLAY_CHARDEV_OPEN,
+    DBUS_DISPLAY_CHARDEV_CLOSE,
+} DBusDisplayEventType;
+
+typedef struct DBusDisplayEvent {
+    DBusDisplayEventType type;
+    union {
+        DBusChardev *chardev;
+    };
+} DBusDisplayEvent;
+
+void dbus_display_notify(DBusDisplayEvent *event);
+
+void dbus_chardev_init(DBusDisplay *dpy);
+
 void dbus_clipboard_init(DBusDisplay *dpy);
 
 #endif /* UI_DBUS_H_ */
diff --git a/ui/dbus-chardev.c b/ui/dbus-chardev.c
new file mode 100644
index 000000000000..940ef937cdf1
--- /dev/null
+++ b/ui/dbus-chardev.c
@@ -0,0 +1,296 @@
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
+#include "trace.h"
+#include "qapi/error.h"
+#include "qemu/config-file.h"
+#include "qemu/option.h"
+
+#include <gio/gunixfdlist.h>
+
+#include "dbus.h"
+
+static char *
+dbus_display_chardev_path(DBusChardev *chr)
+{
+    return g_strdup_printf(DBUS_DISPLAY1_ROOT "/Chardev_%s",
+                           CHARDEV(chr)->label);
+}
+
+static void
+dbus_display_chardev_export(DBusDisplay *dpy, DBusChardev *chr)
+{
+    g_autoptr(GDBusObjectSkeleton) sk = NULL;
+    g_autofree char *path = dbus_display_chardev_path(chr);
+
+    if (chr->exported) {
+        return;
+    }
+
+    sk = g_dbus_object_skeleton_new(path);
+    g_dbus_object_skeleton_add_interface(
+        sk, G_DBUS_INTERFACE_SKELETON(chr->iface));
+    g_dbus_object_manager_server_export(dpy->server, sk);
+    chr->exported = true;
+}
+
+static void
+dbus_display_chardev_unexport(DBusDisplay *dpy, DBusChardev *chr)
+{
+    g_autofree char *path = dbus_display_chardev_path(chr);
+
+    if (!chr->exported) {
+        return;
+    }
+
+    g_dbus_object_manager_server_unexport(dpy->server, path);
+    chr->exported = false;
+}
+
+static int
+dbus_display_chardev_foreach(Object *obj, void *data)
+{
+    DBusDisplay *dpy = DBUS_DISPLAY(data);
+
+    if (!CHARDEV_IS_DBUS(obj)) {
+        return 0;
+    }
+
+    dbus_display_chardev_export(dpy, DBUS_CHARDEV(obj));
+
+    return 0;
+}
+
+static void
+dbus_display_on_notify(Notifier *notifier, void *data)
+{
+    DBusDisplay *dpy = container_of(notifier, DBusDisplay, notifier);
+    DBusDisplayEvent *event = data;
+
+    switch (event->type) {
+    case DBUS_DISPLAY_CHARDEV_OPEN:
+        dbus_display_chardev_export(dpy, event->chardev);
+        break;
+    case DBUS_DISPLAY_CHARDEV_CLOSE:
+        dbus_display_chardev_unexport(dpy, event->chardev);
+        break;
+    }
+}
+
+void
+dbus_chardev_init(DBusDisplay *dpy)
+{
+    dpy->notifier.notify = dbus_display_on_notify;
+    dbus_display_notifier_add(&dpy->notifier);
+
+    object_child_foreach(container_get(object_get_root(), "/chardevs"),
+                         dbus_display_chardev_foreach, dpy);
+}
+
+static gboolean
+dbus_chr_register(
+    DBusChardev *dc,
+    GDBusMethodInvocation *invocation,
+    GUnixFDList *fd_list,
+    GVariant *arg_stream,
+    QemuDBusDisplay1Chardev *object)
+{
+    g_autoptr(GError) err = NULL;
+    int fd;
+
+    fd = g_unix_fd_list_get(fd_list, g_variant_get_handle(arg_stream), &err);
+    if (err) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Couldn't get peer FD: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (qemu_chr_add_client(CHARDEV(dc), fd) < 0) {
+        g_dbus_method_invocation_return_error(invocation,
+                                              DBUS_DISPLAY_ERROR,
+                                              DBUS_DISPLAY_ERROR_FAILED,
+                                              "Couldn't register FD!");
+        close(fd);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    g_object_set(dc->iface,
+                 "owner", g_dbus_method_invocation_get_sender(invocation),
+                 NULL);
+
+    qemu_dbus_display1_chardev_complete_register(object, invocation, NULL);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_chr_send_break(
+    DBusChardev *dc,
+    GDBusMethodInvocation *invocation,
+    QemuDBusDisplay1Chardev *object)
+{
+    qemu_chr_be_event(CHARDEV(dc), CHR_EVENT_BREAK);
+
+    qemu_dbus_display1_chardev_complete_send_break(object, invocation);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static void
+dbus_chr_open(Chardev *chr, ChardevBackend *backend,
+              bool *be_opened, Error **errp)
+{
+    ERRP_GUARD();
+
+    DBusChardev *dc = DBUS_CHARDEV(chr);
+    DBusDisplayEvent event = {
+        .type = DBUS_DISPLAY_CHARDEV_OPEN,
+        .chardev = dc,
+    };
+    g_autoptr(ChardevBackend) be = NULL;
+    g_autoptr(QemuOpts) opts = NULL;
+
+    dc->iface = qemu_dbus_display1_chardev_skeleton_new();
+    g_object_set(dc->iface, "name", backend->u.dbus.data->name, NULL);
+    g_object_connect(dc->iface,
+                     "swapped-signal::handle-register",
+                     dbus_chr_register, dc,
+                     "swapped-signal::handle-send-break",
+                     dbus_chr_send_break, dc,
+                     NULL);
+
+    dbus_display_notify(&event);
+
+    be = g_new0(ChardevBackend, 1);
+    opts = qemu_opts_create(qemu_find_opts("chardev"), NULL, 0, &error_abort);
+    qemu_opt_set(opts, "server", "on", &error_abort);
+    qemu_opt_set(opts, "wait", "off", &error_abort);
+    CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->parse(
+        opts, be, errp);
+    if (*errp) {
+        return;
+    }
+    CHARDEV_CLASS(object_class_by_name(TYPE_CHARDEV_SOCKET))->open(
+        chr, be, be_opened, errp);
+}
+
+static void
+dbus_chr_set_fe_open(Chardev *chr, int fe_open)
+{
+    DBusChardev *dc = DBUS_CHARDEV(chr);
+
+    g_object_set(dc->iface, "feopened", fe_open, NULL);
+}
+
+static void
+dbus_chr_set_echo(Chardev *chr, bool echo)
+{
+    DBusChardev *dc = DBUS_CHARDEV(chr);
+
+    g_object_set(dc->iface, "echo", echo, NULL);
+}
+
+static void
+dbus_chr_be_event(Chardev *chr, QEMUChrEvent event)
+{
+    DBusChardev *dc = DBUS_CHARDEV(chr);
+    DBusChardevClass *klass = DBUS_CHARDEV_GET_CLASS(chr);
+
+    switch (event) {
+    case CHR_EVENT_CLOSED:
+        if (dc->iface) {
+            /* on finalize, iface is set to NULL */
+            g_object_set(dc->iface, "owner", "", NULL);
+        }
+        break;
+    default:
+        break;
+    };
+
+    klass->parent_chr_be_event(chr, event);
+}
+
+static void
+dbus_chr_parse(QemuOpts *opts, ChardevBackend *backend,
+               Error **errp)
+{
+    const char *name = qemu_opt_get(opts, "name");
+    ChardevDBus *dbus;
+
+    if (name == NULL) {
+        error_setg(errp, "chardev: dbus: no name given");
+        return;
+    }
+
+    backend->type = CHARDEV_BACKEND_KIND_DBUS;
+    dbus = backend->u.dbus.data = g_new0(ChardevDBus, 1);
+    qemu_chr_parse_common(opts, qapi_ChardevDBus_base(dbus));
+    dbus->name = g_strdup(name);
+}
+
+static void
+char_dbus_class_init(ObjectClass *oc, void *data)
+{
+    DBusChardevClass *klass = DBUS_CHARDEV_CLASS(oc);
+    ChardevClass *cc = CHARDEV_CLASS(oc);
+
+    cc->parse = dbus_chr_parse;
+    cc->open = dbus_chr_open;
+    cc->chr_set_fe_open = dbus_chr_set_fe_open;
+    cc->chr_set_echo = dbus_chr_set_echo;
+    klass->parent_chr_be_event = cc->chr_be_event;
+    cc->chr_be_event = dbus_chr_be_event;
+}
+
+static void
+char_dbus_finalize(Object *obj)
+{
+    DBusChardev *dc = DBUS_CHARDEV(obj);
+    DBusDisplayEvent event = {
+        .type = DBUS_DISPLAY_CHARDEV_CLOSE,
+        .chardev = dc,
+    };
+
+    dbus_display_notify(&event);
+    g_clear_object(&dc->iface);
+}
+
+static const TypeInfo char_dbus_type_info = {
+    .name = TYPE_CHARDEV_DBUS,
+    .parent = TYPE_CHARDEV_SOCKET,
+    .class_size = sizeof(DBusChardevClass),
+    .instance_size = sizeof(DBusChardev),
+    .instance_finalize = char_dbus_finalize,
+    .class_init = char_dbus_class_init,
+};
+module_obj(TYPE_CHARDEV_DBUS);
+
+static void
+register_types(void)
+{
+    type_register_static(&char_dbus_type_info);
+}
+
+type_init(register_types);
diff --git a/ui/dbus.c b/ui/dbus.c
index 4f0bc293aaa0..41f1716f255a 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -55,6 +55,27 @@ static const DisplayGLCtxOps dbus_gl_ops = {
     .dpy_gl_ctx_make_current = qemu_egl_make_context_current,
 };
 
+static NotifierList dbus_display_notifiers =
+    NOTIFIER_LIST_INITIALIZER(dbus_display_notifiers);
+
+void
+dbus_display_notifier_add(Notifier *notifier)
+{
+    notifier_list_add(&dbus_display_notifiers, notifier);
+}
+
+static void
+dbus_display_notifier_remove(Notifier *notifier)
+{
+    notifier_remove(notifier);
+}
+
+void
+dbus_display_notify(DBusDisplayEvent *event)
+{
+    notifier_list_notify(&dbus_display_notifiers, event);
+}
+
 static void
 dbus_display_init(Object *o)
 {
@@ -73,6 +94,7 @@ dbus_display_init(Object *o)
     g_dbus_object_manager_server_export(dd->server, vm);
 
     dbus_clipboard_init(dd);
+    dbus_chardev_init(dd);
 }
 
 static void
@@ -80,6 +102,10 @@ dbus_display_finalize(Object *o)
 {
     DBusDisplay *dd = DBUS_DISPLAY(o);
 
+    if (dd->notifier.notify) {
+        dbus_display_notifier_remove(&dd->notifier);
+    }
+
     qemu_clipboard_peer_unregister(&dd->clipboard_peer);
     g_clear_object(&dd->clipboard);
 
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
index 767562ad1ea3..c3b2293376d7 100644
--- a/ui/dbus-display1.xml
+++ b/ui/dbus-display1.xml
@@ -683,4 +683,79 @@
       </arg>
     </method>
   </interface>
+
+  <!--
+      org.qemu.Display1.Chardev:
+
+      Character devices may be available on ``/org/qemu/Display1/Chardev_$id``.
+
+      They may be used for different kind of streams, which are identified via
+      their FQDN :dbus:prop:`Name`.
+
+      .. _dbus-chardev-fqdn:
+
+      Here are some known reserved kind names (the ``org.qemu`` prefix is
+      reserved by QEMU):
+
+      org.qemu.console.serial.0
+        A serial console stream.
+
+      org.qemu.monitor.hmp.0
+        A QEMU HMP human monitor.
+
+      org.qemu.monitor.qmp.0
+        A QEMU QMP monitor.
+
+      org.qemu.usbredir
+        A usbredir stream.
+  -->
+  <interface name="org.qemu.Display1.Chardev">
+    <!--
+        Register:
+        @stream: a Unix FD to redirect the stream to.
+
+        Register a file-descriptor for the stream handling.
+
+        The current handler, if any, will be replaced.
+    -->
+    <method name="Register">
+      <arg type="h" name="stream" direction="in"/>
+    </method>
+
+    <!--
+        SendBreak:
+
+        Send a break event to the character device.
+    -->
+    <method name="SendBreak"/>
+
+    <!--
+        Name:
+
+        The FQDN name to identify the kind of stream. See :ref:`reserved
+        names<dbus-chardev-fqdn>`.
+    -->
+    <property name="Name" type="s" access="read"/>
+
+    <!--
+        FEOpened:
+
+        Whether the front-end side is opened.
+    -->
+    <property name="FEOpened" type="b" access="read"/>
+
+    <!--
+        Echo:
+
+        Whether the input should be echo'ed (for serial streams).
+    -->
+    <property name="Echo" type="b" access="read"/>
+
+    <!--
+        Owner:
+
+        The D-Bus unique name of the registered handler.
+    -->
+    <property name="Owner" type="s" access="read"/>
+  </interface>
 </node>
diff --git a/ui/meson.build b/ui/meson.build
index 8982ab63c4df..64286ba1503a 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -82,6 +82,7 @@ if dbus_display
                                           '--generate-c-code', '@BASENAME@'])
   dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
               if_true: [files(
+                'dbus-chardev.c',
                 'dbus-clipboard.c',
                 'dbus-console.c',
                 'dbus-error.c',
-- 
2.34.1.8.g35151cf07204


