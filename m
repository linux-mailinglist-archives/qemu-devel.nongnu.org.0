Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6041352D996
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 17:57:30 +0200 (CEST)
Received: from localhost ([::1]:51270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nriWn-0007Gh-Av
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 11:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriFE-0007Xq-56; Thu, 19 May 2022 11:39:25 -0400
Received: from mail-co1nam11on20601.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::601]:36577
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriF8-0008Rr-3u; Thu, 19 May 2022 11:39:16 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FHazxJYKLcekMKLPk1aCJ936B0nwqvHXn0vaXEFOdNCgmyWBdXpbvaNFrHvk3qOF5fecqR70hv9wC78StwqgTlKavRBAhakNZVbFM3Tdm3gjTjH9qEF0izEbfXgiLiSDx/mJdCWSeThPCBlDlm/woMmwTu3mw2AvNGInJTO8yCaQ/OWWkZu0CgbUVF3+Xoue8ZTgDVVsp2pd6CYkXLPOrQaTPNpSh/81ymcWWI0M5Eq2KgeSPL/GcPFYKqZbHDvfrBZEz1dZijP4kP/WdgrarHeXOGwZnEulHhkzDlw8i9YBKpun/CtxCwJaQxRXn2Sg7qF/aPKQW8YuMtwJQs4CeA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KWF4wWzAshbKIT65iDxAW9lCQFshEvs91UHeDOGDpmA=;
 b=UN0Aqn71IVt5Ei/002zVEPim2T5cWHLwLx5Af5BDjUXew5yQRtdyUx4WgIQ8Wt/xnXbgkObdSJkyz/SQVxnpZayv4WEIv39+ZfisbapJXdvpeCwksuHf48GzLQNzApo6sfirdI/j5vSFu5vLOz4p9ac1qHgym5A1N7TFVNYbnG87MWN83ywJuOExfF+K+MBK0Er2opW07OabtU36eLbQOxn6tYf38HlGA+jBbwtTvqPxcnHhUoE8ttslwYLUkH0sRpeu9/iceAbBfOn/8Q5T3ELgqdjitX662WfrDZ04mUi/1gq5QTCRrzPNvnpSkFUd5BJwy6ZCbGktQKD6Vi3GvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KWF4wWzAshbKIT65iDxAW9lCQFshEvs91UHeDOGDpmA=;
 b=sqyLrk+UDec9JRH05mUtb0Mvz5KZdExADJy1YBxLzg4szw7Jhq1U0qcK6ZV/lrnKCNBiDt+z5c2XCmCv7RQF+NlfoUqW/Q3kVYG6ZLc/eKwiPIB3hq2vUATvbUQ5ayaLVg9EoavwaS234KhyRx6uLFIqJvvy24QbFcpXB7HnoBY=
Received: from BN9PR03CA0945.namprd03.prod.outlook.com (2603:10b6:408:108::20)
 by SN6PR02MB4077.namprd02.prod.outlook.com (2603:10b6:805:38::26)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.18; Thu, 19 May
 2022 15:39:02 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::8f) by BN9PR03CA0945.outlook.office365.com
 (2603:10b6:408:108::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.13 via Frontend
 Transport; Thu, 19 May 2022 15:39:02 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.80.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.80.198 as permitted sender)
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 15:39:02 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 19 May 2022 16:39:01 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 19 May 2022 16:39:01 +0100
Received: from [172.21.132.221] (port=36706 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fkonrad@amd.com>)
 id 1nriEv-0007q5-K3; Thu, 19 May 2022 16:39:01 +0100
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, Sai Pavan Boddu
 <sai.pavan.boddu@xilinx.com>, "Edgar E . Iglesias"
 <edgar.iglesias@xilinx.com>
Subject: [PATCH v2 2/4] xlnx_dp: Introduce a vblank signal
Date: Thu, 19 May 2022 16:38:27 +0100
Message-ID: <20220519153829.356889-3-fkonrad@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153829.356889-1-fkonrad@amd.com>
References: <20220519153829.356889-1-fkonrad@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a60f82a8-284f-4af8-b296-08da39adb34a
X-MS-TrafficTypeDiagnostic: SN6PR02MB4077:EE_
X-Microsoft-Antispam-PRVS: <SN6PR02MB40779DC0C2ACA7635B5CF6A3A6D09@SN6PR02MB4077.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +H/B472+ngTQzbh7VXxO147kMUEyjiNerLhPM5SXGf+3bCyYAhMNqfD8r/HhKsTIsF8lHoNSpJkc93SihJ6a03USB+uY7drm844qdWw0lbbsjIYxOXCQqB4AIsFNxOIAYaHcx4GhzOATHMeGi51Q2QPTNktlgbBNdXyMjJ9oiN7Y4xt0Zi4KYHCDG8pmYohfiH+D7hlL3c+PsHDdWDzmUDQalR419KCMc1Y/dxGlr2nMJgDT8ceeEMPtekMZKWORFO/Tz2L4NZzMydf8keCtUdi7a+USh1C1vTycrlCUCxDFPKiXWzhyWVWZJd7dPNSCWmLx/CT1yVPciIfInHchu4NlWlztuCMePzO26UeYVRgMdtOP+kUcAfjBvLgEmRMyKuxt2eizPBokkewaMbeksHMlDFYNCFpuom2AVAKzcU8+U0OZGxImNZ0YKy6BIZh3EjNFpbcyZ689BPsbbi8pH9IaVj1AsjGBwa2horYvYnmmGmdFvVdHzotZbpJR7TJerw3XSdzUktfYZr43RY0ZiiJDqD0O4N/I2Yl81Imo6lUDVlmWbzSye8Sts6CWRwenU4I9ek8pcFuWQ6GnBBNXZ9A8hmoeNGsp8fPTzT2cLSucfzSoFfE7c4lk34y2n3A9CkP/VHb24DioUK88c6UxXJeflpySCcThTHrRpSX2lq/x1nLBD3VDjq7mcTqaUERPnLh0J7f9dHckflD20N8jGg==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(2616005)(107886003)(54906003)(36756003)(2906002)(40460700003)(1076003)(316002)(6916009)(5660300002)(336012)(82310400005)(47076005)(356005)(35950700001)(9786002)(8936002)(86362001)(6666004)(70206006)(83380400001)(8676002)(70586007)(4326008)(7636003)(26005)(508600001)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 15:39:02.4770 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a60f82a8-284f-4af8-b296-08da39adb34a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN6PR02MB4077
Received-SPF: pass client-ip=2a01:111:f400:7eab::601;
 envelope-from=bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  Frederic Konrad <fkonrad@amd.com>
From:  Frederic Konrad via <qemu-devel@nongnu.org>

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

Add a periodic timer which raises vblank at a frequency of 30Hz.

Signed-off-by: Sai Pavan Boddu <saipava@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Changes by fkonrad:
  - Switched to transaction-based ptimer API.
  - Added the DP_INT_VBLNK_START macro.
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
---
 hw/display/xlnx_dp.c         | 27 ++++++++++++++++++++++++---
 include/hw/display/xlnx_dp.h |  3 +++
 2 files changed, 27 insertions(+), 3 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 0378570459..2686ca0f2e 100644
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
@@ -274,6 +275,10 @@ static const VMStateDescription vmstate_dp = {
     }
 };
 
+#define DP_VBLANK_PTIMER_POLICY (PTIMER_POLICY_WRAP_AFTER_ONE_PERIOD | \
+                                 PTIMER_POLICY_CONTINUOUS_TRIGGER |    \
+                                 PTIMER_POLICY_NO_IMMEDIATE_TRIGGER)
+
 static void xlnx_dp_update_irq(XlnxDPState *s);
 
 static uint64_t xlnx_dp_audio_read(void *opaque, hwaddr offset, unsigned size)
@@ -773,6 +778,13 @@ static void xlnx_dp_write(void *opaque, hwaddr offset, uint64_t value,
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
@@ -1177,9 +1189,6 @@ static void xlnx_dp_update_display(void *opaque)
         return;
     }
 
-    s->core_registers[DP_INT_STATUS] |= (1 << 13);
-    xlnx_dp_update_irq(s);
-
     xlnx_dpdma_trigger_vsync_irq(s->dpdma);
 
     /*
@@ -1275,6 +1284,14 @@ static void xlnx_dp_finalize(Object *obj)
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
@@ -1309,6 +1326,10 @@ static void xlnx_dp_realize(DeviceState *dev, Error **errp)
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


