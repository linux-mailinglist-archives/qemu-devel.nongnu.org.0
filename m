Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D4186AD468
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMgA-0006u4-Ex; Mon, 06 Mar 2023 21:03:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMg8-0006tu-Bh
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMg6-0004xJ-Js
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:48 -0500
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NxHdR025813; Tue, 7 Mar 2023 02:03:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=+hLAnqQDZ8k5x6NfAr4Ghuxu6cwVnOjdcp6s8DtGNGI=;
 b=LUFK2a18HNHlA7hhvAyrwJPrqhP0dDnf6emApckRt6XlqsDBhiEkC+vEeKWd31C5ybFM
 kMmQMoL+MNPx1xYvDGakBBoHFWow9SELiyhWJvrpE593AlQqMutGDxFPXsu52AzxfJFU
 rLLDSKvHRKsBMFeDpxfGc+hZasC+4EjwoARAqCXA+pBDEOEQW3KbocN7KF4a+XgJaT5c
 im34ouPOpGgcw8ckUomRPA3ZeJPb1bphnfC0tqjxgqeAr/ECiF/Srt68sCeuvjkyP5or
 GmtKpDC2Il5b+8oj78yO+XGU+S1ls8dbkQ99zi1duogWuVLOOIaRgpFVcxPjPh874+LL Ug== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p416wmf2u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:44 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 326NSB3x038193; Tue, 7 Mar 2023 02:03:43 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txduc17-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:43 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356I016763;
 Tue, 7 Mar 2023 02:03:43 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-11; Tue, 07 Mar 2023 02:03:42 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 10/14] vfio/common: Extract code from
 vfio_get_dirty_bitmap() to new function
Date: Tue,  7 Mar 2023 02:02:54 +0000
Message-Id: <20230307020258.58215-11-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=710 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070017
X-Proofpoint-GUID: GdA4HZD1xja-jBOykaNbG9sR6mmMFYk7
X-Proofpoint-ORIG-GUID: GdA4HZD1xja-jBOykaNbG9sR6mmMFYk7
Received-SPF: pass client-ip=205.220.165.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0a-00069f02.pphosted.com
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

From: Avihai Horon <avihaih@nvidia.com>

Extract the VFIO_IOMMU_DIRTY_PAGES ioctl code in vfio_get_dirty_bitmap()
to its own function.

This will help the code to be more readable after next patch will add
device dirty page bitmap sync functionality.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 57 +++++++++++++++++++++++++++++-------------------
 1 file changed, 35 insertions(+), 22 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index a42f5f1e7ffe..136665ca2c4e 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -1597,26 +1597,13 @@ static void vfio_listener_log_global_stop(MemoryListener *listener)
     }
 }
 
-static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
-                                 uint64_t size, ram_addr_t ram_addr)
+static int vfio_query_dirty_bitmap(VFIOContainer *container, VFIOBitmap *vbmap,
+                                   hwaddr iova, hwaddr size)
 {
     struct vfio_iommu_type1_dirty_bitmap *dbitmap;
     struct vfio_iommu_type1_dirty_bitmap_get *range;
-    VFIOBitmap vbmap;
     int ret;
 
-    if (!container->dirty_pages_supported) {
-        cpu_physical_memory_set_dirty_range(ram_addr, size,
-                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
-                                            DIRTY_CLIENTS_NOCODE);
-        return 0;
-    }
-
-    ret = vfio_bitmap_alloc(&vbmap, size);
-    if (ret) {
-        return ret;
-    }
-
     dbitmap = g_malloc0(sizeof(*dbitmap) + sizeof(*range));
 
     dbitmap->argsz = sizeof(*dbitmap) + sizeof(*range);
@@ -1631,8 +1618,8 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
      * to qemu_real_host_page_size.
      */
     range->bitmap.pgsize = qemu_real_host_page_size();
-    range->bitmap.size = vbmap.size;
-    range->bitmap.data = (__u64 *)vbmap.bitmap;
+    range->bitmap.size = vbmap->size;
+    range->bitmap.data = (__u64 *)vbmap->bitmap;
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, dbitmap);
     if (ret) {
@@ -1640,16 +1627,42 @@ static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
         error_report("Failed to get dirty bitmap for iova: 0x%"PRIx64
                 " size: 0x%"PRIx64" err: %d", (uint64_t)range->iova,
                 (uint64_t)range->size, errno);
-        goto err_out;
+    }
+
+    g_free(dbitmap);
+
+    return ret;
+}
+
+static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
+                                 uint64_t size, ram_addr_t ram_addr)
+{
+    VFIOBitmap vbmap;
+    int ret;
+
+    if (!container->dirty_pages_supported) {
+        cpu_physical_memory_set_dirty_range(ram_addr, size,
+                                            tcg_enabled() ? DIRTY_CLIENTS_ALL :
+                                            DIRTY_CLIENTS_NOCODE);
+        return 0;
+    }
+
+    ret = vfio_bitmap_alloc(&vbmap, size);
+    if (ret) {
+        return ret;
+    }
+
+    ret = vfio_query_dirty_bitmap(container, &vbmap, iova, size);
+    if (ret) {
+        goto out;
     }
 
     cpu_physical_memory_set_dirty_lebitmap(vbmap.bitmap, ram_addr,
                                            vbmap.pages);
 
-    trace_vfio_get_dirty_bitmap(container->fd, range->iova, range->size,
-                                range->bitmap.size, ram_addr);
-err_out:
-    g_free(dbitmap);
+    trace_vfio_get_dirty_bitmap(container->fd, iova, size, vbmap.size,
+                                ram_addr);
+out:
     g_free(vbmap.bitmap);
 
     return ret;
-- 
2.17.2


