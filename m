Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1BD76F7316
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 21:14:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pueNp-0005JH-VJ; Thu, 04 May 2023 15:12:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNo-0005Ih-2M
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:52 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1pueNm-0004cM-49
 for qemu-devel@nongnu.org; Thu, 04 May 2023 15:12:51 -0400
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1aaf7067647so6262945ad.0
 for <qemu-devel@nongnu.org>; Thu, 04 May 2023 12:12:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1683227568; x=1685819568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5RMPEigK/Ffgk2ywCilqFZocwnmpEQ9oWndP4CSXeiA=;
 b=NHYycYM9hlRYRqzS+kRE268d5hPaaG9zBQSq7ZnrKGp4imHewhdul2lmjvcImeZ46n
 5MUKukrg1d9w8MlMCaFl0Euzb6JfYrM7AL3gR+Q3EMDa4x32UTV4UwJIPHhLCHjEyUiw
 9gNUR1lsXxotEWErhkSzzTKzSZ1IhO2kgr7nM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683227568; x=1685819568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5RMPEigK/Ffgk2ywCilqFZocwnmpEQ9oWndP4CSXeiA=;
 b=YSOPwGZqubqqwIzdePT4bba3lGUXOEt2b+9wb4gYuXMDRC33Iogmtcnji1Da3GL1Lg
 8o9pJNXClfSL2A8HcSj6jdeh/FhvTAKboZHBbNfRV9dJyNFg8PbBkVyrsEcmIlNjCRRI
 5+SZB2M9bQQr9jqJ/3wUIKvsDEsdIQlU6mK2nDn6ISOjze+DdsSBCNZLfbQJLFOyM8yA
 2gL2FRhQ8uyESIRNNXlkfL19M/TUjBMc3hlnNIzlJE+ce1AUUsZ6xj+VxL5Hq7UyWesK
 wlQVv0zB7MbNMR37XDWP249CqcIepP+dafMORa23xQFdHZeZdQ9Cj4jU+5VBbynUGzqy
 Mdyw==
X-Gm-Message-State: AC+VfDwK+vU7g7n7cZ+f+WcmVWso7JVAfY7dSzmXV/ze6fk9E1ik38uL
 invR11vAVh7j6LlG2wvVX9WmmLzuimArRnvQB50=
X-Google-Smtp-Source: ACHHUZ4RSo6ACgMkQF4suyCizbubcgJgTrhgPZ2DNgyScjVFrenJIdwELWVt2Vk+eS0u9x1YCESJTQ==
X-Received: by 2002:a17:902:e842:b0:1a9:b3a8:2b0a with SMTP id
 t2-20020a170902e84200b001a9b3a82b0amr6353886plg.15.1683227568289; 
 Thu, 04 May 2023 12:12:48 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:4891:407:d4c8:7fa9])
 by smtp.gmail.com with ESMTPSA id
 w2-20020a170902e88200b001ab2a0733aasm2185980plg.39.2023.05.04.12.12.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 May 2023 12:12:47 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org, shentey@gmail.com
Subject: [PATCH v3 1/5] hw/display/virtio-gpu-virgl: virtio_gpu_gl ->
 virtio_gpu_virgl
Date: Thu,  4 May 2023 12:12:39 -0700
Message-Id: <20230504191243.746-2-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230504191243.746-1-gurchetansingh@chromium.org>
References: <20230504191243.746-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pl1-x635.google.com
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

The virtio-gpu GL device has a heavy dependence on virgl.
Acknowledge this by naming functions accurately.

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
v1:
 - (Philippe) virtio_gpu_virglrenderer_reset --> virtio_gpu_virgl_reset_renderer
v2:
 - (Akihiko) Fix unnecessary line break
v3:
 - (Akihiko) Fix misaligned parameters

 hw/display/virtio-gpu-gl.c     | 26 +++++++++++++-------------
 hw/display/virtio-gpu-virgl.c  |  2 +-
 include/hw/virtio/virtio-gpu.h |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e06be60dfb..e8cbc652dc 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -25,9 +25,9 @@
 
 #include <virglrenderer.h>
 
-static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
-                                             struct virtio_gpu_scanout *s,
-                                             uint32_t resource_id)
+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+                                           struct virtio_gpu_scanout *s,
+                                           uint32_t resource_id)
 {
     uint32_t width, height;
     uint32_t pixels, *data;
@@ -48,14 +48,14 @@ static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
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
@@ -71,7 +71,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     }
     if (gl->renderer_reset) {
         gl->renderer_reset = false;
-        virtio_gpu_virgl_reset(g);
+        virtio_gpu_virgl_reset_renderer(g);
     }
 
     cmd = virtqueue_pop(vq, sizeof(struct virtio_gpu_ctrl_command));
@@ -87,7 +87,7 @@ static void virtio_gpu_gl_handle_ctrl(VirtIODevice *vdev, VirtQueue *vq)
     virtio_gpu_virgl_fence_poll(g);
 }
 
-static void virtio_gpu_gl_reset(VirtIODevice *vdev)
+static void virtio_gpu_virgl_reset(VirtIODevice *vdev)
 {
     VirtIOGPU *g = VIRTIO_GPU(vdev);
     VirtIOGPUGL *gl = VIRTIO_GPU_GL(vdev);
@@ -104,7 +104,7 @@ static void virtio_gpu_gl_reset(VirtIODevice *vdev)
     }
 }
 
-static void virtio_gpu_gl_device_realize(DeviceState *qdev, Error **errp)
+static void virtio_gpu_virgl_device_realize(DeviceState *qdev, Error **errp)
 {
     VirtIOGPU *g = VIRTIO_GPU(qdev);
 
@@ -143,13 +143,13 @@ static void virtio_gpu_gl_class_init(ObjectClass *klass, void *data)
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
2.40.1.521.gf1e218fcd8-goog


