Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D20C169978F
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 15:37:25 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSfNq-0003jC-Jf; Thu, 16 Feb 2023 09:37:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNh-0003Bl-CH
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:05 -0500
Received: from mail-mw2nam04on20611.outbound.protection.outlook.com
 ([2a01:111:f400:7e8c::611]
 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pSfNd-0004l1-MU
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 09:37:05 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UqF66E/+SsGycH496ih5PG4NJVpHh6KUZ07HIVv+TsJyGKOmRRn6hYv8bmJ5DwTzZQ75JGUNghmLPIGt6poCpVNhZUCaVXX8zlTuuNo1EfPFtOssIPSNiOqvCP5NNeG/tqV6QhLePjW0utX/73JXG3iCuLDJmLpV/CD82KJKJ7BETBB/kIYOcHh0/ShgLd67cJ/4GCAgId6CSqH/F8haz0K7UpTvUYV7kJImtwkn72zoOLDg+dEh88VkBVTs3oay/z679+Ql85R2SWYGbpl4liECkhspeQe1iFStdfs172aaI1MXfmlqV8cTalejLZxmnOowfQYwm+EFCeCBB0zv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jsHpVQUZsUBl6YCN43St7AS/Ttv8TXpGkK76aKg0Eu0=;
 b=YdnH9BvGSdnM7L5Xf5zcqnMK57osYw9OaCGjGjlvG183JeP6Oimnb+t8etbQV+8I3ZKcg03jXTvAHvbG5/2oYQd/4sKkxETnG1Idyx6OZXe2sFermkwgu+q1GTi82Usuy+SHc+xVCE8C1t81IwNLC2dLO5dAk88ZCSXP20nhrmr2WH7RNS+dbIwlx80UkkAWYKwS3dGGyXxItcQ+yxm0MZgT2FB3xp2p4hLsU4aROYbAcasTTpFL91NhBrlreBvv7iogsENw2lSqkGs3HX+jQ5Lz7EpWn6uXl1XXJwOP0bjnE5mMFJORVNalLa9AbsFNdkk7aA2cULi5iqup+cUDeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jsHpVQUZsUBl6YCN43St7AS/Ttv8TXpGkK76aKg0Eu0=;
 b=FrSh9sgKSZ/0nnhcbi7gyGt+FsSYTwiS4hQUIoNrdInjlXqEjC3v26Xz+LgZgLcx9GeDxBFR7JsDSB2XAqhp7sKRJxMvNlvFHy9PZxCu4AYMjXI+ppGioXej1VzGzgE5HSd1eEmspZSvpw6oUcj2MJhI/RiMG+Cysd3nWkzFUakR+n+rYwsiauXIyi8olwlplh5llKxzl5vQM+zzigesmnuB1YF2ppYN/H7abuzsIPX24trRDGnx7c7GrcZyQip7AbM2VOiay4CTOnYWP9y8+QCXBbJakoCAnTDo1zcn5Vv5/8N1HB9oKE433DinVUFx2Z8wl66wsf+XrXXSodIGaQ==
Received: from DM6PR02CA0081.namprd02.prod.outlook.com (2603:10b6:5:1f4::22)
 by PH8PR12MB6769.namprd12.prod.outlook.com (2603:10b6:510:1c4::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.26; Thu, 16 Feb
 2023 14:36:50 +0000
Received: from DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:1f4:cafe::71) by DM6PR02CA0081.outlook.office365.com
 (2603:10b6:5:1f4::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.13 via Frontend
 Transport; Thu, 16 Feb 2023 14:36:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DM6NAM11FT080.mail.protection.outlook.com (10.13.173.105) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6111.13 via Frontend Transport; Thu, 16 Feb 2023 14:36:48 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:37:28 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 16 Feb
 2023 06:36:35 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Thu, 16 Feb
 2023 06:36:31 -0800
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
Subject: [PATCH v11 00/11] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 16 Feb 2023 16:36:19 +0200
Message-ID: <20230216143630.25610-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT080:EE_|PH8PR12MB6769:EE_
X-MS-Office365-Filtering-Correlation-Id: f72888a0-6dac-4f4a-09e5-08db102b3c35
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ws6gzmQTxDo9EsDOpP4bhYdjNxpnoKSdB8ipasmlfHJ6CIXYyD/T6cacrC7RzgI90xX7w9ts+M6Zwr50f5ZXU3Zv8idMlU9z+WFue3yQsqfw2PGwvx9xpscyoqE8gxDghGx1pXT2w35u3Pvy2IWGItT+TYWdrCphX5gLM3Vj7ELt9K6BFp0/SYRGw/3/euVLmWc9YYFPee3m4M0GYhnE0SrF+vLG1XENMovqzp4mesSklDf3f9u2lfuKWteFtbEb68peYoZvDL5Yt7Y+KU3NEWrXu6Kdpc+TszYBON1MzqGxXpUdc3dFIfeqnlguMs6owcjaLGZhiVNk7jesWuoXvc1zAuQv05zQ0eccz8UhzzvdX0N6x1Xt4qU8hwXFSbUTUiPaLJkIhcn1t8EwBK1ohpeVle/GxMTJ3Kl2IzooqVE3d+FOUFiCTrQn17Wvs3xVGeWpiZ7OVul5wF9SDkyg8a7ilo/niz7OqHIM0ILLgqOvcUtRaqzgOTwZdI/z4Wf9PhKcC5rrw1ByZmuhKZnLa6pQEHCMg6RT/kMiFqjeql5MPfQJYRZJuTxkJx+xRTpskknyYOHUQnCuCV6ASzyCvvQ7Yk+yfv/C8yZchkTuMnwvtG5spKdBEZsGjA93WX1qjav036qvl63dXm7UVpjaf2p9Hk1cz9r5Us6F38on3AcanFwXZTr23f1c/3bt8mdAPDf2F/GvYK5LQqS29WUuvET2h3+rKpRL4cgWf3Zy9qahga/05cPaED4iZeBrbpJ1Bw/NxCEbkdU7j3fmS7ltIkuq0kMNNsUtEBmQ3ffIrrc=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199018)(40470700004)(46966006)(36840700001)(2906002)(36756003)(30864003)(7416002)(2616005)(7636003)(82740400003)(356005)(336012)(40460700003)(8936002)(36860700001)(83380400001)(47076005)(426003)(54906003)(6916009)(316002)(8676002)(41300700001)(4326008)(70206006)(5660300002)(70586007)(1076003)(86362001)(6666004)(186003)(82310400005)(26005)(478600001)(966005)(40480700001)(7696005);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2023 14:36:48.1398 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f72888a0-6dac-4f4a-09e5-08db102b3c35
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT080.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6769
Received-SPF: softfail client-ip=2a01:111:f400:7e8c::611;
 envelope-from=avihaih@nvidia.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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

Patches 2-7 are prep patches fixing bugs and refactoring v1 protocol
code to make it easier to add v2 protocol.

Patches 8-11 implement v2 protocol and remove v1 protocol.

Thanks.



Changes from v10 [2]:
- Rebased on latest master branch and Juan's pull request [3].
- Changed linux headers sync patch (#1) to sync to v6.2-rc8.
- Dropped patch #4 (qemu_file_get_to_fd()) as it is included in Juan's
  pull request.
- Added Juan's/Cedric's R-bs.



Changes from v9 [4]:
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



Changes from v8 [5]:
- Added patch that blocks migration of multiple devices. As discussed,
  this is necessary since VFIO migration doesn't support P2P yet.
- Removed unnecessary P2P code. This should be added when P2P support is
  added.
- Fixed vfio_save_block() comment to say -errno is returned on error.
- Added Reviewed-by tag to linux headers sync patch.



Changes from v7 [6]:
- Fixed compilation error on windows in patch #9 reported by Cedric.



Changes from v6 [7]:
- Fixed another compilation error in patch #9 reported by Cedric.
- Added Reviewed-by tags.



Changes from v5 [8]:
- Dropped patch #3.
- Simplified patch #5 as per Alex's suggestion.
- Changed qemu_file_get_to_fd() to return -EIO instead of -1, as
  suggested by Cedric.
  Also changed it so now write returns -errno instead of -1 on error.
- Fixed compilation error reported by Cedric.
- Changed vfio_migration_query_flags() to print error message and return
  -errno in error case as suggested by Cedric.
- Added Reviewed-by tags.



Changes from v4 [9]:
- Rebased on latest master branch.
- Added linux header update to kernel v6.2-rc1.
- Merged preview patches (#13-14) into this series.



Changes from v3 [10]:
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



Changes from v2 [11]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [12] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [13] but
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



Changes from v1 [14]:
- Split the big patch that replaced v1 with v2 into several patches as
  suggested by Joao, to make review easier.
- Change warn_report to warn_report_once when container doesn't support
  dirty tracking.
- Add Reviewed-by tag.

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

[2]
https://lore.kernel.org/qemu-devel/20230209192043.14885-1-avihaih@nvidia.com/

[3]
https://lore.kernel.org/all/20230215200554.1365-1-quintela@redhat.com/

[4]
https://lore.kernel.org/qemu-devel/20230206123137.31149-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/qemu-devel/20230116141135.12021-1-avihaih@nvidia.com/

[6]
https://lore.kernel.org/qemu-devel/20230115183556.7691-1-avihaih@nvidia.com/

[7]
https://lore.kernel.org/qemu-devel/20230112085020.15866-1-avihaih@nvidia.com/

[8]
https://lore.kernel.org/qemu-devel/20221229110345.12480-1-avihaih@nvidia.com/

[9]
https://lore.kernel.org/qemu-devel/20221130094414.27247-1-avihaih@nvidia.com/

[10]
https://lore.kernel.org/qemu-devel/20221103161620.13120-1-avihaih@nvidia.com/

[11]
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[12]
https://lore.kernel.org/qemu-devel/20221003031600.20084-1-quintela@redhat.com/T/

[13]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[14]
https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/

Avihai Horon (11):
  linux-headers: Update to v6.2-rc8
  vfio/migration: Fix NULL pointer dereference bug
  vfio/migration: Allow migration without VFIO IOMMU dirty tracking
    support
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
 include/standard-headers/drm/drm_fourcc.h     |  29 +
 include/standard-headers/linux/ethtool.h      |  18 +-
 include/standard-headers/linux/fuse.h         |  16 +-
 .../linux/input-event-codes.h                 |   3 +
 include/standard-headers/linux/pci_regs.h     |   2 +
 include/standard-headers/linux/virtio_bt.h    |   8 +
 include/standard-headers/linux/virtio_net.h   |   4 +
 linux-headers/asm-arm64/kvm.h                 |   1 +
 linux-headers/asm-riscv/kvm.h                 |   3 +
 linux-headers/asm-x86/kvm.h                   |  11 +-
 linux-headers/linux/kvm.h                     |  34 +-
 linux-headers/linux/psci.h                    |   4 +-
 linux-headers/linux/vfio.h                    | 136 +++-
 hw/vfio/common.c                              |  92 ++-
 hw/vfio/migration.c                           | 736 ++++++------------
 hw/vfio/trace-events                          |  28 +-
 18 files changed, 611 insertions(+), 596 deletions(-)

-- 
2.26.3


