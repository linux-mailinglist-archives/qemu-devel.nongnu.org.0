Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B9345B89A
	for <lists+qemu-devel@lfdr.de>; Wed, 24 Nov 2021 11:46:17 +0100 (CET)
Received: from localhost ([::1]:57080 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mppn6-0002M4-Dt
	for lists+qemu-devel@lfdr.de; Wed, 24 Nov 2021 05:46:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:44780)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJw-0000qs-8p
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:08 -0500
Received: from mail-bn8nam11on2056.outbound.protection.outlook.com
 ([40.107.236.56]:28480 helo=NAM11-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1mppJt-0002bk-HZ
 for qemu-devel@nongnu.org; Wed, 24 Nov 2021 05:16:07 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Dz+IkqNtGUbEO0ydBs2wrbPcfr+EHcQnB4lpxM94kVj7/a6fXiIL7ZQAFyFnfZqeLoECUCthVe/EHItt/TdZPpwa8Y+IK2ojfr0YavK1H3EY/xFql+mo2TddBoPYUqwdyb6BpHEo7bHbcoqaKfcZC2b3dqragUjg9pr6u6EhtUCX4OmU0MZJdjJgIh8heGtp9o4201NnJsUoJT43rx+pQFC6xi44ISphxVF22Vpf1O9olhDEq/1SiNC3RR93vG2AVxrXTfAR9uCfed3eb6Twh5SJAqR4NsPkx+CP0ARHYOhpGUwWaRZVT33vM7KZRvlr2wTpnpAwIKkC21tQPDrspA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O6wFSjjFxQiIbqOG6eN7sadsXSsJa3HX/wNFLngggJE=;
 b=noxL7eUTosLjM+UULkG8cQQj9T6ftFTDFwo6e9QSD16+fBvPTz6AvyXFLYbysUbXVp+PhhAt7rNtt1Aw/zukSkgwO71qJ5VeBUupgM8QElGMjP/mY1fUjBLiZUHRSTzW631EQgHCcrfAr++f05eZexSPA+FDWQo8kJACNbqX81ioHvK8MzEVVeiPv05sPkKYLEmJnUUyi4JpCeBC2I/bSD8XEBEHVbRJo0Vo3QXFyJt3FwtKoUe6yW7lFd6BpcYSoyrl0dcB+o6tqlr7uZn/NbgUzoVK/915ONSZ3ebtZUC9GCzFOMzlYz/P9X+gV9dYNEqFLezgRPg2Zia1210Trg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O6wFSjjFxQiIbqOG6eN7sadsXSsJa3HX/wNFLngggJE=;
 b=dQfQKWcP4+q0Qdz4TR5ETEV9tBUMW+Js3fQlWcTLK66bk1rptpmbcTUoIYkEZ4Ml4FX5Fk0dubGzGKEduSsL3qEiodzbmulLb6DSoRngGqCVsniFO1G/tyP99quCRsky3Z9CH4O8Gki2iPDvGyuTfhVXMuD1D+R3rUKeyD7rTzc=
Received: from DM6PR02CA0043.namprd02.prod.outlook.com (2603:10b6:5:177::20)
 by DM6PR02MB7084.namprd02.prod.outlook.com (2603:10b6:5:256::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22; Wed, 24 Nov
 2021 10:16:03 +0000
Received: from DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:177:cafe::9c) by DM6PR02CA0043.outlook.office365.com
 (2603:10b6:5:177::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.21 via Frontend
 Transport; Wed, 24 Nov 2021 10:16:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT049.mail.protection.outlook.com (10.13.5.68) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4713.19 via Frontend Transport; Wed, 24 Nov 2021 10:16:03 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 24 Nov 2021 02:16:02 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 24 Nov 2021 02:16:02 -0800
Received: from [10.23.121.192] (port=50645 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1mppJq-00036z-1V; Wed, 24 Nov 2021 02:16:02 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v3 02/10] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Wed, 24 Nov 2021 10:15:47 +0000
Message-ID: <20211124101555.1410-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
References: <20211124101555.1410-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 777d2dd4-0037-49ca-1f1f-08d9af336bb3
X-MS-TrafficTypeDiagnostic: DM6PR02MB7084:
X-Microsoft-Antispam-PRVS: <DM6PR02MB708432BE78D619A0D39DEE0EAD619@DM6PR02MB7084.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4Oq/NoiSV2pAgiDkLJEX6rtItVMtIJ+FSFzQJ00P1u1sRPME1mtpCX5xhsPGtTz86KAV7YwaVo5auEBiByR+Vc8nfG8XyvDLVPEHzRJwTbv8NyXElzlKsN2Chow1qrkoRQ4DBKWDJuOxAOCSRYPStxIrfRkcGWCfsoKdwI2lF5IWagCsnKtRcDp2C7qX21Baekm3oLQiG/xMWpElUqI5+zF3Es2OqJUFnNiQWGpT5aJf+0I5g09CgSyW8v0cvOe51B1IVvEDNz618wt25Fu1JLs7+GjVMKcaUaaoqKh6Z8mIzoiGFhaNUsltq1uEtW+XGkpka1DVmdx6xIYKXweyq6/ot+0q4Pj1PbemTV9/SU7nSL0+uwh/8YWIdaOoV1zRkZqnaGUsBzPi63IoUCd1JZMNPfgoIGg+s7zgT90K0Q0i2RI0ox7/+VlnU4EehQxBdq/vKvIn3vfdLaiSNJ9J0xg/YDiEELSYoihOA5enuK3UbbQBllmkHZHWebrPrFxg3rFWeRbomh8SyF5vDAmZ5/WgOcGRlBa7RFhN3P1FNA5+oU1g2zaQ82yP+A2HByKBlRXr2a+e8a0GMgI/GRtCn79qjOTfoNdes9m7ssyo2h8AjsXFK3OQK6dY6IxTrTHKBe+p7++9Pocv6tkaRz3rnPgU4dhCjO+2VByaLBSyp5EiaEnWme0jDeZliCCXcr3tqoGvgA1QAdHtdsENImtWRMg3nxergYbSdyC7Rbh0v8w=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(46966006)(36840700001)(7696005)(44832011)(6916009)(5660300002)(186003)(8676002)(508600001)(4326008)(36860700001)(8936002)(70206006)(2906002)(336012)(70586007)(36756003)(426003)(6666004)(1076003)(9786002)(316002)(82310400004)(7636003)(47076005)(356005)(54906003)(26005)(2616005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2021 10:16:03.3810 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 777d2dd4-0037-49ca-1f1f-08d9af336bb3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT049.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB7084
Received-SPF: pass client-ip=40.107.236.56; envelope-from=figlesia@xilinx.com;
 helo=NAM11-BN8-obe.outbound.protection.outlook.com
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org,
 frasse.iglesias@gmail.com, alistair@alistair23.me, alistair23@gmail.com,
 philmd@redhat.com
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


