Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1715E3BA093
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 14:34:27 +0200 (CEST)
Received: from localhost ([::1]:47000 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzING-0007Wj-5R
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 08:34:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lzILZ-00061b-EW
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:32:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27069)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1lzILV-0007IN-Un
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 08:32:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625229156;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xNLWJpdGdK8j3Wk1QAZT2eWh7nGpieQxuG2tONA9Hrg=;
 b=Npv/FN4A3eeInFac0V17KkzRCC875N4nYuHNc9Q5ugppsgbi70LLV9swNN39yUznPlDzEe
 PdnmHWt4xdXJNg4ph16RkRCi1l2nJ83Cqh/Dh0NMUiC2Wg44sMJMZEigCBKQD1MkS/9r4j
 Yh69I3l988M6XOekQXaJqylWJ7UygFM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-GXpnMA3YOGKm7Nsf0bGnHQ-1; Fri, 02 Jul 2021 08:32:33 -0400
X-MC-Unique: GXpnMA3YOGKm7Nsf0bGnHQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26C7D1966323
 for <qemu-devel@nongnu.org>; Fri,  2 Jul 2021 12:32:33 +0000 (UTC)
Received: from localhost (unknown [10.36.110.34])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 313D7179B3;
 Fri,  2 Jul 2021 12:32:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH] hw/display: fix virgl reset regression
Date: Fri,  2 Jul 2021 16:32:21 +0400
Message-Id: <20210702123221.942432-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=marcandre.lureau@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.377,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 kraxel@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Before commit 49afbca3b00e8e517d54964229a794b51768deaf ("virtio-gpu: drop
use_virgl_renderer"), use_virgl_renderer was preventing calling GL
functions from non-GL context threads. The innocuously looking

  g->parent_obj.use_virgl_renderer = false;

was set the first time virtio_gpu_gl_reset() was called, during
pc_machine_reset() in the main thread. Further virtio_gpu_gl_reset()
calls in IO threads, without associated GL context, were thus skipping
GL calls and avoided warnings or crashes (see also
https://gitlab.freedesktop.org/virgl/virglrenderer/-/issues/226).

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 +
 hw/display/virtio-gpu-gl.c     | 22 +++++++++++-----------
 hw/display/virtio-gpu-virgl.c  |  8 ++++++--
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index bcf54d970f..24c6628944 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -279,6 +279,7 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
+void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
 void virtio_gpu_virgl_reset(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index c973d4824b..2bf5e568f1 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -53,12 +53,7 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
 static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
-    VirtIOGPUGL *gl = VIRTIO_GPU_GL(b);
 
-    if (gl->renderer_reset) {
-        gl->renderer_reset = false;
-        virtio_gpu_virgl_reset(g);
-    }
     virtio_gpu_process_cmdq(g);
 }
 
@@ -76,6 +71,10 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         virtio_gpu_virgl_init(g);
         gl->renderer_inited = true;
     }
+    if (gl->renderer_reset) {
+        gl->renderer_reset = false;
+        virtio_gpu_virgl_reset(g);
+    }
 
     cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
     while (cmd) {
@@ -97,12 +96,13 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
 
     virtio_gpu_reset(vdev);
 
-    if (gl->renderer_inited) {
-        if (g->parent_obj.renderer_blocked) {
-            gl->renderer_reset = true;
-        } else {
-            virtio_gpu_virgl_reset(g);
-        }
+    /*
+     * GL functions must be called with the associated GL context in main
+     * thread, and when the renderer is unblocked.
+     */
+    if (gl->renderer_inited && !gl->renderer_reset) {
+        virtio_gpu_virgl_reset_scanout(g);
+        gl->renderer_reset = true;
     }
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 46b56f94d9..0d87de65d7 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -588,17 +588,21 @@ void virtio_gpu_virgl_fence_poll(VirtIOGPU *g)
     virtio_gpu_fence_poll(g);
 }
 
-void virtio_gpu_virgl_reset(VirtIOGPU *g)
+void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
 {
     int i;
 
-    virgl_renderer_reset();
     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
         dpy_gfx_replace_surface(g->parent_obj.scanout[i].con, NULL);
         dpy_gl_scanout_disable(g->parent_obj.scanout[i].con);
     }
 }
 
+void virtio_gpu_virgl_reset(VirtIOGPU *g)
+{
+    virgl_renderer_reset();
+}
+
 int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
-- 
2.29.0


