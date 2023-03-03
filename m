Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6E0B6A8F2F
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:27:46 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXv84-0000ww-T6; Thu, 02 Mar 2023 21:26:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <32loBZAUKCrsitibohpphmf.dpnrfnv-efwfmopohov.psh@flex--hshan.bounces.google.com>)
 id 1pXv82-0000wb-Sn
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:38 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <32loBZAUKCrsitibohpphmf.dpnrfnv-efwfmopohov.psh@flex--hshan.bounces.google.com>)
 id 1pXv7z-0007WI-OW
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:38 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 h3-20020a25d003000000b00a1a201a745aso897505ybg.22
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:26:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677810394;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=s9NBDexf3GqTzRpDphqFGQOV2VvYjJHVFX7D/ESOHmk=;
 b=sM/EnEj6a8V5QaFtELnp8nE4CHt9Ayx6JNUc2mDKcjtz5lGe53Bu/R6xqNk2mOFl8V
 p2MvsbLG18v4+VtWhrB3kPDND3V+f/ysEVGUPbcSYYm0DquqGHYN0KiI8v+Pw5fyrcg2
 fGUnVjL47sKaNzX73zlzFh1S/UpV/mXh2jGCCPS4SKqnCgq9GxLCuAqbrz+kXgPiv8X3
 dHqEvQ4J/A1qR14DTzxEpuRfJcGZgUvYAsBfag55j7XORsvHo11EQLS00GCUdDldRLju
 /EuhxArHZhQY93Z5JRnK0lj9KQ4jnDPZms55KJ+Ktu4BKKH+GVSE0PFA75pGTtS52xXx
 bD2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677810394;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s9NBDexf3GqTzRpDphqFGQOV2VvYjJHVFX7D/ESOHmk=;
 b=CWN4GsAjYZ+okP0cJxiC96+mLWWkTkWPV84LDEx4v+nH1wrTXifNh4XO3DZuFbi+gi
 nZHacjNR1a89ptrD+t/P2+LrsvCiMawA/4L8364u46GU7AYMJDz3k1u657aWBzUg4CUV
 tkI3x8PXbzXZsXHEaSRkMe0JL/TWtQ4QFJfUJzwctbMyJVu+ZSmilC/W01f47q0r1X81
 ABpThGw1pZAo7gWGamqDefNzOV/E2oMzKV3mgR9H1yE2Z5Ti05wtmg9scRGfbcbeGykD
 AJ8C15uqfiqFJA77c1O2kbJJbkSJgI7HM2fNCVSsRdT87sf0hJKUtPs3vRxD53ArYGY3
 J7dg==
X-Gm-Message-State: AO0yUKWyP6XN36J/yjNpdKjNfcCRmxbMcbQCDfcwu1fbt2pK72fk/7lO
 B9NqooTNdEpGiWgOkIjySEP0biOYyqKyHfQDA8fNlB8jfjLj3KpgDccvn/lQCVMCNu1IZeWiNzS
 aHA4glQfBtyD4NBYzWUme+RUFQPna3CpFosZEZOGLvvMqE1foNmNqbn0FYg==
X-Google-Smtp-Source: AK7set9iPWN6a5fBn1VlIkzx+iR9pi0+exhIuRmBbWR6fr2C3+tFHXHwiaxItawTy/IxJyUqQYezV69jGw==
X-Received: from hshan17.roam.corp.google.com
 ([2620:15c:211:201:633f:2163:6a23:74ef])
 (user=hshan job=sendgmr) by 2002:a05:6902:524:b0:a4e:4575:f3f0 with SMTP id
 y4-20020a056902052400b00a4e4575f3f0mr57615ybs.11.1677810394379; Thu, 02 Mar
 2023 18:26:34 -0800 (PST)
Date: Thu,  2 Mar 2023 18:26:14 -0800
In-Reply-To: <20230303022618.4098825-1-hshan@google.com>
Mime-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230303022618.4098825-3-hshan@google.com>
Subject: [PATCH 3/6] Add the aehd-apic device type.
From: Haitao Shan <hshan@google.com>
To: qemu-devel@nongnu.org
Cc: Haitao Shan <hshan@google.com>, Haitao Shan <haitao.shan@google.com>, 
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, 
 Eduardo Habkost <eduardo@habkost.net>, "Michael S. Tsirkin" <mst@redhat.com>, 
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>,
 Yanan Wang <wangyanan55@huawei.com>, 
 "open list:Android Emulator..." <emu-dev@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=32loBZAUKCrsitibohpphmf.dpnrfnv-efwfmopohov.psh@flex--hshan.bounces.google.com;
 helo=mail-yb1-xb49.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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

The aehd-apic device type represents the AEHD in kernel APIC.
The irqchips should be always in kernel when AEHD is used.

Signed-off-by: Haitao Shan <hshan@google.com>
---
 MAINTAINERS                  |   2 +
 hw/i386/aehd/apic.c          | 204 +++++++++++++++++++++++
 hw/i386/aehd/meson.build     |   4 +
 hw/i386/meson.build          |   1 +
 include/hw/core/cpu.h        |   7 +
 include/sysemu/aehd.h        |  52 ++++++
 target/i386/aehd/aehd-all.c  | 315 +++++++++++++++++++++++++++++++++++
 target/i386/aehd/aehd.c      |  88 ++++++++++
 target/i386/aehd/aehd_int.h  |  50 ++++++
 target/i386/aehd/meson.build |   4 +
 target/i386/cpu-sysemu.c     |   3 +
 target/i386/meson.build      |   1 +
 12 files changed, 731 insertions(+)
 create mode 100644 hw/i386/aehd/apic.c
 create mode 100644 hw/i386/aehd/meson.build
 create mode 100644 target/i386/aehd/aehd-all.c
 create mode 100644 target/i386/aehd/aehd.c
 create mode 100644 target/i386/aehd/aehd_int.h
 create mode 100644 target/i386/aehd/meson.build

diff --git a/MAINTAINERS b/MAINTAINERS
index 54796da3b4..3db165dd9a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -535,6 +535,8 @@ W: https://github.com/google/android-emulator-hypervisor-driver
 S: Maintained
 F: include/sysemu/aehd-interface.h
 F: include/sysemu/aehd.h
+F: target/i386/aehd/
+F: hw/i386/aehd/
 
 Hosts
 -----
diff --git a/hw/i386/aehd/apic.c b/hw/i386/aehd/apic.c
new file mode 100644
index 0000000000..33a050ce11
--- /dev/null
+++ b/hw/i386/aehd/apic.c
@@ -0,0 +1,204 @@
+/*
+ * AEHD in-kernel APIC support
+ *
+ * Copyright (c) 2011 Siemens AG
+ *
+ * Authors:
+ *  Jan Kiszka          <jan.kiszka@siemens.com>
+ *
+ * This work is licensed under the terms of the GNU GPL version 2.
+ * See the COPYING file in the top-level directory.
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "hw/i386/apic_internal.h"
+#include "hw/pci/msi.h"
+#include "sysemu/hw_accel.h"
+#include "sysemu/aehd.h"
+#include "sysemu/aehd-interface.h"
+
+static inline void aehd_apic_set_reg(struct aehd_lapic_state *aapic,
+                                     int reg_id, uint32_t val)
+{
+    *((uint32_t *)(aapic->regs + (reg_id << 4))) = val;
+}
+
+static inline uint32_t aehd_apic_get_reg(struct aehd_lapic_state *aapic,
+                                         int reg_id)
+{
+    return *((uint32_t *)(aapic->regs + (reg_id << 4)));
+}
+
+void aehd_put_apic_state(DeviceState *dev, struct aehd_lapic_state *aapic)
+{
+    APICCommonState *s = APIC_COMMON(dev);
+    int i;
+
+    memset(aapic, 0, sizeof(*aapic));
+    aehd_apic_set_reg(aapic, 0x2, s->id << 24);
+    aehd_apic_set_reg(aapic, 0x8, s->tpr);
+    aehd_apic_set_reg(aapic, 0xd, s->log_dest << 24);
+    aehd_apic_set_reg(aapic, 0xe, s->dest_mode << 28 | 0x0fffffff);
+    aehd_apic_set_reg(aapic, 0xf, s->spurious_vec);
+    for (i = 0; i < 8; i++) {
+        aehd_apic_set_reg(aapic, 0x10 + i, s->isr[i]);
+        aehd_apic_set_reg(aapic, 0x18 + i, s->tmr[i]);
+        aehd_apic_set_reg(aapic, 0x20 + i, s->irr[i]);
+    }
+    aehd_apic_set_reg(aapic, 0x28, s->esr);
+    aehd_apic_set_reg(aapic, 0x30, s->icr[0]);
+    aehd_apic_set_reg(aapic, 0x31, s->icr[1]);
+    for (i = 0; i < APIC_LVT_NB; i++) {
+        aehd_apic_set_reg(aapic, 0x32 + i, s->lvt[i]);
+    }
+    aehd_apic_set_reg(aapic, 0x38, s->initial_count);
+    aehd_apic_set_reg(aapic, 0x3e, s->divide_conf);
+}
+
+void aehd_get_apic_state(DeviceState *dev, struct aehd_lapic_state *aapic)
+{
+    APICCommonState *s = APIC_COMMON(dev);
+    int i, v;
+
+    s->id = aehd_apic_get_reg(aapic, 0x2) >> 24;
+    s->tpr = aehd_apic_get_reg(aapic, 0x8);
+    s->arb_id = aehd_apic_get_reg(aapic, 0x9);
+    s->log_dest = aehd_apic_get_reg(aapic, 0xd) >> 24;
+    s->dest_mode = aehd_apic_get_reg(aapic, 0xe) >> 28;
+    s->spurious_vec = aehd_apic_get_reg(aapic, 0xf);
+    for (i = 0; i < 8; i++) {
+        s->isr[i] = aehd_apic_get_reg(aapic, 0x10 + i);
+        s->tmr[i] = aehd_apic_get_reg(aapic, 0x18 + i);
+        s->irr[i] = aehd_apic_get_reg(aapic, 0x20 + i);
+    }
+    s->esr = aehd_apic_get_reg(aapic, 0x28);
+    s->icr[0] = aehd_apic_get_reg(aapic, 0x30);
+    s->icr[1] = aehd_apic_get_reg(aapic, 0x31);
+    for (i = 0; i < APIC_LVT_NB; i++) {
+        s->lvt[i] = aehd_apic_get_reg(aapic, 0x32 + i);
+    }
+    s->initial_count = aehd_apic_get_reg(aapic, 0x38);
+    s->divide_conf = aehd_apic_get_reg(aapic, 0x3e);
+
+    v = (s->divide_conf & 3) | ((s->divide_conf >> 1) & 4);
+    s->count_shift = (v + 1) & 7;
+
+    s->initial_count_load_time = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    apic_next_timer(s, s->initial_count_load_time);
+}
+
+static void aehd_apic_set_base(APICCommonState *s, uint64_t val)
+{
+    s->apicbase = val;
+}
+
+static void aehd_apic_set_tpr(APICCommonState *s, uint8_t val)
+{
+    s->tpr = (val & 0x0f) << 4;
+}
+
+static uint8_t aehd_apic_get_tpr(APICCommonState *s)
+{
+    return s->tpr >> 4;
+}
+
+static void aehd_apic_vapic_base_update(APICCommonState *s)
+{
+    /* Not Implemented. This function is only for kvmvapic */
+}
+
+static void do_inject_external_nmi(CPUState *cpu, run_on_cpu_data data)
+{
+    APICCommonState *s = data.host_ptr;
+    uint32_t lvt;
+    int ret;
+
+    cpu_synchronize_state(cpu);
+
+    lvt = s->lvt[APIC_LVT_LINT1];
+    if (!(lvt & APIC_LVT_MASKED) && ((lvt >> 8) & 7) == APIC_DM_NMI) {
+        ret = aehd_vcpu_ioctl(cpu, AEHD_NMI, NULL, 0, NULL, 0);
+        if (ret < 0) {
+            fprintf(stderr, "AEHD: injection failed, NMI lost (%s)\n",
+                    strerror(-ret));
+        }
+    }
+}
+
+static void aehd_apic_external_nmi(APICCommonState *s)
+{
+    run_on_cpu(CPU(s->cpu), do_inject_external_nmi, RUN_ON_CPU_HOST_PTR(s));
+}
+
+static uint64_t aehd_apic_mem_read(void *opaque, hwaddr addr,
+                                   unsigned size)
+{
+    return ~(uint64_t)0;
+}
+
+static void aehd_apic_mem_write(void *opaque, hwaddr addr,
+                                uint64_t data, unsigned size)
+{
+    MSIMessage msg = { .address = addr, .data = data };
+    int ret;
+
+    ret = aehd_irqchip_send_msi(aehd_state, msg);
+    if (ret < 0) {
+        fprintf(stderr, "AEHD: injection failed, MSI lost (%s)\n",
+                strerror(-ret));
+    }
+}
+
+static const MemoryRegionOps aehd_apic_io_ops = {
+    .read = aehd_apic_mem_read,
+    .write = aehd_apic_mem_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static void aehd_apic_reset(APICCommonState *s)
+{
+    /* Not used by AEHD, which uses the CPU mp_state instead.  */
+    s->wait_for_sipi = 0;
+}
+
+static void aehd_apic_realize(DeviceState *dev, Error **errp)
+{
+    APICCommonState *s = APIC_COMMON(dev);
+
+    memory_region_init_io(&s->io_memory, OBJECT(s), &aehd_apic_io_ops, s,
+                          "aehd-apic-msi", APIC_SPACE_SIZE);
+
+    msi_nonbroken = true;
+}
+
+static void aehd_apic_unrealize(DeviceState *dev)
+{
+}
+
+static void aehd_apic_class_init(ObjectClass *klass, void *data)
+{
+    APICCommonClass *k = APIC_COMMON_CLASS(klass);
+
+    k->realize = aehd_apic_realize;
+    k->unrealize = aehd_apic_unrealize;
+    k->reset = aehd_apic_reset;
+    k->set_base = aehd_apic_set_base;
+    k->set_tpr = aehd_apic_set_tpr;
+    k->get_tpr = aehd_apic_get_tpr;
+    k->vapic_base_update = aehd_apic_vapic_base_update;
+    k->external_nmi = aehd_apic_external_nmi;
+}
+
+static const TypeInfo aehd_apic_info = {
+    .name = "aehd-apic",
+    .parent = TYPE_APIC_COMMON,
+    .instance_size = sizeof(APICCommonState),
+    .class_init = aehd_apic_class_init,
+};
+
+static void aehd_apic_register_types(void)
+{
+    type_register_static(&aehd_apic_info);
+}
+
+type_init(aehd_apic_register_types)
diff --git a/hw/i386/aehd/meson.build b/hw/i386/aehd/meson.build
new file mode 100644
index 0000000000..1749860954
--- /dev/null
+++ b/hw/i386/aehd/meson.build
@@ -0,0 +1,4 @@
+i386_aehd_ss = ss.source_set()
+i386_aehd_ss.add(when: 'CONFIG_APIC', if_true: files('apic.c'))
+
+i386_ss.add_all(when: 'CONFIG_AEHD', if_true: i386_aehd_ss)
diff --git a/hw/i386/meson.build b/hw/i386/meson.build
index 213e2e82b3..eaf61b05fc 100644
--- a/hw/i386/meson.build
+++ b/hw/i386/meson.build
@@ -30,6 +30,7 @@ i386_ss.add(when: 'CONFIG_X86_FW_OVMF', if_true: files('pc_sysfw_ovmf.c'),
                                         if_false: files('pc_sysfw_ovmf-stubs.c'))
 
 subdir('kvm')
+subdir('aehd')
 subdir('xen')
 
 i386_ss.add_all(xenpv_ss)
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index fb5d9667ca..5ed0600504 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -400,6 +400,13 @@ struct CPUState {
     uint32_t kvm_fetch_index;
     uint64_t dirty_pages;
 
+    /* Only used in AEHD */
+#ifdef _WIN32
+    HANDLE aehd_fd;
+    struct AEHDState *aehd_state;
+    struct aehd_run *aehd_run;
+#endif
+
     /* Use by accel-block: CPU is executing an ioctl() */
     QemuLockCnt in_ioctl_lock;
 
diff --git a/include/sysemu/aehd.h b/include/sysemu/aehd.h
index 7ba4234f60..87fa2f8362 100644
--- a/include/sysemu/aehd.h
+++ b/include/sysemu/aehd.h
@@ -14,6 +14,12 @@
 #ifndef QEMU_AEHD_H
 #define QEMU_AEHD_H
 
+#include "qemu/queue.h"
+#include "qemu/accel.h"
+#include "hw/core/cpu.h"
+#include "exec/memattrs.h"
+#include "hw/irq.h"
+
 #ifdef NEED_CPU_H
 # ifdef CONFIG_AEHD
 #  define CONFIG_AEHD_IS_POSSIBLE
@@ -23,3 +29,49 @@
 #endif
 
 #define aehd_enabled()           (0)
+
+struct aehd_run;
+struct aehd_lapic_state;
+struct aehd_irq_routing_entry;
+
+struct AEHDState;
+
+#define TYPE_AEHD_ACCEL ACCEL_CLASS_NAME("aehd")
+typedef struct AEHDState AEHDState;
+DECLARE_INSTANCE_CHECKER(AEHDState, AEHD_STATE,
+                         TYPE_AEHD_ACCEL)
+
+extern AEHDState *aehd_state;
+
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
+/* internal API */
+
+int aehd_ioctl(AEHDState *s, int type, void *input, size_t input_size,
+               void *output, size_t output_size);
+int aehd_vm_ioctl(AEHDState *s, int type, void *input, size_t input_size,
+                  void *output, size_t output_size);
+int aehd_vcpu_ioctl(CPUState *cpu, int type, void *input, size_t input_size,
+                    void *output, size_t output_size);
+
+/* Arch specific hooks */
+
+/* Notify arch about newly added MSI routes */
+int aehd_arch_add_msi_route_post(struct aehd_irq_routing_entry *route,
+                                 int vector, PCIDevice *dev);
+/* Notify arch about released MSI routes */
+int aehd_arch_release_virq_post(int virq);
+
+int aehd_set_irq(AEHDState *s, int irq, int level);
+int aehd_irqchip_send_msi(AEHDState *s, MSIMessage msg);
+
+void aehd_put_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
+void aehd_get_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
+
+#endif /* NEED_CPU_H */
+
+void aehd_irqchip_commit_routes(AEHDState *s);
+void aehd_irqchip_release_virq(AEHDState *s, int virq);
+
+#endif
diff --git a/target/i386/aehd/aehd-all.c b/target/i386/aehd/aehd-all.c
new file mode 100644
index 0000000000..f2eb80ecde
--- /dev/null
+++ b/target/i386/aehd/aehd-all.c
@@ -0,0 +1,315 @@
+/*
+ * QEMU AEHD support
+ *
+ * Copyright IBM, Corp. 2008
+ *           Red Hat, Inc. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *  Glauber Costa     <gcosta@redhat.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+
+#include "qemu/atomic.h"
+#include "qemu/option.h"
+#include "qemu/config-file.h"
+#include "qemu/error-report.h"
+#include "qapi/error.h"
+#include "hw/hw.h"
+#include "hw/pci/msi.h"
+#include "hw/pci/msix.h"
+#include "exec/gdbstub.h"
+#include "sysemu/runstate.h"
+#include "sysemu/cpus.h"
+#include "qemu/bswap.h"
+#include "exec/memory.h"
+#include "exec/ram_addr.h"
+#include "exec/address-spaces.h"
+#include "qemu/event_notifier.h"
+#include "qemu/main-loop.h"
+#include "trace.h"
+#include "hw/irq.h"
+#include "qapi/visitor.h"
+#include "qapi/qapi-types-common.h"
+#include "qapi/qapi-visit-common.h"
+#include "sysemu/hw_accel.h"
+#include "sysemu/aehd-interface.h"
+#include "aehd_int.h"
+
+#include "hw/boards.h"
+
+#ifdef DEBUG_AEHD
+#define DPRINTF(fmt, ...) \
+    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
+#else
+#define DPRINTF(fmt, ...) \
+    do { } while (0)
+#endif
+
+AEHDState *aehd_state;
+
+int aehd_set_irq(AEHDState *s, int irq, int level)
+{
+    struct aehd_irq_level event;
+    int ret;
+
+    event.level = level;
+    event.irq = irq;
+    ret = aehd_vm_ioctl(s, AEHD_IRQ_LINE_STATUS, &event, sizeof(event),
+                        &event, sizeof(event));
+
+    if (ret < 0) {
+        perror("aehd_set_irq");
+        abort();
+    }
+
+    return event.status;
+}
+
+typedef struct AEHDMSIRoute {
+    struct aehd_irq_routing_entry kroute;
+    QTAILQ_ENTRY(AEHDMSIRoute) entry;
+} AEHDMSIRoute;
+
+static void set_gsi(AEHDState *s, unsigned int gsi)
+{
+    set_bit(gsi, s->used_gsi_bitmap);
+}
+
+static void clear_gsi(AEHDState *s, unsigned int gsi)
+{
+    clear_bit(gsi, s->used_gsi_bitmap);
+}
+
+void aehd_irqchip_commit_routes(AEHDState *s)
+{
+    int ret;
+    size_t irq_routing_size;
+
+    s->irq_routes->flags = 0;
+    irq_routing_size = sizeof(struct aehd_irq_routing) +
+                       s->irq_routes->nr *
+                       sizeof(struct aehd_irq_routing_entry);
+    ret = aehd_vm_ioctl(s, AEHD_SET_GSI_ROUTING, s->irq_routes,
+                        irq_routing_size, NULL, 0);
+    assert(ret == 0);
+}
+
+static void aehd_add_routing_entry(AEHDState *s,
+                                   struct aehd_irq_routing_entry *entry)
+{
+    struct aehd_irq_routing_entry *new;
+    int n, size;
+
+    if (s->irq_routes->nr == s->nr_allocated_irq_routes) {
+        n = s->nr_allocated_irq_routes * 2;
+        if (n < 64) {
+            n = 64;
+        }
+        size = sizeof(struct aehd_irq_routing);
+        size += n * sizeof(*new);
+        s->irq_routes = g_realloc(s->irq_routes, size);
+        s->nr_allocated_irq_routes = n;
+    }
+    n = s->irq_routes->nr++;
+    new = &s->irq_routes->entries[n];
+
+    *new = *entry;
+
+    set_gsi(s, entry->gsi);
+}
+
+void aehd_irqchip_release_virq(AEHDState *s, int virq)
+{
+    struct aehd_irq_routing_entry *e;
+    int i;
+
+    for (i = 0; i < s->irq_routes->nr; i++) {
+        e = &s->irq_routes->entries[i];
+        if (e->gsi == virq) {
+            s->irq_routes->nr--;
+            *e = s->irq_routes->entries[s->irq_routes->nr];
+        }
+    }
+    clear_gsi(s, virq);
+    aehd_arch_release_virq_post(virq);
+}
+
+static unsigned int aehd_hash_msi(uint32_t data)
+{
+    /*
+     * According to Intel SDM, the lowest byte is an interrupt vector
+     */
+    return data & 0xff;
+}
+
+static void aehd_flush_dynamic_msi_routes(AEHDState *s)
+{
+    AEHDMSIRoute *route, *next;
+    unsigned int hash;
+
+    for (hash = 0; hash < AEHD_MSI_HASHTAB_SIZE; hash++) {
+        QTAILQ_FOREACH_SAFE(route, &s->msi_hashtab[hash], entry, next) {
+            aehd_irqchip_release_virq(s, route->kroute.gsi);
+            QTAILQ_REMOVE(&s->msi_hashtab[hash], route, entry);
+            g_free(route);
+        }
+    }
+}
+
+static int aehd_irqchip_get_virq(AEHDState *s)
+{
+    int next_virq;
+
+    /*
+     * PIC and IOAPIC share the first 16 GSI numbers, thus the available
+     * GSI numbers are more than the number of IRQ route. Allocating a GSI
+     * number can succeed even though a new route entry cannot be added.
+     * When this happens, flush dynamic MSI entries to free IRQ route entries.
+     */
+    if (s->irq_routes->nr == s->gsi_count) {
+        aehd_flush_dynamic_msi_routes(s);
+    }
+
+    /* Return the lowest unused GSI in the bitmap */
+    next_virq = find_first_zero_bit(s->used_gsi_bitmap, s->gsi_count);
+    if (next_virq >= s->gsi_count) {
+        return -ENOSPC;
+    } else {
+        return next_virq;
+    }
+}
+
+static AEHDMSIRoute *aehd_lookup_msi_route(AEHDState *s, MSIMessage msg)
+{
+    unsigned int hash = aehd_hash_msi(msg.data);
+    AEHDMSIRoute *route;
+
+    QTAILQ_FOREACH(route, &s->msi_hashtab[hash], entry) {
+        if (route->kroute.u.msi.address_lo == (uint32_t)msg.address &&
+            route->kroute.u.msi.address_hi == (msg.address >> 32) &&
+            route->kroute.u.msi.data == le32_to_cpu(msg.data)) {
+            return route;
+        }
+    }
+    return NULL;
+}
+
+int aehd_irqchip_send_msi(AEHDState *s, MSIMessage msg)
+{
+    AEHDMSIRoute *route;
+
+    route = aehd_lookup_msi_route(s, msg);
+    if (!route) {
+        int virq;
+
+        virq = aehd_irqchip_get_virq(s);
+        if (virq < 0) {
+            return virq;
+        }
+
+        route = g_malloc0(sizeof(AEHDMSIRoute));
+        route->kroute.gsi = virq;
+        route->kroute.type = AEHD_IRQ_ROUTING_MSI;
+        route->kroute.flags = 0;
+        route->kroute.u.msi.address_lo = (uint32_t)msg.address;
+        route->kroute.u.msi.address_hi = msg.address >> 32;
+        route->kroute.u.msi.data = le32_to_cpu(msg.data);
+
+        aehd_add_routing_entry(s, &route->kroute);
+        aehd_irqchip_commit_routes(s);
+
+        QTAILQ_INSERT_TAIL(&s->msi_hashtab[aehd_hash_msi(msg.data)], route,
+                           entry);
+    }
+
+    assert(route->kroute.type == AEHD_IRQ_ROUTING_MSI);
+
+    return aehd_set_irq(s, route->kroute.gsi, 1);
+}
+
+int aehd_ioctl(AEHDState *s, int type, void *input, size_t input_size,
+               void *output, size_t output_size)
+{
+    int ret;
+    DWORD byteRet;
+
+    ret = DeviceIoControl(s->fd, type, input, input_size,
+                          output, output_size, &byteRet, NULL);
+    if (!ret) {
+        DPRINTF("aehd device IO control %x failed: %lx\n",
+                type, GetLastError());
+        switch (GetLastError()) {
+        case ERROR_MORE_DATA:
+            ret = -E2BIG;
+            break;
+        case ERROR_RETRY:
+            ret = -EAGAIN;
+            break;
+        default:
+            ret = -EFAULT;
+        }
+    } else {
+        ret = 0;
+    }
+    return ret;
+}
+
+int aehd_vm_ioctl(AEHDState *s, int type, void *input, size_t input_size,
+                  void *output, size_t output_size)
+{
+    int ret;
+    DWORD byteRet;
+
+    ret = DeviceIoControl(s->vmfd, type, input, input_size,
+                          output, output_size, &byteRet, NULL);
+    if (!ret) {
+        DPRINTF("aehd VM IO control %x failed: %lx\n",
+                type, GetLastError());
+        switch (GetLastError()) {
+        case ERROR_MORE_DATA:
+            ret = -E2BIG;
+            break;
+        case ERROR_RETRY:
+            ret = -EAGAIN;
+            break;
+        default:
+            ret = -EFAULT;
+        }
+    } else {
+        ret = 0;
+    }
+    return ret;
+}
+
+int aehd_vcpu_ioctl(CPUState *cpu, int type, void *input, size_t input_size,
+                    void *output, size_t output_size)
+{
+    int ret;
+    DWORD byteRet;
+
+    ret = DeviceIoControl(cpu->aehd_fd, type, input, input_size,
+                          output, output_size, &byteRet, NULL);
+    if (!ret) {
+        DPRINTF("aehd VCPU IO control %x failed: %lx\n",
+                type, GetLastError());
+        switch (GetLastError()) {
+        case ERROR_MORE_DATA:
+            ret = -E2BIG;
+            break;
+        case ERROR_RETRY:
+            ret = -EAGAIN;
+            break;
+        default:
+            ret = -EFAULT;
+        }
+    } else {
+        ret = 0;
+    }
+    return ret;
+}
diff --git a/target/i386/aehd/aehd.c b/target/i386/aehd/aehd.c
new file mode 100644
index 0000000000..4890a75553
--- /dev/null
+++ b/target/i386/aehd/aehd.c
@@ -0,0 +1,88 @@
+/*
+ * QEMU AEHD support
+ *
+ * Copyright (C) 2006-2008 Qumranet Technologies
+ * Copyright IBM, Corp. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+
+#include "cpu.h"
+#include "aehd_int.h"
+#include "sysemu/aehd-interface.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/hw_accel.h"
+#include "sysemu/reset.h"
+#include "sysemu/runstate.h"
+
+#include "exec/gdbstub.h"
+#include "qemu/host-utils.h"
+#include "qemu/main-loop.h"
+#include "qemu/config-file.h"
+#include "qemu/error-report.h"
+#include "qemu/memalign.h"
+#include "hw/i386/x86.h"
+#include "hw/i386/apic.h"
+#include "hw/i386/apic_internal.h"
+#include "hw/i386/apic-msidef.h"
+#include "hw/i386/e820_memory_layout.h"
+
+#include "exec/ioport.h"
+#include "hw/pci/pci.h"
+#include "hw/pci/msi.h"
+#include "migration/blocker.h"
+#include "exec/memattrs.h"
+
+#ifdef DEBUG_AEHD
+#define DPRINTF(fmt, ...) \
+    do { fprintf(stderr, fmt, ## __VA_ARGS__); } while (0)
+#else
+#define DPRINTF(fmt, ...) \
+    do { } while (0)
+#endif
+
+typedef struct MSIRouteEntry MSIRouteEntry;
+
+struct MSIRouteEntry {
+    PCIDevice *dev;             /* Device pointer */
+    int vector;                 /* MSI/MSIX vector index */
+    int virq;                   /* Virtual IRQ index */
+    QLIST_ENTRY(MSIRouteEntry) list;
+};
+
+/* List of used GSI routes */
+static QLIST_HEAD(, MSIRouteEntry) msi_route_list = \
+    QLIST_HEAD_INITIALIZER(msi_route_list);
+
+int aehd_arch_add_msi_route_post(struct aehd_irq_routing_entry *route,
+                                 int vector, PCIDevice *dev)
+{
+    MSIRouteEntry *entry;
+
+    entry = g_new0(MSIRouteEntry, 1);
+    entry->dev = dev;
+    entry->vector = vector;
+    entry->virq = route->gsi;
+    QLIST_INSERT_HEAD(&msi_route_list, entry, list);
+    return 0;
+}
+
+int aehd_arch_release_virq_post(int virq)
+{
+    MSIRouteEntry *entry, *next;
+    QLIST_FOREACH_SAFE(entry, &msi_route_list, list, next) {
+        if (entry->virq == virq) {
+            QLIST_REMOVE(entry, list);
+            break;
+        }
+    }
+    return 0;
+}
diff --git a/target/i386/aehd/aehd_int.h b/target/i386/aehd/aehd_int.h
new file mode 100644
index 0000000000..113f3ebf8e
--- /dev/null
+++ b/target/i386/aehd/aehd_int.h
@@ -0,0 +1,50 @@
+/*
+ * Internal definitions for a target's AEHD support
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_AEHD_INT_H
+#define QEMU_AEHD_INT_H
+
+#include "qemu/accel.h"
+#include "sysemu/aehd.h"
+
+typedef struct AEHDSlot {
+    hwaddr start_addr;
+    ram_addr_t memory_size;
+    void *ram;
+    int slot;
+    int flags;
+} AEHDSlot;
+
+typedef struct AEHDMemoryListener {
+    MemoryListener listener;
+    AEHDSlot *slots;
+    int as_id;
+} AEHDMemoryListener;
+
+#define AEHD_MSI_HASHTAB_SIZE    256
+
+struct AEHDState {
+    AccelState parent_obj;
+
+    int nr_slots;
+    HANDLE fd;
+    HANDLE vmfd;
+    GHashTable *gsimap;
+    struct aehd_irq_routing *irq_routes;
+    int nr_allocated_irq_routes;
+    unsigned long *used_gsi_bitmap;
+    unsigned int gsi_count;
+    QTAILQ_HEAD(, AEHDMSIRoute) msi_hashtab[AEHD_MSI_HASHTAB_SIZE];
+    AEHDMemoryListener memory_listener;
+    QLIST_HEAD(, AEHDParkedVcpu) aehd_parked_vcpus;
+};
+
+void aehd_memory_listener_register(AEHDState *s, AEHDMemoryListener *kml,
+                                  AddressSpace *as, int as_id);
+
+#endif
diff --git a/target/i386/aehd/meson.build b/target/i386/aehd/meson.build
new file mode 100644
index 0000000000..50880712db
--- /dev/null
+++ b/target/i386/aehd/meson.build
@@ -0,0 +1,4 @@
+i386_softmmu_ss.add(when: 'CONFIG_AEHD', if_true: files(
+  'aehd-all.c',
+  'aehd.c',
+))
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 28115edf44..4d80b58346 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -21,6 +21,7 @@
 #include "cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/whpx.h"
+#include "sysemu/aehd.h"
 #include "kvm/kvm_i386.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-run-state.h"
@@ -258,6 +259,8 @@ APICCommonClass *apic_get_class(Error **errp)
             return NULL;
         }
         apic_type = "kvm-apic";
+    } else if (aehd_enabled()) {
+        apic_type = "aehd-apic";
     } else if (xen_enabled()) {
         apic_type = "xen-apic";
     } else if (whpx_apic_in_platform()) {
diff --git a/target/i386/meson.build b/target/i386/meson.build
index ae38dc9563..76a90b73d5 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -25,6 +25,7 @@ i386_softmmu_ss.add(when: 'CONFIG_SEV', if_true: files('sev.c'), if_false: files
 i386_user_ss = ss.source_set()
 
 subdir('kvm')
+subdir('aehd')
 subdir('hax')
 subdir('whpx')
 subdir('nvmm')
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


