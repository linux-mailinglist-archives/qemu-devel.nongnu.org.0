Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B7136AA760
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 02:45:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYGx9-000711-9i; Fri, 03 Mar 2023 20:44:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGx6-000702-Pt
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:44:48 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGx4-0005in-Ua
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:44:48 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3241hlCD015658; Sat, 4 Mar 2023 01:44:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=0saykVJKcvcjXtn/rbhkDq7mKeHhVUAcMOlUxmoB8lY=;
 b=UPmR3ccUng3ufYnjf3RRWVwvWu8f7WsQNiI5UFRJWl85Kg97QNKjGnSZyMKfbUqmf8A+
 HizjV9WQILxqIeV4vawc4W9IA9DR9OLfT0SARitd7acPWN0fYvuLenK/gTeZv/gOLq2t
 w5Xpsr1e1D+wIpliAZQ2FtP1gHwII9e6RSWjMPdZnrGiGxIS2SV9GaungH/YnO4tH2rz
 tPV9CPXUL+R459jNUfvqEtRAIyYVP/Zz+lAjXWQjjTAyP+raCWZTu2fLiLHVinQave8H
 doG3e0Me8s+vzpp4xLV1qB0rKg/i3otSDyOyO+zCy6Eo802U0IW9Qf2a5CWCQ9A2VNrm 8g== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p3vk1801x-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:45 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3241XfrK015499; Sat, 4 Mar 2023 01:44:44 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p3ve8g7bu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:44 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3241YZ0j016769;
 Sat, 4 Mar 2023 01:44:43 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-185-117.vpn.oracle.com
 [10.175.185.117])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p3ve8g73b-7; Sat, 04 Mar 2023 01:44:43 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 06/13] vfio/common: Consolidate skip/invalid section into
 helper
Date: Sat,  4 Mar 2023 01:43:36 +0000
Message-Id: <20230304014343.33646-7-joao.m.martins@oracle.com>
In-Reply-To: <20230304014343.33646-1-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_07,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=588 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303040011
X-Proofpoint-GUID: 7Qs5HDSzwqD9B8pC7KpQirE0cX1NkNke
X-Proofpoint-ORIG-GUID: 7Qs5HDSzwqD9B8pC7KpQirE0cX1NkNke
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
---
 hw/vfio/common.c | 52 +++++++++++++++++++-----------------------------
 1 file changed, 21 insertions(+), 31 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 80f3a1c44a01..ed908e303dbb 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -935,23 +935,14 @@ static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
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
@@ -966,6 +957,24 @@ static void vfio_listener_region_add(MemoryListener *listener,
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
 
@@ -1184,26 +1193,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
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


