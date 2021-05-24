Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3B838F5E3
	for <lists+qemu-devel@lfdr.de>; Tue, 25 May 2021 00:53:56 +0200 (CEST)
Received: from localhost ([::1]:54910 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1llJSN-0000TG-Os
	for lists+qemu-devel@lfdr.de; Mon, 24 May 2021 18:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIP-00073l-0W
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:37 -0400
Received: from mga05.intel.com ([192.55.52.43]:11770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1llJIM-0006mt-T0
 for qemu-devel@nongnu.org; Mon, 24 May 2021 18:43:36 -0400
IronPort-SDR: ZQlwKT1RWA/d8S8+G+ABQni4Knz5m+F1fbr7DXQFcxzfU2hAu4c50++oOhoQI2gXEw/RcQFDXb
 /iSrWFeV2NZw==
X-IronPort-AV: E=McAfee;i="6200,9189,9994"; a="287620908"
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="287620908"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
IronPort-SDR: CWVUr4nCWxL3Tn8ZZNC+C/QIO/odjkSj85eKX1xSUG8B/S7qvomZrlr7XMnxhF2wZFlLXm6lld
 w0CH6/W3ngew==
X-IronPort-AV: E=Sophos;i="5.82,327,1613462400"; d="scan'208";a="546246764"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2021 15:43:17 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 08/13] virtio-gpu: Add virtio_gpu_resource_create_blob
Date: Mon, 24 May 2021 15:30:58 -0700
Message-Id: <20210524223103.922910-9-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210524223103.922910-1-vivek.kasireddy@intel.com>
References: <20210524223103.922910-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/trace-events              |  1 +
 hw/display/virtio-gpu.c              | 73 ++++++++++++++++++++++++++--
 include/hw/virtio/virtio-gpu-bswap.h |  9 ++++
 3 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 9fccca18a1..f3f77b6984 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -32,6 +32,7 @@ virtio_gpu_cmd_get_edid(uint32_t scanout) "scanout %d"
 virtio_gpu_cmd_set_scanout(uint32_t id, uint32_t res, uint32_t w, uint32_t h, uint32_t x, uint32_t y) "id %d, res 0x%x, w %d, h %d, x %d, y %d"
 virtio_gpu_cmd_res_create_2d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h) "res 0x%x, fmt 0x%x, w %d, h %d"
 virtio_gpu_cmd_res_create_3d(uint32_t res, uint32_t fmt, uint32_t w, uint32_t h, uint32_t d) "res 0x%x, fmt 0x%x, w %d, h %d, d %d"
+virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" PRId64
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index f77a7fc7dd..788b4540d5 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -137,7 +137,7 @@ virtio_gpu_find_check_resource(VirtIOGPU *g, uint32_t resource_id,
     }
 
     if (require_backing) {
-        if (!res->iov || !res->image) {
+        if (!res->iov || (!res->image && !res->blob)) {
             qemu_log_mask(LOG_GUEST_ERROR, "%s: no backing storage %d\n",
                           caller, resource_id);
             if (error) {
@@ -313,6 +313,62 @@ static void virtio_gpu_resource_create_2d(VirtIOGPU *g,
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
+                                        cmd, &res->addrs, &res->iov,
+                                        &res->iov_cnt);
+    if (ret != 0) {
+        cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
+        return;
+    }
+
+    virtio_gpu_init_udmabuf(res);
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
+}
+
 static void virtio_gpu_disable_scanout(VirtIOGPU *g, int scanout_id)
 {
     struct virtio_gpu_scanout *scanout = &g->parent_obj.scanout[scanout_id];
@@ -390,7 +446,7 @@ static void virtio_gpu_transfer_to_host_2d(VirtIOGPU *g,
 
     res = virtio_gpu_find_check_resource(g, t2d.resource_id, true,
                                          __func__, &cmd->error);
-    if (!res) {
+    if (!res || res->blob) {
         return;
     }
 
@@ -446,7 +502,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
 
     res = virtio_gpu_find_check_resource(g, rf.resource_id, false,
                                          __func__, &cmd->error);
-    if (!res) {
+    if (!res || res->blob) {
         return;
     }
 
@@ -715,6 +771,10 @@ static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
     res->iov_cnt = 0;
     g_free(res->addrs);
     res->addrs = NULL;
+
+    if (res->blob) {
+        virtio_gpu_fini_udmabuf(res);
+    }
 }
 
 static void
@@ -785,6 +845,13 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_CREATE_2D:
         virtio_gpu_resource_create_2d(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_CREATE_BLOB:
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
-- 
2.30.2


