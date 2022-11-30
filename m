Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8C0763D251
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 10:45:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0Je9-00037O-Sf; Wed, 30 Nov 2022 04:44:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Je5-000345-8V; Wed, 30 Nov 2022 04:44:49 -0500
Received: from mail-dm6nam12on20610.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::610]
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1p0Je0-0002mT-8O; Wed, 30 Nov 2022 04:44:48 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UlgYlWssumUNftDZOS7F+dMVpZAI11+fbLqB9WxvxbXGjJGBjRJiE1hdR2VhnzPidlthCrUKfYXn52/pt9Ep6o9FzPfuInO2kk6BWbR/OA6MSSSByDuA0vX6MTEZFqyS0iCFdk4xZ+Z7hladjRcf/wqPNeBUz8f5AN/0SFhvPOaQmg99/xwoPeQ0H8/CwimBIhu4m5lIt3Qm8hUn6HoMdr0obiUb+cIRueIZWL/49E/fbk98cfaQqj8OcxCyjBMMqDugVVDb27S6c/NsmmBRTEWKlIRf0pveelYqf4BmQ1QnWWYiO8/soE/P6myHcSKqzVZGvbrT2xHpn6lHduF8Rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YeQKgtk9DgPcmP5FKc0KaO8i8E6a1AZ6xD9AtjgSkh0=;
 b=kgZ2vHwRh4Q2pKnQD5J4q/jmAf59QDzHr6knxl1evZ4bAGmLQTsqXJPjY9oGM9SEO/7jClNxLxiIDGuNoBQV5bf8ep4gfXDV1WLEmeuAdMzFyPKPP8C1uio5Bqv5C1kQJ7st2mkV1mIaLqkyO6IToNn9sNT/XFM26B/HnjJDWsy/t+74EchJ0AZdmFdHfKjqnhUnGNGY/O5TAGlZ/Vp4eygLlgrUyHF7IxA5PSyCqKFMscqwtjckdA9x6YEhpeYA0HXQg6+QdMvqrbgauDUQg3ChvsMGcBdrFo7QEfWxsRKtSM+ZI+BDfXtVqOaHl1T9nIuSoP7LqWKQPtwx4UWWFw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YeQKgtk9DgPcmP5FKc0KaO8i8E6a1AZ6xD9AtjgSkh0=;
 b=bsU3qK6sJUVhuGch8YuwqQRgBnXLTorfLV/F173OFQAkVFclgoffapclZ8xg7I/pemgdsAr3GrUbAjYlS4AaxKS2dfH6XmUZPDVtDW+wS5FVCnLjqlg49PPftUiMhUV3B8zE25BGqR2l7eQ3EUB1pKELvpcg2p5TvqlIWL4blSSfKRxKdwv/C477bh9z0VdH74h24AKHsUgDVMIOPtCIT+wFzFHGIy2xQDA2VU3pLbTklMUOH95+wGi8wZhxNi2n82c2vid+P45CxRcoSkN9WlkFoK2rwGELyeM9d/3H7Pn+ALG1izl7A6PIXYuVdy+NhGMyNHqYD9fImgcM7YJt4w==
Received: from MW4PR04CA0265.namprd04.prod.outlook.com (2603:10b6:303:88::30)
 by PH8PR12MB7447.namprd12.prod.outlook.com (2603:10b6:510:215::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 09:44:37 +0000
Received: from CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:88:cafe::f6) by MW4PR04CA0265.outlook.office365.com
 (2603:10b6:303:88::30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23 via Frontend
 Transport; Wed, 30 Nov 2022 09:44:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1NAM11FT076.mail.protection.outlook.com (10.13.174.152) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5834.8 via Frontend Transport; Wed, 30 Nov 2022 09:44:36 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:22 -0800
Received: from rnnvmail202.nvidia.com (10.129.68.7) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 30 Nov
 2022 01:44:21 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.7)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 30 Nov
 2022 01:44:15 -0800
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
 <maorg@nvidia.com>, Shay Drory <shayd@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v4 00/14] vfio/migration: Implement VFIO migration protocol v2
Date: Wed, 30 Nov 2022 11:44:00 +0200
Message-ID: <20221130094414.27247-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT076:EE_|PH8PR12MB7447:EE_
X-MS-Office365-Filtering-Correlation-Id: e3f2bd6e-1d75-4837-55b3-08dad2b77e6b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: j6JGfyPeepw4c9D5d+NMHohh4PpUqxqNy1zFpfpkl1Ft25N8MRhHjxZPK3IVyLGRjEeUa2a+aU9ySlx+MkBFnUK4SrCFuhq3620qc8IPhGFKDm2uqLZBmYKhRGFD7zOOT/Gm4JPM1hHi8LrrB3wVH/NDFa5hnp8liMk3/ZGYK0yI/E5nHbyMe84MwspOuxTyC5L3MoYXw0Yd6ijvg7q/NmVHbTxjIrMNVvzbOpK4f6xbCRoHczxnWO6S+oW+g3bfinWgb92vLY8Z6HXY6odmFm+MO7RiXz424dP6lypLoEaB4gyKJNFICUhbYDqOzIpItTjADivop6+KTBmlfhWg5vPy6VGujfkBDeE17gcFBJPPPON7SWiraMGd6Mgw2ozuLcdGsP518ij/KE6g26mnFc80iRINCND2gyjGQBsNslUzvvwxyuRYF+Ni6pXDPqo3W8kaMeO5qF7dZ332oq9wlyPlXDyTb0wLURksA0EjQlSqADpKpvTxOYrFIitwHz+dingwXJA2NIvqRfhKldchpjWkZRFhCUEpszFWse8l8401E94k5mt/1dczo7Ve1RCCNxDQWqlvvftNT0WSd3kiZAaod0gyOZRD/PVUHUewXXmSrvA0+vMvueDZciC+fZS1fVP6D19K7H9IpHvDX5eJ7MDb+9HKNfxyr5g9+lb/xs19ELIuq4e33esu4oRS5e+QC/MoN64qVGttU/tNMhP5NbLHgzD3J/Bp6FDLa/RWpOEahzsBzZe9LB5nhhqywxkIoKlKvw4QMnhtyOQAhntAB+mQBQ4YLp8MtVwO/uG9lZlw2ozwbXQ9ps/Ee70IgeS4hxmxnKDUEqaCtQhXtBuziQ==
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(396003)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(2906002)(41300700001)(54906003)(70206006)(186003)(8676002)(36860700001)(40460700003)(316002)(8936002)(70586007)(5660300002)(26005)(426003)(86362001)(6666004)(7416002)(966005)(82310400005)(1076003)(7636003)(2616005)(6916009)(336012)(36756003)(4326008)(356005)(40480700001)(478600001)(83380400001)(82740400003)(47076005)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 09:44:36.6595 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e3f2bd6e-1d75-4837-55b3-08dad2b77e6b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT076.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7447
Received-SPF: softfail client-ip=2a01:111:f400:fe59::610;
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

Hello,

A long time has passed since v2 of this series was posted. During this
time we had several KVM calls discussing the problems that were needed
to be solved in order to move forward.

This version of the series includes quite some changes, and I believe
that it addresses all the major problems we have discussed.

Following VFIO migration protocol v2 acceptance in kernel, this series
implements VFIO migration according to the new v2 protocol and replaces
the now deprecated v1 implementation.

The main differences between v1 and v2 migration protocols are:
1. VFIO device state is represented as a finite state machine instead of
   a bitmap.

2. The migration interface with kernel is done using VFIO_DEVICE_FEATURE
   ioctl and normal read() and write() instead of the migration region
   used in v1.

3. Migration protocol v2 currently doesn't support the pre-copy phase of
   migration.

Full description of the v2 protocol and the differences from v1 can be
found here [1].



Patch list:

Patches 1-2 are patches taken from Juan's RFC [2].
As discussed in the KVM call, since we are going to add a new ioctl to
get device data size while it's RUNNING, we don't need the stop and
resume VM functionality from the RFC.

Patches 3-8 are prep patches fixing bugs, adding QEMUFile function
that will be used later and refactoring v1 protocol code to make it
easier to add v2 protocol.

Patches 9-12 implement v2 protocol and remove v1 protocol.

Patches 13-14 are preview patches (which are not for merging yet) that
demonstrate how the new ioctl to get device state size will work once
added.

Thanks.



Changes from v3 [3]:
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



Changes from v2 [4]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [2] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [5] but
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



Changes from v1 [6]:
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
https://lore.kernel.org/qemu-devel/20221103161620.13120-1-avihaih@nvidia.com/

[4]
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[6]
https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/

Avihai Horon (12):
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Allow migration without VFIO IOMMU dirty tracking
    support
  migration/qemu-file: Add qemu_file_get_to_fd()
  vfio/common: Change vfio_devices_all_running_and_saving() logic to
    equivalent one
  vfio/migration: Move migration v1 logic to vfio_migration_init()
  vfio/migration: Rename functions/structs related to v1 protocol
  vfio/migration: Implement VFIO migration protocol v2
  vfio/migration: Remove VFIO migration protocol v1
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align vfio-migration docs to VFIO migration v2
  vfio/migration: Use VFIO_DEVICE_FEATURE_MIG_DATA_SIZE ioctl
  vfio/migration: Optimize vfio_save_pending()

Juan Quintela (2):
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Simplify migration_iteration_run()

 docs/devel/vfio-migration.rst  |  68 ++-
 hw/s390x/s390-stattrib.c       |   2 +-
 hw/vfio/common.c               | 119 +++---
 hw/vfio/migration.c            | 727 +++++++++++----------------------
 hw/vfio/trace-events           |  29 +-
 include/hw/vfio/vfio-common.h  |  10 +-
 include/migration/register.h   |   3 +-
 linux-headers/linux/vfio.h     |  13 +
 migration/block-dirty-bitmap.c |   3 +-
 migration/block.c              |   2 +-
 migration/migration.c          |  29 +-
 migration/qemu-file.c          |  34 ++
 migration/qemu-file.h          |   1 +
 migration/ram.c                |   2 +-
 migration/savevm.c             |   7 +-
 migration/savevm.h             |   3 +-
 16 files changed, 430 insertions(+), 622 deletions(-)

-- 
2.26.3


