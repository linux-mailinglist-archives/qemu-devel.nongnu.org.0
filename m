Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B59621FF3
	for <lists+qemu-devel@lfdr.de>; Wed,  9 Nov 2022 00:04:23 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1osXbp-00055O-8z; Tue, 08 Nov 2022 18:02:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbd-0004wN-N5
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:12 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1osXbY-0003g9-Gp
 for qemu-devel@nongnu.org; Tue, 08 Nov 2022 18:02:08 -0500
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 2A8Mx5Z2026348
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : subject :
 date : message-id : in-reply-to : references : in-reply-to : references;
 s=corp-2022-7-12; bh=6LF/iY30RtclxF/Utfdz0h0txxks+TtM/mtsjfxMCAU=;
 b=MMTOpuJ2ajjixAYoHDxdBrB0qMqpmcSQm8s7Nnh/qpjFhLDqKe7X9Lp8Pg55Ul/zkcFp
 2M1pi3IiSvY5qTHhxzJIjCxlSXnTcyOGF/cS+oq0Jpb+VBxa60N5MjudRqxnsUFAtkVx
 Y3FzTYfXCWnyD12CbKk4AnsUWrO+bGS7z6N8f9kDh0RCbhuzFlT/goGphvPC1kcImoqU
 WA/GGeqdxAuoEOwM+Usd/uPHC/v6MMCnHTM3Sk97Wa3FAr161NmdQX4q5fVnLOAHD+rr
 mqENpG+T2I7RRqJanfZTjWShCArseX5APMGkGFk0Uz6Ah/TJruRv99Zcb1r4cJ/kK4TE gg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3kqy68g7wk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:51 +0000
Received: from pps.filterd
 (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 2A8LjK6X004437
 for <qemu-devel@nongnu.org>; Tue, 8 Nov 2022 23:01:50 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-143-202.vpn.oracle.com
 [10.65.143.202])
 by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3kpcq2k0b9-19
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO)
 for <qemu-devel@nongnu.org>; Tue, 08 Nov 2022 23:01:50 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 18/24] vfio-user: add dma_unmap_all
Date: Tue,  8 Nov 2022 15:13:40 -0800
Message-Id: <d6c0241519fb3249ce69be9393ffad54671807c5.1667542066.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: rx6sYZs0XzVMBr1KklsQaZFjV7mjGr1r
X-Proofpoint-ORIG-GUID: rx6sYZs0XzVMBr1KklsQaZFjV7mjGr1r
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

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 hw/vfio/common.c              | 45 ++++++++++++++++++++++++++++++++++---------
 hw/vfio/user.c                | 24 +++++++++++++++++++++++
 include/hw/vfio/vfio-common.h |  3 +++
 3 files changed, 63 insertions(+), 9 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fe6eddd..cd64ec2 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -507,6 +507,14 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return CONT_DMA_UNMAP(container, &unmap, NULL);
 }
 
+/*
+ * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
+ */
+static int vfio_dma_unmap_all(VFIOContainer *container)
+{
+    return CONT_DMA_UNMAP_ALL(container, VFIO_DMA_UNMAP_FLAG_ALL);
+}
+
 static int vfio_dma_map(VFIOContainer *container, MemoryRegion *mr, hwaddr iova,
                         ram_addr_t size, void *vaddr, bool readonly)
 {
@@ -1256,17 +1264,10 @@ static void vfio_listener_region_del(MemoryListener *listener,
 
     if (try_unmap) {
         if (int128_eq(llsize, int128_2_64())) {
-            /* The unmap ioctl doesn't accept a full 64-bit span. */
-            llsize = int128_rshift(llsize, 1);
+            ret = vfio_dma_unmap_all(container);
+        } else {
             ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
-            if (ret) {
-                error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                             "0x%"HWADDR_PRIx") = %d (%m)",
-                             container, iova, int128_get64(llsize), ret);
-            }
-            iova += int128_get64(llsize);
         }
-        ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
         if (ret) {
             error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
                          "0x%"HWADDR_PRIx") = %d (%m)",
@@ -3057,6 +3058,31 @@ static int vfio_io_dma_unmap(VFIOContainer *container,
     return 0;
 }
 
+static int vfio_io_dma_unmap_all(VFIOContainer *container, uint32_t flags)
+{
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = 0,
+        .size = 0x8000000000000000,
+    };
+    int ret;
+
+    /* The unmap ioctl doesn't accept a full 64-bit span. */
+    unmap.iova = 0;
+    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap);
+    if (ret) {
+        return -errno;
+    }
+
+    unmap.iova += unmap.size;
+    ret = ioctl(container->fd, VFIO_IOMMU_UNMAP_DMA, &unmap);
+    if (ret) {
+        return -errno;
+    }
+
+    return 0;
+}
+
 static int vfio_io_dirty_bitmap(VFIOContainer *container,
                                 struct vfio_iommu_type1_dirty_bitmap *bitmap,
                                 struct vfio_iommu_type1_dirty_bitmap_get *range)
@@ -3076,6 +3102,7 @@ static void vfio_io_wait_commit(VFIOContainer *container)
 VFIOContIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
+    .dma_unmap_all = vfio_io_dma_unmap_all,
     .dirty_bitmap = vfio_io_dirty_bitmap,
     .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 1fd37cc..d62fe05 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1646,6 +1646,28 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
                                container->async_ops);
 }
 
+static int vfio_user_io_dma_unmap_all(VFIOContainer *container, uint32_t flags)
+{
+    struct vfio_iommu_type1_dma_unmap unmap = {
+        .argsz = sizeof(unmap),
+        .flags = flags | VFIO_DMA_UNMAP_FLAG_ALL,
+        .iova = 0,
+        .size = 0,
+    };
+
+    return vfio_user_dma_unmap(container->proxy, &unmap, NULL,
+                               container->async_ops);
+}
+
+static int vfio_user_io_dirty_bitmap(VFIOContainer *container,
+                        struct vfio_iommu_type1_dirty_bitmap *bitmap,
+                        struct vfio_iommu_type1_dirty_bitmap_get *range)
+{
+
+    /* vfio-user doesn't support migration */
+    return -EINVAL;
+}
+
 static void vfio_user_io_wait_commit(VFIOContainer *container)
 {
     vfio_user_wait_reqs(container->proxy);
@@ -1654,5 +1676,7 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
 VFIOContIO vfio_cont_io_sock = {
     .dma_map = vfio_user_io_dma_map,
     .dma_unmap = vfio_user_io_dma_unmap,
+    .dma_unmap_all = vfio_user_io_dma_unmap_all,
+    .dirty_bitmap = vfio_user_io_dirty_bitmap,
     .wait_commit = vfio_user_io_wait_commit,
 };
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 413dafc..d7e3f51 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -206,6 +206,7 @@ struct VFIOContIO {
     int (*dma_unmap)(VFIOContainer *container,
                      struct vfio_iommu_type1_dma_unmap *unmap,
                      struct vfio_bitmap *bitmap);
+    int (*dma_unmap_all)(VFIOContainer *container, uint32_t flags);
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
@@ -216,6 +217,8 @@ struct VFIOContIO {
     ((cont)->io_ops->dma_map((cont), (mr), (map)))
 #define CONT_DMA_UNMAP(cont, unmap, bitmap) \
     ((cont)->io_ops->dma_unmap((cont), (unmap), (bitmap)))
+#define CONT_DMA_UNMAP_ALL(cont, flags) \
+    ((cont)->io_ops->dma_unmap_all((cont), (flags)))
 #define CONT_DIRTY_BITMAP(cont, bitmap, range) \
     ((cont)->io_ops->dirty_bitmap((cont), (bitmap), (range)))
 #define CONT_WAIT_COMMIT(cont) ((cont)->io_ops->wait_commit(cont))
-- 
1.8.3.1


