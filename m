Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B65F36419FF
	for <lists+qemu-devel@lfdr.de>; Sun,  4 Dec 2022 00:20:57 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p1bnM-00007R-OK; Sat, 03 Dec 2022 18:19:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnJ-00005V-SR; Sat, 03 Dec 2022 18:19:41 -0500
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <strahinjapjankovic@gmail.com>)
 id 1p1bnD-0001ZZ-Gu; Sat, 03 Dec 2022 18:19:41 -0500
Received: by mail-lf1-x129.google.com with SMTP id s8so12927467lfc.8;
 Sat, 03 Dec 2022 15:19:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c+WTnTkzMOp5QfdO5KZJCEwH4De8+GSpEvokiWpsWmE=;
 b=AIKl+o72Z2qhXQTDd+U7228n13QKzY43ow55qWG0xMueeB0+OThbRXKPaKYDzVMcFF
 2a17zMTkX/1T9soHtCXuHuI+H288PUqRDJP3GK8/meWPj5dCRpHg2wU1JzL6Sh1Pc/RP
 5aG29SfEAxiGlexGFPfMXW2gKqPVNSgjQ+nZPofYHRo313sv/AaQKEmMT39upFt1UeEV
 ALPXv4aM2teYHFy7azxoKooLk9CrobRWlS7GMxT//1XlH1x6q6r1kX37xIpzYr1g9bIp
 guHvC8wAzdE9WZLDvi/kFkjf1ck4hFbE7h+YRYd+Be04N2TDfsyk/CCH2AwE8olZsO0W
 VrKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c+WTnTkzMOp5QfdO5KZJCEwH4De8+GSpEvokiWpsWmE=;
 b=g5CJYPovqfq5IZVcgUichsZndgkNK8PxdFmzsaS7NhRq3XWxZvPqLSEiL6La+EfL6e
 I/2o8lbCsZinAULOZwggGF/vcWC8b02UAmksGxxnEBduvjnMUc9KaNuvsnyuprMNBB6A
 rmA8y+y2fFnnpyd7TQEZ+qZ7bt1lP1bYl6YsYGjSzox0LI9uNzdEg85t6Zale5eNILLr
 JxCgDiElnUzE0GNUP6Yu3MCnk1HAZmp6/QpF1+Gq+ZdQkxn6tvY+CXg0utBLQWqgDh39
 Kd7FunOoJvTJTbYl/AhDsW5mi/u5Lum2Dl3HzgVRi9Om10Hr985a/Wv6gv+OO46Fx1a0
 6F6g==
X-Gm-Message-State: ANoB5pnkoKlWJ8Fm9b133XL5K6aU7S6kIjvm+if/gsRksXkSlKPB3GuZ
 6dLnJcng1/Ckfhs/bSUDtBTHEOZFYJMPf0oq
X-Google-Smtp-Source: AA0mqf7iYTxPQMhaMWvlq9Jl1b61ptT6/dUI5qzRXmNSuIow4MpLSN1TXYgrGmY4EwJTxGp7A/cVdQ==
X-Received: by 2002:ac2:4288:0:b0:4b4:f950:81e1 with SMTP id
 m8-20020ac24288000000b004b4f95081e1mr16376583lfh.139.1670109572565; 
 Sat, 03 Dec 2022 15:19:32 -0800 (PST)
Received: from penguin.lxd (213-67-202-254-no43.tbcn.telia.com.
 [213.67.202.254]) by smtp.googlemail.com with ESMTPSA id
 b27-20020a05651c033b00b002770e6c620bsm22623ljp.106.2022.12.03.15.19.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Dec 2022 15:19:32 -0800 (PST)
From: Strahinja Jankovic <strahinjapjankovic@gmail.com>
X-Google-Original-From: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Beniamino Galvani <b.galvani@gmail.com>,
 Niek Linnenbank <nieklinnenbank@gmail.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Subject: [PATCH 2/6] hw/misc: Allwinner A10 DRAM Controller Emulation
Date: Sun,  4 Dec 2022 00:19:00 +0100
Message-Id: <20221203231904.25155-3-strahinja.p.jankovic@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
References: <20221203231904.25155-1-strahinja.p.jankovic@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=strahinjapjankovic@gmail.com; helo=mail-lf1-x129.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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

During SPL boot several DRAM Controller registers are used. Most
important registers are those related to DRAM initialization and
calibration, where SPL initiates process and waits until certain bit is
set/cleared.

This patch adds these registers, initializes reset values from user's
guide and updates state of registers as SPL expects it.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
---
 hw/arm/Kconfig                        |   1 +
 hw/arm/allwinner-a10.c                |   7 +
 hw/misc/Kconfig                       |   3 +
 hw/misc/allwinner-a10-dramc.c         | 179 ++++++++++++++++++++++++++
 hw/misc/meson.build                   |   1 +
 include/hw/arm/allwinner-a10.h        |   2 +
 include/hw/misc/allwinner-a10-dramc.h |  68 ++++++++++
 7 files changed, 261 insertions(+)
 create mode 100644 hw/misc/allwinner-a10-dramc.c
 create mode 100644 include/hw/misc/allwinner-a10-dramc.h

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 14f52b41af..140f142ae5 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -320,6 +320,7 @@ config ALLWINNER_A10
     select ALLWINNER_A10_PIT
     select ALLWINNER_A10_PIC
     select ALLWINNER_A10_CCM
+    select ALLWINNER_A10_DRAMC
     select ALLWINNER_EMAC
     select SERIAL
     select UNIMP
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 86baeeeca2..a5f7a36ac9 100644
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
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index ed07bf4133..052fb54310 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -177,4 +177,7 @@ config LASI
 config ALLWINNER_A10_CCM
     bool
 
+config ALLWINNER_A10_DRAMC
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/allwinner-a10-dramc.c b/hw/misc/allwinner-a10-dramc.c
new file mode 100644
index 0000000000..e118b0c2fd
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
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index ebf216edbc..d7f49f0f81 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -39,6 +39,7 @@ subdir('macio')
 softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
 
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_DRAMC', if_true: files('allwinner-a10-dramc.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index 45d0fc2f7e..abe4ff7066 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,6 +13,7 @@
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
 #include "hw/misc/allwinner-a10-ccm.h"
+#include "hw/misc/allwinner-a10-dramc.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -32,6 +33,7 @@ struct AwA10State {
 
     ARMCPU cpu;
     AwA10ClockCtlState ccm;
+    AwA10DramControllerState dramc;
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/include/hw/misc/allwinner-a10-dramc.h b/include/hw/misc/allwinner-a10-dramc.h
new file mode 100644
index 0000000000..b61fbecbe7
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
-- 
2.30.2


