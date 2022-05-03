Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C5235188CC
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:38:33 +0200 (CEST)
Received: from localhost ([::1]:34948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlubg-0001M6-JK
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:38:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQv-00037X-6o; Tue, 03 May 2022 11:27:25 -0400
Received: from mail-dm6nam10on20600.outbound.protection.outlook.com
 ([2a01:111:f400:7e88::600]:3936
 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQt-0003pJ-MY; Tue, 03 May 2022 11:27:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TK7Wm+5XStFuLumE0SQryRWCq1YEBrmdaqHrddgxYmgc8OcjpAVBukh6kJ4jZ7vZnh8Qauj5R5DpI982sYWQhsHolPKbppzIEidR2oKt2u3Ee1/TgvsSpm3MlijMYRQbDtctotVmN0D8mBCdq8irzT5IOX9gLFocuA/tjoVTDNbH0jnGkg/9LKtY/PdLqdi7X0MSjjHPxQPbBTbvC7e9VYyFqzMAbqCGWsGfj9ei6LbShmVtMogwUwgBNjXJ3Wiyw4ggTNaI5KEp9OaFrV8UiImPVZz7cLsG4McBBc/S6F54J2TMPfGN2Kzcn++Z1rVHRSpK6XDdfM0eWJ0A6NDuwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0R8ow6bi2HAhkFA4khx9ntTUNBzaR3vRmhzCKhXKPRg=;
 b=eSYYeCj+WBkHMkaPSnc1jw3mcO51Wl70qLPQ8vJ80LLn2rOMcp+9lH96xkHM/mDW9Niwl8yAPBAK6u0/uDwjv3srPzHUvTUklXkPjIIDxGXy0CnqnVjGLY5DwGb9DPXDlEZz63U2FXXrTy96vphC76GNpckXbl8pgwrwyf32ShTZvPD1JGdkIwdfjIo2b7fJgZT/FPYmxnu/YKxAhihq7R3RamKKUXY2mAKZSvLpDUX5wp+5cpR0l3/mhAY9y9WotkOEQOVUQIWnKKJ/za7WgAxgL0NWuz1cYBGCZ2MYfKBXOUPHspTldIz5YhDLq0W9hp8dIODZmLhAVJoFezi+xA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0R8ow6bi2HAhkFA4khx9ntTUNBzaR3vRmhzCKhXKPRg=;
 b=gwhxKOzxAUJl6Aeg2tz60C/N34507GKSXGEZjXAkoJID7+IiLc4jgQ7jPTu0rv3HL328Uh9LjI0qxtsC1lnkzqEawziwSruABZjBQUuqRRG+gpzzK+bATAt+62hRHYflPSd7o6Kvl39FlBrX8pHUmX81+XJbIKP4kpmHQHv7JZY=
Received: from DS7PR05CA0039.namprd05.prod.outlook.com (2603:10b6:8:2f::16) by
 DM6PR02MB4953.namprd02.prod.outlook.com (2603:10b6:5:1a::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5206.13; Tue, 3 May 2022 15:27:20 +0000
Received: from DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:2f:cafe::89) by DS7PR05CA0039.outlook.office365.com
 (2603:10b6:8:2f::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Tue, 3 May 2022 15:27:20 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT053.mail.protection.outlook.com (10.13.5.35) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:27:19 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:27:18 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:27:18 +0100
Received: from [172.21.132.221] (port=36824 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nluQn-0002mH-Us; Tue, 03 May 2022 16:27:18 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <alistair@alistair23.me>, <edgar.iglesias@gmail.com>,
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>, <fkonrad@amd.com>, "Sai
 Pavan Boddu" <saipava@xilinx.com>, "Edgar E . Iglesias"
 <edgar.iglesias@xilinx.com>
Subject: [PATCH v1 3/4] xlnx_dp: Fix the interrupt disable logic
Date: Tue, 3 May 2022 16:25:44 +0100
Message-ID: <20220503152545.1100386-4-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503152545.1100386-1-fkonrad@xilinx.com>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2c13bcb2-5204-4d1f-f59f-08da2d1969f1
X-MS-TrafficTypeDiagnostic: DM6PR02MB4953:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB4953533C4FF523AE5916FA9BCCC09@DM6PR02MB4953.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8wdNBJi6Lf8tCWW5N/nOKQuWfVaTNptkgS6Rash//pDZtuQQZoFK2B4fAseoEsXheoxrElj4tn0NhAxflshpi4mZ2EF0nGeg3k9jEDOJnFaZItgVFKB52cQ8QMvBXW8HyM0YTnxmGbrRTskY/Z4uc+xIjkbX7vmkxj3G4pTqmiF3AicoKw1CDHGZCEES7HZhS8ET70ybtgtFn72yfDAJhmqnbjf1me25VQZ4MqkUQmhf+9L+CWzQwPZn8sZ6ZcLzykv4d7Lx7eC+UVrqMc1vjN776ck0a3oNDQ2Oh6cz1gIP7WzU9ZxGq8SJRSwDACsfymnLuBHwO0xWfQ42rHKymX4nlhjmG1x+tQeqGAf8V6fum/hxW83g6p9MqAPMzbTdhTVELxZGJ43BF1BK1PV3qJG/GU9fQgt9jeJuckoffAuhEbEazBkJjkPFi+hL6LiDgWm0664vWkXwmAV80dVLgj6wwg0qsCv0ZqB0UqDnZbW0366IDl8woDnP61fD7XeUEQNFWyQ9fhsw9HuRzklFFS7ppTQmzSQojFDCXfwf1cLl+0cgB8Wx8aghMBt5lOhGLHchbjoM8MqKoRKpaqUwGuxXRmTA4YJ4gTqlF/nQQPu4gCTpyvRVor1nOAV9F5UTg9pc2JIuWGtgVIv7Z6UGsgg7b5Lru4qb4o6i/tn+DkCsIBLDSn9wzpXzRH8iF47TnSaCrgSN7xp2Yy1IqFrcuQ==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(40470700004)(356005)(8676002)(8936002)(4326008)(9786002)(36860700001)(508600001)(7636003)(40460700003)(5660300002)(107886003)(70586007)(1076003)(70206006)(2616005)(2876002)(82310400005)(316002)(426003)(336012)(6666004)(54906003)(6916009)(36756003)(83380400001)(2906002)(186003)(7696005)(26005)(4744005)(47076005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:27:19.8431 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c13bcb2-5204-4d1f-f59f-08da2d1969f1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT053.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4953
Received-SPF: pass client-ip=2a01:111:f400:7e88::600;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Fix interrupt disable logic. Mask value 1 indicates that interrupts are
disabled.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
---
 hw/display/xlnx_dp.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 984b0a6bb9..c60e8d0386 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -885,7 +885,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         xlnx_dp_update_irq(s);
         break;
     case DP_INT_DS:
-        s->core_registers[DP_INT_MASK] |= ~value;
+        s->core_registers[DP_INT_MASK] |= value;
         xlnx_dp_update_irq(s);
         break;
     default:
-- 
2.25.1


