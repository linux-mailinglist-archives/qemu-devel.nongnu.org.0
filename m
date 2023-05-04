Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A8416F7319
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:14:22 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pueNs-0005K6-M4; Thu, 04 May 2023 15:12:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNq-0005JZ-IW
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:54 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNo-0004co-Nl
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:54 -0400
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1aad5245632so6359875ad.3
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 12:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683227571; x=1685819571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S/jEhSi3NWvTJqVmOtGYJwbPskkpl3vSfggGXhhRyh8=;
 b=OGtUQDNxVDq2xHCeLzMAtnZBZ0oSkYNhETaH2Vw7PvvFzKmZUEN67O0pPGE3qJfJXz
 PLszyZog4CxXLYCtjVZ7abV/zRzIpDYqw0PLnG72T6eRzQHb87AaRO0ZRG19QKni+TMZ
 kBsWsl1LWSmAVBsQY7fK5qmE4LRB1Qseyh+Rw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227571; x=1685819571;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S/jEhSi3NWvTJqVmOtGYJwbPskkpl3vSfggGXhhRyh8=;
 b=G3jHRsVkmQtF2S/UsyjLSCGgmsko+eqgBuKxKi1ItAjl7LAdtBoJRfb9Kae5Ay02T2
 AytM21dYrDvu6drqLyVwPW7KqPyJkIWJ+3IpC83PUoi+4rRXKFKT9hBDegAhG20YxMdO
 LWqJaPAVTOMRtcRdI1mw5tIoJ01zWfKoiGhfD47+jMkjA6s54powICC95yg4pEyz6aA+
 ou952qaoyXE60Au5oeea3nNVfqXe44+flxxs8pbbzEByR+4koTyOgnnvEsaiUYTa0OOe
 jgQSYuxCg+L+YY2gdhqjMkkJAjQsE3fdGi9b7/2XpXi02GqDkb0sdSvNTboPbyHT2vkw
 9Arg==
X-Gm-Message-State: AC+VfDwUen/JPdc23nKz9cxVoiXCkP12yvy5HzXkVIYSc8j565vhSgvH
 KP5zKu1mbID1Mm5S9ITcoMms0HB2Os4nA+qPb/Y=
X-Google-Smtp-Source: ACHHUZ7WXSNSv3FdV3BWIrqN9rkUoBhcXPDHIkVppdM27ke6cWVLhH+TTCoDM4+JyBGH/OfXaYrbzQ==
X-Received: by 2002:a17:903:110f:b0:1a9:91a1:57bd with SMTP id
 n15-20020a170903110f00b001a991a157bdmr5560125plh.34.1683227570884; 
 Thu, 04 May 2023 12:12:50 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:4891:407:d4c8:7fa9])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001ab2a0733aasm2185980plg.39.2023.05.04.12.12.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 12:12:50 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org, shentey@gmail.com
Subject: [PATCH v3 3/5] hw/display/virtio-gpu-virgl: define callbacks in
 realize function
Date: Thu,  4 May 2023 12:12:41 -0700
Message-Id: <20230504191243.746-4-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230504191243.746-1-gurchetansingh@chromium.org>
References: <20230504191243.746-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x636.google.com
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

This reduces the amount of renderer backend specific needed to
be exposed to the GL device.  We only need one realize function
per renderer backend.

This may seem a bit odd to traditional QOM users since we mutate
class function pointers, but the distinction between .instance_init
and .realize is often tricky.  A rule of thumb suggested by Liviu
Ionescu is that is "instance_init ensures that all members have
default values and properties associated with them, and defer all
functional initialisations to .realize".  I believe this patch does
this.

This refactoring will allow non-virgl 3D backends, without the
need of a separate another virtio-gpu device and it's (vga, pci)
variants.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v1: - Remove NULL inits (Philippe)
    - Use VIRTIO_GPU_BASE where possible (Philippe)
v2: - Fix unnecessary line break (Akihiko)
v3: - Fix misaligned parameters (Akihiko)

 hw/display/virtio-gpu-gl.c     | 15 ++++++-------
 hw/display/virtio-gpu-virgl.c  | 39 +++++++++++++++++++++++-----------
 include/hw/virtio/virtio-gpu.h |  7 ------
 3 files changed, 33 insertions(+), 28 deletions(-)

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
index 74e12d22b6..f73014f303 100644
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
 
@@ -637,9 +638,9 @@ static int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g)
     return capset2_max_ver ? 2 : 1;
 }
 
-void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
-                                    struct virtio_gpu_scanout *s,
-                                    uint32_t resource_id)
+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+                                           struct virtio_gpu_scanout *s,
+                                           uint32_t resource_id)
 {
     uint32_t width, height;
     uint32_t pixels, *data;
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
2.40.1.521.gf1e218fcd8-goog


