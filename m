Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F49E52D9B3
	for <lists+qemu-devel@lfdr.de>; Thu, 19 May 2022 18:01:57 +0200 (CEST)
Received: from localhost ([::1]:57738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nrib5-0003H6-3S
	for lists+qemu-devel@lfdr.de; Thu, 19 May 2022 12:01:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriFE-0007Xr-7j; Thu, 19 May 2022 11:39:25 -0400
Received: from mail-bn7nam10on2060d.outbound.protection.outlook.com
 ([2a01:111:f400:7e8a::60d]:1376
 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com>)
 id 1nriF2-0008Rn-ND; Thu, 19 May 2022 11:39:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nGpv5sEO0oB1o8YwK/Lc7tmixD/71bQd5Zdwt9HRSlgyxwQG0BcJkOHAXiyyW9QBWpz7qg3pT+PWsP3XxaLiHxg2Uh26fLbk0+ZQcOQE+yd+XjvuQH83pDHSdCqipdSEpCNMhMH4xj205ozN2AjaRciyzVrt92JaljTTfy16HPvgcnqpwYzYOcGH1M1ZYdF7ZRwuM/JCR/Tmjn/sSdPfOVz6ew1sJhkU2JkFtsXlFNi14sSYZYqu/p+CGBHge1LGHJnfGtsVKFSPxv1o0b81EQhzl2JyuNG74gm4QtxNN/W5+64uRfZjMqCpVDpNkambao/zAWuZQLgBhRHhaUFB8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9sPqp34Q0HGXX+sfFxve0sOE5/Q1M4AdqNx+1HvjzuM=;
 b=GTqRsVFQzXFKu+zWnrt0w1HQWqNJUcRLfA4BYWBbnfdXLTLYTVi3LgabpSosxnol3XKWKx1ASdeT4LTaB4jB1dZ2Pj09hUHAz0F14YViVBZSk8K6O3Iifs5idJbX1w2qG9fwEQB15pClPULMwsDPYY0ixw12X3GnsDGJIZKV6z5NzTriPk2/WolfBDBkAGyI4HSvjU0h+o71kALZH39c1QBK/ZENg6Bv0aKUcUTjlCm4cG/vatm+XwVusKlJ6xW0nTda878efOVtcQ0I7W5lzN+GOMbQBSjghwwpEw7odATHnIQs0SA4SWQKwSqiRXhw15Qiq10in+sB1fi5DQp7qA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=softfail (sender ip
 is 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=amd.com;
 dmarc=fail (p=quarantine sp=quarantine pct=100) action=quarantine
 header.from=amd.com; dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9sPqp34Q0HGXX+sfFxve0sOE5/Q1M4AdqNx+1HvjzuM=;
 b=jfhIu1O3IUlLno1+OQnf27w7aTNIdUvdFpttdANbladObBPaoox+XZytshFBzSccvE1hsxwdF9hWxW4Y4q8ap53YuZrWdJNbz7iJDBtSUR9wny3MCd/xutVWsvhP8VNCSlR0yG5BmuCiqyQ+q/+8V4+nXhogYCtLZDCScuXd3Uk=
Received: from BN9PR03CA0932.namprd03.prod.outlook.com (2603:10b6:408:108::7)
 by PH0PR02MB7669.namprd02.prod.outlook.com (2603:10b6:510:5d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.14; Thu, 19 May
 2022 15:39:02 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:108:cafe::16) by BN9PR03CA0932.outlook.office365.com
 (2603:10b6:408:108::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5273.16 via Frontend
 Transport; Thu, 19 May 2022 15:39:01 +0000
X-MS-Exchange-Authentication-Results: spf=softfail (sender IP is
 149.199.80.198) smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=fail action=quarantine header.from=amd.com;
Received-SPF: SoftFail (protection.outlook.com: domain of transitioning
 amd.com discourages use of 149.199.80.198 as permitted sender)
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5273.14 via Frontend Transport; Thu, 19 May 2022 15:39:01 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 19 May 2022 16:39:00 +0100
Received: from smtp.xilinx.com (172.21.105.198) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 19 May 2022 16:39:00 +0100
Received: from [172.21.132.221] (port=36706 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <fkonrad@amd.com>)
 id 1nriEu-0007q5-5l; Thu, 19 May 2022 16:39:00 +0100
To: <qemu-devel@nongnu.org>
CC: <qemu-arm@nongnu.org>, <peter.maydell@linaro.org>,
 <edgar.iglesias@gmail.com>, <alistair@alistair23.me>, <saipava@xilinx.com>,
 <edgari@xilinx.com>, <fkonrad@amd.com>, "Edgar E . Iglesias"
 <edgar.iglesias@amd.com>
Subject: [PATCH v2 1/4] xlnx_dp: fix the wrong register size
Date: Thu, 19 May 2022 16:38:26 +0100
Message-ID: <20220519153829.356889-2-fkonrad@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220519153829.356889-1-fkonrad@amd.com>
References: <20220519153829.356889-1-fkonrad@amd.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 149ae7bb-6009-45d5-47c6-08da39adb29a
X-MS-TrafficTypeDiagnostic: PH0PR02MB7669:EE_
X-Microsoft-Antispam-PRVS: <PH0PR02MB7669E14437A3850ACA7E5CF1A6D09@PH0PR02MB7669.namprd02.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 2
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: cWkjz81kFo8b9SrMkAlK0+upNr2f6KPhTjAX0fywGAoWu82Wxd0sAJWHXdfGLC4WQuMsMCAtKsssG9ZN1delEhvcRZg5CWIxREiSIMQuMJk6qBmCmZB+I7PMA80J7xISYPJCl+NsiDt41O1BBgbHr09G/PWycSYZ0Gc7ZEPgL8DlG7q7uaECIEnWi+Fr/ez9PqYgaLqwCf/mjiRz+ekLF715/dK6Tiz0hd9tO1Sqy6EEE3edA5rKWooq3t9ojij2+ruxvsJs+STyNchnYCfOCjAP+9s+K5ByuSpE49S/HhQ7r9a4HSNFxRVS9oLDlvHwbohSbUgaPX590P8ZUo76H7t11h8sDoy+kmA+L2JQbw3lt/P0Pg+4X5ezZqF85gyz7FdL6zSi+8xICF9CvA0baW58b0ghTbYnhqAM/SZDIKSzXMp8Y+mLOU70u16xaS7Ab5cGRvmKbPF9qN8W1PN54orI+R2tIEu7FLaXa4RvBhA31nFFHD38SfzgwgtZJf3EuiX3/XBsk6eOKNLOq+sEyjZg6UtCsQcXx5EFNEeS0A5ciXVPtLppamUCdAS9TaYGFPbGilkushw4XgGMobP1FGj0oB2Xixo+Qagr54g5hy3C3Q3dy5GbnPYqyzeKKtzsn8zhO8Zgc8yHxvjMOft0v3KkXeq04hpmIulQW6txWZdF7peVi/InAykUAXEMIPxOgI6HETyZZMNsELnDggGWEKrf8vY9WecFIe08IV2y62F/PE8bQ9YDLD3i1neG3TkiHwHD33SSm25qawugPr96etex9elimDHzVMIP1ubt1vU=
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(7636003)(70586007)(70206006)(35950700001)(356005)(4326008)(8676002)(36756003)(54906003)(508600001)(86362001)(40460700003)(966005)(83380400001)(9786002)(47076005)(82310400005)(6666004)(6916009)(316002)(5660300002)(1076003)(26005)(336012)(2906002)(8936002)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.onmicrosoft.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 May 2022 15:39:01.3208 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 149ae7bb-6009-45d5-47c6-08da39adb29a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7669
Received-SPF: pass client-ip=2a01:111:f400:7e8a::60d;
 envelope-from=bounces+SRS=DmMzc=V3@xilinx.onmicrosoft.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


