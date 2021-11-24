Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C712045B870
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:34:19 +0100 (CET)
Received: from localhost ([::1]:34008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppbV-0003GG-SJ
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:34:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44922)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKH-0002AZ-Kv
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:29 -0500
Received: from mail-mw2nam08on2088.outbound.protection.outlook.com
 ([40.107.101.88]:18080 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppKF-0002xr-IB
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:29 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aBBoKSGvoue3FsgCGYHOUFKnQp/YkyCee3rsj2AwbT3TrKuwqMIBq8DInfzY0I4UycsZJsPAeR/hLGW0X9l8WvOtuJtIhw2ZYZFeDkiLPDQtdmlMLdiU5GYcMZwzLgYwQbPUIxrNtdapVm987eLbQlQHQUFtHo4JicERhRdplf8vhlLYFxu9V17SvukGVmi0Bt6k+3rmDUL+D+YaCTCk/4lKJJ0++soIfWjYiRKlXG0WJKtjAnUkqyaTNBIPNzjULAoJphUmNgehaEtyX+Tzl1W3FvJLC2Etm5zdpJwc4eoVvX1SgV9vJMgIj+OOumT7V6cx3Puogl9r7SubGk25cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EJLSHEYWTNvm3hNEtCvE0Mv1XP8DmGPUQXfRU4XjysM=;
 b=LARL5aIFpOJWGVVPTQdJMu0kaqrQA3XQAPN4MOROrZogvPlJ2r3pKJTlnE6uQH3nodv+MBXRYdAaG+XbpUt5OxOWWkliZr3JheX6XzT8rb36ydQgCmQ4LSxVypAC++0nqCIkh5y5j+wkHk1fv1K/P6ljb6Abf5/4r13yjB/ulHzmwEKErBYhX47jMvBgvbsK4Hn4dBP9CIICdz5nTCoMv+N9Wtbge8tia+zJYxtrcdTfrV9gdzM9n15f/OlbTAKbVMcrfqxc+ZsVxFpSmN2PIWiclgcM6zwSgBiRcgVwa6MKV1ITfcs9O1yDLrxs2rmH60LR9WH+uXx/kF3ZVPpMMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EJLSHEYWTNvm3hNEtCvE0Mv1XP8DmGPUQXfRU4XjysM=;
 b=dx35XCs2NJO4BLn5eSP2uGNJOIy5XpPKs3aBHbQ9tn5rNvcct91UTVXA/Aj18HXxEwscjoIFIA7fyQKTOBwKxuFq3CzIio+rQ3IdPQhuD+jLOfy/R4OgVAPnPIktJeJKGSPRql9J77WMDlrFA/k0/ari/s//yUZu03WuGT8KGfw=
Received: from SN4PR0401CA0041.namprd04.prod.outlook.com
 (2603:10b6:803:2a::27) by CY4PR02MB2437.namprd02.prod.outlook.com
 (2603:10b6:903:71::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.24; Wed, 24 Nov
 2021 10:16:24 +0000
Received: from SN1NAM02FT0038.eop-nam02.prod.protection.outlook.com
 (2603:10b6:803:2a:cafe::c1) by SN4PR0401CA0041.outlook.office365.com
 (2603:10b6:803:2a::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.20 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0038.mail.protection.outlook.com (10.97.5.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:07 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:07 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppJv-00036z-DV; Wed, 24 Nov 2021 02:16:07 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 05/10] hw/dma/xlnx_csu_dma: Implement the DMA control
 interface
Date: Wed, 24 Nov 2021 10:15:50 +0000
Message-ID: <20211124101555.1410-6-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 355ab76f-1e07-4cfd-c0cd-08d9af3377d1
X-MS-TrafficTypeDiagnostic: CY4PR02MB2437:
X-Microsoft-Antispam-PRVS: <CY4PR02MB24370FE13CD3161E69BB13C4AD619@CY4PR02MB2437.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:751;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: eev8lL+L0Nthf8Vj+U0KfRyxcC6TUplaYraPFcNmKDLGuldE+5NgIbGkofLILCJuyatwkJwcAAMJIoEQ9U1B1VEZSbYFyrX9V6W3m/EPqR4awCPL4ut3xcoMh7ncOFv8558lLcVlOzkohOJ1pfSzru8exOy9AZ8QWiqr47lyOMylMdZbd97nw3ahNun+jURz3LNEH1zBJNLLWrclrQviq2K9PtS4ghhVR2oWF5WVCsLvvdf8e33Kd4LKiCrWnBhWW4/D0ChFmbBMAFZiVz2n6kevGKeX20j09CE0hWxZuD4RL7iG5ZY0YKfAvZfc+JClFJenTKyu2BRoJsN8xzjQXbzu/ed+pfxle55h4tJ2/K6tPIB5kJdS4Q94/syvCU8JwRUtOV1mL9cyK+ajGNXtxcgfK6wZlAzx85tjJ9+bvl16ksjEF30glbT5lEeK8sb9kMXslHK0TtHe5ZVzAWjmbEo0mKthTBNquErr3W4nvpPYC3jttYJgG0DZYsot1s3hpzHk/rpJ1RV3lMFY/Zyji9G9Cbz0PfP4mGqir2rZN6WgfixPQfqOmAzkLQamyZqVWYxHmDe4srOEJKuZt8otJjMx/T81YzTAlD9BRWk6QOxsnuGvzdd2/7BauOUkzQR+4yQcjNIXWl+okLX7sQopB25wq7tF9UeTA59MFRX/ukHGWl4xbVkgADrJNjDoU/9FAQJlV0ffphZrAzYlN0bdJhiM8WYrZMzZGrR5m1Ww1HY=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(54906003)(356005)(44832011)(2616005)(508600001)(7696005)(1076003)(336012)(7636003)(36756003)(2906002)(316002)(4326008)(70206006)(70586007)(26005)(5660300002)(186003)(83380400001)(36860700001)(6916009)(6666004)(8676002)(82310400004)(426003)(8936002)(47076005)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:23.7254 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 355ab76f-1e07-4cfd-c0cd-08d9af3377d1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0038.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR02MB2437
Received-SPF: pass client-ip=40.107.101.88; envelope-from=figlesia@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 28806628b1..18cb45a024 100644
--- a/include/hw/dma/xlnx_csu_dma.h
+++ b/include/hw/dma/xlnx_csu_dma.h
@@ -25,6 +25,7 @@
 #include "hw/register.h"
 #include "hw/ptimer.h"
 #include "hw/stream.h"
+#include "hw/dma/dma-ctrl.h"
 
 #define TYPE_XLNX_CSU_DMA "xlnx.csu_dma"
 
@@ -47,6 +48,9 @@ typedef struct XlnxCSUDMA {
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


