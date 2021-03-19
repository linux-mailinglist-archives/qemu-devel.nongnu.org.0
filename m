Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8415341B84
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 12:31:06 +0100 (CET)
Received: from localhost ([::1]:46602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lNDLN-0003y4-Lx
	for lists+qemu-devel@lfdr.de; Fri, 19 Mar 2021 07:31:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34312)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCm-0000AY-1D
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23017)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lNDCi-0007mW-26
 for qemu-devel@nongnu.org; Fri, 19 Mar 2021 07:22:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616152927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ1JBrLBxe9EHq3xWl9922BvWfAX+kOOzzkjmeLFekE=;
 b=V7z8R9OWEGqz27E8R8mCjosqqX940+oYRNPt6zc6Hd422VgAXzaZQtguF93ySCcIN1eNal
 NWujIH6KUfKrleX9MgO4S1hF7djCkD9xutSNNvdbnWMf3dJBTggVPmD6BMp+PqzV7oq8dc
 gzMfo2yYxk1ox8t9OS7ghD8ZzKBJ7OA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-568-K7eOJnMrMTG_74y3RYq34Q-1; Fri, 19 Mar 2021 07:22:05 -0400
X-MC-Unique: K7eOJnMrMTG_74y3RYq34Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4610483DD25;
 Fri, 19 Mar 2021 11:22:04 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-41.ams2.redhat.com
 [10.36.112.41])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 29F1D60C13;
 Fri, 19 Mar 2021 11:21:59 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 8EFF11800798; Fri, 19 Mar 2021 12:21:48 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/15] virtio-gpu: move fields to struct VirtIOGPUGL
Date: Fri, 19 Mar 2021 12:21:47 +0100
Message-Id: <20210319112147.4138943-16-kraxel@redhat.com>
In-Reply-To: <20210319112147.4138943-1-kraxel@redhat.com>
References: <20210319112147.4138943-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.251,
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 vivek.kasireddy@intel.com, tina.zhang@intel.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move two virglrenderer state variables to struct VirtIOGPUGL.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  5 +++--
 hw/display/virtio-gpu-gl.c     | 15 +++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 9629885c895f..0a8281aeb555 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -151,8 +151,6 @@ struct VirtIOGPU {
     uint64_t hostmem;
 
     bool processing_cmdq;
-    bool renderer_inited;
-    bool renderer_reset;
     QEMUTimer *fence_poll;
     QEMUTimer *print_stats;
 
@@ -177,6 +175,9 @@ struct VirtIOGPUClass {
 
 struct VirtIOGPUGL {
     struct VirtIOGPU parent_obj;
+
+    bool renderer_inited;
+    bool renderer_reset;
 };
 
 struct VhostUserGPU {
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 1642a973549e..d971b480806a 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -51,9 +51,10 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
 static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
+    VirtIOGPUGL *gl = VIRTIO_GPU_GL(b);
 
-    if (g->renderer_reset) {
-        g->renderer_reset = false;
+    if (gl->renderer_reset) {
+        gl->renderer_reset = false;
         virtio_gpu_virgl_reset(g);
     }
     virtio_gpu_process_cmdq(g);
@@ -62,15 +63,16 @@ static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
 static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
+    VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
     struct virtio_gpu_ctrl_command *cmd;
 
     if (!virtio_queue_ready(vq)) {
         return;
     }
 
-    if (!g->renderer_inited) {
+    if (!gl->renderer_inited) {
         virtio_gpu_virgl_init(g);
-        g->renderer_inited = true;
+        gl->renderer_inited = true;
     }
 
     cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
@@ -89,12 +91,13 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 static void virtio_gpu_gl_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
+    VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
 
     virtio_gpu_reset(vdev);
 
-    if (g->renderer_inited) {
+    if (gl->renderer_inited) {
         if (g->parent_obj.renderer_blocked) {
-            g->renderer_reset = true;
+            gl->renderer_reset = true;
         } else {
             virtio_gpu_virgl_reset(g);
         }
-- 
2.30.2


