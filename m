Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAE56EA0D9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:18 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKP-0002cf-D5; Thu, 20 Apr 2023 21:12:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKL-0002bN-6e
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:41 -0400
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKI-0008MU-Mu
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:40 -0400
Received: by mail-pj1-x1032.google.com with SMTP id
 98e67ed59e1d1-247526f0eceso1187001a91.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039555; x=1684631555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kfHhm4nND4bStTj+yGgL15ysAxO8GJhh6JBse4owvSs=;
 b=KS7Z542rFWVB1stGg0lFyumYUE6ieEY2dhyJ7B4wTsJQ8ze85L43I6DYiahXfpVy/Y
 9nbFbxR8hyUaZ+oa6a/JY2msPzBF+RjxIjDy333jFhUQD3VDa+Yf6GYMom1mZbBdtFC+
 Vk8kaCykJGTX9mgmvWg7TffnmJfRummmHN9N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039555; x=1684631555;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kfHhm4nND4bStTj+yGgL15ysAxO8GJhh6JBse4owvSs=;
 b=LkrNldHx90JqOQsR0w1RXmI9iBy+OBoZbnXaCSSaYpHygUbF5z9xhiECkvGq8KkuZt
 RalSGr6T+guHPd+5vbaAtP8zwtnsl+pVYxLzSotoBHPR9JVCgcrziBTtrhATlQxjoLJS
 +LilNWGUaJMq5awYHMTFBRk6xHE7PAujLl2Lvlg+45GVzYFVyJesIc2+AQD6Zz9VB3D1
 MlJgNlaCr36xcE+jRfjSr7pVLuVOjbiac2y/2jtuCxgV9c9BPO+Ia+dnst9h1DSodsCd
 m0DIVIwyjOQMAa7L6xIfIe81P1q1vQit81AqoNGBpQJyrHDEizXL/zOgPeYcCCJnGBXk
 6Pkg==
X-Gm-Message-State: AAQBX9cC4Ah90zFI8T7mwhg3RBFc8meJCTq9W7rjuhTU7GNovDGfDXO6
 0Pe3jQ3DUOYCy7M0MzGC88jCaoTKhL+qCaVvEtO/vyI3
X-Google-Smtp-Source: AKy350bw9b/BSApze1eDEktYM6VFCRxx3h4N9ycclng6YJOQO+yTf4ie8NU32MhvT0AAVmj6BOWzLw==
X-Received: by 2002:a17:90a:4741:b0:249:6a63:7b8e with SMTP id
 y1-20020a17090a474100b002496a637b8emr3470649pjg.5.1682039555019; 
 Thu, 20 Apr 2023 18:12:35 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:34 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 05/13] gfxstream + rutabaga prep: virtio_gpu_gl ->
 virtio_gpu_virgl
Date: Thu, 20 Apr 2023 18:12:15 -0700
Message-Id: <20230421011223.718-6-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1032;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pj1-x1032.google.com
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

The virtio-gpu GL device has a heavy dependence on virgl.
Acknowledge this by naming functions accurately.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-gl.c     | 27 ++++++++++++++-------------
 hw/display/virtio-gpu-virgl.c  |  2 +-
 include/hw/virtio/virtio-gpu.h |  2 +-
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e06be60dfb..dc648aacb2 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -25,9 +25,10 @@
 
 #include <virglrenderer.h>
 
-static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
-                                             struct virtio_gpu_scanout *s,
-                                             uint32_t resource_id)
+static void
+virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+                               struct virtio_gpu_scanout *s,
+                               uint32_t resource_id)
 {
     uint32_t width, height;
     uint32_t pixels, *data;
@@ -48,14 +49,14 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
     free(data);
 }
 
-static void virtio_gpu_gl_flushed(VirtIOGPUBase *b)
+static void virtio_gpu_virgl_flushed(VirtIOGPUBase *b)
 {
     VirtIOGPU *g = VIRTIO_GPU(b);
 
     virtio_gpu_process_cmdq(g);
 }
 
-static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
+static void virtio_gpu_virgl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
@@ -71,7 +72,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     }
     if (gl->renderer_reset) {
         gl->renderer_reset = false;
-        virtio_gpu_virgl_reset(g);
+        virtio_gpu_virglrenderer_reset(g);
     }
 
     cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
@@ -87,7 +88,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     virtio_gpu_virgl_fence_poll(g);
 }
 
-static void virtio_gpu_gl_reset(VirtIODevice *vdev)
+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
@@ -104,7 +105,7 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
     }
 }
 
-static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
+static void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
@@ -143,13 +144,13 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
     VirtIOGPUBaseClass *vbc = VIRTIO_GPU_BASE_CLASS(klass);
     VirtIOGPUClass *vgc = VIRTIO_GPU_CLASS(klass);
 
-    vbc->gl_flushed = virtio_gpu_gl_flushed;
-    vgc->handle_ctrl = virtio_gpu_gl_handle_ctrl;
+    vbc->gl_flushed = virtio_gpu_virgl_flushed;
+    vgc->handle_ctrl = virtio_gpu_virgl_handle_ctrl;
     vgc->process_cmd = virtio_gpu_virgl_process_cmd;
-    vgc->update_cursor_data = virtio_gpu_gl_update_cursor_data;
+    vgc->update_cursor_data = virtio_gpu_virgl_update_cursor;
 
-    vdc->realize = virtio_gpu_gl_device_realize;
-    vdc->reset = virtio_gpu_gl_reset;
+    vdc->realize = virtio_gpu_virgl_device_realize;
+    vdc->reset = virtio_gpu_virgl_reset;
     device_class_set_props(dc, virtio_gpu_gl_properties);
 }
 
diff --git a/hw/display/virtio-gpu-virgl.c b/hw/display/virtio-gpu-virgl.c
index 1c47603d40..f91d33ce13 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -599,7 +599,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
     }
 }
 
-void virtio_gpu_virgl_reset(VirtIOGPU *g)
+void virtio_gpu_virglrenderer_reset(VirtIOGPU *g)
 {
     virgl_renderer_reset();
 }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index adee17968d..e256e44172 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -297,7 +297,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
 void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
-void virtio_gpu_virgl_reset(VirtIOGPU *g);
+void virtio_gpu_virglrenderer_reset(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
 
-- 
2.40.0.634.g4ca3ef3211-goog


