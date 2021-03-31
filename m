Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6FD34F776
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:27:33 +0200 (CEST)
Received: from localhost ([::1]:55700 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRW0-0001xT-JB
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:27:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36596)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQf-0002kQ-QG
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:01 -0400
Received: from mga18.intel.com ([134.134.136.126]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQd-00055o-BE
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:22:01 -0400
IronPort-SDR: +SBUtezih0BQg24HlgUwhxak4oqgHax0ZaoK8qm22v+KJIUWC+8qxOwDIdt83gqzr85Y4+MPwY
 IE2gcIiGsJTg==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449775"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449775"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:35 -0700
IronPort-SDR: Sc6wC0CNxWhATQ1bRZuN30dJeHNsrWH4vWdPVyai3NDwr54QFBtOL8MqdLM3qG+b+m28nUwqaJ
 h3shQxb1Fnhw==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454137"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:34 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 08/11] virtio-gpu: Add virtio_gpu_resource_create_blob
Date: Tue, 30 Mar 2021 20:09:58 -0700
Message-Id: <20210331031001.1564125-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This API allows Qemu to register the blob allocated by the Guest
as a new resource and map its backing storage.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/trace-events              |  1 +
 hw/display/virtio-gpu-udmabuf.c      |  9 +++-
 hw/display/virtio-gpu.c              | 74 ++++++++++++++++++++++++++--
 include/hw/virtio/virtio-gpu-bswap.h |  9 ++++
 include/hw/virtio/virtio-gpu.h       |  2 +
 5 files changed, 90 insertions(+), 5 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 957b8ba994..99e5256aac 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -42,6 +42,7 @@ virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
 virtio_gpu_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
 virtio_gpu_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
 virtio_gpu_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
+virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" PRId64
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index 8d0fe1ce4a..bbcaf27b56 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -72,7 +72,10 @@ static void virtio_gpu_create_udmabuf(struct virtio_gpu_simple_resource *res)
 
 static void virtio_gpu_remap_udmabuf(struct virtio_gpu_simple_resource *res)
 {
-    res->remapsz = res->width * res->height * 4;
+    if (res->blob_size) {
+        res->remapsz = res->blob_size;
+    }
+
     res->remapsz = QEMU_ALIGN_UP(res->remapsz, getpagesize());
 
     res->remapped = mmap(NULL, res->remapsz, PROT_READ,
@@ -151,7 +154,9 @@ void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
         pdata = res->remapped;
     }
 
-    (void) pdata;
+    if (pdata) {
+        res->blob = pdata;
+    }
 }
 
 void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 30d3e38fa9..8a8cc7f181 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -182,7 +182,7 @@ virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
     }
 
     if (require_backing) {
-        if (!res->iov || !res->image) {
+        if (!res->iov || (!res->image && !res->blob)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: no backing storage %d\n",
                           caller, resource_id);
             if (error) {
@@ -358,6 +358,63 @@ static void virtio_gpu_resource_create_2d(VirtIOGPU *g,
     g->hostmem += res->hostmem;
 }
 
+static void virtio_gpu_resource_create_blob(VirtIOGPU *g,
+                                            struct virtio_gpu_ctrl_command *cmd)
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
+    res->resource_id = cblob.resource_id;
+    res->blob_size = cblob.size;
+
+    if (cblob.blob_mem != VIRTIO_GPU_BLOB_MEM_GUEST &&
+        cblob.blob_flags != VIRTIO_GPU_BLOB_FLAG_USE_SHAREABLE) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: invalid memory type\n",
+                      __func__);
+        cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+        g_free(res);
+        return;
+    }
+
+    if (res->iov) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+        return;
+    }
+
+    ret = virtio_gpu_create_mapping_iov(g, cblob.nr_entries, sizeof(cblob),
+                                        cmd, &res->addrs, &res->iov);
+    if (ret != 0) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+        return;
+    }
+
+    res->iov_cnt = cblob.nr_entries;
+    virtio_gpu_init_udmabuf(res);
+
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+}
+
 static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
@@ -435,7 +492,7 @@ static void virtio_gpu_transfer_to_host_2d(VirtIOGPU *g,
 
     res = virtio_gpu_find_check_resource(g, t2d.resource_id, true,
                                          __func__, &cmd->error);
-    if (!res) {
+    if (!res || res->blob) {
         return;
     }
 
@@ -491,7 +548,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
 
     res = virtio_gpu_find_check_resource(g, rf.resource_id, false,
                                          __func__, &cmd->error);
-    if (!res) {
+    if (!res || res->blob) {
         return;
     }
 
@@ -743,6 +800,10 @@ static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
     res->iov_cnt = 0;
     g_free(res->addrs);
     res->addrs = NULL;
+
+    if (res->blob) {
+        virtio_gpu_fini_udmabuf(res);
+    }
 }
 
 static void
@@ -815,6 +876,13 @@ static void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_CREATE_2D:
         virtio_gpu_resource_create_2d(g, cmd);
         break;
+  case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
+        if (!virtio_gpu_blob_enabled(g->parent_obj.conf)) {
+            cmd->error = VIRTIO_GPU_RESP_ERR_INVALID_PARAMETER;
+            break;
+        }
+        virtio_gpu_resource_create_blob(g, cmd);
+        break;
     case VIRTIO_GPU_CMD_RESOURCE_UNREF:
         virtio_gpu_resource_unref(g, cmd);
         break;
diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index 203f9e1718..d23ac5cc4a 100644
--- a/include/hw/virtio/virtio-gpu-bswap.h
+++ b/include/hw/virtio/virtio-gpu-bswap.h
@@ -59,4 +59,13 @@ virtio_gpu_t2d_bswap(struct virtio_gpu_transfer_to_host_2d *t2d)
     le32_to_cpus(&t2d->padding);
 }
 
+static inline void
+virtio_gpu_create_blob_bswap(struct virtio_gpu_resource_create_blob *cblob)
+{
+    virtio_gpu_ctrl_hdr_bswap(&cblob->hdr);
+    le32_to_cpus(&cblob->resource_id);
+    le32_to_cpus(&cblob->blob_flags);
+    le64_to_cpus(&cblob->size);
+}
+
 #endif
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 415aeddb07..a65215dc52 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -48,6 +48,8 @@ struct virtio_gpu_simple_resource {
     pixman_image_t *image;
     uint64_t hostmem;
 
+    uint64_t blob_size;
+    void *blob;
     int dmabuf_fd;
     size_t remapsz;
     uint8_t *remapped;
-- 
2.26.2


