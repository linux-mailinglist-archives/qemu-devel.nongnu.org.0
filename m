Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E8EB75188C9
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:37:50 +0200 (CEST)
Received: from localhost ([::1]:60864 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nluaz-0008AO-M4
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:37:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58432)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQu-00036L-Vw; Tue, 03 May 2022 11:27:25 -0400
Received: from mail-dm6nam12on20606.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::606]:53216
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQs-0003p9-Um; Tue, 03 May 2022 11:27:24 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrb6cVTin8OUczo3ktf9N9SEkM2GSOFMzxcyF1V/uzCzc3KUCTm0cXWdeWGoXHn66/XInqZ7XlJyhcZtCTHuzQicPitAtm1AK5Er3lLor2sk5/z90IYs1zFg9IjPLNqGgmsI9D512cF0ftfCeeEsgfu1V1yByPSSNolMDz1uyRjlW0O9jApt0D2tvfe6o+lgNIm/AMJlMLlFUxJozAHYyS4/ax87B1VqbHnQx5yPoN6Cyf+ypFOTnlYMllvMh1PgoPzVAg+9SqYkE4xdbXZ7pghEev0285X3QE+520LGE31Ft47jMl7ePCIIovcSB9GZv2tXuDxTM0/f2nMqKtvnvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JQjc8gCtHYX7GVeslX8wR6/K0nZXB8efsmstONP9ml0=;
 b=Z4DNNyvxspPgtTot2//fjv85oxVDpuYMjlaXvLqt2GgdXW3RFrjBA6FVZ3UCYiABtBC8igpNokz1E71zBR2K1uTWkECR7e/pQc9EHsFdkLZtgzfcYeqXP6x4BGVZ1b6QCq9ox0SHlAJTJqBvFAsB0KUoeEtmZQ0kXdtwpxm2eonBH6mOneSINUShKFCblYJGH+2GXjnipKQFCWEQqguxGBic/7/zBSQp00BFitWcf/chran015jKZsjdnGGFgSsHwdxQR3WqVBGhtguFjgtfuIDI/GAhtJtkJO0M0tQPmPtPg/vOeTkRlZeChufIrnAzkXZ3JdxH9iSGGS7mxDJc9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JQjc8gCtHYX7GVeslX8wR6/K0nZXB8efsmstONP9ml0=;
 b=XRRv+MF4AQHLIaLgIO8N/zcrzoqI9wBo9zrwV7+9pMIb/cKDvjWMontqij4HNW8c4Bw1l95vMJ+RGGajwBx1H9J37ubXxZW2R7IBR//FmHZWqAq9cIbM3sBmd+6ZYUsjLggwdBvPzy4W+cDRIg34lB0ivpk87lcZfid61tHXITE=
Received: from DM6PR13CA0044.namprd13.prod.outlook.com (2603:10b6:5:134::21)
 by BY5PR02MB6179.namprd02.prod.outlook.com (2603:10b6:a03:1fa::31) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.15; Tue, 3 May
 2022 15:27:18 +0000
Received: from DM3NAM02FT039.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::19) by DM6PR13CA0044.outlook.office365.com
 (2603:10b6:5:134::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5206.13 via Frontend
 Transport; Tue, 3 May 2022 15:27:18 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT039.mail.protection.outlook.com (10.13.5.22) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:27:17 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:27:16 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:27:16 +0100
Received: from [172.21.132.221] (port=36824 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nluQm-0002mH-4m; Tue, 03 May 2022 16:27:16 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <alistair@alistair23.me>, <edgar.iglesias@gmail.com>,
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>, <fkonrad@amd.com>, "Sai
 Pavan Boddu" <saipava@xilinx.com>, "Edgar E . Iglesias"
 <edgar.iglesias@xilinx.com>
Subject: [PATCH v1 2/4] xlnx_dp: Introduce a vblank signal
Date: Tue, 3 May 2022 16:25:43 +0100
Message-ID: <20220503152545.1100386-3-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503152545.1100386-1-fkonrad@xilinx.com>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21888b33-0d30-48af-c4ac-08da2d19689c
X-MS-TrafficTypeDiagnostic: BY5PR02MB6179:EE_
X-Microsoft-Antispam-PRVS: <BY5PR02MB6179CC45235C2835A206B426CCC09@BY5PR02MB6179.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtWZTQLPWMQjmt7iEPnsyaUcqoTnqyAvIVDxJ839XJKvNrpq3zEqXVVFmzG9M0iiGDY67hHGvob90JpJN6XzJCdDKfu+M1ixOVA48K8GyUXiZj3tLniy+mLwDOlAgC9/G3diT0ISUGIrHQK0sie+Ki9x+vILaGfMOflCDeJ32PvLvO2F8eUMVSExj/b2lvieFnBCGAEYimXbJi31A0ZCN+OwUr5LXRJ8iiF+28IM86EsObXMjz2D5ktytZD3VLxVNf0bcV34OaPx20f5021Jow2WQQZR86gchd94GZRQ8t7/Ysf9G9vAuhZ+anhCa4a0+h2tAxDViys33sX75/ZP1c4J7FgQ2YW7JYe+H7hW7oIxMOzd81C8iQKcgI/ZkQCJg86+kBFNIhdVD/jBdLotF73tsZ2wKWe6bDtr3nTWjdH2LyvqxnxYOiDetuZU33RZya121dfcwAe1UL5qY7M3OluDl+FQ2eDQsAlvLWyBR60+tAEbKxIqPSYaHXnZqmgzGOYXJcwxvS2XhlAKXK/EC/RmjUNzf2QjGzx4vxVGo3TLk+cXr3NRpY8949pA/CWuBOY3ZOIPo9yW1NcgAe5IQqZc8GKhjvhwKgz9wdtpUDPy771t05dJezR1GlkkXoPiEqj2iTReStR9a5c0Ts/v1kzNMK9m6vwhs5eE252T+7KODBCok25i/NiQLmY+JBSEVnJeTeUCsvII9+ckmmP1nQ==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(54906003)(6916009)(2616005)(5660300002)(4326008)(336012)(36756003)(1076003)(426003)(316002)(186003)(70586007)(70206006)(7636003)(356005)(107886003)(9786002)(8676002)(47076005)(2876002)(82310400005)(508600001)(2906002)(36860700001)(8936002)(26005)(7696005)(40460700003)(83380400001)(6666004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:27:17.6070 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 21888b33-0d30-48af-c4ac-08da2d19689c
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT039.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR02MB6179
Received-SPF: pass client-ip=2a01:111:f400:fe59::606;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM12-DM6-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, SPF_HELO_PASS=-0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Tue, 03 May 2022 11:33:53 -0400
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
 hw/display/xlnx_dp.c         | 24 +++++++++++++++++++++---
 include/hw/display/xlnx_dp.h |  3 +++
 2 files changed, 24 insertions(+), 3 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 0378570459..984b0a6bb9 100644
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
@@ -773,6 +774,14 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
         break;
     case DP_TRANSMITTER_ENABLE:
         s->core_registers[offset] = value & 0x01;
+        ptimer_transaction_begin(s->vblank);
+        if (value & 0x1) {
+            ptimer_set_limit(s->vblank, 1, 1);
+            ptimer_run(s->vblank, 0);
+        } else {
+            ptimer_stop(s->vblank);
+        }
+        ptimer_transaction_commit(s->vblank);
         break;
     case DP_FORCE_SCRAMBLER_RESET:
         /*
@@ -1177,9 +1186,6 @@ static void xlnx_dp_update_display(void *opaque)
         return;
     }
 
-    s->core_registers[DP_INT_STATUS] |= (1 << 13);
-    xlnx_dp_update_irq(s);
-
     xlnx_dpdma_trigger_vsync_irq(s->dpdma);
 
     /*
@@ -1275,6 +1281,14 @@ static void xlnx_dp_finalize(Object *obj)
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
@@ -1309,6 +1323,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
                                            &as);
     AUD_set_volume_out(s->amixer_output_stream, 0, 255, 255);
     xlnx_dp_audio_activate(s);
+    s->vblank = ptimer_init(vblank_hit, s, PTIMER_POLICY_DEFAULT);
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


