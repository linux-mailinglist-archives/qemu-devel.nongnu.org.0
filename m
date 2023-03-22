Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F5D6C4D82
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Mar 2023 15:23:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pezM0-0008CD-Uk; Wed, 22 Mar 2023 10:22:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLy-00089h-VM
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aesteve@redhat.com>)
 id 1pezLw-0007Pg-WE
 for qemu-devel@nongnu.org; Wed, 22 Mar 2023 10:22:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1679494932;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2qfQPFMXuKd9XuujS5PGKZgJ3H66W4t4FFJ46QJTk7Y=;
 b=ait4S1FhVjczL+hnRo78JW7NHJQQd6p5Ueibybc0KSfZ4kKmjplF75WnlK+H46/D5OWEKN
 jSxKAi7cN6vrHnqJmo/RpdxRmnEnCt4xZqPmC6iYnje2AEMUxtUlO8Utw7SKVzPC3HmoMh
 bjhedPrLmhVSp1Lgzo5bxS7uihlzHQA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-cYJcQXB3OvOYhHN1IxdqkQ-1; Wed, 22 Mar 2023 10:22:09 -0400
X-MC-Unique: cYJcQXB3OvOYhHN1IxdqkQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 54AB4101A54F;
 Wed, 22 Mar 2023 14:22:09 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.226.254])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D4BDE40C6E67;
 Wed, 22 Mar 2023 14:22:06 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, fmartine@redhat.com,
 Gerd Hoffmann <kraxel@redhat.com>, eballetb@redhat.com,
 Albert Esteve <aesteve@redhat.com>, alex.bennee@linaro.org,
 Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 sgarzare@redhat.com,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 peter.griffin@linaro.org, Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH 11/12] vhost-user-video-udmabuf: add udmabuf helpers
Date: Wed, 22 Mar 2023 15:21:31 +0100
Message-Id: <20230322142132.22909-12-aesteve@redhat.com>
In-Reply-To: <20230322142132.22909-1-aesteve@redhat.com>
References: <20230322142132.22909-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=aesteve@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Add helper for handling user-created DMA buffers
through the udmabuf device. Buffers are stored in
a hash table and associated to an UUID, so that
they can be looked up later from the backend.

Signed-off-by: Albert Esteve <aesteve@redhat.com>
---
 tools/vhost-user-video/meson.build            |   2 +-
 tools/vhost-user-video/virtio_video_helpers.h |  32 +++-
 tools/vhost-user-video/virtio_video_udmabuf.c | 180 ++++++++++++++++++
 tools/vhost-user-video/vuvideo.h              |  10 +-
 4 files changed, 221 insertions(+), 3 deletions(-)
 create mode 100644 tools/vhost-user-video/virtio_video_udmabuf.c

diff --git a/tools/vhost-user-video/meson.build b/tools/vhost-user-video/meson.build
index bf3b958dc6..87c70091e6 100644
--- a/tools/vhost-user-video/meson.build
+++ b/tools/vhost-user-video/meson.build
@@ -1,5 +1,5 @@
 executable('vhost-user-video', files(
-  'vhost-user-video.c', 'v4l2_backend.c', 'virtio_video_helpers.c'),
+  'vhost-user-video.c', 'v4l2_backend.c', 'virtio_video_helpers.c', 'virtio_video_udmabuf.c'),
   dependencies: [qemuutil, glib, gio, vhost_user],
   install: true,
   install_dir: get_option('libexecdir'))
diff --git a/tools/vhost-user-video/virtio_video_helpers.h b/tools/vhost-user-video/virtio_video_helpers.h
index 8f35ccc4b5..171c74fc00 100644
--- a/tools/vhost-user-video/virtio_video_helpers.h
+++ b/tools/vhost-user-video/virtio_video_helpers.h
@@ -21,17 +21,37 @@
 #include <linux/videodev2.h>
 #include "libvhost-user-glib.h"
 #include "libvhost-user.h"
+#include "qemu/uuid.h"
+#include "qemu/queue.h"
 
 /*
  * Structure to track internal state of VIDEO Device
  */
 
+struct resource;
+struct VuVideoDMABuf;
+
+struct vuvbm_device {
+    bool opened;
+    int fd;
+
+    bool (*alloc_bm)(struct VuVideoDMABuf *buf);
+    void (*free_bm)(struct VuVideoDMABuf *buf);
+    int (*get_fd)(struct VuVideoDMABuf *buf);
+    bool (*map_bm)(struct VuVideoDMABuf *buf);
+    void (*unmap_bm)(struct VuVideoDMABuf *buf);
+    void (*device_destroy)(struct vuvbm_device *dev);
+
+    GHashTable *resource_uuids;
+};
+
 typedef struct VuVideo {
     VugDev dev;
     struct virtio_video_config virtio_config;
     GMainLoop *loop;
     struct v4l2_device *v4l2_dev;
     GList *streams;
+    struct vuvbm_device *bm_dev;
 } VuVideo;
 
 struct v4l2_device {
@@ -56,10 +76,18 @@ struct vu_video_ctrl_command {
 };
 
 
+typedef struct VuVideoDMABuf {
+    struct vuvbm_device *dev;
+    int memfd;
+    int dmafd;
+
+    void *start;
+    size_t length;
+} VuVideoDMABuf;
+
 /*
  * Structure to track internal state of a Stream
  */
-
 struct stream {
     struct virtio_video_stream_create vio_stream;
     uint32_t stream_id;
@@ -89,11 +117,13 @@ struct stream {
 
 struct resource {
     uint32_t stream_id;
+    QemuUUID uuid;
     struct virtio_video_resource_create vio_resource;
     struct virtio_video_resource_queue vio_res_q;
     struct iovec *iov;
     uint32_t iov_count;
     uint32_t v4l2_index;
+    struct VuVideoDMABuf *buf;
     enum v4l2_buf_type type;
     struct vu_video_ctrl_command *vio_q_cmd;
     bool queued;
diff --git a/tools/vhost-user-video/virtio_video_udmabuf.c b/tools/vhost-user-video/virtio_video_udmabuf.c
new file mode 100644
index 0000000000..4fda1b5a78
--- /dev/null
+++ b/tools/vhost-user-video/virtio_video_udmabuf.c
@@ -0,0 +1,180 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Virtio Video Device
+ *
+ * Copyright Red Hat, Inc. 2023
+ *
+ * Authors:
+ *     Albert Esteve <aesteve@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <sys/mman.h>
+#include "linux/udmabuf.h"
+
+#include "vuvideo.h"
+
+static size_t
+udmabuf_get_size(struct VuVideoDMABuf *buf)
+{
+    return ROUND_UP(buf->length, qemu_real_host_page_size());
+}
+
+static bool
+udmabuf_alloc_bm(struct VuVideoDMABuf *buf)
+{
+    int ret;
+
+    buf->memfd = memfd_create("udmabuf-video-bm", MFD_ALLOW_SEALING);
+    if (buf->memfd < 0) {
+        g_printerr("%s: memfd_create failed.", __func__);
+        return false;
+    }
+
+    ret = ftruncate(buf->memfd, udmabuf_get_size(buf));
+    if (ret < 0) {
+        g_printerr("%s: ftruncate failed.", __func__);
+        close(buf->memfd);
+        return false;
+    }
+
+    ret = fcntl(buf->memfd, F_ADD_SEALS, F_SEAL_SHRINK);
+    if (ret < 0) {
+        g_printerr("%s: fcntl failed.", __func__);
+        close(buf->memfd);
+        return false;
+    }
+
+    return true;
+}
+
+static void
+udmabuf_free_bm(struct VuVideoDMABuf *buf)
+{
+    close(buf->memfd);
+}
+
+static bool
+udmabuf_map_bm(struct VuVideoDMABuf *buf)
+{
+    g_debug("Map the buffer memory.");
+    buf->start = mmap(NULL, udmabuf_get_size(buf),
+                      PROT_READ | PROT_WRITE, MAP_SHARED, buf->memfd, 0);
+    if (buf->start == MAP_FAILED) {
+        return false;
+    }
+
+    return true;
+}
+
+static void
+udmabuf_unmap_bm(struct VuVideoDMABuf *buf)
+{
+    g_debug("Unmap the buffer memory.");
+    munmap(buf->start, udmabuf_get_size(buf));
+}
+
+static int
+udmabuf_get_fd(struct VuVideoDMABuf *buf)
+{
+    if (buf->dmafd > 0) {
+        return buf->dmafd;
+    }
+
+    struct udmabuf_create create = {
+        .memfd = buf->memfd,
+        .offset = 0,
+        .size = udmabuf_get_size(buf),
+    };
+
+    buf->dmafd = ioctl(buf->dev->fd, UDMABUF_CREATE, &create);
+    if (buf->dmafd < 0) {
+        g_printerr("%s: UDMABUF_CREATE failed.", __func__);
+    }
+
+    return buf->dmafd;
+}
+
+static void
+udmabuf_device_destroy(struct vuvbm_device *dev)
+{
+    close(dev->fd);
+}
+
+static bool
+vuvbm_buffer_map(struct VuVideoDMABuf *buf)
+{
+    struct vuvbm_device *dev = buf->dev;
+
+    return dev->map_bm(buf);
+}
+
+bool vuvbm_buffer_create(struct vuvbm_device *dev,
+                         struct VuVideoDMABuf *buffer, uint32_t len)
+{
+    g_debug("Creating buffer length(%d)", len);
+    buffer->dev = dev;
+    buffer->length = len;
+    if (!dev->alloc_bm(buffer)) {
+        g_warning("alloc_bm failed");
+        return false;
+    }
+
+    if (!vuvbm_buffer_map(buffer)) {
+        g_warning("map_bm failed");
+        goto err;
+    }
+
+    return true;
+
+err:
+    buffer->dev->free_bm(buffer);
+    return false;
+}
+
+void vuvbm_init_device(struct vuvbm_device *dev)
+{
+    if (!dev->opened && g_file_test("/dev/udmabuf", G_FILE_TEST_EXISTS)) {
+        dev->fd = open("/dev/udmabuf", O_RDWR);
+        if (dev->fd >= 0) {
+            g_debug("Using experimental udmabuf backend");
+            dev->alloc_bm = udmabuf_alloc_bm;
+            dev->free_bm = udmabuf_free_bm;
+            dev->get_fd = udmabuf_get_fd;
+            dev->map_bm = udmabuf_map_bm;
+            dev->unmap_bm = udmabuf_unmap_bm;
+            dev->device_destroy = udmabuf_device_destroy;
+            dev->resource_uuids = g_hash_table_new_full(
+                NULL, NULL, NULL, g_free);
+            dev->opened = true;
+        }
+    }
+    g_debug("Using udmabuf backend");
+}
+
+struct VuVideoDMABuf *vuvbm_lookup(struct vuvbm_device *dev, QemuUUID uuid)
+{
+    g_debug("Lookup for buffer uuid(%s)", qemu_uuid_unparse_strdup(&uuid));
+    return g_hash_table_lookup(dev->resource_uuids, &uuid);
+}
+
+void vuvbm_buffer_destroy(struct VuVideoDMABuf *buffer)
+{
+    struct vuvbm_device *dev = buffer->dev;
+
+    dev->unmap_bm(buffer);
+    dev->free_bm(buffer);
+}
+
+void vuvbm_device_destroy(struct vuvbm_device *dev)
+{
+    if (!dev->opened) {
+        return;
+    }
+
+    dev->device_destroy(dev);
+}
diff --git a/tools/vhost-user-video/vuvideo.h b/tools/vhost-user-video/vuvideo.h
index d853c69682..b198b71fad 100644
--- a/tools/vhost-user-video/vuvideo.h
+++ b/tools/vhost-user-video/vuvideo.h
@@ -18,7 +18,6 @@
 
 #include "virtio_video_helpers.h"
 #include "v4l2_backend.h"
-#include "vuvideo.h"
 
 GList *get_resource_list(struct stream *s, uint32_t queue_type);
 void send_qclear_res_reply(gpointer data, gpointer user_data);
@@ -40,4 +39,13 @@ void remove_all_resources(struct stream *s, uint32_t queue_type);
 void handle_queue_clear_cmd(struct VuVideo *v,
                            struct vu_video_ctrl_command *vio_cmd);
 
+/* virtio_video_udmabuf.c */
+bool vuvbm_buffer_create(struct vuvbm_device *dev,
+                         struct VuVideoDMABuf *buffer,
+                         uint32_t len);
+void vuvbm_init_device(struct vuvbm_device *dev);
+struct VuVideoDMABuf *vuvbm_lookup(struct vuvbm_device *dev, QemuUUID uuid);
+void vuvbm_buffer_destroy(struct VuVideoDMABuf *buffer);
+void vuvbm_device_destroy(struct vuvbm_device *dev);
+
 #endif
-- 
2.39.2


