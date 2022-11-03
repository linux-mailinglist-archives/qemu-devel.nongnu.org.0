Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23061841F
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:20:53 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcxP-0006sD-1n; Thu, 03 Nov 2022 12:20:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcv0-00015O-FO; Thu, 03 Nov 2022 12:18:17 -0400
Received: from mail-bn8nam12on2050.outbound.protection.outlook.com
 ([40.107.237.50] helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcux-0008AY-UZ; Thu, 03 Nov 2022 12:18:14 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SOns+zwAw2cIAPL8koFrK5BhXIwpxHHT1yaH716s7xcTPn6JNyLPV6a8JEv9V7nwet1SUQM1DupQMJ+2Nksbh3sVjZ9MD+SMIlz6gXI/ReFJxRYBeVcElFt35SXToGQAZcYkwbyb7Wh6HlwK7JYuoUPYkFoviZoFxVPhPlhafZYgVOYzlwGifvrQy7pzAoJlFxHWkumzhRrNdVM1aB17Pjn/5E3eBCAYeFARs0lXiJdbjSBVWpKdTI5Fdbm68jdUaFi1E+OkCo0Md1L6qSrFY0atAopaJmL53sTF8o4IshHyARvOXryLeffw3mJovUHF0ipGkrq1U/eaUv3mTDLdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O2UZ9DEYNHlVw5/TWO2BqRFJRzL1v0+aRJv4nqEiOnU=;
 b=BGS+upuGVOFiAEvN25YwtunRVc0VTzHRa5cT/JHcWV6u1dC/xk1v3aBerFCAgvvkjeacnl3idX7fKBT8LzwSxomx6ww3bBEXWIqnOL0dA2aoFbZbLTCWEF+W9pFzGdInz850fq76Yl/eSYyZSmPDWihbbyE2dstxWKl+H4Nx8+6kmIIMyAD8OMSLiTbixM2oQzSXT8n3R7XgWgmT2zDsyIKas5C44XjGR7H6KPezQHgjAHMx/Vmk/kEtN6d3pzqoBd9PKIMZwQ26MQlWgCng+OxVnf01G+o+P1v6Vob4OeCxr3QqInQ8YRaXDcrEReTX27My6G+F5DzPCkX2dnoXHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O2UZ9DEYNHlVw5/TWO2BqRFJRzL1v0+aRJv4nqEiOnU=;
 b=fm8hfR1f5MNvDmGpHdF4oJcepBJuLGl4rO9kWzL5jBUeyECdXSFbRik4o14QZleuCST5iv58WYsDy0Wri8M0PLeN1w7KAXdg3Lha1DGu0w6eslncis6MCtlOIzHbTuXqOFnyzy45Ncns1MFoHDGcwOUwue75ciA/lys+ynynpr05+veykbqYIKfq7MDRMHVdsvX5hFce9MQgRDiDI1579tETIjXAnf2nLl6Pj4h1zUvIawTuZUVuR2R3gTNq1J82y4B2m77Y7gknzGb1S/T9uozfOYajquJwlDI4u0h0Jnnsprm0OAHfLF4VjIQVn8tlIvOMm996IIVQT+6+gxJJsw==
Received: from BN0PR04CA0190.namprd04.prod.outlook.com (2603:10b6:408:e9::15)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.16; Thu, 3 Nov
 2022 16:18:06 +0000
Received: from BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::42) by BN0PR04CA0190.outlook.office365.com
 (2603:10b6:408:e9::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22 via Frontend
 Transport; Thu, 3 Nov 2022 16:18:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT067.mail.protection.outlook.com (10.13.177.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:18:05 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:17:54 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:17:53 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:17:46 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Halil Pasic
 <pasic@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 Eric Farman <farman@linux.ibm.com>, Richard Henderson
 <richard.henderson@linaro.org>, David Hildenbrand <david@redhat.com>, "Ilya
 Leoshkevich" <iii@linux.ibm.com>, Thomas Huth <thuth@redhat.com>, "Juan
 Quintela" <quintela@redhat.com>, "Dr. David Alan Gilbert"
 <dgilbert@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck
 <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, Stefan Hajnoczi
 <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>, Eric Blake
 <eblake@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, John Snow <jsnow@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 11/17] vfio/migration: Rename functions/structs related to
 v1 protocol
Date: Thu, 3 Nov 2022 18:16:14 +0200
Message-ID: <20221103161620.13120-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT067:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b8347bb-acfa-43ea-a536-08dabdb6fd8b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cYzXhJxgRhMkOTulUqfzMCUGMGSqmnqiA6kW5X1CuxcXweMxuhxIzP3DbWqxsZQF9QB3G/nlKyXHKJXGMnWerRgPfi/oGeCIbXMrLvJcPQseot+ykN1y/TjTcv5rHs0X2r5+NuVTrtNR/HFvvKDdOWBmZ4gwTJ3Oi7UqlQC7FdNVDuAB3eulq1kLS698aehxyPUCqpwcuMdY7PHElSHMS2ZYpWa/74UmEBQFbVBo2DT+5XiU/ulKXsBZxE+B/0A47iHd8gN50lw0NtpK2kQw+hnrmaEiX24ezwF5qVYnzqP56PIDaJp8KYwMLoW4kmdWu6VsmC2KVXsNmxM155Pjf0dXRx3QKopf3oWL5IbApANcvljNCufQt+HI2/j+4nq/LdqBv1BVYYOYm8n42Izl0tCxcf/C+wc5vVoG89xhp6Gnt/dc5NT7bZ0r9DxpvThtfvLIhOeV8m/0KAToukXWGIk2J2BBY1WgHATeofOwBCA6+ReHGXMijjPniANUKPlKArHjpyAFzK4/QFlJ0q6NszTaS7V3XwxrtR+l5XsOYal3O8yMSGbNU4o3ZzMxtSsJUodZKM3lFaXtRomNUyiOuetWjDaTJktDnvD4nkUGfjjanjpcIzF4qRbKtR45nCC27qNhWy6BmMWL9DPN5PfbGOZ+LtSuNR547zssyGFinm7ix049Lr8voY5w5Yl26KsRm/BKv5IjxUm5cZavv4RwhggrKi5f9GrnJwIRY8ERTCxSHVVmylloLbjKRnuRtKjfrfn/zG/ye5v+RdhH0xXz/Q==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(136003)(396003)(39860400002)(346002)(451199015)(46966006)(40470700004)(36840700001)(8936002)(6916009)(8676002)(83380400001)(6666004)(40460700003)(186003)(36756003)(70586007)(30864003)(70206006)(316002)(5660300002)(4326008)(41300700001)(2906002)(336012)(2616005)(40480700001)(7636003)(7696005)(36860700001)(356005)(1076003)(47076005)(7416002)(82740400003)(478600001)(82310400005)(86362001)(54906003)(426003)(26005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:18:05.9800 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b8347bb-acfa-43ea-a536-08dabdb6fd8b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT067.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
Received-SPF: softfail client-ip=40.107.237.50;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

To avoid name collisions, rename functions and structs related to VFIO
migration protocol v1. This will allow the two protocols to co-exist
when v2 protocol is added, until v1 is removed. No functional changes
intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c              |  6 +--
 hw/vfio/migration.c           | 94 +++++++++++++++++------------------
 hw/vfio/trace-events          |  6 +--
 include/hw/vfio/vfio-common.h |  2 +-
 4 files changed, 54 insertions(+), 54 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 47116ba668..617e6cd901 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,8 +355,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
         }
@@ -385,7 +385,7 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
+            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 0e3a950746..e784374453 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -107,8 +107,8 @@ static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
  * an error is returned.
  */
 
-static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                    uint32_t value)
+static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
+                                       uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -145,8 +145,8 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
         return ret;
     }
 
-    migration->device_state = device_state;
-    trace_vfio_migration_set_state(vbasedev->name, device_state);
+    migration->device_state_v1 = device_state;
+    trace_vfio_migration_v1_set_state(vbasedev->name, device_state);
     return 0;
 }
 
@@ -260,8 +260,8 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
-static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
-                            uint64_t data_size)
+static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                               uint64_t data_size)
 {
     VFIORegion *region = &vbasedev->migration->region;
     uint64_t data_offset = 0, size, report_size;
@@ -288,7 +288,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             data_size = 0;
         }
 
-        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
+        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
 
         while (size) {
             void *buf;
@@ -394,7 +394,7 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static void vfio_migration_cleanup(VFIODevice *vbasedev)
+static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
@@ -405,7 +405,7 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
-static int vfio_save_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -431,8 +431,8 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
+                                      VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state SAVING", vbasedev->name);
         return ret;
@@ -448,16 +448,16 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void vfio_save_cleanup(void *opaque)
+static void vfio_v1_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
-    vfio_migration_cleanup(vbasedev);
+    vfio_migration_v1_cleanup(vbasedev);
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(void *opaque,  uint64_t threshold_size,
-                              uint64_t *res_precopy, uint64_t *res_postcopy)
+static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
+                                 uint64_t *res_precopy, uint64_t *res_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -520,15 +520,15 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
+static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
     uint64_t data_size;
     int ret;
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
+                                      VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state STOP and SAVING",
                      vbasedev->name);
@@ -565,7 +565,8 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
+                                      0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
@@ -588,7 +589,7 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
-static int vfio_load_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -604,8 +605,8 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_RESUMING);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
+                                      VFIO_DEVICE_STATE_V1_RESUMING);
     if (ret) {
         error_report("%s: Failed to set state RESUMING", vbasedev->name);
         if (migration->region.mmaps) {
@@ -615,11 +616,11 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
     return ret;
 }
 
-static int vfio_load_cleanup(void *opaque)
+static int vfio_v1_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
-    vfio_migration_cleanup(vbasedev);
+    vfio_migration_v1_cleanup(vbasedev);
     trace_vfio_load_cleanup(vbasedev->name);
     return 0;
 }
@@ -657,7 +658,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                ret = vfio_load_buffer(f, vbasedev, data_size);
+                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
                 if (ret < 0) {
                     return ret;
                 }
@@ -678,21 +679,21 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
-static SaveVMHandlers savevm_vfio_handlers = {
-    .save_setup = vfio_save_setup,
-    .save_cleanup = vfio_save_cleanup,
-    .save_live_pending = vfio_save_pending,
+static SaveVMHandlers savevm_vfio_v1_handlers = {
+    .save_setup = vfio_v1_save_setup,
+    .save_cleanup = vfio_v1_save_cleanup,
+    .save_live_pending = vfio_v1_save_pending,
     .save_live_iterate = vfio_save_iterate,
-    .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
     .save_state = vfio_save_state,
-    .load_setup = vfio_load_setup,
-    .load_cleanup = vfio_load_cleanup,
+    .load_setup = vfio_v1_load_setup,
+    .load_cleanup = vfio_v1_load_cleanup,
     .load_state = vfio_load_state,
 };
 
 /* ---------------------------------------------------------------------- */
 
-static void vfio_vmstate_change(void *opaque, bool running, RunState state)
+static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -732,21 +733,21 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, mask, value);
+    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
     if (ret) {
         /*
          * Migration should be aborted in this case, but vm_state_notify()
          * currently does not support reporting failures.
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state & mask) | value);
+                     (migration->device_state_v1 & mask) | value);
         if (migrate_get_current()->to_dst_file) {
             qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         }
     }
     vbasedev->migration->vm_running = running;
-    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-            (migration->device_state & mask) | value);
+    trace_vfio_v1_vmstate_change(vbasedev->name, running, RunState_str(state),
+            (migration->device_state_v1 & mask) | value);
 }
 
 static void vfio_migration_state_notifier(Notifier *notifier, void *data)
@@ -765,10 +766,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state(vbasedev,
-                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                         VFIO_DEVICE_STATE_V1_RESUMING),
-                                       VFIO_DEVICE_STATE_V1_RUNNING);
+        ret = vfio_migration_v1_set_state(vbasedev,
+                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                            VFIO_DEVICE_STATE_V1_RESUMING),
+                                          VFIO_DEVICE_STATE_V1_RUNNING);
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
@@ -812,7 +813,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
+    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
@@ -843,12 +844,11 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
-                         vbasedev);
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                         &savevm_vfio_v1_handlers, vbasedev);
 
-    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
-                                                           vfio_vmstate_change,
-                                                           vbasedev);
+    migration->vm_state = qdev_add_vm_change_state_handler(
+        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
     return 0;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 27c059f96e..d88d2b4053 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,8 +149,8 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(const char *name) " (%s)"
-vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
-vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
+vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
+vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
 vfio_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
@@ -162,7 +162,7 @@ vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
 vfio_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f1..bbaf72ba00 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -62,7 +62,7 @@ typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
     VFIORegion region;
-    uint32_t device_state;
+    uint32_t device_state_v1;
     int vm_running;
     Notifier migration_state;
     uint64_t pending_bytes;
-- 
2.21.3


