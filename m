Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48E523F124B
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 06:17:24 +0200 (CEST)
Received: from localhost ([::1]:51072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGZUZ-0006kq-3e
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 00:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZOE-0001bg-Q2; Thu, 19 Aug 2021 00:10:50 -0400
Received: from mail-bn1nam07on2044.outbound.protection.outlook.com
 ([40.107.212.44]:45520 helo=NAM02-BN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZHi-0003Cd-7I; Thu, 19 Aug 2021 00:04:07 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eUuKQyh2td8ekX/He14iY0mXv01wcp8/BQQZnVpOW8I5GcLiujIRxy2qlggReW7HDncjVHMex696XuOLtwB9MfzBly9p5eiQLu/pLooJYraEIxB6v/vmXnPRtTpvG+YJP+bxY5kA5UfiVb3zhS17fVWkXmBRk8sosHpiGwKr2hQJFKeCd9xNuxndFNKvi7GmZsrg0eIcevsOiIOX1/o3h10z+F9KobVqJhfShAUL+dEgASl60YPGOVlrEswocp63FUHKM08FoK3rj84TnMsay1KqLvzYPTnSUmbrg/f7+C3+xrktsrXPX/OAKIRqOAGJTcfL7RGSueMyCnxg7+4kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDqyoA/r6akG9F10X7t+E1D1qPOEeB2xG7QHiENx6HI=;
 b=cN/PjY1SVuMiJc7BPRyCkmoU9UXnvGeXVGl74nnDp9sF+RHFvWeQvKrp+m1ijXCYtzpuai41ZiXRDqtUas+Q6uWOSq71aFsHjxmgDMRyjU92FEX3nBNYwOVfQ5bku6UxDePBmDo8xjiK7TwvOilQGex4y9TNrDZlORIRrvjgCOlxNQ1hI028niczdwqdP/ydT9yTTZ3TzRkLrddSo2+iqsu0HITzhGulixEa1cNg6LLvALpEMevXNboNDvx+EN2hgzSyF9pUDax6KLryC+CKPlx81YGDSG+HTU/Sip4xsz7p9KLoPhGgroNyKZdhWrbbCRu5Iw8rfSEDteSCCoX5/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DDqyoA/r6akG9F10X7t+E1D1qPOEeB2xG7QHiENx6HI=;
 b=FnzByktjIBhqClb+ERVHI4zVr6LMWqV/Xbb2Uv8etyvqcdrwa6xhnuLbG5XwRTuvEFHKRg+4TeZ7VqqRYphSsgFFeFxEPAQEAKy00FBlR2Vq/YhZIv4g5oCdXlPwJwyo1i4SkbQxzCzIxMhNoKhlKLgowD6qMuKigD4rr0duIC0=
Received: from SN7PR18CA0002.namprd18.prod.outlook.com (2603:10b6:806:f3::25)
 by MWHPR02MB2720.namprd02.prod.outlook.com (2603:10b6:300:10a::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Thu, 19 Aug
 2021 04:04:02 +0000
Received: from SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:f3:cafe::62) by SN7PR18CA0002.outlook.office365.com
 (2603:10b6:806:f3::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 04:04:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0014.mail.protection.outlook.com (10.97.4.112) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 04:04:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 21:04:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 21:04:00 -0700
Received: from [172.19.2.40] (port=52318 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGZHc-0000M7-87; Wed, 18 Aug 2021 21:04:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 0/9] hw/nvram: hw/arm: Introduce Xilinx eFUSE and BBRAM
Date: Wed, 18 Aug 2021 21:02:59 -0700
Message-ID: <20210819040308.675057-1-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 42bee6f4-7b14-4352-4d5f-08d962c660cc
X-MS-TrafficTypeDiagnostic: MWHPR02MB2720:
X-Microsoft-Antispam-PRVS: <MWHPR02MB27206AE2A3434A678CE3CABACDC09@MWHPR02MB2720.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pGkxiu39EXsMb12Ldsioj9mEbL7lCqnvrnq6/FecRGny5qoYyzOd6Co0FYAEz5Yfz32GepZGkYzTKbujF8nsJXwHrZzuIjtAw/FNUGqCEPODQ+RkzMKRIyQsrWJpt7isxN54wAv3CCL3M83JmrwRflHSZOTdo/7sjbRLQI/OmtAO7rsxeU2JUSnV89DQR+J5J3ktxsHbXMcMn60Rb8LVe8r8zMn2yqWo+UiKpa9RYihc+0EthrdIPEdKeAU88U9yv8JVx2XHVYu50TAJoTE2fMBu+RlyGvA2mbopemvMF7Cw5kEc+CgoSo3FkJ5pGyoOq17L7X+AOa2l0MchagcNli1L7cl1igLLX4+p2Y8ryiAdGLSjzysIqaQYrxp/GGXih5QD/uu7ZjyDaUafeKByDPeV2duEooSHrblqvrrcSly0jvlHhUtdM7tm7DNPdQEHOrGxpV9/8/zonhR0ioGVcsY+Xo0TGK9Szp63+1Rmu2u1s7TW1690uI+xPLl4FuHt2BTeimix3KaZfeB2nxPVANwU4artdIVW2qfmu1ZxpKHJKIf1CX8KaS6bEruyPFYfgygYRbZTG25fSI+RWsZmBmAg0ZAFRwZdOEqxtqGiUIMTyYYFdax3HuincOga+ZXfmIWxqDM5/K4wlYRrl1n8x04M5upd8Ukmr6gQ+Rd4crsZHTn7RMp3Ibg/q8mtCheDigeB7vExFKv3eO+W2tFDEtvlhSqtT2gFQHxa5A5UMYU=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(396003)(346002)(136003)(36840700001)(46966006)(82310400003)(44832011)(356005)(107886003)(2906002)(8676002)(7636003)(2616005)(8936002)(9786002)(70586007)(36860700001)(70206006)(82740400003)(426003)(5660300002)(1076003)(478600001)(6916009)(4326008)(336012)(316002)(26005)(36756003)(54906003)(186003)(36906005)(47076005)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 04:04:01.5884 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 42bee6f4-7b14-4352-4d5f-08d962c660cc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0014.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2720
Received-SPF: pass client-ip=40.107.212.44; envelope-from=tongh@xilinx.com;
 helo=NAM02-BN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This series implements the Xilinx eFUSE and BBRAM devices for
the Versal and ZynqMP product families.

Furthermore, both new devices are connected to the xlnx-versal-virt
board and the xlnx-zcu102 board.

See changes in docs/system/arm/xlnx-versal-virt.rst for detail.

Tong Ho (9):
  docs/system/arm: xlnx-versal-virt: BBRAM and eFUSE Usage
  hw/nvram: Introduce Xilinx eFuse QOM
  hw/nvram: Introduce Xilinx Versal eFuse device
  hw/nvram: Introduce Xilinx ZynqMP eFuse device
  hw/nvram: Introduce Xilinx battery-backed ram
  hw/arm: xlnx-versal: Add Xilinx BBRAM device
  hw/arm: xlnx-versal: Add Xilinx eFUSE device
  hw/arm: xlnx-zynqmp: Add Xilinx BBRAM device
  hw/arm: xlnx-zynqmp: Add Xilinx eFUSE device

 docs/system/arm/xlnx-versal-virt.rst |  49 ++
 hw/arm/xlnx-versal-virt.c            |  57 ++
 hw/arm/xlnx-versal.c                 |  57 ++
 hw/arm/xlnx-zynqmp.c                 |  50 ++
 hw/nvram/Kconfig                     |  17 +
 hw/nvram/meson.build                 |  11 +
 hw/nvram/xlnx-bbram.c                | 536 +++++++++++++++++
 hw/nvram/xlnx-efuse-crc.c            | 118 ++++
 hw/nvram/xlnx-efuse.c                | 253 ++++++++
 hw/nvram/xlnx-versal-efuse-cache.c   | 141 +++++
 hw/nvram/xlnx-versal-efuse-ctrl.c    | 786 ++++++++++++++++++++++++
 hw/nvram/xlnx-zynqmp-efuse.c         | 861 +++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         |  17 +
 include/hw/arm/xlnx-zynqmp.h         |   5 +
 include/hw/nvram/xlnx-bbram.h        |  55 ++
 include/hw/nvram/xlnx-efuse.h        |  80 +++
 include/hw/nvram/xlnx-versal-efuse.h |  62 ++
 include/hw/nvram/xlnx-zynqmp-efuse.h |  45 ++
 18 files changed, 3200 insertions(+)
 create mode 100644 hw/nvram/xlnx-bbram.c
 create mode 100644 hw/nvram/xlnx-efuse-crc.c
 create mode 100644 hw/nvram/xlnx-efuse.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-cache.c
 create mode 100644 hw/nvram/xlnx-versal-efuse-ctrl.c
 create mode 100644 hw/nvram/xlnx-zynqmp-efuse.c
 create mode 100644 include/hw/nvram/xlnx-bbram.h
 create mode 100644 include/hw/nvram/xlnx-efuse.h
 create mode 100644 include/hw/nvram/xlnx-versal-efuse.h
 create mode 100644 include/hw/nvram/xlnx-zynqmp-efuse.h

-- 
2.25.1


