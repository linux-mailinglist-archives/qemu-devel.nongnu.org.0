Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13C86EA0DF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:50 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKU-0002dU-F5; Thu, 20 Apr 2023 21:12:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKL-0002c3-Vg
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:42 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKI-0008Mj-NG
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:41 -0400
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-63b5ce4f069so2173746b3a.1
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039557; x=1684631557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hhHTLIfJpfuTUDeD8Y57brA0Bsbdi/Q3CGhvHbiGyKc=;
 b=Rb1DTRIbt4XIrq6XeCf60wGDJZMoyeZ0On8mjGsqsuLtkKW9ylzriLsCoE0qAWYL13
 xRyoZyDRuLzwlCj+eX9WnB0+/iU79xG2CQCTBwfrk9grGvM9IODjWkbfDclwraUUAw1r
 8MfH2fJ10RZJQK1gOx3/mSkZL/7/6FwnORabM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039557; x=1684631557;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hhHTLIfJpfuTUDeD8Y57brA0Bsbdi/Q3CGhvHbiGyKc=;
 b=Caf7qtxSgNiQzGSB94lsYdAms6OTobFpjemMU0hSmBeH+JW3b4hQHsj4A2anm+uZ2f
 BOh0Dwlum+4rG4bL+dPe2qtpTBP+BzkLeu/DvI8qEEBM9mtNSGI1cns/X2QVvnfvbzOH
 CdqbHF9GoGUNtCH0YxWjSLYmfr4zod4Htb/6YVjJcJub+HDDrC8u7uOon75KUib6tVN6
 +dQkwmco97qihd4axvoSpA/tRINGPuJ5Fg18dYTy2lRqbrryfdVWoNmKhFHw3COWcZTJ
 D2tMLwHsb/4jT1L1DRNFA1M/EXtck6+HzkQ30VxQjmNmOBuKgxz7e2I0xE2JNuGEw6Z9
 TWtA==
X-Gm-Message-State: AAQBX9eewDoYSHSh6vOgiGT8n5w4tdlpJBjyVK/6GS4dee9w5QluIl+t
 F+nBD9LeJu+XKikE0LqUQA5GpvgzO4CkXP1VxtehR7Ov
X-Google-Smtp-Source: AKy350bR8+LmuvrhRtj9zKLrbffGsdjt3iRA+eMEKbrP+v3oxKlvX1Ms8oSvfirPzsAJQu0IrIPg/Q==
X-Received: by 2002:a17:903:1c4:b0:1a2:9183:a49c with SMTP id
 e4-20020a17090301c400b001a29183a49cmr4169439plh.32.1682039556760; 
 Thu, 20 Apr 2023 18:12:36 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:36 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 06/13] gfxstream + rutabaga prep: make GL device more
 library agnostic
Date: Thu, 20 Apr 2023 18:12:16 -0700
Message-Id: <20230421011223.718-7-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Rather than create a virtio-gpu-gfxstream device and it's
associated variants (vga, pci), let's just extend the GL device.

We need to:
    - Move all virgl functions to their own file
    - Only all needed class callbacks in the generic GL device

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-gl.c     | 110 ------------------------------
 hw/display/virtio-gpu-virgl.c  | 119 +++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-gpu.h |  11 +--
 3 files changed, 120 insertions(+), 120 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index dc648aacb2..2d140e8792 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -15,122 +15,12 @@
 #include "qemu/iov.h"
 #include "qemu/module.h"
 #include "qemu/error-report.h"
-#include "qapi/error.h"
-#include "sysemu/sysemu.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
 #include "hw/virtio/virtio-gpu-bswap.h"
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
-#include <virglrenderer.h>
-
-static void
-virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
-                               struct virtio_gpu_scanout *s,
-                               uint32_t resource_id)
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
-static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
-{
-    VirtIOGPU *g = VIRTIO_GPU(b);
-
-    virtio_gpu_process_cmdq(g);
-}
-
-static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
-{
-    VirtIOGPU *g = VIRTIO_GPU(vdev);
-    VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
-    struct virtio_gpu_ctrl_command *cmd;
-
-    if (!virtio_queue_ready(vq)) {
-        return;
-    }
-
-    if (!gl->renderer_inited) {
-        virtio_gpu_virgl_init(g);
-        gl->renderer_inited = true;
-    }
-    if (gl->renderer_reset) {
-        gl->renderer_reset = false;
-        virtio_gpu_virglrenderer_reset(g);
-    }
-
-    cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
-    while (cmd) {
-        cmd->vq = vq;
-        cmd->error = 0;
-        cmd->finished = false;
-        QTAILQ_INSERT_TAIL(&g->cmdq, cmd, next);
-        cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
-    }
-
-    virtio_gpu_process_cmdq(g);
-    virtio_gpu_virgl_fence_poll(g);
-}
-
-static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
-{
-    VirtIOGPU *g = VIRTIO_GPU(vdev);
-    VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
-
-    virtio_gpu_reset(vdev);
-
-    /*
-     * GL functions must be called with the associated GL context in main
-     * thread, and when the renderer is unblocked.
-     */
-    if (gl->renderer_inited && !gl->renderer_reset) {
-        virtio_gpu_virgl_reset_scanout(g);
-        gl->renderer_reset = true;
-    }
-}
-
-static void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
-{
-    VirtIOGPU *g = VIRTIO_GPU(qdev);
-
-#if HOST_BIG_ENDIAN
-    error_setg(errp, "virgl is not supported on bigendian platforms");
-    return;
-#endif
-
-    if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {
-        error_setg(errp, "at most one %s device is permitted", TYPE_VIRTIO_GPU_GL);
-        return;
-    }
-
-    if (!display_opengl) {
-        error_setg(errp, "opengl is not available");
-        return;
-    }
-
-    g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
-    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
-        virtio_gpu_virgl_get_num_capsets(g);
-
-    virtio_gpu_device_realize(qdev, errp);
-}
-
 static Property virtio_gpu_gl_properties[] = {
     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index f91d33ce13..87eccb2b97 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -14,6 +14,8 @@
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
 #include "qemu/iov.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
 #include "trace.h"
 #include "hw/virtio/virtio.h"
 #include "hw/virtio/virtio-gpu.h"
@@ -584,12 +586,12 @@ static void virtio_gpu_fence_poll(void *opaque)
     }
 }
 
-void virtio_gpu_virgl_fence_poll(VirtIOGPU *g)
+static void virtio_gpu_virgl_fence_poll(VirtIOGPU *g)
 {
     virtio_gpu_fence_poll(g);
 }
 
-void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
+static void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
 {
     int i;
 
@@ -599,12 +601,12 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
     }
 }
 
-void virtio_gpu_virglrenderer_reset(VirtIOGPU *g)
+static void virtio_gpu_virglrenderer_reset(VirtIOGPU *g)
 {
     virgl_renderer_reset();
 }
 
-int virtio_gpu_virgl_init(VirtIOGPU *g)
+static int virtio_gpu_virgl_init(VirtIOGPU *g)
 {
     int ret;
 
@@ -625,7 +627,7 @@ int virtio_gpu_virgl_init(VirtIOGPU *g)
     return 0;
 }
 
-int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
+static int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
 {
     uint32_t capset2_max_ver, capset2_max_size;
     virgl_renderer_get_cap_set(VIRTIO_GPU_CAPSET_VIRGL2,
@@ -634,3 +636,110 @@ int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
 
     return capset2_max_ver ? 2 : 1;
 }
+
+void
+virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+                               struct virtio_gpu_scanout *s,
+                               uint32_t resource_id)
+{
+    uint32_t width, height;
+    uint32_t pixels, *data;
+
+    data = virgl_renderer_get_cursor_data(resource_id, &width, &height);
+    if (!data) {
+        return;
+    }
+
+    if (width != s->current_cursor->width ||
+        height != s->current_cursor->height) {
+        free(data);
+        return;
+    }
+
+    pixels = s->current_cursor->width * s->current_cursor->height;
+    memcpy(s->current_cursor->data, data, pixels * sizeof(uint32_t));
+    free(data);
+}
+
+void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
+{
+    VirtIOGPU *g = VIRTIO_GPU(b);
+
+    virtio_gpu_process_cmdq(g);
+}
+
+void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOGPU *g = VIRTIO_GPU(vdev);
+    VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
+    struct virtio_gpu_ctrl_command *cmd;
+
+    if (!virtio_queue_ready(vq)) {
+        return;
+    }
+
+    if (!gl->renderer_inited) {
+        virtio_gpu_virgl_init(g);
+        gl->renderer_inited = true;
+    }
+    if (gl->renderer_reset) {
+        gl->renderer_reset = false;
+        virtio_gpu_virglrenderer_reset(g);
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
+    virtio_gpu_virgl_fence_poll(g);
+}
+
+void virtio_gpu_virgl_reset(VirtIODevice *vdev)
+{
+    VirtIOGPU *g = VIRTIO_GPU(vdev);
+    VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
+
+    virtio_gpu_reset(vdev);
+
+    /*
+     * GL functions must be called with the associated GL context in main
+     * thread, and when the renderer is unblocked.
+     */
+    if (gl->renderer_inited && !gl->renderer_reset) {
+        virtio_gpu_virgl_reset_scanout(g);
+        gl->renderer_reset = true;
+    }
+}
+
+void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
+{
+    VirtIOGPU *g = VIRTIO_GPU(qdev);
+
+#if HOST_BIG_ENDIAN
+    error_setg(errp, "virgl is not supported on bigendian platforms");
+    return;
+#endif
+
+    if (!object_resolve_path_type("", TYPE_VIRTIO_GPU_GL, NULL)) {
+        error_setg(errp, "at most one %s device is permitted",
+                   TYPE_VIRTIO_GPU_GL);
+        return;
+    }
+
+    if (!display_opengl) {
+        error_setg(errp, "opengl is not available");
+        return;
+    }
+
+    g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
+    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
+        virtio_gpu_virgl_get_num_capsets(g);
+
+    virtio_gpu_device_realize(qdev, errp);
+}
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index e256e44172..7317b60004 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -295,10 +295,11 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
-void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
-void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
-void virtio_gpu_virglrenderer_reset(VirtIOGPU *g);
-int virtio_gpu_virgl_init(VirtIOGPU *g);
-int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
+void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct virtio_gpu_scanout *s,
+                                    uint32_t resource_id);
+void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);
+void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq);
+void virtio_gpu_virgl_reset(VirtIODevice *vdev);
+void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp);
 
 #endif
-- 
2.40.0.634.g4ca3ef3211-goog


