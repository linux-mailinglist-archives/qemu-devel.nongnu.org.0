Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 420E0666D46
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 10:01:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFtK8-0006Nt-8K; Thu, 12 Jan 2023 03:52:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJM-0005qX-HV; Thu, 12 Jan 2023 03:51:55 -0500
Received: from mail-co1nam11on2044.outbound.protection.outlook.com
 ([40.107.220.44] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pFtJJ-0007ch-By; Thu, 12 Jan 2023 03:51:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mISJbJL7I5exq4uHpSEKVksBnJZVq/7z7HhUco7D7Enw7UOYuBzbnauNXjpeQmLlMAGIZFtUv9JQQhRl0Lcgt8npW0M4EpW/jrcH7xZZLSjEprSognYNtON6FR2W919UaegoLNHq3Evn6/IwuvPm6reoD/q46ujn07SDFKRTB2XP7b2YNvXDyAcPIrG3QYi4maoeJ1/T8fvsTfZ+Pyj/LAzve+PP5MU0j1r1pMimnGLQF6pzcsdZyPDA3+Y3Bb1gw3IiATBL02Fxo6yFGuPDHE5lkYL7UtBepNUMxsyQDz5dkoQUIfwm/zwwO/u+bHWFzn0CHz8kq68j3l7YWZ7ebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hqxp47D1axONfpF66psW6OPVmTyJD/URYLTnxyzgbF0=;
 b=kYQ2tYFgx3h4120Epai+2CQ2Mp2iXnGp6BN94lrAegmPUvzHF8rFrhClUD0Es0wse6wciHuQB3PKDfqk4vlnBpsrg7hgqSxphiMsDaOugUYlYcmHNpkxaEomEyvCV5zYHeJ0FK8kdKdf4GTXexy4jLstpPARicyIinq4VBeZg5W1453JFw4ycqrG1kubjoCG3N9m96WdHW2ej3VYJcA4MTruRH3TpqBh4td4/MHNF/SwM0ZErcY6YZKh2CULZX6TW2t4VN6+C9+8h6CtfnzyZCbTSnzHLdU7HKVZjx+vPDvV2Pt9EfkRJWdEymhS9yiqalrpoZdwZLtxUmAdbD5k8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hqxp47D1axONfpF66psW6OPVmTyJD/URYLTnxyzgbF0=;
 b=pW1MqFSdo/4F5k6H3epXNYIKsNCrX+F2PnqV39VD4qaU/ko6232kwsRhSHA5IMGio6swl0hbqAtG4/D6J4N5rXqCKM99FlnvmLgbGNEjt342izZyDXwoWZ804hbymio1G4PhuVpEu93x0H3oubRxrRF9yZuhF1OUroFm1uwCnJcoqnr2pWkG/h+kWNd6T3f9rTZKKJuqqr+BVJW45lx1Kq37NiaIiYFRKI5CnOC/07bxj5pjU84vBHvGUcXrw6aNHNBbiAaLqGqEIbcKKIOXJO/CZUpUD9AE6Ig5sXX3Z8bgaYkCcpbk1/W4huLAy4vnfcHN0lps4tT9MTPiD9eXlw==
Received: from DM6PR14CA0062.namprd14.prod.outlook.com (2603:10b6:5:18f::39)
 by BN9PR12MB5098.namprd12.prod.outlook.com (2603:10b6:408:137::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13; Thu, 12 Jan
 2023 08:51:41 +0000
Received: from DS1PEPF0000E632.namprd02.prod.outlook.com
 (2603:10b6:5:18f:cafe::3f) by DM6PR14CA0062.outlook.office365.com
 (2603:10b6:5:18f::39) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.13 via Frontend
 Transport; Thu, 12 Jan 2023 08:51:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DS1PEPF0000E632.mail.protection.outlook.com (10.167.17.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.11 via Frontend Transport; Thu, 12 Jan 2023 08:51:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 12 Jan
 2023 00:51:36 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 12 Jan 2023 00:51:35 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 12 Jan 2023 00:51:29 -0800
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
Subject: [PATCH v6 10/13] vfio/migration: Optimize vfio_save_pending()
Date: Thu, 12 Jan 2023 10:50:17 +0200
Message-ID: <20230112085020.15866-11-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230112085020.15866-1-avihaih@nvidia.com>
References: <20230112085020.15866-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E632:EE_|BN9PR12MB5098:EE_
X-MS-Office365-Filtering-Correlation-Id: d3b5f90e-121c-4ad6-6c12-08daf47a390b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZhWrDQ7TrFmT/RhNah4s4WYP/TaJcGrXMp4VQzh6uXiKETXqJ6QJd+2+v8j6QyMNTb840mOQYKHdwD1k0WkaYR0gyd+81m/PpbGcoMl7lYbck4vJwmuOa6AwUuTVKdMt1d1DkMPoGk72aMTJkROaEz3k07q+Rv27GdIG5H8qbuBqkcRSvRNnOxNcVLgioEu748d7k1jNRW4RJjQ9Wwx1PLdRARngGUsEPdqu4QnZ1Zl7rPubE4lR2IHeex9ZgijelndNou/U5xAFQNz1X2pCsyVRhn1DTVkD+heKzUMjHTLe18rZWarVpu4/NQuHJBHW1sXQLU+gMkZV4GRhBMhK4MNxmxyMELDbq+69ARecectkKj/mPxb+fVra2DCySSCSfRdXYd78dfUmi36ETbe93C/y0peb2UXpF3bdMSdnxhXcbhQ4OksiEOMGePfyiHQc+Py3YbcfMJ+mbDFGEzTzH+Op7W02OhVPamChmmjB8DMfNCMoSP7nO6GgZgk/DcML01MBfWjICf3tz/HkrfttOfxaqiqQVfAuQ0Pn3xzip1fEebZBRJc0QEUoEBgCCd5+ONrsifqNtnihA10Ht+dTgdH/vFirr7W8ijrJkSeP9kHjnUcqjOZDl+fpyxtrHnZv3y6Yvc9CGILMdRfbXZraQNZAAsBfrZ1KW6+4EAZRYjf4QZGlh4QokerHER0y74L033Ohtt1+Rv9zGKdvCul6qA==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(39860400002)(136003)(396003)(346002)(451199015)(46966006)(40470700004)(36840700001)(82740400003)(478600001)(426003)(356005)(7636003)(47076005)(41300700001)(1076003)(40460700003)(86362001)(316002)(54906003)(2616005)(70586007)(26005)(336012)(40480700001)(186003)(7696005)(82310400005)(4326008)(36756003)(70206006)(5660300002)(7416002)(36860700001)(2906002)(6666004)(8676002)(6916009)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2023 08:51:40.5021 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d3b5f90e-121c-4ad6-6c12-08daf47a390b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E632.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5098
Received-SPF: softfail client-ip=40.107.220.44;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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
 hw/vfio/migration.c           | 56 +++++++++++++++++++++++++++--------
 hw/vfio/trace-events          |  1 +
 3 files changed, 46 insertions(+), 13 deletions(-)

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
index 08f53189fa..04f4397212 100644
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


