Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 484E348ED3D
	for <lists+qemu-devel@lfdr.de>; Fri, 14 Jan 2022 16:40:03 +0100 (CET)
Received: from localhost ([::1]:32990 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8OgK-00006R-A7
	for lists+qemu-devel@lfdr.de; Fri, 14 Jan 2022 10:40:01 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVi-0002On-7Q
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:02 -0500
Received: from mail-dm6nam10on2078.outbound.protection.outlook.com
 ([40.107.93.78]:46817 helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1n8OVg-0007WD-EE
 for qemu-devel@nongnu.org; Fri, 14 Jan 2022 10:29:01 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BKjYTZTXOveHdt7PdAZrwxZ11eIsVmgsd84FeukrFGBPvhCAdb5UssenzBTWZwm+lXOPFZeeNt+u2xEzkvMA0Dxs3PII/Po3BYcxU8WusYZsJkySe21lpJ3jIdGv8d7uLtnBGbL87vyMNgABE0KIDH+xc/sBIVLrRo6cKRsftc8sr361xm99q+3s/SSC2UNMQKLO3KxVZJxSgdAvVeqpWtHTpQv8WPowuE3iS4dk+6FdBjuIHDYVFS/SP7LJrNcU+bYELO/twHM9MiUnx7iz7A7xt8ZVzNE5yhSZ6A04WyuUjv5lb+QnXtW1YmVk9fLIwsw+lCaA0WSdnhNiycnJyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pu8bZ0s4f+VmlNAHbVXy+i/agF+KjW2eOYz1sjc+yJI=;
 b=nmY7nXbOxdu+1RJrdXXMmWSKw2hgwvY85PoYnAgXyXQQO9rvUpeHvuT5f9MAftSPa9aSlCINr/x52jAkyhV+UV2lZFDx60UTSBLFCJMI5ey8PZSBtfw6lQ/agPFhQaYfLN93Vk06iJtdMSBsoSp9Xo9DAyi/cbsOb38/uA9Ym9NWrEMnS8tStgKC78B48YT6EDaphUJ89NLsC+uM3wFzyg/NlpuE/cwMmavryGH9N4HNV1n53zlySB0/0pCuXlF95qfbDJ4NfSYgEUg6K6i8WULbYLlnuXZLO4McAe6ZqDh5r7+WJB7dBmlUBzVQMK7oL1hPbvfVeocnmXLhp0+Huw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pu8bZ0s4f+VmlNAHbVXy+i/agF+KjW2eOYz1sjc+yJI=;
 b=RxwH5bejJ3wfatGmKP7YKI7x1EfoVkXNZXEP0tkkB4wlU2/lKI7KKNDlwSoyHDii82UHtlq75L4g2hn/iLMC2OepENaZV4pz8ZVP5XF4NmPjaAbBGK6bKgitxWjbLtCe7ry2wMrDEA1d7UmFla2Pa5sejRODWwU4vmN/g/8bzwQ=
Received: from BN1PR13CA0002.namprd13.prod.outlook.com (2603:10b6:408:e2::7)
 by BN7PR02MB4180.namprd02.prod.outlook.com (2603:10b6:406:f4::27) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4888.10; Fri, 14 Jan
 2022 15:28:56 +0000
Received: from BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e2:cafe::68) by BN1PR13CA0002.outlook.office365.com
 (2603:10b6:408:e2::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.3 via Frontend
 Transport; Fri, 14 Jan 2022 15:28:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT051.mail.protection.outlook.com (10.13.2.159) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4888.9 via Frontend Transport; Fri, 14 Jan 2022 15:28:56 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 14 Jan 2022 07:28:55 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 14 Jan 2022 07:28:55 -0800
Received: from [10.23.121.163] (port=49859 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1n8OVb-0004L4-Lw; Fri, 14 Jan 2022 07:28:55 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v6 06/12] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Date: Fri, 14 Jan 2022 15:28:35 +0000
Message-ID: <20220114152841.1740-7-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
References: <20220114152841.1740-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 72f984d9-8147-43c0-e5b2-08d9d772947e
X-MS-TrafficTypeDiagnostic: BN7PR02MB4180:EE_
X-Microsoft-Antispam-PRVS: <BN7PR02MB418088FF06ED76ECB02EA218AD549@BN7PR02MB4180.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: sUdLFY+Itsk+7pKuhMcTllNOg66DSqDzPFOKHsf0pGyZaD91koSTckZVsvb19HbcycDtWGBmSF94nHMyEGVhmIXyiVXlJkEhqEZekUG/k7yHizrQw/IzdF7bkhUrm2lOJMl3eZ+4pedDaf/krAPpn0FCfhF0BcZK645zwcq9SW1dPSRrmEEIQzE4t+cZq43DVx3ef89/L1qPl1splIC1QGwLEwe3LlwJBlpQissEuwVvDvIamIxdBFFvLHsGtUpc9Gezjv7bf4K90FdzXkDZB9oFIBbOiPvMy53/b6BYFIMD9xFtB4ZVsmouyzf2blg9ee+KObGCK3W11PMYPbFlYeRAtZMG08UVO4hD6O27ZK8ZUCeBgVl4EZq7XSXJGF0Fuo0a9Ad4Aq9dPktxI3NqeyRYFkhBTL4lgz4ltXMbFepeZ0YcDn/yLgOKxv+enA4G8iiW2i5bMaj9FaIleXvqvq56gW0Oam0bGzTS4vYwZ9DdlRGEv55YU4805uIMvxYhgSVLyqm0+asQyrYZDPlBvQq1pdErjv5HINo8rBb8nKlFwZx05LFvOwagUESyWpJTpAZ923q4ieh5zx7UCvJVAL/eCh89hyquXOzWGlLoThSzXhsssSpUpBGAr8G8Ez0XoCNz7WF9RYBO59QapMZ9oF8VyetLqDQbiB4KIHzpvCuVpmfG5i2Zn+HlJk5+a4n1KOZ4cLleOSSJJMGUiraMo5ObUAwAZ6Jl4pVSJC8lnm8=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70586007)(4326008)(70206006)(508600001)(82310400004)(2906002)(7636003)(6916009)(5660300002)(7696005)(83380400001)(36860700001)(6666004)(9786002)(47076005)(186003)(26005)(1076003)(426003)(54906003)(8936002)(44832011)(8676002)(356005)(316002)(336012)(36756003)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2022 15:28:56.5817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 72f984d9-8147-43c0-e5b2-08d9d772947e
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PR02MB4180
Received-SPF: pass client-ip=40.107.93.78; envelope-from=figlesia@xilinx.com;
 helo=NAM10-DM6-obe.outbound.protection.outlook.com
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

Implement the DMA control interface for allowing direct control of DMA
operations from inside peripheral models embedding (and reusing) the
Xilinx CSU DMA.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 hw/dma/xlnx_csu_dma.c | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574d..58860d9f19 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -30,6 +30,7 @@
 #include "hw/stream.h"
 #include "hw/register.h"
 #include "hw/dma/xlnx_csu_dma.h"
+#include "hw/dma/dma-ctrl-if.h"
 
 /*
  * Ref: UG1087 (v1.7) February 8, 2019
@@ -472,6 +473,21 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
     return val & R_ADDR_MSB_ADDR_MSB_MASK;
 }
 
+static MemTxResult xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
+                                                 uint32_t len)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dma);
+    RegisterInfo *reg = &s->regs_info[R_SIZE];
+    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
+
+    s->regs[R_ADDR] = addr;
+    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
+
+    register_write(reg, len, we, object_get_typename(OBJECT(s)), false);
+
+    return (s->regs[R_SIZE] == 0) ? MEMTX_OK : MEMTX_ERROR;
+}
+
 static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
 #define DMACH_REGINFO(NAME, snd)                                              \
     (const RegisterAccessInfo []) {                                           \
@@ -696,6 +712,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+    DmaCtrlIfClass *dcic = DMA_CTRL_IF_CLASS(klass);
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
@@ -704,6 +721,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     ssc->push = xlnx_csu_dma_stream_push;
     ssc->can_push = xlnx_csu_dma_stream_can_push;
+
+    dcic->read = xlnx_csu_dma_dma_ctrl_if_read;
 }
 
 static void xlnx_csu_dma_init(Object *obj)
@@ -731,6 +750,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
+        { TYPE_DMA_CTRL_IF },
         { }
     }
 };
-- 
2.11.0


