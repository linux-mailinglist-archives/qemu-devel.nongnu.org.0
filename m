Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48F9C67D4A6
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Jan 2023 19:51:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pL7KC-0004NV-CU; Thu, 26 Jan 2023 13:50:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7K0-0004Ms-7m
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:05 -0500
Received: from mail-dm3nam02on2040.outbound.protection.outlook.com
 ([40.107.95.40] helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <avihaih@nvidia.com>)
 id 1pL7Jw-0002Fr-5y
 for qemu-devel@nongnu.org; Thu, 26 Jan 2023 13:50:03 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MAhxVm6ttZemT0dtv7KDoihJYqQ+8rxFZYCXauEXyaiGCQV7X6YumzJxDTxuW7dUy4P7ZoWw1k3m7cb85NeeRgO6CtlJxugAkz163hgiKLsfWAFlUESSAfKTVGh+J1fq2TZqDtajQZm10naS3MdNnWncyIB+0SxAVqcPZksnnkGQYBbGQELmSxgvoNveUyH+PR0l0/MPmmWh7c1lJ4BcjCJ7jwSi2kLPc2iTZIAWTO8R+m5UVvlbryofBO/vez8YM5qbSdfN4Vfqs/Q3XSzeABZ25QFC+DLG/0C9O59mteSqDsw31XaNTnp7/xrCu/X01SPrWuHxEDL+PJPYGq8iVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0ZqRK88NbMhmmWa+XPqqXhTbsIQqQ+rtDcUUAOW2OHY=;
 b=cT51w21Y3trKmCuX8JCvDZY3e0Z+dZglXCki7O8MCaO9Mm+qqw2j33oMgz2QmNpS5JCuxEAmpI0Uwoiaw/PDSD6av9HGMYE0Le7Ru9pfENwUHc3WwD+dinCKYECDI+jZMM5Omnm+Q498Nnc+n6hzyjMKmn/kVvIllBbnGdOLQS16r0DJcYw13ucD+cKz9jM7XDlIUKvsqsejIRtfOhhHAqhrbBFQWB4jK1KY5eO6allQL1G6PHT2+Tm7aWnB5F3crjeBAbrE8v4sg+IWZBEpQ69hC6vt4CO6PVZJe+x2734c7j76H0hPSj5ACsJSKXJVZXsl9QlIYbJ7PuYeiNZqHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=nongnu.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0ZqRK88NbMhmmWa+XPqqXhTbsIQqQ+rtDcUUAOW2OHY=;
 b=kB7rY/GDExHxStr47mH0IIOWpgWedNvOrgYiv3GcKIoq4sLnyUwFK61H92ZXMcCKCH138RF4sKFQ16nZIsXnqpSQubBXj33cjfwyxsICbNvordwGC+2gnJ6h6rpIzkpMo/oSCoMI7O707AxxCDS6tzqn1xYteLV5uuzYgBFnGFnGBb6ySy7mQb2Dw1yT/J0+Wo0VhQQJnF62lohBOaFtTich/qeg4iNA2hnjr1LHfIL+tF11eY2tFZKJt9GPXUbyQLKRJISrLj+qgdGZj4ztgvGTQhBkoQvHbFwoET/qyySfKnqsBXrGtnnWBFxPQ3MgxRO8DxvBPTlDIqUxWBvtrA==
Received: from MW4PR04CA0113.namprd04.prod.outlook.com (2603:10b6:303:83::28)
 by MN6PR12MB8568.namprd12.prod.outlook.com (2603:10b6:208:471::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22; Thu, 26 Jan
 2023 18:49:55 +0000
Received: from CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
 (2603:10b6:303:83:cafe::6e) by MW4PR04CA0113.outlook.office365.com
 (2603:10b6:303:83::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.22 via Frontend
 Transport; Thu, 26 Jan 2023 18:49:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 CO1NAM11FT100.mail.protection.outlook.com (10.13.175.133) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.22 via Frontend Transport; Thu, 26 Jan 2023 18:49:55 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.36; Thu, 26 Jan
 2023 10:49:53 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Thu, 26 Jan 2023 10:49:52 -0800
Received: from vdi.nvidia.com (10.127.8.9) by mail.nvidia.com (10.126.190.181)
 with Microsoft SMTP Server id 15.2.986.36 via Frontend Transport;
 Thu, 26 Jan 2023 10:49:48 -0800
From: Avihai Horon <avihaih@nvidia.com>
To: <qemu-devel@nongnu.org>
CC: Alex Williamson <alex.williamson@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Xu <peterx@redhat.com>, Jason Wang
 <jasowang@redhat.com>, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, "Paolo
 Bonzini" <pbonzini@redhat.com>, Richard Henderson
 <richard.henderson@linaro.org>, Eduardo Habkost <eduardo@habkost.net>, "David
 Hildenbrand" <david@redhat.com>, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=
 <philmd@linaro.org>, Yishai Hadas <yishaih@nvidia.com>, Jason Gunthorpe
 <jgg@nvidia.com>, Maor Gottlieb <maorg@nvidia.com>, Avihai Horon
 <avihaih@nvidia.com>, Kirti Wankhede <kwankhede@nvidia.com>, Tarun Gupta
 <targupta@nvidia.com>, Joao Martins <joao.m.martins@oracle.com>
Subject: [PATCH 00/18] vfio: Add migration pre-copy support and device dirty
 tracking
Date: Thu, 26 Jan 2023 20:49:30 +0200
Message-ID: <20230126184948.10478-1-avihaih@nvidia.com>
X-Mailer: git-send-email 2.21.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1NAM11FT100:EE_|MN6PR12MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: fa7f3c46-2223-4e4f-c0dc-08daffce1df1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xVDYNAKgoWoiFwTMQLu+Fsp6dA5tEynCryLx7VX82n0ujUDAfZvpWRcIeTsfHu/vpkMmJNu+9/abAE63cJCgEcrdVcgshs3CpCYQ3QOKubgD1yUtBSdAZlq9DbqQL1Lrxdt17u/P4rokj4ENcwhvPIsYtL3w2vvHgrxMBtbT5gmLpk5OoXLbQyU41sb9mVM/xW+jboWIlF175+s/wV17lEyTye2vS4XmEhI3ZvRHtNFgkYQ0pktj/EQlr8HOtIIhkeCvIZ706gN1k1YD/S9X3Cm+9X4a5UObOrIds9SpQ+uVT4JJdvlgAOsi5VdrDqeGwQtd5ydJmdfbOY7bcSJRys6pN664cgeLTVvsh0mwZH9HMLqiD5Ply6+EJcZwSguVLhbmoUiXobwKKOp94zvCqM5H1Ru76g6gjdT3KhJJvuBmNEd+YNG86DU5h1ylvhjpV/kKymfkdaxJuLsAfVowLwaY//FM1mlSNbaIjYpz3+tx2EWoStAooe18uVqEVj20x50/HpU8Kz9RWMf6WeYZoJ98ulUI2t5it1UC2o1aiz3uEETsM2o82o3hpCuPHvKX82O+II/cg4Fd/OyF3IIYwNZfGW+iEKWUsn+vbvtL8QwrLayocLipLkTnBdXpKNGBs/gQ4UemMTXIMs6zYBnnPKtaeZuHd7aOdSTT2xwub96Jnc7zpzPJ69FXjyMIXmPWJbgoZZiN6wkDbWaIlbkb/APmLpFPdEuIcIUakMcvt07dfg2dYYLsrCdFzd/uwHps1HNYMhyBt5B7l0HA6gtQHEs6CqMt9y5zDzZ5TLU+BpchGBdCJXYrCJScj7Ay8jJu7S+a+B9qyHQ07ReBbusS2o/Ij3q6fWnGqwyK5TDT1wU=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(39860400002)(346002)(396003)(451199018)(40470700004)(36840700001)(46966006)(36756003)(40460700003)(7696005)(356005)(54906003)(8676002)(316002)(1076003)(478600001)(6666004)(5660300002)(7416002)(2906002)(4326008)(70206006)(70586007)(41300700001)(82740400003)(6916009)(966005)(8936002)(7636003)(36860700001)(83380400001)(86362001)(40480700001)(82310400005)(336012)(26005)(186003)(426003)(2616005)(47076005)(14143004);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 18:49:55.6137 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fa7f3c46-2223-4e4f-c0dc-08daffce1df1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1NAM11FT100.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8568
Received-SPF: softfail client-ip=40.107.95.40; envelope-from=avihaih@nvidia.com;
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

The first patch in the series starts by adding pre-copy support for VFIO
migration protocol v2. Pre-copy support allows the VFIO device data to
be transferred while the VM is running. This can improve performance and
reduce migration downtime. Full description of it can be found here [2].

The series then moves on to implement device dirty page tracking.
Device dirty page tracking allows the VFIO device to record its DMAs and
report them back when needed. This is part of VFIO migration and is used
during pre-copy phase of migration to track the RAM pages that the
device has written to and mark those pages dirty, so they can later be
re-sent to target.

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
- Patch 1 adds VFIO migration pre-copy support.
- Patches 2-8 fix bugs and do some preparatory work required prior to
  adding device dirty page tracking.
- Patches 9-11 implement device dirty page tracking.
- Patches 12-16 add vIOMMU support to device dirty page tracking.
- Patches 17-18 enable device dirty page tracking and document it.

Thanks.

[1]
https://lore.kernel.org/qemu-devel/20230116141135.12021-1-avihaih@nvidia.com/

[2]
https://lore.kernel.org/kvm/20221206083438.37807-3-yishaih@nvidia.com/

[3]
https://lore.kernel.org/netdev/20220908183448.195262-4-yishaih@nvidia.com/

Avihai Horon (12):
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

 docs/devel/vfio-migration.rst |  79 ++--
 include/exec/memory.h         |   3 +-
 include/hw/vfio/vfio-common.h |  10 +
 include/qemu/iova-tree.h      |  19 +-
 hw/i386/intel_iommu.c         |  18 +
 hw/vfio/common.c              | 866 ++++++++++++++++++++++++++++++----
 hw/vfio/migration.c           | 127 ++++-
 util/iova-tree.c              |  23 +-
 hw/vfio/trace-events          |   5 +-
 9 files changed, 1006 insertions(+), 144 deletions(-)

-- 
2.26.3


