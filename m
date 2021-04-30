Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926C636FAFB
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:54:32 +0200 (CEST)
Received: from localhost ([::1]:55172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSf9-0008Bz-IT
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:54:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRc-0000by-TU
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRb-0001PI-28
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zN5UnJ+pYx/PpNMhGlBA6xMrw9ZYFiFztsTIti1deVI=;
 b=eMLSsKvWdQ+iKYgw2l5+a73tStPXZvRGYPOngm66MMY/b8US4Grrtp0yselug3uhwegUoH
 /tYQrPzAFjiKz1bV43NdS+CPmEBRVLdjk8xVsG2y8j6xY3KS5oerHI7v9MMsUrak+sRJ8r
 0u6hXkbenvYBIwKALQ+D2fT1zL+GUjs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-417-G6PucNCUNVS7nU9BD6FZgg-1; Fri, 30 Apr 2021 07:36:20 -0400
X-MC-Unique: G6PucNCUNVS7nU9BD6FZgg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 42F271922965;
 Fri, 30 Apr 2021 11:36:19 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E3D576E71D;
 Fri, 30 Apr 2021 11:36:17 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 6B97D180078D; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 06/16] virtio-gpu: move virgl handle_ctrl
Date: Fri, 30 Apr 2021 13:35:37 +0200
Message-Id: <20210430113547.1816178-7-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.22,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, tina.zhang@intel.com,
 Gerd Hoffmann <kraxel@redhat.com>, vivek.kasireddy@intel.com,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 hw/display/virtio-gpu-gl.c | 33 +++++++++++++++++++++++++++++++++
 hw/display/virtio-gpu.c    | 13 -------------
 2 files changed, 33 insertions(+), 13 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index c3e562f835f7..6d0ce5bcd6f1 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,6 +23,36 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOGPU *g = VIRTIO_GPU(vdev);
+    struct virtio_gpu_ctrl_command *cmd;
+
+    if (!virtio_queue_ready(vq)) {
+        return;
+    }
+
+    if (!g->renderer_inited && g->parent_obj.use_virgl_renderer) {
+        virtio_gpu_virgl_init(g);
+        g->renderer_inited = true;
+    }
+
+    cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
+    while (cmd) {
+        cmd->vq = vq;
+        cmd->error = 0;
+        cmd->finished = false;
+        QTAILQ_INSERT_TAIL(&g->cmdq, cmd, next);
+        cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
+    }
+
+    virtio_gpu_process_cmdq(g);
+
+    if (g->parent_obj.use_virgl_renderer) {
+        virtio_gpu_virgl_fence_poll(g);
+    }
+}
+
 static void virtio_gpu_gl_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
@@ -70,6 +100,9 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+    VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
+
+    vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
 
     vdc->realize = virtio_gpu_gl_device_realize;
     vdc->reset = virtio_gpu_gl_reset;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 39ef22b7c08d..5901e09bcd81 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -865,13 +865,6 @@ static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-#ifdef CONFIG_VIRGL
-    if (!g->renderer_inited && g->parent_obj.use_virgl_renderer) {
-        virtio_gpu_virgl_init(g);
-        g->renderer_inited = true;
-    }
-#endif
-
     cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
     while (cmd) {
         cmd->vq = vq;
@@ -882,12 +875,6 @@ static void virtio_gpu_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     virtio_gpu_process_cmdq(g);
-
-#ifdef CONFIG_VIRGL
-    if (g->parent_obj.use_virgl_renderer) {
-        virtio_gpu_virgl_fence_poll(g);
-    }
-#endif
 }
 
 static void virtio_gpu_ctrl_bh(void *opaque)
-- 
2.30.2


