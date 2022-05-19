Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A07E152D940
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:51:29 +0200 (CEST)
Received: from localhost ([::1]:38918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriQy-0006mE-HH
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:51:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35618)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriFI-0007Y2-Md; Thu, 19 May 2022 11:39:28 -0400
Received: from mail-dm6nam11on2061a.outbound.protection.outlook.com
 ([2a01:111:f400:7eaa::61a]:22752
 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriFD-0008Rv-Go; Thu, 19 May 2022 11:39:21 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7rPsT3Gmmxn17pI9lu3BldoEq1PYSCtPsdncyyahmbFA0/3vQi4Pg1tc+PWL7pj6iZGr+WqjYl7V1MaqWZBqNbW65BoYbfJXdONr7F95ZIxFMzF3E08MN/NpGxFL0rwRbIPG7ewR98iexKmP7bAswiv6MloK4V6/F9dj63EJCIeeL06w5vsATBfkO68k+qid+1/uom1WfhEumulljxRdcnJaf71JGw+c25Z5eIQueWBYaX8Gpx7OZ4CWscl8bIPshkMT+lF81VE2VmONH6gnj3zzuRf1+gfKW1oD1cfg+XJIDuXNZFmj55jOylRwi7Qgv0wtxdZWpzVaWKK88H2Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vd8GgUGKaBwpYrSq+WyjCHq/gMwAQatFy0bS2a2yuLY=;
 b=VRCMZqjc97Z3vgBlpeKviDAiJEVqIQaQ+gneuCcjnKsyvsV36hL9dQHpkrSWdijEzWKpNICnYKCaOqa9iIcgP96Kk4jzvmBe72rITfjfMo8JvpMYPVYGDYRMArEwLCwJguxH66hLP3hvou0RqxR2yHDkKTKAN4h1rDsPA/5QitE+kkOpo1Uv3HPkz9oX8IdXAjG50w2nsc9sUTUkls2ZOUjcFCSfYiZfYv2MTIAntDqGsXSxoKttX5QYt6w+fseD5uiW3EcsAl0KLT3gW8zl5wFQmt4ybkhrArtfX/y1MFaIQcWpGkVIlWuPoDSnUBRd5lGMkdzKgW/z/YIJhW2gsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vd8GgUGKaBwpYrSq+WyjCHq/gMwAQatFy0bS2a2yuLY=;
 b=CFea56eDaAsqGqRDTi0BR0q5WVt5ZlFmiTZfuILgDBvcu232kuPO1z1mzuPV29JZcnzopDHLdeKe3HzO9LDEyGQqzIv+lQwCtZjlX3xmkrtoP68HdNzAiYMo4uvZKGz1NipQLs0K1vELZzJYiAhxUy4AxJX22XO2TWyH9F9Ndcw=
Received: from BN9P221CA0002.NAMP221.PROD.OUTLOOK.COM (2603:10b6:408:10a::9)
 by CH2PR02MB6311.namprd02.prod.outlook.com (2603:10b6:610:10::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13; Thu, 19 May
 2022 15:39:05 +0000
Received: from BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:10a:cafe::fd) by BN9P221CA0002.outlook.office365.com
 (2603:10b6:408:10a::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Thu, 19 May 2022 15:39:05 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.80.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.80.198 as permitted sender)
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT033.mail.protection.outlook.com (10.13.3.186) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 15:39:04 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 19 May 2022 16:39:03 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 19 May 2022 16:39:03 +0100
Received: from [172.21.132.221] (port=36706 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fkonrad@amd.com>)
 id 1nriEx-0007q5-3I; Thu, 19 May 2022 16:39:03 +0100
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, Sai Pavan Boddu
 <sai.pavan.boddu@xilinx.com>, "Edgar E . Iglesias"
 <edgar.iglesias@xilinx.com>
Subject: [PATCH v2 3/4] xlnx_dp: Fix the interrupt disable logic
Date: Thu, 19 May 2022 16:38:28 +0100
Message-ID: <20220519153829.356889-4-fkonrad@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153829.356889-1-fkonrad@amd.com>
References: <20220519153829.356889-1-fkonrad@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d2ec0f1b-665c-47bf-f496-08da39adb4c8
X-MS-TrafficTypeDiagnostic: CH2PR02MB6311:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB63117E3DBE63A3773C36795EA6D09@CH2PR02MB6311.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QMtA0tnSgD1yyJ0B1A+dmf2G/M2GZXSAqDBPdXfZKGfRg2OR485NDFwgF7Ts+UPHeVRIBaNskzHYwy5eWlIIsVZWFkfCy4ZViB0mjYFeFwl1moEm/LJU48rXqYvEZPkyMq99czopiDdBbhxTzTkgp9hhAZLxwvD+mSOsqIU/+t3xOH/g5AyzbTR4U/bWc6CNbz92BYs+3CKdJvOA9Xvf3MK5XbM5IEndlSZExYM/Zwg1tQv64EhXyHcXhz2saOOpuVJsq/cfHnMURfm4Q/+L/xI3WDWMoG07PycJqxh7RCUr38rtYQ33bQ7nLwajp7mSk6kREQngek9xDKJTEp7fRoP68sf2rM9mfn4PAoLuun+A9kcuGqhj6ebdcPrW4gVzhTpStxrdgTccLtf858ofj/A/OVbNe8J7n7J20Q+Ubpzu1JfljB9dPVkjk+en+OxL/Z/yRKlV0AvTSNEp3WIoc2gwAquksTVjtcc9gQOq+eoX8yHjbD/joZxJb2LSHqYgg3NciwQeImQeLD1IxIyZ9pVRbe3RWh0PCWHxpBJ/A2L8gzZZ8y/Q1ZTvhndzur1gTi3kLg0HZnMfRHZVukG7DKSiXaDUTEQa8sgmkP51B3iTi40lRYTqiWjzLUcxmhYCydXKF+x8d+TQK7/v4t6hkGcHJKpz4131Y6U7EHyx+pbX/9GEL3ZmUPHvQ17PI1J+auWp/IS8MTiMHvX1i7gksA==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(107886003)(4744005)(35950700001)(2616005)(2906002)(82310400005)(5660300002)(508600001)(9786002)(8936002)(36756003)(356005)(83380400001)(6666004)(336012)(6916009)(316002)(47076005)(4326008)(86362001)(26005)(54906003)(70586007)(1076003)(7636003)(40460700003)(8676002)(70206006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 15:39:04.9822 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ec0f1b-665c-47bf-f496-08da39adb4c8
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT033.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6311
Received-SPF: pass client-ip=2a01:111:f400:7eaa::61a;
 envelope-from=bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Frederic Konrad <fkonrad@amd.com>
From:  Frederic Konrad via <qemu-devel@nongnu.org>

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
index 2686ca0f2e..48c0a8a661 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -888,7 +888,7 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
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


