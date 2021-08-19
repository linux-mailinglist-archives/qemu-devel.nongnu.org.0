Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 570F83F1244
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 06:15:17 +0200 (CEST)
Received: from localhost ([::1]:44670 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGZSW-0002A8-CX
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 00:15:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38778)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZOD-0001lT-F7; Thu, 19 Aug 2021 00:10:49 -0400
Received: from mail-bn8nam12on2068.outbound.protection.outlook.com
 ([40.107.237.68]:31768 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZI3-0003XU-Dz; Thu, 19 Aug 2021 00:04:29 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CASyhWQ8JFi4+j91l2SQ8Nvc9mQkhelDvBrSCYjFIhr8FRIrpuguLSKRGnJsH7dlIBxgtDUmTdy7u/K1QX2QweoXy2jBI2w9I/w0ZPoVJcklnEpmJjRpfYqVhPsbfwGaljx+xA014AxUr+J3DwhwspcE4IxKt4dpL6edH5iTaHWJ4yHZ47ZyQgw8B5+/q7I9sHBeEaTJ0gSlHo6RCM3UzPAABY9HYEub3Ox7gvGQq0i/Bd/7djKbfR5N1G9WQrJcNElDb+/QutTHDn+U1tzDixk4tZfLmlw9qlb973rBxwf6WPHppmaeu1/fVaYWF3Y4u3nU1bSy8XeI3JC4K2Dd3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95zZzRzGCDodVH+xdpODeQu/TPGB6dp/xzBGyojrFMU=;
 b=I7Z912ifGW+82ET51M5SsVn2RTaeI75eAmjpQOaBJWN2qqgTkjVnNENuH8g0vmMN9Sjj+bOhRuSe30oBzS/9+wV1JLGlc2p3/Ho7glhhDUe+lt/ZLpVZ7GqJAc3NDZYQbnb8uBl2+GC7QX1yL/nBkrABvAN5k8h6kbVhJdhiP6HJy3f2LbXDToZV3nRlMtyGmNYo4F8/hKb4y4pYaATmAFMrV1IScgjDtxr1TG/D3A09Omcjhheqmi+hWmiJRJ1+eyGBeubwRLmYudl0D3ksXd3hZVo6CdZqkFCwL8UsbAm/uqXmljHR2msra49f9b2kPowbLzDpxXxv13DhxqHiyg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95zZzRzGCDodVH+xdpODeQu/TPGB6dp/xzBGyojrFMU=;
 b=lYRr48iANEfuxgBSc/Ayy2b6KHfk1hF1oZ18IOX4AIOU81cFeirQP92GBE7JQa835GEuniqybyPLK5hrmrnPQUfp27VnudYxs1gqADHCGTVdFdCP9gPBbmAF+OUrUM1WwEt0Bm1Ws9oST8ihuj8w0OmhSJdxqLWjX+q4wTNYRDs=
Received: from SA0PR11CA0207.namprd11.prod.outlook.com (2603:10b6:806:1bc::32)
 by BYAPR02MB5270.namprd02.prod.outlook.com (2603:10b6:a03:62::27)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.19; Thu, 19 Aug
 2021 04:04:24 +0000
Received: from SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:1bc:cafe::b8) by SA0PR11CA0207.outlook.office365.com
 (2603:10b6:806:1bc::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 04:04:24 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0057.mail.protection.outlook.com (10.97.4.123) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 04:04:23 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 21:04:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 21:04:00 -0700
Received: from [172.19.2.40] (port=52318 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGZHc-0000M7-SO; Wed, 18 Aug 2021 21:04:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 9/9] hw/arm: xlnx-zynqmp: Add Xilinx eFUSE device
Date: Wed, 18 Aug 2021 21:03:08 -0700
Message-ID: <20210819040308.675057-10-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819040308.675057-1-tong.ho@xilinx.com>
References: <20210819040308.675057-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ac1686a6-4f02-4d84-1367-08d962c66e1a
X-MS-TrafficTypeDiagnostic: BYAPR02MB5270:
X-Microsoft-Antispam-PRVS: <BYAPR02MB5270B578FD7F7DD2B401FBE2CDC09@BYAPR02MB5270.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8+LCNUz9ne52eLXT4Afj04OMWfiJXmXpem3CKYfXSIy+aitOWWcZJWhElyd4tMrgSMxg9emZkizCqJdr/ZoGFJLoJkCUUDl7FaIBTPL5He1Y7lt94qsP6fKMHT9nmRuke4wyhHaN/ZPzFoaGGIbZbsIlhkYLuC+vL3OlCutl6Wd948zB7ul/zPOW17PuTYgjykJQsjX2wx9NCh7HTeeSHU0rU2uSHdrIGr4glJhptsPjdHQyeZZJ9y+TnuTOeRKsPlnTcbAvnfxKMqSl0tIRbuHtZXArk03qEcI8ki+TyokWyYpOsKOv44LJSjg9WeNXL0o05bPr24Ik8I/+S73wZa778tHfqYhVQjhBpTfoOB8bVGInWMWLykoJxgg7dCHrHvZZcAniWHIXo0WFWtlCYrmyvcornXvXKS1VM58bMaQtR23Mx67AgXBpKe/avsRTv3f1m62PbgP/n6ofrKGysXZXulBQ7AYhjFO7sn1tUB14CVYM83KhUZgP7iKEIyhVSEa/WW074IZ0oHOe5DX4LeiJNtn3umZWGU1I1+bJ+qXFPKdS4Nyipo/ThfhClD4G2HNUUtc4Z16Q0H3zpdtCnqTWn71Iu7MOQISb8X2S/kU7OHn3D6NWNOWcRcmtD+Eu2UsK0ZUFZMpe6omi+oViTOVR11dN0yLPMR/+/ecAFuSCjwU6WTyqBLdHzJjnpJc6uLPnBfEXC5mLO0kQ7UH0twHWTjzKfvrrRTYNLqQYNyE=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(36906005)(1076003)(508600001)(426003)(8936002)(26005)(47076005)(316002)(356005)(6916009)(36756003)(186003)(2906002)(7696005)(7636003)(8676002)(70206006)(107886003)(2616005)(70586007)(44832011)(54906003)(9786002)(5660300002)(336012)(36860700001)(4326008)(82310400003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 04:04:23.9095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ac1686a6-4f02-4d84-1367-08d962c66e1a
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0057.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR02MB5270
Received-SPF: pass client-ip=40.107.237.68; envelope-from=tongh@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me, tong.ho@xilinx.com,
 qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Connect the support for ZynqMP eFUSE one-time field-programmable
bit array.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 29 +++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 2 files changed, 32 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 8e39b7d6c7..9e458ad1c0 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -65,6 +65,9 @@
 #define BBRAM_ADDR          0xffcd0000
 #define BBRAM_IRQ           11
 
+#define EFUSE_ADDR          0xffcc0000
+#define EFUSE_IRQ           87
+
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
 
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
@@ -241,6 +244,31 @@ static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[BBRAM_IRQ]);
 }
 
+static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    Object *bits = OBJECT(&s->efuse_bits);
+    Object *ctrl = OBJECT(&s->efuse);
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "efuse", &s->efuse,
+                            TYPE_XLNX_ZYNQMP_EFUSE);
+
+    object_initialize_child_with_props(ctrl, "efuse-bits", bits,
+                                       sizeof(s->efuse_bits),
+                                       TYPE_XLNX_EFUSE, &error_abort,
+                                       "efuse-nr", "3",
+                                       "efuse-size", "2048",
+                                       NULL);
+
+    qdev_realize(DEVICE(bits), NULL, &error_abort);
+    object_property_set_link(ctrl, "efuse", bits, &error_abort);
+
+    sbd = SYS_BUS_DEVICE(ctrl);
+    sysbus_realize(sbd, &error_abort);
+    sysbus_mmio_map(sbd, 0, EFUSE_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
+}
+
 static void xlnx_zynqmp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -636,6 +664,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
+    xlnx_zynqmp_create_efuse(s, gic_spi);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 07ebcefbab..876e8bf4e3 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -37,6 +37,7 @@
 #include "net/can_emu.h"
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-zynqmp-efuse.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -97,6 +98,8 @@ struct XlnxZynqMPState {
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
     XlnxBBRam bbram;
+    XlnxZynqMPEFuse efuse;
+    XLNXEFuse efuse_bits;
 
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
-- 
2.25.1


