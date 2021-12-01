Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D41A4651F2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:44:13 +0100 (CET)
Received: from localhost ([::1]:38576 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRmG-00062u-40
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:44:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48856)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRj0-0003jW-Qv
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:50 -0500
Received: from mail-dm6nam11on2052.outbound.protection.outlook.com
 ([40.107.223.52]:12451 helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRiy-0000A5-VE
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:50 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bnOgpO3bISopQEWDti3YJjb+nNF3fLdno8eXxwsv+R+XhZLncF+FZudEnWXp2Gq/1a5ysxBktBh3M1sqUxvSjzluLhcUGLyhLPYkCX9/ABRP9qbxwg3dM66XPb/hjMMKYgfkAa3Jj4zMWJl7jr1Fl8xlqoo0sLNWcbz7BVEJpGrz6r9btKAmJ0zFZQVss7PK351N1XPz+kxEGC9myMkGv5aFKxXJZ5BCLuIzhu4GZEhcdKNtI36xz2B3xphrrdqaHTWGSR7SU5m1VE7CHHWkEtiVCeBE7ZWyLp/gz9l/w+W2ec+3E6aK9A1tg5Xzsr8o/aUbY1yHq9jMqRXxm8cjqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5rrvNUq7PzdiFtosL1qiq4GwjwjOyXykREE2sOmFNnE=;
 b=FUxGKkM6xrEbdIeBdL/IdzaMYNoNoD4aBGgupSwqpjhANwgNC4DCgacTDs/B7MIWvwu4xnupNAmdkkqnkL13L+q8iitwrKE+/OHtWbyLsRk/e/sxQldCXvHaRvCwq6aliMapRs7Wsb8BfINcBmvd+UjIv2JvK5dRxz5Fho+wltuRArDSz9xqtDEGOBT+I0jFR6ovzpQ2g8A4h7J4gRqVdcMn2Xt9+nE7pjlyggiL3XRpesfWwKNaD/o7JwvQVddX3RSJDfwTIedQrAhl1M4/YTvY5muLdCE7RJ7QgBDU6SekfbialrAcKt8y38LKyjYu2hpMneqbVQP+fHUTyBI9Mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5rrvNUq7PzdiFtosL1qiq4GwjwjOyXykREE2sOmFNnE=;
 b=qCeakjUj0PMx9SCo1bIf6oPIjRYPOdG3zWfjrqNHsHT2zc9QOoSQHVzBjLwpGojfXHRNME0C7KnLrTFwZ4/hG6aSwWNEeXqhBuPWzNnqyYE6E0nN0IPY1DvtJBRvy/LFdGNlc4Lwak59Qa5tujHgjYX1AgTEYAY8Imq2FRXLBn4=
Received: from DS7PR03CA0287.namprd03.prod.outlook.com (2603:10b6:5:3ad::22)
 by CH2PR02MB6678.namprd02.prod.outlook.com (2603:10b6:610:a4::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Wed, 1 Dec
 2021 15:40:46 +0000
Received: from DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:3ad:cafe::6) by DS7PR03CA0287.outlook.office365.com
 (2603:10b6:5:3ad::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT061.mail.protection.outlook.com (10.13.4.230) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:45 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:36 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:36 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRil-0002FY-W0; Wed, 01 Dec 2021 07:40:36 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 05/11] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Date: Wed, 1 Dec 2021 15:40:17 +0000
Message-ID: <20211201154023.13931-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 611de4d8-36be-4e91-baf7-08d9b4e0f112
X-MS-TrafficTypeDiagnostic: CH2PR02MB6678:
X-Microsoft-Antispam-PRVS: <CH2PR02MB667822BBFAE2E1C79B91B5E1AD689@CH2PR02MB6678.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: syRS0HUjx7p1JL8+j6lhc0E5iNXkyem1g0qCn3q4ZHppwtEj1YlzWj9WoZdkPczB1KFt6fS9YBX+IjIRfViiLVKDhjfRO8qL4WmpkPUMazVxMXTL2H+haTvI2OGeIdpsKiLtSE223RN/1PsTD4pyN3/rcCjPYY9iMaZa5vrS6bFLwoqJWexY0X/ptHcwosp/dCxGoGtdzZOwwmSOiLHzalwlqcj6z1Ae5K//HS8VPHkkwIcPW15OQRKWWOwQOObPrBTt88g4xiBtWaqxMYj1SWiRSmWwBX3AN2id3eL+FQcjQKweIF5wnHZumKQrs1kGiPLwXxCN1q8ylWtPFQTP8mJQXy+dH4+GR6LfM1TQMggURBmWzBoAZQ4TS3Wh/a65tEDCV+hxLjuA1dPzsqRVZ1SqByix5kyMWLWQwBL8xL5Fe6YXUx1GwaN5CQc+Wfnyj5iXhUadWhD41j1ALhMB3o1vVHvbi3BrTFz8Zdj9OZVhdGrlWINvizjSHDp4D4nRwxdYyDtaP26QNW0JxoGwtWYKmIdUFMDGvGlURA8Fm5QNYPkuYwG9mI+ZvOu3r036apn1KIGZOOHtwGSjtG2f5//rtDwLVMTW1kq9Fn6yXDxkJ6x2Qo+OF/hg8b1aBpxV09OBP0EHoq+fMaFOX0iuNii0rIgLRsu2kARnepYTtwx2L2165+1mMmbTOzmv0ncWJrKKwpvsGMqHd/mtS7+z9GtaANsyMsHM6UoFxLgISQA=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(7696005)(54906003)(8676002)(6666004)(356005)(4326008)(7636003)(5660300002)(70206006)(82310400004)(70586007)(8936002)(36756003)(2616005)(2906002)(186003)(1076003)(316002)(426003)(44832011)(36860700001)(9786002)(26005)(47076005)(83380400001)(336012)(6916009)(508600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:45.8908 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 611de4d8-36be-4e91-baf7-08d9b4e0f112
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT061.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR02MB6678
Received-SPF: pass client-ip=40.107.223.52; envelope-from=figlesia@xilinx.com;
 helo=NAM11-DM6-obe.outbound.protection.outlook.com
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
 hw/dma/xlnx_csu_dma.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/dma/xlnx_csu_dma.h |  4 ++++
 2 files changed, 36 insertions(+)

diff --git a/hw/dma/xlnx_csu_dma.c b/hw/dma/xlnx_csu_dma.c
index 896bb3574d..e3eb0e9d52 100644
--- a/hw/dma/xlnx_csu_dma.c
+++ b/hw/dma/xlnx_csu_dma.c
@@ -277,6 +277,11 @@ static uint32_t xlnx_csu_dma_advance(XlnxCSUDMA *s, uint32_t len)
         s->regs[R_ADDR_MSB] = dst >> 32;
     }
 
+    /* Notify dma-ctrl-if clients when the transfer has been completed */
+    if (size == 0 && s->dmactrlif_notify) {
+        s->dmactrlif_notify(s->dmactrlif_opaque);
+    }
+
     if (size == 0) {
         xlnx_csu_dma_done(s);
     }
@@ -472,6 +477,29 @@ static uint64_t addr_msb_pre_write(RegisterInfo *reg, uint64_t val)
     return val & R_ADDR_MSB_ADDR_MSB_MASK;
 }
 
+static void xlnx_csu_dma_dma_ctrl_if_read(DmaCtrlIf *dma, hwaddr addr,
+                                          uint32_t len, DmaCtrlIfNotify *notify,
+                                          bool start_dma)
+{
+    XlnxCSUDMA *s = XLNX_CSU_DMA(dma);
+    RegisterInfo *reg = &s->regs_info[R_SIZE];
+    uint64_t we = MAKE_64BIT_MASK(0, 4 * 8);
+
+    s->regs[R_ADDR] = addr;
+    s->regs[R_ADDR_MSB] = (uint64_t)addr >> 32;
+
+    if (notify) {
+        s->dmactrlif_notify = notify->cb;
+        s->dmactrlif_opaque = notify->opaque;
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
+    DmaCtrlIfClass *dcic = DMA_CTRL_IF_CLASS(klass);
 
     dc->reset = xlnx_csu_dma_reset;
     dc->realize = xlnx_csu_dma_realize;
@@ -704,6 +733,8 @@ static void xlnx_csu_dma_class_init(ObjectClass *klass, void *data)
 
     ssc->push = xlnx_csu_dma_stream_push;
     ssc->can_push = xlnx_csu_dma_stream_can_push;
+
+    dcic->read = xlnx_csu_dma_dma_ctrl_if_read;
 }
 
 static void xlnx_csu_dma_init(Object *obj)
@@ -731,6 +762,7 @@ static const TypeInfo xlnx_csu_dma_info = {
     .instance_init = xlnx_csu_dma_init,
     .interfaces = (InterfaceInfo[]) {
         { TYPE_STREAM_SINK },
+        { TYPE_DMA_CTRL_IF },
         { }
     }
 };
diff --git a/include/hw/dma/xlnx_csu_dma.h b/include/hw/dma/xlnx_csu_dma.h
index 28806628b1..b1b7772250 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -25,6 +25,7 @@
 #include "hw/register.h"
 #include "hw/ptimer.h"
 #include "hw/stream.h"
+#include "hw/dma/dma-ctrl-if.h"
 
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
@@ -47,6 +48,9 @@ typedef struct XlnxCSUDMA {
     StreamCanPushNotifyFn notify;
     void *notify_opaque;
 
+    dmactrlif_notify_fn dmactrlif_notify;
+    void *dmactrlif_opaque;
+
     uint32_t regs[XLNX_CSU_DMA_R_MAX];
     RegisterInfo regs_info[XLNX_CSU_DMA_R_MAX];
 } XlnxCSUDMA;
-- 
2.11.0


