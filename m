Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B8E7D68BCDB
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0gJ-0004k4-Fd; Mon, 06 Feb 2023 07:33:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gF-0004Tv-Ob; Mon, 06 Feb 2023 07:33:07 -0500
Received: from mail-mw2nam12on20624.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::624]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gD-0000aF-6G; Mon, 06 Feb 2023 07:33:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=C5VJMqfexEH7RE0Rni9uq4yhQ4OLylTSUnWLUwtzqvmd9iFcRZm40Y+nXPU2s66VP3nOS6nzydl/wU59gUMBTeGoXf+VwfFmhGnjJRKaForlLsLrpjo63yWI5JXcagNDfVwjCqYm8Dkjil1fqhldSwP7eCZ5k1zi2jmxGkB91f3X1pgZ3/HLIhzIh65EaOVKlg83LX34TDqskRk7Imrp/dzmrqK+cqpk9PrN78lwPdSHDIUjW3oR//RPR/Th0aRqqn4Oq9HcztMUkDei5qFVEQFpi9NGHb0yaOwyWDSE+KNWhKMNxXsWcxoYRg8mRy/PjYZEybn9Xf0+8JBNDd/Rcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/+mdBFL51+OFkvosJsDfHfRoCQ2VsxXLczeMw7lvrAo=;
 b=gIAhWDnsiuRj0dQmj/dpQdehgrtLGBfeNbE2EZG/mJ+5Cga7V1ExEzRC+X8gQaMe2tFj5FAHpYyVmGW+cuL8fJseBU4+iJQIlibi1+6llcrH9zCyz2GDGDjLOQsQF4enjjGB5sWj1eGXPT7On4h8JxTlX8xKs3CQJSPkgdNMDpWcYOXcJbqM5C5irf6nOmgLTFrfuZcULnwDL4sDovmjfJREhjTy+14ujNH0wT99AZzTIlAMt5zo0Yui1+S289QGw4ZCRil+9T7YD390JcLJXV7O0ZbdIG3JG5xNZ8GThGfYd155UxrQC+oX+ON4mw6Ey+2GBJXQbXK4OiP4oQl+pw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/+mdBFL51+OFkvosJsDfHfRoCQ2VsxXLczeMw7lvrAo=;
 b=bNtrpF7jVSEA7f1MuPiv8M2rWdAMQwD8RPasoo2jTKcMUTbaH5RaMTgk1ir6SrysDV4ml1+yM8QYhZIHsTTCr6tnKHUtoV95NLh7JxJMbz+otYquDK8LojU+9ag0VX672Z67oOjXQZdvLiKnHLzwMUDRdY1MCGrMwMEMbowe+P9kIgAED0/eJXtxKROyppFxbP+lYomy6qld6tgMHP38wQ5mvtd47+/5kplQbpxrf9vbx9PA/jvvN6JvqxrpTu1yNoUHVSpU9oS+RZb1xxVMXd2kwj8agX7A5A97UNOslQYp/GpmZvG90rRWaBuidOHcoCLhsmxiqZcfJ5UsgXz4Vg==
Received: from BL1PR13CA0140.namprd13.prod.outlook.com (2603:10b6:208:2bb::25)
 by CY8PR12MB8193.namprd12.prod.outlook.com (2603:10b6:930:71::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34; Mon, 6 Feb
 2023 12:32:58 +0000
Received: from BL02EPF000108E9.namprd05.prod.outlook.com
 (2603:10b6:208:2bb:cafe::88) by BL1PR13CA0140.outlook.office365.com
 (2603:10b6:208:2bb::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.15 via Frontend
 Transport; Mon, 6 Feb 2023 12:32:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL02EPF000108E9.mail.protection.outlook.com (10.167.241.202) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.17 via Frontend Transport; Mon, 6 Feb 2023 12:32:58 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:40 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:32:40 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:32:33 -0800
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
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>,
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v9 07/14] vfio/migration: Block multiple devices migration
Date: Mon, 6 Feb 2023 14:31:30 +0200
Message-ID: <20230206123137.31149-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF000108E9:EE_|CY8PR12MB8193:EE_
X-MS-Office365-Filtering-Correlation-Id: b55734ac-6d1b-42cb-1b4a-08db083e4795
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4x89md06+s0dPImSfC1KgAKknhHB3lbQXpe3OoBk3Ttl95eV5FC8J90fVBHToojAJ0eiVIig/E1JgasgvjHpS/GJ3cR/0PlkqhUODUWixTYX71IsCIit2Q+bjGuRyBKPQTupbgNx4wHTuZaIqM3a6y9AP+4Hl3B34IXuULvNMm5EE3KWYosZi4MAtM+miyYsRC2UQ4ZW4TWZPmyhN4NBBjD44SeTz4Js2scejCQqTDpW8CWTQanYFGT+ZO9I4JYI39im5eatAxec9xQP1EaJZWoWpQx2tmDzPR/jriAgGkWHztKgURVWP3xT2PwyBTyK6A40T52YDkfBpFk+2htBg6izrr4Op1E+NmNq2bq3VLtjQOwPbF4BTTkR6YW6VYcSlNsZgVYqYu2wuYmPJ0iR31W0j0rPOBJGuyvepmzYxjAy59ejPa41suqH046WjJkUBlXza/6Z5PNffivG2nqOTa1pTfJpAjnBkMPqiweFYcMSYC/rCTttHoU5ztf3uwTSe5hj8bHFLdHmshlSlMonWnXHEsDZoOVl3HQNEI7NGYAoO1vkn08JdrF6d+toJHFPbAlmqnJ8ILTCE5LrnlkdP4YdfcCEHwOJ7IN4Ew/0D5PkpUxr4So+Q1Hx6EIU5Df5ggRwYIVMqPIbiROcwjbFkGeQ2z0iI8XQTPnm1DhuPok/19OTCNyQ1VW5JgsxB1MAUKgLPOqLY/p1FLIa/jVjrg==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(136003)(376002)(39860400002)(396003)(451199018)(40470700004)(46966006)(36840700001)(40460700003)(54906003)(478600001)(7696005)(2906002)(316002)(7636003)(36756003)(40480700001)(82740400003)(86362001)(356005)(82310400005)(2616005)(426003)(47076005)(336012)(5660300002)(70586007)(70206006)(4326008)(83380400001)(8676002)(6916009)(8936002)(41300700001)(7416002)(26005)(186003)(1076003)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:32:58.2974 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b55734ac-6d1b-42cb-1b4a-08db083e4795
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF000108E9.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8193
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::624;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
 hw/vfio/common.c              | 51 +++++++++++++++++++++++++++++++++++
 hw/vfio/migration.c           |  6 +++++
 3 files changed, 59 insertions(+)

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
index 3a35f4afad..01db41b735 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -41,6 +41,7 @@
 #include "qapi/error.h"
 #include "migration/migration.h"
 #include "migration/misc.h"
+#include "migration/blocker.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -337,6 +338,56 @@ bool vfio_mig_active(void)
     return true;
 }
 
+Error *multiple_devices_migration_blocker;
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
+    if (vfio_migratable_device_num() != 2) {
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
+    if (vfio_migratable_device_num() != 2) {
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
index 552c2313b2..8085a4ff44 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -880,6 +880,11 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
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
@@ -902,6 +907,7 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
     if (vbasedev->migration) {
         VFIOMigration *migration = vbasedev->migration;
 
+        vfio_unblock_multiple_devices_migration();
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
-- 
2.26.3


