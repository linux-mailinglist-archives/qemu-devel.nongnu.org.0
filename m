Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D406392337
	for <lists+qemu-devel@lfdr.de>; Thu, 27 May 2021 01:29:02 +0200 (CEST)
Received: from localhost ([::1]:46562 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lm2xR-0005GS-7S
	for lists+qemu-devel@lfdr.de; Wed, 26 May 2021 19:29:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vc-0002ii-9j
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:08 -0400
Received: from mga01.intel.com ([192.55.52.88]:11260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lm2vZ-00020N-Ib
 for qemu-devel@nongnu.org; Wed, 26 May 2021 19:27:07 -0400
IronPort-SDR: g9F2HyWFnAR8kvrQxmMj3gKsTKl7SnSMP7s76q6GCE2+TQDOiW1P1wZBQUtC8J+4esBUj8t9h+
 g7beEOjajq5Q==
X-IronPort-AV: E=McAfee;i="6200,9189,9996"; a="223801541"
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="223801541"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
IronPort-SDR: LBExXBTsLwesYzFS2Q88+nKBfHMTjh9zgoYYIGJo+9D4dXa7EbtP/cfixGhxUeW07gWneE0Kdi
 ZGVppXMEdwPA==
X-IronPort-AV: E=Sophos;i="5.82,333,1613462400"; d="scan'208";a="477188135"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 May 2021 16:26:56 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 03/14] virtio-gpu: Add udmabuf helpers
Date: Wed, 26 May 2021 16:14:18 -0700
Message-Id: <20210526231429.1045476-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
References: <20210526231429.1045476-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.88;
 envelope-from=vivek.kasireddy@intel.com; helo=mga01.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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
 hw/display/meson.build          |   1 +
 hw/display/virtio-gpu-udmabuf.c | 158 ++++++++++++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h  |  11 +++
 3 files changed, 170 insertions(+)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c

diff --git a/hw/display/meson.build b/hw/display/meson.build
index aaf797c5e9..e1f473c1df 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,6 +56,7 @@ if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
                     if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman])
+  virtio_gpu_ss.add(when: 'CONFIG_LINUX', if_true: files('virtio-gpu-udmabuf.c'))
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
   hw_display_modules += {'virtio-gpu': virtio_gpu_ss}
 
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
new file mode 100644
index 0000000000..71c4672e32
--- /dev/null
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -0,0 +1,158 @@
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
+#include "exec/ramblock.h"
+#include "sysemu/hostmem.h"
+#include <sys/ioctl.h>
+#include <fcntl.h>
+#include <linux/memfd.h>
+#include "qemu/memfd.h"
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


