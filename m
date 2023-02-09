Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2945269114D
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 20:26:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQCYo-0003z9-Bo; Thu, 09 Feb 2023 14:26:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCYi-0003ym-8b
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:26:16 -0500
Received: from mail-mw2nam12on2086.outbound.protection.outlook.com
 ([40.107.244.86] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pQCYe-0006ov-Vz
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 14:26:15 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TQorM92VJBCq9Lx980Ce7uJq4D4oygixiNiEAK8CmGBq2fVIGBJIA1YjxBMRehHr/US40qMYPk779UoeWV3nkr+Wz2D9gxL8Po02sXGZukWmYhHx6fXPp+X303TzAoHrw0BChd/z7hcq0oqqweejmxN6Au+x1j2h43Ov0VZREns4Dkm0+k/gmRdjkLoL+60xwYiIiKtwn6Lz6UhoM6Fzp0NtOhRnFNlU6EKjGKgkN6nrxUy8P3RoM0hahgsQxul0sWQgjDbKufSx9gbHVxK7EvHnG2oLGc38qY47WtuBNN+Ic2zNqsq+5yyFKb9xShdAhprhZgrY+FdIfWEcisEI7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QMPt+rtMcXbivGccHMN/j7d/0Bh2NPYJh+ScmYcrp8U=;
 b=a46cvIZb357bo94j+1aQuEBQDX1ORMoQmZKGwg1QqyQ0XfS8sh2A+BO+Uyz3+HnjJtUSmgGN4zgba98spZSSL3HD5X36vnXD3tsMajH+2OQIFzo+0Cs4CrdwZ/aRskrI4i8ck0547og2zbnBT07+IqopG1ZIsbo/0K0JjgM9yoWMDVxEYFuYY4i1h5jIZMMtDw4h/RYo2sQ76PW3yaQlQtQ/RLLqUFO1LDrdDevdrEeOfXqNb7y3RK/cExBai440/RDXO2id8NWmtEpDUFOM0vIM33Xk2ikUH18UVFI27Pt42X5E5kwXFHluztM2KEkzcdYkgegBlO1O+5Io3qe3Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QMPt+rtMcXbivGccHMN/j7d/0Bh2NPYJh+ScmYcrp8U=;
 b=iuqk5rUoyfC+nM80B/QEBmVvqC1XmbcElMGtzzcXgZg/qm9QL1HzPEGsRZ4padXVQtqwgOgPIV93U1S7Djpsm8QiSlRr+Mk3EMKsfMAcYY8qtjMXVLg7PWd4Dst1tgOo5o2gvtvPBujuI2Xo+gdH7OiAIYpImXBtzlQAIFjHIi951D+9OTrfVRdGq9RHTXDyGmfboWHrYwBWrTR0shTR7Yn2bCMS03eRr1vowig9/lVt4TPXT+5cHgYgOJnUw+HEtWAeHneUjbCfflObdKfv8X2zH4WeXmK3crDQUP52np7BhZ3FwLw0+Kr5Ed9cidRSLC7xna+hyTINxUs6Ztv+gg==
Received: from DM6PR02CA0061.namprd02.prod.outlook.com (2603:10b6:5:177::38)
 by SJ2PR12MB7799.namprd12.prod.outlook.com (2603:10b6:a03:4c2::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 19:20:58 +0000
Received: from DS1PEPF0000E631.namprd02.prod.outlook.com
 (2603:10b6:5:177:cafe::92) by DM6PR02CA0061.outlook.office365.com
 (2603:10b6:5:177::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19 via Frontend
 Transport; Thu, 9 Feb 2023 19:20:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 DS1PEPF0000E631.mail.protection.outlook.com (10.167.17.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6086.16 via Frontend Transport; Thu, 9 Feb 2023 19:20:57 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 9 Feb 2023
 11:20:48 -0800
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 9 Feb 2023 11:20:48 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 9 Feb 2023 11:20:44 -0800
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
Subject: [PATCH v10 00/12] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 9 Feb 2023 21:20:31 +0200
Message-ID: <20230209192043.14885-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0000E631:EE_|SJ2PR12MB7799:EE_
X-MS-Office365-Filtering-Correlation-Id: 65a1dc57-8338-472d-2b33-08db0ad2c5c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wMLHbu46J828KA8d0hO2IOFIMeq5sAt/6WO7spbVHWVXtj0nCkwYGx2lJGkey5SaD4HWvuropGEuzdq79KsjUc6f2V28IDK4D0BoPraVeSM0G3tcusKJlLiDGkvSHDVmUR86h5x3zASkH3fNrVw7DN1O7Q/oZDZoXlVub2KyqgRbW2bf4KRR//12pn66HQ1bC3JHaI+DLuGq/H6fPES3fAgn9OhaEnh8HJMU98R9Q3IY64YwuXx6ymLT9KPx1BGZ0fUQkDv5Om9caQFqew5BLmKYcd/euf9er07IfTysF5CCHvEnUkzeSq8glYTyyfiD5LheO9PCp0UGAG/nlY4fsrCbQREwzIsEcPmZh3PE4Cx80+aXJSWDS9KMp8DhhJM61BYvwBPVqO23njlxHQ4MzEQDRhCeQIid7dXIGEEMj1551NzrG5NzBEGeAOKPtTb/89h0v/9iRXYaZ9rm4Gc1OoLcBfJNqbiXsQGBwmatASw7azBXbuqwlT5U36XCIdvR/tFETHeScYlVLKzXzH4CccwSmlHBRxiTPicMrjKC0DKq8hcmJkWLi4wXndRQQgfBTKpmsCrU0drFWtjqup5zaGnuofEr6YuFjehiVc8u4q8xHTHlhD4zD2UGvK8tEuic8t/qG/p8HgiN5J6gkafZjk1XRDEOXkzPU/ly0Pmi7XqHH7RAh3P4V+om7H/X6ieAP/T80kW/NtJq17c5P0Vko/sbhI8hEia1QYXQfleJFOYfvD0DqLVA5wniILtkkIxhhPBZoyP4S9BFJxg0QzCuNVtT1FneE4ZpkxXEz8EjMHtElBGJAsgvN9RLz8eaDUihHtFdN8ItnicBy+B1dWZFZA==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(396003)(376002)(39860400002)(136003)(451199018)(36840700001)(40470700004)(46966006)(6916009)(4326008)(70586007)(70206006)(8676002)(336012)(36860700001)(7636003)(316002)(40460700003)(83380400001)(54906003)(86362001)(426003)(5660300002)(7416002)(966005)(478600001)(356005)(186003)(36756003)(1076003)(26005)(6666004)(30864003)(2906002)(47076005)(82740400003)(41300700001)(82310400005)(8936002)(7696005)(2616005)(40480700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 19:20:57.8963 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a1dc57-8338-472d-2b33-08db0ad2c5c3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0000E631.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7799
Received-SPF: softfail client-ip=40.107.244.86;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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

This v10 is rebased over Juan's pull request [1] which made some changes
to the migration handlers. Therefore, I had to do some more significant
changes to the main patch (#9) and thus removed Cedric's R-b.
The full changelog is below.



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
found here [2].



Patch list:

Patch 1 updates linux headers so we will have the MIG_DATA_SIZE ioctl.

Patches 2-8 are prep patches fixing bugs, adding QEMUFile function
that will be used later and refactoring v1 protocol code to make it
easier to add v2 protocol.

Patches 9-12 implement v2 protocol and remove v1 protocol.

Thanks.



Changes from v9 [3]:
- Rebased on latest master branch. As part of it:
  1. Dropped patch #2 as it was merged in Juan's pull req already.
  2. Dropped patch #11 (vfio_save_pending() optimization). With Juan's
     changes we can achieve this optimization by implementing only
     .state_pending_exact() handler and not a .state_pending_estimate()
      handler (see comment in code).
  3. Some function refactoring to be aligned with Juan's changes.

- Made multiple_devices_migration_blocker static (Cedric).

- Addressed Alex's comments:
  1. Changed multiple devices migration block/unblock logic.
  2. Removed recover_state local variable in
     vfio_save_complete_precopy().
  3. Added comments explaining the purpose of ERROR state usage as a
     recover state (three places).
  4. Changed vfio_migration_set_state() to directly reset the device if
     ERROR is given as recover_state, instead of setting the device in
     ERROR state, failing and only then resetting the device.
  5. Added a note in VFIO migration documentation that migration is
     supported only with a single device.



Changes from v8 [4]:
- Added patch that blocks migration of multiple devices. As discussed,
  this is necessary since VFIO migration doesn't support P2P yet.
- Removed unnecessary P2P code. This should be added when P2P support is
  added.
- Fixed vfio_save_block() comment to say -errno is returned on error.
- Added Reviewed-by tag to linux headers sync patch.



Changes from v7 [5]:
- Fixed compilation error on windows in patch #9 reported by Cedric.



Changes from v6 [6]:
- Fixed another compilation error in patch #9 reported by Cedric.
- Added Reviewed-by tags.



Changes from v5 [7]:
- Dropped patch #3.
- Simplified patch #5 as per Alex's suggestion.
- Changed qemu_file_get_to_fd() to return -EIO instead of -1, as
  suggested by Cedric.
  Also changed it so now write returns -errno instead of -1 on error.
- Fixed compilation error reported by Cedric.
- Changed vfio_migration_query_flags() to print error message and return
  -errno in error case as suggested by Cedric.
- Added Reviewed-by tags.



Changes from v4 [8]:
- Rebased on latest master branch.
- Added linux header update to kernel v6.2-rc1.
- Merged preview patches (#13-14) into this series.



Changes from v3 [9]:
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



Changes from v2 [10]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [11] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [12] but
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



Changes from v1 [13]:
- Split the big patch that replaced v1 with v2 into several patches as
  suggested by Joao, to make review easier.
- Change warn_report to warn_report_once when container doesn't support
  dirty tracking.
- Add Reviewed-by tag.

[1]
https://lore.kernel.org/qemu-devel/20230202160640.2300-1-quintela@redhat.com/

[2]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

[3]
https://lore.kernel.org/qemu-devel/20230206123137.31149-1-avihaih@nvidia.com/

[4]
https://lore.kernel.org/qemu-devel/20230116141135.12021-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/qemu-devel/20230115183556.7691-1-avihaih@nvidia.com/

[6]
https://lore.kernel.org/qemu-devel/20230112085020.15866-1-avihaih@nvidia.com/

[7]
https://lore.kernel.org/qemu-devel/20221229110345.12480-1-avihaih@nvidia.com/

[8]
https://lore.kernel.org/qemu-devel/20221130094414.27247-1-avihaih@nvidia.com/

[9]
https://lore.kernel.org/qemu-devel/20221103161620.13120-1-avihaih@nvidia.com/

[10]
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[11]
https://lore.kernel.org/qemu-devel/20221003031600.20084-1-quintela@redhat.com/T/

[12]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[13]
https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/

Avihai Horon (12):
  linux-headers: Update to v6.2-rc1
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Allow migration without VFIO IOMMU dirty tracking
    support
  migration/qemu-file: Add qemu_file_get_to_fd()
  vfio/common: Change vfio_devices_all_running_and_saving() logic to
    equivalent one
  vfio/migration: Block multiple devices migration
  vfio/migration: Move migration v1 logic to vfio_migration_init()
  vfio/migration: Rename functions/structs related to v1 protocol
  vfio/migration: Implement VFIO migration protocol v2
  vfio/migration: Remove VFIO migration protocol v1
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align VFIO migration docs to v2 protocol

 docs/devel/vfio-migration.rst                 |  72 +-
 include/hw/vfio/vfio-common.h                 |  10 +-
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
 hw/vfio/common.c                              |  92 ++-
 hw/vfio/migration.c                           | 741 ++++++------------
 migration/qemu-file.c                         |  34 +
 hw/vfio/trace-events                          |  28 +-
 25 files changed, 940 insertions(+), 616 deletions(-)

-- 
2.26.3


