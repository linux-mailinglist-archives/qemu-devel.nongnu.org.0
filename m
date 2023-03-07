Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61D116ADF4F
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:57:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWr8-0005PT-SX; Tue, 07 Mar 2023 07:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWr6-0005PC-Bh
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:48 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWr4-00054e-Ny
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:55:48 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 32783owq016269; Tue, 7 Mar 2023 12:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=CtqlGVtMx510pMC0NN3oX37+wpQ2ZhL2IJt/65UoMNo=;
 b=dSDDCjugfGC9mTiSY+N24eBVxJe41i5rbprxlruIRWKMyjHkMP9BUuNdKz3WdpqKoYGo
 sl7xtVWBcnPgs7P4wnYk7eCVkLkspECUTak3ZpDhOGiExp2JgHyFTG+5sp5qtySZ3Aee
 olbNXokOW3pHwdVaYz7l/WMfykK9ABQTKzyIc5uUNBoIkMFjdITaTgrmsN607az0/WsN
 DP04mKLM5jhzDHPv0QzYjp2ACTLfQbw/j8HpoX6dME66nuU/i12WPrsL8onI6SSfO2LJ
 owha1bJcW0dVbP1xu4gxVjpELNi8eQQ83FBls2f8S2z87kvWOMw27GvgnJKl8E8FksHO vg== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cdct3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:45 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CSl2e028489; Tue, 7 Mar 2023 12:55:45 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyer6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:55:45 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV59004358;
 Tue, 7 Mar 2023 12:55:44 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-6; Tue, 07 Mar 2023 12:55:44 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 05/15] vfio/common: Add helper to validate iova/end against
 hostwin
Date: Tue,  7 Mar 2023 12:54:40 +0000
Message-Id: <20230307125450.62409-6-joao.m.martins@oracle.com>
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
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=774 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: Ga7Yt4DaHLEBv4wETyF7YJq1ZiBqnfQc
X-Proofpoint-ORIG-GUID: Ga7Yt4DaHLEBv4wETyF7YJq1ZiBqnfQc
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

Move the code that finds the container host DMA window against a iova
range. This avoids duplication on the common checks across listener
callbacks.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c | 38 ++++++++++++++++++++------------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index cec3de08d2b4..99acb998eb14 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -901,6 +901,22 @@ static void vfio_unregister_ram_discard_listener(VFIOContainer *container,
     g_free(vrdl);
 }
 
+static VFIOHostDMAWindow *vfio_find_hostwin(VFIOContainer *container,
+                                            hwaddr iova, hwaddr end)
+{
+    VFIOHostDMAWindow *hostwin;
+    bool hostwin_found = false;
+
+    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
+        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
+            hostwin_found = true;
+            break;
+        }
+    }
+
+    return hostwin_found ? hostwin : NULL;
+}
+
 static bool vfio_known_safe_misalignment(MemoryRegionSection *section)
 {
     MemoryRegion *mr = section->mr;
@@ -926,7 +942,6 @@ static void vfio_listener_region_add(MemoryListener *listener,
     void *vaddr;
     int ret;
     VFIOHostDMAWindow *hostwin;
-    bool hostwin_found;
     Error *err = NULL;
 
     if (vfio_listener_skipped_section(section)) {
@@ -1027,15 +1042,8 @@ static void vfio_listener_region_add(MemoryListener *listener,
 #endif
     }
 
-    hostwin_found = false;
-    QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-        if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
-            hostwin_found = true;
-            break;
-        }
-    }
-
-    if (!hostwin_found) {
+    hostwin = vfio_find_hostwin(container, iova, end);
+    if (!hostwin) {
         error_setg(&err, "Container %p can't map guest IOVA region"
                    " 0x%"HWADDR_PRIx"..0x%"HWADDR_PRIx, container, iova, end);
         goto fail;
@@ -1237,15 +1245,9 @@ static void vfio_listener_region_del(MemoryListener *listener,
     if (memory_region_is_ram_device(section->mr)) {
         hwaddr pgmask;
         VFIOHostDMAWindow *hostwin;
-        bool hostwin_found = false;
 
-        QLIST_FOREACH(hostwin, &container->hostwin_list, hostwin_next) {
-            if (hostwin->min_iova <= iova && end <= hostwin->max_iova) {
-                hostwin_found = true;
-                break;
-            }
-        }
-        assert(hostwin_found); /* or region_add() would have failed */
+        hostwin = vfio_find_hostwin(container, iova, end);
+        assert(hostwin); /* or region_add() would have failed */
 
         pgmask = (1ULL << ctz64(hostwin->iova_pgsizes)) - 1;
         try_unmap = !((iova & pgmask) || (int128_get64(llsize) & pgmask));
-- 
2.17.2


