Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9559862200E
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:07:22 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbj-00050E-JK; Tue, 08 Nov 2022 18:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbc-0004w0-6P
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:08 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003gG-Ea
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:07 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx5Z3026348
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=UBKaknHvUR7w61PYkWIbAjzcXtfAGF8lpsnvP0y88fM=;
 b=a+BYsHXFyDsAIAjOKJwWLuu833LdGGpHYwFmwotX4fp4HlhES79TBaOFa68EJpuHeAUw
 G6Qlwe3oImNYzZB72gP9wR0Jwhiv2KTVh+p3VX6bzXfKTVVi6RaJKKr7MQvVeQNWJSIC
 TxkdB8bI/rOi6b64+TrSPZk1uCxp6xxE+xyqiRxFrxVbDQ6pkFq0VsrEfiA/WFqpV681
 i4SaZJXe44xNx7OqrLD3uPk46ri8eEi0oleVgMq2N2Xg7+ROW/624+Aci9h4JFDPJOsu
 4sW80RNeKGd3VEohXdYcm55amugmQARfOXIAn/EELnHfanuYOSTguDNu69w9Xo2h7c5g uQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:51 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6W004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:49 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-18
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:49 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 17/24] vfio-user: dma map/unmap operations
Date: Tue,  8 Nov 2022 15:13:39 -0800
Message-Id: <2f842a47474f4369b9f41b22d72277abf5b3b31b.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: diSCOsrwi3bjM60ISFTwRzAmUVGjNzoI
X-Proofpoint-ORIG-GUID: diSCOsrwi3bjM60ISFTwRzAmUVGjNzoI
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

Add ability to do async operations during memory transactions

Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/common.c              |  63 +++++++++---
 hw/vfio/user-protocol.h       |  32 ++++++
 hw/vfio/user.c                | 220 ++++++++++++++++++++++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |   9 +-
 4 files changed, 308 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index e73a772..fe6eddd 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -507,7 +507,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return CONT_DMA_UNMAP(container, &unmap, NULL);
 }
 
-static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
+static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
     struct vfio_iommu_type1_dma_map map = {
@@ -523,7 +523,7 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    ret = CONT_DMA_MAP(container, &map);
+    ret = CONT_DMA_MAP(container, mr, &map);
 
     if (ret < 0) {
         error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
@@ -586,7 +586,8 @@ static bool vfio_listener_skipped_section(MemoryRegionSection *section)
 
 /* Called with rcu_read_lock held.  */
 static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
-                               ram_addr_t *ram_addr, bool *read_only)
+                               ram_addr_t *ram_addr, bool *read_only,
+                               MemoryRegion **mrp)
 {
     MemoryRegion *mr;
     hwaddr xlat;
@@ -667,6 +668,10 @@ static bool vfio_get_xlat_addr(IOMMUTLBEntry *iotlb, void **vaddr,
         *read_only = !writable || mr->readonly;
     }
 
+    if (mrp != NULL) {
+        *mrp = mr;
+    }
+
     return true;
 }
 
@@ -674,6 +679,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
 {
     VFIOGuestIOMMU *giommu = container_of(n, VFIOGuestIOMMU, n);
     VFIOContainer *container = giommu->container;
+    MemoryRegion *mr;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     void *vaddr;
     int ret;
@@ -692,7 +698,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if ((iotlb->perm & IOMMU_RW) != IOMMU_NONE) {
         bool read_only;
 
-        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only)) {
+        if (!vfio_get_xlat_addr(iotlb, &vaddr, NULL, &read_only, &mr)) {
             goto out;
         }
         /*
@@ -702,14 +708,14 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
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
@@ -764,7 +770,7 @@ static int vfio_ram_discard_notify_populate(RamDiscardListener *rdl,
                section->offset_within_address_space;
         vaddr = memory_region_get_ram_ptr(section->mr) + start;
 
-        ret = vfio_dma_map(vrdl->container, iova, next - start,
+        ret = vfio_dma_map(vrdl->container, section->mr, iova, next - start,
                            vaddr, section->readonly);
         if (ret) {
             /* Rollback */
@@ -888,6 +894,29 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
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
+    CONT_WAIT_COMMIT(container);
+    container->async_ops = false;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -1095,12 +1124,12 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
@@ -1369,7 +1398,7 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     }
 
     rcu_read_lock();
-    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
+    if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL, NULL)) {
         int ret;
 
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
@@ -1487,6 +1516,8 @@ static void vfio_listener_log_sync(MemoryListener *listener,
 
 static const MemoryListener vfio_memory_listener = {
     .name = "vfio",
+    .begin = vfio_listener_begin,
+    .commit = vfio_listener_commit,
     .region_add = vfio_listener_region_add,
     .region_del = vfio_listener_region_del,
     .log_global_start = vfio_listener_log_global_start,
@@ -2977,7 +3008,7 @@ VFIODevIO vfio_dev_io_ioctl = {
     .region_write = vfio_io_region_write,
 };
 
-static int vfio_io_dma_map(VFIOContainer *container,
+static int vfio_io_dma_map(VFIOContainer *container, MemoryRegion *mr,
                            struct vfio_iommu_type1_dma_map *map)
 {
 
@@ -3037,8 +3068,14 @@ static int vfio_io_dirty_bitmap(VFIOContainer *container,
     return ret < 0 ? -errno : ret;
 }
 
+static void vfio_io_wait_commit(VFIOContainer *container)
+{
+    /* ioctl()s are synchronous */
+}
+
 VFIOContIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
     .dirty_bitmap = vfio_io_dirty_bitmap,
+    .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/user-protocol.h b/hw/vfio/user-protocol.h
index 31704cf..e9fcf64 100644
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
  * imported from struct_device_info
  */
@@ -177,4 +202,11 @@ typedef struct {
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
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 2d35f83..1fd37cc 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -59,8 +59,11 @@ static void vfio_user_request(void *opaque);
 static int vfio_user_send_queued(VFIOProxy *proxy, VFIOUserMsg *msg);
 static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                  VFIOUserFDs *fds);
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
+                                  VFIOUserFDs *fds, int rsize);
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql);
+static void vfio_user_wait_reqs(VFIOProxy *proxy);
 static void vfio_user_request_msg(VFIOUserHdr *hdr, uint16_t cmd,
                                   uint32_t size, uint32_t flags);
 
@@ -647,6 +650,36 @@ static void vfio_user_send_async(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+/*
+ * nowait send - vfio_wait_reqs() can wait for it later
+ */
+static void vfio_user_send_nowait(VFIOProxy *proxy, VFIOUserHdr *hdr,
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
 static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
                                 VFIOUserFDs *fds, int rsize, bool nobql)
 {
@@ -699,6 +732,60 @@ static void vfio_user_send_wait(VFIOProxy *proxy, VFIOUserHdr *hdr,
     }
 }
 
+static void vfio_user_wait_reqs(VFIOProxy *proxy)
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
+            error_printf("vfio_user_wait_reqs - error reply on async request ");
+            error_printf("command %x error %s\n", msg->hdr->command,
+                         strerror(msg->hdr->error_reply));
+        }
+
+        proxy->last_nowait = NULL;
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
 static QLIST_HEAD(, VFIOProxy) vfio_user_sockets =
     QLIST_HEAD_INITIALIZER(vfio_user_sockets);
 
@@ -1113,6 +1200,103 @@ int vfio_user_validate_version(VFIOProxy *proxy, Error **errp)
     return 0;
 }
 
+static int vfio_user_dma_map(VFIOProxy *proxy,
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
+static int vfio_user_dma_unmap(VFIOProxy *proxy,
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
 static int vfio_user_get_info(VFIOProxy *proxy, struct vfio_device_info *info)
 {
     VFIOUserDeviceInfo msg;
@@ -1434,5 +1618,41 @@ VFIODevIO vfio_dev_io_sock = {
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
 VFIOContIO vfio_cont_io_sock = {
+    .dma_map = vfio_user_io_dma_map,
+    .dma_unmap = vfio_user_io_dma_unmap,
+    .wait_commit = vfio_user_io_wait_commit,
 };
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 312ef9c..413dafc 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -90,6 +90,7 @@ typedef struct VFIOContainer {
     VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
+    bool async_ops;
     uint64_t dirty_pgsizes;
     uint64_t max_dirty_bitmap_size;
     unsigned long pgsizes;
@@ -200,7 +201,7 @@ struct VFIODevIO {
     ((vdev)->io_ops->region_write((vdev), (nr), (off), (size), (data), (post)))
 
 struct VFIOContIO {
-    int (*dma_map)(VFIOContainer *container,
+    int (*dma_map)(VFIOContainer *container, MemoryRegion *mr,
                    struct vfio_iommu_type1_dma_map *map);
     int (*dma_unmap)(VFIOContainer *container,
                      struct vfio_iommu_type1_dma_unmap *unmap,
@@ -208,14 +209,16 @@ struct VFIOContIO {
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
+    void (*wait_commit)(VFIOContainer *container);
 };
 
-#define CONT_DMA_MAP(cont, map) \
-    ((cont)->io_ops->dma_map((cont), (map)))
+#define CONT_DMA_MAP(cont, mr, map) \
+    ((cont)->io_ops->dma_map((cont), (mr), (map)))
 #define CONT_DMA_UNMAP(cont, unmap, bitmap) \
     ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+#define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
 
 extern VFIODevIO vfio_dev_io_ioctl;
 extern VFIOContIO vfio_cont_io_ioctl;
-- 
1.8.3.1


