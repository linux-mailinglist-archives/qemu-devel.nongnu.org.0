Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC9EA658C13
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:11:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqjf-00084e-Dr; Thu, 29 Dec 2022 06:06:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqjG-0007r6-6C; Thu, 29 Dec 2022 06:05:42 -0500
Received: from mail-sn1nam02on2065.outbound.protection.outlook.com
 ([40.107.96.65] helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqjC-0006n5-DL; Thu, 29 Dec 2022 06:05:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQkmQjSVs5dktYuVGQ6s4RfMc47HywvnpCHdt7eRLdynmOcgSYpozfxOdMqRbAuqr7otRKPEoMRlUNiGbDy3JsOXB85NwnMoBWmI/IywBoTuXoR5sdSoZ6LzPKVYaPgfKEFAdKgNxTKz8OQ1LcdFei3neofELbzjbEGPN7/fOr9UtwgjxwnApaYEHRLv2N2HlLJY9ANdqUPU88nazFH/CJg/W+KYr/VlL4Bka6rQZR6UA/hutHuGEGxew/eLmMfvanMWnFTvSGtjvPw5Rj3LMQxYToEqpQa9cEIB4lcp00h3qDZS+96CB894psNbIJFWhpMGvf08M49nVyW6PAcepw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3+Gpr50kwsNSzyDbIMLHAaHkoQqpG0JGjMxBZX4GGto=;
 b=ZhA1n6YuoHlOJ8R5LLjTRvarIBAREkUhSAVpCXH2WObWNHZqGqO0FCcz5VKQBwOK8GPrjaOZ/v9WAdbVCFNTWlaByROtnsuxb4J5s7IYijJC7hTsmsyISHiE9eFJBfIaODTnUePptK6+FyRn9CXjwnaP3v77hg7dJ90b5UHiaJlaZihgggbz9EscwZ3yeTaLv4zhbq22XqwYgmrOYOKAm1SMSrzahpzPlQa+GqwIDC1+UoeBgMV3UBOQ58ouxe5jUfohhqa/3GEt314QxUErsBfPxcPQItdtN+4vyU+7zsFeO94XgKayFif3JOdhQY+L183gpVQIDA9CsUIiFFVcwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3+Gpr50kwsNSzyDbIMLHAaHkoQqpG0JGjMxBZX4GGto=;
 b=EzpUhmjaFXlR4l3PtwlM8yiAZfKAYsgWJgGpiwqJ5YPcf08TsdpYnlZpvgSk1rEJJqo/7qYOVZyjCNVC+N/uect2tpU9VUO31Iais80l1oL9KQ2dFbU7OQNHGO+xlKzZPFr3ogSpY35GyvddFTQwM028KjjCck7SHnpjvm536dwhJvtewywirWM/JykcgVfZAQ2VQ2dmfRs9JrxOQuHn8NyjjMpVMkkY0qPy5h73/aCOZ/RvS9wpK2LPn3jB7RdWCxJ3HooTJ4kQI3dqXj6CTQqmY/D4TddBre6Iz/rUvTxLNopTLFh4jo8j+clNrt02WwFKxbx0lCr975gbuFcwmw==
Received: from DM6PR03CA0082.namprd03.prod.outlook.com (2603:10b6:5:333::15)
 by CH0PR12MB5058.namprd12.prod.outlook.com (2603:10b6:610:e1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.17; Thu, 29 Dec
 2022 11:05:31 +0000
Received: from DS1PEPF0000E649.namprd02.prod.outlook.com
 (2603:10b6:5:333:cafe::89) by DM6PR03CA0082.outlook.office365.com
 (2603:10b6:5:333::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Thu, 29 Dec 2022 11:05:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E649.mail.protection.outlook.com (10.167.18.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:05:31 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:05:16 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:05:16 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:05:09 -0800
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
Subject: [PATCH v5 11/14] vfio/migration: Optimize vfio_save_pending()
Date: Thu, 29 Dec 2022 13:03:42 +0200
Message-ID: <20221229110345.12480-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E649:EE_|CH0PR12MB5058:EE_
X-MS-Office365-Filtering-Correlation-Id: 20435926-555d-4795-33b0-08dae98c9a06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HvEoW21Vi/y3MJF797PcjEx6qv4g7V/mUxQmKGH7cuGjdkxTSx2X8Z79RQr2KmOfGMsJTW0r8jFvNJfw2Rt8Z6PSA1CNMoXDzrrpf6qRYr40iOwQU6A+uULXuvRuqkEV0ilVtkBBf3X+GC9/bRhcD7WKA9R0gA7NzCuaHjJZzln/Vtt417iwPAwC+GoGuWnt1gCHX/8nEOnic/U4JBk/jVEcF8/duK+k6RovNk9zElCT8DxlR8WCOSfdVAEFgKk411gdUVbfv/XDDtFYEip9PiRjQwlx0URDGEJGcuDXEqJiZycrFxuswuPEuwiekRQ6fdS89fo8QGSfcPjSbgd5A1dtBHUH4O96OlvA0Qav9Welg2y5WhT4ORELT8scb2QZKwVEQEGNUDC/fB3b3jTVzONHpGTWNnpk82p6mqHb3I/+xc+hI+nvjsK3IrFNYIK5I7AuBD3KB6GG3Pf1N0a/zBg/A8xIOcUI//W0YY6AsAm5iCFzLh4fHVSTDoW2RUrj3qCHlWoy0zw8UCl+CNNrjDCAVCvVVvo2cVqMHewxjuahONsb3+mUfJqNS4tnrkNPr44d5zc5dJX9K3j2YiTswP8ude3jvStnzIaOmkVuPxqKLAELX1YAl5uJjvsU+sWvld7jOQCMww+3sN8pzco53qddk/h89ofEcA6kl8oZvv95gQnDEDXmhEWjKvtJGlRnOEGbJNUDCwzFe6xEG9bwyQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(136003)(39860400002)(396003)(451199015)(46966006)(36840700001)(40470700004)(36756003)(70586007)(70206006)(36860700001)(6916009)(41300700001)(4326008)(86362001)(8676002)(316002)(7636003)(83380400001)(356005)(82740400003)(6666004)(7696005)(426003)(336012)(478600001)(47076005)(2906002)(8936002)(5660300002)(7416002)(54906003)(40460700003)(40480700001)(26005)(186003)(82310400005)(1076003)(2616005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:05:31.3574 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 20435926-555d-4795-33b0-08dae98c9a06
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E649.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5058
Received-SPF: permerror client-ip=40.107.96.65;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
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
---
 include/hw/vfio/vfio-common.h |  2 ++
 hw/vfio/migration.c           | 59 +++++++++++++++++++++++++----------
 hw/vfio/trace-events          |  1 +
 3 files changed, 46 insertions(+), 16 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index 2ec3346fea..113f8d9208 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -65,11 +65,13 @@ typedef struct VFIOMigration {
     uint32_t device_state_v1;
     int vm_running;
     Notifier migration_state;
+    NotifierWithReturn migration_data;
     uint64_t pending_bytes;
     enum vfio_device_mig_state device_state;
     int data_fd;
     void *data_buffer;
     size_t data_buffer_size;
+    uint64_t stop_copy_size;
     bool v2;
 } VFIOMigration;
 
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 645fa33a46..242ea211f5 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -657,32 +657,19 @@ static void vfio_v1_save_cleanup(void *opaque)
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
-    uint64_t stop_copy_size;
-
-    if (vfio_query_stop_copy_size(vbasedev, &stop_copy_size)) {
-        /*
-         * Failed to get pending migration size. Report big pending size so
-         * downtime limit won't be violated.
-         */
-        stop_copy_size = VFIO_MIG_STOP_COPY_SIZE;
-    }
+    VFIOMigration *migration = vbasedev->migration;
 
-    *res_precopy_only += stop_copy_size;
+    *res_precopy_only += migration->stop_copy_size;
 
     trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
                             *res_postcopy_only, *res_compatible,
-                            stop_copy_size);
+                            migration->stop_copy_size);
 }
 
 static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
@@ -1109,6 +1096,40 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
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
@@ -1220,6 +1241,9 @@ static int vfio_migration_init(VFIODevice *vbasedev)
 
         migration->vm_state = qdev_add_vm_change_state_handler(
             vbasedev->dev, vfio_vmstate_change, vbasedev);
+
+        migration->migration_data.notify = vfio_migration_data_notifier;
+        precopy_add_notifier(&migration->migration_data);
     } else {
         register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
                              &savevm_vfio_v1_handlers, vbasedev);
@@ -1278,6 +1302,9 @@ void vfio_migration_finalize(VFIODevice *vbasedev)
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


