Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 387024F67D0
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Apr 2022 19:48:31 +0200 (CEST)
Received: from localhost ([::1]:39014 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nc9le-0003J5-61
	for lists+qemu-devel@lfdr.de; Wed, 06 Apr 2022 13:48:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gf-0000Mc-Lz; Wed, 06 Apr 2022 13:43:22 -0400
Received: from mail-bn8nam08on20618.outbound.protection.outlook.com
 ([2a01:111:f400:7e8d::618]:13665
 helo=NAM04-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgari@xilinx.com>)
 id 1nc9gb-0004SB-Fu; Wed, 06 Apr 2022 13:43:19 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IgONQeGqP5+bsrpO0mLVMEd+CvtmVU9+Nn7otWfd12YZtQq3i1wnDXpBZ1AorQ+XaAg1pu/D8/yWR1lLdWwZeYJWOSGcSmJlUEJsvRqFA10VwO184DiNZQrqfEkAOrs+EQrVMlYaVl9IvuRqnlpys5G3/hH2a4y6IZ2MmIWNgrOMR375v0TZfLNKVwIcJAygfoiFD6LtOajaCJtVcbsTMDeNUP2tZVwc+YFhK9+DHSTtP/egYmNZGyMSYDmXPlly7GRM6H5l9yyEF7Zfwh8i1Mxc6kaLeOjnn/4k77fq96//kkvAMuuI2AWs7/ZtDykSOcKA6F5e3ys2YCx4uo9DoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/w/bsuBC2BVHg7g6WHq/qpp26oR7F1GlVu7q5fSw4HA=;
 b=lS/Sh+qhkcR/sAd+Z8haf+G7t+jjSBgTujQpvs9rQ2WcXDhL9+7JIH2yuonGCHs5oBKEAvd64ftnBkHA8ktDalPJtNi+hsvp316JPqvWGlYswL+85mGe2bmur451WX0JJgTFXfTjcRe7r5DOP4AcNaPuWpIxo4bDjQJklxrg48ET7euoN0pOrh5yGyBAeeFttyb27KAfNT49mqkN5fL5zDH19WHBPguIvTFb6u1GZHycCNNZeT/BYAtl9yNGs7lWAFCHKGt/C+5RvqzUiy56v5ivO0zH24qjxr5CLBBfRQ9misb/ZbnEyOb70+q8G+ZvMFX0e30stqdYvpP0wEbX5Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.80.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/w/bsuBC2BVHg7g6WHq/qpp26oR7F1GlVu7q5fSw4HA=;
 b=jD36ePtR2sYQaztJGzMGnoIVDxHRNQvNYVZl99f7+tKz6w69F4DCmYHFjsMl3aDyy4cOAxq2RErKjN8vuYGYplxAmwe2Lki8lUNsdIDk5Z6664teD3snbrvSFgW3S8Wu0i6alpQUp+TbgimGVWwDMGcebreFAPftZh0Zk/z3nKs=
Received: from SA9PR11CA0019.namprd11.prod.outlook.com (2603:10b6:806:6e::24)
 by DM8PR02MB7863.namprd02.prod.outlook.com (2603:10b6:8:22::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5123.31; Wed, 6 Apr
 2022 17:43:10 +0000
Received: from SN1NAM02FT0012.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:6e:cafe::e4) by SA9PR11CA0019.outlook.office365.com
 (2603:10b6:806:6e::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.21 via Frontend
 Transport; Wed, 6 Apr 2022 17:43:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.80.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.80.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.80.198; helo=xir-pvapexch01.xlnx.xilinx.com;
Received: from xir-pvapexch01.xlnx.xilinx.com (149.199.80.198) by
 SN1NAM02FT0012.mail.protection.outlook.com (10.97.4.93) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5144.21 via Frontend Transport; Wed, 6 Apr 2022 17:43:09 +0000
Received: from xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 6 Apr 2022 18:43:06 +0100
Received: from smtp.xilinx.com (172.21.105.197) by
 xir-pvapexch01.xlnx.xilinx.com (172.21.17.15) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 6 Apr 2022 18:43:06 +0100
Received: from [172.21.132.222] (port=6160 helo=localhost)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <edgar.iglesias@xilinx.com>)
 id 1nc9gQ-0001DV-9W; Wed, 06 Apr 2022 18:43:06 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 4/4] hw/arm: versal: Connect the CRL
Date: Wed, 6 Apr 2022 18:43:03 +0100
Message-ID: <20220406174303.2022038-5-edgar.iglesias@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
References: <20220406174303.2022038-1-edgar.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3320bd60-b823-4114-c140-08da17f4ea69
X-MS-TrafficTypeDiagnostic: DM8PR02MB7863:EE_
X-Microsoft-Antispam-PRVS: <DM8PR02MB78635CBD3102C03C5A423034ABE79@DM8PR02MB7863.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gDESi6sgY2cJaTEy+qz62Q8au/8BJ60NeLD0prLzOwjNUy0pYLIHHBNOX8OUM/PAOT/YAlcZ0/kWo9c1awQfVZ6HndgBDRnxzkwcgQ0KjCDjrV+A36A/GGRJjUYgsQNY/KFdaZSsndmSJagPiISKJ3gvb8ioL8VxfGmputFEG2dkGJxnqgtDHMpavTNNkroo42BCKsZ0MbzAn0xlz/ZmDD/oEhbDhphJ/P7ulugyJvUc+Tc4XtmBeiD0rZYqsiGofuTqQwx943/+Np2HR78DVsQ+LrzoAjOX/5JB/q8s7bi14jVwrSvHG6q84RiF4Zhx6y+Esgr2S1iWzqNYmu76N0jQO3SOCrEMaKpZERvskvoaErAMOQ7zybjHBcKOJ/KLu1l8XgoiLN0yGn2Rh3zLtb29DzoVYDSDwUQ7y02hoyqm8J29PLpHUcn0/SZueVbruJL7+lRSpxt6S07AVXIenMIm0KPRO7n6+SUNgcJbEi2VbADorX/bHTSFmcz7c3VNi7jMlNhHHuUJ85gOuLmE84sr0G/1ZcptMdiIL2Y+LXj3DsRA6XVdUvqhnh5fOEjiCNTGEEoauLYJTOrO5Vdj6BuODqgX3JE9TOiL+GAxFxRspLWquJwSVu79lCfEAS01qFH5sjnK3TfXunjPhNJ3GTVXnqdN0Npkkp54xO/ktwid2kkJkwaoaclTrNKa9+50
X-Forefront-Antispam-Report: CIP:149.199.80.198; CTRY:IE; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:xir-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-80-198.xilinx.com; CAT:NONE;
 SFS:(13230001)(4636009)(36840700001)(46966006)(40470700004)(6916009)(426003)(47076005)(26005)(54906003)(8676002)(186003)(4326008)(70586007)(36756003)(508600001)(1076003)(70206006)(316002)(336012)(2616005)(9786002)(8936002)(36860700001)(82310400005)(2906002)(83380400001)(40460700003)(356005)(5660300002)(6666004)(7636003);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2022 17:43:09.5792 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3320bd60-b823-4114-c140-08da17f4ea69
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.80.198];
 Helo=[xir-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0012.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM8PR02MB7863
Received-SPF: pass client-ip=2a01:111:f400:7e8d::618;
 envelope-from=edgari@xilinx.com;
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 fkonrad@xilinx.com, edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Connect the CRL (Clock Reset LPD) to the Versal SoC.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
---
 hw/arm/xlnx-versal.c         | 54 ++++++++++++++++++++++++++++++++++--
 include/hw/arm/xlnx-versal.h |  4 +++
 2 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index ebad8dbb6d..57276e1506 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -539,6 +539,57 @@ static void versal_create_ospi(Versal *s, qemu_irq *pic)
     qdev_connect_gpio_out(orgate, 0, pic[VERSAL_OSPI_IRQ]);
 }
 
+static void versal_create_crl(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+    int i;
+
+    object_initialize_child(OBJECT(s), "crl", &s->lpd.crl,
+                            TYPE_XLNX_VERSAL_CRL);
+    sbd = SYS_BUS_DEVICE(&s->lpd.crl);
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.rpu.cpu); i++) {
+        g_autofree gchar *name = g_strdup_printf("cpu_r5[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.rpu.cpu[i]),
+                                 &error_abort);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.gem); i++) {
+        g_autofree gchar *name = g_strdup_printf("gem[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.iou.gem[i]),
+                                 &error_abort);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.adma); i++) {
+        g_autofree gchar *name = g_strdup_printf("adma[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.iou.adma[i]),
+                                 &error_abort);
+    }
+
+    for (i = 0; i < ARRAY_SIZE(s->lpd.iou.uart); i++) {
+        g_autofree gchar *name = g_strdup_printf("uart[%d]", i);
+
+        object_property_set_link(OBJECT(&s->lpd.crl),
+                                 name, OBJECT(&s->lpd.iou.uart[i]),
+                                 &error_abort);
+    }
+
+    object_property_set_link(OBJECT(&s->lpd.crl),
+                             "usb", OBJECT(&s->lpd.iou.usb),
+                             &error_abort);
+
+    sysbus_realize(sbd, &error_fatal);
+    memory_region_add_subregion(&s->mr_ps, MM_CRL,
+                                sysbus_mmio_get_region(sbd, 0));
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_CRL_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -622,8 +673,6 @@ static void versal_unimp(Versal *s)
 
     versal_unimp_area(s, "psm", &s->mr_ps,
                         MM_PSM_START, MM_PSM_END - MM_PSM_START);
-    versal_unimp_area(s, "crl", &s->mr_ps,
-                        MM_CRL, MM_CRL_SIZE);
     versal_unimp_area(s, "crf", &s->mr_ps,
                         MM_FPD_CRF, MM_FPD_CRF_SIZE);
     versal_unimp_area(s, "apu", &s->mr_ps,
@@ -681,6 +730,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_efuse(s, pic);
     versal_create_pmc_iou_slcr(s, pic);
     versal_create_ospi(s, pic);
+    versal_create_crl(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 155e8c4b8c..cbe8a19c10 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -29,6 +29,7 @@
 #include "hw/nvram/xlnx-versal-efuse.h"
 #include "hw/ssi/xlnx-versal-ospi.h"
 #include "hw/dma/xlnx_csu_dma.h"
+#include "hw/misc/xlnx-versal-crl.h"
 #include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
@@ -87,6 +88,8 @@ struct Versal {
             qemu_or_irq irq_orgate;
             XlnxXramCtrl ctrl[XLNX_VERSAL_NR_XRAM];
         } xram;
+
+        XlnxVersalCRL crl;
     } lpd;
 
     /* The Platform Management Controller subsystem.  */
@@ -127,6 +130,7 @@ struct Versal {
 #define VERSAL_TIMER_NS_EL1_IRQ     14
 #define VERSAL_TIMER_NS_EL2_IRQ     10
 
+#define VERSAL_CRL_IRQ             10
 #define VERSAL_UART0_IRQ_0         18
 #define VERSAL_UART1_IRQ_0         19
 #define VERSAL_USB0_IRQ_0          22
-- 
2.25.1


