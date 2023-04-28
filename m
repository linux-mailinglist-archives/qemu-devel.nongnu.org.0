Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D420D6F1CDD
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:49:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRH6-0001FK-24; Fri, 28 Apr 2023 12:48:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRH4-0001F4-Vo
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:46 -0400
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGo-0004pZ-UZ
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:46 -0400
Received: by mail-pl1-x62a.google.com with SMTP id
 d9443c01a7336-1a66e7a52d3so1530015ad.0
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:48:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682700509; x=1685292509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rNrifyDskB/bV5/21QEwj42N1dhNMhMfppMzoixVbHg=;
 b=coV54rDOK5w/8xLfhVn0bals0DcZmlayG9yxYXQneuMeky5/az8MC0Bbro5SiCMBWN
 SdUH7eKetcXyk+wdzB9Hd1JH71RGZBU2hI89f0oo9VmpRNiO/FAuD2fot6RWuuLBxBQW
 qTc3wWflaP5Iosbnm5mV2Zee/zYMVIdNnGP8o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700509; x=1685292509;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rNrifyDskB/bV5/21QEwj42N1dhNMhMfppMzoixVbHg=;
 b=G7vyN6Nxj2c3/dbv3pEqRk93B9iSbrngZCdGQ1YSs4i7FYoCVlmSRQt2TZkz3EmDrK
 JBjVm9mSDlco2TCA0b1ltCO7I01DqyU2MUoDT2SFlARRAKGva0jqnvWFlG5xPS+E7A+z
 F14lpSYV+k2sRUz6B1K/LYtBQpj9Jjl4ksq7ykOHm7+/Hi8jd8usmheizgHalO0OwVZY
 G++LC9cISHsobWvQbIApveMGEfvF0XwUkr39XpPLg9vDEu6HfI7j1Q/2s0GM5ZsTnCpq
 Gn7S+9LoNg64px0cupQ/nzp7OjK2W/sbo/72bvoazl6iln9PoqOdBHDF9NHKSEw33BI2
 3kEQ==
X-Gm-Message-State: AC+VfDwpTdmG8/6bImNCyyHpljvahI5Q2yFiUdRA/oe6qDtjBthXhwMy
 2djOTg7FuQh6KguWLMLqsejrnoNdTB372k/tYTY=
X-Google-Smtp-Source: ACHHUZ6ifQ+nxwNJ7vng3dxNw24V4ghjd6JxS7QjXYFNnLmpyZShZc/bECEgpVsereG4jEIVZyeu5A==
X-Received: by 2002:a17:903:ca:b0:1a8:1e36:b4b9 with SMTP id
 x10-20020a17090300ca00b001a81e36b4b9mr5146971plc.48.1682700508780; 
 Fri, 28 Apr 2023 09:48:28 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:fdc4:a664:d93b:43db])
 by smtp.gmail.com with ESMTPSA id
 jf19-20020a170903269300b001a2806ae2f7sm13566796plb.83.2023.04.28.09.48.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:48:28 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [PATCH v2 3/5] hw/display/virtio-gpu-virgl: define callbacks in
 realize function
Date: Fri, 28 Apr 2023 09:48:21 -0700
Message-Id: <20230428164823.789-3-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230428164823.789-1-gurchetansingh@google.com>
References: <20230428164823.789-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62a;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x62a.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

From: Gurchetan Singh <gurchetansingh@chromium.org>

This reduces the amount of renderer backend specific needed to
be exposed to the GL device.  We only need one realize function
per renderer backend.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v1: - Remove NULL inits (Philippe)
    - Use VIRTIO_GPU_BASE where possible (Philippe)
v2: - Fix unnecessary line break (Akihiko)

 hw/display/virtio-gpu-gl.c     | 15 ++++++---------
 hw/display/virtio-gpu-virgl.c  | 35 ++++++++++++++++++++++++----------
 include/hw/virtio/virtio-gpu.h |  7 -------
 3 files changed, 31 insertions(+), 26 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index 2d140e8792..cdc9483e4d 100644
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
@@ -31,16 +36,8 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
-    VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
-    VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
-
-    vbc->gl_flushed = virtio_gpu_virgl_flushed;
-    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
-    vgc->process_cmd = virtio_gpu_virgl_process_cmd;
-    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
 
-    vdc->realize = virtio_gpu_virgl_device_realize;
-    vdc->reset = virtio_gpu_virgl_reset;
+    vdc->realize = virtio_gpu_gl_device_realize;
     device_class_set_props(dc, virtio_gpu_gl_properties);
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 786351446c..d7e01f1c77 100644
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
 
-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
                                struct virtio_gpu_scanout *s,
                                uint32_t resource_id)
 {
@@ -660,14 +661,14 @@ void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
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
@@ -699,7 +700,7 @@ void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     virtio_gpu_virgl_fence_poll(g);
 }
 
-void virtio_gpu_virgl_reset(VirtIODevice *vdev)
+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
@@ -718,7 +719,21 @@ void virtio_gpu_virgl_reset(VirtIODevice *vdev)
 
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
@@ -736,9 +751,9 @@ void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
         return;
     }
 
-    g->parent_obj.conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
-    VIRTIO_GPU_BASE(g)->virtio_config.num_capsets =
-        virtio_gpu_virgl_get_num_capsets(g);
+    VIRTIO_GPU_BASE(gpudev)->conf.flags |= (1 << VIRTIO_GPU_FLAG_VIRGL_ENABLED);
+    VIRTIO_GPU_BASE(gpudev)->virtio_config.num_capsets =
+        virtio_gpu_virgl_get_num_capsets(gpudev);
 
     virtio_gpu_device_realize(qdev, errp);
 }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 89ee133f07..d5808f2ab6 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -277,13 +277,6 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
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
2.40.1.495.gc816e09b53d-goog


