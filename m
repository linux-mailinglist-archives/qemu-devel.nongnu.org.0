Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 30A4D2DF535
	for <lists+qemu-devel@lfdr.de>; Sun, 20 Dec 2020 12:28:57 +0100 (CET)
Received: from localhost ([::1]:44132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kqwtU-0006qS-6J
	for lists+qemu-devel@lfdr.de; Sun, 20 Dec 2020 06:28:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55108)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr5-00059s-JS
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:27 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:53841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1kqwr2-0005Rm-EF
 for qemu-devel@nongnu.org; Sun, 20 Dec 2020 06:26:27 -0500
Received: from localhost.localdomain ([82.252.144.198]) by
 mrelayeu.kundenserver.de (mreue107 [212.227.15.183]) with ESMTPSA (Nemesis)
 id 1Mk1BG-1kOSfN1TgG-00kNt3; Sun, 20 Dec 2020 12:26:21 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/7] m68k: add an interrupt controller
Date: Sun, 20 Dec 2020 12:26:12 +0100
Message-Id: <20201220112615.933036-5-laurent@vivier.eu>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201220112615.933036-1-laurent@vivier.eu>
References: <20201220112615.933036-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Q7zkfA2qGXbJa+X9GJZIyepJH3IpU+/zX7ZZ2oruBdLmFPMwm6P
 1vQbFyw5TwoHy3LNxmbwLqC4UmIC6qO6wbE7SQSpQ81xEV/VvNWYF4IoOQ4Q30N+i3JTm+a
 s63FAKK9B5UdFUqWnh6P2GLnpL/EyUd2t46aGCiQuQ7b9zp7y01E9/OYtW1c+Cr6B1XoPF6
 Nvbq6n24H/o+fThqGmBQQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:N6um2z0FUl8=:tG1sZ+4xSLeYnIhzPqU28T
 Xkadi7YRsnlj75ndGaiN4e6V0eUJzGqUc0Sx+cJyfsFzTNCOw3EZtt9lBcyLPkPIsFvUnB+vF
 f+wbiCNeHAGcUM+zC+50C29aJRQqJid6qwOgMWkZ3OBxKcyVSRlSjaBXgqcTEd0c+RVg2T1kW
 D+N41+ougqZAjjli9Z0P7+Q5NOAekFkADFj1aUzEsIqukoqUa+pbCGbbKRpK5fdXWR9BBUcCx
 VhFB8kgUWaUYP/sDDNYUxLE2RmpR2s5F9a7GaOO71PdrIvBR4EMSIkFVq30IhICrCzwVhUGOJ
 da5ULWRj6UFtortYQPggszXAq7vec2RrPuLzMbF9yrk5ZPg62mpSwwcJ/w5Nt0CAxOGlYy93A
 oxZ2zbe1FCCXBo46fRvHwg2Z/ybEeGiTOroogMJUFnjW270jh8atK479zbQsrilSil3tmh1us
 NsxeKySp2w==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 include/hw/intc/m68k_irqc.h |  28 +++++++++
 hw/intc/m68k_irqc.c         | 120 ++++++++++++++++++++++++++++++++++++
 hw/intc/Kconfig             |   3 +
 hw/intc/meson.build         |   1 +
 4 files changed, 152 insertions(+)
 create mode 100644 include/hw/intc/m68k_irqc.h
 create mode 100644 hw/intc/m68k_irqc.c

diff --git a/include/hw/intc/m68k_irqc.h b/include/hw/intc/m68k_irqc.h
new file mode 100644
index 000000000000..c40b1b4df8fa
--- /dev/null
+++ b/include/hw/intc/m68k_irqc.h
@@ -0,0 +1,28 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * QEMU Motorla 680x0 IRQ Controller
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
+typedef struct M68KIRQCState {
+    SysBusDevice parent_obj;
+
+    uint8_t ipr;
+
+    /* statistics */
+    uint64_t stats_irq_count[7];
+} M68KIRQCState;
+
+#endif
diff --git a/hw/intc/m68k_irqc.c b/hw/intc/m68k_irqc.c
new file mode 100644
index 000000000000..bc68d8fe084a
--- /dev/null
+++ b/hw/intc/m68k_irqc.c
@@ -0,0 +1,120 @@
+/*
+ * SPDX-License-Identifer: GPL-2.0-or-later
+ *
+ * QEMU Motorla 680x0 IRQ Controller
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
+
+    if (level) {
+        s->ipr |= 1 << irq;
+        s->stats_irq_count[irq]++;
+    } else {
+        s->ipr &= ~(1 << irq);
+    }
+
+    for (i = 7; i >= 0; i--) {
+        if ((s->ipr >> i) & 1) {
+            m68k_set_irq_level(cpu, i + 1, i + 25);
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
+    qdev_init_gpio_in(DEVICE(obj), m68k_set_irq, 8);
+}
+
+static void m68k_nmi(NMIState *n, int cpu_index, Error **errp)
+{
+    m68k_set_irq(n, 6, 1);
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
index 7ed79e7ac29f..318d76c7cb52 100644
--- a/hw/intc/Kconfig
+++ b/hw/intc/Kconfig
@@ -76,3 +76,6 @@ config SIFIVE_PLIC
 
 config GOLDFISH_PIC
     bool
+
+config M68K_IRQC
+    bool
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index 8a5dfe4289ae..81bd0191f9cd 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -55,3 +55,4 @@ specific_ss.add(when: 'CONFIG_XIVE', if_true: files('xive.c'))
 specific_ss.add(when: 'CONFIG_XIVE_KVM', if_true: files('spapr_xive_kvm.c'))
 specific_ss.add(when: 'CONFIG_XIVE_SPAPR', if_true: files('spapr_xive.c'))
 specific_ss.add(when: 'CONFIG_GOLDFISH_PIC', if_true: files('goldfish_pic.c'))
+specific_ss.add(when: 'CONFIG_M68K_IRQC', if_true: files('m68k_irqc.c'))
-- 
2.29.2


