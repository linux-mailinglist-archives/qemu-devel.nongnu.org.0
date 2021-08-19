Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 59BB23F1240
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 06:13:02 +0200 (CEST)
Received: from localhost ([::1]:36198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGZQK-0004ha-UG
	for lists+qemu-devel@lfdr.de; Thu, 19 Aug 2021 00:13:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZOD-0001bg-F0; Thu, 19 Aug 2021 00:10:49 -0400
Received: from mail-mw2nam10on2058.outbound.protection.outlook.com
 ([40.107.94.58]:65504 helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGZHv-0003QX-3d; Thu, 19 Aug 2021 00:04:20 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iAqxONQwLNWnLwMpWlvjG/l+7HWGOe6l8nyWzGZDStIQucoZHAMm9ew/NbHJG7GfTx45TVnIjC3Sr64nyYvNOOiKPaFrftASc+uWDCxgeVYMmYldRonJJRg0llgNzQKJlubHQ0CUeRc+VsuSnQh6mv3cjJtp/zxWq/GEr9mBLx71txohhjd0zQPXctdMP0BwI4eYSJH+4lOlZuPN2YspTO1Y1v4rRJ4vlgzSYN2HB2t6weOgxv06p4i8p4MT96g1/phsBSKCaGpYQXKl8I8K1jS+t6Zy1CTu0aSneCWqo3c0mbxJ76RY3GFVfJWg1aERntgH+tdvX12a4LBooyWmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb2//A5cd9Go/H3I/4WznsdIuptTG+ImJM3bJlGL4cw=;
 b=nNm9Xt7f0ev2kI3IOLxfUTn7UUZIBcyrGbPf6qLYN9B02dRI/f+MA2rvi0smJ4sfXH/BHzwXL7tVocnwEgqPwp4CY1j0GC86f0tpI++lhTNmrh2Y4foOwEy7skF1v1eyc3kkf2BfI2BFjAOKPlqfTJkG7R1Hi2q0pvHIEvfZkTeBTtR/LWaNgoqZS1HX8BP20QcQ/wbGzQ3fzcXV9jdkP3GmXSBY6lGjGEZog/TXfyv1u6ufqZ9+Co3kptWMVKuyz52JI3+jnCR4y6knk3kTHVd+FDf3KWQuZq18LPfPSsFXvWGMZ/m051pa/mBMmjdQWqXfV+OI42b2VvIQ/5DwlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb2//A5cd9Go/H3I/4WznsdIuptTG+ImJM3bJlGL4cw=;
 b=sQ7dNAwnEmZOuVljTpqnRDZ+J1zZjJ+KKaqwSxcVKYy76liW5gtXzSNlEqGlfIZk+m9ovWRUcxJf3rFu3Vos8Ot4ldpK0ZgWH1oe5Gbzn2BC4YRgUiFJVKnpPtFr0WpMEoIkALxwtzZ180H6I4FLJ+htY5PeGL6p81abT39TsR8=
Received: from SA0PR11CA0022.namprd11.prod.outlook.com (2603:10b6:806:d3::27)
 by SJ0PR02MB7246.namprd02.prod.outlook.com (2603:10b6:a03:29f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 04:04:14 +0000
Received: from SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
 (2603:10b6:806:d3:cafe::e5) by SA0PR11CA0022.outlook.office365.com
 (2603:10b6:806:d3::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 04:04:14 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 SN1NAM02FT0025.mail.protection.outlook.com (10.97.5.19) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 04:04:14 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 21:04:00 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 21:04:00 -0700
Received: from [172.19.2.40] (port=52318 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGZHc-0000M7-Pq; Wed, 18 Aug 2021 21:04:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH 8/9] hw/arm: xlnx-zynqmp: Add Xilinx BBRAM device
Date: Wed, 18 Aug 2021 21:03:07 -0700
Message-ID: <20210819040308.675057-9-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819040308.675057-1-tong.ho@xilinx.com>
References: <20210819040308.675057-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d13f91ab-7182-480a-50bf-08d962c66834
X-MS-TrafficTypeDiagnostic: SJ0PR02MB7246:
X-Microsoft-Antispam-PRVS: <SJ0PR02MB72463EF691FF3059E6A9EFFBCDC09@SJ0PR02MB7246.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lgpcv0/ABHo5JzX4kuEF1MvpSCED6g/jNNTn6vYfMynDLZP0Qt5QaR+32hBs9uIjfKuI+Ns7uBBeSGCCfXrY+BoOtm89c2cVNDljt5CfvTzP2ZaRRPs/bSxgLy/YHwPdVLaLzyJAC8q8CzW6vFhvsnSd75tkpehx6Hnjzl7F7UXe7raFniwnlBjsCbWMPuNL0YczoEVZ6ZqEBftQKSXeQ73j6EKSAkv/K06fY4d6qPUoaBgWNK+R+96UvXPFhhGZ6mTEnfhYoNDPn/e9XbJyXdRbKpaZBKXaj2sjAdLhhjKvupvjQ4yk1BabtHRgphZZSXff9j7R+qggPoTPafXXDsGGUen0VNMqatLAsrnZhdl9eD8ePzFy+JPvcPFCihdRQ9WvU4Ajk+8U9MiREj7JOughLWQlWkufhoWupAGwfJdy6frtOoOQJqTY4daiha6JDc2GYsYQdsZIy0ZHKalGl/Fx/nX+c5oGlXoxL58zWSOb7dne2hyujEbXYk/rVkTja+dSrMKCHFX/J+S7aKHQJIFfzeMJ2RrIbHpx7Ne3bujRB5FwegmdaBfcleJLMmUw7iogfi0zPqU7/NEX+kTorJP37uTI0zyykOhyR0kKT9U9J8/mw+ui1G07YOPEybB6w7ZhuIhb8SFscwV85LJ1TXeBM3ZZMXbsQft06WYuDQARf4pYUJcMWHF/UAhMAxfMryBdkr05Xi7JvWpTx7/KZPGQ4QLc0D4MzVNgsp9bVAw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(376002)(346002)(39860400002)(136003)(36840700001)(46966006)(8676002)(4326008)(7636003)(26005)(426003)(2616005)(54906003)(316002)(107886003)(82740400003)(36906005)(356005)(186003)(44832011)(6916009)(478600001)(8936002)(336012)(70586007)(1076003)(70206006)(82310400003)(36860700001)(2906002)(7696005)(47076005)(36756003)(9786002)(5660300002)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 04:04:14.0151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d13f91ab-7182-480a-50bf-08d962c66834
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1NAM02FT0025.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR02MB7246
Received-SPF: pass client-ip=40.107.94.58; envelope-from=tongh@xilinx.com;
 helo=NAM10-MW2-obe.outbound.protection.outlook.com
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

Connect the support for Xilinx ZynqMP Battery-Backed RAM (BBRAM)

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 21 +++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 2 files changed, 23 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4d..8e39b7d6c7 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -62,6 +62,9 @@
 #define RTC_ADDR            0xffa60000
 #define RTC_IRQ             26
 
+#define BBRAM_ADDR          0xffcd0000
+#define BBRAM_IRQ           11
+
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
 
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
@@ -222,6 +225,22 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
 }
 
+static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child_with_props(OBJECT(s), "bbram", &s->bbram,
+                                       sizeof(s->bbram), TYPE_XLNX_BBRAM,
+                                       &error_fatal,
+                                       "crc-zpads", "1",
+                                       NULL);
+    sbd = SYS_BUS_DEVICE(&s->bbram);
+
+    sysbus_realize(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, BBRAM_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[BBRAM_IRQ]);
+}
+
 static void xlnx_zynqmp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -616,6 +635,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
+    xlnx_zynqmp_create_bbram(s, gic_spi);
+
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
                                       errp)) {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index d3e2ef97f6..07ebcefbab 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -36,6 +36,7 @@
 #include "qom/object.h"
 #include "net/can_emu.h"
 #include "hw/dma/xlnx_csu_dma.h"
+#include "hw/nvram/xlnx-bbram.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -95,6 +96,7 @@ struct XlnxZynqMPState {
 
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
+    XlnxBBRam bbram;
 
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
-- 
2.25.1


