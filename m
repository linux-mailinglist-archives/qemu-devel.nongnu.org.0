Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1F5687579
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Feb 2023 06:46:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNSPP-0008D9-11; Thu, 02 Feb 2023 00:45:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPM-0008C9-WE
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:17 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <john.g.johnson@oracle.com>)
 id 1pNSPL-0007CB-6e
 for qemu-devel@nongnu.org; Thu, 02 Feb 2023 00:45:16 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3124i1H4021554; Thu, 2 Feb 2023 05:45:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : in-reply-to :
 references; s=corp-2022-7-12;
 bh=FSwq4E8XT0q1Pw7iQv4siD+cV8OFk9AaZWjCbzQfvAA=;
 b=zR6tafSGWtH3jO74y7RFK19Irbifs5Bg5qfS5IknpyPXW6WF/pCSw9F7yM+U1PZNElaO
 4wG2pQ8xckZsFGgpgQrQtjXJZHhEIgii0Ud7d1CAqUUPBRG3TiIYikxv++rReTX9KemW
 DvhsWXAOfMcX4ybKP4e2ANCEj4Ma1qdDSZ7pdiC0+KlGtpCD4nzF2a3334G9EA7OHYOO
 ykYDzXYcp4yrARwaUW1fvZPyL95sCBOB1tE7KiBJ4BVa2c6ZplY9uyEbyt+VQHcyNxY+
 GadgdHnvWLMOcHdcr7jTjLvdNGv/5FclN1675Sphcj/Cj/379dZpVkkN4wKgqHVZZm2A vA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3nfq28syxv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 02 Feb 2023 05:45:12 +0000
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 31254Ppr013015; Thu, 2 Feb 2023 05:45:11 GMT
Received: from bruckner.us.oracle.com (dhcp-10-65-133-23.vpn.oracle.com
 [10.65.133.23])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3nct5f5gb1-19
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
 Thu, 02 Feb 2023 05:45:11 +0000
From: John Johnson <john.g.johnson@oracle.com>
To: qemu-devel@nongnu.org
Cc: alex.williamson@redhat.com, clg@redhat.com, philmd@linaro.org
Subject: [PATCH v2 18/23] vfio-user: add dma_unmap_all
Date: Wed,  1 Feb 2023 21:55:54 -0800
Message-Id: <20fc8b4bb94583ef41d289db3831a9d07a0eae02.1675228037.git.john.g.johnson@oracle.com>
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
X-Proofpoint-GUID: wM1LE-PLgSFEfoAQ_mxyREa04wCFcu2T
X-Proofpoint-ORIG-GUID: wM1LE-PLgSFEfoAQ_mxyREa04wCFcu2T
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

Signed-off-by: John G Johnson <john.g.johnson@oracle.com>
Signed-off-by: Elena Ufimtseva <elena.ufimtseva@oracle.com>
Signed-off-by: Jagannathan Raman <jag.raman@oracle.com>
---
 include/hw/vfio/vfio-common.h |  1 +
 hw/vfio/common.c              | 45 ++++++++++++++++++++++++++++++++++---------
 hw/vfio/user.c                | 24 +++++++++++++++++++++++
 3 files changed, 61 insertions(+), 9 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index ee6ad8f..abef9b4 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -193,6 +193,7 @@ struct VFIOContainerIO {
     int (*dma_unmap)(VFIOContainer *container,
                      struct vfio_iommu_type1_dma_unmap *unmap,
                      struct vfio_bitmap *bitmap);
+    int (*dma_unmap_all)(VFIOContainer *container, uint32_t flags);
     int (*dirty_bitmap)(VFIOContainer *container,
                         struct vfio_iommu_type1_dirty_bitmap *bitmap,
                         struct vfio_iommu_type1_dirty_bitmap_get *range);
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f04fd20..8b55fbb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -508,6 +508,14 @@ static int vfio_dma_unmap(VFIOContainer *container,
     return container->io->dma_unmap(container, &unmap, NULL);
 }
 
+/*
+ * DMA - Mapping and unmapping for the "type1" IOMMU interface used on x86
+ */
+static int vfio_dma_unmap_all(VFIOContainer *container)
+{
+    return container->io->dma_unmap_all(container, VFIO_DMA_UNMAP_FLAG_ALL);
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
@@ -2867,6 +2868,31 @@ static int vfio_io_dma_unmap(VFIOContainer *container,
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
@@ -2886,6 +2912,7 @@ static void vfio_io_wait_commit(VFIOContainer *container)
 static VFIOContainerIO vfio_cont_io_ioctl = {
     .dma_map = vfio_io_dma_map,
     .dma_unmap = vfio_io_dma_unmap,
+    .dma_unmap_all = vfio_io_dma_unmap_all,
     .dirty_bitmap = vfio_io_dirty_bitmap,
     .wait_commit = vfio_io_wait_commit,
 };
diff --git a/hw/vfio/user.c b/hw/vfio/user.c
index 6dee775..fe6e476 100644
--- a/hw/vfio/user.c
+++ b/hw/vfio/user.c
@@ -1825,6 +1825,28 @@ static int vfio_user_io_dma_unmap(VFIOContainer *container,
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
@@ -1833,5 +1855,7 @@ static void vfio_user_io_wait_commit(VFIOContainer *container)
 VFIOContainerIO vfio_cont_io_sock = {
     .dma_map = vfio_user_io_dma_map,
     .dma_unmap = vfio_user_io_dma_unmap,
+    .dma_unmap_all = vfio_user_io_dma_unmap_all,
+    .dirty_bitmap = vfio_user_io_dirty_bitmap,
     .wait_commit = vfio_user_io_wait_commit,
 };
-- 
1.9.4


