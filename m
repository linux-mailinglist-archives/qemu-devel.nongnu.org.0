Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EF26AA770
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 02:47:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYGwx-0006yS-Ow; Fri, 03 Mar 2023 20:44:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGwv-0006yE-W7
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:44:38 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGwu-0005fV-8I
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:44:37 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3241iYH8017574; Sat, 4 Mar 2023 01:44:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=xk8wvTPv6dJhnVr411G6qxujVLuqM/QjT1VPuR/+yew=;
 b=H8q2xyYhh1JdLVDG4KeL5bY9/RS59e5o0ymKVL6pob37ccVA0H1I91oDllRbW3QJ39FO
 hrOOnFC00PR0ryCzrPKugsFLB1l0otb8RJowD6SCcfaEYE4mjaIFdrLWEDLzU1vmTYo0
 UXdT0BZNBaZwclRoG29PKptCVhvd/jkt9227R6ASrAt9EoZ33bURjfvULOs4ejbACDLG
 GVgL51388llZ6bSQMwj4VeHRYCDThtdutGUSwrra2H19WEbkihZnM/IiDQn7dsKfej3L
 HIefHgS46fEjmue0cedLtuIfBAFqZuO4Yg7wLmnKi25MC5sTJiskNdqBwJoLabpBFHm9 tA== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p3vk1801e-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:34 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3241XvUD015714; Sat, 4 Mar 2023 01:44:33 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-185-117.vpn.oracle.com
 [10.175.185.117])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p3ve8g73b-3; Sat, 04 Mar 2023 01:44:32 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>
Subject: [PATCH v3 02/13] vfio/common: Fix wrong %m usages
Date: Sat,  4 Mar 2023 01:43:32 +0000
Message-Id: <20230304014343.33646-3-joao.m.martins@oracle.com>
In-Reply-To: <20230304014343.33646-1-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_07,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=813 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303040011
X-Proofpoint-GUID: HlJGIx6ft1MhsLj0_xvTM9uhGx2YrJpe
X-Proofpoint-ORIG-GUID: HlJGIx6ft1MhsLj0_xvTM9uhGx2YrJpe
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

There are several places where the %m conversion is used if one of
vfio_dma_map(), vfio_dma_unmap() or vfio_get_dirty_bitmap() fail.

The %m usage in these places is wrong since %m relies on errno value while
the above functions don't report errors via errno.

Fix it by using strerror() with the returned value instead.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 29 ++++++++++++++++-------------
 1 file changed, 16 insertions(+), 13 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 9fc305448fa2..4d26e9cccf91 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -703,17 +703,17 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                            read_only);
         if (ret) {
             error_report("vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx", %p) = %d (%m)",
+                         "0x%"HWADDR_PRIx", %p) = %d (%s)",
                          container, iova,
-                         iotlb->addr_mask + 1, vaddr, ret);
+                         iotlb->addr_mask + 1, vaddr, ret, strerror(-ret));
         }
     } else {
         ret = vfio_dma_unmap(container, iova, iotlb->addr_mask + 1, iotlb);
         if (ret) {
             error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
+                         "0x%"HWADDR_PRIx") = %d (%s)",
                          container, iova,
-                         iotlb->addr_mask + 1, ret);
+                         iotlb->addr_mask + 1, ret, strerror(-ret));
         }
     }
 out:
@@ -1095,8 +1095,9 @@ static void vfio_listener_region_add(MemoryListener *listener,
                        vaddr, section->readonly);
     if (ret) {
         error_setg(&err, "vfio_dma_map(%p, 0x%"HWADDR_PRIx", "
-                   "0x%"HWADDR_PRIx", %p) = %d (%m)",
-                   container, iova, int128_get64(llsize), vaddr, ret);
+                   "0x%"HWADDR_PRIx", %p) = %d (%s)",
+                   container, iova, int128_get64(llsize), vaddr, ret,
+                   strerror(-ret));
         if (memory_region_is_ram_device(section->mr)) {
             /* Allow unexpected mappings not to be fatal for RAM devices */
             error_report_err(err);
@@ -1228,16 +1229,18 @@ static void vfio_listener_region_del(MemoryListener *listener,
             ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
             if (ret) {
                 error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                             "0x%"HWADDR_PRIx") = %d (%m)",
-                             container, iova, int128_get64(llsize), ret);
+                             "0x%"HWADDR_PRIx") = %d (%s)",
+                             container, iova, int128_get64(llsize), ret,
+                             strerror(-ret));
             }
             iova += int128_get64(llsize);
         }
         ret = vfio_dma_unmap(container, iova, int128_get64(llsize), NULL);
         if (ret) {
             error_report("vfio_dma_unmap(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
-                         container, iova, int128_get64(llsize), ret);
+                         "0x%"HWADDR_PRIx") = %d (%s)",
+                         container, iova, int128_get64(llsize), ret,
+                         strerror(-ret));
         }
     }
 
@@ -1384,9 +1387,9 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                                     translated_addr);
         if (ret) {
             error_report("vfio_iommu_map_dirty_notify(%p, 0x%"HWADDR_PRIx", "
-                         "0x%"HWADDR_PRIx") = %d (%m)",
-                         container, iova,
-                         iotlb->addr_mask + 1, ret);
+                         "0x%"HWADDR_PRIx") = %d (%s)",
+                         container, iova, iotlb->addr_mask + 1, ret,
+                         strerror(-ret));
         }
     }
     rcu_read_unlock();
-- 
2.17.2


