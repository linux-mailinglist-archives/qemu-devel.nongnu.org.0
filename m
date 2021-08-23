Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CCAD3F4FF5
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Aug 2021 19:54:13 +0200 (CEST)
Received: from localhost ([::1]:43374 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIE9E-00068o-NI
	for lists+qemu-devel@lfdr.de; Mon, 23 Aug 2021 13:54:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33534)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4n-0004ny-F7; Mon, 23 Aug 2021 13:49:37 -0400
Received: from mail-bn8nam12on2040.outbound.protection.outlook.com
 ([40.107.237.40]:5505 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mIE4k-0001B8-I7; Mon, 23 Aug 2021 13:49:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XLQcCtckVEbkvNWop6EK7ZlDvOMSBo935/X5SMgn3tTjVagoVtuJEDlF11NqFlnP8L7dWELjqZ36O32BZ6LH7CFNu88OMRoNkUU+Xyz5wJbU+bJ+EtGEMWT9r8ExuZIM7lVsjqHoNVk0uAVFcES/zNpu5ap8LFxWPBTLPYCtamJLXRC9CjodUNbcfPXG4yc0k9Pby1mR4nDpJg4gFBOrWaOuMFmEEvkBUs2m/ywc7igQrDB/iSYeSBuuRudNhN4bxMaHxrMg6r/9x3dGbPCzJfryAzMdiQnN3fUp0WWkgbBhRxa3hHC4dPSMg+kDFoyWhNCud1pimBrI06NPbhJ/zw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb2//A5cd9Go/H3I/4WznsdIuptTG+ImJM3bJlGL4cw=;
 b=oRM/rZQb48dHCb0vyvAoWgB5dWN3ASCSdHg2heKZxzEhfzS0ChkzMl6WUKq9JE9ulDWdnR+uHsCXPLUYwfuNOQT7BdAKMWUULsxTp89Qdgs6xQQJfzuJvF4lZ1hJ6SftspchShZoBHvoAeKt8rmEjfbdb9II/TEURIcKQk0mQq/A8GG5vVPrUlJPjN4e9IffAX2iGTLjp7wMfy3vRLMYjIOEvzXaPWoImxI/aLwSNXauxhGzea2X6SXVQj5O/czLB5Vwt6VHjhrhR/V57uJQzf2WZmV8McTyUxqWB4XjKKa0zRknJwigKoX/0lQUHUikxfA05gB6qPIf+twWaibk1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lb2//A5cd9Go/H3I/4WznsdIuptTG+ImJM3bJlGL4cw=;
 b=Z9dI8sxVZqb06JpjC2JX/6kKPXPuLhqhHyseA6SlkzhcSOEcTqrStYpF16LZ+nMbslK+QO+xU7rf9O3bZtVrbg9D745n4vPfSdaiiHr4LcgjSDmzcTKLlo55cLjD8qhAftd0qlw5GUcDvZ6lbCRhWOHXBosCajhnjYBQEF1zq7g=
Received: from DM5PR22CA0017.namprd22.prod.outlook.com (2603:10b6:3:101::27)
 by DM6PR02MB4938.namprd02.prod.outlook.com (2603:10b6:5:13::28) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4415.17; Mon, 23 Aug
 2021 17:49:29 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:101:cafe::ea) by DM5PR22CA0017.outlook.office365.com
 (2603:10b6:3:101::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Mon, 23 Aug 2021 17:49:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch01.xlnx.xilinx.com;
Received: from xsj-pvapexch01.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Mon, 23 Aug 2021 17:49:29 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch01.xlnx.xilinx.com (172.19.86.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 23 Aug 2021 10:49:24 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Mon, 23 Aug 2021 10:49:24 -0700
Received: from [172.19.2.40] (port=46976 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mIE4a-0007u4-Rd; Mon, 23 Aug 2021 10:49:24 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v2 7/9] hw/arm: xlnx-zynqmp: Add Xilinx BBRAM device
Date: Mon, 23 Aug 2021 10:49:22 -0700
Message-ID: <20210823174924.201669-8-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210823174924.201669-1-tong.ho@xilinx.com>
References: <20210823174924.201669-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9efc4579-867c-4daf-1e4c-08d9665e5b79
X-MS-TrafficTypeDiagnostic: DM6PR02MB4938:
X-Microsoft-Antispam-PRVS: <DM6PR02MB493846CE83279104470AF3B9CDC49@DM6PR02MB4938.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:133;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: p2kqof31BeajRMAP+wNSjnN4fOxfEwTCFC5YMelio3mImh4WNDt+E+wU2oMp2eDGpGdRzT7Bfn/+LcvYv2DH2aPz/5QTwgHiz4MuydiaNZtu2JfSnWaql4weOIAht8P+ojFnzCy/GDxiIhsm6WxpuFcX3776vkq2H26WlTyqCvyf/rrrd8Uuf5fC/bRRE3sY3MyXWwyU2ZRC8UDUaJvO2YHcyYtfVCbu683K9WOVIMrPfITaxrlXhoyn59KVcmTKlyMaZB7J8Lfj9NfCmQeUSMdKK1RfdGWSFn13E45dwJGWYJuYRZC5ayUTvrz96XayF3LJKYh0YsOMbHnO24XSS6yjmsBhIU/DuwOzoubb8Hq1LeR2pVz9ZF6BZxWtXkhweANmg+r82ev3Uz0L/jzBQ3Kwd0jd5ZhP0Qvh/g99vPwH11cBGKtnQWXO0a0iQKvOzNw5sM4Y+RDNT3MkLVd/pEDExOLV11RIgIZy+A6QjIvgx66XyDgtEY2oQaMqSbZ4peYRY2HxmIWew8sX5Dk9J0KdaxPiVgh2VNCNxHr1gzfvhBXGmrToF9SP31pnupBsz3JUVqsVI8ieaJ2wuYQw5++oZOocUrQ7DCBvLlIeOc99qfv5YAcbr6dMxGdsxLe7C2UfV30UcckkWAZzg4l4C6skb2Nf2pr48i5U6MHRwEGxM0DK85H4NTwx/dlGfcuGREAcjOPpRTeSDsNh73Jgo0hiI0sYXiIjNLDJWCpYqyw=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch01.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(376002)(136003)(346002)(39860400002)(396003)(46966006)(36840700001)(26005)(426003)(2906002)(316002)(82310400003)(7696005)(6916009)(54906003)(1076003)(478600001)(7636003)(356005)(47076005)(336012)(82740400003)(36860700001)(5660300002)(70206006)(4326008)(107886003)(8676002)(44832011)(8936002)(2616005)(36756003)(9786002)(36906005)(70586007)(186003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Aug 2021 17:49:29.6359 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efc4579-867c-4daf-1e4c-08d9665e5b79
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch01.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR02MB4938
Received-SPF: pass client-ip=40.107.237.40; envelope-from=tongh@xilinx.com;
 helo=NAM12-BN8-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_PASS=-0.001, T_SPF_HELO_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


