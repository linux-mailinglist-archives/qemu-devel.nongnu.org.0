Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4683A699793
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:38:02 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfNw-00045b-FD; Thu, 16 Feb 2023 09:37:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNu-00044g-AV
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:18 -0500
Received: from mail-bn7nam10on20629.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::629]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNs-0004oy-F3
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Jbx/KtwFTKjraqMMRUQddLrZyHqu53ls0SecUU5glT3ygJB7z1wjiuRrDq7XSKq9NR2711SbHOdqDlvztx53y1AHWwhfaQYpD58Kb+jdJMiE58d+/hvSGc6ZtYguV1byykgZzdfzLwP5pmRc0zyNBuJFd7LESCR4CJtCEpYBbxz4hQbLmS6AmgBp+SGFdFyCH0cVkxoulrk4jkG5FPRz7GU2CfhLQvaHpD0ddJQiGte59QEYRiv7YZlS+kGQvc8Hg+VcDLq/jEd8ez+/KIlg7W2YfnE4ZnJmnfDvYcvIhqorOc+FaSMWW54HUQa00+qoCycJ01O/M6AH8QroGaalRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=50f0hwtwjGCzy6Zh64+XdmuOguhu2uI95YfAW3Jlh0A=;
 b=O+iQM4WVxz2JC/ApVB1uZUlBE1FT6nZjMbWMV7QxcUIzet4vpS6lQ4tyzQJw50vfkP2ePdyZU43E65QPXnWZAfmhxoNKR9M0UBt40P786n21SrD9CNRRnjqL1mPBO+QPcBQBKfp5If6/G9oOJeQgKTWBRaZuR8Rtbf3KKqrh4JLQSdzpShIr5G1pzqv/CwWNTw4PuqoU38IlV7vy0qEBJv0EvCZEHwdoJcacN3OOwyNxgvZnCATWCFTKXHdssU5Ym4wljQsblDLM3lUpXJKkYobixWnW7y9sWSaYVve8Di4hYeGer78Dn5IyF83HrwqCrLIsgnDBu5BMltyzvdNwmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=50f0hwtwjGCzy6Zh64+XdmuOguhu2uI95YfAW3Jlh0A=;
 b=hwDns4Pdk+0OElA2/SUlvFAJLY5TU4InkaVuJ3L3i03yb6jApVqu2bbdXGxiFr59H5mgXFY6lu45YR4Np1xqVXcJ5jpQqMrmxLmcrPitHJsKYAXyoE2w2/fAXWvxJxkgsioMuHzGcZYa0cxEQKaWpBXiJ+BgDNZDrmTGu4j9ROL5p9pNRbeGeED9OyMMpcezYoEP8UHTS500NbFiM7r/RHY8xmfo3R0dkW4yYUw+HgTvMRhNswOxuklKUWxiICekXzf4Drz9FszXCVgh2AVDHac3DP5E2HgiluHqxMCq1y4Isk9fGJJhiazGqQzSiTnqHhCE+NZnQ6TsFM0Mjz71Iw==
Received: from DM6PR08CA0037.namprd08.prod.outlook.com (2603:10b6:5:1e0::11)
 by DM6PR12MB4138.namprd12.prod.outlook.com (2603:10b6:5:220::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.12; Thu, 16 Feb
 2023 14:37:13 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::f1) by DM6PR08CA0037.outlook.office365.com
 (2603:10b6:5:1e0::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT050.mail.protection.outlook.com (10.13.173.111) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:37:13 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:53 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:36:59 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:36:55 -0800
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
Subject: [PATCH v11 05/11] vfio/migration: Block multiple devices migration
Date: Thu, 16 Feb 2023 16:36:24 +0200
Message-ID: <20230216143630.25610-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|DM6PR12MB4138:EE_
X-MS-Office365-Filtering-Correlation-Id: ae53718f-c49a-4ed1-ce2d-08db102b4b66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3j1kPfyix2m7A5b1GyDW3nCoc+ys4FnS+KpuEo3d5DHXLW9C1w5vaizggVdrYrnFK2CUtkdVXLzjimpv8Q6l6wzll2tn3ckuTrwDx4vFsJANMI3zLP2R2wk5RRCkxrPIt7RdNtTZ9jIvtwAgIh78z1mT4ptJ2mrKRiFJDAUSyiqVcTcrDEjbbvIWJPTWunvpm936Z8KX0usQuxuWyIsoPsuT9pG581Es1E071s7+hzKqIkrZ6znxPZG+ugiCrrHvb1f1U3fTI4xrWbgCqNb1uknErDJJ8Evp+UaHvHAa7cUvtAni4pfwBfyRzmmWuV6BE4K21fcy+CfY7eq1yeTrZpulletISSSD5XF8AldqUwREqGRs36Zp3PNq9EvHW6a3xFvoYt098FK55lPGKIZ8+wkssWr0XPPAgR8v1LZ/Lbx2xVEM8qF2XcaobNo8s0zwtO3Zms7Fz+enGpqiuioimt1ObzEqA/Sxkd7WCwYylixiUWlRV2rKY6gCfhFhK/c7rmxq7GrewZ8QthWgYHtYu3I89nBMiN/fpDiSE8L17kvsieeslgKVVW9E/7F2L8ik4fM2cVeRPcFmqHnJJdN3Jz74RKGFcvuaO1VW2VvkDCGUYYrG/+jogJrjkpDr20ZntV2qOhpCLiAKTcHSRm1N/kDhIEEZN0Auf3PUqmLTFgeR0iHEMFe4dRrOZCxGH8mYJsiqLepg3sP6m77dovWYVA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(36840700001)(46966006)(40470700004)(86362001)(36860700001)(356005)(7636003)(82740400003)(40480700001)(82310400005)(70586007)(54906003)(40460700003)(70206006)(41300700001)(4326008)(6916009)(316002)(7416002)(2906002)(336012)(8936002)(5660300002)(2616005)(426003)(47076005)(83380400001)(478600001)(7696005)(6666004)(186003)(26005)(1076003)(36756003)(8676002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:13.6161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ae53718f-c49a-4ed1-ce2d-08db102b4b66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4138
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::629;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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

Currently VFIO migration doesn't implement some kind of intermediate
quiescent state in which P2P DMAs are quiesced before stopping or
running the device. This can cause problems in multi-device migration
where the devices are doing P2P DMAs, since the devices are not stopped
together at the same time.

Until such support is added, block migration of multiple devices.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/common.c              | 53 +++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |  6 ++++
 3 files changed, 61 insertions(+)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f1..56b1683824 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -218,6 +218,8 @@ typedef QLIST_HEAD(VFIOGroupList, VFIOGroup) VFIOGroupList;
 extern VFIOGroupList vfio_group_list;
 
 bool vfio_mig_active(void);
+int vfio_block_multiple_devices_migration(Error **errp);
+void vfio_unblock_multiple_devices_migration(void);
 int64_t vfio_mig_bytes_transferred(void);
 
 #ifdef CONFIG_LINUX
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 3a35f4afad..fe80ccf914 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "migration/migration.h"
 #include "migration/misc.h"
+#include "migration/blocker.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -337,6 +338,58 @@ bool vfio_mig_active(void)
     return true;
 }
 
+static Error *multiple_devices_migration_blocker;
+
+static unsigned int vfio_migratable_device_num(void)
+{
+    VFIOGroup *group;
+    VFIODevice *vbasedev;
+    unsigned int device_num = 0;
+
+    QLIST_FOREACH(group, &vfio_group_list, next) {
+        QLIST_FOREACH(vbasedev, &group->device_list, next) {
+            if (vbasedev->migration) {
+                device_num++;
+            }
+        }
+    }
+
+    return device_num;
+}
+
+int vfio_block_multiple_devices_migration(Error **errp)
+{
+    int ret;
+
+    if (multiple_devices_migration_blocker ||
+        vfio_migratable_device_num() <= 1) {
+        return 0;
+    }
+
+    error_setg(&multiple_devices_migration_blocker,
+               "Migration is currently not supported with multiple "
+               "VFIO devices");
+    ret = migrate_add_blocker(multiple_devices_migration_blocker, errp);
+    if (ret < 0) {
+        error_free(multiple_devices_migration_blocker);
+        multiple_devices_migration_blocker = NULL;
+    }
+
+    return ret;
+}
+
+void vfio_unblock_multiple_devices_migration(void)
+{
+    if (!multiple_devices_migration_blocker ||
+        vfio_migratable_device_num() > 1) {
+        return;
+    }
+
+    migrate_del_blocker(multiple_devices_migration_blocker);
+    error_free(multiple_devices_migration_blocker);
+    multiple_devices_migration_blocker = NULL;
+}
+
 static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
 {
     VFIOGroup *group;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index e56eef1ee8..8e96999669 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -878,6 +878,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
+    ret = vfio_block_multiple_devices_migration(errp);
+    if (ret) {
+        return ret;
+    }
+
     trace_vfio_migration_probe(vbasedev->name, info->index);
     g_free(info);
     return 0;
@@ -904,6 +909,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
+        vfio_unblock_multiple_devices_migration();
     }
 
     if (vbasedev->migration_blocker) {
-- 
2.26.3


