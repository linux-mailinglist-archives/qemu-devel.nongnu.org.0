Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FCF15FF899
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Oct 2022 07:21:40 +0200 (CEST)
Received: from localhost ([::1]:47892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ojZcB-0005q5-9b
	for lists+qemu-devel@lfdr.de; Sat, 15 Oct 2022 01:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZUA-0004uY-Kj
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:13:23 -0400
Received: from mail-bn8nam12on20618.outbound.protection.outlook.com
 ([2a01:111:f400:fe5b::618]:13024
 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1ojZU8-0008Dq-NO
 for qemu-devel@nongnu.org; Sat, 15 Oct 2022 01:13:22 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BeHOwxI46DzSEr/DSp1/FCCZy5HKPuXrsdseMtCaAH3sGQu+zso4a5ife0DyZfXkmsRoTK8bQXBRMN2RgTYIfmAyHZS2R3qs2Ud/YXI+U4q5dRq7HGGnTY7Xd2FctC6UbYawD05pq11i4EKMHiDRiqhihFQpdF02SwE11gzmQG1Zi6P+y1TExWA3NFmQz31OvHGoeVhOV5scBeG6jDfBvZgeXld00sopLD0c1Uk/llky3y3pD5L0aozsjA9hjS3uiCTcytHeCSF/bSKGHi/KPDYUGxhYL6q+Xn+sfEV0ZoPaDR81RFCfj0whJkmrhirFlMNdaJ1Nuccfp4zwe0ixRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5AfqqCH0f48EMvmAv7Yui2LY7Fh09KkpnK0SYnY4shg=;
 b=Pz8Sgb8UNpXK9XdGWnEXuf1JosR3tpDrP6l7TtTVVqFvCwH0BTOLdJ5LMJxmUnJzPuXDeuC1UkbVJfQD7ZuH/LXx1EZ8Zqvy0Y7jJbj12KCSsAEJKvM0hfzrqhLMKcJh8aVql+lEnoBVbVTTpWEQI3tvFNJhIHHoQrqcoiT09oBkhEedThlZbEySUszm7bKcrTdzIzWOU8pSM6mltK128/aIY0XO2ekKg061aEY2Nfj1ZioFTZjNtAXNlBxg6sCfJq2USSt763xatKZVSCkgLPfqxma6b7r3ixMhz0zLe0zmlXlNDrMOO+GnUEJprUopDrWwayROqtybxkyAFQe0jQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5AfqqCH0f48EMvmAv7Yui2LY7Fh09KkpnK0SYnY4shg=;
 b=uW1VA1hZyweLA2F1xEXHFqxtBCJJGtfB/6x1ScPBsThE65+AOthFcUbg9l3rQ5iwkb7WJ4w8UiuNzwm5h6O/mhFdu+L2/BNKTZrdmTqphlOfGXuB4efdQGO8i4KJY+OzRMcHhSU6O/Vcf5hVQ5qKlV9jPM1h3o3GK3C6wELTFJo=
Received: from DS7PR05CA0089.namprd05.prod.outlook.com (2603:10b6:8:56::6) by
 DM6PR12MB4862.namprd12.prod.outlook.com (2603:10b6:5:1b7::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Sat, 15 Oct 2022 05:08:14 +0000
Received: from DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::be) by DS7PR05CA0089.outlook.office365.com
 (2603:10b6:8:56::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.10 via Frontend
 Transport; Sat, 15 Oct 2022 05:08:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 DM6NAM11FT034.mail.protection.outlook.com (10.13.173.47) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5723.20 via Frontend Transport; Sat, 15 Oct 2022 05:08:13 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.28; Sat, 15 Oct
 2022 00:08:13 -0500
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.28 via Frontend
 Transport; Sat, 15 Oct 2022 00:08:13 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <vikram.garhwal@amd.com>, <stefano.stabellini@amd.com>
Subject: [PATCH v1 00/12] Introduce xenpv machine for arm architecture 
Date: Fri, 14 Oct 2022 22:07:38 -0700
Message-ID: <20221015050750.4185-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT034:EE_|DM6PR12MB4862:EE_
X-MS-Office365-Filtering-Correlation-Id: 91071a93-705f-4e26-8ed0-08daae6b4354
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rcnboj8SO1UdvSg6/527byUi/Mlf26CbzD/DhIf3S5RLApFNGQCOQVU4bpMrzdhnJX/yxzwnml85nvSHYZEsSu/3EsFwlCNCZwULiuV5FWkVkgqAMTGWrdPgXBYyPQC5O4llKP3RRgM34DAv5NXETD1IpVpLkq8IMtVgFiNeM92jFhyvhOGcdwhS7Zwz0JfSo7BO7aGYvaabvcYf2yZrLB84ciQ/TfCmq65JBNhfb+xPmnrAM9w8iePtQ9xBEHO9SHzxLEYje+YWZCnIV2PllOEHAdCCzqBYbG4EjMtyvJES9tsmuJEboom6XQ8pOxtu/999f6limX5THH6NTAdmdYbvGf/NkyJ56637IH8amLA0QjUlj0t8M8K5ugFk3sM5/RYbpeBNXwBCYyrxQ4SwdwXsIiE7THTUxyrxDF/nqqasyW5/erT7a0cYTlrF+t5ZkYREBPo7UMPnTHfuTxASMisUZk6gawI22+Rz1hlK/opikSqRQJLM38KxPT8vvnsQLQ4qDej/KaRzBtUvhoGEVzOCchFkea0Ba3ttVqxyoe5CikBFHE2BhCphxTxYHap+xaJchRvvgHid5/yGpt+8MFoGJYGmA9OG2y+l0yjlJ6ahNesALL0v70qaMPOMkw+5X7D3tH95M7osM26vw9Ko9eauJmH7I4UC1xCDc9E6jf0Tli4htBm0OYSuovCmJXvP+CmjdNNgHUu2NVaokcI6XqS0WoHXc3KzGbgYth8BTBhXY3lDyVHRfiFenwGXGCnI7csaVkmIziVgU9I0A41xrSI8wWlbcZ8qj1gLp7ZERiE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(396003)(136003)(39860400002)(451199015)(40470700004)(36840700001)(46966006)(356005)(82740400003)(82310400005)(81166007)(40480700001)(40460700003)(86362001)(41300700001)(4326008)(36756003)(8676002)(26005)(4743002)(44832011)(70586007)(54906003)(478600001)(5660300002)(70206006)(6916009)(336012)(6666004)(36860700001)(316002)(8936002)(47076005)(426003)(2616005)(2906002)(83380400001)(1076003)(186003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2022 05:08:13.9914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91071a93-705f-4e26-8ed0-08daae6b4354
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT034.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4862
Received-SPF: softfail client-ip=2a01:111:f400:fe5b::618;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi,
This series add xenpv machine for aarch64. Motivation behind creating xenpv
machine with IOREQ and TPM was to enable each guest on Xen aarch64 to have it's
own unique and emulated TPM.

This series does following:
    1. Moved common xen functionalities from hw/i386/xen to hw/xen/ so those can
       be used for aarch64.
    2. We added a minimal xenpv arm machine which creates an IOREQ server and
       support TPM.

Please note that patch 05/12 breaks the build. Patch 06/12 fixes the build
issue. If needed we can merge patch 05/12 and 06/12. For now we kept these
separate to make changes easy to review.

Also, checkpatch.pl fails for 03/12 and 06/12. These fails are due to
moving old code to new place which was not QEMU code style compatible.
No new add code was added.

Regards,
Vikram

Stefano Stabellini (5):
  hw/i386/xen/xen-hvm: move x86-specific fields out of XenIOState
  hw/i386/xen/xen-hvm: create arch_handle_ioreq and arch_xen_set_memory
  include/hw/xen/xen_common: return error from xen_create_ioreq_server
  hw/xen/xen-hvm-common: skip ioreq creation on ioreq registration
    failure
  meson.build: do not set have_xen_pci_passthrough for aarch64 targets

Vikram Garhwal (7):
  hw/xen: Correct build config for xen_pt_stub
  hw/i386/xen/: move xen-mapcache.c to hw/xen/
  hw/i386/xen: rearrange xen_hvm_init_pc
  xen-hvm: move common functions to hw/xen/xen-hvm-common.c
  accel/xen/xen-all: export xenstore_record_dm_state
  hw/arm: introduce xenpv machine
  meson.build: enable xenpv machine build for ARM

 accel/xen/xen-all.c              |    2 +-
 hw/arm/meson.build               |    2 +
 hw/arm/xen_arm.c                 |  163 +++++
 hw/i386/meson.build              |    1 +
 hw/i386/xen/meson.build          |    1 -
 hw/i386/xen/trace-events         |   19 -
 hw/i386/xen/xen-hvm.c            | 1084 +++---------------------------
 hw/xen/meson.build               |    9 +-
 hw/xen/trace-events              |   19 +
 hw/xen/xen-hvm-common.c          |  863 ++++++++++++++++++++++++
 hw/{i386 => }/xen/xen-mapcache.c |    0
 include/hw/arm/xen_arch_hvm.h    |   12 +
 include/hw/i386/xen_arch_hvm.h   |   11 +
 include/hw/xen/arch_hvm.h        |    5 +
 include/hw/xen/xen-hvm-common.h  |   97 +++
 include/hw/xen/xen.h             |    2 +
 include/hw/xen/xen_common.h      |   12 +-
 meson.build                      |    4 +-
 18 files changed, 1287 insertions(+), 1019 deletions(-)
 create mode 100644 hw/arm/xen_arm.c
 create mode 100644 hw/xen/xen-hvm-common.c
 rename hw/{i386 => }/xen/xen-mapcache.c (100%)
 create mode 100644 include/hw/arm/xen_arch_hvm.h
 create mode 100644 include/hw/i386/xen_arch_hvm.h
 create mode 100644 include/hw/xen/arch_hvm.h
 create mode 100644 include/hw/xen/xen-hvm-common.h

-- 
2.17.0


