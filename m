Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F63658C0E
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 12:06:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAqiB-0006vl-0u; Thu, 29 Dec 2022 06:04:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqhu-0006qp-58; Thu, 29 Dec 2022 06:04:27 -0500
Received: from mail-bn1nam02on2082.outbound.protection.outlook.com
 ([40.107.212.82] helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pAqhq-0006QI-AO; Thu, 29 Dec 2022 06:04:16 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XaqBf9rdwUEJ3M1ffpbLaGtVEkPa8UYU3n0N12UZz5LywFoJMqBAkH6/7b2q27PdIEDwa2+HPzXOlqNewgRASZw2YDo+yYYT7lBfNQN++CvvSqn6tUMrN0lNmY7FQCV61ZV3kVxg7P51onwkvmhvOTAqF5Vmx55CKCMGc5Uo1D9MOIxl9BnViJ6FrIpxvaiMEJvDrOQSYzxIJUevxp0z+VwKFe3soLpccm8NTrvUh4PPYxXkcVOiuV7fMW4a/hF1gCWhfQvUegCFFwoS4iy13RK8s3ZXi8OCrzeEa/JtTj4HySnrWVmEHbvTMCysa3tEdzD2nR+OmY3dtPiDl5Zyww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4tt6U6QBO3eUwk8Dreh5Ye3KUidR2iP7JKyclENm7zk=;
 b=O5KAZxTtlYKSTuXdKvBYzOQzCDVh/EJQSpCxNicrxxKUsQX50lnx1O1V646obiMdu8jk9ATp3fnzKxVyc6vEiPxUJdOZY3NeyxBLrJ5Xl3eQzWurkxj/8U63ySdo3OVOKYO4C0Lk5n1DN/ty+EmNTmVtrX33DMaRCakvFKgcm4S2ZqvYI/mf3YpBvgzESO66RvjzwOjJssJf5FIygAbXJu6sy70QoR6vmJ4q7FkheG76Zu8AeF3htRLCo9ivUIcZk4iXgMONz9Lz+M2Z07/98CQlbR4VHPQ+HwbBa28Dw8MKFlf+SsDp6vnXeZy2R9HpUMdhJqddjV4m1FanBwTMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4tt6U6QBO3eUwk8Dreh5Ye3KUidR2iP7JKyclENm7zk=;
 b=Mp6wQgHu5kJURMJ9pgB+g9PKRsyvRqdJE/hy+ieNPRA1ri8ppP/5S5h3Ja1+OpaC4JX6FsN4C2jwTOnSWur06rG6mGsgUpGT4qciBHsUmBKUUVA53vkjwcs6ip7S1xOr08lgH9uyuWFTT+ypMGAyWh2+HdXGPc8HH1Yx/QFF4sdCMOXkb76yc9Khm/ZqqYzMxAP5xxaPTWhu6vpmp4IVJAHDD1yEcvkl0JsaVFhc0LoPhp0eWCoHHdpdtyuSQu6Px8DySFjqAFwzWmTLFP36BSlrz6JRdc1cbO777rSasR/gaQK6AEtOE8rlEQ/V+IMy5J7DrDxx5jJ5egZ8F4h5sA==
Received: from DS7PR03CA0191.namprd03.prod.outlook.com (2603:10b6:5:3b6::16)
 by DM4PR12MB6253.namprd12.prod.outlook.com (2603:10b6:8:a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5944.16; Thu, 29 Dec
 2022 11:04:06 +0000
Received: from DS1PEPF0000E646.namprd02.prod.outlook.com
 (2603:10b6:5:3b6:cafe::db) by DS7PR03CA0191.outlook.office365.com
 (2603:10b6:5:3b6::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5966.17 via Frontend
 Transport; Thu, 29 Dec 2022 11:04:06 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0000E646.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5944.8 via Frontend Transport; Thu, 29 Dec 2022 11:04:06 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:03:53 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 29 Dec
 2022 03:03:53 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 29 Dec
 2022 03:03:46 -0800
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
Subject: [PATCH v5 00/14] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 29 Dec 2022 13:03:31 +0200
Message-ID: <20221229110345.12480-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E646:EE_|DM4PR12MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 3f6773f2-6907-4d27-ef41-08dae98c676d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /M05NmZh4u1GmtMAt988fPpLtdZspSqtE7g2XTqTc1OKVx81wRTbliquKkDBf15MHHY4Gug9nLMliq7WFXNv1rpaeQDJuxUIhewNauLZd6MaBnSQWoMvH8bPwvem7vNYoWfE0MSgVMIzv+Q+c12oaALAkC6oT3LyAl1NVwbbRUoEEYKVQmwmo5MTlU1ymYMU4oEO4X0KDuKAr0IwpRmbCf9rykDgWaCmFF4cruyG9444K4YFP9ZsU4EtP6Pk6mJZl+aLqmUv6LblkMUeHmb7/qisuavlpsZNp7x4gHijR1RpWYCInA923T6YhASEu4atIq1LuQ4DUbVxtHxacVddBZfh4A9w0GaK8ZEcY4ahX98h0l1i2TqsgpQlJp0Ie0bA5ycIV8yNe5cp6Bgnucp8vEnBtYdyUd3G+7aTrrg3DHgG43HmsvbxSfrBR8u7hkc3dgFzwHZc2FKMMdsEOuFxP6qLEuBxGxkGx0Kx1TjxVS37nMaYvkB0W8oTyEM36wS3okIa3vz/rrs/sYDtU2oidvIZSH7eE1bX4Kcnh7HYCN8enVImMk8xX4Gbq7Z4kaT7d5c4Nh0Tk1mxeE2kZHGZFsgDJpgZBf5nlUL+KQyxlFgDsMx2FP/td0nB9HZ1IU2Udu+qrqCQvt0CTsTK9mKYsFfcTCnuVD2cATOpWMZy9tP05yDkzJ7+iRXq5kI31ul43bf1eKgZhVh8gf+FAf4ipGbv38xIX48PVTFANWBhzbRyR3d3rrc6vgOwC/YgMYSFvTtSfZoYsFL/n70zq3va/mDk1/Qsk2iEZa3peT2U+f7yHs5kQcegCGPyx684nE4d0MDnyv9dgw8G9LkTRsckwQ==
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(346002)(376002)(39860400002)(451199015)(40470700004)(46966006)(36840700001)(4326008)(8676002)(70586007)(70206006)(356005)(8936002)(5660300002)(41300700001)(2906002)(6916009)(82310400005)(316002)(7416002)(36756003)(40460700003)(7636003)(54906003)(478600001)(7696005)(86362001)(82740400003)(6666004)(336012)(966005)(186003)(26005)(2616005)(1076003)(36860700001)(40480700001)(47076005)(83380400001)(426003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Dec 2022 11:04:06.4891 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3f6773f2-6907-4d27-ef41-08dae98c676d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E646.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6253
Received-SPF: permerror client-ip=40.107.212.82;
 envelope-from=avihaih@nvidia.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
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

Hello,

Now that QEMU 8.0 development cycle has started and MIG_DATA_SIZE ioctl
is in kernel v6.2-rc1, I am sending v5 of this series with linux headers
update and with the preview patches in v4 merged into this series.



Following VFIO migration protocol v2 acceptance in kernel, this series
implements VFIO migration according to the new v2 protocol and replaces
the now deprecated v1 implementation.

The main differences between v1 and v2 migration protocols are:
1. VFIO device state is represented as a finite state machine instead of
   a bitmap.

2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
   ioctl and normal read() and write() instead of the migration region
   used in v1.

3. Pre-copy is made optional in v2 protocol. Support for pre-copy will
   be added later on.

Full description of the v2 protocol and the differences from v1 can be
found here [1].



Patch list:

Patch 1 updates linux headers so we will have the MIG_DATA_SIZE ioctl.

Patches 2-3 are patches taken from Juan's RFC [2].
As discussed in the KVM call, since we have a new ioctl to get device
data size while it's RUNNING, we don't need the stop and resume VM
functionality from the RFC.

Patches 4-9 are prep patches fixing bugs, adding QEMUFile function
that will be used later and refactoring v1 protocol code to make it
easier to add v2 protocol.

Patches 10-14 implement v2 protocol and remove v1 protocol.

Thanks.



Changes from v4 [3]:
- Rebased on latest master branch.
- Added linux header update to kernel v6.2-rc1.
- Merged preview patches (#13-14) into this series.



Changes from v3 [4]:
- Rebased on latest master branch.

- Dropped patch #1 "migration: Remove res_compatible parameter" as
  it's not mandatory to this series and needs some further discussion.

- Dropped patch #3 "migration: Block migration comment or code is
  wrong" as it has been merged already.

- Addressed overlooked corner case reported by Vladimir in patch #4
  "migration: Simplify migration_iteration_run()".

- Dropped patch #5 "vfio/migration: Fix wrong enum usage" as it has
  been merged already.

- In patch #12 "vfio/migration: Implement VFIO migration protocol v2":
  1. Changed vfio_save_pending() to update res_precopy_only instead of
     res_postcopy_only (as VFIO migration doesn’t support postcopy).
  2. Moved VFIOMigration->data_buffer allocation to vfio_save_setup()
     and its de-allocation to vfio_save_cleanup(), so now it's
     allocated when actually used (during migration and only on source
     side).

- Addressed Alex's comments:
  1. Eliminated code duplication in patch #7 "vfio/migration: Allow
     migration without VFIO IOMMU dirty tracking support".
  2. Removed redundant initialization of vfio_region_info in patch #10
     "vfio/migration: Move migration v1 logic to vfio_migration_init()".
  3. Added comment about VFIO_MIG_DATA_BUFFER_SIZE heuristic (and
     renamed to VFIO_MIG_DEFAULT_DATA_BUFFER_SIZE).
  4. Cast migration structs to their actual types instead of void *.
  5. Return -errno and -EBADF instead of -1 in vfio_migration_set_state().
  6. Set migration->device_state to new_state even in case of data_fd
     out of sync. Although migration will be aborted, setting device
     state succeeded so we should reflect that.
  7. Renamed VFIO_MIG_PENDING_SIZE to VFIO_MIG_STOP_COPY_SIZE, set it
     to 100G and added a comment about the size choice.
  8. Changed vfio_save_block() to return -errno on error.
  9. Squashed Patch #14 to patch #12.
  10. Adjusted migration data buffer size according to MIG_DATA_SIZE
      ioctl.

- In preview patch #17 "vfio/migration: Query device data size in
  vfio_save_pending()" - changed vfio_save_pending() to report
  VFIO_MIG_STOP_COPY_SIZE on any error.
   
- Added another preview patch "vfio/migration: Optimize
  vfio_save_pending()".

- Added ret value on some traces as suggested by David.

- Added Reviewed-By tags.



Changes from v2 [5]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [2] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [6] but
  wasn't taken yet.

- Patch #2 (vfio/migration: Skip pre-copy if dirty page tracking is not
  supported):
  1. Dropped this patch and replaced it with
     "vfio/migration: Allow migration without VFIO IOMMU dirty tracking
     support".
     The new patch uses a different approach – instead of skipping
     pre-copy phase completely, QEMU VFIO code will mark RAM dirty
     (instead of kernel). This ensures that current migration behavior
     is not changed and SLA is taken into account.

- Patch #4 (vfio/common: Change vfio_devices_all_running_and_saving()
  logic to equivalent one):
  1. Improved commit message to better explain the change.

- Patch #7 (vfio/migration: Implement VFIO migration protocol v2):
  1. Enhanced vfio_migration_set_state() error reporting.
  2. In vfio_save_complete_precopy() of v2 protocol - when changing
     device state to STOP, set recover state to ERROR instead of STOP as
     suggested by Joao.
  3. Constify SaveVMHandlers of v2 protocol.
  4. Modified trace_vfio_vmstate_change and
     trace_vfio_migration_set_state
     to print device state string instead of enum.
  5. Replaced qemu_put_buffer_async() with qemu_put_buffer() in
     vfio_save_block(), as requested by Juan.
  6. Implemented v2 protocol version of vfio_save_pending() as requested
     by Juan. Until ioctl to get device state size is added, we just
     report some big hard coded value, as agreed in KVM call.

- Patch #9 (vfio/migration: Reset device if setting recover state
  fails):
  1. Enhanced error reporting.
  2. Set VFIOMigration->device_state to RUNNING after device reset.

- Patch #11 (docs/devel: Align vfio-migration docs to VFIO migration
  v2):
  1. Adjusted vfio migration documentation to the added
     vfio_save_pending()

- Added the last patch (which is not for merging yet) that demonstrates
  how the new ioctl to get device state size will work once added.



Changes from v1 [7]:
- Split the big patch that replaced v1 with v2 into several patches as
  suggested by Joao, to make review easier.
- Change warn_report to warn_report_once when container doesn't support
  dirty tracking.
- Add Reviewed-by tag.

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

[2]
https://lore.kernel.org/qemu-devel/20221003031600.20084-1-quintela@redhat.com/T/

[3]
https://lore.kernel.org/qemu-devel/20221130094414.27247-1-avihaih@nvidia.com/

[4]
https://lore.kernel.org/qemu-devel/20221103161620.13120-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[6]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[7]
https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/

Avihai Horon (12):
  linux-headers: Update to v6.2-rc1
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Allow migration without VFIO IOMMU dirty tracking
    support
  migration/qemu-file: Add qemu_file_get_to_fd()
  vfio/common: Change vfio_devices_all_running_and_saving() logic to
    equivalent one
  vfio/migration: Move migration v1 logic to vfio_migration_init()
  vfio/migration: Rename functions/structs related to v1 protocol
  vfio/migration: Implement VFIO migration protocol v2
  vfio/migration: Optimize vfio_save_pending()
  vfio/migration: Remove VFIO migration protocol v1
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align VFIO migration docs to v2 protocol

Juan Quintela (2):
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Simplify migration_iteration_run()

 docs/devel/vfio-migration.rst                 |  68 +-
 include/hw/vfio/vfio-common.h                 |  10 +-
 include/migration/register.h                  |   3 +-
 include/standard-headers/drm/drm_fourcc.h     |  63 +-
 include/standard-headers/linux/ethtool.h      |  81 +-
 include/standard-headers/linux/fuse.h         |  20 +-
 .../linux/input-event-codes.h                 |   4 +
 include/standard-headers/linux/pci_regs.h     |   2 +
 include/standard-headers/linux/virtio_blk.h   |  19 +
 include/standard-headers/linux/virtio_bt.h    |   8 +
 include/standard-headers/linux/virtio_net.h   |   4 +
 linux-headers/asm-arm64/kvm.h                 |   1 +
 linux-headers/asm-generic/hugetlb_encode.h    |  26 +-
 linux-headers/asm-generic/mman-common.h       |   2 +
 linux-headers/asm-mips/mman.h                 |   2 +
 linux-headers/asm-riscv/kvm.h                 |   7 +
 linux-headers/asm-x86/kvm.h                   |  11 +-
 linux-headers/linux/kvm.h                     |  32 +-
 linux-headers/linux/psci.h                    |  14 +
 linux-headers/linux/userfaultfd.h             |   4 +
 linux-headers/linux/vfio.h                    | 278 ++++++-
 migration/qemu-file.h                         |   1 +
 migration/savevm.h                            |   3 +-
 hw/s390x/s390-stattrib.c                      |   2 +-
 hw/vfio/common.c                              | 119 +--
 hw/vfio/migration.c                           | 742 ++++++------------
 migration/block-dirty-bitmap.c                |   3 +-
 migration/block.c                             |   2 +-
 migration/migration.c                         |  29 +-
 migration/qemu-file.c                         |  34 +
 migration/ram.c                               |   2 +-
 migration/savevm.c                            |   7 +-
 hw/vfio/trace-events                          |  29 +-
 33 files changed, 946 insertions(+), 686 deletions(-)

-- 
2.26.3


