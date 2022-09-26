Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E745EA873
	for <lists+qemu-devel@lfdr.de>; Mon, 26 Sep 2022 16:33:09 +0200 (CEST)
Received: from localhost ([::1]:59528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ocpAS-0006VN-Im
	for lists+qemu-devel@lfdr.de; Mon, 26 Sep 2022 10:33:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34944)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2G-0003s6-De
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:40 -0400
Received: from madras.collabora.co.uk ([46.235.227.172]:55474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1ocp2D-00044H-B9
 for qemu-devel@nongnu.org; Mon, 26 Sep 2022 10:24:39 -0400
Received: from dellino.fritz.box (host-79-27-165-192.retail.telecomitalia.it
 [79.27.165.192])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: fahien)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 23C466602259;
 Mon, 26 Sep 2022 15:24:34 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1664202274;
 bh=ex01S2Vw15H8RdZuVZEW5Es12jyIKd1HUH+IwkAg1yM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=WZJQgzoSxSrwWvKZ1X16NlM8qhEawRYVWGONKZIq5j8NKCKKNeiENnmTaNsWOXW6p
 OoyJ6hU4DGD9Edco7rK9O4Ub/muJd0t4TefIogDWUJzpDqRSLR7cJeMCD9ouWkcs26
 k++E+HaFCVE29UWPVC+H15b/bhC3K+GZgdFsAMJg5iZDXsVPVE6I0p/JrDJ1vFUH8M
 0c43i77qVDQhuj7lFGVVlJpmDanYo0Pi5E1axnIcnAULogF8cJZt5VioTfgpFuvxlI
 sDdEjhXeX7ZiDmo/aDq+CW2imWnnn6zkW7KQL3Ms5AEtgHm6UVk0ntQicAvxU7VLNl
 lZHHfkf52TTwg==
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Cc: gert.wollny@collabora.com, dmitry.osipenko@collabora.com,
 "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>
Subject: [PATCH v3 6/9] virtio-gpu: Resource UUID
Date: Mon, 26 Sep 2022 16:24:19 +0200
Message-Id: <20220926142422.22325-7-antonio.caggiano@collabora.com>
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

Enable resource UUID feature and implement command resource assign UUID.
This is done by introducing a hash table to map resource IDs to their
UUIDs.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
v3: Destroy the hash table in the unrealize function

 hw/display/trace-events        |  1 +
 hw/display/virtio-gpu-base.c   |  2 ++
 hw/display/virtio-gpu-virgl.c  | 11 +++++++++
 hw/display/virtio-gpu.c        | 41 ++++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  4 ++++
 5 files changed, 59 insertions(+)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index 0c0ffcbe42..6632344322 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -41,6 +41,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 5cb71e71ad..54792aa501 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -219,6 +219,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_CONTEXT_INIT);
     }
 
+    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 1bff8c66ce..f9d8ccfdf8 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -45,6 +45,10 @@ static void virgl_cmd_create_resource_2d(VirtIOGPU *g,
     args.nr_samples = 0;
     args.flags = VIRTIO_GPU_RESOURCE_FLAG_Y_0_TOP;
     virgl_renderer_resource_create(&args, NULL, 0);
+
+    struct virtio_gpu_simple_resource *res = g_new0(struct virtio_gpu_simple_resource, 1);
+    res->resource_id = c2d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
 static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
@@ -69,6 +73,10 @@ static void virgl_cmd_create_resource_3d(VirtIOGPU *g,
     args.nr_samples = c3d.nr_samples;
     args.flags = c3d.flags;
     virgl_renderer_resource_create(&args, NULL, 0);
+
+    struct virtio_gpu_simple_resource *res = g_new0(struct virtio_gpu_simple_resource, 1);
+    res->resource_id = c3d.resource_id;
+    QTAILQ_INSERT_HEAD(&g->reslist, res, next);
 }
 
 static void virgl_cmd_resource_unref(VirtIOGPU *g,
@@ -624,6 +632,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
         /* TODO add security */
         virgl_cmd_ctx_detach_resource(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     case VIRTIO_GPU_CMD_GET_CAPSET_INFO:
         virgl_cmd_get_capset_info(g, cmd);
         break;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index f1772a15bb..09a92b6e76 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -939,6 +939,37 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_assign_uuid assign;
+    struct virtio_gpu_resp_resource_uuid resp;
+    QemuUUID *uuid = NULL;
+
+    VIRTIO_GPU_FILL_CMD(assign);
+    virtio_gpu_bswap_32(&assign, sizeof(assign));
+    trace_virtio_gpu_cmd_res_assign_uuid(assign.resource_id);
+
+    res = virtio_gpu_find_check_resource(g, assign.resource_id, false, __func__, &cmd->error);
+    if (!res) {
+        return;
+    }
+
+    memset(&resp, 0, sizeof(resp));
+    resp.hdr.type = VIRTIO_GPU_RESP_OK_RESOURCE_UUID;
+
+    uuid = g_hash_table_lookup(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id));
+    if (!uuid) {
+        uuid = g_new(QemuUUID, 1);
+        qemu_uuid_generate(uuid);
+        g_hash_table_insert(g->resource_uuids, GUINT_TO_POINTER(assign.resource_id), uuid);
+    }
+
+    memcpy(resp.uuid, uuid, sizeof(QemuUUID));
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -987,6 +1018,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
@@ -1347,12 +1381,15 @@ void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
     QTAILQ_INIT(&g->reslist);
     QTAILQ_INIT(&g->cmdq);
     QTAILQ_INIT(&g->fenceq);
+
+    g->resource_uuids = g_hash_table_new_full(NULL, NULL, NULL, g_free);
 }
 
 static void virtio_gpu_device_unrealize(DeviceState *qdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
+    g_hash_table_destroy(g->resource_uuids);
     qemu_bh_delete(g->cursor_bh);
     qemu_bh_delete(g->ctrl_bh);
 
@@ -1382,6 +1419,10 @@ void virtio_gpu_reset(VirtIODevice *vdev)
         g_free(cmd);
     }
 
+    if (g->resource_uuids) {
+        g_hash_table_remove_all(g->resource_uuids);
+    }
+
     virtio_gpu_base_reset(VIRTIO_GPU_BASE(vdev));
 }
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index e9281c75f3..7d455b0a03 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -200,6 +200,8 @@ struct VirtIOGPU {
         QTAILQ_HEAD(, VGPUDMABuf) bufs;
         VGPUDMABuf *primary[VIRTIO_GPU_MAX_SCANOUTS];
     } dmabuf;
+
+    GHashTable *resource_uuids;
 };
 
 struct VirtIOGPUClass {
@@ -273,6 +275,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   uint32_t *niov);
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.34.1


