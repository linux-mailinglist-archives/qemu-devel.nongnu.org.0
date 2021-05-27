Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 333EE3930F0
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 16:32:21 +0200 (CEST)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lmH3c-0004Mw-3u
	for lists+qemu-devel@lfdr.de; Thu, 27 May 2021 10:32:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34428)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGxB-0000zW-2Z
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:58759)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lmGx5-0005ED-4r
 for qemu-devel@nongnu.org; Thu, 27 May 2021 10:25:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622125534;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iPysXiQ6CM4s11xzDO5i5g9kvmktjyps93pLiHWdoYk=;
 b=UfIO7c5VVc81KGPGycvtncvE3UN9iAH6gKmdmPF35BgfoOHnAQusygVCftJRTCutQeeQ3h
 YqpB/Ycau5Y5uXBsMsP7eEZSYrP2SaDckLQK9lZuuxtgYeg9KlbzyRStXJe9j7T4rwrCuZ
 Kn6jMikcaBWBHeVnqQ5j50aairQKwwE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-36-x9L7xK7uNPGJTmDXhVLIfw-1; Thu, 27 May 2021 10:25:31 -0400
X-MC-Unique: x9L7xK7uNPGJTmDXhVLIfw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7E91180D683;
 Thu, 27 May 2021 14:25:30 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-84.ams2.redhat.com
 [10.36.112.84])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BC00260864;
 Thu, 27 May 2021 14:25:18 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id EAEE01800868; Thu, 27 May 2021 16:23:41 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 18/23] virtio-gpu: Add virtio_gpu_resource_create_blob
Date: Thu, 27 May 2021 16:23:35 +0200
Message-Id: <20210527142340.1352791-19-kraxel@redhat.com>
In-Reply-To: <20210527142340.1352791-1-kraxel@redhat.com>
References: <20210527142340.1352791-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Vivek Kasireddy <vivek.kasireddy@intel.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vivek Kasireddy <vivek.kasireddy@intel.com>

This API allows Qemu to register the blob allocated by the Guest
as a new resource and map its backing storage.

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
Message-Id: <20210526231429.1045476-10-vivek.kasireddy@intel.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu-bswap.h |  9 ++++
 hw/display/virtio-gpu.c              | 73 ++++++++++++++++++++++++++--
 hw/display/trace-events              |  1 +
 3 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu-bswap.h b/include/hw/virtio/virtio-gpu-bswap.h
index 203f9e17189e..d23ac5cc4a06 100644
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
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index f77a7fc7dd21..788b4540d5ea 100644
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
diff --git a/hw/display/trace-events b/hw/display/trace-events
index 9fccca18a1d7..f3f77b6984b7 100644
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
-- 
2.31.1


