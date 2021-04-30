Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2290A36FA74
	for <lists+qemu-devel@lfdr.de>; Fri, 30 Apr 2021 14:38:49 +0200 (CEST)
Received: from localhost ([::1]:37038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lcSPw-0005gk-5h
	for lists+qemu-devel@lfdr.de; Fri, 30 Apr 2021 08:38:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRx-0000qZ-2w
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:51737)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kraxel@redhat.com>) id 1lcRRq-0001Yb-5r
 for qemu-devel@nongnu.org; Fri, 30 Apr 2021 07:36:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1619782601;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FxHTD7DL9VIpADnJyPky8JqIRzo8V34WM13UYnNOYsw=;
 b=c7XWgQWZY63AfnPzTWKDjDQe47OVc/0cOOBIPkMpOp84FGG9qW4dwkaWHVghsBqCIhXZb7
 HmGdwW3tWo+GDFpth7z3VsCgh/tz5hLZkItUfLkgMLP62y1QlcrS3XxFAms/hhEdG8xYig
 40mmrXQmQ2Pnk1oJaHWKF8zowsgBnO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-156-tCmcf0vcPyGajW96C4Gqcw-1; Fri, 30 Apr 2021 07:36:37 -0400
X-MC-Unique: tCmcf0vcPyGajW96C4Gqcw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10CAD80ED96;
 Fri, 30 Apr 2021 11:36:37 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-203.ams2.redhat.com
 [10.36.112.203])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A400C7013C;
 Fri, 30 Apr 2021 11:36:29 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 972261800795; Fri, 30 Apr 2021 13:35:47 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 09/16] virtio-gpu: move update_cursor_data
Date: Fri, 30 Apr 2021 13:35:40 +0200
Message-Id: <20210430113547.1816178-10-kraxel@redhat.com>
In-Reply-To: <20210430113547.1816178-1-kraxel@redhat.com>
References: <20210430113547.1816178-1-kraxel@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/virtio/virtio-gpu.h |  6 ++++++
 hw/display/virtio-gpu-gl.c     | 30 +++++++++++++++++++++++++++
 hw/display/virtio-gpu.c        | 38 ++++++----------------------------
 3 files changed, 42 insertions(+), 32 deletions(-)

diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 4ce39d2abb4c..cd55c2d07090 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -171,6 +171,9 @@ struct VirtIOGPUClass {
 
     void (*handle_ctrl)(VirtIODevice *vdev, VirtQueue *vq);
     void (*process_cmd)(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd);
+    void (*update_cursor_data)(VirtIOGPU *g,
+                               struct virtio_gpu_scanout *s,
+                               uint32_t resource_id);
 };
 
 struct VirtIOGPUGL {
@@ -230,6 +233,9 @@ void virtio_gpu_process_cmdq(VirtIOGPU *g);
 void virtio_gpu_device_realize(DeviceState *qdev, Error **errp);
 void virtio_gpu_reset(VirtIODevice *vdev);
 void virtio_gpu_simple_process_cmd(VirtIOGPU *g, struct virtio_gpu_ctrl_command *cmd);
+void virtio_gpu_update_cursor_data(VirtIOGPU *g,
+                                   struct virtio_gpu_scanout *s,
+                                   uint32_t resource_id);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 792cc0b41256..b4303cc5bb41 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -23,6 +23,35 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+#include <virglrenderer.h>
+
+static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
+                                             struct virtio_gpu_scanout *s,
+                                             uint32_t resource_id)
+{
+    uint32_t width, height;
+    uint32_t pixels, *data;
+
+    if (g->parent_obj.use_virgl_renderer) {
+        data = virgl_renderer_get_cursor_data(resource_id, &width, &height);
+        if (!data) {
+            return;
+        }
+
+        if (width != s->current_cursor->width ||
+            height != s->current_cursor->height) {
+            free(data);
+            return;
+        }
+
+        pixels = s->current_cursor->width * s->current_cursor->height;
+        memcpy(s->current_cursor->data, data, pixels * sizeof(uint32_t));
+        free(data);
+        return;
+    }
+    virtio_gpu_update_cursor_data(g, s, resource_id);
+}
+
 static void virtio_gpu_gl_process_cmd(VirtIOGPU *g,
                                       struct virtio_gpu_ctrl_command *cmd)
 {
@@ -127,6 +156,7 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
     vbc->gl_flushed = virtio_gpu_gl_flushed;
     vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
     vgc->process_cmd = virtio_gpu_gl_process_cmd;
+    vgc->update_cursor_data = virtio_gpu_gl_update_cursor_data;
 
     vdc->realize = virtio_gpu_gl_device_realize;
     vdc->reset = virtio_gpu_gl_reset;
diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index e61bfffa8019..2c0065277ffd 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -56,9 +56,9 @@ static void virtio_gpu_cleanup_mapping(VirtIOGPU *g,
     } while (0)
 #endif
 
-static void update_cursor_data_simple(VirtIOGPU *g,
-                                      struct virtio_gpu_scanout *s,
-                                      uint32_t resource_id)
+void virtio_gpu_update_cursor_data(VirtIOGPU *g,
+                                   struct virtio_gpu_scanout *s,
+                                   uint32_t resource_id)
 {
     struct virtio_gpu_simple_resource *res;
     uint32_t pixels;
@@ -79,36 +79,10 @@ static void update_cursor_data_simple(VirtIOGPU *g,
            pixels * sizeof(uint32_t));
 }
 
-#ifdef CONFIG_VIRGL
-
-static void update_cursor_data_virgl(VirtIOGPU *g,
-                                     struct virtio_gpu_scanout *s,
-                                     uint32_t resource_id)
-{
-    uint32_t width, height;
-    uint32_t pixels, *data;
-
-    data = virgl_renderer_get_cursor_data(resource_id, &width, &height);
-    if (!data) {
-        return;
-    }
-
-    if (width != s->current_cursor->width ||
-        height != s->current_cursor->height) {
-        free(data);
-        return;
-    }
-
-    pixels = s->current_cursor->width * s->current_cursor->height;
-    memcpy(s->current_cursor->data, data, pixels * sizeof(uint32_t));
-    free(data);
-}
-
-#endif
-
 static void update_cursor(VirtIOGPU *g, struct virtio_gpu_update_cursor *cursor)
 {
     struct virtio_gpu_scanout *s;
+    VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(g);
     bool move = cursor->hdr.type == VIRTIO_GPU_CMD_MOVE_CURSOR;
 
     if (cursor->pos.scanout_id >= g->parent_obj.conf.max_outputs) {
@@ -131,8 +105,7 @@ static void update_cursor(VirtIOGPU *g, struct virtio_gpu_update_cursor *cursor)
         s->current_cursor->hot_y = cursor->hot_y;
 
         if (cursor->resource_id > 0) {
-            VIRGL(g, update_cursor_data_virgl, update_cursor_data_simple,
-                  g, s, cursor->resource_id);
+            vgc->update_cursor_data(g, s, cursor->resource_id);
         }
         dpy_cursor_define(s->con, s->current_cursor);
 
@@ -1190,6 +1163,7 @@ static void virtio_gpu_class_init(ObjectClass *klass, void *data)
 
     vgc->handle_ctrl = virtio_gpu_handle_ctrl;
     vgc->process_cmd = virtio_gpu_simple_process_cmd;
+    vgc->update_cursor_data = virtio_gpu_update_cursor_data;
 
     vdc->realize = virtio_gpu_device_realize;
     vdc->reset = virtio_gpu_reset;
-- 
2.30.2


