Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB9716F1CDC
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Apr 2023 18:49:34 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1psRH1-0001CK-Ii; Fri, 28 Apr 2023 12:48:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGq-0001BZ-1e
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:33 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1psRGn-0004pL-Oo
 for qemu-devel@nongnu.org; Fri, 28 Apr 2023 12:48:31 -0400
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-64115eef620so13910844b3a.1
 for <qemu-devel@nongnu.org>; Fri, 28 Apr 2023 09:48:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682700506; x=1685292506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Y3zt4VMlRxuhbqyC4FpwqUcCzS4vqcvfSbOdrHpo2FE=;
 b=ArZ1bzs9VClJbslLyWvpr+DfraSljnHCHRw2hURUVLw1Gd6EBHiY9pyHtTmEajYRf7
 0g271ptr6MMciQcA7EnmM5+lqVUDenV3so8l/sqenCuodY9ohMKcdSd/K7WbTSSlpZwE
 9j/+FwVnkXFhhwiiJ3MJS0oInc2csj4StCP04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682700506; x=1685292506;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Y3zt4VMlRxuhbqyC4FpwqUcCzS4vqcvfSbOdrHpo2FE=;
 b=drrJB+L87Pcq1p/5Vl+JW4sIYTUkvZOre3oLbQemt5oD4DFc7KXMHpAB1RPd+k72sZ
 emfR23hjn/zTANt3iRw4dHeyaITgzpcJ5qWV1dhAVlYst2Q17GAJzaRGKytv+L6C5pVU
 ZUoCH8CBO+Q32f0Qmo8I6gRFhz3oy1B40/iFiu91+xiHAGJxbMbjHOIXyVyrXIfr5R92
 MYRqjMFedQAgQU3cTrwSrObBY44eSBQKgjWU6AeOZuZn7OsUIS1v92cHfahl9now45Nx
 /sCJzR2vh84SboagOJvIDXKCF9g2mAUrxeoTIqtSShNrUlCE+PXSxCYXC7aVxH8uKpWL
 /8dw==
X-Gm-Message-State: AC+VfDyrku/Gl5a26t6aZguWixg7sPl78oJJBMFypozBVNRpyyOfacit
 xlkuCDBgcT4OZb9Qc7+HAfsq4w3YSZPIW6Oy8Lo=
X-Google-Smtp-Source: ACHHUZ5kQLxO8akFmwwBxxLe60mG/6CTXz9ke0ZhYW94mP7aatMPdx/xgSssgwuO/5lBc45A16lAOg==
X-Received: by 2002:a17:902:e88e:b0:1a1:ca4d:120a with SMTP id
 w14-20020a170902e88e00b001a1ca4d120amr12209664plg.7.1682700506368; 
 Fri, 28 Apr 2023 09:48:26 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:fdc4:a664:d93b:43db])
 by smtp.gmail.com with ESMTPSA id
 jf19-20020a170903269300b001a2806ae2f7sm13566796plb.83.2023.04.28.09.48.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Apr 2023 09:48:25 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
X-Google-Original-From: Gurchetan Singh <gurchetansingh@google.com>
To: qemu-devel@nongnu.org
Cc: philmd@linaro.org, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [PATCH v2 1/5] hw/display/virtio-gpu-virgl: virtio_gpu_gl ->
 virtio_gpu_virgl
Date: Fri, 28 Apr 2023 09:48:19 -0700
Message-Id: <20230428164823.789-1-gurchetansingh@google.com>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pf1-x42b.google.com
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
v2:
 - (Akihiko) Fix unnecessary line break

 hw/display/virtio-gpu-gl.c     | 26 +++++++++++++-------------
 hw/display/virtio-gpu-virgl.c  |  2 +-
 include/hw/virtio/virtio-gpu.h |  2 +-
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/hw/display/virtio-gpu-gl.c b/hw/display/virtio-gpu-gl.c
index e06be60dfb..8573043b85 100644
--- a/hw/display/virtio-gpu-gl.c
+++ b/hw/display/virtio-gpu-gl.c
@@ -25,9 +25,9 @@
 
 #include <virglrenderer.h>
 
-static void virtio_gpu_gl_update_cursor_data(VirtIOGPU *g,
-                                             struct virtio_gpu_scanout *s,
-                                             uint32_t resource_id)
+static void virtio_gpu_virgl_update_cursor(VirtIOGPU *g,
+                               struct virtio_gpu_scanout *s,
+                               uint32_t resource_id)
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
2.40.1.495.gc816e09b53d-goog


