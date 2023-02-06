Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6961068BCE2
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:33:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0gl-0005zp-Rr; Mon, 06 Feb 2023 07:33:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gZ-0005bf-Kj; Mon, 06 Feb 2023 07:33:29 -0500
Received: from mail-bn7nam10on20627.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::627]
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gX-0000dn-JH; Mon, 06 Feb 2023 07:33:27 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BbceciEJItLDe6kD4E9bMyegNPoQ2NDwql4eaA1iQzP+JXbZ6BTc+0t3x4p4dXQlhNNMxaGWh8k+CQmap1ssjAZPwS7kuwYCC2kVpsYc5BT3W/hD342Ac8/775+ckbdP/wCE6l6cQKy9RjjVDcl22+StxCTQyXzSlhLJ4SSMLqc5xRDvSWuCCqDPKBzmWMU3vK2Z6u/2J/e92dKUm9dZJlXkSxDBEmgpoRMnJrYW7fYh2SalJ6i9ge2d8p2qRiiKOHOgx4Q6eW0otMHWxhZgcnQI++gt5iNXWcW7XH7etMOIiNYk1dD8y6/U7Eh7avqzIfnpDXdJ/Zl/psQuerx7Cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ocCDAx+TzdEsxmmPwEAVt1Yv5qBvxYrHih28U9PIzkI=;
 b=nFRj7alBK3bcnkMrHC/Ga87mMEKrcQVVnAmhxQUG0auIkGbhW20/YLSyXB72rn/+k+LW17SbL5NGUpj2J0rbgIhq8/MzjumctzWhxB81hB9Jiu89twXdkUAc2WdOtDaMItYSjb68NX/vFyzHs/EAXo84yCTHq4f2lhwUxYIkwP4TKht2rC2HcCNs/fXBHVvKRGVIh2QrDc4HL1OkRnoF422u72g0DAFqNmvrmhlI6wcChlZDzGDCXWWNiH3HJsXcTwEG3nG6YVkBczBLAEj36hzC5P+qMKa8rdVzq9AZl2OWVBalovGy6N5ONHRu0hHrmrnZty3s5AvyH18ox4rfMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ocCDAx+TzdEsxmmPwEAVt1Yv5qBvxYrHih28U9PIzkI=;
 b=SQ2kVvv2UBs/rmbN3jrhtCHMQUkkBhJwAZ3GF71x2xFBQgHsIYItz1mmaGx9sY82rPZGsOjB5y0TBX3pjpHNNBMbYHvqFeNd49qiouZXSEm3qkA0aPYWf3dzoj5Vi7mfw6tWCcxjD81N2RaMppjxi/5A9VYoi2HSXy/lbfbL/3GUr1paolDzKs/n72YXgOc9047m11dH1VZgvqT6oZ3st+9srVtw80j9WkAkyLngLqCgVShYIKD/JQrgifs1yTpzsXbQv/9eVryDae7ubhZw694K77YOL+e/X2qp7bsjoUu5CMKhY+SDflP/CP77e8tLfj7ugMFpd7ht6R/HNY0XKw==
Received: from DM6PR03CA0086.namprd03.prod.outlook.com (2603:10b6:5:333::19)
 by IA1PR12MB8191.namprd12.prod.outlook.com (2603:10b6:208:3f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.32; Mon, 6 Feb
 2023 12:33:22 +0000
Received: from DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:333:cafe::f1) by DM6PR03CA0086.outlook.office365.com
 (2603:10b6:5:333::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 12:33:22 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT104.mail.protection.outlook.com (10.13.173.232) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 12:33:21 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:33:12 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:33:11 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:33:04 -0800
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
Subject: [PATCH v9 11/14] vfio/migration: Optimize vfio_save_pending()
Date: Mon, 6 Feb 2023 14:31:34 +0200
Message-ID: <20230206123137.31149-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT104:EE_|IA1PR12MB8191:EE_
X-MS-Office365-Filtering-Correlation-Id: bc4ee7c0-9000-457e-7d3b-08db083e55a6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aVCQZpUsx6bx+3m7kWGX3vp0S+/tXN1qBCWQDzm8QmIyzyOYAu9W5Oany8Csi0hXFFHaUwRw6D1KseV2U+FoNiWfU2olj922CaWrBW4GsLa+8gRRCDm5qTCzzOye1wJWGQ+5EuNBT0AEMByE4y5pzZ5Kq8g7BM5M43McoagwRpkCo9+hCTFa260uFZVi2TSBqRKMmDLUwh3jd4ikUmRF5O8LLK29f6yprKp20hVKTsufwKgAwjsb9Y/Yuq8Thf7+b2/tSZ/9UieaT1aGP/S7+0gNPwcEPpQIgbhl+pGJVf4TVSGtejIEWNohGtYRv1oIWdYA/ojhkjPvdUB205u4vWe4fv2cwLMPuuHqJHZBNBESjIugMmDMWxbXSRs6xqikPqZg6+MgMK8rBgZGdrDc0MGHmv+kdMySAtAceUXaqzLwYdafrXRY6rplNsnrxcQ6wduka1DPON2BceHO/RMU/I9Ylunks9/OxXwf3ijBwNG02GYu3fnVfZBWzdVU3W+op9bHsOrj9fZ0KYW/j/s0rZl0NzhzsFNcucEInOtE52o4f8qWP1I+lz0r0IbseAs/HMa3Veo6xrAuQg92nrzJBvSdhzU/Sa0yINYM/Cjc0rkXg4Om2v6mYYCAQW+L3Ylv2fXXNF0hwPotyfCcckajGvJiCjS2MpBwrj6PRgExOgyTBHbbhRJUAcSRKtTVyKTjA4irrTVvQ5FKF7yoFfas/Q==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(376002)(136003)(451199018)(46966006)(36840700001)(40470700004)(83380400001)(478600001)(8936002)(26005)(1076003)(36756003)(186003)(41300700001)(47076005)(40480700001)(426003)(7696005)(336012)(54906003)(4326008)(316002)(6916009)(2616005)(70206006)(86362001)(8676002)(66574015)(70586007)(82310400005)(40460700003)(356005)(36860700001)(6666004)(2906002)(7636003)(5660300002)(7416002)(82740400003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:33:21.9463 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc4ee7c0-9000-457e-7d3b-08db083e55a6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT104.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8191
Received-SPF: softfail client-ip=2a01:111:f400:7e8a::627;
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

During pre-copy phase of migration vfio_save_pending() is called
repeatedly and queries the VFIO device for its pending data size.

As long as pending RAM size is over the threshold, migration can't
converge and be completed. Therefore, during this time there is no
point in querying the VFIO device pending data size.

Avoid these unnecessary queries by issuing them in a RAM pre-copy
notifier instead of vfio_save_pending().

This way the VFIO device is queried only when RAM pending data is
below the threshold, when there is an actual chance for migration to
converge.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/migration.c           | 56 +++++++++++++++++++++++++++--------
 hw/vfio/trace-events          |  1 +
 3 files changed, 46 insertions(+), 13 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index c4eab55af9..3c94660608 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -65,11 +65,13 @@ typedef struct VFIOMigration {
     uint32_t device_state_v1;
     int vm_running;
     Notifier migration_state;
+    NotifierWithReturn migration_data;
     uint64_t pending_bytes;
     uint32_t device_state;
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
+    uint64_t stop_copy_size;
     bool v2;
 } VFIOMigration;
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index dcffe9235b..5daeb5a106 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -653,29 +653,19 @@ static void vfio_v1_save_cleanup(void *opaque)
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-/*
- * Migration size of VFIO devices can be as little as a few KBs or as big as
- * many GBs. This value should be big enough to cover the worst case.
- */
-#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
 static void vfio_save_pending(void *opaque, uint64_t threshold_size,
                               uint64_t *res_precopy_only,
                               uint64_t *res_compatible,
                               uint64_t *res_postcopy_only)
 {
     VFIODevice *vbasedev = opaque;
-    uint64_t stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
+    VFIOMigration *migration = vbasedev->migration;
 
-    /*
-     * If getting pending migration size fails, VFIO_MIG_STOP_COPY_SIZE is
-     * reported so downtime limit won't be violated.
-     */
-    vfio_query_stop_copy_size(vbasedev, &stop_copy_size);
-    *res_precopy_only += stop_copy_size;
+    *res_precopy_only += migration->stop_copy_size;
 
     trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
                             *res_postcopy_only, *res_compatible,
-                            stop_copy_size);
+                            migration->stop_copy_size);
 }
 
 static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
@@ -1102,6 +1092,40 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     }
 }
 
+/*
+ * Migration size of VFIO devices can be as little as a few KBs or as big as
+ * many GBs. This value should be big enough to cover the worst case.
+ */
+#define VFIO_MIG_STOP_COPY_SIZE (100 * GiB)
+static int vfio_migration_data_notifier(NotifierWithReturn *n, void *data)
+{
+    VFIOMigration *migration = container_of(n, VFIOMigration, migration_data);
+    VFIODevice *vbasedev = migration->vbasedev;
+    PrecopyNotifyData *pnd = data;
+
+    if (pnd->reason != PRECOPY_NOTIFY_AFTER_BITMAP_SYNC) {
+        return 0;
+    }
+
+    /* No need to get pending size when finishing migration */
+    if (runstate_check(RUN_STATE_FINISH_MIGRATE)) {
+        return 0;
+    }
+
+    if (vfio_query_stop_copy_size(vbasedev, &migration->stop_copy_size)) {
+        /*
+         * Failed to get pending migration size. Report big pending size so
+         * downtime limit won't be violated.
+         */
+        migration->stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
+    }
+
+    trace_vfio_migration_data_notifier(vbasedev->name,
+                                       migration->stop_copy_size);
+
+    return 0;
+}
+
 static void vfio_migration_exit(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
@@ -1223,6 +1247,9 @@ static int vfio_migration_init(VFIODevice *vbasedev)
 
         migration->vm_state = qdev_add_vm_change_state_handler(
             vbasedev->dev, vfio_vmstate_change, vbasedev);
+
+        migration->migration_data.notify = vfio_migration_data_notifier;
+        precopy_add_notifier(&migration->migration_data);
     } else {
         register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
                              &savevm_vfio_v1_handlers, vbasedev);
@@ -1287,6 +1314,9 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
         VFIOMigration *migration = vbasedev->migration;
 
         vfio_unblock_multiple_devices_migration();
+        if (migration->v2) {
+            precopy_remove_notifier(&migration->migration_data);
+        }
         remove_migration_state_change_notifier(&migration->migration_state);
         qemu_del_vm_change_state_handler(migration->vm_state);
         unregister_savevm(VMSTATE_IF(vbasedev->dev), "vfio", vbasedev);
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index e7b3b4658c..a8a64f0627 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -173,3 +173,4 @@ vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
 vfio_save_block(const char *name, int data_size) " (%s) data_size %d"
+vfio_migration_data_notifier(const char *name, uint64_t stopcopy_size) " (%s) stopcopy size 0x%"PRIx64
-- 
2.26.3


