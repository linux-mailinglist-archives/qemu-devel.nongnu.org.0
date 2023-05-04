Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 694636F7318
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:14:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pueNr-0005Ji-Gm; Thu, 04 May 2023 15:12:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNp-0005JD-EW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:53 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNn-0004cU-Ei
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:53 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-1aaea43def7so6035125ad.2
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 12:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683227569; x=1685819569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IkZhAJvgBkshK9N6Uzeoky1sgETu5dQvYJhTVnSs9n0=;
 b=G3SAleRn347XNNwM1+pg9Ph38E8Kygkr6w3cPjXpS2ODwqLhXov7Sg4+iBBflEMJJV
 oFmQ+hdMCvoIdQlhStrwr4m6+5M/Ya3CnFCyDipEEFbVicUaN3cm3TR4JYxzklGr2zT1
 jclR9przXi85UXyJGLDofzIU4gcv6jEPsrE48=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227569; x=1685819569;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IkZhAJvgBkshK9N6Uzeoky1sgETu5dQvYJhTVnSs9n0=;
 b=JMM3Z78+LagcjF90Sr8XulkUwXCRbVmGTPB5h5mtTlrc+REg0lEyHU+PgHHz8BPEoy
 JLb+cSeoC8U4ylCLSaAaTqyNl8mt9zuQi6n2PqMx0W+CJP4YxYx5Rdgn1UEnEzsEZpsu
 NpApJV9m+4yHR2R2uksurZm81IbCQm/uLYsHEzs/DvLUtTLz2yuBg9Hpe1PylMkItuI6
 LfVsQfdjz8LBrhxmdMEIKhJUuZpoQnUu9HRecQSCknE/Jb/JvcWoHogikOJ52FsLbEep
 2BOqlE91UN2UkzdVRZGMRVS+BtA60AidujNcw1jOimijsyUemxVGv4vs1KAT0+FaICjm
 7qlg==
X-Gm-Message-State: AC+VfDxBsayc98ro3nFgSZIWL3bKV16V5N5geIJERu5TZ9i4uBnfNtjM
 SIW+LSlcKVJA0yLb4//LnHNdMX8iFA+R4JOQtG4=
X-Google-Smtp-Source: ACHHUZ72iGt9xQaDivxrP8qeOUqpzQg29gktswmsdYtw/FYc79bVOAofIQlJxbJ/pDtG0MchCGj/IA==
X-Received: by 2002:a17:902:e808:b0:1a9:8d57:6d6c with SMTP id
 u8-20020a170902e80800b001a98d576d6cmr5755460plg.24.1683227569601; 
 Thu, 04 May 2023 12:12:49 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:4891:407:d4c8:7fa9])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001ab2a0733aasm2185980plg.39.2023.05.04.12.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 12:12:49 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org, shentey@gmail.com
Subject: [PATCH v3 2/5] hw/display/virtio-gpu-virgl: make GL device more
 library agnostic
Date: Thu,  4 May 2023 12:12:40 -0700
Message-Id: <20230504191243.746-3-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230504191243.746-1-gurchetansingh@chromium.org>
References: <20230504191243.746-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x62c.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.161,
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
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v2:
    - (Akihiko) Fix unnecessary line break
v3:
    - (Akihiko) Fix misaligned parameters

 hw/display/virtio-gpu-gl.c     | 109 ------------------------------
 hw/display/virtio-gpu-virgl.c  | 118 +++++++++++++++++++++++++++++++--
 include/hw/virtio/virtio-gpu.h |  11 +--
 3 files changed, 119 insertions(+), 119 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e8cbc652dc..2d140e8792 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -15,121 +15,12 @@
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
-static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
-                                           struct virtio_gpu_scanout *s,
-                                           uint32_t resource_id)
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
-        virtio_gpu_virgl_reset_renderer(g);
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
index ffe4ec7f3d..74e12d22b6 100644
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
 
-void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g)
+static void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g)
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
@@ -634,3 +636,109 @@ int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
 
     return capset2_max_ver ? 2 : 1;
 }
+
+void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+                                    struct virtio_gpu_scanout *s,
+                                    uint32_t resource_id)
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
+        virtio_gpu_virgl_reset_renderer(g);
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
index 21b0f55bc8..89ee133f07 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -279,10 +279,11 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
-void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
-void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
-void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g);
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
2.40.1.521.gf1e218fcd8-goog


