Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B3326ADF47
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:57:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWrF-0005bV-IN; Tue, 07 Mar 2023 07:55:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrE-0005an-4H
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:56 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrC-000565-ID
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:55 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783eLP003670; Tue, 7 Mar 2023 12:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=pUY4inpih/zRR+cMVCfCJujZdxgKM9m3KCfKyXD/GO4=;
 b=DenzauD8IPH+U82xD1w5/pnwSXptk2PaldCWq84+irvVwEOGYuotxrWD51aBfJ3qE9V4
 vtsd44AfTwI0ZvFlkqFHTvzh3U8mTbMsjLTCjkSUa+aCw6un72bZJndOb0TdX0/P+D5k
 /LKoQdK8cew7d0K1FrM+hf/Sfmq3ClH6/RCyxDX6vDgpd+WGs1qs8+y0dopNehaF+moG
 XtVdtxTj65R6oCDlYJE8DG5jhgO9vm+aVnj2Bz4jbRnLpV7L3O/RMuzEiHv1QMqcoWs9
 ISEcwEDDax4mfCK0ami6L205NWMoOxUI16MNlyJbyORVlWuItjSnHhffoLeGjl7eSGvO Ag== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168nd0s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:53 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CFJT7026620; Tue, 7 Mar 2023 12:55:53 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyeus-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:53 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV5F004358;
 Tue, 7 Mar 2023 12:55:52 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-9; Tue, 07 Mar 2023 12:55:52 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 08/15] vfio/common: Add helper to consolidate iova/end
 calculation
Date: Tue,  7 Mar 2023 12:54:43 +0000
Message-Id: <20230307125450.62409-9-joao.m.martins@oracle.com>
In-Reply-To: <20230307125450.62409-1-joao.m.martins@oracle.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=796 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: Oa5tN6nPEee12GHEKFNuBHnkYx-mZ8xc
X-Proofpoint-ORIG-GUID: Oa5tN6nPEee12GHEKFNuBHnkYx-mZ8xc
Received-SPF: pass client-ip=205.220.177.32;
 envelope-from=joao.m.martins@oracle.com; helo=mx0b-00069f02.pphosted.com
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

In preparation to be used in device dirty tracking, move the code that
calculate a iova/end range from the container/section.  This avoids
duplication on the common checks across listener callbacks.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c | 41 +++++++++++++++++++++++++++--------------
 1 file changed, 27 insertions(+), 14 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index d38b7c1969b9..63831eab78a1 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -962,6 +962,31 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section,
     return true;
 }
 
+static bool vfio_get_section_iova_range(VFIOContainer *container,
+                                        MemoryRegionSection *section,
+                                        hwaddr *out_iova, hwaddr *out_end,
+                                        Int128 *out_llend)
+{
+    Int128 llend;
+    hwaddr iova;
+
+    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
+    llend = int128_make64(section->offset_within_address_space);
+    llend = int128_add(llend, section->size);
+    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
+
+    if (int128_ge(int128_make64(iova), llend)) {
+        return false;
+    }
+
+    *out_iova = iova;
+    *out_end = int128_get64(int128_sub(llend, int128_one()));
+    if (out_llend) {
+        *out_llend = llend;
+    }
+    return true;
+}
+
 static void vfio_listener_region_add(MemoryListener *listener,
                                      MemoryRegionSection *section)
 {
@@ -977,12 +1002,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
         return;
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
-
-    if (int128_ge(int128_make64(iova), llend)) {
+    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
         if (memory_region_is_ram_device(section->mr)) {
             trace_vfio_listener_region_add_no_dma_map(
                 memory_region_name(section->mr),
@@ -992,7 +1012,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
         return;
     }
-    end = int128_get64(int128_sub(llend, int128_one()));
 
     if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
         hwaddr pgsize = 0;
@@ -1219,15 +1238,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
          */
     }
 
-    iova = REAL_HOST_PAGE_ALIGN(section->offset_within_address_space);
-    llend = int128_make64(section->offset_within_address_space);
-    llend = int128_add(llend, section->size);
-    llend = int128_and(llend, int128_exts64(qemu_real_host_page_mask()));
-
-    if (int128_ge(int128_make64(iova), llend)) {
+    if (!vfio_get_section_iova_range(container, section, &iova, &end, &llend)) {
         return;
     }
-    end = int128_get64(int128_sub(llend, int128_one()));
 
     llsize = int128_sub(llend, int128_make64(iova));
 
-- 
2.17.2


