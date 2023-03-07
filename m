Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FC916ADF43
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 13:56:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZWrY-0006JQ-3G; Tue, 07 Mar 2023 07:56:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrR-0006Ht-Q9
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:56:10 -0500
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZWrQ-00057a-3S
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 07:56:09 -0500
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 327846pG017250; Tue, 7 Mar 2023 12:56:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2022-7-12;
 bh=KN/Dww0mMuy9Ttz9jfjlfG5UfB60DZEob8ekqMpxEvU=;
 b=ql7xbu3HBNjVHNAT/+zBjfKgQgHTS1NfoQCWFD7upEUZiBaL31S2p0QXzssboGfBeXZE
 M29vuND7RZY9UnuDY8b8EHWrj+sdBp9zaxEQTAwFTilJPYMuBW3lBQAWKswLYx2nNBBl
 iZM8tuhFxPkoT87QaJoxvm2Gx0Ok7gmUjk29MZYrwSXvSNupVRMbcIXunIx9L+v3pV2o
 ZoeBfycNd22KzwkrAx7DZ+BSdtaMCrZjctKAY1zFZ95RO/g4mdpJ9UnWWn5g+wSF5qkH
 U57wp4VkRFsguRXPUDlTPfScxLO/ZQThSq0da251saA6hmqx+j9mmuKQW8UwIIFZzB53 jA== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p417cdctr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:56:07 +0000
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 327CTx97026623; Tue, 7 Mar 2023 12:56:06 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4u1eyf3r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 12:56:06 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 327CtV5P004358;
 Tue, 7 Mar 2023 12:56:05 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-196-64.vpn.oracle.com
 [10.175.196.64])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id
 3p4u1eyefv-14; Tue, 07 Mar 2023 12:56:05 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v5 13/15] vfio/migration: Block migration with vIOMMU
Date: Tue,  7 Mar 2023 12:54:48 +0000
Message-Id: <20230307125450.62409-14-joao.m.martins@oracle.com>
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
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=703 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070117
X-Proofpoint-GUID: H4uRhhZyuCUfj0a4NeivcBYndsA3lODc
X-Proofpoint-ORIG-GUID: H4uRhhZyuCUfj0a4NeivcBYndsA3lODc
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

Migrating with vIOMMU will require either tracking maximum
IOMMU supported address space (e.g. 39/48 address width on Intel)
or range-track current mappings and dirty track the new ones
post starting dirty tracking. This will be done as a separate
series, so add a live migration blocker until that is fixed.

Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c              | 46 +++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |  5 ++++
 hw/vfio/pci.c                 |  1 +
 include/hw/vfio/vfio-common.h |  2 ++
 4 files changed, 54 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 2639b393a781..2b9bcf70aa36 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -362,6 +362,7 @@ bool vfio_mig_active(void)
 }
 
 static Error *multiple_devices_migration_blocker;
+static Error *giommu_migration_blocker;
 
 static unsigned int vfio_migratable_device_num(void)
 {
@@ -413,6 +414,51 @@ void vfio_unblock_multiple_devices_migration(void)
     multiple_devices_migration_blocker = NULL;
 }
 
+static bool vfio_viommu_preset(void)
+{
+    VFIOAddressSpace *space;
+
+    QLIST_FOREACH(space, &vfio_address_spaces, list) {
+        if (space->as != &address_space_memory) {
+            return true;
+        }
+    }
+
+    return false;
+}
+
+int vfio_block_giommu_migration(Error **errp)
+{
+    int ret;
+
+    if (giommu_migration_blocker ||
+        !vfio_viommu_preset()) {
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
+        vfio_viommu_preset()) {
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
index a2c3d9bade7f..776fd2d7cdf3 100644
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
 
diff --git a/hw/vfio/pci.c b/hw/vfio/pci.c
index 939dcc3d4a9e..30a271eab38c 100644
--- a/hw/vfio/pci.c
+++ b/hw/vfio/pci.c
@@ -3185,6 +3185,7 @@ static void vfio_instance_finalize(Object *obj)
      */
     vfio_put_device(vdev);
     vfio_put_group(group);
+    vfio_unblock_giommu_migration();
 }
 
 static void vfio_exitfn(PCIDevice *pdev)
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 9551d2d43025..009bec34c4bc 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -222,6 +222,8 @@ extern VFIOGroupList vfio_group_list;
 bool vfio_mig_active(void);
 int vfio_block_multiple_devices_migration(Error **errp);
 void vfio_unblock_multiple_devices_migration(void);
+int vfio_block_giommu_migration(Error **errp);
+void vfio_unblock_giommu_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX
-- 
2.17.2


