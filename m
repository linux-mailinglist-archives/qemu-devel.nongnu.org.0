Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A74203389FF
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 11:24:35 +0100 (CET)
Received: from localhost ([::1]:37096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKeyA-0005bK-Ls
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 05:24:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:35800)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKegd-00059h-CA
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:06:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:36306)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lKegY-00051m-MU
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 05:06:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615543582;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WwZqhmUTQYMcloAHb8BHNauyoNuJJH4ziRo3JEaroZQ=;
 b=hM5VJtD7cMoAh8uw7CCPQg4tPVwQjv5EPROiANCAJr2UrQgdh4l+w6r8J8Xy0SOWlrPAZA
 0oRzGyy7o5VGGW0vRy0bsN58AZ/m8meX4WfVJUEPWtYj7RHJ4/3AMdQX+WyFZuwTpYnkf4
 5sv3ew3OHChuRwEYFfHgcfKthvCHwpk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-111-QmE3LEGlPN6trhfSKJQ9HQ-1; Fri, 12 Mar 2021 05:06:18 -0500
X-MC-Unique: QmE3LEGlPN6trhfSKJQ9HQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D3277100C619
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 10:06:17 +0000 (UTC)
Received: from localhost (unknown [10.36.110.50])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9599069FB4;
 Fri, 12 Mar 2021 10:06:15 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 27/27] vhost-user-gpu: implement GPU_QEMU_DBUS_LISTENER
Date: Fri, 12 Mar 2021 14:01:08 +0400
Message-Id: <20210312100108.2706195-28-marcandre.lureau@redhat.com>
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

Implement the QEMU DBus listener feature. This allows vhost-user-gpu to
notify directly the console/ui clients.

However, QEMU is still notified with the vhost-user-gpu protocol, for
compatibility reasons. A future mechanism should allow qemu to opt-out
for display updates.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 contrib/vhost-user-gpu/vugpu.h          |   3 +
 contrib/vhost-user-gpu/vhost-user-gpu.c | 272 +++++++++++++++++++++++-
 contrib/vhost-user-gpu/meson.build      |   6 +-
 3 files changed, 269 insertions(+), 12 deletions(-)

diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index 370fd10667..81ffddf347 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -119,12 +119,15 @@ typedef struct VuGpu {
     int drm_rnode_fd;
     GSource *renderer_source;
     guint wait_in;
+    guint wait_dbus;
 
     bool virgl;
     bool virgl_inited;
     uint32_t inflight;
 
     struct virtio_gpu_scanout scanout[VIRTIO_GPU_MAX_SCANOUTS];
+    GHashTable *listeners[VIRTIO_GPU_MAX_SCANOUTS];
+
     QTAILQ_HEAD(, virtio_gpu_simple_resource) reslist;
     QTAILQ_HEAD(, virtio_gpu_ctrl_command) fenceq;
 } VuGpu;
diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index 36d7f1d9e6..261a909fd4 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -18,6 +18,7 @@
 
 #include <pixman.h>
 #include <glib-unix.h>
+#include <gio/gunixfdlist.h>
 
 #include "vugpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
@@ -25,6 +26,8 @@
 #include "virgl.h"
 #include "vugbm.h"
 
+#include "ui/dbus-display1.h"
+
 enum {
     VHOST_USER_GPU_MAX_QUEUES = 2,
 };
@@ -359,7 +362,11 @@ vg_resource_create_2d(VuGpu *g,
 void
 vg_send_disable_scanout(VuGpu *g, int scanout_id)
 {
+    GHashTableIter iter;
+    DBusDisplayDisplay1Listener *listener;
+
     g_debug("send disable scanout %d", scanout_id);
+    g_return_if_fail(scanout_id < VIRTIO_GPU_MAX_SCANOUTS);
 
     if (g->sock_fd >= 0) {
         VhostUserGpuMsg msg = {
@@ -369,6 +376,12 @@ vg_send_disable_scanout(VuGpu *g, int scanout_id)
         };
         vg_send_msg(g, &msg, -1);
     }
+
+    g_hash_table_iter_init(&iter, g->listeners[scanout_id]);
+    while (g_hash_table_iter_next(&iter, (void **)&listener, NULL)) {
+        dbus_display_display1_listener_call_disable(
+            listener, G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
 }
 
 static void
@@ -597,6 +610,10 @@ vg_send_dmabuf_scanout(VuGpu *g,
                        uint32_t fd_flags,
                        int fd)
 {
+    GHashTableIter iter;
+    DBusDisplayDisplay1Listener *listener;
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GUnixFDList) fd_list = NULL;
     VhostUserGpuMsg msg = {
         .request = VHOST_USER_GPU_DMABUF_SCANOUT,
         .size = sizeof(VhostUserGpuDMABUFScanout),
@@ -615,7 +632,49 @@ vg_send_dmabuf_scanout(VuGpu *g,
     };
 
     g_debug("send dmabuf scanout: %d", ss->scanout_id);
+    g_return_if_fail(ss->scanout_id < VIRTIO_GPU_MAX_SCANOUTS);
+
     vg_send_msg(g, &msg, fd);
+
+    fd_list = g_unix_fd_list_new();
+    if (g_unix_fd_list_append(fd_list, fd, &err) != 0) {
+        g_warning("Failed to setup dmabuf fdlist: %s", err->message);
+        return;
+    }
+
+    g_hash_table_iter_init(&iter, g->listeners[ss->scanout_id]);
+    while (g_hash_table_iter_next(&iter, (void **)&listener, NULL)) {
+        dbus_display_display1_listener_call_scanout_dmabuf(
+            listener,
+            g_variant_new_handle(0),
+            fd_width,
+            fd_height,
+            fd_stride,
+            fd_drm_fourcc,
+            0, /* modifier */
+            fd_flags & VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP, /* == VIRGL_Y_0_TOP */
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            fd_list,
+            NULL, NULL, NULL);
+    }
+}
+
+static void
+dbus_update_gl_cb(GObject *source_object,
+                  GAsyncResult *res,
+                  gpointer user_data)
+{
+    g_autoptr(GError) err = NULL;
+    VuGpu *g = user_data;
+
+    if (!dbus_display_display1_listener_call_update_dmabuf_finish(
+            DBUS_DISPLAY_DISPLAY1_LISTENER(source_object), res, &err)) {
+        g_warning("Failed to call update dmabuf: %s", err->message);
+    }
+
+    g->wait_dbus--;
+    vg_handle_ctrl(&g->dev.parent, 0);
 }
 
 void
@@ -626,6 +685,8 @@ vg_send_dmabuf_update(VuGpu *g,
                       uint32_t width,
                       uint32_t height)
 {
+    GHashTableIter iter;
+    DBusDisplayDisplay1Listener *listener;
     VhostUserGpuMsg msg = {
         .request = VHOST_USER_GPU_DMABUF_UPDATE,
         .size = sizeof(VhostUserGpuUpdate),
@@ -635,7 +696,22 @@ vg_send_dmabuf_update(VuGpu *g,
         .payload.update.width = width,
         .payload.update.height = height
     };
+
+    g_return_if_fail(scanout_id < VIRTIO_GPU_MAX_SCANOUTS);
+
     vg_send_msg(g, &msg, -1);
+
+    g_hash_table_iter_init(&iter, g->listeners[scanout_id]);
+    while (g_hash_table_iter_next(&iter, (void **)&listener, NULL)) {
+        g->wait_dbus++;
+        dbus_display_display1_listener_call_update_dmabuf(
+            listener,
+            x, y, width, height,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1, NULL,
+            dbus_update_gl_cb,
+            g);
+    }
 }
 
 void
@@ -652,6 +728,8 @@ vg_send_scanout(VuGpu *g, uint32_t scanout_id)
         }
     };
     vg_send_msg(g, &msg, -1);
+
+    /* dbus-listener is postponed until data is available */
 }
 
 static void
@@ -745,9 +823,17 @@ vg_send_update(VuGpu *g,
                VgUpdateFill fill_cb,
                void *fill_data)
 {
-    void *p = g_malloc(VHOST_USER_GPU_HDR_SIZE +
+    GHashTableIter iter;
+    DBusDisplayDisplay1Listener *listener;
+    g_autoptr(GVariant) v_data = NULL;
+    bool scanout = false;
+    VhostUserGpuMsg *msg;
+    void *p = NULL;
+
+    g_return_if_fail(scanout_id < VIRTIO_GPU_MAX_SCANOUTS);
+
+    msg = p = g_malloc(VHOST_USER_GPU_HDR_SIZE +
                        sizeof(VhostUserGpuUpdate) + data_size);
-    VhostUserGpuMsg *msg = p;
     msg->request = VHOST_USER_GPU_UPDATE;
     msg->size = sizeof(VhostUserGpuUpdate) + data_size;
     msg->payload.update = (VhostUserGpuUpdate) {
@@ -759,7 +845,40 @@ vg_send_update(VuGpu *g,
     };
     fill_cb(g, msg, fill_data);
     vg_send_msg(g, msg, -1);
-    g_free(msg);
+
+    if (x == 0 && y == 0 &&
+        width == g->scanout[scanout_id].width &&
+        height == g->scanout[scanout_id].height) {
+        scanout = true;
+    }
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        p + offsetof(VhostUserGpuMsg, payload.update.data),
+        data_size,
+        TRUE,
+        g_free,
+        p);
+    g_variant_ref_sink(v_data);
+
+    g_hash_table_iter_init(&iter, g->listeners[scanout_id]);
+    while (g_hash_table_iter_next(&iter, (void **)&listener, NULL)) {
+        if (scanout) {
+            dbus_display_display1_listener_call_scanout(
+                listener,
+                width, height, width * 4, PIXMAN_x8r8g8b8,
+                v_data,
+                G_DBUS_CALL_FLAGS_NONE,
+                -1, NULL, NULL, NULL);
+        } else {
+            dbus_display_display1_listener_call_update(
+                listener,
+                x, y, width, height, width * 4, PIXMAN_x8r8g8b8,
+                v_data,
+                G_DBUS_CALL_FLAGS_NONE,
+                -1, NULL, NULL, NULL);
+        }
+    }
 }
 
 static void
@@ -912,7 +1031,7 @@ vg_handle_ctrl(VuDev *dev, int qidx)
     size_t len;
 
     for (;;) {
-        if (vg->wait_in != 0) {
+        if (vg->wait_in != 0 || vg->wait_dbus > 0) {
             return;
         }
 
@@ -970,7 +1089,15 @@ vg_send_cursor_update(VuGpu *g,
                       const struct virtio_gpu_update_cursor *cursor,
                       const void *data)
 {
-    VhostUserGpuMsg msg = {
+    GHashTableIter iter;
+    DBusDisplayDisplay1Listener *listener;
+    VhostUserGpuMsg *msg;
+    g_autoptr(GVariant) v_data = NULL;
+
+    g_return_if_fail(cursor->pos.scanout_id < VIRTIO_GPU_MAX_SCANOUTS);
+
+    msg = g_new0(VhostUserGpuMsg, 1);
+    *msg = (VhostUserGpuMsg) {
         .request = VHOST_USER_GPU_CURSOR_UPDATE,
         .size = sizeof(VhostUserGpuCursorUpdate),
         .payload.cursor_update = {
@@ -983,15 +1110,43 @@ vg_send_cursor_update(VuGpu *g,
             .hot_y = cursor->hot_y,
         }
     };
+
     /* we can afford that cursor copy */
-    memcpy(msg.payload.cursor_update.data, data,
-           sizeof(msg.payload.cursor_update.data));
-    vg_send_msg(g, &msg, -1);
+    memcpy(msg->payload.cursor_update.data, data,
+           sizeof(msg->payload.cursor_update.data));
+    vg_send_msg(g, msg, -1);
+
+    v_data = g_variant_new_from_data(
+        G_VARIANT_TYPE("ay"),
+        msg->payload.cursor_update.data,
+        sizeof(msg->payload.cursor_update.data),
+        TRUE,
+        g_free,
+        msg);
+    g_variant_ref_sink(v_data);
+
+    g_hash_table_iter_init(&iter, g->listeners[cursor->pos.scanout_id]);
+    while (g_hash_table_iter_next(&iter, (void **)&listener, NULL)) {
+        dbus_display_display1_listener_call_cursor_define(
+            listener,
+            64,
+            64,
+            cursor->hot_x,
+            cursor->hot_y,
+            v_data,
+            G_DBUS_CALL_FLAGS_NONE,
+            -1,
+            NULL,
+            NULL,
+            NULL);
+    }
 }
 
 void
 vg_send_cursor_pos(VuGpu *g, const struct virtio_gpu_update_cursor *cursor)
 {
+    GHashTableIter iter;
+    DBusDisplayDisplay1Listener *listener;
     VhostUserGpuMsg msg = {
         .request = cursor->resource_id ?
         VHOST_USER_GPU_CURSOR_POS : VHOST_USER_GPU_CURSOR_POS_HIDE,
@@ -1002,7 +1157,20 @@ vg_send_cursor_pos(VuGpu *g, const struct virtio_gpu_update_cursor *cursor)
             .y = cursor->pos.y,
         }
     };
+
+    g_return_if_fail(cursor->pos.scanout_id < VIRTIO_GPU_MAX_SCANOUTS);
+
     vg_send_msg(g, &msg, -1);
+
+    g_hash_table_iter_init(&iter, g->listeners[cursor->pos.scanout_id]);
+    while (g_hash_table_iter_next(&iter, (void **)&listener, NULL)) {
+        dbus_display_display1_listener_call_mouse_set(
+            listener,
+            cursor->pos.x,
+            cursor->pos.y,
+            cursor->resource_id != 0,
+            G_DBUS_CALL_FLAGS_NONE, -1, NULL, NULL, NULL);
+    }
 }
 
 static void
@@ -1127,6 +1295,70 @@ set_gpu_protocol_features(VuGpu *g)
                                protocol_features_cb, g);
 }
 
+static void
+listener_vanished_cb(GDBusConnection *connection,
+                     gboolean remote_peer_vanished,
+                     GError *error,
+                     VuGpu *g)
+{
+    DBusDisplayDisplay1Listener *listener;
+    uint8_t idx;
+
+    listener = g_object_get_data(G_OBJECT(connection), "listener");
+    g_debug("Removing dbus-listener %p", listener);
+
+    idx = GPOINTER_TO_INT(g_object_get_data(G_OBJECT(listener), "idx"));
+    g_hash_table_remove(g->listeners[idx], listener);
+}
+
+static void
+vg_register_dbus_listener(VuGpu *g, uint8_t idx, int fd)
+{
+    GDBusConnection *listener_conn;
+    g_autoptr(GError) err = NULL;
+    g_autoptr(GSocket) socket = NULL;
+    g_autoptr(GSocketConnection) socket_conn = NULL;
+    g_autofree char *guid = g_dbus_generate_guid();
+    DBusDisplayDisplay1Listener *listener;
+
+    socket = g_socket_new_from_fd(fd, &err);
+    if (err) {
+        g_warning("Couldn't make a socket: %s", err->message);
+        close(fd);
+        return;
+    }
+    socket_conn = g_socket_connection_factory_create_connection(socket);
+    listener_conn = g_dbus_connection_new_sync(G_IO_STREAM(socket_conn),
+                                               guid,
+                                               G_DBUS_CONNECTION_FLAGS_AUTHENTICATION_SERVER,
+                                               NULL, NULL, &err);
+    if (err) {
+        g_warning("Failed to setup peer connection: %s", err->message);
+        return;
+    }
+
+    listener = dbus_display_display1_listener_proxy_new_sync(
+        listener_conn,
+        G_DBUS_PROXY_FLAGS_DO_NOT_AUTO_START,
+        NULL,
+        "/org/qemu/Display1/Listener",
+        NULL,
+        &err);
+    if (!listener) {
+        g_warning("failed to setup proxy: %s", err->message);
+        return;
+    }
+
+    g_debug("Adding dbus-listener %p", listener);
+
+    g_object_set_data(G_OBJECT(listener), "idx", GINT_TO_POINTER(idx));
+    g_object_set_data(G_OBJECT(listener_conn), "listener", listener);
+    g_hash_table_add(g->listeners[idx], listener);
+    g_object_connect(listener_conn,
+                     "signal::closed", listener_vanished_cb, g,
+                     NULL);
+}
+
 static int
 vg_process_msg(VuDev *dev, VhostUserMsg *msg, int *do_reply)
 {
@@ -1140,6 +1372,12 @@ vg_process_msg(VuDev *dev, VhostUserMsg *msg, int *do_reply)
         set_gpu_protocol_features(g);
         return 1;
     }
+    case VHOST_USER_GPU_QEMU_DBUS_LISTENER: {
+        g_return_val_if_fail(msg->fd_num == 1, 1);
+        g_return_val_if_fail(msg->payload.u64 < VIRTIO_GPU_MAX_SCANOUTS, 1);
+        vg_register_dbus_listener(g, msg->payload.u64, msg->fds[0]);
+        return 1;
+    }
     default:
         return 0;
     }
@@ -1175,6 +1413,12 @@ vg_set_features(VuDev *dev, uint64_t features)
     g->virgl = virgl;
 }
 
+static uint64_t
+vg_get_protocol_features(VuDev *dev)
+{
+    return 1 << VHOST_USER_PROTOCOL_F_GPU_QEMU_DBUS_LISTENER;
+}
+
 static int
 vg_get_config(VuDev *dev, uint8_t *config, uint32_t len)
 {
@@ -1211,6 +1455,7 @@ vg_set_config(VuDev *dev, const uint8_t *data,
 static const VuDevIface vuiface = {
     .set_features = vg_set_features,
     .get_features = vg_get_features,
+    .get_protocol_features = vg_get_protocol_features,
     .queue_set_started = vg_queue_set_started,
     .process_msg = vg_process_msg,
     .get_config = vg_get_config,
@@ -1221,9 +1466,14 @@ static void
 vg_destroy(VuGpu *g)
 {
     struct virtio_gpu_simple_resource *res, *tmp;
+    int i;
 
     vug_deinit(&g->dev);
 
+    for (i = 0; i < VIRTIO_GPU_MAX_SCANOUTS; i++) {
+        g_clear_pointer(&g->listeners[i], g_hash_table_unref);
+    }
+
     vg_sock_fd_close(g);
 
     QTAILQ_FOREACH_SAFE(res, &g->reslist, next, tmp) {
@@ -1253,7 +1503,7 @@ main(int argc, char *argv[])
     GOptionContext *context;
     GError *error = NULL;
     GMainLoop *loop = NULL;
-    int fd;
+    int i, fd;
     VuGpu g = { .sock_fd = -1, .drm_rnode_fd = -1 };
 
     QTAILQ_INIT(&g.reslist);
@@ -1307,6 +1557,10 @@ main(int argc, char *argv[])
         exit(EXIT_FAILURE);
     }
 
+    for (i = 0; i < VIRTIO_GPU_MAX_SCANOUTS; i++) {
+        g.listeners[i] = g_hash_table_new_full(NULL, NULL, g_object_unref, NULL);
+    }
+
     if (!vug_init(&g.dev, VHOST_USER_GPU_MAX_QUEUES, fd, vg_panic, &vuiface)) {
         g_printerr("Failed to initialize libvhost-user-glib.\n");
         exit(EXIT_FAILURE);
diff --git a/contrib/vhost-user-gpu/meson.build b/contrib/vhost-user-gpu/meson.build
index 0ce1515a10..773823e5bf 100644
--- a/contrib/vhost-user-gpu/meson.build
+++ b/contrib/vhost-user-gpu/meson.build
@@ -1,8 +1,8 @@
 if 'CONFIG_TOOLS' in config_host and 'CONFIG_VIRGL' in config_host \
     and 'CONFIG_GBM' in config_host and 'CONFIG_LINUX' in config_host \
-    and pixman.found()
-  executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c'),
-             dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl],
+    and pixman.found() and 'CONFIG_UI_DBUS' in config_host
+  executable('vhost-user-gpu', files('vhost-user-gpu.c', 'virgl.c', 'vugbm.c') + dbus_display1,
+             dependencies: [qemuutil, pixman, gbm, virgl, vhost_user, opengl, gio],
              install: true,
              install_dir: get_option('libexecdir'))
 
-- 
2.29.0


