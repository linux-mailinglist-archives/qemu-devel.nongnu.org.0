Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F3B9736FAFF
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:56:27 +0200 (CEST)
Received: from localhost ([::1]:35394 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSh1-0003Ii-1R
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:56:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44450)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRr-0000j9-0l
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:43 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:37733)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRh-0001VR-Al
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782591;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=flG4vCcohiYPuPddxsmca0eoSsF3ZLP6wMrnLYWqORw=;
 b=eh4jPtjqYz5N+F01Xihl7dOc//VRXIg5j7KqzouLH1mFEGxK+sZDYPlCvgDVsND705lNGB
 0gXTCTDkw3N7BXPv1bJW8tdMnLmL+DSaQu5bHqG/tSf3ZSxLabT0RLmFudezvsXH5ViHMm
 8TSQjxBXKpQqckCOYm7oitZY/uRbmIk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-203-566G8KtmObm4Vvjsd-tdxA-1; Fri, 30 Apr 2021 07:36:29 -0400
X-MC-Unique: 566G8KtmObm4Vvjsd-tdxA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 11853501F8;
 Fri, 30 Apr 2021 11:36:28 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id ACFDA5B684;
 Fri, 30 Apr 2021 11:36:24 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 87BCD1800794; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/16] virtio-gpu: move virgl process_cmd
Date: Fri, 30 Apr 2021 13:35:39 +0200
Message-Id: <20210430113547.1816178-9-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
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
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 include/hw/virtio/virtio-gpu.h |  2 ++
 hw/display/virtio-gpu-gl.c     | 11 +++++++++++
 hw/display/virtio-gpu.c        |  9 +++++----
 3 files changed, 18 insertions(+), 4 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 380aa7dd6322..4ce39d2abb4c 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -170,6 +170,7 @@ struct VirtIOGPUClass {
     VirtIOGPUBaseClass parent;
 
     void (*handle_ctrl)(VirtIODevice *vdev, VirtQueue *vq);
+    void (*process_cmd)(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd);
 };
 
 struct VirtIOGPUGL {
@@ -228,6 +229,7 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
+void virtio_gpu_simple_process_cmd(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e976fb8d04c4..792cc0b41256 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,6 +23,16 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_process_cmd(VirtIOGPU *g,
+                                      struct virtio_gpu_ctrl_command *cmd)
+{
+    if (g->parent_obj.use_virgl_renderer) {
+        virtio_gpu_virgl_process_cmd(g, cmd);
+        return;
+    }
+    virtio_gpu_simple_process_cmd(g, cmd);
+}
+
 static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
@@ -116,6 +126,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 
     vbc->gl_flushed = virtio_gpu_gl_flushed;
     vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
+    vgc->process_cmd = virtio_gpu_gl_process_cmd;
 
     vdc->realize = virtio_gpu_gl_device_realize;
     vdc->reset = virtio_gpu_gl_reset;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index ae80519c7356..e61bfffa8019 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -747,8 +747,8 @@ virtio_gpu_resource_detach_backing(VirtIOGPU *g,
     virtio_gpu_cleanup_mapping(g, res);
 }
 
-static void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
-                                          struct virtio_gpu_ctrl_command *cmd)
+void virtio_gpu_simple_process_cmd(VirtIOGPU *g,
+                                   struct virtio_gpu_ctrl_command *cmd)
 {
     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
     virtio_gpu_ctrl_hdr_bswap(&cmd->cmd_hdr);
@@ -806,6 +806,7 @@ static void virtio_gpu_handle_cursor_cb(VirtIODevice *vdev, VirtQueue *vq)
 void virtio_gpu_process_cmdq(VirtIOGPU *g)
 {
     struct virtio_gpu_ctrl_command *cmd;
+    VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
 
     if (g->processing_cmdq) {
         return;
@@ -819,8 +820,7 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g)
         }
 
         /* process command */
-        VIRGL(g, virtio_gpu_virgl_process_cmd, virtio_gpu_simple_process_cmd,
-              g, cmd);
+        vgc->process_cmd(g, cmd);
 
         QTAILQ_REMOVE(&g->cmdq, cmd, next);
         if (virtio_gpu_stats_enabled(g->parent_obj.conf)) {
@@ -1189,6 +1189,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
 
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
+    vgc->process_cmd = virtio_gpu_simple_process_cmd;
 
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
-- 
2.30.2


