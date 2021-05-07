Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 77484376555
	for <lists+qemu-devel@lfdr.de>; Fri,  7 May 2021 14:40:35 +0200 (CEST)
Received: from localhost ([::1]:57554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lezmU-0000sa-II
	for lists+qemu-devel@lfdr.de; Fri, 07 May 2021 08:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbW-0000kL-2M
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:14 -0400
Received: from userp2120.oracle.com ([156.151.31.85]:43798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1lezbP-0001Tp-Vp
 for qemu-devel@nongnu.org; Fri, 07 May 2021 08:29:13 -0400
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
 by userp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CSiRE050073;
 Fri, 7 May 2021 12:29:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=KrA6dAK5QcQr1DhOaGtAgibx2ZH/6D8Ymg5IbhdtOWE=;
 b=EQcMq85uz6RiJ2SC9TLBl/exjXLfcmMk2YJzPfS7OT4HnBGxo/NJARktoUzJPUGooHty
 djwg8R9OJTtUIKTCwyEMFhEWH2AiaZ3qhOeGuATSprurd3sO/JHAvIRLm7MbKBbktpvn
 WiSXTr4Mdj5znpZBaJOBi/Sr2UsuifN84x+6sCIp/eemQjW5U/m5tXS49rf0z4pnvJCb
 e8Mc1wswMsjHEsFQ2YJHkY+8eu9IUtOlAP6f8EV9a8qKQ630TKyQj409zQR4VvNOQVjZ
 v7aoJJhHd2S9GABmoQpowk7Eba9QSgehvJ1kMIwSzdBY//N+Ir49YvWb9PQT5FI8K77v XQ== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by userp2120.oracle.com with ESMTP id 38csqvhemr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:02 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 147CFkf1168203;
 Fri, 7 May 2021 12:29:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by userp3020.oracle.com with ESMTP id 38csrh1t6g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:02 +0000
Received: from userp3020.oracle.com (userp3020.oracle.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 147CL07w185198;
 Fri, 7 May 2021 12:29:01 GMT
Received: from aserv0121.oracle.com (aserv0121.oracle.com [141.146.126.235])
 by userp3020.oracle.com with ESMTP id 38csrh1t4f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 07 May 2021 12:29:01 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by aserv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 147CSxdP019269;
 Fri, 7 May 2021 12:28:59 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Fri, 07 May 2021 05:28:59 -0700
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V3 12/22] vfio-pci: cpr part 1
Date: Fri,  7 May 2021 05:25:10 -0700
Message-Id: <1620390320-301716-13-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
References: <1620390320-301716-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: 7QImBClTHQ_2ef4voo_85oMLluBRlTpZ
X-Proofpoint-GUID: 7QImBClTHQ_2ef4voo_85oMLluBRlTpZ
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9976
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0
 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 bulkscore=0 adultscore=0 suspectscore=0 spamscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104190000
 definitions=main-2105070086
Received-SPF: pass client-ip=156.151.31.85;
 envelope-from=steven.sistare@oracle.com; helo=userp2120.oracle.com
X-Spam_score_int: -50
X-Spam_score: -5.1
X-Spam_bar: -----
X-Spam_report: (-5.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
Cc: "Daniel P. Berrange" <berrange@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Zeng <jason.zeng@linux.intel.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Juan Quintela <quintela@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Enable vfio-pci devices to be saved and restored across an exec restart
of qemu.

At vfio creation time, save the value of vfio container, group, and device
descriptors in the environment.

In cprsave, suspend the use of virtual addresses in DMA mappings with
VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be remapped at a
different VA after exec.  DMA to already-mapped pages continues.  Save
the msi message area as part of vfio-pci vmstate, save the interrupt and
notifier eventfd's in the environment, and clear the close-on-exec flag
for the vfio descriptors.  The flag is not cleared earlier because the
descriptors should not persist across miscellaneous fork and exec calls
that may be performed during normal operation.

On qemu restart, vfio_realize() finds the descriptor env vars, uses
the descriptors, and notes that the device is being reused.  Device and
iommu state is already configured, so operations in vfio_realize that
would modify the configuration are skipped for a reused device, including
vfio ioctl's and writes to PCI configuration space.  The result is that
vfio_realize constructs qemu data structures that reflect the current
state of the device.  However, the reconstruction is not complete until
cprload is called. cprload loads the msi data and finds eventfds in the
environment.  It rebuilds vector data structures and attaches the
interrupts to the new KVM instance.  cprload then walks the flattened
ranges of the vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_VADDR to
inform the kernel of the new VA's.  Lastly, it starts the VM and suppresses
vfio device reset.

This functionality is delivered by 2 patches for clarity.  Part 2 adds
eventfd and vector support.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/msi.c                  |   4 ++
 hw/pci/pci.c                  |   4 ++
 hw/vfio/common.c              |  59 ++++++++++++++++++-
 hw/vfio/cpr.c                 | 131 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 |  65 +++++++++++++++++++--
 hw/vfio/trace-events          |   1 +
 include/hw/pci/pci.h          |   1 +
 include/hw/vfio/vfio-common.h |   5 ++
 linux-headers/linux/vfio.h    |  27 +++++++++
 migration/cpr.c               |   7 +++
 11 files changed, 298 insertions(+), 7 deletions(-)
 create mode 100644 hw/vfio/cpr.c

diff --git a/hw/pci/msi.c b/hw/pci/msi.c
index 47d2b0f..39de6a7 100644
--- a/hw/pci/msi.c
+++ b/hw/pci/msi.c
@@ -225,6 +225,10 @@ int msi_init(struct PCIDevice *dev, uint8_t offset,
     dev->msi_cap = config_offset;
     dev->cap_present |= QEMU_PCI_CAP_MSI;
 
+    if (dev->reused) {
+        return 0;
+    }
+
     pci_set_word(dev->config + msi_flags_off(dev), flags);
     pci_set_word(dev->wmask + msi_flags_off(dev),
                  PCI_MSI_FLAGS_QSIZE | PCI_MSI_FLAGS_ENABLE);
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index e08d981..27019ca 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -308,6 +308,10 @@ static void pci_do_device_reset(PCIDevice *dev)
 {
     int r;
 
+    if (dev->reused) {
+        return;
+    }
+
     pci_device_deassert_intx(dev);
     assert(dev->irq_state == 0);
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9220e64..00d07b2 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -31,6 +31,7 @@
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -440,6 +441,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
+    if (container->reused) {
+        return 0;
+    }
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -463,6 +468,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (unmap.size != size) {
+        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
+                     iova, size, unmap.size);
+    }
+
     return 0;
 }
 
@@ -477,6 +487,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .size = size,
     };
 
+    if (container->reused) {
+        return 0;
+    }
+
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
@@ -1603,6 +1617,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     if (iommu_type < 0) {
         return iommu_type;
     }
+    if (container->reused) {
+        container->iommu_type = iommu_type;
+        return 0;
+    }
 
     ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
     if (ret) {
@@ -1703,6 +1721,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 {
     VFIOContainer *container;
     int ret, fd;
+    bool reused;
+    char name[40];
     VFIOAddressSpace *space;
 
     space = vfio_get_address_space(as);
@@ -1739,16 +1759,29 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         return ret;
     }
 
+    snprintf(name, sizeof(name), "vfio_container_%d", group->groupid);
+    fd = getenv_fd(name);
+    reused = (fd >= 0);
+
     QLIST_FOREACH(container, &space->containers, next) {
+        if (fd >= 0 && container->fd == fd) {
+            group->container = container;
+            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+            return 0;
+        }
         if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
             group->container = container;
             QLIST_INSERT_HEAD(&container->group_list, group, container_next);
             vfio_kvm_device_add_group(group);
+            setenv_fd(name, container->fd);
             return 0;
         }
     }
 
-    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
+    if (fd < 0) {
+        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
+    }
+
     if (fd < 0) {
         error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
         ret = -errno;
@@ -1766,6 +1799,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container = g_malloc0(sizeof(*container));
     container->space = space;
     container->fd = fd;
+    container->reused = reused;
     container->error = NULL;
     container->dirty_pages_supported = false;
     QLIST_INIT(&container->giommu_list);
@@ -1893,6 +1927,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     }
 
     container->initialized = true;
+    setenv_fd(name, fd);
 
     return 0;
 listener_release_exit:
@@ -1920,6 +1955,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
+    unsetenv_fdv("vfio_container_%d", group->groupid);
 
     /*
      * Explicitly release the listener first before unset container,
@@ -1978,7 +2014,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     group = g_malloc0(sizeof(*group));
 
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
-    group->fd = qemu_open_old(path, O_RDWR);
+
+    group->fd = getenv_fd(path);
+    if (group->fd < 0) {
+        group->fd = qemu_open_old(path, O_RDWR);
+    }
+
     if (group->fd < 0) {
         error_setg_errno(errp, errno, "failed to open %s", path);
         goto free_group_exit;
@@ -2012,6 +2053,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 
     QLIST_INSERT_HEAD(&vfio_group_list, group, next);
 
+    setenv_fd(path, group->fd);
+
     return group;
 
 close_fd_exit:
@@ -2036,6 +2079,7 @@ void vfio_put_group(VFIOGroup *group)
     vfio_disconnect_container(group);
     QLIST_REMOVE(group, next);
     trace_vfio_put_group(group->fd);
+    unsetenv_fdv("/dev/vfio/%d", group->groupid);
     close(group->fd);
     g_free(group);
 
@@ -2049,8 +2093,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 {
     struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
     int ret, fd;
+    bool reused;
+
+    fd = getenv_fd(name);
+    reused = (fd >= 0);
+    if (fd < 0) {
+        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
+    }
 
-    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
     if (fd < 0) {
         error_setg_errno(errp, errno, "error getting device from group %d",
                          group->groupid);
@@ -2095,6 +2145,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     vbasedev->num_irqs = dev_info.num_irqs;
     vbasedev->num_regions = dev_info.num_regions;
     vbasedev->flags = dev_info.flags;
+    vbasedev->reused = reused;
+    setenv_fd(name, fd);
 
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
@@ -2111,6 +2163,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
+    unsetenv_fd(vbasedev->name);
     close(vbasedev->fd);
 }
 
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
new file mode 100644
index 0000000..c5ad9f2
--- /dev/null
+++ b/hw/vfio/cpr.c
@@ -0,0 +1,131 @@
+/*
+ * Copyright (c) 2021 Oracle and/or its affiliates.
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include <sys/ioctl.h>
+#include <linux/vfio.h>
+#include "hw/vfio/vfio-common.h"
+#include "sysemu/kvm.h"
+#include "qapi/error.h"
+#include "trace.h"
+
+static int
+vfio_dma_unmap_vaddr_all(VFIOContainer *container, Error **errp)
+{
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = VFIO_DMA_UNMAP_FLAG_VADDR | VFIO_DMA_UNMAP_FLAG_ALL,
+        .iova = 0,
+        .size = 0,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
+        error_setg_errno(errp, errno, "vfio_dma_unmap_vaddr_all");
+        return -errno;
+    }
+    return 0;
+}
+
+static int vfio_dma_map_vaddr(VFIOContainer *container, hwaddr iova,
+                              ram_addr_t size, void *vaddr,
+                              Error **errp)
+{
+    struct vfio_iommu_type1_dma_map map = {
+        .argsz = sizeof(map),
+        .flags = VFIO_DMA_MAP_FLAG_VADDR,
+        .vaddr = (__u64)(uintptr_t)vaddr,
+        .iova = iova,
+        .size = size,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
+        error_setg_errno(errp, errno,
+                         "vfio_dma_map_vaddr(iova %lu, size %ld, va %p)",
+                         iova, size, vaddr);
+        return -errno;
+    }
+    return 0;
+}
+
+static int
+vfio_region_remap(MemoryRegionSection *section, void *handle, Error **errp)
+{
+    MemoryRegion *mr = section->mr;
+    VFIOContainer *container = handle;
+    const char *name = memory_region_name(mr);
+    ram_addr_t size = int128_get64(section->size);
+    hwaddr offset, iova, roundup;
+    void *vaddr;
+
+    if (vfio_listener_skipped_section(section) || memory_region_is_iommu(mr)) {
+        return 0;
+    }
+
+    offset = section->offset_within_address_space;
+    iova = TARGET_PAGE_ALIGN(offset);
+    roundup = iova - offset;
+    size = (size - roundup) & TARGET_PAGE_MASK;
+    vaddr = memory_region_get_ram_ptr(mr) +
+            section->offset_within_region + roundup;
+
+    trace_vfio_region_remap(name, container->fd, iova, iova + size - 1, vaddr);
+    return vfio_dma_map_vaddr(container, iova, size, vaddr, errp);
+}
+
+bool vfio_cpr_capable(VFIOContainer *container, Error **errp)
+{
+    if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UPDATE_VADDR) ||
+        !ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_UNMAP_ALL)) {
+        error_setg(errp, "VFIO container does not support VFIO_UPDATE_VADDR "
+                         "or VFIO_UNMAP_ALL");
+        return false;
+    } else {
+        return true;
+    }
+}
+
+int vfio_cprsave(Error **errp)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!vfio_cpr_capable(container, errp)) {
+                return 1;
+            }
+            if (vfio_dma_unmap_vaddr_all(container, errp)) {
+                return 1;
+            }
+        }
+    }
+    return 0;
+}
+
+int vfio_cprload(Error **errp)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!vfio_cpr_capable(container, errp)) {
+                return 1;
+            }
+            container->reused = false;
+            if (as_flat_walk(space->as, vfio_region_remap, container, errp)) {
+                return 1;
+            }
+        }
+    }
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            vbasedev->reused = false;
+        }
+    }
+    return 0;
+}
diff --git a/hw/vfio/meson.build b/hw/vfio/meson.build
index da9af29..e247b2b 100644
--- a/hw/vfio/meson.build
+++ b/hw/vfio/meson.build
@@ -5,6 +5,7 @@ vfio_ss.add(files(
   'migration.c',
 ))
 vfio_ss.add(when: 'CONFIG_VFIO_PCI', if_true: files(
+  'cpr.c',
   'display.c',
   'pci-quirks.c',
   'pci.c',
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 7a4fb6c..f7ac9f03 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -29,6 +29,8 @@
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
+#include "migration/cpr.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -1612,6 +1614,14 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
     }
 }
 
+static void vfio_config_sync(VFIOPCIDevice *vdev, uint32_t offset, size_t len)
+{
+    if (pread(vdev->vbasedev.fd, vdev->pdev.config + offset, len,
+          vdev->config_offset + offset) != len) {
+        error_report("vfio_config_sync pread failed");
+    }
+}
+
 static void vfio_bar_prepare(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
@@ -1652,6 +1662,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
 static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
+    PCIDevice *pdev = &vdev->pdev;
     char *name;
 
     if (!bar->size) {
@@ -1672,7 +1683,10 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
         }
     }
 
-    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
+    pci_register_bar(pdev, nr, bar->type, bar->mr);
+    if (pdev->reused) {
+        vfio_config_sync(vdev, pci_bar(pdev, nr), 8);
+    }
 }
 
 static void vfio_bars_register(VFIOPCIDevice *vdev)
@@ -2884,6 +2898,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         vfio_put_group(group);
         goto error;
     }
+    pdev->reused = vdev->vbasedev.reused;
 
     vfio_populate_device(vdev, &err);
     if (err) {
@@ -3046,9 +3061,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
                                              vfio_intx_routing_notifier);
         vdev->irqchip_change_notifier.notify = vfio_irqchip_change;
         kvm_irqchip_add_change_notifier(&vdev->irqchip_change_notifier);
-        ret = vfio_intx_enable(vdev, errp);
-        if (ret) {
-            goto out_deregister;
+        if (!pdev->reused) {
+            ret = vfio_intx_enable(vdev, errp);
+            if (ret) {
+                goto out_deregister;
+            }
         }
     }
 
@@ -3098,6 +3115,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
 
+    vfio_config_sync(vdev, pdev->msix_cap + PCI_MSIX_FLAGS, 2);
+    if (pdev->reused) {
+        pci_update_mappings(pdev);
+    }
+
     return;
 
 out_deregister:
@@ -3153,6 +3175,10 @@ static void vfio_pci_reset(DeviceState *dev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(dev);
 
+    if (vdev->pdev.reused) {
+        return;
+    }
+
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
     vfio_pci_pre_reset(vdev);
@@ -3260,6 +3286,36 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static int vfio_pci_post_load(void *opaque, int version_id)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    bool enabled;
+
+    pdev->reused = false;
+    enabled = pci_get_word(pdev->config + PCI_COMMAND) & PCI_COMMAND_MASTER;
+    memory_region_set_enabled(&pdev->bus_master_enable_region, enabled);
+
+    return 0;
+}
+
+static bool vfio_pci_needed(void *opaque)
+{
+    return cpr_active();
+}
+
+static const VMStateDescription vfio_pci_vmstate = {
+    .name = "vfio-pci",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = vfio_pci_post_load,
+    .needed = vfio_pci_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3267,6 +3323,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 079f53a..0f8b166 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -118,6 +118,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index bef3e49..add7f46 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -360,6 +360,7 @@ struct PCIDevice {
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
     uint32_t acpi_index;
+    bool reused;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 00acb85..b46d850 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -85,6 +85,7 @@ typedef struct VFIOContainer {
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
+    bool reused;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -124,6 +125,7 @@ typedef struct VFIODevice {
     bool no_mmap;
     bool ram_block_discard_allowed;
     bool enable_migration;
+    bool reused;
     VFIODeviceOps *ops;
     unsigned int num_irqs;
     unsigned int num_regions;
@@ -200,6 +202,9 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_cprsave(Error **errp);
+int vfio_cprload(Error **errp);
+bool vfio_cpr_capable(VFIOContainer *container, Error **errp);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index 609099e..bc3a66e 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -46,6 +46,12 @@
  */
 #define VFIO_NOIOMMU_IOMMU		8
 
+/* Supports VFIO_DMA_UNMAP_FLAG_ALL */
+#define VFIO_UNMAP_ALL                        9
+
+/* Supports VFIO DMA map and unmap with the VADDR flag */
+#define VFIO_UPDATE_VADDR              10
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
@@ -1074,12 +1080,22 @@ struct vfio_iommu_type1_info_dma_avail {
  *
  * Map process virtual addresses to IO virtual addresses using the
  * provided struct vfio_dma_map. Caller sets argsz. READ &/ WRITE required.
+ *
+ * If flags & VFIO_DMA_MAP_FLAG_VADDR, record the new base vaddr for iova, and
+ * unblock translation of host virtual addresses in the iova range.  The vaddr
+ * must have previously been invalidated with VFIO_DMA_UNMAP_FLAG_VADDR.  To
+ * maintain memory consistency within the user application, the updated vaddr
+ * must address the same memory object as originally mapped.  Failure to do so
+ * will result in user memory corruption and/or device misbehavior.  iova and
+ * size must match those in the original MAP_DMA call.  Protection is not
+ * changed, and the READ & WRITE flags must be 0.
  */
 struct vfio_iommu_type1_dma_map {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)		/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)	/* writable from device */
+#define VFIO_DMA_MAP_FLAG_VADDR (1 << 2)
 	__u64	vaddr;				/* Process virtual address */
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
@@ -1102,6 +1118,7 @@ struct vfio_bitmap {
  * field.  No guarantee is made to the user that arbitrary unmaps of iova
  * or size different from those used in the original mapping call will
  * succeed.
+ *
  * VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP should be set to get the dirty bitmap
  * before unmapping IO virtual addresses. When this flag is set, the user must
  * provide a struct vfio_bitmap in data[]. User must provide zero-allocated
@@ -1111,11 +1128,21 @@ struct vfio_bitmap {
  * indicates that the page at that offset from iova is dirty. A Bitmap of the
  * pages in the range of unmapped size is returned in the user-provided
  * vfio_bitmap.data.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_ALL, unmap all addresses.  iova and size
+ * must be 0.  This cannot be combined with the get-dirty-bitmap flag.
+ *
+ * If flags & VFIO_DMA_UNMAP_FLAG_VADDR, do not unmap, but invalidate host
+ * virtual addresses in the iova range.  Tasks that attempt to translate an
+ * iova's vaddr will block.  DMA to already-mapped pages continues.  This
+ * cannot be combined with the get-dirty-bitmap flag.
  */
 struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP (1 << 0)
+#define VFIO_DMA_UNMAP_FLAG_ALL              (1 << 1)
+#define VFIO_DMA_UNMAP_FLAG_VADDR            (1 << 2)
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
 	__u8    data[];
diff --git a/migration/cpr.c b/migration/cpr.c
index e0da1cf..e9a189b 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -132,6 +132,9 @@ void cprsave(const char *file, CprMode mode, Error **errp)
         shutdown_action = SHUTDOWN_ACTION_POWEROFF;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     } else if (restart) {
+        if (vfio_cprsave(errp)) {
+            goto err;
+        }
         walkenv(FD_PREFIX, preserve_fd, 0);
         setenv("QEMU_START_FREEZE", "", 1);
         qemu_system_exec_request();
@@ -176,6 +179,10 @@ void cprload(const char *file, Error **errp)
         return;
     }
 
+    if (vfio_cprload(errp)) {
+        return;
+    }
+
     state = global_state_get_runstate();
     if (state == RUN_STATE_RUNNING) {
         vm_start();
-- 
1.8.3.1


