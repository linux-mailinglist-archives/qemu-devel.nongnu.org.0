Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E517254CC43
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Jun 2022 17:13:05 +0200 (CEST)
Received: from localhost ([::1]:48316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o1Uhc-0000Ve-05
	for lists+qemu-devel@lfdr.de; Wed, 15 Jun 2022 11:13:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOq-0007ol-2y
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:40 -0400
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32]:14032)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <steven.sistare@oracle.com>)
 id 1o1UOm-00016f-V4
 for qemu-devel@nongnu.org; Wed, 15 Jun 2022 10:53:39 -0400
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 25FEE6kf002105;
 Wed, 15 Jun 2022 14:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references; s=corp-2021-07-09;
 bh=aDby7CAiXypZ4R7hIBbF9zwQEAmWYCb6ok4J3j3LVzE=;
 b=RsYgqW9S3Yi8o4KXcSmxx35/debNmVucbLPuOm4p4z0FinGtM/oFG+xnjscKTtBO1KzU
 FFH6CaxKiRCy8i5ABm5H2kPn/h7UwetaC53L+JsfqLya/qfN/SYTizy9Za/tqaQTz8c/
 zafqdEaXWQgcVRqTgwG4oVY/hfyucL/HzQtdP88dDIyt1z04ssWE7jJfjhDGcyGR9thH
 CryY96D+Dq30COG0qf61qvvplRf7a+eXvNVH+61TYhUzXPD/IzQt/rDO75EHKW2ldPb7
 /RHHoLgZvo71KQGewmq6nnwg3YZLXkzhA20yObMJH5O16933/enlx8Feih+r+S/2Wgcj lA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3gmhfcrskd-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:02 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.16.1.2/8.16.1.2)
 with SMTP id 25FEQ72S023081; Wed, 15 Jun 2022 14:53:01 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vq0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Jun 2022 14:53:01 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 25FEqSNb018501;
 Wed, 15 Jun 2022 14:53:00 GMT
Received: from ca-dev63.us.oracle.com (ca-dev63.us.oracle.com [10.211.8.221])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com with ESMTP id
 3gpr25vpfm-28; Wed, 15 Jun 2022 14:53:00 +0000
From: Steve Sistare <steven.sistare@oracle.com>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 "Daniel P. Berrange" <berrange@redhat.com>,
 Juan Quintela <quintela@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>,
 Jason Zeng <jason.zeng@linux.intel.com>,
 Zheng Chuan <zhengchuan@huawei.com>,
 Steve Sistare <steven.sistare@oracle.com>,
 Mark Kanda <mark.kanda@oracle.com>, Guoyi Tu <tugy@chinatelecom.cn>,
 Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philippe.mathieu.daude@gmail.com>, 
 Igor Mammedov <imammedo@redhat.com>,
 David Hildenbrand <david@redhat.com>, John Snow <jsnow@redhat.com>
Subject: [PATCH V8 27/39] vfio-pci: cpr part 1 (fd and dma)
Date: Wed, 15 Jun 2022 07:52:14 -0700
Message-Id: <1655304746-102776-28-git-send-email-steven.sistare@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
References: <1655304746-102776-1-git-send-email-steven.sistare@oracle.com>
X-Proofpoint-ORIG-GUID: 5hfGy1A1AQFrl6v4dSOI5d8W3PS6fIrR
X-Proofpoint-GUID: 5hfGy1A1AQFrl6v4dSOI5d8W3PS6fIrR
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=steven.sistare@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Enable vfio-pci devices to be saved and restored across an exec restart
of qemu.

At vfio creation time, save the value of vfio container, group, and device
descriptors in cpr state.

In the container pre_save handler, suspend the use of virtual addresses in
DMA mappings with VFIO_DMA_UNMAP_FLAG_VADDR, because guest ram will be
remapped at a different VA after exec.  DMA to already-mapped pages
continues.  Save the msi message area as part of vfio-pci vmstate, save the
interrupt and notifier eventfd's in cpr state, and clear the close-on-exec
flag for the vfio descriptors.  The flag is not cleared earlier because the
descriptors should not persist across miscellaneous fork and exec calls
that may be performed during normal operation.

On qemu restart, vfio_realize() finds the saved descriptors, uses
the descriptors, and notes that the device is being reused.  Device and
iommu state is already configured, so operations in vfio_realize that
would modify the configuration are skipped for a reused device, including
vfio ioctl's and writes to PCI configuration space.  Vfio PCI device reset
is also suppressed. The result is that vfio_realize constructs qemu data
structures that reflect the current state of the device.  However, the
reconstruction is not complete until cpr-load is called. cpr-load loads the
msi data.  The vfio post_load handler finds eventfds in cpr state, rebuilds
vector data structures, and attaches the interrupts to the new KVM instance.
The container post_load handler then invokes the main vfio listener
callback, which walks the flattened ranges of the vfio address space and
calls VFIO_DMA_MAP_FLAG_VADDR to inform the kernel of the new VA's.  Lastly,
cpr-load starts the VM.

This functionality is delivered by 3 patches for clarity.  Part 1 handles
device file descriptors and DMA.  Part 2 adds eventfd and MSI/MSI-X vector
support.  Part 3 adds INTX support.

Signed-off-by: Steve Sistare <steven.sistare@oracle.com>
---
 MAINTAINERS                   |   1 +
 hw/pci/pci.c                  |  12 ++++
 hw/vfio/common.c              | 151 +++++++++++++++++++++++++++++++++++-------
 hw/vfio/cpr.c                 | 119 +++++++++++++++++++++++++++++++++
 hw/vfio/meson.build           |   1 +
 hw/vfio/pci.c                 |  44 ++++++++++++
 hw/vfio/trace-events          |   1 +
 include/hw/vfio/vfio-common.h |  11 +++
 include/migration/vmstate.h   |   1 +
 9 files changed, 317 insertions(+), 24 deletions(-)
 create mode 100644 hw/vfio/cpr.c

diff --git a/MAINTAINERS b/MAINTAINERS
index 74a43e6..864aec6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3156,6 +3156,7 @@ CPR
 M: Steve Sistare <steven.sistare@oracle.com>
 M: Mark Kanda <mark.kanda@oracle.com>
 S: Maintained
+F: hw/vfio/cpr.c
 F: include/migration/cpr.h
 F: migration/cpr.c
 F: qapi/cpr.json
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 6e70153..a3b19eb 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -32,6 +32,7 @@
 #include "hw/pci/pci_host.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
+#include "migration/cpr.h"
 #include "migration/qemu-file-types.h"
 #include "migration/vmstate.h"
 #include "monitor/monitor.h"
@@ -341,6 +342,17 @@ static void pci_reset_regions(PCIDevice *dev)
 
 static void pci_do_device_reset(PCIDevice *dev)
 {
+    /*
+     * A PCI device that is resuming for cpr is already configured, so do
+     * not reset it here when we are called from qemu_system_reset prior to
+     * cpr-load, else interrupts may be lost for vfio-pci devices.  It is
+     * safe to skip this reset for all PCI devices, because cpr-load will set
+     * all fields that would have been set here.
+     */
+    if (cpr_get_mode() == CPR_MODE_RESTART) {
+        return;
+    }
+
     pci_device_deassert_intx(dev);
     assert(dev->irq_state == 0);
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562..c7d73b6 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -31,6 +31,7 @@
 #include "exec/memory.h"
 #include "exec/ram_addr.h"
 #include "hw/hw.h"
+#include "migration/cpr.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/range.h"
@@ -460,6 +461,8 @@ static int vfio_dma_unmap(VFIOContainer *container,
         .size = size,
     };
 
+    assert(!container->reused);
+
     if (iotlb && container->dirty_pages_supported &&
         vfio_devices_all_running_and_saving(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
@@ -496,12 +499,24 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
 {
     struct vfio_iommu_type1_dma_map map = {
         .argsz = sizeof(map),
-        .flags = VFIO_DMA_MAP_FLAG_READ,
         .vaddr = (__u64)(uintptr_t)vaddr,
         .iova = iova,
         .size = size,
     };
 
+    /*
+     * Set the new vaddr for any mappings registered during cpr-load.
+     * Reused is cleared thereafter.
+     */
+    if (container->reused) {
+        map.flags = VFIO_DMA_MAP_FLAG_VADDR;
+        if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map)) {
+            goto fail;
+        }
+        return 0;
+    }
+
+    map.flags = VFIO_DMA_MAP_FLAG_READ;
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
@@ -517,7 +532,9 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         return 0;
     }
 
-    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
+fail:
+    error_report("vfio_dma_map %s (iova %lu, size %ld, va %p): %s",
+        (container->reused ? "VADDR" : ""), iova, size, vaddr, strerror(errno));
     return -errno;
 }
 
@@ -882,6 +899,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    vfio_container_region_add(container, section);
+}
+
+void vfio_container_region_add(VFIOContainer *container,
+                               MemoryRegionSection *section)
+{
     hwaddr iova, end;
     Int128 llend, llsize;
     void *vaddr;
@@ -1492,6 +1515,12 @@ static void vfio_listener_release(VFIOContainer *container)
     }
 }
 
+void vfio_listener_register(VFIOContainer *container)
+{
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+}
+
 static struct vfio_info_cap_header *
 vfio_get_cap(void *ptr, uint32_t cap_offset, uint16_t id)
 {
@@ -1910,6 +1939,22 @@ static int vfio_init_container(VFIOContainer *container, int group_fd,
 {
     int iommu_type, ret;
 
+    /*
+     * If container is reused, just set its type and skip the ioctls, as the
+     * container and group are already configured in the kernel.
+     * VFIO_TYPE1v2_IOMMU is the only type that supports reuse/cpr.
+     */
+    if (container->reused) {
+        if (ioctl(container->fd, VFIO_CHECK_EXTENSION, VFIO_TYPE1v2_IOMMU)) {
+            container->iommu_type = VFIO_TYPE1v2_IOMMU;
+            return 0;
+        } else {
+            error_setg(errp, "container was reused but VFIO_TYPE1v2_IOMMU "
+                             "is not supported");
+            return -errno;
+        }
+    }
+
     iommu_type = vfio_get_iommu_type(container, errp);
     if (iommu_type < 0) {
         return iommu_type;
@@ -2014,9 +2059,12 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 {
     VFIOContainer *container;
     int ret, fd;
+    bool reused;
     VFIOAddressSpace *space;
 
     space = vfio_get_address_space(as);
+    fd = cpr_find_fd("vfio_container_for_group", group->groupid);
+    reused = (fd > 0);
 
     /*
      * VFIO is currently incompatible with discarding of RAM insofar as the
@@ -2049,27 +2097,47 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
      * details once we know which type of IOMMU we are using.
      */
 
+    /*
+     * If the container is reused, then the group is already attached in the
+     * kernel.  If a container with matching fd is found, then update the
+     * userland group list and return.  If not, then after the loop, create
+     * the container struct and group list.
+     */
+
     QLIST_FOREACH(container, &space->containers, next) {
-        if (!ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
-            ret = vfio_ram_block_discard_disable(container, true);
-            if (ret) {
-                error_setg_errno(errp, -ret,
-                                 "Cannot set discarding of RAM broken");
-                if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
-                          &container->fd)) {
-                    error_report("vfio: error disconnecting group %d from"
-                                 " container", group->groupid);
-                }
-                return ret;
+        if (reused) {
+            if (container->fd != fd) {
+                continue;
             }
-            group->container = container;
-            QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+        } else if (ioctl(group->fd, VFIO_GROUP_SET_CONTAINER, &container->fd)) {
+            continue;
+        }
+
+        ret = vfio_ram_block_discard_disable(container, true);
+        if (ret) {
+            error_setg_errno(errp, -ret,
+                             "Cannot set discarding of RAM broken");
+            if (ioctl(group->fd, VFIO_GROUP_UNSET_CONTAINER,
+                      &container->fd)) {
+                error_report("vfio: error disconnecting group %d from"
+                             " container", group->groupid);
+            }
+            return ret;
+        }
+        group->container = container;
+        QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+        if (!reused) {
             vfio_kvm_device_add_group(group);
-            return 0;
+            cpr_save_fd("vfio_container_for_group", group->groupid,
+                        container->fd);
         }
+        return 0;
+    }
+
+    if (!reused) {
+        fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
     }
 
-    fd = qemu_open_old("/dev/vfio/vfio", O_RDWR);
     if (fd < 0) {
         error_setg_errno(errp, errno, "failed to open /dev/vfio/vfio");
         ret = -errno;
@@ -2087,6 +2155,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container = g_malloc0(sizeof(*container));
     container->space = space;
     container->fd = fd;
+    container->reused = reused;
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
@@ -2099,6 +2168,11 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         goto free_container_exit;
     }
 
+    ret = vfio_cpr_register_container(container, errp);
+    if (ret) {
+        goto free_container_exit;
+    }
+
     ret = vfio_ram_block_discard_disable(container, true);
     if (ret) {
         error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
@@ -2213,9 +2287,16 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     group->container = container;
     QLIST_INSERT_HEAD(&container->group_list, group, container_next);
 
-    container->listener = vfio_memory_listener;
-
-    memory_listener_register(&container->listener, container->space->as);
+    /*
+     * If reused, register the listener later, after all state that may
+     * affect regions and mapping boundaries has been cpr-load'ed.  Later,
+     * the listener will invoke its callback on each flat section and call
+     * vfio_dma_map to supply the new vaddr, and the calls will match the
+     * mappings remembered by the kernel.
+     */
+    if (!reused) {
+        vfio_listener_register(container);
+    }
 
     if (container->error) {
         ret = -1;
@@ -2225,8 +2306,9 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     }
 
     container->initialized = true;
+    ret = cpr_resave_fd("vfio_container_for_group", group->groupid, fd, errp);
 
-    return 0;
+    return ret;
 listener_release_exit:
     QLIST_REMOVE(group, container_next);
     QLIST_REMOVE(container, next);
@@ -2254,6 +2336,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
 
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
+    cpr_delete_fd("vfio_container_for_group", group->groupid);
 
     /*
      * Explicitly release the listener first before unset container,
@@ -2290,6 +2373,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
         }
 
         trace_vfio_disconnect_container(container->fd);
+        vfio_cpr_unregister_container(container);
         close(container->fd);
         g_free(container);
 
@@ -2319,7 +2403,12 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
     group = g_malloc0(sizeof(*group));
 
     snprintf(path, sizeof(path), "/dev/vfio/%d", groupid);
-    group->fd = qemu_open_old(path, O_RDWR);
+
+    group->fd = cpr_find_fd("vfio_group", groupid);
+    if (group->fd < 0) {
+        group->fd = qemu_open_old(path, O_RDWR);
+    }
+
     if (group->fd < 0) {
         error_setg_errno(errp, errno, "failed to open %s", path);
         goto free_group_exit;
@@ -2353,6 +2442,10 @@ VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp)
 
     QLIST_INSERT_HEAD(&vfio_group_list, group, next);
 
+    if (cpr_resave_fd("vfio_group", groupid, group->fd, errp)) {
+        goto close_fd_exit;
+    }
+
     return group;
 
 close_fd_exit:
@@ -2377,6 +2470,7 @@ void vfio_put_group(VFIOGroup *group)
     vfio_disconnect_container(group);
     QLIST_REMOVE(group, next);
     trace_vfio_put_group(group->fd);
+    cpr_delete_fd("vfio_group", group->groupid);
     close(group->fd);
     g_free(group);
 
@@ -2390,8 +2484,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
 {
     struct vfio_device_info dev_info = { .argsz = sizeof(dev_info) };
     int ret, fd;
+    bool reused;
+
+    fd = cpr_find_fd(name, 0);
+    reused = (fd >= 0);
+    if (!reused) {
+        fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
+    }
 
-    fd = ioctl(group->fd, VFIO_GROUP_GET_DEVICE_FD, name);
     if (fd < 0) {
         error_setg_errno(errp, errno, "error getting device from group %d",
                          group->groupid);
@@ -2436,12 +2536,14 @@ int vfio_get_device(VFIOGroup *group, const char *name,
     vbasedev->num_irqs = dev_info.num_irqs;
     vbasedev->num_regions = dev_info.num_regions;
     vbasedev->flags = dev_info.flags;
+    vbasedev->reused = reused;
 
     trace_vfio_get_device(name, dev_info.flags, dev_info.num_regions,
                           dev_info.num_irqs);
 
     vbasedev->reset_works = !!(dev_info.flags & VFIO_DEVICE_FLAGS_RESET);
-    return 0;
+    ret = cpr_resave_fd(name, 0, fd, errp);
+    return ret;
 }
 
 void vfio_put_base_device(VFIODevice *vbasedev)
@@ -2452,6 +2554,7 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
+    cpr_delete_fd(vbasedev->name, 0);
     close(vbasedev->fd);
 }
 
diff --git a/hw/vfio/cpr.c b/hw/vfio/cpr.c
new file mode 100644
index 0000000..a227d5e
--- /dev/null
+++ b/hw/vfio/cpr.c
@@ -0,0 +1,119 @@
+/*
+ * Copyright (c) 2021, 2022 Oracle and/or its affiliates.
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
+#include "migration/cpr.h"
+#include "migration/vmstate.h"
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
+    container->vaddr_unmapped = true;
+    return 0;
+}
+
+static bool vfio_is_cpr_capable(VFIOContainer *container, Error **errp)
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
+static bool vfio_vmstate_needed(void *opaque)
+{
+    return cpr_get_mode() == CPR_MODE_RESTART;
+}
+
+static int vfio_container_pre_save(void *opaque)
+{
+    VFIOContainer *container = (VFIOContainer *)opaque;
+    Error *err;
+
+    if (!vfio_is_cpr_capable(container, &err) ||
+        vfio_dma_unmap_vaddr_all(container, &err)) {
+        error_report_err(err);
+        return -1;
+    }
+    return 0;
+}
+
+static int vfio_container_post_load(void *opaque, int version_id)
+{
+    VFIOContainer *container = (VFIOContainer *)opaque;
+    VFIOGroup *group;
+    Error *err;
+    VFIODevice *vbasedev;
+
+    if (!vfio_is_cpr_capable(container, &err)) {
+        error_report_err(err);
+        return -1;
+    }
+
+    vfio_listener_register(container);
+    container->reused = false;
+
+    QLIST_FOREACH(group, &container->group_list, container_next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            vbasedev->reused = false;
+        }
+    }
+    return 0;
+}
+
+static const VMStateDescription vfio_container_vmstate = {
+    .name = "vfio-container",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .pre_save = vfio_container_pre_save,
+    .post_load = vfio_container_post_load,
+    .needed = vfio_vmstate_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+int vfio_cpr_register_container(VFIOContainer *container, Error **errp)
+{
+    container->cpr_blocker = NULL;
+    if (!vfio_is_cpr_capable(container, &container->cpr_blocker)) {
+        return cpr_add_blocker(&container->cpr_blocker, errp,
+                               CPR_MODE_RESTART, 0);
+    }
+
+    vmstate_register(NULL, -1, &vfio_container_vmstate, container);
+
+    return 0;
+}
+
+void vfio_cpr_unregister_container(VFIOContainer *container)
+{
+    cpr_del_blocker(&container->cpr_blocker);
+
+    vmstate_unregister(NULL, &vfio_container_vmstate, container);
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
index 0143c9a..237231b 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -30,6 +30,7 @@
 #include "hw/qdev-properties-system.h"
 #include "migration/vmstate.h"
 #include "qapi/qmp/qdict.h"
+#include "migration/cpr.h"
 #include "qemu/error-report.h"
 #include "qemu/main-loop.h"
 #include "qemu/module.h"
@@ -2514,6 +2515,7 @@ const VMStateDescription vmstate_vfio_pci_config = {
     .name = "VFIOPCIDevice",
     .version_id = 1,
     .minimum_version_id = 1,
+    .priority = MIG_PRI_VFIO_PCI,   /* * must load before container */
     .fields = (VMStateField[]) {
         VMSTATE_PCI_DEVICE(pdev, VFIOPCIDevice),
         VMSTATE_MSIX_TEST(pdev, VFIOPCIDevice, vfio_msix_present),
@@ -3243,6 +3245,11 @@ static void vfio_pci_reset(DeviceState *dev)
 {
     VFIOPCIDevice *vdev = VFIO_PCI(dev);
 
+    /* Do not reset the device during qemu_system_reset prior to cpr-load */
+    if (vdev->vbasedev.reused) {
+        return;
+    }
+
     trace_vfio_pci_reset(vdev->vbasedev.name);
 
     vfio_pci_pre_reset(vdev);
@@ -3350,6 +3357,42 @@ static Property vfio_pci_dev_properties[] = {
     DEFINE_PROP_END_OF_LIST(),
 };
 
+/*
+ * The kernel may change non-emulated config bits.  Exclude them from the
+ * changed-bits check in get_pci_config_device.
+ */
+static int vfio_pci_pre_load(void *opaque)
+{
+    VFIOPCIDevice *vdev = opaque;
+    PCIDevice *pdev = &vdev->pdev;
+    int size = MIN(pci_config_size(pdev), vdev->config_size);
+    int i;
+
+    for (i = 0; i < size; i++) {
+        pdev->cmask[i] &= vdev->emulated_config_bits[i];
+    }
+
+    return 0;
+}
+
+static bool vfio_pci_needed(void *opaque)
+{
+    return cpr_get_mode() == CPR_MODE_RESTART;
+}
+
+static const VMStateDescription vfio_pci_vmstate = {
+    .name = "vfio-pci",
+    .unmigratable = 1,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .priority = MIG_PRI_VFIO_PCI,       /* must load before container */
+    .pre_load = vfio_pci_pre_load,
+    .needed = vfio_pci_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -3357,6 +3400,7 @@ static void vfio_pci_dev_class_init(ObjectClass *klass, void *data)
 
     dc->reset = vfio_pci_reset;
     device_class_set_props(dc, vfio_pci_dev_properties);
+    dc->vmsd = &vfio_pci_vmstate;
     dc->desc = "VFIO-based PCI device assignment";
     set_bit(DEVICE_CATEGORY_MISC, dc->categories);
     pdc->realize = vfio_realize;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9..a6d0034 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -119,6 +119,7 @@ vfio_region_sparse_mmap_header(const char *name, int index, int nr_areas) "Devic
 vfio_region_sparse_mmap_entry(int i, unsigned long start, unsigned long end) "sparse entry %d [0x%lx - 0x%lx]"
 vfio_get_dev_region(const char *name, int index, uint32_t type, uint32_t subtype) "%s index %d, %08x/%0x8"
 vfio_dma_unmap_overflow_workaround(void) ""
+vfio_region_remap(const char *name, int fd, uint64_t iova_start, uint64_t iova_end, void *vaddr) "%s fd %d 0x%"PRIx64" - 0x%"PRIx64" [%p]"
 
 # platform.c
 vfio_platform_base_device_init(char *name, int groupid) "%s belongs to group #%d"
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a..17ad9ba 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -81,10 +81,14 @@ typedef struct VFIOContainer {
     int fd; /* /dev/vfio/vfio, empowered by the attached groups */
     MemoryListener listener;
     MemoryListener prereg_listener;
+    Notifier cpr_notifier;
+    Error *cpr_blocker;
     unsigned iommu_type;
     Error *error;
     bool initialized;
     bool dirty_pages_supported;
+    bool reused;
+    bool vaddr_unmapped;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -136,6 +140,7 @@ typedef struct VFIODevice {
     bool no_mmap;
     bool ram_block_discard_allowed;
     bool enable_migration;
+    bool reused;
     VFIODeviceOps *ops;
     unsigned int num_irqs;
     unsigned int num_regions;
@@ -213,6 +218,9 @@ void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
 
+int vfio_cpr_register_container(VFIOContainer *container, Error **errp);
+void vfio_cpr_unregister_container(VFIOContainer *container);
+
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
@@ -234,6 +242,9 @@ struct vfio_info_cap_header *
 vfio_get_device_info_cap(struct vfio_device_info *info, uint16_t id);
 #endif
 extern const MemoryListener vfio_prereg_listener;
+void vfio_listener_register(VFIOContainer *container);
+void vfio_container_region_add(VFIOContainer *container,
+                               MemoryRegionSection *section);
 
 int vfio_spapr_create_window(VFIOContainer *container,
                              MemoryRegionSection *section,
diff --git a/include/migration/vmstate.h b/include/migration/vmstate.h
index ad24aa1..19f1538 100644
--- a/include/migration/vmstate.h
+++ b/include/migration/vmstate.h
@@ -157,6 +157,7 @@ typedef enum {
     MIG_PRI_GICV3_ITS,          /* Must happen before PCI devices */
     MIG_PRI_GICV3,              /* Must happen before the ITS */
     MIG_PRI_MAX,
+    MIG_PRI_VFIO_PCI = MIG_PRI_IOMMU,
 } MigrationPriority;
 
 struct VMStateField {
-- 
1.8.3.1


