Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8283A6AD462
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:05 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMfv-0006s1-0x; Mon, 06 Mar 2023 21:03:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfs-0006rC-A1
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:32 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfo-0004wJ-KV
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:31 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NxYsM030050; Tue, 7 Mar 2023 02:03:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=U424iuqvq3TR9AV41TeI7ouo9ejdeHYzTj2iwoghSbo=;
 b=UlIaSMpX8gHQsTMitBCVmC8c5KGNc7h26sOFZYuxNb+LCO12UgMrO+gNu+sdVKlMW0Iq
 iDunWdJVVLv9DmL/96kfdx35Jy+zrAzebFW/WMgSLBg0jCRtr2F7G0JSY9qAjW1Xa7KK
 9MSpfNuZ99cpkW1ETfHU6M1V9NRUMhD9p1C2LcYKBv8VYCsXW6uahQoxknSIr3VdIXz+
 gSaMyZp7oEG0sRIrb6YMC6XQ5p3RrzVCwGFtGFBCG9PTubNN8YYEtkjUAOy4dLXNow5e
 rJHZNPlUduTZFmRj1107pKVHyXtBiz9uxE26ngRMLz7hLGVYKb1aZ5SxTq4L7sx/7Czn Tg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xvfe3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:27 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271UTZv038062; Tue, 7 Mar 2023 02:03:25 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubsf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:25 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356A016763;
 Tue, 7 Mar 2023 02:03:25 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-7; Tue, 07 Mar 2023 02:03:25 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 06/14] vfio/common: Consolidate skip/invalid section into
 helper
Date: Tue,  7 Mar 2023 02:02:50 +0000
Message-Id: <20230307020258.58215-7-joao.m.martins@oracle.com>
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
 spamscore=0 suspectscore=0 mlxlogscore=641 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070016
X-Proofpoint-GUID: PV3J8wcV388D5fSPhlNIQMdn5BLiLfZ-
X-Proofpoint-ORIG-GUID: PV3J8wcV388D5fSPhlNIQMdn5BLiLfZ-
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

The checks are replicated against region_add and region_del
and will be soon added in another memory listener dedicated
for dirty tracking.

Move these into a new helper for avoid duplication.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 99acb998eb14..54b4a4fc7daf 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -933,23 +933,14 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
     return true;
 }
 
-static void vfio_listener_region_add(MemoryListener *listener,
-                                     MemoryRegionSection *section)
+static bool vfio_listener_valid_section(MemoryRegionSection *section)
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
         trace_vfio_listener_region_add_skip(
                 section->offset_within_address_space,
                 section->offset_within_address_space +
                 int128_get64(int128_sub(section->size, int128_one())));
-        return;
+        return false;
     }
 
     if (unlikely((section->offset_within_address_space &
@@ -964,6 +955,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
+    if (!vfio_listener_valid_section(section)) {
         return;
     }
 
@@ -1182,26 +1191,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     int ret;
     bool try_unmap = true;
 
-    if (vfio_listener_skipped_section(section)) {
-        trace_vfio_listener_region_del_skip(
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
+    if (!vfio_listener_valid_section(section)) {
         return;
     }
 
-- 
2.17.2


