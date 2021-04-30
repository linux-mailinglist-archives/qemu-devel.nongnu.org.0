Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F01636F9FD
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:18:31 +0200 (CEST)
Received: from localhost ([::1]:52038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcS6I-0004u3-E0
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:18:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRS4-000169-FF
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:47993)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRS2-0001f3-Cg
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782613;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=jrkxG63TNThk+XeYHZrBXUFuTeY0glajiLouqEzD6Bs=;
 b=J6FMWb72l5zteWD0Lw9JH2q8rrn8sak41Zv9m+/91Nvf5vMMTiRsVpMCTPEpfUKk5rRFhq
 OhqR7ZTW4oDqlZ4FCx6x8+C3VFCaEbpOlkdAqVziA+Nb/cnQjuO3u0huSbxWLCzfG5IGfQ
 YToQ3GLer1k/rqttNxBqXVusr4ii7Jc=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-N9mEo93COO2D9O7frzVRow-1; Fri, 30 Apr 2021 07:36:51 -0400
X-MC-Unique: N9mEo93COO2D9O7frzVRow-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CBF3A107ACC7;
 Fri, 30 Apr 2021 11:36:50 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id E6C038D5A6;
 Fri, 30 Apr 2021 11:36:39 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id BE08E180079E; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 12/16] virtio-gpu: drop use_virgl_renderer
Date: Fri, 30 Apr 2021 13:35:43 +0200
Message-Id: <20210430113547.1816178-13-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
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

Now that we have separated the gl and non-gl code flows to two different
devices there is little reason turn on and off virglrenderer usage at
runtime.  The gl code can simply use virglrenderer unconditionally.

So drop use_virgl_renderer field and just do that.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  1 -
 hw/display/virtio-gpu-base.c   |  6 +----
 hw/display/virtio-gpu-gl.c     | 44 ++++++++++------------------------
 3 files changed, 14 insertions(+), 37 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index cd55c2d07090..9629885c895f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -111,7 +111,6 @@ struct VirtIOGPUBase {
     struct virtio_gpu_config virtio_config;
     const GraphicHwOps *hw_ops;
 
-    bool use_virgl_renderer;
     int renderer_blocked;
     int enable;
 
diff --git a/hw/display/virtio-gpu-base.c b/hw/display/virtio-gpu-base.c
index 25f8920fdb67..afb3ee7d9afc 100644
--- a/hw/display/virtio-gpu-base.c
+++ b/hw/display/virtio-gpu-base.c
@@ -25,7 +25,6 @@ virtio_gpu_base_reset(VirtIOGPUBase *g)
     int i;
 
     g->enable = 0;
-    g->use_virgl_renderer = false;
 
     for (i = 0; i < g->conf.max_outputs; i++) {
         g->scanout[i].resource_id = 0;
@@ -162,7 +161,6 @@ virtio_gpu_base_device_realize(DeviceState *qdev,
         return false;
     }
 
-    g->use_virgl_renderer = false;
     if (virtio_gpu_virgl_enabled(g->conf)) {
         error_setg(&g->migration_blocker, "virgl is not yet migratable");
         if (migrate_add_blocker(g->migration_blocker, errp) < 0) {
@@ -218,10 +216,8 @@ static void
 virtio_gpu_base_set_features(VirtIODevice *vdev, uint64_t features)
 {
     static const uint32_t virgl = (1 << VIRTIO_GPU_F_VIRGL);
-    VirtIOGPUBase *g = VIRTIO_GPU_BASE(vdev);
 
-    g->use_virgl_renderer = ((features & virgl) == virgl);
-    trace_virtio_gpu_features(g->use_virgl_renderer);
+    trace_virtio_gpu_features(((features & virgl) == virgl));
 }
 
 static void
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index b4303cc5bb41..1642a973549e 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -32,34 +32,20 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
     uint32_t width, height;
     uint32_t pixels, *data;
 
-    if (g->parent_obj.use_virgl_renderer) {
-        data = virgl_renderer_get_cursor_data(resource_id, &width, &height);
-        if (!data) {
-            return;
-        }
+    data = virgl_renderer_get_cursor_data(resource_id, &width, &height);
+    if (!data) {
+        return;
+    }
 
-        if (width != s->current_cursor->width ||
-            height != s->current_cursor->height) {
-            free(data);
-            return;
-        }
-
-        pixels = s->current_cursor->width * s->current_cursor->height;
-        memcpy(s->current_cursor->data, data, pixels * sizeof(uint32_t));
+    if (width != s->current_cursor->width ||
+        height != s->current_cursor->height) {
         free(data);
         return;
     }
-    virtio_gpu_update_cursor_data(g, s, resource_id);
-}
 
-static void virtio_gpu_gl_process_cmd(VirtIOGPU *g,
-                                      struct virtio_gpu_ctrl_command *cmd)
-{
-    if (g->parent_obj.use_virgl_renderer) {
-        virtio_gpu_virgl_process_cmd(g, cmd);
-        return;
-    }
-    virtio_gpu_simple_process_cmd(g, cmd);
+    pixels = s->current_cursor->width * s->current_cursor->height;
+    memcpy(s->current_cursor->data, data, pixels * sizeof(uint32_t));
+    free(data);
 }
 
 static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
@@ -82,7 +68,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
         return;
     }
 
-    if (!g->renderer_inited && g->parent_obj.use_virgl_renderer) {
+    if (!g->renderer_inited) {
         virtio_gpu_virgl_init(g);
         g->renderer_inited = true;
     }
@@ -97,10 +83,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     }
 
     virtio_gpu_process_cmdq(g);
-
-    if (g->parent_obj.use_virgl_renderer) {
-        virtio_gpu_virgl_fence_poll(g);
-    }
+    virtio_gpu_virgl_fence_poll(g);
 }
 
 static void virtio_gpu_gl_reset(VirtIODevice *vdev)
@@ -109,13 +92,12 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
 
     virtio_gpu_reset(vdev);
 
-    if (g->parent_obj.use_virgl_renderer) {
+    if (g->renderer_inited) {
         if (g->parent_obj.renderer_blocked) {
             g->renderer_reset = true;
         } else {
             virtio_gpu_virgl_reset(g);
         }
-        g->parent_obj.use_virgl_renderer = false;
     }
 }
 
@@ -155,7 +137,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 
     vbc->gl_flushed = virtio_gpu_gl_flushed;
     vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
-    vgc->process_cmd = virtio_gpu_gl_process_cmd;
+    vgc->process_cmd = virtio_gpu_virgl_process_cmd;
     vgc->update_cursor_data = virtio_gpu_gl_update_cursor_data;
 
     vdc->realize = virtio_gpu_gl_device_realize;
-- 
2.30.2


