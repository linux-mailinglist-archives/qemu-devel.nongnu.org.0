Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC95966C1C2
	for <lists+qemu-devel@lfdr.de>; Mon, 16 Jan 2023 15:15:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pHQEh-0003ZI-Ia; Mon, 16 Jan 2023 09:13:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQEf-0003TM-Df; Mon, 16 Jan 2023 09:13:17 -0500
Received: from mail-dm6nam10on2061.outbound.protection.outlook.com
 ([40.107.93.61] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pHQEc-0002Ti-TV; Mon, 16 Jan 2023 09:13:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MmUuoeiSi2FMO/w4aeHcjIGXyj2Uon7wI8eEYCqANSBRjqxujCuyHJEKmhmkWA+Irplfq+BL0nSIMfKCsIbW3UeJx7TnWLqRkQOsUDJSo4Xi3Bgg61F0AigehxRsr+5yaJ4HN6kEzWLwv0BV58eCjfSjAf9yrssWCDdKn1dkA+sfnHar5YnyXmEr51vzbtYTRmWsVWpVVkDbhAlKNmhdVwQKqLZdGJonImbhb6Tm8H8ZAL0TpNDfqEUcvZyHh7Pa7NMuTvPkIbfxZMqSWVr+7UV1kxDGR6Sv6PYpCQ+tC6ZSKV078aZezzzbwe7eZ4G4KwmsUWM8MrlRc1LMfG6yAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cLqoj5GsLSHGEbhD7arjt/hyaH9jVKHBfoznVzzFSRs=;
 b=dEy2RFg0NEMvs1+KoF3a7jr9BQUQfUOesxc7QD+5SagMExX31+aiYstuH0l+uQ7ru2rWUd/MTT+7zrbpakWukdDUNSBumlfTtaaaLwhoaioA9nvJ+PW5u4oB5xBr3PCjkmroeair3n1vHmO+7p6DRSUrzDWYam7ak4P5iFpFbyykkoqAtsIXKrlMqxMbN5hM45hw6TAXIzfOjzfeBE8TnL9YorpeRzFe7WC8eNVja+unnWqzXDl008MmQJcCzqtWbWNVafa6zopV6vc3Q88aJ/cR8Fm9kqYcNYU1Ll9+9pNmLH4G2JzyHSCEE37Whsm8/eqWwlse1s27H3LUtPtoNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cLqoj5GsLSHGEbhD7arjt/hyaH9jVKHBfoznVzzFSRs=;
 b=fvTezy4kBDo31rELgkocII4mxYmVLyWChZ+0uY+PXm1yOJL/TuctRUS5Y8sJll38+847vAXjH8kpL3djMb1ASxlyeIS6m8N4Aq+JytuSsSfifRg60Rv1VQEhWwSOg6U7jxVRK3G0tPl16oXyRBjjSFcGque2oRx03OYtfS+3Ubb0D2WssMdUUSAYlDDvM4wtMKBktQz2cOJBNl66OJkdLgMhvYivGsWo1oDZBaitzXHKx+xutOl/dvN/a2PnAmAyMtI2tGPJawDVToRxoo+cjIOkOxynuTjiYxwrSvuIb2/7lWd+3MUMrEJfrj6BCCzCM+8vrQo/8LocyVV9XefUSw==
Received: from DM5PR07CA0070.namprd07.prod.outlook.com (2603:10b6:4:ad::35) by
 DS0PR12MB8341.namprd12.prod.outlook.com (2603:10b6:8:f8::10) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5986.23; Mon, 16 Jan 2023 14:13:08 +0000
Received: from DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
 (2603:10b6:4:ad:cafe::8c) by DM5PR07CA0070.outlook.office365.com
 (2603:10b6:4:ad::35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Mon, 16 Jan 2023 14:13:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT094.mail.protection.outlook.com (10.13.172.195) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Mon, 16 Jan 2023 14:13:08 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:12:57 -0800
Received: from rnnvmail201.nvidia.com (10.129.68.8) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 16 Jan
 2023 06:12:57 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 16 Jan
 2023 06:12:50 -0800
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
Subject: [PATCH v8 10/13] vfio/migration: Optimize vfio_save_pending()
Date: Mon, 16 Jan 2023 16:11:32 +0200
Message-ID: <20230116141135.12021-11-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230116141135.12021-1-avihaih@nvidia.com>
References: <20230116141135.12021-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT094:EE_|DS0PR12MB8341:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d68cf8a-0f45-4273-1918-08daf7cbcb38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: A0WOJLfll/TSvf0BrB0q4nxHB2hO3uKMye2BgGkckRFwZJKPxHbBrcc5DkcLN2pjhswZAbEh0Y4TzLZXT8AhFfXWkWReNX8kYos1dY4aNISOOHwBlNtQZYkRf22jQyh9w+GdBt9RnmdaC8ldpGRagsvWn3cA8NmSqpNqICCe3Z18+zF0dNyriv69uv6mp/kZ/4PEDnZfPY+pVaHKNposwqanLi42dWgbRyTj65YBIjapTFFJbWZsy36OTFJiMlxHnAQwJmbCMv7YbI5+2cVACe1jHtMSytm8/t9oJHZxu+sfo/ShuvGJLUhQkJs0hWihLnIbECXVhhB/5cXVG7Qrx1a9I5eMsgihKzUapcc0m66T7SODCX75qkv4dvdw04oaBMF/SlfPLkj3UAU3yDhX3VEvo+QqQanTu3iawy7+MDpw9mflmQovo4CCqMK/NZQR+4fERcr6SYB8s9cgNJNV49kPqElaxu4loVMTHw8YYPpAimC7j0dkqaFvVEl1NfOHBJT+QUY5tXXaBENF9Mzb3lDuj8hf9xHDVMizUmrtvXt8Tipu4uK1Xxr3YPiDJxcftugULdIydLPhDZLTfqaN0RbLWKMTfESlMrSvML+PkEn73obJLZ/D4HYRQnbPxjaRrhpzPaSwGRZ1SSrQzT8y1EMQIeh0oRC3u0riZktS6uu51ycBieNjKyQ8Hv8WokznCDqg3+h7ZNf3u6PjeXTfCw==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(39860400002)(376002)(136003)(396003)(451199015)(40470700004)(46966006)(36840700001)(82310400005)(70206006)(426003)(70586007)(41300700001)(2616005)(66574015)(47076005)(26005)(186003)(8676002)(4326008)(6916009)(86362001)(36756003)(83380400001)(36860700001)(5660300002)(82740400003)(336012)(8936002)(54906003)(6666004)(478600001)(7696005)(316002)(40480700001)(1076003)(7416002)(2906002)(7636003)(356005)(40460700003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 14:13:08.4813 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d68cf8a-0f45-4273-1918-08daf7cbcb38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT094.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8341
Received-SPF: softfail client-ip=40.107.93.61; envelope-from=avihaih@nvidia.com;
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
index 6d7d850bfe..1f4c41bf9a 100644
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
index f19ada0f4f..87ef2b44ef 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -655,29 +655,19 @@ static void vfio_v1_save_cleanup(void *opaque)
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
@@ -1104,6 +1094,40 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
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
@@ -1225,6 +1249,9 @@ static int vfio_migration_init(VFIODevice *vbasedev)
 
         migration->vm_state = qdev_add_vm_change_state_handler(
             vbasedev->dev, vfio_vmstate_change, vbasedev);
+
+        migration->migration_data.notify = vfio_migration_data_notifier;
+        precopy_add_notifier(&migration->migration_data);
     } else {
         register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
                              &savevm_vfio_v1_handlers, vbasedev);
@@ -1283,6 +1310,9 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
     if (vbasedev->migration) {
         VFIOMigration *migration = vbasedev->migration;
 
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


