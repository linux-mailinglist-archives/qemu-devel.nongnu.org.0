Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E42293F4FE5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:52:07 +0200 (CEST)
Received: from localhost ([::1]:34362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIE7C-0000Al-Q8
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:52:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33468)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4i-0004YC-EL; Mon, 23 Aug 2021 13:49:32 -0400
Received: from mail-co1nam11on2045.outbound.protection.outlook.com
 ([40.107.220.45]:40684 helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4g-00018k-30; Mon, 23 Aug 2021 13:49:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dXTNwdyzxZJ06fIf/tKn0rXj9L5BKD1r+IkR73UxW9DfB49r2enKHXqKamzahadvnz/9zv0nl2QVRLG5hjDWNT4sbafDvq9hDApTN2mCEGCaXD92OO08bNjR8c0aQ1uku/AFb2fuuZ7nztBtHyRyKSCckusQbHgVVQdAQ4aKQT2VO5eeA9SEgcd0oQggydJA9zv4X5s4TQE69POrnhja5fAEs7UC5RvYn91p3cDMAvm+xkeZl6tUvtbzhpR/8knqiHOcqtG08n0tWG27RCOYVksVSj/obOtURzdBDoaIuB0JwQ1c80goxW4Y2FQTnEWV9bFskVg1OKdT/0wozdOTvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95zZzRzGCDodVH+xdpODeQu/TPGB6dp/xzBGyojrFMU=;
 b=Iv2/D04dqhjxVEfLYDctPOPJLnHib60M9vOolpTXkBAGFhuuHLXp0qyXk01XjmBbbp0LUYQqz1ArfpWlb+ZCo4ntDQ+vVf8FwYP3ZRqlj4AJNHcENJjHFkPOBxjmpdWM87724fni3FluTZowsJJJvxLvulOPR100DlfYc1pfWMSXzz6LeljTYk+HNhDqtgpuWih6RAmsnZjTjpFy+QottNLsLoJm+diRoirOgERAH9i+ICjpM6zTIUmfeN3/VXvwTdScWQ/xuUa8xjdn6DNrcspme5c9Da61oXw0xOTXgKhVx56RxVgyU/iDvnkVtYl9wp8J/CgfrWJrG4nSdnFeDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=95zZzRzGCDodVH+xdpODeQu/TPGB6dp/xzBGyojrFMU=;
 b=m/jLR6Wsb/p+cNsswdoBw2/kZBUTh0PHU4gx7hCf2onXE2TAev9HqQ0SwXPkAysX2jvl4FI6vxj4zA7hbKtNGP/oMTNQZkOkdeaqw0jc4z30XHdQvBYtqMelXsvOTy6KSWMZ4w0TBiFclqvFpIaPTkDpdUByv3L4f0vnCSq1YQE=
Received: from DM6PR04CA0006.namprd04.prod.outlook.com (2603:10b6:5:334::11)
 by PH0PR02MB7190.namprd02.prod.outlook.com (2603:10b6:510:1d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Mon, 23 Aug
 2021 17:49:26 +0000
Received: from DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::d3) by DM6PR04CA0006.outlook.office365.com
 (2603:10b6:5:334::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT035.mail.protection.outlook.com (10.13.4.78) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:26 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-SH; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 8/9] hw/arm: xlnx-zynqmp: Add Xilinx eFUSE device
Date: Mon, 23 Aug 2021 10:49:23 -0700
Message-ID: <20210823174924.201669-9-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: e611c668-e1fa-4f2c-3d5c-08d9665e5990
X-MS-TrafficTypeDiagnostic: PH0PR02MB7190:
X-Microsoft-Antispam-PRVS: <PH0PR02MB71905740B490A05D48567660CDC49@PH0PR02MB7190.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u3AC9tCY1uMrL/OxlA8XmTit+MEGzZCGadu293Xz001YIuOYS3sgGEV21ciPvkbR2dGzMQCZl8LvJw85mSd4DeeF/1Oaw7nmBHSeb+dRZnwmRYYxZUnw+OlkppFNhpimiik7oN4i8ynpBBce/VwnzS6chMTl7oKcU7CQ3lZegUDf4kxzC8eZPhwz0/2WkPLxrcseRpMk0Zammh/JgLPsHJIWTzsmqbCNatvwtkaWuXqIeBAmrh2r35W++jGcSjULvq4RIqqZYmGL6jmdHpafxvTT+IQcd0MNhncSv+IwEM7w5VE/sy0mToyhqyv25ghgBryeEEbcek+vchibDeGkl4vDAGgW+gp7S6lIUSS8ck8TL0fgrD3ATxgRg4K1QB9FcOLVBjTcOlQKP46mnzT0HjsCjX8nhqoRAbGxTXmeT8HwZ/WsJmp9DyAAJTANoA+kLsydnWjUwzRrseUFB1my6OcLTiRJcBeL1MpYbD/V2GLdlzmkz0gV4UUj648MBfmWbBkZA9JB2vk2EsogBCijpqNVJPTW+Qs4ifRucK7D+bHSDVrYIsCfzuCJXhabcQT65vwbb0+cw0Nplexj0904bilgvcbzWZuFc0XA8I6/hWkdwSA0NcuiqfMfCpSZuQYHhNwmBfrZjfP4g+/x6Wo2hRAf56rVK5gEKbxAK96ZB9jyWjT32Thf8TZdprzsQ3ymqMMdbiV14LMIR/86bbZlVgY4VCLgd+KzHFIHy6pTlr4=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(39860400002)(346002)(136003)(376002)(396003)(46966006)(36840700001)(8676002)(186003)(36906005)(36756003)(70586007)(6916009)(47076005)(2906002)(70206006)(336012)(5660300002)(26005)(4326008)(36860700001)(2616005)(7636003)(44832011)(7696005)(107886003)(356005)(9786002)(426003)(82740400003)(1076003)(82310400003)(478600001)(316002)(8936002)(54906003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:26.4310 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e611c668-e1fa-4f2c-3d5c-08d9665e5990
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT035.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR02MB7190
Received-SPF: pass client-ip=40.107.220.45; envelope-from=tongh@xilinx.com;
 helo=NAM11-CO1-obe.outbound.protection.outlook.com
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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


