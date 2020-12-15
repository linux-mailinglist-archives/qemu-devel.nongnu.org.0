Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4711F2DAED7
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Dec 2020 15:24:49 +0100 (CET)
Received: from localhost ([::1]:48962 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kpBFw-00089N-AK
	for lists+qemu-devel@lfdr.de; Tue, 15 Dec 2020 09:24:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34140)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4h-0001c3-DK
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:12 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:36395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kpB4R-0007A2-FD
 for qemu-devel@nongnu.org; Tue, 15 Dec 2020 09:13:11 -0500
Received: by mail-wr1-x433.google.com with SMTP id t16so19993938wra.3
 for <qemu-devel@nongnu.org>; Tue, 15 Dec 2020 06:12:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=AjSVTnh/mQG/jhr7fSjAA8Ctwp9wsq/rOWNEwCe6vqw=;
 b=LC1yrD+oGYs/qEZe6fawt+khC70PwYA+EpNoJd7LZ/rErAMkYN0dXbKBReU3rz4lcU
 VZySicB8fqc6GrCOGPpPE4i7ONPc7sTT92j/AzDyJ70ZnP+ZEjvg9vpLbjfvycSFZQgo
 DaCxl6fdXCLv/mLzvoOcb0tZUtK2Umh2FDM9Za8ediyJyRF4KUewUKJ1NWywDflK4IG/
 a79PckpxsoBB4G9F31qaGVear3nGZeQc76itYKUlWCQo0/5SD+f8A5hhNq/KF/STARVD
 dO99cnoIJn9gEORp14NTgYtL4jDksZdvNH2AzNkat0k62ENiwoMsoHSGvSgslwAuYlDk
 9o9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AjSVTnh/mQG/jhr7fSjAA8Ctwp9wsq/rOWNEwCe6vqw=;
 b=Xp7P0W21ydQOM+H7+s2nn5EifONrGvoT2wEHIeuXBPIJiL78dd2y5JPtSCCcClA0bw
 bK36rh/i1K5EBZwl6XDj0u3R1VesE6OSQmRhheYz8ceesSKZcsQCj0FAmWNjQjSCquC4
 wfk/wbgeeVfUnd6/M2oLcooeZ5r7B/1Zd2GtedwrfDjTklX1Gtttggl0bFe2zu7PSNMJ
 7m/FWRDYVmEf50NuRf13GHKUGTPoveYCif5ThluacsPYlvKBrRbmxsfCrp+7vixt37kO
 wHKa+KNvZQMSTauvZ7ubHPrzUqrLu0hLVkwpIkwzhrQfZYwPKlGA9ApZmYAlcyry7kLa
 mAGw==
X-Gm-Message-State: AOAM530ybnJhT2oTP7f8hJyAJ0hyJr4z3oQ0qg3GoD0uizaVOHJn2YB+
 Z+CUScTVhTkr91hURk8BO0TJFg9erjMbeg==
X-Google-Smtp-Source: ABdhPJx910Ub5X1JwwKiMAbnDkq/OIReP3Lc8hMKuJxOjXTSwJEL634HVbs7Mqmh+vAPIVVnPJwWvA==
X-Received: by 2002:a5d:4682:: with SMTP id u2mr33931182wrq.265.1608041573652; 
 Tue, 15 Dec 2020 06:12:53 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w21sm19667319wmi.45.2020.12.15.06.12.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Dec 2020 06:12:52 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/20] usb: Add versal-usb2-ctrl-regs module
Date: Tue, 15 Dec 2020 14:12:29 +0000
Message-Id: <20201215141237.17868-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201215141237.17868-1-peter.maydell@linaro.org>
References: <20201215141237.17868-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
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

From: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>

This module emulates control registers of versal usb2 controller, this is added
just to make guest happy. In general this module would control the phy-reset
signal from usb controller, data coherency of the transactions, signals
the host system errors received from controller.

Signed-off-by: Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>
Signed-off-by: Vikram Garhwal <fnu.vikram@xilinx.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-id: 1607023357-5096-2-git-send-email-sai.pavan.boddu@xilinx.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h |  45 ++++
 hw/usb/xlnx-versal-usb2-ctrl-regs.c         | 229 ++++++++++++++++++++
 hw/usb/meson.build                          |   1 +
 3 files changed, 275 insertions(+)
 create mode 100644 include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
 create mode 100644 hw/usb/xlnx-versal-usb2-ctrl-regs.c

diff --git a/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
new file mode 100644
index 00000000000..975a717627a
--- /dev/null
+++ b/include/hw/usb/xlnx-versal-usb2-ctrl-regs.h
@@ -0,0 +1,45 @@
+/*
+ * QEMU model of the VersalUsb2CtrlRegs Register control/Status block for
+ * USB2.0 controller
+ *
+ * Copyright (c) 2020 Xilinx Inc. Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#ifndef _XLNX_USB2_REGS_H_
+#define _XLNX_USB2_REGS_H_
+
+#define TYPE_XILINX_VERSAL_USB2_CTRL_REGS "xlnx.versal-usb2-ctrl-regs"
+
+#define XILINX_VERSAL_USB2_CTRL_REGS(obj) \
+     OBJECT_CHECK(VersalUsb2CtrlRegs, (obj), TYPE_XILINX_VERSAL_USB2_CTRL_REGS)
+
+#define USB2_REGS_R_MAX ((0x78 / 4) + 1)
+
+typedef struct VersalUsb2CtrlRegs {
+    SysBusDevice parent_obj;
+    MemoryRegion iomem;
+    qemu_irq irq_ir;
+
+    uint32_t regs[USB2_REGS_R_MAX];
+    RegisterInfo regs_info[USB2_REGS_R_MAX];
+} VersalUsb2CtrlRegs;
+
+#endif
diff --git a/hw/usb/xlnx-versal-usb2-ctrl-regs.c b/hw/usb/xlnx-versal-usb2-ctrl-regs.c
new file mode 100644
index 00000000000..9eaa59ebb8b
--- /dev/null
+++ b/hw/usb/xlnx-versal-usb2-ctrl-regs.c
@@ -0,0 +1,229 @@
+/*
+ * QEMU model of the VersalUsb2CtrlRegs Register control/Status block for
+ * USB2.0 controller
+ *
+ * This module should control phy_reset, permanent device plugs, frame length
+ * time adjust & setting of coherency paths. None of which are emulated in
+ * present model.
+ *
+ * Copyright (c) 2020 Xilinx Inc. Vikram Garhwal <fnu.vikram@xilinx.com>
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+#include "hw/register.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "migration/vmstate.h"
+#include "hw/usb/xlnx-versal-usb2-ctrl-regs.h"
+
+#ifndef XILINX_VERSAL_USB2_CTRL_REGS_ERR_DEBUG
+#define XILINX_VERSAL_USB2_CTRL_REGS_ERR_DEBUG 0
+#endif
+
+REG32(BUS_FILTER, 0x30)
+    FIELD(BUS_FILTER, BYPASS, 0, 4)
+REG32(PORT, 0x34)
+    FIELD(PORT, HOST_SMI_BAR_WR, 4, 1)
+    FIELD(PORT, HOST_SMI_PCI_CMD_REG_WR, 3, 1)
+    FIELD(PORT, HOST_MSI_ENABLE, 2, 1)
+    FIELD(PORT, PWR_CTRL_PRSNT, 1, 1)
+    FIELD(PORT, HUB_PERM_ATTACH, 0, 1)
+REG32(JITTER_ADJUST, 0x38)
+    FIELD(JITTER_ADJUST, FLADJ, 0, 6)
+REG32(BIGENDIAN, 0x40)
+    FIELD(BIGENDIAN, ENDIAN_GS, 0, 1)
+REG32(COHERENCY, 0x44)
+    FIELD(COHERENCY, USB_COHERENCY, 0, 1)
+REG32(XHC_BME, 0x48)
+    FIELD(XHC_BME, XHC_BME, 0, 1)
+REG32(REG_CTRL, 0x60)
+    FIELD(REG_CTRL, SLVERR_ENABLE, 0, 1)
+REG32(IR_STATUS, 0x64)
+    FIELD(IR_STATUS, HOST_SYS_ERR, 1, 1)
+    FIELD(IR_STATUS, ADDR_DEC_ERR, 0, 1)
+REG32(IR_MASK, 0x68)
+    FIELD(IR_MASK, HOST_SYS_ERR, 1, 1)
+    FIELD(IR_MASK, ADDR_DEC_ERR, 0, 1)
+REG32(IR_ENABLE, 0x6c)
+    FIELD(IR_ENABLE, HOST_SYS_ERR, 1, 1)
+    FIELD(IR_ENABLE, ADDR_DEC_ERR, 0, 1)
+REG32(IR_DISABLE, 0x70)
+    FIELD(IR_DISABLE, HOST_SYS_ERR, 1, 1)
+    FIELD(IR_DISABLE, ADDR_DEC_ERR, 0, 1)
+REG32(USB3, 0x78)
+
+static void ir_update_irq(VersalUsb2CtrlRegs *s)
+{
+    bool pending = s->regs[R_IR_STATUS] & ~s->regs[R_IR_MASK];
+    qemu_set_irq(s->irq_ir, pending);
+}
+
+static void ir_status_postw(RegisterInfo *reg, uint64_t val64)
+{
+    VersalUsb2CtrlRegs *s = XILINX_VERSAL_USB2_CTRL_REGS(reg->opaque);
+    /*
+     * TODO: This should also clear USBSTS.HSE field in USB XHCI register.
+     * May be combine both the modules.
+     */
+    ir_update_irq(s);
+}
+
+static uint64_t ir_enable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    VersalUsb2CtrlRegs *s = XILINX_VERSAL_USB2_CTRL_REGS(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] &= ~val;
+    ir_update_irq(s);
+    return 0;
+}
+
+static uint64_t ir_disable_prew(RegisterInfo *reg, uint64_t val64)
+{
+    VersalUsb2CtrlRegs *s = XILINX_VERSAL_USB2_CTRL_REGS(reg->opaque);
+    uint32_t val = val64;
+
+    s->regs[R_IR_MASK] |= val;
+    ir_update_irq(s);
+    return 0;
+}
+
+static const RegisterAccessInfo usb2_ctrl_regs_regs_info[] = {
+    {   .name = "BUS_FILTER",  .addr = A_BUS_FILTER,
+        .rsvd = 0xfffffff0,
+    },{ .name = "PORT",  .addr = A_PORT,
+        .rsvd = 0xffffffe0,
+    },{ .name = "JITTER_ADJUST",  .addr = A_JITTER_ADJUST,
+        .reset = 0x20,
+        .rsvd = 0xffffffc0,
+    },{ .name = "BIGENDIAN",  .addr = A_BIGENDIAN,
+        .rsvd = 0xfffffffe,
+    },{ .name = "COHERENCY",  .addr = A_COHERENCY,
+        .rsvd = 0xfffffffe,
+    },{ .name = "XHC_BME",  .addr = A_XHC_BME,
+        .reset = 0x1,
+        .rsvd = 0xfffffffe,
+    },{ .name = "REG_CTRL",  .addr = A_REG_CTRL,
+        .rsvd = 0xfffffffe,
+    },{ .name = "IR_STATUS",  .addr = A_IR_STATUS,
+        .rsvd = 0xfffffffc,
+        .w1c = 0x3,
+        .post_write = ir_status_postw,
+    },{ .name = "IR_MASK",  .addr = A_IR_MASK,
+        .reset = 0x3,
+        .rsvd = 0xfffffffc,
+        .ro = 0x3,
+    },{ .name = "IR_ENABLE",  .addr = A_IR_ENABLE,
+        .rsvd = 0xfffffffc,
+        .pre_write = ir_enable_prew,
+    },{ .name = "IR_DISABLE",  .addr = A_IR_DISABLE,
+        .rsvd = 0xfffffffc,
+        .pre_write = ir_disable_prew,
+    },{ .name = "USB3",  .addr = A_USB3,
+    }
+};
+
+static void usb2_ctrl_regs_reset_init(Object *obj, ResetType type)
+{
+    VersalUsb2CtrlRegs *s = XILINX_VERSAL_USB2_CTRL_REGS(obj);
+    unsigned int i;
+
+    for (i = 0; i < ARRAY_SIZE(s->regs_info); ++i) {
+        register_reset(&s->regs_info[i]);
+    }
+}
+
+static void usb2_ctrl_regs_reset_hold(Object *obj)
+{
+    VersalUsb2CtrlRegs *s = XILINX_VERSAL_USB2_CTRL_REGS(obj);
+
+    ir_update_irq(s);
+}
+
+static const MemoryRegionOps usb2_ctrl_regs_ops = {
+    .read = register_read_memory,
+    .write = register_write_memory,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = {
+        .min_access_size = 4,
+        .max_access_size = 4,
+    },
+};
+
+static void usb2_ctrl_regs_init(Object *obj)
+{
+    VersalUsb2CtrlRegs *s = XILINX_VERSAL_USB2_CTRL_REGS(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+    RegisterInfoArray *reg_array;
+
+    memory_region_init(&s->iomem, obj, TYPE_XILINX_VERSAL_USB2_CTRL_REGS,
+                       USB2_REGS_R_MAX * 4);
+    reg_array =
+        register_init_block32(DEVICE(obj), usb2_ctrl_regs_regs_info,
+                              ARRAY_SIZE(usb2_ctrl_regs_regs_info),
+                              s->regs_info, s->regs,
+                              &usb2_ctrl_regs_ops,
+                              XILINX_VERSAL_USB2_CTRL_REGS_ERR_DEBUG,
+                              USB2_REGS_R_MAX * 4);
+    memory_region_add_subregion(&s->iomem,
+                                0x0,
+                                &reg_array->mem);
+    sysbus_init_mmio(sbd, &s->iomem);
+    sysbus_init_irq(sbd, &s->irq_ir);
+}
+
+static const VMStateDescription vmstate_usb2_ctrl_regs = {
+    .name = TYPE_XILINX_VERSAL_USB2_CTRL_REGS,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(regs, VersalUsb2CtrlRegs, USB2_REGS_R_MAX),
+        VMSTATE_END_OF_LIST(),
+    }
+};
+
+static void usb2_ctrl_regs_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    rc->phases.enter = usb2_ctrl_regs_reset_init;
+    rc->phases.hold  = usb2_ctrl_regs_reset_hold;
+    dc->vmsd = &vmstate_usb2_ctrl_regs;
+}
+
+static const TypeInfo usb2_ctrl_regs_info = {
+    .name          = TYPE_XILINX_VERSAL_USB2_CTRL_REGS,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(VersalUsb2CtrlRegs),
+    .class_init    = usb2_ctrl_regs_class_init,
+    .instance_init = usb2_ctrl_regs_init,
+};
+
+static void usb2_ctrl_regs_register_types(void)
+{
+    type_register_static(&usb2_ctrl_regs_info);
+}
+
+type_init(usb2_ctrl_regs_register_types)
diff --git a/hw/usb/meson.build b/hw/usb/meson.build
index 934e4fa6755..ecfec0a8f46 100644
--- a/hw/usb/meson.build
+++ b/hw/usb/meson.build
@@ -30,6 +30,7 @@ softmmu_ss.add(when: 'CONFIG_USB_DWC2', if_true: files('hcd-dwc2.c'))
 softmmu_ss.add(when: 'CONFIG_TUSB6010', if_true: files('tusb6010.c'))
 softmmu_ss.add(when: 'CONFIG_IMX', if_true: files('chipidea.c'))
 softmmu_ss.add(when: 'CONFIG_IMX_USBPHY', if_true: files('imx-usb-phy.c'))
+specific_ss.add(when: 'CONFIG_XLNX_VERSAL', if_true: files('xlnx-versal-usb2-ctrl-regs.c'))
 
 # emulated usb devices
 softmmu_ss.add(when: 'CONFIG_USB', if_true: files('dev-hub.c'))
-- 
2.20.1


