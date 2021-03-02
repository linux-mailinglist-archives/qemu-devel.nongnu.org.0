Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 326F63296D4
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Mar 2021 09:17:39 +0100 (CET)
Received: from localhost ([::1]:52414 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lH0Dq-0005za-8s
	for lists+qemu-devel@lfdr.de; Tue, 02 Mar 2021 03:17:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lH0BD-0003r4-NZ
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:14:55 -0500
Received: from mga09.intel.com ([134.134.136.24]:10371)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lH0BB-00014E-K8
 for qemu-devel@nongnu.org; Tue, 02 Mar 2021 03:14:55 -0500
IronPort-SDR: ApKQA+BMN3DGPTpAk9rDbL1BdrAyyZeYoX5cle7xx1oIA3or/RSqBY+qKBUHeCO1/ybf85GxDA
 0h2clgI3PPXw==
X-IronPort-AV: E=McAfee;i="6000,8403,9910"; a="186847480"
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="186847480"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:14:43 -0800
IronPort-SDR: ffY7sPo29xLMq3Vl0WaxUWnHbPdOYH32AwQDNTFiG7ka2om2uuIeA8Vhsq4U9eguzm92rJxrSH
 QsozGHf3yz7w==
X-IronPort-AV: E=Sophos;i="5.81,216,1610438400"; d="scan'208";a="398340553"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2021 00:14:42 -0800
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [RFC 1/1] virtio-gpu: Use dmabuf for display updates if possible
 instead of pixman
Date: Tue,  2 Mar 2021 00:03:58 -0800
Message-Id: <20210302080358.3095748-2-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
References: <20210302080358.3095748-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.24;
 envelope-from=vivek.kasireddy@intel.com; helo=mga09.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Vivek Kasireddy <vivek.kasireddy@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

If a dmabuf can be created using Udmabuf driver for non-Virgil rendered
resources, then this should be preferred over pixman. If a dmabuf cannot
be created then we can fallback to pixman.

The dmabuf create and release functions are inspired by similar
functions in vfio/display.c.

Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/virtio-gpu.c        | 133 +++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h |  12 +++
 2 files changed, 145 insertions(+)

diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
index 2e4a9822b6..399d46eac3 100644
--- a/hw/display/virtio-gpu.c
+++ b/hw/display/virtio-gpu.c
@@ -18,6 +18,7 @@
 #include "trace.h"
 #include "sysemu/dma.h"
 #include "sysemu/sysemu.h"
+#include "exec/ramblock.h"
 #include "hw/virtio/virtio.h"
 #include "migration/qemu-file-types.h"
 #include "hw/virtio/virtio-gpu.h"
@@ -30,9 +31,14 @@
 #include "qemu/module.h"
 #include "qapi/error.h"
 #include "qemu/error-report.h"
+#include "standard-headers/drm/drm_fourcc.h"
+#include <sys/ioctl.h>
+
+#include <linux/udmabuf.h>
 
 #define VIRTIO_GPU_VM_VERSION 1
 
+static int udmabuf_fd;
 static struct virtio_gpu_simple_resource*
 virtio_gpu_find_resource(VirtIOGPU *g, uint32_t resource_id);
 
@@ -519,6 +525,119 @@ static void virtio_unref_resource(pixman_image_t *image, void *data)
     pixman_image_unref(data);
 }
 
+static VGPUDMABuf *virtio_gpu_get_dmabuf(VirtIOGPU *g,
+                                         struct virtio_gpu_simple_resource *res)
+{
+    VGPUDMABuf *dmabuf;
+    RAMBlock *rb;
+    ram_addr_t offset;
+    struct udmabuf_create_list *create;
+    uint32_t modifier_hi, modifier_lo;
+    uint64_t modifier;
+    static uint64_t ids = 1;
+    int i, dmabuf_fd;
+
+    create = g_malloc0(sizeof(*create) +
+                       res->iov_cnt * sizeof (struct udmabuf_create_item));
+    if (!create)
+        return NULL;
+
+    create->count = res->iov_cnt;
+    create->flags = UDMABUF_FLAGS_CLOEXEC;
+    for (i = 0; i < res->iov_cnt; i++) {
+        rb = qemu_ram_block_from_host(res->iov[i].iov_base, false, &offset);
+        if (!rb || rb->fd < 0) {
+                g_free(create);
+                return NULL;
+        }
+
+        create->list[i].memfd = rb->fd;
+        create->list[i].__pad = 0;
+        create->list[i].offset = offset;
+        create->list[i].size = res->iov[i].iov_len;
+    }
+
+    dmabuf_fd = ioctl(udmabuf_fd, UDMABUF_CREATE_LIST, create);
+    if (dmabuf_fd < 0) {
+        g_free(create);
+        return NULL;
+    }
+
+    /* FIXME: We should get the modifier and format info with blob resources */
+    modifier_hi = fourcc_mod_code(INTEL, I915_FORMAT_MOD_X_TILED) >> 32;
+    modifier_lo = fourcc_mod_code(INTEL,I915_FORMAT_MOD_X_TILED) & 0xFFFFFFFF;
+    modifier = ((uint64_t)modifier_hi << 32) | modifier_lo;
+
+    dmabuf = g_new0(VGPUDMABuf, 1);
+    dmabuf->dmabuf_id = ids++;
+    dmabuf->buf.width = res->width;
+    dmabuf->buf.height = res->height;
+    dmabuf->buf.stride = pixman_image_get_stride(res->image);
+    dmabuf->buf.fourcc = DRM_FORMAT_XRGB8888;
+    dmabuf->buf.modifier = modifier;
+    dmabuf->buf.fd = dmabuf_fd;
+
+    QTAILQ_INSERT_HEAD(&g->dmabuf.bufs, dmabuf, next);
+    g_free(create);
+
+    return dmabuf;
+}
+
+static void virtio_gpu_free_one_dmabuf(VirtIOGPU *g, VGPUDMABuf *dmabuf,
+                                       struct virtio_gpu_scanout *scanout)
+{
+    QTAILQ_REMOVE(&g->dmabuf.bufs, dmabuf, next);
+    dpy_gl_release_dmabuf(scanout->con, &dmabuf->buf);
+
+    close(dmabuf->buf.fd);
+    g_free(dmabuf);
+}
+
+static void virtio_gpu_free_dmabufs(VirtIOGPU *g,
+                                    struct virtio_gpu_scanout *scanout)
+{
+    VGPUDMABuf *dmabuf, *tmp;
+    uint32_t keep = 1;
+
+    QTAILQ_FOREACH_SAFE(dmabuf, &g->dmabuf.bufs, next, tmp) {
+        if (keep > 0) {
+            keep--;
+            continue;
+        }
+        assert(dmabuf != g->dmabuf.primary);
+        virtio_gpu_free_one_dmabuf(g, dmabuf, scanout);
+    }
+}
+
+static int virtio_gpu_dmabuf_update(VirtIOGPU *g,
+                                    struct virtio_gpu_simple_resource *res,
+                                    struct virtio_gpu_scanout *scanout)
+{
+    VGPUDMABuf *primary;
+    bool free_bufs = false;
+
+    primary = virtio_gpu_get_dmabuf(g, res);
+    if (!primary) {
+        return -EINVAL;
+    }
+
+    if (g->dmabuf.primary != primary) {
+        g->dmabuf.primary = primary;
+        qemu_console_resize(scanout->con,
+                            primary->buf.width, primary->buf.height);
+        dpy_gl_scanout_dmabuf(scanout->con, &primary->buf);
+        free_bufs = true;
+    }
+
+    dpy_gl_update(scanout->con, 0, 0, primary->buf.width, primary->buf.height);
+
+    if (free_bufs) {
+        virtio_gpu_free_dmabufs(g, scanout);
+    }
+
+    return 0;
+}
+
 static void virtio_gpu_set_scanout(VirtIOGPU *g,
                                    struct virtio_gpu_ctrl_command *cmd)
 {
@@ -528,6 +647,7 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
     uint32_t offset;
     int bpp;
     struct virtio_gpu_set_scanout ss;
+    int ret;
 
     VIRTIO_GPU_FILL_CMD(ss);
     virtio_gpu_bswap_32(&ss, sizeof(ss));
@@ -574,6 +694,12 @@ static void virtio_gpu_set_scanout(VirtIOGPU *g,
 
     scanout = &g->parent_obj.scanout[ss.scanout_id];
 
+    if (udmabuf_fd > 0) {
+        ret = virtio_gpu_dmabuf_update(g, res, scanout);
+        if (!ret)
+            return;
+    }
+
     format = pixman_image_get_format(res->image);
     bpp = DIV_ROUND_UP(PIXMAN_FORMAT_BPP(format), 8);
     offset = (ss.r.x * bpp) + ss.r.y * pixman_image_get_stride(res->image);
@@ -1139,6 +1265,13 @@ static void virtio_gpu_device_realize(DeviceState *qdev, Error **errp)
         return;
     }
 
+    udmabuf_fd = open("/dev/udmabuf", O_RDWR);
+    if (udmabuf_fd < 0) {
+        error_setg_errno(errp, errno,
+                         "udmabuf: failed to open vhost device");
+        return;
+    }
+
     g->ctrl_vq = virtio_get_queue(vdev, 0);
     g->cursor_vq = virtio_get_queue(vdev, 1);
     g->ctrl_bh = qemu_bh_new(virtio_gpu_ctrl_bh, g);
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c..153f3364a9 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -131,6 +131,13 @@ struct VirtIOGPUBaseClass {
     DEFINE_PROP_UINT32("xres", _state, _conf.xres, 1024), \
     DEFINE_PROP_UINT32("yres", _state, _conf.yres, 768)
 
+typedef struct VGPUDMABuf {
+    QemuDmaBuf buf;
+    uint32_t x, y;
+    uint64_t dmabuf_id;
+    QTAILQ_ENTRY(VGPUDMABuf) next;
+} VGPUDMABuf;
+
 struct VirtIOGPU {
     VirtIOGPUBase parent_obj;
 
@@ -161,6 +168,11 @@ struct VirtIOGPU {
         uint32_t req_3d;
         uint32_t bytes_3d;
     } stats;
+
+    struct {
+        QTAILQ_HEAD(, VGPUDMABuf) bufs;
+        VGPUDMABuf *primary;
+    } dmabuf;
 };
 
 struct VhostUserGPU {
-- 
2.26.2


