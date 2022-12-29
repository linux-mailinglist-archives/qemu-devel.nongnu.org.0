Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EEA8F658C0C
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:06:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqj8-0007dF-KA; Thu, 29 Dec 2022 06:05:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqir-0007Nn-AQ; Thu, 29 Dec 2022 06:05:17 -0500
Received: from mail-bn8nam04on2067.outbound.protection.outlook.com
 ([40.107.100.67] helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqio-0006kI-Bp; Thu, 29 Dec 2022 06:05:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WKB4+qS5lnR2NdsnqiUMx1T0pTcGWAYScamj67RNkG/Om0s2vW97gLMHsayg9GJL0Dvqjsd0tOm+tQTrWV6VaUA6+V3rcP6gTClH9noYQ/KALNiej/n+MmdnXkmXoJ69t0Y0c1ptmBYC2co1AFx3ewpHXKR6zDusa++DRFlnOtFVUrGo1YdBdZC8yiFppWenw42cc/eOB4yRUXutbtf3KCTtcxZchCh+v7DUr6H9XpsL67AjVW8zmzdeSKfeL6fWJo1ruyCDtJT1mng2ZcyrnKqZ3ZiWqDlxU2OuSBTITiSbFJZX7hBeVj4LxFa8n7mhyZubcB4vARCCT2HS+SKMQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JNE/kUCxCZzT94mrkGn37jahPalKq+v6kQtWhCcikos=;
 b=BguOZCgf9+qqslTr9R8oo9x8NqFQsC44JABK2BXjbxRm1Ubw8P83awOmJKbL9SRrDSyMgruy7TQO25jM1EqCIe/mCFpA+/dDOA56J8oUho6tnj9DQNnhdp5uHtVjPTPwCqI6sI/SjIV3KlOsik3iIbq/OMXWNlQORc4SB4liE9ys17h49oM+XfjSmEKxdyZxyjTpbB1S5/xz9ukq1w0WRE9qn7exXdcxbyHxSNNu4pnq+3gepfn9gPzIIwtan8tlhg7+HyQYb+0r9hrM7Kgliu3OP1vZ1aX6enZbUPsvMWmkl7u6zb5EjWA4PsqpmQO34TyPJ3Lq0+HclKwxOTIMWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JNE/kUCxCZzT94mrkGn37jahPalKq+v6kQtWhCcikos=;
 b=ae03Z/ZJpDV1OMy2hrzFWr8n4wpG1GaXEQ2VPkjNaHXXcYwAbe9LU98CB8i18Y8ss2h9wTt1GWiUMT+4CkJpo2Bt/H3bYg4hz2/vzx4cNmMsqhJvWOFWJYGYwSgr4+nvBrjGSzkVRdtisw7sQ75rDoXwP+UldyDfTSqLhUPtqVHZsz218x6M0ahWK5TSP86sROPoIiJxE7A3XCFUKIQlmXvzyuTD5uic+c4oea5xGN5Q8guXkwIpDPwLzV+3/9dqpvWDp7r8vJ6ciNYYK3VK0bMIoLWOPvZ8AT5rVi0Wc9lJriR3S2kPI+RDsGheujhbJene/oXZWXph+98UJk0nLw==
Received: from DS7PR06CA0048.namprd06.prod.outlook.com (2603:10b6:8:54::24) by
 PH7PR12MB6419.namprd12.prod.outlook.com (2603:10b6:510:1fd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.14; Thu, 29 Dec 2022 11:05:08 +0000
Received: from DS1PEPF0000E63E.namprd02.prod.outlook.com
 (2603:10b6:8:54:cafe::e1) by DS7PR06CA0048.outlook.office365.com
 (2603:10b6:8:54::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.18 via Frontend
 Transport; Thu, 29 Dec 2022 11:05:08 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS1PEPF0000E63E.mail.protection.outlook.com (10.167.17.196) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:05:07 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:05:01 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:05:01 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:04:54 -0800
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
Subject: [PATCH v5 09/14] vfio/migration: Rename functions/structs related to
 v1 protocol
Date: Thu, 29 Dec 2022 13:03:40 +0200
Message-ID: <20221229110345.12480-10-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221229110345.12480-1-avihaih@nvidia.com>
References: <20221229110345.12480-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E63E:EE_|PH7PR12MB6419:EE_
X-MS-Office365-Filtering-Correlation-Id: 773ba9de-98a4-4fa6-7d7f-08dae98c8c19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZAMaFg2aD6j/2j56UoPYuQE/0d0g/4opplDbaJUMjmbLKdgsgdB3Cv/vCNNXQzeJM7elTN16BlB0Y6s6tuaytQwBOHvFq2GYTrwu4CDV4AgjsusLJFQYCG32TSIio5hZwYTTa97QrIpfTvX4m5aZsyU5Bpihtw1rK56fza97XxSZp+MYxzLH827HPg19t6p7hsQrw/yjBTIOGICEsP4IDDeG0WV7s9ihwOpNW2TOyWDf+upxwbMrgud1IhOyPxn5BdfQuHk2J0XtNP18vW8tKk2tmHCETE6cS1GrAS1tU/VVpsGJiKTvPT76jXV++ArJiUyqDxw177JhSbDRnybRqzBxhRNzHKB6j5PPJaZWpxXYwXcEz6BAM5HKdK3Y8sLZRO4DjZKLnSSRCVTuptzd+BB1j0ufPL4zp2D/Pd9WO6Nh6ffbT4n1xxSvIgAsjovvRgRgYaloDK/0yS6vFOhMaxaKbv4DckgDKbqUNEfr6uELAIae7KeHfx1mlccqczgSdeScg0llM1aUMWbYd84JNoUaQ7RfDJ8X7jjScOYHg57HKxH9+3y5e8tWHQqULEozrWEFYNv2Ixaws25PolpHa2BM2WkcOhPJq9NIOuTVttnhuchwe8Vb6NxAaQo2FFv81GB61qd7+RLkXkftTFbk0FSLj0rJNhlpKahFGx2Sz7Coo916hezeqWyNX39QBmAyGjXrSO1X+3eIEyOuIBVQUw==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199015)(46966006)(40470700004)(36840700001)(83380400001)(54906003)(6916009)(30864003)(40460700003)(2906002)(316002)(36756003)(2616005)(1076003)(478600001)(186003)(356005)(26005)(82740400003)(7696005)(7636003)(82310400005)(47076005)(426003)(6666004)(336012)(86362001)(40480700001)(36860700001)(8676002)(4326008)(8936002)(5660300002)(41300700001)(7416002)(70586007)(70206006);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:05:07.9801 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 773ba9de-98a4-4fa6-7d7f-08dae98c8c19
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E63E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6419
Received-SPF: permerror client-ip=40.107.100.67;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
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

To avoid name collisions, rename functions and structs related to VFIO
migration protocol v1. This will allow the two protocols to co-exist
when v2 protocol is added, until v1 is removed. No functional changes
intended.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/hw/vfio/vfio-common.h |   2 +-
 hw/vfio/common.c              |   6 +-
 hw/vfio/migration.c           | 106 +++++++++++++++++-----------------
 hw/vfio/trace-events          |  12 ++--
 4 files changed, 63 insertions(+), 63 deletions(-)

diff --git a/include/hw/vfio/vfio-common.h b/include/hw/vfio/vfio-common.h
index e573f5a9f1..bbaf72ba00 100644
--- a/include/hw/vfio/vfio-common.h
+++ b/include/hw/vfio/vfio-common.h
@@ -62,7 +62,7 @@ typedef struct VFIOMigration {
     struct VFIODevice *vbasedev;
     VMChangeStateEntry *vm_state;
     VFIORegion region;
-    uint32_t device_state;
+    uint32_t device_state_v1;
     int vm_running;
     Notifier migration_state;
     uint64_t pending_bytes;
diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 7a35edb0e9..6f0157c848 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,8 +355,8 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
                 return false;
             }
 
-            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF) &&
+                (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
         }
@@ -385,7 +385,7 @@ static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
                 return false;
             }
 
-            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
+            if (migration->device_state_v1 & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index 977da64411..9df859f4d3 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -107,8 +107,8 @@ static int vfio_mig_rw(VFIODevice *vbasedev, __u8 *buf, size_t count,
  * an error is returned.
  */
 
-static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
-                                    uint32_t value)
+static int vfio_migration_v1_set_state(VFIODevice *vbasedev, uint32_t mask,
+                                       uint32_t value)
 {
     VFIOMigration *migration = vbasedev->migration;
     VFIORegion *region = &migration->region;
@@ -145,8 +145,8 @@ static int vfio_migration_set_state(VFIODevice *vbasedev, uint32_t mask,
         return ret;
     }
 
-    migration->device_state = device_state;
-    trace_vfio_migration_set_state(vbasedev->name, device_state);
+    migration->device_state_v1 = device_state;
+    trace_vfio_migration_v1_set_state(vbasedev->name, device_state);
     return 0;
 }
 
@@ -260,8 +260,8 @@ static int vfio_save_buffer(QEMUFile *f, VFIODevice *vbasedev, uint64_t *size)
     return ret;
 }
 
-static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
-                            uint64_t data_size)
+static int vfio_v1_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
+                               uint64_t data_size)
 {
     VFIORegion *region = &vbasedev->migration->region;
     uint64_t data_offset = 0, size, report_size;
@@ -288,7 +288,7 @@ static int vfio_load_buffer(QEMUFile *f, VFIODevice *vbasedev,
             data_size = 0;
         }
 
-        trace_vfio_load_state_device_data(vbasedev->name, data_offset, size);
+        trace_vfio_v1_load_state_device_data(vbasedev->name, data_offset, size);
 
         while (size) {
             void *buf;
@@ -394,7 +394,7 @@ static int vfio_load_device_config_state(QEMUFile *f, void *opaque)
     return qemu_file_get_error(f);
 }
 
-static void vfio_migration_cleanup(VFIODevice *vbasedev)
+static void vfio_migration_v1_cleanup(VFIODevice *vbasedev)
 {
     VFIOMigration *migration = vbasedev->migration;
 
@@ -405,13 +405,13 @@ static void vfio_migration_cleanup(VFIODevice *vbasedev)
 
 /* ---------------------------------------------------------------------- */
 
-static int vfio_save_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_save_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
     int ret;
 
-    trace_vfio_save_setup(vbasedev->name);
+    trace_vfio_v1_save_setup(vbasedev->name);
 
     qemu_put_be64(f, VFIO_MIG_FLAG_DEV_SETUP_STATE);
 
@@ -431,8 +431,8 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_v1_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
+                                      VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state SAVING", vbasedev->name);
         return ret;
@@ -448,18 +448,18 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void vfio_save_cleanup(void *opaque)
+static void vfio_v1_save_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
-    vfio_migration_cleanup(vbasedev);
+    vfio_migration_v1_cleanup(vbasedev);
     trace_vfio_save_cleanup(vbasedev->name);
 }
 
-static void vfio_save_pending(void *opaque, uint64_t threshold_size,
-                              uint64_t *res_precopy_only,
-                              uint64_t *res_compatible,
-                              uint64_t *res_postcopy_only)
+static void vfio_v1_save_pending(void *opaque, uint64_t threshold_size,
+                                 uint64_t *res_precopy_only,
+                                 uint64_t *res_compatible,
+                                 uint64_t *res_postcopy_only)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -472,8 +472,8 @@ static void vfio_save_pending(void *opaque, uint64_t threshold_size,
 
     *res_precopy_only += migration->pending_bytes;
 
-    trace_vfio_save_pending(vbasedev->name, *res_precopy_only,
-                            *res_postcopy_only, *res_compatible);
+    trace_vfio_v1_save_pending(vbasedev->name, *res_precopy_only,
+                               *res_postcopy_only, *res_compatible);
 }
 
 static int vfio_save_iterate(QEMUFile *f, void *opaque)
@@ -523,15 +523,15 @@ static int vfio_save_iterate(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
+static int vfio_v1_save_complete_precopy(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
     uint64_t data_size;
     int ret;
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
-                                   VFIO_DEVICE_STATE_V1_SAVING);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
+                                      VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state STOP and SAVING",
                      vbasedev->name);
@@ -568,13 +568,14 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING,
+                                      0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
     }
 
-    trace_vfio_save_complete_precopy(vbasedev->name);
+    trace_vfio_v1_save_complete_precopy(vbasedev->name);
     return ret;
 }
 
@@ -591,7 +592,7 @@ static void vfio_save_state(QEMUFile *f, void *opaque)
     }
 }
 
-static int vfio_load_setup(QEMUFile *f, void *opaque)
+static int vfio_v1_load_setup(QEMUFile *f, void *opaque)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -607,8 +608,8 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_V1_RESUMING);
+    ret = vfio_migration_v1_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
+                                      VFIO_DEVICE_STATE_V1_RESUMING);
     if (ret) {
         error_report("%s: Failed to set state RESUMING", vbasedev->name);
         if (migration->region.mmaps) {
@@ -618,11 +619,11 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
     return ret;
 }
 
-static int vfio_load_cleanup(void *opaque)
+static int vfio_v1_load_cleanup(void *opaque)
 {
     VFIODevice *vbasedev = opaque;
 
-    vfio_migration_cleanup(vbasedev);
+    vfio_migration_v1_cleanup(vbasedev);
     trace_vfio_load_cleanup(vbasedev->name);
     return 0;
 }
@@ -660,7 +661,7 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
             uint64_t data_size = qemu_get_be64(f);
 
             if (data_size) {
-                ret = vfio_load_buffer(f, vbasedev, data_size);
+                ret = vfio_v1_load_buffer(f, vbasedev, data_size);
                 if (ret < 0) {
                     return ret;
                 }
@@ -681,21 +682,21 @@ static int vfio_load_state(QEMUFile *f, void *opaque, int version_id)
     return ret;
 }
 
-static SaveVMHandlers savevm_vfio_handlers = {
-    .save_setup = vfio_save_setup,
-    .save_cleanup = vfio_save_cleanup,
-    .save_live_pending = vfio_save_pending,
+static SaveVMHandlers savevm_vfio_v1_handlers = {
+    .save_setup = vfio_v1_save_setup,
+    .save_cleanup = vfio_v1_save_cleanup,
+    .save_live_pending = vfio_v1_save_pending,
     .save_live_iterate = vfio_save_iterate,
-    .save_live_complete_precopy = vfio_save_complete_precopy,
+    .save_live_complete_precopy = vfio_v1_save_complete_precopy,
     .save_state = vfio_save_state,
-    .load_setup = vfio_load_setup,
-    .load_cleanup = vfio_load_cleanup,
+    .load_setup = vfio_v1_load_setup,
+    .load_cleanup = vfio_v1_load_cleanup,
     .load_state = vfio_load_state,
 };
 
 /* ---------------------------------------------------------------------- */
 
-static void vfio_vmstate_change(void *opaque, bool running, RunState state)
+static void vfio_v1_vmstate_change(void *opaque, bool running, RunState state)
 {
     VFIODevice *vbasedev = opaque;
     VFIOMigration *migration = vbasedev->migration;
@@ -735,21 +736,21 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
         }
     }
 
-    ret = vfio_migration_set_state(vbasedev, mask, value);
+    ret = vfio_migration_v1_set_state(vbasedev, mask, value);
     if (ret) {
         /*
          * Migration should be aborted in this case, but vm_state_notify()
          * currently does not support reporting failures.
          */
         error_report("%s: Failed to set device state 0x%x", vbasedev->name,
-                     (migration->device_state & mask) | value);
+                     (migration->device_state_v1 & mask) | value);
         if (migrate_get_current()->to_dst_file) {
             qemu_file_set_error(migrate_get_current()->to_dst_file, ret);
         }
     }
     vbasedev->migration->vm_running = running;
-    trace_vfio_vmstate_change(vbasedev->name, running, RunState_str(state),
-            (migration->device_state & mask) | value);
+    trace_vfio_v1_vmstate_change(vbasedev->name, running, RunState_str(state),
+            (migration->device_state_v1 & mask) | value);
 }
 
 static void vfio_migration_state_notifier(Notifier *notifier, void *data)
@@ -768,10 +769,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state(vbasedev,
-                                       ~(VFIO_DEVICE_STATE_V1_SAVING |
-                                         VFIO_DEVICE_STATE_V1_RESUMING),
-                                       VFIO_DEVICE_STATE_V1_RUNNING);
+        ret = vfio_migration_v1_set_state(vbasedev,
+                                          ~(VFIO_DEVICE_STATE_V1_SAVING |
+                                            VFIO_DEVICE_STATE_V1_RESUMING),
+                                          VFIO_DEVICE_STATE_V1_RUNNING);
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
@@ -815,7 +816,7 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
 
     vbasedev->migration = g_new0(VFIOMigration, 1);
-    vbasedev->migration->device_state = VFIO_DEVICE_STATE_V1_RUNNING;
+    vbasedev->migration->device_state_v1 = VFIO_DEVICE_STATE_V1_RUNNING;
     vbasedev->migration->vm_running = runstate_is_running();
 
     ret = vfio_region_setup(obj, vbasedev, &vbasedev->migration->region,
@@ -846,12 +847,11 @@ static int vfio_migration_init(VFIODevice *vbasedev)
     }
     strpadcpy(id, sizeof(id), path, '\0');
 
-    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1, &savevm_vfio_handlers,
-                         vbasedev);
+    register_savevm_live(id, VMSTATE_INSTANCE_ID_ANY, 1,
+                         &savevm_vfio_v1_handlers, vbasedev);
 
-    migration->vm_state = qdev_add_vm_change_state_handler(vbasedev->dev,
-                                                           vfio_vmstate_change,
-                                                           vbasedev);
+    migration->vm_state = qdev_add_vm_change_state_handler(
+        vbasedev->dev, vfio_v1_vmstate_change, vbasedev);
     migration->migration_state.notify = vfio_migration_state_notifier;
     add_migration_state_change_notifier(&migration->migration_state);
     return 0;
diff --git a/hw/vfio/trace-events b/hw/vfio/trace-events
index b259dcc644..9eb9aff295 100644
--- a/hw/vfio/trace-events
+++ b/hw/vfio/trace-events
@@ -149,20 +149,20 @@ vfio_display_edid_write_error(void) ""
 
 # migration.c
 vfio_migration_probe(const char *name) " (%s)"
-vfio_migration_set_state(const char *name, uint32_t state) " (%s) state %d"
-vfio_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
+vfio_migration_v1_set_state(const char *name, uint32_t state) " (%s) state %d"
+vfio_v1_vmstate_change(const char *name, int running, const char *reason, uint32_t dev_state) " (%s) running %d reason %s device state %d"
 vfio_migration_state_notifier(const char *name, const char *state) " (%s) state %s"
-vfio_save_setup(const char *name) " (%s)"
+vfio_v1_save_setup(const char *name) " (%s)"
 vfio_save_cleanup(const char *name) " (%s)"
 vfio_save_buffer(const char *name, uint64_t data_offset, uint64_t data_size, uint64_t pending) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64" pending 0x%"PRIx64
 vfio_update_pending(const char *name, uint64_t pending) " (%s) pending 0x%"PRIx64
 vfio_save_device_config_state(const char *name) " (%s)"
-vfio_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
+vfio_v1_save_pending(const char *name, uint64_t precopy, uint64_t postcopy, uint64_t compatible) " (%s) precopy 0x%"PRIx64" postcopy 0x%"PRIx64" compatible 0x%"PRIx64
 vfio_save_iterate(const char *name, int data_size) " (%s) data_size %d"
-vfio_save_complete_precopy(const char *name) " (%s)"
+vfio_v1_save_complete_precopy(const char *name) " (%s)"
 vfio_load_device_config_state(const char *name) " (%s)"
 vfio_load_state(const char *name, uint64_t data) " (%s) data 0x%"PRIx64
-vfio_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
+vfio_v1_load_state_device_data(const char *name, uint64_t data_offset, uint64_t data_size) " (%s) Offset 0x%"PRIx64" size 0x%"PRIx64
 vfio_load_cleanup(const char *name) " (%s)"
 vfio_get_dirty_bitmap(int fd, uint64_t iova, uint64_t size, uint64_t bitmap_size, uint64_t start) "container fd=%d, iova=0x%"PRIx64" size= 0x%"PRIx64" bitmap_size=0x%"PRIx64" start=0x%"PRIx64
 vfio_iommu_map_dirty_notify(uint64_t iova_start, uint64_t iova_end) "iommu dirty @ 0x%"PRIx64" - 0x%"PRIx64
-- 
2.26.3


