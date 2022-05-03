Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C860D5188C6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:37:23 +0200 (CEST)
Received: from localhost ([::1]:60244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluaY-0007gF-GE
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:37:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQj-0002pp-Ci; Tue, 03 May 2022 11:27:13 -0400
Received: from mail-bn7nam10on20619.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::619]:27392
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQh-0003mc-22; Tue, 03 May 2022 11:27:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FB15+PbYec2+gpJbQV9a+xZ8CK4rJvoBEzUkxA351i5em6PMHJCgGFANSslpDxbDDHi5TlaNyaV1+TCRWl3urpMz8dHjB93bY8GTRXyMuxhdAdbGBVoHUHlo3Rnss4A5+R96aLNhskOju1tr93NY1zMIzALFsyMGGazHmuNU0+Fpw+oWV5l7TY9oARWIFpplT88peyyITEQIiXFk4mYHPHoFeMx+2b38SH3awGj+cHSH5lbZP/VxiBPHVOgbFn7+Xw8streHfnWG8b8bqyLZ8nQNv2wcmlqx5uaYFrxekdox1JSXsOz+Tri8BoiWDS6n2KGR3YLTikSTYSuJybFHIA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=92rXo6HjtMlP74O45bNc7b7rnTIJ0uxd6CPTX9szFHk=;
 b=kGZTE9DixfYNWm8oj/wkIe7Qqq/ISY5MQb8UyA2XL6d0qlr4aYv24PxgbdFtt5AsrxhUsXiEgBvNfBOL2N7Venin22foh8oQu1JbL3ArbbLxi0RaGHM8Bae6STYElvKt/iCudIkzZ94TaUluSkOUrbswYs7LZNYwcBVcS2/gf4x+RqyP+0/ilbMha2Lk8Xf52Ph1xIhsJkyXw3hsrkFUaXkUNz/jQf3mIKnLf0QoE13YhxRPMeEIpouLtzwSe5iKbV0WSJqnD+k7SHeSObjBnA8dtnE6K39w8CdqV1bqDGNtn+o7bZhwHG0zkbGY8s+bzr91I935GIZYvyj9KcpSBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=92rXo6HjtMlP74O45bNc7b7rnTIJ0uxd6CPTX9szFHk=;
 b=I4tP7kpXn4hgsNBqmoqpZeFJCzRoNjSxSSN+PGZZxsVn9L+OvD0UzOfgRDvn01zu+F9RB/n/GbqcuaC5/y1vO799DM6UCY1EO4r9Ht9Fd37RGhv8ea46nBMWrL6UDJag1tHv58tSOY78jJCex40yAYyVU76SsIUKdjgRMv20nnM=
Received: from DM6PR02CA0150.namprd02.prod.outlook.com (2603:10b6:5:332::17)
 by CO6PR02MB7794.namprd02.prod.outlook.com (2603:10b6:303:b1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.12; Tue, 3 May
 2022 15:27:03 +0000
Received: from DM3NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:332:cafe::15) by DM6PR02CA0150.outlook.office365.com
 (2603:10b6:5:332::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Tue, 3 May 2022 15:27:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT039.mail.protection.outlook.com (10.13.5.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:27:02 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:27:01 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:27:01 +0100
Received: from [172.21.132.221] (port=36824 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nluQW-0002mH-JW; Tue, 03 May 2022 16:27:01 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <alistair@alistair23.me>, <edgar.iglesias@gmail.com>,
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>, <fkonrad@amd.com>
Subject: [PATCH v1 0/4] xlnx-zcu102: fix the display port.
Date: Tue, 3 May 2022 16:25:41 +0100
Message-ID: <20220503152545.1100386-1-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3e2c3b68-dd95-47a9-98a8-08da2d195fc1
X-MS-TrafficTypeDiagnostic: CO6PR02MB7794:EE_
X-Microsoft-Antispam-PRVS: <CO6PR02MB77943414649FCB0C6C88FABACCC09@CO6PR02MB7794.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5z/M+/9fUxD+0GHCGPI5R4zExdK+tN1prrt5YcWtYiWmNWD2jYD5eeBXeUpkxU7i5kytQPOCxqmoc8TV7S5E5RvSY/OymEc9FrTdmXQa3rjBXti0ptmA/rk+F7jAACDU/EuvudwsIKOSVqJabHrBzu8OXC6fGjz0vwW2g1IyB+KuGhKfli7rH7h9A/1VrSbbcFSB+yhTbtasITJjT9tgPuYA9igA4ZwujATXNSpCIi1KMbMnGYW4dTTWtuDNzOupPyOjKIsoaU8XK32loBoRki5Rf7PMQYyRtTgYbXU/5+0q6BmP78eL46YQ68KNEoYnId9LADQnPV0rZh1bBxmixl9hFZYW2jTDM8cE11SNyPo7S3RdXoAdsj2ZGSbZoh4wPZ8AAc6zuca1kZde6vA+rq55YAI+YZt+xXbrIQfMB1O1hnZyeaDHYQVHaiqgl8NXwFMEYeKwg+4vL4x7UjMCILuScuVzvkwZy/98IVSBuzxLenN+HT0aBKkl+q99UXh9/q/usIBmFmJS2H0Ef4Msmbnw9voKlrpAY9hcM7kTT5rSdtCErasVrBt6f+xNLVPx51owcxRDuKbnplAXvP26znvgf8/YF1R4wMMJ99RYWWsca2rghSl4BnzvY/GTFaOL7piprT+rnubSZglOzs2oL8V2ieOVU5saxP4yEXzRCWzdLmfHcHnPEQKoEXYCclMBVg682Sfy0Zs0t79VBPZBSQ==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(6916009)(7636003)(82310400005)(8676002)(4326008)(2906002)(2876002)(54906003)(316002)(508600001)(36756003)(8936002)(70206006)(70586007)(9786002)(5660300002)(7696005)(6666004)(83380400001)(426003)(336012)(26005)(186003)(1076003)(2616005)(47076005)(356005)(40460700003)(36860700001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:27:02.8270 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e2c3b68-dd95-47a9-98a8-08da2d195fc1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR02MB7794
Received-SPF: pass client-ip=2a01:111:f400:7e8a::619;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 May 2022 11:33:53 -0400
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

Tested by booting Petalinux with the framebuffer enabled.

Best Regards,
Fred

Frederic Konrad (2):
  xlnx_dp: fix the wrong register size
  xlnx-zynqmp: fix the irq mapping for the display port and its dma

Sai Pavan Boddu (2):
  xlnx_dp: Introduce a vblank signal
  xlnx_dp: Fix the interrupt disable logic

 hw/arm/xlnx-zynqmp.c         |  4 ++--
 hw/display/xlnx_dp.c         | 43 +++++++++++++++++++++++++++---------
 include/hw/display/xlnx_dp.h | 12 ++++++++--
 3 files changed, 44 insertions(+), 15 deletions(-)

-- 
2.25.1


