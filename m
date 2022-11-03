Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD1EB61840B
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Nov 2022 17:18:33 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1oqctl-0000OG-Hk; Thu, 03 Nov 2022 12:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqcth-0000IX-Gs; Thu, 03 Nov 2022 12:16:55 -0400
Received: from mail-mw2nam12on2064.outbound.protection.outlook.com
 ([40.107.244.64] helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1oqctc-00081F-N5; Thu, 03 Nov 2022 12:16:53 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/db8Z0kpsAwilbQ1oWEfhmRii0+Nosdry9RX1dPPAdarvTJUdIQkxJ9heAiHtiqgwCZ1wPIf0g6Xkps9zMA9nkIU9hWnPO3gw4t76BpIDB55TVNGHsIELqzw1+rZnY2dZ8jUuoYTSr33uS2o73pIClVjy+0JqthUgP/OVnhR329Q42uXKPMDS46ZHds8MvHTgwhEaHXEFfYuGvWfNwtE6o9tr/Mhh4OSUt9WG/YGKG+3/GFSov5DX/xEa+OqOYeUZCW3AaitCma9PG1c/aFQUEdYDwfblAatJGVp6mFQcs4q6mWlDL4upU6MJJHiExM//4FgifyCAr0bPHlDixfEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BkfBHtMz0zIim9MIdEsjJlguwxVwj06EvqSzVzppyKI=;
 b=F2QKFUByGHWIq7EiCUIn/yqk1jsBylt/NGXszqdRa7UjemOK45qaBRBHWDNX1y8lvrtDYzDv6Y+qaQGrLSAWeD06JHuosw4g7i94TFnhJ9t4zUuAnHUVkC5G+GdbRqeLhZHqS/CD9wp1Q6qVGoSq9NsTqw+6UclPti8RHz43z+zc7S8WQo3a1IFeydOHpGiC6GGSXPGR+5GOeBW0y1wCf1+CEu/oGDGql5mZ8PWz8Qh9Pqzk6+5NyXIsFYZ9mG6Y5tO5x6AjZA6fQFfZ4dnbZw+UpY4GIFZPD6QJQ8VnAfPGEBNbM91AzYtxeU21NinopUzpXDXzy0r5IG+xdW29FQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BkfBHtMz0zIim9MIdEsjJlguwxVwj06EvqSzVzppyKI=;
 b=cTP0WcGofpFytxlPsTc4HBZWm2Iv7q1xzR0VLrweHsk05giL7OpcXuOKmlymZYOlZtnP5SJnH71PgyllB3l1/mhKSHUlrjizrP+dHvjzKPirXM8Ps1aweO08bg2DmmlhjW2J0W65FqxAbbkYI2Jug155wmRpKWZVFBHq0I2L85ZGGqeyNNAz5wRWxLUHxb2N/veSpTAYURU6+4qhURip/eqQoWAyXC/3TDqFB+7uP5W8gHME9/V0XisG2EatqxdyXihM3Zj+RyDoM41avDx+Iw4PM+aNnb3IzBJ4hyq535N3Idi1gsS7igkz9Bbzr5Hg9uzfnFXYh9E22EerEf0zKg==
Received: from MW4PR04CA0077.namprd04.prod.outlook.com (2603:10b6:303:6b::22)
 by DS7PR12MB5933.namprd12.prod.outlook.com (2603:10b6:8:7c::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Thu, 3 Nov
 2022 16:16:41 +0000
Received: from CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:6b:cafe::5f) by MW4PR04CA0077.outlook.office365.com
 (2603:10b6:303:6b::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.21 via Frontend
 Transport; Thu, 3 Nov 2022 16:16:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1NAM11FT046.mail.protection.outlook.com (10.13.174.203) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5791.20 via Frontend Transport; Thu, 3 Nov 2022 16:16:40 +0000
Received: from drhqmail203.nvidia.com (10.126.190.182) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.26; Thu, 3 Nov 2022
 09:16:29 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail203.nvidia.com (10.126.190.182) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.29; Thu, 3 Nov 2022 09:16:28 -0700
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.182)
 with Microsoft SMTP Server id 15.2.986.29 via Frontend Transport;
 Thu, 3 Nov 2022 09:16:21 -0700
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
Subject: [PATCH v3 00/17] vfio/migration: Implement VFIO migration protocol v2
Date: Thu, 3 Nov 2022 18:16:03 +0200
Message-ID: <20221103161620.13120-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT046:EE_|DS7PR12MB5933:EE_
X-MS-Office365-Filtering-Correlation-Id: 49df7ae5-4890-4e3d-4693-08dabdb6ca66
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XZgyBZbXosgHBcNd/zLAXcO1MgdYEYb0RKXluosOPoN4nH+5IL4g20tR7WrKK81JdK3J4JU50GIs0gu8baiZs00D02E3kn+4tqNN3WYdX6cm2hEol9tzRg53HAyveoi43XMyJYv7bBcD+SW4Egogx/Ez9gRVVcmgqx6tYs73Yy6bhm7+TBkIGQkkkJCISdtGWnJeFfK4+IzTPNHxhR/m8xyKGdt7f+w0RVCcSH8lVkvv9Q2Di99RNbDxgZyAGtnlXXBj3U/apBasCV4HyXTQQx02j2BBNIiPM9O/NvEIUSR446OX/SHv8PhkL1EuPkQLqdfZ11J8BPDhQ9AD/sT46R1JgZltckv/iVAZb2p0ldK+JI9HnSZKZ2F7tEathjBj0n0Fh8Csc77bqiVL4B0KG2Cs+ovDMK1CWcfJir5YWLQYbgPlKaJ8O5g/xXal7GBZ7h4QifyJzIXT5aFpmrxWp+F5qNN6X7TfDiTmWxrly/MZX94YKH3+VNEHcB0T1blXPnzjV4NpJ8SQqQzva1OyQp5IseNPFjjgfXcDtl1xKeto0rYYVT0OC9UKNnURwWZ2eL8i5a5MIEtjdXDAHCAiNZSzEXtd5XxDD4vNaN9YwBL6AVUMCBQ+T9e0DSsEjMeqYh3WEoDRwWOcNw/NcNEWQa+Mcmo3n2cvT/MwnhQuFzWDdyVJ2kI+CcUCqWQrF5VrisE/ZWUdkDn4dAJasAyupa/mZyjsHihLsh+zo22eXbekc5Jvlb8mq2m8rwaoDPs4J1EY1k1nUBJ0qk3h9LZaMXtYenylcFZogcxd5RX+RAkFtb0ZAEzVgl528mwmnT8ZnC1Er8cBJhnvcP09rGQyz4bRwvR/Tco7KKOl4CWeTRR8T6E/giSfTwwGXfA7uLH9EzHuQCjjd0/zZaYnYYxSGQ==
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(39860400002)(376002)(451199015)(40470700004)(36840700001)(46966006)(83380400001)(36756003)(40480700001)(7416002)(426003)(40460700003)(2906002)(86362001)(966005)(47076005)(7636003)(5660300002)(478600001)(1076003)(186003)(316002)(2616005)(6916009)(82740400003)(336012)(356005)(54906003)(41300700001)(70206006)(82310400005)(6666004)(8936002)(36860700001)(8676002)(70586007)(7696005)(26005)(4326008);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Nov 2022 16:16:40.2806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 49df7ae5-4890-4e3d-4693-08dabdb6ca66
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT046.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5933
Received-SPF: softfail client-ip=40.107.244.64;
 envelope-from=avihaih@nvidia.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.047,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
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

Hello,

A long time has passed since v2 of this series was posted. During this
time we had several KVM calls discussing the problems that were needed
to be solved in order to move forward.

This version of the series includes quite some changes, and I believe
that it addresses all the major problems we have discussed. Please see
below the updated patch list and change log from v2.

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

Patches 1-4 are patches taken from Juan's RFC [2].
As discussed in the KVM call, since we are going to add a new ioctl to
get device data size while it's RUNNING, we don't need the stop and
resume VM functionality from the RFC.

Patches 5-11 are prep patches fixing bugs, adding QEMUFile function
that will be used later and refactoring v1 protocol code to make it
easier to add v2 protocol.

Patches 12-16 implement v2 protocol and remove v1 protocol.

Patch 17 is a preview patch (which is not for merging yet) that
demonstrates how the new ioctl to get device state size will work once
added.

Thanks.

Changes from v2 [3]:
- Rebased on top of latest master branch.

- Added relevant patches from Juan's RFC [2] with minor changes:
  1. Added Reviewed-by tag to patch #3 in the RFC.
  2. Adjusted patch #6 to work without patch #4 in the RFC.

- Added a new patch "vfio/migration: Fix wrong enum usage" that fixes a
  small bug in v1 code. This patch has been sent a few weeks ago [4] but
  wasn't taken yet.

- Patch #2 (vfio/migration: Skip pre-copy if dirty page tracking is not supported):
  1. Dropped this patch and replaced it with
     "vfio/migration: Allow migration without VFIO IOMMU dirty tracking support".
     The new patch uses a different approach – instead of skipping
     pre-copy phase completely, QEMU VFIO code will mark RAM dirty
     (instead of kernel). This ensures that current migration behavior
     is not changed and SLA is taken into account.

- Patch #4 (vfio/common: Change vfio_devices_all_running_and_saving() logic to equivalent one):
  1. Improved commit message to better explain the change.

- Patch #7 (vfio/migration: Implement VFIO migration protocol v2):
  1. Enhanced vfio_migration_set_state() error reporting.
  2. In vfio_save_complete_precopy() of v2 protocol - when changing
     device state to STOP, set recover state to ERROR instead of STOP as
     suggested by Joao.
  3. Constify SaveVMHandlers of v2 protocol.
  4. Modified trace_vfio_vmstate_change and trace_vfio_migration_set_state
     to print device state string instead of enum.
  5. Replaced qemu_put_buffer_async() with qemu_put_buffer() in
     vfio_save_block(), as requested by Juan.
  6. Implemented v2 protocol version of vfio_save_pending() as requested
     by Juan. Until ioctl to get device state size is added, we just
     report some big hard coded value, as agreed in KVM call.

- Patch #9 (vfio/migration: Reset device if setting recover state fails):
  1. Enhanced error reporting.
  2. Set VFIOMigration->device_state to RUNNING after device reset.

- Patch #11 (docs/devel: Align vfio-migration docs to VFIO migration v2):
  1. Adjusted vfio migration documentation to the added vfio_save_pending()

- Added the last patch (which is not for merging yet) that demonstrates
  how the new ioctl to get device state size will work once added.

Changes from v1 [5]:
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
https://lore.kernel.org/all/20220530170739.19072-1-avihaih@nvidia.com/

[4]
https://lore.kernel.org/all/20221016085752.32740-1-avihaih@nvidia.com/

[5]
https://lore.kernel.org/all/20220512154320.19697-1-avihaih@nvidia.com/

Avihai Horon (13):
  vfio/migration: Fix wrong enum usage
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
  vfio/migration: Reset device if setting recover state fails
  vfio: Alphabetize migration section of VFIO trace-events file
  docs/devel: Align vfio-migration docs to VFIO migration v2
  vfio/migration: Query device data size in vfio_save_pending()

Juan Quintela (4):
  migration: Remove res_compatible parameter
  migration: No save_live_pending() method uses the QEMUFile parameter
  migration: Block migration comment or code is wrong
  migration: Simplify migration_iteration_run()

 docs/devel/vfio-migration.rst  |  68 ++--
 hw/s390x/s390-stattrib.c       |   8 +-
 hw/vfio/common.c               | 103 +++--
 hw/vfio/migration.c            | 669 +++++++++------------------------
 hw/vfio/trace-events           |  28 +-
 include/hw/vfio/vfio-common.h  |   8 +-
 include/migration/register.h   |  22 +-
 linux-headers/linux/vfio.h     |  13 +
 migration/block-dirty-bitmap.c |  10 +-
 migration/block.c              |  13 +-
 migration/migration.c          |  35 +-
 migration/qemu-file.c          |  34 ++
 migration/qemu-file.h          |   1 +
 migration/ram.c                |  10 +-
 migration/savevm.c             |  17 +-
 migration/savevm.h             |   6 +-
 migration/trace-events         |   2 +-
 17 files changed, 402 insertions(+), 645 deletions(-)

-- 
2.21.3


