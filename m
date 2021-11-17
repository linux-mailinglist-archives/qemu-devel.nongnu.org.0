Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94C464548A4
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:24:26 +0100 (CET)
Received: from localhost ([::1]:45762 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLrN-0000xq-Ni
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:24:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49866)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmQ-0000TI-DQ
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:18 -0500
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com
 ([40.107.94.58]:55136 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLmO-0004Y9-J6
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:19:18 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PMGKcHGQmtQsW9/d6VrFYdaTH56I/WKOMeJqGV5HECLo2S4otMXtRmkgyVni397Q35caaIrgqTMKAOYNnlbvxggP9BOdFuCxA2uHepBx9tEFHJwtkU1i8z1+79OQebNA3k8bom8YWbQHy8nmxrF5Vj8PetvYetR/djfu+VxoBlJuuF7KcmegMgrgtkdFyeGZtBUeZmorQqg7+2rRybIkwLhnZjJsotEtDHpOBW+2EkuIuqNq6TqCLieGUe4IhZklkKQPazbUsxsnnoHOHKJ7VVgmD2MRU5MnmrotsHXZ1QWMKAo3NoenL+F9nOxjU2wk7pdgIsoZ2X18zLrJ7rm0zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1nqx2GnWPGS0k9Bml3XdA8OAbRd8tbY23BzVFbF9e9U=;
 b=gZYbP6mVq8mQRGzykvKwcfgGoq8N7SuQ7//Gi0is/FpSTub3zdeAGEAJz8oRyFj4lzWscFCIlHiSQ2OSrxWgoOMKdisW9dx3zHYQp6g4nA8DbfjcDSqOppll+1GM4twm3iAwboFV9vJVCMo7fBH5ZNeJQnxOt6MYTo8s2poHfjntGwogS2wThxkViqpE4OQ0gZvWRKbBXTc8XLLpX/m/nXWDZXdMEb3+GfmikQOfxS7jAe7H8vESlhzMgqWY+sp5YlVI21AdhG3eOogbLtP+1S4yZshSEeDiAROR83ZAAmwWyg/iYzEYvVZLtZW4mSznto7LFqbh7hkdmQtNMDAKqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1nqx2GnWPGS0k9Bml3XdA8OAbRd8tbY23BzVFbF9e9U=;
 b=jwreSiAVZgBwczwboIzL8CB2CRBk7Dedeuf0nDBB+edHzjTSGK9KyaidMScwIMgveTS8/BmbRSXgIfaEiiXKlV+35px1R1Mlv57bzqUT+jXdRYVqg8gwgC0ER8m0wfsYkq57Z17UtE2FMmxDN4BkMxI1QlKUvxNmKJpHulpArxg=
Received: from BN9PR03CA0801.namprd03.prod.outlook.com (2603:10b6:408:13f::26)
 by SJ0PR02MB7392.namprd02.prod.outlook.com (2603:10b6:a03:295::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Wed, 17 Nov
 2021 14:19:13 +0000
Received: from BN1NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13f:cafe::e9) by BN9PR03CA0801.outlook.office365.com
 (2603:10b6:408:13f::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Wed, 17 Nov 2021 14:19:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT048.mail.protection.outlook.com (10.13.2.157) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:19:13 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:52 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:52 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLm0-000Dy8-7M; Wed, 17 Nov 2021 06:18:52 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 5/9] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Date: Wed, 17 Nov 2021 14:18:37 +0000
Message-ID: <20211117141841.4696-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: aeec565e-913d-4065-1681-08d9a9d53b03
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7392:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB73928DA941DEC0770A078DD1AD9A9@SJ0PR02MB7392.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7FkKVUE00KvRKghMe/K5/KlCMETWavsK3HvZylmfiDF7Evd2HUgWks1o1uWW6P5QpnZEwA2GSxFujU1g6Yult/EArRl0AnZnSDyTKzQIcLF9y0daTYZCYxEunSq/+bIe9YakHnf/TwuE9lnEKCd3CKpzcxEIqMxtLd/BeSAD9bl8YURUUxtMoVdfn5Y/GvkfbBtVzN2ksQMMID071AqGsmZqnF3LLRT+4xhwEo20o3JGfKQgEnW2HH67f/PHdnztl6CFxjtCjyUY24k+ejJsp11/ovkNrovdk1pWk9tWuSdOLRcawur0+MPmrByLAUTeDtj+mq6Ff267z9rE/Rse0r9JanI6d30UuCrgVRn6XPmK+2LLS2sIv0Etx5MLtez1SqMunpxByPDDYjYa1Tv2i0raiE2cWtSrUgtwgiHz+Xrs3xdDjjJSdcyLnS2fokjRV+T+3QLoHn9cpXuWVrf5DQ6iNe1Vn7xH090kFqbBmtMMejbIfQH9x5zCayYBgwyjwMz+kMc21JKRx5GAR9oRTHduDFfP8Uij7BWIcZ1IMwWxj0Wq5pV0P0emVwus9Qyia6xL3kpfKL17ilMiVvVVR5wCCLbpmnTwyDPU5dDS27wCtQufPCvZwMeulFuCgzKzREtv5+GHAXzvlm8tooeVK10HIpmCbY6DAdGA5btbhSqtTeCxCsYTLQTPmY+3JMK8KT/Ui244coTQenIczkNfPTR6VzE1wFrp8UmOOYsnCz0=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(47076005)(54906003)(9786002)(36860700001)(8676002)(6916009)(26005)(6666004)(83380400001)(2906002)(508600001)(316002)(8936002)(5660300002)(7636003)(186003)(36906005)(356005)(426003)(82310400003)(1076003)(2616005)(36756003)(44832011)(4326008)(70206006)(70586007)(7696005)(336012)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:19:13.1332 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aeec565e-913d-4065-1681-08d9a9d53b03
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7392
Received-SPF: pass client-ip=40.107.94.58; envelope-from=figlesia@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, peter.maydell@linaro.org, alistair23@gmail.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the DMA control interface for allowing control of DMA operations
from inside models that contain instances of (and reuse) the Xilinx CSU
DMA.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
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


