Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1418668758F
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:51:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPO-0008Cz-MP; Thu, 02 Feb 2023 00:45:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPM-0008C2-PP
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:16 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPK-0007Br-6q
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:16 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124j1mt027569; Thu, 2 Feb 2023 05:45:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=w/VSt1VAcFvKnFOtKGDI3kvOUkpyniXOkU7ZId3DcC0=;
 b=baXnC1v8bW0HCwd+EeyeDmcrm7RmxDFQpVp0icHUqU/k/m6xB68CqusfSUw99jq7FIY7
 MeP+/C0T4vLDltSOAxvpWFzacKx7ibDSAG3zEe97S0EMg5pbrv/p/yNdKuB3YzgM5ZQ3
 0y/0ScRzq6OyDMhWBIBp4cOcCZKZgG9o2aoIuKLBQNqhQi/LH2crOLFerr7pSXljCmp6
 fFDYsdD/XCMb3ZFIE/zGeze4m9mcYzI9u7VMcMuUU8VXV59XSekyyI2AUcIrmV0K7LFU
 3OxoLQO4z658LFcL1nQwR5TkT4EXaTH2nbVt5IQGFA1DhlnJFUOBf7ry0XNmN3JH2G+b vQ== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfpywj0w3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:11 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppp013015; Thu, 2 Feb 2023 05:45:10 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:10 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 17/23] vfio-user: dma map/unmap operations
Date: Wed,  1 Feb 2023 21:55:53 -0800
Message-Id: <1ec25a5832299083fee3c90bd89561f5c1d42ba9.1675228037.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: WwtUmMwLk0QceoY-8RdtDSPnuJrVFFwv
X-Proofpoint-ORIG-GUID: WwtUmMwLk0QceoY-8RdtDSPnuJrVFFwv
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=john.g.johnson@oracle.com; helo=mx0a-00069f02.pphosted.com
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

Add ability to do async operations during memory transactions

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/user-protocol.h       |  32 ++++++
 include/hw/vfio/vfio-common.h |   4 +-
 hw/vfio/common.c              |  64 +++++++++---
 hw/vfio/user.c                | 224 ++++++++++++++++++++++++++++++++++++++++++
 hw/vfio/trace-events          |   2 +
 5 files changed, 311 insertions(+), 15 deletions(-)

diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 48dd475..109076d 100644
--- a/hw/vfio/user-protocol.h
+++ b/hw/vfio/user-protocol.h
@@ -114,6 +114,31 @@ typedef struct {
 #define VFIO_USER_DEF_MAX_BITMAP (256 * 1024 * 1024)
 
 /*
+ * VFIO_USER_DMA_MAP
+ * imported from struct vfio_iommu_type1_dma_map
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t offset;    /* FD offset */
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAMap;
+
+/*
+ * VFIO_USER_DMA_UNMAP
+ * imported from struct vfio_iommu_type1_dma_unmap
+ */
+typedef struct {
+    VFIOUserHdr hdr;
+    uint32_t argsz;
+    uint32_t flags;
+    uint64_t iova;
+    uint64_t size;
+} VFIOUserDMAUnmap;
+
+/*
  * VFIO_USER_DEVICE_GET_INFO
  * imported from struct vfio_device_info
  */
@@ -176,4 +201,11 @@ typedef struct {
     char data[];
 } VFIOUserRegionRW;
 
+/*imported from struct vfio_bitmap */
+typedef struct {
+    uint64_t pgsize;
+    uint64_t size;
+    char data[];
+} VFIOUserBitmap;
+
 #endif /* VFIO_USER_PROTOCOL_H */
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index b0c4453..ee6ad8f 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -90,6 +90,7 @@ typedef struct VFIOContainer {
     VFIOContainerIO *io;
     bool initialized;
     bool dirty_pages_supported;
+    bool async_ops;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -187,7 +188,7 @@ struct VFIODeviceIO {
 };
 
 struct VFIOContainerIO {
-    int (*dma_map)(VFIOContainer *container,
+    int (*dma_map)(VFIOContainer *container, MemoryRegion *mr,
                    struct vfio_iommu_type1_dma_map *map);
     int (*dma_unmap)(VFIOContainer *container,
                      struct vfio_iommu_type1_dma_unmap *unmap,
@@ -195,6 +196,7 @@ struct VFIOContainerIO {
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
+    void (*wait_commit)(VFIOContainer *container);
 };
 
 extern VFIODeviceIO vfio_dev_io_ioctl;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 6f99907..f04fd20 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -508,7 +508,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return container->io->dma_unmap(container, &unmap, NULL);
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -524,8 +524,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    ret = container->io->dma_map(container, &map);
-
+    ret = container->io->dma_map(container, mr, &map);
     if (ret < 0) {
         error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
     }
@@ -587,7 +586,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -668,6 +668,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -675,6 +679,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -693,7 +698,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -703,14 +708,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
          * of vaddr will always be there, even if the memory object is
          * destroyed and its backing memory munmap-ed.
          */
-        ret = vfio_dma_map(container, iova,
+        ret = vfio_dma_map(container, mr, iova,
                            iotlb->addr_mask + 1, vaddr,
                            read_only);
         if (ret) {
             error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         "0x%"HWADDR_PRIx", %p)",
                          container, iova,
-                         iotlb->addr_mask + 1, vaddr, ret);
+                         iotlb->addr_mask + 1, vaddr);
         }
     } else {
         ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
@@ -765,7 +770,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -889,6 +894,29 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
     return true;
 }
 
+static void vfio_listener_begin(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /*
+     * When DMA space is the physical address space,
+     * the region add/del listeners will fire during
+     * memory update transactions.  These depend on BQL
+     * being held, so do any resulting map/demap ops async
+     * while keeping BQL.
+     */
+    container->async_ops = true;
+}
+
+static void vfio_listener_commit(MemoryListener *listener)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+
+    /* wait here for any async requests sent during the transaction */
+    container->io->wait_commit(container);
+    container->async_ops = false;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -1096,12 +1124,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
     }
 
-    ret = vfio_dma_map(container, iova, int128_get64(llsize),
+    ret = vfio_dma_map(container, section->mr, iova, int128_get64(llsize),
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
+                   "0x%"HWADDR_PRIx", %p)",
+                   container, iova, int128_get64(llsize), vaddr);
         if (memory_region_is_ram_device(section->mr)) {
             /* Allow unexpected mappings not to be fatal for RAM devices */
             error_report_err(err);
@@ -1370,7 +1398,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -1488,6 +1516,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 
 static const MemoryListener vfio_memory_listener = {
     .name = "vfio",
+    .begin = vfio_listener_begin,
+    .commit = vfio_listener_commit,
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
@@ -2788,7 +2818,7 @@ VFIODeviceIO vfio_dev_io_ioctl = {
     .region_write = vfio_io_region_write,
 };
 
-static int vfio_io_dma_map(VFIOContainer *container,
+static int vfio_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
                            struct vfio_iommu_type1_dma_map *map)
 {
 
@@ -2848,8 +2878,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
     return ret < 0 ? -errno : ret;
 }
 
+static void vfio_io_wait_commit(VFIOContainer *container)
+{
+    /* ioctl()s are synchronous */
+}
+
 static VFIOContainerIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
     .dirty_bitmap = vfio_io_dirty_bitmap,
+    .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index aebf44c..6dee775 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -64,8 +64,11 @@ static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOUserProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_send_async(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
                                  VFIOUserFDs *fds);
+static void vfio_user_send_nowait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize);
 static void vfio_user_send_wait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_wait_reqs(VFIOUserProxy *proxy);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
 
@@ -664,6 +667,36 @@ static void vfio_user_send_async(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+/*
+ * nowait send - vfio_wait_reqs() can wait for it later
+ */
+static void vfio_user_send_nowait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize)
+{
+    VFIOUserMsg *msg;
+    int ret;
+
+    if (hdr->flags & VFIO_USER_NO_REPLY) {
+        error_printf("vfio_user_send_nowait on async message\n");
+        return;
+    }
+
+    QEMU_LOCK_GUARD(&proxy->lock);
+
+    msg = vfio_user_getmsg(proxy, hdr, fds);
+    msg->id = hdr->id;
+    msg->rsize = rsize ? rsize : hdr->size;
+    msg->type = VFIO_MSG_NOWAIT;
+
+    ret = vfio_user_send_queued(proxy, msg);
+    if (ret < 0) {
+        vfio_user_recycle(proxy, msg);
+        return;
+    }
+
+    proxy->last_nowait = msg;
+}
+
 static void vfio_user_send_wait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -717,6 +750,60 @@ static void vfio_user_send_wait(VFIOUserProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+static void vfio_user_wait_reqs(VFIOUserProxy *proxy)
+{
+    VFIOUserMsg *msg;
+    bool iolock = false;
+
+    /*
+     * Any DMA map/unmap requests sent in the middle
+     * of a memory region transaction were sent nowait.
+     * Wait for them here.
+     */
+    qemu_mutex_lock(&proxy->lock);
+    if (proxy->last_nowait != NULL) {
+        iolock = qemu_mutex_iothread_locked();
+        if (iolock) {
+            qemu_mutex_unlock_iothread();
+        }
+
+        /*
+         * Change type to WAIT to wait for reply
+         */
+        msg = proxy->last_nowait;
+        msg->type = VFIO_MSG_WAIT;
+        proxy->last_nowait = NULL;
+        while (!msg->complete) {
+            if (!qemu_cond_timedwait(&msg->cv, &proxy->lock, wait_time)) {
+                VFIOUserMsgQ *list;
+
+                list = msg->pending ? &proxy->pending : &proxy->outgoing;
+                QTAILQ_REMOVE(list, msg, next);
+                error_printf("vfio_wait_reqs - timed out\n");
+                break;
+            }
+        }
+
+        if (msg->hdr->flags & VFIO_USER_ERROR) {
+            error_printf("vfio_user_wait_reqs - error reply on async ");
+            error_printf("request: command %x error %s\n", msg->hdr->command,
+                         strerror(msg->hdr->error_reply));
+        }
+
+        /*
+         * Change type back to NOWAIT to free
+         */
+        msg->type = VFIO_MSG_NOWAIT;
+        vfio_user_recycle(proxy, msg);
+    }
+
+    /* lock order is BQL->proxy - don't hold proxy when getting BQL */
+    qemu_mutex_unlock(&proxy->lock);
+    if (iolock) {
+        qemu_mutex_lock_iothread();
+    }
+}
+
 static QLIST_HEAD(, VFIOUserProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -1298,6 +1385,107 @@ int vfio_user_validate_version(VFIOUserProxy *proxy, Error **errp)
     return 0;
 }
 
+static int vfio_user_dma_map(VFIOUserProxy *proxy,
+                             struct vfio_iommu_type1_dma_map *map,
+                             int fd, bool will_commit)
+{
+    VFIOUserFDs *fds = NULL;
+    VFIOUserDMAMap *msgp = g_malloc0(sizeof(*msgp));
+    int ret;
+
+    vfio_user_request_msg(&msgp->hdr, VFIO_USER_DMA_MAP, sizeof(*msgp), 0);
+    msgp->argsz = map->argsz;
+    msgp->flags = map->flags;
+    msgp->offset = map->vaddr;
+    msgp->iova = map->iova;
+    msgp->size = map->size;
+    trace_vfio_user_dma_map(msgp->iova, msgp->size, msgp->offset, msgp->flags,
+                        will_commit);
+
+    /*
+     * The will_commit case sends without blocking or dropping BQL.
+     * They're later waited for in vfio_send_wait_reqs.
+     */
+    if (will_commit) {
+        /* can't use auto variable since we don't block */
+        if (fd != -1) {
+            fds = vfio_user_getfds(1);
+            fds->send_fds = 1;
+            fds->fds[0] = fd;
+        }
+        vfio_user_send_nowait(proxy, &msgp->hdr, fds, 0);
+        ret = 0;
+    } else {
+        VFIOUserFDs local_fds = { 1, 0, &fd };
+
+        fds = fd != -1 ? &local_fds : NULL;
+        vfio_user_send_wait(proxy, &msgp->hdr, fds, 0, will_commit);
+        ret = (msgp->hdr.flags & VFIO_USER_ERROR) ? -msgp->hdr.error_reply : 0;
+        g_free(msgp);
+    }
+
+    return ret;
+}
+
+static int vfio_user_dma_unmap(VFIOUserProxy *proxy,
+                               struct vfio_iommu_type1_dma_unmap *unmap,
+                               struct vfio_bitmap *bitmap, bool will_commit)
+{
+    struct {
+        VFIOUserDMAUnmap msg;
+        VFIOUserBitmap bitmap;
+    } *msgp = NULL;
+    int msize, rsize;
+    bool blocking = !will_commit;
+
+    if (bitmap == NULL &&
+        (unmap->flags & VFIO_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP)) {
+        error_printf("vfio_user_dma_unmap mismatched flags and bitmap\n");
+        return -EINVAL;
+    }
+
+    /*
+     * If a dirty bitmap is returned, allocate extra space for it
+     * and block for reply even in the will_commit case.
+     * Otherwise, can send the unmap request without waiting.
+     */
+    if (bitmap != NULL) {
+        blocking = true;
+        msize = sizeof(*msgp);
+        rsize = msize + bitmap->size;
+        msgp = g_malloc0(rsize);
+        msgp->bitmap.pgsize = bitmap->pgsize;
+        msgp->bitmap.size = bitmap->size;
+    } else {
+        msize = rsize = sizeof(VFIOUserDMAUnmap);
+        msgp = g_malloc0(rsize);
+    }
+
+    vfio_user_request_msg(&msgp->msg.hdr, VFIO_USER_DMA_UNMAP, msize, 0);
+    msgp->msg.argsz = rsize - sizeof(VFIOUserHdr);
+    msgp->msg.argsz = unmap->argsz;
+    msgp->msg.flags = unmap->flags;
+    msgp->msg.iova = unmap->iova;
+    msgp->msg.size = unmap->size;
+    trace_vfio_user_dma_unmap(msgp->msg.iova, msgp->msg.size, msgp->msg.flags,
+                         bitmap != NULL, will_commit);
+
+    if (blocking) {
+        vfio_user_send_wait(proxy, &msgp->msg.hdr, NULL, rsize, will_commit);
+        if (msgp->msg.hdr.flags & VFIO_USER_ERROR) {
+            return -msgp->msg.hdr.error_reply;
+        }
+        if (bitmap != NULL) {
+            memcpy(bitmap->data, &msgp->bitmap.data, bitmap->size);
+        }
+        g_free(msgp);
+    } else {
+        vfio_user_send_nowait(proxy, &msgp->msg.hdr, NULL, rsize);
+    }
+
+    return 0;
+}
+
 static int vfio_user_get_info(VFIOUserProxy *proxy,
                               struct vfio_device_info *info)
 {
@@ -1609,5 +1797,41 @@ VFIODeviceIO vfio_dev_io_sock = {
     .region_write = vfio_user_io_region_write,
 };
 
+static int vfio_user_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
+                                struct vfio_iommu_type1_dma_map *map)
+{
+    int fd = memory_region_get_fd(mr);
+
+    /*
+     * map->vaddr enters as a QEMU process address
+     * make it either a file offset for mapped areas or 0
+     */
+    if (fd != -1) {
+        void *addr = (void *)(uintptr_t)map->vaddr;
+
+        map->vaddr = qemu_ram_block_host_offset(mr->ram_block, addr);
+    } else {
+        map->vaddr = 0;
+    }
+
+    return vfio_user_dma_map(container->proxy, map, fd, container->async_ops);
+}
+
+static int vfio_user_io_dma_unmap(VFIOContainer *container,
+                                  struct vfio_iommu_type1_dma_unmap *unmap,
+                                  struct vfio_bitmap *bitmap)
+{
+    return vfio_user_dma_unmap(container->proxy, unmap, bitmap,
+                               container->async_ops);
+}
+
+static void vfio_user_io_wait_commit(VFIOContainer *container)
+{
+    vfio_user_wait_reqs(container->proxy);
+}
+
 VFIOContainerIO vfio_cont_io_sock = {
+    .dma_map = vfio_user_io_dma_map,
+    .dma_unmap = vfio_user_io_dma_unmap,
+    .wait_commit = vfio_user_io_wait_commit,
 };
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 01563cb..a4e02ff 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -178,3 +178,5 @@ vfio_user_get_region_info(uint32_t index, uint32_t flags, uint64_t size) " index
 vfio_user_region_rw(uint32_t region, uint64_t off, uint32_t count) " region %d offset 0x%"PRIx64" count %d"
 vfio_user_get_irq_info(uint32_t index, uint32_t flags, uint32_t count) " index %d flags 0x%x count %d"
 vfio_user_set_irqs(uint32_t index, uint32_t start, uint32_t count, uint32_t flags) " index %d start %d count %d flags 0x%x"
+vfio_user_dma_map(uint64_t iova, uint64_t size, uint64_t off, uint32_t flags, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" off 0x%"PRIx64" flags 0x%x will_commit %d"
+vfio_user_dma_unmap(uint64_t iova, uint64_t size, uint32_t flags, bool dirty, bool will_commit) " iova 0x%"PRIx64" size 0x%"PRIx64" flags 0x%x dirty %d will_commit %d"
-- 
1.9.4


