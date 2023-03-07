Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D83DA6AD46A
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 03:05:39 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZMgI-00073W-BW; Mon, 06 Mar 2023 21:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMgG-00072U-2t
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:56 -0500
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <joao.m.martins@oracle.com>)
 id 1pZMgE-0004xf-9i
 for qemu-devel@nongnu.org; Mon, 06 Mar 2023 21:03:55 -0500
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 326Nxj4e027798; Tue, 7 Mar 2023 02:03:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=corp-2022-7-12;
 bh=3TlfzMmU33d/mrhyVXNtB875Mp25T+mC21R+9zGUXoU=;
 b=rDFPqGgEGIm0E1qjjKqhBNWYHXkej6ajOy1O/9uJUAEr7qlUyaTyq8EcXPDJQdbK/0rg
 4tgvuPhbX3FCPIh4AosUdZTewieiQuhFO81SBgBLKZaIPOw7+nu/4HzbpVNNEaAqYQ+Y
 z4Uv7jwNIj0oppw6O+MlPoFg0CJpnKQSYV82Oj5K5TGvQlVfgOQk5cVW0CO2b/aAfKOw
 +9usG/nuxMlY3x4T5axU3KaTLxV4O/v6MHfrDWOHwfWzeahqYhV0WPwmOzJQfUsJTofa
 4DzHaSej9+8ctei9tusslcEoE85vAkGzr3U6jTi21lBFOMIe0CHdVex7ETm0whcXqVry Gw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3p5nn90s1n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:50 +0000
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5)
 with ESMTP id 3271P09Q037278; Tue, 7 Mar 2023 02:03:49 GMT
Received: from pps.reinject (localhost [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 3p4txduc43-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 07 Mar 2023 02:03:49 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3272356M016763;
 Tue, 7 Mar 2023 02:03:49 GMT
Received: from joaomart-mac.uk.oracle.com (dhcp-10-175-187-101.vpn.oracle.com
 [10.175.187.101])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id
 3p4txdubf4-13; Tue, 07 Mar 2023 02:03:48 +0000
From: Joao Martins <joao.m.martins@oracle.com>
To: qemu-devel@nongnu.org
Cc: Alex Williamson <alex.williamson@redhat.com>,
 Cedric Le Goater <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>,
 Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>,
 Tarun Gupta <targupta@nvidia.com>, Avihai Horon <avihaih@nvidia.com>,
 Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 12/14] vfio/migration: Block migration with vIOMMU
Date: Tue,  7 Mar 2023 02:02:56 +0000
Message-Id: <20230307020258.58215-13-joao.m.martins@oracle.com>
In-Reply-To: <20230307020258.58215-1-joao.m.martins@oracle.com>
References: <20230307020258.58215-1-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-06_14,2023-03-06_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=703 phishscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2303070017
X-Proofpoint-GUID: toorQ8hM9mOlmWC2h7143Pj-5oHVW3oN
X-Proofpoint-ORIG-GUID: toorQ8hM9mOlmWC2h7143Pj-5oHVW3oN
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
 hw/vfio/common.c              | 46 +++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |  5 ++++
 hw/vfio/pci.c                 |  1 +
 include/hw/vfio/vfio-common.h |  2 ++
 4 files changed, 54 insertions(+)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 75b4902bbcc9..7278baa82f7d 100644
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
index 7817ca7d8706..63f93ab54811 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -235,6 +235,8 @@ extern VFIOGroupList vfio_group_list;
 bool vfio_mig_active(void);
 int vfio_block_multiple_devices_migration(Error **errp);
 void vfio_unblock_multiple_devices_migration(void);
+int vfio_block_giommu_migration(Error **errp);
+void vfio_unblock_giommu_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX
-- 
2.17.2


