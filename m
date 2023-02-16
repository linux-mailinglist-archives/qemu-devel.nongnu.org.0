Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 701A769979A
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:39:17 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfOM-0005r9-IG; Thu, 16 Feb 2023 09:37:46 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfOK-0005dE-4X
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:44 -0500
Received: from mail-mw2nam10on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7e89::601]
 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfOH-0004tc-SE
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:43 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JU89cCnSuVKFyhdfs0MTnwMG1qt4ZBfclrhuXd1TtGOBLZ5AMMWSwQtIN1INpc4UI6QGKRMcLPsQoc1yuXWoWe2elCTo8KamyxuE8oromtlQwYnDyrFe3zi7gwzFryLB7/9u6NouG4pDn7dsWf1OGYKznxjAG1oATmQDm6s33KGasXV1wBFSfYkhl28MDv7IebzcKXFk6DRyoJbLYGM6PJpS/JWnOXfFUkzbH31Xhkq4vg6gRpOFwNuw58GPbHPRj/MkG+S74SI1vrCQtEllvUoqscjhzDZR65/or37EFnu/x+8MOSysaoqIr7WRodR33FAnf0oAGhtyulubc5l1eg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K8KWvGJ0YRJVfp4ghFj1imko8yVkspj/Fhaf1w7s4MM=;
 b=Yya4VPvqifC42c/ShJhWa5AweWJqPKWVWYgHOx8flnMkuS3mOL8tH+/iBAD20g86Wyj0P2wZBHaCLemNh6fBufT3TUifuVSeOB1CAdviJyqjmdSDMPxgd53JjQ6vNBHQ4yjUDc0xgWhelIQKcFq+XWeHLOXERCcqDiXu52KVnALy2ZYTYAl5+Mk4ArCPJLYL7emacOZ1i5a887mW72MiM/eEsENirN7bNUNwxmTi7IjTU/onpZYUjH1zXZ5bRNDoZ/I25slFoXyYsHYET5GH9ZC8z8rv8rpvvr3CDhxZun8BFh8cJO+RO9ki9uQA7OW0erxy65BsiSodoOeTjtv69Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K8KWvGJ0YRJVfp4ghFj1imko8yVkspj/Fhaf1w7s4MM=;
 b=iGgWqSpI+CuXOF7exTkAMKtPY3nnk52sGhZIXVCzz5J6sKtVc+8Z9Q6/+sHNoIOiNeacluX/61OYioDtK1gxARzHASpyI+Pk42/41sYOcgrg1obwlJtOA+VnF0UF64xYYZcGW0AfSg4BOciE+fVn8y1+dMeHT6tWZPb8Oy1zGchQ+0E5W2yaSKaKlEIHGtz49WqSv0fSjlonU9yE+ulVF7n7kGQEkJIvbAjkx46CUwbMl7j1OcNJp4N9WDzUl6vbRI3UPRUfx3QbcA77PPqeKSF70DkOW6ZCf+QVzEwyjzCWiis9k7WQ2NuRAm08CpU8m29bkXKQOWq6mc4Irqd4Qw==
Received: from DM6PR07CA0072.namprd07.prod.outlook.com (2603:10b6:5:74::49) by
 BL3PR12MB6619.namprd12.prod.outlook.com (2603:10b6:208:38e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13; Thu, 16 Feb 2023 14:37:35 +0000
Received: from DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:74:cafe::a4) by DM6PR07CA0072.outlook.office365.com
 (2603:10b6:5:74::49) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:37:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT114.mail.protection.outlook.com (10.13.172.206) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:37:35 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:38:21 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:28 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:37:24 -0800
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
Subject: [PATCH v11 11/11] docs/devel: Align VFIO migration docs to v2 protocol
Date: Thu, 16 Feb 2023 16:36:30 +0200
Message-ID: <20230216143630.25610-12-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230216143630.25610-1-avihaih@nvidia.com>
References: <20230216143630.25610-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT114:EE_|BL3PR12MB6619:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e482d20-f7f7-4c34-f192-08db102b5832
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: X50jacZ1mLClond3I5plMG+0TfeMHXba0vPdi9M0ghIWLjwCIWAaVcoh7VhZUFF95NZGDVX7Zcr7lcbd1I/r5dOmH1tGctFMtI9Lrw/r7igGJBG2+hR7JZUicSQKj0Hy0135II57+MtAN9FXmIab1fcdy7dmbxhxYDAJEi5Ld+rXA7J/wM92nObgE2iYY7DXTp+WG0C4xlZqQzn1UpeO++qGooyHUXzB9PwL2jPUzY7YgJebo/KFZ9qQ3Ro4AVAacgvXQ2WjYgJohpMgk49qDTxhHjPKiFK1li2QjPMspPNalR+7RAWuNiawGHyBDpAhzEqF0VUdfebVUKjaXaVA8U4DoHJbUy3Oo8TXWiDs+tdle8eYntk/z50MrJM3E00IgGOcQqMJxyk4XndKZ4d3K5uj7A1DyBfig6TJorKMllUV2TVT233HDH/1mlqjQmSH65/H1d/5BnwerDG6LhwkD4ouhW+d+ZJ1K5mAvdCs8M9QQbh3UoAB5WFcn1QHPzAtmCQ2WdnNDzo8nL7ZF6A2EpTUOreYqtgkNqF6MeoErrLH0gQCcKQ1q3EQkuwmgAOpXDlrXzFPkc3EuLc+sClAiIGeyTP0KKHhcga8AoEgdK7asObfRTgJc6BwdRgYzQpUhCBC5ajbk/0qttFjqd/EOGLyzoY574pfrJ8bMSwjahmwiaNKJPKcIJnX2IHK38fe5MhiBezIu4lPighiHtoNUQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(346002)(376002)(396003)(39860400002)(451199018)(40470700004)(36840700001)(46966006)(7696005)(478600001)(426003)(36860700001)(40480700001)(47076005)(66574015)(83380400001)(356005)(86362001)(82310400005)(82740400003)(7636003)(6666004)(1076003)(336012)(36756003)(40460700003)(186003)(26005)(2616005)(316002)(70206006)(70586007)(5660300002)(7416002)(4326008)(8676002)(8936002)(6916009)(54906003)(41300700001)(2906002);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:37:35.0866 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e482d20-f7f7-4c34-f192-08db102b5832
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT114.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6619
Received-SPF: softfail client-ip=2a01:111:f400:7e89::601;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Now that VFIO migration protocol v2 has been implemented and v1 protocol
has been removed, update the documentation according to v2 protocol.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
Reviewed-by: Cédric Le Goater <clg@redhat.com>
---
 docs/devel/vfio-migration.rst | 72 +++++++++++++++++------------------
 1 file changed, 34 insertions(+), 38 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 673057c90d..c214c73e28 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -7,46 +7,43 @@ the guest is running on source host and restoring this saved state on the
 destination host. This document details how saving and restoring of VFIO
 devices is done in QEMU.
 
-Migration of VFIO devices consists of two phases: the optional pre-copy phase,
-and the stop-and-copy phase. The pre-copy phase is iterative and allows to
-accommodate VFIO devices that have a large amount of data that needs to be
-transferred. The iterative pre-copy phase of migration allows for the guest to
-continue whilst the VFIO device state is transferred to the destination, this
-helps to reduce the total downtime of the VM. VFIO devices can choose to skip
-the pre-copy phase of migration by returning pending_bytes as zero during the
-pre-copy phase.
+Migration of VFIO devices currently consists of a single stop-and-copy phase.
+During the stop-and-copy phase the guest is stopped and the entire VFIO device
+data is transferred to the destination.
+
+The pre-copy phase of migration is currently not supported for VFIO devices.
+Support for VFIO pre-copy will be added later on.
+
+Note that currently VFIO migration is supported only for a single device. This
+is due to VFIO migration's lack of P2P support. However, P2P support is planned
+to be added later on.
 
 A detailed description of the UAPI for VFIO device migration can be found in
-the comment for the ``vfio_device_migration_info`` structure in the header
-file linux-headers/linux/vfio.h.
+the comment for the ``vfio_device_mig_state`` structure in the header file
+linux-headers/linux/vfio.h.
 
 VFIO implements the device hooks for the iterative approach as follows:
 
-* A ``save_setup`` function that sets up the migration region and sets _SAVING
-  flag in the VFIO device state.
+* A ``save_setup`` function that sets up migration on the source.
 
-* A ``load_setup`` function that sets up the migration region on the
-  destination and sets _RESUMING flag in the VFIO device state.
+* A ``load_setup`` function that sets the VFIO device on the destination in
+  _RESUMING state.
 
 * A ``state_pending_exact`` function that reads pending_bytes from the vendor
   driver, which indicates the amount of data that the vendor driver has yet to
   save for the VFIO device.
 
-* A ``save_live_iterate`` function that reads the VFIO device's data from the
-  vendor driver through the migration region during iterative phase.
-
 * A ``save_state`` function to save the device config space if it is present.
 
-* A ``save_live_complete_precopy`` function that resets _RUNNING flag from the
-  VFIO device state and iteratively copies the remaining data for the VFIO
-  device until the vendor driver indicates that no data remains (pending bytes
-  is zero).
+* A ``save_live_complete_precopy`` function that sets the VFIO device in
+  _STOP_COPY state and iteratively copies the data for the VFIO device until
+  the vendor driver indicates that no data remains.
 
 * A ``load_state`` function that loads the config section and the data
-  sections that are generated by the save functions above
+  sections that are generated by the save functions above.
 
 * ``cleanup`` functions for both save and load that perform any migration
-  related cleanup, including unmapping the migration region
+  related cleanup.
 
 
 The VFIO migration code uses a VM state change handler to change the VFIO
@@ -71,13 +68,13 @@ tracking can identify dirtied pages, but any page pinned by the vendor driver
 can also be written by the device. There is currently no device or IOMMU
 support for dirty page tracking in hardware.
 
-By default, dirty pages are tracked when the device is in pre-copy as well as
-stop-and-copy phase. So, a page pinned by the vendor driver will be copied to
-the destination in both phases. Copying dirty pages in pre-copy phase helps
-QEMU to predict if it can achieve its downtime tolerances. If QEMU during
-pre-copy phase keeps finding dirty pages continuously, then it understands
-that even in stop-and-copy phase, it is likely to find dirty pages and can
-predict the downtime accordingly.
+By default, dirty pages are tracked during pre-copy as well as stop-and-copy
+phase. So, a page pinned by the vendor driver will be copied to the destination
+in both phases. Copying dirty pages in pre-copy phase helps QEMU to predict if
+it can achieve its downtime tolerances. If QEMU during pre-copy phase keeps
+finding dirty pages continuously, then it understands that even in stop-and-copy
+phase, it is likely to find dirty pages and can predict the downtime
+accordingly.
 
 QEMU also provides a per device opt-out option ``pre-copy-dirty-page-tracking``
 which disables querying the dirty bitmap during pre-copy phase. If it is set to
@@ -111,23 +108,22 @@ Live migration save path
                                   |
                      migrate_init spawns migration_thread
                 Migration thread then calls each device's .save_setup()
-                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                       (RUNNING, _SETUP, _RUNNING)
                                   |
-                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
+                      (RUNNING, _ACTIVE, _RUNNING)
              If device is active, get pending_bytes by .state_pending_exact()
           If total pending_bytes >= threshold_size, call .save_live_iterate()
-                  Data of VFIO device for pre-copy phase is copied
         Iterate till total pending bytes converge and are less than threshold
                                   |
   On migration completion, vCPU stops and calls .save_live_complete_precopy for
-   each active device. The VFIO device is then transitioned into _SAVING state
-                   (FINISH_MIGRATE, _DEVICE, _SAVING)
+  each active device. The VFIO device is then transitioned into _STOP_COPY state
+                  (FINISH_MIGRATE, _DEVICE, _STOP_COPY)
                                   |
      For the VFIO device, iterate in .save_live_complete_precopy until
                          pending data is 0
-                   (FINISH_MIGRATE, _DEVICE, _STOPPED)
+                   (FINISH_MIGRATE, _DEVICE, _STOP)
                                   |
-                 (FINISH_MIGRATE, _COMPLETED, _STOPPED)
+                 (FINISH_MIGRATE, _COMPLETED, _STOP)
              Migraton thread schedules cleanup bottom half and exits
 
 Live migration resume path
@@ -136,7 +132,7 @@ Live migration resume path
 ::
 
               Incoming migration calls .load_setup for each device
-                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                       (RESTORE_VM, _ACTIVE, _STOP)
                                  |
        For each device, .load_state is called for that device section data
                        (RESTORE_VM, _ACTIVE, _RESUMING)
-- 
2.26.3


