Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E0C669BE3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:24:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKma-0000sy-O4; Fri, 13 Jan 2023 09:11:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmQ-0000qR-7l
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:39 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmM-0003eP-6x
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:37 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 z8-20020a05600c220800b003d33b0bda11so1022363wml.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mAvr2md1ZrxgLhDIA+lsU2uRrQ3or0Magy0T0exxhSo=;
 b=j+8n2L9KermDMHreNq/47BUQzuAxKLoDyXmXzx/60Z9kxJuo0Rzct867Kh1ZaDJ4jO
 cvwJ3aYOZ+fKHZTsv2yxUWSFx2mNFrWE7xVwgQXzcyTzODDLF1dZjTWfACFHBBg33Oet
 raCawlrUcXbVHZcwmuvt91/y2a1ZkDGMQhO/oEPGMeOS8QzmOpE9fSEdT5qMHK895MAv
 XCMPNclwQUq7UALxXPxlRGRYqNG7x/1pyccWArj6b3FPhfbaEg7qv9Y4vk4hqI/5wtXk
 eWaBa5IOuW0mMD38+Q11yO9jHBVq+dydBj4MwJL+/bRnh4mnprONzowa7DjezFGkH66a
 4QWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mAvr2md1ZrxgLhDIA+lsU2uRrQ3or0Magy0T0exxhSo=;
 b=sMqaqLErK68304fUm3PpeOrxTCX2+Q2KBI3p652lYh1kGlm3ucmWeoXJt0+VqN5HKw
 6KhpM7gMQIeJK6e5ZEvbhlEfGSgfB6I33ko5YF9SBsFg3BFpB0rHCKO4AQqrfgaiAKym
 HR4h3IfqwVw2x7wp48925i7X7kY4ZxwlJ7C0YuyXi+79NCWeG1LzU49f02ul0tzxCmSQ
 HabtlHyhZS0I91RiQDPzt6XGMNdPiL2Skn+1JTWGApVQa5i/XYYNf4MCLueW1xV1cm7t
 Y9pWDs9u8sEdxtuumMSPXOxpp1mJZ/NIp0l6JyqXdFjszTgwZcdhqIy3N7nQ+pddKCRF
 LojA==
X-Gm-Message-State: AFqh2kono1H7ELd5vjHI3Gh7iGBoh9ByyXAV7POnVgYcNl+QcSMLVbcH
 SWUq5kpY1lU6inwrb51TgBkhbuMv9yEKz+fE
X-Google-Smtp-Source: AMrXdXujEIAMFQfU9K/H+FXxeCYJcR65pl9bdTRVl/mUk/mwswzTPv3F/2oBYIuQgVOyNdQu/34DFA==
X-Received: by 2002:a05:600c:34d1:b0:3d7:72e3:f437 with SMTP id
 d17-20020a05600c34d100b003d772e3f437mr59247440wmq.21.1673619091587; 
 Fri, 13 Jan 2023 06:11:31 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.30
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/38] hw/misc: Allwinner A10 DRAM Controller Emulation
Date: Fri, 13 Jan 2023 14:10:52 +0000
Message-Id: <20230113141126.535646-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Strahinja Jankovic <strahinjapjankovic@gmail.com>

During SPL boot several DRAM Controller registers are used. Most
important registers are those related to DRAM initialization and
calibration, where SPL initiates process and waits until certain bit is
set/cleared.

This patch adds these registers, initializes reset values from user's
guide and updates state of registers as SPL expects it.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20221226220303.14420-3-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/allwinner-a10.h        |   2 +
 include/hw/misc/allwinner-a10-dramc.h |  68 ++++++++++
 hw/arm/allwinner-a10.c                |   7 +
 hw/misc/allwinner-a10-dramc.c         | 179 ++++++++++++++++++++++++++
 hw/arm/Kconfig                        |   1 +
 hw/misc/Kconfig                       |   3 +
 hw/misc/meson.build                   |   1 +
 7 files changed, 261 insertions(+)
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h
 create mode 100644 hw/misc/allwinner-a10-dramc.c

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 11bf1ca415a..ad959d6395f 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -14,6 +14,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
 #include "hw/misc/allwinner-a10-ccm.h"
+#include "hw/misc/allwinner-a10-dramc.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -33,6 +34,7 @@ struct AwA10State {
 
     ARMCPU cpu;
     AwA10ClockCtlState ccm;
+    AwA10DramControllerState dramc;
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/include/hw/misc/allwinner-a10-dramc.h b/include/hw/misc/allwinner-a10-dramc.h
new file mode 100644
index 00000000000..b61fbecbe74
--- /dev/null
+++ b/include/hw/misc/allwinner-a10-dramc.h
@@ -0,0 +1,68 @@
+/*
+ * Allwinner A10 DRAM Controller emulation
+ *
+ * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner H3 DRAMC,
+ *  by Niek Linnenbank.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_MISC_ALLWINNER_A10_DRAMC_H
+#define HW_MISC_ALLWINNER_A10_DRAMC_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+/**
+ * @name Constants
+ * @{
+ */
+
+/** Size of register I/O address space used by DRAMC device */
+#define AW_A10_DRAMC_IOSIZE        (0x1000)
+
+/** Total number of known registers */
+#define AW_A10_DRAMC_REGS_NUM      (AW_A10_DRAMC_IOSIZE / sizeof(uint32_t))
+
+/** @} */
+
+/**
+ * @name Object model
+ * @{
+ */
+
+#define TYPE_AW_A10_DRAMC    "allwinner-a10-dramc"
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10DramControllerState, AW_A10_DRAMC)
+
+/** @} */
+
+/**
+ * Allwinner A10 DRAMC object instance state.
+ */
+struct AwA10DramControllerState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** Array of hardware registers */
+    uint32_t regs[AW_A10_DRAMC_REGS_NUM];
+};
+
+#endif /* HW_MISC_ALLWINNER_A10_DRAMC_H */
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 86baeeeca2c..a5f7a36ac9b 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -25,6 +25,7 @@
 #include "hw/boards.h"
 #include "hw/usb/hcd-ohci.h"
 
+#define AW_A10_DRAMC_BASE       0x01c01000
 #define AW_A10_MMC0_BASE        0x01c0f000
 #define AW_A10_CCM_BASE         0x01c20000
 #define AW_A10_PIC_REG_BASE     0x01c20400
@@ -49,6 +50,8 @@ static void aw_a10_init(Object *obj)
 
     object_initialize_child(obj, "ccm", &s->ccm, TYPE_AW_A10_CCM);
 
+    object_initialize_child(obj, "dramc", &s->dramc, TYPE_AW_A10_DRAMC);
+
     object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
 
     object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
@@ -110,6 +113,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     sysbus_realize(SYS_BUS_DEVICE(&s->ccm), &error_fatal);
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, AW_A10_CCM_BASE);
 
+    /* DRAM Control Module */
+    sysbus_realize(SYS_BUS_DEVICE(&s->dramc), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->dramc), 0, AW_A10_DRAMC_BASE);
+
     /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
diff --git a/hw/misc/allwinner-a10-dramc.c b/hw/misc/allwinner-a10-dramc.c
new file mode 100644
index 00000000000..e118b0c2fd4
--- /dev/null
+++ b/hw/misc/allwinner-a10-dramc.c
@@ -0,0 +1,179 @@
+/*
+ * Allwinner A10 DRAM Controller emulation
+ *
+ * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner H3 DRAMC,
+ *  by Niek Linnenbank.
+ *
+ * This program is free software: you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation, either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+ * GNU General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qemu/log.h"
+#include "qemu/module.h"
+#include "hw/misc/allwinner-a10-dramc.h"
+
+/* DRAMC register offsets */
+enum {
+    REG_SDR_CCR = 0x0000,
+    REG_SDR_ZQCR0 = 0x00a8,
+    REG_SDR_ZQSR = 0x00b0
+};
+
+#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
+
+/* DRAMC register flags */
+enum {
+    REG_SDR_CCR_DATA_TRAINING = (1 << 30),
+    REG_SDR_CCR_DRAM_INIT     = (1 << 31),
+};
+enum {
+    REG_SDR_ZQSR_ZCAL         = (1 << 31),
+};
+
+/* DRAMC register reset values */
+enum {
+    REG_SDR_CCR_RESET   = 0x80020000,
+    REG_SDR_ZQCR0_RESET = 0x07b00000,
+    REG_SDR_ZQSR_RESET  = 0x80000000
+};
+
+static uint64_t allwinner_a10_dramc_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    const AwA10DramControllerState *s = AW_A10_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    switch (offset) {
+    case REG_SDR_CCR:
+    case REG_SDR_ZQCR0:
+    case REG_SDR_ZQSR:
+        break;
+    case 0x2e4 ... AW_A10_DRAMC_IOSIZE:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented read offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        return 0;
+    }
+
+    return s->regs[idx];
+}
+
+static void allwinner_a10_dramc_write(void *opaque, hwaddr offset,
+                                   uint64_t val, unsigned size)
+{
+    AwA10DramControllerState *s = AW_A10_DRAMC(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    switch (offset) {
+    case REG_SDR_CCR:
+        if (val & REG_SDR_CCR_DRAM_INIT) {
+            /* Clear DRAM_INIT to indicate process is done. */
+            val &= ~REG_SDR_CCR_DRAM_INIT;
+        }
+        if (val & REG_SDR_CCR_DATA_TRAINING) {
+            /* Clear DATA_TRAINING to indicate process is done. */
+            val &= ~REG_SDR_CCR_DATA_TRAINING;
+        }
+        break;
+    case REG_SDR_ZQCR0:
+        /* Set ZCAL in ZQSR to indicate calibration is done. */
+        s->regs[REG_INDEX(REG_SDR_ZQSR)] |= REG_SDR_ZQSR_ZCAL;
+        break;
+    case 0x2e4 ... AW_A10_DRAMC_IOSIZE:
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: out-of-bounds offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    default:
+        qemu_log_mask(LOG_UNIMP, "%s: unimplemented write offset 0x%04x\n",
+                      __func__, (uint32_t)offset);
+        break;
+    }
+
+    s->regs[idx] = (uint32_t) val;
+}
+
+static const MemoryRegionOps allwinner_a10_dramc_ops = {
+    .read = allwinner_a10_dramc_read,
+    .write = allwinner_a10_dramc_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_a10_dramc_reset_enter(Object *obj, ResetType type)
+{
+    AwA10DramControllerState *s = AW_A10_DRAMC(obj);
+
+    /* Set default values for registers */
+    s->regs[REG_INDEX(REG_SDR_CCR)] = REG_SDR_CCR_RESET;
+    s->regs[REG_INDEX(REG_SDR_ZQCR0)] = REG_SDR_ZQCR0_RESET;
+    s->regs[REG_INDEX(REG_SDR_ZQSR)] = REG_SDR_ZQSR_RESET;
+}
+
+static void allwinner_a10_dramc_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwA10DramControllerState *s = AW_A10_DRAMC(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_a10_dramc_ops, s,
+                          TYPE_AW_A10_DRAMC, AW_A10_DRAMC_IOSIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_a10_dramc_vmstate = {
+    .name = "allwinner-a10-dramc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AwA10DramControllerState,
+                             AW_A10_DRAMC_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_a10_dramc_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.enter = allwinner_a10_dramc_reset_enter;
+    dc->vmsd = &allwinner_a10_dramc_vmstate;
+}
+
+static const TypeInfo allwinner_a10_dramc_info = {
+    .name          = TYPE_AW_A10_DRAMC,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_a10_dramc_init,
+    .instance_size = sizeof(AwA10DramControllerState),
+    .class_init    = allwinner_a10_dramc_class_init,
+};
+
+static void allwinner_a10_dramc_register(void)
+{
+    type_register_static(&allwinner_a10_dramc_info);
+}
+
+type_init(allwinner_a10_dramc_register)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 2be618fe8fd..9ce756fca77 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -324,6 +324,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_PIT
     select ALLWINNER_A10_PIC
     select ALLWINNER_A10_CCM
+    select ALLWINNER_A10_DRAMC
     select ALLWINNER_EMAC
     select SERIAL
     select UNIMP
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index ed07bf41339..052fb543103 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -177,4 +177,7 @@ config LASI
 config ALLWINNER_A10_CCM
     bool
 
+config ALLWINNER_A10_DRAMC
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index c828dbeb267..9eaa0750b50 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -39,6 +39,7 @@ subdir('macio')
 softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwinner-a10-dramc.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
-- 
2.34.1


