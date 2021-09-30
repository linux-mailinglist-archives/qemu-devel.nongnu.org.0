Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4A341DD3C
	for <lists+qemu-devel@lfdr.de>; Thu, 30 Sep 2021 17:19:16 +0200 (CEST)
Received: from localhost ([::1]:37208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVxq7-0000mx-Hp
	for lists+qemu-devel@lfdr.de; Thu, 30 Sep 2021 11:19:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjN-0000Fe-Mn
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:17 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:46817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mVxjK-000403-Sc
 for qemu-devel@nongnu.org; Thu, 30 Sep 2021 11:12:17 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 d207-20020a1c1dd8000000b00307e2d1ec1aso4602955wmd.5
 for <qemu-devel@nongnu.org>; Thu, 30 Sep 2021 08:12:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dAm4kAQzPJzmjXpkBCUCwi+HBhQGyOtDz2aEIW6LGo0=;
 b=OTd/l/x9NyjfBOr05C/pBRpSkCNmfKKI+CLekDkpuhGj/f9e09m4+54s526+HGISTx
 4/Tfbi/rcsistnJHLGjPMtrqX4q7b0dVNj4vt96EEKZSwrkE/d1CEHJIu7rnsKLlhXrY
 1r6hgUSbPxRqSRzRjrXbvWyk9ABSkepb4stysQpR7opWKBSn13gY1qnybG/5Kg3vXDVj
 jhUF8pd4tT4utTkS0r73Nv549eEUt1SWWOnUQJwl+iwCcsAL2Jyz1Tt6t+e2eOfTIeIi
 Jz27TmsoyF0dZBnRyo2iltwAAeL+Atbe1iNW3jdtMy4tUt3odNSJyqU7qG43kAt7fN7b
 virA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dAm4kAQzPJzmjXpkBCUCwi+HBhQGyOtDz2aEIW6LGo0=;
 b=mKB3W8NJLzihPoCp4phe73BzLWK9K0mgpfG/oduQOWuw5mRiNoN0VA4XRdx5AIZpgO
 hxeS+fczWLKr1dSWVE5PKRqXgi3IL3fNWe10yFDaS7o7N0kbLwzkYht0zj2xNVw+VK2R
 tW0sxa6/Har00QuKHIIHlnG4Wr4lFbhG9i2QGXQKHqfaBPACMm0zoKynkQLOxwx4r1Tw
 FknMO8jWGIpBzzLbod9+1EXOwjWFEiGoVR1ANJ2WZtVQx81zaIDbeGjvG9mPP+1fcgPJ
 uN1pkb6epkKlUb0ekQyN8JHE9MJzZTc89DbgJZ4a+9aQoZxYR1YQ84C7ebg798xChUa0
 XJ7Q==
X-Gm-Message-State: AOAM531GeDfx92CT/xlP/buo784rKvsUJOpS9HOqUQ/2CDpGI4fqwHpH
 /fO+jUcO33M8QtzECA3/vo2zXGTMiqnkew==
X-Google-Smtp-Source: ABdhPJwpYfLyoEUa4FQePtePXlXAkDYTjJ+timyT3bNBCK2XEKV28UlzvW9W1njSD8rH4eTNzvr0dg==
X-Received: by 2002:a1c:210a:: with SMTP id h10mr5679475wmh.165.1633014732815; 
 Thu, 30 Sep 2021 08:12:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g8sm1952098wrm.46.2021.09.30.08.12.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 08:12:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/22] hw/arm: xlnx-zcu102: Add Xilinx eFUSE device
Date: Thu, 30 Sep 2021 16:11:49 +0100
Message-Id: <20210930151201.9407-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210930151201.9407-1-peter.maydell@linaro.org>
References: <20210930151201.9407-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
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

Connect the support for ZynqMP eFUSE one-time field-programmable
bit array.

The command argument:
  -drive if=pflash,index=3,...
Can be used to optionally connect the bit array to a
backend storage, such that field-programmed values
in one invocation can be made available to next
invocation.

The backend storage must be a seekable binary file, and
its size must be 768 bytes or larger. A file with all
binary 0's is a 'blank'.

Signed-off-by: Tong Ho <tong.ho@xilinx.com>
Message-id: 20210917052400.1249094-9-tong.ho@xilinx.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  3 +++
 hw/arm/xlnx-zcu102.c         | 15 +++++++++++++++
 hw/arm/xlnx-zynqmp.c         | 29 +++++++++++++++++++++++++++++
 hw/Kconfig                   |  1 +
 4 files changed, 48 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 067e8a5238a..062e637fe49 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -37,6 +37,7 @@
 #include "net/can_emu.h"
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
+#include "hw/nvram/xlnx-zynqmp-efuse.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -102,6 +103,8 @@ struct XlnxZynqMPState {
     MemoryRegion *ddr_ram;
     MemoryRegion ddr_ram_low, ddr_ram_high;
     XlnxBBRam bbram;
+    XlnxEFuse efuse;
+    XlnxZynqMPEFuse efuse_ctrl;
 
     MemoryRegion mr_unimp[XLNX_ZYNQMP_NUM_UNIMP_AREAS];
 
diff --git a/hw/arm/xlnx-zcu102.c b/hw/arm/xlnx-zcu102.c
index b247c5779bf..3dc2b5e8ca4 100644
--- a/hw/arm/xlnx-zcu102.c
+++ b/hw/arm/xlnx-zcu102.c
@@ -110,6 +110,18 @@ static void bbram_attach_drive(XlnxBBRam *dev)
     }
 }
 
+static void efuse_attach_drive(XlnxEFuse *dev)
+{
+    DriveInfo *dinfo;
+    BlockBackend *blk;
+
+    dinfo = drive_get_by_index(IF_PFLASH, 3);
+    blk = dinfo ? blk_by_legacy_dinfo(dinfo) : NULL;
+    if (blk) {
+        qdev_prop_set_drive(DEVICE(dev), "drive", blk);
+    }
+}
+
 static void xlnx_zcu102_init(MachineState *machine)
 {
     XlnxZCU102 *s = ZCU102_MACHINE(machine);
@@ -151,6 +163,9 @@ static void xlnx_zcu102_init(MachineState *machine)
     /* Attach bbram backend, if given */
     bbram_attach_drive(&s->soc.bbram);
 
+    /* Attach efuse backend, if given */
+    efuse_attach_drive(&s->soc.efuse);
+
     /* Create and plug in the SD cards */
     for (i = 0; i < XLNX_ZYNQMP_NUM_SDHCI; i++) {
         BusState *bus;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 1e8e2ddcc27..1c52a575aad 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -69,6 +69,9 @@
 #define BBRAM_ADDR          0xffcd0000
 #define BBRAM_IRQ           11
 
+#define EFUSE_ADDR          0xffcc0000
+#define EFUSE_IRQ           87
+
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
 
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
@@ -245,6 +248,31 @@ static void xlnx_zynqmp_create_bbram(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[BBRAM_IRQ]);
 }
 
+static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    Object *bits = OBJECT(&s->efuse);
+    Object *ctrl = OBJECT(&s->efuse_ctrl);
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "efuse-ctrl", &s->efuse_ctrl,
+                            TYPE_XLNX_ZYNQMP_EFUSE);
+
+    object_initialize_child_with_props(ctrl, "xlnx-efuse@0", bits,
+                                       sizeof(s->efuse),
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
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -646,6 +674,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->rtc), 0, gic_spi[RTC_IRQ]);
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
+    xlnx_zynqmp_create_efuse(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
diff --git a/hw/Kconfig b/hw/Kconfig
index b6fb6a45074..ad20cce0a95 100644
--- a/hw/Kconfig
+++ b/hw/Kconfig
@@ -82,3 +82,4 @@ config XLNX_ZYNQMP
     select CAN_BUS
     select PTIMER
     select XLNX_BBRAM
+    select XLNX_EFUSE_ZYNQMP
-- 
2.20.1


