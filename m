Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 076EB4651F4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:44:51 +0100 (CET)
Received: from localhost ([::1]:39926 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRms-000706-3Z
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:44:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRiq-0003Ij-93
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:41 -0500
Received: from mail-mw2nam08on2068.outbound.protection.outlook.com
 ([40.107.101.68]:49006 helo=NAM04-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <figlesia@xilinx.com>)
 id 1msRim-0008RJ-5E
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 10:40:39 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRCiqFQo+HxadknYaUnR63IZ3iGh+nHCf5gQv0uHSsVlVSwZqsGa98XIYkV6PzAC8Oeu5S0TJwcM3H0Ls8gIbYlxslLqL6AV2NGf0Y1cO295gZ/gKgI5YH/jxyBf7TEnm5deCRDkbzU9LYooB0AqyH2J/oFNBno6RqiOceyuXdKg8ooueQo5ad3AC/Gk7TdQIlpspmpUXfrjMQ27BdC+oesNic0gtoPgg0TSEoeTPUZZzv2Yf5mA8w3P3mFt/laAJKY1az/9tB9zjnOuFmdbKSprszGRGtnyAHwFD/fIjLBrZoCvsB5tcmyuu/5u6N+5dDppYEYXhUMrE7oNEEkjZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V3B1WoQ1CgtbxYSGVKbttP96gW8NZnRtUQj3wX21ijI=;
 b=Gwex/zrIN8CGKACcWcjPuGoTR5WFcuijNSUF5gy4rTIumzwRdPQi8U1eKX8rxvgaShx6z7t3BsrF0ajtdjhw9n9Y1YGmVYqqGCTfDmFD/LITZOOfgsZGuqzrAttuNuor1nHG2XOPgXGRwF/obJbOth7SSv5pC/Bj279FW9dIPX09+z2zKwYz35ysHl3LRVOHtjdR++AtvJdzoLjRsthlSYED0JcTRlr65Uh5nUVPQeDU7P8bL5IJbGEqtSqRsMlSkgggJlR44Vuh1/gVIQQjuCRtqM76JvnlIBdN71jsOYRUXOl7j9P7EY0+NQKt930tQJSgdTpzn8HK0sHexQEzxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V3B1WoQ1CgtbxYSGVKbttP96gW8NZnRtUQj3wX21ijI=;
 b=iHPzNaQ/QyEg7JYa49FMqjSIVnnmuU4K+XkSImvwdR70R16Clh9gXEt1lC9Dx31sI4Bpic9YjzzAYM4e0iqtwtpqBlOSocLl/ghwJX917Z+cwhiaN0zc0UBQYMhEtMWfPs8G7b3j3tWAfvJKgGOymOUFGHOG0Gji5DnrDFwrZHQ=
Received: from DM5PR20CA0040.namprd20.prod.outlook.com (2603:10b6:3:13d::26)
 by PH0PR02MB8472.namprd02.prod.outlook.com (2603:10b6:510:dc::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.22; Wed, 1 Dec
 2021 15:40:32 +0000
Received: from DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:13d:cafe::10) by DM5PR20CA0040.outlook.office365.com
 (2603:10b6:3:13d::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4734.24 via Frontend
 Transport; Wed, 1 Dec 2021 15:40:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT016.mail.protection.outlook.com (10.13.4.77) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4755.13 via Frontend Transport; Wed, 1 Dec 2021 15:40:31 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 1 Dec 2021 07:40:30 -0800
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 1 Dec 2021 07:40:30 -0800
Received: from [10.23.121.245] (port=59039 helo=debian.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <francisco.iglesias@xilinx.com>)
 id 1msRig-0002FY-Ef; Wed, 01 Dec 2021 07:40:30 -0800
From: Francisco Iglesias <francisco.iglesias@xilinx.com>
To: <qemu-devel@nongnu.org>
Subject: [PATCH v4 02/11] hw/arm/xlnx-versal: Connect Versal's PMC SLCR
Date: Wed, 1 Dec 2021 15:40:14 +0000
Message-ID: <20211201154023.13931-3-francisco.iglesias@xilinx.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
References: <20211201154023.13931-1-francisco.iglesias@xilinx.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c3ca83cc-6f24-4b3c-cbbf-08d9b4e0e8a3
X-MS-TrafficTypeDiagnostic: PH0PR02MB8472:
X-Microsoft-Antispam-PRVS: <PH0PR02MB8472F4F328C846955D3B3F95AD689@PH0PR02MB8472.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:167;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: QNT/Y/XZJHgz0tJ0LjvbyZG9glYTdgwde7+/HG3OVwJCxmjidgjO9/NIu5WR1tSXynjgEIrrAh3AKLkSvZffTFWNLav6l0GieBEZUlTr5tOXYnVyBK4X1q41jMx19FaoWhf0Of5whAGUbEyjNjB1hFCi4uVuEa0OM0Jj1t6RTFMdxxkMb+4s4rsF377Wi7no0bsjkKszDEtTap9/rO75CSNu2bSe4K5/VPbcH3kzKUy/5s0/JoWn5YOqNkXegOtIviwmruldId+14pLFJaOyvfgb1pH8RcuBzjdkoPulc5T2YpvowzRdkm27EMjHKpIIv2NxRVOA8Lb+GzlXs2CMW9r4e92voAxqTAaJdDfrNwtap5Ybm95Jw0EnvT4NuBv5Y0iwzIMORPVmEtsZvbEJuHkpxRlQOMBJ5wuyFMXExsyEwInmSCJqlwFnab2nsTBs1w+8B+JZj4u5elkaLhscNISP42BFE/vCYDwuhcJDLdEb0Zi1RamzSIH7CZk1WsMgTRND5MWucra32XdSLawchx00o84vt8KQJtGCus195/kedk+gFsuouAfSvM3KPjwEe7URA4o4k3+9jnbsMMRaJ6xuOslTeLvrqpGWX6z0DK9+S9xsBS2CkpgXu1ZmB4eM2wlIHw5/+x2s0mL2L//hnRlbAa0E3Mhj6LR6ShzKpETiRYJtXMDhY6UhUQP9KTBhuU0R18cntTdVZLLgTGNA9NtgSnQlBr+j4slrFZQZVkQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(36840700001)(46966006)(5660300002)(2906002)(7696005)(44832011)(8936002)(6666004)(36860700001)(4326008)(7636003)(2616005)(82310400004)(356005)(8676002)(70586007)(6916009)(1076003)(54906003)(9786002)(70206006)(316002)(426003)(336012)(47076005)(186003)(508600001)(36756003)(26005)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2021 15:40:31.6014 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c3ca83cc-6f24-4b3c-cbbf-08d9b4e0e8a3
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT016.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB8472
Received-SPF: pass client-ip=40.107.101.68; envelope-from=figlesia@xilinx.com;
 helo=NAM04-MW2-obe.outbound.protection.outlook.com
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
---
 hw/arm/xlnx-versal.c         | 17 +++++++++++++++++
 include/hw/arm/xlnx-versal.h |  6 ++++++
 2 files changed, 23 insertions(+)

diff --git a/hw/arm/xlnx-versal.c b/hw/arm/xlnx-versal.c
index b2705b6925..bb13b07e79 100644
--- a/hw/arm/xlnx-versal.c
+++ b/hw/arm/xlnx-versal.c
@@ -369,6 +369,22 @@ static void versal_create_efuse(Versal *s, qemu_irq *pic)
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
+                                sysbus_mmio_get_region(sbd, 0));
+
+    sysbus_connect_irq(sbd, 0, pic[VERSAL_PMC_IOU_SLCR_IRQ]);
+}
+
 /* This takes the board allocated linear DDR memory and creates aliases
  * for each split DDR range/aperture on the Versal address map.
  */
@@ -459,6 +475,7 @@ static void versal_realize(DeviceState *dev, Error **errp)
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


