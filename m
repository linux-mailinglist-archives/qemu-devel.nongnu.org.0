Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5563D3462
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Jul 2021 08:00:09 +0200 (CEST)
Received: from localhost ([::1]:34532 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m6oEC-0003fe-Kl
	for lists+qemu-devel@lfdr.de; Fri, 23 Jul 2021 02:00:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9p-000303-8V
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:33867)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1m6o9n-0006hA-AW
 for qemu-devel@nongnu.org; Fri, 23 Jul 2021 01:55:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627019734;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rQyvkW9pZCFFgonFEw8wsPI835V3q7Yl0+6w7Wgrz/8=;
 b=UN3XCwRLcYIPJ3JCFMdplMyEXnHtEVA6LywwPYN/o1dO+141yzicxlOACpygdm3OrktYQq
 MhLEs8o8/QWl0EZvIRr3UFdkWFlmuboBTs5bCyEhmPQCdPwDD3GLuJJOyhwWPkl/la9jIr
 dg/fBZzLS2DvXeDcnv2nMdXnbfwX2qE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-hfe1m3EUNEC_LcdQ8OxgtQ-1; Fri, 23 Jul 2021 01:55:32 -0400
X-MC-Unique: hfe1m3EUNEC_LcdQ8OxgtQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 6C212875048
 for <qemu-devel@nongnu.org>; Fri, 23 Jul 2021 05:55:31 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-114-106.ams2.redhat.com
 [10.36.114.106])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 0120D5C1D1;
 Fri, 23 Jul 2021 05:55:21 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 2574F18009E7; Fri, 23 Jul 2021 07:54:49 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 6/6] hw/display: fix virgl reset regression
Date: Fri, 23 Jul 2021 07:54:48 +0200
Message-Id: <20210723055448.1032115-7-kraxel@redhat.com>
In-Reply-To: <20210723055448.1032115-1-kraxel@redhat.com>
References: <20210723055448.1032115-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kraxel@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kraxel@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.472,
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
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>
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
Message-Id: <20210702123221.942432-1-marcandre.lureau@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 +
 hw/display/virtio-gpu-gl.c     | 22 +++++++++++-----------
 hw/display/virtio-gpu-virgl.c  |  8 ++++++--
 3 files changed, 18 insertions(+), 13 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index bcf54d970f24..24c6628944ea 100644
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
index b1035e119c3b..6cc4313b1af2 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -51,12 +51,7 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
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
 
@@ -74,6 +69,10 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         virtio_gpu_virgl_init(g);
         gl->renderer_inited = true;
     }
+    if (gl->renderer_reset) {
+        gl->renderer_reset = false;
+        virtio_gpu_virgl_reset(g);
+    }
 
     cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
     while (cmd) {
@@ -95,12 +94,13 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
 
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
index 092c6dc380d9..18d054922fea 100644
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
2.31.1


