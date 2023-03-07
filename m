Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C3C86ADF69
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 14:01:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWrD-0005aW-GY; Tue, 07 Mar 2023 07:55:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrB-0005YU-D6
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:53 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWr9-00055e-Q9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:53 -0500
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783n3T001667; Tue, 7 Mar 2023 12:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=FJh6jNJWa7Qb5orBtnaLlaUFUNsYDGsuxIcR1IIPg54=;
 b=cs5ZBr64MOppP+01k2GG8MGnH1hufhn2LTRFEnhuY3QFzg0dsvymDXCgZb9MU7peyAHE
 CzINNV7f2n7MTJNJZbLoPHcl/jINJP8oP4m07bboKn35NPOAKyXYZTsxdo5anj5lsb3h
 t0A7sTmsGKXYUwhrfROSl1Xdj4zdxrCrOPJKVaDE/SuDBkKBFKTFc77w3rmriYepMeab
 rNFWRbYQO30Cu7zGCk1mQvV6RfkIRV7KjO4EQgnmOd9gZlNRepihyKqZHU+wtn3wbpoi
 O6qJf56e0csQ63936oevyJayUjwp/zZjvmoB2XBEEeaDq5fEPKoCutLb9TaEosFGf9lg Xw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p415hwe6a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:50 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CEbFY026636; Tue, 7 Mar 2023 12:55:50 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyetf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:50 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV5D004358;
 Tue, 7 Mar 2023 12:55:49 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-8; Tue, 07 Mar 2023 12:55:49 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 07/15] vfio/common: Consolidate skip/invalid section into
 helper
Date: Tue,  7 Mar 2023 12:54:42 +0000
Message-Id: <20230307125450.62409-8-joao.m.martins@oracle.com>
In-Reply-To: <20230307125450.62409-1-joao.m.martins@oracle.com>
References: <20230307125450.62409-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-07_06,2023-03-07_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=761 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: 3GG2lNlQa8w13A5s19nkXH9zWcbGcdy1
X-Proofpoint-ORIG-GUID: 3GG2lNlQa8w13A5s19nkXH9zWcbGcdy1
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

The checks are replicated against region_add and region_del
and will be soon added in another memory listener dedicated
for dirty tracking.

Move these into a new helper for avoid duplication.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 55 ++++++++++++++++++++----------------------------
 1 file changed, 23 insertions(+), 32 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 1cb62efa9743..d38b7c1969b9 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -933,23 +933,15 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
     return true;
 }
 
-static void vfio_listener_region_add(MemoryListener *listener,
-                                     MemoryRegionSection *section)
+static bool vfio_listener_valid_section(MemoryRegionSection *section,
+                                        const char *name)
 {
-    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
-    hwaddr iova, end;
-    Int128 llend, llsize;
-    void *vaddr;
-    int ret;
-    VFIOHostDMAWindow *hostwin;
-    Error *err = NULL;
-
     if (vfio_listener_skipped_section(section)) {
-        trace_vfio_listener_region_skip("region_add",
+        trace_vfio_listener_region_skip(name,
                 section->offset_within_address_space,
                 section->offset_within_address_space +
                 int128_get64(int128_sub(section->size, int128_one())));
-        return;
+        return false;
     }
 
     if (unlikely((section->offset_within_address_space &
@@ -964,6 +956,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
                          section->offset_within_region,
                          qemu_real_host_page_size());
         }
+        return false;
+    }
+
+    return true;
+}
+
+static void vfio_listener_region_add(MemoryListener *listener,
+                                     MemoryRegionSection *section)
+{
+    VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    hwaddr iova, end;
+    Int128 llend, llsize;
+    void *vaddr;
+    int ret;
+    VFIOHostDMAWindow *hostwin;
+    Error *err = NULL;
+
+    if (!vfio_listener_valid_section(section, "region_add")) {
         return;
     }
 
@@ -1182,26 +1192,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     int ret;
     bool try_unmap = true;
 
-    if (vfio_listener_skipped_section(section)) {
-        trace_vfio_listener_region_skip("region_del",
-                section->offset_within_address_space,
-                section->offset_within_address_space +
-                int128_get64(int128_sub(section->size, int128_one())));
-        return;
-    }
-
-    if (unlikely((section->offset_within_address_space &
-                  ~qemu_real_host_page_mask()) !=
-                 (section->offset_within_region & ~qemu_real_host_page_mask()))) {
-        if (!vfio_known_safe_misalignment(section)) {
-            error_report("%s received unaligned region %s iova=0x%"PRIx64
-                         " offset_within_region=0x%"PRIx64
-                         " qemu_real_host_page_size=0x%"PRIxPTR,
-                         __func__, memory_region_name(section->mr),
-                         section->offset_within_address_space,
-                         section->offset_within_region,
-                         qemu_real_host_page_size());
-        }
+    if (!vfio_listener_valid_section(section, "region_del")) {
         return;
     }
 
-- 
2.17.2


