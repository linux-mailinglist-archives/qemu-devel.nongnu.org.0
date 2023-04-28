Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 31FBC6F1092
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 04:54:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psEEX-0005Az-8G; Thu, 27 Apr 2023 22:53:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEET-00058z-PQ
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:53:14 -0400
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEEG-0005c5-Bv
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:53:13 -0400
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-63b5c4c769aso11525901b3a.3
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 19:52:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682650378; x=1685242378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=TZqPd7u2XXz3mMLpqFhpURPW660IkzAZgJW1g8HivYM=;
 b=U8u+TZ/hNJXBH1Nn5MPLjrVua4PjPegGWkKzgApDxnlTm1lFtvIXbyuInRNVXo6wVE
 4lHnP0xk02bKk1B56NjR+kOrD6MjpwK1ugbc2Ke6tmaQ/ZfLdMzeW7+IRl493F3haNWu
 pOpEgiler0l02wzNkZafI3bXuGvD2sBQ2FmgM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682650378; x=1685242378;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TZqPd7u2XXz3mMLpqFhpURPW660IkzAZgJW1g8HivYM=;
 b=dlXqirkYdDcAvgPAwfX4mgeYeYcrfy2D5nyKLxh0iHRxBB4YaO3VybIoB+ONN1r45F
 1llmMOibD4zzZrMRXOXiJ/tkPYgwXT83FVs24hC+qAh73Of74s2H2nJXP9bqNMgsPkd0
 VXlS7M1m3fMmCAmPv9zuvHzenc1lBTD0CEiLDfOgRl0YpU9HI2doEgaPW/VTyflm7T/b
 NvPObAiTCbs9B+BOAzNXscVQqqnTR/kgCiFSnrCG5lRARh6AmczqywCwJMBhiWPkI/Cb
 g8odYUCtCqi5AEJ/L1/KH+e+oYnFU50rt1S2NgyQmEqWV2kPH63/QDUsfvMbmSfravV8
 Yo1w==
X-Gm-Message-State: AC+VfDz8u7DSbMS11Q9P1wTR8NFSqIz/oaMxtUuyPsjQ7W9eCoLzKYnt
 Dli4y0oUwQY2MPi8yIjmRsg1g7PHlpiwsZoZ5Io=
X-Google-Smtp-Source: ACHHUZ5azaKMzjK7aUUh7AstxE+2nGqD+3hg6gvZg1b9Rd3lXrHv8Y1c0twOuek5dchtn7KLVtntVw==
X-Received: by 2002:a05:6a00:21c9:b0:63d:2b95:5476 with SMTP id
 t9-20020a056a0021c900b0063d2b955476mr5394299pfj.23.1682650378670; 
 Thu, 27 Apr 2023 19:52:58 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9f50:6799:fba2:1f53])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a62d115000000b0063d24fcc2b7sm13854437pfg.1.2023.04.27.19.52.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 19:52:58 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Subject: [PATCH 3/5] hw/display/virtio-gpu-virgl: define callbacks in realize
 function
Date: Thu, 27 Apr 2023 19:52:49 -0700
Message-Id: <20230428025251.603-4-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230428025251.603-1-gurchetansingh@google.com>
References: <20230428025251.603-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::436;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x436.google.com
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
index ee5ddb887c..0ff77e9966 100644
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


