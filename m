Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80E016FF209
	for <lists+qemu-devel@lfdr.de>; Thu, 11 May 2023 15:02:17 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1px5ul-0003uR-OT; Thu, 11 May 2023 09:00:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1px5uT-0003rt-Cz
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:00:46 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ernunes@redhat.com>)
 id 1px5uP-0005jO-WF
 for qemu-devel@nongnu.org; Thu, 11 May 2023 09:00:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683810036;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=34RvFeGu4PlbujOYFV6PQhmT+tY4bUpM/lVnfhm86pA=;
 b=IbrHugHNyZQFy0IQXnun/ZWUtPN/AYE4Xev8tdAGThrFFSzDVsVLZCEQQGx+1Y4xEUaVj4
 Luw1AKbg+e0tzdEwRx0hOZd0JGRpN5tf4xHPrXABj6TpF6uOt0JkOW7LBWNVkFPiam98S7
 dBRMtSTvt2t/oQZJyx1zZ8A2CBVgrsk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-240-_hUNMC9LPAewVDT42TCD3g-1; Thu, 11 May 2023 08:59:19 -0400
X-MC-Unique: _hUNMC9LPAewVDT42TCD3g-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 52BC5101A54F
 for <qemu-devel@nongnu.org>; Thu, 11 May 2023 12:59:19 +0000 (UTC)
Received: from centennial.enunes.eu.com (unknown [10.45.225.167])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2F7AE47CD0;
 Thu, 11 May 2023 12:59:17 +0000 (UTC)
From: Erico Nunes <ernunes@redhat.com>
To: qemu-devel@nongnu.org
Cc: marcandre.lureau@redhat.com, mst@redhat.com, kraxel@redhat.com,
 Erico Nunes <ernunes@redhat.com>
Subject: [PATCH 2/2] vhost-user-gpu: implement get_edid feature
Date: Thu, 11 May 2023 14:58:03 +0200
Message-Id: <20230511125803.594963-3-ernunes@redhat.com>
In-Reply-To: <20230511125803.594963-1-ernunes@redhat.com>
References: <20230511125803.594963-1-ernunes@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Received-SPF: pass client-ip=170.10.133.124; envelope-from=ernunes@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Implement the virtio-gpu feature in vhost-user-gpu, which was
unsupported until now.
In this implementation, the feature is enabled inconditionally to avoid
creating another optional config option.
Similarly to get_display_info, vhost-user-gpu sends a message back to
the qemu process to have access to all the display information. In the
case of get_edid, it also needs to pass which scanout we should retrieve
the edid for.

Signed-off-by: Erico Nunes <ernunes@redhat.com>
---
 contrib/vhost-user-gpu/vhost-user-gpu.c | 53 ++++++++++++++++++++++++-
 contrib/vhost-user-gpu/virgl.c          |  3 ++
 contrib/vhost-user-gpu/vugpu.h          |  8 ++++
 docs/interop/vhost-user-gpu.rst         |  9 +++++
 hw/display/vhost-user-gpu.c             | 31 +++++++++++++++
 5 files changed, 102 insertions(+), 2 deletions(-)

diff --git a/contrib/vhost-user-gpu/vhost-user-gpu.c b/contrib/vhost-user-gpu/vhost-user-gpu.c
index bfb8d93cf8..26820be954 100644
--- a/contrib/vhost-user-gpu/vhost-user-gpu.c
+++ b/contrib/vhost-user-gpu/vhost-user-gpu.c
@@ -303,6 +303,53 @@ vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
     cmd->state = VG_CMD_STATE_PENDING;
 }
 
+static gboolean
+get_edid_cb(gint fd, GIOCondition condition, gpointer user_data)
+{
+    struct virtio_gpu_resp_edid resp_edid;
+    VuGpu *vg = user_data;
+    struct virtio_gpu_ctrl_command *cmd = QTAILQ_LAST(&vg->fenceq);
+
+    g_debug("get edid cb");
+    assert(cmd->cmd_hdr.type == VIRTIO_GPU_CMD_GET_EDID);
+    if (!vg_recv_msg(vg, VHOST_USER_GPU_GET_EDID,
+                     sizeof(resp_edid), &resp_edid)) {
+        return G_SOURCE_CONTINUE;
+    }
+
+    QTAILQ_REMOVE(&vg->fenceq, cmd, next);
+    vg_ctrl_response(vg, cmd, &resp_edid.hdr, sizeof(resp_edid));
+
+    vg->wait_in = 0;
+    vg_handle_ctrl(&vg->dev.parent, 0);
+
+    return G_SOURCE_REMOVE;
+}
+
+void
+vg_get_edid(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
+{
+    struct virtio_gpu_cmd_get_edid get_edid;
+
+    VUGPU_FILL_CMD(get_edid);
+    virtio_gpu_bswap_32(&get_edid, sizeof(get_edid));
+
+    VhostUserGpuMsg msg = {
+        .request = VHOST_USER_GPU_GET_EDID,
+        .size = sizeof(VhostUserGpuEdidRequest),
+        .payload.edid_req = {
+                .scanout_id = get_edid.scanout,
+        },
+    };
+
+    assert(vg->wait_in == 0);
+
+    vg_send_msg(vg, &msg, -1);
+    vg->wait_in = g_unix_fd_add(vg->sock_fd, G_IO_IN | G_IO_HUP,
+                               get_edid_cb, vg);
+    cmd->state = VG_CMD_STATE_PENDING;
+}
+
 static void
 vg_resource_create_2d(VuGpu *g,
                       struct virtio_gpu_ctrl_command *cmd)
@@ -837,8 +884,9 @@ vg_process_cmd(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd)
     case VIRTIO_GPU_CMD_RESOURCE_DETACH_BACKING:
         vg_resource_detach_backing(vg, cmd);
         break;
-    /* case VIRTIO_GPU_CMD_GET_EDID: */
-    /*     break */
+    case VIRTIO_GPU_CMD_GET_EDID:
+        vg_get_edid(vg, cmd);
+        break;
     default:
         g_warning("TODO handle ctrl %x\n", cmd->cmd_hdr.type);
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
@@ -1086,6 +1134,7 @@ vg_get_features(VuDev *dev)
     if (opt_virgl) {
         features |= 1 << VIRTIO_GPU_F_VIRGL;
     }
+    features |= 1 << VIRTIO_GPU_F_EDID;
 
     return features;
 }
diff --git a/contrib/vhost-user-gpu/virgl.c b/contrib/vhost-user-gpu/virgl.c
index 3e45e1bd33..211aa110a9 100644
--- a/contrib/vhost-user-gpu/virgl.c
+++ b/contrib/vhost-user-gpu/virgl.c
@@ -495,6 +495,9 @@ void vg_virgl_process_cmd(VuGpu *g, struct virtio_gpu_ctrl_command *cmd)
     case VIRTIO_GPU_CMD_GET_DISPLAY_INFO:
         vg_get_display_info(g, cmd);
         break;
+    case VIRTIO_GPU_CMD_GET_EDID:
+        vg_get_edid(g, cmd);
+        break;
     default:
         g_debug("TODO handle ctrl %x\n", cmd->cmd_hdr.type);
         cmd->error = VIRTIO_GPU_RESP_ERR_UNSPEC;
diff --git a/contrib/vhost-user-gpu/vugpu.h b/contrib/vhost-user-gpu/vugpu.h
index e2864bba68..db8b72b866 100644
--- a/contrib/vhost-user-gpu/vugpu.h
+++ b/contrib/vhost-user-gpu/vugpu.h
@@ -36,6 +36,7 @@ typedef enum VhostUserGpuRequest {
     VHOST_USER_GPU_UPDATE,
     VHOST_USER_GPU_DMABUF_SCANOUT,
     VHOST_USER_GPU_DMABUF_UPDATE,
+    VHOST_USER_GPU_GET_EDID,
 } VhostUserGpuRequest;
 
 typedef struct VhostUserGpuDisplayInfoReply {
@@ -83,6 +84,10 @@ typedef struct VhostUserGpuDMABUFScanout {
     int fd_drm_fourcc;
 } QEMU_PACKED VhostUserGpuDMABUFScanout;
 
+typedef struct VhostUserGpuEdidRequest {
+    uint32_t scanout_id;
+} QEMU_PACKED VhostUserGpuEdidRequest;
+
 typedef struct VhostUserGpuMsg {
     uint32_t request; /* VhostUserGpuRequest */
     uint32_t flags;
@@ -93,6 +98,8 @@ typedef struct VhostUserGpuMsg {
         VhostUserGpuScanout scanout;
         VhostUserGpuUpdate update;
         VhostUserGpuDMABUFScanout dmabuf_scanout;
+        VhostUserGpuEdidRequest edid_req;
+        struct virtio_gpu_resp_edid resp_edid;
         struct virtio_gpu_resp_display_info display_info;
         uint64_t u64;
     } payload;
@@ -171,6 +178,7 @@ int     vg_create_mapping_iov(VuGpu *g,
                               struct iovec **iov);
 void    vg_cleanup_mapping_iov(VuGpu *g, struct iovec *iov, uint32_t count);
 void    vg_get_display_info(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd);
+void    vg_get_edid(VuGpu *vg, struct virtio_gpu_ctrl_command *cmd);
 
 void    vg_wait_ok(VuGpu *g);
 
diff --git a/docs/interop/vhost-user-gpu.rst b/docs/interop/vhost-user-gpu.rst
index 1640553729..c6fe2d9c2a 100644
--- a/docs/interop/vhost-user-gpu.rst
+++ b/docs/interop/vhost-user-gpu.rst
@@ -141,6 +141,8 @@ In QEMU the vhost-user-gpu message is implemented with the following struct:
           VhostUserGpuScanout scanout;
           VhostUserGpuUpdate update;
           VhostUserGpuDMABUFScanout dmabuf_scanout;
+          VhostUserGpuEdidRequest edid_req;
+          struct virtio_gpu_resp_edid resp_edid;
           struct virtio_gpu_resp_display_info display_info;
           uint64_t u64;
       } payload;
@@ -241,3 +243,10 @@ Message types
   Note: there is no data payload, since the scanout is shared thanks
   to DMABUF, that must have been set previously with
   ``VHOST_USER_GPU_DMABUF_SCANOUT``.
+
+``VHOST_USER_GPU_GET_EDID``
+  :id: 11
+  :request payload: ``struct VhostUserGpuEdidRequest``
+  :reply payload: ``struct virtio_gpu_resp_edid`` (from virtio specification)
+
+  Retrieve the EDID data for a given scanout.
diff --git a/hw/display/vhost-user-gpu.c b/hw/display/vhost-user-gpu.c
index 71dfd956b8..a124e3847b 100644
--- a/hw/display/vhost-user-gpu.c
+++ b/hw/display/vhost-user-gpu.c
@@ -31,6 +31,7 @@ typedef enum VhostUserGpuRequest {
     VHOST_USER_GPU_UPDATE,
     VHOST_USER_GPU_DMABUF_SCANOUT,
     VHOST_USER_GPU_DMABUF_UPDATE,
+    VHOST_USER_GPU_GET_EDID,
 } VhostUserGpuRequest;
 
 typedef struct VhostUserGpuDisplayInfoReply {
@@ -78,6 +79,10 @@ typedef struct VhostUserGpuDMABUFScanout {
     int fd_drm_fourcc;
 } QEMU_PACKED VhostUserGpuDMABUFScanout;
 
+typedef struct VhostUserGpuEdidRequest {
+    uint32_t scanout_id;
+} QEMU_PACKED VhostUserGpuEdidRequest;
+
 typedef struct VhostUserGpuMsg {
     uint32_t request; /* VhostUserGpuRequest */
     uint32_t flags;
@@ -88,6 +93,8 @@ typedef struct VhostUserGpuMsg {
         VhostUserGpuScanout scanout;
         VhostUserGpuUpdate update;
         VhostUserGpuDMABUFScanout dmabuf_scanout;
+        VhostUserGpuEdidRequest edid_req;
+        struct virtio_gpu_resp_edid resp_edid;
         struct virtio_gpu_resp_display_info display_info;
         uint64_t u64;
     } payload;
@@ -184,6 +191,30 @@ vhost_user_gpu_handle_display(VhostUserGPU *g, VhostUserGpuMsg *msg)
         vhost_user_gpu_send_msg(g, &reply);
         break;
     }
+    case VHOST_USER_GPU_GET_EDID: {
+        VhostUserGpuEdidRequest *m = &msg->payload.edid_req;
+        struct virtio_gpu_resp_edid resp = { {} };
+        int fd = qemu_chr_fe_get_msgfd(&g->vhost_chr);
+        VhostUserGpuMsg reply = {
+            .request = msg->request,
+            .flags = VHOST_USER_GPU_MSG_FLAG_REPLY,
+            .size = sizeof(reply.payload.resp_edid),
+        };
+
+        if (m->scanout_id >= g->parent_obj.conf.max_outputs) {
+            error_report("invalid scanout: %d", m->scanout_id);
+            if (fd >= 0) {
+                close(fd);
+            }
+            break;
+        }
+
+        resp.hdr.type = VIRTIO_GPU_RESP_OK_EDID;
+        virtio_gpu_base_generate_edid(VIRTIO_GPU_BASE(g), m->scanout_id, &resp);
+        memcpy(&reply.payload.resp_edid, &resp, sizeof(resp));
+        vhost_user_gpu_send_msg(g, &reply);
+        break;
+    }
     case VHOST_USER_GPU_SCANOUT: {
         VhostUserGpuScanout *m = &msg->payload.scanout;
 
-- 
2.39.2


