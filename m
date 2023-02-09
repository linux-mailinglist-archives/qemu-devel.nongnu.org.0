Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 110DC69113F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:23:28 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCUE-0004IX-EA; Thu, 09 Feb 2023 14:21:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCUC-0004IF-GH
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:36 -0500
Received: from mail-bn1nam02on20616.outbound.protection.outlook.com
 ([2a01:111:f400:7eb2::616]
 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCUA-0005U3-LN
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:36 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eZ53USIdvmp2E5HqmKoE+dZZtRfPKFNvTz0tqHrcyI/0Aa7045RRNnMyRyqr7ql64MCREUMA2Qv9xWt5025pI3jMk8dXmh0ZR8bnf5PpZM8ORqOKt2PENYYx4380xSHIwft+aqa20yfQGSoF3WyQr0kHDvraIQfgy8I4FUmXQDjLWDl7WjZWvvDcfXKNtrCBjTnO3IKyjWfu7FX0a8fMClgliIWI4snTe50DksvsZmdNtMMPjhTWHNYLhvw81W7oVhKUt/wBfoJ6he2ro6Ud/qTj2mxL6R/J0IB2L666AVKAybigMcybx6gbqEp6nYNPpVzYQWXJxy1SkBMcrPOkYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KsEZVe4Z18pSgq4T6clnV3po5zBBFlkNlw18K2HqOzg=;
 b=TdlF6hrghrISWj7BGx+qneajwcLFIYcglwq9tognGzwSl3OvaYJ/4SHBMjKAGdMH2NlOLtDL4jWpW41bjGalADpXjpOtLxFXrLd6QBajVjf+fGOjmTGHNImsZlqeuGvIuK/3ZojXNMvWbypqz8z9nRZhlnY3ToSJg1dXCZ7b2dvBq4PebvSAsIINbNeZkMvocmwNRlNfMsSOHaZweTfMU7Zu9xHiVZSFLbIjseJ7bZq/wlQzlyksdVyDyU/IowkY19qG4z0Cz1vaco1nOVakdBewu+NB+P7UxQw1Pn8azlcP5+vwZIe0BEOOwvVsBhj2fa29cBI5GmIhF66f+C1S/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KsEZVe4Z18pSgq4T6clnV3po5zBBFlkNlw18K2HqOzg=;
 b=XeDKzx1Qt4mw0r5To6cwolyibkSvkFhjKwYDJwtNwfsW+XAbwoagrpeUh5zu2Qx6vl5KCFdQ6iSu8b4Ia7JrGSoS9qgfu5lWBODC2h35x6csBPhe9O3NKTEj4FUa0kuTQ5l1RbEOsZ5q4zzjFWmXQV9nvkAGdPcyGEkQxXAfhnfskKk8lyHYjEPBfdnNXebz8OhuMqT7+5rQE51WC8M0mnx6Zml1BxwHstBNQzoLjyGqnRkt6Tam16TcTpzZOWrz7KuGH2btyRFt6N3m90DVWbTTmFgLeNDhUeOQQqLyRNszTePhQCE6sD6FZNNkKg1PQSERQFPcqWGTUOLUiUgxXQ==
Received: from BN9PR03CA0268.namprd03.prod.outlook.com (2603:10b6:408:ff::33)
 by DS0PR12MB8017.namprd12.prod.outlook.com (2603:10b6:8:146::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Thu, 9 Feb
 2023 19:21:30 +0000
Received: from BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:ff:cafe::31) by BN9PR03CA0268.outlook.office365.com
 (2603:10b6:408:ff::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 19:21:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN8NAM11FT017.mail.protection.outlook.com (10.13.177.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.19 via Frontend Transport; Thu, 9 Feb 2023 19:21:30 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 11:21:13 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 11:21:13 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 9 Feb 2023 11:21:09 -0800
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
Subject: [PATCH v10 06/12] vfio/migration: Block multiple devices migration
Date: Thu, 9 Feb 2023 21:20:37 +0200
Message-ID: <20230209192043.14885-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230209192043.14885-1-avihaih@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT017:EE_|DS0PR12MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: c20cc80b-0916-4d44-4811-08db0ad2d90a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: g0aUNKBTHL8q5UVxGYxnFMjSMuJaPZ28d4dmqirDeuJITMx13o2Ah2RPhmYPbZ94S2j5s8GaW62ZD8izmL9+2VQYhBUW7+TrUu7rNtcITD2lup58YBRuMSiZdDBg939INp5S7wQ0ph4PjqxKDAIg22QorQ3Dw48HWMgArfxbKXBpzT3zKJ6YLbURTejnnKWWaoLx4veChJhE1sTVfO8D9J5xi7RHZew9wUZtXVfwL/ARgeKABQ/CChbKh6IDw9gChIzuT565O6Qnc7gCFYMOh2RqLqjNs9tAgqq/ejAyAFMC/e/Lgp/7pcmbimkhYhKxzVAuactJanfjUutDfIgAYvaEETnCjbvtLzgOhxqol1hWa1dtpRbMl5LAOIoU15Kh7KiQ8byYNXxhpgsqLUR30emvc/RwZmJH+OGajdt5BcE2zDUW6mWgQ7dHophSUnt38H65IxLVp6dqF4/sFtRN/WVtvAutuY5yZUY5s6QbzEMgwyC25dUBuxNUcQ2kucyFBviVED1LsKMd9EvagSWRxg/SjURCJOcbapDu/Z1N5oRGLVBJVeg+Pl2vlhEFkbMe0pKG+cA9AO7Dnmnv2l1x0W9/dScojqfw6Hjj5sGw7MySeYZvBwJtTNNwGDQRNWJLiTxV98Nn2cZdpz6B+X4W9IdMA8wOJFIKTYa1G27PF6MGoAEnWmkgcf8yeD+90MCBeqSvo2Xwd66AaYz5RoEZYQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(346002)(376002)(136003)(396003)(451199018)(46966006)(36840700001)(40470700004)(2906002)(186003)(7416002)(40460700003)(86362001)(426003)(47076005)(2616005)(8936002)(336012)(5660300002)(26005)(82310400005)(36756003)(1076003)(6666004)(478600001)(7696005)(83380400001)(6916009)(7636003)(316002)(41300700001)(4326008)(8676002)(40480700001)(356005)(36860700001)(70586007)(82740400003)(70206006)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 19:21:30.1609 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c20cc80b-0916-4d44-4811-08db0ad2d90a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT017.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8017
Received-SPF: softfail client-ip=2a01:111:f400:7eb2::616;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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
index c9f3117986..5dafa0a558 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -881,6 +881,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
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
@@ -907,6 +912,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
         vfio_migration_exit(vbasedev);
+        vfio_unblock_multiple_devices_migration();
     }
 
     if (vbasedev->migration_blocker) {
-- 
2.26.3


