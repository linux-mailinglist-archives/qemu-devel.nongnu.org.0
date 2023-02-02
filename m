Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E3179687587
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:50:54 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPN-0008C4-E9; Thu, 02 Feb 2023 00:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPK-0008Ap-8e
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:14 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPH-0007B8-CN
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:14 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i9gD029368; Thu, 2 Feb 2023 05:45:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=dTNQOHB5u1Wtnb2fLXKHkYn8UQhrsFrLkJjyTzIWJH0=;
 b=pxrorDuMLPKDWyfNhcufqpIgJfuhYP+uVrobb7FceL+04HluRE+ZO6WtFj0IyvESN03z
 cCjnap+wKCIEsHppErsPzmwTdmjfid84x9gb0MYPgP3OtEXy/gNczvII2hq4eRy9KX71
 6Yc/dB8AfS/B/U2T1Cf7phrxhr6bDqwGMWmXXkFjmXu3gtGEeOJJF7wWj6FRVIYwhIEG
 LExdNQrvz9ogj7NNuEotk4KOVv32OUfDTKnyusTxSq3UeapDM13npkyZPoYdssje1MR6
 LNtzcgSSTVO1VX8Jfgz5sZE5TsbXjjCukP3NW88fZH2NPTntqX/KEi0qmBvlP4uijd2J sw== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfmbg2bhg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:10 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppn013015; Thu, 2 Feb 2023 05:45:09 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-17
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:09 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 16/23] vfio-user: proxy container connect/disconnect
Date: Wed,  1 Feb 2023 21:55:52 -0800
Message-Id: <e1e14729756134109ab344a35aadfb863ddd1fef.1675228037.git.john.g.johnson@oracle.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
In-Reply-To: <cover.1675228037.git.john.g.johnson@oracle.com>
References: <cover.1675228037.git.john.g.johnson@oracle.com>
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-02-01_15,2023-01-31_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 malwarescore=0
 adultscore=0 bulkscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2302020053
X-Proofpoint-ORIG-GUID: EEKYjn_LcwCryIR3Q5UC6wMbOkSivPAs
X-Proofpoint-GUID: EEKYjn_LcwCryIR3Q5UC6wMbOkSivPAs
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
 hw/vfio/user.h                |   6 +-
 include/hw/vfio/vfio-common.h |  10 +++
 hw/vfio/common.c              | 100 ++++++++++++++++-----------
 hw/vfio/user-pci.c            |  12 +++-
 hw/vfio/user.c                | 152 +++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 237 insertions(+), 43 deletions(-)

diff --git a/hw/vfio/user.h b/hw/vfio/user.h
index 3012a86..b89e5ca 100644
--- a/hw/vfio/user.h
+++ b/hw/vfio/user.h
@@ -91,9 +91,13 @@ void vfio_user_disconnect(VFIOUserProxy *proxy);
 void vfio_user_set_handler(VFIODevice *vbasedev,
                            void (*handler)(void *opaque, VFIOUserMsg *msg),
                            void *reqarg);
-int vfio_user_get_device(VFIODevice *vbasedev, Error **errp);
+int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp);
+VFIOGroup *vfio_user_get_group(VFIOUserProxy *proxy, AddressSpace *as,
+                               Error **errp);
+void vfio_user_put_group(VFIOGroup *group);
 int vfio_user_validate_version(VFIOUserProxy *proxy, Error **errp);
 
 extern VFIODeviceIO vfio_dev_io_sock;
+extern VFIOContainerIO vfio_cont_io_sock;
 
 #endif /* VFIO_USER_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2c58d7d..b0c4453 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -94,6 +94,7 @@ typedef struct VFIOContainer {
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
     unsigned int dma_max_mappings;
+    VFIOUserProxy *proxy;
     QLIST_HEAD(, VFIOGuestIOMMU) giommu_list;
     QLIST_HEAD(, VFIOHostDMAWindow) hostwin_list;
     QLIST_HEAD(, VFIOGroup) group_list;
@@ -236,6 +237,7 @@ typedef struct VFIODisplay {
     } dmabuf;
 } VFIODisplay;
 
+int vfio_ram_block_discard_disable(VFIOContainer *container, bool state);
 void vfio_put_base_device(VFIODevice *vbasedev);
 void vfio_disable_irqindex(VFIODevice *vbasedev, int index);
 void vfio_unmask_single_irqindex(VFIODevice *vbasedev, int index);
@@ -244,6 +246,9 @@ void vfio_unmask_single_irq(VFIODevice *vbasedev, int index, int irq);
 void vfio_mask_single_irq(VFIODevice *vbasedev, int index, int irq);
 int vfio_set_irq_signaling(VFIODevice *vbasedev, int index, int subindex,
                            int action, int fd, Error **errp);
+void vfio_host_win_add(VFIOContainer *container, hwaddr min_iova,
+                       hwaddr max_iova, uint64_t iova_pgsizes);
+void vfio_listener_release(VFIOContainer *container);
 void vfio_region_write(void *opaque, hwaddr addr,
                            uint64_t data, unsigned size);
 uint64_t vfio_region_read(void *opaque,
@@ -256,11 +261,16 @@ void vfio_region_unmap(VFIORegion *region);
 void vfio_region_exit(VFIORegion *region);
 void vfio_region_finalize(VFIORegion *region);
 void vfio_reset_handler(void *opaque);
+VFIOAddressSpace *vfio_get_address_space(AddressSpace *as);
+void vfio_put_address_space(VFIOAddressSpace *space);
 VFIOGroup *vfio_get_group(int groupid, AddressSpace *as, Error **errp);
 void vfio_put_group(VFIOGroup *group);
 int vfio_get_device(VFIOGroup *group, const char *name,
                     VFIODevice *vbasedev, Error **errp);
 
+VFIOContainer *vfio_new_container(VFIOAddressSpace *space);
+void vfio_link_container(VFIOContainer *container, VFIOGroup *group);
+void vfio_unmap_container(VFIOContainer *container);
 void vfio_init_device(VFIODevice *vbasedev, VFIOGroup *group,
                       struct vfio_device_info *info);
 
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 0c1cb21..6f99907 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -164,7 +164,7 @@ static const char *index_to_str(VFIODevice *vbasedev, int index)
     }
 }
 
-static int vfio_ram_block_discard_disable(VFIOContainer *container, bool state)
+int vfio_ram_block_discard_disable(VFIOContainer *container, bool state)
 {
     switch (container->iommu_type) {
     case VFIO_TYPE1v2_IOMMU:
@@ -532,7 +532,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
     return ret;
 }
 
-static void vfio_host_win_add(VFIOContainer *container,
+void vfio_host_win_add(VFIOContainer *container,
                               hwaddr min_iova, hwaddr max_iova,
                               uint64_t iova_pgsizes)
 {
@@ -1495,7 +1495,7 @@ static const MemoryListener vfio_memory_listener = {
     .log_sync = vfio_listener_log_sync,
 };
 
-static void vfio_listener_release(VFIOContainer *container)
+void vfio_listener_release(VFIOContainer *container)
 {
     memory_listener_unregister(&container->listener);
     if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
@@ -1873,7 +1873,7 @@ static void vfio_kvm_device_del_group(VFIOGroup *group)
 #endif
 }
 
-static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as)
+VFIOAddressSpace *vfio_get_address_space(AddressSpace *as)
 {
     VFIOAddressSpace *space;
 
@@ -1893,7 +1893,7 @@ static VFIOAddressSpace *vfio_get_address_space(AddressSpace *as)
     return space;
 }
 
-static void vfio_put_address_space(VFIOAddressSpace *space)
+void vfio_put_address_space(VFIOAddressSpace *space)
 {
     if (QLIST_EMPTY(&space->containers)) {
         QLIST_REMOVE(space, list);
@@ -2024,6 +2024,34 @@ static void vfio_get_iommu_info_migration(VFIOContainer *container,
     }
 }
 
+VFIOContainer *vfio_new_container(VFIOAddressSpace *space)
+{
+    VFIOContainer *container;
+
+    container = g_malloc0(sizeof(*container));
+    container->space = space;
+    container->error = NULL;
+    QLIST_INIT(&container->giommu_list);
+    QLIST_INIT(&container->hostwin_list);
+    QLIST_INIT(&container->vrdl_list);
+    QLIST_INIT(&container->group_list);
+
+    return container;
+}
+
+void vfio_link_container(VFIOContainer *container, VFIOGroup *group)
+{
+    VFIOAddressSpace *space = container->space;
+
+    QLIST_INSERT_HEAD(&space->containers, container, next);
+
+    group->container = container;
+    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
+
+    container->listener = vfio_memory_listener;
+    memory_listener_register(&container->listener, space->as);
+}
+
 static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
                                   Error **errp)
 {
@@ -2099,16 +2127,11 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
         goto close_fd_exit;
     }
 
-    container = g_malloc0(sizeof(*container));
-    container->space = space;
+    container = vfio_new_container(space);
     container->fd = fd;
-    container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
     container->io = &vfio_cont_io_ioctl;
-    QLIST_INIT(&container->giommu_list);
-    QLIST_INIT(&container->hostwin_list);
-    QLIST_INIT(&container->vrdl_list);
 
     ret = vfio_init_container(container, group->fd, errp);
     if (ret) {
@@ -2223,15 +2246,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
 
     vfio_kvm_device_add_group(group);
 
-    QLIST_INIT(&container->group_list);
-    QLIST_INSERT_HEAD(&space->containers, container, next);
-
-    group->container = container;
-    QLIST_INSERT_HEAD(&container->group_list, group, container_next);
-
-    container->listener = vfio_memory_listener;
-
-    memory_listener_register(&container->listener, container->space->as);
+    vfio_link_container(container, group);
 
     if (container->error) {
         ret = -1;
@@ -2264,9 +2279,31 @@ put_space_exit:
     return ret;
 }
 
+void vfio_unmap_container(VFIOContainer *container)
+{
+    VFIOGuestIOMMU *giommu, *tmp;
+    VFIOHostDMAWindow *hostwin, *next;
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
+}
+
 static void vfio_disconnect_container(VFIOGroup *group)
 {
     VFIOContainer *container = group->container;
+    VFIOAddressSpace *space = container->space;
 
     QLIST_REMOVE(group, container_next);
     group->container = NULL;
@@ -2286,24 +2323,7 @@ static void vfio_disconnect_container(VFIOGroup *group)
     }
 
     if (QLIST_EMPTY(&container->group_list)) {
-        VFIOAddressSpace *space = container->space;
-        VFIOGuestIOMMU *giommu, *tmp;
-        VFIOHostDMAWindow *hostwin, *next;
-
-        QLIST_REMOVE(container, next);
-
-        QLIST_FOREACH_SAFE(giommu, &container->giommu_list, giommu_next, tmp) {
-            memory_region_unregister_iommu_notifier(
-                    MEMORY_REGION(giommu->iommu_mr), &giommu->n);
-            QLIST_REMOVE(giommu, giommu_next);
-            g_free(giommu);
-        }
-
-        QLIST_FOREACH_SAFE(hostwin, &container->hostwin_list, hostwin_next,
-                           next) {
-            QLIST_REMOVE(hostwin, hostwin_next);
-            g_free(hostwin);
-        }
+        vfio_unmap_container(container);
 
         trace_vfio_disconnect_container(container->fd);
         close(container->fd);
@@ -2503,7 +2523,9 @@ void vfio_put_base_device(VFIODevice *vbasedev)
     QLIST_REMOVE(vbasedev, next);
     vbasedev->group = NULL;
     trace_vfio_put_base_device(vbasedev->fd);
-    close(vbasedev->fd);
+    if (vbasedev->fd != -1) {
+        close(vbasedev->fd);
+    }
 }
 
 int vfio_get_region_info(VFIODevice *vbasedev, int index,
diff --git a/hw/vfio/user-pci.c b/hw/vfio/user-pci.c
index bc1d01a..a0aa320 100644
--- a/hw/vfio/user-pci.c
+++ b/hw/vfio/user-pci.c
@@ -134,6 +134,7 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     VFIODevice *vbasedev = &vdev->vbasedev;
     SocketAddress addr;
     VFIOUserProxy *proxy;
+    VFIOGroup *group = NULL;
     int ret;
     Error *err = NULL;
 
@@ -180,8 +181,15 @@ static void vfio_user_pci_realize(PCIDevice *pdev, Error **errp)
     vbasedev->use_regfds = true;
     vbasedev->can_mask_irq = true;
 
-    ret = vfio_user_get_device(vbasedev, errp);
+    group = vfio_user_get_group(proxy, pci_device_iommu_address_space(pdev),
+                                errp);
+    if (!group) {
+        goto error;
+    }
+
+    ret = vfio_user_get_device(group, vbasedev, errp);
     if (ret) {
+        vfio_user_put_group(group);
         goto error;
     }
 
@@ -241,6 +249,7 @@ static void vfio_user_instance_finalize(Object *obj)
 {
     VFIOPCIDevice *vdev = VFIO_PCI_BASE(obj);
     VFIODevice *vbasedev = &vdev->vbasedev;
+    VFIOGroup *group = vbasedev->group;
 
     vfio_bars_finalize(vdev);
     g_free(vdev->emulated_config_bits);
@@ -251,6 +260,7 @@ static void vfio_user_instance_finalize(Object *obj)
     }
 
     vfio_put_device(vdev);
+    vfio_user_put_group(group);
 
     if (vbasedev->proxy != NULL) {
         vfio_user_disconnect(vbasedev->proxy);
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index d66dc1b..aebf44c 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -18,10 +18,14 @@
 #include "hw/hw.h"
 #include "hw/vfio/vfio-common.h"
 #include "hw/vfio/vfio.h"
+#include "exec/address-spaces.h"
+#include "exec/memory.h"
+#include "exec/ram_addr.h"
 #include "qemu/sockets.h"
 #include "io/channel.h"
 #include "io/channel-socket.h"
 #include "io/channel-util.h"
+#include "sysemu/reset.h"
 #include "sysemu/iothread.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qjson.h"
@@ -847,7 +851,102 @@ void vfio_user_disconnect(VFIOUserProxy *proxy)
     g_free(proxy);
 }
 
-int vfio_user_get_device(VFIODevice *vbasedev, Error **errp)
+static int vfio_connect_proxy(VFIOUserProxy *proxy, VFIOGroup *group,
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
+    container = vfio_new_container(space);
+    container->fd = -1;
+    container->io = &vfio_cont_io_sock;
+    container->proxy = proxy;
+
+    /*
+     * The proxy uses a SW IOMMU in lieu of the HW one
+     * used in the ioctl() version.  Mascarade as TYPE1
+     * for maximum compatibility
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
+    vfio_link_container(container, group);
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
+    memory_listener_unregister(&container->listener);
+
+    vfio_unmap_container(container);
+
+    g_free(container);
+    vfio_put_address_space(space);
+}
+
+int vfio_user_get_device(VFIOGroup *group, VFIODevice *vbasedev, Error **errp)
 {
     struct vfio_device_info info = { .argsz = sizeof(info) };
     int ret;
@@ -866,11 +965,57 @@ int vfio_user_get_device(VFIODevice *vbasedev, Error **errp)
     }
 
     vbasedev->fd = -1;
-    vfio_init_device(vbasedev, NULL, &info);
+    vfio_init_device(vbasedev, group, &info);
 
     return 0;
 }
 
+VFIOGroup *vfio_user_get_group(VFIOUserProxy *proxy, AddressSpace *as,
+                               Error **errp)
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
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags)
 {
@@ -1463,3 +1608,6 @@ VFIODeviceIO vfio_dev_io_sock = {
     .region_read = vfio_user_io_region_read,
     .region_write = vfio_user_io_region_write,
 };
+
+VFIOContainerIO vfio_cont_io_sock = {
+};
-- 
1.9.4


