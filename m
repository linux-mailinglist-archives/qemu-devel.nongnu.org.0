Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E598F3304C0
	for <lists+qemu-devel@lfdr.de>; Sun,  7 Mar 2021 22:00:05 +0100 (CET)
Received: from localhost ([::1]:52258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJ0VQ-0003VA-Vi
	for lists+qemu-devel@lfdr.de; Sun, 07 Mar 2021 16:00:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJ0S6-000882-Kx
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:56:38 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:50407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lJ0S3-0006hr-LP
 for qemu-devel@nongnu.org; Sun, 07 Mar 2021 15:56:38 -0500
Received: from localhost.localdomain ([82.252.159.174]) by
 mrelayeu.kundenserver.de (mreue109 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Ml6i2-1m2C1I34qS-00lXqM; Sun, 07 Mar 2021 21:56:28 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 3/5] m68k: add an interrupt controller
Date: Sun,  7 Mar 2021 21:56:21 +0100
Message-Id: <20210307205623.507180-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210307205623.507180-1-laurent@vivier.eu>
References: <20210307205623.507180-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:pLW9G6MkGSMqi/cjF8eoVzpjcWSlyH4zfeP0Gi16zd3+/1dnQOf
 vgWme+WltEbc1TsKFRTNeg4IuA7iITc+WZ31EgxIx0WHq4xrEupSCVoe01Xl6d+LHk9zEnb
 z/ingAKhV49VW/EgzUe3mQIpOnZIHuBGTxRh3B/dnSCGXHkpCLhEW5SG0vcygtYP39CYXIY
 hnt+RJTL1kNt93a+qA8mw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:h7DLfoc/8zM=:KR8O2SXiHtQTyqHhereF05
 RJeVICRMnv9OZ9WKQAiPHtchhQV/hb4voYR74AsnvUzegBwfD5A3WjK24gJTCC5IfNNEOcCzL
 qrxywNourXBWocgw+3qYpZw1LeeJC2kzQ4oB2jf03xozuJeFHcLFB7zompLN+ib6lr1bryfjk
 BSK4/z5C+jKtp8L/l7Alp7A1GHtQ3wxrRlThKPSWQvKwd/6kd7XAMlf7oFwfFRDKz8o3JDNdO
 sYqu5PEaojMX20AEsMMXi5OWUdNpLhZn7L4tvoSA/bZVSkAnc3+RQZTU7UDQzDEcyUc1JHyQ6
 3Yykx44onno3tN63CiF9UH9IO9Tmazf/0NhMiFDJ246qGFet7XntJ0c0cvup722k6Ah9runMF
 C+EYAtYv38DW7BckCas/9jlx+VhdyEwk90qqb8GswQKQcyjsHjGys2P/tYeg8+CWWwjo9G7op
 dBwYI4PjBQ==
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

A (generic) copy of the GLUE device we already have for q800 to use with
the m68k-virt machine.
The q800 one would disappear in the future as q800 uses actually the djMEMC
controller.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
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


