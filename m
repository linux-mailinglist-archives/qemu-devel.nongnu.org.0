Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6880621FEA
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:03:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXba-0004tJ-4E; Tue, 08 Nov 2022 18:02:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbQ-0004oe-SI
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:01 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbM-0003ee-S4
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:01:56 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx3cb026328
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=KpwHfpvO9U6NyFnOWdtO+9EKKukan2COlys4hI+7mvY=;
 b=vS3fPxgVpU4VsNIYnsqG4EVUeqdBUSSqABU5vQ9ohqcY+kStJiRdU9HFr/YjrkNw2Zbb
 QADbe+yhRiuZhJENQZCy37Puk/0BzptO/u9yV4c73zBQFlClpKoeL6lE8Zz7ewocKqXL
 OewtJo48sQVzCFHtOAPby77K/CGfFm6tlo32uCHulj+FieXwmFsGVaNksXmIsTAE0wQa
 t0QaVEYvLXIQmEQRrQYNBDheB+8DbtSnpJYCSi9JKdtoJuoHVaHk2FKd3ru3Y/FVEfhA
 q4ATZBL/svLbVKk5sgod1NopVNwxbYFNwEROIm3U15lJq9YSSuHD2+2RWANIpiXtSN8z Gg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7vx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:45 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6G004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:44 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:43 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 03/24] vfio-user: add container IO ops vector
Date: Tue,  8 Nov 2022 15:13:25 -0800
Message-Id: <d357c8c243ef839cc8e41fc1ae5c8db2d98fc2cc.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: KwUjbmpk6kSMXG0CJyf3xYJl2gTsgWuL
X-Proofpoint-ORIG-GUID: KwUjbmpk6kSMXG0CJyf3xYJl2gTsgWuL
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

Used for communication with VFIO driver
(prep work for vfio-user, which will communicate over a socket)

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
---
 hw/vfio/common.c              | 126 ++++++++++++++++++++++++++++--------------
 include/hw/vfio/vfio-common.h |  33 +++++++++++
 2 files changed, 117 insertions(+), 42 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562..83d69b9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -432,12 +432,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    ret = CONT_DMA_UNMAP(container, unmap, bitmap);
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
     } else {
-        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
+        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %s", strerror(-ret));
     }
 
     g_free(bitmap->data);
@@ -465,30 +465,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
-    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap)) {
-        /*
-         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
-         * v4.15) where an overflow in its wrap-around check prevents us from
-         * unmapping the last page of the address space.  Test for the error
-         * condition and re-try the unmap excluding the last page.  The
-         * expectation is that we've never mapped the last page anyway and this
-         * unmap request comes via vIOMMU support which also makes it unlikely
-         * that this page is used.  This bug was introduced well after type1 v2
-         * support was introduced, so we shouldn't need to test for v1.  A fix
-         * is queued for kernel v5.0 so this workaround can be removed once
-         * affected kernels are sufficiently deprecated.
-         */
-        if (errno == EINVAL && unmap.size && !(unmap.iova + unmap.size) &&
-            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
-            trace_vfio_dma_unmap_overflow_workaround();
-            unmap.size -= 1ULL << ctz64(container->pgsizes);
-            continue;
-        }
-        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
-        return -errno;
-    }
-
-    return 0;
+    return CONT_DMA_UNMAP(container, &unmap, NULL);
 }
 
 static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
@@ -501,24 +478,18 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
         .iova = iova,
         .size = size,
     };
+    int ret;
 
     if (!readonly) {
         map.flags |= VFIO_DMA_MAP_FLAG_WRITE;
     }
 
-    /*
-     * Try the mapping, if it fails with EBUSY, unmap the region and try
-     * again.  This shouldn't be necessary, but we sometimes see it in
-     * the VGA ROM space.
-     */
-    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0 ||
-        (errno == EBUSY && vfio_dma_unmap(container, iova, size, NULL) == 0 &&
-         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, &map) == 0)) {
-        return 0;
-    }
+    ret = CONT_DMA_MAP(container, &map);
 
-    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+    if (ret < 0) {
+        error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
+    }
+    return ret;
 }
 
 static void vfio_host_win_add(VFIOContainer *container,
@@ -1263,10 +1234,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    ret = CONT_DIRTY_BITMAP(container, &dirty, NULL);
     if (ret) {
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
+                     dirty.flags, -ret);
     }
 }
 
@@ -1316,11 +1287,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    ret = CONT_DIRTY_BITMAP(container, dbitmap, range);
     if (ret) {
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
-                (uint64_t)range->size, errno);
+                (uint64_t)range->size, -ret);
         goto err_out;
     }
 
@@ -2090,6 +2061,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
+    container->io_ops = &vfio_cont_io_ioctl;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -2626,3 +2598,73 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+/*
+ * Traditional ioctl() based io_ops
+ */
+
+static int vfio_io_dma_map(VFIOContainer *container,
+                           struct vfio_iommu_type1_dma_map *map)
+{
+
+    /*
+     * Try the mapping, if it fails with EBUSY, unmap the region and try
+     * again.  This shouldn't be necessary, but we sometimes see it in
+     * the VGA ROM space.
+     */
+    if (ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0 ||
+        (errno == EBUSY &&
+         vfio_dma_unmap(container, map->iova, map->size, NULL) == 0 &&
+         ioctl(container->fd, VFIO_IOMMU_MAP_DMA, map) == 0)) {
+        return 0;
+    }
+    return -errno;
+}
+
+static int vfio_io_dma_unmap(VFIOContainer *container,
+                             struct vfio_iommu_type1_dma_unmap *unmap,
+                             struct vfio_bitmap *bitmap)
+{
+
+    while (ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap)) {
+        /*
+         * The type1 backend has an off-by-one bug in the kernel (71a7d3d78e3c
+         * v4.15) where an overflow in its wrap-around check prevents us from
+         * unmapping the last page of the address space.  Test for the error
+         * condition and re-try the unmap excluding the last page.  The
+         * expectation is that we've never mapped the last page anyway and this
+         * unmap request comes via vIOMMU support which also makes it unlikely
+         * that this page is used.  This bug was introduced well after type1 v2
+         * support was introduced, so we shouldn't need to test for v1.  A fix
+         * is queued for kernel v5.0 so this workaround can be removed once
+         * affected kernels are sufficiently deprecated.
+         */
+        if (errno == EINVAL && unmap->size && !(unmap->iova + unmap->size) &&
+            container->iommu_type == VFIO_TYPE1v2_IOMMU) {
+            trace_vfio_dma_unmap_overflow_workaround();
+            unmap->size -= 1ULL << ctz64(container->pgsizes);
+            continue;
+        }
+        error_report("VFIO_UNMAP_DMA failed: %s", strerror(errno));
+        return -errno;
+    }
+
+    return 0;
+}
+
+static int vfio_io_dirty_bitmap(VFIOContainer *container,
+                                struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                                struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+    int ret;
+
+    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, bitmap);
+
+    return ret < 0 ? -errno : ret;
+}
+
+VFIOContIO vfio_cont_io_ioctl = {
+    .dma_map = vfio_io_dma_map,
+    .dma_unmap = vfio_io_dma_unmap,
+    .dirty_bitmap = vfio_io_dirty_bitmap,
+};
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a..6fd40f1 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
 } VFIOAddressSpace;
 
 struct VFIOGroup;
+typedef struct VFIOContIO VFIOContIO;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -83,6 +84,7 @@ typedef struct VFIOContainer {
     MemoryListener prereg_listener;
     unsigned iommu_type;
     Error *error;
+    VFIOContIO *io_ops;
     bool initialized;
     bool dirty_pages_supported;
     uint64_t dirty_pgsizes;
@@ -154,6 +156,37 @@ struct VFIODeviceOps {
     int (*vfio_load_config)(VFIODevice *vdev, QEMUFile *f);
 };
 
+#ifdef CONFIG_LINUX
+
+/*
+ * The next 2 ops vectors are how Devices and Containers
+ * communicate with the server.  The default option is
+ * through ioctl() to the kernel VFIO driver, but vfio-user
+ * can use a socket to a remote process.
+ */
+
+struct VFIOContIO {
+    int (*dma_map)(VFIOContainer *container,
+                   struct vfio_iommu_type1_dma_map *map);
+    int (*dma_unmap)(VFIOContainer *container,
+                     struct vfio_iommu_type1_dma_unmap *unmap,
+                     struct vfio_bitmap *bitmap);
+    int (*dirty_bitmap)(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range);
+};
+
+#define CONT_DMA_MAP(cont, map) \
+    ((cont)->io_ops->dma_map((cont), (map)))
+#define CONT_DMA_UNMAP(cont, unmap, bitmap) \
+    ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
+#define CONT_DIRTY_BITMAP(cont, bitmap, range) \
+    ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
+
+extern VFIOContIO vfio_cont_io_ioctl;
+
+#endif /* CONFIG_LINUX */
+
 typedef struct VFIOGroup {
     int fd;
     int groupid;
-- 
1.8.3.1


