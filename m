Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 629BE3D7B97
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Jul 2021 19:07:13 +0200 (CEST)
Received: from localhost ([::1]:46324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m8QXw-0002zA-Ed
	for lists+qemu-devel@lfdr.de; Tue, 27 Jul 2021 13:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57696)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8QWP-0000CY-85
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:05:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:56440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <antonio.caggiano@collabora.com>)
 id 1m8QWK-0007Mn-PN
 for qemu-devel@nongnu.org; Tue, 27 Jul 2021 13:05:36 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
 (Authenticated sender: fahien) with ESMTPSA id 5FFC51F4331C
From: Antonio Caggiano <antonio.caggiano@collabora.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 4/7] virtio-gpu: Resource UUID
Date: Tue, 27 Jul 2021 19:05:07 +0200
Message-Id: <20210727170510.2116383-5-antonio.caggiano@collabora.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210727170510.2116383-1-antonio.caggiano@collabora.com>
References: <20210727170510.2116383-1-antonio.caggiano@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=46.235.227.227;
 envelope-from=antonio.caggiano@collabora.com; helo=bhuna.collabora.co.uk
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: Antonio Caggiano <antonio.caggiano@collabora.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable resource UUID feature and implement command resource assign UUID.
For the moment, use the resource ID as UUID.

Signed-off-by: Antonio Caggiano <antonio.caggiano@collabora.com>
---
 hw/display/trace-events        |  1 +
 hw/display/virtio-gpu-base.c   |  2 ++
 hw/display/virtio-gpu-virgl.c  |  3 +++
 hw/display/virtio-gpu.c        | 26 ++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  2 ++
 5 files changed, 34 insertions(+)

diff --git a/hw/display/trace-events b/hw/display/trace-events
index f03f6655bc..6b178fa75d 100644
--- a/hw/display/trace-events
+++ b/hw/display/trace-events
@@ -37,6 +37,7 @@ virtio_gpu_cmd_res_create_blob(uint32_t res, uint64_t size) "res 0x%x, size %" P
 virtio_gpu_cmd_res_unref(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_attach(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_back_detach(uint32_t res) "res 0x%x"
+virtio_gpu_cmd_res_assign_uuid(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_2d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_toh_3d(uint32_t res) "res 0x%x"
 virtio_gpu_cmd_res_xfer_fromh_3d(uint32_t res) "res 0x%x"
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 31b430664f..263a888922 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -218,6 +218,8 @@ virtio_gpu_base_get_features(VirtIODevice *vdev, uint64_t features,
         features |= (1 << VIRTIO_GPU_F_HOSTMEM);
     }
 
+    features |= (1 << VIRTIO_GPU_F_RESOURCE_UUID);
+
     return features;
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 5a184cf445..38e5ca6c72 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -458,6 +458,9 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
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
index 9686f17d79..26b819dd3d 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -932,6 +932,29 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_simple_resource *res;
+    struct virtio_gpu_resource_assign_uuid assign;
+    struct virtio_gpu_resp_resource_uuid resp;
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
+    /* FIXME: for the moment use the resource id as UUID */
+    *((uint32_t*)(resp.uuid + 12)) = assign.resource_id;
+    virtio_gpu_ctrl_response(g, cmd, &resp.hdr, sizeof(resp));
+}
+
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -980,6 +1003,9 @@ void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         virtio_gpu_resource_detach_backing(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_RESOURCE_ASSIGN_UUID:
+        virtio_gpu_resource_assign_uuid(g, cmd);
+        break;
     default:
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
         break;
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 835ebcb1a0..5cab5f42ac 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -263,6 +263,8 @@ int virtio_gpu_create_mapping_iov(VirtIOGPU *g,
                                   uint32_t *niov);
 void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
+void virtio_gpu_resource_assign_uuid(VirtIOGPU *g,
+                                     struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
-- 
2.30.2


