Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A8B236451DA
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 03:16:37 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2jwT-0000Lx-GY; Tue, 06 Dec 2022 21:13:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2jwP-0000JJ-1G
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 21:13:45 -0500
Received: from mail-bn8nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eae::601]
 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vikram.garhwal@amd.com>)
 id 1p2jwM-00087E-Ri
 for qemu-devel@nongnu.org; Tue, 06 Dec 2022 21:13:44 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3q/I2ODjMX4pcw326WNO5U4rwz0kYgS7vt3GK57XVByeAItyE5R8kOyYfBzvPC1Ud4RtYiEi2WEcnrz4ZDvWwcUFbLHHS2h9J7ex5hzA1C8ZP/1uf2CMh+49wmGyPAvn43lygndrCfrP5+W+yfytcPgGMf8R6nQU+lzoboC94RkBCORJ8pwAHNOgT72PUGsQZRrGRgCs211LMGXksiMP3dz/IV+qFCxiJ5U6tXPE765PUlo77vxeVQooMcf+XCsT77OkTqxL+eQ1Dp1lpWnZG/N/StBS9vvI4nvYURTsKJRYswRBvdAB1iv+XQynP0dXZEY5rU3b9N76D12a83UIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ymAYTY/6WwcG+BVavA6YnqPisl9XIM9GY+8gaV7dUT0=;
 b=IRAnlsFwi9iBnUpBzebYX9bXTdYhGoC/zpIztRUtXSSwLqMLZteNAJIwZDlBiMA8L4AfGJUWFQuFgz+9oS5TBhe5R4sdycB4DZJKnzAGgpvsReoqJ5n9qmK3vge+VXGp019YXZiGWEU39eVYwvhosIn1+2dEr/hAx1Hxk6HJYBP3k8d/KYZHDxomEYlgByrD5vGGGGqquvHaBgFz2hUKEDzXBhrSWyy4RLbye0nbKF2LQa7g9YgO3mVqb6LYFi6UPQj6vDii26sAR6NtDh2ZQVJM5efhW36cyo+YaDxuSXp4dDeACn+G+jn82xUCcIIw4hknMAmfVFb4YUFP8WJcXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ymAYTY/6WwcG+BVavA6YnqPisl9XIM9GY+8gaV7dUT0=;
 b=VD2sGwN006RkYiAUANz/hPZzNP3NR6cGDmAEbc65qGSe386RSQhbrrALsezdY1b7KINOIginExu2eodfTrJ5AHYKuYdocrkUbk53it4O5O5JwgNjcwUwOVpHQYzT3pXTOGXOt3W4uK6EMZVLJ8Zj0rtGwPutsuvJwG+xuV4l7zQ=
Received: from DS7PR03CA0195.namprd03.prod.outlook.com (2603:10b6:5:3b6::20)
 by DM4PR12MB5069.namprd12.prod.outlook.com (2603:10b6:5:388::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14; Wed, 7 Dec
 2022 02:13:38 +0000
Received: from DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:3b6:cafe::4c) by DS7PR03CA0195.outlook.office365.com
 (2603:10b6:5:3b6::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.14 via Frontend
 Transport; Wed, 7 Dec 2022 02:13:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 DM6NAM11FT039.mail.protection.outlook.com (10.13.172.83) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5901.14 via Frontend Transport; Wed, 7 Dec 2022 02:13:38 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.34; Tue, 6 Dec
 2022 20:13:37 -0600
Received: from xsjfnuv50.xilinx.com (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2375.34 via Frontend
 Transport; Tue, 6 Dec 2022 20:13:29 -0600
From: Vikram Garhwal <vikram.garhwal@amd.com>
To: <qemu-devel@nongnu.org>
CC: <francisco.iglesias@amd.com>, <peter.maydell@linaro.org>,
 <vikram.garhwal@amd.com>
Subject: [QEMU][PATCH v3 0/4] Introduce Xilinx Versal CANFD
Date: Tue, 6 Dec 2022 18:13:17 -0800
Message-ID: <20221207021322.16165-1-vikram.garhwal@amd.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6NAM11FT039:EE_|DM4PR12MB5069:EE_
X-MS-Office365-Filtering-Correlation-Id: 4d963608-3968-4d9a-9523-08dad7f8a767
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: v2YZhUdjqA1L6saw42cBybIf4UIGKjntalkRwAlbv8UqPca3l0S/kgv5N04NDia9ZRia/fkJ3Bsx/9kcHoxMacK3RI5rKfgE0w+piLdvJlngXfGCnKL1i1snm+IM1nM1syV1TscCSJS5SrJ3LworvXRxsErQN5p+n9KO8UhM83oFkRmflPPEBWWEEZGfdv10XvJyGFAKbpzsIWLc7Ff16votw90Nnw5v0Xw5NJtLyayliDbDcguKgpPcDHW1olT99DO3T4iRubjUI9xPo6any0oh8jWuJkxowp4DavxMY6r2qMS+IgaSpTV4957ggtZSrF8cgc8pJdYqO5qXkfzAnfe5WKcaFJVfJ3JDOwPxxyo6podau1Mm7LcH1Wx+9xQ/usOkS1R2l1RzPN7ziS6mVYgijpfjfF3iAF243rGbcE+D0GZhcteZbQj26NPO/6hoSm+ikDHfQvOJFfxQ00Q2Dyrrhe4zi1lyMML0AS0trUX0lcNug3ghLDqoGYb/rcB9IAtNamm4F62nKYl3CmL2x0zHl+nGSPABKDoB7kw5LCCAgVGiDoGd5QUc/bXutlKI1jxG9S8JdwUsGOD32JxJKHH3NQ36kdmOpgoN+sDKAJAomMcyGdDTYglGXyhGxUocmbZI1cbhNfYlCrBv37yYQkYhj1ajLtTO8mpH9qVtQMuwow8xU/iWscIlHRsvn2eReq1ByTdudtdL5vXweBVyD1i63RempVRkalY5yYLJfkE=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(376002)(346002)(396003)(136003)(451199015)(36840700001)(46966006)(40470700004)(83380400001)(36860700001)(356005)(86362001)(81166007)(8936002)(44832011)(5660300002)(40460700003)(2906002)(4326008)(41300700001)(8676002)(478600001)(40480700001)(82310400005)(186003)(26005)(1076003)(336012)(426003)(47076005)(6666004)(2616005)(6916009)(316002)(70206006)(54906003)(70586007)(82740400003)(36756003)(36900700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Dec 2022 02:13:38.6166 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d963608-3968-4d9a-9523-08dad7f8a767
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT039.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5069
Received-SPF: softfail client-ip=2a01:111:f400:7eae::601;
 envelope-from=vikram.garhwal@amd.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Hi,
This patch implements CANFD controller for xlnx-versal-virt machine. There are
two controllers CANFD0@0xFF06_0000 and CANFD1@0xFF07_0000 are connected to the
machine.

Also, added basic qtests for data exchange between both the controllers in
various supported configs.

Changelog:
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
 hw/net/can/xlnx-versal-canfd.c       | 2121 ++++++++++++++++++++++++++
 include/hw/arm/xlnx-versal.h         |   12 +
 include/hw/net/xlnx-versal-canfd.h   |   90 ++
 tests/qtest/meson.build              |    1 +
 tests/qtest/xlnx-canfd-test.c        |  422 +++++
 11 files changed, 2771 insertions(+), 1 deletion(-)
 create mode 100644 hw/net/can/xlnx-versal-canfd.c
 create mode 100644 include/hw/net/xlnx-versal-canfd.h
 create mode 100644 tests/qtest/xlnx-canfd-test.c

-- 
2.17.1


