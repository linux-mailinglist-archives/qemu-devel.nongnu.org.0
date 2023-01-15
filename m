Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56CB666B36F
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7sk-0007la-1j; Sun, 15 Jan 2023 13:37:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7sJ-0007aZ-Qs; Sun, 15 Jan 2023 13:36:59 -0500
Received: from mail-bn7nam10on2051.outbound.protection.outlook.com
 ([40.107.92.51] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7sH-0007gt-Mh; Sun, 15 Jan 2023 13:36:59 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VN1d/06yDbJA8+Cc0mfPhb+ApFfo7An6v/wwjK61yUXPO5gTGjEMtQ5wO28GQoVQLL6G8o4bZK0QNHZb0SE5RWc9vxvs1npEFV46MZRr6O6y6iHQgdBwmPbTrw2uRtOzoyNVfiwe3F8S985br/uyJSLRcOQbj5STLLv5NtYVlUadiyyHdFSHaEOw7R9uFCaey50iDjih4EU5V+Hxa+gk5g8sJXT6O98WpcMBiBjuTQy7UzzVEHFVT+q4/JKgD5lRQsscDX6hLi1B/5/gHC8h4lpJHiVAQfjcSpucZ8xWbmr5JXj8oLECPhIL4c15YvtGV2jShawjzF149XhJdkVWGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+HKL4e9qjWn47bt8QpXMO38xpZA8acaFd0nAKqvDd68=;
 b=E822zbWdr6z3JtahNz56HhRE4awnE98UnjKLokmmBYicAEkAoS2ZGqi7aaSg34SnvL5VW3/7FABgtFly6cdzo+d8KOdQIK2FjNa3+ilY9jsN4iW6iIyIkWCor4vcq4LWPgQ45QH7dakorp/72tTCQGiiVhDDVlMdLCYhfvEtxIhqHhLQ1Eao4rYTMCakUvHeDStrvyDJyCZpVc+VA0fLTZZCtFoCjYJSDreFa4sMyqRrIaSdK+7hKtGcsxMxBXNentKtXT95riToM2oNb4x9cHAme6lHPbRuClwLGM3mjAMJFFUKT/Pb7VAdLf4VydGZvhhK9Xt/uko5x/F62b8EEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+HKL4e9qjWn47bt8QpXMO38xpZA8acaFd0nAKqvDd68=;
 b=inXbCwTr12Gv2yhDGxGUxHGc8V1OJpqu/AI70CBQrgO4odBknQw7v11NjKyWlA/Pcyi6B/rWYYHw0YrSHeuj/lo+KMY7AuuLM06Y/STa7FOO63Ln11KEQoKx+XBMZfN0VjMybfJjI/BLLtYP52meiJhZUuEiFp6Wn/eXrDrj2Z/7NLCwWjWOcwj3C/f0PEucpBB4KGjfkLglwJCupLmVvcxD3XjdaKeOTt5a0DTvHGbY0WpKO+ZOdfVwzQ3XbLOYx3+DpgNVf+usx4qMhXtUg/xEOX8XW73KK5f1d+MVeqB/L88VSypS5jxdrlNJwZBQdv9N4eU+0ggBnnrUOsM9yg==
Received: from DM6PR13CA0003.namprd13.prod.outlook.com (2603:10b6:5:bc::16) by
 DS0PR12MB7509.namprd12.prod.outlook.com (2603:10b6:8:137::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Sun, 15 Jan 2023 18:36:52 +0000
Received: from DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:bc:cafe::6e) by DM6PR13CA0003.outlook.office365.com
 (2603:10b6:5:bc::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6023.12 via Frontend
 Transport; Sun, 15 Jan 2023 18:36:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT030.mail.protection.outlook.com (10.13.172.146) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sun, 15 Jan 2023 18:36:52 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 15 Jan
 2023 10:36:51 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 10:36:51 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Sun, 15 Jan 2023 10:36:44 -0800
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
Subject: [PATCH v7 07/13] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Date: Sun, 15 Jan 2023 20:35:50 +0200
Message-ID: <20230115183556.7691-8-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230115183556.7691-1-avihaih@nvidia.com>
References: <20230115183556.7691-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT030:EE_|DS0PR12MB7509:EE_
X-MS-Office365-Filtering-Correlation-Id: a357604f-55f8-46c9-3716-08daf72778a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FHkvUblkx9BLCVhei7NjUIJNh57W7c/FvY9Ew0qeSiRFMwoBZyIv/hsV2DCUoEbOrV01LDegQIa23ga7KE0qnaBWJy32j1ausTkNI68gZYf3Q3ED2Inq4He4TvKHGhfBx0xfWD29xsdXUXiUe1YNotGuJC29m+MgneBeu8tjL99d8sp8KiuX/n2VHH+qt++JXcrh/R4NLeNRIzZIiPdrjCakjWk+zcgBajUDRHtfxvQgUutmUtJPvhGv3yGYx5NEsJX6GNfRgNMT32NSFbx+1fyw38z32+qZcHKdY2HHsccFdGIVe1jqAWk9kWVSo0hHRc7XBvy+E7jeD2CopDi5QJ+gk1cQl8z/MwgNE60KUa3UyGEZEoYw+FdsQzObJ/ABVMl4eKiIg42dof1glsDFDVgoGHpo1coPOrMG0pKus9NkFZMmCnLt4iQoaYW/zkFxhn1iVhJQNsyzsGtDakjzBiK2FapDVcH2c54YvpVg5vXydPeIW0hjRQlIHT6Y6RnjpgMTmZdBvebiG7eDYv9oIb0N9IH2Q5XNfA8uIKFUEekmSoy1ZU2zzSYqBZi1rw+2SX4xdN3yUXZl1klZn33D0uPOQUP71jNvGu9zpCOzqp5st8KH/RpEhKcEID//H56az17yjFL56IVI/n3pbPARTjc6oPyXTLXnXtpHddeioteImjUmxNdP9UvIkSr+j8U5kB7fkC8VNeVGYXwVPCiXTg==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(396003)(136003)(346002)(451199015)(40470700004)(36840700001)(46966006)(1076003)(54906003)(2616005)(186003)(8676002)(6916009)(4326008)(26005)(7696005)(336012)(70586007)(70206006)(478600001)(66574015)(47076005)(426003)(41300700001)(8936002)(7416002)(5660300002)(6666004)(83380400001)(2906002)(36860700001)(316002)(356005)(82740400003)(7636003)(86362001)(40480700001)(36756003)(40460700003)(82310400005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:36:52.4556 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a357604f-55f8-46c9-3716-08daf72778a1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7509
Received-SPF: softfail client-ip=40.107.92.51; envelope-from=avihaih@nvidia.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


