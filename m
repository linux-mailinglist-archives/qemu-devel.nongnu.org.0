Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C86AF621FEB
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbl-00050R-Oh; Tue, 08 Nov 2022 18:02:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbb-0004vl-VP
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003fy-Ef
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:06 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx5Z1026348
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=HI6rff0LobHpbQGUZBAD7GPOWnpJE/pV0HBVADMQPW8=;
 b=hv0yW2OIE7yWePAfM379t/c5MhglYAN48fSVRSakBycrhoXWsLfItByKF6esByBBW/Z+
 MQN0oOqvJqhcMbv/TF6QLr/1rmuJtCAqrzL/cj828ugpJjYoUetjbVKH4UnoeFMNFQS6
 iPT10saVHusQO3hfMUs7JJyDuIbM/nlUcqC6y+GF56PPOpNPzbCDGHsC4xb53wbjGm/h
 5NFhhNkz0w363V1iLyC3Ixj20R/zZzUJUzpT3zfdDV1i3pCNjSnGcp+C7wTBSKuc1jMh
 1I6nsIM79ctA6mjC9HRBoVOjmWWiWFEjW9oUHaY1IqN/E+P4XO/tRniZsRu+/ZJo1wLA 8w== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7wh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:50 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6V004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:49 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:49 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 16/24] vfio-user: proxy container connect/disconnect
Date: Tue,  8 Nov 2022 15:13:38 -0800
Message-Id: <61dd08e18705b335f8cd02f69698aa8248ebaf96.1667542066.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1667542066.git.john.g.johnson@oracle.com>
References: <cover.1667542066.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.895,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-11-07_11,2022-11-08_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 spamscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2210170000
 definitions=main-2211080151
X-Proofpoint-GUID: l7_1mk2rLeQ6GLGxyFPz6p1jvgrBq2rB
X-Proofpoint-ORIG-GUID: l7_1mk2rLeQ6GLGxyFPz6p1jvgrBq2rB
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0b-00069f02.pphosted.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/common.c              | 207 +++++++++++++++++++++++++++++++++++++++++-
 hw/vfio/pci.c                 |  18 +++-
 hw/vfio/user.c                |   3 +
 hw/vfio/user.h                |   1 +
 include/hw/vfio/vfio-common.h |   6 ++
 5 files changed, 231 insertions(+), 4 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index b540195..e73a772 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -19,6 +19,7 @@
  */
 
 #include "qemu/osdep.h"
+#include CONFIG_DEVICES
 #include <sys/ioctl.h>
 #ifdef CONFIG_KVM
 #include <linux/kvm.h>
@@ -2267,6 +2268,208 @@ put_space_exit:
     return ret;
 }
 
+
+#ifdef CONFIG_VFIO_USER
+
+static int vfio_connect_proxy(VFIOProxy *proxy, VFIOGroup *group,
+                              AddressSpace *as, Error **errp)
+{
+    VFIOAddressSpace *space;
+    VFIOContainer *container;
+    int ret;
+
+    /*
+     * try to mirror vfio_connect_container()
+     * as much as possible
+     */
+
+    space = vfio_get_address_space(as);
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->fd = -1;
+    container->error = NULL;
+    container->io_ops = &vfio_cont_io_sock;
+    QLIST_INIT(&container->giommu_list);
+    QLIST_INIT(&container->hostwin_list);
+    QLIST_INIT(&container->vrdl_list);
+    container->proxy = proxy;
+
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Mascarade as TYPE1
+     * for maximum capatibility
+     */
+    container->iommu_type = VFIO_TYPE1_IOMMU;
+
+    /*
+     * VFIO user allows the device server to map guest
+     * memory so it has the same issue with discards as
+     * a local IOMMU has.
+     */
+    ret = vfio_ram_block_discard_disable(container, true);
+    if (ret) {
+        error_setg_errno(errp, -ret, "Cannot set discarding of RAM broken");
+        goto free_container_exit;
+    }
+
+    vfio_host_win_add(container, 0, (hwaddr)-1, proxy->dma_pgsizes);
+    container->pgsizes = proxy->dma_pgsizes;
+    container->dma_max_mappings = proxy->max_dma;
+
+    /* setup bitmask now, but migration support won't be ready until v2 */
+    container->dirty_pages_supported = true;
+    container->max_dirty_bitmap_size = proxy->max_bitmap;
+    container->dirty_pgsizes = proxy->migr_pgsize;
+
+    QLIST_INIT(&container->group_list);
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, container->space->as);
+
+    if (container->error) {
+        ret = -1;
+        error_propagate_prepend(errp, container->error,
+            "memory listener initialization failed: ");
+        goto listener_release_exit;
+    }
+
+    container->initialized = true;
+
+    return 0;
+
+listener_release_exit:
+    QLIST_REMOVE(group, container_next);
+    QLIST_REMOVE(container, next);
+    vfio_listener_release(container);
+    vfio_ram_block_discard_disable(container, false);
+
+free_container_exit:
+    g_free(container);
+
+    vfio_put_address_space(space);
+
+    return ret;
+}
+
+static void vfio_disconnect_proxy(VFIOGroup *group)
+{
+    VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
+    VFIOGuestIOMMU *giommu, *tmp;
+    VFIOHostDMAWindow *hostwin, *next;
+
+    /*
+     * try to mirror vfio_disconnect_container()
+     * as much as possible, knowing each device
+     * is in one group and one container
+     */
+
+    QLIST_REMOVE(group, container_next);
+    group->container = NULL;
+
+    /*
+     * Explicitly release the listener first before unset container,
+     * since unset may destroy the backend container if it's the last
+     * group.
+     */
+    memory_listener_unregister(&container->listener);
+
+    QLIST_REMOVE(container, next);
+
+    QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
+        memory_region_unregister_iommu_notifier(
+            MEMORY_REGION(giommu->iommu_mr), &giommu->n);
+        QLIST_REMOVE(giommu, giommu_next);
+        g_free(giommu);
+    }
+
+    QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
+                       next) {
+        QLIST_REMOVE(hostwin, hostwin_next);
+        g_free(hostwin);
+    }
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
+int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp)
+{
+    struct vfio_device_info info = { .argsz = sizeof(info) };
+    int ret;
+
+    ret = VDEV_GET_INFO(vbasedev, &info);
+    if (ret) {
+        error_setg_errno(errp, -ret, "get info failure");
+        return ret;
+    }
+
+    vbasedev->fd = -1;
+    vbasedev->group = group;
+    QLIST_INSERT_HEAD(&group->device_list, vbasedev, next);
+
+    vbasedev->num_irqs = info.num_irqs;
+    vbasedev->num_regions = info.num_regions;
+    vbasedev->flags = info.flags;
+
+    vfio_get_all_regions(vbasedev);
+    vbasedev->reset_works = !!(info.flags & VFIO_DEVICE_FLAGS_RESET);
+    return 0;
+}
+
+VFIOGroup *vfio_user_get_group(VFIOProxy *proxy, AddressSpace *as, Error **errp)
+{
+    VFIOGroup *group;
+
+    /*
+     * Mirror vfio_get_group(), except that each
+     * device gets its own group and container,
+     * unrelated to any host IOMMU groupings
+     */
+    group = g_malloc0(sizeof(*group));
+    group->fd = -1;
+    group->groupid = -1;
+    QLIST_INIT(&group->device_list);
+
+    if (vfio_connect_proxy(proxy, group, as, errp)) {
+        error_prepend(errp, "failed to connect proxy");
+        g_free(group);
+        group = NULL;
+    }
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_register_reset(vfio_reset_handler, NULL);
+    }
+
+    QLIST_INSERT_HEAD(&vfio_group_list, group, next);
+
+    return group;
+}
+
+void vfio_user_put_group(VFIOGroup *group)
+{
+    if (!group || !QLIST_EMPTY(&group->device_list)) {
+        return;
+    }
+
+    vfio_ram_block_discard_disable(group->container, false);
+    vfio_disconnect_proxy(group);
+    QLIST_REMOVE(group, next);
+    g_free(group);
+
+    if (QLIST_EMPTY(&vfio_group_list)) {
+        qemu_unregister_reset(vfio_reset_handler, NULL);
+    }
+}
+
+#endif /* CONFIG_VFIO_USER */
+
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
@@ -2499,7 +2702,9 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
-    close(vbasedev->fd);
+    if (vbasedev->fd != -1) {
+        close(vbasedev->fd);
+    }
 }
 
 int vfio_get_region_info(VFIODevice *vbasedev, int index,
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index a1ae3fb..53e3bb8 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3584,7 +3584,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOProxy *proxy;
-    struct vfio_device_info info;
+    VFIOGroup *group = NULL;
     int ret;
     Error *err = NULL;
 
@@ -3630,9 +3630,15 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->io_ops = &vfio_dev_io_sock;
     vdev->vbasedev.irq_mask_works = true;
 
-    ret = VDEV_GET_INFO(vbasedev, &info);
+    group = vfio_user_get_group(proxy, pci_device_iommu_address_space(pdev),
+                                errp);
+    if (!group) {
+        goto error;
+    }
+
+    ret = vfio_user_get_device(group, vbasedev, errp);
     if (ret) {
-        error_setg_errno(errp, -ret, "get info failure");
+        vfio_user_put_group(group);
         goto error;
     }
 
@@ -3692,12 +3698,18 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
+
+    vfio_bars_finalize(vdev);
+    g_free(vdev->emulated_config_bits);
+    g_free(vdev->rom);
 
     if (vdev->msix != NULL) {
         vfio_user_msix_teardown(vdev);
     }
 
     vfio_put_device(vdev);
+    vfio_user_put_group(group);
 
     if (vbasedev->proxy != NULL) {
         vfio_user_disconnect(vbasedev->proxy);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 815385b..2d35f83 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1433,3 +1433,6 @@ VFIODevIO vfio_dev_io_sock = {
     .region_write = vfio_user_io_region_write,
 };
 
+
+VFIOContIO vfio_cont_io_sock = {
+};
diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 359a029..19b8a29 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -94,5 +94,6 @@ void vfio_user_set_handler(VFIODevice *vbasedev,
 int vfio_user_validate_version(VFIOProxy *proxy, Error **errp);
 
 extern VFIODevIO vfio_dev_io_sock;
+extern VFIOContIO vfio_cont_io_sock;
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 793ca94..312ef9c 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -94,6 +94,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -282,6 +283,11 @@ void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
 
+int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp);
+VFIOGroup *vfio_user_get_group(VFIOProxy *proxy, AddressSpace *as,
+                               Error **errp);
+void vfio_user_put_group(VFIOGroup *group);
+
 extern const MemoryRegionOps vfio_region_ops;
 typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
-- 
1.8.3.1


