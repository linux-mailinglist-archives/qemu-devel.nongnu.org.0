Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0E5699791
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:37:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfO6-0004tt-Dw; Thu, 16 Feb 2023 09:37:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfO0-0004ds-9T
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:24 -0500
Received: from mail-bn8nam04on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::600]
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNy-0004qD-7n
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:23 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PaHtl5CNpoQvuxY1FE73KcFfIsQNBN1c+eh/rJzMbiI7zowjbFyXnfWchST6ZXuHZEYw1WXtZ2PHzu3kW6crXp1isBgkzZIvgd6zMCf0PGffrJsfQ94yqoiSlvlvDFgxFEhT5aNU0QWnBqxClKCK5WWs/1ELdGwoFOeo1u3vWCZOMCaDrf3ha2QHi4T0Vstyj7lJl7KnDaPmdqHAS/J36nC6nYG6PXW+YO1iI+09AkaXuDEIHIux8Qp3McI9lxfbVC01SEa21xLiJqHnzPG4eVgnnJaqPgE6nuQO0Vha1rjSP0adORzRFGV9yt8Yh3c+31N5rMoHRfbKrzNVIRIqnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wzWITdl4T5qVmnd+bagypQPczhXZmqRwMoHxdSBtNZ4=;
 b=Ck+rtK7+adY2uE+ks4vtz8eNhN1//a2niePtXp+WGFQc0JNyZHYET/1eeTKAx+ZxT5I5peKeZZnLNTrC5KpJyE+k8qvJ/JiP99u3L5FDJjB84EVDqiOtesCt5oZdF9TwyLeGLrf5ldylgapWgdDf+0pnaz/x6IuG529A0HYw9Y/vFlD29P2FgfKIbqa1XT8OjhkcM2ofkkUF2nH+EJrh/9NlvPCd5103UKp5tT+kdNV5c1vzi+p29bBYYvUuYFjtxi+e3pp4/+K4ZgcUFjljKTVYvyu6drSbvKGhI6JDTpX8PpwwmM4C7GnnEbenMDjkMue68BgY1bnQSpq418jMFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wzWITdl4T5qVmnd+bagypQPczhXZmqRwMoHxdSBtNZ4=;
 b=TG9nlRCkQcFicxwEV+uKENtqbk6xV+GRzWXRg2SVEpIYlC2Ekae31J6mdLTtWgGxrUGuZz1hENhUHhD8cinbDzhXEz/qqpDje8o7cXz/PMXXItLMhxc/WDUju6V3YWHmkEQvEQ3IRp69ty4LXcsZqLI+sYwqpJYaSQYhovKehmy/ze/WIOgWq4OFPDIac2YFIk3JUFyjsB34IsdTbO4ZWcblLzPqDH0BkLuvPKo+diKbP61JFXGEy3CFXhhWBl0WyeHnbnBOfvJtZkE13fw64H8zq6VKuqhjSHjb/LBd9T7gauhjygpoYy2aAxBy/uiXlHiJQUHLP7JVsvQl9wsxIw==
Received: from DM6PR08CA0063.namprd08.prod.outlook.com (2603:10b6:5:1e0::37)
 by SN7PR12MB6840.namprd12.prod.outlook.com (2603:10b6:806:264::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13; Thu, 16 Feb
 2023 14:37:17 +0000
Received: from DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1e0:cafe::cc) by DM6PR08CA0063.outlook.office365.com
 (2603:10b6:5:1e0::37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:17 +0000
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
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:37:17 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:57 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:04 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:37:00 -0800
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
Subject: [PATCH v11 06/11] vfio/migration: Move migration v1 logic to
 vfio_migration_init()
Date: Thu, 16 Feb 2023 16:36:25 +0200
Message-ID: <20230216143630.25610-7-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT050:EE_|SN7PR12MB6840:EE_
X-MS-Office365-Filtering-Correlation-Id: 957cda5f-f68f-4035-6a37-08db102b4d99
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KG0KBytUEw1dsjnGwSBUyQbRpZXcUCi67gcaT9YhRHcc9V7ATvcXuA5TyCx7A2GXRIsLmrp+ymSR4KRlD9Ft++/4FJRJ0ZhKg7jTLVU90pJ2KzdQCCUNZJLoQjKXbpmYQJBUmK4vSsSIi42cSLPzqpoSMOu6bk2cr9uZ3CtJLyMDoZY8GvztIRZ0DK0RrqI6J5EiPM5SsFLnRA8xkIuJq5sXmY8B+jh85308rkfcfv/JTKTvWJ0Bf5IcUDqD5WDnS/l80QPjyit9CnctGLJ9YqILtE8ZWB/jXzO9+yUoVq6R5HO/TSBFXqoxgq6T9uQ0yIe/L0jF6iSRnApyKONeQzMOWARYAb8iaK24jZBJnzbU6SHAQyxKLbGFUrsIiHuysfpw9OXKqUYQSSDkwQqHzcB0j+cmWBSA/Ldxe9bBdJX6s6Xcb+znnbgZQIAwCBXFTqEdZJhIegbudyLA2QhwmpTD/7xLkii/Crl4Sgj4f1ky64YUpg05UgTobrCyzOuwOXpm9oi0PlvjZYOXNdPWNhmontXF5yJM4j/OrHRcY9Etq35m9llH1sskVsmvs5Z1nsV6f2biivxR0nfQx3Wi+7FlzMaOKVr6pV0A8suDalkZey5y0FPV0C+aLQ0DSvC9WyfS9QkzvxLw6Rl3ywdbrHiD3AlMXBZByDDr94cke/Jzo3H9CsuwVrRgei83LzShlRTJMcLAR1VNJcba6eAOxw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(376002)(396003)(346002)(451199018)(40470700004)(36840700001)(46966006)(336012)(40480700001)(2616005)(83380400001)(86362001)(2906002)(82310400005)(36756003)(478600001)(7696005)(6666004)(1076003)(26005)(186003)(36860700001)(356005)(40460700003)(47076005)(66574015)(426003)(7636003)(82740400003)(7416002)(5660300002)(8936002)(41300700001)(6916009)(4326008)(8676002)(70586007)(70206006)(316002)(54906003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:17.3032 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 957cda5f-f68f-4035-6a37-08db102b4d99
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT050.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6840
Received-SPF: softfail client-ip=2a01:111:f400:7e8d::600;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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
index 8e96999669..a3bf7327a1 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -786,14 +786,14 @@ static void vfio_migration_exit(VFIODevice *vbasedev)
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
@@ -804,6 +804,14 @@ static int vfio_migration_init(VFIODevice *vbasedev,
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
@@ -823,6 +831,8 @@ static int vfio_migration_init(VFIODevice *vbasedev,
         goto err;
     }
 
+    g_free(info);
+
     migration = vbasedev->migration;
     migration->vbasedev = vbasedev;
 
@@ -845,6 +855,7 @@ static int vfio_migration_init(VFIODevice *vbasedev,
     return 0;
 
 err:
+    g_free(info);
     vfio_migration_exit(vbasedev);
     return ret;
 }
@@ -858,22 +869,13 @@ int64_t vfio_mig_bytes_transferred(void)
 
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
@@ -883,14 +885,12 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         return ret;
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
index 90a8aecb37..6be5381cc9 100644
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


