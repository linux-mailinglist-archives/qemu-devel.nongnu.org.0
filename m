Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DD9A53ABDE
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:28:51 +0200 (CEST)
Received: from localhost ([::1]:46252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwS9I-0006v4-K8
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:28:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43510)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4p-0000YM-Pg; Wed, 01 Jun 2022 13:24:11 -0400
Received: from mail-sn1anam02on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7ea9::601]:41158
 helo=NAM02-SN1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4n-00072g-0s; Wed, 01 Jun 2022 13:24:10 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e5IhhKc+xHJPDrjg1liJsKi1IDJmxcgOGRXESS9G7rmr/NdD5nY/M9qAVSUIGgpbGGD1Z8U6LBWx0FFbI0vI4jHac3IVb/nDHT2OT60w7rlINCLACERK/kP0xBJJ7GT/o/zItobuApgC2Io/sz3axi+MoV4i2tII4hSuzxIE2mTpVP7GozR1yWFUAtNMCwnidNnDhAwRHhblcd1AkQY7gKk1YH2IqxnAIj29NED9mnUtgReO7sHNGWmL3Z1bcMgRXUPp2bBo2joefCCWadsIrNscmI+F8AvlB9LHNADcnWSbRxuV5sBjSX/TvVgJu5EwJN1CIi4UKK6pB9DzOru1UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eMB3BmhFEQqh2NG+sSpwFWme5g8dWkrkohSEKCx/LJ8=;
 b=McJwnpNXx14a9M+Kr5i2yT+7MCeK303m8yTgVizFWAvx/KYDznt87sGC3WlxbtIeWK5D6tsqBpDCKqRxHENBv2gWSFvAQtEwbo3xAAiGIPijw7TYRGsY4eatKYdF6nvWSlj47LBu0KXTdnzs1L6NI+u/x3Blib1bQcsHOwG193ku5z39xRDhQbFJA7EPyTA7htyjS0TrOsqrVDseidASSnvhLQG+8/+vG2ovxIpsVR7w7vlPSfCUiRbKSnRIDFE321rLb+IYKU0rAXdPu7XKn+RybQuzuc9GNjca1gSvYxAjMkDGq25Ic8UIzmETIYiy2UDtUQcJNgfCd20/obk1ZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eMB3BmhFEQqh2NG+sSpwFWme5g8dWkrkohSEKCx/LJ8=;
 b=eOU7e9MtApeJJMHG9oxUjjIosvCPitpt0BtYsR77uPeaglxZgaoYy+KiCUSwEtbE6Ajd9UG6w6KbF2thXwS4F6jjHrnUZcluu5yslyIipK7p4MJRws51rYT4B46GKRl7Vzups16MnSDvDpfvVYHLCFduRk7kOfAACppfzGKKOBk=
Received: from DM6PR12CA0015.namprd12.prod.outlook.com (2603:10b6:5:1c0::28)
 by MWHPR02MB2526.namprd02.prod.outlook.com (2603:10b6:300:44::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 17:24:03 +0000
Received: from DM3NAM02FT038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:1c0:cafe::6c) by DM6PR12CA0015.outlook.office365.com
 (2603:10b6:5:1c0::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 17:24:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com; pr=C
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT038.mail.protection.outlook.com (10.13.5.131) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 17:24:03 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Jun 2022 18:24:01 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Jun 2022 18:24:01 +0100
Received: from [172.21.132.221] (port=53720 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nwS4e-0004Ck-TG; Wed, 01 Jun 2022 18:24:01 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>
Subject: [PATCH v3 0/4] xlnx-zcu102: fix the display port.
Date: Wed, 1 Jun 2022 18:23:49 +0100
Message-ID: <20220601172353.3220232-1-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: db33d264-8069-4732-af8e-08da43f3863e
X-MS-TrafficTypeDiagnostic: MWHPR02MB2526:EE_
X-Microsoft-Antispam-PRVS: <MWHPR02MB252614FCC6F501C4BA91B8A2CCDF9@MWHPR02MB2526.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uFaiw7wAJz8dtnRfI3EYVW19XlVg4Z8on7CiROy+QZg4OjWqNBcDoCSCeYQhsKfbL+tuSrZQMj47wHq4lA1tL6IT1/iApR+/k32rz8+lHp2JvbPLz/BcsMaNB5Tgcgh2R1ucS2N2Mr0ClERAMzPXXApic0iPlUaBjudU1AvkNHj1zn87Cw+Vnc2Eg0npfSHK+WECy5YBJotnUyun0UlmrJx9Z2ryBbVgbWD1x9EwPJotfBQ3JcowWV7EW0hNPWHWu8oNn05pLfscZ/nkD2+TyG9hJRiTuw+YL2mUyYTL8qdpJk2FPc81+kVb33v+iEdvInEHRa1HFgr1kDMbGcp/c0aqbV3ARndIGq67CGy9krLy9MjruJQRw+Ob9MUkPZzCwE7HJCTIHoC6PrKNilfJo/jOZcPwd2bS87rBEE7GXp+jc9+9YHYYrczlvNmeFC9BCI1hwoFbX+O1NmCxtnhRKLwe71ZS173h5HKHd53Cxo+p0rI3+BICXCWDKlZP5A7UCaUiO43cNbvpSrc827C5eC8PYob4njgk439wLAzZGej9VW9gvThOZcl0/MFcfCX55ING3fZWlFBh1L/nG6O2yM8wPGvSJQERZBBUdc1jtjgBND+nHW/oso/FoGqauboKBwzKN2ppmD8mDmBX3h0Z2QHm865OywdMw0Vthul2ZeEP8CYaKJVikb7ADfpIsJ1QMQfpCdY7Dt0LMPNTC8Sl7g==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(4326008)(356005)(26005)(316002)(7636003)(83380400001)(6666004)(2906002)(36860700001)(7696005)(70586007)(70206006)(8676002)(36756003)(5660300002)(186003)(54906003)(40460700003)(9786002)(8936002)(2616005)(1076003)(508600001)(47076005)(426003)(336012)(6916009)(2876002)(82310400005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 17:24:03.1746 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db33d264-8069-4732-af8e-08da43f3863e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR02MB2526
Received-SPF: pass client-ip=2a01:111:f400:7ea9::601;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM02-SN1-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Frederic Konrad <fkonrad@amd.com>

Hi,

This patch set fixes some issues with the DisplayPort for the ZCU102:

The first patch fixes the wrong register size and thus the risk of register
overflow.

The three other one add a vblank interrupt required by the linux driver:
  - When using the VNC graphic backend and leaving it unconnected, in the best
    case the gfx_update callback is called once every 3000ms which is
    insufficient for the driver.  This is fixed by providing a VBLANK interrupt
    from a ptimer.
  - This requirement revealed two issues with the IRQ numbers and the
    interrupt disable logic fixed by the two last patches.

Tested by:
  - booting Petalinux with the framebuffer enabled.
  - migrating the running guest and ensure that the vblank timer still fire correctly.

Best Regards,
Fred

v2 -> v3:
  * Added a VMSTATE in order to migrate the vblank timer as suggested
    by Peter Maydell (Patch 2).
  * Rebased on 0cac736e.
v1 -> v2:
  * Better use of the ptimer API by using a correct POLICY as suggested
    by Peter Maydell (Patch 2).
  * Rebased on 78ac2eeb.

Frederic Konrad (2):
  xlnx_dp: fix the wrong register size
  xlnx-zynqmp: fix the irq mapping for the display port and its dma

Sai Pavan Boddu (2):
  xlnx_dp: Introduce a vblank signal
  xlnx_dp: Fix the interrupt disable logic

 hw/arm/xlnx-zynqmp.c         |  4 +--
 hw/display/xlnx_dp.c         | 47 +++++++++++++++++++++++++++---------
 include/hw/display/xlnx_dp.h | 12 +++++++--
 3 files changed, 48 insertions(+), 15 deletions(-)

-- 
2.25.1


