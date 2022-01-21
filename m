Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCB44962A9
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:15:51 +0100 (CET)
Received: from localhost ([::1]:51172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwZq-0007wS-Id
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:15:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55348)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWS-0005Si-2P
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:20 -0500
Received: from mail-dm3nam07on2089.outbound.protection.outlook.com
 ([40.107.95.89]:5792 helo=NAM02-DM3-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWQ-00068N-2b
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:19 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XmBLW4NlSWRLm31GH1SaiS7IfLgBo2VkcJ5aGiLeaBc4o0it/bLDkV0sKjDwHXbbtzcJ7n/DNVbTkjKFoY4jn8RhlRyTRuMdYa6SqI2wc+JVNd1lhn8IdQaF5cAJyvFAt6P9Uwwx0HkfHo6Ag93jM4tp7Ls/1Lr69b/m3WwleSXizNB6BVCpMDVQs4dh9+W2e7sBOeeENcKg6+f+QB4Yw2weOx4jhdM2TjtgnbOO13TCGVnKZviYQoq5n7pVwiCJQ1Kkm+yB5npHELw2nWTj08Qli05VafONMNqtfFLQA7VwDL6AXfFIxCrsdgh0PeMZ3KG2j/1Z8LtgrtEMCccC4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jzpA3o7yfCZyEGb+sygl8aIYSllNiSQ3kSdSq+IOs4=;
 b=SVziL+6qyHgCx1yz46I73Re5uJPZ0JjA2h5/aHzSWOdGNdyiXMwLXUUa1lzP7PEVUwuVJ6T7hXvAa7pSp68uNDinOGabrmBLPVlr5tBlIaUHaT0tc7DbqkjDHx+0lEh/bY1v/UqrFnKRclDB/hcwVmwLRCLBoCShguMSv24KZ6AmEpgzDHJnJnSeGbmPSbwpt3TLsAq2IIDfOh4kqtnfyrmR+diB07yKg+Bn51ggAa08Pr4kr8eifHGPH7ZTYLwzmR/Peh4pHdqAKlPQYxmAmZV3+TDiLJXonz5U1shysfwaPXeR3Ju5O+0lE9cEtWCU0J1lCzmNLIz1yLwVD76/bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jzpA3o7yfCZyEGb+sygl8aIYSllNiSQ3kSdSq+IOs4=;
 b=dmIKjTqjyIOq9l7vLDIos7qkCGtioMKx2b+G/48wlIo6bwO2NvFlXf2Lm1BfckNC5xBTeIE2c3nzMG7+xFrpRq6Ul+1+B7wNN82fWJ2o9a5r8ecK2GPIWiPmg58LxfRceRSO7Af16zEAhbG4chSO3ndKyIU8Bflp7+Ca60OzQbs=
Received: from DS7PR03CA0075.namprd03.prod.outlook.com (2603:10b6:5:3bb::20)
 by DM6PR02MB6812.namprd02.prod.outlook.com (2603:10b6:5:213::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8; Fri, 21 Jan
 2022 16:12:15 +0000
Received: from DM3NAM02FT062.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3bb:cafe::2a) by DS7PR03CA0075.outlook.office365.com
 (2603:10b6:5:3bb::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.8 via Frontend
 Transport; Fri, 21 Jan 2022 16:12:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT062.mail.protection.outlook.com (10.13.5.10) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:12:15 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:11:52 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:11:52 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwW0-0002nH-C9; Fri, 21 Jan 2022 08:11:52 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 04/10] include/hw/dma/xlnx_csu_dma: Add in missing includes
 in the header
Date: Fri, 21 Jan 2022 16:11:35 +0000
Message-ID: <20220121161141.14389-5-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f4564570-7c94-402f-3779-08d9dcf8ca88
X-MS-TrafficTypeDiagnostic: DM6PR02MB6812:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB681269B07476776BCA8DD2EBAD5B9@DM6PR02MB6812.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZZdbRGCHXF0jcXsMljXpFt6buEVzehqQjS8z/wFBNPW42ySFAdjfWRkDKk5MI5LZPJqBfgAXqZLZ5k8Lkh0T2bfHuK9OEM8B1oAQ1V/iHhJyNuegndZzS7ngLii2UOHRiV+eX78luzVqvp3E/0b8phm9E6HcJ/xtJ8HEcKtuOgsdhezQzrBTJMTGRHmuu+TIr9mCq4h/BvuVSAlWZmC4C3RUon/5mF8zw4gF3DQ3R8yTTD3XT39RuEFo8CUTm2kovOGk3fZv40MDGnrblL2cDbbUIixaCWS+WXt/T1xkZZ31iCy7ThriVOg4lujd/rt1uXvj3UJDrWMSOUt8hgr7vBZ83ete10pm+xyjHZAUigbjv56WLI4x/EF2Bh25cxFAKBB3iP5ruTFC7By7zR4bl2l9TeI+6l5/0Sew9BX7rEm9lKNxqMZoNB4sPppyreW6lTb4ZeSwfzZxm/kbWX+JwJbtcGuPbvAGr1kGIb8U4iFBYkFo266+MGb3MUonNwCKJTHZI44rHJy57r6vIJdJyt+HDpplXDiXyAEiZT0tnxS2L0zdS8jS/sE9cTgMlxdOZGgjBBp39Vs4SX0eq+fDeJ48DOdw2nbCp2RiKJv2LDdleXSioqTMTqHT1gU31O3tMVPDuRWqLOgaINWwyXvpk7PLpR7WphDijrZHGFNnst8DZucCj5HEaU9B/mW4r71BKwXrgKxo5UDKVsSHq7+krrW8wpKrKvDNMZrxhvGWMrQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(6666004)(8936002)(1076003)(6916009)(7696005)(426003)(2616005)(336012)(82310400004)(44832011)(316002)(8676002)(36756003)(2906002)(356005)(4744005)(26005)(36860700001)(186003)(7636003)(47076005)(5660300002)(508600001)(54906003)(4326008)(9786002)(70586007)(70206006)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:12:15.6623 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f4564570-7c94-402f-3779-08d9dcf8ca88
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT062.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6812
Received-SPF: pass client-ip=40.107.95.89; envelope-from=figlesia@xilinx.com;
 helo=NAM02-DM3-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add in the missing includes in the header for being able to build the DMA
model when reusing it.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
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


