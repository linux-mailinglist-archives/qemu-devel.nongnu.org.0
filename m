Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F2316AD46C
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMfu-0006rk-Cx; Mon, 06 Mar 2023 21:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfs-0006rE-8S
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:32 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfq-0004wN-MB
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:31 -0500
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NwpWr006043; Tue, 7 Mar 2023 02:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=2o8V37OeLoQqX5tU00a0f9oNCHZwmWI6Rq26xHMurKw=;
 b=UBBIiEarQ9VoH5sHwk15obiujPv3HjS7FT2oE6lVq8M6FrgYf1vS86YfZuwv36b0POPu
 NUu1puniQmzzqkadEMkWEaCa9TZmlGcepjzG7dt5ReuEPRj+JOHthYTMyk+UDbvjj+sq
 GGsQXTXDWSc8GwF5RhbQ3f3xQyzDpJDjRLBvMgiLO/ami1DgGp2yJUPNthu7fBuJHdjt
 BBFkydfG1kv6ilDb7Ncoj3NaJDKQODDakqmcyTtpG9N9auVB3UW61x5vUN/B8KYPU8R6
 eBCMUV0NcLGzvHBosos/d1vLfkMpxTAK5xGhbUD7jAXS3SsB9nMNdAYo657xmWjL8sDI WA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p4168mene-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:29 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271kr00037245; Tue, 7 Mar 2023 02:03:28 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubu7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:28 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356C016763;
 Tue, 7 Mar 2023 02:03:28 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-8; Tue, 07 Mar 2023 02:03:28 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 07/14] vfio/common: Add helper to consolidate iova/end
 calculation
Date: Tue,  7 Mar 2023 02:02:51 +0000
Message-Id: <20230307020258.58215-8-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=735 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070016
X-Proofpoint-GUID: ZhB-dNGpxu8JAhZhemkl9TMu7wXH8hDY
X-Proofpoint-ORIG-GUID: ZhB-dNGpxu8JAhZhemkl9TMu7wXH8hDY
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
calculates a iova/end range from the container/section.  This avoids
duplication on the common checks across listener callbacks.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c | 37 ++++++++++++++++++++++++++++++-------
 1 file changed, 30 insertions(+), 7 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 54b4a4fc7daf..3a6491dbc523 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -961,6 +961,35 @@ static bool vfio_listener_valid_section(MemoryRegionSection *section)
     return true;
 }
 
+/*
+ * Called for the dirty tracking memory listener to calculate the iova/end
+ * for a given memory region section.
+ */
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
@@ -976,12 +1005,7 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
@@ -991,7 +1015,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
         }
         return;
     }
-    end = int128_get64(int128_sub(llend, int128_one()));
 
     if (container->iommu_type == VFIO_SPAPR_TCE_v2_IOMMU) {
         hwaddr pgsize = 0;
-- 
2.17.2


