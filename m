Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FD5537A2AD
	for <lists+qemu-devel@lfdr.de>; Tue, 11 May 2021 10:55:14 +0200 (CEST)
Received: from localhost ([::1]:43102 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgOAb-0005vh-KN
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 04:55:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNe7-0000Bj-HV
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:39 -0400
Received: from mga17.intel.com ([192.55.52.151]:32223)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgNe4-0004ul-Hj
 for qemu-devel@nongnu.org; Tue, 11 May 2021 04:21:39 -0400
IronPort-SDR: fxsdHQT/XXiPF/ILdqEB3lX+1A11PTtBcJqhM5f58qCfR2Cu2KJOfOsJ6hQ8WI90FLEu5Aa77u
 5gbLS1TVUErA==
X-IronPort-AV: E=McAfee;i="6200,9189,9980"; a="179649396"
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="179649396"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
IronPort-SDR: lmof1W5dq6khbjRoA4m5+byQhzogu/x0cyHGalMkGnbcoSMzcncQlvcJpvHK+sMrhtnkod+Kf/
 Xz3Cf97eTm/Q==
X-IronPort-AV: E=Sophos;i="5.82,290,1613462400"; d="scan'208";a="536892218"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 01:20:49 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 15/20] virtio-gpu: Add dmabuf helpers for synchronization
Date: Tue, 11 May 2021 01:08:13 -0700
Message-Id: <20210511080818.366985-16-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511080818.366985-1-vivek.kasireddy@intel.com>
References: <20210511080818.366985-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151;
 envelope-from=vivek.kasireddy@intel.com; helo=mga17.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>,
 Gerd Hoffmann <kraxel@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

These helpers will be used in the next subsequent patches to
wait until a dmabuf object (via a texture) has been used
by the UI to render and submit its buffer.

Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu-udmabuf.c | 42 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  |  4 ++++
 include/ui/console.h            |  6 +++++
 ui/console.c                    | 10 ++++++++
 4 files changed, 62 insertions(+)

diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
index a9cb83d686..57bddd4d01 100644
--- a/hw/display/virtio-gpu-udmabuf.c
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -178,6 +178,47 @@ static void virtio_gpu_free_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf)
     g_free(dmabuf);
 }
 
+static VGPUDMABuf
+*virtio_gpu_find_dmabuf(VirtIOGPU *g,
+                        struct virtio_gpu_simple_resource *res)
+{
+    VGPUDMABuf *dmabuf, *tmp;
+
+    QTAILQ_FOREACH_SAFE(dmabuf, &g->dmabuf.bufs, next, tmp) {
+        if (dmabuf->buf.fd == res->dmabuf_fd) {
+            return dmabuf;
+        }
+    }
+
+    return NULL;
+}
+
+void virtio_gpu_resource_wait_sync(VirtIOGPU *g,
+                                   struct virtio_gpu_simple_resource *res)
+{
+    struct virtio_gpu_scanout *scanout;
+    VGPUDMABuf *dmabuf;
+
+    dmabuf = virtio_gpu_find_dmabuf(g, res);
+    if (dmabuf) {
+        scanout = &g->parent_obj.scanout[dmabuf->scanout_id];
+        dpy_gl_wait_dmabuf(scanout->con, &dmabuf->buf);
+    }
+}
+
+bool virtio_gpu_resource_has_sync(VirtIOGPU *g,
+                                  struct virtio_gpu_simple_resource *res)
+{
+    VGPUDMABuf *dmabuf;
+
+    dmabuf = virtio_gpu_find_dmabuf(g, res);
+    if (dmabuf && dmabuf->buf.sync) {
+        return true;
+    }
+
+    return false;
+}
+
 static VGPUDMABuf
 *virtio_gpu_create_dmabuf(VirtIOGPU *g,
                           uint32_t scanout_id,
@@ -196,6 +237,7 @@ static VGPUDMABuf
     dmabuf->buf.stride = fb->stride;
     dmabuf->buf.fourcc = qemu_pixman_to_drm_format(fb->format);
     dmabuf->buf.fd = res->dmabuf_fd;
+    dmabuf->buf.sync = NULL;
 
     dmabuf->scanout_id = scanout_id;
     QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 4a827454f5..41f74e9286 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -277,6 +277,10 @@ int virtio_gpu_update_dmabuf(VirtIOGPU *g,
                              uint32_t scanout_id,
                              struct virtio_gpu_simple_resource *res,
                              struct virtio_gpu_framebuffer *fb);
+void virtio_gpu_resource_wait_sync(VirtIOGPU *g,
+                                   struct virtio_gpu_simple_resource *res);
+bool virtio_gpu_resource_has_sync(VirtIOGPU *g,
+                                  struct virtio_gpu_simple_resource *res);
 
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
diff --git a/include/ui/console.h b/include/ui/console.h
index b30b63976a..3b0e377923 100644
--- a/include/ui/console.h
+++ b/include/ui/console.h
@@ -168,6 +168,7 @@ typedef struct QemuDmaBuf {
     uint64_t  modifier;
     uint32_t  texture;
     bool      y0_top;
+    void      *sync;
 } QemuDmaBuf;
 
 typedef struct DisplayState DisplayState;
@@ -240,6 +241,9 @@ typedef struct DisplayChangeListenerOps {
     /* optional */
     void (*dpy_gl_release_dmabuf)(DisplayChangeListener *dcl,
                                   QemuDmaBuf *dmabuf);
+    /* optional */
+    void (*dpy_gl_wait_dmabuf)(DisplayChangeListener *dcl,
+                               QemuDmaBuf *dmabuf);
     /* required if GL */
     void (*dpy_gl_update)(DisplayChangeListener *dcl,
                           uint32_t x, uint32_t y, uint32_t w, uint32_t h);
@@ -312,6 +316,8 @@ void dpy_gl_cursor_position(QemuConsole *con,
                             uint32_t pos_x, uint32_t pos_y);
 void dpy_gl_release_dmabuf(QemuConsole *con,
                            QemuDmaBuf *dmabuf);
+void dpy_gl_wait_dmabuf(QemuConsole *con,
+                        QemuDmaBuf *dmabuf);
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h);
 
diff --git a/ui/console.c b/ui/console.c
index 2de5f4105b..b0abfd2246 100644
--- a/ui/console.c
+++ b/ui/console.c
@@ -1917,6 +1917,16 @@ void dpy_gl_release_dmabuf(QemuConsole *con,
     }
 }
 
+void dpy_gl_wait_dmabuf(QemuConsole *con,
+                        QemuDmaBuf *dmabuf)
+{
+    assert(con->gl);
+
+    if (con->gl->ops->dpy_gl_wait_dmabuf) {
+        con->gl->ops->dpy_gl_wait_dmabuf(con->gl, dmabuf);
+    }
+}
+
 void dpy_gl_update(QemuConsole *con,
                    uint32_t x, uint32_t y, uint32_t w, uint32_t h)
 {
-- 
2.30.2


