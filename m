Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D7672EAFDF
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 17:18:30 +0100 (CET)
Received: from localhost ([::1]:36094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwp2T-0000ct-8I
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 11:18:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotc-00041D-AH
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:20 -0500
Received: from userp2130.oracle.com ([156.151.31.86]:50564)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1kwotY-0003xo-Tr
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 11:09:20 -0500
Received: from pps.filterd (userp2130.oracle.com [127.0.0.1])
 by userp2130.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105Fu1fQ139639;
 Tue, 5 Jan 2021 16:09:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2020-01-29;
 bh=Q0Nuky2+WY5EnkPBwyQQiMfzyul2MSRl0S5fL/8Gcl8=;
 b=wvZJY8LsD1D5IayeOkA6dl+i6a23Wa4re/5KH+LNwQ90YlU3w3MiXbTY2FKA8v42emTK
 gvXpegCJm3ZMTu/2HHrD7TyVXid4Dkf7cHTTGA1bE+AYxzc7THR1MD+OYbDjUr5o1ium
 7xpeVI42qL/WlkrJP17JAgQTC7/bi/zSVvN/aUhs3mPLWPBkL7l6RXYoTCbvNarsiIS8
 ZpDVgQh+sah6wgmIe+XH2w1H2QXfB8pta7V2wxYTgH6rGWW/ilgzu/sGI+OmwQ5NJbLX
 +Tw1u3hCsspwOuAKUOQjfy8gV/LOHUbTkX1Eds2nstWXfdGk/SQ+pvG+oDk0gvWeAudN pw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by userp2130.oracle.com with ESMTP id 35tg8r1gys-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
 Tue, 05 Jan 2021 16:09:12 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 105FtKSo175811;
 Tue, 5 Jan 2021 16:09:11 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
 by userp3030.oracle.com with ESMTP id 35vct61vrq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 05 Jan 2021 16:09:11 +0000
Received: from abhmp0011.oracle.com (abhmp0011.oracle.com [141.146.116.17])
 by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 105G99JQ018356;
 Tue, 5 Jan 2021 16:09:10 GMT
Received: from ca-dev63.us.oracle.com (/10.211.8.221)
 by default (Oracle Beehive Gateway v4.0)
 with ESMTP ; Tue, 05 Jan 2021 08:09:09 -0800
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH V2 12/22] vfio-pci: cpr
Date: Tue,  5 Jan 2021 07:42:00 -0800
Message-Id: <1609861330-129855-13-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
References: <1609861330-129855-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 phishscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101050099
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9855
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015
 phishscore=0 bulkscore=0
 spamscore=0 impostorscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 mlxscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2101050099
Received-SPF: pass client-ip=156.151.31.86;
 envelope-from=steven.sistare@oracle.com; helo=userp2130.oracle.com
X-Spam_score_int: -46
X-Spam_score: -4.7
X-Spam_bar: ----
X-Spam_report: (-4.7 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.252,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 UNPARSEABLE_RELAY=0.001 autolearn=ham autolearn_force=no
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
VFIO_DMA_UNMAP_FLAG_SUSPEND, because guest ram will be remapped at a
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
ranges of the vfio_address_spaces and calls VFIO_DMA_MAP_FLAG_RESUME to
inform the kernel of the new VA's.  Lastly, it starts the VM and suppresses
vfio device reset.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 hw/pci/pci.c                  |   4 +
 hw/vfio/Makefile.objs         |   2 +-
 hw/vfio/common.c              |  59 +++++++++++++-
 hw/vfio/cpr.c                 | 117 ++++++++++++++++++++++++++++
 hw/vfio/pci.c                 | 173 ++++++++++++++++++++++++++++++++++++++++--
 hw/vfio/trace-events          |   1 +
 include/hw/pci/pci.h          |   1 +
 include/hw/vfio/vfio-common.h |   4 +
 linux-headers/linux/vfio.h    |   5 ++
 migration/cpr.c               |   4 +
 10 files changed, 360 insertions(+), 10 deletions(-)
 create mode 100644 hw/vfio/cpr.c

diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 7343e00..c2e1509 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -291,6 +291,10 @@ static void pci_do_device_reset(PCIDevice *dev)
 {
     int r;
 
+    if (dev->reused) {
+        return;
+    }
+
     pci_device_deassert_intx(dev);
     assert(dev->irq_state == 0);
 
diff --git a/hw/vfio/Makefile.objs b/hw/vfio/Makefile.objs
index 9bb1c09..8a8e0da 100644
--- a/hw/vfio/Makefile.objs
+++ b/hw/vfio/Makefile.objs
@@ -1,4 +1,4 @@
-obj-y += common.o spapr.o
+obj-y += common.o spapr.o cpr.o
 obj-$(CONFIG_VFIO_PCI) += pci.o pci-quirks.o display.o
 obj-$(CONFIG_VFIO_CCW) += ccw.o
 obj-$(CONFIG_VFIO_PLATFORM) += platform.o
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7f8768d..986e111 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -37,6 +37,7 @@
 #include "sysemu/reset.h"
 #include "trace.h"
 #include "qapi/error.h"
+#include "qemu/env.h"
 
 VFIOGroupList vfio_group_list =
     QLIST_HEAD_INITIALIZER(vfio_group_list);
@@ -299,6 +300,10 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
+    if (container->reused) {
+        return 0;
+    }
+
     while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
         /*
          * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
@@ -322,6 +327,11 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
+    if (unmap.size != size) {
+        warn_report("VFIO_UNMAP_DMA(0x%lx, 0x%lx) only unmaps 0x%llx",
+                     iova, size, unmap.size);
+    }
+
     return 0;
 }
 
@@ -336,6 +346,10 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .size = size,
     };
 
+    if (container->reused) {
+        return 0;
+    }
+
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
@@ -1178,6 +1192,10 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
     if (iommu_type < 0) {
         return iommu_type;
     }
+    if (container->reused) {
+        container->iommu_type = iommu_type;
+        return 0;
+    }
 
     ret = ioctl(group_fd, VFIO_GROUP_SET_CONTAINER, &container->fd);
     if (ret) {
@@ -1209,6 +1227,8 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 {
     VFIOContainer *container;
     int ret, fd;
+    bool reused;
+    char name[40];
     VFIOAddressSpace *space;
 
     space = vfio_get_address_space(as);
@@ -1245,16 +1265,29 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
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
 
-    fd = qemu_open("/dev/vfio/vfio", O_RDWR);
+    if (fd < 0) {
+        fd = qemu_open("/dev/vfio/vfio", O_RDWR);
+    }
+
     if (fd < 0) {
         error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
         ret = -errno;
@@ -1272,6 +1305,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container = g_malloc0(sizeof(*container));
     container->space = space;
     container->fd = fd;
+    container->reused = reused;
     container->error = NULL;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
@@ -1394,6 +1428,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     }
 
     container->initialized = true;
+    setenv_fd(name, fd);
 
     return 0;
 listener_release_exit:
@@ -1421,6 +1456,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
+    unsetenv_fdv("vfio_container_%d", group->groupid);
 
     /*
      * Explicitly release the listener first before unset container,
@@ -1479,7 +1515,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     group = g_malloc0(sizeof(*group));
 
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
-    group->fd = qemu_open(path, O_RDWR);
+
+    group->fd = getenv_fd(path);
+    if (group->fd < 0) {
+        group->fd = qemu_open(path, O_RDWR);
+    }
+
     if (group->fd < 0) {
         error_setg_errno(errp, errno, "failed to open %s", path);
         goto free_group_exit;
@@ -1513,6 +1554,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 
     QLIST_INSERT_HEAD(&vfio_group_list, group, next);
 
+    setenv_fd(path, group->fd);
+
     return group;
 
 close_fd_exit:
@@ -1537,6 +1580,7 @@ void vfio_put_group(VFIOGroup *group)
     vfio_disconnect_container(group);
     QLIST_REMOVE(group, next);
     trace_vfio_put_group(group->fd);
+    unsetenv_fdv("/dev/vfio/%d", group->groupid);
     close(group->fd);
     g_free(group);
 
@@ -1550,8 +1594,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
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
@@ -1596,6 +1646,8 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     vbasedev->num_irqs = dev_info.num_irqs;
     vbasedev->num_regions = dev_info.num_regions;
     vbasedev->flags = dev_info.flags;
+    vbasedev->reused = reused;
+    setenv_fd(name, fd);
 
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
@@ -1612,6 +1664,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
+    unsetenv_fd(vbasedev->name);
     close(vbasedev->fd);
 }
 
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
new file mode 100644
index 0000000..565312d
--- /dev/null
+++ b/hw/vfio/cpr.c
@@ -0,0 +1,117 @@
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
+#include "trace.h"
+
+static int
+vfio_dma_suspend(VFIOContainer *container, hwaddr iova, ram_addr_t size)
+{
+    int ret = 0;
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = VFIO_DMA_UNMAP_FLAG_SUSPEND,
+        .iova = iova,
+        .size = size,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
+        ret = -errno;
+        error_report("vfio_dma_suspend(iova %lu, size %ld) error %d",
+                      iova, size, -errno);
+    }
+    return ret;
+}
+
+static int
+vfio_dma_resume(VFIOContainer *container, hwaddr iova, ram_addr_t size,
+               void *vaddr)
+{
+    int ret = 0;
+    struct vfio_iommu_type1_dma_map map = {
+        .argsz = sizeof(map),
+        .flags = VFIO_DMA_MAP_FLAG_RESUME,
+        .vaddr = (__u64)(uintptr_t)vaddr,
+        .iova = iova,
+        .size = size,
+    };
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
+        ret = -errno;
+        error_report("vfio_dma_resume(iova %lu, size %ld, va %p) error %d",
+                      iova, size, vaddr, -errno);
+    }
+    return ret;
+}
+
+static int vfio_region_resume(MemoryRegionSection *section, void *handle)
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
+    trace_vfio_region_resume(name, container->fd, iova, iova + size - 1, vaddr);
+    return vfio_dma_resume(container, iova, size, vaddr);
+}
+
+int vfio_cprsave(void)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            if (!ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_SUSPEND)) {
+                error_report("error: IOMMU does not support VFIO_SUSPEND.");
+                return -1;
+            }
+            if (vfio_dma_suspend(container, 0, 0)) {
+                return 1;
+            }
+        }
+    }
+    return 0;
+}
+
+int vfio_cprload(void)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        QLIST_FOREACH(container, &space->containers, next) {
+            container->reused = false;
+            if (as_flat_walk(space->as, vfio_region_resume, container)) {
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
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 9b57ffa..042c52e 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -28,6 +28,8 @@
 #include "hw/pci/pci_bridge.h"
 #include "hw/qdev-properties.h"
 #include "migration/vmstate.h"
+#include "migration/cpr.h"
+#include "qemu/env.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -1599,6 +1601,14 @@ static void vfio_mmap_set_enabled(VFIOPCIDevice *vdev, bool enabled)
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
@@ -1639,6 +1649,7 @@ static void vfio_bars_prepare(VFIOPCIDevice *vdev)
 static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
 {
     VFIOBAR *bar = &vdev->bars[nr];
+    PCIDevice *pdev = &vdev->pdev;
     char *name;
 
     if (!bar->size) {
@@ -1659,7 +1670,10 @@ static void vfio_bar_register(VFIOPCIDevice *vdev, int nr)
         }
     }
 
-    pci_register_bar(&vdev->pdev, nr, bar->type, bar->mr);
+    pci_register_bar(pdev, nr, bar->type, bar->mr);
+    if (pdev->reused) {
+        vfio_config_sync(vdev, pci_bar(pdev, nr), 8);
+    }
 }
 
 static void vfio_bars_register(VFIOPCIDevice *vdev)
@@ -2576,6 +2590,27 @@ static void vfio_put_device(VFIOPCIDevice *vdev)
     vfio_put_base_device(&vdev->vbasedev);
 }
 
+static void setenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name,
+                            EventNotifier *ev)
+{
+    char envname[256];
+    int fd = event_notifier_get_fd(ev);
+    const char *vfname = vdev->vbasedev.name;
+
+    if (fd >= 0) {
+        snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+        setenv_fd(envname, fd);
+    }
+}
+
+static int getenv_event_fd(VFIOPCIDevice *vdev, int nr, const char *name)
+{
+    char envname[256];
+    const char *vfname = vdev->vbasedev.name;
+    snprintf(envname, sizeof(envname), "%s_%s_%d", vfname, name, nr);
+    return getenv_fd(envname);
+}
+
 static void vfio_err_notifier_handler(void *opaque)
 {
     VFIOPCIDevice *vdev = opaque;
@@ -2607,7 +2642,13 @@ static void vfio_err_notifier_handler(void *opaque)
 static void vfio_register_err_notifier(VFIOPCIDevice *vdev)
 {
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = getenv_event_fd(vdev, 0, "err");
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->err_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_err_notifier_handler, NULL, vdev);
+        return;
+    }
 
     if (!vdev->pci_aer) {
         return;
@@ -2668,7 +2709,14 @@ static void vfio_register_req_notifier(VFIOPCIDevice *vdev)
     struct vfio_irq_info irq_info = { .argsz = sizeof(irq_info),
                                       .index = VFIO_PCI_REQ_IRQ_INDEX };
     Error *err = NULL;
-    int32_t fd;
+    int32_t fd = getenv_event_fd(vdev, 0, "req");
+
+    if (fd >= 0) {
+        event_notifier_init_fd(&vdev->req_notifier, fd);
+        qemu_set_fd_handler(fd, vfio_req_notifier_handler, NULL, vdev);
+        vdev->req_enabled = true;
+        return;
+    }
 
     if (!(vdev->features & VFIO_FEATURE_ENABLE_REQ)) {
         return;
@@ -2824,6 +2872,7 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
         vfio_put_group(group);
         goto error;
     }
+    pdev->reused = vdev->vbasedev.reused;
 
     vfio_populate_device(vdev, &err);
     if (err) {
@@ -2986,9 +3035,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
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
 
@@ -3031,6 +3082,11 @@ static void vfio_realize(PCIDevice *pdev, Error **errp)
     vfio_register_req_notifier(vdev);
     vfio_setup_resetfn_quirk(vdev);
 
+    vfio_config_sync(vdev, pdev->msix_cap + PCI_MSIX_FLAGS, 2);
+    if (pdev->reused) {
+        pci_update_mappings(pdev);
+    }
+
     return;
 
 out_deregister:
@@ -3094,6 +3150,10 @@ static void vfio_pci_reset(DeviceState *dev)
 {
     VFIOPCIDevice *vdev = PCI_VFIO(dev);
 
+    if (vdev->pdev.reused) {
+        return;
+    }
+
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
     vfio_pci_pre_reset(vdev);
@@ -3196,6 +3256,106 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+static int vfio_pci_pre_save(void *opaque)
+{
+    VFIOPCIDevice *vdev = opaque;
+    int i;
+
+    for (i = 0; i < vdev->nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+        if (vector->use) {
+            setenv_event_fd(vdev, i, "interrupt", &vector->interrupt);
+            if (vector->virq >= 0) {
+                setenv_event_fd(vdev, i, "kvm_interrupt",
+                                &vector->kvm_interrupt);
+            }
+        }
+    }
+    setenv_event_fd(vdev, 0, "err", &vdev->err_notifier);
+    setenv_event_fd(vdev, 0, "req", &vdev->req_notifier);
+    return 0;
+}
+
+static void vfio_claim_vectors(VFIOPCIDevice *vdev, int nr_vectors, bool msix)
+{
+    int i, fd;
+    bool pending = false;
+    PCIDevice *pdev = &vdev->pdev;
+
+    vdev->nr_vectors = nr_vectors;
+    vdev->msi_vectors = g_new0(VFIOMSIVector, nr_vectors);
+    vdev->interrupt = msix ? VFIO_INT_MSIX : VFIO_INT_MSI;
+
+    for (i = 0; i < nr_vectors; i++) {
+        VFIOMSIVector *vector = &vdev->msi_vectors[i];
+
+        fd = getenv_event_fd(vdev, i, "interrupt");
+        if (fd >= 0) {
+            vfio_vector_init(vdev, i, fd);
+            qemu_set_fd_handler(fd, vfio_msi_interrupt, NULL, vector);
+        }
+
+        fd = getenv_event_fd(vdev, i, "kvm_interrupt");
+        if (fd >= 0) {
+            vfio_add_kvm_msi_virq(vdev, vector, i, msix, fd);
+        }
+
+        if (msix_is_pending(pdev, i) && msix_is_masked(pdev, i)) {
+            set_bit(i, vdev->msix->pending);
+            pending = true;
+        }
+    }
+
+    memory_region_set_enabled(&pdev->msix_pba_mmio, pending);
+}
+
+static int vfio_pci_post_load(void *opaque, int version_id)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    int nr_vectors;
+    bool enabled;
+
+    if (msix_enabled(pdev)) {
+        nr_vectors = vdev->msix->entries;
+        vfio_claim_vectors(vdev, nr_vectors, true);
+        msix_init_vector_notifiers(pdev, vfio_msix_vector_use,
+                                   vfio_msix_vector_release, NULL);
+
+    } else if (msi_enabled(pdev)) {
+        nr_vectors = msi_nr_vectors_allocated(pdev);
+        vfio_claim_vectors(vdev, nr_vectors, false);
+
+    } else if (vfio_pci_read_config(pdev, PCI_INTERRUPT_PIN, 1)) {
+        error_report("vfio_pci_post_load does not yet support INTX"); /* TBD */
+    }
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
+    .pre_save = vfio_pci_pre_save,
+    .needed = vfio_pci_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_MSIX(pdev, VFIOPCIDevice),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3203,6 +3363,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index b1ef55a..1ac7f99 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -115,6 +115,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_region_resume(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index bd07c86..c926a24 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -358,6 +358,7 @@ struct PCIDevice {
 
     /* ID of standby device in net_failover pair */
     char *failover_pair_id;
+    bool reused;
 };
 
 void pci_register_bar(PCIDevice *pci_dev, int region_num,
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index ab87df4..ac13fe0 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -73,6 +73,7 @@ typedef struct VFIOContainer {
     unsigned iommu_type;
     Error *error;
     bool initialized;
+    bool reused;
     unsigned long pgsizes;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
@@ -109,6 +110,7 @@ typedef struct VFIODevice {
     bool needs_reset;
     bool no_mmap;
     bool ram_block_discard_allowed;
+    bool reused;
     VFIODeviceOps *ops;
     unsigned int num_irqs;
     unsigned int num_regions;
@@ -178,6 +180,8 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
+int vfio_cprsave(void);
+int vfio_cprload(void);
 
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
diff --git a/linux-headers/linux/vfio.h b/linux-headers/linux/vfio.h
index f09df26..9563672 100644
--- a/linux-headers/linux/vfio.h
+++ b/linux-headers/linux/vfio.h
@@ -46,6 +46,9 @@
  */
 #define VFIO_NOIOMMU_IOMMU		8
 
+/* Supports VFIO DMA suspend and resume */
+#define VFIO_SUSPEND                    9
+
 /*
  * The IOCTL interface is designed for extensibility by embedding the
  * structure length (argsz) and flags into structures passed between
@@ -1052,6 +1055,7 @@ struct vfio_iommu_type1_dma_map {
 	__u32	flags;
 #define VFIO_DMA_MAP_FLAG_READ (1 << 0)		/* readable from device */
 #define VFIO_DMA_MAP_FLAG_WRITE (1 << 1)	/* writable from device */
+#define VFIO_DMA_MAP_FLAG_RESUME (1 << 2)
 	__u64	vaddr;				/* Process virtual address */
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
@@ -1088,6 +1092,7 @@ struct vfio_iommu_type1_dma_unmap {
 	__u32	argsz;
 	__u32	flags;
 #define VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP (1 << 0)
+#define VFIO_DMA_UNMAP_FLAG_SUSPEND (1 << 1)
 	__u64	iova;				/* IO virtual address */
 	__u64	size;				/* Size of mapping (bytes) */
 	__u8    data[];
diff --git a/migration/cpr.c b/migration/cpr.c
index a8f3c10..045ebc5 100644
--- a/migration/cpr.c
+++ b/migration/cpr.c
@@ -131,6 +131,9 @@ void cprsave(const char *file, CprMode mode, Error **errp)
         no_shutdown = 0;
         qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
     } else if (restart) {
+        if (vfio_cprsave()) {
+            goto err;
+        }
         walkenv(FD_PREFIX, preserve_fd, 0);
         setenv("QEMU_START_FREEZE", "", 1);
         qemu_system_exec_request();
@@ -174,6 +177,7 @@ void cprload(const char *file, Error **errp)
         error_setg(errp, "Error %d while loading VM state", ret);
         return;
     }
+    vfio_cprload();
 
     state = global_state_get_runstate();
     if (state == RUN_STATE_RUNNING) {
-- 
1.8.3.1


