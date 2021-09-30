Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D89741DD5F
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:25:09 +0200 (CEST)
Received: from localhost ([::1]:52828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxvo-0002x8-2p
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33110)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjQ-0000Hw-N2
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:21 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:46013)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjJ-0003zL-9V
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:18 -0400
Received: by mail-wr1-x42f.google.com with SMTP id d21so10619216wra.12
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yjhbRCAKKYqjO4C2ZkK+yymBrVJFR30QkaOvBMx2jBI=;
 b=FXA+A754pTxRs1hvFTeMlV+M5QR1LiCb4J7a2xFViwKX9z0gkCqxQ3NzizAPlXdLXL
 76k7p7iS47uMqrQ88hj2+REGrzuP4zpe6aTIrxurvUqYRM7d0Qnv/ftb1UHsM24y/jNy
 DSsMek11O8dhRDqNSGasjZGiEHlC8X8am6E6dsky5aj8c2/S8xuGNTinLTFYeJbpUfQs
 YGTkD0Pziw6QV1esXNteixTwsI/Ytn8BqRFLkPp0H1iMwpH0aw7c2WR1BSydVHcVbOr5
 fkWjToZKYSMq3KuUdO0qnBHPN0oDcMUYzlzuGlfUd27lDw0xhGiIbb9fVVrU41yIhuuI
 mtTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yjhbRCAKKYqjO4C2ZkK+yymBrVJFR30QkaOvBMx2jBI=;
 b=VrwGKQl2DGYrfTbyI6or9xnofy+kl+aIw+Iq8OxrpoF6H4T2ElxWRn+V2UfCK3yaL5
 LukJyfrrar8I0RvXSVSwa3e7XqdkffJoE66xldFiLw4S/WCvVKTvB/PUqMJM0T/u9aqA
 04gXFkCGnVBt1SNfdodTeepuobDNS4gFgUZ5VhDmam1dNHAcbHj4SaeOlJ1iWjFIXg0j
 ipx/vKELfDeZtDvyAOBW3WGy30ALw5JQqLOC84shD+GFUrgLd0nWX3TwBdy7jcItx4oY
 gn5uVufLSpc4xVzfSWnEx7xTH0qziDwzbAf2J/h0+qbkGnn5a/NoR+Vygv8uFMUumdc+
 RYvA==
X-Gm-Message-State: AOAM530F+eIrucJUfPVvjCV1ADBVGtqzAoy4qKl7bx3Ir0r0dEsAKLiE
 yqWiS76pwddSHhkfuG4kLc5gAujgQwseBQ==
X-Google-Smtp-Source: ABdhPJwgYjTtC4rXtKeBs/74jzwKjYgWzBvBNq8OeR74e6+SzNAcOr0GybeeKpyczzn7PZIw47IZdA==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr6957558wrp.157.1633014732053; 
 Thu, 30 Sep 2021 08:12:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/22] hw/arm: xlnx-zcu102: Add Xilinx BBRAM device
Date: Thu, 30 Sep 2021 16:11:48 +0100
Message-Id: <20210930151201.9407-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Tong Ho <tong.ho@xilinx.com>

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
Message-id: 20210917052400.1249094-8-tong.ho@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zcu102.c         | 15 +++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 20 ++++++++++++++++++++
 hw/Kconfig                   |  1 +
 4 files changed, 38 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c84fe15996e..067e8a5238a 100644
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
 
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index 6c6cb02e861..b247c5779bf 100644
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
index 4e5a471e30b..1e8e2ddcc27 100644
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
diff --git a/hw/Kconfig b/hw/Kconfig
index 8cb7664d705..b6fb6a45074 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -81,3 +81,4 @@ config XLNX_ZYNQMP
     select REGISTER
     select CAN_BUS
     select PTIMER
+    select XLNX_BBRAM
-- 
2.20.1


