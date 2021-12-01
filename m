Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF90E465211
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:51:09 +0100 (CET)
Received: from localhost ([::1]:51106 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRsy-00067Y-JF
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:51:08 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRir-0003It-RA
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:42 -0500
Received: from mail-dm6nam12on2050.outbound.protection.outlook.com
 ([40.107.243.50]:24839 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRim-0008Rf-9c
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:41 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=b9z4kOucs583EDKi/D2Ama00taHL+s6CA4OkBDC01k1MwZfsDt10grzpUklq8MoNC5rnIHs9FJvhAj3MWLB/IgPdZHK6WZyxQ7cYdgJMUyY2yaOwmfT9MGibeBKaAEdM4gkT1VAftc2oquJegzcH8QB+gH40seftqxtTyAQr+2fPWO1Rw16vzoQZdG3wrP21KYjeEISTaYxqXpdNP8PiQAjhzDkwTAs30Vx6Vkq80fRy+4KX2+2ggizZSvRzlqdzqfwzaHVl/hLRDX5dNuMbyWaboNQKxb+KCRwVl00DrZfpCxcqpMkG9HznIXWzuscGhHz6ibU5qAEy4F6xS9Dq9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Ll0iVtXH/wXJPrHJndUM5Xjbo3GdAJy2+hETg1ZblaY=;
 b=Yccey3QD6Cgb9egHzkFtiDQ1/wfULUMFKtdM2rO3yruPO8yEjQQdy8Nwn0G50/+Sboo4pM0n7nqel3lZvlSWCSGwGp9hUxXcH1TtQ/du7Nd05N4pl8bKqkVUNzBBiY7z9Y6aoyNwsci830fRw7bPdV4hM8kCfzod/7PjL8/05XOgb17E5THN5a6ydNCL+XMhgro6R6W4fhThH8s8fAHttBcJ8iqZhN7RiQ6dTKRFAjpN901AYmAerPY7RWeR0085lehkQIeVm2E8Gs5buyrG63FDssdeHVHEFYIbMjg63bMqL8p0oT7ajLhna6BkM8W736sgvx/FkBnvnBrFM5e2EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Ll0iVtXH/wXJPrHJndUM5Xjbo3GdAJy2+hETg1ZblaY=;
 b=MHiKNlquRFgtn7EMu6T3rBk7Aiqco0dDyCwoOFyEZU0RyCkPmvxNpX/qvJuZNCZCNN74WCsfLJIWD2pGgJPG8P94XG0cP2YhaHjU2Xl2djh5HxOH51N3HH9hLviBm2fqTcpfB3zlT1dj5hHqk1de6qGtb4Dar4SVy/TBJ4CBZaw=
Received: from BN9PR03CA0310.namprd03.prod.outlook.com (2603:10b6:408:112::15)
 by SA0PR02MB7338.namprd02.prod.outlook.com (2603:10b6:806:ec::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.23; Wed, 1 Dec
 2021 15:40:33 +0000
Received: from BN1NAM02FT006.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:112:cafe::51) by BN9PR03CA0310.outlook.office365.com
 (2603:10b6:408:112::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT006.mail.protection.outlook.com (10.13.2.125) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:32 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:32 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:32 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRii-0002FY-8z; Wed, 01 Dec 2021 07:40:32 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 03/11] include/hw/dma/xlnx_csu_dma: Add in missing includes
 in the header
Date: Wed, 1 Dec 2021 15:40:15 +0000
Message-ID: <20211201154023.13931-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 90b3b363-c341-4b98-005e-08d9b4e0e950
X-MS-TrafficTypeDiagnostic: SA0PR02MB7338:
X-Microsoft-Antispam-PRVS: <SA0PR02MB7338A751A9530E5FDADB11D8AD689@SA0PR02MB7338.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: T81Px10WVo7nkZN+/nyusom/DEMEZecENBZZZMlBrn7o5eBiwhhiLuIFjIDXhgtg92FNuXZLEK/CcpZp8LugRe/l48MjYVNIDtLmQxr3cN+5ur4EgtgIumvsT0KAupwrmw668+TF/6Bwzl9a8ngJz277bu/VCr4KaaoYLQgolRLCzrgRwyyve8k/Ju+cEBp5uqw4yF4Z/73ap6k9Sc1buX2WhA6MvgeYBiqGrenvg2Sc2u1JpcnDmDbeSYYmE+mPM32JQmcineSfzdu56j9Qk4ZHOj/mWhsdRPEk7Jc93EM1UQ2HJAdQACI1CyjDxV73KCCy8rr4BgnNrHqR5FsSg2OH2p+4fUHjin6TOvQLqRcmIf+j8+lCpViLOjqJ/C7XXcQMia3+KfZH+Mmma8cqdqICkHA4yeJV6YrF1d4dRep7h1ORDZn1ZkL4vOK4hbFHPPdGhTxft34XYZiThZZK4XcX4CqR+LMPjVgfAWiMMQvYr+aVAU28/pAigribM1+8uVkvG7nNCQvisRC7Lh/amnNDGHeZcThl/az/w5kjN2pn3ZWVFGXC4+3almZFmZzku5wgduHbv2jVyssyNrKImkljoD5DlxsTAoL6m9F7Jp24s3dSJTpzkiJv6cBlSpZUOcnda/YoPCvvsEwSRkwubw3EIKIaB2h2FAbhYISB1RdCU89R7pFjqvxaaF1oP3Me8KkGbPl40dGnt2n2LQ1j3pSsZ94ERdS3UEkhLCZFEGY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(47076005)(26005)(2906002)(82310400004)(7636003)(1076003)(70586007)(316002)(508600001)(336012)(8676002)(6666004)(70206006)(6916009)(4744005)(186003)(8936002)(36756003)(2616005)(44832011)(36860700001)(9786002)(4326008)(356005)(426003)(54906003)(7696005)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:32.8081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 90b3b363-c341-4b98-005e-08d9b4e0e950
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT006.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR02MB7338
Received-SPF: pass client-ip=40.107.243.50; envelope-from=figlesia@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add in the missing includes in the header for being able to build the DMA
model when reusing it.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/dma/xlnx_csu_dma.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 9e9dc551e9..28806628b1 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -21,6 +21,11 @@
 #ifndef XLNX_CSU_DMA_H
 #define XLNX_CSU_DMA_H
 
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/ptimer.h"
+#include "hw/stream.h"
+
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
 #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
-- 
2.11.0


