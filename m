Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48A4969FA8E
	for <lists+qemu-devel@lfdr.de>; Wed, 22 Feb 2023 18:55:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUtKQ-0005u3-ED; Wed, 22 Feb 2023 12:54:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtKO-0005tf-95
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:54:52 -0500
Received: from mail-dm3nam02on2073.outbound.protection.outlook.com
 ([40.107.95.73] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pUtKM-0005KI-07
 for qemu-devel@nongnu.org; Wed, 22 Feb 2023 12:54:52 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KxmAAUDHUPw1kirGq7DZrByyYOXYbPJpavrWayUJlBFKnkjMoYar9rZ4xSak991ghbmvtAHtW++nf64orr5AORVcVtLM8WfAwHvZy//BcCIbf9oP6fFa5hTWPs18AVJPUa8hnqCV0uwRJvaU7pI3OuDUBxUA8ok1J6pzMsvVKji8bQComxVZH3mxhok2UWK6h9KkFt3k0P6ovGo4WEF8wvLYFymZU/VRo6DAgsO/n7XKbvrKqkwAF+FEa0qLZvdQehjCnap71lplYd74JEz0+2ujhjRhBecfdYuh+XuTYYB21Cd69YKjcMhk52tkS8tCXU6rkb1j98nQk113EIUt3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cCjPiYv4fr4TarOEij9VVbzBZaZA/1m0v6x2tLMf60=;
 b=gmmAWUM/kR3Ovi0IjOiCoh8rYdFGRkQsivNs9wnkSAQZig6tijAYVVk2l7Glbqqr9hyMya5cE6vVmTE0fqCmTJDYDCsqlUPTe1fs850o84nUr+SflI7VJVlMiRJk4nYmn6wd17rS/ifPYUnjOIelL7jtTIUTrZxxVgHhgmYX8kcf+P750lapPYz4LJvCVGXCBLSxH2feiix28NxFrBl+P+DoCoey1VU/07QBImxRHexApEHm0ZaMXb5lSi+ZVq5rlU8KR0YmWVIPTlaifclU/8RQKGnm0yZPJkhhVP4W40OGSKFWD6pKAZZe/MCAmIHExyJ48mk2VKgQksMnnWSEvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cCjPiYv4fr4TarOEij9VVbzBZaZA/1m0v6x2tLMf60=;
 b=sbikVhZF2aOLhMy+amKSJwLVas8EjW3ncBWpQVP72LMZkp+1qc2yZQW43gmx2r95Eh+BgPqntMOy8Rhe0UBrhk4Tvj8jxjGxXDfRms4hgLeehFof/a9bFZmkbsHeZoDzDmCmPYgoIolLIiteYD+wWattIul8popf+PVhO1eTaNpwQyhVr01yrevKMt3OWfmS41fHZWFMO8v5GoQpzM5fqF0A82DZN1q5bab/FN/MG9tQpYu9efZjInfHl4bCVcaTM8Q5i6/4iPf/TugL7VYjSjuUk954W6MB8TPqzeCltBE9mYmX/EQBe2hUc8oCZRf4W92svRccAJiP3y8or8m8RA==
Received: from BL0PR02CA0034.namprd02.prod.outlook.com (2603:10b6:207:3c::47)
 by SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21; Wed, 22 Feb
 2023 17:49:41 +0000
Received: from BL02EPF0000C406.namprd05.prod.outlook.com
 (2603:10b6:207:3c:cafe::fb) by BL0PR02CA0034.outlook.office365.com
 (2603:10b6:207:3c::47) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.21 via Frontend
 Transport; Wed, 22 Feb 2023 17:49:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BL02EPF0000C406.mail.protection.outlook.com (10.167.241.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6134.14 via Frontend Transport; Wed, 22 Feb 2023 17:49:40 +0000
Received: from rnnvmail204.nvidia.com (10.129.68.6) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:21 -0800
Received: from rnnvmail205.nvidia.com (10.129.68.10) by rnnvmail204.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Wed, 22 Feb
 2023 09:49:21 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.129.68.10)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport; Wed, 22 Feb
 2023 09:49:16 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@redhat.com>, Juan Quintela
 <quintela@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Peter Xu <peterx@redhat.com>, "Jason
 Wang" <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH v2 00/20] vfio: Add migration pre-copy support and device
 dirty tracking
Date: Wed, 22 Feb 2023 19:48:55 +0200
Message-ID: <20230222174915.5647-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF0000C406:EE_|SN7PR12MB8059:EE_
X-MS-Office365-Filtering-Correlation-Id: ff55acf1-9540-4f93-b947-08db14fd2c38
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s8vRWcozlXjXTfOCDijdhF8BQjZuMrCl0YkMGkHOwuhfRlcjACmemcJa/V994hrH0l/VjDG3s6kvK8PXLAC4OjYlrqFM7A7hzYwzGyAY3YRuCzy/oFkJ73F7C7ALaBHzu5s/dnhJOlK9HtaxN9bF6qDY8oypEgzczUMEyKHhQiM/ueFw5fvhaTOb4tqeQA0GwzpujP3Gi2BQrPGzxboz7z1o85e+3eTt59CWYJNQ18GD/qyftZ4C2ACHVnehFikqzyFTIKbAnSLD/xiXoP95YYjwGkWY0KYd/nFPBudwx1uuPLv0pPaUBr3G7IdxXAW0QR5LLi4LEstfnfdjtJT1FzpUojMNywuSTtHUzf5M39dLOI+HN6IAevuAPTyfdAoKN5y+iffwxaZVQza8+2Ry1VS8sNeQcxJLoOA0BC8cpxR1CeNm7HIjjq3UwQg3Vf3iSGojKdWJ2PtAuc5Pa+LGBEac9TNB4pFNxe+fz0MeSXlt9LF00V7GH1QduNyxWK1fsPWotRXltkzEmk6Lw2wE7berIQhGNkFZPQYEtQMtOphLwrkvd+n/HmEn+qa/Pc77fN67BiB6tdaXObMrCxgpX2nYFePQ3nSGduyG6RWqmXBM/R6gBiLya9ruhSdCIQEkuDoktNV+U4iUev1NZ5YrIjk/K6M15RwyE+y1KPWRZ0Y2ZxYiUdm3jhyhEEJBKqgShWouSzSlxGCadMo6n2DVAi8HGr2B7nJZotPon9ub6rB2wQ92/swztyfdPM0GcJ6phbRQycWlJ3o7OtGOeAAPialEHSZOluin/ytiK/nFqpHO1JRNNKGhSVcjmZ0WCl7t
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199018)(36840700001)(40470700004)(46966006)(26005)(2616005)(186003)(7416002)(5660300002)(966005)(40460700003)(8936002)(336012)(1076003)(4326008)(6916009)(426003)(47076005)(83380400001)(6666004)(70206006)(36860700001)(36756003)(2906002)(82310400005)(40480700001)(41300700001)(478600001)(82740400003)(7696005)(8676002)(7636003)(70586007)(316002)(86362001)(356005)(54906003)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2023 17:49:40.2222 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff55acf1-9540-4f93-b947-08db14fd2c38
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF0000C406.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8059
Received-SPF: softfail client-ip=40.107.95.73; envelope-from=avihaih@nvidia.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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

This series is based on the previous one that added the basic VFIO
migration protocol v2 implementation [1].

The series starts by adding pre-copy support for VFIO migration protocol
v2. Pre-copy support allows the VFIO device data to be transferred while
the VM is running. This can improve performance and reduce migration
downtime. Full description of it can be found here [2].

It then moves to implement device dirty page tracking. Device dirty page
tracking allows the VFIO device to record its DMAs and report them back
when needed. This is part of VFIO migration and is used during pre-copy
phase of migration to track the RAM pages that the device has written to
and mark those pages dirty, so they can later be re-sent to target.

Device dirty page tracking uses the DMA logging uAPI to discover device
capabilities, to start and stop tracking, and to get dirty page bitmap
report. Extra details and uAPI definition can be found here [3].

Device dirty page tracking operates in VFIOContainer scope. I.e., When
dirty tracking is started, stopped or dirty page report is queried, all
devices within a VFIOContainer are iterated and for each of them device
dirty page tracking is started, stopped or dirty page report is queried,
respectively.

Device dirty page tracking is used only if all devices within a
VFIOContainer support it. Otherwise, VFIO IOMMU dirty page tracking is
used, and if that is not supported as well, memory is perpetually marked
dirty by QEMU. Note that since VFIO IOMMU dirty page tracking has no HW
support, the last two usually have the same effect of perpetually
marking all pages dirty.

Normally, when asked to start dirty tracking, all the currently DMA
mapped ranges are tracked by device dirty page tracking. However, when
vIOMMU is enabled IOVA ranges are DMA mapped/unmapped on the fly as the
vIOMMU maps/unmaps them. These IOVA ranges can potentially be mapped
anywhere in the vIOMMU IOVA space. Due to this dynamic nature of vIOMMU
mapping/unmapping, tracking only the currently DMA mapped IOVA ranges
doesn't work very well.

Thus, when vIOMMU is enabled, we try to track the entire vIOMMU IOVA
space. If that fails (IOVA space can be rather big and we might hit HW
limitation), we try to track smaller range while marking untracked
ranges dirty.

Patch breakdown:
- Patches 1-3 add VFIO migration pre-copy support.
- Patches 4-10 fix bugs and do some preparatory work required prior to
  adding device dirty page tracking.
- Patches 11-13 implement device dirty page tracking.
- Patches 14-18 add vIOMMU support to device dirty page tracking.
- Patches 19-20 enable device dirty page tracking and document it.



Changes from v1 [4]:
- Rebased on latest master branch. As part of it, made some changes in
  pre-copy to adjust it to Juan's new patches:
  1. Added a new patch that passes threshold_size parameter to
     .state_pending_{estimate,exact}() handlers.
  2. Added a new patch that refactors vfio_save_block().
  3. Changed the pre-copy patch to cache and report pending pre-copy
     size in the .state_pending_estimate() handler.
- Removed unnecessary P2P code. This should be added later on when P2P
  support is added. (Alex)
- Moved the dirty sync to be after the DMA unmap in vfio_dma_unmap()
  (patch #11). (Alex)
- Stored vfio_devices_all_device_dirty_tracking()'s value in a local
  variable in vfio_get_dirty_bitmap() so it can be re-used (patch #11).
- Refactored the viommu device dirty tracking ranges creation code to
  make it clearer (patch #15).
- Changed overflow check in vfio_iommu_range_is_device_tracked() to
  emphasize that we specifically check for 2^64 wrap around (patch #15).
- Added R-bs / Acks.

Thanks.

[1]
https://lore.kernel.org/qemu-devel/167658846945.932837.1420176491103357684.stgit@omen/

[2]
https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/

[3]
https://lore.kernel.org/netdev/20220908183448.195262-4-yishaih@nvidia.com/

Avihai Horon (14):
  migration: Pass threshold_size to .state_pending_{estimate,exact}()
  vfio/migration: Refactor vfio_save_block() to return saved data size
  vfio/migration: Add VFIO migration pre-copy support
  vfio/common: Fix error reporting in vfio_get_dirty_bitmap()
  vfio/common: Fix wrong %m usages
  vfio/common: Abort migration if dirty log start/stop/sync fails
  vfio/common: Add VFIOBitmap and (de)alloc functions
  vfio/common: Extract code from vfio_get_dirty_bitmap() to new function
  vfio/common: Extract vIOMMU code from vfio_sync_dirty_bitmap()
  memory/iommu: Add IOMMU_ATTR_MAX_IOVA attribute
  intel-iommu: Implement get_attr() method
  vfio/common: Support device dirty page tracking with vIOMMU
  vfio/common: Optimize device dirty page tracking with vIOMMU
  docs/devel: Document VFIO device dirty page tracking

Joao Martins (6):
  util: Add iova_tree_nnodes()
  util: Extend iova_tree_foreach() to take data argument
  vfio/common: Record DMA mapped IOVA ranges
  vfio/common: Add device dirty page tracking start/stop
  vfio/common: Add device dirty page bitmap sync
  vfio/migration: Query device dirty page tracking support

 docs/devel/vfio-migration.rst  |  85 ++-
 include/exec/memory.h          |   3 +-
 include/hw/vfio/vfio-common.h  |  10 +
 include/migration/register.h   |   7 +-
 include/qemu/iova-tree.h       |  19 +-
 migration/savevm.h             |   6 +-
 hw/i386/intel_iommu.c          |  18 +
 hw/s390x/s390-stattrib.c       |   4 +-
 hw/vfio/common.c               | 911 +++++++++++++++++++++++++++++----
 hw/vfio/migration.c            | 210 +++++++-
 migration/block-dirty-bitmap.c |   2 +-
 migration/block.c              |   4 +-
 migration/migration.c          |  12 +-
 migration/ram.c                |   6 +-
 migration/savevm.c             |  12 +-
 util/iova-tree.c               |  23 +-
 hw/vfio/trace-events           |   4 +-
 migration/trace-events         |   4 +-
 18 files changed, 1161 insertions(+), 179 deletions(-)

-- 
2.26.3


