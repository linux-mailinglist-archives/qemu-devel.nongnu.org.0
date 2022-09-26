Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 42FC45EA8A5
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:40:04 +0200 (CEST)
Received: from localhost ([::1]:42020 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpH9-0007Fc-83
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:40:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2E-0003nm-D5
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:38 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:55434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2A-00043m-Ox
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:38 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 65456660225C;
 Mon, 26 Sep 2022 15:24:32 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664202272;
 bh=Zwzp95/QVrkDF7T71j7pMW1BCcw8wKvkxvkyu1GdhtQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kFHjFxEPI8yVZJl8solumgzUrZ1EycmGtwK9UwHl49StCXf9vKVzfFwB6U5mDeh/Z
 HzCPsSolRwHdDcCIk66J57r8iWKWYyzBowf8IX6dmbo8YEdkmSgxG2TrlC5opiSX4t
 SUGd2N6lCIX6LOSevzNB2rGK2oQ326QfjuC8KP2aW+bR1eig90IIj8cQ8lwwJrcGLo
 UbhssusWdw74e+bVHy5CuExR8ILLwEYGpEEIpg+SU/XCONIGhS168KwcPgyi0mX2xP
 D1BjOtBEu4vTDQF9bqcu7UY6CDB3GVlRPN04XqKY5aCt6MqgqDOub0aPO1GZ6xlzWL
 6F8TeXwb0YyiA==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 Gerd Hoffmann <kraxel@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>
Subject: [PATCH v3 3/9] virtio-gpu: Handle resource blob commands
Date: Mon, 26 Sep 2022 16:24:16 +0200
Message-Id: <20220926142422.22325-4-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220926142422.22325-1-antonio.caggiano@collabora.com>
References: <20220926142422.22325-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.172;
 envelope-from=antonio.caggiano@collabora.com; helo=madras.collabora.co.uk
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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

Support BLOB resources creation, mapping and unmapping by calling the
new stable virglrenderer 0.10 interface. Only enabled when available and
via the blob config. E.g. -device virtio-vga-gl,blob=true

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
Signed-off-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
---
v3: Fix memory leaks and unmap resource on destroy.

 hw/display/virtio-gpu-virgl.c        | 171 +++++++++++++++++++++++++++
 hw/display/virtio-gpu.c              |  12 +-
 include/hw/virtio/virtio-gpu-bswap.h |  18 +++
 include/hw/virtio/virtio-gpu.h       |   8 ++
 meson.build                          |   5 +
 5 files changed, 210 insertions(+), 4 deletions(-)

diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 73cb92c8d5..17f00b3fb0 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -16,6 +16,8 @@
 #include "trace.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-bswap.h"
+#include "hw/virtio/virtio-iommu.h"
 
 #include <virglrenderer.h>
 
@@ -398,6 +400,164 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
     g_free(resp);
 }
 
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+
+static void virgl_cmd_resource_create_blob(VirtIOGPU *g,
+                                           struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_create_blob cblob;
+    int ret;
+
+    VIRTIO_GPU_FILL_CMD(cblob);
+    virtio_gpu_create_blob_bswap(&cblob);
+    trace_virtio_gpu_cmd_res_create_blob(cblob.resource_id, cblob.size);
+
+    if (cblob.resource_id == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = virtio_gpu_find_resource(g, cblob.resource_id);
+    if (res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already exists %d\n",
+                      __func__, cblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = g_new0(struct virtio_gpu_simple_resource, 1);
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+
+    res->resource_id = cblob.resource_id;
+    res->blob_size = cblob.size;
+
+    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_HOST3D) {
+        ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
+                                            cmd, &res->addrs, &res->iov,
+                                            &res->iov_cnt);
+        if (ret != 0) {
+            cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+            return;
+        }
+    }
+
+    if (cblob.blob_mem == VIRTIO_GPU_BLOB_MEM_GUEST) {
+        virtio_gpu_init_udmabuf(res);
+    }
+    const struct virgl_renderer_resource_create_blob_args virgl_args = {
+        .res_handle = cblob.resource_id,
+        .ctx_id = cblob.hdr.ctx_id,
+        .blob_mem = cblob.blob_mem,
+        .blob_id = cblob.blob_id,
+        .blob_flags = cblob.blob_flags,
+        .size = cblob.size,
+        .iovecs = res->iov,
+        .num_iovs = res->iov_cnt,
+    };
+    ret = virgl_renderer_resource_create_blob(&virgl_args);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: virgl blob create error: %s\n",
+                      __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+    }
+}
+
+static void virgl_cmd_resource_map_blob(VirtIOGPU *g,
+                                        struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_map_blob mblob;
+    int ret;
+    void *data;
+    uint64_t size;
+    struct virtio_gpu_resp_map_info resp;
+
+    VIRTIO_GPU_FILL_CMD(mblob);
+    virtio_gpu_map_blob_bswap(&mblob);
+
+    if (mblob.resource_id == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = virtio_gpu_find_resource(g, mblob.resource_id);
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, mblob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    ret = virgl_renderer_resource_map(res->resource_id, &data, &size);
+    if (ret) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource map error: %s\n",
+                      __func__, strerror(-ret));
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    memory_region_init_ram_device_ptr(&res->region, OBJECT(g), NULL, size, data);
+    memory_region_add_subregion(&g->parent_obj.hostmem, mblob.offset, &res->region);
+    memory_region_set_enabled(&res->region, true);
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_MAP_INFO;
+    virgl_renderer_resource_get_map_info(mblob.resource_id, &resp.map_info);
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+
+    res->mapped = true;
+}
+
+int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
+                                    struct virtio_gpu_simple_resource *res)
+{
+    if (!res->mapped) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource already unmapped %d\n",
+                      __func__, res->resource_id);
+        return VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+    }
+
+    memory_region_set_enabled(&res->region, false);
+    memory_region_del_subregion(&g->parent_obj.hostmem, &res->region);
+    object_unparent(OBJECT(&res->region));
+
+    res->mapped = false;
+    return virgl_renderer_resource_unmap(res->resource_id);
+}
+
+static void virgl_cmd_resource_unmap_blob(VirtIOGPU *g,
+                                        struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_unmap_blob ublob;
+    VIRTIO_GPU_FILL_CMD(ublob);
+    virtio_gpu_unmap_blob_bswap(&ublob);
+
+    if (ublob.resource_id == 0) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource id 0 is not allowed\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    res = virtio_gpu_find_resource(g, ublob.resource_id);
+    if (!res) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: resource does not exist %d\n",
+                      __func__, ublob.resource_id);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_RESOURCE_ID;
+        return;
+    }
+
+    virtio_gpu_virgl_resource_unmap(g, res);
+}
+
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */
+
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                       struct virtio_gpu_ctrl_command *cmd)
 {
@@ -464,6 +624,17 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_GET_EDID:
         virtio_gpu_get_edid(g, cmd);
         break;
+#ifdef HAVE_VIRGL_RESOURCE_BLOB
+    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
+        virgl_cmd_resource_create_blob(g, cmd);
+        break;
+    case VIRTIO_GPU_CMD_RESOURCE_MAP_BLOB:
+        virgl_cmd_resource_map_blob(g, cmd);
+        break;
+    case VIRTIO_GPU_CMD_RESOURCE_UNMAP_BLOB:
+        virgl_cmd_resource_unmap_blob(g, cmd);
+        break;
+#endif /* HAVE_VIRGL_RESOURCE_BLOB */
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 506b3b8eef..f79693d44d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -33,8 +33,6 @@
 
 #define VIRTIO_GPU_VM_VERSION 1
 
-static struct virtio_gpu_simple_resource*
-virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
 static struct virtio_gpu_simple_resource *
 virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
                                bool require_backing,
@@ -115,7 +113,7 @@ static void update_cursor(VirtIOGPU *g, struct virtio_gpu_update_cursor *cursor)
                   cursor->resource_id ? 1 : 0);
 }
 
-static struct virtio_gpu_simple_resource *
+struct virtio_gpu_simple_resource *
 virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id)
 {
     struct virtio_gpu_simple_resource *res;
@@ -874,6 +872,10 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
 static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
                                        struct virtio_gpu_simple_resource *res)
 {
+    if (res->mapped) {
+        virtio_gpu_virgl_resource_unmap(g, res);
+    }
+
     virtio_gpu_cleanup_mapping_iov(g, res->iov, res->iov_cnt);
     res->iov = NULL;
     res->iov_cnt = 0;
@@ -1323,10 +1325,12 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
             return;
         }
 
+#ifndef HAVE_VIRGL_RESOURCE_BLOB
         if (virtio_gpu_virgl_enabled(g->parent_obj.conf)) {
-            error_setg(errp, "blobs and virgl are not compatible (yet)");
+            error_setg(errp, "Linked virglrenderer does not support blob resources");
             return;
         }
+#endif
     }
 
     if (!virtio_gpu_base_device_realize(qdev,
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index 9124108485..dd1975e2d4 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -63,10 +63,28 @@ virtio_gpu_create_blob_bswap(struct virtio_gpu_resource_create_blob *cblob)
 {
     virtio_gpu_ctrl_hdr_bswap(&cblob->hdr);
     le32_to_cpus(&cblob->resource_id);
+    le32_to_cpus(&cblob->blob_mem);
     le32_to_cpus(&cblob->blob_flags);
+    le32_to_cpus(&cblob->nr_entries);
+    le64_to_cpus(&cblob->blob_id);
     le64_to_cpus(&cblob->size);
 }
 
+static inline void
+virtio_gpu_map_blob_bswap(struct virtio_gpu_resource_map_blob *mblob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&mblob->hdr);
+    le32_to_cpus(&mblob->resource_id);
+    le64_to_cpus(&mblob->offset);
+}
+
+static inline void
+virtio_gpu_unmap_blob_bswap(struct virtio_gpu_resource_unmap_blob *ublob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&ublob->hdr);
+    le32_to_cpus(&ublob->resource_id);
+}
+
 static inline void
 virtio_gpu_scanout_blob_bswap(struct virtio_gpu_set_scanout_blob *ssb)
 {
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index eafce75b04..708cf1bb9c 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -55,6 +55,9 @@ struct virtio_gpu_simple_resource {
     int dmabuf_fd;
     uint8_t *remapped;
 
+    MemoryRegion region;
+    bool mapped;
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
@@ -245,6 +248,9 @@ void virtio_gpu_base_fill_display_info(VirtIOGPUBase *g,
                         struct virtio_gpu_resp_display_info *dpy_info);
 
 /* virtio-gpu.c */
+struct virtio_gpu_simple_resource *
+virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
+
 void virtio_gpu_ctrl_response(VirtIOGPU *g,
                               struct virtio_gpu_ctrl_command *cmd,
                               struct virtio_gpu_ctrl_hdr *resp,
@@ -289,5 +295,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
 void virtio_gpu_virgl_reset(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
+int virtio_gpu_virgl_resource_unmap(VirtIOGPU *g,
+                                    struct virtio_gpu_simple_resource *res);
 
 #endif
diff --git a/meson.build b/meson.build
index 3885fc1076..c4e801b4f5 100644
--- a/meson.build
+++ b/meson.build
@@ -718,6 +718,11 @@ if not get_option('virglrenderer').auto() or have_system or have_vhost_user_gpu
                      method: 'pkg-config',
                      required: get_option('virglrenderer'),
                      kwargs: static_kwargs)
+
+  config_host_data.set('HAVE_VIRGL_RESOURCE_BLOB',
+                       cc.has_function('virgl_renderer_resource_create_blob',
+                                       prefix: '#include <virglrenderer.h>',
+                                       dependencies: virgl))
 endif
 curl = not_found
 if not get_option('curl').auto() or have_block
-- 
2.34.1


