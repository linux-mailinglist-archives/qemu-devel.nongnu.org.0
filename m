Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E4FC836FAB0
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:42:01 +0200 (CEST)
Received: from localhost ([::1]:45122 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcST2-0000ah-Vz
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:42:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSQ-0001ED-RM
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51796)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRSF-0001ky-Mk
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:37:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AJ1JBrLBxe9EHq3xWl9922BvWfAX+kOOzzkjmeLFekE=;
 b=Xc0RM4pKyb8q+wMj0N6sd8xbvzqe1wNrnHSixCl6n5UT9wrb9xJ8g/b4dX5ESiXfZIlq70
 Aaek8OYH8BCCYbDshr8sGVqdtDxdOaMk0JP5rSJEDZgM2zhMYKbDbvVNCQMK0SJx3Uj0Fw
 80iwx29HGIzFszsGwMhmqD1cZmO9ekM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-450-YU8IWIe3MriBOPhSt9YN2Q-1; Fri, 30 Apr 2021 07:37:00 -0400
X-MC-Unique: YU8IWIe3MriBOPhSt9YN2Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 748B5107ACC7;
 Fri, 30 Apr 2021 11:36:59 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 751691007607;
 Fri, 30 Apr 2021 11:36:52 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id CB27B18007A1; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 13/16] virtio-gpu: move fields to struct VirtIOGPUGL
Date: Fri, 30 Apr 2021 13:35:44 +0200
Message-Id: <20210430113547.1816178-14-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
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


