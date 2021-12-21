Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1065347BB3E
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Dec 2021 08:42:21 +0100 (CET)
Received: from localhost ([::1]:51140 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mzZmu-0006io-4t
	for lists+qemu-devel@lfdr.de; Tue, 21 Dec 2021 02:42:20 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFg-0002oO-JP
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:08:04 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:43278)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1mzZFc-0002Wd-SR
 for qemu-devel@nongnu.org; Tue, 21 Dec 2021 02:07:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1640070469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5hiUfx+gBCUbUp8y/68Tfn2aLA/jeDrE7SScd4mmGms=;
 b=ZtTR68bRcGlB5PJQmp7ntVsPHA0F+05/VHv0wmC9TkH3ABCt2eYYOkVCQ482NL5WObIKe0
 XsAirbo3h+rlZs7S3/IZVx88f4wvO6FZ/24uBzo/KiUTaN7+5YDiypuFf8rkLq/xFV9FwI
 sSn4e/Zo3WRptG4qu9JlaB2+eaejxjE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-135-UyBT3bfuOX-P4wl-Xm3bWg-1; Tue, 21 Dec 2021 02:07:42 -0500
X-MC-Unique: UyBT3bfuOX-P4wl-Xm3bWg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A00681006AA6;
 Tue, 21 Dec 2021 07:07:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8143E87945;
 Tue, 21 Dec 2021 07:07:32 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PULL v2 30/36] ui/dbus: add clipboard interface
Date: Tue, 21 Dec 2021 10:58:49 +0400
Message-Id: <20211221065855.142578-31-marcandre.lureau@redhat.com>
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
Received-SPF: pass client-ip=170.10.129.124;
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

Expose the clipboard API over D-Bus. See the interface documentation for
further details.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Acked-by: Gerd Hoffmann <kraxel@redhat.com>
---
 ui/dbus.h            |  14 ++
 ui/dbus-clipboard.c  | 457 +++++++++++++++++++++++++++++++++++++++++++
 ui/dbus.c            |   7 +
 ui/dbus-display1.xml |  97 +++++++++
 ui/meson.build       |   1 +
 ui/trace-events      |   3 +
 6 files changed, 579 insertions(+)
 create mode 100644 ui/dbus-clipboard.c

diff --git a/ui/dbus.h b/ui/dbus.h
index ca1f0f4ab94f..3e89eafcab6e 100644
--- a/ui/dbus.h
+++ b/ui/dbus.h
@@ -27,9 +27,16 @@
 #include "qemu/dbus.h"
 #include "qom/object.h"
 #include "ui/console.h"
+#include "ui/clipboard.h"
 
 #include "dbus-display1.h"
 
+typedef struct DBusClipboardRequest {
+    GDBusMethodInvocation *invocation;
+    QemuClipboardType type;
+    guint timeout_id;
+} DBusClipboardRequest;
+
 struct DBusDisplay {
     Object parent;
 
@@ -44,6 +51,11 @@ struct DBusDisplay {
     QemuDBusDisplay1VM *iface;
     GPtrArray *consoles;
     GCancellable *add_client_cancellable;
+
+    QemuClipboardPeer clipboard_peer;
+    QemuDBusDisplay1Clipboard *clipboard;
+    QemuDBusDisplay1Clipboard *clipboard_proxy;
+    DBusClipboardRequest clipboard_request[QEMU_CLIPBOARD_SELECTION__COUNT];
 };
 
 #define TYPE_DBUS_DISPLAY "dbus-display"
@@ -83,4 +95,6 @@ dbus_display_listener_get_bus_name(DBusDisplayListener *ddl);
 extern const DisplayChangeListenerOps dbus_gl_dcl_ops;
 extern const DisplayChangeListenerOps dbus_dcl_ops;
 
+void dbus_clipboard_init(DBusDisplay *dpy);
+
 #endif /* UI_DBUS_H_ */
diff --git a/ui/dbus-clipboard.c b/ui/dbus-clipboard.c
new file mode 100644
index 000000000000..5843d26cd2cb
--- /dev/null
+++ b/ui/dbus-clipboard.c
@@ -0,0 +1,457 @@
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
+#include "qemu/main-loop.h"
+#include "qom/object_interfaces.h"
+#include "sysemu/sysemu.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+#include "dbus.h"
+
+#define MIME_TEXT_PLAIN_UTF8 "text/plain;charset=utf-8"
+
+static void
+dbus_clipboard_complete_request(
+    DBusDisplay *dpy,
+    GDBusMethodInvocation *invocation,
+    QemuClipboardInfo *info,
+    QemuClipboardType type)
+{
+    GVariant *v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        info->types[type].data,
+        info->types[type].size,
+        TRUE,
+        (GDestroyNotify)qemu_clipboard_info_unref,
+        qemu_clipboard_info_ref(info));
+
+    qemu_dbus_display1_clipboard_complete_request(
+        dpy->clipboard, invocation,
+        MIME_TEXT_PLAIN_UTF8, v_data);
+}
+
+static void
+dbus_clipboard_update_info(DBusDisplay *dpy, QemuClipboardInfo *info)
+{
+    bool self_update = info->owner == &dpy->clipboard_peer;
+    const char *mime[QEMU_CLIPBOARD_TYPE__COUNT + 1] = { 0, };
+    DBusClipboardRequest *req;
+    int i = 0;
+
+    if (info->owner == NULL) {
+        if (dpy->clipboard_proxy) {
+            qemu_dbus_display1_clipboard_call_release(
+                dpy->clipboard_proxy,
+                info->selection,
+                G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        }
+        return;
+    }
+
+    if (self_update || !info->has_serial) {
+        return;
+    }
+
+    req = &dpy->clipboard_request[info->selection];
+    if (req->invocation && info->types[req->type].data) {
+        dbus_clipboard_complete_request(dpy, req->invocation, info, req->type);
+        g_clear_object(&req->invocation);
+        g_source_remove(req->timeout_id);
+        req->timeout_id = 0;
+        return;
+    }
+
+    if (info->types[QEMU_CLIPBOARD_TYPE_TEXT].available) {
+        mime[i++] = MIME_TEXT_PLAIN_UTF8;
+    }
+
+    if (i > 0) {
+        if (dpy->clipboard_proxy) {
+            qemu_dbus_display1_clipboard_call_grab(
+                dpy->clipboard_proxy,
+                info->selection,
+                info->serial,
+                mime,
+                G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+        }
+    }
+}
+
+static void
+dbus_clipboard_reset_serial(DBusDisplay *dpy)
+{
+    if (dpy->clipboard_proxy) {
+        qemu_dbus_display1_clipboard_call_register(
+            dpy->clipboard_proxy,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1, NULL, NULL, NULL);
+    }
+}
+
+static void
+dbus_clipboard_notify(Notifier *notifier, void *data)
+{
+    DBusDisplay *dpy =
+        container_of(notifier, DBusDisplay, clipboard_peer.notifier);
+    QemuClipboardNotify *notify = data;
+
+    switch (notify->type) {
+    case QEMU_CLIPBOARD_UPDATE_INFO:
+        dbus_clipboard_update_info(dpy, notify->info);
+        return;
+    case QEMU_CLIPBOARD_RESET_SERIAL:
+        dbus_clipboard_reset_serial(dpy);
+        return;
+    }
+}
+
+static void
+dbus_clipboard_qemu_request(QemuClipboardInfo *info,
+                            QemuClipboardType type)
+{
+    DBusDisplay *dpy = container_of(info->owner, DBusDisplay, clipboard_peer);
+    g_autofree char *mime = NULL;
+    g_autoptr(GVariant) v_data = NULL;
+    g_autoptr(GError) err = NULL;
+    const char *data = NULL;
+    const char *mimes[] = { MIME_TEXT_PLAIN_UTF8, NULL };
+    size_t n;
+
+    if (type != QEMU_CLIPBOARD_TYPE_TEXT) {
+        /* unsupported atm */
+        return;
+    }
+
+    if (dpy->clipboard_proxy) {
+        if (!qemu_dbus_display1_clipboard_call_request_sync(
+                dpy->clipboard_proxy,
+                info->selection,
+                mimes,
+                G_DBUS_CALL_FLAGS_NONE, -1, &mime, &v_data, NULL, &err)) {
+            error_report("Failed to request clipboard: %s", err->message);
+            return;
+        }
+
+        if (g_strcmp0(mime, MIME_TEXT_PLAIN_UTF8)) {
+            error_report("Unsupported returned MIME: %s", mime);
+            return;
+        }
+
+        data = g_variant_get_fixed_array(v_data, &n, 1);
+        qemu_clipboard_set_data(&dpy->clipboard_peer, info, type,
+                                n, data, true);
+    }
+}
+
+static void
+dbus_clipboard_request_cancelled(DBusClipboardRequest *req)
+{
+    if (!req->invocation) {
+        return;
+    }
+
+    g_dbus_method_invocation_return_error(
+        req->invocation,
+        DBUS_DISPLAY_ERROR,
+        DBUS_DISPLAY_ERROR_FAILED,
+        "Cancelled clipboard request");
+
+    g_clear_object(&req->invocation);
+    g_source_remove(req->timeout_id);
+    req->timeout_id = 0;
+}
+
+static void
+dbus_clipboard_unregister_proxy(DBusDisplay *dpy)
+{
+    const char *name = NULL;
+    int i;
+
+    for (i = 0; i < G_N_ELEMENTS(dpy->clipboard_request); ++i) {
+        dbus_clipboard_request_cancelled(&dpy->clipboard_request[i]);
+    }
+
+    if (!dpy->clipboard_proxy) {
+        return;
+    }
+
+    name = g_dbus_proxy_get_name(G_DBUS_PROXY(dpy->clipboard_proxy));
+    trace_dbus_clipboard_unregister(name);
+    g_clear_object(&dpy->clipboard_proxy);
+}
+
+static void
+dbus_on_clipboard_proxy_name_owner_changed(
+    DBusDisplay *dpy,
+    GObject *object,
+    GParamSpec *pspec)
+{
+    dbus_clipboard_unregister_proxy(dpy);
+}
+
+static gboolean
+dbus_clipboard_register(
+    DBusDisplay *dpy,
+    GDBusMethodInvocation *invocation)
+{
+    g_autoptr(GError) err = NULL;
+    const char *name = NULL;
+
+    if (dpy->clipboard_proxy) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Clipboard peer already registered!");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    dpy->clipboard_proxy =
+        qemu_dbus_display1_clipboard_proxy_new_sync(
+            g_dbus_method_invocation_get_connection(invocation),
+            G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+            g_dbus_method_invocation_get_sender(invocation),
+            "/org/qemu/Display1/Clipboard",
+            NULL,
+            &err);
+    if (!dpy->clipboard_proxy) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Failed to setup proxy: %s", err->message);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    name = g_dbus_proxy_get_name(G_DBUS_PROXY(dpy->clipboard_proxy));
+    trace_dbus_clipboard_register(name);
+
+    g_object_connect(dpy->clipboard_proxy,
+                     "swapped-signal::notify::g-name-owner",
+                     dbus_on_clipboard_proxy_name_owner_changed, dpy,
+                     NULL);
+    qemu_clipboard_reset_serial();
+
+    qemu_dbus_display1_clipboard_complete_register(dpy->clipboard, invocation);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_clipboard_check_caller(DBusDisplay *dpy, GDBusMethodInvocation *invocation)
+{
+    if (!dpy->clipboard_proxy ||
+        g_strcmp0(g_dbus_proxy_get_name(G_DBUS_PROXY(dpy->clipboard_proxy)),
+                  g_dbus_method_invocation_get_sender(invocation))) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Unregistered caller");
+        return FALSE;
+    }
+
+    return TRUE;
+}
+
+static gboolean
+dbus_clipboard_unregister(
+    DBusDisplay *dpy,
+    GDBusMethodInvocation *invocation)
+{
+    if (!dbus_clipboard_check_caller(dpy, invocation)) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    dbus_clipboard_unregister_proxy(dpy);
+
+    qemu_dbus_display1_clipboard_complete_unregister(
+        dpy->clipboard, invocation);
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_clipboard_grab(
+    DBusDisplay *dpy,
+    GDBusMethodInvocation *invocation,
+    gint arg_selection,
+    guint arg_serial,
+    const gchar *const *arg_mimes)
+{
+    QemuClipboardSelection s = arg_selection;
+    g_autoptr(QemuClipboardInfo) info = NULL;
+
+    if (!dbus_clipboard_check_caller(dpy, invocation)) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (s >= QEMU_CLIPBOARD_SELECTION__COUNT) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Invalid clipboard selection: %d", arg_selection);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    info = qemu_clipboard_info_new(&dpy->clipboard_peer, s);
+    if (g_strv_contains(arg_mimes, MIME_TEXT_PLAIN_UTF8)) {
+        info->types[QEMU_CLIPBOARD_TYPE_TEXT].available = true;
+    }
+    info->serial = arg_serial;
+    info->has_serial = true;
+    if (qemu_clipboard_check_serial(info, true)) {
+        qemu_clipboard_update(info);
+    } else {
+        trace_dbus_clipboard_grab_failed();
+    }
+
+    qemu_dbus_display1_clipboard_complete_grab(dpy->clipboard, invocation);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_clipboard_release(
+    DBusDisplay *dpy,
+    GDBusMethodInvocation *invocation,
+    gint arg_selection)
+{
+    if (!dbus_clipboard_check_caller(dpy, invocation)) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    qemu_clipboard_peer_release(&dpy->clipboard_peer, arg_selection);
+
+    qemu_dbus_display1_clipboard_complete_release(dpy->clipboard, invocation);
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+static gboolean
+dbus_clipboard_request_timeout(gpointer user_data)
+{
+    dbus_clipboard_request_cancelled(user_data);
+    return G_SOURCE_REMOVE;
+}
+
+static gboolean
+dbus_clipboard_request(
+    DBusDisplay *dpy,
+    GDBusMethodInvocation *invocation,
+    gint arg_selection,
+    const gchar *const *arg_mimes)
+{
+    QemuClipboardSelection s = arg_selection;
+    QemuClipboardType type = QEMU_CLIPBOARD_TYPE_TEXT;
+    QemuClipboardInfo *info = NULL;
+
+    if (!dbus_clipboard_check_caller(dpy, invocation)) {
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (s >= QEMU_CLIPBOARD_SELECTION__COUNT) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Invalid clipboard selection: %d", arg_selection);
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (dpy->clipboard_request[s].invocation) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Pending request");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    info = qemu_clipboard_info(s);
+    if (!info || !info->owner || info->owner == &dpy->clipboard_peer) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Empty clipboard");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (!g_strv_contains(arg_mimes, MIME_TEXT_PLAIN_UTF8) ||
+        !info->types[type].available) {
+        g_dbus_method_invocation_return_error(
+            invocation,
+            DBUS_DISPLAY_ERROR,
+            DBUS_DISPLAY_ERROR_FAILED,
+            "Unhandled MIME types requested");
+        return DBUS_METHOD_INVOCATION_HANDLED;
+    }
+
+    if (info->types[type].data) {
+        dbus_clipboard_complete_request(dpy, invocation, info, type);
+    } else {
+        qemu_clipboard_request(info, type);
+
+        dpy->clipboard_request[s].invocation = g_object_ref(invocation);
+        dpy->clipboard_request[s].type = type;
+        dpy->clipboard_request[s].timeout_id =
+            g_timeout_add_seconds(5, dbus_clipboard_request_timeout,
+                                  &dpy->clipboard_request[s]);
+    }
+
+    return DBUS_METHOD_INVOCATION_HANDLED;
+}
+
+void
+dbus_clipboard_init(DBusDisplay *dpy)
+{
+    g_autoptr(GDBusObjectSkeleton) clipboard = NULL;
+
+    assert(!dpy->clipboard);
+
+    clipboard = g_dbus_object_skeleton_new(DBUS_DISPLAY1_ROOT "/Clipboard");
+    dpy->clipboard = qemu_dbus_display1_clipboard_skeleton_new();
+    g_object_connect(dpy->clipboard,
+                     "swapped-signal::handle-register",
+                     dbus_clipboard_register, dpy,
+                     "swapped-signal::handle-unregister",
+                     dbus_clipboard_unregister, dpy,
+                     "swapped-signal::handle-grab",
+                     dbus_clipboard_grab, dpy,
+                     "swapped-signal::handle-release",
+                     dbus_clipboard_release, dpy,
+                     "swapped-signal::handle-request",
+                     dbus_clipboard_request, dpy,
+                     NULL);
+
+    g_dbus_object_skeleton_add_interface(
+        G_DBUS_OBJECT_SKELETON(clipboard),
+        G_DBUS_INTERFACE_SKELETON(dpy->clipboard));
+    g_dbus_object_manager_server_export(dpy->server, clipboard);
+    dpy->clipboard_peer.name = "dbus";
+    dpy->clipboard_peer.notifier.notify = dbus_clipboard_notify;
+    dpy->clipboard_peer.request = dbus_clipboard_qemu_request;
+    qemu_clipboard_peer_register(&dpy->clipboard_peer);
+}
diff --git a/ui/dbus.c b/ui/dbus.c
index d24f704d4662..4f0bc293aaa0 100644
--- a/ui/dbus.c
+++ b/ui/dbus.c
@@ -24,6 +24,7 @@
 #include "qemu/osdep.h"
 #include "qemu/cutils.h"
 #include "qemu/dbus.h"
+#include "qemu/main-loop.h"
 #include "qemu/option.h"
 #include "qom/object_interfaces.h"
 #include "sysemu/sysemu.h"
@@ -70,6 +71,8 @@ dbus_display_init(Object *o)
     g_dbus_object_skeleton_add_interface(
         vm, G_DBUS_INTERFACE_SKELETON(dd->iface));
     g_dbus_object_manager_server_export(dd->server, vm);
+
+    dbus_clipboard_init(dd);
 }
 
 static void
@@ -77,6 +80,9 @@ dbus_display_finalize(Object *o)
 {
     DBusDisplay *dd = DBUS_DISPLAY(o);
 
+    qemu_clipboard_peer_unregister(&dd->clipboard_peer);
+    g_clear_object(&dd->clipboard);
+
     g_clear_object(&dd->server);
     g_clear_pointer(&dd->consoles, g_ptr_array_unref);
     if (dd->add_client_cancellable) {
@@ -294,6 +300,7 @@ set_audiodev(Object *o, const char *str, Error **errp)
     dd->audiodev = g_strdup(str);
 }
 
+
 static int
 get_gl_mode(Object *o, Error **errp)
 {
diff --git a/ui/dbus-display1.xml b/ui/dbus-display1.xml
index aff645220c88..767562ad1ea3 100644
--- a/ui/dbus-display1.xml
+++ b/ui/dbus-display1.xml
@@ -376,6 +376,103 @@
     </method>
   </interface>
 
+  <!--
+      org.qemu.Display1.Clipboard:
+
+      This interface must be implemented by both the client and the server on
+      ``/org/qemu/Display1/Clipboard`` to support clipboard sharing between
+      the client and the guest.
+
+      Once :dbus:meth:`Register`'ed, method calls may be sent and received in both
+      directions. Unregistered callers will get error replies.
+
+      .. _dbus-clipboard-selection:
+
+      **Selection values**::
+
+        Clipboard   = 0
+        Primary     = 1
+        Secondary   = 2
+
+      .. _dbus-clipboard-serial:
+
+      **Serial counter**
+
+      To solve potential clipboard races, clipboard grabs have an associated
+      serial counter. It is set to 0 on registration, and incremented by 1 for
+      each grab. The peer with the highest serial is the clipboard grab owner.
+
+      When a grab with a lower serial is received, it should be discarded.
+
+      When a grab is attempted with the same serial number as the current grab,
+      the one coming from the client should have higher priority, and the client
+      should gain clipboard grab ownership.
+  -->
+  <interface name="org.qemu.Display1.Clipboard">
+    <!--
+        Register:
+
+        Register a clipboard session and reinitialize the serial counter.
+
+        The client must register itself, and is granted an exclusive
+        access for handling the clipboard.
+
+        The server can reinitialize the session as well (to reset the counter).
+    -->
+    <method name="Register"/>
+
+    <!--
+        Unregister:
+
+        Unregister the clipboard session.
+    -->
+    <method name="Unregister"/>
+    <!--
+        Grab:
+        @selection: a :ref:`selection value<dbus-clipboard-selection>`.
+        @serial: the current grab :ref:`serial<dbus-clipboard-serial>`.
+        @mimes: the list of available content MIME types.
+
+        Grab the clipboard, claiming current clipboard content.
+    -->
+    <method name="Grab">
+      <arg type="u" name="selection"/>
+      <arg type="u" name="serial"/>
+      <arg type="as" name="mimes"/>
+    </method>
+
+    <!--
+        Release:
+        @selection: a :ref:`selection value<dbus-clipboard-selection>`.
+
+        Release the clipboard (does nothing if not the current owner).
+    -->
+    <method name="Release">
+      <arg type="u" name="selection"/>
+    </method>
+
+    <!--
+        Request:
+        @selection: a :ref:`selection value<dbus-clipboard-selection>`
+        @mimes: requested MIME types (by order of preference).
+        @reply_mime: the returned data MIME type.
+        @data: the clipboard data.
+
+        Request the clipboard content.
+
+        Return an error if the clipboard is empty, or the requested MIME types
+        are unavailable.
+    -->
+    <method name="Request">
+      <arg type="u" name="selection"/>
+      <arg type="as" name="mimes"/>
+      <arg type="s" name="reply_mime" direction="out"/>
+      <arg type="ay" name="data" direction="out">
+        <annotation name="org.gtk.GDBus.C.ForceGVariant" value="true"/>
+      </arg>
+    </method>
+  </interface>
+
   <!--
       org.qemu.Display1.Audio:
 
diff --git a/ui/meson.build b/ui/meson.build
index 80f21704ada6..8982ab63c4df 100644
--- a/ui/meson.build
+++ b/ui/meson.build
@@ -82,6 +82,7 @@ if dbus_display
                                           '--generate-c-code', '@BASENAME@'])
   dbus_ss.add(when: [gio, pixman, opengl, 'CONFIG_GIO'],
               if_true: [files(
+                'dbus-clipboard.c',
                 'dbus-console.c',
                 'dbus-error.c',
                 'dbus-listener.c',
diff --git a/ui/trace-events b/ui/trace-events
index b1ae30159a53..f78b5e66061f 100644
--- a/ui/trace-events
+++ b/ui/trace-events
@@ -147,3 +147,6 @@ dbus_mouse_release(unsigned int button) "button %u"
 dbus_mouse_set_pos(unsigned int x, unsigned int y) "x=%u, y=%u"
 dbus_mouse_rel_motion(int dx, int dy) "dx=%d, dy=%d"
 dbus_update(int x, int y, int w, int h) "x=%d, y=%d, w=%d, h=%d"
+dbus_clipboard_grab_failed(void) ""
+dbus_clipboard_register(const char *bus_name) "peer %s"
+dbus_clipboard_unregister(const char *bus_name) "peer %s"
-- 
2.34.1.8.g35151cf07204


