Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 78F6F68757A
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:47:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSP8-000860-Nb; Thu, 02 Feb 2023 00:45:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSP6-00085D-UD
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:00 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSP4-0006xD-Ec
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:00 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i2qw012886; Thu, 2 Feb 2023 05:44:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=uc5HRfhmqLPvzrmMuJIXi7kGF4TfvorXX6+xKwUmqBw=;
 b=JB8rjtOzvJ2U+29Bk17zZyFVyHmYuL9G1I70VU14J2BqZHc3Li0kV/UrMqTqVAGQzIWt
 g14ac99ls9Ld48fIUSD2stvCpJnpQInIxZQ0OPJULTVup3oozXeiv1MkjcPIZOQhJgth
 +HINwncLgTjPvNWV9IypPRPd1hjInFiSXo1/n2/sx+eaB/0HoEs5Jtim1SD6AyoXbp52
 YVlT0fszMyspZsQROAiaYND+C4U1/ZFqzU81OeHsLcWthCEXxcUHGp6y8joX2LgCb+yI
 8Etls+0jj9N9lpnw/BpbhA7V2BPy6jJ8Z2J/Tc3qCj6M5/8yXue2tF8/UUL+Bm0u7j3E 6A== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfq4hj0c8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:44:57 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254PpV013015; Thu, 2 Feb 2023 05:44:56 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-4
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:44:56 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 03/23] vfio-user: add container IO ops vector
Date: Wed,  1 Feb 2023 21:55:39 -0800
Message-Id: <3648002c52cef9b4473f97d18cb7e2cd62fc3fd5.1675228037.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: Ds6gQgb9CbRguDp12JqFCvHC183ZDmhB
X-Proofpoint-ORIG-GUID: Ds6gQgb9CbRguDp12JqFCvHC183ZDmhB
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
 include/hw/vfio/vfio-common.h |  24 ++++++++
 hw/vfio/common.c              | 128 ++++++++++++++++++++++++++++--------------
 2 files changed, 110 insertions(+), 42 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a..953bc0f 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -75,6 +75,7 @@ typedef struct VFIOAddressSpace {
 } VFIOAddressSpace;
 
 struct VFIOGroup;
+typedef struct VFIOContainerIO VFIOContainerIO;
 
 typedef struct VFIOContainer {
     VFIOAddressSpace *space;
@@ -83,6 +84,7 @@ typedef struct VFIOContainer {
     MemoryListener prereg_listener;
     unsigned iommu_type;
     Error *error;
+    VFIOContainerIO *io;
     bool initialized;
     bool dirty_pages_supported;
     uint64_t dirty_pgsizes;
@@ -154,6 +156,28 @@ struct VFIODeviceOps {
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
+struct VFIOContainerIO {
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
+#endif /* CONFIG_LINUX */
+
 typedef struct VFIOGroup {
     int fd;
     int groupid;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index ace9562..9310a7f 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -58,6 +58,8 @@ static QLIST_HEAD(, VFIOAddressSpace) vfio_address_spaces =
 static int vfio_kvm_device_fd = -1;
 #endif
 
+static VFIOContainerIO vfio_cont_io_ioctl;
+
 /*
  * Common VFIO interrupt disable
  */
@@ -432,12 +434,12 @@ static int vfio_dma_unmap_bitmap(VFIOContainer *container,
         goto unmap_exit;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, unmap);
+    ret = container->io->dma_unmap(container, unmap, bitmap);
     if (!ret) {
         cpu_physical_memory_set_dirty_lebitmap((unsigned long *)bitmap->data,
                 iotlb->translated_addr, pages);
     } else {
-        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %m");
+        error_report("VFIO_UNMAP_DMA with DIRTY_BITMAP : %s", strerror(-ret));
     }
 
     g_free(bitmap->data);
@@ -465,30 +467,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
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
+    return container->io->dma_unmap(container, &unmap, NULL);
 }
 
 static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
@@ -501,24 +480,18 @@ static int vfio_dma_map(VFIOContainer *container, hwaddr iova,
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
+    ret = container->io->dma_map(container, &map);
 
-    error_report("VFIO_MAP_DMA failed: %s", strerror(errno));
-    return -errno;
+    if (ret < 0) {
+        error_report("VFIO_MAP_DMA failed: %s", strerror(-ret));
+    }
+    return ret;
 }
 
 static void vfio_host_win_add(VFIOContainer *container,
@@ -1263,10 +1236,10 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
         dirty.flags = VFIO_IOMMU_DIRTY_PAGES_FLAG_STOP;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
+    ret = container->io->dirty_bitmap(container, &dirty, NULL);
     if (ret) {
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
-                     dirty.flags, errno);
+                     dirty.flags, -ret);
     }
 }
 
@@ -1316,11 +1289,11 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         goto err_out;
     }
 
-    ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
+    ret = container->io->dirty_bitmap(container, dbitmap, range);
     if (ret) {
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
-                (uint64_t)range->size, errno);
+                (uint64_t)range->size, -ret);
         goto err_out;
     }
 
@@ -2090,6 +2063,7 @@ static int vfio_connect_container(VFIOGroup *group, AddressSpace *as,
     container->error = NULL;
     container->dirty_pages_supported = false;
     container->dma_max_mappings = 0;
+    container->io = &vfio_cont_io_ioctl;
     QLIST_INIT(&container->giommu_list);
     QLIST_INIT(&container->hostwin_list);
     QLIST_INIT(&container->vrdl_list);
@@ -2626,3 +2600,73 @@ int vfio_eeh_as_op(AddressSpace *as, uint32_t op)
     }
     return vfio_eeh_container_op(container, op);
 }
+
+/*
+ * Traditional ioctl() based io
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
+static VFIOContainerIO vfio_cont_io_ioctl = {
+    .dma_map = vfio_io_dma_map,
+    .dma_unmap = vfio_io_dma_unmap,
+    .dirty_bitmap = vfio_io_dirty_bitmap,
+};
-- 
1.9.4


