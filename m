Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88921519955
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 10:11:09 +0200 (CEST)
Received: from localhost ([::1]:57592 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmA6G-000818-JK
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 04:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9dD-0002d5-6t
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:41:20 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631]:36823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <xieyongji@bytedance.com>)
 id 1nm9d4-00071j-FF
 for qemu-devel@nongnu.org; Wed, 04 May 2022 03:41:06 -0400
Received: by mail-pl1-x631.google.com with SMTP id j14so725185plx.3
 for <qemu-devel@nongnu.org>; Wed, 04 May 2022 00:40:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=qkkPcdiU131/DjQPREghV5QoLOEEv6F39/IE5pShiSk=;
 b=bC56yj3Mmy/d0vy6onPsXNSz80a58nDQQJ1GT07e9wbKzS7U4FGRN9jJ1mqSGa20hU
 1d7mFIePwHhPPcMCqT5qCZ/qGR9PwEolD6VTV3bhoVySomy7VyXdHa9/heQKJN63L7wI
 7C3LRWAa10JYYoZkTo8o8Q7Z3XIq4GjctA/Wcb+ZdJ9BvccX1m3Ys8Z4jomYt4fwGZE9
 4kuDFEf2uuouSAtiSs1vRsGJFpPJhxhjqLMgTIvTuxy3/XXY4h2HiJPkHy4lQiXt2+Dp
 wPdfP65371uYlR4CnAvVUCQVKd0KaKpvhUzsZZKeU5WhQk/HlaG/gJP5ONlPnpZbD7j+
 Tg+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=qkkPcdiU131/DjQPREghV5QoLOEEv6F39/IE5pShiSk=;
 b=wK+nVPA2NFDSRaUkmYJw3UbyF9uB8bzzddBiIeHxP3Pq0uK/UlkoDeF/yLNMRaOrJM
 DePGKLrXvLbREdR00tSJS8LJXSYxgIOfySNsH9ldXUEESUyZ+59GygreFK79lLZlVyS2
 KvCmO4MRBKq3qshKSgwH56uoTfjsSw0paUFpsYD53Db0HWo0k+XIg64Ma17hWsXDGQA+
 wROKdLuabUHyLpxnUQQ3ISStPbZXGWe2l0uJaBFF/2U4UdvopCWJKwjyiUpUDYGRvL36
 RZgeh5ass2u3gSgnathMmQZqQiDPQ/xSUG03mfe0gAANAFomLidwLZ7PdxsYXajviWbV
 cDcQ==
X-Gm-Message-State: AOAM531qjg+kUwIXJKkCPXOu3Js7q38BcAcNumpxSglFKV6jAPLnma6X
 Ex2G9Qx3qDphAHLzlrRyE3fz
X-Google-Smtp-Source: ABdhPJzN7yTKKhcy06opycK8LHD4lvOB1JQ8QNWE6luLtbSyTgGGmwxNQXZjOBuVq9sDP0ULMUlLAg==
X-Received: by 2002:a17:90a:930b:b0:1d5:684b:8e13 with SMTP id
 p11-20020a17090a930b00b001d5684b8e13mr8943477pjo.153.1651650056985; 
 Wed, 04 May 2022 00:40:56 -0700 (PDT)
Received: from localhost ([139.177.225.233]) by smtp.gmail.com with ESMTPSA id
 m1-20020a637d41000000b003c14af5063esm14235702pgn.86.2022.05.04.00.40.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 00:40:56 -0700 (PDT)
From: Xie Yongji <xieyongji@bytedance.com>
To: mst@redhat.com, jasowang@redhat.com, stefanha@redhat.com,
 sgarzare@redhat.com, kwolf@redhat.com, mreitz@redhat.com,
 mlureau@redhat.com, jsnow@redhat.com, eblake@redhat.com,
 Coiby.Xu@gmail.com, hreitz@redhat.com
Cc: qemu-block@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v5 5/8] libvduse: Add VDUSE (vDPA Device in Userspace) library
Date: Wed,  4 May 2022 15:40:48 +0800
Message-Id: <20220504074051.90-6-xieyongji@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504074051.90-1-xieyongji@bytedance.com>
References: <20220504074051.90-1-xieyongji@bytedance.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=xieyongji@bytedance.com; helo=mail-pl1-x631.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VDUSE [1] is a linux framework that makes it possible to implement
software-emulated vDPA devices in userspace. This adds a library
as a subproject to help implementing VDUSE backends in QEMU.

[1] https://www.kernel.org/doc/html/latest/userspace-api/vduse.html

Signed-off-by: Xie Yongji <xieyongji@bytedance.com>
---
 MAINTAINERS                                 |    5 +
 meson.build                                 |   15 +
 meson_options.txt                           |    2 +
 scripts/meson-buildoptions.sh               |    3 +
 subprojects/libvduse/include/atomic.h       |    1 +
 subprojects/libvduse/include/compiler.h     |    1 +
 subprojects/libvduse/libvduse.c             | 1161 +++++++++++++++++++
 subprojects/libvduse/libvduse.h             |  235 ++++
 subprojects/libvduse/linux-headers/linux    |    1 +
 subprojects/libvduse/meson.build            |   10 +
 subprojects/libvduse/standard-headers/linux |    1 +
 11 files changed, 1435 insertions(+)
 create mode 120000 subprojects/libvduse/include/atomic.h
 create mode 120000 subprojects/libvduse/include/compiler.h
 create mode 100644 subprojects/libvduse/libvduse.c
 create mode 100644 subprojects/libvduse/libvduse.h
 create mode 120000 subprojects/libvduse/linux-headers/linux
 create mode 100644 subprojects/libvduse/meson.build
 create mode 120000 subprojects/libvduse/standard-headers/linux

diff --git a/MAINTAINERS b/MAINTAINERS
index 4113b6fc5c..6de3cbaa1e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3550,6 +3550,11 @@ L: qemu-block@nongnu.org
 S: Supported
 F: block/export/fuse.c
 
+VDUSE library
+M: Xie Yongji <xieyongji@bytedance.com>
+S: Maintained
+F: subprojects/libvduse/
+
 Replication
 M: Wen Congyang <wencongyang2@huawei.com>
 M: Xie Changlong <xiechanglong.d@gmail.com>
diff --git a/meson.build b/meson.build
index 1fe7d257ff..4a0f1a2016 100644
--- a/meson.build
+++ b/meson.build
@@ -1392,6 +1392,21 @@ if get_option('fuse_lseek').allowed()
   endif
 endif
 
+have_libvduse = (targetos == 'linux')
+if get_option('libvduse').enabled()
+    if targetos != 'linux'
+        error('libvduse requires linux')
+    endif
+elif get_option('libvduse').disabled()
+    have_libvduse = false
+endif
+
+libvduse = not_found
+if have_libvduse
+  libvduse_proj = subproject('libvduse')
+  libvduse = libvduse_proj.get_variable('libvduse_dep')
+endif
+
 # libbpf
 libbpf = dependency('libbpf', required: get_option('bpf'), method: 'pkg-config')
 if libbpf.found() and not cc.links('''
diff --git a/meson_options.txt b/meson_options.txt
index af432a4ee6..47955f972d 100644
--- a/meson_options.txt
+++ b/meson_options.txt
@@ -231,6 +231,8 @@ option('virtfs', type: 'feature', value: 'auto',
        description: 'virtio-9p support')
 option('virtiofsd', type: 'feature', value: 'auto',
        description: 'build virtiofs daemon (virtiofsd)')
+option('libvduse', type: 'feature', value: 'auto',
+       description: 'build VDUSE Library')
 
 option('capstone', type: 'combo', value: 'auto',
        choices: ['disabled', 'enabled', 'auto', 'system', 'internal'],
diff --git a/scripts/meson-buildoptions.sh b/scripts/meson-buildoptions.sh
index 21366b2102..f725636ea8 100644
--- a/scripts/meson-buildoptions.sh
+++ b/scripts/meson-buildoptions.sh
@@ -81,6 +81,7 @@ meson_options_help() {
   printf "%s\n" '  libssh          ssh block device support'
   printf "%s\n" '  libudev         Use libudev to enumerate host devices'
   printf "%s\n" '  libusb          libusb support for USB passthrough'
+  printf "%s\n" '  libvduse        build VDUSE Library'
   printf "%s\n" '  linux-aio       Linux AIO support'
   printf "%s\n" '  linux-io-uring  Linux io_uring support'
   printf "%s\n" '  live-block-migration'
@@ -255,6 +256,8 @@ _meson_option_parse() {
     --disable-libudev) printf "%s" -Dlibudev=disabled ;;
     --enable-libusb) printf "%s" -Dlibusb=enabled ;;
     --disable-libusb) printf "%s" -Dlibusb=disabled ;;
+    --enable-libvduse) printf "%s" -Dlibvduse=enabled ;;
+    --disable-libvduse) printf "%s" -Dlibvduse=disabled ;;
     --enable-linux-aio) printf "%s" -Dlinux_aio=enabled ;;
     --disable-linux-aio) printf "%s" -Dlinux_aio=disabled ;;
     --enable-linux-io-uring) printf "%s" -Dlinux_io_uring=enabled ;;
diff --git a/subprojects/libvduse/include/atomic.h b/subprojects/libvduse/include/atomic.h
new file mode 120000
index 0000000000..8c2be64f7b
--- /dev/null
+++ b/subprojects/libvduse/include/atomic.h
@@ -0,0 +1 @@
+../../../include/qemu/atomic.h
\ No newline at end of file
diff --git a/subprojects/libvduse/include/compiler.h b/subprojects/libvduse/include/compiler.h
new file mode 120000
index 0000000000..de7b70697c
--- /dev/null
+++ b/subprojects/libvduse/include/compiler.h
@@ -0,0 +1 @@
+../../../include/qemu/compiler.h
\ No newline at end of file
diff --git a/subprojects/libvduse/libvduse.c b/subprojects/libvduse/libvduse.c
new file mode 100644
index 0000000000..ecee9c0568
--- /dev/null
+++ b/subprojects/libvduse/libvduse.c
@@ -0,0 +1,1161 @@
+/*
+ * VDUSE (vDPA Device in Userspace) library
+ *
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *   Portions of codes and concepts borrowed from libvhost-user.c, so:
+ *     Copyright IBM, Corp. 2007
+ *     Copyright (c) 2016 Red Hat, Inc.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *   Anthony Liguori <aliguori@us.ibm.com>
+ *   Marc-André Lureau <mlureau@redhat.com>
+ *   Victor Kaplansky <victork@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#include <stdlib.h>
+#include <stdio.h>
+#include <stdbool.h>
+#include <stddef.h>
+#include <errno.h>
+#include <string.h>
+#include <assert.h>
+#include <endian.h>
+#include <unistd.h>
+#include <limits.h>
+#include <fcntl.h>
+
+#include <sys/ioctl.h>
+#include <sys/eventfd.h>
+#include <sys/mman.h>
+
+#include "include/atomic.h"
+#include "linux-headers/linux/virtio_ring.h"
+#include "linux-headers/linux/virtio_config.h"
+#include "linux-headers/linux/vduse.h"
+#include "libvduse.h"
+
+#define VDUSE_VQ_ALIGN 4096
+#define MAX_IOVA_REGIONS 256
+
+/* Round number down to multiple */
+#define ALIGN_DOWN(n, m) ((n) / (m) * (m))
+
+/* Round number up to multiple */
+#define ALIGN_UP(n, m) ALIGN_DOWN((n) + (m) - 1, (m))
+
+#ifndef unlikely
+#define unlikely(x)   __builtin_expect(!!(x), 0)
+#endif
+
+typedef struct VduseRing {
+    unsigned int num;
+    uint64_t desc_addr;
+    uint64_t avail_addr;
+    uint64_t used_addr;
+    struct vring_desc *desc;
+    struct vring_avail *avail;
+    struct vring_used *used;
+} VduseRing;
+
+struct VduseVirtq {
+    VduseRing vring;
+    uint16_t last_avail_idx;
+    uint16_t shadow_avail_idx;
+    uint16_t used_idx;
+    uint16_t signalled_used;
+    bool signalled_used_valid;
+    int index;
+    int inuse;
+    bool ready;
+    int fd;
+    VduseDev *dev;
+};
+
+typedef struct VduseIovaRegion {
+    uint64_t iova;
+    uint64_t size;
+    uint64_t mmap_offset;
+    uint64_t mmap_addr;
+} VduseIovaRegion;
+
+struct VduseDev {
+    VduseVirtq *vqs;
+    VduseIovaRegion regions[MAX_IOVA_REGIONS];
+    int num_regions;
+    char *name;
+    uint32_t device_id;
+    uint32_t vendor_id;
+    uint16_t num_queues;
+    uint16_t queue_size;
+    uint64_t features;
+    const VduseOps *ops;
+    int fd;
+    int ctrl_fd;
+    void *priv;
+};
+
+static inline bool has_feature(uint64_t features, unsigned int fbit)
+{
+    assert(fbit < 64);
+    return !!(features & (1ULL << fbit));
+}
+
+static inline bool vduse_dev_has_feature(VduseDev *dev, unsigned int fbit)
+{
+    return has_feature(dev->features, fbit);
+}
+
+uint64_t vduse_get_virtio_features(void)
+{
+    return (1ULL << VIRTIO_F_IOMMU_PLATFORM) |
+           (1ULL << VIRTIO_F_VERSION_1) |
+           (1ULL << VIRTIO_F_NOTIFY_ON_EMPTY) |
+           (1ULL << VIRTIO_RING_F_EVENT_IDX) |
+           (1ULL << VIRTIO_RING_F_INDIRECT_DESC);
+}
+
+VduseDev *vduse_queue_get_dev(VduseVirtq *vq)
+{
+    return vq->dev;
+}
+
+int vduse_queue_get_fd(VduseVirtq *vq)
+{
+    return vq->fd;
+}
+
+void *vduse_dev_get_priv(VduseDev *dev)
+{
+    return dev->priv;
+}
+
+VduseVirtq *vduse_dev_get_queue(VduseDev *dev, int index)
+{
+    return &dev->vqs[index];
+}
+
+int vduse_dev_get_fd(VduseDev *dev)
+{
+    return dev->fd;
+}
+
+static int vduse_inject_irq(VduseDev *dev, int index)
+{
+    return ioctl(dev->fd, VDUSE_VQ_INJECT_IRQ, &index);
+}
+
+static void vduse_iova_remove_region(VduseDev *dev, uint64_t start,
+                                     uint64_t last)
+{
+    int i;
+
+    if (last == start) {
+        return;
+    }
+
+    for (i = 0; i < MAX_IOVA_REGIONS; i++) {
+        if (!dev->regions[i].mmap_addr) {
+            continue;
+        }
+
+        if (start <= dev->regions[i].iova &&
+            last >= (dev->regions[i].iova + dev->regions[i].size - 1)) {
+            munmap((void *)dev->regions[i].mmap_addr,
+                   dev->regions[i].mmap_offset + dev->regions[i].size);
+            dev->regions[i].mmap_addr = 0;
+            dev->num_regions--;
+        }
+    }
+}
+
+static int vduse_iova_add_region(VduseDev *dev, int fd,
+                                 uint64_t offset, uint64_t start,
+                                 uint64_t last, int prot)
+{
+    int i;
+    uint64_t size = last - start + 1;
+    void *mmap_addr = mmap(0, size + offset, prot, MAP_SHARED, fd, 0);
+
+    if (mmap_addr == MAP_FAILED) {
+        close(fd);
+        return -EINVAL;
+    }
+
+    for (i = 0; i < MAX_IOVA_REGIONS; i++) {
+        if (!dev->regions[i].mmap_addr) {
+            dev->regions[i].mmap_addr = (uint64_t)(uintptr_t)mmap_addr;
+            dev->regions[i].mmap_offset = offset;
+            dev->regions[i].iova = start;
+            dev->regions[i].size = size;
+            dev->num_regions++;
+            break;
+        }
+    }
+    assert(i < MAX_IOVA_REGIONS);
+    close(fd);
+
+    return 0;
+}
+
+static int perm_to_prot(uint8_t perm)
+{
+    int prot = 0;
+
+    switch (perm) {
+    case VDUSE_ACCESS_WO:
+        prot |= PROT_WRITE;
+        break;
+    case VDUSE_ACCESS_RO:
+        prot |= PROT_READ;
+        break;
+    case VDUSE_ACCESS_RW:
+        prot |= PROT_READ | PROT_WRITE;
+        break;
+    default:
+        break;
+    }
+
+    return prot;
+}
+
+static inline void *iova_to_va(VduseDev *dev, uint64_t *plen, uint64_t iova)
+{
+    int i, ret;
+    struct vduse_iotlb_entry entry;
+
+    for (i = 0; i < MAX_IOVA_REGIONS; i++) {
+        VduseIovaRegion *r = &dev->regions[i];
+
+        if (!r->mmap_addr) {
+            continue;
+        }
+
+        if ((iova >= r->iova) && (iova < (r->iova + r->size))) {
+            if ((iova + *plen) > (r->iova + r->size)) {
+                *plen = r->iova + r->size - iova;
+            }
+            return (void *)(uintptr_t)(iova - r->iova +
+                   r->mmap_addr + r->mmap_offset);
+        }
+    }
+
+    entry.start = iova;
+    entry.last = iova + 1;
+    ret = ioctl(dev->fd, VDUSE_IOTLB_GET_FD, &entry);
+    if (ret < 0) {
+        return NULL;
+    }
+
+    if (!vduse_iova_add_region(dev, ret, entry.offset, entry.start,
+                               entry.last, perm_to_prot(entry.perm))) {
+        return iova_to_va(dev, plen, iova);
+    }
+
+    return NULL;
+}
+
+static inline uint16_t vring_avail_flags(VduseVirtq *vq)
+{
+    return le16toh(vq->vring.avail->flags);
+}
+
+static inline uint16_t vring_avail_idx(VduseVirtq *vq)
+{
+    vq->shadow_avail_idx = le16toh(vq->vring.avail->idx);
+
+    return vq->shadow_avail_idx;
+}
+
+static inline uint16_t vring_avail_ring(VduseVirtq *vq, int i)
+{
+    return le16toh(vq->vring.avail->ring[i]);
+}
+
+static inline uint16_t vring_get_used_event(VduseVirtq *vq)
+{
+    return vring_avail_ring(vq, vq->vring.num);
+}
+
+static bool vduse_queue_get_head(VduseVirtq *vq, unsigned int idx,
+                                 unsigned int *head)
+{
+    /*
+     * Grab the next descriptor number they're advertising, and increment
+     * the index we've seen.
+     */
+    *head = vring_avail_ring(vq, idx % vq->vring.num);
+
+    /* If their number is silly, that's a fatal mistake. */
+    if (*head >= vq->vring.num) {
+        fprintf(stderr, "Guest says index %u is available\n", *head);
+        return false;
+    }
+
+    return true;
+}
+
+static int
+vduse_queue_read_indirect_desc(VduseDev *dev, struct vring_desc *desc,
+                               uint64_t addr, size_t len)
+{
+    struct vring_desc *ori_desc;
+    uint64_t read_len;
+
+    if (len > (VIRTQUEUE_MAX_SIZE * sizeof(struct vring_desc))) {
+        return -1;
+    }
+
+    if (len == 0) {
+        return -1;
+    }
+
+    while (len) {
+        read_len = len;
+        ori_desc = iova_to_va(dev, &read_len, addr);
+        if (!ori_desc) {
+            return -1;
+        }
+
+        memcpy(desc, ori_desc, read_len);
+        len -= read_len;
+        addr += read_len;
+        desc += read_len;
+    }
+
+    return 0;
+}
+
+enum {
+    VIRTQUEUE_READ_DESC_ERROR = -1,
+    VIRTQUEUE_READ_DESC_DONE = 0,   /* end of chain */
+    VIRTQUEUE_READ_DESC_MORE = 1,   /* more buffers in chain */
+};
+
+static int vduse_queue_read_next_desc(struct vring_desc *desc, int i,
+                                      unsigned int max, unsigned int *next)
+{
+    /* If this descriptor says it doesn't chain, we're done. */
+    if (!(le16toh(desc[i].flags) & VRING_DESC_F_NEXT)) {
+        return VIRTQUEUE_READ_DESC_DONE;
+    }
+
+    /* Check they're not leading us off end of descriptors. */
+    *next = desc[i].next;
+    /* Make sure compiler knows to grab that: we don't want it changing! */
+    smp_wmb();
+
+    if (*next >= max) {
+        fprintf(stderr, "Desc next is %u\n", *next);
+        return VIRTQUEUE_READ_DESC_ERROR;
+    }
+
+    return VIRTQUEUE_READ_DESC_MORE;
+}
+
+/*
+ * Fetch avail_idx from VQ memory only when we really need to know if
+ * guest has added some buffers.
+ */
+static bool vduse_queue_empty(VduseVirtq *vq)
+{
+    if (unlikely(!vq->vring.avail)) {
+        return true;
+    }
+
+    if (vq->shadow_avail_idx != vq->last_avail_idx) {
+        return false;
+    }
+
+    return vring_avail_idx(vq) == vq->last_avail_idx;
+}
+
+static bool vduse_queue_should_notify(VduseVirtq *vq)
+{
+    VduseDev *dev = vq->dev;
+    uint16_t old, new;
+    bool v;
+
+    /* We need to expose used array entries before checking used event. */
+    smp_mb();
+
+    /* Always notify when queue is empty (when feature acknowledge) */
+    if (vduse_dev_has_feature(dev, VIRTIO_F_NOTIFY_ON_EMPTY) &&
+        !vq->inuse && vduse_queue_empty(vq)) {
+        return true;
+    }
+
+    if (!vduse_dev_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
+        return !(vring_avail_flags(vq) & VRING_AVAIL_F_NO_INTERRUPT);
+    }
+
+    v = vq->signalled_used_valid;
+    vq->signalled_used_valid = true;
+    old = vq->signalled_used;
+    new = vq->signalled_used = vq->used_idx;
+    return !v || vring_need_event(vring_get_used_event(vq), new, old);
+}
+
+void vduse_queue_notify(VduseVirtq *vq)
+{
+    VduseDev *dev = vq->dev;
+
+    if (unlikely(!vq->vring.avail)) {
+        return;
+    }
+
+    if (!vduse_queue_should_notify(vq)) {
+        return;
+    }
+
+    if (vduse_inject_irq(dev, vq->index) < 0) {
+        fprintf(stderr, "Error inject irq for vq %d: %s\n",
+                vq->index, strerror(errno));
+    }
+}
+
+static inline void vring_used_flags_set_bit(VduseVirtq *vq, int mask)
+{
+    uint16_t *flags;
+
+    flags = (uint16_t *)((char*)vq->vring.used +
+                         offsetof(struct vring_used, flags));
+    *flags = htole16(le16toh(*flags) | mask);
+}
+
+static inline void vring_used_flags_unset_bit(VduseVirtq *vq, int mask)
+{
+    uint16_t *flags;
+
+    flags = (uint16_t *)((char*)vq->vring.used +
+                         offsetof(struct vring_used, flags));
+    *flags = htole16(le16toh(*flags) & ~mask);
+}
+
+static inline void vring_set_avail_event(VduseVirtq *vq, uint16_t val)
+{
+    *((uint16_t *)&vq->vring.used->ring[vq->vring.num]) = htole16(val);
+}
+
+static bool vduse_queue_map_single_desc(VduseVirtq *vq, unsigned int *p_num_sg,
+                                   struct iovec *iov, unsigned int max_num_sg,
+                                   bool is_write, uint64_t pa, size_t sz)
+{
+    unsigned num_sg = *p_num_sg;
+    VduseDev *dev = vq->dev;
+
+    assert(num_sg <= max_num_sg);
+
+    if (!sz) {
+        fprintf(stderr, "virtio: zero sized buffers are not allowed\n");
+        return false;
+    }
+
+    while (sz) {
+        uint64_t len = sz;
+
+        if (num_sg == max_num_sg) {
+            fprintf(stderr,
+                    "virtio: too many descriptors in indirect table\n");
+            return false;
+        }
+
+        iov[num_sg].iov_base = iova_to_va(dev, &len, pa);
+        if (iov[num_sg].iov_base == NULL) {
+            fprintf(stderr, "virtio: invalid address for buffers\n");
+            return false;
+        }
+        iov[num_sg++].iov_len = len;
+        sz -= len;
+        pa += len;
+    }
+
+    *p_num_sg = num_sg;
+    return true;
+}
+
+static void *vduse_queue_alloc_element(size_t sz, unsigned out_num,
+                                       unsigned in_num)
+{
+    VduseVirtqElement *elem;
+    size_t in_sg_ofs = ALIGN_UP(sz, __alignof__(elem->in_sg[0]));
+    size_t out_sg_ofs = in_sg_ofs + in_num * sizeof(elem->in_sg[0]);
+    size_t out_sg_end = out_sg_ofs + out_num * sizeof(elem->out_sg[0]);
+
+    assert(sz >= sizeof(VduseVirtqElement));
+    elem = malloc(out_sg_end);
+    if (!elem) {
+        return NULL;
+    }
+    elem->out_num = out_num;
+    elem->in_num = in_num;
+    elem->in_sg = (void *)elem + in_sg_ofs;
+    elem->out_sg = (void *)elem + out_sg_ofs;
+    return elem;
+}
+
+static void *vduse_queue_map_desc(VduseVirtq *vq, unsigned int idx, size_t sz)
+{
+    struct vring_desc *desc = vq->vring.desc;
+    VduseDev *dev = vq->dev;
+    uint64_t desc_addr, read_len;
+    unsigned int desc_len;
+    unsigned int max = vq->vring.num;
+    unsigned int i = idx;
+    VduseVirtqElement *elem;
+    struct iovec iov[VIRTQUEUE_MAX_SIZE];
+    struct vring_desc desc_buf[VIRTQUEUE_MAX_SIZE];
+    unsigned int out_num = 0, in_num = 0;
+    int rc;
+
+    if (le16toh(desc[i].flags) & VRING_DESC_F_INDIRECT) {
+        if (le32toh(desc[i].len) % sizeof(struct vring_desc)) {
+            fprintf(stderr, "Invalid size for indirect buffer table\n");
+            return NULL;
+        }
+
+        /* loop over the indirect descriptor table */
+        desc_addr = le64toh(desc[i].addr);
+        desc_len = le32toh(desc[i].len);
+        max = desc_len / sizeof(struct vring_desc);
+        read_len = desc_len;
+        desc = iova_to_va(dev, &read_len, desc_addr);
+        if (unlikely(desc && read_len != desc_len)) {
+            /* Failed to use zero copy */
+            desc = NULL;
+            if (!vduse_queue_read_indirect_desc(dev, desc_buf,
+                                                desc_addr,
+                                                desc_len)) {
+                desc = desc_buf;
+            }
+        }
+        if (!desc) {
+            fprintf(stderr, "Invalid indirect buffer table\n");
+            return NULL;
+        }
+        i = 0;
+    }
+
+    /* Collect all the descriptors */
+    do {
+        if (le16toh(desc[i].flags) & VRING_DESC_F_WRITE) {
+            if (!vduse_queue_map_single_desc(vq, &in_num, iov + out_num,
+                                             VIRTQUEUE_MAX_SIZE - out_num,
+                                             true, le64toh(desc[i].addr),
+                                             le32toh(desc[i].len))) {
+                return NULL;
+            }
+        } else {
+            if (in_num) {
+                fprintf(stderr, "Incorrect order for descriptors\n");
+                return NULL;
+            }
+            if (!vduse_queue_map_single_desc(vq, &out_num, iov,
+                                             VIRTQUEUE_MAX_SIZE, false,
+                                             le64toh(desc[i].addr),
+                                             le32toh(desc[i].len))) {
+                return NULL;
+            }
+        }
+
+        /* If we've got too many, that implies a descriptor loop. */
+        if ((in_num + out_num) > max) {
+            fprintf(stderr, "Looped descriptor\n");
+            return NULL;
+        }
+        rc = vduse_queue_read_next_desc(desc, i, max, &i);
+    } while (rc == VIRTQUEUE_READ_DESC_MORE);
+
+    if (rc == VIRTQUEUE_READ_DESC_ERROR) {
+        fprintf(stderr, "read descriptor error\n");
+        return NULL;
+    }
+
+    /* Now copy what we have collected and mapped */
+    elem = vduse_queue_alloc_element(sz, out_num, in_num);
+    if (!elem) {
+        fprintf(stderr, "read descriptor error\n");
+        return NULL;
+    }
+    elem->index = idx;
+    for (i = 0; i < out_num; i++) {
+        elem->out_sg[i] = iov[i];
+    }
+    for (i = 0; i < in_num; i++) {
+        elem->in_sg[i] = iov[out_num + i];
+    }
+
+    return elem;
+}
+
+void *vduse_queue_pop(VduseVirtq *vq, size_t sz)
+{
+    unsigned int head;
+    VduseVirtqElement *elem;
+    VduseDev *dev = vq->dev;
+
+    if (unlikely(!vq->vring.avail)) {
+        return NULL;
+    }
+
+    if (vduse_queue_empty(vq)) {
+        return NULL;
+    }
+    /* Needed after virtio_queue_empty() */
+    smp_rmb();
+
+    if (vq->inuse >= vq->vring.num) {
+        fprintf(stderr, "Virtqueue size exceeded: %d\n", vq->inuse);
+        return NULL;
+    }
+
+    if (!vduse_queue_get_head(vq, vq->last_avail_idx++, &head)) {
+        return NULL;
+    }
+
+    if (vduse_dev_has_feature(dev, VIRTIO_RING_F_EVENT_IDX)) {
+        vring_set_avail_event(vq, vq->last_avail_idx);
+    }
+
+    elem = vduse_queue_map_desc(vq, head, sz);
+
+    if (!elem) {
+        return NULL;
+    }
+
+    vq->inuse++;
+
+    return elem;
+}
+
+static inline void vring_used_write(VduseVirtq *vq,
+                                    struct vring_used_elem *uelem, int i)
+{
+    struct vring_used *used = vq->vring.used;
+
+    used->ring[i] = *uelem;
+}
+
+static void vduse_queue_fill(VduseVirtq *vq, const VduseVirtqElement *elem,
+                             unsigned int len, unsigned int idx)
+{
+    struct vring_used_elem uelem;
+
+    if (unlikely(!vq->vring.used)) {
+        return;
+    }
+
+    idx = (idx + vq->used_idx) % vq->vring.num;
+
+    uelem.id = htole32(elem->index);
+    uelem.len = htole32(len);
+    vring_used_write(vq, &uelem, idx);
+}
+
+static inline void vring_used_idx_set(VduseVirtq *vq, uint16_t val)
+{
+    vq->vring.used->idx = htole16(val);
+    vq->used_idx = val;
+}
+
+static void vduse_queue_flush(VduseVirtq *vq, unsigned int count)
+{
+    uint16_t old, new;
+
+    if (unlikely(!vq->vring.used)) {
+        return;
+    }
+
+    /* Make sure buffer is written before we update index. */
+    smp_wmb();
+
+    old = vq->used_idx;
+    new = old + count;
+    vring_used_idx_set(vq, new);
+    vq->inuse -= count;
+    if (unlikely((int16_t)(new - vq->signalled_used) < (uint16_t)(new - old))) {
+        vq->signalled_used_valid = false;
+    }
+}
+
+void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
+                      unsigned int len)
+{
+    vduse_queue_fill(vq, elem, len, 0);
+    vduse_queue_flush(vq, 1);
+}
+
+static int vduse_queue_update_vring(VduseVirtq *vq, uint64_t desc_addr,
+                                    uint64_t avail_addr, uint64_t used_addr)
+{
+    struct VduseDev *dev = vq->dev;
+    uint64_t len;
+
+    len = sizeof(struct vring_desc);
+    vq->vring.desc = iova_to_va(dev, &len, desc_addr);
+    assert(len == sizeof(struct vring_desc));
+
+    len = sizeof(struct vring_avail);
+    vq->vring.avail = iova_to_va(dev, &len, avail_addr);
+    assert(len == sizeof(struct vring_avail));
+
+    len = sizeof(struct vring_used);
+    vq->vring.used = iova_to_va(dev, &len, used_addr);
+    assert(len == sizeof(struct vring_used));
+
+    if (!vq->vring.desc || !vq->vring.avail || !vq->vring.used) {
+        fprintf(stderr, "Failed to get vq[%d] iova mapping\n", vq->index);
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void vduse_queue_enable(VduseVirtq *vq)
+{
+    struct VduseDev *dev = vq->dev;
+    struct vduse_vq_info vq_info;
+    struct vduse_vq_eventfd vq_eventfd;
+    int fd;
+
+    vq_info.index = vq->index;
+    if (ioctl(dev->fd, VDUSE_VQ_GET_INFO, &vq_info)) {
+        fprintf(stderr, "Failed to get vq[%d] info: %s\n",
+                vq->index, strerror(errno));
+        return;
+    }
+
+    if (!vq_info.ready) {
+        return;
+    }
+
+    vq->vring.num = vq_info.num;
+    vq->vring.desc_addr = vq_info.desc_addr;
+    vq->vring.avail_addr = vq_info.driver_addr;
+    vq->vring.used_addr = vq_info.device_addr;
+
+    if (vduse_queue_update_vring(vq, vq_info.desc_addr,
+                                 vq_info.driver_addr, vq_info.device_addr)) {
+        fprintf(stderr, "Failed to update vring for vq[%d]\n", vq->index);
+        return;
+    }
+
+    fd = eventfd(0, EFD_NONBLOCK | EFD_CLOEXEC);
+    if (fd < 0) {
+        fprintf(stderr, "Failed to init eventfd for vq[%d]\n", vq->index);
+        return;
+    }
+
+    vq_eventfd.index = vq->index;
+    vq_eventfd.fd = fd;
+    if (ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &vq_eventfd)) {
+        fprintf(stderr, "Failed to setup kick fd for vq[%d]\n", vq->index);
+        close(fd);
+        return;
+    }
+
+    vq->fd = fd;
+    vq->shadow_avail_idx = vq->last_avail_idx = vq_info.split.avail_index;
+    vq->inuse = 0;
+    vq->used_idx = 0;
+    vq->signalled_used_valid = false;
+    vq->ready = true;
+
+    dev->ops->enable_queue(dev, vq);
+}
+
+static void vduse_queue_disable(VduseVirtq *vq)
+{
+    struct VduseDev *dev = vq->dev;
+    struct vduse_vq_eventfd eventfd;
+
+    if (!vq->ready) {
+        return;
+    }
+
+    dev->ops->disable_queue(dev, vq);
+
+    eventfd.index = vq->index;
+    eventfd.fd = VDUSE_EVENTFD_DEASSIGN;
+    ioctl(dev->fd, VDUSE_VQ_SETUP_KICKFD, &eventfd);
+    close(vq->fd);
+
+    assert(vq->inuse == 0);
+
+    vq->vring.num = 0;
+    vq->vring.desc_addr = 0;
+    vq->vring.avail_addr = 0;
+    vq->vring.used_addr = 0;
+    vq->vring.desc = 0;
+    vq->vring.avail = 0;
+    vq->vring.used = 0;
+    vq->ready = false;
+    vq->fd = -1;
+}
+
+static void vduse_dev_start_dataplane(VduseDev *dev)
+{
+    int i;
+
+    if (ioctl(dev->fd, VDUSE_DEV_GET_FEATURES, &dev->features)) {
+        fprintf(stderr, "Failed to get features: %s\n", strerror(errno));
+        return;
+    }
+    assert(vduse_dev_has_feature(dev, VIRTIO_F_VERSION_1));
+
+    for (i = 0; i < dev->num_queues; i++) {
+        vduse_queue_enable(&dev->vqs[i]);
+    }
+}
+
+static void vduse_dev_stop_dataplane(VduseDev *dev)
+{
+    int i;
+
+    for (i = 0; i < dev->num_queues; i++) {
+        vduse_queue_disable(&dev->vqs[i]);
+    }
+    dev->features = 0;
+    vduse_iova_remove_region(dev, 0, ULONG_MAX);
+}
+
+int vduse_dev_handler(VduseDev *dev)
+{
+    struct vduse_dev_request req;
+    struct vduse_dev_response resp = { 0 };
+    VduseVirtq *vq;
+    int i, ret;
+
+    ret = read(dev->fd, &req, sizeof(req));
+    if (ret != sizeof(req)) {
+        fprintf(stderr, "Read request error [%d]: %s\n",
+                ret, strerror(errno));
+        return -errno;
+    }
+    resp.request_id = req.request_id;
+
+    switch (req.type) {
+    case VDUSE_GET_VQ_STATE:
+        vq = &dev->vqs[req.vq_state.index];
+        resp.vq_state.split.avail_index = vq->last_avail_idx;
+        resp.result = VDUSE_REQ_RESULT_OK;
+        break;
+    case VDUSE_SET_STATUS:
+        if (req.s.status & VIRTIO_CONFIG_S_DRIVER_OK) {
+            vduse_dev_start_dataplane(dev);
+        } else if (req.s.status == 0) {
+            vduse_dev_stop_dataplane(dev);
+        }
+        resp.result = VDUSE_REQ_RESULT_OK;
+        break;
+    case VDUSE_UPDATE_IOTLB:
+        /* The iova will be updated by iova_to_va() later, so just remove it */
+        vduse_iova_remove_region(dev, req.iova.start, req.iova.last);
+        for (i = 0; i < dev->num_queues; i++) {
+            VduseVirtq *vq = &dev->vqs[i];
+            if (vq->ready) {
+                if (vduse_queue_update_vring(vq, vq->vring.desc_addr,
+                                             vq->vring.avail_addr,
+                                             vq->vring.used_addr)) {
+                    fprintf(stderr, "Failed to update vring for vq[%d]\n",
+                            vq->index);
+                }
+            }
+        }
+        resp.result = VDUSE_REQ_RESULT_OK;
+        break;
+    default:
+        resp.result = VDUSE_REQ_RESULT_FAILED;
+        break;
+    }
+
+    ret = write(dev->fd, &resp, sizeof(resp));
+    if (ret != sizeof(resp)) {
+        fprintf(stderr, "Write request %d error [%d]: %s\n",
+                req.type, ret, strerror(errno));
+        return -errno;
+    }
+    return 0;
+}
+
+int vduse_dev_update_config(VduseDev *dev, uint32_t size,
+                            uint32_t offset, char *buffer)
+{
+    int ret;
+    struct vduse_config_data *data;
+
+    data = malloc(offsetof(struct vduse_config_data, buffer) + size);
+    if (!data) {
+        return -ENOMEM;
+    }
+
+    data->offset = offset;
+    data->length = size;
+    memcpy(data->buffer, buffer, size);
+
+    ret = ioctl(dev->fd, VDUSE_DEV_SET_CONFIG, data);
+    free(data);
+
+    if (ret) {
+        return -errno;
+    }
+
+    if (ioctl(dev->fd, VDUSE_DEV_INJECT_CONFIG_IRQ)) {
+        return -errno;
+    }
+
+    return 0;
+}
+
+int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size)
+{
+    VduseVirtq *vq = &dev->vqs[index];
+    struct vduse_vq_config vq_config = { 0 };
+
+    if (max_size > VIRTQUEUE_MAX_SIZE) {
+        return -EINVAL;
+    }
+
+    vq_config.index = vq->index;
+    vq_config.max_size = max_size;
+
+    if (ioctl(dev->fd, VDUSE_VQ_SETUP, &vq_config)) {
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int vduse_dev_init_vqs(VduseDev *dev, uint16_t num_queues)
+{
+    VduseVirtq *vqs;
+    int i;
+
+    vqs = calloc(sizeof(VduseVirtq), num_queues);
+    if (!vqs) {
+        return -ENOMEM;
+    }
+
+    for (i = 0; i < num_queues; i++) {
+        vqs[i].index = i;
+        vqs[i].dev = dev;
+        vqs[i].fd = -1;
+    }
+    dev->vqs = vqs;
+
+    return 0;
+}
+
+static int vduse_dev_init(VduseDev *dev, const char *name,
+                          uint16_t num_queues, const VduseOps *ops,
+                          void *priv)
+{
+    char *dev_path, *dev_name;
+    int ret, fd;
+
+    dev_path = malloc(strlen(name) + strlen("/dev/vduse/") + 1);
+    if (!dev_path) {
+        return -ENOMEM;
+    }
+    sprintf(dev_path, "/dev/vduse/%s", name);
+
+    fd = open(dev_path, O_RDWR);
+    free(dev_path);
+    if (fd < 0) {
+        fprintf(stderr, "Failed to open vduse dev %s: %s\n",
+                name, strerror(errno));
+        return -errno;
+    }
+
+    dev_name = strdup(name);
+    if (!dev_name) {
+        close(fd);
+        return -ENOMEM;
+    }
+
+    ret = vduse_dev_init_vqs(dev, num_queues);
+    if (ret) {
+        free(dev_name);
+        close(fd);
+        return ret;
+    }
+
+    dev->name = dev_name;
+    dev->num_queues = num_queues;
+    dev->fd = fd;
+    dev->ops = ops;
+    dev->priv = priv;
+
+    return 0;
+}
+
+static inline bool vduse_name_is_valid(const char *name)
+{
+    return strlen(name) >= VDUSE_NAME_MAX || strstr(name, "..");
+}
+
+VduseDev *vduse_dev_create_by_fd(int fd, uint16_t num_queues,
+                                 const VduseOps *ops, void *priv)
+{
+    VduseDev *dev;
+    int ret;
+
+    if (!ops || !ops->enable_queue || !ops->disable_queue) {
+        fprintf(stderr, "Invalid parameter for vduse\n");
+        return NULL;
+    }
+
+    dev = calloc(sizeof(VduseDev), 1);
+    if (!dev) {
+        fprintf(stderr, "Failed to allocate vduse device\n");
+        return NULL;
+    }
+
+    ret = vduse_dev_init_vqs(dev, num_queues);
+    if (ret) {
+        fprintf(stderr, "Failed to init vqs\n");
+        free(dev);
+        return NULL;
+    }
+
+    dev->num_queues = num_queues;
+    dev->fd = fd;
+    dev->ops = ops;
+    dev->priv = priv;
+
+    return dev;
+}
+
+VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
+                                   const VduseOps *ops, void *priv)
+{
+    VduseDev *dev;
+    int ret;
+
+    if (!name || vduse_name_is_valid(name) || !ops ||
+        !ops->enable_queue || !ops->disable_queue) {
+        fprintf(stderr, "Invalid parameter for vduse\n");
+        return NULL;
+    }
+
+    dev = calloc(sizeof(VduseDev), 1);
+    if (!dev) {
+        fprintf(stderr, "Failed to allocate vduse device\n");
+        return NULL;
+    }
+
+    ret = vduse_dev_init(dev, name, num_queues, ops, priv);
+    if (ret < 0) {
+        fprintf(stderr, "Failed to init vduse device %s: %s\n",
+                name, strerror(ret));
+        free(dev);
+        return NULL;
+    }
+
+    return dev;
+}
+
+VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
+                           uint32_t vendor_id, uint64_t features,
+                           uint16_t num_queues, uint32_t config_size,
+                           char *config, const VduseOps *ops, void *priv)
+{
+    VduseDev *dev;
+    int ret, ctrl_fd;
+    uint64_t version;
+    struct vduse_dev_config *dev_config;
+    size_t size = offsetof(struct vduse_dev_config, config);
+
+    if (!name || vduse_name_is_valid(name) ||
+        !has_feature(features,  VIRTIO_F_VERSION_1) || !config ||
+        !config_size || !ops || !ops->enable_queue || !ops->disable_queue) {
+        fprintf(stderr, "Invalid parameter for vduse\n");
+        return NULL;
+    }
+
+    dev = calloc(sizeof(VduseDev), 1);
+    if (!dev) {
+        fprintf(stderr, "Failed to allocate vduse device\n");
+        return NULL;
+    }
+
+    ctrl_fd = open("/dev/vduse/control", O_RDWR);
+    if (ctrl_fd < 0) {
+        fprintf(stderr, "Failed to open /dev/vduse/control: %s\n",
+                strerror(errno));
+        goto err_ctrl;
+    }
+
+    version = VDUSE_API_VERSION;
+    if (ioctl(ctrl_fd, VDUSE_SET_API_VERSION, &version)) {
+        fprintf(stderr, "Failed to set api version %lu: %s\n",
+                version, strerror(errno));
+        goto err_dev;
+    }
+
+    dev_config = calloc(size + config_size, 1);
+    if (!dev_config) {
+        fprintf(stderr, "Failed to allocate config space\n");
+        goto err_dev;
+    }
+
+    strcpy(dev_config->name, name);
+    dev_config->device_id = device_id;
+    dev_config->vendor_id = vendor_id;
+    dev_config->features = features;
+    dev_config->vq_num = num_queues;
+    dev_config->vq_align = VDUSE_VQ_ALIGN;
+    dev_config->config_size = config_size;
+    memcpy(dev_config->config, config, config_size);
+
+    ret = ioctl(ctrl_fd, VDUSE_CREATE_DEV, dev_config);
+    free(dev_config);
+    if (ret < 0) {
+        fprintf(stderr, "Failed to create vduse device %s: %s\n",
+                name, strerror(errno));
+        goto err_dev;
+    }
+    dev->ctrl_fd = ctrl_fd;
+
+    ret = vduse_dev_init(dev, name, num_queues, ops, priv);
+    if (ret < 0) {
+        fprintf(stderr, "Failed to init vduse device %s: %s\n",
+                name, strerror(ret));
+        goto err;
+    }
+
+    return dev;
+err:
+    ioctl(ctrl_fd, VDUSE_DESTROY_DEV, name);
+err_dev:
+    close(ctrl_fd);
+err_ctrl:
+    free(dev);
+
+    return NULL;
+}
+
+int vduse_dev_destroy(VduseDev *dev)
+{
+    int ret = 0;
+
+    free(dev->vqs);
+    if (dev->fd > 0) {
+        close(dev->fd);
+        dev->fd = -1;
+    }
+    if (dev->ctrl_fd > 0) {
+        if (ioctl(dev->ctrl_fd, VDUSE_DESTROY_DEV, dev->name)) {
+            ret = -errno;
+        }
+        close(dev->ctrl_fd);
+        dev->ctrl_fd = -1;
+    }
+    free(dev->name);
+    free(dev);
+
+    return ret;
+}
diff --git a/subprojects/libvduse/libvduse.h b/subprojects/libvduse/libvduse.h
new file mode 100644
index 0000000000..6c2fe98213
--- /dev/null
+++ b/subprojects/libvduse/libvduse.h
@@ -0,0 +1,235 @@
+/*
+ * VDUSE (vDPA Device in Userspace) library
+ *
+ * Copyright (C) 2022 Bytedance Inc. and/or its affiliates. All rights reserved.
+ *
+ * Author:
+ *   Xie Yongji <xieyongji@bytedance.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or
+ * later.  See the COPYING file in the top-level directory.
+ */
+
+#ifndef LIBVDUSE_H
+#define LIBVDUSE_H
+
+#include <stdint.h>
+#include <sys/uio.h>
+
+#define VIRTQUEUE_MAX_SIZE 1024
+
+/* VDUSE device structure */
+typedef struct VduseDev VduseDev;
+
+/* Virtqueue structure */
+typedef struct VduseVirtq VduseVirtq;
+
+/* Some operation of VDUSE backend */
+typedef struct VduseOps {
+    /* Called when virtqueue can be processed */
+    void (*enable_queue)(VduseDev *dev, VduseVirtq *vq);
+    /* Called when virtqueue processing should be stopped */
+    void (*disable_queue)(VduseDev *dev, VduseVirtq *vq);
+} VduseOps;
+
+/* Describing elements of the I/O buffer */
+typedef struct VduseVirtqElement {
+    /* Descriptor table index */
+    unsigned int index;
+    /* Number of physically-contiguous device-readable descriptors */
+    unsigned int out_num;
+    /* Number of physically-contiguous device-writable descriptors */
+    unsigned int in_num;
+    /* Array to store physically-contiguous device-writable descriptors */
+    struct iovec *in_sg;
+    /* Array to store physically-contiguous device-readable descriptors */
+    struct iovec *out_sg;
+} VduseVirtqElement;
+
+
+/**
+ * vduse_get_virtio_features:
+ *
+ * Get supported virtio features
+ *
+ * Returns: supported feature bits
+ */
+uint64_t vduse_get_virtio_features(void);
+
+/**
+ * vduse_queue_get_dev:
+ * @vq: specified virtqueue
+ *
+ * Get corresponding VDUSE device from the virtqueue.
+ *
+ * Returns: a pointer to VDUSE device on success, NULL on failure.
+ */
+VduseDev *vduse_queue_get_dev(VduseVirtq *vq);
+
+/**
+ * vduse_queue_get_fd:
+ * @vq: specified virtqueue
+ *
+ * Get the kick fd for the virtqueue.
+ *
+ * Returns: file descriptor on success, -1 on failure.
+ */
+int vduse_queue_get_fd(VduseVirtq *vq);
+
+/**
+ * vduse_queue_pop:
+ * @vq: specified virtqueue
+ * @sz: the size of struct to return (must be >= VduseVirtqElement)
+ *
+ * Pop an element from virtqueue available ring.
+ *
+ * Returns: a pointer to a structure containing VduseVirtqElement on success,
+ * NULL on failure.
+ */
+void *vduse_queue_pop(VduseVirtq *vq, size_t sz);
+
+/**
+ * vduse_queue_push:
+ * @vq: specified virtqueue
+ * @elem: pointer to VduseVirtqElement returned by vduse_queue_pop()
+ * @len: length in bytes to write
+ *
+ * Push an element to virtqueue used ring.
+ */
+void vduse_queue_push(VduseVirtq *vq, const VduseVirtqElement *elem,
+                      unsigned int len);
+/**
+ * vduse_queue_notify:
+ * @vq: specified virtqueue
+ *
+ * Request to notify the queue.
+ */
+void vduse_queue_notify(VduseVirtq *vq);
+
+/**
+ * vduse_dev_get_priv:
+ * @dev: VDUSE device
+ *
+ * Get the private pointer passed to vduse_dev_create().
+ *
+ * Returns: private pointer on success, NULL on failure.
+ */
+void *vduse_dev_get_priv(VduseDev *dev);
+
+/**
+ * vduse_dev_get_queue:
+ * @dev: VDUSE device
+ * @index: virtqueue index
+ *
+ * Get the specified virtqueue.
+ *
+ * Returns: a pointer to the virtqueue on success, NULL on failure.
+ */
+VduseVirtq *vduse_dev_get_queue(VduseDev *dev, int index);
+
+/**
+ * vduse_dev_get_fd:
+ * @dev: VDUSE device
+ *
+ * Get the control message fd for the VDUSE device.
+ *
+ * Returns: file descriptor on success, -1 on failure.
+ */
+int vduse_dev_get_fd(VduseDev *dev);
+
+/**
+ * vduse_dev_handler:
+ * @dev: VDUSE device
+ *
+ * Used to process the control message.
+ *
+ * Returns: file descriptor on success, -errno on failure.
+ */
+int vduse_dev_handler(VduseDev *dev);
+
+/**
+ * vduse_dev_update_config:
+ * @dev: VDUSE device
+ * @size: the size to write to configuration space
+ * @offset: the offset from the beginning of configuration space
+ * @buffer: the buffer used to write from
+ *
+ * Update device configuration space and inject a config interrupt.
+ *
+ * Returns: 0 on success, -errno on failure.
+ */
+int vduse_dev_update_config(VduseDev *dev, uint32_t size,
+                            uint32_t offset, char *buffer);
+
+/**
+ * vduse_dev_setup_queue:
+ * @dev: VDUSE device
+ * @index: virtqueue index
+ * @max_size: the max size of virtqueue
+ *
+ * Setup the specified virtqueue.
+ *
+ * Returns: 0 on success, -errno on failure.
+ */
+int vduse_dev_setup_queue(VduseDev *dev, int index, int max_size);
+
+/**
+ * vduse_dev_create_by_fd:
+ * @fd: passed file descriptor
+ * @num_queues: the number of virtqueues
+ * @ops: the operation of VDUSE backend
+ * @priv: private pointer
+ *
+ * Create VDUSE device from a passed file descriptor.
+ *
+ * Returns: pointer to VDUSE device on success, NULL on failure.
+ */
+VduseDev *vduse_dev_create_by_fd(int fd, uint16_t num_queues,
+                                 const VduseOps *ops, void *priv);
+
+/**
+ * vduse_dev_create_by_name:
+ * @name: VDUSE device name
+ * @num_queues: the number of virtqueues
+ * @ops: the operation of VDUSE backend
+ * @priv: private pointer
+ *
+ * Create VDUSE device on /dev/vduse/$NAME.
+ *
+ * Returns: pointer to VDUSE device on success, NULL on failure.
+ */
+VduseDev *vduse_dev_create_by_name(const char *name, uint16_t num_queues,
+                                   const VduseOps *ops, void *priv);
+
+/**
+ * vduse_dev_create:
+ * @name: VDUSE device name
+ * @device_id: virtio device id
+ * @vendor_id: virtio vendor id
+ * @features: virtio features
+ * @num_queues: the number of virtqueues
+ * @config_size: the size of the configuration space
+ * @config: the buffer of the configuration space
+ * @ops: the operation of VDUSE backend
+ * @priv: private pointer
+ *
+ * Create VDUSE device.
+ *
+ * Returns: pointer to VDUSE device on success, NULL on failure.
+ */
+VduseDev *vduse_dev_create(const char *name, uint32_t device_id,
+                           uint32_t vendor_id, uint64_t features,
+                           uint16_t num_queues, uint32_t config_size,
+                           char *config, const VduseOps *ops, void *priv);
+
+/**
+ * vduse_dev_destroy:
+ * @dev: VDUSE device
+ *
+ * Destroy the VDUSE device.
+ *
+ * Returns: 0 on success, -errno on failure.
+ */
+int vduse_dev_destroy(VduseDev *dev);
+
+#endif
diff --git a/subprojects/libvduse/linux-headers/linux b/subprojects/libvduse/linux-headers/linux
new file mode 120000
index 0000000000..04f3304f79
--- /dev/null
+++ b/subprojects/libvduse/linux-headers/linux
@@ -0,0 +1 @@
+../../../linux-headers/linux/
\ No newline at end of file
diff --git a/subprojects/libvduse/meson.build b/subprojects/libvduse/meson.build
new file mode 100644
index 0000000000..ba08f5ee1a
--- /dev/null
+++ b/subprojects/libvduse/meson.build
@@ -0,0 +1,10 @@
+project('libvduse', 'c',
+        license: 'GPL-2.0-or-later',
+        default_options: ['c_std=gnu99'])
+
+libvduse = static_library('vduse',
+                          files('libvduse.c'),
+                          c_args: '-D_GNU_SOURCE')
+
+libvduse_dep = declare_dependency(link_with: libvduse,
+                                  include_directories: include_directories('.'))
diff --git a/subprojects/libvduse/standard-headers/linux b/subprojects/libvduse/standard-headers/linux
new file mode 120000
index 0000000000..c416f068ac
--- /dev/null
+++ b/subprojects/libvduse/standard-headers/linux
@@ -0,0 +1 @@
+../../../include/standard-headers/linux/
\ No newline at end of file
-- 
2.20.1


