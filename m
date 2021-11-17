Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 11A84454881
	for <lists+qemu-devel@lfdr.de>; Wed, 17 Nov 2021 15:20:50 +0100 (CET)
Received: from localhost ([::1]:34284 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnLns-0001gH-2C
	for lists+qemu-devel@lfdr.de; Wed, 17 Nov 2021 09:20:48 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLm3-0007iW-68
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:18:55 -0500
Received: from mail-bn7nam10on2088.outbound.protection.outlook.com
 ([40.107.92.88]:42784 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mnLm0-0004V9-6f
 for qemu-devel@nongnu.org; Wed, 17 Nov 2021 09:18:54 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqIZvSbwSxe6I6d9/ed/qoVBvfmUNT9cS6TmWLs1vEWOFip4/w1ikDwwlFm8L9pOAGMV/FbSI7jH3LjZRD3q3iJKK3KLQCJJvGXb5m0kcuplv3uBOZ47IcbfoBCbqvev/QagGRMCUgX6FJKFcqOZ32OhKYqbn1UZSBW4fG4z/mjfu62iSY68lNQ6Ai91WyEM5At/EFptF8IZ/SqGtNbs1P+x07SwiI5yqguJxwngVLqFkhNVoaxqwIPfgc/iwppIMVbcxE4CmNUwpyhBgZ5Io6gW5DtpZx6RkkYd6uf9+AkJJbQ2mdmzTLbPWDLstFKdoB4wri9qnVCwdJU3fyPTRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wz8hmEHxBLl9WyOQ63BJdnwMgJ4OuxQ7vW3Dom5DaUg=;
 b=TJE6MMiXARPya+bw3qMkJYyi9pt2Hm5mTkGPcHwkp0LAFPluo/RbhiutE3u2wTvWcJtuyvhuAqR2F/m5fxUQl9/V5047HVOdVG/8GZ54vV0IDJPRI9omzutfdmnERqN216I9bWca4WFdwsGnvml2vWavlg/7xT6niteBIz9p0fGS7LqsM4X1WVvRpNK1FYINsI5jY1Z9Fwy90JKQPBe7cH8dPaj63jl0tC8cVi+I6rcSfgftHHsuHy7YE5I7CO2pP62e7yG4QE7WMTE00Xo5PRQmQe7+EXcyL72Q0pjptAdL48jVLP7d7FgKyZMM763iFmrRXZY9FnOC3dSX0TC7tQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wz8hmEHxBLl9WyOQ63BJdnwMgJ4OuxQ7vW3Dom5DaUg=;
 b=DRJbZ5pud4ol/kzKX3kOaj9UaHE1RCgsv+dDYDiVWBVXM7X8cbHmLXcOVr3OczpuwXyKKA0I5JtpiVLYNLReBzeAm3Os3ECVe0qxP/KEvVcYrxtOb4roUhWX4o2a01QGn8GKS2JdBQvGav5GZIN4QgIFFR6mCWplyEVzBRALkXA=
Received: from BN1PR14CA0005.namprd14.prod.outlook.com (2603:10b6:408:e3::10)
 by DM6PR02MB6396.namprd02.prod.outlook.com (2603:10b6:5:1fc::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.26; Wed, 17 Nov
 2021 14:18:49 +0000
Received: from BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
 (2603:10b6:408:e3:cafe::a8) by BN1PR14CA0005.outlook.office365.com
 (2603:10b6:408:e3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27 via Frontend
 Transport; Wed, 17 Nov 2021 14:18:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 BN1NAM02FT030.mail.protection.outlook.com (10.13.2.144) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4690.19 via Frontend Transport; Wed, 17 Nov 2021 14:18:49 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 17 Nov 2021 06:18:47 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 17 Nov 2021 06:18:47 -0800
Received: from [10.23.121.164] (port=52602 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mnLlv-000Dy8-AL; Wed, 17 Nov 2021 06:18:47 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v1 2/9] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Wed, 17 Nov 2021 14:18:34 +0000
Message-ID: <20211117141841.4696-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
References: <20211117141841.4696-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70206761-a698-492c-6af6-08d9a9d52cf6
X-MS-TrafficTypeDiagnostic: DM6PR02MB6396:
X-Microsoft-Antispam-PRVS: <DM6PR02MB63969F9872113CD5906E645DAD9A9@DM6PR02MB6396.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MdM+hCiJcyW5uPRjVw4V0jv3PjqwAQ58YBe7N/f7mJmZarXWAIdyfW31htlIKx2Wd8/XlK8lsP4KSu6Up5YrUYawo1gnAfcI0c4Zdow9BvPjYdUwF0REWkocmxppPZjlg2w7jzyloSk7Fx/cuVEUQUzMKxF2+kttRB71gkH6QdDb32N9lQU1pAbfmg5vqZISHvi13JICQ8hK9MsQcOjyhstqm10/PgZMiE93nY1ln8Qct0YMkQfDHvZeGyez5vsFevpykUscsRzhPOJwieRan7yRedwOTv9QW2gdLN9Pvf+qIihkuB9jt6wlRIFIxAvL+vBeF9ls664fIHvABhBitw9TwA+yO5wzT+8pVy/U355EPJwhsbFe2YVxPbP55P71BRCCDGSPSQcE+gh4AENZh2RW8a71FC2hJw6UQ+QXcVF9HTcZ0FToTJjdAb4F4pZKM9ppnno9+IVvesQkmyLk3oAEG2MpgTw0OrP1roUVv+q9t8Vk7X5dbHmkPXzcQzMpum8OFKbKBmLLuYkIjX+Itt5t/qjZqijDxnFulRqALEv46VGy2Dm5cPoXk+IguhDUcyeGg8a6veQ4TbtUwcdXGmw8hoKbzOrn4HkfJ3i2Ejhyl/1/5jzEkDk1PS/Nnt/qzedk6TlzXLRlga5aHzud82qFi032VWkB/+cRRiv/n1hGp5MuIaPb9+NbPOH7LqbKqq9W9IHPK7duaJze8VcNClcV3s2+rr+sHVa2NN5O2JE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(5660300002)(426003)(70206006)(70586007)(2906002)(186003)(8676002)(9786002)(336012)(508600001)(8936002)(2616005)(44832011)(6666004)(356005)(1076003)(54906003)(316002)(47076005)(7636003)(36756003)(36906005)(36860700001)(26005)(7696005)(82310400003)(6916009)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2021 14:18:49.5621 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 70206761-a698-492c-6af6-08d9a9d52cf6
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: BN1NAM02FT030.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB6396
Received-SPF: pass client-ip=40.107.92.88; envelope-from=figlesia@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
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


