Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1B4C4962BF
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Jan 2022 17:26:05 +0100 (CET)
Received: from localhost ([::1]:37040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAwjk-00017K-RZ
	for lists+qemu-devel@lfdr.de; Fri, 21 Jan 2022 11:26:04 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55490)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWr-00064D-Dp
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:45 -0500
Received: from mail-mw2nam10on2071.outbound.protection.outlook.com
 ([40.107.94.71]:5569 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1nAwWo-0006AX-I9
 for qemu-devel@nongnu.org; Fri, 21 Jan 2022 11:12:45 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fwZGQfgDrhD/6l+S6skNyyC989UU0uBzM/B8p7e14FkPTTHwayHzU6j2dbjbQTXz21IpcoFoCqpKT8IBE4BdCIvNiVLo1Ui4enb6RPkIHbLr9R7xYemLlv1RE4AHwAO+AVgtfXqGDbQ0d2CQ2ToQ3MoNX5ogWIBZlm8a7/Jg84LRELBHLmQ6USdZ9lbguT+zUZavE9luGNYb26xKDqJuC+zcGtq1CQP6vAHq4GlQ3dXn0gUjcCR30RXKa5Dc4awi8Y56gG0ZJFWyhifc4YV6ICR5tGUnyhn4ElzwXijdHbKohfD/vFYz0sGYhfDg78xuk9rtHokrds3wk8V014QqZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3mjnvS/rxkOVCUeZAQCrNIEHrZlCn2Z5dsM9WYOLEhg=;
 b=jhOe+zW1CoS9S4XmhCxKbrn4fN16VHdxyJXu0IGCuBueHk4ZSz7SKaEdpOsHw6C7m3AK+O+Q0/ZnGwJPth956x0jDwofvX17rJVU2o3kSjlz7u8OYCYjfV4iKMYRBaFc5MtIxDAiw9GKMPQI5PugJGT1Q6PPhBPJTws4xYEiQlNf6Ib3pO2qV4W+V5qlGckYKbSL2XZA7zNcHb+QVs16a05iBAi8eL7ztfW5mJmJ/bYxNrLBt3oNR421EtAt9IPeM5F3SJIWZ2YGRNVcmXf5mx+wB9WB1gjwnB0mLGFR5I9tdwkYw3fMdBGDjEll2P+GYpDpAxYsm0RlrGOuD6cbLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3mjnvS/rxkOVCUeZAQCrNIEHrZlCn2Z5dsM9WYOLEhg=;
 b=gzzwa8Xd3tyr22OL7XcwMo/DhasfT1G99vfZbjnPQvJVtRsNvGosqkFzaU2+/9uruUCw8nDdcjKJbfHOqOinWls+Qaw89aEYGBa0+oDeqzrst9ops9XmLpSYg13SWOeW7Xj9Pl9WkDWnh3+R56drN+oWM3wmacoGObLTi8BpolI=
Received: from BN9PR03CA0778.namprd03.prod.outlook.com (2603:10b6:408:13a::33)
 by CH2PR02MB6806.namprd02.prod.outlook.com (2603:10b6:610:aa::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Fri, 21 Jan
 2022 16:12:38 +0000
Received: from BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::e) by BN9PR03CA0778.outlook.office365.com
 (2603:10b6:408:13a::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.7 via Frontend
 Transport; Fri, 21 Jan 2022 16:12:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT021.mail.protection.outlook.com (10.13.2.73) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4909.8 via Frontend Transport; Fri, 21 Jan 2022 16:12:38 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Fri, 21 Jan 2022 08:11:54 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Fri, 21 Jan 2022 08:11:54 -0800
Received: from [10.23.121.133] (port=62231 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1nAwW2-0002nH-Bc; Fri, 21 Jan 2022 08:11:54 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v7 05/10] hw/dma/xlnx_csu_dma: Support starting a read
 transfer through a class method
Date: Fri, 21 Jan 2022 16:11:36 +0000
Message-ID: <20220121161141.14389-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
References: <20220121161141.14389-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3ccfc0d8-a375-4365-37aa-08d9dcf8d825
X-MS-TrafficTypeDiagnostic: CH2PR02MB6806:EE_
X-Microsoft-Antispam-PRVS: <CH2PR02MB6806ACF33BDBB0087ADC181DAD5B9@CH2PR02MB6806.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:4303;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u41nKx/dT0M20SwqUDaIvNxR0QQv2GhqcrabDLmwJTp77jrgFawckRKcUJOEsAk0sVkodnzJMH2smdMub9bo7LKVGj401/3uOdiNoOZKDIbtB7/Db7yLEdIOi4GbL9//DTEwu8FJhdihdljCSRxJyUhMKJHcSlJCrH3Tgdr0WFW1mbz1/DsDxqP2eMcbL/yveke2+SdSDPwpBcRcPNfA9dI2gx8UCHCeMusejJxSHf1FQ18ktGE/Fex8oM6nQ53ne4qC8HJQBC01nhDf8JbtlZt1TvSPllbmirig8RHgSs+cUg4mBabQovC02AYWakeSoL6v1Ii9XFEoZUgqSln2q8TYzmE5gCMivp08ZVAvF0yFjkb3+dTP+ErcoTuLgHU4N8RdJPLnPMlK1xepXbB4sryKV+ckf1JBZdOGM5AgeoM2lZhLdAsuCjRnRd+Ekb50LdoYXOznGVDy2W/Eg5BVZ5FxmAylfZ9jq9lXV9DMj9Wqp4IR/krKcJoYTDKhtleuoseEq4vltH99bDrHLWzkfaBXeGakzfGtF/G1HgyOkM/cw8jqWKc7jKh+BeDNgT/pNQPJ4/4kXOxPYmLp0ER6KiTKxbRTmEQt649dDk/XAr2fhTFNwb0aImvwIq+zmH4CpA5zvDE1nsyvyTXtM4auifopQSsneQ4K7O4SRzHWM2hbIGJks3xsa3kUWXWXnYepGA8g2CoQUliei0SRHDFdKz34lnYJpUhc/aWsyjEOH4w=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(46966006)(36840700001)(70206006)(426003)(7696005)(336012)(2906002)(26005)(44832011)(54906003)(8936002)(316002)(9786002)(2616005)(82310400004)(70586007)(186003)(8676002)(5660300002)(36860700001)(356005)(7636003)(508600001)(6666004)(6916009)(36756003)(47076005)(83380400001)(1076003)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2022 16:12:38.4703 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ccfc0d8-a375-4365-37aa-08d9dcf8d825
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT021.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6806
Received-SPF: pass client-ip=40.107.94.71; envelope-from=figlesia@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

An option on real hardware when embedding a DMA engine into a peripheral
is to make the peripheral control the engine through a custom DMA control
(hardware) interface between the two. Software drivers in this scenario
configure and trigger DMA operations through the controlling peripheral's
register API (for example, writing a specific bit in a register could
propagate down to a transfer start signal on the DMA control interface).
At the same time the status, results and interrupts for the transfer might
still be intended to be read and caught through the DMA engine's register
API (and signals).

This patch adds a class 'read' method for allowing to start read transfers
from peripherals embedding and controlling the Xilinx CSU DMA engine as in
above scenario.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
---
 include/hw/dma/xlnx_csu_dma.h | 19 +++++++++++++++++--
 hw/dma/xlnx_csu_dma.c         | 17 +++++++++++++++++
 2 files changed, 34 insertions(+), 2 deletions(-)

diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 28806628b1..922ab80eb6 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -51,7 +51,22 @@ typedef struct XlnxCSUDMA {
     RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
 } XlnxCSUDMA;
 
-#define XLNX_CSU_DMA(obj) \
-    OBJECT_CHECK(XlnxCSUDMA, (obj), TYPE_XLNX_CSU_DMA)
+OBJECT_DECLARE_TYPE(XlnxCSUDMA, XlnxCSUDMAClass, XLNX_CSU_DMA)
+
+struct XlnxCSUDMAClass {
+    SysBusDeviceClass parent_class;
+
+    /*
+     * read: Start a read transfer on a Xilinx CSU DMA engine
+     *
+     * @s: the Xilinx CSU DMA engine to start the transfer on
+     * @addr: the address to read
+     * @len: the number of bytes to read at 'addr'
+     *
+     * @return a MemTxResult indicating whether the operation succeeded ('len'
+     * bytes were read) or failed.
+     */
+    MemTxResult (*read)(XlnxCSUDMA *s, hwaddr addr, uint32_t len);
+};
 
 #endif
diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574d..095f954476 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -472,6 +472,20 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
     return val & R_ADDR_MSB_ADDR_MSB_MASK;
 }
 
+static MemTxResult xlnx_csu_dma_class_read(XlnxCSUDMA *s, hwaddr addr,
+                                           uint32_t len)
+{
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
@@ -696,6 +710,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+    XlnxCSUDMAClass *xcdc = XLNX_CSU_DMA_CLASS(klass);
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
@@ -704,6 +719,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     ssc->push = xlnx_csu_dma_stream_push;
     ssc->can_push = xlnx_csu_dma_stream_can_push;
+
+    xcdc->read = xlnx_csu_dma_class_read;
 }
 
 static void xlnx_csu_dma_init(Object *obj)
-- 
2.11.0


