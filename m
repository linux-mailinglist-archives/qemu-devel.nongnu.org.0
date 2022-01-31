Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 25DF24A4ABE
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 16:38:59 +0100 (CET)
Received: from localhost ([::1]:52320 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEYle-0008Kv-7o
	for lists+qemu-devel@lfdr.de; Mon, 31 Jan 2022 10:38:58 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYix-0005Fd-BO; Mon, 31 Jan 2022 10:36:11 -0500
Received: from mail-dm6nam10on2040.outbound.protection.outlook.com
 ([40.107.93.40]:1216 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nEYit-0008DZ-Q6; Mon, 31 Jan 2022 10:36:10 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ovc7TV0uZUz1Yy9X41miFqG/5vWWv3ZkZ8LilpaMwVRf3Pyzga9mC7M84V33Ryyu6AUDOTV8oXyHe922doQwCA6fAOb74MsmO4uOOJ+Q0RKadsM8+BKJmqdndLPH/2nkCLA73O3V0fP1YZzGJl5CbBz7oIu2t9heu8zcaQzZZ7S2mLe5dfVrUwMOJzz8NoKeokT5qOgwdHlIKmfemEerMrV4Yyu3Zg2Yt01RDOGLyjEmpV3Av6p3x42JGizGlE+9Mq2NnzjJvYcCtZ+d/g/pnTNu0Mtjaj+6ycmkBzxcZVxr3G+Yb3kyb9/8obOIJkvkvwOXldPgdavf7OWZwarZpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JPQ9tmm4vhyAGoz0QIqaJCt9ltp7zdddDYpgu+K8N+w=;
 b=PbZxFMcp9ixpmZe2YO70cKBRYfm4/WjmlUDHLqWJKNanDW+7/UBLOsRx2ypP7DtTvwHfcEB9D7THG1+iT5GCBo56vGiJ6D82/92kSYFd4fOYjtf7wGtFm5aBt1jhiZ1ihS7R8ixuYlY/jBT4tkyKBgZqQgkSbctKlwZJeRAy4WkkgJ13CfjA2xIsVmHwiFwdWIp49VSpBXhAJ/CGXjjHf9TkZlX7F2SpAQbThmKzQaY/Nn3QBsWNiikdq7r4CgHRZ8U/V9OBpToIayfHwN9Jzy+Or0ys0oQSyhPDh0ps1tT24r1aDr+73PDPDgkG9buf7jfMriSq6zotg1xWCazZAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=gmail.com smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JPQ9tmm4vhyAGoz0QIqaJCt9ltp7zdddDYpgu+K8N+w=;
 b=j3VsuhrWriJYSrItAmSMpn7pLP4zI5wUnkpuOJ7Kr+mAFOk6KyNl0tFoHjTU1wKfv0wiXII5QBePSG6WQGfPjxNz3lfyq/4xo2Q+4A48GYorOl8vO+fpTuhQjzXuemtbZdgIg+ZZKjL0O86WoczStuW8TMLRSc1ZtVv9fsxpUyQ=
Received: from DM5PR20CA0003.namprd20.prod.outlook.com (2603:10b6:3:93::13) by
 SA2PR02MB7596.namprd02.prod.outlook.com (2603:10b6:806:147::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4930.17; Mon, 31 Jan 2022 15:36:02 +0000
Received: from DM3NAM02FT040.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:93:cafe::17) by DM5PR20CA0003.outlook.office365.com
 (2603:10b6:3:93::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4930.22 via Frontend
 Transport; Mon, 31 Jan 2022 15:36:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT040.mail.protection.outlook.com (10.13.5.132) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4930.15 via Frontend Transport; Mon, 31 Jan 2022 15:36:02 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 31 Jan 2022 07:36:01 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 31 Jan 2022 07:36:01 -0800
Received: from [10.23.120.116] (port=56561 helo=debian)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nEYim-0005JP-R5; Mon, 31 Jan 2022 07:36:01 -0800
Date: Mon, 31 Jan 2022 15:35:57 +0000
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH v1 3/6] hw/misc: Add a model of the Xilinx ZynqMP CRF
Message-ID: <20220131153555.gyivhhz3a7zwiho4@debian>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
 <20220130231206.34035-4-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20220130231206.34035-4-edgar.iglesias@gmail.com>
User-Agent: NeoMutt/20170113 (1.7.2)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 16e15343-810f-4879-1614-08d9e4cf6353
X-MS-TrafficTypeDiagnostic: SA2PR02MB7596:EE_
X-Microsoft-Antispam-PRVS: <SA2PR02MB7596E5D09084DE960D718270AD259@SA2PR02MB7596.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:227;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7kzi4UFgt4auImPH6o8N7Je3wunFklktl1031nozzLRLmHc7ZASyp1keVpzJjmrFRFELOzV8pwpr+a6qKoYGhqaeSO3REdTRczFkdsJjwqh22zp+Jr8shJ8/dk/sH5sOpjvSCq63W3cOL7bUwGRJtwgW42kXod7mUqbpvV6bIdL2cy7O9sF3HqYcl+fOMUIAp89X42yOPPH2EmrPHUUGOfSflXt/TSA0UQehCgmaEVzt4l+qVOpW724D3NZzEXpsFfcnu31hgZBdzsqRPfCPasyFoE6R0zXAfJkRSQwxkWwPh0cliFk1t3+kF2hdCQSTJY1B3WRjlidmSnKgCfH3wevNY0wEaOFzU1rfyEyeYWVKF7MwoNXnHszfaq81PIb3xXB96TJ3NXrakWrkK0H3/vYTJchn3a4YOxu5g4YiCHXIo3f8yDsCZ8Fa9VAA60L69vG/If5EEPfeyfc1Q82esBfKyZcmRJrALB86kuYx4HeY3veXgen98KkV0+3G+CRCOrbaljZcoq0r5u0ppBFO2IYvqwbBnDoOBh74jg8dEvkXRnhQIlEASiz8JoDWVGDuWwf5E+YduiyDh5/NSb0Z8DyET9VhR+qOOWqIho3Nnwas4clBpQLJwvoPSokzh+TOsSmyyvul/CDe1XHb9kAiSA==
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(36840700001)(26005)(1076003)(186003)(47076005)(7636003)(5660300002)(33716001)(6666004)(82310400004)(107886003)(9576002)(9786002)(508600001)(9686003)(83380400001)(316002)(44832011)(356005)(6916009)(54906003)(8936002)(8676002)(4326008)(70586007)(70206006)(2906002)(426003)(336012)(36860700001)(30864003)(20210929001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jan 2022 15:36:02.4451 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 16e15343-810f-4879-1614-08d9e4cf6353
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT040.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR02MB7596
Received-SPF: pass client-ip=40.107.93.40; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, qemu-devel@nongnu.org,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Hi Edgar,

A couple of minor comments below, looks good to me otherwise!

On Mon, Jan 31, 2022 at 12:12:03AM +0100, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Add a model of the Xilinx ZynqMP CRF. At the moment this
> is mostly a stub model.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  include/hw/misc/xlnx-zynqmp-crf.h | 209 +++++++++++++++++++++++
>  hw/misc/xlnx-zynqmp-crf.c         | 270 ++++++++++++++++++++++++++++++
>  hw/misc/meson.build               |   1 +
>  3 files changed, 480 insertions(+)
>  create mode 100644 include/hw/misc/xlnx-zynqmp-crf.h
>  create mode 100644 hw/misc/xlnx-zynqmp-crf.c
> 
> diff --git a/include/hw/misc/xlnx-zynqmp-crf.h b/include/hw/misc/xlnx-zynqmp-crf.h
> new file mode 100644
> index 0000000000..b173ea4a08
> --- /dev/null
> +++ b/include/hw/misc/xlnx-zynqmp-crf.h
> @@ -0,0 +1,209 @@
> +/*
> + * QEMU model of the CRF - Clock Reset FPD.
> + *
> + * Copyright (c) 2022 Xilinx Inc.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + */
> +

Include guard seem to be missing:

#ifndef XLNX_ZYNQMP_CRF_H
#define XLNX_ZYNQMP_CRF_H


> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +
> +#define TYPE_XLNX_ZYNQMP_CRF "xlnx.zynqmp_crf"
> +
> +#define XILINX_CRF(obj) \
> +     OBJECT_CHECK(XlnxZynqMPCRF, (obj), TYPE_XLNX_ZYNQMP_CRF)
> +
> +REG32(ERR_CTRL, 0x0)

(Optional but in case the these ones wont be used outside
xlnx-zynqmp-crf.c we could consider placing them there).

> +    FIELD(ERR_CTRL, SLVERR_ENABLE, 0, 1)
> +REG32(IR_STATUS, 0x4)
> +    FIELD(IR_STATUS, ADDR_DECODE_ERR, 0, 1)
> +REG32(IR_MASK, 0x8)
> +    FIELD(IR_MASK, ADDR_DECODE_ERR, 0, 1)
> +REG32(IR_ENABLE, 0xc)
> +    FIELD(IR_ENABLE, ADDR_DECODE_ERR, 0, 1)
> +REG32(IR_DISABLE, 0x10)
> +    FIELD(IR_DISABLE, ADDR_DECODE_ERR, 0, 1)
> +REG32(CRF_WPROT, 0x1c)
> +    FIELD(CRF_WPROT, ACTIVE, 0, 1)
> +REG32(APLL_CTRL, 0x20)
> +    FIELD(APLL_CTRL, POST_SRC, 24, 3)
> +    FIELD(APLL_CTRL, PRE_SRC, 20, 3)
> +    FIELD(APLL_CTRL, CLKOUTDIV, 17, 1)
> +    FIELD(APLL_CTRL, DIV2, 16, 1)
> +    FIELD(APLL_CTRL, FBDIV, 8, 7)
> +    FIELD(APLL_CTRL, BYPASS, 3, 1)
> +    FIELD(APLL_CTRL, RESET, 0, 1)
> +REG32(APLL_CFG, 0x24)
> +    FIELD(APLL_CFG, LOCK_DLY, 25, 7)
> +    FIELD(APLL_CFG, LOCK_CNT, 13, 10)
> +    FIELD(APLL_CFG, LFHF, 10, 2)
> +    FIELD(APLL_CFG, CP, 5, 4)
> +    FIELD(APLL_CFG, RES, 0, 4)
> +REG32(APLL_FRAC_CFG, 0x28)
> +    FIELD(APLL_FRAC_CFG, ENABLED, 31, 1)
> +    FIELD(APLL_FRAC_CFG, SEED, 22, 3)
> +    FIELD(APLL_FRAC_CFG, ALGRTHM, 19, 1)
> +    FIELD(APLL_FRAC_CFG, ORDER, 18, 1)
> +    FIELD(APLL_FRAC_CFG, DATA, 0, 16)
> +REG32(DPLL_CTRL, 0x2c)
> +    FIELD(DPLL_CTRL, POST_SRC, 24, 3)
> +    FIELD(DPLL_CTRL, PRE_SRC, 20, 3)
> +    FIELD(DPLL_CTRL, CLKOUTDIV, 17, 1)
> +    FIELD(DPLL_CTRL, DIV2, 16, 1)
> +    FIELD(DPLL_CTRL, FBDIV, 8, 7)
> +    FIELD(DPLL_CTRL, BYPASS, 3, 1)
> +    FIELD(DPLL_CTRL, RESET, 0, 1)
> +REG32(DPLL_CFG, 0x30)
> +    FIELD(DPLL_CFG, LOCK_DLY, 25, 7)
> +    FIELD(DPLL_CFG, LOCK_CNT, 13, 10)
> +    FIELD(DPLL_CFG, LFHF, 10, 2)
> +    FIELD(DPLL_CFG, CP, 5, 4)
> +    FIELD(DPLL_CFG, RES, 0, 4)
> +REG32(DPLL_FRAC_CFG, 0x34)
> +    FIELD(DPLL_FRAC_CFG, ENABLED, 31, 1)
> +    FIELD(DPLL_FRAC_CFG, SEED, 22, 3)
> +    FIELD(DPLL_FRAC_CFG, ALGRTHM, 19, 1)
> +    FIELD(DPLL_FRAC_CFG, ORDER, 18, 1)
> +    FIELD(DPLL_FRAC_CFG, DATA, 0, 16)
> +REG32(VPLL_CTRL, 0x38)
> +    FIELD(VPLL_CTRL, POST_SRC, 24, 3)
> +    FIELD(VPLL_CTRL, PRE_SRC, 20, 3)
> +    FIELD(VPLL_CTRL, CLKOUTDIV, 17, 1)
> +    FIELD(VPLL_CTRL, DIV2, 16, 1)
> +    FIELD(VPLL_CTRL, FBDIV, 8, 7)
> +    FIELD(VPLL_CTRL, BYPASS, 3, 1)
> +    FIELD(VPLL_CTRL, RESET, 0, 1)
> +REG32(VPLL_CFG, 0x3c)
> +    FIELD(VPLL_CFG, LOCK_DLY, 25, 7)
> +    FIELD(VPLL_CFG, LOCK_CNT, 13, 10)
> +    FIELD(VPLL_CFG, LFHF, 10, 2)
> +    FIELD(VPLL_CFG, CP, 5, 4)
> +    FIELD(VPLL_CFG, RES, 0, 4)
> +REG32(VPLL_FRAC_CFG, 0x40)
> +    FIELD(VPLL_FRAC_CFG, ENABLED, 31, 1)
> +    FIELD(VPLL_FRAC_CFG, SEED, 22, 3)
> +    FIELD(VPLL_FRAC_CFG, ALGRTHM, 19, 1)
> +    FIELD(VPLL_FRAC_CFG, ORDER, 18, 1)
> +    FIELD(VPLL_FRAC_CFG, DATA, 0, 16)
> +REG32(PLL_STATUS, 0x44)
> +    FIELD(PLL_STATUS, VPLL_STABLE, 5, 1)
> +    FIELD(PLL_STATUS, DPLL_STABLE, 4, 1)
> +    FIELD(PLL_STATUS, APLL_STABLE, 3, 1)
> +    FIELD(PLL_STATUS, VPLL_LOCK, 2, 1)
> +    FIELD(PLL_STATUS, DPLL_LOCK, 1, 1)
> +    FIELD(PLL_STATUS, APLL_LOCK, 0, 1)
> +REG32(APLL_TO_LPD_CTRL, 0x48)
> +    FIELD(APLL_TO_LPD_CTRL, DIVISOR0, 8, 6)
> +REG32(DPLL_TO_LPD_CTRL, 0x4c)
> +    FIELD(DPLL_TO_LPD_CTRL, DIVISOR0, 8, 6)
> +REG32(VPLL_TO_LPD_CTRL, 0x50)
> +    FIELD(VPLL_TO_LPD_CTRL, DIVISOR0, 8, 6)
> +REG32(ACPU_CTRL, 0x60)
> +    FIELD(ACPU_CTRL, CLKACT_HALF, 25, 1)
> +    FIELD(ACPU_CTRL, CLKACT_FULL, 24, 1)
> +    FIELD(ACPU_CTRL, DIVISOR0, 8, 6)
> +    FIELD(ACPU_CTRL, SRCSEL, 0, 3)
> +REG32(DBG_TRACE_CTRL, 0x64)
> +    FIELD(DBG_TRACE_CTRL, CLKACT, 24, 1)
> +    FIELD(DBG_TRACE_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DBG_TRACE_CTRL, SRCSEL, 0, 3)
> +REG32(DBG_FPD_CTRL, 0x68)
> +    FIELD(DBG_FPD_CTRL, CLKACT, 24, 1)
> +    FIELD(DBG_FPD_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DBG_FPD_CTRL, SRCSEL, 0, 3)
> +REG32(DP_VIDEO_REF_CTRL, 0x70)
> +    FIELD(DP_VIDEO_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(DP_VIDEO_REF_CTRL, DIVISOR1, 16, 6)
> +    FIELD(DP_VIDEO_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DP_VIDEO_REF_CTRL, SRCSEL, 0, 3)
> +REG32(DP_AUDIO_REF_CTRL, 0x74)
> +    FIELD(DP_AUDIO_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(DP_AUDIO_REF_CTRL, DIVISOR1, 16, 6)
> +    FIELD(DP_AUDIO_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DP_AUDIO_REF_CTRL, SRCSEL, 0, 3)
> +REG32(DP_STC_REF_CTRL, 0x7c)
> +    FIELD(DP_STC_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(DP_STC_REF_CTRL, DIVISOR1, 16, 6)
> +    FIELD(DP_STC_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DP_STC_REF_CTRL, SRCSEL, 0, 3)
> +REG32(DDR_CTRL, 0x80)
> +    FIELD(DDR_CTRL, CLKACT, 24, 1)
> +    FIELD(DDR_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DDR_CTRL, SRCSEL, 0, 3)
> +REG32(GPU_REF_CTRL, 0x84)
> +    FIELD(GPU_REF_CTRL, PP1_CLKACT, 26, 1)
> +    FIELD(GPU_REF_CTRL, PP0_CLKACT, 25, 1)
> +    FIELD(GPU_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(GPU_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(GPU_REF_CTRL, SRCSEL, 0, 3)
> +REG32(SATA_REF_CTRL, 0xa0)
> +    FIELD(SATA_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(SATA_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(SATA_REF_CTRL, SRCSEL, 0, 3)
> +REG32(PCIE_REF_CTRL, 0xb4)
> +    FIELD(PCIE_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(PCIE_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(PCIE_REF_CTRL, SRCSEL, 0, 3)
> +REG32(GDMA_REF_CTRL, 0xb8)
> +    FIELD(GDMA_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(GDMA_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(GDMA_REF_CTRL, SRCSEL, 0, 3)
> +REG32(DPDMA_REF_CTRL, 0xbc)
> +    FIELD(DPDMA_REF_CTRL, CLKACT, 24, 1)
> +    FIELD(DPDMA_REF_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DPDMA_REF_CTRL, SRCSEL, 0, 3)
> +REG32(TOPSW_MAIN_CTRL, 0xc0)
> +    FIELD(TOPSW_MAIN_CTRL, CLKACT, 24, 1)
> +    FIELD(TOPSW_MAIN_CTRL, DIVISOR0, 8, 6)
> +    FIELD(TOPSW_MAIN_CTRL, SRCSEL, 0, 3)
> +REG32(TOPSW_LSBUS_CTRL, 0xc4)
> +    FIELD(TOPSW_LSBUS_CTRL, CLKACT, 24, 1)
> +    FIELD(TOPSW_LSBUS_CTRL, DIVISOR0, 8, 6)
> +    FIELD(TOPSW_LSBUS_CTRL, SRCSEL, 0, 3)
> +REG32(DBG_TSTMP_CTRL, 0xf8)
> +    FIELD(DBG_TSTMP_CTRL, DIVISOR0, 8, 6)
> +    FIELD(DBG_TSTMP_CTRL, SRCSEL, 0, 3)
> +REG32(RST_FPD_TOP, 0x100)
> +    FIELD(RST_FPD_TOP, PCIE_CFG_RESET, 19, 1)
> +    FIELD(RST_FPD_TOP, PCIE_BRIDGE_RESET, 18, 1)
> +    FIELD(RST_FPD_TOP, PCIE_CTRL_RESET, 17, 1)
> +    FIELD(RST_FPD_TOP, DP_RESET, 16, 1)
> +    FIELD(RST_FPD_TOP, SWDT_RESET, 15, 1)
> +    FIELD(RST_FPD_TOP, AFI_FM5_RESET, 12, 1)
> +    FIELD(RST_FPD_TOP, AFI_FM4_RESET, 11, 1)
> +    FIELD(RST_FPD_TOP, AFI_FM3_RESET, 10, 1)
> +    FIELD(RST_FPD_TOP, AFI_FM2_RESET, 9, 1)
> +    FIELD(RST_FPD_TOP, AFI_FM1_RESET, 8, 1)
> +    FIELD(RST_FPD_TOP, AFI_FM0_RESET, 7, 1)
> +    FIELD(RST_FPD_TOP, GDMA_RESET, 6, 1)
> +    FIELD(RST_FPD_TOP, GPU_PP1_RESET, 5, 1)
> +    FIELD(RST_FPD_TOP, GPU_PP0_RESET, 4, 1)
> +    FIELD(RST_FPD_TOP, GPU_RESET, 3, 1)
> +    FIELD(RST_FPD_TOP, GT_RESET, 2, 1)
> +    FIELD(RST_FPD_TOP, SATA_RESET, 1, 1)
> +REG32(RST_FPD_APU, 0x104)
> +    FIELD(RST_FPD_APU, ACPU3_PWRON_RESET, 13, 1)
> +    FIELD(RST_FPD_APU, ACPU2_PWRON_RESET, 12, 1)
> +    FIELD(RST_FPD_APU, ACPU1_PWRON_RESET, 11, 1)
> +    FIELD(RST_FPD_APU, ACPU0_PWRON_RESET, 10, 1)
> +    FIELD(RST_FPD_APU, APU_L2_RESET, 8, 1)
> +    FIELD(RST_FPD_APU, ACPU3_RESET, 3, 1)
> +    FIELD(RST_FPD_APU, ACPU2_RESET, 2, 1)
> +    FIELD(RST_FPD_APU, ACPU1_RESET, 1, 1)
> +    FIELD(RST_FPD_APU, ACPU0_RESET, 0, 1)
> +REG32(RST_DDR_SS, 0x108)
> +    FIELD(RST_DDR_SS, DDR_RESET, 3, 1)
> +    FIELD(RST_DDR_SS, APM_RESET, 2, 1)
> +
> +#define CRF_R_MAX (R_RST_DDR_SS + 1)
> +
> +typedef struct XlnxZynqMPCRF {
> +    SysBusDevice parent_obj;
> +    MemoryRegion iomem;
> +    qemu_irq irq_ir;
> +
> +    RegisterInfoArray *reg_array;
> +    uint32_t regs[CRF_R_MAX];
> +    RegisterInfo regs_info[CRF_R_MAX];
> +} XlnxZynqMPCRF;
> diff --git a/hw/misc/xlnx-zynqmp-crf.c b/hw/misc/xlnx-zynqmp-crf.c
> new file mode 100644
> index 0000000000..7b3a955a42
> --- /dev/null
> +++ b/hw/misc/xlnx-zynqmp-crf.c
> @@ -0,0 +1,270 @@
> +/*
> + * QEMU model of the CRF - Clock Reset FPD.
> + *
> + * Copyright (c) 2022 Xilinx Inc.
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> + */
> +
> +#include "qemu/osdep.h"
> +#include "hw/sysbus.h"
> +#include "hw/register.h"
> +#include "qemu/bitops.h"
> +#include "qemu/log.h"
> +#include "migration/vmstate.h"
> +#include "hw/irq.h"
> +#include "hw/misc/xlnx-zynqmp-crf.h"
> +#include "target/arm/arm-powerctl.h"
> +
> +#ifndef XILINX_CRF_ERR_DEBUG
> +#define XILINX_CRF_ERR_DEBUG 1
> +#endif
> +
> +#define APU_MAX_CPU    4
> +
> +static void ir_update_irq(XlnxZynqMPCRF *s)
> +{
> +    bool pending = s->regs[R_IR_STATUS] & ~s->regs[R_IR_MASK];
> +    qemu_set_irq(s->irq_ir, pending);
> +}
> +
> +static void ir_status_postw(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(reg->opaque);
> +    ir_update_irq(s);
> +}
> +
> +static uint64_t ir_enable_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_IR_MASK] &= ~val;
> +    ir_update_irq(s);
> +    return 0;
> +}
> +
> +static uint64_t ir_disable_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(reg->opaque);
> +    uint32_t val = val64;
> +
> +    s->regs[R_IR_MASK] |= val;
> +    ir_update_irq(s);
> +    return 0;
> +}
> +
> +static uint64_t rst_fpd_apu_prew(RegisterInfo *reg, uint64_t val64)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(reg->opaque);
> +    uint32_t val = val64;
> +    uint32_t val_old = s->regs[R_RST_FPD_APU];
> +    unsigned int i;
> +
> +    for (i = 0; i < APU_MAX_CPU; i++) {
> +        uint32_t mask = (1 << (R_RST_FPD_APU_ACPU0_RESET_SHIFT + i));
> +
> +        if ((val ^ val_old) & mask) {
> +            if (val & mask) {
> +                arm_set_cpu_off(i);
> +            } else {
> +                arm_set_cpu_on_and_reset(i);
> +            }
> +        }
> +    }
> +    return val64;
> +}
> +
> +static const RegisterAccessInfo crf_regs_info[] = {
> +    {   .name = "ERR_CTRL",  .addr = A_ERR_CTRL,
> +    },{ .name = "IR_STATUS",  .addr = A_IR_STATUS,
> +        .w1c = 0x1,
> +        .post_write = ir_status_postw,
> +    },{ .name = "IR_MASK",  .addr = A_IR_MASK,
> +        .reset = 0x1,
> +        .ro = 0x1,
> +    },{ .name = "IR_ENABLE",  .addr = A_IR_ENABLE,
> +        .pre_write = ir_enable_prew,
> +    },{ .name = "IR_DISABLE",  .addr = A_IR_DISABLE,
> +        .pre_write = ir_disable_prew,
> +    },{ .name = "CRF_WPROT",  .addr = A_CRF_WPROT,
> +    },{ .name = "APLL_CTRL",  .addr = A_APLL_CTRL,
> +        .reset = 0x12c09,
> +        .rsvd = 0xf88c80f6,
> +    },{ .name = "APLL_CFG",  .addr = A_APLL_CFG,
> +        .rsvd = 0x1801210,
> +    },{ .name = "APLL_FRAC_CFG",  .addr = A_APLL_FRAC_CFG,
> +        .rsvd = 0x7e330000,
> +    },{ .name = "DPLL_CTRL",  .addr = A_DPLL_CTRL,
> +        .reset = 0x2c09,
> +        .rsvd = 0xf88c80f6,
> +    },{ .name = "DPLL_CFG",  .addr = A_DPLL_CFG,
> +        .rsvd = 0x1801210,
> +    },{ .name = "DPLL_FRAC_CFG",  .addr = A_DPLL_FRAC_CFG,
> +        .rsvd = 0x7e330000,
> +    },{ .name = "VPLL_CTRL",  .addr = A_VPLL_CTRL,
> +        .reset = 0x12809,
> +        .rsvd = 0xf88c80f6,
> +    },{ .name = "VPLL_CFG",  .addr = A_VPLL_CFG,
> +        .rsvd = 0x1801210,
> +    },{ .name = "VPLL_FRAC_CFG",  .addr = A_VPLL_FRAC_CFG,
> +        .rsvd = 0x7e330000,
> +    },{ .name = "PLL_STATUS",  .addr = A_PLL_STATUS,
> +        .reset = 0x3f,
> +        .rsvd = 0xc0,
> +        .ro = 0x3f,
> +    },{ .name = "APLL_TO_LPD_CTRL",  .addr = A_APLL_TO_LPD_CTRL,
> +        .reset = 0x400,
> +        .rsvd = 0xc0ff,
> +    },{ .name = "DPLL_TO_LPD_CTRL",  .addr = A_DPLL_TO_LPD_CTRL,
> +        .reset = 0x400,
> +        .rsvd = 0xc0ff,
> +    },{ .name = "VPLL_TO_LPD_CTRL",  .addr = A_VPLL_TO_LPD_CTRL,
> +        .reset = 0x400,
> +        .rsvd = 0xc0ff,
> +    },{ .name = "ACPU_CTRL",  .addr = A_ACPU_CTRL,
> +        .reset = 0x3000400,
> +        .rsvd = 0xfcffc0f8,
> +    },{ .name = "DBG_TRACE_CTRL",  .addr = A_DBG_TRACE_CTRL,
> +        .reset = 0x2500,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "DBG_FPD_CTRL",  .addr = A_DBG_FPD_CTRL,
> +        .reset = 0x1002500,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "DP_VIDEO_REF_CTRL",  .addr = A_DP_VIDEO_REF_CTRL,
> +        .reset = 0x1002300,
> +        .rsvd = 0xfec0c0f8,
> +    },{ .name = "DP_AUDIO_REF_CTRL",  .addr = A_DP_AUDIO_REF_CTRL,
> +        .reset = 0x1032300,
> +        .rsvd = 0xfec0c0f8,
> +    },{ .name = "DP_STC_REF_CTRL",  .addr = A_DP_STC_REF_CTRL,
> +        .reset = 0x1203200,
> +        .rsvd = 0xfec0c0f8,
> +    },{ .name = "DDR_CTRL",  .addr = A_DDR_CTRL,
> +        .reset = 0x1000500,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "GPU_REF_CTRL",  .addr = A_GPU_REF_CTRL,
> +        .reset = 0x1500,
> +        .rsvd = 0xf8ffc0f8,
> +    },{ .name = "SATA_REF_CTRL",  .addr = A_SATA_REF_CTRL,
> +        .reset = 0x1001600,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "PCIE_REF_CTRL",  .addr = A_PCIE_REF_CTRL,
> +        .reset = 0x1500,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "GDMA_REF_CTRL",  .addr = A_GDMA_REF_CTRL,
> +        .reset = 0x1000500,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "DPDMA_REF_CTRL",  .addr = A_DPDMA_REF_CTRL,
> +        .reset = 0x1000500,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "TOPSW_MAIN_CTRL",  .addr = A_TOPSW_MAIN_CTRL,
> +        .reset = 0x1000400,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "TOPSW_LSBUS_CTRL",  .addr = A_TOPSW_LSBUS_CTRL,
> +        .reset = 0x1000800,
> +        .rsvd = 0xfeffc0f8,
> +    },{ .name = "DBG_TSTMP_CTRL",  .addr = A_DBG_TSTMP_CTRL,
> +        .reset = 0xa00,
> +        .rsvd = 0xffffc0f8,
> +    },
> +    {   .name = "RST_FPD_TOP",  .addr = A_RST_FPD_TOP,
> +        .reset = 0xf9ffe,
> +        .rsvd = 0xf06001,
> +    },{ .name = "RST_FPD_APU",  .addr = A_RST_FPD_APU,
> +        .reset = 0x3d0f,
> +        .rsvd = 0xc2f0,
> +        .pre_write = rst_fpd_apu_prew,
> +    },{ .name = "RST_DDR_SS",  .addr = A_RST_DDR_SS,
> +        .reset = 0xf,
> +        .rsvd = 0xf3,
> +    }
> +};
> +
> +static void crf_reset_enter(Object *obj, ResetType type)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(obj);
> +    unsigned int i;
> +
> +    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
> +        register_reset(&s->regs_info[i]);
> +    }
> +}
> +
> +static void crf_reset_hold(Object *obj)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(obj);
> +    ir_update_irq(s);
> +}
> +
> +static const MemoryRegionOps crf_ops = {
> +    .read = register_read_memory,
> +    .write = register_write_memory,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .valid = {
> +        .min_access_size = 4,
> +        .max_access_size = 4,
> +    },
> +};
> +
> +static void crf_init(Object *obj)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(obj);
> +    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
> +
> +    s->reg_array =
> +        register_init_block32(DEVICE(obj), crf_regs_info,
> +                              ARRAY_SIZE(crf_regs_info),
> +                              s->regs_info, s->regs,
> +                              &crf_ops,
> +                              XILINX_CRF_ERR_DEBUG,
> +                              CRF_R_MAX * 4);
> +    sysbus_init_mmio(sbd, &s->reg_array->mem);
> +    sysbus_init_irq(sbd, &s->irq_ir);
> +}
> +
> +static void crf_finalize(Object *obj)
> +{
> +    XlnxZynqMPCRF *s = XILINX_CRF(obj);
> +    register_finalize_block(s->reg_array);
> +}
> +
> +static const VMStateDescription vmstate_crf = {
> +    .name = TYPE_XLNX_ZYNQMP_CRF,
> +    .version_id = 1,
> +    .minimum_version_id = 1,
> +    .minimum_version_id_old = 1,
> +    .fields = (VMStateField[]) {
> +        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPCRF, CRF_R_MAX),
> +        VMSTATE_END_OF_LIST(),
> +    }
> +};
> +
> +static void crf_class_init(ObjectClass *klass, void *data)
> +{
> +    ResettableClass *rc = RESETTABLE_CLASS(klass);
> +    DeviceClass *dc = DEVICE_CLASS(klass);
> +
> +    dc->vmsd = &vmstate_crf;
> +    rc->phases.enter = crf_reset_enter;
> +    rc->phases.hold = crf_reset_hold;
> +}
> +
> +static const TypeInfo crf_info = {
> +    .name              = TYPE_XLNX_ZYNQMP_CRF,
> +    .parent            = TYPE_SYS_BUS_DEVICE,
> +    .instance_size     = sizeof(XlnxZynqMPCRF),
> +    .class_init        = crf_class_init,
> +    .instance_init     = crf_init,
> +    .instance_finalize = crf_finalize,
> +    .interfaces        = (InterfaceInfo[]) {
> +        { }

We can remove above 'interfaces'. With above removed and include guards
added:

Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>

Best regards,
Francisco Iglesias

> +    },
> +};
> +
> +static void crf_register_types(void)
> +{
> +    type_register_static(&crf_info);
> +}
> +
> +type_init(crf_register_types)
> diff --git a/hw/misc/meson.build b/hw/misc/meson.build
> index 6dcbe044f3..1927f13a5e 100644
> --- a/hw/misc/meson.build
> +++ b/hw/misc/meson.build
> @@ -84,6 +84,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
>  ))
>  softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
>  softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
> +specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
>  softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
>    'xlnx-versal-xramc.c',
>    'xlnx-versal-pmc-iou-slcr.c',
> -- 
> 2.25.1
> 

