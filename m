Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC19269FA6E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:51:14 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtFb-0000H1-8R; Wed, 22 Feb 2023 12:49:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFY-0000GQ-VJ
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:49:52 -0500
Received: from mail-mw2nam10on20614.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::614]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtFW-0004EL-Iu
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:49:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AvaecS1ChM6rcC5HOZ1FKNZIPA3Ig4ptkf94230A1Ui4AzlZfH+lVQ73hriosO8b6+Dc1mQzHMC/1Mmb/xyWVQbw/zP+Yg5IBEWnyOqxPcxUPQbg89UptnvdM7COPb8HXnJnOaxh9WZa0VkM5WLTeLkS3PcX35SJWbxfG80kuJdqya5pj1TwlcB0LVVMgDyG4EBUfp6f66cfwtTIoWo/kZe+I0KuiONjbPE7SFAZLHEXpCMbkbKUYx4FwwGbheoCsyxt5+8C+uli6liCQ0VnfLECy6XUnXKE43eP/ZEvhVBTq8oGJF1wiO4BiI+oepshTQ/lccmNRowUT/smiZpzSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7mDSTonaJ8I/HJslSWBy/OcPpoADj+3xSOXo5ICaF9c=;
 b=KFg893WwL+qeOR4hOB4CWvnVBtDYwiTSYUSxyqslfrpUis/Kv3zKBb+g50zpB+sTh4Rg5dimYPHvuKk1au3/h36XaX7VE/wgUYz10/jIxJBaAhGCS7FniPOi9qFNqcHR/Z/x66Nwdnu19nzIiT0uQx6C4DwhJ++L0xjLGU5JtxT1O+FFwC1gZf4jb1NROBkZqdukRlFoozel+u8V/nN8f9XIPweCI1z5RKSO9QP69vb0GeVXBO7DNWAWXtfwr3UjKd+84i0rGIS8+cg8WeUzeYDZnpViTBf4FlXwL0J8docRWwpeorN2L2z5t2BQM3zFDR7vUnhGWgPgXPmrW3eFuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7mDSTonaJ8I/HJslSWBy/OcPpoADj+3xSOXo5ICaF9c=;
 b=uhGz5es8yyHxTaqlVgHqP58Usj4viH/EnaTxSEzhlHe6kopYV+yiHvT0t4mhMAsjX8jaE+LDWdi/SGvT1E09Hkr8ylw6ManQNufFK/0DQHfzmOV2ir/UhU23q59OdXCtG+O88iT/BH0hEjXITt8KY+RrdAI7JcL6F5MYcVV2qeayk7oDttq+kajvZGKPEckiwz3MJ1bpJARbIqu2dIUCv29F74ao4VJdVV1/j4CtR8tzGtp44Uf7+VtPT8DfFcmzBUjVldU/JHYhofVOA8P71dmWUaKx1ZZt8QNEnQm7Rsq8JrdoCPdDB4mGs/TUfbisD1Pr1AAeMt+w+Uj7fEjXVA==
Received: from BL0PR02CA0023.namprd02.prod.outlook.com (2603:10b6:207:3c::36)
 by PH0PR12MB7906.namprd12.prod.outlook.com (2603:10b6:510:26c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:49:46 +0000
Received: from BL02EPF0000C406.namprd05.prod.outlook.com
 (2603:10b6:207:3c:cafe::81) by BL0PR02CA0023.outlook.office365.com
 (2603:10b6:207:3c::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6134.19 via Frontend
 Transport; Wed, 22 Feb 2023 17:49:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C406.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:49:45 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:27 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:27 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:22 -0800
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 01/20] migration: Pass threshold_size to
 .state_pending_{estimate, exact}()
Date: Wed, 22 Feb 2023 19:48:56 +0200
Message-ID: <20230222174915.5647-2-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230222174915.5647-1-avihaih@nvidia.com>
References: <20230222174915.5647-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C406:EE_|PH0PR12MB7906:EE_
X-MS-Office365-Filtering-Correlation-Id: b8ce5149-9ab6-4550-827e-08db14fd2f89
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Eru/U6qmgGCLcJRVkWvWom+2yoyKj3FbTKOBYk+kJujXWMU3sMBDxtZ+aQVbtppASOUqdl5fAjC/o8dMVR4KUtqpiLNg5vo+1CjAF5HW6CDUtfzLvOtq5RBVqvozIaxNwa4xeETBTRxO14Y4BdcK3KnbkgKMs1IfSrW8HxoLJyZrMTI+y50UEIVkettSaMrLmQfFStoDeRb4qrtkN0UaRgHM7hFtFuYS04TyHa0QxUIURJqRNxXcjHWe6YUSSFuZXerhPGagC+6OyRmq1gxVeL4RNlZ8nSWsbaUrvaW39il9cvTkOTpoR3lNx8y8fJ8J5etEgH/Jg9o1QHZK9Qe9HUjtl6oNetoNJK3OBZtLZ0Ql6ZfRTsz71DvyUn7IJ7pxnaiiExphr3yD4JvEo9MS0oDkE/GIRalduWZvenQeDffFDkSJXkBpaq2kXDQ89yi7rVtc6K/P4zVbGBXh1ukzpKZvg5xPD03OCG2IK9cSnPuwgQ39Zme1y4gKIJRYaThbMrDZYKL0VIc5E5gZD1azgUnHHBoBj+7uX69JI7Yi+uPTmG8pcXblhgWwc4CSwjadsS5xJaomayzPXDcv6xO2ctLj2eD3GUO/CaOjBvgKEOe2jyEX7x29BFA2GZW8dS5qIYNKh4kC1dsiQaUKOA50rVzaiO+WeRjibKldmKcrjwvQLk/mH5/SbtZjXlmeT9H6qz3Q/KA3NNlQzg1WEySaM/KTRaWWDE8FvdR9htT6rqY=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(396003)(39860400002)(346002)(136003)(376002)(451199018)(36840700001)(46966006)(40470700004)(83380400001)(82740400003)(36860700001)(7636003)(82310400005)(2906002)(86362001)(356005)(36756003)(8936002)(5660300002)(41300700001)(7416002)(40460700003)(26005)(186003)(6666004)(47076005)(426003)(1076003)(4326008)(40480700001)(336012)(316002)(2616005)(70586007)(7696005)(6916009)(8676002)(54906003)(478600001)(70206006)(142923001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:49:45.7848 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b8ce5149-9ab6-4550-827e-08db14fd2f89
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C406.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7906
Received-SPF: softfail client-ip=2a01:111:f400:7e89::614;
 envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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
Reply-to:  Avihai Horon <avihaih@nvidia.com>
From:  Avihai Horon via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Pass threshold_size to .state_pending_{estimate,exact}().

This parameter will be used in the following patch by VFIO migration to
force the complete transmission of all VFIO pre-copy initial bytes prior
moving to stop-copy phase, which can reduce migration downtime.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 include/migration/register.h   |  7 ++++---
 migration/savevm.h             |  6 ++++--
 hw/s390x/s390-stattrib.c       |  4 ++--
 hw/vfio/migration.c            |  3 ++-
 migration/block-dirty-bitmap.c |  2 +-
 migration/block.c              |  4 ++--
 migration/migration.c          | 12 ++++++++----
 migration/ram.c                |  6 ++++--
 migration/savevm.c             | 12 ++++++++----
 migration/trace-events         |  4 ++--
 10 files changed, 37 insertions(+), 23 deletions(-)

diff --git a/include/migration/register.h b/include/migration/register.h
index a8dfd8fefd..85d22931a7 100644
--- a/include/migration/register.h
+++ b/include/migration/register.h
@@ -61,11 +61,12 @@ typedef struct SaveVMHandlers {
      * pending data.
      */
     /* This estimates the remaining data to transfer */
-    void (*state_pending_estimate)(void *opaque, uint64_t *must_precopy,
+    void (*state_pending_estimate)(void *opaque, uint64_t threshold_size,
+                                   uint64_t *must_precopy,
                                    uint64_t *can_postcopy);
     /* This calculate the exact remaining data to transfer */
-    void (*state_pending_exact)(void *opaque, uint64_t *must_precopy,
-                                uint64_t *can_postcopy);
+    void (*state_pending_exact)(void *opaque, uint64_t threshold_size,
+                                uint64_t *must_precopy, uint64_t *can_postcopy);
     LoadStateHandler *load_state;
     int (*load_setup)(QEMUFile *f, void *opaque);
     int (*load_cleanup)(void *opaque);
diff --git a/migration/savevm.h b/migration/savevm.h
index fb636735f0..c94d31f051 100644
--- a/migration/savevm.h
+++ b/migration/savevm.h
@@ -40,9 +40,11 @@ void qemu_savevm_state_cleanup(void);
 void qemu_savevm_state_complete_postcopy(QEMUFile *f);
 int qemu_savevm_state_complete_precopy(QEMUFile *f, bool iterable_only,
                                        bool inactivate_disks);
-void qemu_savevm_state_pending_exact(uint64_t *must_precopy,
+void qemu_savevm_state_pending_exact(uint64_t threshold_size,
+                                     uint64_t *must_precopy,
                                      uint64_t *can_postcopy);
-void qemu_savevm_state_pending_estimate(uint64_t *must_precopy,
+void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
+                                        uint64_t *must_precopy,
                                         uint64_t *can_postcopy);
 void qemu_savevm_send_ping(QEMUFile *f, uint32_t value);
 void qemu_savevm_send_open_return_path(QEMUFile *f);
diff --git a/hw/s390x/s390-stattrib.c b/hw/s390x/s390-stattrib.c
index aed919ad7d..f1d4064c09 100644
--- a/hw/s390x/s390-stattrib.c
+++ b/hw/s390x/s390-stattrib.c
@@ -182,8 +182,8 @@ static int cmma_save_setup(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void cmma_state_pending(void *opaque, uint64_t *must_precopy,
-                               uint64_t *can_postcopy)
+static void cmma_state_pending(void *opaque, uint64_t threshold_size,
+                               uint64_t *must_precopy, uint64_t *can_postcopy)
 {
     S390StAttribState *sas = S390_STATTRIB(opaque);
     S390StAttribClass *sac = S390_STATTRIB_GET_CLASS(sas);
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index a2c3d9bade..4fb7d01532 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -314,7 +314,8 @@ static void vfio_save_cleanup(void *opaque)
  * repeatedly while pending RAM size is over the threshold, thus migration
  * can't converge and querying the VFIO device pending data size is useless.
  */
-static void vfio_state_pending_exact(void *opaque, uint64_t *must_precopy,
+static void vfio_state_pending_exact(void *opaque, uint64_t threshold_size,
+                                     uint64_t *must_precopy,
                                      uint64_t *can_postcopy)
 {
     VFIODevice *vbasedev = opaque;
diff --git a/migration/block-dirty-bitmap.c b/migration/block-dirty-bitmap.c
index fe73aa94b1..4fe0b83bc8 100644
--- a/migration/block-dirty-bitmap.c
+++ b/migration/block-dirty-bitmap.c
@@ -762,7 +762,7 @@ static int dirty_bitmap_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void dirty_bitmap_state_pending(void *opaque,
+static void dirty_bitmap_state_pending(void *opaque, uint64_t threshold_size,
                                        uint64_t *must_precopy,
                                        uint64_t *can_postcopy)
 {
diff --git a/migration/block.c b/migration/block.c
index 426a25bb19..70438a299c 100644
--- a/migration/block.c
+++ b/migration/block.c
@@ -853,8 +853,8 @@ static int block_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void block_state_pending(void *opaque, uint64_t *must_precopy,
-                                uint64_t *can_postcopy)
+static void block_state_pending(void *opaque, uint64_t threshold_size,
+                                uint64_t *must_precopy, uint64_t *can_postcopy)
 {
     /* Estimate pending number of bytes to send */
     uint64_t pending;
diff --git a/migration/migration.c b/migration/migration.c
index ae2025d9d8..a0777d9848 100644
--- a/migration/migration.c
+++ b/migration/migration.c
@@ -3866,15 +3866,19 @@ static MigIterateState migration_iteration_run(MigrationState *s)
     uint64_t must_precopy, can_postcopy;
     bool in_postcopy = s->state == MIGRATION_STATUS_POSTCOPY_ACTIVE;
 
-    qemu_savevm_state_pending_estimate(&must_precopy, &can_postcopy);
+    qemu_savevm_state_pending_estimate(s->threshold_size, &must_precopy,
+                                       &can_postcopy);
     uint64_t pending_size = must_precopy + can_postcopy;
 
-    trace_migrate_pending_estimate(pending_size, must_precopy, can_postcopy);
+    trace_migrate_pending_estimate(pending_size, s->threshold_size,
+                                   must_precopy, can_postcopy);
 
     if (must_precopy <= s->threshold_size) {
-        qemu_savevm_state_pending_exact(&must_precopy, &can_postcopy);
+        qemu_savevm_state_pending_exact(s->threshold_size, &must_precopy,
+                                        &can_postcopy);
         pending_size = must_precopy + can_postcopy;
-        trace_migrate_pending_exact(pending_size, must_precopy, can_postcopy);
+        trace_migrate_pending_exact(pending_size, s->threshold_size,
+                                    must_precopy, can_postcopy);
     }
 
     if (!pending_size || pending_size < s->threshold_size) {
diff --git a/migration/ram.c b/migration/ram.c
index 96e8a19a58..514a18b5d7 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3489,7 +3489,8 @@ static int ram_save_complete(QEMUFile *f, void *opaque)
     return 0;
 }
 
-static void ram_state_pending_estimate(void *opaque, uint64_t *must_precopy,
+static void ram_state_pending_estimate(void *opaque, uint64_t threshold_size,
+                                       uint64_t *must_precopy,
                                        uint64_t *can_postcopy)
 {
     RAMState **temp = opaque;
@@ -3505,7 +3506,8 @@ static void ram_state_pending_estimate(void *opaque, uint64_t *must_precopy,
     }
 }
 
-static void ram_state_pending_exact(void *opaque, uint64_t *must_precopy,
+static void ram_state_pending_exact(void *opaque, uint64_t threshold_size,
+                                    uint64_t *must_precopy,
                                     uint64_t *can_postcopy)
 {
     RAMState **temp = opaque;
diff --git a/migration/savevm.c b/migration/savevm.c
index aa54a67fda..a642c0dd5a 100644
--- a/migration/savevm.c
+++ b/migration/savevm.c
@@ -1541,7 +1541,8 @@ flush:
  * the result is split into the amount for units that can and
  * for units that can't do postcopy.
  */
-void qemu_savevm_state_pending_estimate(uint64_t *must_precopy,
+void qemu_savevm_state_pending_estimate(uint64_t threshold_size,
+                                        uint64_t *must_precopy,
                                         uint64_t *can_postcopy)
 {
     SaveStateEntry *se;
@@ -1558,11 +1559,13 @@ void qemu_savevm_state_pending_estimate(uint64_t *must_precopy,
                 continue;
             }
         }
-        se->ops->state_pending_estimate(se->opaque, must_precopy, can_postcopy);
+        se->ops->state_pending_estimate(se->opaque, threshold_size,
+                                        must_precopy, can_postcopy);
     }
 }
 
-void qemu_savevm_state_pending_exact(uint64_t *must_precopy,
+void qemu_savevm_state_pending_exact(uint64_t threshold_size,
+                                     uint64_t *must_precopy,
                                      uint64_t *can_postcopy)
 {
     SaveStateEntry *se;
@@ -1579,7 +1582,8 @@ void qemu_savevm_state_pending_exact(uint64_t *must_precopy,
                 continue;
             }
         }
-        se->ops->state_pending_exact(se->opaque, must_precopy, can_postcopy);
+        se->ops->state_pending_exact(se->opaque, threshold_size, must_precopy,
+                                     can_postcopy);
     }
 }
 
diff --git a/migration/trace-events b/migration/trace-events
index 92161eeac5..b23c044f5e 100644
--- a/migration/trace-events
+++ b/migration/trace-events
@@ -150,8 +150,8 @@ migrate_fd_cleanup(void) ""
 migrate_fd_error(const char *error_desc) "error=%s"
 migrate_fd_cancel(void) ""
 migrate_handle_rp_req_pages(const char *rbname, size_t start, size_t len) "in %s at 0x%zx len 0x%zx"
-migrate_pending_exact(uint64_t size, uint64_t pre, uint64_t post) "exact pending size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
-migrate_pending_estimate(uint64_t size, uint64_t pre, uint64_t post) "estimate pending size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_exact(uint64_t size, uint64_t threshold_size, uint64_t pre, uint64_t post) "exact pending size %" PRIu64 " threshold size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
+migrate_pending_estimate(uint64_t size, uint64_t threshold_size, uint64_t pre, uint64_t post) "estimate pending size %" PRIu64 " threshold size %" PRIu64 " (pre = %" PRIu64 " post=%" PRIu64 ")"
 migrate_send_rp_message(int msg_type, uint16_t len) "%d: len %d"
 migrate_send_rp_recv_bitmap(char *name, int64_t size) "block '%s' size 0x%"PRIi64
 migration_completion_file_err(void) ""
-- 
2.26.3


