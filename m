Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E2CA6AA767
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Mar 2023 02:46:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYGxZ-00073l-0I; Fri, 03 Mar 2023 20:45:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGxK-00073S-00
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:45:02 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pYGxI-0005ok-5F
 for qemu-devel@nongnu.org; Fri, 03 Mar 2023 20:45:01 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3241hZTM015303; Sat, 4 Mar 2023 01:44:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=2kCOGSsmi6n+f+mtgQt/sYjswS65xZxOKhkRqpF7wL8=;
 b=ZeqciY0pKVCGUr1eoo8fG4KsFgrFggFu3CfDfHuClfXpp7Jvor38FupaI/yj1ITyXitY
 6O9hEUNTvJcEiyX2/FErsR11ViVe9s/DDcqfaZnPc+SgNmVh6MSAFgG/hC6YB4CO0o26
 +5xCWVwdg5YAtKhbRstPapYfR9LJyd9pCOu9WTI9Tam6v6jbyrv6YxNqrjpEt3kJSnzo
 FKKLd8+/TGwcRzhdKjeWPAWGiShFnozBcw3IxwAtHdj32ncb+E1NUSKHvFKVi8VxjhgL
 oywskgHHain+MIBSQjw+BA5LQglRd5whJe/2gn6GQeHSq59AX/qJXY7Fgml8CVqPhxmo Dg== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p3vk18025-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:58 +0000
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3241Y8pj015769; Sat, 4 Mar 2023 01:44:57 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p3ve8g7gg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Sat, 04 Mar 2023 01:44:57 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3241YZ0t016769;
 Sat, 4 Mar 2023 01:44:56 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-185-117.vpn.oracle.com
 [10.175.185.117])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p3ve8g73b-12; Sat, 04 Mar 2023 01:44:56 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 11/13] vfio/migration: Block migration with vIOMMU
Date: Sat,  4 Mar 2023 01:43:41 +0000
Message-Id: <20230304014343.33646-12-joao.m.martins@oracle.com>
In-Reply-To: <20230304014343.33646-1-joao.m.martins@oracle.com>
References: <20230304014343.33646-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-03_07,2023-03-03_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 bulkscore=0 suspectscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=632 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303040011
X-Proofpoint-GUID: VbGDZxCXmTHJSzfDKVJPtm4nJdggh5kT
X-Proofpoint-ORIG-GUID: VbGDZxCXmTHJSzfDKVJPtm4nJdggh5kT
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

Migrating with vIOMMU will require either tracking maximum
IOMMU supported address space (e.g. 39/48 address width on Intel)
or range-track current mappings and dirty track the new ones
post starting dirty tracking. This will be done as a separate
series, so add a live migration blocker until that is fixed.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
---
 hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |  6 +++++
 include/hw/vfio/vfio-common.h |  2 ++
 3 files changed, 59 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 5b8456975e97..9b909f856722 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -365,6 +365,7 @@ bool vfio_mig_active(void)
 }
 
 static Error *multiple_devices_migration_blocker;
+static Error *giommu_migration_blocker;
 
 static unsigned int vfio_migratable_device_num(void)
 {
@@ -416,6 +417,56 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static unsigned int vfio_use_iommu_device_num(void)
+{
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+    unsigned int device_num = 0;
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->group->container->space->as !=
+                                    &address_space_memory) {
+                device_num++;
+            }
+        }
+    }
+
+    return device_num;
+}
+
+int vfio_block_giommu_migration(Error **errp)
+{
+    int ret;
+
+    if (giommu_migration_blocker ||
+        !vfio_use_iommu_device_num()) {
+        return 0;
+    }
+
+    error_setg(&giommu_migration_blocker,
+               "Migration is currently not supported with vIOMMU enabled");
+    ret = migrate_add_blocker(giommu_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(giommu_migration_blocker);
+        giommu_migration_blocker = NULL;
+    }
+
+    return ret;
+}
+
+void vfio_unblock_giommu_migration(void)
+{
+    if (!giommu_migration_blocker ||
+        vfio_use_iommu_device_num()) {
+        return;
+    }
+
+    migrate_del_blocker(giommu_migration_blocker);
+    error_free(giommu_migration_blocker);
+    giommu_migration_blocker = NULL;
+}
+
 static void vfio_set_migration_error(int err)
 {
     MigrationState *ms = migrate_get_current();
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a2c3d9bade7f..3e75868ae7a9 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -634,6 +634,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         return ret;
     }
 
+    ret = vfio_block_giommu_migration(errp);
+    if (ret) {
+        return ret;
+    }
+
     trace_vfio_migration_probe(vbasedev->name);
     return 0;
 
@@ -659,6 +664,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
         vfio_unblock_multiple_devices_migration();
+        vfio_unblock_giommu_migration();
     }
 
     if (vbasedev->migration_blocker) {
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 1cbbccd91e11..38e44258925b 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -233,6 +233,8 @@ extern VFIOGroupList vfio_group_list;
 bool vfio_mig_active(void);
 int vfio_block_multiple_devices_migration(Error **errp);
 void vfio_unblock_multiple_devices_migration(void);
+int vfio_block_giommu_migration(Error **errp);
+void vfio_unblock_giommu_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX
-- 
2.17.2


