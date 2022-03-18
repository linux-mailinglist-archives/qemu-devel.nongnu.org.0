Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 75D9B4DDABF
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:42:35 +0100 (CET)
Received: from localhost ([::1]:38172 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVCsE-00040x-Hi
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:42:34 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZm-0006vf-8d
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:30 -0400
Received: from [2a00:1450:4864:20::32f] (port=52857
 helo=mail-wm1-x32f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZk-0002DI-2Q
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:29 -0400
Received: by mail-wm1-x32f.google.com with SMTP id r7so4848725wmq.2
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=WEBPKtTl0A+spGyHf/Omw3nlUPpx87pLP+QlMJlWJIU=;
 b=irmgDjt5p9iqF07smeAIqgEERuq/VmiQB8DiLBsQxQ6CEQJW21kizWRwpMhe8fhby/
 8/W+iD6vKw9Qgsr47dkb+aD1BtU1BjzV4f/9eevc2tvnqhxMwSRwUGfGj3trY3jTQpwU
 2HdCTTs1VPK+VKRgE2NjVTrbypZfpL+YzDcYgWy5CJXHy21BOG0s/DTindk3djcAXa9C
 JCVOWR03PYcQEnHGaaAQhImjKmaHjPJ5XysO/9XOTj4pFQViYlc9a6y1VBZuBHoTimao
 250Tx6osN//Gvbe9lCEiX8syd7Y3iWMOmURyia6INZ0Kmkti+p3kWY9JCTx13/oYXhE8
 0i9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WEBPKtTl0A+spGyHf/Omw3nlUPpx87pLP+QlMJlWJIU=;
 b=dHPxyaisg1hQXeQB0bwJY88RIEPjfbVlrXeNNVajL27PDEcJtVZKbTbdwYgbvZYDM6
 Uzjkt7cQCmYfNHbnovW1c2K5bOPFWPDkYa/3mlrQsY/3gA57dcjpDzdgMMhIlbs9PbGi
 wUPBA0Y8ivHTQT+fSSjezSPRBu697GQpB7sgFlVPA9MO+ACMqsDp3LYCUYLSmFb0N72o
 7LT7bJJS0rfjYMGiKmam4zZ+h2rWPU4fp1PqqKt27nSrLJiA2zmB4aArJS5VcfctqJQX
 8Ym2wVWEA4i3ue/z0uhKfikAx0VSp66ngwUeb0CiMmlW2nRB3x45iKiVZFTaLqTq0eJg
 1nRw==
X-Gm-Message-State: AOAM531rQNRrdu1C5ASMPy168gK5OLDXGIynZOonOhBaKLlOHNCUCm2K
 t9u/KLmfZbli+/Vpfv8AZI9QEA2jaZN+Hg==
X-Google-Smtp-Source: ABdhPJyg/bXHNUxir9X0wCzuk8zoemHDs6V5ZSzuzlTN0HRj+gC1X/3MeUMJp4pEjWhu181d9UorXQ==
X-Received: by 2002:a1c:4b16:0:b0:38c:86c4:f205 with SMTP id
 y22-20020a1c4b16000000b0038c86c4f205mr3873446wma.131.1647609806514; 
 Fri, 18 Mar 2022 06:23:26 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.25
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:26 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 17/21] hw/misc: Add a model of the Xilinx ZynqMP APU Control
Date: Fri, 18 Mar 2022 13:23:02 +0000
Message-Id: <20220318132306.3254960-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::32f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a model of the Xilinx ZynqMP APU Control.

Reviewed-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220316164645.2303510-6-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/misc/xlnx-zynqmp-apu-ctrl.h |  93 +++++++++
 hw/misc/xlnx-zynqmp-apu-ctrl.c         | 253 +++++++++++++++++++++++++
 hw/misc/meson.build                    |   1 +
 3 files changed, 347 insertions(+)
 create mode 100644 include/hw/misc/xlnx-zynqmp-apu-ctrl.h
 create mode 100644 hw/misc/xlnx-zynqmp-apu-ctrl.c

diff --git a/include/hw/misc/xlnx-zynqmp-apu-ctrl.h b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
new file mode 100644
index 00000000000..b8ca9434afb
--- /dev/null
+++ b/include/hw/misc/xlnx-zynqmp-apu-ctrl.h
@@ -0,0 +1,93 @@
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
+OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPAPUCtrl, XLNX_ZYNQMP_APU_CTRL)
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
+struct XlnxZynqMPAPUCtrl {
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
+};
+
+#endif
diff --git a/hw/misc/xlnx-zynqmp-apu-ctrl.c b/hw/misc/xlnx-zynqmp-apu-ctrl.c
new file mode 100644
index 00000000000..20de23cf671
--- /dev/null
+++ b/hw/misc/xlnx-zynqmp-apu-ctrl.c
@@ -0,0 +1,253 @@
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
+#define XILINX_ZYNQMP_APU_ERR_DEBUG 0
+#endif
+
+static void update_wfi_out(void *opaque)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(opaque);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(reg->opaque);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(reg->opaque);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(reg->opaque);
+    imr_update_irq(s);
+}
+
+static uint64_t ien_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IMR] &= ~val;
+    imr_update_irq(s);
+    return 0;
+}
+
+static uint64_t ids_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(reg->opaque);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(obj);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(obj);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(opaque);
+
+    s->cpu_in_wfi = deposit32(s->cpu_in_wfi, irq, 1, level);
+    update_wfi_out(s);
+}
+
+static void zynqmp_apu_init(Object *obj)
+{
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(obj);
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
+    XlnxZynqMPAPUCtrl *s = XLNX_ZYNQMP_APU_CTRL(obj);
+    register_finalize_block(s->reg_array);
+}
+
+static const VMStateDescription vmstate_zynqmp_apu = {
+    .name = TYPE_XLNX_ZYNQMP_APU_CTRL,
+    .version_id = 1,
+    .minimum_version_id = 1,
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
index 61397f3bbb2..6fb69612e06 100644
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


