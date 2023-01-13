Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39AD669EB0
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 17:48:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGMIk-00035t-NO; Fri, 13 Jan 2023 10:49:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIE-00032G-Cd
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:34 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pGMIA-0006aL-VA
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 10:48:34 -0500
Received: by mail-wr1-x433.google.com with SMTP id r2so21459348wrv.7
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 07:48:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFFSd+Kp9vMRpNGab1GjdoBbBkvNzRzwyTYYss87muw=;
 b=yKQoCtdEAJPkniO04PAuvZ6tODOPcwZ/SY7rK+3sE6kv8aba3mHXGYYy0wD3XKc1ka
 /8ClsugV0ThFziE/Vt6crDcGFCybHl0DP73ctFuiL6UgcZLzJKFqT++7HS3WZ4muqbz7
 YUHrdFKwZ1X7geA+V/9KUo5MN5k5QKO+JxrMYw1rG/TlisM2fpKgsQHzHxIU6BXVtbs0
 C/HO3W7qBssCYuqVXnD0wduddUhRGPe4G/ALzIA7yXQ0ezDZFLWLXT2mT5ugDzpH/7h7
 D6MkLj+RnPgu2Vt0VHSQCcWMLk4UOg+WYvUE0wAG5uuo03odt2pojKMT9VTrfvb4Y8di
 YPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFFSd+Kp9vMRpNGab1GjdoBbBkvNzRzwyTYYss87muw=;
 b=Nk/uxx1EH7QNZLHohdo12JEeRHydYMIC8EkOFCPlkSCtqAbPHlnFvsbOcaZi/0/O2R
 NwqzOLjcIT+gIBk3h0GIk568AX2luhIuwINoD5Fi+3Yhk/J4Mg39tvtB+5v5lIeJxCqb
 ZOLbhbNuvDy1lQoJlPeNZmzn39tKHyO9HZxRjNpAIQhvQ1TKm6hcVgksicAncmOFrZWs
 DuFlEghuvcmJzDupf6yZcmWnU/+iV9dlQsXnZJwq7pGhs6nKDile18oGe1eSl5QKhkW5
 /XS0ecyDBoXCtN0zOS05LSFci5J24HOpZANP0c2TlD7VIjNiDlwy4UM7pAp3wpGBQVa0
 aVYw==
X-Gm-Message-State: AFqh2komfnftvczHhPAbf2/tVU+3TvC7xMpdqITfu5EH9RoSmiL5DLEI
 aEBiSR/bmkgzSH0e1V1TNzYqa6if+10/Zf1O
X-Google-Smtp-Source: AMrXdXt3R4V/qoJcNQye+BgnDJdhz3BbnLlbHH10ruaIGsTGFhtfIq7kvYcWLir5Ghb1hfExMeE0fA==
X-Received: by 2002:a5d:5446:0:b0:2bd:d4bd:5824 with SMTP id
 w6-20020a5d5446000000b002bdd4bd5824mr4197268wrv.27.1673624908415; 
 Fri, 13 Jan 2023 07:48:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 s2-20020adff802000000b00241bd7a7165sm19242200wrp.82.2023.01.13.07.48.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 13 Jan 2023 07:48:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Bernhard Beschow <shentey@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 36/46] hw/intc: Extract the IRQ counting functions into a
 separate file
Date: Fri, 13 Jan 2023 16:45:22 +0100
Message-Id: <20230113154532.49979-37-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230113154532.49979-1-philmd@linaro.org>
References: <20230113154532.49979-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x433.google.com
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

From: Thomas Huth <thuth@redhat.com>

These IRQ counting functions will soon be required in binaries that
do not include the APIC code, too, so let's extract them into a
separate file that can be linked independently of the APIC code.

While we're at it, change the apic_* prefix into kvm_* since the
functions are used from the i8259 PIC (i.e. not the APIC), too.

Reviewed-by: Bernhard Beschow <shentey@gmail.com>
Signed-off-by: Thomas Huth <thuth@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Message-Id: <20230110095351.611724-2-thuth@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/i386/kvm/i8259.c             |  4 +--
 hw/i386/kvm/ioapic.c            |  4 +--
 hw/intc/apic.c                  |  3 +-
 hw/intc/apic_common.c           | 30 ++------------------
 hw/intc/kvm_irqcount.c          | 49 +++++++++++++++++++++++++++++++++
 hw/intc/meson.build             |  6 ++++
 hw/intc/trace-events            |  9 +++---
 hw/rtc/mc146818rtc.c            |  6 ++--
 include/hw/i386/apic.h          |  2 --
 include/hw/i386/apic_internal.h |  1 -
 include/hw/intc/kvm_irqcount.h  | 10 +++++++
 11 files changed, 81 insertions(+), 43 deletions(-)
 create mode 100644 hw/intc/kvm_irqcount.c
 create mode 100644 include/hw/intc/kvm_irqcount.h

diff --git a/hw/i386/kvm/i8259.c b/hw/i386/kvm/i8259.c
index d61bae4dc3..3ca0e1ff03 100644
--- a/hw/i386/kvm/i8259.c
+++ b/hw/i386/kvm/i8259.c
@@ -14,7 +14,7 @@
 #include "hw/isa/i8259_internal.h"
 #include "hw/intc/i8259.h"
 #include "qemu/module.h"
-#include "hw/i386/apic_internal.h"
+#include "hw/intc/kvm_irqcount.h"
 #include "hw/irq.h"
 #include "sysemu/kvm.h"
 #include "qom/object.h"
@@ -117,7 +117,7 @@ static void kvm_pic_set_irq(void *opaque, int irq, int level)
 
     pic_stat_update_irq(irq, level);
     delivered = kvm_set_irq(kvm_state, irq, level);
-    apic_report_irq_delivered(delivered);
+    kvm_report_irq_delivered(delivered);
 }
 
 static void kvm_pic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/i386/kvm/ioapic.c b/hw/i386/kvm/ioapic.c
index ee7c8ef68b..272e26b4a2 100644
--- a/hw/i386/kvm/ioapic.c
+++ b/hw/i386/kvm/ioapic.c
@@ -15,7 +15,7 @@
 #include "hw/i386/x86.h"
 #include "hw/qdev-properties.h"
 #include "hw/i386/ioapic_internal.h"
-#include "hw/i386/apic_internal.h"
+#include "hw/intc/kvm_irqcount.h"
 #include "sysemu/kvm.h"
 
 /* PC Utility function */
@@ -116,7 +116,7 @@ static void kvm_ioapic_set_irq(void *opaque, int irq, int level)
 
     ioapic_stat_update_irq(common, irq, level);
     delivered = kvm_set_irq(kvm_state, s->kvm_gsi_base + irq, level);
-    apic_report_irq_delivered(delivered);
+    kvm_report_irq_delivered(delivered);
 }
 
 static void kvm_ioapic_realize(DeviceState *dev, Error **errp)
diff --git a/hw/intc/apic.c b/hw/intc/apic.c
index 3df11c34d6..2d3e55f4e2 100644
--- a/hw/intc/apic.c
+++ b/hw/intc/apic.c
@@ -22,6 +22,7 @@
 #include "hw/i386/apic.h"
 #include "hw/i386/ioapic.h"
 #include "hw/intc/i8259.h"
+#include "hw/intc/kvm_irqcount.h"
 #include "hw/pci/msi.h"
 #include "qemu/host-utils.h"
 #include "sysemu/kvm.h"
@@ -399,7 +400,7 @@ void apic_poll_irq(DeviceState *dev)
 
 static void apic_set_irq(APICCommonState *s, int vector_num, int trigger_mode)
 {
-    apic_report_irq_delivered(!apic_get_bit(s->irr, vector_num));
+    kvm_report_irq_delivered(!apic_get_bit(s->irr, vector_num));
 
     apic_set_bit(s->irr, vector_num);
     if (trigger_mode)
diff --git a/hw/intc/apic_common.c b/hw/intc/apic_common.c
index 2a20982066..4a34f03047 100644
--- a/hw/intc/apic_common.c
+++ b/hw/intc/apic_common.c
@@ -25,6 +25,7 @@
 #include "qapi/visitor.h"
 #include "hw/i386/apic.h"
 #include "hw/i386/apic_internal.h"
+#include "hw/intc/kvm_irqcount.h"
 #include "trace.h"
 #include "hw/boards.h"
 #include "sysemu/hax.h"
@@ -33,7 +34,6 @@
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
 
-static int apic_irq_delivered;
 bool apic_report_tpr_access;
 
 void cpu_set_apic_base(DeviceState *dev, uint64_t val)
@@ -122,32 +122,6 @@ void apic_handle_tpr_access_report(DeviceState *dev, target_ulong ip,
     vapic_report_tpr_access(s->vapic, CPU(s->cpu), ip, access);
 }
 
-void apic_report_irq_delivered(int delivered)
-{
-    apic_irq_delivered += delivered;
-
-    trace_apic_report_irq_delivered(apic_irq_delivered);
-}
-
-void apic_reset_irq_delivered(void)
-{
-    /* Copy this into a local variable to encourage gcc to emit a plain
-     * register for a sys/sdt.h marker.  For details on this workaround, see:
-     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
-     */
-    volatile int a_i_d = apic_irq_delivered;
-    trace_apic_reset_irq_delivered(a_i_d);
-
-    apic_irq_delivered = 0;
-}
-
-int apic_get_irq_delivered(void)
-{
-    trace_apic_get_irq_delivered(apic_irq_delivered);
-
-    return apic_irq_delivered;
-}
-
 void apic_deliver_nmi(DeviceState *dev)
 {
     APICCommonState *s = APIC_COMMON(dev);
@@ -272,7 +246,7 @@ static void apic_reset_common(DeviceState *dev)
     s->apicbase = APIC_DEFAULT_ADDRESS | bsp | MSR_IA32_APICBASE_ENABLE;
     s->id = s->initial_apic_id;
 
-    apic_reset_irq_delivered();
+    kvm_reset_irq_delivered();
 
     s->vapic_paddr = 0;
     info->vapic_base_update(s);
diff --git a/hw/intc/kvm_irqcount.c b/hw/intc/kvm_irqcount.c
new file mode 100644
index 0000000000..2ef8a83a7a
--- /dev/null
+++ b/hw/intc/kvm_irqcount.c
@@ -0,0 +1,49 @@
+/*
+ * KVM PIC functions for counting the delivered IRQs.
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2.1 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>
+ */
+
+#include "qemu/osdep.h"
+#include "hw/intc/kvm_irqcount.h"
+#include "trace.h"
+
+static int kvm_irq_delivered;
+
+void kvm_report_irq_delivered(int delivered)
+{
+    kvm_irq_delivered += delivered;
+
+    trace_kvm_report_irq_delivered(kvm_irq_delivered);
+}
+
+void kvm_reset_irq_delivered(void)
+{
+    /*
+     * Copy this into a local variable to encourage gcc to emit a plain
+     * register for a sys/sdt.h marker.  For details on this workaround, see:
+     * https://sourceware.org/bugzilla/show_bug.cgi?id=13296
+     */
+    volatile int k_i_d = kvm_irq_delivered;
+    trace_kvm_reset_irq_delivered(k_i_d);
+
+    kvm_irq_delivered = 0;
+}
+
+int kvm_get_irq_delivered(void)
+{
+    trace_kvm_get_irq_delivered(kvm_irq_delivered);
+
+    return kvm_irq_delivered;
+}
diff --git a/hw/intc/meson.build b/hw/intc/meson.build
index bcbf22ff51..cd9f1ee888 100644
--- a/hw/intc/meson.build
+++ b/hw/intc/meson.build
@@ -25,6 +25,12 @@ softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_intc.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP', if_true: files('xlnx-zynqmp-ipi.c'))
 softmmu_ss.add(when: 'CONFIG_XLNX_ZYNQMP_PMU', if_true: files('xlnx-pmu-iomod-intc.c'))
 
+if config_all_devices.has_key('CONFIG_APIC') or \
+   config_all_devices.has_key('CONFIG_I8259') or \
+   config_all_devices.has_key('CONFIG_MC146818RTC')
+    softmmu_ss.add(files('kvm_irqcount.c'))
+endif
+
 specific_ss.add(when: 'CONFIG_ALLWINNER_A10_PIC', if_true: files('allwinner-a10-pic.c'))
 specific_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c', 'apic_common.c'))
 specific_ss.add(when: 'CONFIG_ARM_GIC', if_true: files('arm_gicv3_cpuif_common.c'))
diff --git a/hw/intc/trace-events b/hw/intc/trace-events
index 6fbc2045e6..50cadfb996 100644
--- a/hw/intc/trace-events
+++ b/hw/intc/trace-events
@@ -10,10 +10,6 @@ pic_ioport_read(bool master, uint64_t addr, int val) "master %d addr 0x%"PRIx64"
 # apic_common.c
 cpu_set_apic_base(uint64_t val) "0x%016"PRIx64
 cpu_get_apic_base(uint64_t val) "0x%016"PRIx64
-# coalescing
-apic_report_irq_delivered(int apic_irq_delivered) "coalescing %d"
-apic_reset_irq_delivered(int apic_irq_delivered) "old coalescing %d"
-apic_get_irq_delivered(int apic_irq_delivered) "returning coalescing %d"
 
 # apic.c
 apic_local_deliver(int vector, uint32_t lvt) "vector %d delivery mode %d"
@@ -30,6 +26,11 @@ ioapic_mem_read(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t val) "ioapi
 ioapic_mem_write(uint8_t addr, uint8_t regsel, uint8_t size, uint32_t val) "ioapic mem write addr 0x%"PRIx8" regsel: 0x%"PRIx8" size 0x%"PRIx8" val 0x%"PRIx32
 ioapic_set_irq(int vector, int level) "vector: %d level: %d"
 
+# kvm_irqcount.c
+kvm_report_irq_delivered(int irq_delivered) "coalescing %d"
+kvm_reset_irq_delivered(int irq_delivered) "old coalescing %d"
+kvm_get_irq_delivered(int irq_delivered) "returning coalescing %d"
+
 # slavio_intctl.c
 slavio_intctl_mem_readl(uint32_t cpu, uint64_t addr, uint32_t ret) "read cpu %d reg 0x%"PRIx64" = 0x%x"
 slavio_intctl_mem_writel(uint32_t cpu, uint64_t addr, uint32_t val) "write cpu %d reg 0x%"PRIx64" = 0x%x"
diff --git a/hw/rtc/mc146818rtc.c b/hw/rtc/mc146818rtc.c
index 1ebb412479..947d68c257 100644
--- a/hw/rtc/mc146818rtc.c
+++ b/hw/rtc/mc146818rtc.c
@@ -27,6 +27,7 @@
 #include "qemu/module.h"
 #include "qemu/bcd.h"
 #include "hw/acpi/acpi_aml_interface.h"
+#include "hw/intc/kvm_irqcount.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/qdev-properties-system.h"
@@ -46,7 +47,6 @@
 
 #ifdef TARGET_I386
 #include "qapi/qapi-commands-misc-target.h"
-#include "hw/i386/apic.h"
 #endif
 
 //#define DEBUG_CMOS
@@ -124,9 +124,9 @@ void qmp_rtc_reset_reinjection(Error **errp)
 
 static bool rtc_policy_slew_deliver_irq(RTCState *s)
 {
-    apic_reset_irq_delivered();
+    kvm_reset_irq_delivered();
     qemu_irq_raise(s->irq);
-    return apic_get_irq_delivered();
+    return kvm_get_irq_delivered();
 }
 
 static void rtc_coalesced_timer(void *opaque)
diff --git a/include/hw/i386/apic.h b/include/hw/i386/apic.h
index da1d2fe155..bdc15a7a73 100644
--- a/include/hw/i386/apic.h
+++ b/include/hw/i386/apic.h
@@ -9,8 +9,6 @@ int apic_accept_pic_intr(DeviceState *s);
 void apic_deliver_pic_intr(DeviceState *s, int level);
 void apic_deliver_nmi(DeviceState *d);
 int apic_get_interrupt(DeviceState *s);
-void apic_reset_irq_delivered(void);
-int apic_get_irq_delivered(void);
 void cpu_set_apic_base(DeviceState *s, uint64_t val);
 uint64_t cpu_get_apic_base(DeviceState *s);
 void cpu_set_apic_tpr(DeviceState *s, uint8_t val);
diff --git a/include/hw/i386/apic_internal.h b/include/hw/i386/apic_internal.h
index 968b6648b3..5f2ba24bfc 100644
--- a/include/hw/i386/apic_internal.h
+++ b/include/hw/i386/apic_internal.h
@@ -199,7 +199,6 @@ typedef struct VAPICState {
 
 extern bool apic_report_tpr_access;
 
-void apic_report_irq_delivered(int delivered);
 bool apic_next_timer(APICCommonState *s, int64_t current_time);
 void apic_enable_tpr_access_reporting(DeviceState *d, bool enable);
 void apic_enable_vapic(DeviceState *d, hwaddr paddr);
diff --git a/include/hw/intc/kvm_irqcount.h b/include/hw/intc/kvm_irqcount.h
new file mode 100644
index 0000000000..0ed5999e49
--- /dev/null
+++ b/include/hw/intc/kvm_irqcount.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: LGPL-2.1-or-later */
+
+#ifndef KVM_IRQCOUNT_H
+#define KVM_IRQCOUNT_H
+
+void kvm_report_irq_delivered(int delivered);
+void kvm_reset_irq_delivered(void);
+int kvm_get_irq_delivered(void);
+
+#endif
-- 
2.38.1


