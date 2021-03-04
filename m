Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A36232DCAB
	for <lists+qemu-devel@lfdr.de>; Thu,  4 Mar 2021 23:04:08 +0100 (CET)
Received: from localhost ([::1]:36854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHw4l-0005qo-3U
	for lists+qemu-devel@lfdr.de; Thu, 04 Mar 2021 17:04:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHw29-00048r-Po
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:01:25 -0500
Received: from mout.kundenserver.de ([212.227.126.134]:38367)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lHw27-00013j-Mv
 for qemu-devel@nongnu.org; Thu, 04 Mar 2021 17:01:25 -0500
Received: from localhost.localdomain ([82.252.139.98]) by
 mrelayeu.kundenserver.de (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1N7gfa-1lnN2t3SN8-014lCR; Thu, 04 Mar 2021 23:01:10 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/5] m68k: add an interrupt controller
Date: Thu,  4 Mar 2021 23:01:02 +0100
Message-Id: <20210304220104.2574112-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210304220104.2574112-1-laurent@vivier.eu>
References: <20210304220104.2574112-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:f218YCMIS1+9LlZmz7SlXILorz96DwOW8YvmTlBb8zJGYuHQrU8
 Pfjh0X4ZHlZbsmquJQ7oHzI9RVPNOy2w0UIqQWoayvZqPHEeLZfuShFUskGxSsY/paUiVxQ
 7vAOaUg8PtGmP6Zwz9havyi8yfj0LPNMYpS3+OASV9gfh31gqjbZFr6mOVVE0BAyaDjrEcO
 Q8UJdvmZ5eR8Gf0ITBJOg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:FuhD+eyaEdE=:mts5fNvdmokrzkffo57mGD
 NQ25OzfEBLKub5GR4vi3v1GzWgnJceHoPWpco6vmLXegylljzZM3IC/WNAPUKvhebsxyfKRRF
 VMjn5R2zi3soBCH+aZr8/Zb/1wIPshAPcixzPvDTPPFijv5XdwPnqTFOrmoSI6MVbLCHHhekN
 NMmSGJX0jcT9rE0X65UQmL3SGq7aToaiCXF6IZAf9wJF9d6Cw4yCCpbG1qQjvdj268/6yTNnM
 vBcyQBK1PmBOBASnFKxkfqR9fZXGJopPBchTOmsDX7oVQJjhFe8tv4GUqSnX9ECrPx9WXSedm
 qnwocQD3LrB1KzUlmesMLylBdwPU52HhgPFmn+phqYf93kh6W8LCUvkFVrkHOnTH6Uzwjll+D
 e8bP+9VLEX9askYgWsqEhLZeMu17WhM5Pe/TOCqqYVbZ19ELj/yb+5FYsWvLR
Received-SPF: none client-ip=212.227.126.134; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A (generic) copy of the GLUE device we already have for q800 to use with
the m68k-virt machine.
The q800 one would disappear in the future as q800 uses actually the djMEMC
controller.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/intc/m68k_irqc.h |  41 +++++++++++++
 hw/intc/m68k_irqc.c         | 119 ++++++++++++++++++++++++++++++++++++
 hw/intc/Kconfig             |   3 +
 hw/intc/meson.build         |   1 +
 4 files changed, 164 insertions(+)
 create mode 100644 include/hw/intc/m68k_irqc.h
 create mode 100644 hw/intc/m68k_irqc.c

diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
new file mode 100644
index 000000000000..dbcfcfc2e000
--- /dev/null
+++ b/include/hw/intc/m68k_irqc.h
@@ -0,0 +1,41 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * QEMU Motorola 680x0 IRQ Controller
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#ifndef M68K_IRQC_H
+#define M68K_IRQC_H
+
+#include "hw/sysbus.h"
+
+#define TYPE_M68K_IRQC "m68k-irq-controller"
+#define M68K_IRQC(obj) OBJECT_CHECK(M68KIRQCState, (obj), \
+                                    TYPE_M68K_IRQC)
+
+#define M68K_IRQC_AUTOVECTOR_BASE 25
+
+enum {
+    M68K_IRQC_LEVEL_1 = 0,
+    M68K_IRQC_LEVEL_2,
+    M68K_IRQC_LEVEL_3,
+    M68K_IRQC_LEVEL_4,
+    M68K_IRQC_LEVEL_5,
+    M68K_IRQC_LEVEL_6,
+    M68K_IRQC_LEVEL_7,
+};
+#define M68K_IRQC_LEVEL_NUM (M68K_IRQC_LEVEL_7 - M68K_IRQC_LEVEL_1 + 1)
+
+typedef struct M68KIRQCState {
+    SysBusDevice parent_obj;
+
+    uint8_t ipr;
+
+    /* statistics */
+    uint64_t stats_irq_count[M68K_IRQC_LEVEL_NUM];
+} M68KIRQCState;
+
+#endif
diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
new file mode 100644
index 000000000000..2133d2a698ab
--- /dev/null
+++ b/hw/intc/m68k_irqc.c
@@ -0,0 +1,119 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * QEMU Motorola 680x0 IRQ Controller
+ *
+ * (c) 2020 Laurent Vivier <laurent@vivier.eu>
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "migration/vmstate.h"
+#include "monitor/monitor.h"
+#include "hw/nmi.h"
+#include "hw/intc/intc.h"
+#include "hw/intc/m68k_irqc.h"
+
+
+static bool m68k_irqc_get_statistics(InterruptStatsProvider *obj,
+                                     uint64_t **irq_counts, unsigned int *nb_irqs)
+{
+    M68KIRQCState *s = M68K_IRQC(obj);
+
+    *irq_counts = s->stats_irq_count;
+    *nb_irqs = ARRAY_SIZE(s->stats_irq_count);
+    return true;
+}
+
+static void m68k_irqc_print_info(InterruptStatsProvider *obj, Monitor *mon)
+{
+    M68KIRQCState *s = M68K_IRQC(obj);
+    monitor_printf(mon, "m68k-irqc: ipr=0x%x\n", s->ipr);
+}
+
+static void m68k_set_irq(void *opaque, int irq, int level)
+{
+    M68KIRQCState *s = opaque;
+    M68kCPU *cpu = M68K_CPU(first_cpu);
+    int i;
+
+    if (level) {
+        s->ipr |= 1 << irq;
+        s->stats_irq_count[irq]++;
+    } else {
+        s->ipr &= ~(1 << irq);
+    }
+
+    for (i = M68K_IRQC_LEVEL_7; i >= M68K_IRQC_LEVEL_1; i--) {
+        if ((s->ipr >> i) & 1) {
+            m68k_set_irq_level(cpu, i + 1, i + M68K_IRQC_AUTOVECTOR_BASE);
+            return;
+        }
+    }
+    m68k_set_irq_level(cpu, 0, 0);
+}
+
+static void m68k_irqc_reset(DeviceState *d)
+{
+    M68KIRQCState *s = M68K_IRQC(d);
+    int i;
+
+    s->ipr = 0;
+    for (i = 0; i < ARRAY_SIZE(s->stats_irq_count); i++) {
+        s->stats_irq_count[i] = 0;
+    }
+}
+
+static void m68k_irqc_instance_init(Object *obj)
+{
+    qdev_init_gpio_in(DEVICE(obj), m68k_set_irq, M68K_IRQC_LEVEL_NUM);
+}
+
+static void m68k_nmi(NMIState *n, int cpu_index, Error **errp)
+{
+    m68k_set_irq(n, M68K_IRQC_LEVEL_7, 1);
+}
+
+static const VMStateDescription vmstate_m68k_irqc = {
+    .name = "m68k-irqc",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT8(ipr, M68KIRQCState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void m68k_irqc_class_init(ObjectClass *oc, void *data)
+ {
+    DeviceClass *dc = DEVICE_CLASS(oc);
+    NMIClass *nc = NMI_CLASS(oc);
+    InterruptStatsProviderClass *ic = INTERRUPT_STATS_PROVIDER_CLASS(oc);
+
+    nc->nmi_monitor_handler = m68k_nmi;
+    dc->reset = m68k_irqc_reset;
+    dc->vmsd = &vmstate_m68k_irqc;
+    ic->get_statistics = m68k_irqc_get_statistics;
+    ic->print_info = m68k_irqc_print_info;
+}
+
+static const TypeInfo m68k_irqc_type_info = {
+    .name = TYPE_M68K_IRQC,
+    .parent = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(M68KIRQCState),
+    .instance_init = m68k_irqc_instance_init,
+    .class_init = m68k_irqc_class_init,
+    .interfaces = (InterfaceInfo[]) {
+         { TYPE_NMI },
+         { TYPE_INTERRUPT_STATS_PROVIDER },
+         { }
+    },
+};
+
+static void q800_irq_register_types(void)
+{
+    type_register_static(&m68k_irqc_type_info);
+}
+
+type_init(q800_irq_register_types);
diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
index c4f8642dae8e..fdb4a30b98e8 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -67,3 +67,6 @@ config SIFIVE_PLIC
 
 config GOLDFISH_PIC
     bool
+
+config M68K_IRQC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 5d0f5d1b3812..fb39e19d3ef8 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -58,3 +58,4 @@ specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: ['CONFIG_KVM', 'CONFIG_XIVE'],
 		if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
+specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
-- 
2.29.2


