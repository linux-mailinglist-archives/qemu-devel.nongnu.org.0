Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F26C331A65
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 23:49:28 +0100 (CET)
Received: from localhost ([::1]:59682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJOgp-00082C-K5
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 17:49:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34942)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lJOeC-00069G-Jw; Mon, 08 Mar 2021 17:46:44 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235]:39063)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1lJOeA-00038D-B1; Mon, 08 Mar 2021 17:46:44 -0500
Received: by mail-lj1-x235.google.com with SMTP id u4so18208569ljh.6;
 Mon, 08 Mar 2021 14:46:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eUdptTsSaAb74qDPAOtZcheqbFSIN8nlKmJ5wzafsMU=;
 b=QazIFEDG0LLFfviSlo+mvTTgfuulyJ1jY0NGVsQsVCEzLAX0b4y0VGuXifuUXh54Un
 w7wPqjFJGc7TThMOayhcxRuIizoYmj3c0J/0BQcaXlDZeTL5fluW2Z6sVut84B+KB9ZC
 OEfry4c0xjr1REwDyVZSMVJ7X7aioYvXPa4jWO2sjcqFcr+FVMttXuAWOJOGxPr9/x+g
 uf3zBRwRO6tFGYnVXEgLbNAlzqCeWfCr+5pewvVgwV2Sw14DIrdA55i1r5sWc0DIJfsg
 orbzr+P0FVEAwjrbC81tebfG4XIguNeacLnlY283sT0JOd7syGE41Ua01dR9TrkEHKPN
 jeKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eUdptTsSaAb74qDPAOtZcheqbFSIN8nlKmJ5wzafsMU=;
 b=l8ppdPTCPBZSF6zwFpzpKJ+P+acpLHA07Rqcpu98MW+1xBxUZfrefpi2nuyfIz7ACz
 PRcHvxV7ti/6QJidkmoEu06BxVO/2h0EIAE+zLcqYMvhlh9CEDlxS2PJOLwrqzSsjwA6
 WeGHkADKhCY/anY5OYewrbid4cfeggYCI/TtY/G7mewQvdEWQHW/e1mSTvWU4MNpAxX2
 7+oqo/NndNEu+1lCj1MzUaGH6HesV+FUQnOorDkDHDk4MIF2o5W4uxaaeIU+7Q2Fl7iw
 BiqATHhYq4vszwz3C8OW26T2ulWEhWbP01ixMDofreov0BO8/RAQTT7IH5aAhPTBn3Hp
 9mFw==
X-Gm-Message-State: AOAM532Wi7Kba9SBCMSyJF0jBQZTZyF1MN7d+C1V9ctwOWHJ4VzHRIuU
 IuQ3M0yNx9eDBnv4qajsk74TChmhId8vrXTh
X-Google-Smtp-Source: ABdhPJylkcv390yQ4ITXiTkyjyX/TBPUakRzNozAMRO6CUzUl8HXb2BPlGAm+LqAmNQMDfgG00YwNg==
X-Received: by 2002:a2e:9a0a:: with SMTP id o10mr15046584lji.432.1615243599298; 
 Mon, 08 Mar 2021 14:46:39 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id h6sm1506797lfd.77.2021.03.08.14.46.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 14:46:38 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/2] hw/misc: versal: Add a model of the XRAM controller
Date: Mon,  8 Mar 2021 23:46:36 +0100
Message-Id: <20210308224637.2949533-2-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
References: <20210308224637.2949533-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 joe.komlodi@xilinx.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Add a model of the Xilinx Versal Accelerator RAM (XRAM).
This is mainly a stub to make firmware happy. The size of
the RAMs can be probed. The interrupt mask logic is
modelled but none of the interrups will ever be raised
unless injected.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/misc/xlnx-versal-xramc.h |  97 +++++++++++
 hw/misc/xlnx-versal-xramc.c         | 253 ++++++++++++++++++++++++++++
 hw/misc/meson.build                 |   1 +
 3 files changed, 351 insertions(+)
 create mode 100644 include/hw/misc/xlnx-versal-xramc.h
 create mode 100644 hw/misc/xlnx-versal-xramc.c

diff --git a/include/hw/misc/xlnx-versal-xramc.h b/include/hw/misc/xlnx-versal-xramc.h
new file mode 100644
index 0000000000..d3d1862676
--- /dev/null
+++ b/include/hw/misc/xlnx-versal-xramc.h
@@ -0,0 +1,97 @@
+/*
+ * QEMU model of the Xilinx XRAM Controller.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+
+#ifndef XLNX_VERSAL_XRAMC_H
+#define XLNX_VERSAL_XRAMC_H
+
+#include "hw/sysbus.h"
+#include "hw/register.h"
+
+#define TYPE_XLNX_XRAM_CTRL "xlnx.versal-xramc"
+
+#define XLNX_XRAM_CTRL(obj) \
+     OBJECT_CHECK(XlnxXramCtrl, (obj), TYPE_XLNX_XRAM_CTRL)
+
+REG32(XRAM_ERR_CTRL, 0x0)
+    FIELD(XRAM_ERR_CTRL, UE_RES, 3, 1)
+    FIELD(XRAM_ERR_CTRL, PWR_ERR_RES, 2, 1)
+    FIELD(XRAM_ERR_CTRL, PZ_ERR_RES, 1, 1)
+    FIELD(XRAM_ERR_CTRL, APB_ERR_RES, 0, 1)
+REG32(XRAM_ISR, 0x4)
+    FIELD(XRAM_ISR, INV_APB, 0, 1)
+REG32(XRAM_IMR, 0x8)
+    FIELD(XRAM_IMR, INV_APB, 0, 1)
+REG32(XRAM_IEN, 0xc)
+    FIELD(XRAM_IEN, INV_APB, 0, 1)
+REG32(XRAM_IDS, 0x10)
+    FIELD(XRAM_IDS, INV_APB, 0, 1)
+REG32(XRAM_ECC_CNTL, 0x14)
+    FIELD(XRAM_ECC_CNTL, FI_MODE, 2, 1)
+    FIELD(XRAM_ECC_CNTL, DET_ONLY, 1, 1)
+    FIELD(XRAM_ECC_CNTL, ECC_ON_OFF, 0, 1)
+REG32(XRAM_CLR_EXE, 0x18)
+    FIELD(XRAM_CLR_EXE, MON_7, 7, 1)
+    FIELD(XRAM_CLR_EXE, MON_6, 6, 1)
+    FIELD(XRAM_CLR_EXE, MON_5, 5, 1)
+    FIELD(XRAM_CLR_EXE, MON_4, 4, 1)
+    FIELD(XRAM_CLR_EXE, MON_3, 3, 1)
+    FIELD(XRAM_CLR_EXE, MON_2, 2, 1)
+    FIELD(XRAM_CLR_EXE, MON_1, 1, 1)
+    FIELD(XRAM_CLR_EXE, MON_0, 0, 1)
+REG32(XRAM_CE_FFA, 0x1c)
+    FIELD(XRAM_CE_FFA, ADDR, 0, 20)
+REG32(XRAM_CE_FFD0, 0x20)
+REG32(XRAM_CE_FFD1, 0x24)
+REG32(XRAM_CE_FFD2, 0x28)
+REG32(XRAM_CE_FFD3, 0x2c)
+REG32(XRAM_CE_FFE, 0x30)
+    FIELD(XRAM_CE_FFE, SYNDROME, 0, 16)
+REG32(XRAM_UE_FFA, 0x34)
+    FIELD(XRAM_UE_FFA, ADDR, 0, 20)
+REG32(XRAM_UE_FFD0, 0x38)
+REG32(XRAM_UE_FFD1, 0x3c)
+REG32(XRAM_UE_FFD2, 0x40)
+REG32(XRAM_UE_FFD3, 0x44)
+REG32(XRAM_UE_FFE, 0x48)
+    FIELD(XRAM_UE_FFE, SYNDROME, 0, 16)
+REG32(XRAM_FI_D0, 0x4c)
+REG32(XRAM_FI_D1, 0x50)
+REG32(XRAM_FI_D2, 0x54)
+REG32(XRAM_FI_D3, 0x58)
+REG32(XRAM_FI_SY, 0x5c)
+    FIELD(XRAM_FI_SY, DATA, 0, 16)
+REG32(XRAM_RMW_UE_FFA, 0x70)
+    FIELD(XRAM_RMW_UE_FFA, ADDR, 0, 20)
+REG32(XRAM_FI_CNTR, 0x74)
+    FIELD(XRAM_FI_CNTR, COUNT, 0, 24)
+REG32(XRAM_IMP, 0x80)
+    FIELD(XRAM_IMP, SIZE, 0, 4)
+REG32(XRAM_PRDY_DBG, 0x84)
+    FIELD(XRAM_PRDY_DBG, ISLAND3, 12, 4)
+    FIELD(XRAM_PRDY_DBG, ISLAND2, 8, 4)
+    FIELD(XRAM_PRDY_DBG, ISLAND1, 4, 4)
+    FIELD(XRAM_PRDY_DBG, ISLAND0, 0, 4)
+REG32(XRAM_SAFETY_CHK, 0xff8)
+
+#define XRAM_CTRL_R_MAX (R_XRAM_SAFETY_CHK + 1)
+
+typedef struct XlnxXramCtrl {
+    SysBusDevice parent_obj;
+    MemoryRegion ram;
+    qemu_irq irq;
+
+    struct {
+        uint64_t size;
+        unsigned int encoded_size;
+    } cfg;
+
+    RegisterInfoArray *reg_array;
+    uint32_t regs[XRAM_CTRL_R_MAX];
+    RegisterInfo regs_info[XRAM_CTRL_R_MAX];
+} XlnxXramCtrl;
+#endif
diff --git a/hw/misc/xlnx-versal-xramc.c b/hw/misc/xlnx-versal-xramc.c
new file mode 100644
index 0000000000..e5b719a0ed
--- /dev/null
+++ b/hw/misc/xlnx-versal-xramc.c
@@ -0,0 +1,253 @@
+/*
+ * QEMU model of the Xilinx XRAM Controller.
+ *
+ * Copyright (c) 2021 Xilinx Inc.
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ * Written by Edgar E. Iglesias <edgar.iglesias@xilinx.com>
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/units.h"
+#include "qapi/error.h"
+#include "migration/vmstate.h"
+#include "hw/sysbus.h"
+#include "hw/register.h"
+#include "hw/qdev-properties.h"
+#include "hw/irq.h"
+#include "hw/misc/xlnx-versal-xramc.h"
+
+#ifndef XLNX_XRAM_CTRL_ERR_DEBUG
+#define XLNX_XRAM_CTRL_ERR_DEBUG 0
+#endif
+
+static void xram_update_irq(XlnxXramCtrl *s)
+{
+    bool pending = s->regs[R_XRAM_ISR] & ~s->regs[R_XRAM_IMR];
+    qemu_set_irq(s->irq, pending);
+}
+
+static void xram_isr_postw(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(reg->opaque);
+    xram_update_irq(s);
+}
+
+static uint64_t xram_ien_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_XRAM_IMR] &= ~val;
+    xram_update_irq(s);
+    return 0;
+}
+
+static uint64_t xram_ids_prew(RegisterInfo *reg, uint64_t val64)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_XRAM_IMR] |= val;
+    xram_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo xram_ctrl_regs_info[] = {
+    {   .name = "XRAM_ERR_CTRL",  .addr = A_XRAM_ERR_CTRL,
+        .reset = 0xf,
+        .rsvd = 0xfffffff0,
+    },{ .name = "XRAM_ISR",  .addr = A_XRAM_ISR,
+        .rsvd = 0xfffff800,
+        .w1c = 0x7ff,
+        .post_write = xram_isr_postw,
+    },{ .name = "XRAM_IMR",  .addr = A_XRAM_IMR,
+        .reset = 0x7ff,
+        .rsvd = 0xfffff800,
+        .ro = 0x7ff,
+    },{ .name = "XRAM_IEN",  .addr = A_XRAM_IEN,
+        .rsvd = 0xfffff800,
+        .pre_write = xram_ien_prew,
+    },{ .name = "XRAM_IDS",  .addr = A_XRAM_IDS,
+        .rsvd = 0xfffff800,
+        .pre_write = xram_ids_prew,
+    },{ .name = "XRAM_ECC_CNTL",  .addr = A_XRAM_ECC_CNTL,
+        .rsvd = 0xfffffff8,
+    },{ .name = "XRAM_CLR_EXE",  .addr = A_XRAM_CLR_EXE,
+        .rsvd = 0xffffff00,
+    },{ .name = "XRAM_CE_FFA",  .addr = A_XRAM_CE_FFA,
+        .rsvd = 0xfff00000,
+        .ro = 0xfffff,
+    },{ .name = "XRAM_CE_FFD0",  .addr = A_XRAM_CE_FFD0,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_CE_FFD1",  .addr = A_XRAM_CE_FFD1,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_CE_FFD2",  .addr = A_XRAM_CE_FFD2,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_CE_FFD3",  .addr = A_XRAM_CE_FFD3,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_CE_FFE",  .addr = A_XRAM_CE_FFE,
+        .rsvd = 0xffff0000,
+        .ro = 0xffff,
+    },{ .name = "XRAM_UE_FFA",  .addr = A_XRAM_UE_FFA,
+        .rsvd = 0xfff00000,
+        .ro = 0xfffff,
+    },{ .name = "XRAM_UE_FFD0",  .addr = A_XRAM_UE_FFD0,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_UE_FFD1",  .addr = A_XRAM_UE_FFD1,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_UE_FFD2",  .addr = A_XRAM_UE_FFD2,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_UE_FFD3",  .addr = A_XRAM_UE_FFD3,
+        .ro = 0xffffffff,
+    },{ .name = "XRAM_UE_FFE",  .addr = A_XRAM_UE_FFE,
+        .rsvd = 0xffff0000,
+        .ro = 0xffff,
+    },{ .name = "XRAM_FI_D0",  .addr = A_XRAM_FI_D0,
+    },{ .name = "XRAM_FI_D1",  .addr = A_XRAM_FI_D1,
+    },{ .name = "XRAM_FI_D2",  .addr = A_XRAM_FI_D2,
+    },{ .name = "XRAM_FI_D3",  .addr = A_XRAM_FI_D3,
+    },{ .name = "XRAM_FI_SY",  .addr = A_XRAM_FI_SY,
+        .rsvd = 0xffff0000,
+    },{ .name = "XRAM_RMW_UE_FFA",  .addr = A_XRAM_RMW_UE_FFA,
+        .rsvd = 0xfff00000,
+        .ro = 0xfffff,
+    },{ .name = "XRAM_FI_CNTR",  .addr = A_XRAM_FI_CNTR,
+        .rsvd = 0xff000000,
+    },{ .name = "XRAM_IMP",  .addr = A_XRAM_IMP,
+        .reset = 0x4,
+        .rsvd = 0xfffffff0,
+        .ro = 0xf,
+    },{ .name = "XRAM_PRDY_DBG",  .addr = A_XRAM_PRDY_DBG,
+        .reset = 0xffff,
+        .rsvd = 0xffff0000,
+        .ro = 0xffff,
+    },{ .name = "XRAM_SAFETY_CHK",  .addr = A_XRAM_SAFETY_CHK,
+    }
+};
+
+static void xram_ctrl_reset_enter(Object *obj, ResetType type)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+
+    ARRAY_FIELD_DP32(s->regs, XRAM_IMP, SIZE, s->cfg.encoded_size);
+}
+
+static void xram_ctrl_reset_hold(Object *obj)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
+
+    xram_update_irq(s);
+}
+
+static const MemoryRegionOps xram_ctrl_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void xram_ctrl_realize(DeviceState *dev, Error **errp)
+{
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(dev);
+
+    switch (s->cfg.size) {
+    case 64 * KiB:
+        s->cfg.encoded_size = 0;
+        break;
+    case 128 * KiB:
+        s->cfg.encoded_size = 1;
+        break;
+    case 256 * KiB:
+        s->cfg.encoded_size = 2;
+        break;
+    case 512 * KiB:
+        s->cfg.encoded_size = 3;
+        break;
+    case 1 * MiB:
+        s->cfg.encoded_size = 4;
+        break;
+    default:
+        error_setg(errp, "Unsupported XRAM size %" PRId64, s->cfg.size);
+        return;
+    }
+
+    memory_region_init_ram(&s->ram, OBJECT(s),
+                           object_get_canonical_path_component(OBJECT(s)),
+                           s->cfg.size, &error_fatal);
+    sysbus_init_mmio(sbd, &s->ram);
+}
+
+static void xram_ctrl_init(Object *obj)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    s->reg_array =
+        register_init_block32(DEVICE(obj), xram_ctrl_regs_info,
+                              ARRAY_SIZE(xram_ctrl_regs_info),
+                              s->regs_info, s->regs,
+                              &xram_ctrl_ops,
+                              XLNX_XRAM_CTRL_ERR_DEBUG,
+                              XRAM_CTRL_R_MAX * 4);
+    sysbus_init_mmio(sbd, &s->reg_array->mem);
+    sysbus_init_irq(sbd, &s->irq);
+}
+
+static void xram_ctrl_finalize(Object *obj)
+{
+    XlnxXramCtrl *s = XLNX_XRAM_CTRL(obj);
+    register_finalize_block(s->reg_array);
+}
+
+static const VMStateDescription vmstate_xram_ctrl = {
+    .name = TYPE_XLNX_XRAM_CTRL,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, XlnxXramCtrl, XRAM_CTRL_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static Property xram_ctrl_properties[] = {
+    DEFINE_PROP_UINT64("size", XlnxXramCtrl, cfg.size, 1 * MiB),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void xram_ctrl_class_init(ObjectClass *klass, void *data)
+{
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->realize = xram_ctrl_realize;
+    dc->vmsd = &vmstate_xram_ctrl;
+    device_class_set_props(dc, xram_ctrl_properties);
+
+    rc->phases.enter = xram_ctrl_reset_enter;
+    rc->phases.hold = xram_ctrl_reset_hold;
+}
+
+static const TypeInfo xram_ctrl_info = {
+    .name              = TYPE_XLNX_XRAM_CTRL,
+    .parent            = TYPE_SYS_BUS_DEVICE,
+    .instance_size     = sizeof(XlnxXramCtrl),
+    .class_init        = xram_ctrl_class_init,
+    .instance_init     = xram_ctrl_init,
+    .instance_finalize = xram_ctrl_finalize,
+};
+
+static void xram_ctrl_register_types(void)
+{
+    type_register_static(&xram_ctrl_info);
+}
+
+type_init(xram_ctrl_register_types)
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 629283957f..fbc4789249 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -85,6 +85,7 @@ softmmu_ss.add(when: 'CONFIG_RASPI', if_true: files(
 ))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_misc.c'))
 softmmu_ss.add(when: 'CONFIG_ZYNQ', if_true: files('zynq_slcr.c', 'zynq-xadc.c'))
+softmmu_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-xramc.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_SYSCFG', if_true: files('stm32f2xx_syscfg.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F4XX_SYSCFG', if_true: files('stm32f4xx_syscfg.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F4XX_EXTI', if_true: files('stm32f4xx_exti.c'))
-- 
2.25.1


