Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CA9962EB876
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jan 2021 04:40:48 +0100 (CET)
Received: from localhost ([::1]:49036 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwzgl-0007Pa-SQ
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 22:40:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:44740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzeh-0005Xu-Fk; Tue, 05 Jan 2021 22:38:39 -0500
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:44969 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1kwzed-0006FG-MF; Tue, 05 Jan 2021 22:38:39 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4D9ZpF6WXgz9sVk; Wed,  6 Jan 2021 14:38:29 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1609904309;
 bh=tuNOZd4zGdQU0fjldGt193XBg5z1cDi+a+IZw3pfuDo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=TtdNJafPM713oBPGKBpbwl5W9Esf8FfHSqzB1CVm1W9/lejbXdWd+21lHII9vQDpR
 abc22NHj3DLiQpR6zBZQHUR8SsKVXwKuUVCewuAbJxmScTJmSm8sR1aDqjxJ+8z1SY
 tW6iBki/+2aIVnvJtdTFZDAAQiBDQ1kiY+SpO+rQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 02/22] ppc: Convert PPC UIC to a QOM device
Date: Wed,  6 Jan 2021 14:37:56 +1100
Message-Id: <20210106033816.232598-3-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210106033816.232598-1-david@gibson.dropbear.id.au>
References: <20210106033816.232598-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Peter Maydell <peter.maydell@linaro.org>

Currently the PPC UIC ("Universal Interrupt Controller") is implemented
as a non-QOM device in ppc4xx_devs.c. Convert it to a proper QOM device
in hw/intc.

The ppcuic_init() function is retained for the moment with its current
interface; in subsequent commits this will be tidied up to avoid the
allocation of an irq array.

This conversion adds VMState support.

It leaves the LOG_UIC() macro as-is to maximise the extent to which
this is simply code-movement rather than a rewrite (in new code it
would be better to use tracepoints).

The default property values for dcr-base and use-vectors are set to
match those use by most of our boards with a UIC.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20201212001537.24520-3-peter.maydell@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Tested-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS               |   2 +
 hw/intc/Kconfig           |   3 +
 hw/intc/meson.build       |   1 +
 hw/intc/ppc-uic.c         | 321 ++++++++++++++++++++++++++++++++++++++
 hw/ppc/Kconfig            |   1 +
 hw/ppc/ppc4xx_devs.c      | 267 ++++---------------------------
 include/hw/intc/ppc-uic.h |  73 +++++++++
 7 files changed, 431 insertions(+), 237 deletions(-)
 create mode 100644 hw/intc/ppc-uic.c
 create mode 100644 include/hw/intc/ppc-uic.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 42fedf91e7..edd11ab9c4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1680,6 +1680,8 @@ F: hw/ppc/ppc4*.c
 F: hw/i2c/ppc4xx_i2c.c
 F: include/hw/ppc/ppc4xx.h
 F: include/hw/i2c/ppc4xx_i2c.h
+F: hw/intc/ppc-uic.c
+F: include/hw/intc/ppc-uic.h
 
 Character devices
 M: Marc-André Lureau <marcandre.lureau@redhat.com>
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index d07954086a..468d548ca7 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -62,6 +62,9 @@ config S390_FLIC_KVM
 config OMPIC
     bool
 
+config PPC_UIC
+    bool
+
 config RX_ICU
     bool
 
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 7c3e9daf58..68da782ad2 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -41,6 +41,7 @@ specific_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_intc.c'))
 specific_ss.add(when: 'CONFIG_OMPIC', if_true: files('ompic.c'))
 specific_ss.add(when: 'CONFIG_OPENPIC_KVM', if_true: files('openpic_kvm.c'))
 specific_ss.add(when: 'CONFIG_POWERNV', if_true: files('xics_pnv.c', 'pnv_xive.c'))
+specific_ss.add(when: 'CONFIG_PPC_UIC', if_true: files('ppc-uic.c'))
 specific_ss.add(when: 'CONFIG_RASPI', if_true: files('bcm2835_ic.c', 'bcm2836_control.c'))
 specific_ss.add(when: 'CONFIG_RX_ICU', if_true: files('rx_icu.c'))
 specific_ss.add(when: 'CONFIG_S390_FLIC', if_true: files('s390_flic.c'))
diff --git a/hw/intc/ppc-uic.c b/hw/intc/ppc-uic.c
new file mode 100644
index 0000000000..b21951eea8
--- /dev/null
+++ b/hw/intc/ppc-uic.c
@@ -0,0 +1,321 @@
+/*
+ * "Universal" Interrupt Controller for PowerPPC 4xx embedded processors
+ *
+ * Copyright (c) 2007 Jocelyn Mayer
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
+#include "include/hw/intc/ppc-uic.h"
+#include "hw/irq.h"
+#include "cpu.h"
+#include "hw/ppc/ppc.h"
+#include "hw/qdev-properties.h"
+#include "migration/vmstate.h"
+#include "qapi/error.h"
+
+enum {
+    DCR_UICSR  = 0x000,
+    DCR_UICSRS = 0x001,
+    DCR_UICER  = 0x002,
+    DCR_UICCR  = 0x003,
+    DCR_UICPR  = 0x004,
+    DCR_UICTR  = 0x005,
+    DCR_UICMSR = 0x006,
+    DCR_UICVR  = 0x007,
+    DCR_UICVCR = 0x008,
+    DCR_UICMAX = 0x009,
+};
+
+/*#define DEBUG_UIC*/
+
+#ifdef DEBUG_UIC
+#  define LOG_UIC(...) qemu_log_mask(CPU_LOG_INT, ## __VA_ARGS__)
+#else
+#  define LOG_UIC(...) do { } while (0)
+#endif
+
+static void ppcuic_trigger_irq(PPCUIC *uic)
+{
+    uint32_t ir, cr;
+    int start, end, inc, i;
+
+    /* Trigger interrupt if any is pending */
+    ir = uic->uicsr & uic->uicer & (~uic->uiccr);
+    cr = uic->uicsr & uic->uicer & uic->uiccr;
+    LOG_UIC("%s: uicsr %08" PRIx32 " uicer %08" PRIx32
+                " uiccr %08" PRIx32 "\n"
+                "   %08" PRIx32 " ir %08" PRIx32 " cr %08" PRIx32 "\n",
+                __func__, uic->uicsr, uic->uicer, uic->uiccr,
+                uic->uicsr & uic->uicer, ir, cr);
+    if (ir != 0x0000000) {
+        LOG_UIC("Raise UIC interrupt\n");
+        qemu_irq_raise(uic->output_int);
+    } else {
+        LOG_UIC("Lower UIC interrupt\n");
+        qemu_irq_lower(uic->output_int);
+    }
+    /* Trigger critical interrupt if any is pending and update vector */
+    if (cr != 0x0000000) {
+        qemu_irq_raise(uic->output_cint);
+        if (uic->use_vectors) {
+            /* Compute critical IRQ vector */
+            if (uic->uicvcr & 1) {
+                start = 31;
+                end = 0;
+                inc = -1;
+            } else {
+                start = 0;
+                end = 31;
+                inc = 1;
+            }
+            uic->uicvr = uic->uicvcr & 0xFFFFFFFC;
+            for (i = start; i <= end; i += inc) {
+                if (cr & (1 << i)) {
+                    uic->uicvr += (i - start) * 512 * inc;
+                    break;
+                }
+            }
+        }
+        LOG_UIC("Raise UIC critical interrupt - "
+                    "vector %08" PRIx32 "\n", uic->uicvr);
+    } else {
+        LOG_UIC("Lower UIC critical interrupt\n");
+        qemu_irq_lower(uic->output_cint);
+        uic->uicvr = 0x00000000;
+    }
+}
+
+static void ppcuic_set_irq(void *opaque, int irq_num, int level)
+{
+    PPCUIC *uic;
+    uint32_t mask, sr;
+
+    uic = opaque;
+    mask = 1U << (31 - irq_num);
+    LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
+                " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
+                __func__, irq_num, level,
+                uic->uicsr, mask, uic->uicsr & mask, level << irq_num);
+    if (irq_num < 0 || irq_num > 31) {
+        return;
+    }
+    sr = uic->uicsr;
+
+    /* Update status register */
+    if (uic->uictr & mask) {
+        /* Edge sensitive interrupt */
+        if (level == 1) {
+            uic->uicsr |= mask;
+        }
+    } else {
+        /* Level sensitive interrupt */
+        if (level == 1) {
+            uic->uicsr |= mask;
+            uic->level |= mask;
+        } else {
+            uic->uicsr &= ~mask;
+            uic->level &= ~mask;
+        }
+    }
+    LOG_UIC("%s: irq %d level %d sr %" PRIx32 " => "
+                "%08" PRIx32 "\n", __func__, irq_num, level, uic->uicsr, sr);
+    if (sr != uic->uicsr) {
+        ppcuic_trigger_irq(uic);
+    }
+}
+
+static uint32_t dcr_read_uic(void *opaque, int dcrn)
+{
+    PPCUIC *uic;
+    uint32_t ret;
+
+    uic = opaque;
+    dcrn -= uic->dcr_base;
+    switch (dcrn) {
+    case DCR_UICSR:
+    case DCR_UICSRS:
+        ret = uic->uicsr;
+        break;
+    case DCR_UICER:
+        ret = uic->uicer;
+        break;
+    case DCR_UICCR:
+        ret = uic->uiccr;
+        break;
+    case DCR_UICPR:
+        ret = uic->uicpr;
+        break;
+    case DCR_UICTR:
+        ret = uic->uictr;
+        break;
+    case DCR_UICMSR:
+        ret = uic->uicsr & uic->uicer;
+        break;
+    case DCR_UICVR:
+        if (!uic->use_vectors) {
+            goto no_read;
+        }
+        ret = uic->uicvr;
+        break;
+    case DCR_UICVCR:
+        if (!uic->use_vectors) {
+            goto no_read;
+        }
+        ret = uic->uicvcr;
+        break;
+    default:
+    no_read:
+        ret = 0x00000000;
+        break;
+    }
+
+    return ret;
+}
+
+static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
+{
+    PPCUIC *uic;
+
+    uic = opaque;
+    dcrn -= uic->dcr_base;
+    LOG_UIC("%s: dcr %d val 0x%x\n", __func__, dcrn, val);
+    switch (dcrn) {
+    case DCR_UICSR:
+        uic->uicsr &= ~val;
+        uic->uicsr |= uic->level;
+        ppcuic_trigger_irq(uic);
+        break;
+    case DCR_UICSRS:
+        uic->uicsr |= val;
+        ppcuic_trigger_irq(uic);
+        break;
+    case DCR_UICER:
+        uic->uicer = val;
+        ppcuic_trigger_irq(uic);
+        break;
+    case DCR_UICCR:
+        uic->uiccr = val;
+        ppcuic_trigger_irq(uic);
+        break;
+    case DCR_UICPR:
+        uic->uicpr = val;
+        break;
+    case DCR_UICTR:
+        uic->uictr = val;
+        ppcuic_trigger_irq(uic);
+        break;
+    case DCR_UICMSR:
+        break;
+    case DCR_UICVR:
+        break;
+    case DCR_UICVCR:
+        uic->uicvcr = val & 0xFFFFFFFD;
+        ppcuic_trigger_irq(uic);
+        break;
+    }
+}
+
+static void ppc_uic_reset(DeviceState *dev)
+{
+    PPCUIC *uic = PPC_UIC(dev);
+
+    uic->uiccr = 0x00000000;
+    uic->uicer = 0x00000000;
+    uic->uicpr = 0x00000000;
+    uic->uicsr = 0x00000000;
+    uic->uictr = 0x00000000;
+    if (uic->use_vectors) {
+        uic->uicvcr = 0x00000000;
+        uic->uicvr = 0x0000000;
+    }
+}
+
+static void ppc_uic_realize(DeviceState *dev, Error **errp)
+{
+    PPCUIC *uic = PPC_UIC(dev);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
+    PowerPCCPU *cpu;
+    int i;
+
+    if (!uic->cpu) {
+        /* This is a programming error in the code using this device */
+        error_setg(errp, "ppc-uic 'cpu' link property was not set");
+        return;
+    }
+
+    cpu = POWERPC_CPU(uic->cpu);
+    for (i = 0; i < DCR_UICMAX; i++) {
+        ppc_dcr_register(&cpu->env, uic->dcr_base + i, uic,
+                         &dcr_read_uic, &dcr_write_uic);
+    }
+
+    sysbus_init_irq(sbd, &uic->output_int);
+    sysbus_init_irq(sbd, &uic->output_cint);
+    qdev_init_gpio_in(dev, ppcuic_set_irq, UIC_MAX_IRQ);
+}
+
+static Property ppc_uic_properties[] = {
+    DEFINE_PROP_LINK("cpu", PPCUIC, cpu, TYPE_CPU, CPUState *),
+    DEFINE_PROP_UINT32("dcr-base", PPCUIC, dcr_base, 0x30),
+    DEFINE_PROP_BOOL("use-vectors", PPCUIC, use_vectors, true),
+    DEFINE_PROP_END_OF_LIST()
+};
+
+static const VMStateDescription ppc_uic_vmstate = {
+    .name = "ppc-uic",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(level, PPCUIC),
+        VMSTATE_UINT32(uicsr, PPCUIC),
+        VMSTATE_UINT32(uicer, PPCUIC),
+        VMSTATE_UINT32(uiccr, PPCUIC),
+        VMSTATE_UINT32(uicpr, PPCUIC),
+        VMSTATE_UINT32(uictr, PPCUIC),
+        VMSTATE_UINT32(uicvcr, PPCUIC),
+        VMSTATE_UINT32(uicvr, PPCUIC),
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static void ppc_uic_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->reset = ppc_uic_reset;
+    dc->realize = ppc_uic_realize;
+    dc->vmsd = &ppc_uic_vmstate;
+    device_class_set_props(dc, ppc_uic_properties);
+}
+
+static const TypeInfo ppc_uic_info = {
+    .name = TYPE_PPC_UIC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(PPCUIC),
+    .class_init = ppc_uic_class_init,
+};
+
+static void ppc_uic_register_types(void)
+{
+    type_register_static(&ppc_uic_info);
+}
+
+type_init(ppc_uic_register_types);
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index dd86e664d2..982d55f587 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -53,6 +53,7 @@ config PPC4XX
     bool
     select BITBANG_I2C
     select PCI
+    select PPC_UIC
 
 config SAM460EX
     bool
diff --git a/hw/ppc/ppc4xx_devs.c b/hw/ppc/ppc4xx_devs.c
index f2f9ca4ffe..ffe4cf43e8 100644
--- a/hw/ppc/ppc4xx_devs.c
+++ b/hw/ppc/ppc4xx_devs.c
@@ -30,9 +30,12 @@
 #include "hw/ppc/ppc.h"
 #include "hw/ppc/ppc4xx.h"
 #include "hw/boards.h"
+#include "hw/intc/ppc-uic.h"
+#include "hw/qdev-properties.h"
 #include "qemu/log.h"
 #include "exec/address-spaces.h"
 #include "qemu/error-report.h"
+#include "qapi/error.h"
 
 /*#define DEBUG_UIC*/
 
@@ -76,250 +79,40 @@ PowerPCCPU *ppc4xx_init(const char *cpu_type,
 
 /*****************************************************************************/
 /* "Universal" Interrupt controller */
-enum {
-    DCR_UICSR  = 0x000,
-    DCR_UICSRS = 0x001,
-    DCR_UICER  = 0x002,
-    DCR_UICCR  = 0x003,
-    DCR_UICPR  = 0x004,
-    DCR_UICTR  = 0x005,
-    DCR_UICMSR = 0x006,
-    DCR_UICVR  = 0x007,
-    DCR_UICVCR = 0x008,
-    DCR_UICMAX = 0x009,
-};
-
-#define UIC_MAX_IRQ 32
-typedef struct ppcuic_t ppcuic_t;
-struct ppcuic_t {
-    uint32_t dcr_base;
-    int use_vectors;
-    uint32_t level;  /* Remembers the state of level-triggered interrupts. */
-    uint32_t uicsr;  /* Status register */
-    uint32_t uicer;  /* Enable register */
-    uint32_t uiccr;  /* Critical register */
-    uint32_t uicpr;  /* Polarity register */
-    uint32_t uictr;  /* Triggering register */
-    uint32_t uicvcr; /* Vector configuration register */
-    uint32_t uicvr;
-    qemu_irq *irqs;
-};
-
-static void ppcuic_trigger_irq(ppcuic_t *uic)
-{
-    uint32_t ir, cr;
-    int start, end, inc, i;
-
-    /* Trigger interrupt if any is pending */
-    ir = uic->uicsr & uic->uicer & (~uic->uiccr);
-    cr = uic->uicsr & uic->uicer & uic->uiccr;
-    LOG_UIC("%s: uicsr %08" PRIx32 " uicer %08" PRIx32
-                " uiccr %08" PRIx32 "\n"
-                "   %08" PRIx32 " ir %08" PRIx32 " cr %08" PRIx32 "\n",
-                __func__, uic->uicsr, uic->uicer, uic->uiccr,
-                uic->uicsr & uic->uicer, ir, cr);
-    if (ir != 0x0000000) {
-        LOG_UIC("Raise UIC interrupt\n");
-        qemu_irq_raise(uic->irqs[PPCUIC_OUTPUT_INT]);
-    } else {
-        LOG_UIC("Lower UIC interrupt\n");
-        qemu_irq_lower(uic->irqs[PPCUIC_OUTPUT_INT]);
-    }
-    /* Trigger critical interrupt if any is pending and update vector */
-    if (cr != 0x0000000) {
-        qemu_irq_raise(uic->irqs[PPCUIC_OUTPUT_CINT]);
-        if (uic->use_vectors) {
-            /* Compute critical IRQ vector */
-            if (uic->uicvcr & 1) {
-                start = 31;
-                end = 0;
-                inc = -1;
-            } else {
-                start = 0;
-                end = 31;
-                inc = 1;
-            }
-            uic->uicvr = uic->uicvcr & 0xFFFFFFFC;
-            for (i = start; i <= end; i += inc) {
-                if (cr & (1 << i)) {
-                    uic->uicvr += (i - start) * 512 * inc;
-                    break;
-                }
-            }
-        }
-        LOG_UIC("Raise UIC critical interrupt - "
-                    "vector %08" PRIx32 "\n", uic->uicvr);
-    } else {
-        LOG_UIC("Lower UIC critical interrupt\n");
-        qemu_irq_lower(uic->irqs[PPCUIC_OUTPUT_CINT]);
-        uic->uicvr = 0x00000000;
-    }
-}
-
-static void ppcuic_set_irq(void *opaque, int irq_num, int level)
-{
-    ppcuic_t *uic;
-    uint32_t mask, sr;
-
-    uic = opaque;
-    mask = 1U << (31 - irq_num);
-    LOG_UIC("%s: irq %d level %d uicsr %08" PRIx32
-                " mask %08" PRIx32 " => %08" PRIx32 " %08" PRIx32 "\n",
-                __func__, irq_num, level,
-                uic->uicsr, mask, uic->uicsr & mask, level << irq_num);
-    if (irq_num < 0 || irq_num > 31) {
-        return;
-    }
-    sr = uic->uicsr;
-
-    /* Update status register */
-    if (uic->uictr & mask) {
-        /* Edge sensitive interrupt */
-        if (level == 1) {
-            uic->uicsr |= mask;
-        }
-    } else {
-        /* Level sensitive interrupt */
-        if (level == 1) {
-            uic->uicsr |= mask;
-            uic->level |= mask;
-        } else {
-            uic->uicsr &= ~mask;
-            uic->level &= ~mask;
-        }
-    }
-    LOG_UIC("%s: irq %d level %d sr %" PRIx32 " => "
-                "%08" PRIx32 "\n", __func__, irq_num, level, uic->uicsr, sr);
-    if (sr != uic->uicsr) {
-        ppcuic_trigger_irq(uic);
-    }
-}
-
-static uint32_t dcr_read_uic(void *opaque, int dcrn)
-{
-    ppcuic_t *uic;
-    uint32_t ret;
-
-    uic = opaque;
-    dcrn -= uic->dcr_base;
-    switch (dcrn) {
-    case DCR_UICSR:
-    case DCR_UICSRS:
-        ret = uic->uicsr;
-        break;
-    case DCR_UICER:
-        ret = uic->uicer;
-        break;
-    case DCR_UICCR:
-        ret = uic->uiccr;
-        break;
-    case DCR_UICPR:
-        ret = uic->uicpr;
-        break;
-    case DCR_UICTR:
-        ret = uic->uictr;
-        break;
-    case DCR_UICMSR:
-        ret = uic->uicsr & uic->uicer;
-        break;
-    case DCR_UICVR:
-        if (!uic->use_vectors) {
-            goto no_read;
-        }
-        ret = uic->uicvr;
-        break;
-    case DCR_UICVCR:
-        if (!uic->use_vectors) {
-            goto no_read;
-        }
-        ret = uic->uicvcr;
-        break;
-    default:
-    no_read:
-        ret = 0x00000000;
-        break;
-    }
-
-    return ret;
-}
-
-static void dcr_write_uic(void *opaque, int dcrn, uint32_t val)
-{
-    ppcuic_t *uic;
-
-    uic = opaque;
-    dcrn -= uic->dcr_base;
-    LOG_UIC("%s: dcr %d val 0x%x\n", __func__, dcrn, val);
-    switch (dcrn) {
-    case DCR_UICSR:
-        uic->uicsr &= ~val;
-        uic->uicsr |= uic->level;
-        ppcuic_trigger_irq(uic);
-        break;
-    case DCR_UICSRS:
-        uic->uicsr |= val;
-        ppcuic_trigger_irq(uic);
-        break;
-    case DCR_UICER:
-        uic->uicer = val;
-        ppcuic_trigger_irq(uic);
-        break;
-    case DCR_UICCR:
-        uic->uiccr = val;
-        ppcuic_trigger_irq(uic);
-        break;
-    case DCR_UICPR:
-        uic->uicpr = val;
-        break;
-    case DCR_UICTR:
-        uic->uictr = val;
-        ppcuic_trigger_irq(uic);
-        break;
-    case DCR_UICMSR:
-        break;
-    case DCR_UICVR:
-        break;
-    case DCR_UICVCR:
-        uic->uicvcr = val & 0xFFFFFFFD;
-        ppcuic_trigger_irq(uic);
-        break;
-    }
-}
-
-static void ppcuic_reset (void *opaque)
-{
-    ppcuic_t *uic;
-
-    uic = opaque;
-    uic->uiccr = 0x00000000;
-    uic->uicer = 0x00000000;
-    uic->uicpr = 0x00000000;
-    uic->uicsr = 0x00000000;
-    uic->uictr = 0x00000000;
-    if (uic->use_vectors) {
-        uic->uicvcr = 0x00000000;
-        uic->uicvr = 0x0000000;
-    }
-}
 
 qemu_irq *ppcuic_init (CPUPPCState *env, qemu_irq *irqs,
                        uint32_t dcr_base, int has_ssr, int has_vr)
 {
-    ppcuic_t *uic;
+    DeviceState *uicdev = qdev_new(TYPE_PPC_UIC);
+    SysBusDevice *uicsbd = SYS_BUS_DEVICE(uicdev);
+    qemu_irq *uic_irqs;
     int i;
 
-    uic = g_malloc0(sizeof(ppcuic_t));
-    uic->dcr_base = dcr_base;
-    uic->irqs = irqs;
-    if (has_vr)
-        uic->use_vectors = 1;
-    for (i = 0; i < DCR_UICMAX; i++) {
-        ppc_dcr_register(env, dcr_base + i, uic,
-                         &dcr_read_uic, &dcr_write_uic);
+    qdev_prop_set_uint32(uicdev, "dcr-base", dcr_base);
+    qdev_prop_set_bit(uicdev, "use-vectors", has_vr);
+    object_property_set_link(OBJECT(uicdev), "cpu", OBJECT(env_cpu(env)),
+                             &error_fatal);
+    sysbus_realize_and_unref(uicsbd, &error_fatal);
+
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_INT, irqs[PPCUIC_OUTPUT_INT]);
+    sysbus_connect_irq(uicsbd, PPCUIC_OUTPUT_CINT, irqs[PPCUIC_OUTPUT_CINT]);
+
+    /*
+     * Return an allocated array of the UIC's input IRQ lines.
+     * This is an ugly temporary API to retain compatibility with
+     * the ppcuic_init() interface from the pre-QOM-conversion UIC.
+     * None of the callers free this array, so it is leaked -- but
+     * so was the array allocated by qemu_allocate_irqs() in the
+     * old code.
+     *
+     * The callers should just instantiate the UIC and wire it up
+     * themselves rather than passing qemu_irq* in and out of this function.
+     */
+    uic_irqs = g_new0(qemu_irq, UIC_MAX_IRQ);
+    for (i = 0; i < UIC_MAX_IRQ; i++) {
+        uic_irqs[i] = qdev_get_gpio_in(uicdev, i);
     }
-    qemu_register_reset(ppcuic_reset, uic);
-
-    return qemu_allocate_irqs(&ppcuic_set_irq, uic, UIC_MAX_IRQ);
+    return uic_irqs;
 }
 
 /*****************************************************************************/
diff --git a/include/hw/intc/ppc-uic.h b/include/hw/intc/ppc-uic.h
new file mode 100644
index 0000000000..e614e2ffd8
--- /dev/null
+++ b/include/hw/intc/ppc-uic.h
@@ -0,0 +1,73 @@
+/*
+ * "Universal" Interrupt Controller for PowerPPC 4xx embedded processors
+ *
+ * Copyright (c) 2007 Jocelyn Mayer
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
+#ifndef HW_INTC_PPC_UIC_H
+#define HW_INTC_PPC_UIC_H
+
+#include "hw/sysbus.h"
+#include "qom/object.h"
+
+#define TYPE_PPC_UIC "ppc-uic"
+OBJECT_DECLARE_SIMPLE_TYPE(PPCUIC, PPC_UIC)
+
+/*
+ * QEMU interface:
+ * QOM property "cpu": link to the PPC CPU
+ *    (no default, must be set)
+ * QOM property "dcr-base": base of the bank of DCR registers for the UIC
+ *    (default 0x30)
+ * QOM property "use-vectors": true if the UIC has vector registers
+ *    (default true)
+ * unnamed GPIO inputs 0..UIC_MAX_IRQ: input IRQ lines
+ * sysbus IRQs:
+ *  0 (PPCUIC_OUTPUT_INT): output INT line to the CPU
+ *  1 (PPCUIC_OUTPUT_CINT): output CINT line to the CPU
+ */
+
+#define UIC_MAX_IRQ 32
+
+struct PPCUIC {
+    /*< private >*/
+    SysBusDevice parent_obj;
+
+    /*< public >*/
+    qemu_irq output_int;
+    qemu_irq output_cint;
+
+    /* properties */
+    CPUState *cpu;
+    uint32_t dcr_base;
+    bool use_vectors;
+
+    uint32_t level;  /* Remembers the state of level-triggered interrupts. */
+    uint32_t uicsr;  /* Status register */
+    uint32_t uicer;  /* Enable register */
+    uint32_t uiccr;  /* Critical register */
+    uint32_t uicpr;  /* Polarity register */
+    uint32_t uictr;  /* Triggering register */
+    uint32_t uicvcr; /* Vector configuration register */
+    uint32_t uicvr;
+};
+
+#endif
-- 
2.29.2


