Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A75037B20C
	for <lists+qemu-devel@lfdr.de>; Wed, 12 May 2021 01:02:13 +0200 (CEST)
Received: from localhost ([::1]:47118 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lgbOG-0001hR-5G
	for lists+qemu-devel@lfdr.de; Tue, 11 May 2021 19:02:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36056)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM4-0007SD-2N
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:56 -0400
Received: from mga05.intel.com ([192.55.52.43]:2826)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lgbM1-000674-2L
 for qemu-devel@nongnu.org; Tue, 11 May 2021 18:59:55 -0400
IronPort-SDR: qh4aBnuLm3uGBwduOdzM5dxbVcrPwLO5oHaqYrBHBFR+CkcG2OxqFgk6UXfNwusnQWyFK6rGzc
 FGytKLLA2zTg==
X-IronPort-AV: E=McAfee;i="6200,9189,9981"; a="285065717"
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="285065717"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:40 -0700
IronPort-SDR: 2tY5TxMaXuCYtailEVW14fVIU7UwwgA9QL5JswF/zV/jzaJShLynkcREPeHNELUYKgbMvKUvpk
 iVbbTZEIX8xA==
X-IronPort-AV: E=Sophos;i="5.82,291,1613462400"; d="scan'208";a="436883287"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 May 2021 15:59:40 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 03/13] virtio-gpu: Add udmabuf helpers
Date: Tue, 11 May 2021 15:47:09 -0700
Message-Id: <20210511224719.387443-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210511224719.387443-1-vivek.kasireddy@intel.com>
References: <20210511224719.387443-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43;
 envelope-from=vivek.kasireddy@intel.com; helo=mga05.intel.com
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

Add helper functions to create a dmabuf for a resource and mmap it.
Also, introduce the fields blob and blob_size so that these helpers
can start to use them but the full picture will emerge only after
adding create_blob API in patch 8 of this series.

To be able to create a dmabuf using the udmabuf driver, Qemu needs
to be lauched with the memfd memory backend like this:

qemu-system-x86_64 -m 8192m -object memory-backend-memfd,id=mem1,size=8192M
-machine memory-backend=mem1

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/meson.build          |   2 +-
 hw/display/virtio-gpu-udmabuf.c | 181 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  |  11 ++
 3 files changed, 193 insertions(+), 1 deletion(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 612cd6582d..576dea7a9d 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,7 +56,7 @@ softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
-                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
+                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c', 'virtio-gpu-udmabuf.c'), pixman])
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
new file mode 100644
index 0000000000..3f569ae9c8
--- /dev/null
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -0,0 +1,181 @@
+/*
+ * Virtio GPU Device
+ *
+ * Copyright Red Hat, Inc. 2013-2014
+ *
+ * Authors:
+ *     Dave Airlie <airlied@redhat.com>
+ *     Gerd Hoffmann <kraxel@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qemu-common.h"
+#include "qemu/iov.h"
+#include "ui/console.h"
+#include "hw/virtio/virtio-gpu.h"
+#include "hw/virtio/virtio-gpu-pixman.h"
+#include "trace.h"
+
+#ifdef CONFIG_LINUX
+
+#include "exec/ramblock.h"
+#include "sysemu/hostmem.h"
+#include <sys/fcntl.h>
+#include <sys/ioctl.h>
+#include <linux/memfd.h>
+#include "standard-headers/linux/udmabuf.h"
+
+static void virtio_gpu_create_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    struct udmabuf_create_list *list;
+    RAMBlock *rb;
+    ram_addr_t offset;
+    int udmabuf, i;
+
+    udmabuf = udmabuf_fd();
+    if (udmabuf < 0) {
+        return;
+    }
+
+    list = g_malloc0(sizeof(struct udmabuf_create_list) +
+                     sizeof(struct udmabuf_create_item) * res->iov_cnt);
+
+    for (i = 0; i < res->iov_cnt; i++) {
+        rcu_read_lock();
+        rb = qemu_ram_block_from_host(res->iov[i].iov_base, false, &offset);
+        rcu_read_unlock();
+
+        if (!rb || rb->fd < 0) {
+            g_free(list);
+            return;
+        }
+
+        list->list[i].memfd  = rb->fd;
+        list->list[i].offset = offset;
+        list->list[i].size   = res->iov[i].iov_len;
+    }
+
+    list->count = res->iov_cnt;
+    list->flags = UDMABUF_FLAGS_CLOEXEC;
+
+    res->dmabuf_fd = ioctl(udmabuf, UDMABUF_CREATE_LIST, list);
+    if (res->dmabuf_fd < 0) {
+        warn_report("%s: UDMABUF_CREATE_LIST: %s", __func__,
+                    strerror(errno));
+    }
+    g_free(list);
+}
+
+static void virtio_gpu_remap_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    res->remapped = mmap(NULL, res->blob_size, PROT_READ,
+                         MAP_SHARED, res->dmabuf_fd, 0);
+    if (res->remapped == MAP_FAILED) {
+        warn_report("%s: dmabuf mmap failed: %s", __func__,
+                    strerror(errno));
+        res->remapped = NULL;
+    }
+}
+
+static void virtio_gpu_destroy_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    if (res->remapped) {
+        munmap(res->remapped, res->blob_size);
+        res->remapped = NULL;
+    }
+    if (res->dmabuf_fd >= 0) {
+        close(res->dmabuf_fd);
+        res->dmabuf_fd = -1;
+    }
+}
+
+static int find_memory_backend_type(Object *obj, void *opaque)
+{
+    bool *memfd_backend = opaque;
+    int ret;
+
+    if (object_dynamic_cast(obj, TYPE_MEMORY_BACKEND)) {
+        HostMemoryBackend *backend = MEMORY_BACKEND(obj);
+        RAMBlock *rb = backend->mr.ram_block;
+
+        if (rb && rb->fd > 0) {
+            ret = fcntl(rb->fd, F_GET_SEALS);
+            if (ret > 0) {
+                *memfd_backend = true;
+            }
+        }
+    }
+
+    return 0;
+}
+
+bool virtio_gpu_have_udmabuf(void)
+{
+    Object *memdev_root;
+    int udmabuf;
+    bool memfd_backend = false;
+
+    udmabuf = udmabuf_fd();
+    if (udmabuf < 0) {
+        return false;
+    }
+
+    memdev_root = object_resolve_path("/objects", NULL);
+    object_child_foreach(memdev_root, find_memory_backend_type, &memfd_backend);
+
+    return memfd_backend;
+}
+
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    void *pdata = NULL;
+
+    res->dmabuf_fd = -1;
+    if (res->iov_cnt == 1) {
+        pdata = res->iov[0].iov_base;
+    } else {
+        virtio_gpu_create_udmabuf(res);
+        if (res->dmabuf_fd < 0) {
+            return;
+        }
+        virtio_gpu_remap_udmabuf(res);
+        if (!res->remapped) {
+            return;
+        }
+        pdata = res->remapped;
+    }
+
+    res->blob = pdata;
+}
+
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    if (res->remapped) {
+        virtio_gpu_destroy_udmabuf(res);
+    }
+}
+
+#else
+
+bool virtio_gpu_have_udmabuf(void)
+{
+    /* nothing (stub) */
+    return false;
+}
+
+void *virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+    return NULL
+}
+
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+}
+
+#endif
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index 8ca2c55d9a..265b1c516c 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -50,6 +50,12 @@ struct virtio_gpu_simple_resource {
     uint32_t scanout_bitmask;
     pixman_image_t *image;
     uint64_t hostmem;
+
+    uint64_t blob_size;
+    void *blob;
+    int dmabuf_fd;
+    uint8_t *remapped;
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
@@ -238,6 +244,11 @@ void virtio_gpu_update_cursor_data(VirtIOGPU *g,
                                    struct virtio_gpu_scanout *s,
                                    uint32_t resource_id);
 
+/* virtio-gpu-udmabuf.c */
+bool virtio_gpu_have_udmabuf(void);
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res);
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
+
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
-- 
2.30.2


