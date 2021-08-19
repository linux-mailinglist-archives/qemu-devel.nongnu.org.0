Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F4EF3F1187
	for <lists+qemu-devel@lfdr.de>; Thu, 19 Aug 2021 05:23:51 +0200 (CEST)
Received: from localhost ([::1]:39512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGYek-0003t1-Dx
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 23:23:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57462)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGYYg-000257-2d; Wed, 18 Aug 2021 23:17:36 -0400
Received: from mail-bn7nam10on2045.outbound.protection.outlook.com
 ([40.107.92.45]:60705 helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mGYYN-00080h-Aa; Wed, 18 Aug 2021 23:17:32 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YxNwdfgLQJPDJ8pRzohlh+pOP7atjHoAj3ZdDdKZjJlQhmNlqQPV1N4aLvqsn2Fhas8vjQ8V4Z1cxdtCxNQs5o+eyCSrPYg+2mt1rWYmWzvUGhRFCr3b+WQvJxKCj9+xKtWnNsk85xDHnHMOMbSZ1Gvs/zyLjdo6iwTNy/ByCbnt6P46AlDlkbvuae+GNpK7k//FmW28MgozLu1wfRz5+5caw55c+6JJweSj0+ulbdT61BOgwnTKCrsgU2XuMtyMi1pzjnQDSq1HWUmXtJ24ILBmlenGrL0qnrGWVsgv48lnoPN5NFB8RgJw4JUVYT26rKrFoNtUzFM7nTGZ0mi7JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D62wbyW21U45aJA6C+uKLu04bgGaUYvh47U5vh8qMjU=;
 b=Yzxh20O5pZ/Pg5es5mr2K3GshOgpMtRqwXdw4Zoh6tGjqTuhOCQgEX7DZgRpRI4Q2q2MRZlgfzu6sxmw0vwNLcGRTsanmke16ptAPZUd+8tlvJ8zqzRDUi9KUm3I0XHuYanS6otfkoVJXGAEaSw8Au9VhS0EymLnTKA37fZJr5iSFv6RDmXrcmKWbCeUs9DLDjD0ox3sRl+hiWZ7a5UMq6RPF154ywgg187MINGskTM1CZM56b4nbjK/O3QXGcOd64zrAdkicGARrqRt/4sOgjFurYVt1HKsI3eZ7Nk1Yood94rSXvuMKsaucG61an/kSoVWYb/NnOeQVG/xo6AnHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D62wbyW21U45aJA6C+uKLu04bgGaUYvh47U5vh8qMjU=;
 b=fopYzInXeQX/e7GRmw1mgfutVyCEYRNsTf6xvy3gIeq+99JgWbPTvaPWMdrarQfDD+NbpYjZxfX1zth3hBF9cEhUSUJfXIFQg9EBCRua4QI7SJicoApGfFiJ72wiy4vObND5V02sn0IKOPqqs346jjw9NG/tTNiAweTZhvi7lrA=
Received: from DM6PR04CA0016.namprd04.prod.outlook.com (2603:10b6:5:334::21)
 by BN6PR02MB2388.namprd02.prod.outlook.com (2603:10b6:404:2b::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19; Thu, 19 Aug
 2021 03:17:09 +0000
Received: from DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
 (2603:10b6:5:334:cafe::2c) by DM6PR04CA0016.outlook.office365.com
 (2603:10b6:5:334::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4436.19 via Frontend
 Transport; Thu, 19 Aug 2021 03:17:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT051.mail.protection.outlook.com (10.13.4.91) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4436.19 via Frontend Transport; Thu, 19 Aug 2021 03:17:09 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Wed, 18 Aug 2021 20:17:08 -0700
Received: from smtp.xilinx.com (172.19.127.95) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Wed, 18 Aug 2021 20:17:08 -0700
Received: from [172.19.2.40] (port=52298 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mGYYG-0002Wl-2I; Wed, 18 Aug 2021 20:17:08 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [Patch 2/2] hw/arm/xlnx-zynqmp: Add unimplemented APU mmio
Date: Wed, 18 Aug 2021 20:15:25 -0700
Message-ID: <20210819031525.653995-3-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210819031525.653995-1-tong.ho@xilinx.com>
References: <20210819031525.653995-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 50c4ba81-8067-43c5-4644-08d962bfd48f
X-MS-TrafficTypeDiagnostic: BN6PR02MB2388:
X-Microsoft-Antispam-PRVS: <BN6PR02MB23881A88968FF6C1203413E4CDC09@BN6PR02MB2388.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:146;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 16P9gPkhCgLArVc8/zsJPLu51pYjCKRMWNrNZfsW6RuTYS/l0Oo59oFT5M7mAIl7eDj0uUC9MVp5KPVG5GCwm1xms8u+XzeGm7Y7nk6doRg3zPvuuyO2dxoxVKK/B2NxQk24RgxjsuT8EBN0UGYYY8Wh038qkGmIgube5Vt/X79Aqph0aRL2uZpMS+uFRHL8tJIFpdKdxifGWURFR7hv8ewfRf9F6LErA1qIXFB/2KD9REXbGqaZd5MGpXWZONjeTI1LDKCDLUAeUn3kXEyIJNh1sMK0Hw12S6Iwcq6XDqmDA2/PErZYeQ5sWYsUps1Co61FB/8xli3mmD128TcUkCuvcehvysj/JjIiScYUdJqi0vcDxXLyDjnJwvpgLsJ1zpZdzpVj7xOP75U1y0ErrFS7pzpFFSez8rMOELPtsopKXHoOyai1XectoPdkIfiDx1w0I1jp7iWuQSO9JH8WiKioTSVgmrsvXZEayrlpxkpkFz80fRKztix0qBc7xfpwYUQ85rdivKhcEUaWEONUiWdYT1jE0nW0jyU7a+Fv3295SWaCyEIz2pKoqqjgrKZUTOdzaUi3cUH7sOJOlcOaMeYb2UTYuiOAIqpccLPgn8fujazT1W86WMFrIVVSB0iqxhleH7vpfK3khUMuyCVppU6AZqeM56Z2oNy850sZpca+mowrpt2oa4uzcU37GeCAwm4yucOUHLhpLKghlAq82yLavVKcId+Moq+MpUe3hqPvKgczKGPhPdsHgJJG9nUkInmiPyc7zCmrtWRe82Piqs1BQaZaZTgUSK6E4aLMoktzetKmGDkV/jozvJamWYFY
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(36840700001)(46966006)(4326008)(82310400003)(44832011)(5660300002)(70586007)(186003)(47076005)(8936002)(2906002)(356005)(70206006)(8676002)(107886003)(336012)(36860700001)(7696005)(426003)(2616005)(7636003)(1076003)(9786002)(26005)(36906005)(6666004)(316002)(54906003)(6916009)(966005)(508600001)(36756003)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2021 03:17:09.3161 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50c4ba81-8067-43c5-4644-08d962bfd48f
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT051.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR02MB2388
Received-SPF: pass client-ip=40.107.92.45; envelope-from=tongh@xilinx.com;
 helo=NAM10-BN7-obe.outbound.protection.outlook.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: edgar.iglesias@gmail.com, alistair@alistair23.me,
 Tong Ho <tong.ho@xilinx.com>, qemu-devel@nongnu.org, peter.maydell@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add unimplemented APU mmio region to xlnx-zynqmp for booting
bare-metal guests built with standalone bsp published at:
  https://github.com/Xilinx/embeddedsw/tree/master/lib/bsp/standalone/src/arm/ARMv8/64bit

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/arm/xlnx-zynqmp.c         | 32 ++++++++++++++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  7 +++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4d..790df2b6f1 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -20,6 +20,7 @@
 #include "qemu/module.h"
 #include "hw/arm/xlnx-zynqmp.h"
 #include "hw/intc/arm_gic_common.h"
+#include "hw/misc/unimp.h"
 #include "hw/boards.h"
 #include "sysemu/kvm.h"
 #include "sysemu/sysemu.h"
@@ -56,6 +57,9 @@
 #define DPDMA_ADDR          0xfd4c0000
 #define DPDMA_IRQ           116
 
+#define APU_ADDR            0xfd5c0000
+#define APU_SIZE            0x100
+
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
@@ -222,6 +226,32 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
     qdev_realize(DEVICE(&s->rpu_cluster), NULL, &error_fatal);
 }
 
+static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
+{
+    static const struct UnimpInfo {
+        const char *name;
+        hwaddr base;
+        hwaddr size;
+    } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
+        { .name = "apu", APU_ADDR, APU_SIZE },
+    };
+
+    unsigned nr;
+
+    for (nr = 0; nr < ARRAY_SIZE(unimp_areas); nr++) {
+        const struct UnimpInfo *info = &unimp_areas[nr];
+        DeviceState *dev = qdev_new(TYPE_UNIMPLEMENTED_DEVICE);
+        SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+
+        qdev_prop_set_string(dev, "name", info->name);
+        qdev_prop_set_uint64(dev, "size", info->size);
+        object_property_add_child(OBJECT(s), info->name, OBJECT(dev));
+
+        sysbus_realize_and_unref(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, info->base);
+    }
+}
+
 static void xlnx_zynqmp_init(Object *obj)
 {
     MachineState *ms = MACHINE(qdev_get_machine());
@@ -616,6 +646,8 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
+    xlnx_zynqmp_create_unimp_mmio(s);
+
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
         if (!object_property_set_uint(OBJECT(&s->gdma[i]), "bus-width", 128,
                                       errp)) {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index d3e2ef97f6..c84fe15996 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -79,6 +79,11 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
+/*
+ * Unimplemented mmio regions needed to boot some images.
+ */
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
+
 struct XlnxZynqMPState {
     /*< private >*/
     DeviceState parent_obj;
@@ -96,6 +101,8 @@ struct XlnxZynqMPState {
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
 
+    MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
+
     CadenceGEMState gem[XLNX_ZYNQMP_NUM_GEMS];
     CadenceUARTState uart[XLNX_ZYNQMP_NUM_UARTS];
     XlnxZynqMPCANState can[XLNX_ZYNQMP_NUM_CAN];
-- 
2.25.1


