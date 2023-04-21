Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 17F0C6EA0E2
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:15:20 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKi-0002gm-Fs; Thu, 20 Apr 2023 21:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKM-0002c9-JX
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:42 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKJ-0008Mn-Ms
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:42 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1a66b9bd7dfso19135425ad.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039558; x=1684631558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ODhRNpYxDaUUcHw5UOrxy4qV9LqgrKicEwn5wh2863M=;
 b=jOf4LDSQp1Jpg1LoXVGkH1aKlMewJhPhkti4tnVjN0KLLPj340fjk0tIwSRhwMUPK6
 48bIxB1juxeDNFvGCBS5RcOkHo0yI6bTVBbDi1RovQ6lKUEC/57OGEfX34q/2K4PIVio
 tWYGwdQetL3zDKV3bWOnNCnq6ZGc3LWH7Bd2Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039558; x=1684631558;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ODhRNpYxDaUUcHw5UOrxy4qV9LqgrKicEwn5wh2863M=;
 b=TIm3mPwWtEl5frDa498Dy85bAUB8qyZSktyi0PaZMtjI9WKnM3ZFxrO8nAPkjqVZaa
 RVgghZea3ZJulO3SHu0eJAro1uqfyNcTNUtc8ett9Bj8VrVKTvQeS+Lhg1PwKAIE9BeU
 UnPnJUKd6KooaFzbdfbLgj3jFDLHA/4ZE16QW5J3yAuyiDonPWE0vNqb/UHnuKGzZN4S
 BEfyxePQiErIZhbA/NxMPgVkqoWNJ5rCUJ/2VxS02OatMyQWrFTV/oK6tc6eblg2GU1U
 20h3NRM1Lr+WiOxsiWgP0iZNNiDbGqL1JmCfmopDtYhN6vlKae5cdnM5FP0PqLATt+oy
 2h6w==
X-Gm-Message-State: AAQBX9cqQbDf5Tnl7OxrbhyXwa4/5aLX3cnbggiGHt9TVHbp8iS6VVBe
 2Bx0fAnZpdngDccqDukYNvrHRgTFIwOm2AZZt5mK4ZVx
X-Google-Smtp-Source: AKy350aVzE7JaanqumalpRY0wmTSwAG1QmZlAgjRbC5Dl700ZN5TjKLLQEQW2M5jzA3CfLJ/jrXEeg==
X-Received: by 2002:a17:902:f651:b0:1a2:85f0:e73d with SMTP id
 m17-20020a170902f65100b001a285f0e73dmr3623509plg.33.1682039558269; 
 Thu, 20 Apr 2023 18:12:38 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:38 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 07/13] gfxstream + rutabaga prep: define callbacks in
 realize function
Date: Thu, 20 Apr 2023 18:12:17 -0700
Message-Id: <20230421011223.718-8-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x635.google.com
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

This reduces the amount of renderer backend specific needed to
be exposed to the GL device.  We only need one realize function
per renderer backend.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-gl.c     | 17 +++++++++++------
 hw/display/virtio-gpu-virgl.c  | 35 ++++++++++++++++++++++++----------
 include/hw/virtio/virtio-gpu.h |  7 -------
 3 files changed, 36 insertions(+), 23 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 2d140e8792..547e697333 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -21,6 +21,11 @@
 #include "hw/virtio/virtio-gpu-pixman.h"
 #include "hw/qdev-properties.h"
 
+static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
+{
+    virtio_gpu_virgl_device_realize(qdev, errp);
+}
+
 static Property virtio_gpu_gl_properties[] = {
     DEFINE_PROP_BIT("stats", VirtIOGPU, parent_obj.conf.flags,
                     VIRTIO_GPU_FLAG_STATS_ENABLED, false),
@@ -34,13 +39,13 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
     VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
 
-    vbc->gl_flushed = virtio_gpu_virgl_flushed;
-    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
-    vgc->process_cmd = virtio_gpu_virgl_process_cmd;
-    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
+    vbc->gl_flushed = NULL;
+    vgc->handle_ctrl = NULL;
+    vgc->process_cmd = NULL;
+    vgc->update_cursor_data = NULL;
 
-    vdc->realize = virtio_gpu_virgl_device_realize;
-    vdc->reset = virtio_gpu_virgl_reset;
+    vdc->realize = virtio_gpu_gl_device_realize;
+    vdc->reset = NULL;
     device_class_set_props(dc, virtio_gpu_gl_properties);
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 87eccb2b97..5be288562d 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -401,8 +401,9 @@ static void virgl_cmd_get_capset(VirtIOGPU *g,
     g_free(resp);
 }
 
-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
-                                      struct virtio_gpu_ctrl_command *cmd)
+static void
+virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
+                             struct virtio_gpu_ctrl_command *cmd)
 {
     VIRTIO_GPU_FILL_CMD(cmd->cmd_hdr);
 
@@ -637,7 +638,7 @@ static int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
     return capset2_max_ver ? 2 : 1;
 }
 
-void
+static void
 virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
                                struct virtio_gpu_scanout *s,
                                uint32_t resource_id)
@@ -661,14 +662,14 @@ virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
     free(data);
 }
 
-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
 
     virtio_gpu_process_cmdq(g);
 }
 
-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
@@ -700,7 +701,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     virtio_gpu_virgl_fence_poll(g);
 }
 
-void virtio_gpu_virgl_reset(VirtIODevice *vdev)
+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
@@ -719,7 +720,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)
 
 void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
 {
-    VirtIOGPU *g = VIRTIO_GPU(qdev);
+    VirtIODevice *vdev = VIRTIO_DEVICE(qdev);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_GET_CLASS(vdev);
+
+    VirtIOGPUBase *bdev = VIRTIO_GPU_BASE(qdev);
+    VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_GET_CLASS(bdev);
+
+    VirtIOGPU *gpudev = VIRTIO_GPU(qdev);
+    VirtIOGPUClass *vgc = VIRTIO_GPU_GET_CLASS(gpudev);
+
+    vbc->gl_flushed = virtio_gpu_virgl_flushed;
+    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
+    vgc->process_cmd = virtio_gpu_virgl_process_cmd;
+    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
+
+    vdc->reset = virtio_gpu_virgl_reset;
 
 #if HOST_BIG_ENDIAN
     error_setg(errp, "virgl is not supported on bigendian platforms");
@@ -737,9 +752,9 @@ void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
         return;
     }
 
-    g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
-    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
-        virtio_gpu_virgl_get_num_capsets(g);
+    gpudev->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
+    VIRTIO_GPU_BASE(gpudev)->virtio_config.num_capsets =
+        virtio_gpu_virgl_get_num_capsets(gpudev);
 
     virtio_gpu_device_realize(qdev, errp);
 }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 7317b60004..421733d751 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -293,13 +293,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              struct virtio_gpu_rect *r);
 
 /* virtio-gpu-3d.c */
-void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
-                                  struct virtio_gpu_ctrl_command *cmd);
-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g, struct virtio_gpu_scanout *s,
-                                    uint32_t resource_id);
-void virtio_gpu_virgl_flushed(VirtIOGPUBase *b);
-void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq);
-void virtio_gpu_virgl_reset(VirtIODevice *vdev);
 void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp);
 
 #endif
-- 
2.40.0.634.g4ca3ef3211-goog


