Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 67AC5691137
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:22:47 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCU8-0004H0-OU; Thu, 09 Feb 2023 14:21:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCU6-0004Gq-F9
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:30 -0500
Received: from mail-mw2nam12on20604.outbound.protection.outlook.com
 ([2a01:111:f400:fe5a::604]
 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCU4-0005Sl-Kn
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:21:30 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cqyMoTizvrXXYbYh4rmy1/Ju2XMIEmIqE5PayzqljxdrebzC8hOeMyYVgFUv7xz/FysITwvx486TNBDi4TeuEnzhXKUmvMe2BODryXGl9tylioEwtVE3aE7ixiYUWAAJ8BbjZrvVdH2k2lulb0nVpQ/4qZzlQUQ8IRzfX0xqCFRzF4QdUp7ZEBaNdFIK7Ax3ru8h1a8722wYIBxjaDqke9kkQpnv+RBl4CPpG0tbjYchWAYPnaEihgWY1VBSu+h9Ud71Hai5jKLH5HDANHRlC6runm8ad8cxMLg6V1xw2blKF3W4kH7W8w9ogKovdoKCwurTPhh7TSYclvjZQA2Dxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9muwuHUKNRpSuMJd4KvW//7z9qHoDEToDY35/BiWaY=;
 b=d9cBsF/GeI3DnhtM3DrUEzcwCiiFAn9+Ah2l9A+tyVlzmchv0kPq28NGiSr4KNh220ZTN5C8m7uoZil3hbQ253SrlYh2ofv76b0hTBal4jey3/zJ4TL0JWmcP7jBQ3X534qGjDQTfWfWCL7bh+tJ6BrwFOqBwjWPgrwbkcV7qsVrPDNqFkTSN0IknI5gtX7KmJLYBg1FV+3PHlqpqRL0SKw4OZFFy22YdnXhHmbKl7QoBpueGeUSFXIl+M8e/7Ni7R3+jT54BfsyRs4GqGqllVw8IRPiEyWt8r+qdnNT0ltn+d0/KaY/MQAcYV779C5qIyLHdUURR3gihXKJ4+uvzQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9muwuHUKNRpSuMJd4KvW//7z9qHoDEToDY35/BiWaY=;
 b=RW2H4WKdNN3jr0p2xHTLawk+j5UYwTFPYmFiw08fJSwmUbGcShg883mKIwk8WxB0WzRNzryJ46Le2E0MWKF/oUfuPWi0pfeq5PPolEbE4fWhNtPvf+DTCvccbENsO2Ha3RHMWSKWuV1i5+PoRCF8b6paJuB8IZQEL6+bjNScliA1UYDNJhii7X9p/X3iRmWi3C26e7wgTAa9yiL8eQIFTTDSBcS1KCDdf2mkD+Jj+KV4gfvBOiNRQwv2Va2YDPe9fR/DNuT3lEIgLP/ATuYDNVTH0eTV78ZmUcQBaTINzBEfoxTZzwhMh2ri8jlx0Wul9aiUTuBbj5as2Mgqq3qDLQ==
Received: from DM6PR11CA0034.namprd11.prod.outlook.com (2603:10b6:5:190::47)
 by BL3PR12MB6593.namprd12.prod.outlook.com (2603:10b6:208:38c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 19:21:23 +0000
Received: from DS1PEPF0000E62E.namprd02.prod.outlook.com
 (2603:10b6:5:190:cafe::cf) by DM6PR11CA0034.outlook.office365.com
 (2603:10b6:5:190::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 19:21:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF0000E62E.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Thu, 9 Feb 2023 19:21:23 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 11:21:09 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 11:21:09 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 9 Feb 2023 11:21:05 -0800
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
Subject: [PATCH v10 05/12] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Thu, 9 Feb 2023 21:20:36 +0200
Message-ID: <20230209192043.14885-6-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230209192043.14885-1-avihaih@nvidia.com>
References: <20230209192043.14885-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E62E:EE_|BL3PR12MB6593:EE_
X-MS-Office365-Filtering-Correlation-Id: b9ce78e7-98c0-4ce7-5e8d-08db0ad2d4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWUxNYIampfzqRc3z2bIHGGd+NEXhO+P9XRVeKg0H7YAchZIRlrcx4IbpIPH9kxUBMiq7gYzAl8LmjV3ZtfwWlkAkNEh0rxUcrRmYT/Bibw8R2rbilZ5Ha6yZLq8ZbAWc1/r0rvB4VkUyaAGTSTVJ1w8NGmrnfuGOtA4ykDvXyh/bsxo0GMQVmyNtQqPB8NoTyJErjgh+aQwp8M+07DU1q23uooM9/Hyc9fEt0w/v6V8sis6WOXDrAb9D9/UrROr6+VTlP2aiDkrGSMxu4lgdsoRq9wXCAxCCjcP3eg7i4oa7nZx+brL2bou2yj82Xv31aWeAz+GFCsw2nNY6NhlMsKXyMeoRU0VJQYMMYf7OvYN09txc1p8ZBrCZXc0v+PGBw9IyjT+vkU4vw/tPxkUOmX2CJi+Qjw3pnwp5gGCcBdtEU84a3z4NtT4L9qKzHAvPCkZHooP2bOYzMgBB+QkM1GVh5rZfrhcUyEJGPAKYkN3j/Me1cjUSAa5CylH9O4uDnzl/+lt5rEnYBsDQrF3BhQlvM4OOqEIpk6m942Zp/W5TipFXU6NAysYg4XbKB28gKILROy0O3cCKCEo2amv+9rgjnS5ajtUB+EADf8zkLQOHRCqGZuCe2ntUZEcSHHkxF+Pk4BGLOZXtzkKHz5caGHeZVbTsqfBosPy355KJMHkq8vL34et9Ajmis9XUjjh++Sxe+z72bDahL0ZMFuW0w==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(376002)(396003)(451199018)(36840700001)(40470700004)(46966006)(82740400003)(7636003)(41300700001)(356005)(36860700001)(2906002)(47076005)(66574015)(82310400005)(6916009)(8676002)(4326008)(8936002)(70586007)(83380400001)(70206006)(426003)(7416002)(26005)(316002)(5660300002)(40480700001)(186003)(54906003)(336012)(86362001)(2616005)(1076003)(478600001)(40460700003)(36756003)(7696005)(6666004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 19:21:23.2706 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b9ce78e7-98c0-4ce7-5e8d-08db0ad2d4e5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E62E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6593
Received-SPF: softfail client-ip=2a01:111:f400:fe5a::604;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

vfio_devices_all_running_and_saving() is used to check if migration is
in pre-copy phase. This is done by checking if migration is in setup or
active states and if all VFIO devices are in pre-copy state, i.e.
_SAVING | _RUNNING.

In VFIO migration protocol v2 pre-copy support is made optional. Hence,
a matching v2 protocol pre-copy state can't be used here.

As preparation for adding v2 protocol, change
vfio_devices_all_running_and_saving() logic such that it doesn't use the
VFIO pre-copy state.

The new equivalent logic checks if migration is in active state and if
all VFIO devices are in running state [1]. No functional changes
intended.

[1] Note that checking if migration is in setup or active states and if
all VFIO devices are in running state doesn't guarantee that we are in
pre-copy phase, thus we check if migration is only in active state.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 hw/vfio/common.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/vfio/common.c b/hw/vfio/common.c
index f6dd571549..3a35f4afad 100644
--- a/hw/vfio/common.c
+++ b/hw/vfio/common.c
@@ -40,6 +40,7 @@
 #include "trace.h"
 #include "qapi/error.h"
 #include "migration/migration.h"
+#include "migration/misc.h"
 #include "sysemu/tpm.h"
 
 VFIOGroupList vfio_group_list =
@@ -363,13 +364,16 @@ static bool vfio_devices_all_dirty_tracking(VFIOContainer *container)
     return true;
 }
 
-static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
+/*
+ * Check if all VFIO devices are running and migration is active, which is
+ * essentially equivalent to the migration being in pre-copy phase.
+ */
+static bool vfio_devices_all_running_and_mig_active(VFIOContainer *container)
 {
     VFIOGroup *group;
     VFIODevice *vbasedev;
-    MigrationState *ms = migrate_get_current();
 
-    if (!migration_is_setup_or_active(ms->state)) {
+    if (!migration_is_active(migrate_get_current())) {
         return false;
     }
 
@@ -381,8 +385,7 @@ static bool vfio_devices_all_running_and_saving(VFIOContainer *container)
                 return false;
             }
 
-            if ((migration->device_state & VFIO_DEVICE_STATE_V1_SAVING) &&
-                (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING)) {
+            if (migration->device_state & VFIO_DEVICE_STATE_V1_RUNNING) {
                 continue;
             } else {
                 return false;
@@ -461,7 +464,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
     };
 
     if (iotlb && container->dirty_pages_supported &&
-        vfio_devices_all_running_and_saving(container)) {
+        vfio_devices_all_running_and_mig_active(container)) {
         return vfio_dma_unmap_bitmap(container, iova, size, iotlb);
     }
 
@@ -488,7 +491,7 @@ static int vfio_dma_unmap(VFIOContainer *container,
         return -errno;
     }
 
-    if (iotlb && vfio_devices_all_running_and_saving(container)) {
+    if (iotlb && vfio_devices_all_running_and_mig_active(container)) {
         cpu_physical_memory_set_dirty_range(iotlb->translated_addr, size,
                                             tcg_enabled() ? DIRTY_CLIENTS_ALL :
                                             DIRTY_CLIENTS_NOCODE);
-- 
2.26.3


