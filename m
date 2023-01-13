Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 574A5669B35
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:00:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmf-0000ug-QQ; Fri, 13 Jan 2023 09:11:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmQ-0000qQ-88
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:39 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmM-0003eE-74
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:37 -0500
Received: by mail-wm1-x333.google.com with SMTP id m3so15371044wmq.0
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=YSysLujAR8dL5PxqCP3BR2lPoOWPsZT0HVubvNDLyVc=;
 b=v+bJtWKXDVdqcalhFeHeBmgngUO/31HSs39xewjSSjl3lth9xWzw2UCKzh/BsmK0Z3
 HAIdIdZNOAP8LOSMyhdBUF8k+erEF1VYncSR4zl8sDm3WQHRKCQkdTX2p8ilhaP1ApQl
 vchj8sn54gTDZIhSNG/vcRTyHgn8RDUbg1GerC21bdcxvd36KDWoEwzimfaWSUpBLdAe
 ygX1HZvPEv0+I8J6Q5VsCqZe9XG7lyU2Ho9igN4HSrANFWiKf/TN9URMZTiCX5Qnes/e
 utRVgPjMG6xqIYxxBkxdWqlnKTatHtb+eY1W3UYex3XcYYJHMt5lISHkIYaWD+Vkw3kV
 onYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSysLujAR8dL5PxqCP3BR2lPoOWPsZT0HVubvNDLyVc=;
 b=DfibJ2qy7hFljAERaQgzPr5pNhtMt4zDdBEJRA34ugJgEj91oHMCuKgWuA86iw/Nj9
 OP9KcDIuR/wBK1Vl9F+FBdIy3wkKpivERjG0pozrpvc8m5eEQ5MO2Y4V6jSGfTQE8OfZ
 T6EhCKyTtHEhrFIiEQEpA352XO0IRoNdPZ10f3aW/oUjy7gKQIbbqbMpQadrm7F8ey8Z
 SvzBWnt+h9NwWl8uEYXvFtwJiU4TiGQHQVbqLePbwsqJ6kQaTCbP/QfLpVCWFRXl8Z3W
 VK8NfC1GdkT91b/oIqsrDD0R/5hGx+lBuavthisot7EixLpx+UhWowWGIU04yT3gI8oa
 Iw0w==
X-Gm-Message-State: AFqh2kq2l+DRAvQjEXLt17mxIf3RexGMbI1O87uzvfy4F9Wy8FBwhxJD
 sQvL9IVlJJWHnQrb6bxm8Nb9p8Vqp04PhaDz
X-Google-Smtp-Source: AMrXdXsKZsIRA1wl3S1d8nuS0X4KcZ9E67KhF6GQ/orasAythhh6jb7LDkKXitHLV2Yv5ug3T6/fmA==
X-Received: by 2002:a05:600c:1d8e:b0:3d6:e23:76a2 with SMTP id
 p14-20020a05600c1d8e00b003d60e2376a2mr57013933wms.34.1673619090714; 
 Fri, 13 Jan 2023 06:11:30 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.29
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:30 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/38] hw/misc: Allwinner-A10 Clock Controller Module Emulation
Date: Fri, 13 Jan 2023 14:10:51 +0000
Message-Id: <20230113141126.535646-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

During SPL boot several Clock Controller Module (CCM) registers are
read, most important are PLL and Tuning, as well as divisor registers.

This patch adds these registers and initializes reset values from user's
guide.

Signed-off-by: Strahinja Jankovic <strahinja.p.jankovic@gmail.com>

Reviewed-by: Niek Linnenbank <nieklinnenbank@gmail.com>
Message-id: 20221226220303.14420-2-strahinja.p.jankovic@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/allwinner-a10.h      |   2 +
 include/hw/misc/allwinner-a10-ccm.h |  67 +++++++++
 hw/arm/allwinner-a10.c              |   7 +
 hw/misc/allwinner-a10-ccm.c         | 224 ++++++++++++++++++++++++++++
 hw/arm/Kconfig                      |   1 +
 hw/misc/Kconfig                     |   3 +
 hw/misc/meson.build                 |   1 +
 7 files changed, 305 insertions(+)
 create mode 100644 include/hw/misc/allwinner-a10-ccm.h
 create mode 100644 hw/misc/allwinner-a10-ccm.c

diff --git a/include/hw/arm/allwinner-a10.h b/include/hw/arm/allwinner-a10.h
index f9240ffa64a..11bf1ca415a 100644
--- a/include/hw/arm/allwinner-a10.h
+++ b/include/hw/arm/allwinner-a10.h
@@ -13,6 +13,7 @@
 #include "hw/usb/hcd-ohci.h"
 #include "hw/usb/hcd-ehci.h"
 #include "hw/rtc/allwinner-rtc.h"
+#include "hw/misc/allwinner-a10-ccm.h"
 
 #include "target/arm/cpu.h"
 #include "qom/object.h"
@@ -31,6 +32,7 @@ struct AwA10State {
     /*< public >*/
 
     ARMCPU cpu;
+    AwA10ClockCtlState ccm;
     AwA10PITState timer;
     AwA10PICState intc;
     AwEmacState emac;
diff --git a/include/hw/misc/allwinner-a10-ccm.h b/include/hw/misc/allwinner-a10-ccm.h
new file mode 100644
index 00000000000..7f22532efaa
--- /dev/null
+++ b/include/hw/misc/allwinner-a10-ccm.h
@@ -0,0 +1,67 @@
+/*
+ * Allwinner A10 Clock Control Module emulation
+ *
+ * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner H3 CCU,
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
+#ifndef HW_MISC_ALLWINNER_A10_CCM_H
+#define HW_MISC_ALLWINNER_A10_CCM_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+
+/**
+ * @name Constants
+ * @{
+ */
+
+/** Size of register I/O address space used by CCM device */
+#define AW_A10_CCM_IOSIZE        (0x400)
+
+/** Total number of known registers */
+#define AW_A10_CCM_REGS_NUM      (AW_A10_CCM_IOSIZE / sizeof(uint32_t))
+
+/** @} */
+
+/**
+ * @name Object model
+ * @{
+ */
+
+#define TYPE_AW_A10_CCM    "allwinner-a10-ccm"
+OBJECT_DECLARE_SIMPLE_TYPE(AwA10ClockCtlState, AW_A10_CCM)
+
+/** @} */
+
+/**
+ * Allwinner A10 CCM object instance state.
+ */
+struct AwA10ClockCtlState {
+    /*< private >*/
+    SysBusDevice parent_obj;
+    /*< public >*/
+
+    /** Maps I/O registers in physical memory */
+    MemoryRegion iomem;
+
+    /** Array of hardware registers */
+    uint32_t regs[AW_A10_CCM_REGS_NUM];
+};
+
+#endif /* HW_MISC_ALLWINNER_H3_CCU_H */
diff --git a/hw/arm/allwinner-a10.c b/hw/arm/allwinner-a10.c
index 79082289ea5..86baeeeca2c 100644
--- a/hw/arm/allwinner-a10.c
+++ b/hw/arm/allwinner-a10.c
@@ -26,6 +26,7 @@
 #include "hw/usb/hcd-ohci.h"
 
 #define AW_A10_MMC0_BASE        0x01c0f000
+#define AW_A10_CCM_BASE         0x01c20000
 #define AW_A10_PIC_REG_BASE     0x01c20400
 #define AW_A10_PIT_REG_BASE     0x01c20c00
 #define AW_A10_UART0_REG_BASE   0x01c28000
@@ -46,6 +47,8 @@ static void aw_a10_init(Object *obj)
 
     object_initialize_child(obj, "timer", &s->timer, TYPE_AW_A10_PIT);
 
+    object_initialize_child(obj, "ccm", &s->ccm, TYPE_AW_A10_CCM);
+
     object_initialize_child(obj, "emac", &s->emac, TYPE_AW_EMAC);
 
     object_initialize_child(obj, "sata", &s->sata, TYPE_ALLWINNER_AHCI);
@@ -103,6 +106,10 @@ static void aw_a10_realize(DeviceState *dev, Error **errp)
     memory_region_add_subregion(get_system_memory(), 0x00000000, &s->sram_a);
     create_unimplemented_device("a10-sram-ctrl", 0x01c00000, 4 * KiB);
 
+    /* Clock Control Module */
+    sysbus_realize(SYS_BUS_DEVICE(&s->ccm), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->ccm), 0, AW_A10_CCM_BASE);
+
     /* FIXME use qdev NIC properties instead of nd_table[] */
     if (nd_table[0].used) {
         qemu_check_nic_model(&nd_table[0], TYPE_AW_EMAC);
diff --git a/hw/misc/allwinner-a10-ccm.c b/hw/misc/allwinner-a10-ccm.c
new file mode 100644
index 00000000000..68146ee3401
--- /dev/null
+++ b/hw/misc/allwinner-a10-ccm.c
@@ -0,0 +1,224 @@
+/*
+ * Allwinner A10 Clock Control Module emulation
+ *
+ * Copyright (C) 2022 Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
+ *
+ *  This file is derived from Allwinner H3 CCU,
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
+#include "hw/misc/allwinner-a10-ccm.h"
+
+/* CCM register offsets */
+enum {
+    REG_PLL1_CFG             = 0x0000, /* PLL1 Control */
+    REG_PLL1_TUN             = 0x0004, /* PLL1 Tuning */
+    REG_PLL2_CFG             = 0x0008, /* PLL2 Control */
+    REG_PLL2_TUN             = 0x000C, /* PLL2 Tuning */
+    REG_PLL3_CFG             = 0x0010, /* PLL3 Control */
+    REG_PLL4_CFG             = 0x0018, /* PLL4 Control */
+    REG_PLL5_CFG             = 0x0020, /* PLL5 Control */
+    REG_PLL5_TUN             = 0x0024, /* PLL5 Tuning */
+    REG_PLL6_CFG             = 0x0028, /* PLL6 Control */
+    REG_PLL6_TUN             = 0x002C, /* PLL6 Tuning */
+    REG_PLL7_CFG             = 0x0030, /* PLL7 Control */
+    REG_PLL1_TUN2            = 0x0038, /* PLL1 Tuning2 */
+    REG_PLL5_TUN2            = 0x003C, /* PLL5 Tuning2 */
+    REG_PLL8_CFG             = 0x0040, /* PLL8 Control */
+    REG_OSC24M_CFG           = 0x0050, /* OSC24M Control */
+    REG_CPU_AHB_APB0_CFG     = 0x0054, /* CPU, AHB and APB0 Divide Ratio */
+};
+
+#define REG_INDEX(offset)    (offset / sizeof(uint32_t))
+
+/* CCM register reset values */
+enum {
+    REG_PLL1_CFG_RST         = 0x21005000,
+    REG_PLL1_TUN_RST         = 0x0A101000,
+    REG_PLL2_CFG_RST         = 0x08100010,
+    REG_PLL2_TUN_RST         = 0x00000000,
+    REG_PLL3_CFG_RST         = 0x0010D063,
+    REG_PLL4_CFG_RST         = 0x21009911,
+    REG_PLL5_CFG_RST         = 0x11049280,
+    REG_PLL5_TUN_RST         = 0x14888000,
+    REG_PLL6_CFG_RST         = 0x21009911,
+    REG_PLL6_TUN_RST         = 0x00000000,
+    REG_PLL7_CFG_RST         = 0x0010D063,
+    REG_PLL1_TUN2_RST        = 0x00000000,
+    REG_PLL5_TUN2_RST        = 0x00000000,
+    REG_PLL8_CFG_RST         = 0x21009911,
+    REG_OSC24M_CFG_RST       = 0x00138013,
+    REG_CPU_AHB_APB0_CFG_RST = 0x00010010,
+};
+
+static uint64_t allwinner_a10_ccm_read(void *opaque, hwaddr offset,
+                                       unsigned size)
+{
+    const AwA10ClockCtlState *s = AW_A10_CCM(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    switch (offset) {
+    case REG_PLL1_CFG:
+    case REG_PLL1_TUN:
+    case REG_PLL2_CFG:
+    case REG_PLL2_TUN:
+    case REG_PLL3_CFG:
+    case REG_PLL4_CFG:
+    case REG_PLL5_CFG:
+    case REG_PLL5_TUN:
+    case REG_PLL6_CFG:
+    case REG_PLL6_TUN:
+    case REG_PLL7_CFG:
+    case REG_PLL1_TUN2:
+    case REG_PLL5_TUN2:
+    case REG_PLL8_CFG:
+    case REG_OSC24M_CFG:
+    case REG_CPU_AHB_APB0_CFG:
+        break;
+    case 0x158 ... AW_A10_CCM_IOSIZE:
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
+static void allwinner_a10_ccm_write(void *opaque, hwaddr offset,
+                                   uint64_t val, unsigned size)
+{
+    AwA10ClockCtlState *s = AW_A10_CCM(opaque);
+    const uint32_t idx = REG_INDEX(offset);
+
+    switch (offset) {
+    case REG_PLL1_CFG:
+    case REG_PLL1_TUN:
+    case REG_PLL2_CFG:
+    case REG_PLL2_TUN:
+    case REG_PLL3_CFG:
+    case REG_PLL4_CFG:
+    case REG_PLL5_CFG:
+    case REG_PLL5_TUN:
+    case REG_PLL6_CFG:
+    case REG_PLL6_TUN:
+    case REG_PLL7_CFG:
+    case REG_PLL1_TUN2:
+    case REG_PLL5_TUN2:
+    case REG_PLL8_CFG:
+    case REG_OSC24M_CFG:
+    case REG_CPU_AHB_APB0_CFG:
+        break;
+    case 0x158 ... AW_A10_CCM_IOSIZE:
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
+static const MemoryRegionOps allwinner_a10_ccm_ops = {
+    .read = allwinner_a10_ccm_read,
+    .write = allwinner_a10_ccm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+    .impl.min_access_size = 4,
+};
+
+static void allwinner_a10_ccm_reset_enter(Object *obj, ResetType type)
+{
+    AwA10ClockCtlState *s = AW_A10_CCM(obj);
+
+    /* Set default values for registers */
+    s->regs[REG_INDEX(REG_PLL1_CFG)] = REG_PLL1_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL1_TUN)] = REG_PLL1_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL2_CFG)] = REG_PLL2_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL2_TUN)] = REG_PLL2_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL3_CFG)] = REG_PLL3_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL4_CFG)] = REG_PLL4_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL5_CFG)] = REG_PLL5_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL5_TUN)] = REG_PLL5_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL6_CFG)] = REG_PLL6_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL6_TUN)] = REG_PLL6_TUN_RST;
+    s->regs[REG_INDEX(REG_PLL7_CFG)] = REG_PLL7_CFG_RST;
+    s->regs[REG_INDEX(REG_PLL1_TUN2)] = REG_PLL1_TUN2_RST;
+    s->regs[REG_INDEX(REG_PLL5_TUN2)] = REG_PLL5_TUN2_RST;
+    s->regs[REG_INDEX(REG_PLL8_CFG)] = REG_PLL8_CFG_RST;
+    s->regs[REG_INDEX(REG_OSC24M_CFG)] = REG_OSC24M_CFG_RST;
+    s->regs[REG_INDEX(REG_CPU_AHB_APB0_CFG)] = REG_CPU_AHB_APB0_CFG_RST;
+}
+
+static void allwinner_a10_ccm_init(Object *obj)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    AwA10ClockCtlState *s = AW_A10_CCM(obj);
+
+    /* Memory mapping */
+    memory_region_init_io(&s->iomem, OBJECT(s), &allwinner_a10_ccm_ops, s,
+                          TYPE_AW_A10_CCM, AW_A10_CCM_IOSIZE);
+    sysbus_init_mmio(sbd, &s->iomem);
+}
+
+static const VMStateDescription allwinner_a10_ccm_vmstate = {
+    .name = "allwinner-a10-ccm",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, AwA10ClockCtlState, AW_A10_CCM_REGS_NUM),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void allwinner_a10_ccm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.enter = allwinner_a10_ccm_reset_enter;
+    dc->vmsd = &allwinner_a10_ccm_vmstate;
+}
+
+static const TypeInfo allwinner_a10_ccm_info = {
+    .name          = TYPE_AW_A10_CCM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_init = allwinner_a10_ccm_init,
+    .instance_size = sizeof(AwA10ClockCtlState),
+    .class_init    = allwinner_a10_ccm_class_init,
+};
+
+static void allwinner_a10_ccm_register(void)
+{
+    type_register_static(&allwinner_a10_ccm_info);
+}
+
+type_init(allwinner_a10_ccm_register)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 9143533ef79..2be618fe8fd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -323,6 +323,7 @@ config ALLWINNER_A10
     select AHCI
     select ALLWINNER_A10_PIT
     select ALLWINNER_A10_PIC
+    select ALLWINNER_A10_CCM
     select ALLWINNER_EMAC
     select SERIAL
     select UNIMP
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c3..ed07bf41339 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -174,4 +174,7 @@ config VIRT_CTRL
 config LASI
     bool
 
+config ALLWINNER_A10_CCM
+    bool
+
 source macio/Kconfig
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index ed0598dc9eb..c828dbeb267 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -38,6 +38,7 @@ subdir('macio')
 
 softmmu_ss.add(when: 'CONFIG_IVSHMEM_DEVICE', if_true: files('ivshmem.c'))
 
+softmmu_ss.add(when: 'CONFIG_ALLWINNER_A10_CCM', if_true: files('allwinner-a10-ccm.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-ccu.c'))
 specific_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-cpucfg.c'))
 softmmu_ss.add(when: 'CONFIG_ALLWINNER_H3', if_true: files('allwinner-h3-dramc.c'))
-- 
2.34.1


