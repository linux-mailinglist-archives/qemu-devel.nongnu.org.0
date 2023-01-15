Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F61566B36E
	for <lists+qemu-devel@lfdr.de>; Sun, 15 Jan 2023 19:38:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pH7rc-0007Ck-Lh; Sun, 15 Jan 2023 13:36:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7ra-0007CO-S1; Sun, 15 Jan 2023 13:36:14 -0500
Received: from mail-bn8nam11on2041.outbound.protection.outlook.com
 ([40.107.236.41] helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pH7rY-0007Zm-9t; Sun, 15 Jan 2023 13:36:14 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=M+v6mnMbPQOUB0bnFAQl2YK0gkuVcy/NILwGXUo2rq9Z1E691EqKC7EaTOLFx7C8sisXdCIa7I0xmDDWy4GFP1chk5upqvN+YF6rv7fstQjTdFzK1dfkKmo3oI1seaJFZs3XNH0KxOLsUhUZN8smUoIKzz5uLSKZg1FcGmb091QF880gST87XMorpI0kkFvscEsRoQNeuBnhedCbtJUgYNgBOyKrWp7ikvkeZundoGsW180zpokbvKic7c52EMmwz8d4/KDxGPNg9thQ3tuCkaZPnfhULY62yGR+G7CRmaz1tfr9FPnZDly90BHiZ/eeHIzI044tuDnSi9bqhTsD1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVBCma8WguCNmGVwdWQ9Asf2xE4IhC6mrdtV5wcA6EU=;
 b=grarUtbY5PZ1C/a6+0a2WqDUcuFKvW4IzUpJKfkIIcPMN/qCRGB+uHRDqqRbKhWwzmNsLGnh07o5U1uJEx/CQtrP11UUxlWC7v4wDCnmtM/6zQUOgXE+HXM21bugTDPG5VdB/YQTeoXPpZ5TF2ltjZMIAK5R7M+eyuXYHphIQyA2XlSlsFMTCFCBBEH6xGTTpmO+c/0IKSlTnEGOlExeBw3g32WoQEOZYoHEo8DX2ESwHzrCYk37zdnnntYvRr/D/mtWygv/MpFVLEZ8j4L+dQxgT+bFNm30Cv2r0EgW/pvhwJPhgWKkr8nZAaVwHFwg7mh3MmO1fFm7jU9XCznxig==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVBCma8WguCNmGVwdWQ9Asf2xE4IhC6mrdtV5wcA6EU=;
 b=jfkw4Vbi+CcsTQYroebKU7rlXUHOxiEBi/snqtBtw57kgC7Oyr5BviZls8+Gh/7BhTiqzKcvFx6PmJKjn9kAMKvGuw1g+LlR1Ok/nmMlAbkOMRFffTiH/2J8uLpBXD0hMDGt/FCiSYihh7xi8x/DA3Q3frS2ENET9Hn3aWBOk3E7ExBfpHBXZXgU1xn5N3eS6wwW9u4kMzzyuGvXZUzpkjwcGG3OpfaqCqEg6JeGUVfOXuguCqbBu0jTlo7nERlfs4nIJSM0mB+RFAoiHiflM6i8Uf493VaqJTKthTyDSSH8pcm1uiayEtPlDqCVi3uleFEn56aIixm+ZCEbFmaDZQ==
Received: from DM6PR10CA0005.namprd10.prod.outlook.com (2603:10b6:5:60::18) by
 CH2PR12MB4890.namprd12.prod.outlook.com (2603:10b6:610:63::20) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13; Sun, 15 Jan 2023 18:36:05 +0000
Received: from DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:60:cafe::4a) by DM6PR10CA0005.outlook.office365.com
 (2603:10b6:5:60::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.19 via Frontend
 Transport; Sun, 15 Jan 2023 18:36:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 DM6NAM11FT071.mail.protection.outlook.com (10.13.173.48) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6002.13 via Frontend Transport; Sun, 15 Jan 2023 18:36:05 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Sun, 15 Jan
 2023 10:36:03 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Sun, 15 Jan 2023 10:36:03 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Sun, 15 Jan 2023 10:35:56 -0800
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
Subject: [PATCH v7 00/13] vfio/migration: Implement VFIO migration protocol v2
Date: Sun, 15 Jan 2023 20:35:43 +0200
Message-ID: <20230115183556.7691-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT071:EE_|CH2PR12MB4890:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b8baa5a-befb-4f4c-6228-08daf7275c98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: igmst4mqIHWAQUrSzsLhN3wpxYaQ4VeIbNWzsRq11CYFKC4D06aWnY1zacYyDR7VJoLghFFv83ZbOpQZsDgzuYs63VjCNO37Eh0WYGWZ9diT8OsX2BpfLjvLuKRju0uX07/HF4XjEeILo7sfE8OMlZF7quFHIYKFs7x6uXCAMKF++oRMqJNvpZncjbeTobnmU+5aYX4n9gWr2qD0mYddx3DtSCydS0XWEzig6UHOPgpfj8J1S1KBN24blB6fxsO4bNggBofhRQ5cLr95InLcXskKQM4y3kaGVQjaxIUNR+++QOXoSYuPSHkD7pv3nSokFpAKpoQrZPzwu36LsxBgdSnd4Mgri1MIt01z5NdzNoT87ze3FYi0LKay4+whQfxs3X9oyi8XPXdcwG3sp5nNssFZYHXhko/gM6gBuAROvHX3XoPlsbEtEGy6GIJVeen5wyZ+x8i6A6uqAIOQVXDz87TkIcmHPx8N8TXisPjO9kGSgxdEZY3hLkAwfRjwz0uUSs/dNsa/oJ4Vchf+LvmEkBDUzSbOyhIEv6V1/YjPq0z4qZXyOqtjfvmM30DZcJ/wZcwHcIgDpKCq0TCQfe4S8bBlpu4WvqNL0OALBTUwqTw0fOND1KJdm5BfL1pDQRp+t7m0BmTVcVDpMdlOY6P3pKO1RHxySx3WeUJWo89XznshyYfaXi62aspH2gTFBBJgsuS2fLhpuYfbvuG2BQb5hrgD2aJrEYHVjB8K3erbfkdWYF6HYsP9vDfehrLFmWhA5prKRgjXEO/KGvuXGgvrKOCLbm8FCr4rn2p7ghwH8SLMF+ZRv5pdC9PJvYAZxsgV8zgky2qf9pojgEN022dl4w==
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(376002)(39860400002)(346002)(136003)(451199015)(40470700004)(36840700001)(46966006)(8936002)(5660300002)(7416002)(41300700001)(54906003)(6916009)(316002)(70206006)(2906002)(4326008)(70586007)(8676002)(966005)(356005)(186003)(7636003)(7696005)(82740400003)(36756003)(26005)(6666004)(82310400005)(36860700001)(1076003)(336012)(47076005)(426003)(40480700001)(478600001)(40460700003)(86362001)(2616005)(83380400001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2023 18:36:05.4216 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b8baa5a-befb-4f4c-6228-08daf7275c98
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT071.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4890
Received-SPF: softfail client-ip=40.107.236.41;
 envelope-from=avihaih@nvidia.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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

Patches 2-8 are prep patches fixing bugs, adding QEMUFile function
that will be used later and refactoring v1 protocol code to make it
easier to add v2 protocol.

Patches 9-13 implement v2 protocol and remove v1 protocol.

Thanks.



Changes from v6 [2]:
- Fixed another compilation error in patch #9 reported by Cedric.
- Added Reviewed-by tags.



Changes from v5 [3]:
- Dropped patch #3.
- Simplified patch #5 as per Alex's suggestion.
- Changed qemu_file_get_to_fd() to return -EIO instead of -1, as
  suggested by Cedric.
  Also changed it so now write returns -errno instead of -1 on error.
- Fixed compilation error reported by Cedric.
- Changed vfio_migration_query_flags() to print error message and return
  -errno in error case as suggested by Cedric.
- Added Reviewed-by tags.



Changes from v4 [4]:
- Rebased on latest master branch.
- Added linux header update to kernel v6.2-rc1.
- Merged preview patches (#13-14) into this series.



Changes from v3 [5]:
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



Changes from v2 [6]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [7] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [8] but
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



Changes from v1 [9]:
- Split the big patch that replaced v1 with v2 into several patches as
  suggested by Joao, to make review easier.
- Change warn_report to warn_report_once when container doesn't support
  dirty tracking.
- Add Reviewed-by tag.

[1]
https://lore.kernel.org/all/20220224142024.147653-10-yishaih@nvidia.com/

[2]
https://lore.kernel.org/qemu-devel/20230112085020.15866-1-avihaih@nvidia.com/

[3]
https://lore.kernel.org/qemu-devel/20221229110345.12480-1-avihaih@nvidia.com/

[4]
https://lore.kernel.org/qemu-devel/20221130094414.27247-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/qemu-devel/20221103161620.13120-1-avihaih@nvidia.com/

[6]
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[7]
https://lore.kernel.org/qemu-devel/20221003031600.20084-1-quintela@redhat.com/T/

[8]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[9]
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

Juan Quintela (1):
  migration: No save_live_pending() method uses the QEMUFile parameter

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
 hw/vfio/common.c                              |  41 +-
 hw/vfio/migration.c                           | 748 ++++++------------
 migration/block-dirty-bitmap.c                |   3 +-
 migration/block.c                             |   2 +-
 migration/migration.c                         |   4 +-
 migration/qemu-file.c                         |  34 +
 migration/ram.c                               |   2 +-
 migration/savevm.c                            |   7 +-
 hw/vfio/trace-events                          |  29 +-
 33 files changed, 898 insertions(+), 637 deletions(-)

-- 
2.26.3


