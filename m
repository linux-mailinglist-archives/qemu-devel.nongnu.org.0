Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94812666D12
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 09:54:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtK4-00068o-Gs; Thu, 12 Jan 2023 03:52:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJC-0005n1-Rn; Thu, 12 Jan 2023 03:51:41 -0500
Received: from mail-mw2nam12on2050.outbound.protection.outlook.com
 ([40.107.244.50] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJ6-0007bn-6V; Thu, 12 Jan 2023 03:51:37 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HdYHWcvVXs5AhgxzlxUXeb3lDe6Vlr9BBg8wFmR0t8mJmd/N1/YKBNLAb1MhOKcR1eKFcomxh4+h+mlIIuNaz0OdS79EXW+ctZCWz81pEsxw7LJQy8ceTjlS5VcN9e9Msc3OHeBccRLbPDWYWn6MWbcJeX9bM7GX9D2jOYMOkmSrVF9YIBxSzINC+yRGGCQu6146DResZS9HdI8sK+o+1AVjucQnXvSBcuJwrL7ehOdEYOcaiC35BmtfEEVrbwkHUIh65DVjEzWD7JR4kKxpNdzETah3Aas/dird4zk4oUi0PJMHH4SMMXzpU3gf+1bT3bF4F3MDuF24HpvypPN/Dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HKL4e9qjWn47bt8QpXMO38xpZA8acaFd0nAKqvDd68=;
 b=FcqqWGUOhpRfPTIFURfptYNbMbHJTVM+CsNLefx9vvZfzjcY3z3dH1TxAA3I7ppaB2GkPm1WeLYtaAcpWviq1nyAjPjTzfanc26mMmowKLVTPFMX2JEeG97jJ/FZQ2fXM/0wVXcUlKuwIJmhDyDZ1CfMpK1E5qBHCRUSM6UNvTtMagcmDTNGBkuWK//ptIbMuJi/gV4if/iQ+YAg4o7/Y7/K7BlA/Si/sqtST0Cf+bYe1PBSyAhohQyLBGD1f8Ne4Lg3MPX3njXGFolJ/rq3/3uIGJob7bmT5NfUnPmPrkhF5ROlxVHLK5QrF0L5AUTnBWIketJvT8k9nlx37leffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HKL4e9qjWn47bt8QpXMO38xpZA8acaFd0nAKqvDd68=;
 b=QNT52A+NZ3RTkQnGmUwlqN+0B38Gh8kivrFtAubfMXQFKZ8B82fAYcc9Dlqm5MWOKZi2tO5UnIi7Dbkq65B7tNzbvgPBRxoIuw3i/Yk8GxAB0CN1It5Wg/gcih41aJ0L3hxSQ9ybxSTdk2ENMFOuwozllvCP2LbxmAMqjZAwHy56dGoiQ+Ltd10gFzO8TCPxG4R4mARJcd3cUx/5/Xpu1crh5zHE0Zrzd1RfodWIu9eE9KNVELKokm1r83wnKlOXpi061eTCYdfxsYKoWj6Qbzro7DtU2Kf4TYAJCjqWdvQKvmtqBoDPdUTUiGFS/XLkwk1x2EkgV2GFBb70I0NRBg==
Received: from DS7PR03CA0004.namprd03.prod.outlook.com (2603:10b6:5:3b8::9) by
 MN0PR12MB6053.namprd12.prod.outlook.com (2603:10b6:208:3cf::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.18; Thu, 12 Jan
 2023 08:51:26 +0000
Received: from DS1PEPF0000E635.namprd02.prod.outlook.com
 (2603:10b6:5:3b8:cafe::42) by DS7PR03CA0004.outlook.office365.com
 (2603:10b6:5:3b8::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:51:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E635.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:51:26 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:51:15 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:51:15 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:51:08 -0800
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
Subject: [PATCH v6 07/13] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Date: Thu, 12 Jan 2023 10:50:14 +0200
Message-ID: <20230112085020.15866-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E635:EE_|MN0PR12MB6053:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d7d4262-30b5-458c-95ce-08daf47a30c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vGKXgYMt+jav9M5fMKv9QiH1YNYSVzV1H8CvfRtr2BlxzfOdibqpQ+RYZOEy6nrJA+t9uZWDqWP1qY03Y5ixZBsJ8zNlbRgsQVLBaTeHuHQQ3g7ulJNnv2nQTAGIX0qMB2n9Pex5YdLeWxEM+Z/c04KTE5K4COYqG/uVCFVep7H4gF9JIy1m28I/2deiSVqOvwpbvYn4CfUwjBeypU0DrRwy48nTyZgB7aEEHsNa7wf3Y7coAsuO3JMCv395YFEaMmXzHKIcVmTjvxM+g8EXl55qPmvHImEykdZHa50S+NoC+xEEKXyF0yXkpk4ZAM+BhmnZXqEULOI/Cz9N6P4xf5KfpMMG4GLM9uWIW7s9lItkFaM1/4p4Sred+Q2jX+oakv1LIscPMeFlVfNzB3DtXib4aBZ1B0oDMkSb0hpSBvMNYm/zrmo9qH0jUsxDixaQIs3GnMYwVvM4DzRFsBTYuq4JFtPjOd5247fy9O6QxPtPNUyX0eCdNsuBS/Z3/RelE08Ir2bb4q+HkeAPfFKKuV1ujFMLGEy5dkWkxN4OcpB4rOmA/xtGt81PQTYp+axwRtd8T7tM98B5azBi3kLSwmt9Bl2FukDSWfo43uzxoyfvH4AIud47WJvxOdkGfdf8xla87oNeq295g7KTX5GceaEhyT+sh8BS6DWeQC66577gxMVow9AHJDJqJ9EgAcBcetSHUf5MiQb+iZnAJUcHRQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(396003)(346002)(136003)(376002)(451199015)(36840700001)(40470700004)(46966006)(2906002)(7696005)(478600001)(186003)(6666004)(26005)(2616005)(54906003)(336012)(4326008)(70586007)(36756003)(6916009)(426003)(1076003)(8676002)(40480700001)(316002)(66574015)(40460700003)(36860700001)(41300700001)(47076005)(82310400005)(5660300002)(82740400003)(70206006)(8936002)(83380400001)(7416002)(86362001)(356005)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:51:26.6161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d7d4262-30b5-458c-95ce-08daf47a30c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E635.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6053
Received-SPF: softfail client-ip=40.107.244.50;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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
Reviewed-by: Cédric Le Goater <clg@redhat.com>
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


