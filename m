Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D65261843C
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:23:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqcxW-0007Sa-41; Thu, 03 Nov 2022 12:20:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcve-0001Zp-Gj; Thu, 03 Nov 2022 12:18:56 -0400
Received: from mail-mw2nam10on2083.outbound.protection.outlook.com
 ([40.107.94.83] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcvY-0008If-QY; Thu, 03 Nov 2022 12:18:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZOdZKHiRD0N4KsL5jIYbu03Gp4L6KRvzUYbfxEDgMS2yz4VzdRnCH2Sy3kI3hOe4zZC12XPgNj1gGcpHXeNzzSUEgXXxKdxYHV4zn6Kolx8uaraHjNngq72pFFtnZvJ9dwbLnl3E0CLRmDP+bkVj1olRCzCobn1a0/Z7SaYsbXDa6gErb7iUoJe0OFySWwz8CFniwMi9BdzBZYT0S58g2ZguE4vL0Ua6rU4srXsZgDH4v6Yxg819Iw4QAKX0NSrE3rysT/QFtuouuslFnGJdttwn/s+V5FB9O7SdbJJw45gRhLuJhNhxj7pQ+oStdAvjTTjkywfjOmyryHK77hU0ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GoMNWay27aQJm1B0UbLOVlQDLewk2rcI3IG58Ufnsl0=;
 b=IGxFBlJ5J2IvKpyFzveraT2OTG99nXpzVjh9i1tjli7vKtCnKJybCu0z6yLU37VWfrSqBmQRhSJfN4wGhdzt6p+FvD40Qjf0uUJHSMcrrENFfXZfc4qBgSI+JBmSjOUBh5nYS3BJQV0IMLkerLuulWwySTCOU7gFxXmWz8l8+XykaN5yEozfu3HHMVntEft0o2sEYWHHUsy+bc/IH7MAWAUCzSGpmHWS3cBrT0zdXxX0U+9IyvXKfQrkrngzc8ryy+GZ/xww2CPuyznX3bRUASLyyf5Bl4cvYaDi0jJzN4SFQBVQfb5O1NwJ/tKyEViAH+zb7H9BiX0/Gxm3IuMlbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GoMNWay27aQJm1B0UbLOVlQDLewk2rcI3IG58Ufnsl0=;
 b=MQKaz2sVq6uI5tOsf7+1kz2kLXmVCo5A+3V4+YRI6zLk112iPt25yrqik7FDrDxW2EZGxRGiEHmQKOeQAfFUmxrE2vOAj5TVDH6D3FEcu1dQEuc80iTvd8i1H0iIQKHjfUQWN/lePU/qfvzuX8ozupkwgaCZfk0L7bn0axIrGAZ1kkk2WHugWW7jZsbfZFk2DjjxYwJ9C1X3gHLK9Bq3HiO948LpocN7MzHH0f6dPlIcJzBnCL3xWRgFJpTanZwwkMQY0eNC8GmR7QGY0TOacNtfYV1Dvdy6AgQ4R0uOH9JzyJbsNI9XswXQ6yV0qY1Ea5fK0YWMHNp/FjNeosjSdg==
Received: from MW4PR03CA0140.namprd03.prod.outlook.com (2603:10b6:303:8c::25)
 by CH0PR12MB5172.namprd12.prod.outlook.com (2603:10b6:610:bb::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.22; Thu, 3 Nov
 2022 16:18:41 +0000
Received: from CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:8c:cafe::e) by MW4PR03CA0140.outlook.office365.com
 (2603:10b6:303:8c::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.21 via Frontend
 Transport; Thu, 3 Nov 2022 16:18:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT092.mail.protection.outlook.com (10.13.175.225) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:18:41 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:18:32 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:18:31 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:18:24 -0700
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
 <qemu-s390x@nongnu.org>, <qemu-block@nongnu.org>, Kunkun Jiang
 <jiangkunkun@huawei.com>, "Zhang, Chen" <chen.zhang@intel.com>, Yishai Hadas
 <yishaih@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>, Maor Gottlieb
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v3 16/17] docs/devel: Align vfio-migration docs to VFIO
 migration v2
Date: Thu, 3 Nov 2022 18:16:19 +0200
Message-ID: <20221103161620.13120-17-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
In-Reply-To: <20221103161620.13120-1-avihaih@nvidia.com>
References: <20221103161620.13120-1-avihaih@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT092:EE_|CH0PR12MB5172:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d305f41-0e3e-4461-189b-08dabdb71271
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IEoDKXLgbaVWGzoyLULiwrINreu1KRaCcyw7rqLLweCiIO2rpt6LV27J8EpAvQRpJQtWOIPUHd8DDshUZ7OjWuCaZO/8lRBlu+Bxy8qfaqlqcpY5uUkINsZVuVZm3/xAw4UHhzjp2DTluL8OY6Er0ctXwPtpqnhhTOPgW4/SeSZqwQNFypw0ljFe1ce4+ODHTtqt2tIK1K4QHijHGdBzwNsxAPuJrVzitmqIfzQivO0qRJM9V/OQ8GP6+ylR5+ZDcdcBmYAazwTg43kYCr+QGDux65pJKwCEgQr9Stqc1bQgCEdwW+mJkP7oTaau0YnJjAaDprIOtaGIC0HcqRo/eifdoV32165URzw/67OH9esZ2QobEDd4TA6bZJ6dV1lLzOCTvC+11YuDNaDfzMCsv5WsNuu0ZB+fxkNYPXKem9aKK4Zxz2qVmaedpkL+mVfifq7bTML5zJPbYJpxcV3JWnxkVVfn8AGGUw5gTEvVM5/ne7BGy2wJpntqoDn8lD8nIluhpSgSM8/BEtUt9KMTGc7mfwt5dukCB+Q5E339k789vgXrFTdhhQKiTsVeN4kSyJC/AUUKmi4L7I6n01GkdVUfz7s9YFTqzgy59fMDAc/xVYGwgqkGilW5OZiB4j1Sz82UNgdRG6QTlus2v23oONSOZsUVp1EDTGEhol1oLMe+naNuBLkld8roy/INkZiQwIgn8jno2x4pK/Il00okqa4BiqaDPbCvQWBxeD3GZrfynfpoCs6eB8sS/D9cIhwiWQIiRdnjzSCGLRKuqiXtgQ==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(136003)(396003)(451199015)(36840700001)(40470700004)(46966006)(7636003)(356005)(40480700001)(82310400005)(26005)(40460700003)(36756003)(86362001)(41300700001)(8676002)(70206006)(4326008)(70586007)(186003)(2616005)(336012)(8936002)(7416002)(5660300002)(478600001)(1076003)(7696005)(54906003)(6916009)(316002)(6666004)(36860700001)(82740400003)(2906002)(426003)(47076005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:18:41.1475 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d305f41-0e3e-4461-189b-08dabdb71271
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT092.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5172
Received-SPF: softfail client-ip=40.107.94.83; envelope-from=avihaih@nvidia.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Align the vfio-migration documentation to VFIO migration protocol v2.

Signed-off-by: Avihai Horon <avihaih@nvidia.com>
---
 docs/devel/vfio-migration.rst | 68 ++++++++++++++++-------------------
 1 file changed, 30 insertions(+), 38 deletions(-)

diff --git a/docs/devel/vfio-migration.rst b/docs/devel/vfio-migration.rst
index 9ff6163c88..ad991b7eeb 100644
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
+The pre-copy phase of migration is currently not supported for VFIO devices,
+so VFIO device data is not transferred during pre-copy phase.
 
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
2.21.3


