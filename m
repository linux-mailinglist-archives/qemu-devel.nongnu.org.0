Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D61144A8621
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:23:13 +0100 (CET)
Received: from localhost ([::1]:45040 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd0y-0007Ou-GB
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:23:12 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52874)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgM-0005Uq-4X; Thu, 03 Feb 2022 09:01:54 -0500
Received: from [2a00:1450:4864:20::236] (port=41823
 helo=mail-lj1-x236.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgI-0000SK-CM; Thu, 03 Feb 2022 09:01:53 -0500
Received: by mail-lj1-x236.google.com with SMTP id t14so4028166ljh.8;
 Thu, 03 Feb 2022 06:01:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BFWoMujpjNvibjXve5esd0O7dSY/396/6FDO79UhXBk=;
 b=BkoddJmZZgFwfnmHEiUpnG6rNcNiIbwm3C+pqZydh7GP3rv4BuL76VbgwazfAQ3FHH
 ue1RqO2icviS18MpDEzdypVu+TNKx318Evsev00XgNltI+MyfJljNHbl5d1A4z8CFvip
 g6JIFpC57NoaQWomXG3A1NBn8dQU9yP2XHvQVVMzmR1ejnsljEd7HNuAW2QWlLa+DlwT
 DNB0RE44IMFsR3ex0f5J1xzr5NKQtQ1FwldwWbDhIHb45/Ls1hd6rK/z+iHs5qhTb7gX
 g1Q8FYCviqg8g0fWutCob7nw9nV4znDrNUYRSwXkiNSs8OyrbkiabWNHrSHUNgUTtIPw
 UsEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BFWoMujpjNvibjXve5esd0O7dSY/396/6FDO79UhXBk=;
 b=n95BZzSeuaJjQYMivbc+YsFCfE2Q/7JWq/V0/ONKjlqOWCTY81hVAvLGnX02vYCyPU
 JyJOGPs5/E/qrSENEEeRpsIDPOwi9iXhWYGveNCK7i563kDHZ7oAR6PXknMLnQ1/s3fq
 c8G+RZdnxIyLVduvecsgoZ5ZcvNlhJNj9IpQL1TAnjHpyFPCI+u9AU+HpcZrX3cGX9Tz
 zJz6kO4Jnn4aOYa9LBNyRy/f0bIbkI1Gad1GPQMqFMv6z6w+3yQVpT30qb1N82qBfBLB
 zic656Q13x3TenKKsmLTWPGsg7mDfVIjsEiwL4koADp5KVomX66qPE/RocK5Z+fV12/W
 ImWQ==
X-Gm-Message-State: AOAM533U7cv5Rpb5NvUnffMQg+o19nK2uULfWhlU2qebmqG4GcFYqn3S
 s2g08R5trRDI5J0/6Zr0M8ziYhpXvrYs5w==
X-Google-Smtp-Source: ABdhPJx21mV44O6v7c9ZAO8sdab1xMlSLA/SXGzKdmrhiZ5g9QuOEzViPjcxJuZ44lU/HDhhNdBFYA==
X-Received: by 2002:a05:651c:1213:: with SMTP id
 i19mr22976552lja.116.1643896907777; 
 Thu, 03 Feb 2022 06:01:47 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id bq32sm4365065lfb.142.2022.02.03.06.01.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:47 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 5/6] hw/misc: Add a model of the Xilinx ZynqMP APU Control
Date: Thu,  3 Feb 2022 15:01:40 +0100
Message-Id: <20220203140141.310870-6-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203140141.310870-1-edgar.iglesias@gmail.com>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::236
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x236.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a model of the Xilinx ZynqMP APU Control.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  95 +++++++++
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 254 +++++++++++++++++++++++++
 hw/misc/meson.build                    |   1 +
 3 files changed, 350 insertions(+)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c

diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
new file mode 100644
index 0000000000..b0c0adb881
--- /dev/null
+++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
@@ -0,0 +1,95 @@
+/*
+ * QEMU model of ZynqMP APU Control.
+ *
+ * Copyright (c) 2013-2022 Xilinx Inc
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
+ * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ *
+ */
+#ifndef HW_MISC_XLNX_ZYNQMP_APU_CTRL_H
+#define HW_MISC_XLNX_ZYNQMP_APU_CTRL_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "target/arm/cpu.h"
+
+#define TYPE_XLNX_ZYNQMP_APU_CTRL "xlnx.apu-ctrl"
+
+#define XLNX_ZYNQMP_APU(obj) \
+     OBJECT_CHECK(XlnxZynqMPAPUCtrl, (obj), TYPE_XLNX_ZYNQMP_APU_CTRL)
+
+REG32(APU_ERR_CTRL, 0x0)
+    FIELD(APU_ERR_CTRL, PSLVERR, 0, 1)
+REG32(ISR, 0x10)
+    FIELD(ISR, INV_APB, 0, 1)
+REG32(IMR, 0x14)
+    FIELD(IMR, INV_APB, 0, 1)
+REG32(IEN, 0x18)
+    FIELD(IEN, INV_APB, 0, 1)
+REG32(IDS, 0x1c)
+    FIELD(IDS, INV_APB, 0, 1)
+REG32(CONFIG_0, 0x20)
+    FIELD(CONFIG_0, CFGTE, 24, 4)
+    FIELD(CONFIG_0, CFGEND, 16, 4)
+    FIELD(CONFIG_0, VINITHI, 8, 4)
+    FIELD(CONFIG_0, AA64NAA32, 0, 4)
+REG32(CONFIG_1, 0x24)
+    FIELD(CONFIG_1, L2RSTDISABLE, 29, 1)
+    FIELD(CONFIG_1, L1RSTDISABLE, 28, 1)
+    FIELD(CONFIG_1, CP15DISABLE, 0, 4)
+REG32(RVBARADDR0L, 0x40)
+    FIELD(RVBARADDR0L, ADDR, 2, 30)
+REG32(RVBARADDR0H, 0x44)
+    FIELD(RVBARADDR0H, ADDR, 0, 8)
+REG32(RVBARADDR1L, 0x48)
+    FIELD(RVBARADDR1L, ADDR, 2, 30)
+REG32(RVBARADDR1H, 0x4c)
+    FIELD(RVBARADDR1H, ADDR, 0, 8)
+REG32(RVBARADDR2L, 0x50)
+    FIELD(RVBARADDR2L, ADDR, 2, 30)
+REG32(RVBARADDR2H, 0x54)
+    FIELD(RVBARADDR2H, ADDR, 0, 8)
+REG32(RVBARADDR3L, 0x58)
+    FIELD(RVBARADDR3L, ADDR, 2, 30)
+REG32(RVBARADDR3H, 0x5c)
+    FIELD(RVBARADDR3H, ADDR, 0, 8)
+REG32(ACE_CTRL, 0x60)
+    FIELD(ACE_CTRL, AWQOS, 16, 4)
+    FIELD(ACE_CTRL, ARQOS, 0, 4)
+REG32(SNOOP_CTRL, 0x80)
+    FIELD(SNOOP_CTRL, ACE_INACT, 4, 1)
+    FIELD(SNOOP_CTRL, ACP_INACT, 0, 1)
+REG32(PWRCTL, 0x90)
+    FIELD(PWRCTL, CLREXMONREQ, 17, 1)
+    FIELD(PWRCTL, L2FLUSHREQ, 16, 1)
+    FIELD(PWRCTL, CPUPWRDWNREQ, 0, 4)
+REG32(PWRSTAT, 0x94)
+    FIELD(PWRSTAT, CLREXMONACK, 17, 1)
+    FIELD(PWRSTAT, L2FLUSHDONE, 16, 1)
+    FIELD(PWRSTAT, DBGNOPWRDWN, 0, 4)
+
+#define APU_R_MAX ((R_PWRSTAT) + 1)
+
+#define APU_MAX_CPU    4
+
+typedef struct XlnxZynqMPAPUCtrl {
+    SysBusDevice busdev;
+
+    ARMCPU *cpus[APU_MAX_CPU];
+    /* WFIs towards PMU. */
+    qemu_irq wfi_out[4];
+    /* CPU Power status towards INTC Redirect. */
+    qemu_irq cpu_power_status[4];
+    qemu_irq irq_imr;
+
+    uint8_t cpu_pwrdwn_req;
+    uint8_t cpu_in_wfi;
+
+    RegisterInfoArray *reg_array;
+    uint32_t regs[APU_R_MAX];
+    RegisterInfo regs_info[APU_R_MAX];
+} XlnxZynqMPAPUCtrl;
+
+#endif
diff --git a/hw/misc/xlnx-zynqmp-apu-ctrl.c b/hw/misc/xlnx-zynqmp-apu-ctrl.c
new file mode 100644
index 0000000000..ea9032e0ed
--- /dev/null
+++ b/hw/misc/xlnx-zynqmp-apu-ctrl.c
@@ -0,0 +1,254 @@
+/*
+ * QEMU model of the ZynqMP APU Control.
+ *
+ * Copyright (c) 2013-2022 Xilinx Inc
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * Written by Peter Crosthwaite <peter.crosthwaite@xilinx.com> and
+ * Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/log.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+
+#include "qemu/bitops.h"
+#include "qapi/qmp/qerror.h"
+
+#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
+
+#ifndef XILINX_ZYNQMP_APU_ERR_DEBUG
+#define XILINX_ZYNQMP_APU_ERR_DEBUG 1
+#endif
+
+static void update_wfi_out(void *opaque)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(opaque);
+    unsigned int i, wfi_pending;
+
+    wfi_pending = s->cpu_pwrdwn_req & s->cpu_in_wfi;
+    for (i = 0; i < APU_MAX_CPU; i++) {
+        qemu_set_irq(s->wfi_out[i], !!(wfi_pending & (1 << i)));
+    }
+}
+
+static void zynqmp_apu_rvbar_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
+    int i;
+
+    for (i = 0; i < APU_MAX_CPU; ++i) {
+        uint64_t rvbar = s->regs[R_RVBARADDR0L + 2 * i] +
+                         ((uint64_t)s->regs[R_RVBARADDR0H + 2 * i] << 32);
+        if (s->cpus[i]) {
+            object_property_set_int(OBJECT(s->cpus[i]), "rvbar", rvbar,
+                                    &error_abort);
+        }
+    }
+}
+
+static void zynqmp_apu_pwrctl_post_write(RegisterInfo *reg, uint64_t val)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
+    unsigned int i, new;
+
+    for (i = 0; i < APU_MAX_CPU; i++) {
+        new = val & (1 << i);
+        /* Check if CPU's CPUPWRDNREQ has changed. If yes, update GPIOs. */
+        if (new != (s->cpu_pwrdwn_req & (1 << i))) {
+            qemu_set_irq(s->cpu_power_status[i], !!new);
+        }
+        s->cpu_pwrdwn_req &= ~(1 << i);
+        s->cpu_pwrdwn_req |= new;
+    }
+    update_wfi_out(s);
+}
+
+static void imr_update_irq(XlnxZynqMPAPUCtrl *s)
+{
+    bool pending = s->regs[R_ISR] & ~s->regs[R_IMR];
+    qemu_set_irq(s->irq_imr, pending);
+}
+
+static void isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
+    imr_update_irq(s);
+}
+
+static uint64_t ien_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IMR] &= ~val;
+    imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t ids_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IMR] |= val;
+    imr_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo zynqmp_apu_regs_info[] = {
+#define RVBAR_REGDEF(n) \
+    {   .name = "RVBAR CPU " #n " Low",  .addr = A_RVBARADDR ## n ## L,    \
+            .reset = 0xffff0000ul,                                         \
+            .post_write = zynqmp_apu_rvbar_post_write,                     \
+    },{ .name = "RVBAR CPU " #n " High", .addr = A_RVBARADDR ## n ## H,    \
+            .post_write = zynqmp_apu_rvbar_post_write,                     \
+    }
+    {   .name = "ERR_CTRL",  .addr = A_APU_ERR_CTRL,
+    },{ .name = "ISR",  .addr = A_ISR,
+        .w1c = 0x1,
+        .post_write = isr_postw,
+    },{ .name = "IMR",  .addr = A_IMR,
+        .reset = 0x1,
+        .ro = 0x1,
+    },{ .name = "IEN",  .addr = A_IEN,
+        .pre_write = ien_prew,
+    },{ .name = "IDS",  .addr = A_IDS,
+        .pre_write = ids_prew,
+    },{ .name = "CONFIG_0",  .addr = A_CONFIG_0,
+        .reset = 0xf0f,
+    },{ .name = "CONFIG_1",  .addr = A_CONFIG_1,
+    },
+    RVBAR_REGDEF(0),
+    RVBAR_REGDEF(1),
+    RVBAR_REGDEF(2),
+    RVBAR_REGDEF(3),
+    { .name = "ACE_CTRL",  .addr = A_ACE_CTRL,
+        .reset = 0xf000f,
+    },{ .name = "SNOOP_CTRL",  .addr = A_SNOOP_CTRL,
+    },{ .name = "PWRCTL",  .addr = A_PWRCTL,
+        .post_write = zynqmp_apu_pwrctl_post_write,
+    },{ .name = "PWRSTAT",  .addr = A_PWRSTAT,
+        .ro = 0x3000f,
+    }
+};
+
+static void zynqmp_apu_reset_enter(Object *obj, ResetType type)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
+    int i;
+
+    for (i = 0; i < APU_R_MAX; ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    s->cpu_pwrdwn_req = 0;
+    s->cpu_in_wfi = 0;
+}
+
+static void zynqmp_apu_reset_hold(Object *obj)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
+
+    update_wfi_out(s);
+    imr_update_irq(s);
+}
+
+static const MemoryRegionOps zynqmp_apu_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    }
+};
+
+static void zynqmp_apu_handle_wfi(void *opaque, int irq, int level)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(opaque);
+
+    s->cpu_in_wfi = deposit32(s->cpu_in_wfi, irq, 1, level);
+    update_wfi_out(s);
+}
+
+static void zynqmp_apu_init(Object *obj)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
+    int i;
+
+    s->reg_array =
+        register_init_block32(DEVICE(obj), zynqmp_apu_regs_info,
+                              ARRAY_SIZE(zynqmp_apu_regs_info),
+                              s->regs_info, s->regs,
+                              &zynqmp_apu_ops,
+                              XILINX_ZYNQMP_APU_ERR_DEBUG,
+                              APU_R_MAX * 4);
+    sysbus_init_mmio(SYS_BUS_DEVICE(obj), &s->reg_array->mem);
+    sysbus_init_irq(SYS_BUS_DEVICE(obj), &s->irq_imr);
+
+    for (i = 0; i < APU_MAX_CPU; ++i) {
+        g_autofree gchar *prop_name = g_strdup_printf("cpu%d", i);
+        object_property_add_link(obj, prop_name, TYPE_ARM_CPU,
+                                 (Object **)&s->cpus[i],
+                                 qdev_prop_allow_set_link_before_realize,
+                                 OBJ_PROP_LINK_STRONG);
+    }
+
+    /* wfi_out is used to connect to PMU GPIs. */
+    qdev_init_gpio_out_named(DEVICE(obj), s->wfi_out, "wfi_out", 4);
+    /* CPU_POWER_STATUS is used to connect to INTC redirect. */
+    qdev_init_gpio_out_named(DEVICE(obj), s->cpu_power_status,
+                             "CPU_POWER_STATUS", 4);
+    /* wfi_in is used as input from CPUs as wfi request. */
+    qdev_init_gpio_in_named(DEVICE(obj), zynqmp_apu_handle_wfi, "wfi_in", 4);
+}
+
+static void zynqmp_apu_finalize(Object *obj)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU(obj);
+    register_finalize_block(s->reg_array);
+}
+
+static const VMStateDescription vmstate_zynqmp_apu = {
+    .name = TYPE_XLNX_ZYNQMP_APU_CTRL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .minimum_version_id_old = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxZynqMPAPUCtrl, APU_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void zynqmp_apu_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_zynqmp_apu;
+
+    rc->phases.enter = zynqmp_apu_reset_enter;
+    rc->phases.hold = zynqmp_apu_reset_hold;
+}
+
+static const TypeInfo zynqmp_apu_info = {
+    .name              = TYPE_XLNX_ZYNQMP_APU_CTRL,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(XlnxZynqMPAPUCtrl),
+    .class_init        = zynqmp_apu_class_init,
+    .instance_init     = zynqmp_apu_init,
+    .instance_finalize = zynqmp_apu_finalize,
+};
+
+static void zynqmp_apu_register_types(void)
+{
+    type_register_static(&zynqmp_apu_info);
+}
+
+type_init(zynqmp_apu_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 1927f13a5e..cf9d4cc618 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -85,6 +85,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c'))
 specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-crf.c'))
+specific_ss.add(when: 'CONFIG_XLNX_ZYNQMP_ARM', if_true: files('xlnx-zynqmp-apu-ctrl.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files(
   'xlnx-versal-xramc.c',
   'xlnx-versal-pmc-iou-slcr.c',
-- 
2.25.1


