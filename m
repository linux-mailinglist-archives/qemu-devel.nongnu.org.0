Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A22245A0BF
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Nov 2021 11:56:20 +0100 (CET)
Received: from localhost ([::1]:42752 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mpTTH-0007Nj-I0
	for lists+qemu-devel@lfdr.de; Tue, 23 Nov 2021 05:56:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35930)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpTRZ-00062c-Lp
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:54:33 -0500
Received: from mail-bn8nam12on2061.outbound.protection.outlook.com
 ([40.107.237.61]:2626 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mpTRW-0003Hk-BH
 for qemu-devel@nongnu.org; Tue, 23 Nov 2021 05:54:32 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oEqcAimvcTRNRYM4AMOWNXjyGkpXeDQ46GeL4s3rR+CQI55FKQZLXkL3Av7D2d7GEcoSJuh7E/AOR/KIYy9B35etFQTo4gIvIaDSqK5LzuiBZPszqypa1lbIS485ObgC0OvlilodawNA6nyY3D9biawyUaMGstsQoByJp6A2jwaomB5ah9kAV0M3g9loW6Xrk/MzyK+LxpuuR2M95mCE+ZmsyRJuVnpI/D0M8GzhHyv/3OYKmbdrvplr8vxDYrsEwDNtEM7+9B62H2jFpu+9FB5Ayxu39g7oN1vJrWwUh9LxjN5TsGVCn0AqfihbD0MegALu0tI/L/PmeePe0a//Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6wFSjjFxQiIbqOG6eN7sadsXSsJa3HX/wNFLngggJE=;
 b=H/OkHmW811AqRxlIIAFIn5uf6D8mGGcnJSdidyd1PO6Ce8YKJXUDanUwPj/c0+HH4yqpUMSJUjjS57bsTQxI4WYGMG13QP0z2RcZnTdit/Ll5YB76zOee6t1fMPT7DVWtVy3smN4Fb1MbyYxvkCp+QJ4Rh5hH1NomZxtY8t6pj05z1tZFYxt/lEhC6O55EtIJoqU7VvofXlEZdu9Uq8ql7Cy23eUS1JJSyysTrJXjOPOakE60TgZl02fkeX50TOcDDWyKvmw8bZ428HcafcxCyIj5AlXatao8H2iFZJrTSEqWUeceHL+Hc7qTHNRJNAUmZZwcZK+rO6rZ1YLRcmrPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6wFSjjFxQiIbqOG6eN7sadsXSsJa3HX/wNFLngggJE=;
 b=oRyyYgMj/rfo1rn9UCPQah94D9T3L6yT+rHMBNzOCdTdxSfd0nre08sdD26UuWDEQZbP497qK9TPOtLtnSrpyIR055hhXhPRralFdVXJRE9618M8WeR2juE6cQgxSXCxJQl/Rnc7uJ7DO92NXPfTcgE8ITYiFEAMw5Bvf9qBQlw=
Received: from BN9PR03CA0752.namprd03.prod.outlook.com (2603:10b6:408:13a::7)
 by DM5PR02MB2569.namprd02.prod.outlook.com (2603:10b6:3:40::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19; Tue, 23 Nov
 2021 10:34:35 +0000
Received: from BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:13a:cafe::45) by BN9PR03CA0752.outlook.office365.com
 (2603:10b6:408:13a::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.20 via Frontend
 Transport; Tue, 23 Nov 2021 10:34:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT049.mail.protection.outlook.com (10.13.2.89) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Tue, 23 Nov 2021 10:34:35 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Tue, 23 Nov 2021 02:34:34 -0800
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Tue, 23 Nov 2021 02:34:34 -0800
Received: from [10.23.120.28] (port=57995 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mpT8D-000GX6-VD; Tue, 23 Nov 2021 02:34:34 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v2 02/10] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Tue, 23 Nov 2021 10:34:20 +0000
Message-ID: <20211123103428.8765-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
References: <20211123103428.8765-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 14669212-a19d-44f5-d54e-08d9ae6cd7f1
X-MS-TrafficTypeDiagnostic: DM5PR02MB2569:
X-Microsoft-Antispam-PRVS: <DM5PR02MB2569F471A1EAA9E207920A9DAD609@DM5PR02MB2569.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MgwwiwcHpVH0bGSmXXSNOSZeuiJeo20sayCtN3ZK+ni3NSzKa7of2/QtO9nMZyUdWpX2//zkfRXFmdJDcjwwN31dK25rh/klp4K9IHxq0GM4+I1q9zLfwO/5bg3YBGdtY0ZPst/+npBocuLqc/ywuX9ncmaB9svf+rUA+apgld+EqhNr69/sGrcKd4Hi11GH0aFCkumrU3J+0rX2BcnNsETSPRj/Otb0S8dX9u/TvmXAia7sB/SSwizn345lNeEZ6M6jFrycL2/p7/rWtPjJRoPQD7iBLPRjUHwszkHDe0RqnDjljoilbptxS5A6bECDZ6A/VPQxWhqth+n+hpQqiZvCDmgLZrq4ps1zGI6ycdz1t+nOArKHWbl+sE2ir0v+iyefPakkXi6efyIu0JnCFZQFu/xTIPWF4HMRUbLrLNd7R/e+XsN4mcvuoHL03+wWOPtCXPMEeMPPqpWpSUTtcrnF11F/YXsztWTT2xzjqLhk0e8I6jL9qkObc0SvwaZogFv5uu3r7Et+Bq1W7geX3QVoDVVTN9/8Z9J0xSUHrySwtRUJkiBaMilCZtlREovO37La563GBa7eaqu0jEtnWaWEBBksOfLwXzA2GR4jdGWM/nEv/l5H799KZdoY7eb/qBmnpGqzmtUkSTvToLeEREiw2v39RaXDjw3ikdOGh4Tv34yWoZcX9489xvXlIWjQmsUhpo/2PI1+4Qr/LBVqH8PX5hoj9EWN7uFUqIc7Z+A=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(508600001)(36906005)(316002)(336012)(44832011)(8936002)(426003)(7696005)(7636003)(9786002)(2616005)(54906003)(36860700001)(6916009)(6666004)(70206006)(70586007)(186003)(1076003)(26005)(5660300002)(356005)(47076005)(4326008)(36756003)(8676002)(2906002)(82310400004)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Nov 2021 10:34:35.0867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 14669212-a19d-44f5-d54e-08d9ae6cd7f1
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB2569
Received-SPF: pass client-ip=40.107.237.61; envelope-from=figlesia@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
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

Connect Versal's PMC SLCR (system-level control registers) model.

Signed-off-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 hw/arm/xlnx-versal.c         | 18 ++++++++++++++++++
 include/hw/arm/xlnx-versal.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b2705b6925..08e250945f 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -369,6 +369,23 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
     sysbus_connect_irq(SYS_BUS_DEVICE(ctrl), 0, pic[VERSAL_EFUSE_IRQ]);
 }
 
+static void versal_create_pmc_iou_slcr(Versal *s, qemu_irq *pic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "versal-pmc-iou-slcr", &s->pmc.iou.slcr,
+                            TYPE_XILINX_VERSAL_PMC_IOU_SLCR);
+
+    sbd = SYS_BUS_DEVICE(&s->pmc.iou.slcr);
+    sysbus_realize(sbd, &error_fatal);
+
+    memory_region_add_subregion(&s->mr_ps, MM_PMC_PMC_IOU_SLCR,
+        sysbus_mmio_get_region(sbd, 0));
+
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
+}
+
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -459,6 +476,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
     versal_create_xrams(s, pic);
     versal_create_bbram(s, pic);
     versal_create_efuse(s, pic);
+    versal_create_pmc_iou_slcr(s, pic);
     versal_map_ddr(s);
     versal_unimp(s);
 
diff --git a/include/hw/arm/xlnx-versal.h b/include/hw/arm/xlnx-versal.h
index 895ba12c61..729c093dfc 100644
--- a/include/hw/arm/xlnx-versal.h
+++ b/include/hw/arm/xlnx-versal.h
@@ -26,6 +26,7 @@
 #include "hw/misc/xlnx-versal-xramc.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-versal-efuse.h"
+#include "hw/misc/xlnx-versal-pmc-iou-slcr.h"
 
 #define TYPE_XLNX_VERSAL "xlnx-versal"
 OBJECT_DECLARE_SIMPLE_TYPE(Versal, XLNX_VERSAL)
@@ -78,6 +79,7 @@ struct Versal {
     struct {
         struct {
             SDHCIState sd[XLNX_VERSAL_NR_SDS];
+            XlnxVersalPmcIouSlcr slcr;
         } iou;
 
         XlnxZynqMPRTC rtc;
@@ -113,6 +115,7 @@ struct Versal {
 #define VERSAL_XRAM_IRQ_0          79
 #define VERSAL_BBRAM_APB_IRQ_0     121
 #define VERSAL_RTC_APB_ERR_IRQ     121
+#define VERSAL_PMC_IOU_SLCR_IRQ    121
 #define VERSAL_SD0_IRQ_0           126
 #define VERSAL_EFUSE_IRQ           139
 #define VERSAL_RTC_ALARM_IRQ       142
@@ -178,6 +181,9 @@ struct Versal {
 #define MM_FPD_FPD_APU              0xfd5c0000
 #define MM_FPD_FPD_APU_SIZE         0x100
 
+#define MM_PMC_PMC_IOU_SLCR         0xf1060000
+#define MM_PMC_PMC_IOU_SLCR_SIZE    0x10000
+
 #define MM_PMC_SD0                  0xf1040000U
 #define MM_PMC_SD0_SIZE             0x10000
 #define MM_PMC_BBRAM_CTRL           0xf11f0000
-- 
2.11.0


