Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC8994DBE90
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Mar 2022 06:39:38 +0100 (CET)
Received: from localhost ([::1]:38606 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUirD-0004va-3n
	for lists+qemu-devel@lfdr.de; Thu, 17 Mar 2022 01:39:31 -0400
Received: from eggs.gnu.org ([209.51.188.92]:51782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiOM-0005tk-Vm
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:43 -0400
Received: from [2607:f8b0:4864:20::633] (port=44561
 helo=mail-pl1-x633.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nUiO8-0002ee-JD
 for qemu-devel@nongnu.org; Thu, 17 Mar 2022 01:09:30 -0400
Received: by mail-pl1-x633.google.com with SMTP id q11so3539948pln.11
 for <qemu-devel@nongnu.org>; Wed, 16 Mar 2022 22:09:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Oq3+WovLC1U0SsWCHamcVpyHHoEeCG/N4mUqpqq0Etc=;
 b=gRlO9TWSjaO05wf1ApSxTGIn2qucWy1c0oHK2Z2ZchYDTEWqs8+kVG9dwxn7zk38uV
 S3yET09MDPyGTdBHMU1Cln7a/NGcHDUzo5gmakEzpGNCZV6L4UQpvDKYO2Ofglj+hf7b
 44lo4O6lD129ihbyxsSJc/NZ4YuqDMSO3iizWWE1i4y8pfvKGBr0GTWPERcprX6XUQ3o
 BhoNdKOxyyJIWmIkIJClZ6SaACm6tHsiE0IYcBTyHG0VEYIN08mgmEOx/M5FaenTGx42
 0gafH0MnOHJI2hI5QJEblSXPM/0L2AtvjAWJ1KKJpFMgo2+jnerAKMTew8KJSlsa3uKW
 gkIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Oq3+WovLC1U0SsWCHamcVpyHHoEeCG/N4mUqpqq0Etc=;
 b=qTmvI500GyqYjtQhQT6cSFBOTYIOzkidyk0Pui4oS7ouLDLcG68J0VfQqLSbuzM4CV
 25gMRo2pZ3OWDlSOoz1p0jQs/d9mjNl+TnuTIbVKPKxDNqVYhqwGfLs55AcrlAerQ1xy
 gQR95KIWt7wh5LFloiFQfFtlHoMy3Jw49PXqA7hYproW1M8RI/aEddGPhsU7ivuW+Csf
 CHfgC2+GSc5mb+93YoPkov753k1trW0xZFdRWqZvTBaX+baArwmIMxZQV6ip/BDr5NWi
 JNEGYkj/ypHG6JrsEaWl5xtp1Nu9ZC10LYeJi5hIiF90V/gg9LokyDOKRAbq+O8V4lYl
 JkKA==
X-Gm-Message-State: AOAM5306dOpWsfWnTuMkNqM0KDDH8Gkjj+/9ORK1GiZMeoMrhAqZzgo6
 HsUmiW+BrNorl0Vpl6uErQFORIS+b99ZxA==
X-Google-Smtp-Source: ABdhPJyWAt94MubQbWs8dotv7WEEhWgeQ2B+66PKy+RpngbEgSua/Um51eIO7I6G8woTK/l1Q1g77A==
X-Received: by 2002:a17:90b:4a92:b0:1bf:2a03:987c with SMTP id
 lp18-20020a17090b4a9200b001bf2a03987cmr3283812pjb.186.1647493763740; 
 Wed, 16 Mar 2022 22:09:23 -0700 (PDT)
Received: from localhost.localdomain (174-21-142-130.tukw.qwest.net.
 [174.21.142.130]) by smtp.gmail.com with ESMTPSA id
 d10-20020a63360a000000b0037947abe4bbsm4217493pga.34.2022.03.16.22.09.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 22:09:23 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.1 v6 45/51] hw/intc: Vectored Interrupt Controller (VIC)
Date: Wed, 16 Mar 2022 22:05:32 -0700
Message-Id: <20220317050538.924111-46-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220317050538.924111-1-richard.henderson@linaro.org>
References: <20220317050538.924111-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::633
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
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
Cc: marex@denx.de, Peter Maydell <peter.maydell@linaro.org>,
 amir.gonnen@neuroblade.ai
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Amir Gonnen <amir.gonnen@neuroblade.ai>

Implement nios2 Vectored Interrupt Controller (VIC).
VIC is connected to EIC. It needs to update rha, ril, rrs and rnmi
fields on Nios2CPU before raising an IRQ.
For that purpose, VIC has a "cpu" property which should refer to the
nios2 cpu and set by the board that connects VIC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Amir Gonnen <amir.gonnen@neuroblade.ai>
Message-Id: <20220303153906.2024748-5-amir.gonnen@neuroblade.ai>
[rth: Split out nios2_vic.h]
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/intc/nios2_vic.h |  64 ++++++++
 hw/intc/nios2_vic.c         | 313 ++++++++++++++++++++++++++++++++++++
 hw/intc/Kconfig             |   3 +
 hw/intc/meson.build         |   1 +
 4 files changed, 381 insertions(+)
 create mode 100644 include/hw/intc/nios2_vic.h
 create mode 100644 hw/intc/nios2_vic.c

diff --git a/include/hw/intc/nios2_vic.h b/include/hw/intc/nios2_vic.h
new file mode 100644
index 0000000000..af1517a967
--- /dev/null
+++ b/include/hw/intc/nios2_vic.h
@@ -0,0 +1,64 @@
+/*
+ * Vectored Interrupt Controller for nios2 processor
+ *
+ * Copyright (c) 2022 Neuroblade
+ *
+ * Interface:
+ * QOM property "cpu": link to the Nios2 CPU (must be set)
+ * Unnamed GPIO inputs 0..NIOS2_VIC_MAX_IRQ-1: input IRQ lines
+ * IRQ should be connected to nios2 IRQ0.
+ *
+ * Reference: "Embedded Peripherals IP User Guide
+ *             for Intel® Quartus® Prime Design Suite: 21.4"
+ * Chapter 38 "Vectored Interrupt Controller Core"
+ * See: https://www.intel.com/content/www/us/en/docs/programmable/683130/21-4/vectored-interrupt-controller-core.html
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
+#ifndef HW_INTC_NIOS2_VIC
+#define HW_INTC_NIOS2_VIC
+
+#define TYPE_NIOS2_VIC "nios2-vic"
+OBJECT_DECLARE_SIMPLE_TYPE(Nios2VIC, NIOS2_VIC)
+
+#define NIOS2_VIC_MAX_IRQ 32
+
+struct Nios2VIC {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    qemu_irq output_int;
+
+    /* properties */
+    CPUState *cpu;
+    MemoryRegion csr;
+
+    uint32_t int_config[NIOS2_VIC_MAX_IRQ];
+    uint32_t vic_config;
+    uint32_t int_raw_status;
+    uint32_t int_enable;
+    uint32_t sw_int;
+    uint32_t vic_status;
+    uint32_t vec_tbl_base;
+    uint32_t vec_tbl_addr;
+};
+
+#endif /* HW_INTC_NIOS2_VIC */
diff --git a/hw/intc/nios2_vic.c b/hw/intc/nios2_vic.c
new file mode 100644
index 0000000000..cf63212a88
--- /dev/null
+++ b/hw/intc/nios2_vic.c
@@ -0,0 +1,313 @@
+/*
+ * Vectored Interrupt Controller for nios2 processor
+ *
+ * Copyright (c) 2022 Neuroblade
+ *
+ * Interface:
+ * QOM property "cpu": link to the Nios2 CPU (must be set)
+ * Unnamed GPIO inputs 0..NIOS2_VIC_MAX_IRQ-1: input IRQ lines
+ * IRQ should be connected to nios2 IRQ0.
+ *
+ * Reference: "Embedded Peripherals IP User Guide
+ *             for Intel® Quartus® Prime Design Suite: 21.4"
+ * Chapter 38 "Vectored Interrupt Controller Core"
+ * See: https://www.intel.com/content/www/us/en/docs/programmable/683130/21-4/vectored-interrupt-controller-core.html
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
+
+#include "hw/irq.h"
+#include "hw/qdev-properties.h"
+#include "hw/sysbus.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+#include "qemu/bitops.h"
+#include "qemu/log.h"
+#include "qom/object.h"
+#include "hw/intc/nios2_vic.h"
+#include "cpu.h"
+
+
+enum {
+    INT_CONFIG0 = 0,
+    INT_CONFIG31 = 31,
+    INT_ENABLE = 32,
+    INT_ENABLE_SET = 33,
+    INT_ENABLE_CLR = 34,
+    INT_PENDING = 35,
+    INT_RAW_STATUS = 36,
+    SW_INTERRUPT = 37,
+    SW_INTERRUPT_SET = 38,
+    SW_INTERRUPT_CLR = 39,
+    VIC_CONFIG = 40,
+    VIC_STATUS = 41,
+    VEC_TBL_BASE = 42,
+    VEC_TBL_ADDR = 43,
+    CSR_COUNT /* Last! */
+};
+
+/* Requested interrupt level (INT_CONFIG[0:5]) */
+static inline uint32_t vic_int_config_ril(const Nios2VIC *vic, int irq_num)
+{
+    return extract32(vic->int_config[irq_num], 0, 6);
+}
+
+/* Requested NMI (INT_CONFIG[6]) */
+static inline uint32_t vic_int_config_rnmi(const Nios2VIC *vic, int irq_num)
+{
+    return extract32(vic->int_config[irq_num], 6, 1);
+}
+
+/* Requested register set (INT_CONFIG[7:12]) */
+static inline uint32_t vic_int_config_rrs(const Nios2VIC *vic, int irq_num)
+{
+    return extract32(vic->int_config[irq_num], 7, 6);
+}
+
+static inline uint32_t vic_config_vec_size(const Nios2VIC *vic)
+{
+    return 1 << (2 + extract32(vic->vic_config, 0, 3));
+}
+
+static inline uint32_t vic_int_pending(const Nios2VIC *vic)
+{
+    return (vic->int_raw_status | vic->sw_int) & vic->int_enable;
+}
+
+static void vic_update_irq(Nios2VIC *vic)
+{
+    Nios2CPU *cpu = NIOS2_CPU(vic->cpu);
+    uint32_t pending = vic_int_pending(vic);
+    int irq = -1;
+    int max_ril = 0;
+    /* Note that if RIL is 0 for an interrupt it is effectively disabled */
+
+    vic->vec_tbl_addr = 0;
+    vic->vic_status = 0;
+
+    if (pending == 0) {
+        qemu_irq_lower(vic->output_int);
+        return;
+    }
+
+    for (int i = 0; i < NIOS2_VIC_MAX_IRQ; i++) {
+        if (pending & BIT(i)) {
+            int ril = vic_int_config_ril(vic, i);
+            if (ril > max_ril) {
+                irq = i;
+                max_ril = ril;
+            }
+        }
+    }
+
+    if (irq < 0) {
+        qemu_irq_lower(vic->output_int);
+        return;
+    }
+
+    vic->vec_tbl_addr = irq * vic_config_vec_size(vic) + vic->vec_tbl_base;
+    vic->vic_status = irq | BIT(31);
+
+    /*
+     * In hardware, the interface between the VIC and the CPU is via the
+     * External Interrupt Controller interface, where the interrupt controller
+     * presents the CPU with a packet of data containing:
+     *  - Requested Handler Address (RHA): 32 bits
+     *  - Requested Register Set (RRS) : 6 bits
+     *  - Requested Interrupt Level (RIL) : 6 bits
+     *  - Requested NMI flag (RNMI) : 1 bit
+     * In our emulation, we implement this by writing the data directly to
+     * fields in the CPU object and then raising the IRQ line to tell
+     * the CPU that we've done so.
+     */
+
+    cpu->rha = vic->vec_tbl_addr;
+    cpu->ril = max_ril;
+    cpu->rrs = vic_int_config_rrs(vic, irq);
+    cpu->rnmi = vic_int_config_rnmi(vic, irq);
+
+    qemu_irq_raise(vic->output_int);
+}
+
+static void vic_set_irq(void *opaque, int irq_num, int level)
+{
+    Nios2VIC *vic = opaque;
+
+    vic->int_raw_status = deposit32(vic->int_raw_status, irq_num, 1, !!level);
+    vic_update_irq(vic);
+}
+
+static void nios2_vic_reset(DeviceState *dev)
+{
+    Nios2VIC *vic = NIOS2_VIC(dev);
+
+    memset(&vic->int_config, 0, sizeof(vic->int_config));
+    vic->vic_config = 0;
+    vic->int_raw_status = 0;
+    vic->int_enable = 0;
+    vic->sw_int = 0;
+    vic->vic_status = 0;
+    vic->vec_tbl_base = 0;
+    vic->vec_tbl_addr = 0;
+}
+
+static uint64_t nios2_vic_csr_read(void *opaque, hwaddr offset, unsigned size)
+{
+    Nios2VIC *vic = opaque;
+    int index = offset / 4;
+
+    switch (index) {
+    case INT_CONFIG0 ... INT_CONFIG31:
+        return vic->int_config[index - INT_CONFIG0];
+    case INT_ENABLE:
+        return vic->int_enable;
+    case INT_PENDING:
+        return vic_int_pending(vic);
+    case INT_RAW_STATUS:
+        return vic->int_raw_status;
+    case SW_INTERRUPT:
+        return vic->sw_int;
+    case VIC_CONFIG:
+        return vic->vic_config;
+    case VIC_STATUS:
+        return vic->vic_status;
+    case VEC_TBL_BASE:
+        return vic->vec_tbl_base;
+    case VEC_TBL_ADDR:
+        return vic->vec_tbl_addr;
+    default:
+        return 0;
+    }
+}
+
+static void nios2_vic_csr_write(void *opaque, hwaddr offset, uint64_t value,
+                                unsigned size)
+{
+    Nios2VIC *vic = opaque;
+    int index = offset / 4;
+
+    switch (index) {
+    case INT_CONFIG0 ... INT_CONFIG31:
+        vic->int_config[index - INT_CONFIG0] = value;
+        break;
+    case INT_ENABLE:
+        vic->int_enable = value;
+        break;
+    case INT_ENABLE_SET:
+        vic->int_enable |= value;
+        break;
+    case INT_ENABLE_CLR:
+        vic->int_enable &= ~value;
+        break;
+    case SW_INTERRUPT:
+        vic->sw_int = value;
+        break;
+    case SW_INTERRUPT_SET:
+        vic->sw_int |= value;
+        break;
+    case SW_INTERRUPT_CLR:
+        vic->sw_int &= ~value;
+        break;
+    case VIC_CONFIG:
+        vic->vic_config = value;
+        break;
+    case VEC_TBL_BASE:
+        vic->vec_tbl_base = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "nios2-vic: write to invalid CSR address %#"
+                      HWADDR_PRIx "\n", offset);
+    }
+
+    vic_update_irq(vic);
+}
+
+static const MemoryRegionOps nios2_vic_csr_ops = {
+    .read = nios2_vic_csr_read,
+    .write = nios2_vic_csr_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid = { .min_access_size = 4, .max_access_size = 4 }
+};
+
+static void nios2_vic_realize(DeviceState *dev, Error **errp)
+{
+    Nios2VIC *vic = NIOS2_VIC(dev);
+
+    if (!vic->cpu) {
+        /* This is a programming error in the code using this device */
+        error_setg(errp, "nios2-vic 'cpu' link property was not set");
+        return;
+    }
+
+    sysbus_init_irq(SYS_BUS_DEVICE(dev), &vic->output_int);
+    qdev_init_gpio_in(dev, vic_set_irq, NIOS2_VIC_MAX_IRQ);
+
+    memory_region_init_io(&vic->csr, OBJECT(dev), &nios2_vic_csr_ops, vic,
+                          "nios2.vic.csr", CSR_COUNT * sizeof(uint32_t));
+    sysbus_init_mmio(SYS_BUS_DEVICE(dev), &vic->csr);
+}
+
+static Property nios2_vic_properties[] = {
+    DEFINE_PROP_LINK("cpu", Nios2VIC, cpu, TYPE_CPU, CPUState *),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static const VMStateDescription nios2_vic_vmstate = {
+    .name = "nios2-vic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]){
+        VMSTATE_UINT32_ARRAY(int_config, Nios2VIC, 32),
+        VMSTATE_UINT32(vic_config, Nios2VIC),
+        VMSTATE_UINT32(int_raw_status, Nios2VIC),
+        VMSTATE_UINT32(int_enable, Nios2VIC),
+        VMSTATE_UINT32(sw_int, Nios2VIC),
+        VMSTATE_UINT32(vic_status, Nios2VIC),
+        VMSTATE_UINT32(vec_tbl_base, Nios2VIC),
+        VMSTATE_UINT32(vec_tbl_addr, Nios2VIC),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void nios2_vic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = nios2_vic_reset;
+    dc->realize = nios2_vic_realize;
+    dc->vmsd = &nios2_vic_vmstate;
+    device_class_set_props(dc, nios2_vic_properties);
+}
+
+static const TypeInfo nios2_vic_info = {
+    .name = TYPE_NIOS2_VIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(Nios2VIC),
+    .class_init = nios2_vic_class_init,
+};
+
+static void nios2_vic_register_types(void)
+{
+    type_register_static(&nios2_vic_info);
+}
+
+type_init(nios2_vic_register_types);
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index ec8d4cec29..eeb2d6f428 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -84,3 +84,6 @@ config GOLDFISH_PIC
 
 config M68K_IRQC
     bool
+
+config NIOS2_VIC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 81ccdb0d78..167755ac64 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -62,3 +62,4 @@ specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
 specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
+specific_ss.add(when: 'CONFIG_NIOS2_VIC', if_true: files('nios2_vic.c'))
-- 
2.25.1


