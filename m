Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5207E658C15
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:11:58 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqih-0007Bf-FJ; Thu, 29 Dec 2022 06:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqie-0007Ax-UC; Thu, 29 Dec 2022 06:05:05 -0500
Received: from mail-dm6nam10on2083.outbound.protection.outlook.com
 ([40.107.93.83] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqic-0006XI-T8; Thu, 29 Dec 2022 06:05:04 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N50V0sq5t5ZL1RgCSVLBUgmoCU1zCfK+UKP26HGPuXT0erK+z485DTX5kb9rGBAWbDgIzKN0BQLxjqXeM73mKIPLtBhR5vHxqJutuEOLKyBGKZBM0dQRt6UU4JEWj6qqwmIgwD7FTrmAn6ZFq2sUSf5lcT+Hwov6OAm0N33bbWc3pXtBpR9s0OcrUqC5t7Is4BFxBjss6iJQS8oP5r0YaczJ+TYUI2M4h77R9EbMzGzxKISHKDUpGILpNJgn9pcxbwEt1MTIUGUW/7lzz7AIry0cqGj51tPB7JGK3zNrezVI5vTFa+PvKKheqJQjNgeD57EqTA3IT2wNab+zrvqe6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wRt1ktX6lTWEEZa9wsfYoL+Srcfqs82vaOtcDqF8IXo=;
 b=lbDc68JfmhyweARLIoeqLucUpnXXBklv1EZOzmXpAKSQuh3DslCCLu64r13g5/RykoYqqgbkHIxotIcd1IWNDtMab+5EyykECFoiltN7HZNPVkLeizIeiAyslKfV9HOtXBfcB0TY3ZL3t4eMqMcDS570DUKsaYmso0xoxvZFNEyrzdpeZt1CFffxG/e9bYd4IlDejGMnq7t3jr3cVuXNugwJT6m8U5H1ohcTiK7265/feov4wEmB26EzQPNlk7KUCcBXC10iVCNIWudr8eU39/twuW6DoBzA+v/7U80/APO5YwHY+sG/NNKCLGc/pk5cjGAzdYDIImfiBiOmLltarg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wRt1ktX6lTWEEZa9wsfYoL+Srcfqs82vaOtcDqF8IXo=;
 b=V5uc0YcUT89t74r+j/cgE3wp8MGYsnV3jLILY4D+cvvP6d6e1CzzZk+XGcR2hX1Jq/vA7YiPKyWo0iXyuwZkrsj+8r3Fz7JgHKp0so1w/ofOYoFgbmp/6KPrgO5RO/Q6dO/pt2IrD/sgUcnb//lwKtQXHAQ+bazl/xNfBMrXd35ngM8C+kCBlq6+kvgejx576FNiYhJJ1aO4jbmPXlMh5f26kZwrv02m7NTkQT3/dZug+xYdLq4FeTphcGG4wq1CeKWva31b1vVaNQEZiX5wzUvq8FeXMuosnCQPjErG79HSt1ulhIUhLA42ac5KuWhXk9UFoBuPj0sTEPVPfHSc9w==
Received: from DS7PR03CA0192.namprd03.prod.outlook.com (2603:10b6:5:3b6::17)
 by BL1PR12MB5286.namprd12.prod.outlook.com (2603:10b6:208:31d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 11:04:58 +0000
Received: from DS1PEPF0000E646.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::53) by DS7PR03CA0192.outlook.office365.com
 (2603:10b6:5:3b6::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E646.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:57 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:54 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:04:54 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:47 -0800
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Avihai Horon <avihaih@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>, Joao Martins
 <joao.m.martins@oracle.com>
Subject: [PATCH v5 08/14] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Date: Thu, 29 Dec 2022 13:03:39 +0200
Message-ID: <20221229110345.12480-9-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E646:EE_|BL1PR12MB5286:EE_
X-MS-Office365-Filtering-Correlation-Id: d46a3d5a-e63e-48e2-3e81-08dae98c861e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6UMFvvJCTL/zMJiHfCK3O7sWFwFhGQLtuQs3Fw5hHdos8w+wFDhri0P13+umpQcaiat1+49mriHx+E2mEePeT7NQ1PHmbW4khTJVrSYwf860sGSAhXBgXs2+O4c6blsUBlkS4A0hh9LZd/1JKveMvxBoRLsZPBiShyOsbVq6dE9U4dXsQ8DqhC7TUVP21opv2iY8H2D7UqDogtj8ksWQ5s7Z5Kfwhm6cL3WhaVY9aj1gS34K0RQsCQC8+JpbGk3uW2zIVtTuvfhqfwHINnImYstSk9H1keTUjjmaPEBNoSZ2/BLMuwK5+42nrkcNz+TCENPVCpYZlGJcLWKxHIJ5+zgZoLEx97vNg3eNeDVsIMKl4+oNhnPsvqELxquiRwmEIpC8tG6rlayCDJCFRMO2rkFySMKyRjI4JmM0wYfBcZzsnwpn/iCHh56OyFwWlo+3QhyqM2GBL+nhQWkZ3RGw+ovpp/Cfazx9Xo0RNTGxNShOhrhLQ0JaaExDR34Sx0Mq7dnK+UGvzJ18ly8Tk5pNlJJz+5ym2zahHQZtxV5KN5Dv1NnzQeHvMEsRXFyDyyO/r5s5kipIOvlrO36iU/dgtwId3eXA0MoMQbMVXtk5dRXC/8XWoDM6NxHgf5mXSommcjNJs/3F3ywTpXfbyXPtcYB0buQ/P5QHqtEIHcNEAFDndxa5j06/HadIbxkAwG0106QaKWSDAEpBNrREqjwMcA==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(346002)(376002)(451199015)(46966006)(36840700001)(40470700004)(70586007)(7416002)(70206006)(5660300002)(8936002)(8676002)(41300700001)(36756003)(478600001)(4326008)(316002)(6916009)(54906003)(6666004)(2906002)(36860700001)(1076003)(7696005)(40460700003)(336012)(2616005)(26005)(186003)(40480700001)(86362001)(426003)(47076005)(356005)(82740400003)(83380400001)(7636003)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:57.9606 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d46a3d5a-e63e-48e2-3e81-08dae98c861e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E646.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5286
Received-SPF: permerror client-ip=40.107.93.83;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Move vfio_dev_get_region_info() logic from vfio_migration_probe() to
vfio_migration_init(). This logic is specific to v1 protocol and moving
it will make it easier to add the v2 protocol implementation later.
No functional changes intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/migration.c  | 30 +++++++++++++++---------------
 hw/vfio/trace-events |  2 +-
 2 files changed, 16 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 552c2313b2..977da64411 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -788,14 +788,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
     vbasedev->migration = NULL;
 }
 
-static int vfio_migration_init(VFIODevice *vbasedev,
-                               struct vfio_region_info *info)
+static int vfio_migration_init(VFIODevice *vbasedev)
 {
     int ret;
     Object *obj;
     VFIOMigration *migration;
     char id[256] = "";
     g_autofree char *path = NULL, *oid = NULL;
+    struct vfio_region_info *info;
 
     if (!vbasedev->ops->vfio_get_object) {
         return -EINVAL;
@@ -806,6 +806,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         return -EINVAL;
     }
 
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
+    if (ret) {
+        return ret;
+    }
+
     vbasedev->migration = g_new0(VFIOMigration, 1);
     vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
@@ -825,6 +833,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         goto err;
     }
 
+    g_free(info);
+
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
 
@@ -847,6 +857,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     return 0;
 
 err:
+    g_free(info);
     vfio_migration_exit(vbasedev);
     return ret;
 }
@@ -860,34 +871,23 @@ int64_t vfio_mig_bytes_transferred(void)
 
 int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
 {
-    struct vfio_region_info *info = NULL;
     int ret = -ENOTSUP;
 
     if (!vbasedev->enable_migration) {
         goto add_blocker;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev,
-                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
-                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
-                                   &info);
-    if (ret) {
-        goto add_blocker;
-    }
-
-    ret = vfio_migration_init(vbasedev, info);
+    ret = vfio_migration_init(vbasedev);
     if (ret) {
         goto add_blocker;
     }
 
-    trace_vfio_migration_probe(vbasedev->name, info->index);
-    g_free(info);
+    trace_vfio_migration_probe(vbasedev->name);
     return 0;
 
 add_blocker:
     error_setg(&vbasedev->migration_blocker,
                "VFIO device doesn't support migration");
-    g_free(info);
 
     ret = migrate_add_blocker(vbasedev->migration_blocker, errp);
     if (ret < 0) {
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index 73dffe9e00..b259dcc644 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -148,7 +148,7 @@ vfio_display_edid_update(uint32_t prefx, uint32_t prefy) "%ux%u"
 vfio_display_edid_write_error(void) ""
 
 # migration.c
-vfio_migration_probe(const char *name, uint32_t index) " (%s) Region %d"
+vfio_migration_probe(const char *name) " (%s)"
 vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
 vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-- 
2.26.3


