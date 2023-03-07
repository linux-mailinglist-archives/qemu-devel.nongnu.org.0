Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B43196AD460
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:04 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMfj-0006ox-I9; Mon, 06 Mar 2023 21:03:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfi-0006om-58
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:22 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMfg-0004va-8C
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:21 -0500
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326NxYWS029931; Tue, 7 Mar 2023 02:03:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=GiBCAPHsWsCaxFjIYhTKruwe4Yu7rgg+z8yv2dJvMcY=;
 b=CGjtzdBMaVjzTbfIk8c3QG/jeMampZF2JU5SFshK1VDVNmMpfts8v1Ef1itluFVdcXd8
 B1Jkb0t4Y2wfrSGV0edi9vnznjXebDv/kQZ9USkfNQloImz1ZJEyDXgFGfYuao7qhhXw
 SRy1kJj8oUavfZcZEV6Y9SgoK+5u7l6kTPkXnZYTT7W6srb71V2aMQmFaaxNg5cisxr5
 RKMTZpo7FqMo27eMCDwG7I16eyKfCKqLFlVmKvc6nMyB8DW43B2cAiul72of+s54bZE5
 n2Suaiuidvq6ntglf48B4bI5WQJD3M0aR1/WNL+kpNE7jaZSZGAbV5u+hvneDlq3zlC8 2g== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p418xvfdx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:18 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 32720Oo8036910; Tue, 7 Mar 2023 02:03:16 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txdubn3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:16 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32723564016763;
 Tue, 7 Mar 2023 02:03:16 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-4; Tue, 07 Mar 2023 02:03:15 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 03/14] vfio/common: Abort migration if dirty log
 start/stop/sync fails
Date: Tue,  7 Mar 2023 02:02:47 +0000
Message-Id: <20230307020258.58215-4-joao.m.martins@oracle.com>
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
 spamscore=0 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070016
X-Proofpoint-GUID: -AK5jGLT1qYDwaMq-VrVu5avUbFwuFH_
X-Proofpoint-ORIG-GUID: -AK5jGLT1qYDwaMq-VrVu5avUbFwuFH_
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

If VFIO dirty pages log start/stop/sync fails during migration,
migration should be aborted as pages dirtied by VFIO devices might not
be reported properly.

This is not the case today, where in such scenario only an error is
printed.

Fix it by aborting migration in the above scenario.

Fixes: 758b96b61d5c ("vfio/migrate: Move switch of dirty tracking into vfio_memory_listener")
Fixes: b6dd6504e303 ("vfio: Add vfio_listener_log_sync to mark dirty pages")
Fixes: 9e7b0442f23a ("vfio: Add ioctl to get dirty pages bitmap during dma unmap")
Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 53 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 45 insertions(+), 8 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 4d26e9cccf91..4c801513136a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -42,6 +42,7 @@
 #include "migration/migration.h"
 #include "migration/misc.h"
 #include "migration/blocker.h"
+#include "migration/qemu-file.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -390,6 +391,19 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static void vfio_set_migration_error(int err)
+{
+    MigrationState *ms = migrate_get_current();
+
+    if (migration_is_setup_or_active(ms->state)) {
+        WITH_QEMU_LOCK_GUARD(&ms->qemu_file_lock) {
+            if (ms->to_dst_file) {
+                qemu_file_set_error(ms->to_dst_file, err);
+            }
+        }
+    }
+}
+
 static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
@@ -680,6 +694,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     if (iotlb->target_as != &address_space_memory) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
+        vfio_set_migration_error(-EINVAL);
         return;
     }
 
@@ -714,6 +729,7 @@ static void vfio_iommu_map_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
                          "0x%"HWADDR_PRIx") = %d (%s)",
                          container, iova,
                          iotlb->addr_mask + 1, ret, strerror(-ret));
+            vfio_set_migration_error(ret);
         }
     }
 out:
@@ -1259,7 +1275,7 @@ static void vfio_listener_region_del(MemoryListener *listener,
     }
 }
 
-static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
+static int vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
 {
     int ret;
     struct vfio_iommu_type1_dirty_bitmap dirty = {
@@ -1267,7 +1283,7 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
     };
 
     if (!container->dirty_pages_supported) {
-        return;
+        return 0;
     }
 
     if (start) {
@@ -1278,23 +1294,34 @@ static void vfio_set_dirty_page_tracking(VFIOContainer *container, bool start)
 
     ret = ioctl(container->fd, VFIO_IOMMU_DIRTY_PAGES, &dirty);
     if (ret) {
+        ret = -errno;
         error_report("Failed to set dirty tracking flag 0x%x errno: %d",
                      dirty.flags, errno);
     }
+
+    return ret;
 }
 
 static void vfio_listener_log_global_start(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
-    vfio_set_dirty_page_tracking(container, true);
+    ret = vfio_set_dirty_page_tracking(container, true);
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static void vfio_listener_log_global_stop(MemoryListener *listener)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
-    vfio_set_dirty_page_tracking(container, false);
+    ret = vfio_set_dirty_page_tracking(container, false);
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static int vfio_get_dirty_bitmap(VFIOContainer *container, uint64_t iova,
@@ -1370,19 +1397,18 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
     VFIOContainer *container = giommu->container;
     hwaddr iova = iotlb->iova + giommu->iommu_offset;
     ram_addr_t translated_addr;
+    int ret = -EINVAL;
 
     trace_vfio_iommu_map_dirty_notify(iova, iova + iotlb->addr_mask);
 
     if (iotlb->target_as != &address_space_memory) {
         error_report("Wrong target AS \"%s\", only system memory is allowed",
                      iotlb->target_as->name ? iotlb->target_as->name : "none");
-        return;
+        goto out;
     }
 
     rcu_read_lock();
     if (vfio_get_xlat_addr(iotlb, NULL, &translated_addr, NULL)) {
-        int ret;
-
         ret = vfio_get_dirty_bitmap(container, iova, iotlb->addr_mask + 1,
                                     translated_addr);
         if (ret) {
@@ -1393,6 +1419,11 @@ static void vfio_iommu_map_dirty_notify(IOMMUNotifier *n, IOMMUTLBEntry *iotlb)
         }
     }
     rcu_read_unlock();
+
+out:
+    if (ret) {
+        vfio_set_migration_error(ret);
+    }
 }
 
 static int vfio_ram_discard_get_dirty_bitmap(MemoryRegionSection *section,
@@ -1485,13 +1516,19 @@ static void vfio_listener_log_sync(MemoryListener *listener,
         MemoryRegionSection *section)
 {
     VFIOContainer *container = container_of(listener, VFIOContainer, listener);
+    int ret;
 
     if (vfio_listener_skipped_section(section)) {
         return;
     }
 
     if (vfio_devices_all_dirty_tracking(container)) {
-        vfio_sync_dirty_bitmap(container, section);
+        ret = vfio_sync_dirty_bitmap(container, section);
+        if (ret) {
+            error_report("vfio: Failed to sync dirty bitmap, err: %d (%s)", ret,
+                         strerror(-ret));
+            vfio_set_migration_error(ret);
+        }
     }
 }
 
-- 
2.17.2


