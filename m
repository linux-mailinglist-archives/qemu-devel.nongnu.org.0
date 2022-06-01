Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 025D853ABEC
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:31:12 +0200 (CEST)
Received: from localhost ([::1]:50438 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwSBa-0001VT-Me
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43540)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4r-0000eL-1e; Wed, 01 Jun 2022 13:24:13 -0400
Received: from mail-bn8nam04on20615.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::615]:56356
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4o-00072r-SE; Wed, 01 Jun 2022 13:24:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBzy3LGEF9zYdJYsk5AGF+Q3HruCiL2Rrkj9Cr3cWanuEdB5vVjJD2MP3RwwF3sBbi4RYSqI3e5l993S2FdgHm3XZKZeam+50/uEXLvYkS9yG2z3uFwh99uz5twnDGJDWNOjJ6jQKlXRpXBxfomgVQDBBrvB63Qm8bX+AZUgkAii2S/iwJFA8+wpvmLAA2V07iXHLnKIrgySOHDegWOWDQZY/z6zrKT6C9WeYD/wj/nJ/wArTWBwkzezIxZY/9FxJuSHVLyxmW7/pZxp4enf9n8FUoOXer2gfeZFwFsdtWSXkay6mGs3+K0NESGkU3cH2x+L3cU/WWs3Mo4KjkzqoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sUurebytVgqGNUeud3JCSExqdIkheL1R4FKnMDtoOv8=;
 b=TQGam09UjUYWjgSmRXObHoM24LgdIkld3kp08ppFQSTQOMgL16AWV4AR2HtIdypqrwAPDnfJzT7tapoKDCixSkHsK+g9sRX39FH7xpOrLPao1VCa02jsCvitbdM/lvgTMicUjVW6If41gCu8WLb9G0y4EdlgYoQY1k5Eon6igoGrN+SQgUbwXcMNxQSPB4pkJ1/B6jXLuqLC50MTJLTm4vrxMiiPZslJaPBBr/H3+OFPiq4XzEQVFyBInlh1mNIHhHv5vGWFq/rbMlyG3s3bzfeMo+vbS7Cvm/Zifk16jvP03xufpL8kkbdEJHWTVPzN50an5b+Yfw7BKW8OB1M9oA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sUurebytVgqGNUeud3JCSExqdIkheL1R4FKnMDtoOv8=;
 b=LNck3sMx6zUb1QKItbQMIrFeG+x+C+NGNlai9z2I/yZADdKT5ydt2X7XfXGoHwziz4gl5ikbdZgZhOwMNKEOju0cS+Gf8BJbYEaPF06cKAPIm5Yu1LU4zRW48MHxwasMvFWMt/6ONQ83cZXSazxNKuPHoEyzjLK4BwHZ0tAYuZc=
Received: from SA0PR11CA0198.namprd11.prod.outlook.com (2603:10b6:806:1bc::23)
 by BL0PR02MB5476.namprd02.prod.outlook.com (2603:10b6:208:83::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12; Wed, 1 Jun
 2022 17:24:07 +0000
Received: from SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::93) by SA0PR11CA0198.outlook.office365.com
 (2603:10b6:806:1bc::23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.12 via Frontend
 Transport; Wed, 1 Jun 2022 17:24:07 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com; pr=C
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0041.mail.protection.outlook.com (10.97.5.44) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5314.12 via Frontend Transport; Wed, 1 Jun 2022 17:24:06 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Jun 2022 18:24:06 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Jun 2022 18:24:06 +0100
Received: from [172.21.132.221] (port=53720 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nwS4k-0004Ck-9S; Wed, 01 Jun 2022 18:24:06 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, Sai Pavan Boddu
 <sai.pavan.boddu@xilinx.com>, "Edgar E . Iglesias"
 <edgar.iglesias@xilinx.com>
Subject: [PATCH v3 2/4] xlnx_dp: Introduce a vblank signal
Date: Wed, 1 Jun 2022 18:23:51 +0100
Message-ID: <20220601172353.3220232-3-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601172353.3220232-1-fkonrad@xilinx.com>
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 573c489f-9aad-468a-85d2-08da43f38882
X-MS-TrafficTypeDiagnostic: BL0PR02MB5476:EE_
X-Microsoft-Antispam-PRVS: <BL0PR02MB54763EE6DD7B4E7AA501BEDFCCDF9@BL0PR02MB5476.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7uqZaHGFmY0JJsmtjG/k6q3JNQ1oEZCtoJ4oVHfLTbWXGlifrpTWATHJoY4cFOllUr4FpCN7JxpaUCJvXD7+75nOQ/+M0bBiQICfQYF4kglQQ0+IACY/ftpnf+ZQiNhxUOzD8HFumRa2oLFRIQyPi8n7m2sWXPemzYACOou0ytT+O7zfmU8JRgtcuYDU0yYnrgqmmiqj9Eildlp3UxLvHCCbRrjJP9pGiFuMJqDXgiL7MP66n8UuojxSbCGwXlNnwSuXRM62ehyN7WOxTl0G4+IWWrtp14VV3SbStCgGrgbXrXjSTtF+OXkt7Z4kQAsGd10WFYTYNqs2bZciRkQU27syqWD7uiOvF0MQw5gTUv93K6cCIPxcl59ZCqCVuEtrm4K1mWk7UO3SC0m3PuWG5VAaQy0U2Mh9f29mjEJog6WmOlVyW2glk9b1uMVuhvTtkTKQ9N1Zgej5EpYB61aI/p6ikFPfwYW2KEu3n8YzVL2OqHhgmcRpVkeg0GQGrwliwWWMr0RvW261A6J2fO0tBTma7jkCEa1Jx4GRW3PANq5H1OsH1zH2DCAImxtGkeHRh0Pw2BRZUSWyfUWmrPdx+1F/wcikewrbT39k5lFGEkTSulgYbHD+hzN7oiTrRB0mHpmc9v1a0ACG1U7J2J7iNDFLfxF/ZxvYtpgi8hGMiOeiluCqoB4xbweYQHZMr8Ea1iGNeyFihjKUIp3OXWAVlg==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(46966006)(40470700004)(36840700001)(2876002)(2906002)(508600001)(426003)(316002)(7636003)(6916009)(54906003)(6666004)(40460700003)(82310400005)(107886003)(186003)(1076003)(36860700001)(7696005)(2616005)(26005)(4326008)(36756003)(8676002)(70206006)(356005)(70586007)(8936002)(5660300002)(9786002)(336012)(47076005)(83380400001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 17:24:06.9903 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 573c489f-9aad-468a-85d2-08da43f38882
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR02MB5476
Received-SPF: pass client-ip=2a01:111:f400:7e8d::615;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM04-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Add a periodic timer which raises vblank at a frequency of 30Hz.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Changes by fkonrad:
  - Switched to transaction-based ptimer API.
  - Added the DP_INT_VBLNK_START macro.
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
---
 hw/display/xlnx_dp.c         | 28 +++++++++++++++++++++++++---
 include/hw/display/xlnx_dp.h |  3 +++
 2 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 0378570459..d0bea512bd 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -114,6 +114,7 @@
 #define DP_TX_N_AUD                         (0x032C >> 2)
 #define DP_TX_AUDIO_EXT_DATA(n)             ((0x0330 + 4 * n) >> 2)
 #define DP_INT_STATUS                       (0x03A0 >> 2)
+#define DP_INT_VBLNK_START                  (1 << 13)
 #define DP_INT_MASK                         (0x03A4 >> 2)
 #define DP_INT_EN                           (0x03A8 >> 2)
 #define DP_INT_DS                           (0x03AC >> 2)
@@ -270,10 +271,15 @@ static const VMStateDescription vmstate_dp = {
                              DP_VBLEND_REG_ARRAY_SIZE),
         VMSTATE_UINT32_ARRAY(audio_registers, XlnxDPState,
                              DP_AUDIO_REG_ARRAY_SIZE),
+        VMSTATE_PTIMER(vblank, XlnxDPState),
         VMSTATE_END_OF_LIST()
     }
 };
 
+#define DP_VBLANK_PTIMER_POLICY (PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD | \
+                                 PTIMER_POLICY_CONTINUOUS_TRIGGER |    \
+                                 PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
+
 static void xlnx_dp_update_irq(XlnxDPState *s);
 
 static uint64_t xlnx_dp_audio_read(void *opaque, hwaddr offset, unsigned size)
@@ -773,6 +779,13 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case DP_TRANSMITTER_ENABLE:
         s->core_registers[offset] = value & 0x01;
+        ptimer_transaction_begin(s->vblank);
+        if (value & 0x1) {
+            ptimer_run(s->vblank, 0);
+        } else {
+            ptimer_stop(s->vblank);
+        }
+        ptimer_transaction_commit(s->vblank);
         break;
     case DP_FORCE_SCRAMBLER_RESET:
         /*
@@ -1177,9 +1190,6 @@ static void xlnx_dp_update_display(void *opaque)
         return;
     }
 
-    s->core_registers[DP_INT_STATUS] |= (1 << 13);
-    xlnx_dp_update_irq(s);
-
     xlnx_dpdma_trigger_vsync_irq(s->dpdma);
 
     /*
@@ -1275,6 +1285,14 @@ static void xlnx_dp_finalize(Object *obj)
     fifo8_destroy(&s->rx_fifo);
 }
 
+static void vblank_hit(void *opaque)
+{
+    XlnxDPState *s = XLNX_DP(opaque);
+
+    s->core_registers[DP_INT_STATUS] |= DP_INT_VBLNK_START;
+    xlnx_dp_update_irq(s);
+}
+
 static void xlnx_dp_realize(DeviceState *dev, Error **errp)
 {
     XlnxDPState *s = XLNX_DP(dev);
@@ -1309,6 +1327,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
                                            &as);
     AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
     xlnx_dp_audio_activate(s);
+    s->vblank = ptimer_init(vblank_hit, s, DP_VBLANK_PTIMER_POLICY);
+    ptimer_transaction_begin(s->vblank);
+    ptimer_set_freq(s->vblank, 30);
+    ptimer_transaction_commit(s->vblank);
 }
 
 static void xlnx_dp_reset(DeviceState *dev)
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 1ef5a89ee7..e86a87f235 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -35,6 +35,7 @@
 #include "hw/dma/xlnx_dpdma.h"
 #include "audio/audio.h"
 #include "qom/object.h"
+#include "hw/ptimer.h"
 
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
@@ -107,6 +108,8 @@ struct XlnxDPState {
      */
     DPCDState *dpcd;
     I2CDDCState *edid;
+
+    ptimer_state *vblank;
 };
 
 #define TYPE_XLNX_DP "xlnx.v-dp"
-- 
2.25.1


