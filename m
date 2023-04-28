Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D053E6F108D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 04:53:45 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psEEJ-00055w-7K; Thu, 27 Apr 2023 22:53:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEEF-000550-Rz
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:52:59 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psEEE-0005aJ-39
 for qemu-devel@nongnu.org; Thu, 27 Apr 2023 22:52:59 -0400
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-63b70f0b320so11528731b3a.1
 for <qemu-devel@nongnu.org>; Thu, 27 Apr 2023 19:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682650376; x=1685242376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YCU7uFC25jpplt0AFEL9jwm9NKDRPYKBERABoJsHfkw=;
 b=mKFu3ATvXgCBB9yOL8RBbLyWlEYfkw9bo0R6/5DeqoE1R8+/Rc6xxvrkPjR3RKyxkr
 qV+uNrTXpo0lCNnpZoWSCzPuLkSZ5kNcY2tPA+MuwvaPme+7w3W7S3sOqhbU2UfwTo7I
 4n+fszsPxc5gtM7PP22uXc3kaVlkgD3jTW1Dw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682650376; x=1685242376;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YCU7uFC25jpplt0AFEL9jwm9NKDRPYKBERABoJsHfkw=;
 b=bm8S9mlZVrX05Wz6Fn2kheBo1prtqhdIuDiU9gPb4ixS1OeeCDxEVX93H1ufxfRACs
 tvyrE9tursppNrfXUZQCCvKxOY3kSXSiCnKaLhPuqdUbd9YNn/kALWYOxxuCpe7j/X/r
 bypaPR/lC14x6X79uKbcmW9+mp17IKCBgGx7+imYq0nNfuxgDrpZgZ8NJTkVoKL2yCP1
 43CKqTMSnkmLQijQHDx3kQHFAaJXnhBVdTJqJaVM0+pt3WSwksTzUmtFnaml6klKozE8
 /KGKeYT3ab6mKGQ65wdLByxgJhDbyt8GbRIYIuptZcHx/inqLLrnx9pQ/trjg5MGWAmJ
 6wGw==
X-Gm-Message-State: AC+VfDwhyCkkJYd+bcOis8XYdWeYMRZBfHLLavDkYY75fqEOtqOBjZLR
 VXp1dQA5lH66aUrtmBTn5pt153x4qgvKL2gYEss=
X-Google-Smtp-Source: ACHHUZ60GfnkCW0f6eGPFPG6h5t7vvsWn6AIOdX9chFozbzGOWe/JpNpd8jY5OBTjfVwcSB3EMUzpA==
X-Received: by 2002:a05:6a00:18aa:b0:63d:2f12:fa35 with SMTP id
 x42-20020a056a0018aa00b0063d2f12fa35mr6280796pfh.26.1682650376171; 
 Thu, 27 Apr 2023 19:52:56 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:9f50:6799:fba2:1f53])
 by smtp.gmail.com with ESMTPSA id
 z21-20020a62d115000000b0063d24fcc2b7sm13854437pfg.1.2023.04.27.19.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Apr 2023 19:52:55 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, david@redhat.com, kraxel@redhat.com,
 marcandre.lureau@redhat.com, akihiko.odaki@gmail.com,
 dmitry.osipenko@collabora.com, ray.huang@amd.com, alex.bennee@linaro.org
Subject: [PATCH 1/5] hw/display/virtio-gpu-virgl: virtio_gpu_gl ->
 virtio_gpu_virgl
Date: Thu, 27 Apr 2023 19:52:47 -0700
Message-Id: <20230428025251.603-2-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230428025251.603-1-gurchetansingh@google.com>
References: <20230428025251.603-1-gurchetansingh@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x42e.google.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
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

From: Gurchetan Singh <gurchetansingh@chromium.org>

The virtio-gpu GL device has a heavy dependence on virgl.
Acknowledge this by naming functions accurately.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v1:
 - (Philippe) virtio_gpu_virglrenderer_reset --> virtio_gpu_virgl_reset_renderer

 hw/display/virtio-gpu-gl.c     | 27 ++++++++++++++-------------
 hw/display/virtio-gpu-virgl.c  |  2 +-
 include/hw/virtio/virtio-gpu.h |  2 +-
 3 files changed, 16 insertions(+), 15 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e06be60dfb..7d69050b8c 100644
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
+        virtio_gpu_virgl_reset_renderer(g);
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
index 1c47603d40..ffe4ec7f3d 100644
--- a/hw/display/virtio-gpu-virgl.c
+++ b/hw/display/virtio-gpu-virgl.c
@@ -599,7 +599,7 @@ void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g)
     }
 }
 
-void virtio_gpu_virgl_reset(VirtIOGPU *g)
+void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g)
 {
     virgl_renderer_reset();
 }
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 2e28507efe..21b0f55bc8 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -281,7 +281,7 @@ void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
 void virtio_gpu_virgl_fence_poll(VirtIOGPU *g);
 void virtio_gpu_virgl_reset_scanout(VirtIOGPU *g);
-void virtio_gpu_virgl_reset(VirtIOGPU *g);
+void virtio_gpu_virgl_reset_renderer(VirtIOGPU *g);
 int virtio_gpu_virgl_init(VirtIOGPU *g);
 int virtio_gpu_virgl_get_num_capsets(VirtIOGPU *g);
 
-- 
2.40.1.495.gc816e09b53d-goog


