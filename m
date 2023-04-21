Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1516D6EA0DB
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 03:14:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppfKn-0002i0-VV; Thu, 20 Apr 2023 21:13:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKW-0002en-PJ
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:52 -0400
Received: from mail-pg1-x535.google.com ([2607:f8b0:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <gurchetansingh@chromium.org>)
 id 1ppfKT-0008Oa-Pz
 for qemu-devel@nongnu.org; Thu, 20 Apr 2023 21:12:52 -0400
Received: by mail-pg1-x535.google.com with SMTP id
 41be03b00d2f7-517bfdf55c3so1019638a12.2
 for <qemu-devel@nongnu.org>; Thu, 20 Apr 2023 18:12:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1682039567; x=1684631567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4vTpbF7v1Tm3KrZR4fV6SJq1l9EN0aN9Wua7fdDEubE=;
 b=h/9TVHF85ucrcXdjxf/Xmji0v9YvJvyCuA3o0ATUAHBx8coP4T4IICWphK/QGEGKz5
 d+22jBHoL4hFJssU+JEBWQ4BHvo6OREgrgxDak/ipXREocfOgBeIffydao5ynGrKS4uu
 jnOIxUWWxkpuU3SWyuRHLLuVQCfw7dWy3kF7c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682039567; x=1684631567;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4vTpbF7v1Tm3KrZR4fV6SJq1l9EN0aN9Wua7fdDEubE=;
 b=k9VtNFiEKQPepEcQM7b9NK/v4Njjm58wvwhY/RPp8nXfbee4bUqOXWPMxH7gN0v6+5
 41a2794Fuf20Fh06W8ZNST0pTa7341z4hcMDooG/s9Oneh+JPRPgWy2J3KhgDJOs+kUB
 TYaBAxJuVseR1SLMSnHPHaWnq02q0Aex1cpqUlJrMEu85OGoDXE4Tslm1y/y/S43vazf
 0ezFPRPJAAvJj9i8R3xbng/cExPHJcn+DMty2sXArEHLKEbz5XhtbcwkOywqcKYb2QL2
 Q96fjYwO3535V8bcZCDIw7UISWf8bvuOztG1LpFIbqJC+Fgpm739R89YOv7V09RQi+KY
 f4fA==
X-Gm-Message-State: AAQBX9eLpPzVnnMDfnE8P7eCPvYNlcXgxYUxc3fA4GdJUqNSjns5xaLK
 IgPbgjidTX0yNb4BjKZZD7J+/khJFYbvbOzvd5VqdIWb
X-Google-Smtp-Source: AKy350ZzK14O7raC/KS7JOD/yUp2VkZTPYE9vWJCu+pY5lrSU8XNtpox3OfXudTOidx8Nj9rtPfBlQ==
X-Received: by 2002:a17:90b:2289:b0:246:97d2:dc0d with SMTP id
 kx9-20020a17090b228900b0024697d2dc0dmr3307246pjb.39.1682039567662; 
 Thu, 20 Apr 2023 18:12:47 -0700 (PDT)
Received: from gurchetansingh0.mtv.corp.google.com
 ([2620:15c:a7:2:6625:6aa3:1b0e:a808])
 by smtp.gmail.com with ESMTPSA id
 f4-20020a17090a8e8400b0024702e7c80fsm1697640pjo.23.2023.04.20.18.12.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Apr 2023 18:12:47 -0700 (PDT)
From: Gurchetan Singh <gurchetansingh@chromium.org>
To: qemu-devel@nongnu.org
Cc: pbonzini@redhat.com, philmd@linaro.org, david@redhat.com,
 stefanha@redhat.com, kraxel@redhat.com, marcandre.lureau@redhat.com,
 akihiko.odaki@gmail.com, dmitry.osipenko@collabora.com, ray.huang@amd.com,
 alex.bennee@linaro.org
Subject: [RFC PATCH 13/13] HACK: schedule fence return on main AIO context
Date: Thu, 20 Apr 2023 18:12:23 -0700
Message-Id: <20230421011223.718-14-gurchetansingh@chromium.org>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20230421011223.718-1-gurchetansingh@chromium.org>
References: <20230421011223.718-1-gurchetansingh@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::535;
 envelope-from=gurchetansingh@chromium.org; helo=mail-pg1-x535.google.com
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

gfxstream and both cross-domain (and even newer versions
virglrenderer: see VIRGL_RENDERER_ASYNC_FENCE_CB) like to signal
fence completion on threads ("callback threads") that are
different from the thread that processes the command queue
("main thread").

This is generally possible with locking, and this what we do
in crosvm and other virtio-gpu1.1 implementations.  However, on
QEMU a deadlock is observed if virtio_gpu_ctrl_response_nodata(..)
[used in the fence callback] is used from a thread that is not the
main thread.

The reason is the main thread takes the big QEMU lock (bql) somewhere
when processing the command queue, and virtio_gpu_ctrl_response_nodata(..)
needs that lock.  If you add in the lock needed to protect &g->fenceq
from concurrent access by the main thread and the callback threads,
you end can end up with deadlocks.

It's possible to workaround this by scheduling the return of the fence
descriptors via aio_bh_schedule_oneshot_full(..), but that somewhat
negates the rationale for the asynchronous callbacks.

I also played around with aio_context_acquire()/aio_context_release(),
doesn't seem to help.

Is signaling the virtio_queue outside of the main thread possible?  If
so, how?

Signed-off-by: Gurchetan Singh <gurchetansingh@chromium.org>
---
 hw/display/virtio-gpu-rutabaga.c | 29 ++++++++++++++++++++++++++---
 include/hw/virtio/virtio-gpu.h   |  1 +
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/display/virtio-gpu-rutabaga.c b/hw/display/virtio-gpu-rutabaga.c
index 196267aac2..5c296aeef1 100644
--- a/hw/display/virtio-gpu-rutabaga.c
+++ b/hw/display/virtio-gpu-rutabaga.c
@@ -31,6 +31,11 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g);
 
 #define CHECK_RESULT(result, cmd) CHECK(result == 0, cmd)
 
+struct rutabaga_aio_data {
+    struct VirtIOGPUGL *virtio_gpu;
+    struct rutabaga_fence fence;
+};
+
 static void
 virtio_gpu_rutabaga_update_cursor(VirtIOGPU *g, struct virtio_gpu_scanout *s,
                                   uint32_t resource_id)
@@ -823,10 +828,11 @@ virtio_gpu_rutabaga_process_cmd(VirtIOGPU *g,
 }
 
 static void
-virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
-                             struct rutabaga_fence fence_data)
+virtio_gpu_rutabaga_aio_cb(void *opaque)
 {
-    VirtIOGPU *g = (VirtIOGPU *)(void*)(uintptr_t)user_data;
+    struct rutabaga_aio_data *data =  (struct rutabaga_aio_data *)opaque;
+    VirtIOGPU *g = (VirtIOGPU *)data->virtio_gpu;
+    struct rutabaga_fence fence_data = data->fence;
     struct virtio_gpu_ctrl_command *cmd, *tmp;
 
     bool signaled_ctx_specific = fence_data.flags & RUTABAGA_FLAG_INFO_RING_IDX;
@@ -856,6 +862,22 @@ virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
         QTAILQ_REMOVE(&g->fenceq, cmd, next);
         g_free(cmd);
     }
+
+    g_free(data);
+}
+
+static void
+virtio_gpu_rutabaga_fence_cb(uint64_t user_data,
+                             struct rutabaga_fence fence_data) {
+    struct rutabaga_aio_data *data;
+    VirtIOGPU *g = (VirtIOGPU *)(void*)(uintptr_t)user_data;
+    GET_VIRTIO_GPU_GL(g);
+
+    data = g_new0(struct rutabaga_aio_data, 1);
+    data->virtio_gpu = virtio_gpu;
+    data->fence = fence_data;
+    aio_bh_schedule_oneshot_full(virtio_gpu->ctx, virtio_gpu_rutabaga_aio_cb,
+                                 (void *)data, "aio");
 }
 
 static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
@@ -912,6 +934,7 @@ static int virtio_gpu_rutabaga_init(VirtIOGPU *g)
         free(channels.channels);
     }
 
+    virtio_gpu->ctx = qemu_get_aio_context();
     return result;
 }
 
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 034c71e8f5..b33ad0c68f 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -225,6 +225,7 @@ struct VirtIOGPUGL {
     char *wayland_socket_path;
     uint32_t num_capsets;
     void *rutabaga;
+    AioContext *ctx;
 };
 
 struct VhostUserGPU {
-- 
2.40.0.634.g4ca3ef3211-goog


