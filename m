Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F8836EDBC4
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 08:40:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prCLK-0002YT-BM; Tue, 25 Apr 2023 02:40:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1prCL9-0002Xd-11
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:39:52 -0400
Received: from mail-dm6nam11on2070.outbound.protection.outlook.com
 ([40.107.223.70] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1prCL6-0003lJ-VZ
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 02:39:50 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g+0cwXz+yvbsOsLRDrogB1o+8wYBZRhl0kSXhoFTlbZgYwd2g3LMPpksIMQ2kTCSmsYgXoBjDfOXVQgW/qbhV6XQ5nQ1kSzC4hcrZWNnjpX/l/riRF/IvBpdTbDsJohOjueRW2MJQvLuTX2YaW5ugOmvFDyPhR+AAZ5puw1hf0mNRSsATQtj40cvrKvaHg48BKsy1WioQJrOE4eNgs5Bgu/5m3j+TVLmbNbdMrtlhgA/bZP0SDSyrN7svnYpWdn1OW92g67EEeCh7hefnjWoXkw1rEalwHsNAoBNcgi1dBJhyEVzCZE3qqIV7XtCCsPyqBeNmZXsxhjeFWjgElYSrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OC4d7BkmifD/H7ZiBY0u2k+gd+XBhcF/Tw39V3qxVw0=;
 b=GzA0A8RSADOnxyT57lAJjxTmlwZufuhTxdpZeMCxn3v9euiTeMcRK0b4lh/Cucx+SzA3BNr9PSeCdz3tBTJCI+cf5+xNKZ0E3AucFzWperxJEzYOLbard8UVuEzGVfpLomwuuEAoQnJskhl5lbP0AZjMrxCLGV4UPDsKnScxpdM3Q5wYczu6cG5OLgeO8aNIJ96GME8Eiy441zpoQT4q3oUqRKRgl1uYUaham4onKUyxI7ORY+g0UVh/RwsF+PyT5tkrGxA51nRASMHw0wyuPJ1JkhOZMy5BqtOQ88gFxPSlqnYMNtDSGnw8ZXt/nihDichnBMfGsXzy3TMqqF9IAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OC4d7BkmifD/H7ZiBY0u2k+gd+XBhcF/Tw39V3qxVw0=;
 b=gtEmj2NzRKok4T8ybCEEhl9xfd0Xmcm+16d0Y7N+7CPrOQgVgZ1pUtSNRtFo/CdlkJT/ZiU5EolfbfcWPBGReWiYKw6BXE6FjZ0X2KNeE3C79VeCMZ04AlntNiSHXfzL9zH1kGr767sNVZIl+nJ1Prlp4tPIu2vO79lXhbJt/3w=
Received: from BN0PR08CA0025.namprd08.prod.outlook.com (2603:10b6:408:142::10)
 by IA1PR12MB8190.namprd12.prod.outlook.com (2603:10b6:208:3f2::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.33; Tue, 25 Apr
 2023 06:34:41 +0000
Received: from BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
 (2603:10b6:408:142:cafe::31) by BN0PR08CA0025.outlook.office365.com
 (2603:10b6:408:142::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.34 via Frontend
 Transport; Tue, 25 Apr 2023 06:34:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 BN8NAM11FT084.mail.protection.outlook.com (10.13.176.169) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.6340.19 via Frontend Transport; Tue, 25 Apr 2023 06:34:40 +0000
Received: from SATLEXMB08.amd.com (10.181.40.132) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 25 Apr
 2023 01:34:40 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB08.amd.com
 (10.181.40.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Mon, 24 Apr
 2023 23:34:40 -0700
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 25 Apr 2023 01:34:40 -0500
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <frasse.iglesias@gmail.com>, <vikram.garhwal@amd.com>,
 <peter.maydell@linaro.org>
Subject: [QEMU][PATCH v4 0/4] Introduce Xilinx Versal CANFD
Date: Mon, 24 Apr 2023 23:34:29 -0700
Message-ID: <20230425063433.25803-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8NAM11FT084:EE_|IA1PR12MB8190:EE_
X-MS-Office365-Filtering-Correlation-Id: 61510369-2de4-4b00-2f57-08db4557264e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ytKHl6Hy9cGy0hyJavctO3FdiRuD0busen2J0vOUNgqIbQxj+vwnFMV3I2EhF2TrDRTwcQT+mTcSTznbkQZGkmeoGAOaDqYPqrnSNcq4tps1LGTAWb0ZULhfs359wprF7uiXkZsbvDQ/ofHJ7B7M6XR7EJmCZwnBDvzW0n5mMh/5rPbELn1OFlxYx6TsYK0BCMdQjRWiwSvch/4WDnWlL7sF0qeGdJ9Mypqmgta3Jjm7uEqozNKJUmvvf5jImTK8mwiq9WlMKyl67pyp80FAUaiZ5rue2SsmZ8lxHyeeMKrsSc/jJ0lQHdGnbzsqXpjmX0Tqu7ZpluIEcsR9ovtwgC/sqD7yGHjzjTAV9AYFQ/BFthD/mqLO7stgWWj1YLpo6xIUStwG/jvYExZ9T110EIKHmnp79LHRduBC2mAqcwAColEMrGmEo9qxLMuBscn/hQuboAjWke9Fb5dexp9BN0pftpf3A34DRetV4b3tUOFWpxiQwzFemZs4YOlArEM+4ALQQACTNie97lY+G9XfLtR7Ps+pmgxx8ISd6hDXtdXIl528rJV1xtuTNRyQeFC98B0UIizg6nuTVWuTgltTNIqaavxSW2bOym8+wGqkAysxvLDIch2sj4obljmV/NJnttbWBdxtY02FAkNaMtOcp8TkaPIn3FD5f1WLwee6AKFs1XRdI5fJbT65jdeZ2bMvYgfXhwjrdMWmxKfMKcJPZaNg2cUSSOWCWnq/EWoVQxA=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(136003)(396003)(376002)(346002)(451199021)(46966006)(36840700001)(40470700004)(2906002)(70206006)(70586007)(6916009)(316002)(4326008)(44832011)(5660300002)(8936002)(8676002)(41300700001)(82310400005)(36756003)(86362001)(40460700003)(40480700001)(356005)(186003)(26005)(1076003)(81166007)(478600001)(6666004)(36860700001)(83380400001)(2616005)(47076005)(336012)(426003)(54906003)(82740400003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2023 06:34:40.9717 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 61510369-2de4-4b00-2f57-08db4557264e
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BN8NAM11FT084.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8190
Received-SPF: softfail client-ip=40.107.223.70;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Hi,
This patch implements CANFD controller for xlnx-versal-virt machine. There are
two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
machine.

Also, added basic qtests for data exchange between both the controllers in
various supported configs.

Changelog:
v3->v4:
    Address formatting related feedback from Peter.
    Correct dlc byte data storing if dlc is not a multiple of 4.
    Remove unnecessary LOG_GUEST_ERROR.
    Remove instance_finalize(canfd_finalize) function.
    Remove unused member of struct XlnxVersalCANFDState.

v2->v3:
    Corrected reg2frame().
    Added assert to prevent out of bound cases.
    Replace tx_id link list with GSList and removed sorting function.
    Replaced PTIMER_POLICY_LEGACY with proper timer policies.
    Corrected minor code format issues.

v1->v2
    Update xlnx-versal-virt.rst with CANFD examples and add this in 03/05 patch.
    Addressed comments for patch 02/05 and 03/05.
    Add reviewed-by tags for patch 01/05, 04/05 and 05/05.
    Change commit message for patch 02/05.
    Add SPDX license for Qtest.

Regards,
Vikram

Vikram Garhwal (4):
  MAINTAINERS: Include canfd tests under Xilinx CAN
  hw/net/can: Introduce Xilinx Versal CANFD controller
  xlnx-versal: Connect Xilinx VERSAL CANFD controllers
  tests/qtest: Introduce tests for Xilinx VERSAL CANFD controller

 MAINTAINERS                          |    2 +-
 docs/system/arm/xlnx-versal-virt.rst |   31 +
 hw/arm/xlnx-versal-virt.c            |   48 +
 hw/arm/xlnx-versal.c                 |   37 +
 hw/net/can/meson.build               |    1 +
 hw/net/can/trace-events              |    7 +
 hw/net/can/xlnx-versal-canfd.c       | 2115 ++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         |   12 +
 include/hw/net/xlnx-versal-canfd.h   |   87 ++
 tests/qtest/meson.build              |    1 +
 tests/qtest/xlnx-canfd-test.c        |  423 ++++++
 11 files changed, 2763 insertions(+), 1 deletion(-)
 create mode 100644 hw/net/can/xlnx-versal-canfd.c
 create mode 100644 include/hw/net/xlnx-versal-canfd.h
 create mode 100644 tests/qtest/xlnx-canfd-test.c

-- 
2.17.1


