Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E17473BA0E4
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:06:00 +0200 (CEST)
Received: from localhost ([::1]:54038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIrn-0007nN-Iz
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:05:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIm4-0007YV-E9
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:04 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzIlz-0007eH-SG
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:04 -0400
Received: by mail-wm1-x330.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so2459969wmb.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 05:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=2NxSxDELJc1SgqL+DeE55wut9X70OTk797d/ydvnDu4=;
 b=gCsQcm+8me//AGCnjuANbDWrTYvHOAKqdHuZXL//NX6w3u/VZnLsTEcGcxpy25cOQI
 DQQAxKLTMjTnoRFKa2P7SXqtf1qqKQXnIufSiLDgKorV1crwD6TbIyKSBiii2RnLizYh
 ztIfg8TSbgH4Xph/ssDJfj1wb5CrDBvHHrnbCK4O4VTT694TukMIst+6yKScpKZUVUB8
 GBS1X2LGpaIleCjfRcbPSzaRfYj4N6A/BXCcfwvG/HSo7nnAridePNNQGMPnEvoErpqP
 Sqzd3flxCmufloHH1gw2nc+xYjn1XsE1aS3zg5T6pyoR0m8e6V7DOENICGfGAcz3diJp
 02eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NxSxDELJc1SgqL+DeE55wut9X70OTk797d/ydvnDu4=;
 b=S7dWBLNdh8CWQ9XQdvPzfyJK3pxV5ofD/iFJhF5XjTerGg4/l6jDZJZGKYaULIiu9i
 eXx8zBRtluFYBAt9b8L+zfTyeNWYZWuLBLEMAB22/4K7GzxXOerUFCkHIhE2sR0xJjt7
 k4ykQh7lB4rOT0idw80wHN3qSB5Rl25QF2Yph1LWhjVCDcBF6tw7DFoSnT2t9dpPijO+
 hyhnHATrIifYZQ4yU0ljJblgwC3RJfVGAymES9hftEsVek4BKKdIRIob2yeaWTfCAyqb
 CVvtzf5E89kluTqEc5F8CDqxaBhh8dg9GwVsH/qug2WVcbKp4VmGm1UC/jAC+GCj4TMa
 DPiA==
X-Gm-Message-State: AOAM533ktcBLOFsfqretj+55qg55+/hZBMh/sjgMuFWrzEyN2D/2a2Bf
 PlGsWuqYEw9hTvkamG6tW+2Osk5N8FuXAu1Z
X-Google-Smtp-Source: ABdhPJxlm/bNMRU7hHMvbgFLcmiUplYo6WZ3DL3i/tF9SpMpaLcReSjVDIO8qMxEp01iXJKvXrkxfw==
X-Received: by 2002:a05:600c:1d1a:: with SMTP id
 l26mr5352794wms.21.1625230798342; 
 Fri, 02 Jul 2021 05:59:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.05.59.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 05:59:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/24] hw/arm: Add basic power management to raspi.
Date: Fri,  2 Jul 2021 13:59:33 +0100
Message-Id: <20210702125954.13247-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

From: Nolan Leake <nolan@sigbus.net>

This is just enough to make reboot and poweroff work. Works for
linux, u-boot, and the arm trusted firmware. Not tested, but should
work for plan9, and bare-metal/hobby OSes, since they seem to generally
do what linux does for reset.

The watchdog timer functionality is not yet implemented.

Resolves: https://gitlab.com/qemu-project/qemu/-/issues/64
Signed-off-by: Nolan Leake <nolan@sigbus.net>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210625210209.1870217-1-nolan@sigbus.net
[PMM: tweaked commit title; fixed region size to 0x200;
 moved header file to include/]
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/bcm2835_peripherals.h |   3 +-
 include/hw/misc/bcm2835_powermgt.h   |  29 +++++
 hw/arm/bcm2835_peripherals.c         |  13 ++-
 hw/misc/bcm2835_powermgt.c           | 160 +++++++++++++++++++++++++++
 hw/misc/meson.build                  |   1 +
 5 files changed, 204 insertions(+), 2 deletions(-)
 create mode 100644 include/hw/misc/bcm2835_powermgt.h
 create mode 100644 hw/misc/bcm2835_powermgt.c

diff --git a/include/hw/arm/bcm2835_peripherals.h b/include/hw/arm/bcm2835_peripherals.h
index 479e2346e80..d864879421a 100644
--- a/include/hw/arm/bcm2835_peripherals.h
+++ b/include/hw/arm/bcm2835_peripherals.h
@@ -24,6 +24,7 @@
 #include "hw/misc/bcm2835_mphi.h"
 #include "hw/misc/bcm2835_thermal.h"
 #include "hw/misc/bcm2835_cprman.h"
+#include "hw/misc/bcm2835_powermgt.h"
 #include "hw/sd/sdhci.h"
 #include "hw/sd/bcm2835_sdhost.h"
 #include "hw/gpio/bcm2835_gpio.h"
@@ -48,7 +49,7 @@ struct BCM2835PeripheralState {
     BCM2835MphiState mphi;
     UnimplementedDeviceState txp;
     UnimplementedDeviceState armtmr;
-    UnimplementedDeviceState powermgt;
+    BCM2835PowerMgtState powermgt;
     BCM2835CprmanState cprman;
     PL011State uart0;
     BCM2835AuxState aux;
diff --git a/include/hw/misc/bcm2835_powermgt.h b/include/hw/misc/bcm2835_powermgt.h
new file mode 100644
index 00000000000..303b9a6f684
--- /dev/null
+++ b/include/hw/misc/bcm2835_powermgt.h
@@ -0,0 +1,29 @@
+/*
+ * BCM2835 Power Management emulation
+ *
+ * Copyright (C) 2017 Marcin Chojnacki <marcinch7@gmail.com>
+ * Copyright (C) 2021 Nolan Leake <nolan@sigbus.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef BCM2835_POWERMGT_H
+#define BCM2835_POWERMGT_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_BCM2835_POWERMGT "bcm2835-powermgt"
+OBJECT_DECLARE_SIMPLE_TYPE(BCM2835PowerMgtState, BCM2835_POWERMGT)
+
+struct BCM2835PowerMgtState {
+    SysBusDevice busdev;
+    MemoryRegion iomem;
+
+    uint32_t rstc;
+    uint32_t rsts;
+    uint32_t wdog;
+};
+
+#endif
diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index dcff13433e5..48538c9360c 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -126,6 +126,10 @@ static void bcm2835_peripherals_init(Object *obj)
 
     object_property_add_const_link(OBJECT(&s->dwc2), "dma-mr",
                                    OBJECT(&s->gpu_bus_mr));
+
+    /* Power Management */
+    object_initialize_child(obj, "powermgt", &s->powermgt,
+                            TYPE_BCM2835_POWERMGT);
 }
 
 static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
@@ -364,9 +368,16 @@ static void bcm2835_peripherals_realize(DeviceState *dev, Error **errp)
         qdev_get_gpio_in_named(DEVICE(&s->ic), BCM2835_IC_GPU_IRQ,
                                INTERRUPT_USB));
 
+    /* Power Management */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->powermgt), errp)) {
+        return;
+    }
+
+    memory_region_add_subregion(&s->peri_mr, PM_OFFSET,
+                sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->powermgt), 0));
+
     create_unimp(s, &s->txp, "bcm2835-txp", TXP_OFFSET, 0x1000);
     create_unimp(s, &s->armtmr, "bcm2835-sp804", ARMCTRL_TIMER0_1_OFFSET, 0x40);
-    create_unimp(s, &s->powermgt, "bcm2835-powermgt", PM_OFFSET, 0x114);
     create_unimp(s, &s->i2s, "bcm2835-i2s", I2S_OFFSET, 0x100);
     create_unimp(s, &s->smi, "bcm2835-smi", SMI_OFFSET, 0x100);
     create_unimp(s, &s->spi[0], "bcm2835-spi0", SPI0_OFFSET, 0x20);
diff --git a/hw/misc/bcm2835_powermgt.c b/hw/misc/bcm2835_powermgt.c
new file mode 100644
index 00000000000..25fa804cbda
--- /dev/null
+++ b/hw/misc/bcm2835_powermgt.c
@@ -0,0 +1,160 @@
+/*
+ * BCM2835 Power Management emulation
+ *
+ * Copyright (C) 2017 Marcin Chojnacki <marcinch7@gmail.com>
+ * Copyright (C) 2021 Nolan Leake <nolan@sigbus.net>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/bcm2835_powermgt.h"
+#include "migration/vmstate.h"
+#include "sysemu/runstate.h"
+
+#define PASSWORD 0x5a000000
+#define PASSWORD_MASK 0xff000000
+
+#define R_RSTC 0x1c
+#define V_RSTC_RESET 0x20
+#define R_RSTS 0x20
+#define V_RSTS_POWEROFF 0x555 /* Linux uses partition 63 to indicate halt. */
+#define R_WDOG 0x24
+
+static uint64_t bcm2835_powermgt_read(void *opaque, hwaddr offset,
+                                      unsigned size)
+{
+    BCM2835PowerMgtState *s = (BCM2835PowerMgtState *)opaque;
+    uint32_t res = 0;
+
+    switch (offset) {
+    case R_RSTC:
+        res = s->rstc;
+        break;
+    case R_RSTS:
+        res = s->rsts;
+        break;
+    case R_WDOG:
+        res = s->wdog;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_read: Unknown offset 0x%08"HWADDR_PRIx
+                      "\n", offset);
+        res = 0;
+        break;
+    }
+
+    return res;
+}
+
+static void bcm2835_powermgt_write(void *opaque, hwaddr offset,
+                                   uint64_t value, unsigned size)
+{
+    BCM2835PowerMgtState *s = (BCM2835PowerMgtState *)opaque;
+
+    if ((value & PASSWORD_MASK) != PASSWORD) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "bcm2835_powermgt_write: Bad password 0x%"PRIx64
+                      " at offset 0x%08"HWADDR_PRIx"\n",
+                      value, offset);
+        return;
+    }
+
+    value = value & ~PASSWORD_MASK;
+
+    switch (offset) {
+    case R_RSTC:
+        s->rstc = value;
+        if (value & V_RSTC_RESET) {
+            if ((s->rsts & 0xfff) == V_RSTS_POWEROFF) {
+                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+            } else {
+                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            }
+        }
+        break;
+    case R_RSTS:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: RSTS\n");
+        s->rsts = value;
+        break;
+    case R_WDOG:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: WDOG\n");
+        s->wdog = value;
+        break;
+
+    default:
+        qemu_log_mask(LOG_UNIMP,
+                      "bcm2835_powermgt_write: Unknown offset 0x%08"HWADDR_PRIx
+                      "\n", offset);
+        break;
+    }
+}
+
+static const MemoryRegionOps bcm2835_powermgt_ops = {
+    .read = bcm2835_powermgt_read,
+    .write = bcm2835_powermgt_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .impl.min_access_size = 4,
+    .impl.max_access_size = 4,
+};
+
+static const VMStateDescription vmstate_bcm2835_powermgt = {
+    .name = TYPE_BCM2835_POWERMGT,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(rstc, BCM2835PowerMgtState),
+        VMSTATE_UINT32(rsts, BCM2835PowerMgtState),
+        VMSTATE_UINT32(wdog, BCM2835PowerMgtState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void bcm2835_powermgt_init(Object *obj)
+{
+    BCM2835PowerMgtState *s = BCM2835_POWERMGT(obj);
+
+    memory_region_init_io(&s->iomem, obj, &bcm2835_powermgt_ops, s,
+                          TYPE_BCM2835_POWERMGT, 0x200);
+    sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->iomem);
+}
+
+static void bcm2835_powermgt_reset(DeviceState *dev)
+{
+    BCM2835PowerMgtState *s = BCM2835_POWERMGT(dev);
+
+    /* https://elinux.org/BCM2835_registers#PM */
+    s->rstc = 0x00000102;
+    s->rsts = 0x00001000;
+    s->wdog = 0x00000000;
+}
+
+static void bcm2835_powermgt_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = bcm2835_powermgt_reset;
+    dc->vmsd = &vmstate_bcm2835_powermgt;
+}
+
+static TypeInfo bcm2835_powermgt_info = {
+    .name          = TYPE_BCM2835_POWERMGT,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(BCM2835PowerMgtState),
+    .class_init    = bcm2835_powermgt_class_init,
+    .instance_init = bcm2835_powermgt_init,
+};
+
+static void bcm2835_powermgt_register_types(void)
+{
+    type_register_static(&bcm2835_powermgt_info);
+}
+
+type_init(bcm2835_powermgt_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 66e1648533e..f89b5c16438 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -82,6 +82,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
   'bcm2835_rng.c',
   'bcm2835_thermal.c',
   'bcm2835_cprman.c',
+  'bcm2835_powermgt.c',
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc.c'))
-- 
2.20.1


