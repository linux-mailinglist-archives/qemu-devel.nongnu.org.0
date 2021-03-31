Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6888534F769
	for <lists+qemu-devel@lfdr.de>; Wed, 31 Mar 2021 05:23:49 +0200 (CEST)
Received: from localhost ([::1]:40640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lRRSO-0004Fd-FU
	for lists+qemu-devel@lfdr.de; Tue, 30 Mar 2021 23:23:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36516)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQW-0002a6-IB
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:52 -0400
Received: from mga18.intel.com ([134.134.136.126]:53064)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vivek.kasireddy@intel.com>)
 id 1lRRQT-00055o-4m
 for qemu-devel@nongnu.org; Tue, 30 Mar 2021 23:21:52 -0400
IronPort-SDR: AqzzzGHBSKJAV1N0jO0LqTexelh857pwMDYqVqDqsYAHxt/04PgTiz4h+t/9e/2sWcP1l7M4rj
 mXv1Vq1NjEIw==
X-IronPort-AV: E=McAfee;i="6000,8403,9939"; a="179449770"
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="179449770"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:34 -0700
IronPort-SDR: 0vUWOJdD/N+H0tindbOBEOHPNmzsAQ5ARzxde/JbO5LpMTaonni1aqa+i1zjrY2pPK/1/yAl3P
 feK8ko1AOVbQ==
X-IronPort-AV: E=Sophos;i="5.81,291,1610438400"; d="scan'208";a="418454113"
Received: from vkasired-desk2.fm.intel.com ([10.105.128.127])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Mar 2021 20:21:33 -0700
From: Vivek Kasireddy <vivek.kasireddy@intel.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] virtio-gpu: Add udmabuf helpers
Date: Tue, 30 Mar 2021 20:09:53 -0700
Message-Id: <20210331031001.1564125-4-vivek.kasireddy@intel.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
References: <20210331031001.1564125-1-vivek.kasireddy@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=vivek.kasireddy@intel.com; helo=mga18.intel.com
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
To be able to create a dmabuf using the udmabuf driver, Qemu needs
to be lauched with the memfd memory backend like this:

qemu-system-x86_64 -m 8192m -object memory-backend-memfd,id=mem1,size=8192M
-machine memory-backend=mem1

Based-on-patch-by: Gerd Hoffmann <kraxel@redhat.com>
Signed-off-by: Vivek Kasireddy <vivek.kasireddy@intel.com>
---
 hw/display/meson.build                   |   2 +-
 hw/display/virtio-gpu-udmabuf.c          | 182 +++++++++++++++++++++++
 include/hw/virtio/virtio-gpu.h           |  10 ++
 include/standard-headers/linux/udmabuf.h |  32 ++++
 scripts/update-linux-headers.sh          |   3 +
 5 files changed, 228 insertions(+), 1 deletion(-)
 create mode 100644 hw/display/virtio-gpu-udmabuf.c
 create mode 100644 include/standard-headers/linux/udmabuf.h

diff --git a/hw/display/meson.build b/hw/display/meson.build
index 9d79e3951d..e0fa88d62f 100644
--- a/hw/display/meson.build
+++ b/hw/display/meson.build
@@ -56,7 +56,7 @@ softmmu_ss.add(when: [pixman, 'CONFIG_ATI_VGA'], if_true: files('ati.c', 'ati_2d
 if config_all_devices.has_key('CONFIG_VIRTIO_GPU')
   virtio_gpu_ss = ss.source_set()
   virtio_gpu_ss.add(when: 'CONFIG_VIRTIO_GPU',
-                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c'), pixman, virgl])
+                    if_true: [files('virtio-gpu-base.c', 'virtio-gpu.c', 'virtio-gpu-udmabuf.c'), pixman, virgl])
   virtio_gpu_ss.add(when: ['CONFIG_VIRTIO_GPU', 'CONFIG_VIRGL'],
                     if_true: [files('virtio-gpu-3d.c'), pixman, virgl])
   virtio_gpu_ss.add(when: 'CONFIG_VHOST_USER_GPU', if_true: files('vhost-user-gpu.c'))
diff --git a/hw/display/virtio-gpu-udmabuf.c b/hw/display/virtio-gpu-udmabuf.c
new file mode 100644
index 0000000000..8d0fe1ce4a
--- /dev/null
+++ b/hw/display/virtio-gpu-udmabuf.c
@@ -0,0 +1,182 @@
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
+    res->remapsz = res->width * res->height * 4;
+    res->remapsz = QEMU_ALIGN_UP(res->remapsz, getpagesize());
+
+    res->remapped = mmap(NULL, res->remapsz, PROT_READ,
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
+        munmap(res->remapped, res->remapsz);
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
+    if (udmabuf < 0)
+        return false;
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
+    (void) pdata;
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
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+}
+
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res)
+{
+    /* nothing (stub) */
+}
+
+#endif
diff --git a/include/hw/virtio/virtio-gpu.h b/include/hw/virtio/virtio-gpu.h
index fae149235c..a4b7738d8a 100644
--- a/include/hw/virtio/virtio-gpu.h
+++ b/include/hw/virtio/virtio-gpu.h
@@ -47,6 +47,11 @@ struct virtio_gpu_simple_resource {
     uint32_t scanout_bitmask;
     pixman_image_t *image;
     uint64_t hostmem;
+
+    int dmabuf_fd;
+    size_t remapsz;
+    uint8_t *remapped;
+
     QTAILQ_ENTRY(virtio_gpu_simple_resource) next;
 };
 
@@ -214,6 +219,11 @@ void virtio_gpu_cleanup_mapping_iov(VirtIOGPU *g,
                                     struct iovec *iov, uint32_t count);
 void virtio_gpu_process_cmdq(VirtIOGPU *g);
 
+/* virtio-gpu-udmabuf.c */
+bool virtio_gpu_have_udmabuf(void);
+void virtio_gpu_init_udmabuf(struct virtio_gpu_simple_resource *res);
+void virtio_gpu_fini_udmabuf(struct virtio_gpu_simple_resource *res);
+
 /* virtio-gpu-3d.c */
 void virtio_gpu_virgl_process_cmd(VirtIOGPU *g,
                                   struct virtio_gpu_ctrl_command *cmd);
diff --git a/include/standard-headers/linux/udmabuf.h b/include/standard-headers/linux/udmabuf.h
new file mode 100644
index 0000000000..e19eb5b5ce
--- /dev/null
+++ b/include/standard-headers/linux/udmabuf.h
@@ -0,0 +1,32 @@
+/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
+#ifndef _LINUX_UDMABUF_H
+#define _LINUX_UDMABUF_H
+
+#include "standard-headers/linux/types.h"
+
+#define UDMABUF_FLAGS_CLOEXEC	0x01
+
+struct udmabuf_create {
+	uint32_t memfd;
+	uint32_t flags;
+	uint64_t offset;
+	uint64_t size;
+};
+
+struct udmabuf_create_item {
+	uint32_t memfd;
+	uint32_t __pad;
+	uint64_t offset;
+	uint64_t size;
+};
+
+struct udmabuf_create_list {
+	uint32_t flags;
+	uint32_t count;
+	struct udmabuf_create_item list[];
+};
+
+#define UDMABUF_CREATE       _IOW('u', 0x42, struct udmabuf_create)
+#define UDMABUF_CREATE_LIST  _IOW('u', 0x43, struct udmabuf_create_list)
+
+#endif /* _LINUX_UDMABUF_H */
diff --git a/scripts/update-linux-headers.sh b/scripts/update-linux-headers.sh
index 1050e36169..fea4d6eb65 100755
--- a/scripts/update-linux-headers.sh
+++ b/scripts/update-linux-headers.sh
@@ -34,6 +34,7 @@ cp_portable() {
     if
         grep '#include' "$f" | grep -v -e 'linux/virtio' \
                                      -e 'linux/types' \
+                                     -e 'linux/ioctl' \
                                      -e 'stdint' \
                                      -e 'linux/if_ether' \
                                      -e 'input-event-codes' \
@@ -66,6 +67,7 @@ cp_portable() {
         -e 's/__BITS_PER_LONG/HOST_LONG_BITS/' \
         -e '/\"drm.h\"/d' \
         -e '/sys\/ioctl.h/d' \
+        -e '/linux\/ioctl.h/d' \
         -e 's/SW_MAX/SW_MAX_/' \
         -e 's/atomic_t/int/' \
         -e 's/__kernel_long_t/long/' \
@@ -190,6 +192,7 @@ for i in "$tmpdir"/include/linux/*virtio*.h \
          "$tmpdir/include/linux/fuse.h" \
          "$tmpdir/include/linux/input.h" \
          "$tmpdir/include/linux/input-event-codes.h" \
+         "$tmpdir/include/linux/udmabuf.h" \
          "$tmpdir/include/linux/pci_regs.h" \
          "$tmpdir/include/linux/ethtool.h" \
          "$tmpdir/include/linux/const.h" \
-- 
2.26.2


