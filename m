Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B80F24B6505
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Feb 2022 09:03:13 +0100 (CET)
Received: from localhost ([::1]:51822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nJsno-0000z9-KC
	for lists+qemu-devel@lfdr.de; Tue, 15 Feb 2022 03:03:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nJslp-0008S1-Mu
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:01:09 -0500
Received: from mail-sn1anam02on2055.outbound.protection.outlook.com
 ([40.107.96.55]:19653 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gdawar@xilinx.com>) id 1nJsll-00020A-2s
 for qemu-devel@nongnu.org; Tue, 15 Feb 2022 03:01:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QPL0r6AA7PwAEFb3co5bhuUmF1+2AAoeeoeV2hVNwhANUCqhuhZLnE8TrIgDqoyaPK2VOcHSzyR/VdghSEgvpBqr7nWaLgxWMoCsWNwfTtJ1jGkZhXMfL/t4yNmshnc4j7H6uqknnoKSuvpLLotrIQUSK/Un9A8zXW3zpCIfonkhDzSaJlrJ0g+O6aVg1HnrhDIVKG35atxxq0vH59UOpXTag3l+Of1BIoK22kEld9cFPYz2loy//OMNY/7aw+svpTFIN45emngflbIjY4YMJQmPYllYZgGrEmlStJ08yzMKfTq0RUSeuLG7W5DcFvkcUiShN945FLpk80edQkRBtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IoH06FvlXWoCtd3/dIjfpi0wbMOzGLH6yDyi259IFoM=;
 b=U98kPP9hP6UME3ZK3XgfBKS40JAt9TtHT/g4iIUwN4dG7yXXKOH7LrZpAcB1exeu0uN1mu+sf5tlsH5sYvE6uYmTvtGOpPQv3YKoex/KJAbB2Vi1JUHM1prBTjg7P6dIoozk5QDtvklkr78CX7GEOS0Ryl51+j4Xgy5pg7WALvhsvKd425itw1lYfl6L2E8rGsP44/bqh+Q8/q0WoX0EhBpuRAplurPI/fvObeJw3D3ANNwHXjcWyMcoILGi+J3JlI5NkB1SlEy72Va4aPBIAt2Ep7mW70gQw7O8qJ2mUldsghs0sybHKtaGi0F9AoqV+yYh2UavMxbT5xxQuDBi4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=redhat.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IoH06FvlXWoCtd3/dIjfpi0wbMOzGLH6yDyi259IFoM=;
 b=Uk1W7neRMxROCU+wS1t+1pGYmlSrZeWpyiejb0lCr1lvm9PMl0Dp1w43pSmR90H4YY/uEWGveGnv5a0XtPcWcnTHWqD8luDDkN9OWhoq/f3yeTZlWokNhvOXvAqHsjqZo9KWeDtM445uB7juypI+rzfkrWbghtcXDRfH4PaaY1A=
Received: from BN0PR04CA0189.namprd04.prod.outlook.com (2603:10b6:408:e9::14)
 by CH2PR02MB6694.namprd02.prod.outlook.com (2603:10b6:610:ae::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.11; Tue, 15 Feb
 2022 07:22:46 +0000
Received: from BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e9:cafe::2b) by BN0PR04CA0189.outlook.office365.com
 (2603:10b6:408:e9::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.16 via Frontend
 Transport; Tue, 15 Feb 2022 07:22:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT028.mail.protection.outlook.com (10.13.2.142) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4975.11 via Frontend Transport; Tue, 15 Feb 2022 07:22:46 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 14 Feb 2022 23:22:45 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 14 Feb 2022 23:22:45 -0800
Received: from [10.170.66.102] (port=55622 helo=xndengvm004102.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <gautam.dawar@xilinx.com>)
 id 1nJsAe-0000hL-TY; Mon, 14 Feb 2022 23:22:45 -0800
From: Gautam Dawar <gautam.dawar@xilinx.com>
To: <mst@redhat.com>, <jasowang@redhat.com>, <qemu-devel@nongnu.org>,
 <eperezma@redhat.com>
Subject: [PATCH 0/2] Allow VIRTIO_F_IN_ORDER negotiation with vhost-vdpa
Date: Tue, 15 Feb 2022 12:52:29 +0530
Message-ID: <20220215072231.2498-1-gdawar@xilinx.com>
X-Mailer: git-send-email 2.25.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: eacf1cf3-bb44-4992-2b54-08d9f053f6c8
X-MS-TrafficTypeDiagnostic: CH2PR02MB6694:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB66940E87F2D96401ADDDB125B1349@CH2PR02MB6694.namprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HocVdn4wWA08keieW5czGw3yDEZ3G8a+qX64IH6F/ajXemZQ675DQNnuh7doiNWdkoLBGkn9pomCTUQhTV8FHWh9+vicpeyDQ4yB/LOKvTK6fNt/1jqSiJCtHsG9kKo5oH460NBbhlHbivEFcKjPoWxAUfR4TW+pr2UGlLB3mYcU0XriYbf2kn+M3UoTcV3IPnSPxQn7YQ4Iy3Sm2CSgQErdZlUpb3yyGQjUkjq3N/Ng8j+owZCV1saGL4p/Bf5gKuXrpK8bDqQ5Gruy3B10sQFsbCxi4SrHVHEFqTi/K8W7lhVctTxs7+A3VDpeXc28Ee3VySVC3aN1m8tsw1dURCA44npifRWdMJ34pelDaWQ4qwTRxQfTSYFlfr58t7QczzwPwYGnkWolwJRCVZmcS4sAFeKZeEB3994wmLzWhFstm4jZg+noLgcSmFhspXfZQwcsAOjbE2s/xjh9xy+42POLvc3+DGCGY0jnRMg1N44QVFQLeIuNr61eikb88o+kyWX0vLkFfopPwPdawVOQEpOLwMuT9PfgUW2PvrhZSRiO7OS1UL/jeXU1ve8xOs7qVGm2dlspnEuJjgiolAH3eUGENbolLZXw0e+6eWmHoZbAiuXcAIIateL5iZJD463PAeMBAHpyTBW6DWl8+vGurzFh5vbGBLJbap2DP5OT2pZdwPyG/pi+yWO9/xyhzpIHbfXci+O34qZM5S/TAyPvfA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(8936002)(8676002)(47076005)(5660300002)(44832011)(9786002)(110136005)(6666004)(54906003)(508600001)(7696005)(36860700001)(107886003)(36756003)(83380400001)(70206006)(2616005)(82310400004)(1076003)(426003)(336012)(186003)(26005)(7636003)(2906002)(316002)(356005)(40460700003)(70586007)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Feb 2022 07:22:46.1494 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eacf1cf3-bb44-4992-2b54-08d9f053f6c8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT028.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6694
Received-SPF: pass client-ip=40.107.96.55; envelope-from=gdawar@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: martinh@xilinx.com, pabloc@xilinx.com, hanand@xilinx.com, tanujk@xilinx.com,
 gdawar@xilinx.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The VIRTIO_F_IN_ORDER feature is implemented by DPDK virtio_net driver
but not by the Linux kernel's virtio_net driver.

However, this feature can't be tested using vhost-vdpa even with HW devices
that implement it as VIRTIO_F_IN_ORDER isn't defined in kernel's
virtio_config.h header file yet and hence is not available in QEMU.

Accordingly, as a first step, a patch for defining VIRTIO_F_IN_ORDER in
kernel (version 5.17-rc4, file: include/uapi/linux/virtio_config.h) has
been published.

This patch series first brings in VIRTIO_F_IN_ORDER's definition from Linux
kernel using the script update-linux-headers.sh.
Next, it adds VIRTIO_F_IN_ORDER to host_features in case the underlying
vdpa device exposes this feature bit in device featues there by making it
available for negotiation with the virtio_net driver.

Gautam Dawar (2):
  linux headers: update against Linux 5.17-rc4
  Allow VIRTIO_F_IN_ORDER to be negotiated for vdpa devices

 hw/net/virtio-net.c                           |  10 ++
 include/standard-headers/asm-x86/kvm_para.h   |   1 +
 include/standard-headers/drm/drm_fourcc.h     |  11 ++
 include/standard-headers/linux/ethtool.h      |   1 +
 include/standard-headers/linux/fuse.h         |  60 +++++++-
 include/standard-headers/linux/pci_regs.h     | 142 +++++++++---------
 .../standard-headers/linux/virtio_config.h    |   6 +
 include/standard-headers/linux/virtio_gpio.h  |  72 +++++++++
 include/standard-headers/linux/virtio_i2c.h   |  47 ++++++
 include/standard-headers/linux/virtio_iommu.h |   8 +-
 .../standard-headers/linux/virtio_pcidev.h    |  65 ++++++++
 include/standard-headers/linux/virtio_scmi.h  |  24 +++
 linux-headers/asm-generic/unistd.h            |   5 +-
 linux-headers/asm-mips/unistd_n32.h           |   2 +
 linux-headers/asm-mips/unistd_n64.h           |   2 +
 linux-headers/asm-mips/unistd_o32.h           |   2 +
 linux-headers/asm-powerpc/unistd_32.h         |   2 +
 linux-headers/asm-powerpc/unistd_64.h         |   2 +
 linux-headers/asm-riscv/bitsperlong.h         |  14 ++
 linux-headers/asm-riscv/mman.h                |   1 +
 linux-headers/asm-riscv/unistd.h              |  44 ++++++
 linux-headers/asm-s390/unistd_32.h            |   2 +
 linux-headers/asm-s390/unistd_64.h            |   2 +
 linux-headers/asm-x86/kvm.h                   |  19 ++-
 linux-headers/asm-x86/unistd_32.h             |   1 +
 linux-headers/asm-x86/unistd_64.h             |   1 +
 linux-headers/asm-x86/unistd_x32.h            |   1 +
 linux-headers/linux/kvm.h                     |  18 +++
 net/vhost-vdpa.c                              |   1 +
 29 files changed, 490 insertions(+), 76 deletions(-)
 create mode 100644 include/standard-headers/linux/virtio_gpio.h
 create mode 100644 include/standard-headers/linux/virtio_i2c.h
 create mode 100644 include/standard-headers/linux/virtio_pcidev.h
 create mode 100644 include/standard-headers/linux/virtio_scmi.h
 create mode 100644 linux-headers/asm-riscv/bitsperlong.h
 create mode 100644 linux-headers/asm-riscv/mman.h
 create mode 100644 linux-headers/asm-riscv/unistd.h

-- 
2.30.1


