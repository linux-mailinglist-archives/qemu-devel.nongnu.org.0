Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 66ABC40F1A4
	for <lists+qemu-devel@lfdr.de>; Fri, 17 Sep 2021 07:32:23 +0200 (CEST)
Received: from localhost ([::1]:46884 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mR6U2-0004Pd-Ea
	for lists+qemu-devel@lfdr.de; Fri, 17 Sep 2021 01:32:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46222)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MM-0002wM-JC; Fri, 17 Sep 2021 01:24:26 -0400
Received: from mail-bn8nam12on2045.outbound.protection.outlook.com
 ([40.107.237.45]:20001 helo=NAM12-BN8-obe.outbound.protection.outlook.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <tongh@xilinx.com>)
 id 1mR6MK-00066e-Ja; Fri, 17 Sep 2021 01:24:26 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ie+UlmBuLopzin4KW5AsrUaNl5J6++xRkE1tetaN7qT86wWcHiorHx+kvcBdFxheWbwi5SGeaKS2MGqO292QA2zhrAmwB8hnPWffYSlIw9IES6oPxU86xJgqzErUFZM1YI5riRgmVXuP7etprKeF/BmAoAXOr8JExgzJr9kamVCvQw8m7wW0zhChEbrhqpeV70BqmDWUJH5AS4Kj9HkabNvZryyyqOMbCEXfigdNlIK4/t3Tns9K0lu94E9it6yVVMNJy4ABirhRHaPjQUYjnVYSbK0BEU5Vny1Mr+8j45oP8YNDCy74915xO9fwLxPIivXodDbQQgMz20icX2cufA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=pxryyTVF4f8bKv1bhGjnN1aosMY840Y3NKNF4eL9C7Y=;
 b=JT1Fqqm7IFZJ6FG3A8+e9vzuWokFbDbFDts0fnoQVIOL/fXikc0FdUn076kdovTsR2RfP/lFzun0VIhKqYzxtaxfBi9PBpSPFu3dHiLMeCCRhvQylDthSDUuAMFmtTiTpGpWGXJvei/IBvUfm9JlrofUBrcDc6MXkKgI10ik1zcRhZZZd2nl8pOxiUiikg6cAo4InA2f6cqamvRwOAmytXCiiPNk2bJzPcf8r6FVSBAJD8hqhjjVNvbLa891XpRphPSC4FitclQR8TWViETj++wRimCzORMdUvpy+ghWRapE8TugezxcBuzA3pJM9zB+P1UZKj5v2JmtfwwtMYWzdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 149.199.62.198) smtp.rcpttodomain=nongnu.org smtp.mailfrom=xilinx.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=xilinx.com;
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=xilinx.onmicrosoft.com; s=selector2-xilinx-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pxryyTVF4f8bKv1bhGjnN1aosMY840Y3NKNF4eL9C7Y=;
 b=JD45lyfebbPpYpyIHy/cuRvEBqzse8JAaWNEVjo3YjLBP+RU1LL2uDpdTJegbcvYAkoaxMccoRjgYz1/DEfKBHPWu5yxUtdOVufcQpy+V7uTlDV7exXgi1QSxIxW9hEeuZMZdfIrMeEZsRa3Q/F2wOWnQnYz/uwAARWMxV/bsv4=
Received: from DM5PR19CA0015.namprd19.prod.outlook.com (2603:10b6:3:151::25)
 by DM5PR02MB3308.namprd02.prod.outlook.com (2603:10b6:4:6a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14; Fri, 17 Sep
 2021 05:24:19 +0000
Received: from DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
 (2603:10b6:3:151:cafe::44) by DM5PR19CA0015.outlook.office365.com
 (2603:10b6:3:151::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.14 via Frontend
 Transport; Fri, 17 Sep 2021 05:24:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 149.199.62.198)
 smtp.mailfrom=xilinx.com; nongnu.org; dkim=none (message not signed)
 header.d=none;nongnu.org; dmarc=pass action=none header.from=xilinx.com;
Received-SPF: Pass (protection.outlook.com: domain of xilinx.com designates
 149.199.62.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=149.199.62.198; helo=xsj-pvapexch02.xlnx.xilinx.com;
Received: from xsj-pvapexch02.xlnx.xilinx.com (149.199.62.198) by
 DM3NAM02FT008.mail.protection.outlook.com (10.13.5.14) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4523.14 via Frontend Transport; Fri, 17 Sep 2021 05:24:19 +0000
Received: from xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Thu, 16 Sep 2021 22:24:01 -0700
Received: from smtp.xilinx.com (172.19.127.96) by
 xsj-pvapexch02.xlnx.xilinx.com (172.19.86.41) with Microsoft SMTP Server id
 15.1.2176.14 via Frontend Transport; Thu, 16 Sep 2021 22:24:01 -0700
Received: from [172.19.2.40] (port=58118 helo=xsjtongh40.xilinx.com)
 by smtp.xilinx.com with esmtp (Exim 4.90)
 (envelope-from <tong.ho@xilinx.com>)
 id 1mR6Lw-0005Y7-V2; Thu, 16 Sep 2021 22:24:00 -0700
From: Tong Ho <tong.ho@xilinx.com>
To: <qemu-arm@nongnu.org>
Subject: [PATCH v3 7/9] hw/arm: xlnx-zcu102: Add Xilinx BBRAM device
Date: Thu, 16 Sep 2021 22:23:58 -0700
Message-ID: <20210917052400.1249094-8-tong.ho@xilinx.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210917052400.1249094-1-tong.ho@xilinx.com>
References: <20210917052400.1249094-1-tong.ho@xilinx.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 05f569fb-507f-4d08-9b15-08d9799b6669
X-MS-TrafficTypeDiagnostic: DM5PR02MB3308:
X-Microsoft-Antispam-PRVS: <DM5PR02MB3308927CBCF8792FB4C33BA8CDDD9@DM5PR02MB3308.namprd02.prod.outlook.com>
X-Auto-Response-Suppress: DR, RN, NRN, OOF, AutoReply
X-MS-Oob-TLC-OOBClassifiers: OLM:635;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hZ0IFAp/JM3FHIgMMh5CHOqdwFf5UH6s6VKRsX4p+B4c3JUtZJWH4iARjKXtpp3NYVpT06+L67Vz6OzQjF9q3NrtZJDN3U6kaaePRTGLXqpTlpO+76t5XjtGUZw5yPYOUyrdvOepnK88JV+6RlLQA27rT7/L9k3TvX7HqmOa3rHxwbWD+Rl/HwaToBjcZIINvYPNxbY9cMWbq+YhBAaLpjwx8heLhLMnSxvZDzo17zPqsgKsAkVfk05RK6nrK6aKLSTaET1VcCgKk0Z+puknx9F5CnOE0OfgaXSrdwErjZQvax7c1zCf3hUSU/Lc7bV+wm+y747Moy5g++2yCJL6TNVvwM3iR5WsBScIjTnpaG0S2WxOJ9J9iCVs2c+503ZUp4++L0Lyh55Js3fGF2R6RFU4q3gBIXTBWBWlhuLFPfO/ooKa2nyOM0cOtr2+hVjoHktGIdvwVzXR+hl9xvGdpmzg8NipaMjwQOQ1TlO18COmEZjSa8IZhgUMdTwoDwWUUXA1AxF041ahjqECxSbaHExd6NwP1RXPDlhLBm3MZy1G0aHB7ejvi/5YFolL3utVqpe35JgFSaghn7vOqHLiXINRfJ0OAduUwnhD6LaNtpZQSZl8DtE3NLU/Llx+Wh76z7bxr9l7MqOGadIoZpOeQRm6p4gVDIdogE/szanJKIJvqlehbQG8JF/NPQasqhegP35IpxLuldP7wP846+jjXxtfCRpdfx6MttJnfheIqiQ=
X-Forefront-Antispam-Report: CIP:149.199.62.198; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:xsj-pvapexch02.xlnx.xilinx.com;
 PTR:unknown-62-198.xilinx.com; CAT:NONE;
 SFS:(4636009)(396003)(136003)(39860400002)(376002)(346002)(36840700001)(46966006)(8936002)(478600001)(36906005)(7636003)(70206006)(70586007)(36756003)(7696005)(54906003)(2906002)(82310400003)(6916009)(316002)(36860700001)(186003)(26005)(47076005)(8676002)(82740400003)(83380400001)(44832011)(1076003)(426003)(107886003)(5660300002)(336012)(9786002)(356005)(2616005)(4326008)(102446001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: xilinx.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2021 05:24:19.3804 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 05f569fb-507f-4d08-9b15-08d9799b6669
X-MS-Exchange-CrossTenant-Id: 657af505-d5df-48d0-8300-c31994686c5c
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=657af505-d5df-48d0-8300-c31994686c5c; Ip=[149.199.62.198];
 Helo=[xsj-pvapexch02.xlnx.xilinx.com]
X-MS-Exchange-CrossTenant-AuthSource: DM3NAM02FT008.eop-nam02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR02MB3308
Received-SPF: pass client-ip=40.107.237.45; envelope-from=tongh@xilinx.com;
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

Connect the support for Xilinx ZynqMP Battery-Backed RAM (BBRAM)

The command argument:
  -drive if=pflash,index=2,...
Can be used to optionally connect the bbram to a backend
storage, such that field-programmed values in one
invocation can be made available to next invocation.

The backend storage must be a seekable binary file, and
its size must be 36 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
---
 hw/Kconfig                   |  1 +
 hw/arm/xlnx-zcu102.c         | 15 +++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 20 ++++++++++++++++++++
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 4 files changed, 38 insertions(+)

diff --git a/hw/Kconfig b/hw/Kconfig
index 8cb7664d70..b6fb6a4507 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -81,3 +81,4 @@ config XLNX_ZYNQMP
     select REGISTER
     select CAN_BUS
     select PTIMER
+    select XLNX_BBRAM
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 6c6cb02e86..b247c5779b 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -98,6 +98,18 @@ static void zcu102_modify_dtb(const struct arm_boot_info *binfo, void *fdt)
     }
 }
 
+static void bbram_attach_drive(XlnxBBRam *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 2);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void xlnx_zcu102_init(MachineState *machine)
 {
     XlnxZCU102 *s = ZCU102_MACHINE(machine);
@@ -136,6 +148,9 @@ static void xlnx_zcu102_init(MachineState *machine)
 
     qdev_realize(DEVICE(&s->soc), NULL, &error_fatal);
 
+    /* Attach bbram backend, if given */
+    bbram_attach_drive(&s->soc.bbram);
+
     /* Create and plug in the SD cards */
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         BusState *bus;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 4e5a471e30..1e8e2ddcc2 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -66,6 +66,9 @@
 #define RTC_ADDR            0xffa60000
 #define RTC_IRQ             26
 
+#define BBRAM_ADDR          0xffcd0000
+#define BBRAM_IRQ           11
+
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
 
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
@@ -226,6 +229,22 @@ static void xlnx_zynqmp_create_rpu(MachineState *ms, XlnxZynqMPState *s,
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
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -626,6 +645,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->rtc), 0, RTC_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
+    xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c84fe15996..067e8a5238 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -36,6 +36,7 @@
 #include "qom/object.h"
 #include "net/can_emu.h"
 #include "hw/dma/xlnx_csu_dma.h"
+#include "hw/nvram/xlnx-bbram.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -100,6 +101,7 @@ struct XlnxZynqMPState {
 
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
+    XlnxBBRam bbram;
 
     MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
 
-- 
2.25.1


