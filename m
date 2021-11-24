Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 315A345B877
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:37:32 +0100 (CET)
Received: from localhost ([::1]:40826 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpped-0007vz-Bj
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:37:31 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJy-0000yq-77
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:10 -0500
Received: from mail-mw2nam12on2058.outbound.protection.outlook.com
 ([40.107.244.58]:30912 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJw-0002bu-3M
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:09 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=W+QhlCluiwzpa/Q9qPr6gnbyXUY4dV1mWuUGWfGoOLlQAilUzsSzRcONA7gnxBhGLhWb8+fJTFDfLEvjLpaQ5cdfCbyBxZr3UYqsVfdcw7PjP3yayTGg7nx/4pduKHEXK1rB4JhIS/SvjMIFqLdfUAW18WXG5shCtfGUUz26CkFVRl+CBmua2T6MdKRpsrG54wNThuSKXiZAV4uI+pySG3RWTnMOEY2fqWnO4fQTxBKJRyof0+GDBN9kJfGXYYY+e1/7jH7p5OiQX5XxdCM6AT3M6bNqDoNnQJxuIXJBsOhiviyC/FCkS7TyOTOaWd5qV7osRJO7sJO5di9AKHIW3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tBYgoOHOQOTXbDvhXCK6UoEGUxeOJYEPQ7KhsVxPE2Y=;
 b=PKAzEAEy5cl+xBb8KUpf5nCwwQxHvzgxOs7oGQ+sazDYLIqi4SVlWgQ1wqqs0EAhz+xVMHWsyCaaaXOeucGiPHsa1UAMJetV86LWCGDULyC9nV4dWOTX/4g2MnOr2LKwUitZyFGkPflvGtkKMBBXPGjMbahwq8oI4bW+/Tgpj3HF7RmpZfXaIk+dbH8N0TgjJnOKAff8rUMsSdeesQZuEL+HoY6vzX9HyQa4e6tIqrmyWE+d1xpI9sqZu4oiOuPHB9vmCK2ztAqnXuDUb2+QcRnAGN7PoD+VJVQLF2G2+hk6dl7tJ6TtgyyMRajOfwPmSDlCfRGFek2XYGvQB/LinQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tBYgoOHOQOTXbDvhXCK6UoEGUxeOJYEPQ7KhsVxPE2Y=;
 b=qyzJISXWidN8wBEI+bM83aDblHj0RlFShFM7bGCpei9HYYCP64Lf2rq2nVOMWmh9Ikio7KJCGhy8w1djlKi+U7fm52dE2wmzNo/EiiIbCbI7CQrKAIoBe55c7RAYKyLNf9HC4KK5zNZrGPBkFd+CshDGsP2AvG/Kd+immzuECHk=
Received: from SN4PR0501CA0086.namprd05.prod.outlook.com
 (2603:10b6:803:22::24) by MW4PR02MB7170.namprd02.prod.outlook.com
 (2603:10b6:303:70::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 24 Nov
 2021 10:16:05 +0000
Received: from SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:22:cafe::10) by SN4PR0501CA0086.outlook.office365.com
 (2603:10b6:803:22::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.18 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0048.mail.protection.outlook.com (10.97.4.223) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:05 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:04 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:04 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppJr-00036z-Rb; Wed, 24 Nov 2021 02:16:04 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 03/10] include/hw/dma/xlnx_csu_dma: Add in missing includes
 in the header
Date: Wed, 24 Nov 2021 10:15:48 +0000
Message-ID: <20211124101555.1410-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 97bb6860-d31d-4600-ead6-08d9af336cdc
X-MS-TrafficTypeDiagnostic: MW4PR02MB7170:
X-Microsoft-Antispam-PRVS: <MW4PR02MB717024C369ADC79F4C73BEB3AD619@MW4PR02MB7170.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bqgThcrsQksyS7I4zJixMCsXOidM9VPgGcyW+BmMTXrMh/XuKWoROkx50UBbCr/n7bc+bER43zxhcNjDP0FS4Ib0lolE3Y3MH2C5MGPsw4YLTVxfW92LVjuI+ZeK0aacfyeMOPtaLIVzD0hfd7GBkET6NMKyJXCLbECJKpgIusQn9UgrdIqeEWmeEG4JtngprTuZ49K5J71DLifoGMmPwD/XcYL3jnzcL/M+Mu7ZH/aK0pZBJNlkMbHVlv5lPIkk5dLNjHvIMr0GcvsGBYS1Dz0tfn1/uK+jZXdSIzYKGYglgsQY/L2/isZs9t/pOMFsQZbl4YZV8o2qp3bWQLYNPeE3o6hf2fIrILgyg2KC3FMV8tKtTeLoMRO5/yhXd5c6RASQ0WhCCOeDQ9WVSymdyTc3KOoCSIVfCgj69keuw4JfZkFBXN74/SFxC6xuf0XRTtGGUf5zB0urGgLLFi4O1rI3vTlE107AruGJcDS+uV8sv0XkBod3/+8CfIt4U7phLLrIgB3rCO+Yht3+/dKwy17FSGorm9No/qANhrRbbfp+pAPt+ZpF6gI7kIhfUPzSOXWdzwfiy5zkhKNg3APB5spddFYRgo5N7klo1Wic2CWH4cu7EXxhuPAQvn9Zg0xgClYFN/XyFCl/KHC3qhzZq9NokyYYhV+/2BtjIhiriVrheGBAaFo3LztFcwQhLr+2beAZqN/0esAf1CODrvrTscDidQeDzjefg0crOflmuGs=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(36860700001)(336012)(356005)(6666004)(82310400004)(5660300002)(7696005)(8936002)(186003)(508600001)(9786002)(2906002)(70586007)(4744005)(70206006)(316002)(54906003)(1076003)(4326008)(44832011)(47076005)(426003)(6916009)(8676002)(26005)(36756003)(2616005)(7636003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:05.3446 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 97bb6860-d31d-4600-ead6-08d9af336cdc
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR02MB7170
Received-SPF: pass client-ip=40.107.244.58; envelope-from=figlesia@xilinx.com;
 helo=NAM12-MW2-obe.outbound.protection.outlook.com
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


