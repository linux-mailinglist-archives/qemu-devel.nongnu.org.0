Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B897C5251F6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 May 2022 18:05:43 +0200 (CEST)
Received: from localhost ([::1]:55260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1npBJu-0001Sh-F4
	for lists+qemu-devel@lfdr.de; Thu, 12 May 2022 12:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41908)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyb-0006Hq-PB
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:45 -0400
Received: from mail-dm6nam12on2062c.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::62c]:5473
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1npAyY-0005JD-NR
 for qemu-devel@nongnu.org; Thu, 12 May 2022 11:43:40 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XfBfRTN7owt0vWIe/jLZfexu2851iRQ/swqzG1iCOiLXjWvkS6vDf90B+kJnm34YEkCfxML9E/aKB4Vis2vD2t1D6/GlfaaHp5ZTy/iJXlAduA/QDI1uuqGTlS306E7i5qMfBD8Y2oLOF1u7HRaBGqoodkfuiujTikPmp3YRq3/C0gozWHFWtpE6R9b6wS63xeW4TEPw/bXb83adXcGs4KkayEqxhSSquaJ92nkjsq2mo0qkevWdeS4AzH/Ud9oC1EaBKQsgdMl7TsdMdWQK38nCYTIm65OiVtDLByctjzeCjmd4CB3dTYQllAOIhrB7pW+833/7wuvs200aXFJ0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GEMJNQvozy86c6TBdVjYWOJCXVPfzc4/yK6/X2bJC6E=;
 b=bpFccIBkGw475D+EvaC8YguCPhei3+eFGhH35omulvKUdD6M89MNOrcSjZzyVSSsT3JZ2NIAJGoFd6K3Q8NSYUeGTPWGLUgT/jZVqOyuC/vmVnweTmnnX5lUlfoCkZF6D81tq8SrB7guVWdXsVWttj/qbudNpOOkZjYrUI9O8E9qKEwVfRMgXHGGDLXmfPjKwn/mkYi7LgKA0YXI0YkWLy9PsFuipByxm0bBwBkgy6X+Syn77hFZ/KANKV9M6lbaAeZCWqMcqzumjTxGruNUKUPaDlA8UKfFwx+TNsSLx52XuTTX7HHg/lDbcRyliPzctk2m9JIBw7S2IKbY2SXUGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 12.22.5.234) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GEMJNQvozy86c6TBdVjYWOJCXVPfzc4/yK6/X2bJC6E=;
 b=pR/vhxZHDWihIsphgORZa7NIu3JKCmhcQ1GojyRTFsexwX77KG/5TKEUJHo8/z7cQ8VmRR9ey16HQu7c54mxijCEQtCHaUZmHsaVfVQMhKJ3oJhjaOy8qSpO/hDGNPh5D2yW45VQCb0QNjDvUFcOQ8nAaAY+D+493//N9pk14D2aFfJoahLE8++ZqXUzd86nQm5kAmKPUUPBYLKLdAn9aO2Pi7phTC9YG3ZIJj3DXESOdbrfRJddUOblSyMP6Pz9kWRm/bLFIOfaNzGVS8p334FchkZTxGlX4Fy/oHVxgqt8AUK+uqWArJpI6U+C3NkYsZedJdBswWZY8zhMYdnJvQ==
Received: from MW4P222CA0013.NAMP222.PROD.OUTLOOK.COM (2603:10b6:303:114::18)
 by DM6PR12MB3801.namprd12.prod.outlook.com (2603:10b6:5:1cc::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5250.14; Thu, 12 May
 2022 15:43:34 +0000
Received: from CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:114:cafe::1) by MW4P222CA0013.outlook.office365.com
 (2603:10b6:303:114::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.24 via Frontend
 Transport; Thu, 12 May 2022 15:43:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 12.22.5.234)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 12.22.5.234 as permitted sender) receiver=protection.outlook.com;
 client-ip=12.22.5.234; helo=mail.nvidia.com;
Received: from mail.nvidia.com (12.22.5.234) by
 CO1NAM11FT030.mail.protection.outlook.com (10.13.174.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.5250.13 via Frontend Transport; Thu, 12 May 2022 15:43:33 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by DRHQMAIL101.nvidia.com
 (10.27.9.10) with Microsoft SMTP Server (TLS) id 15.0.1497.32;
 Thu, 12 May 2022 15:43:33 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.22; Thu, 12 May
 2022 08:43:32 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.22 via Frontend Transport; Thu, 12 May
 2022 08:43:28 -0700
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>, "Michael S . Tsirkin" <mst@redhat.com>, "Cornelia
 Huck" <cohuck@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>, "Alex
 Williamson" <alex.williamson@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, "Mark
 Bloch" <mbloch@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>,
 Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta <targupta@nvidia.com>
Subject: [PATCH 2/9] vfio: Fix compilation errors caused by VFIO migration v1
 deprecation
Date: Thu, 12 May 2022 18:43:13 +0300
Message-ID: <20220512154320.19697-3-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20220512154320.19697-1-avihaih@nvidia.com>
References: <20220512154320.19697-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 388844e3-c2fc-47d2-bc9f-08da342e2bfb
X-MS-TrafficTypeDiagnostic: DM6PR12MB3801:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB38019B55B5222DC725DCFC50DECB9@DM6PR12MB3801.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9FKiJDPz9gm6R3+nnS9Oyk4/aSVG0aHs70yaB034tOVO/I/OXUTvQbt9VH+f7B/M21cRgHlksTGE/vZwmA1uYo45TwdYiydd5V54IGo+fo2JeyOcnpEIULV81+JrHKpFHG3msu9RxZDK7iTxGbKaCwVuUUoaGqe/kHcQoX75ZAPetner4zcpXVgJmY1wA+39jG2komji+sXUY5Nz/m1n957/nCas4kIrQi+D3DlgaCGWWiQzwyGpcwakAwLYRro5S0SMHAMCb38qEr+zqS4Gd2ps+ANbRHuSYjjSHj02Z2RZx3FdLr/4s7AL185E1BeidTiiWnTMo0mpNXA6Ciu+FU0Np8q8pQj01AkM2lUv4jnMRrvo/GmnBHjTkkHGdR5It/2MjXjSJoz8/bV/d4J2PC4Vn4onBAVL6T4WVU2OoNtgyR5YB9TipTBs+DU6+wJTuNIRNOdXyUKCKnE7QTbrgiTFh1LwhNf9q2HlJkL/XgUXWAYAjSJ3912sInlRhBWAhDUL2lrNZy+nCIRfyJ+B/EFxmIUmisspIyl7VUfgxTuZWifESEpTkecWfNMsrRs2jJS7MvEXYvr4d0Mvdv4xk2WJ5sGi/R70og1QUW3O2VsSAZGao5VGn8xVtIoX05X0iiXvGS9MEZvaMeNSt//yoFfdcMIzkQBrAbogbtxExMr5F3tqbPsC+gtivbRHpBb4ckyqbZFsQ4DAyECbnEVJng==
X-Forefront-Antispam-Report: CIP:12.22.5.234; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:InfoNoRecords; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(86362001)(81166007)(47076005)(36860700001)(36756003)(6666004)(82310400005)(1076003)(5660300002)(83380400001)(186003)(8936002)(336012)(426003)(40460700003)(2616005)(4326008)(8676002)(70206006)(107886003)(70586007)(508600001)(54906003)(316002)(26005)(356005)(7696005)(110136005)(2906002)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 May 2022 15:43:33.6154 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 388844e3-c2fc-47d2-bc9f-08da342e2bfb
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[12.22.5.234];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT030.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3801
Received-SPF: softfail client-ip=2a01:111:f400:fe59::62c;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

VFIO migration protocol v1 was deprecated and as part of it some of the
uAPI definitions were renamed. This caused compilation errors.
Fix them.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 hw/vfio/common.c    |  6 +++---
 hw/vfio/migration.c | 29 ++++++++++++++++-------------
 2 files changed, 19 insertions(+), 16 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index 159f910421..29982c7af8 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -355,7 +355,7 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
             }
 
             if ((vbasedev->pre_copy_dirty_page_tracking == ON_OFF_AUTO_OFF)
-                && (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+                && (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 return false;
             }
         }
@@ -381,8 +381,8 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_SAVING) &&
-                (migration->device_state & VFIO_DEVICE_STATE_RUNNING)) {
+            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
+                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
                 continue;
             } else {
                 return false;
diff --git a/hw/vfio/migration.c b/hw/vfio/migration.c
index ff6b45de6b..835608cd23 100644
--- a/hw/vfio/migration.c
+++ b/hw/vfio/migration.c
@@ -432,7 +432,7 @@ static int vfio_save_setup(QEMUFile *f, void *opaque)
     }
 
     ret = vfio_migration_set_state(vbasedev, VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_SAVING);
+                                   VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state SAVING", vbasedev->name);
         return ret;
@@ -531,8 +531,8 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
     uint64_t data_size;
     int ret;
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_RUNNING,
-                                   VFIO_DEVICE_STATE_SAVING);
+    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_RUNNING,
+                                   VFIO_DEVICE_STATE_V1_SAVING);
     if (ret) {
         error_report("%s: Failed to set state STOP and SAVING",
                      vbasedev->name);
@@ -569,7 +569,7 @@ static int vfio_save_complete_precopy(QEMUFile *f, void *opaque)
         return ret;
     }
 
-    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_SAVING, 0);
+    ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_V1_SAVING, 0);
     if (ret) {
         error_report("%s: Failed to set state STOPPED", vbasedev->name);
         return ret;
@@ -609,7 +609,7 @@ static int vfio_load_setup(QEMUFile *f, void *opaque)
     }
 
     ret = vfio_migration_set_state(vbasedev, ~VFIO_DEVICE_STATE_MASK,
-                                   VFIO_DEVICE_STATE_RESUMING);
+                                   VFIO_DEVICE_STATE_V1_RESUMING);
     if (ret) {
         error_report("%s: Failed to set state RESUMING", vbasedev->name);
         if (migration->region.mmaps) {
@@ -717,20 +717,20 @@ static void vfio_vmstate_change(void *opaque, bool running, RunState state)
          * In both the above cases, set _RUNNING bit.
          */
         mask = ~VFIO_DEVICE_STATE_MASK;
-        value = VFIO_DEVICE_STATE_RUNNING;
+        value = VFIO_DEVICE_STATE_V1_RUNNING;
     } else {
         /*
          * Here device state could be either _RUNNING or _SAVING|_RUNNING. Reset
          * _RUNNING bit
          */
-        mask = ~VFIO_DEVICE_STATE_RUNNING;
+        mask = ~VFIO_DEVICE_STATE_V1_RUNNING;
 
         /*
          * When VM state transition to stop for savevm command, device should
          * start saving data.
          */
         if (state == RUN_STATE_SAVE_VM) {
-            value = VFIO_DEVICE_STATE_SAVING;
+            value = VFIO_DEVICE_STATE_V1_SAVING;
         } else {
             value = 0;
         }
@@ -767,9 +767,10 @@ static void vfio_migration_state_notifier(Notifier *notifier, void *data)
     case MIGRATION_STATUS_CANCELLED:
     case MIGRATION_STATUS_FAILED:
         bytes_transferred = 0;
-        ret = vfio_migration_set_state(vbasedev,
-                      ~(VFIO_DEVICE_STATE_SAVING | VFIO_DEVICE_STATE_RESUMING),
-                      VFIO_DEVICE_STATE_RUNNING);
+        ret = vfio_migration_set_state(
+            vbasedev,
+            ~(VFIO_DEVICE_STATE_V1_SAVING | VFIO_DEVICE_STATE_V1_RESUMING),
+            VFIO_DEVICE_STATE_V1_RUNNING);
         if (ret) {
             error_report("%s: Failed to set state RUNNING", vbasedev->name);
         }
@@ -864,8 +865,10 @@ int vfio_migration_probe(VFIODevice *vbasedev, Error **errp)
         goto add_blocker;
     }
 
-    ret = vfio_get_dev_region_info(vbasedev, VFIO_REGION_TYPE_MIGRATION,
-                                   VFIO_REGION_SUBTYPE_MIGRATION, &info);
+    ret = vfio_get_dev_region_info(vbasedev,
+                                   VFIO_REGION_TYPE_MIGRATION_DEPRECATED,
+                                   VFIO_REGION_SUBTYPE_MIGRATION_DEPRECATED,
+                                   &info);
     if (ret) {
         goto add_blocker;
     }
-- 
2.21.3


