Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D39A645A05B
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:37:23 +0100 (CET)
Received: from localhost ([::1]:34168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTAw-0007PN-VW
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:37:23 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60448)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8S-0004kv-39
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:48 -0500
Received: from mail-co1nam11on2046.outbound.protection.outlook.com
 ([40.107.220.46]:16352 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpT8Q-0000hQ-Cz
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:34:47 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WHxDNSDZVsTt5VxHrGXSv05cSyS2DbZRNWxh3i2gYDnxEKElX30PCyqzuKTsSB+J4p5U8wLaK43nWHViCPqj+9Re6pIi2wnH+lMV/Hy5qxWLxmGSYcu92aBaUqGsEVbkqTLCMZgXmC0R3mg86GYNftuCCxtOX35qnaNNPSFS23CD4mTgFUZ8/S+7PZN4UPThJRruHXH7mEnPOPTXElyFfEjCJfz6PQ9SGZcMGJ5lJPWrICeSKrbMxY8QNW0u0SoOA8bIm8zVa6sYsucjB8sWVBb62w3rLJCU2mr8F/led3NjNwn8vGF9s/3FWhgTAtlxapS3mwU3TJcmNZn4kW0Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zTXww8o72NyYGbiT5puw7yIhM/D7vD31ZnWRU04c0yA=;
 b=J+wxK28F5oVBu+kDw3Ifn9YLFkqM0w7JXTllEz/cSy8dr6/NnmXoqJ/57tkc61cWsQuu4sPkrQ3/C5EelP5rzYbZPeudLsYRuF3oHAloj/HQfCeNycGeWMsq0Ky0oa8d/DajU/PZS4yyyE/nB5Ai+Vv7aOXf6URCT9sHpoo59SaBmUj6Jl6OFhHuC/TEny+2eZvBO/13F4FfKq8m91mCiVJ06c4oRSupnIkJBhRzX0PxUo7K8DRGRVYSJveIoVGA6eXTt9PTuMIdneGbjtqSiOCFtoR5x1hoXDcAWJ1rox+QZZf1fouamJEnzrfb7u3+7fCjQhF4GP9TcD9E3V7LUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zTXww8o72NyYGbiT5puw7yIhM/D7vD31ZnWRU04c0yA=;
 b=g58ZkWaEIwn9MHCy9jdhB8IdwMEdgu7JKcCH7DtOLt/OBcmFh4oe8DteC9tQ3X87MJ2+Mz7Wu8qKOD9H0BfpPN+kYL7D9Wpfs3IIqYgpTdyzKMlsZw0rkNLFD9sj+ScX4MZlD28CjWQqB3lMe8peIFSY5r0j2juWpiJaqWt+uW0=
Received: from BN9PR03CA0436.namprd03.prod.outlook.com (2603:10b6:408:113::21)
 by DM6PR02MB7097.namprd02.prod.outlook.com (2603:10b6:5:25d::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Tue, 23 Nov
 2021 10:34:43 +0000
Received: from BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:113:cafe::d1) by BN9PR03CA0436.outlook.office365.com
 (2603:10b6:408:113::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.21 via Frontend
 Transport; Tue, 23 Nov 2021 10:34:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT011.mail.protection.outlook.com (10.13.2.129) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:34:43 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:39 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:39 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8I-000GX6-Sl; Tue, 23 Nov 2021 02:34:39 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 05/10] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Date: Tue, 23 Nov 2021 10:34:23 +0000
Message-ID: <20211123103428.8765-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c6368ed8-28cb-4ec2-3d9f-08d9ae6cdcec
X-MS-TrafficTypeDiagnostic: DM6PR02MB7097:
X-Microsoft-Antispam-PRVS: <DM6PR02MB7097BB07988D74250103A988AD609@DM6PR02MB7097.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 9XV+B0Sm2U1ZkZL4RyymHDVYPjttdjnhDfO7i8WHzzqrJUAyjnSaFYRCS904O5vu/lvFPw01PCp1CYTo6wWcYJmSNeB/SyyMpaFB5FtFQ4GCTW9KkmfxvCQosrWZCDXeIPyZg4mRbfq1C2zDbR+nMSdA0Pw+2a9r4Hhl/28ru9WG256nf9euF9n4wFTHBoLjL/9JASZ46kxgaurY89TVkoVL+zM5fHA9JoP4IY+72VGuLOCGj7fKafbqz2V3bvKnr+yyyb1cJ3jxYkCT2li+RxxVfLde0vnt6SSlOjCDa3A9hPNzIPBgoYS/nJQNTgJpt+L+PRsHaDvi+v1ooX9j8oysqs2CE+nk4HwlkTVoB23qsfUEr+5im4duFtLz8S2iW8TCN9dzU353y0EIpPQGwR+Ciqe2K5FG3obtKtCgDv7umuyIT4nqZtDhwuYy7ZjBPYGZbfUzPKJS47GPme4OoCpyiCL6jUn1kZeYGXPw2fKRu3B0Hrs1yD/QnSAlXmUQOLgDMPSt4V1M6eyLGYA4YIvtaf13js2cyvImueVChZzO9gxeMzJpJU3p+HUvtvaxS0kxDZlBrNlmr0H6JlIs17/UI8nmP7WkRTQ67ww+3v5LCXVQ9qNnA+TvYcwEX5ESyDLzDWEjD79nT7YmOgKmvBh9//XH3lUHiIQIrnetos9XHyK9tYMSMtda1bb+lRQWdlzUmXl5K4T8d9fPFu1QoMfL922BAKQdmDjtEO092JY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(336012)(6916009)(426003)(1076003)(70586007)(7696005)(5660300002)(9786002)(36860700001)(36756003)(186003)(82310400004)(316002)(36906005)(508600001)(8676002)(83380400001)(70206006)(54906003)(2906002)(44832011)(8936002)(47076005)(7636003)(356005)(6666004)(26005)(4326008)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:34:43.4397 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c6368ed8-28cb-4ec2-3d9f-08d9ae6cdcec
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT011.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7097
Received-SPF: pass client-ip=40.107.220.46; envelope-from=figlesia@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

Implement the DMA control interface for allowing control of DMA operations
from inside models that contain instances of (and reuse) the Xilinx CSU
DMA.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/dma/xlnx_csu_dma.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/dma/xlnx_csu_dma.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574d..9ed6e82225 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -277,6 +277,11 @@ static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
         s->regs[R_ADDR_MSB] = dst >> 32;
     }
 
+    /* Notify dma-ctrl clients when the transfer has been completed */
+    if (size == 0 && s->dma_ctrl_notify) {
+        s->dma_ctrl_notify(s->dma_ctrl_opaque);
+    }
+
     if (size == 0) {
         xlnx_csu_dma_done(s);
     }
@@ -472,6 +477,29 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
     return val & R_ADDR_MSB_ADDR_MSB_MASK;
 }
 
+static void xlnx_csu_dma_dma_ctrl_read(DmaCtrl *dma_ctrl, hwaddr addr,
+                                         uint32_t len, DmaCtrlNotify *notify,
+                                         bool start_dma)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dma_ctrl);
+    RegisterInfo *reg = &s->regs_info[R_SIZE];
+    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
+
+    s->regs[R_ADDR] = addr;
+    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
+
+    if (notify) {
+        s->dma_ctrl_notify = notify->cb;
+        s->dma_ctrl_opaque = notify->opaque;
+    }
+
+    if (start_dma) {
+        register_write(reg, len, we, object_get_typename(OBJECT(s)), false);
+    } else {
+        s->regs[R_SIZE] = len;
+    }
+}
+
 static const RegisterAccessInfo *xlnx_csu_dma_regs_info[] = {
 #define DMACH_REGINFO(NAME, snd)                                              \
     (const RegisterAccessInfo []) {                                           \
@@ -696,6 +724,7 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
     StreamSinkClass *ssc = STREAM_SINK_CLASS(klass);
+    DmaCtrlClass *dcc = DMA_CTRL_CLASS(klass);
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
@@ -704,6 +733,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     ssc->push = xlnx_csu_dma_stream_push;
     ssc->can_push = xlnx_csu_dma_stream_can_push;
+
+    dcc->read = xlnx_csu_dma_dma_ctrl_read;
 }
 
 static void xlnx_csu_dma_init(Object *obj)
@@ -731,6 +762,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
+        { TYPE_DMA_CTRL },
         { }
     }
 };
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 8c39e46f58..f7f086593c 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -23,6 +23,7 @@
 
 #include "hw/ptimer.h"
 #include "hw/stream.h"
+#include "hw/dma/dma-ctrl.h"
 
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
@@ -45,6 +46,9 @@ typedef struct XlnxCSUDMA {
     StreamCanPushNotifyFn notify;
     void *notify_opaque;
 
+    dmactrl_notify_fn dma_ctrl_notify;
+    void *dma_ctrl_opaque;
+
     uint32_t regs[XLNX_CSU_DMA_R_MAX];
     RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
 } XlnxCSUDMA;
-- 
2.11.0


