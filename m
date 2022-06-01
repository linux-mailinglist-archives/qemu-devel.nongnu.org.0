Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 32AED53ABDD
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Jun 2022 19:28:37 +0200 (CEST)
Received: from localhost ([::1]:45766 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwS96-0006bF-AH
	for lists+qemu-devel@lfdr.de; Wed, 01 Jun 2022 13:28:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4r-0000fY-2R; Wed, 01 Jun 2022 13:24:13 -0400
Received: from mail-co1nam11on20605.outbound.protection.outlook.com
 ([2a01:111:f400:7eab::605]:43395
 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nwS4o-00072q-VJ; Wed, 01 Jun 2022 13:24:12 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WmI5H2PNDghYeFEZyhLfPiok6ERIHOkRtYnhXwwUYYJbvDlOAuxWtATUFjKastkXvhCMwgx77k8f13wBUddws+m5KXUqllbLWcybN7wDIaVhOAn2g8gRMkFPfd60xFUa3XTWZW7VsNiWrwJdL+PwQzugP3nqK/8pPLJVAosmtcYdVjm2xVJ58T086RYC3tXhlnOQK34aN0o5LS4wchuUR6SAirK28pkNSkSy9GYQsFcoD7+8XC6Q5nYWzygIMGnohx0WUa/7lAXblpXFd4ZoGhTRwSzEhfiHLLVpGQJPyW8MJmybMVoszrs47NK4ioYOpOfIRc3zFxuRTzykinCzSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FDM279kShe6n0Q5FrJfClGQQCNd8sC/v5OLwb93I1Wo=;
 b=WJ9wN/VK9ZP3tFbvbtep+dwz1K+m2PMsLGPWbUiReC+hdN0ItDvqB7rV0jWE2s2toftcfB+srtLELlYi9HEJC7pL+vwNqhzxogV/hLPJsGvrVDmFKUMjSRa43uXH0lRAHdicq+QAfwhcBF7rNaiLqV9aocjSu4KSSNq6jJB7P+M2/z8Ht0JuUJviI9lL0NVcoaPaZpQDPpnQA+ZN3hhRk91dtX2ldM34gfEu+nspTMMcbHQYQ7V52Tm9j6DDAecGCSMudalw0nGX3E42lpdgiiv3KM/ihHJlK4yO7wC1JQU3WKEJNYf7MKWAiwMb6vhjBjtTVz19rpM0cYLJogc1qQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FDM279kShe6n0Q5FrJfClGQQCNd8sC/v5OLwb93I1Wo=;
 b=Kb5QcP+EmTp+JXiYHJEgwIVpdj5BgzK+esTA1o7HQasIdecmIv2it618gw2xzFoFe+w6eI5MBbxIh56oj23SfkuQ74NjROPqrE5ge+vpEl1RTrLIFDVUFeGs8AGdA0+cKQPpk62Rd4V/x/vhiCKrAWURLSYJAIQR2JP1sEWqIwk=
Received: from SA0PR11CA0196.namprd11.prod.outlook.com (2603:10b6:806:1bc::21)
 by SJ0PR02MB7534.namprd02.prod.outlook.com (2603:10b6:a03:320::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5314.13; Wed, 1 Jun
 2022 17:24:06 +0000
Received: from SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::4f) by SA0PR11CA0196.outlook.office365.com
 (2603:10b6:806:1bc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5293.13 via Frontend
 Transport; Wed, 1 Jun 2022 17:24:06 +0000
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
 15.1.2176.14; Wed, 1 Jun 2022 18:24:04 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Jun 2022 18:24:04 +0100
Received: from [172.21.132.221] (port=53720 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nwS4i-0004Ck-I9; Wed, 01 Jun 2022 18:24:04 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>
Subject: [PATCH v3 1/4] xlnx_dp: fix the wrong register size
Date: Wed, 1 Jun 2022 18:23:50 +0100
Message-ID: <20220601172353.3220232-2-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220601172353.3220232-1-fkonrad@xilinx.com>
References: <20220601172353.3220232-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 671844a2-174c-4a49-de00-08da43f387f5
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7534:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR02MB75346E95F2720A8D13DA763DCCDF9@SJ0PR02MB7534.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tk7XkmJdPsRqGOfGglaBhO/nAfPM+FLwk11WonqlBUKYF9jIKkCCqgnih8Z+21QuR+rb65SL4bybkssCWecWx0yBbq9/2rIgMr6Tq5lxAzaP+obfAqN0L8zJd87H5upYpFu2JcJDohLiOHSn8MkVhpBXLNGjlcgcEwX0W97qPWcz6QNVXE9X9pwRkV+wJOQUreqYgjUVVnH4dADBlwBqXh434MkRlR52vP6JoG9Au3BbJomuwZzqmBULpXcifBnd98DnqUMZbWF/sekkEkPkW7LjdzVaF25Ve93U+MBwrqSivcgB7jnRpfUuALV+wcTSErLFZ3CR7IytGa4LfR7zcOogmu1erb6oEyu+Tg+NYqBFU1SPdW+k8lXhSOCmsFUfQWG3+5TLIOBf+KS22N/46ZaDn/IwWkS+m2+AO/QGK8uivApu++FMvmH7PfhY+eJOqC/BDjkQSmK5bTN30fkfFaakjEh5GP1wSlPkwVvP26iPrhML3seAqOQvrpxsbX/N1bqeCLQPtQKsQtCx983wR1HKmH3GJMDfmth3y3VFRWxTFNzBINZTX1NNETsqjXQThMo9zBlR5IF5nzErjW+L2qQsNEVhEmhwB112AQ84t++y1HaWbUGMqSN8yecDp2HBZVFj0fvz48PKGgNboCmD1Q0/YX+FqS2wramKNCAdJsL49m3ekXd3QZcHx9zr4pwZIY8IbUBajiiRYqIoJHxvEYyVGzOMycjjImq4RUXhE6cvk9fmReR1r0jyIJZmPwwvd8MZLgNJObgn+ohZOjRAORCROZDWOffV906jHKTIlcQ=
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(356005)(966005)(26005)(36860700001)(316002)(7636003)(6666004)(8676002)(4326008)(2876002)(7696005)(54906003)(6916009)(1076003)(83380400001)(426003)(47076005)(336012)(186003)(40460700003)(70586007)(70206006)(2616005)(508600001)(82310400005)(2906002)(8936002)(5660300002)(36756003)(9786002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Jun 2022 17:24:06.0685 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 671844a2-174c-4a49-de00-08da43f387f5
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0041.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7534
Received-SPF: pass client-ip=2a01:111:f400:7eab::605;
 envelope-from=fkonrad@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
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

From: Frederic Konrad <fkonrad@amd.com>

The core and the vblend registers size are wrong, they should respectively be
0x3B0 and 0x1E0 according to:
  https://www.xilinx.com/htmldocs/registers/ug1087/ug1087-zynq-ultrascale-registers.html.

Let's fix that and use macros when creating the mmio region.

Fixes: 58ac482a66d ("introduce xlnx-dp")
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/display/xlnx_dp.c         | 17 ++++++++++-------
 include/hw/display/xlnx_dp.h |  9 +++++++--
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/hw/display/xlnx_dp.c b/hw/display/xlnx_dp.c
index 9bb781e312..0378570459 100644
--- a/hw/display/xlnx_dp.c
+++ b/hw/display/xlnx_dp.c
@@ -1219,19 +1219,22 @@ static void xlnx_dp_init(Object *obj)
     SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
     XlnxDPState *s = XLNX_DP(obj);
 
-    memory_region_init(&s->container, obj, TYPE_XLNX_DP, 0xC050);
+    memory_region_init(&s->container, obj, TYPE_XLNX_DP, DP_CONTAINER_SIZE);
 
     memory_region_init_io(&s->core_iomem, obj, &dp_ops, s, TYPE_XLNX_DP
-                          ".core", 0x3AF);
-    memory_region_add_subregion(&s->container, 0x0000, &s->core_iomem);
+                          ".core", sizeof(s->core_registers));
+    memory_region_add_subregion(&s->container, DP_CORE_REG_OFFSET,
+                                &s->core_iomem);
 
     memory_region_init_io(&s->vblend_iomem, obj, &vblend_ops, s, TYPE_XLNX_DP
-                          ".v_blend", 0x1DF);
-    memory_region_add_subregion(&s->container, 0xA000, &s->vblend_iomem);
+                          ".v_blend", sizeof(s->vblend_registers));
+    memory_region_add_subregion(&s->container, DP_VBLEND_REG_OFFSET,
+                                &s->vblend_iomem);
 
     memory_region_init_io(&s->avbufm_iomem, obj, &avbufm_ops, s, TYPE_XLNX_DP
-                          ".av_buffer_manager", 0x238);
-    memory_region_add_subregion(&s->container, 0xB000, &s->avbufm_iomem);
+                          ".av_buffer_manager", sizeof(s->avbufm_registers));
+    memory_region_add_subregion(&s->container, DP_AVBUF_REG_OFFSET,
+                                &s->avbufm_iomem);
 
     memory_region_init_io(&s->audio_iomem, obj, &audio_ops, s, TYPE_XLNX_DP
                           ".audio", sizeof(s->audio_registers));
diff --git a/include/hw/display/xlnx_dp.h b/include/hw/display/xlnx_dp.h
index 8ab4733bb8..1ef5a89ee7 100644
--- a/include/hw/display/xlnx_dp.h
+++ b/include/hw/display/xlnx_dp.h
@@ -39,10 +39,15 @@
 #define AUD_CHBUF_MAX_DEPTH                 (32 * KiB)
 #define MAX_QEMU_BUFFER_SIZE                (4 * KiB)
 
-#define DP_CORE_REG_ARRAY_SIZE              (0x3AF >> 2)
+#define DP_CORE_REG_OFFSET                  (0x0000)
+#define DP_CORE_REG_ARRAY_SIZE              (0x3B0 >> 2)
+#define DP_AVBUF_REG_OFFSET                 (0xB000)
 #define DP_AVBUF_REG_ARRAY_SIZE             (0x238 >> 2)
-#define DP_VBLEND_REG_ARRAY_SIZE            (0x1DF >> 2)
+#define DP_VBLEND_REG_OFFSET                (0xA000)
+#define DP_VBLEND_REG_ARRAY_SIZE            (0x1E0 >> 2)
+#define DP_AUDIO_REG_OFFSET                 (0xC000)
 #define DP_AUDIO_REG_ARRAY_SIZE             (0x50 >> 2)
+#define DP_CONTAINER_SIZE                   (0xC050)
 
 struct PixmanPlane {
     pixman_format_code_t format;
-- 
2.25.1


