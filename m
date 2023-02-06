Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BCA568BCF7
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Feb 2023 13:34:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pP0h0-000853-0w; Mon, 06 Feb 2023 07:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gx-0007qc-0K; Mon, 06 Feb 2023 07:33:51 -0500
Received: from mail-dm6nam12on20614.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::614]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pP0gt-0000iU-MT; Mon, 06 Feb 2023 07:33:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5jMfw4h27Nyx+7XL46agTI7TpnZ7QBIz9kjEt01jqU+p/K6RXQRSCukHieBHBV+sVTV5S4fUVAyxxjqUwZkadkGPMXlxbO45ESS+Hrg8pMCiCi67omPAdfC6PZeZtrveYgR+LNU0VJuTG2uzTSUw3qMdZ6M5nAjLwLr78RsPoUeacg2txA+vGFqlggV2cx+MU5/JbcgieuuIAjnFUjZ4KobanP3rSLtwPBqTDjykXj9mvAJbJZMeTxYeSgnakGuLyqawYu0jcJjPlY139zozmyZySKBwqQs/DSi/dBcEM/gHDi8Y50uiwoAzihzVGrdxpYFLH8cQ8LbZ+Ln9P6LAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IIbiCHyN+VAgv65R/v0r1jLKNFBx84IPLz1EDxgnX0M=;
 b=kt3WHhdOT1GwBJJtqoWynLrt2c1x5S7pKc1rMIKcsADbGz8UKmyDWtO9wS771gE1wEJPRYmC4xdPNREG/9zdTCk20+DAhS0ieerUiM+DJjhAodETCHb3Sij9XR0YXT8Ak9EG4xdmQ+SpEZt99fMXtb4fvo98M1xtd6lykLFy/mvZxik47QOJae/2rh5QkUySw1wDKVhm4PD/75ShEd27AQwi+2rxt9yIKH1Nd4Ra6OWZ8zt/z3lLYG97xd3iCTfUVxi+qgT4tnzeJYlJvFz0rRRkuxyAuxooaVkEpSViLJBfUYz2KwwkJPJiN/TRnCRwH6pXZ/1HfjKTUXZa6Mz7aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IIbiCHyN+VAgv65R/v0r1jLKNFBx84IPLz1EDxgnX0M=;
 b=OBHUWq4hipBj4J9B/RCxtMZPu4QHZ7vU3SwtOBcinj3NSJLMEjuxCWAF1kpALeYWUkGUjoJZ4Z7rYeL4bPTa7+gYUEEK6UK8t17yIwCFxg5yYwT5a9kfLsgCBeMcmWS2DMeW2jU3qnWnOaxHkPTOUOR92TNDwgLQdRNTWgbbI7wbUL8GqOcz3bcJD+wS4ElevtKgLh+SFcu0UfFhEgm2lI7zkR+ZZct+v2xCI5jRJ6p1+DWyaOhhabrYIihfCTSwxHgBNH4ifWpL9EZEU40i62ExJkJMt89jvuqxbxD2RNQqRaAQzTwy/tNaHEpiKfQtVLJGQQnTUYAm0HAZNyUTWQ==
Received: from DM6PR01CA0017.prod.exchangelabs.com (2603:10b6:5:296::22) by
 SJ0PR12MB6782.namprd12.prod.outlook.com (2603:10b6:a03:44d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.31; Mon, 6 Feb
 2023 12:33:43 +0000
Received: from DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:296:cafe::28) by DM6PR01CA0017.outlook.office365.com
 (2603:10b6:5:296::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.34 via Frontend
 Transport; Mon, 6 Feb 2023 12:33:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DM6NAM11FT079.mail.protection.outlook.com (10.13.173.4) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6064.34 via Frontend Transport; Mon, 6 Feb 2023 12:33:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:33:35 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Mon, 6 Feb 2023
 04:33:34 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Mon, 6 Feb
 2023 04:33:27 -0800
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
Subject: [PATCH v9 14/14] docs/devel: Align VFIO migration docs to v2 protocol
Date: Mon, 6 Feb 2023 14:31:37 +0200
Message-ID: <20230206123137.31149-15-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20230206123137.31149-1-avihaih@nvidia.com>
References: <20230206123137.31149-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT079:EE_|SJ0PR12MB6782:EE_
X-MS-Office365-Filtering-Correlation-Id: 4697c12f-359a-4f44-9c1e-08db083e6231
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QWQtMqxO4vQnZCm99lCyJfGQE04LmfYDB2WuKx5hb0IipCHmeWOIM8TS0h++xYut0/Mycml+WyrmwRxQSaZK4SvjaZIJe0oUxUzJe1Z8XOF7WP8JDVBsKwDXs78FSiOa12yUmyHm6C0MBQufovDDTbejuLyGQriuXu/rPP1J7y6yxag2cIKRvkffrXXC2/JpIg19dyv8LF04u1MdRZfDpp4DNHAb6iyfZzqLZE2dSG81yIMYfn2cYrBEQMRTY94Az5MHwOpYYnp2+5+o3ITEAsYLj9Xa+wGujPe0AVJ2RlkR/PAR9XwnDvl6qTnafhM6X6xawDW3NdbXv1tjz4Y8aQUREQRV0BPHTwE3hqTeYo4WuAMaaUqPWQV5P3xp1EqrbyxVEcStvOzV5QPbUfvjmK0njFZBFRRrbeBK6L2eWs7H9WBI+URRkL794j32/zuOTg6Zw4ZUcNOLZ9g1jF97R2ZP6XvrRdf/WzzspdeeNLXl59YfNdPI/T1h0cekUyxA4peOaHvwMbF/8dRVrzJqFilPvBrpTBvV7ClyzBTbkxg14BIB8BkxKNsR/rtCopO6KYRyuh/2tg2sZzzSw1D/5lV3f8oeYT5KWSf+nsSIWQv4tLtAWUXhGsbttLt/+b0RTzkrORtz/kzhC7gPN+nOovhgoCpcLqsdQzgQ+OnfyUeTvvUNpM9iD6x4lNySZSH4nfhW/5Okl8Uxswr+thLrnQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(346002)(396003)(376002)(451199018)(40470700004)(36840700001)(46966006)(70586007)(82310400005)(4326008)(82740400003)(41300700001)(8676002)(6916009)(1076003)(8936002)(36860700001)(70206006)(356005)(26005)(316002)(54906003)(7636003)(7416002)(6666004)(5660300002)(478600001)(47076005)(83380400001)(40460700003)(186003)(426003)(2616005)(86362001)(36756003)(7696005)(40480700001)(336012)(2906002)(66574015);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2023 12:33:42.9907 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4697c12f-359a-4f44-9c1e-08db083e6231
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT079.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6782
Received-SPF: softfail client-ip=2a01:111:f400:fe59::614;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
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
 docs/devel/vfio-migration.rst | 68 ++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 9ff6163c88..1d50c2fe5f 100644
--- a/docs/devel/vfio-migration.rst
+++ b/docs/devel/vfio-migration.rst
@@ -7,46 +7,39 @@ the guest is running on source host and restoring this saved state on the
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
 
 * A ``save_live_pending`` function that reads pending_bytes from the vendor
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
@@ -71,13 +64,13 @@ tracking can identify dirtied pages, but any page pinned by the vendor driver
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
@@ -111,23 +104,22 @@ Live migration save path
                                   |
                      migrate_init spawns migration_thread
                 Migration thread then calls each device's .save_setup()
-                    (RUNNING, _SETUP, _RUNNING|_SAVING)
+                       (RUNNING, _SETUP, _RUNNING)
                                   |
-                    (RUNNING, _ACTIVE, _RUNNING|_SAVING)
+                      (RUNNING, _ACTIVE, _RUNNING)
              If device is active, get pending_bytes by .save_live_pending()
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
@@ -136,7 +128,7 @@ Live migration resume path
 ::
 
               Incoming migration calls .load_setup for each device
-                       (RESTORE_VM, _ACTIVE, _STOPPED)
+                       (RESTORE_VM, _ACTIVE, _STOP)
                                  |
        For each device, .load_state is called for that device section data
                        (RESTORE_VM, _ACTIVE, _RESUMING)
-- 
2.26.3


