Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CE4845489D
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:23:54 +0100 (CET)
Received: from localhost ([::1]:43004 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLqq-0007Y9-C3
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:23:52 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49792)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmF-0008IO-W5
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:08 -0500
Received: from mail-mw2nam12on2047.outbound.protection.outlook.com
 ([40.107.244.47]:58592 helo=NAM12-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmD-0004Wg-OP
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HAWUZCYL9ACIV7GItJ3q+4s188ySvJbCavYiUamOglMOnKRm4sh8Zr5Dg9cHfkgJDW+KLG0XDo11xoaGqhOIE5mxhAP6uOZ681Zvm4ttYOYQ/01Wn3Cd7nqPG7qRlsbyKbH68F0hsV5Zdd33IGEsivhK9IqD/qR9v8xJWikkLvVxyE1WjWEJlO+R2sPUiFpF4hd0WTNcSKJjnoWKhAuPUd8l/wYWZ2w3V+ke7vekmBBihV9R2CSKc4CdID/bivyJGchSddEQJo5ld6jIiHH56IzMjhwEGT6K+dJrh8NJqGAOjO74RFDycgLvsg4iwddY7dslok/Sda6JPQ/mRHFjVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8nqRu9hAriGCDY8wXrJ2ZR8F9wDDPQuQ30VcoOLDeos=;
 b=NmW27Vbq3Yc/cCqVQ9uxyIRjDYD/Ff8E5yQjg/yoABAsXekXrfT8njPy8+yXDadsv9fcB9VHb/4Dk2E7gwnN91tZa6DtO16dmIT2BYfmOhGgaSWup1gb1Ww0sYm80ab32DqglnPf8liElYnamY7w6BJWSma65+CS+o78pJhZ2obfk2myCjOCQds70ucnCSt/mYm4+r0HC2WsJhq7XKTAgA3w2iAefS2EdacecmVKQiucr5v5pRi35pPofb1dsGB5RkT+zwLlKXdUj+uhEOV8PrqXdDJ+x4F/zmaOplKW0h0jWnnCQk6pjrNdY4I3c+Y94Fbkz1pnt8solzgZW3CByg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8nqRu9hAriGCDY8wXrJ2ZR8F9wDDPQuQ30VcoOLDeos=;
 b=YH1bChFIF9zT7U7ti2MoDdJSZ8aLzTx2i2Np2rDtcFIemtCq19/dLEb1ka3BZnwA2jfjKgzpeIRdm1ZDFDKyzUG0j+dEj7m6+s/jtatuoAWXieRowOiWzg70TOfnDUrnzOvH38zeg94Rko5Cful4gMZ70TBJSgBQO/tfkTteQxo=
Received: from BN7PR06CA0063.namprd06.prod.outlook.com (2603:10b6:408:34::40)
 by SJ0PR02MB7520.namprd02.prod.outlook.com (2603:10b6:a03:324::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 17 Nov
 2021 14:19:02 +0000
Received: from BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:34:cafe::10) by BN7PR06CA0063.outlook.office365.com
 (2603:10b6:408:34::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 14:19:02 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT064.mail.protection.outlook.com (10.13.2.170) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:19:01 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:49 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:49 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLlw-000Dy8-Uv; Wed, 17 Nov 2021 06:18:49 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 3/9] include/hw/dma/xlnx_csu_dma: Include ptimer.h and
 stream.h in the header
Date: Wed, 17 Nov 2021 14:18:35 +0000
Message-ID: <20211117141841.4696-4-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cab1e3e8-fb37-48d7-48d8-08d9a9d5345c
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7520:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB752079E89A1D2D7A0AF8D525AD9A9@SJ0PR02MB7520.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4714;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cZOfkQTrgivAUQwQFkfa+6pm7uhqRpad6Nq6nYGMqR6BuTL5cQYkXR8FnfC4bVrx5azZE7rIZ7Z7ETzqMKF/f4DkORfnHx/ZjsCn/SWqQUw52DmGhdJ8ceh4C7eoSdBcS49LJ2BdSzz2r0yT39qDBRg7xI5glSirPEaV4iOoTR92ZKG9bYOZKut2Ut8228+lZJQniLHeeV2RNfR3MwNtQu1DiFs/vmIanCAWwBdyzK6j1Qkznvb1gDNblJhx7CI/8X6HaGNuIf27CT4ccICU2MdeEcLPx+fcDgDAXv5HTlUICYzgg7r+5wiN2hvkQD0kq//4aX5OZeUxT0dQnrjceFSogS15AbiSoT9MpH5LkmNmQeHL7AUZLV6Xxfgre98vEHgW/F9/ofMjZBiuc0yJcMj4BNFC5UVzT70xW4oEAgHihoccaVTR2hHoMiHOLQK7Z8SnbQor9VhQAvv4Rcz8mOJVi8W3yG3K3YTs5vFXmwjZqnYpL8MKzfNdL9oHWItPS4fHZ0dFCGBH9hpWFLQP5Hl/LRZp8Z6llZuvpgfW/n8jaGSb4urU8ubI5pknx4M9ra2p0tHOD36/PJGX2p6adSPq6eA4DS2Yvz06aql6Jl53UCHX6O5xtiiVMYpg8cVCum7dbgwqBD9kRtkVrcq/DtV8jp5jtIJXUllnquCEYKcvviEoGqid+QW6aZiY2oM9TrQ5UztA3r3j6cTLKfqpQf4+Es/ITMbOWN0KG4vMs3g=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(8676002)(2616005)(8936002)(6666004)(7696005)(356005)(44832011)(6916009)(186003)(47076005)(7636003)(82310400003)(36860700001)(54906003)(70206006)(4744005)(336012)(26005)(9786002)(2906002)(426003)(316002)(508600001)(1076003)(36906005)(5660300002)(4326008)(70586007)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:19:01.9827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cab1e3e8-fb37-48d7-48d8-08d9a9d5345c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT064.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7520
Received-SPF: pass client-ip=40.107.244.47; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Include ptimer.h and stream.h in the header for being able to build and
reuse the DMA model (the first usage of StreamSink, StreamCanPushNotifyFn
and ptimer_state is in the header).

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 include/hw/dma/xlnx_csu_dma.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 9e9dc551e9..8c39e46f58 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -21,6 +21,9 @@
 #ifndef XLNX_CSU_DMA_H
 #define XLNX_CSU_DMA_H
 
+#include "hw/ptimer.h"
+#include "hw/stream.h"
+
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
 #define XLNX_CSU_DMA_R_MAX (0x2c / 4)
-- 
2.11.0


