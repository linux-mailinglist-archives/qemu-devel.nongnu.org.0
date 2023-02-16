Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CE0E9699799
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:39:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfNq-0003lj-Vh; Thu, 16 Feb 2023 09:37:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNp-0003cH-1V
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:13 -0500
Received: from mail-bn8nam12on20619.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::619]
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNn-0004oK-68
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:12 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hHzEZmd7MB4XhDzpP5PRqtuVCZrSAQKOLoXHAdRK3wXjc80iBod084g648FYNB0NGPmSRYwosLMaL9N/OJO69r7lIM5BFsSG6K1BBtR203jMPePUMBOVnlOphm8JyNT2LG4QzECZAboPs1wrdFnZGU3K7/b5taOWGtPKyzP5wKkfo6vBRz+dLVAn041oi+nLvAmYbq/6MFqR/Dek/KFtZZpF5aJ/zxOGc0fbCaMOAzyN1s81BoEYhdnmZGrODt6Qrgr44D1+xT0cWLTurEhj9stj1DBnvk+3g7BxN7XvfQQ6R72xEDT7YFRZXUBls2ZCe0lMA4ZwTi1iyBMVVONRZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t9muwuHUKNRpSuMJd4KvW//7z9qHoDEToDY35/BiWaY=;
 b=YJF6wTccfvea8BX/TkESpgGcD3HQJst/yzvGS7HOOGJFzV5L8dcvKg5kvZEPlxd1Uqf+7WjueotKX15WGRzerk9kn4/YBLcoCKT/F5JnDrN8dS1hegHJ5qi61yTWGgOn4s8bdFm+vUoL7hW47V4vctMbI8r1QeHhvL0dEjYP1Q421QrRBm6u6byGfxmteaEM3Ee1dxw8cJKWQtmhgsAz85mi4vDC4JCkK1HZZr0qbaXuRw2v0/CmAixhKGFf3RrgFDyXvMo5GVz1vngcikg3+TIFgVhF7svBdTXCcE7S27QJRpwr9M+vD1FSFbIDzHBEvG7vIbG4XohBpsVjWFhmZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t9muwuHUKNRpSuMJd4KvW//7z9qHoDEToDY35/BiWaY=;
 b=ZBs7WR8smoJbBSnfMhyBZ/qVNT8x1hI277zDyTCYhCVN0mRF8dhoxR9NH3lews3OyVIccd0IYWWirjO+tpaApyvZ7nKs1tKjcOQ/swfJBYVZs/RumSqVQolGjr/rpqROESwoYhP6oNpREYsPY6TOpH8ZczLcN62gExrSKpNTm1LjURWQxeP0JOejYpMHlLfj6Xles7vmqCm278FFPTxLo67i+dAL7Sfg0L2o2gpdvXWV5juAjU7VFzD2ZkKn27xHSAwCNs4bFBUdmpYhcmCuo+L6TV7g7Tk3VvP6hlAgeK+ScL165IbmGdijRae137Bpf7XkvZilJi1H7vk0spf/UQ==
Received: from DS7PR03CA0153.namprd03.prod.outlook.com (2603:10b6:5:3b2::8) by
 PH8PR12MB6771.namprd12.prod.outlook.com (2603:10b6:510:1c6::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.26; Thu, 16 Feb 2023 14:37:08 +0000
Received: from DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b2:cafe::56) by DS7PR03CA0153.outlook.office365.com
 (2603:10b6:5:3b2::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT053.mail.protection.outlook.com (10.13.173.74) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:37:07 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:48 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:36:55 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:36:51 -0800
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
Subject: [PATCH v11 04/11] vfio/common: Change
 vfio_devices_all_running_and_saving() logic to equivalent one
Date: Thu, 16 Feb 2023 16:36:23 +0200
Message-ID: <20230216143630.25610-5-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT053:EE_|PH8PR12MB6771:EE_
X-MS-Office365-Filtering-Correlation-Id: 117598ab-c49e-4c3e-2815-08db102b47b3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pYzEeB1Itk8O2Wdg9RaZs9XRDYjJ7/O5SwLqLmup6Kc4HvRwsOIAKC2qMXz/vYlAWoMVAZcidb3PgqBs56HKBtB4ZiT6Pu5Fe/xzVvRs+dWXio4ppI0Gme7SCm5wIK/Y2NfiuWKZvxIaLLapXv0CGRxkFQ7e+bpRs3xHn1FLq2JWXvJTSGeUZeMto23J/N6KcTprR2iWlvcxww/4imKrErXY5UK26gD76gCtpFohzetMYzem9IjPqVPOeaLxjLInBbFSnKoF8dY86i6hOezJT6BBLxz9aXnnjkWBI+BO/V9CiK03uTpVa92u0FcpvTL9GMr+3bY3shxB7ieyw3hfz38coqZnILVgU3L9SI83lKjDVn/6vFvGUpJX6OY6YJ9O5hY7CoAJnG2yFdXrPJfuhTRooBELOOkqSf63vd5IkKKRB/5xaAtwZn+Sz4qxs/m+IDNpIHIH3e+hrrgZS2GB1d9QA22pbARFZ0GV00yfNkIekxAQBLILrpRQhfhaLmH1ia9gKZwP4XjJ1iKP7dSFUpZ6lN+yVn+Wozx8FC+EMNjeFqywWdOj8lwsgIEyys1CkmYmpDIIlvLVkMqaG7710WeWMbkv6o84t3iCipOckbusPkKFRLhaLC3jccdahw8tv5ezj5uT+L9ICBYLOf2fyROJAzEM34HWSbKCiCAmvMXxV8abl8V0rIFEpEPz8Sv8h0t/EnfA5uVF2ep95pes3A==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(396003)(39860400002)(376002)(451199018)(36840700001)(46966006)(40470700004)(316002)(41300700001)(54906003)(5660300002)(6916009)(8676002)(8936002)(7416002)(70586007)(4326008)(2906002)(70206006)(7696005)(478600001)(26005)(6666004)(186003)(1076003)(40460700003)(336012)(2616005)(36756003)(426003)(82310400005)(83380400001)(36860700001)(66574015)(40480700001)(47076005)(82740400003)(356005)(7636003)(86362001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:07.4056 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 117598ab-c49e-4c3e-2815-08db102b47b3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT053.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6771
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::619;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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


