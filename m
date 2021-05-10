Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09167378CDA
	for <lists+qemu-devel@lfdr.de>; Mon, 10 May 2021 15:35:04 +0200 (CEST)
Received: from localhost ([::1]:56558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lg63r-0000xx-0U
	for lists+qemu-devel@lfdr.de; Mon, 10 May 2021 09:35:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50370)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5s7-0006UX-84
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:56 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51472)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lg5s5-0003RT-BW
 for qemu-devel@nongnu.org; Mon, 10 May 2021 09:22:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1620652972;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6ZU/1pzeU4eYN65GTCvjt1PcDlUcAiFmFl5AfAhh71g=;
 b=YrQ3+/OpeDh9vvQ4QkYx/ldItevK3QmCZ1nHUGa3xBkkIyA/hYfWw7BOdOD70CeOu+bGBf
 ZeqTesvvHr6da3H3/cr+yQfxEy5uk4EZsJE7NkstgeTXTqbT/zK45SDk+3ufTmQ5Ux3XbL
 olVUhAy9Nuuy851cp7MsWfJb4d1CRUw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-550-DgSdluCjMqSP-wNKi518nw-1; Mon, 10 May 2021 09:22:51 -0400
X-MC-Unique: DgSdluCjMqSP-wNKi518nw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 448B0805F0B
 for <qemu-devel@nongnu.org>; Mon, 10 May 2021 13:22:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-11.ams2.redhat.com
 [10.36.112.11])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 5D4532C6FB;
 Mon, 10 May 2021 13:22:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 4E76B1800901; Mon, 10 May 2021 15:20:52 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 22/25] virtio-gpu: move fields to struct VirtIOGPUGL
Date: Mon, 10 May 2021 15:20:48 +0200
Message-Id: <20210510132051.2208563-23-kraxel@redhat.com>
In-Reply-To: <20210510132051.2208563-1-kraxel@redhat.com>
References: <20210510132051.2208563-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.698,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move two virglrenderer state variables to struct VirtIOGPUGL.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Message-id: 20210430113547.1816178-1-kraxel@redhat.com
Message-Id: <20210430113547.1816178-14-kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  5 +++--
 hw/display/virtio-gpu-gl.c     | 15 +++++++++------
 2 files changed, 12 insertions(+), 8 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 0d402aef7c53..8ca2c55d9abb 100644
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
2.31.1


