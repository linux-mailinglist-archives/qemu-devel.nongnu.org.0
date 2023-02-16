Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1948C699790
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:37:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfOB-0005Af-2y; Thu, 16 Feb 2023 09:37:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfO8-00058X-UW
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:32 -0500
Received: from mail-dm6nam10on20626.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::626]
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfO6-0004r4-9E
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rw1unwfEe+s6nDz5WXE51c69aXEp8dE/YGGIaJj/m1eLG5wNm3jwEOoEKaTOIfm9Cn1QKyodlCETy/HhndrM3ECnVNy7Y4ovgBiM5Lp+Hqz+RQRoy5gXFoOgTTNZ17tPh7pTMEC0EWJjV/2upBheBMwy26xKomU86fdDsp9G7tDAK41a8bxfR0Xar+bZmjk6xYzg2bgR3WbiIUglVTWcHq5ICY/6lzEwtn5saKKahVtwPiLzju3J/htUQ9su1not1iMZrNqzBzNTG3iIO0eD6HPS3yTTr/Q/LlZkbJQfHLDt782YGFpSaeI3IovTtkkdcE0M8592xtPpXOlWG2hyKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IRwSme5PlUkzXnsi9vtXkU9hSZCMG0pUbjYHeyyUymA=;
 b=k2LmpJoYFO5fmHBrSiydKfujvT0m1CwoW5hRbjaWqY8B9SR5/pb470fiTTQawKLWc8f2GJFGuq+RQAXPICnpbUB5/imPzQEJxzrxuYsQf0uxDPc4rmfkJne04lINiHLk6YQGL2MTEwJ1Vc0/p3lHM8ltf5ITAGNLqAjkhXPF5KMrvmiffHW6JvplAOSKXEf2XTr0UELI4PzgSXQ5A33AckVUGSO74XEDsoqcrDirICM6u25rEEiygdOhMK7LlHK+nn2LHamibXcvs1hOVS8A8i/X6ENqQqNnr33XPAiUStEbe7N1dJyW84kiHPN5gb3IiAk/vpoEWraFj22muqZLlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IRwSme5PlUkzXnsi9vtXkU9hSZCMG0pUbjYHeyyUymA=;
 b=R2VVFvkVceyQDEu1QSbBR0GVmgv9aQPZECHe1VMyAis29h27yvsbC82jgYjmq576WD/YG/iWScp9Rtwnwueda3HlWqe/KXdMpYN16P4j3jf0owqrcqN09FtO8N9HCRKqUB96JFEMwaogEcSvVxYILN2Wxv7nihboubbap8/KFG7Be0swQvU8NumR4Igi2BMhXLarCpLVpygHqaGAZL8sPoRoE8aMLGKrosk7tt71x1Kua7/8ecA8aYWlAtzTIxM2Fazs46uHJXL0QWVvEgwhFN/chUXDbrTM+gVX9SL6fJucUJBNwVd88Sj+H0Tgta1vcKXmlju3TZzoGSTVR771eg==
Received: from BN9PR03CA0415.namprd03.prod.outlook.com (2603:10b6:408:111::30)
 by PH7PR12MB6834.namprd12.prod.outlook.com (2603:10b6:510:1b4::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:37:22 +0000
Received: from BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:111:cafe::70) by BN9PR03CA0415.outlook.office365.com
 (2603:10b6:408:111::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.27 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN8NAM11FT094.mail.protection.outlook.com (10.13.176.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:37:21 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:38:02 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:09 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:37:04 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Cornelia Huck <cohuck@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Vladimir Sementsov-Ogievskiy
 <vsementsov@yandex-team.ru>, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?=
 <clg@redhat.com>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v11 07/11] vfio/migration: Rename functions/structs related to
 v1 protocol
Date: Thu, 16 Feb 2023 16:36:26 +0200
Message-ID: <20230216143630.25610-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT094:EE_|PH7PR12MB6834:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d4a66f3-ed54-41a9-58bc-08db102b5039
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EWCunlXLnDRpV6GtyuT4kztV1d1CrbTycGKLCWiGtgxeMt40zSV0xms3u5n8O/W2SMd20svkgdxI3pFbIJEjyTBWOxyR2vRulu2P5SHrTo/t07g2+HaKFD4P1RXlMLS4O32Aayvs808R3dxxB3H2nHhspj1/YkqsqtAkZ23rvoe8Vl5v4AOrEXObnu8dHDBStieC8hr3O4E9CtdBL96uC6PwrtxI/+Pr4L8KXlcvsxWbqHZzsjzp53kncR6RNZFaERNfObnSqNlOWqhSoiA1lVP2OU50z4ilXNZzYDSQI3cR4xYoXy8yA7EQrw+eOqE2N7I+iVbpP6JBA912zQVYAH7m5iRIAxTJDwsekQBwDTFHnWHFGWBDISd2ZE/jM06KfgqNPsk3uZm+5dETgPWplpvkjPYnw56lQm0CtiKQ8un8+MMxb+LVpH6dw5+n00kTl5Bwgwd3fTawtCT1pxPkZuhljxOCfBgWDlg3+pSCrbvEjRW6dsQ0Ofe3S7wZwPMD833YT2+hjGZpzqxR6PbboFPywr1Hq+DZ0DHrTpZzne/1+cKRmsrKDwlAzjIRa3uDrwHIS0tnZpGIDUwSNsavyeHr+g/5KVf21WelLX+2wVquJiSeLbU+Ro8jLY8TjvVlSgSadokbWQkacQFDS077a5yNhl9hj3k2PdAWM0tNhriXFkmZPBhf0Wyb7TVhgB6gieM5NHGvNryEhzsMkLWsAg==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199018)(36840700001)(46966006)(40470700004)(7636003)(36860700001)(82740400003)(5660300002)(7416002)(8936002)(30864003)(356005)(41300700001)(478600001)(36756003)(186003)(6666004)(86362001)(2616005)(1076003)(40480700001)(8676002)(26005)(82310400005)(2906002)(70206006)(316002)(6916009)(4326008)(7696005)(40460700003)(66574015)(54906003)(83380400001)(70586007)(426003)(336012)(47076005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:21.6599 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d4a66f3-ed54-41a9-58bc-08db102b5039
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6834
Received-SPF: softfail client-ip=2a01:111:f400:7e88::626;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

To avoid name collisions, rename functions and structs related to VFIO
migration protocol v1. This will allow the two protocols to co-exist
when v2 protocol is added, until v1 is removed. No functional changes
intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/vfio/vfio-common.h |   2 +-
 hw/vfio/common.c              |   6 +-
 hw/vfio/migration.c           | 102 +++++++++++++++++-----------------
 hw/vfio/trace-events          |  12 ++--
 4 files changed, 61 insertions(+), 61 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 56b1683824..2c0fb1d622 100644
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
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index fe80ccf914..1c974e9c5a 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -408,8 +408,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
         }
@@ -438,7 +438,7 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
+            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a3bf7327a1..a5fe285721 100644
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
 
@@ -405,13 +405,13 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
-static int vfio_save_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
     int ret;
 
-    trace_vfio_save_setup(vbasedev->name);
+    trace_vfio_v1_save_setup(vbasedev->name);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
 
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
 
-static void vfio_state_pending(void *opaque, uint64_t *must_precopy,
-                               uint64_t *can_postcopy)
+static void vfio_v1_state_pending(void *opaque, uint64_t *must_precopy,
+                                  uint64_t *can_postcopy)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -470,7 +470,7 @@ static void vfio_state_pending(void *opaque, uint64_t *must_precopy,
 
     *must_precopy += migration->pending_bytes;
 
-    trace_vfio_state_pending(vbasedev->name, *must_precopy, *can_postcopy);
+    trace_vfio_v1_state_pending(vbasedev->name, *must_precopy, *can_postcopy);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
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
@@ -565,13 +565,14 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
+                                      0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
     }
 
-    trace_vfio_save_complete_precopy(vbasedev->name);
+    trace_vfio_v1_save_complete_precopy(vbasedev->name);
     return ret;
 }
 
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
@@ -678,22 +679,22 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
-static SaveVMHandlers savevm_vfio_handlers = {
-    .save_setup = vfio_save_setup,
-    .save_cleanup = vfio_save_cleanup,
-    .state_pending_exact = vfio_state_pending,
-    .state_pending_estimate = vfio_state_pending,
+static SaveVMHandlers savevm_vfio_v1_handlers = {
+    .save_setup = vfio_v1_save_setup,
+    .save_cleanup = vfio_v1_save_cleanup,
+    .state_pending_exact = vfio_v1_state_pending,
+    .state_pending_estimate = vfio_v1_state_pending,
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
@@ -733,21 +734,21 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
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
@@ -766,10 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
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
@@ -813,7 +814,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
+    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
@@ -844,12 +845,11 @@ static int vfio_migration_init(VFIODevice *vbasedev)
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
index 6be5381cc9..c8739449df 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,20 +149,20 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(const char *name) " (%s)"
-vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
-vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
+vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
+vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-vfio_save_setup(const char *name) " (%s)"
+vfio_v1_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_state_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
+vfio_v1_state_pending(const char *name, uint64_t precopy, uint64_t postcopy) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
-vfio_save_complete_precopy(const char *name) " (%s)"
+vfio_v1_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-- 
2.26.3


