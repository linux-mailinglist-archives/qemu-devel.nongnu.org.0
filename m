Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C34A25188D6
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 17:41:08 +0200 (CEST)
Received: from localhost ([::1]:40370 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlueB-0004sC-PV
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 11:41:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQp-0002yI-8W; Tue, 03 May 2022 11:27:19 -0400
Received: from mail-dm6nam12on20611.outbound.protection.outlook.com
 ([2a01:111:f400:fe59::611]:17889
 helo=NAM12-DM6-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fkonrad@xilinx.com>)
 id 1nluQn-0003nC-8u; Tue, 03 May 2022 11:27:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i/mVtE157CinzGHsDknsMchJu2xCPG6gOsCbr4UnSymCic/2yG6M5K+P8ScTRckI6mYRsJBPMUwaWmnk/26s6BmJoXBAJjI84LPv4UblKtr9pWaIqID8/QUw/N0U8inWNIkMAnv1XKP36og/HXRV/quZSRmzKjs764mvq+RBRZ8h7Gt0aUAfF4yyHkL+riaUkf2Jzc58KGq0BpYkcOMVvNhYO6+B+m3lw63R4+I+0TRCR/2T1BDujJkvUFCLNATuBCo/qFWXOJJiHhOoOW495RpDOiabUCEDvPyV6MwyCSBHVoHfKUJOGWQ5DP3uoWc5DbhQfrcQZYBNnGYav0yUBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RDPudHR2JUFyK2XZBx/iZMhpT0JvXFBP7hQ2JJaViuE=;
 b=PVFLDgefSc5xQtpJhI9IpHb6z/ePmzkVB+45Wt/xsr+wmi7X+oCKjieSI1owmPyjZyoWJv5d0xsmFeYS6bm9thMwBy5wfqZmHO81Wwk7LkHLmmX6ihDnIDX1OLHJwdaVVaovDPibGFtBNInke+RsJNRGnH2TFKuM7gAs+moUSlXZlZ/aEcvWnlr0u9FLB2SzutpQljjAXZcdjf8x94aEWfEzWxP7IuTMJbnAOkDSAHMLosh3zvXUgCwlFrUS58gtkiNySc3H/8YzMpTVWQ+TLnGp9LTqbkYufH2HK5z7+EBvvLTKQPT3vHRsD9xQ7A7+4rMwY49GbQJ88DUK+Hvd5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RDPudHR2JUFyK2XZBx/iZMhpT0JvXFBP7hQ2JJaViuE=;
 b=fOIw7mAxi40rATbAQLWSehqHtxDpGP0lO+u/k8YVOQPJM0ceGsNlV/Rv0O/l+FvgPZlyseV48U8YepmKeIGgkM8loZZVufrOKTfRApGmlSeMB9gvaIyPZxcHtyQUWKIQ9aWLIot2a+xvYI+06vheE/dcQgUn4tEdljZk6B3Swd8=
Received: from DS7PR05CA0093.namprd05.prod.outlook.com (2603:10b6:8:56::17) by
 DM6PR02MB3947.namprd02.prod.outlook.com (2603:10b6:5:9d::25) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5186.17; Tue, 3 May 2022 15:27:13 +0000
Received: from DM3NAM02FT048.eop-nam02.prod.protection.outlook.com
 (2603:10b6:8:56:cafe::78) by DS7PR05CA0093.outlook.office365.com
 (2603:10b6:8:56::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.6 via Frontend
 Transport; Tue, 3 May 2022 15:27:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch02.xlnx.xilinx.com;
Received: from xir-pvapexch02.xlnx.xilinx.com (149.199.80.198) by
 DM3NAM02FT048.mail.protection.outlook.com (10.13.4.209) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5206.12 via Frontend Transport; Tue, 3 May 2022 15:27:12 +0000
Received: from xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 3 May 2022 16:27:11 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch02.xlnx.xilinx.com (172.21.17.17) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 3 May 2022 16:27:11 +0100
Received: from [172.21.132.221] (port=36824 helo=xdcsswbld02.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <frederic.konrad@xilinx.com>)
 id 1nluQg-0002mH-In; Tue, 03 May 2022 16:27:10 +0100
From: <frederic.konrad@xilinx.com>
To: <qemu-devel@nongnu.org>
CC: <alistair@alistair23.me>, <edgar.iglesias@gmail.com>,
 <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <sai.pavan.boddu@xilinx.com>, <edgari@xilinx.com>, <fkonrad@amd.com>
Subject: [PATCH v1 1/4] xlnx_dp: fix the wrong register size
Date: Tue, 3 May 2022 16:25:42 +0100
Message-ID: <20220503152545.1100386-2-fkonrad@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503152545.1100386-1-fkonrad@xilinx.com>
References: <20220503152545.1100386-1-fkonrad@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 27c22ee4-ce08-409e-27d0-08da2d1965aa
X-MS-TrafficTypeDiagnostic: DM6PR02MB3947:EE_
X-Microsoft-Antispam-PRVS: <DM6PR02MB3947CB3F8D23EC6E0557238ECCC09@DM6PR02MB3947.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CTFGe/vWMTFs2DBBfj2jZkcxpHioAYxbZa7HIcDoR/DaBFDbURP5gJAJ4w+HrFu/gO/qn2XGupDaGq/FUcBJW55duvQaT6ksOhFdyH892cBIDXxHq4vS43lKaE8eUaTSwtuNuv2M0TE/0/eopQfv1n6yaiQB0/AVeiasaQAumUjZVw/kptYk77o2wUVE/21crUz70VflSGYVmzfzSaDdh0OU0Y10WEE+ZJRDHIwu76oaq/PgNyd0hW1L4wTzovMtgOv9nCyRwt+T3jdzSCCrDPWj1C2Wl1/t0orRMMbgzElYnkrbQllDx/zSx1QUxtAGke98U238qnVNG6hydwzVI5rAFC+2xcKhLzfP7aoboydutX9+Gs3BrlPRDfqXpmHjJPsQBg5IEGKRKHHPlFAyYHlHCj+tQ/u2Kw3bICOlJZHXPOiY1C2XELXPgj3DB+OxzU2aAfm6j/vsO7p3+WvSkJ4huqGNlevtycojEGmIefUh2KzCDDl679XDVxODROkb2DW15s7zDzfkxv8plXHxFYdfFXNZUMPxNRZD6VHUSQUHoe07zVbGW1JA9jHFWlIVOnbat8aHX1R06nOUc1uP1b6YkdBgZUbGbsYHBXMfsiEjKQB6qxJFfq/k4uvCjPTphgUoag9p4S4u3pX/UhwKMZ7kncZJ248G+xp0YBZ2wFB7fqvBOxNBsaQqPu2hYu3Wpkm0RjJXqCXdO6BCuBaPqrnYVfWGQYLjEudyQmkUTpVFQalzOOFYgfJoHQw5Cthep4uTlMwwIARDCuobMSfLYtoC36i9mlbkIGUDLKix2V6NV+oim4lYRHt3XszuaSG25bR+iNNQbEWug53yn+zMvQ==
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(40470700004)(46966006)(36840700001)(2876002)(2906002)(4326008)(47076005)(8676002)(82310400005)(36756003)(70586007)(70206006)(9786002)(316002)(6916009)(356005)(6666004)(26005)(7636003)(40460700003)(8936002)(5660300002)(426003)(966005)(2616005)(508600001)(36860700001)(54906003)(83380400001)(336012)(186003)(1076003)(7696005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 May 2022 15:27:12.0992 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27c22ee4-ce08-409e-27d0-08da2d1965aa
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT048.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB3947
Received-SPF: pass client-ip=2a01:111:f400:fe59::611;
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

From: Frederic Konrad <fkonrad@amd.com>

The core and the vblend registers size are wrong, they should respectively be
0x3B0 and 0x1E0 according to:
  https://www.xilinx.com/htmldocs/registers/ug1087/ug1087-zynq-ultrascale-registers.html.

Let's fix that and use macros when creating the mmio region.

Fixes: 58ac482a66d ("introduce xlnx-dp")
Signed-off-by: Frederic Konrad <fkonrad@amd.com>
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


