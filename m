Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CFA16A8F30
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Mar 2023 03:28:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXv8F-0000ye-Vb; Thu, 02 Mar 2023 21:26:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <34VoBZAUKCsIp0pivowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--hshan.bounces.google.com>)
 id 1pXv8D-0000yB-L7
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:49 -0500
Received: from mail-yb1-xb49.google.com ([2607:f8b0:4864:20::b49])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <34VoBZAUKCsIp0pivowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--hshan.bounces.google.com>)
 id 1pXv89-0007WI-AF
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 21:26:49 -0500
Received: by mail-yb1-xb49.google.com with SMTP id
 h3-20020a25d003000000b00a1a201a745aso897726ybg.22
 for <qemu-devel@nongnu.org>; Thu, 02 Mar 2023 18:26:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20210112; t=1677810401;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=hupPVnpe3c1lUZULnW7PCtemAuw+MqjBZSjA6Vk0CBk=;
 b=XYOfx+HFb+Uip+TwaikkuBTGeqy/HVZytKhVzFFPJ0lmfdCR+1U/xTT/sBWd/MV9TK
 I1DCxEQsJ+1Nu4pkFBZoY6oFOfNe8hq2ltp3ZtqiWPKWGHgqJ/rHtyGSgBVERtJQDtaC
 Hvk93s3gSl9nhD51HnYz/AYjvZ8jQnbBbPWkS4oROgxmpktNvjhOr/7vCTEli8lVnw/+
 fV/vxlThDXusKl7xuTegMV2YPVZj39c2TZOTDw+wTlMSANPIpGAPEpaxy/nnx+qVNsre
 FQXNzVNNL9u5rHOHDIBOfOKwFEksPeqNGHMzGzyucnL1FwNRguD0fm9Quoab0OQM3ouN
 n2gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677810401;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=hupPVnpe3c1lUZULnW7PCtemAuw+MqjBZSjA6Vk0CBk=;
 b=ePPzmQ6C6LeZZVPec+GSpeZuC3WWrN/5o0zxBnbhO55DBhz/XiilBSnGJym4YxrGzD
 IcTY7X0DnCGbyzngl7qikNhYV64EDTNSRSzVrAJWz22iOAFU7fEYnX6KC1w4ipJIArJs
 3JF2IQMaMf7yd09LgewBRGY4cHdVF+K7bzlBKd7MRcCz2524E1o26zcYkDljWrcDocor
 Fu2Bn3pqYREwHyeS36SDe3090wvDeYysLVyXoh/prO5lf5n9V8+lVzPmz0+2s5NuIeg/
 qCm5WCEOewd08t81l9VbaWYtZ9aCIG4tbVTPnepdHIYfApNvCT4pSrAw8GXEHIW2Dh8S
 h5wA==
X-Gm-Message-State: AO0yUKUqi7cxGSJD5dSzBHlmu34blf6j5IzVhkI0Gjv0+OIyZvfdP5MW
 WsaygES7j6jlXqF/peUAfnFlXCZuYSt8vodGmTrDhReuvLQhuFrZFmVuoQxkq/Lcb8nOqvIoMmo
 kLBIcpnpq0/Isuu4L+d9l7v3USc4NSES0hMOXJaLA1AglGVZ1sIDPHT+nlg==
X-Google-Smtp-Source: AK7set8BDeS+llyampDooVgC3vmyIK46CvOyMmQ8vg/EHn09sLO8f9tecGzoJtYFX3atePm5e8M3Tf0GJA==
X-Received: from hshan17.roam.corp.google.com
 ([2620:15c:211:201:633f:2163:6a23:74ef])
 (user=hshan job=sendgmr) by 2002:a25:9112:0:b0:a4a:4324:2b1f with SMTP id
 v18-20020a259112000000b00a4a43242b1fmr61723ybl.8.1677810401082; Thu, 02 Mar
 2023 18:26:41 -0800 (PST)
Date: Thu,  2 Mar 2023 18:26:17 -0800
In-Reply-To: <20230303022618.4098825-1-hshan@google.com>
Mime-Version: 1.0
References: <20230303022618.4098825-1-hshan@google.com>
X-Mailer: git-send-email 2.40.0.rc0.216.gc4246ad0f0-goog
Message-ID: <20230303022618.4098825-6-hshan@google.com>
Subject: [PATCH 6/6] Add the AEHD implementation.
From: Haitao Shan <hshan@google.com>
To: qemu-devel@nongnu.org
Cc: Haitao Shan <hshan@google.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, 
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, 
 Peter Xu <peterx@redhat.com>, David Hildenbrand <david@redhat.com>, 
 "=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?=" <philmd@linaro.org>,
 Haitao Shan <haitao.shan@google.com>, 
 "open list:Android Emulator..." <emu-dev@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b49;
 envelope-from=34VoBZAUKCsIp0pivowwotm.kwuymu2-lm3mtvwvov2.wzo@flex--hshan.bounces.google.com;
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

Implement the AEHD accelerator including the AEHD AccelClass,
AccelCPUClass, AccelOpsClass.

Signed-off-by: Haitao Shan <hshan@google.com>
---
 hw/i386/x86.c                     |    2 +-
 include/exec/ram_addr.h           |    2 -
 include/sysemu/aehd.h             |   87 ++
 include/sysemu/hw_accel.h         |    1 +
 target/i386/aehd/aehd-accel-ops.c |  119 ++
 target/i386/aehd/aehd-accel-ops.h |   22 +
 target/i386/aehd/aehd-all.c       | 1020 +++++++++++++++
 target/i386/aehd/aehd-cpu.c       |  150 +++
 target/i386/aehd/aehd-cpu.h       |   41 +
 target/i386/aehd/aehd-stub.c      |   22 +
 target/i386/aehd/aehd.c           | 1915 +++++++++++++++++++++++++++++
 target/i386/aehd/aehd_i386.h      |   26 +
 target/i386/aehd/aehd_int.h       |    2 +-
 target/i386/aehd/meson.build      |    4 +
 target/i386/cpu.c                 |   12 +-
 target/i386/cpu.h                 |    5 +-
 target/i386/helper.c              |    3 +
 target/i386/meson.build           |    1 +
 18 files changed, 3428 insertions(+), 6 deletions(-)
 create mode 100644 target/i386/aehd/aehd-accel-ops.c
 create mode 100644 target/i386/aehd/aehd-accel-ops.h
 create mode 100644 target/i386/aehd/aehd-cpu.c
 create mode 100644 target/i386/aehd/aehd-cpu.h
 create mode 100644 target/i386/aehd/aehd-stub.c
 create mode 100644 target/i386/aehd/aehd_i386.h

diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index ffc6f97ce0..fdf090f25d 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -1251,7 +1251,7 @@ bool x86_machine_is_smm_enabled(const X86MachineState *x86ms)
         return false;
     }
 
-    if (tcg_enabled() || qtest_enabled()) {
+    if (tcg_enabled() || aehd_enabled() || qtest_enabled()) {
         smm_available = true;
     } else if (kvm_enabled()) {
         smm_available = kvm_has_smm();
diff --git a/include/exec/ram_addr.h b/include/exec/ram_addr.h
index f4fb6a2111..4ff1745c30 100644
--- a/include/exec/ram_addr.h
+++ b/include/exec/ram_addr.h
@@ -332,7 +332,6 @@ static inline void cpu_physical_memory_set_dirty_range(ram_addr_t start,
     xen_hvm_modified_memory(start, length);
 }
 
-#if !defined(_WIN32)
 static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
                                                           ram_addr_t start,
                                                           ram_addr_t pages)
@@ -424,7 +423,6 @@ static inline void cpu_physical_memory_set_dirty_lebitmap(unsigned long *bitmap,
         }
     }
 }
-#endif /* not _WIN32 */
 
 bool cpu_physical_memory_test_and_clear_dirty(ram_addr_t start,
                                               ram_addr_t length,
diff --git a/include/sysemu/aehd.h b/include/sysemu/aehd.h
index 534dd95e3c..f5846ee27e 100644
--- a/include/sysemu/aehd.h
+++ b/include/sysemu/aehd.h
@@ -28,8 +28,17 @@
 # define CONFIG_AEHD_IS_POSSIBLE
 #endif
 
+#ifdef CONFIG_AEHD_IS_POSSIBLE
+
+extern bool aehd_allowed;
+#define aehd_enabled()           (aehd_allowed)
+
+#else /* !CONFIG_AEHD_IS_POSSIBLE */
+
 #define aehd_enabled()           (0)
 
+#endif /* !CONFIG_AEHD_IS_POSSIBLE */
+
 struct aehd_run;
 struct aehd_lapic_state;
 struct aehd_irq_routing_entry;
@@ -43,6 +52,9 @@ DECLARE_INSTANCE_CHECKER(AEHDState, AEHD_STATE,
 
 extern AEHDState *aehd_state;
 
+/* external API */
+bool aehd_has_free_slot(MachineState *ms);
+
 #ifdef NEED_CPU_H
 #include "cpu.h"
 
@@ -57,6 +69,40 @@ int aehd_vcpu_ioctl(CPUState *cpu, int type, void *input, size_t input_size,
 
 /* Arch specific hooks */
 
+void aehd_arch_pre_run(CPUState *cpu, struct aehd_run *run);
+MemTxAttrs aehd_arch_post_run(CPUState *cpu, struct aehd_run *run);
+
+int aehd_arch_handle_exit(CPUState *cpu, struct aehd_run *run);
+
+int aehd_arch_handle_ioapic_eoi(CPUState *cpu, struct aehd_run *run);
+
+int aehd_arch_process_async_events(CPUState *cpu);
+
+int aehd_arch_get_registers(CPUState *cpu);
+
+/* state subset only touched by the VCPU itself during runtime */
+#define AEHD_PUT_RUNTIME_STATE   1
+/* state subset modified during VCPU reset */
+#define AEHD_PUT_RESET_STATE     2
+/* full state set, modified during initialization or on vmload */
+#define AEHD_PUT_FULL_STATE      3
+
+int aehd_arch_put_registers(CPUState *cpu, int level);
+
+int aehd_arch_init(MachineState *ms, AEHDState *s);
+
+int aehd_arch_init_vcpu(CPUState *cpu);
+
+bool aehd_vcpu_id_is_valid(int vcpu_id);
+
+/* Returns VCPU ID to be used on AEHD_CREATE_VCPU ioctl() */
+unsigned long aehd_arch_vcpu_id(CPUState *cpu);
+
+void aehd_arch_init_irq_routing(AEHDState *s);
+
+int aehd_arch_fixup_msi_route(struct aehd_irq_routing_entry *route,
+                              uint64_t address, uint32_t data, PCIDevice *dev);
+
 /* Notify arch about newly added MSI routes */
 int aehd_arch_add_msi_route_post(struct aehd_irq_routing_entry *route,
                                  int vector, PCIDevice *dev);
@@ -71,11 +117,52 @@ void aehd_irqchip_add_irq_route(AEHDState *s, int gsi, int irqchip, int pin);
 void aehd_put_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
 void aehd_get_apic_state(DeviceState *d, struct aehd_lapic_state *kapic);
 
+bool aehd_arch_stop_on_emulation_error(CPUState *cpu);
+
+int aehd_check_extension(AEHDState *s, unsigned int extension);
+
+int aehd_vm_check_extension(AEHDState *s, unsigned int extension);
+
+uint32_t aehd_arch_get_supported_cpuid(AEHDState *env, uint32_t function,
+                                       uint32_t index, int reg);
+
 #endif /* NEED_CPU_H */
 
+void aehd_raise_event(CPUState *cpu);
+void aehd_cpu_synchronize_state(CPUState *cpu);
+
+/**
+ * aehd_irqchip_add_msi_route - Add MSI route for specific vector
+ * @s:      AEHD state
+ * @vector: which vector to add. This can be either MSI/MSIX
+ *          vector. The function will automatically detect whether
+ *          MSI/MSIX is enabled, and fetch corresponding MSI
+ *          message.
+ * @dev:    Owner PCI device to add the route. If @dev is specified
+ *          as @NULL, an empty MSI message will be inited.
+ * @return: virq (>=0) when success, errno (<0) when failed.
+ */
+int aehd_irqchip_add_msi_route(AEHDState *s, int vector, PCIDevice *dev);
+int aehd_irqchip_update_msi_route(AEHDState *s, int virq, MSIMessage msg,
+                                  PCIDevice *dev);
 void aehd_irqchip_commit_routes(AEHDState *s);
 void aehd_irqchip_release_virq(AEHDState *s, int virq);
 
+void aehd_irqchip_set_qemuirq_gsi(AEHDState *s, qemu_irq irq, int gsi);
 void aehd_pc_setup_irq_routing(bool pci_enabled);
+void aehd_init_irq_routing(AEHDState *s);
+
+/**
+ * aehd_arch_irqchip_create:
+ * @AEHDState: The AEHDState pointer
+ * @MachineState: The MachineState pointer
+ *
+ * Allow architectures to create an in-kernel irq chip themselves.
+ *
+ * Returns: < 0: error
+ *            0: irq chip was not created
+ *          > 0: irq chip was created
+ */
+int aehd_arch_irqchip_create(MachineState *ms, AEHDState *s);
 
 #endif
diff --git a/include/sysemu/hw_accel.h b/include/sysemu/hw_accel.h
index 22903a55f7..a9e5494e08 100644
--- a/include/sysemu/hw_accel.h
+++ b/include/sysemu/hw_accel.h
@@ -14,6 +14,7 @@
 #include "hw/core/cpu.h"
 #include "sysemu/hax.h"
 #include "sysemu/kvm.h"
+#include "sysemu/aehd.h"
 #include "sysemu/hvf.h"
 #include "sysemu/whpx.h"
 #include "sysemu/nvmm.h"
diff --git a/target/i386/aehd/aehd-accel-ops.c b/target/i386/aehd/aehd-accel-ops.c
new file mode 100644
index 0000000000..49e6f0287c
--- /dev/null
+++ b/target/i386/aehd/aehd-accel-ops.c
@@ -0,0 +1,119 @@
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
+#include "qemu/error-report.h"
+#include "qemu/main-loop.h"
+#include "sysemu/aehd.h"
+#include "sysemu/runstate.h"
+#include "sysemu/cpus.h"
+#include "qemu/guest-random.h"
+#include "qapi/error.h"
+
+#include "aehd-accel-ops.h"
+
+static void *aehd_vcpu_thread_fn(void *arg)
+{
+    CPUState *cpu = arg;
+    int r;
+
+    rcu_register_thread();
+
+    qemu_mutex_lock_iothread();
+    qemu_thread_get_self(cpu->thread);
+    cpu->thread_id = qemu_get_thread_id();
+    cpu->can_do_io = 1;
+    current_cpu = cpu;
+
+    r = aehd_init_vcpu(cpu);
+    if (r < 0) {
+        fprintf(stderr, "aehd_init_vcpu failed: %s\n", strerror(-r));
+        exit(1);
+    }
+
+    /* signal CPU creation */
+    cpu_thread_signal_created(cpu);
+    qemu_guest_random_seed_thread_part2(cpu->random_seed);
+
+    do {
+        if (cpu_can_run(cpu)) {
+            r = aehd_cpu_exec(cpu);
+            if (r == EXCP_DEBUG) {
+                cpu_handle_guest_debug(cpu);
+            }
+        }
+        qemu_wait_io_event(cpu);
+    } while (!cpu->unplug || cpu_can_run(cpu));
+
+    aehd_destroy_vcpu(cpu);
+    cpu_thread_signal_destroyed(cpu);
+    qemu_mutex_unlock_iothread();
+    rcu_unregister_thread();
+    return NULL;
+}
+
+static void aehd_start_vcpu_thread(CPUState *cpu)
+{
+    char thread_name[VCPU_THREAD_NAME_SIZE];
+
+    cpu->thread = g_malloc0(sizeof(QemuThread));
+    cpu->halt_cond = g_malloc0(sizeof(QemuCond));
+    qemu_cond_init(cpu->halt_cond);
+    snprintf(thread_name, VCPU_THREAD_NAME_SIZE, "CPU %d/AEHD",
+             cpu->cpu_index);
+    qemu_thread_create(cpu->thread, thread_name, aehd_vcpu_thread_fn,
+                       cpu, QEMU_THREAD_JOINABLE);
+#ifdef _WIN32
+    cpu->hThread = qemu_thread_get_handle(cpu->thread);
+#endif
+}
+
+static bool aehd_vcpu_thread_is_idle(CPUState *cpu)
+{
+    return false;
+}
+
+static void aehd_kick_vcpu_thread(CPUState *cpu)
+{
+    cpu_exit(cpu);
+    aehd_raise_event(cpu);
+}
+
+static void aehd_accel_ops_class_init(ObjectClass *oc, void *data)
+{
+    AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
+
+    ops->create_vcpu_thread = aehd_start_vcpu_thread;
+    ops->cpu_thread_is_idle = aehd_vcpu_thread_is_idle;
+    ops->synchronize_post_reset = aehd_cpu_synchronize_post_reset;
+    ops->synchronize_post_init = aehd_cpu_synchronize_post_init;
+    ops->synchronize_state = aehd_cpu_synchronize_state;
+    ops->synchronize_pre_loadvm = aehd_cpu_synchronize_pre_loadvm;
+    ops->kick_vcpu_thread = aehd_kick_vcpu_thread;
+}
+
+static const TypeInfo aehd_accel_ops_type = {
+    .name = ACCEL_OPS_NAME("aehd"),
+
+    .parent = TYPE_ACCEL_OPS,
+    .class_init = aehd_accel_ops_class_init,
+    .abstract = true,
+};
+
+static void aehd_accel_ops_register_types(void)
+{
+    type_register_static(&aehd_accel_ops_type);
+}
+type_init(aehd_accel_ops_register_types);
diff --git a/target/i386/aehd/aehd-accel-ops.h b/target/i386/aehd/aehd-accel-ops.h
new file mode 100644
index 0000000000..8ee4f5bd55
--- /dev/null
+++ b/target/i386/aehd/aehd-accel-ops.h
@@ -0,0 +1,22 @@
+/*
+ * Accelerator CPUS Interface
+ *
+ * Copyright 2020 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#ifndef AEHD_CPUS_H
+#define AEHD_CPUS_H
+
+#include "sysemu/cpus.h"
+
+int aehd_init_vcpu(CPUState *cpu);
+int aehd_cpu_exec(CPUState *cpu);
+void aehd_destroy_vcpu(CPUState *cpu);
+void aehd_cpu_synchronize_post_reset(CPUState *cpu);
+void aehd_cpu_synchronize_post_init(CPUState *cpu);
+void aehd_cpu_synchronize_pre_loadvm(CPUState *cpu);
+
+#endif /* AEHD_CPUS_H */
diff --git a/target/i386/aehd/aehd-all.c b/target/i386/aehd/aehd-all.c
index 4c6a670cb7..8e16106ba4 100644
--- a/target/i386/aehd/aehd-all.c
+++ b/target/i386/aehd/aehd-all.c
@@ -39,6 +39,7 @@
 #include "qapi/qapi-visit-common.h"
 #include "sysemu/hw_accel.h"
 #include "sysemu/aehd-interface.h"
+#include "aehd-accel-ops.h"
 #include "aehd_int.h"
 
 #include "hw/boards.h"
@@ -51,7 +52,508 @@
     do { } while (0)
 #endif
 
+struct AEHDParkedVcpu {
+    unsigned long vcpu_id;
+    HANDLE aehd_fd;
+    QLIST_ENTRY(AEHDParkedVcpu) node;
+};
+
 AEHDState *aehd_state;
+bool aehd_allowed;
+
+static AEHDSlot *aehd_get_free_slot(AEHDMemoryListener *gml)
+{
+    AEHDState *s = aehd_state;
+    int i;
+
+    for (i = 0; i < s->nr_slots; i++) {
+        if (gml->slots[i].memory_size == 0) {
+            return &gml->slots[i];
+        }
+    }
+
+    return NULL;
+}
+
+bool aehd_has_free_slot(MachineState *ms)
+{
+    AEHDState *s = AEHD_STATE(ms->accelerator);
+
+    return aehd_get_free_slot(&s->memory_listener);
+}
+
+static AEHDSlot *aehd_alloc_slot(AEHDMemoryListener *gml)
+{
+    AEHDSlot *slot = aehd_get_free_slot(gml);
+
+    if (slot) {
+        return slot;
+    }
+
+    fprintf(stderr, "%s: no free slot available\n", __func__);
+    abort();
+}
+
+static AEHDSlot *aehd_lookup_matching_slot(AEHDMemoryListener *gml,
+                                         hwaddr start_addr,
+                                         hwaddr size)
+{
+    AEHDState *s = aehd_state;
+    int i;
+
+    for (i = 0; i < s->nr_slots; i++) {
+        AEHDSlot *mem = &gml->slots[i];
+
+        if (start_addr == mem->start_addr && size == mem->memory_size) {
+            return mem;
+        }
+    }
+
+    return NULL;
+}
+
+/*
+ * Calculate and align the start address and the size of the section.
+ * Return the size. If the size is 0, the aligned section is empty.
+ */
+static hwaddr aehd_align_section(MemoryRegionSection *section,
+                                hwaddr *start)
+{
+    hwaddr size = int128_get64(section->size);
+    hwaddr delta, aligned;
+
+    /*
+     * kvm works in page size chunks, but the function may be called
+     * with sub-page size and unaligned start address. Pad the start
+     * address to next and truncate size to previous page boundary.
+     */
+    aligned = ROUND_UP(section->offset_within_address_space,
+                       qemu_real_host_page_size());
+    delta = aligned - section->offset_within_address_space;
+    *start = aligned;
+    if (delta > size) {
+        return 0;
+    }
+
+    return (size - delta) & qemu_real_host_page_mask();
+}
+
+static int aehd_set_user_memory_region(AEHDMemoryListener *gml, AEHDSlot *slot)
+{
+    AEHDState *s = aehd_state;
+    struct aehd_userspace_memory_region mem;
+    int r;
+
+    mem.slot = slot->slot | (gml->as_id << 16);
+    mem.guest_phys_addr = slot->start_addr;
+    mem.userspace_addr = (uint64_t)slot->ram;
+    mem.flags = slot->flags;
+
+    if (slot->memory_size && mem.flags & AEHD_MEM_READONLY) {
+        /*
+         * Set the slot size to 0 before setting the slot to the desired
+         * value. This is needed based on KVM commit 75d61fbc.
+         */
+        mem.memory_size = 0;
+        r = aehd_vm_ioctl(s, AEHD_SET_USER_MEMORY_REGION,
+                          &mem, sizeof(mem), NULL, 0);
+    }
+    mem.memory_size = slot->memory_size;
+    r = aehd_vm_ioctl(s, AEHD_SET_USER_MEMORY_REGION,
+                      &mem, sizeof(mem), NULL, 0);
+    return r;
+}
+
+void aehd_destroy_vcpu(CPUState *cpu)
+{
+    struct AEHDParkedVcpu *vcpu = NULL;
+    int ret = 0;
+
+    DPRINTF("aehd_destroy_vcpu\n");
+
+    ret = aehd_vcpu_ioctl(cpu, AEHD_VCPU_MUNMAP, NULL, 0, NULL, 0);
+    fprintf(stderr, "aehd munmap %d\n", ret);
+
+    vcpu = g_malloc0(sizeof(*vcpu));
+    vcpu->vcpu_id = aehd_arch_vcpu_id(cpu);
+    vcpu->aehd_fd = cpu->aehd_fd;
+    QLIST_INSERT_HEAD(&aehd_state->aehd_parked_vcpus, vcpu, node);
+}
+
+static HANDLE aehd_get_vcpu(AEHDState *s, unsigned long vcpu_id)
+{
+    struct AEHDParkedVcpu *cpu;
+    HANDLE vcpu_fd = INVALID_HANDLE_VALUE;
+    int ret;
+
+    QLIST_FOREACH(cpu, &s->aehd_parked_vcpus, node) {
+        if (cpu->vcpu_id == vcpu_id) {
+            HANDLE aehd_fd;
+
+            QLIST_REMOVE(cpu, node);
+            aehd_fd = cpu->aehd_fd;
+            g_free(cpu);
+            return aehd_fd;
+        }
+    }
+
+    ret = aehd_vm_ioctl(s, AEHD_CREATE_VCPU, &vcpu_id, sizeof(vcpu_id),
+                        &vcpu_fd, sizeof(vcpu_fd));
+    if (ret) {
+        return INVALID_HANDLE_VALUE;
+    }
+
+    return vcpu_fd;
+}
+
+int aehd_init_vcpu(CPUState *cpu)
+{
+    AEHDState *s = aehd_state;
+    long mmap_size;
+    int ret;
+    HANDLE vcpu_fd;
+
+    DPRINTF("aehd_init_vcpu\n");
+
+    vcpu_fd = aehd_get_vcpu(s, aehd_arch_vcpu_id(cpu));
+    if (vcpu_fd == INVALID_HANDLE_VALUE) {
+        DPRINTF("aehd_create_vcpu failed\n");
+        ret = -EFAULT;
+        goto err;
+    }
+
+    cpu->aehd_fd = vcpu_fd;
+    cpu->aehd_state = s;
+    cpu->vcpu_dirty = true;
+
+    ret = aehd_ioctl(s, AEHD_GET_VCPU_MMAP_SIZE, NULL, 0,
+                     &mmap_size, sizeof(mmap_size));
+    if (ret) {
+        DPRINTF("AEHD_GET_VCPU_MMAP_SIZE failed\n");
+        goto err;
+    }
+
+    ret = aehd_vcpu_ioctl(cpu, AEHD_VCPU_MMAP, NULL, 0,
+                          &cpu->aehd_run, sizeof(cpu->aehd_run));
+    if (ret) {
+        DPRINTF("mmap'ing vcpu state failed\n");
+        goto err;
+    }
+
+    ret = aehd_arch_init_vcpu(cpu);
+err:
+    return ret;
+}
+
+/*
+ * dirty pages logging control
+ */
+
+static int aehd_mem_flags(MemoryRegion *mr)
+{
+    bool readonly = mr->readonly || memory_region_is_romd(mr);
+    int flags = 0;
+
+    if (memory_region_get_dirty_log_mask(mr) != 0) {
+        flags |= AEHD_MEM_LOG_DIRTY_PAGES;
+    }
+    if (readonly) {
+        flags |= AEHD_MEM_READONLY;
+    }
+    return flags;
+}
+
+static int aehd_slot_update_flags(AEHDMemoryListener *gml, AEHDSlot *mem,
+                                 MemoryRegion *mr)
+{
+    int old_flags;
+
+    old_flags = mem->flags;
+    mem->flags = aehd_mem_flags(mr);
+
+    /* If nothing changed effectively, no need to issue ioctl */
+    if (mem->flags == old_flags) {
+        return 0;
+    }
+
+    return aehd_set_user_memory_region(gml, mem);
+}
+
+static int aehd_section_update_flags(AEHDMemoryListener *gml,
+                                    MemoryRegionSection *section)
+{
+    hwaddr start_addr, size;
+    AEHDSlot *mem;
+
+    size = aehd_align_section(section, &start_addr);
+    if (!size) {
+        return 0;
+    }
+
+    mem = aehd_lookup_matching_slot(gml, start_addr, size);
+    if (!mem) {
+        /* We don't have a slot if we want to trap every access. */
+        return 0;
+    }
+
+    return aehd_slot_update_flags(gml, mem, section->mr);
+}
+
+static void aehd_log_start(MemoryListener *listener,
+                          MemoryRegionSection *section,
+                          int old, int new)
+{
+    AEHDMemoryListener *gml = container_of(listener, AEHDMemoryListener,
+                                           listener);
+    int r;
+
+    if (old != 0) {
+        return;
+    }
+
+    r = aehd_section_update_flags(gml, section);
+    if (r < 0) {
+        fprintf(stderr, "%s: dirty pages log change\n", __func__);
+        abort();
+    }
+}
+
+static void aehd_log_stop(MemoryListener *listener,
+                          MemoryRegionSection *section,
+                          int old, int new)
+{
+    AEHDMemoryListener *gml = container_of(listener, AEHDMemoryListener,
+                                           listener);
+    int r;
+
+    if (new != 0) {
+        return;
+    }
+
+    r = aehd_section_update_flags(gml, section);
+    if (r < 0) {
+        fprintf(stderr, "%s: dirty pages log change\n", __func__);
+        abort();
+    }
+}
+
+/* get aehd's dirty pages bitmap and update qemu's */
+static int aehd_get_dirty_pages_log_range(MemoryRegionSection *section,
+                                          unsigned long *bitmap)
+{
+    ram_addr_t start = section->offset_within_region +
+                       memory_region_get_ram_addr(section->mr);
+    ram_addr_t pages = int128_get64(section->size) /
+                       qemu_real_host_page_size();
+
+    cpu_physical_memory_set_dirty_lebitmap(bitmap, start, pages);
+    return 0;
+}
+
+#define ALIGN(x, y)  (((x) + (y) - 1) & ~((y) - 1))
+
+/**
+ * aehd_physical_sync_dirty_bitmap - Grab dirty bitmap from kernel space
+ * This function updates qemu's dirty bitmap using
+ * memory_region_set_dirty().  This means all bits are set
+ * to dirty.
+ *
+ * @start_add: start of logged region.
+ * @end_addr: end of logged region.
+ */
+static int aehd_physical_sync_dirty_bitmap(AEHDMemoryListener *gml,
+                                           MemoryRegionSection *section)
+{
+    AEHDState *s = aehd_state;
+    struct aehd_dirty_log d = {};
+    AEHDSlot *mem;
+    hwaddr start_addr, size;
+
+    size = aehd_align_section(section, &start_addr);
+    if (size) {
+        mem = aehd_lookup_matching_slot(gml, start_addr, size);
+        if (!mem) {
+            /* We don't have a slot if we want to trap every access. */
+            return 0;
+        }
+
+        size = ALIGN(((mem->memory_size) >> TARGET_PAGE_BITS),
+                     HOST_LONG_BITS) / 8;
+        d.dirty_bitmap = g_malloc0(size);
+
+        d.slot = mem->slot | (gml->as_id << 16);
+        if (aehd_vm_ioctl(s, AEHD_GET_DIRTY_LOG, &d, sizeof(d),
+                          &d, sizeof(d))) {
+            DPRINTF("ioctl failed %d\n", errno);
+            g_free(d.dirty_bitmap);
+            return -1;
+        }
+
+        aehd_get_dirty_pages_log_range(section, d.dirty_bitmap);
+        g_free(d.dirty_bitmap);
+    }
+
+    return 0;
+}
+
+int aehd_check_extension(AEHDState *s, unsigned int extension)
+{
+    int ret;
+    int result;
+    HANDLE hDevice = s->fd;
+
+    if (hDevice == INVALID_HANDLE_VALUE) {
+        DPRINTF("Invalid HANDLE for aehd device!\n");
+        return 0;
+    }
+
+    ret = aehd_ioctl(s, AEHD_CHECK_EXTENSION, &extension, sizeof(extension),
+                     &result, sizeof(result));
+
+    if (ret) {
+        DPRINTF("Failed to get aehd capabilities: %lx\n", GetLastError());
+        return 0;
+    }
+
+    return result;
+}
+
+int aehd_vm_check_extension(AEHDState *s, unsigned int extension)
+{
+    int ret;
+    int result;
+
+    ret = aehd_vm_ioctl(s, AEHD_CHECK_EXTENSION, &extension, sizeof(extension),
+                        &result, sizeof(result));
+    if (ret < 0) {
+        /* VM wide version not implemented, use global one instead */
+        ret = aehd_check_extension(s, extension);
+    }
+
+    return result;
+}
+
+static void aehd_set_phys_mem(AEHDMemoryListener *gml,
+                             MemoryRegionSection *section, bool add)
+{
+    AEHDSlot *mem;
+    int err;
+    MemoryRegion *mr = section->mr;
+    bool writeable = !mr->readonly && !mr->rom_device;
+    hwaddr start_addr, size;
+    void *ram;
+
+    if (!memory_region_is_ram(mr)) {
+        if (writeable) {
+            return;
+        } else if (!mr->romd_mode) {
+            /*
+             * If the memory device is not in romd_mode, then we actually want
+             * to remove the aehd memory slot so all accesses will trap.
+             */
+            add = false;
+        }
+    }
+
+    size = aehd_align_section(section, &start_addr);
+    if (!size) {
+        return;
+    }
+
+    /* use aligned delta to align the ram address */
+    ram = memory_region_get_ram_ptr(mr) + section->offset_within_region +
+          (start_addr - section->offset_within_address_space);
+
+    if (!add) {
+        mem = aehd_lookup_matching_slot(gml, start_addr, size);
+        if (!mem) {
+            return;
+        }
+        if (mem->flags & AEHD_MEM_LOG_DIRTY_PAGES) {
+            aehd_physical_sync_dirty_bitmap(gml, section);
+        }
+
+        /* unregister the slot */
+        mem->memory_size = 0;
+        err = aehd_set_user_memory_region(gml, mem);
+        if (err) {
+            fprintf(stderr, "%s: error unregistering overlapping slot: %s\n",
+                    __func__, strerror(-err));
+            abort();
+        }
+        return;
+    }
+
+    /* register the new slot */
+    mem = aehd_alloc_slot(gml);
+    mem->memory_size = size;
+    mem->start_addr = start_addr;
+    mem->ram = ram;
+    mem->flags = aehd_mem_flags(mr);
+
+    err = aehd_set_user_memory_region(gml, mem);
+    if (err) {
+        fprintf(stderr, "%s: error registering slot: %s\n", __func__,
+                strerror(-err));
+        abort();
+    }
+}
+
+static void aehd_region_add(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    AEHDMemoryListener *gml = container_of(listener, AEHDMemoryListener,
+                                           listener);
+
+    memory_region_ref(section->mr);
+    aehd_set_phys_mem(gml, section, true);
+}
+
+static void aehd_region_del(MemoryListener *listener,
+                           MemoryRegionSection *section)
+{
+    AEHDMemoryListener *gml = container_of(listener, AEHDMemoryListener,
+                                           listener);
+
+    aehd_set_phys_mem(gml, section, false);
+    memory_region_unref(section->mr);
+}
+
+static void aehd_log_sync(MemoryListener *listener,
+                         MemoryRegionSection *section)
+{
+    AEHDMemoryListener *gml = container_of(listener, AEHDMemoryListener,
+                                           listener);
+    int r;
+
+    r = aehd_physical_sync_dirty_bitmap(gml, section);
+    if (r < 0) {
+        fprintf(stderr, "%s: sync dirty bitmap\n", __func__);
+        abort();
+    }
+}
+
+void aehd_memory_listener_register(AEHDState *s, AEHDMemoryListener *gml,
+                                  AddressSpace *as, int as_id)
+{
+    int i;
+
+    gml->slots = g_malloc0(s->nr_slots * sizeof(AEHDSlot));
+    gml->as_id = as_id;
+
+    for (i = 0; i < s->nr_slots; i++) {
+        gml->slots[i].slot = i;
+    }
+
+    gml->listener.region_add = aehd_region_add;
+    gml->listener.region_del = aehd_region_del;
+    gml->listener.log_start = aehd_log_start;
+    gml->listener.log_stop = aehd_log_stop;
+    gml->listener.log_sync = aehd_log_sync;
+    gml->listener.priority = 10;
+
+    memory_listener_register(&gml->listener, as);
+}
 
 int aehd_set_irq(AEHDState *s, int irq, int level)
 {
@@ -86,6 +588,25 @@ static void clear_gsi(AEHDState *s, unsigned int gsi)
     clear_bit(gsi, s->used_gsi_bitmap);
 }
 
+void aehd_init_irq_routing(AEHDState *s)
+{
+    int gsi_count, i;
+
+    gsi_count = aehd_check_extension(s, AEHD_CAP_IRQ_ROUTING) - 1;
+    if (gsi_count > 0) {
+        /* Round up so we can search ints using ffs */
+        s->used_gsi_bitmap = bitmap_new(gsi_count);
+        s->gsi_count = gsi_count;
+    }
+
+    s->irq_routes = g_malloc0(sizeof(*s->irq_routes));
+    s->nr_allocated_irq_routes = 0;
+
+    for (i = 0; i < AEHD_MSI_HASHTAB_SIZE; i++) {
+        QTAILQ_INIT(&s->msi_hashtab[i]);
+    }
+}
+
 void aehd_irqchip_commit_routes(AEHDState *s)
 {
     int ret;
@@ -124,6 +645,30 @@ static void aehd_add_routing_entry(AEHDState *s,
     set_gsi(s, entry->gsi);
 }
 
+static int aehd_update_routing_entry(AEHDState *s,
+                                    struct aehd_irq_routing_entry *new_entry)
+{
+    struct aehd_irq_routing_entry *entry;
+    int n;
+
+    for (n = 0; n < s->irq_routes->nr; n++) {
+        entry = &s->irq_routes->entries[n];
+        if (entry->gsi != new_entry->gsi) {
+            continue;
+        }
+
+        if (!memcmp(entry, new_entry, sizeof *entry)) {
+            return 0;
+        }
+
+        *entry = *new_entry;
+
+        return 0;
+    }
+
+    return -ESRCH;
+}
+
 void aehd_irqchip_add_irq_route(AEHDState *s, int irq, int irqchip, int pin)
 {
     struct aehd_irq_routing_entry e = {};
@@ -247,6 +792,459 @@ int aehd_irqchip_send_msi(AEHDState *s, MSIMessage msg)
     return aehd_set_irq(s, route->kroute.gsi, 1);
 }
 
+int aehd_irqchip_add_msi_route(AEHDState *s, int vector, PCIDevice *dev)
+{
+    struct aehd_irq_routing_entry kroute = {};
+    int virq;
+    MSIMessage msg = {0, 0};
+
+    if (dev) {
+        msg = pci_get_msi_message(dev, vector);
+    }
+
+    virq = aehd_irqchip_get_virq(s);
+    if (virq < 0) {
+        return virq;
+    }
+
+    kroute.gsi = virq;
+    kroute.type = AEHD_IRQ_ROUTING_MSI;
+    kroute.flags = 0;
+    kroute.u.msi.address_lo = (uint32_t)msg.address;
+    kroute.u.msi.address_hi = msg.address >> 32;
+    kroute.u.msi.data = le32_to_cpu(msg.data);
+
+    aehd_add_routing_entry(s, &kroute);
+    aehd_arch_add_msi_route_post(&kroute, vector, dev);
+    aehd_irqchip_commit_routes(s);
+
+    return virq;
+}
+
+int aehd_irqchip_update_msi_route(AEHDState *s, int virq, MSIMessage msg,
+                                 PCIDevice *dev)
+{
+    struct aehd_irq_routing_entry kroute = {};
+
+    kroute.gsi = virq;
+    kroute.type = AEHD_IRQ_ROUTING_MSI;
+    kroute.flags = 0;
+    kroute.u.msi.address_lo = (uint32_t)msg.address;
+    kroute.u.msi.address_hi = msg.address >> 32;
+    kroute.u.msi.data = le32_to_cpu(msg.data);
+
+    return aehd_update_routing_entry(s, &kroute);
+}
+
+void aehd_irqchip_set_qemuirq_gsi(AEHDState *s, qemu_irq irq, int gsi)
+{
+    g_hash_table_insert(s->gsimap, irq, GINT_TO_POINTER(gsi));
+}
+
+static void aehd_irqchip_create(MachineState *machine, AEHDState *s)
+{
+    int ret;
+
+    /*
+     * First probe and see if there's a arch-specific hook to create the
+     * in-kernel irqchip for us
+     */
+    ret = aehd_arch_irqchip_create(machine, s);
+    if (ret == 0) {
+        ret = aehd_vm_ioctl(s, AEHD_CREATE_IRQCHIP, NULL, 0, NULL, 0);
+    }
+    if (ret < 0) {
+        fprintf(stderr, "Create kernel irqchip failed: %s\n", strerror(-ret));
+        exit(1);
+    }
+
+    aehd_init_irq_routing(s);
+
+    s->gsimap = g_hash_table_new(g_direct_hash, g_direct_equal);
+}
+
+/*
+ * Find number of supported CPUs using the recommended
+ * procedure from the kernel API documentation to cope with
+ * older kernels that may be missing capabilities.
+ */
+static int aehd_recommended_vcpus(AEHDState *s)
+{
+    int ret = aehd_check_extension(s, AEHD_CAP_NR_VCPUS);
+    return (ret) ? ret : 4;
+}
+
+static int aehd_max_vcpus(AEHDState *s)
+{
+    int ret = aehd_check_extension(s, AEHD_CAP_MAX_VCPUS);
+    return (ret) ? ret : aehd_recommended_vcpus(s);
+}
+
+static int aehd_max_vcpu_id(AEHDState *s)
+{
+    int ret = aehd_check_extension(s, AEHD_CAP_MAX_VCPU_ID);
+    return (ret) ? ret : aehd_max_vcpus(s);
+}
+
+bool aehd_vcpu_id_is_valid(int vcpu_id)
+{
+    AEHDState *s = AEHD_STATE(current_machine->accelerator);
+    return vcpu_id >= 0 && vcpu_id < aehd_max_vcpu_id(s);
+}
+
+static HANDLE aehd_open_device(void)
+{
+    HANDLE hDevice;
+
+    hDevice = CreateFile("\\\\.\\aehd", GENERIC_READ | GENERIC_WRITE, 0, NULL,
+        CREATE_ALWAYS, FILE_ATTRIBUTE_NORMAL, NULL);
+
+    if (hDevice == INVALID_HANDLE_VALUE)
+        fprintf(stderr, "Failed to open the aehd device! Error code %lx\n",
+                GetLastError());
+    return hDevice;
+}
+
+static int aehd_init(MachineState *ms)
+{
+    struct {
+        const char *name;
+        int num;
+    } num_cpus[] = {
+        { "SMP",          ms->smp.cpus },
+        { "hotpluggable", ms->smp.max_cpus },
+        { NULL, }
+    }, *nc = num_cpus;
+    int soft_vcpus_limit, hard_vcpus_limit;
+    AEHDState *s;
+    int ret;
+    int type = 0;
+    HANDLE vmfd;
+
+    s = AEHD_STATE(ms->accelerator);
+
+    /*
+     * On systems where the kernel can support different base page
+     * sizes, host page size may be different from TARGET_PAGE_SIZE,
+     * even with AEHD.  TARGET_PAGE_SIZE is assumed to be the minimum
+     * page size for the system though.
+     */
+    assert(TARGET_PAGE_SIZE <= qemu_real_host_page_size());
+
+    QLIST_INIT(&s->aehd_parked_vcpus);
+    s->vmfd = INVALID_HANDLE_VALUE;
+    s->fd = aehd_open_device();
+    if (s->fd == INVALID_HANDLE_VALUE) {
+        fprintf(stderr, "Could not access AEHD kernel module: %m\n");
+        ret = -ENODEV;
+        goto err;
+    }
+
+    s->nr_slots = aehd_check_extension(s, AEHD_CAP_NR_MEMSLOTS);
+
+    /* If unspecified, use the default value */
+    if (!s->nr_slots) {
+        s->nr_slots = 32;
+    }
+
+    /* check the vcpu limits */
+    soft_vcpus_limit = aehd_recommended_vcpus(s);
+    hard_vcpus_limit = aehd_max_vcpus(s);
+
+    while (nc->name) {
+        if (nc->num > soft_vcpus_limit) {
+            fprintf(stderr,
+                    "Warning: Number of %s cpus requested (%d) exceeds "
+                    "the recommended cpus supported by AEHD (%d)\n",
+                    nc->name, nc->num, soft_vcpus_limit);
+
+            if (nc->num > hard_vcpus_limit) {
+                fprintf(stderr, "Number of %s cpus requested (%d) exceeds "
+                        "the maximum cpus supported by AEHD (%d)\n",
+                        nc->name, nc->num, hard_vcpus_limit);
+                exit(1);
+            }
+        }
+        nc++;
+    }
+
+    do {
+        ret = aehd_ioctl(s, AEHD_CREATE_VM, &type, sizeof(type),
+                         &vmfd, sizeof(vmfd));
+    } while (ret == -EINTR);
+
+    if (ret < 0) {
+        fprintf(stderr, "ioctl(AEHD_CREATE_VM) failed: %d %s\n", -ret,
+                strerror(-ret));
+        goto err;
+    }
+
+    s->vmfd = vmfd;
+
+    ret = aehd_arch_init(ms, s);
+    if (ret < 0) {
+        goto err;
+    }
+
+    aehd_irqchip_create(ms, s);
+
+    aehd_state = s;
+
+    aehd_memory_listener_register(s, &s->memory_listener,
+                                 &address_space_memory, 0);
+
+    printf("AEHD is operational\n");
+
+    return 0;
+
+err:
+    assert(ret < 0);
+    if (s->vmfd != INVALID_HANDLE_VALUE) {
+        CloseHandle(s->vmfd);
+    }
+    if (s->fd != INVALID_HANDLE_VALUE) {
+        CloseHandle(s->fd);
+    }
+    g_free(s->memory_listener.slots);
+
+    return ret;
+}
+
+static void aehd_handle_io(uint16_t port, MemTxAttrs attrs, void *data,
+                          int direction, int size, uint32_t count)
+{
+    int i;
+    uint8_t *ptr = data;
+
+    for (i = 0; i < count; i++) {
+        address_space_rw(&address_space_io, port, attrs,
+                         ptr, size,
+                         direction == AEHD_EXIT_IO_OUT);
+        ptr += size;
+    }
+}
+
+static int aehd_handle_internal_error(CPUState *cpu, struct aehd_run *run)
+{
+    fprintf(stderr, "AEHD internal error. Suberror: %d\n",
+            run->internal.suberror);
+
+    int i;
+
+    for (i = 0; i < run->internal.ndata; ++i) {
+        fprintf(stderr, "extra data[%d]: %"PRIx64"\n",
+                i, (uint64_t)run->internal.data[i]);
+    }
+
+    if (run->internal.suberror == AEHD_INTERNAL_ERROR_EMULATION) {
+        fprintf(stderr, "emulation failure\n");
+        if (!aehd_arch_stop_on_emulation_error(cpu)) {
+            cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
+            return EXCP_INTERRUPT;
+        }
+    }
+    /*
+     * FIXME: Should trigger a qmp message to let management know
+     * something went wrong.
+     */
+    return -1;
+}
+
+void aehd_raise_event(CPUState *cpu)
+{
+    AEHDState *s = aehd_state;
+    struct aehd_run *run = cpu->aehd_run;
+    unsigned long vcpu_id = aehd_arch_vcpu_id(cpu);
+
+    if (!run) {
+        return;
+    }
+    run->user_event_pending = 1;
+    aehd_vm_ioctl(s, AEHD_KICK_VCPU, &vcpu_id, sizeof(vcpu_id), NULL, 0);
+}
+
+static void do_aehd_cpu_synchronize_state(CPUState *cpu, run_on_cpu_data arg)
+{
+    if (!cpu->vcpu_dirty) {
+        aehd_arch_get_registers(cpu);
+        cpu->vcpu_dirty = true;
+    }
+}
+
+void aehd_cpu_synchronize_state(CPUState *cpu)
+{
+    if (!cpu->vcpu_dirty) {
+        run_on_cpu(cpu, do_aehd_cpu_synchronize_state, RUN_ON_CPU_NULL);
+    }
+}
+
+static void do_aehd_cpu_synchronize_post_reset(CPUState *cpu,
+                                               run_on_cpu_data arg)
+{
+    aehd_arch_put_registers(cpu, AEHD_PUT_RESET_STATE);
+    cpu->vcpu_dirty = false;
+}
+
+void aehd_cpu_synchronize_post_reset(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_aehd_cpu_synchronize_post_reset, RUN_ON_CPU_NULL);
+}
+
+static void do_aehd_cpu_synchronize_post_init(CPUState *cpu,
+                                              run_on_cpu_data arg)
+{
+    aehd_arch_put_registers(cpu, AEHD_PUT_FULL_STATE);
+    cpu->vcpu_dirty = false;
+}
+
+void aehd_cpu_synchronize_post_init(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_aehd_cpu_synchronize_post_init, RUN_ON_CPU_NULL);
+}
+
+static void do_aehd_cpu_synchronize_pre_loadvm(CPUState *cpu,
+                                               run_on_cpu_data arg)
+{
+    cpu->vcpu_dirty = true;
+}
+
+void aehd_cpu_synchronize_pre_loadvm(CPUState *cpu)
+{
+    run_on_cpu(cpu, do_aehd_cpu_synchronize_pre_loadvm, RUN_ON_CPU_NULL);
+}
+
+int aehd_cpu_exec(CPUState *cpu)
+{
+    struct aehd_run *run = cpu->aehd_run;
+    int ret, run_ret;
+
+    DPRINTF("aehd_cpu_exec()\n");
+
+    if (aehd_arch_process_async_events(cpu)) {
+        cpu->exit_request = 0;
+        return EXCP_HLT;
+    }
+
+    qemu_mutex_unlock_iothread();
+
+    do {
+        MemTxAttrs attrs;
+
+        if (cpu->vcpu_dirty) {
+            aehd_arch_put_registers(cpu, AEHD_PUT_RUNTIME_STATE);
+            cpu->vcpu_dirty = false;
+        }
+
+        aehd_arch_pre_run(cpu, run);
+        if (cpu->exit_request) {
+            DPRINTF("interrupt exit requested\n");
+            /*
+             * AEHD requires us to reenter the kernel after IO exits to complete
+             * instruction emulation. This self-signal will ensure that we
+             * leave ASAP again.
+             */
+            qemu_cpu_kick(cpu);
+        }
+
+        run_ret = aehd_vcpu_ioctl(cpu, AEHD_RUN, NULL, 0, NULL, 0);
+
+        attrs = aehd_arch_post_run(cpu, run);
+
+        if (run_ret < 0) {
+            if (run_ret == -EINTR || run_ret == -EAGAIN) {
+                DPRINTF("io window exit\n");
+                ret = EXCP_INTERRUPT;
+                break;
+            }
+            fprintf(stderr, "error: aehd run failed %s\n",
+                    strerror(-run_ret));
+            ret = -1;
+            break;
+        }
+
+        switch (run->exit_reason) {
+        case AEHD_EXIT_IO:
+            DPRINTF("handle_io\n");
+            /* Called outside BQL */
+            aehd_handle_io(run->io.port, attrs,
+                          (uint8_t *)run + run->io.data_offset,
+                          run->io.direction,
+                          run->io.size,
+                          run->io.count);
+            ret = 0;
+            break;
+        case AEHD_EXIT_MMIO:
+            DPRINTF("handle_mmio\n");
+            /* Called outside BQL */
+            address_space_rw(&address_space_memory,
+                             run->mmio.phys_addr, attrs,
+                             run->mmio.data,
+                             run->mmio.len,
+                             run->mmio.is_write);
+            ret = 0;
+            break;
+        case AEHD_EXIT_IRQ_WINDOW_OPEN:
+            DPRINTF("irq_window_open\n");
+            ret = EXCP_INTERRUPT;
+            break;
+        case AEHD_EXIT_INTR:
+            DPRINTF("aehd raise event exiting\n");
+            ret = EXCP_INTERRUPT;
+            break;
+        case AEHD_EXIT_SHUTDOWN:
+            DPRINTF("shutdown\n");
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            ret = EXCP_INTERRUPT;
+            break;
+        case AEHD_EXIT_UNKNOWN:
+            fprintf(stderr, "AEHD: unknown exit, hardware reason %" PRIx64 "\n",
+                    (uint64_t)run->hw.hardware_exit_reason);
+            ret = -1;
+            break;
+        case AEHD_EXIT_INTERNAL_ERROR:
+            ret = aehd_handle_internal_error(cpu, run);
+            break;
+        case AEHD_EXIT_SYSTEM_EVENT:
+            switch (run->system_event.type) {
+            case AEHD_SYSTEM_EVENT_SHUTDOWN:
+                qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
+                ret = EXCP_INTERRUPT;
+                break;
+            case AEHD_SYSTEM_EVENT_RESET:
+                qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+                ret = EXCP_INTERRUPT;
+                break;
+            case AEHD_SYSTEM_EVENT_CRASH:
+                aehd_cpu_synchronize_state(cpu);
+                qemu_mutex_lock_iothread();
+                qemu_system_guest_panicked(cpu_get_crash_info(cpu));
+                qemu_mutex_unlock_iothread();
+                ret = 0;
+                break;
+            default:
+                DPRINTF("aehd_arch_handle_exit\n");
+                ret = aehd_arch_handle_exit(cpu, run);
+                break;
+            }
+            break;
+        default:
+            DPRINTF("aehd_arch_handle_exit\n");
+            ret = aehd_arch_handle_exit(cpu, run);
+            break;
+        }
+    } while (ret == 0);
+
+    qemu_mutex_lock_iothread();
+
+    if (ret < 0) {
+        cpu_dump_state(cpu, stderr, CPU_DUMP_CODE);
+        vm_stop(RUN_STATE_INTERNAL_ERROR);
+    }
+
+    cpu->exit_request = 0;
+    return ret;
+}
+
 int aehd_ioctl(AEHDState *s, int type, void *input, size_t input_size,
                void *output, size_t output_size)
 {
@@ -327,3 +1325,25 @@ int aehd_vcpu_ioctl(CPUState *cpu, int type, void *input, size_t input_size,
     }
     return ret;
 }
+
+static void aehd_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelClass *ac = ACCEL_CLASS(oc);
+    ac->name = "AEHD";
+    ac->init_machine = aehd_init;
+    ac->allowed = &aehd_allowed;
+}
+
+static const TypeInfo aehd_accel_type = {
+    .name = TYPE_AEHD_ACCEL,
+    .parent = TYPE_ACCEL,
+    .class_init = aehd_accel_class_init,
+    .instance_size = sizeof(AEHDState),
+};
+
+static void aehd_type_init(void)
+{
+    type_register_static(&aehd_accel_type);
+}
+
+type_init(aehd_type_init);
diff --git a/target/i386/aehd/aehd-cpu.c b/target/i386/aehd/aehd-cpu.c
new file mode 100644
index 0000000000..63ddcba85f
--- /dev/null
+++ b/target/i386/aehd/aehd-cpu.c
@@ -0,0 +1,150 @@
+/*
+ * x86 AEHD CPU type initialization
+ *
+ * Copyright 2021 SUSE LLC
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "host-cpu.h"
+#include "aehd-cpu.h"
+#include "qapi/error.h"
+#include "sysemu/sysemu.h"
+#include "hw/boards.h"
+
+#include "aehd_i386.h"
+#include "hw/core/accel-cpu.h"
+
+static bool aehd_cpu_realizefn(CPUState *cs, Error **errp)
+{
+    return host_cpu_realizefn(cs, errp);
+}
+
+static void aehd_cpu_max_instance_init(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    AEHDState *s = aehd_state;
+
+    host_cpu_max_instance_init(cpu);
+
+    env->cpuid_min_level =
+        aehd_arch_get_supported_cpuid(s, 0x0, 0, R_EAX);
+    env->cpuid_min_xlevel =
+        aehd_arch_get_supported_cpuid(s, 0x80000000, 0, R_EAX);
+    env->cpuid_min_xlevel2 =
+        aehd_arch_get_supported_cpuid(s, 0xC0000000, 0, R_EAX);
+}
+
+static void aehd_cpu_xsave_init(void)
+{
+    static bool first = true;
+    uint32_t eax, ebx, ecx, edx;
+    int i;
+
+    if (!first) {
+        return;
+    }
+    first = false;
+
+    /* x87 and SSE states are in the legacy region of the XSAVE area. */
+    x86_ext_save_areas[XSTATE_FP_BIT].offset = 0;
+    x86_ext_save_areas[XSTATE_SSE_BIT].offset = 0;
+
+    for (i = XSTATE_SSE_BIT + 1; i < XSAVE_STATE_AREA_COUNT; i++) {
+        ExtSaveArea *esa = &x86_ext_save_areas[i];
+
+        if (!esa->size) {
+            continue;
+        }
+        if ((x86_cpu_get_supported_feature_word(esa->feature, false) &
+             esa->bits) != esa->bits) {
+            continue;
+        }
+        host_cpuid(0xd, i, &eax, &ebx, &ecx, &edx);
+        if (eax != 0) {
+            assert(esa->size == eax);
+            esa->offset = ebx;
+            esa->ecx = ecx;
+        }
+    }
+}
+
+/*
+ * AEHD-specific features that are automatically added/removed
+ * from cpudef models when AEHD is enabled.
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
+ *
+ * NOTE: features can be enabled by default only if they were
+ *       already available in the oldest kernel version supported
+ *       by the AEHD accelerator (see "OS requirements" section at
+ *       docs/system/target-i386.rst)
+ */
+static PropValue aehd_default_props[] = {
+    { "x2apic", "on" },
+    { "acpi", "off" },
+    { "monitor", "off" },
+    { "svm", "off" },
+    { NULL, NULL },
+};
+
+/*
+ * Only for builtin_x86_defs models initialized with x86_register_cpudef_types.
+ */
+void x86_cpu_change_aehd_default(const char *prop, const char *value)
+{
+    PropValue *pv;
+    for (pv = aehd_default_props; pv->prop; pv++) {
+        if (!strcmp(pv->prop, prop)) {
+            pv->value = value;
+            break;
+        }
+    }
+
+    /*
+     * It is valid to call this function only for properties that
+     * are already present in the aehd_default_props table.
+     */
+    assert(pv->prop);
+}
+
+static void aehd_cpu_instance_init(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    X86CPUClass *xcc = X86_CPU_GET_CLASS(cpu);
+
+    host_cpu_instance_init(cpu);
+
+    if (xcc->model) {
+        /* Special cases not set in the X86CPUDefinition structs: */
+        x86_cpu_apply_props(cpu, aehd_default_props);
+    }
+
+    if (cpu->max_features) {
+        aehd_cpu_max_instance_init(cpu);
+    }
+
+    aehd_cpu_xsave_init();
+}
+
+static void aehd_cpu_accel_class_init(ObjectClass *oc, void *data)
+{
+    AccelCPUClass *acc = ACCEL_CPU_CLASS(oc);
+
+    acc->cpu_realizefn = aehd_cpu_realizefn;
+    acc->cpu_instance_init = aehd_cpu_instance_init;
+}
+static const TypeInfo aehd_cpu_accel_type_info = {
+    .name = ACCEL_CPU_NAME("aehd"),
+
+    .parent = TYPE_ACCEL_CPU,
+    .class_init = aehd_cpu_accel_class_init,
+    .abstract = true,
+};
+static void aehd_cpu_accel_register_types(void)
+{
+    type_register_static(&aehd_cpu_accel_type_info);
+}
+type_init(aehd_cpu_accel_register_types);
diff --git a/target/i386/aehd/aehd-cpu.h b/target/i386/aehd/aehd-cpu.h
new file mode 100644
index 0000000000..a0227c1121
--- /dev/null
+++ b/target/i386/aehd/aehd-cpu.h
@@ -0,0 +1,41 @@
+/*
+ * i386 AEHD CPU type and functions
+ *
+ *  Copyright (c) 2003 Fabrice Bellard
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef AEHD_CPU_H
+#define AEHD_CPU_H
+
+#ifdef CONFIG_AEHD
+/*
+ * Change the value of a AEHD-specific default
+ *
+ * If value is NULL, no default will be set and the original
+ * value from the CPU model table will be kept.
+ *
+ * It is valid to call this function only for properties that
+ * are already present in the aehd_default_props table.
+ */
+void x86_cpu_change_aehd_default(const char *prop, const char *value);
+
+#else /* !CONFIG_AEHD */
+
+#define x86_cpu_change_aehd_default(a, b)
+
+#endif /* CONFIG_AEHD */
+
+#endif /* AEHD_CPU_H */
diff --git a/target/i386/aehd/aehd-stub.c b/target/i386/aehd/aehd-stub.c
new file mode 100644
index 0000000000..25e0682091
--- /dev/null
+++ b/target/i386/aehd/aehd-stub.c
@@ -0,0 +1,22 @@
+/*
+ * QEMU AEHD x86 specific function stubs
+ *
+ * Copyright Linaro Limited 2012
+ *
+ * Author: Peter Maydell <peter.maydell@linaro.org>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "aehd_i386.h"
+
+#ifndef __OPTIMIZE__
+uint32_t aehd_arch_get_supported_cpuid(AEHDState *env, uint32_t function,
+                                       uint32_t index, int reg)
+{
+    abort();
+}
+#endif
diff --git a/target/i386/aehd/aehd.c b/target/i386/aehd/aehd.c
index 4890a75553..d269b42473 100644
--- a/target/i386/aehd/aehd.c
+++ b/target/i386/aehd/aehd.c
@@ -16,6 +16,7 @@
 #include "qapi/error.h"
 
 #include "cpu.h"
+#include "aehd_i386.h"
 #include "aehd_int.h"
 #include "sysemu/aehd-interface.h"
 #include "sysemu/sysemu.h"
@@ -49,6 +50,1920 @@
     do { } while (0)
 #endif
 
+/*
+ * A 4096-byte buffer can hold the 8-byte aehd_msrs header, plus
+ * 255 aehd_msr_entry structs
+ */
+#define MSR_BUF_SIZE 4096
+
+#ifndef BUS_MCEERR_AR
+#define BUS_MCEERR_AR 4
+#endif
+#ifndef BUS_MCEERR_AO
+#define BUS_MCEERR_AO 5
+#endif
+
+static bool has_msr_star;
+static bool has_msr_hsave_pa;
+static bool has_msr_tsc_aux;
+static bool has_msr_tsc_adjust;
+static bool has_msr_tsc_deadline;
+static bool has_msr_feature_control;
+static bool has_msr_misc_enable;
+static bool has_msr_smbase;
+static bool has_msr_bndcfgs;
+static bool has_msr_mtrr;
+static bool has_msr_xss;
+
+static bool has_msr_architectural_pmu;
+static uint32_t num_architectural_pmu_counters;
+
+static int has_xsave;
+static int has_xcrs;
+
+static struct aehd_cpuid *cpuid_cache;
+
+static struct aehd_cpuid *try_get_cpuid(AEHDState *s, int max)
+{
+    struct aehd_cpuid *cpuid;
+    int r, size;
+
+    size = sizeof(*cpuid) + max * sizeof(*cpuid->entries);
+    cpuid = g_malloc0(size);
+    cpuid->nent = max;
+    r = aehd_ioctl(s, AEHD_GET_SUPPORTED_CPUID,
+                   cpuid, size, cpuid, size);
+    if (r == 0 && cpuid->nent >= max) {
+        r = -E2BIG;
+    }
+    if (r < 0) {
+        if (r == -E2BIG) {
+            g_free(cpuid);
+            return NULL;
+        } else {
+            fprintf(stderr, "AEHD_GET_SUPPORTED_CPUID failed: %s\n",
+                    strerror(-r));
+            exit(1);
+        }
+    }
+    return cpuid;
+}
+
+/*
+ * Run AEHD_GET_SUPPORTED_CPUID ioctl(), allocating a buffer large enough
+ * for all entries.
+ */
+static struct aehd_cpuid *get_supported_cpuid(AEHDState *s)
+{
+    struct aehd_cpuid *cpuid;
+    int max = 1;
+
+    if (cpuid_cache != NULL) {
+        return cpuid_cache;
+    }
+    while ((cpuid = try_get_cpuid(s, max)) == NULL) {
+        max *= 2;
+    }
+    cpuid_cache = cpuid;
+    return cpuid;
+}
+
+/*
+ * Returns the value for a specific register on the cpuid entry
+ */
+static uint32_t cpuid_entry_get_reg(struct aehd_cpuid_entry *entry, int reg)
+{
+    uint32_t ret = 0;
+    switch (reg) {
+    case R_EAX:
+        ret = entry->eax;
+        break;
+    case R_EBX:
+        ret = entry->ebx;
+        break;
+    case R_ECX:
+        ret = entry->ecx;
+        break;
+    case R_EDX:
+        ret = entry->edx;
+        break;
+    }
+    return ret;
+}
+
+/*
+ * Find matching entry for function/index on aehd_cpuid struct
+ */
+static struct aehd_cpuid_entry *cpuid_find_entry(struct aehd_cpuid *cpuid,
+                                                 uint32_t function,
+                                                 uint32_t index)
+{
+    int i;
+    for (i = 0; i < cpuid->nent; ++i) {
+        if (cpuid->entries[i].function == function &&
+            cpuid->entries[i].index == index) {
+            return &cpuid->entries[i];
+        }
+    }
+    /* not found: */
+    return NULL;
+}
+
+uint32_t aehd_arch_get_supported_cpuid(AEHDState *s, uint32_t function,
+                                       uint32_t index, int reg)
+{
+    struct aehd_cpuid *cpuid;
+    uint32_t ret = 0;
+    uint32_t cpuid_1_edx;
+
+    cpuid = get_supported_cpuid(s);
+
+    struct aehd_cpuid_entry *entry = cpuid_find_entry(cpuid, function, index);
+    if (entry) {
+        ret = cpuid_entry_get_reg(entry, reg);
+    }
+
+    /* Fixups for the data returned by AEHD, below */
+
+    if (function == 1 && reg == R_ECX) {
+        /*
+         * We can set the hypervisor flag, even if AEHD does not return it on
+         * GET_SUPPORTED_CPUID
+         */
+        ret |= CPUID_EXT_HYPERVISOR;
+    } else if (function == 6 && reg == R_EAX) {
+        ret |= CPUID_6_EAX_ARAT; /* safe to allow because of emulated APIC */
+    } else if (function == 0x80000001 && reg == R_EDX) {
+        /*
+         * On Intel, aehd returns cpuid according to the Intel spec,
+         * so add missing bits according to the AMD spec:
+         */
+        cpuid_1_edx = aehd_arch_get_supported_cpuid(s, 1, 0, R_EDX);
+        ret |= cpuid_1_edx & CPUID_EXT2_AMD_ALIASES;
+    }
+
+    return ret;
+}
+
+static void cpu_update_state(void *opaque, bool running, RunState state)
+{
+    CPUX86State *env = opaque;
+
+    if (running) {
+        env->tsc_valid = false;
+    }
+}
+
+unsigned long aehd_arch_vcpu_id(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    return cpu->apic_id;
+}
+
+static Error *invtsc_mig_blocker;
+
+#define AEHD_MAX_CPUID_ENTRIES  100
+
+int aehd_arch_init_vcpu(CPUState *cs)
+{
+    struct {
+        struct aehd_cpuid cpuid;
+        struct aehd_cpuid_entry entries[AEHD_MAX_CPUID_ENTRIES];
+    } cpuid_data;
+    /*
+     * The kernel defines these structs with padding fields so there
+     * should be no extra padding in our cpuid_data struct.
+     */
+    QEMU_BUILD_BUG_ON(sizeof(cpuid_data) !=
+                      sizeof(struct aehd_cpuid) +
+                      sizeof(struct aehd_cpuid_entry) * AEHD_MAX_CPUID_ENTRIES);
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+    uint32_t limit, i, j, cpuid_i;
+    uint32_t unused;
+    struct aehd_cpuid_entry *c;
+    int r;
+    Error *local_err = NULL;
+
+    memset(&cpuid_data, 0, sizeof(cpuid_data));
+
+    cpuid_i = 0;
+
+    cpu_x86_cpuid(env, 0, 0, &limit, &unused, &unused, &unused);
+
+    for (i = 0; i <= limit; i++) {
+        if (cpuid_i == AEHD_MAX_CPUID_ENTRIES) {
+            fprintf(stderr, "unsupported level value: 0x%x\n", limit);
+            abort();
+        }
+        c = &cpuid_data.entries[cpuid_i++];
+
+        switch (i) {
+        case 2: {
+            /* Keep reading function 2 till all the input is received */
+            int times;
+
+            c->function = i;
+            c->flags = AEHD_CPUID_FLAG_STATEFUL_FUNC |
+                       AEHD_CPUID_FLAG_STATE_READ_NEXT;
+            cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
+            times = c->eax & 0xff;
+
+            for (j = 1; j < times; ++j) {
+                if (cpuid_i == AEHD_MAX_CPUID_ENTRIES) {
+                    fprintf(stderr, "cpuid_data is full, no space for "
+                            "cpuid(eax:2):eax & 0xf = 0x%x\n", times);
+                    abort();
+                }
+                c = &cpuid_data.entries[cpuid_i++];
+                c->function = i;
+                c->flags = AEHD_CPUID_FLAG_STATEFUL_FUNC;
+                cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
+            }
+            break;
+        }
+        case 4:
+        case 0xb:
+        case 0xd:
+            for (j = 0; ; j++) {
+                if (i == 0xd && j == 64) {
+                    break;
+                }
+                c->function = i;
+                c->flags = AEHD_CPUID_FLAG_SIGNIFCANT_INDEX;
+                c->index = j;
+                cpu_x86_cpuid(env, i, j, &c->eax, &c->ebx, &c->ecx, &c->edx);
+
+                if (i == 4 && c->eax == 0) {
+                    break;
+                }
+                if (i == 0xb && !(c->ecx & 0xff00)) {
+                    break;
+                }
+                if (i == 0xd && c->eax == 0) {
+                    continue;
+                }
+                if (cpuid_i == AEHD_MAX_CPUID_ENTRIES) {
+                    fprintf(stderr, "cpuid_data is full, no space for "
+                            "cpuid(eax:0x%x,ecx:0x%x)\n", i, j);
+                    abort();
+                }
+                c = &cpuid_data.entries[cpuid_i++];
+            }
+            break;
+        default:
+            c->function = i;
+            c->flags = 0;
+            cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
+            break;
+        }
+    }
+
+    if (limit >= 0x0a) {
+        uint32_t ver;
+
+        cpu_x86_cpuid(env, 0x0a, 0, &ver, &unused, &unused, &unused);
+        if ((ver & 0xff) > 0) {
+            has_msr_architectural_pmu = true;
+            num_architectural_pmu_counters = (ver & 0xff00) >> 8;
+
+            /*
+             * Shouldn't be more than 32, since that's the number of bits
+             * available in EBX to tell us _which_ counters are available.
+             * Play it safe.
+             */
+            if (num_architectural_pmu_counters > MAX_GP_COUNTERS) {
+                num_architectural_pmu_counters = MAX_GP_COUNTERS;
+            }
+        }
+    }
+
+    cpu_x86_cpuid(env, 0x80000000, 0, &limit, &unused, &unused, &unused);
+
+    for (i = 0x80000000; i <= limit; i++) {
+        if (cpuid_i == AEHD_MAX_CPUID_ENTRIES) {
+            fprintf(stderr, "unsupported xlevel value: 0x%x\n", limit);
+            abort();
+        }
+        c = &cpuid_data.entries[cpuid_i++];
+
+        c->function = i;
+        c->flags = 0;
+        cpu_x86_cpuid(env, i, 0, &c->eax, &c->ebx, &c->ecx, &c->edx);
+    }
+
+    cpuid_data.cpuid.nent = cpuid_i;
+
+    qemu_add_vm_change_state_handler(cpu_update_state, env);
+
+    c = cpuid_find_entry(&cpuid_data.cpuid, 1, 0);
+    if (c) {
+        has_msr_feature_control = !!(c->ecx & CPUID_EXT_VMX) ||
+                                  !!(c->ecx & CPUID_EXT_SMX);
+    }
+
+    c = cpuid_find_entry(&cpuid_data.cpuid, 0x80000007, 0);
+    if ((env->features[FEAT_8000_0007_EDX] & CPUID_APM_INVTSC) &&
+        invtsc_mig_blocker == NULL) {
+        error_setg(&invtsc_mig_blocker,
+                   "State blocked by non-migratable CPU device"
+                   " (invtsc flag)");
+        r = migrate_add_blocker(invtsc_mig_blocker, &local_err);
+        if (local_err) {
+            error_report_err(local_err);
+            error_free(invtsc_mig_blocker);
+            return r;
+        }
+    }
+
+    cpuid_data.cpuid.padding = 0;
+    r = aehd_vcpu_ioctl(cs, AEHD_SET_CPUID, &cpuid_data, sizeof(cpuid_data),
+                        NULL, 0);
+    if (r) {
+        return r;
+    }
+
+    if (has_xsave) {
+        env->xsave_buf = qemu_memalign(4096, env->xsave_buf_len);
+        memset(env->xsave_buf, 0, env->xsave_buf_len);
+    }
+    cpu->aehd_msr_buf = g_malloc0(MSR_BUF_SIZE);
+
+    if (env->features[FEAT_1_EDX] & CPUID_MTRR) {
+        has_msr_mtrr = true;
+    }
+    if (!(env->features[FEAT_8000_0001_EDX] & CPUID_EXT2_RDTSCP)) {
+        has_msr_tsc_aux = false;
+    }
+
+    return 0;
+}
+
+void aehd_arch_reset_vcpu(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+
+    env->exception_injected = -1;
+    env->interrupt_injected = -1;
+    env->xcr0 = 1;
+    env->mp_state = cpu_is_bsp(cpu) ? AEHD_MP_STATE_RUNNABLE :
+                                      AEHD_MP_STATE_UNINITIALIZED;
+}
+
+void aehd_arch_do_init_vcpu(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+
+    /* APs get directly into wait-for-SIPI state.  */
+    if (env->mp_state == AEHD_MP_STATE_UNINITIALIZED) {
+        env->mp_state = AEHD_MP_STATE_INIT_RECEIVED;
+    }
+}
+
+static int aehd_get_supported_msrs(AEHDState *s)
+{
+    static int aehd_supported_msrs;
+    int ret = 0;
+    unsigned long msr_list_size;
+
+    /* first time */
+    if (aehd_supported_msrs == 0) {
+        struct aehd_msr_list msr_list, *aehd_msr_list;
+
+        aehd_supported_msrs = -1;
+
+        /*
+         * Obtain MSR list from AEHD. These are the MSRs that we must
+         * save/restore
+         */
+        msr_list.nmsrs = 0;
+        ret = aehd_ioctl(s, AEHD_GET_MSR_INDEX_LIST,
+                         &msr_list, sizeof(msr_list),
+                         &msr_list, sizeof(msr_list));
+        if (ret < 0 && ret != -E2BIG) {
+            return ret;
+        }
+
+        msr_list_size = sizeof(msr_list) + msr_list.nmsrs *
+                                              sizeof(msr_list.indices[0]);
+        aehd_msr_list = g_malloc0(msr_list_size);
+
+        aehd_msr_list->nmsrs = msr_list.nmsrs;
+        ret = aehd_ioctl(s, AEHD_GET_MSR_INDEX_LIST,
+                         aehd_msr_list, msr_list_size,
+                         aehd_msr_list, msr_list_size);
+        if (ret >= 0) {
+            int i;
+
+            for (i = 0; i < aehd_msr_list->nmsrs; i++) {
+                if (aehd_msr_list->indices[i] == MSR_STAR) {
+                    has_msr_star = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_VM_HSAVE_PA) {
+                    has_msr_hsave_pa = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_TSC_AUX) {
+                    has_msr_tsc_aux = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_TSC_ADJUST) {
+                    has_msr_tsc_adjust = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_IA32_TSCDEADLINE) {
+                    has_msr_tsc_deadline = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_IA32_SMBASE) {
+                    has_msr_smbase = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_IA32_MISC_ENABLE) {
+                    has_msr_misc_enable = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_IA32_BNDCFGS) {
+                    has_msr_bndcfgs = true;
+                    continue;
+                }
+                if (aehd_msr_list->indices[i] == MSR_IA32_XSS) {
+                    has_msr_xss = true;
+                    continue;
+                }
+            }
+        }
+
+        g_free(aehd_msr_list);
+    }
+
+    return ret;
+}
+
+static Notifier smram_machine_done;
+static AEHDMemoryListener smram_listener;
+static AddressSpace smram_address_space;
+static MemoryRegion smram_as_root;
+static MemoryRegion smram_as_mem;
+
+static void register_smram_listener(Notifier *n, void *unused)
+{
+    MemoryRegion *smram =
+        (MemoryRegion *) object_resolve_path("/machine/smram", NULL);
+
+    /* Outer container... */
+    memory_region_init(&smram_as_root, OBJECT(aehd_state),
+                       "mem-container-smram", ~0ull);
+    memory_region_set_enabled(&smram_as_root, true);
+
+    /*
+     * ... with two regions inside: normal system memory with low
+     * priority, and...
+     */
+    memory_region_init_alias(&smram_as_mem, OBJECT(aehd_state), "mem-smram",
+                             get_system_memory(), 0, ~0ull);
+    memory_region_add_subregion_overlap(&smram_as_root, 0, &smram_as_mem, 0);
+    memory_region_set_enabled(&smram_as_mem, true);
+
+    if (smram) {
+        /* ... SMRAM with higher priority */
+        memory_region_add_subregion_overlap(&smram_as_root, 0, smram, 10);
+        memory_region_set_enabled(smram, true);
+    }
+
+    address_space_init(&smram_address_space, &smram_as_root, "AEHD-SMRAM");
+    aehd_memory_listener_register(aehd_state, &smram_listener,
+                                 &smram_address_space, 1);
+}
+
+int aehd_arch_init(MachineState *ms, AEHDState *s)
+{
+    /* Allows up to 16M BIOSes. */
+    uint64_t identity_base = 0xfeffc000;
+    uint64_t tss_base;
+    int ret;
+
+    has_xsave = aehd_check_extension(s, AEHD_CAP_XSAVE);
+
+    has_xcrs = aehd_check_extension(s, AEHD_CAP_XCRS);
+
+    ret = aehd_get_supported_msrs(s);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /*
+     * On older Intel CPUs, AEHD uses vm86 mode to emulate 16-bit code directly.
+     * In order to use vm86 mode, an EPT identity map and a TSS  are needed.
+     * Since these must be part of guest physical memory, we need to allocate
+     * them, both by setting their start addresses in the kernel and by
+     * creating a corresponding e820 entry. We need 4 pages before the BIOS.
+     */
+    ret = aehd_vm_ioctl(s, AEHD_SET_IDENTITY_MAP_ADDR,
+                        &identity_base, sizeof(identity_base), NULL, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* Set TSS base one page after EPT identity map. */
+    tss_base = identity_base + 0x1000;
+    ret = aehd_vm_ioctl(s, AEHD_SET_TSS_ADDR, &tss_base, sizeof(tss_base),
+                       NULL, 0);
+    if (ret < 0) {
+        return ret;
+    }
+
+    /* Tell fw_cfg to notify the BIOS to reserve the range. */
+    ret = e820_add_entry(identity_base, 0x4000, E820_RESERVED);
+    if (ret < 0) {
+        fprintf(stderr, "e820_add_entry() table is full\n");
+        return ret;
+    }
+
+    if (object_dynamic_cast(OBJECT(ms), TYPE_X86_MACHINE) &&
+        x86_machine_is_smm_enabled(X86_MACHINE(ms))) {
+        smram_machine_done.notify = register_smram_listener;
+        qemu_add_machine_init_done_notifier(&smram_machine_done);
+    }
+    return 0;
+}
+
+static void set_v8086_seg(struct aehd_segment *lhs, const SegmentCache *rhs)
+{
+    lhs->selector = rhs->selector;
+    lhs->base = rhs->base;
+    lhs->limit = rhs->limit;
+    lhs->type = 3;
+    lhs->present = 1;
+    lhs->dpl = 3;
+    lhs->db = 0;
+    lhs->s = 1;
+    lhs->l = 0;
+    lhs->g = 0;
+    lhs->avl = 0;
+    lhs->unusable = 0;
+}
+
+static void set_seg(struct aehd_segment *lhs, const SegmentCache *rhs)
+{
+    unsigned flags = rhs->flags;
+    lhs->selector = rhs->selector;
+    lhs->base = rhs->base;
+    lhs->limit = rhs->limit;
+    lhs->type = (flags >> DESC_TYPE_SHIFT) & 15;
+    lhs->present = (flags & DESC_P_MASK) != 0;
+    lhs->dpl = (flags >> DESC_DPL_SHIFT) & 3;
+    lhs->db = (flags >> DESC_B_SHIFT) & 1;
+    lhs->s = (flags & DESC_S_MASK) != 0;
+    lhs->l = (flags >> DESC_L_SHIFT) & 1;
+    lhs->g = (flags & DESC_G_MASK) != 0;
+    lhs->avl = (flags & DESC_AVL_MASK) != 0;
+    lhs->unusable = !lhs->present;
+    lhs->padding = 0;
+}
+
+static void get_seg(SegmentCache *lhs, const struct aehd_segment *rhs)
+{
+    lhs->selector = rhs->selector;
+    lhs->base = rhs->base;
+    lhs->limit = rhs->limit;
+    if (rhs->unusable) {
+        lhs->flags = 0;
+    } else {
+        lhs->flags = (rhs->type << DESC_TYPE_SHIFT) |
+                     (rhs->present * DESC_P_MASK) |
+                     (rhs->dpl << DESC_DPL_SHIFT) |
+                     (rhs->db << DESC_B_SHIFT) |
+                     (rhs->s * DESC_S_MASK) |
+                     (rhs->l << DESC_L_SHIFT) |
+                     (rhs->g * DESC_G_MASK) |
+                     (rhs->avl * DESC_AVL_MASK);
+    }
+}
+
+static void aehd_getput_reg(__u64 *aehd_reg, target_ulong *qemu_reg, int set)
+{
+    if (set) {
+        *aehd_reg = *qemu_reg;
+    } else {
+        *qemu_reg = *aehd_reg;
+    }
+}
+
+static int aehd_getput_regs(X86CPU *cpu, int set)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_regs regs;
+    int ret = 0;
+
+    if (!set) {
+        ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_REGS, NULL, 0,
+                              &regs, sizeof(regs));
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    aehd_getput_reg(&regs.rax, &env->regs[R_EAX], set);
+    aehd_getput_reg(&regs.rbx, &env->regs[R_EBX], set);
+    aehd_getput_reg(&regs.rcx, &env->regs[R_ECX], set);
+    aehd_getput_reg(&regs.rdx, &env->regs[R_EDX], set);
+    aehd_getput_reg(&regs.rsi, &env->regs[R_ESI], set);
+    aehd_getput_reg(&regs.rdi, &env->regs[R_EDI], set);
+    aehd_getput_reg(&regs.rsp, &env->regs[R_ESP], set);
+    aehd_getput_reg(&regs.rbp, &env->regs[R_EBP], set);
+#ifdef TARGET_X86_64
+    aehd_getput_reg(&regs.r8, &env->regs[8], set);
+    aehd_getput_reg(&regs.r9, &env->regs[9], set);
+    aehd_getput_reg(&regs.r10, &env->regs[10], set);
+    aehd_getput_reg(&regs.r11, &env->regs[11], set);
+    aehd_getput_reg(&regs.r12, &env->regs[12], set);
+    aehd_getput_reg(&regs.r13, &env->regs[13], set);
+    aehd_getput_reg(&regs.r14, &env->regs[14], set);
+    aehd_getput_reg(&regs.r15, &env->regs[15], set);
+#endif
+
+    aehd_getput_reg(&regs.rflags, &env->eflags, set);
+    aehd_getput_reg(&regs.rip, &env->eip, set);
+
+    if (set) {
+        ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_REGS, &regs, sizeof(regs),
+                              NULL, 0);
+    }
+
+    return ret;
+}
+
+static int aehd_put_fpu(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_fpu fpu;
+    int i;
+
+    memset(&fpu, 0, sizeof fpu);
+    fpu.fsw = env->fpus & ~(7 << 11);
+    fpu.fsw |= (env->fpstt & 7) << 11;
+    fpu.fcw = env->fpuc;
+    fpu.last_opcode = env->fpop;
+    fpu.last_ip = env->fpip;
+    fpu.last_dp = env->fpdp;
+    for (i = 0; i < 8; ++i) {
+        fpu.ftwx |= (!env->fptags[i]) << i;
+    }
+    memcpy(fpu.fpr, env->fpregs, sizeof env->fpregs);
+    for (i = 0; i < CPU_NB_REGS; i++) {
+        stq_p(&fpu.xmm[i][0], env->xmm_regs[i].ZMM_Q(0));
+        stq_p(&fpu.xmm[i][8], env->xmm_regs[i].ZMM_Q(1));
+    }
+    fpu.mxcsr = env->mxcsr;
+
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_FPU, &fpu, sizeof(fpu), NULL, 0);
+}
+
+static int aehd_put_xsave(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    void *xsave = env->xsave_buf;
+
+    if (!has_xsave) {
+        return aehd_put_fpu(cpu);
+    }
+    x86_cpu_xsave_all_areas(cpu, xsave, env->xsave_buf_len);
+
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_XSAVE, xsave, sizeof(*xsave),
+                           NULL, 0);
+}
+
+static int aehd_put_xcrs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_xcrs xcrs = {};
+
+    if (!has_xcrs) {
+        return 0;
+    }
+
+    xcrs.nr_xcrs = 1;
+    xcrs.flags = 0;
+    xcrs.xcrs[0].xcr = 0;
+    xcrs.xcrs[0].value = env->xcr0;
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_XCRS, &xcrs, sizeof(xcrs),
+                           NULL, 0);
+}
+
+static int aehd_put_sregs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_sregs sregs;
+
+    memset(sregs.interrupt_bitmap, 0, sizeof(sregs.interrupt_bitmap));
+    if (env->interrupt_injected >= 0) {
+        sregs.interrupt_bitmap[env->interrupt_injected / 64] |=
+                (uint64_t)1 << (env->interrupt_injected % 64);
+    }
+
+    if ((env->eflags & VM_MASK)) {
+        set_v8086_seg(&sregs.cs, &env->segs[R_CS]);
+        set_v8086_seg(&sregs.ds, &env->segs[R_DS]);
+        set_v8086_seg(&sregs.es, &env->segs[R_ES]);
+        set_v8086_seg(&sregs.fs, &env->segs[R_FS]);
+        set_v8086_seg(&sregs.gs, &env->segs[R_GS]);
+        set_v8086_seg(&sregs.ss, &env->segs[R_SS]);
+    } else {
+        set_seg(&sregs.cs, &env->segs[R_CS]);
+        set_seg(&sregs.ds, &env->segs[R_DS]);
+        set_seg(&sregs.es, &env->segs[R_ES]);
+        set_seg(&sregs.fs, &env->segs[R_FS]);
+        set_seg(&sregs.gs, &env->segs[R_GS]);
+        set_seg(&sregs.ss, &env->segs[R_SS]);
+    }
+
+    set_seg(&sregs.tr, &env->tr);
+    set_seg(&sregs.ldt, &env->ldt);
+
+    sregs.idt.limit = env->idt.limit;
+    sregs.idt.base = env->idt.base;
+    memset(sregs.idt.padding, 0, sizeof sregs.idt.padding);
+    sregs.gdt.limit = env->gdt.limit;
+    sregs.gdt.base = env->gdt.base;
+    memset(sregs.gdt.padding, 0, sizeof sregs.gdt.padding);
+
+    sregs.cr0 = env->cr[0];
+    sregs.cr2 = env->cr[2];
+    sregs.cr3 = env->cr[3];
+    sregs.cr4 = env->cr[4];
+
+    sregs.cr8 = cpu_get_apic_tpr(cpu->apic_state);
+    sregs.apic_base = cpu_get_apic_base(cpu->apic_state);
+
+    sregs.efer = env->efer;
+
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_SREGS, &sregs, sizeof(sregs),
+                           NULL, 0);
+}
+
+static void aehd_msr_buf_reset(X86CPU *cpu)
+{
+    memset(cpu->aehd_msr_buf, 0, MSR_BUF_SIZE);
+}
+
+static void aehd_msr_entry_add(X86CPU *cpu, uint32_t index, uint64_t value)
+{
+    struct aehd_msrs *msrs = cpu->aehd_msr_buf;
+    void *limit = ((void *)msrs) + MSR_BUF_SIZE;
+    struct aehd_msr_entry *entry = &msrs->entries[msrs->nmsrs];
+
+    assert((void *)(entry + 1) <= limit);
+
+    entry->index = index;
+    entry->reserved = 0;
+    entry->data = value;
+    msrs->nmsrs++;
+}
+
+static int aehd_put_tscdeadline_msr(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    int ret;
+
+    if (!has_msr_tsc_deadline) {
+        return 0;
+    }
+
+    aehd_msr_buf_reset(cpu);
+    aehd_msr_entry_add(cpu, MSR_IA32_TSCDEADLINE, env->tsc_deadline);
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_MSRS, cpu->aehd_msr_buf,
+                          sizeof(struct aehd_msrs) +
+                          sizeof(struct aehd_msr_entry),
+                          cpu->aehd_msr_buf, sizeof(struct aehd_msrs));
+    if (ret < 0) {
+        return ret;
+    } else {
+        ret = cpu->aehd_msr_buf->nmsrs;
+    }
+
+    assert(ret == 1);
+    return 0;
+}
+
+/*
+ * Provide a separate write service for the feature control MSR in order to
+ * kick the VCPU out of VMXON or even guest mode on reset. This has to be done
+ * before writing any other state because forcibly leaving nested mode
+ * invalidates the VCPU state.
+ */
+static int aehd_put_msr_feature_control(X86CPU *cpu)
+{
+    int ret;
+
+    if (!has_msr_feature_control) {
+        return 0;
+    }
+
+    aehd_msr_buf_reset(cpu);
+    aehd_msr_entry_add(cpu, MSR_IA32_FEATURE_CONTROL,
+                      cpu->env.msr_ia32_feature_control);
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_MSRS, cpu->aehd_msr_buf,
+                          sizeof(struct aehd_msrs) +
+                          sizeof(struct aehd_msr_entry),
+                          cpu->aehd_msr_buf, sizeof(struct aehd_msrs));
+    if (ret < 0) {
+        return ret;
+    } else {
+        ret = cpu->aehd_msr_buf->nmsrs;
+    }
+
+    assert(ret == 1);
+    return 0;
+}
+
+static int aehd_put_msrs(X86CPU *cpu, int level)
+{
+    CPUX86State *env = &cpu->env;
+    int i;
+    int ret;
+
+    aehd_msr_buf_reset(cpu);
+
+    aehd_msr_entry_add(cpu, MSR_IA32_SYSENTER_CS, env->sysenter_cs);
+    aehd_msr_entry_add(cpu, MSR_IA32_SYSENTER_ESP, env->sysenter_esp);
+    aehd_msr_entry_add(cpu, MSR_IA32_SYSENTER_EIP, env->sysenter_eip);
+    aehd_msr_entry_add(cpu, MSR_PAT, env->pat);
+    if (has_msr_star) {
+        aehd_msr_entry_add(cpu, MSR_STAR, env->star);
+    }
+    if (has_msr_hsave_pa) {
+        aehd_msr_entry_add(cpu, MSR_VM_HSAVE_PA, env->vm_hsave);
+    }
+    if (has_msr_tsc_aux) {
+        aehd_msr_entry_add(cpu, MSR_TSC_AUX, env->tsc_aux);
+    }
+    if (has_msr_tsc_adjust) {
+        aehd_msr_entry_add(cpu, MSR_TSC_ADJUST, env->tsc_adjust);
+    }
+    if (has_msr_misc_enable) {
+        aehd_msr_entry_add(cpu, MSR_IA32_MISC_ENABLE,
+                          env->msr_ia32_misc_enable);
+    }
+    if (has_msr_smbase) {
+        aehd_msr_entry_add(cpu, MSR_IA32_SMBASE, env->smbase);
+    }
+    if (has_msr_bndcfgs) {
+        aehd_msr_entry_add(cpu, MSR_IA32_BNDCFGS, env->msr_bndcfgs);
+    }
+    if (has_msr_xss) {
+        aehd_msr_entry_add(cpu, MSR_IA32_XSS, env->xss);
+    }
+#ifdef TARGET_X86_64
+    aehd_msr_entry_add(cpu, MSR_CSTAR, env->cstar);
+    aehd_msr_entry_add(cpu, MSR_KERNELGSBASE, env->kernelgsbase);
+    aehd_msr_entry_add(cpu, MSR_FMASK, env->fmask);
+    aehd_msr_entry_add(cpu, MSR_LSTAR, env->lstar);
+#endif
+    /*
+     * The following MSRs have side effects on the guest or are too heavy
+     * for normal writeback. Limit them to reset or full state updates.
+     */
+    if (level >= AEHD_PUT_RESET_STATE) {
+        aehd_msr_entry_add(cpu, MSR_IA32_TSC, env->tsc);
+        if (has_msr_architectural_pmu) {
+            /* Stop the counter.  */
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR_CTRL, 0);
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_CTRL, 0);
+
+            /* Set the counter values.  */
+            for (i = 0; i < MAX_FIXED_COUNTERS; i++) {
+                aehd_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR0 + i,
+                                   env->msr_fixed_counters[i]);
+            }
+            for (i = 0; i < num_architectural_pmu_counters; i++) {
+                aehd_msr_entry_add(cpu, MSR_P6_PERFCTR0 + i,
+                                   env->msr_gp_counters[i]);
+                aehd_msr_entry_add(cpu, MSR_P6_EVNTSEL0 + i,
+                                   env->msr_gp_evtsel[i]);
+            }
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_STATUS,
+                               env->msr_global_status);
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_OVF_CTRL,
+                               env->msr_global_ovf_ctrl);
+
+            /* Now start the PMU.  */
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR_CTRL,
+                               env->msr_fixed_ctr_ctrl);
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_CTRL,
+                               env->msr_global_ctrl);
+        }
+        if (has_msr_mtrr) {
+            uint64_t phys_mask = MAKE_64BIT_MASK(0, cpu->phys_bits);
+
+            aehd_msr_entry_add(cpu, MSR_MTRRdefType, env->mtrr_deftype);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix64K_00000, env->mtrr_fixed[0]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix16K_80000, env->mtrr_fixed[1]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix16K_A0000, env->mtrr_fixed[2]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_C0000, env->mtrr_fixed[3]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_C8000, env->mtrr_fixed[4]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_D0000, env->mtrr_fixed[5]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_D8000, env->mtrr_fixed[6]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_E0000, env->mtrr_fixed[7]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_E8000, env->mtrr_fixed[8]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_F0000, env->mtrr_fixed[9]);
+            aehd_msr_entry_add(cpu, MSR_MTRRfix4K_F8000, env->mtrr_fixed[10]);
+            for (i = 0; i < MSR_MTRRcap_VCNT; i++) {
+                /*
+                 * The CPU GPs if we write to a bit above the physical limit of
+                 * the host CPU (and AEHD emulates that)
+                 */
+                uint64_t mask = env->mtrr_var[i].mask;
+                mask &= phys_mask;
+
+                aehd_msr_entry_add(cpu, MSR_MTRRphysBase(i),
+                                   env->mtrr_var[i].base);
+                aehd_msr_entry_add(cpu, MSR_MTRRphysMask(i), mask);
+            }
+        }
+
+        /*
+         * Note: MSR_IA32_FEATURE_CONTROL is written separately, see
+         *       aehd_put_msr_feature_control.
+         */
+    }
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_MSRS, cpu->aehd_msr_buf,
+                          sizeof(struct aehd_msrs) + cpu->aehd_msr_buf->nmsrs *
+                          sizeof(struct  aehd_msr_entry),
+                          cpu->aehd_msr_buf, sizeof(struct aehd_msrs));
+    if (ret < 0) {
+        return ret;
+    }
+
+    return 0;
+}
+
+
+static int aehd_get_fpu(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_fpu fpu;
+    int i, ret;
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_FPU, NULL, 0, &fpu, sizeof(fpu));
+    if (ret < 0) {
+        return ret;
+    }
+
+    env->fpstt = (fpu.fsw >> 11) & 7;
+    env->fpus = fpu.fsw;
+    env->fpuc = fpu.fcw;
+    env->fpop = fpu.last_opcode;
+    env->fpip = fpu.last_ip;
+    env->fpdp = fpu.last_dp;
+    for (i = 0; i < 8; ++i) {
+        env->fptags[i] = !((fpu.ftwx >> i) & 1);
+    }
+    memcpy(env->fpregs, fpu.fpr, sizeof env->fpregs);
+    for (i = 0; i < CPU_NB_REGS; i++) {
+        env->xmm_regs[i].ZMM_Q(0) = ldq_p(&fpu.xmm[i][0]);
+        env->xmm_regs[i].ZMM_Q(1) = ldq_p(&fpu.xmm[i][8]);
+    }
+    env->mxcsr = fpu.mxcsr;
+
+    return 0;
+}
+
+static int aehd_get_xsave(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    void *xsave = env->xsave_buf;
+    int ret;
+
+    if (!has_xsave) {
+        return aehd_get_fpu(cpu);
+    }
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_XSAVE, NULL, 0,
+                          xsave, sizeof(*xsave));
+    if (ret < 0) {
+        return ret;
+    }
+    x86_cpu_xrstor_all_areas(cpu, xsave, env->xsave_buf_len);
+
+    return 0;
+}
+
+static int aehd_get_xcrs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    int i, ret;
+    struct aehd_xcrs xcrs;
+
+    if (!has_xcrs) {
+        return 0;
+    }
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_XCRS, NULL, 0,
+                          &xcrs, sizeof(xcrs));
+    if (ret < 0) {
+        return ret;
+    }
+
+    for (i = 0; i < xcrs.nr_xcrs; i++) {
+        /* Only support xcr0 now */
+        if (xcrs.xcrs[i].xcr == 0) {
+            env->xcr0 = xcrs.xcrs[i].value;
+            break;
+        }
+    }
+    return 0;
+}
+
+static int aehd_get_sregs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_sregs sregs;
+    uint32_t hflags;
+    int bit, i, ret;
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_SREGS, NULL, 0,
+                          &sregs, sizeof(sregs));
+    if (ret < 0) {
+        return ret;
+    }
+
+    /*
+     * There can only be one pending IRQ set in the bitmap at a time, so try
+     * to find it and save its number instead (-1 for none).
+     */
+    env->interrupt_injected = -1;
+    for (i = 0; i < ARRAY_SIZE(sregs.interrupt_bitmap); i++) {
+        if (sregs.interrupt_bitmap[i]) {
+            bit = ctz64(sregs.interrupt_bitmap[i]);
+            env->interrupt_injected = i * 64 + bit;
+            break;
+        }
+    }
+
+    get_seg(&env->segs[R_CS], &sregs.cs);
+    get_seg(&env->segs[R_DS], &sregs.ds);
+    get_seg(&env->segs[R_ES], &sregs.es);
+    get_seg(&env->segs[R_FS], &sregs.fs);
+    get_seg(&env->segs[R_GS], &sregs.gs);
+    get_seg(&env->segs[R_SS], &sregs.ss);
+
+    get_seg(&env->tr, &sregs.tr);
+    get_seg(&env->ldt, &sregs.ldt);
+
+    env->idt.limit = sregs.idt.limit;
+    env->idt.base = sregs.idt.base;
+    env->gdt.limit = sregs.gdt.limit;
+    env->gdt.base = sregs.gdt.base;
+
+    env->cr[0] = sregs.cr0;
+    env->cr[2] = sregs.cr2;
+    env->cr[3] = sregs.cr3;
+    env->cr[4] = sregs.cr4;
+
+    env->efer = sregs.efer;
+
+    /* changes to apic base and cr8/tpr are read back via aehd_arch_post_run */
+
+#define HFLAG_COPY_MASK \
+    (~(HF_CPL_MASK | HF_PE_MASK | HF_MP_MASK | HF_EM_MASK | \
+       HF_TS_MASK | HF_TF_MASK | HF_VM_MASK | HF_IOPL_MASK | \
+       HF_OSFXSR_MASK | HF_LMA_MASK | HF_CS32_MASK | \
+       HF_SS32_MASK | HF_CS64_MASK | HF_ADDSEG_MASK))
+
+    hflags = env->hflags & HFLAG_COPY_MASK;
+    hflags |= (env->segs[R_SS].flags >> DESC_DPL_SHIFT) & HF_CPL_MASK;
+    hflags |= (env->cr[0] & CR0_PE_MASK) << (HF_PE_SHIFT - CR0_PE_SHIFT);
+    hflags |= (env->cr[0] << (HF_MP_SHIFT - CR0_MP_SHIFT)) &
+                (HF_MP_MASK | HF_EM_MASK | HF_TS_MASK);
+    hflags |= (env->eflags & (HF_TF_MASK | HF_VM_MASK | HF_IOPL_MASK));
+
+    if (env->cr[4] & CR4_OSFXSR_MASK) {
+        hflags |= HF_OSFXSR_MASK;
+    }
+
+    if (env->efer & MSR_EFER_LMA) {
+        hflags |= HF_LMA_MASK;
+    }
+
+    if ((hflags & HF_LMA_MASK) && (env->segs[R_CS].flags & DESC_L_MASK)) {
+        hflags |= HF_CS32_MASK | HF_SS32_MASK | HF_CS64_MASK;
+    } else {
+        hflags |= (env->segs[R_CS].flags & DESC_B_MASK) >>
+                    (DESC_B_SHIFT - HF_CS32_SHIFT);
+        hflags |= (env->segs[R_SS].flags & DESC_B_MASK) >>
+                    (DESC_B_SHIFT - HF_SS32_SHIFT);
+        if (!(env->cr[0] & CR0_PE_MASK) || (env->eflags & VM_MASK) ||
+            !(hflags & HF_CS32_MASK)) {
+            hflags |= HF_ADDSEG_MASK;
+        } else {
+            hflags |= ((env->segs[R_DS].base | env->segs[R_ES].base |
+                        env->segs[R_SS].base) != 0) << HF_ADDSEG_SHIFT;
+        }
+    }
+    env->hflags = hflags;
+
+    return 0;
+}
+
+static int aehd_get_msrs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_msr_entry *msrs = cpu->aehd_msr_buf->entries;
+    int ret, i;
+    uint64_t mtrr_top_bits;
+    uint64_t bufsize;
+
+    aehd_msr_buf_reset(cpu);
+
+    aehd_msr_entry_add(cpu, MSR_IA32_SYSENTER_CS, 0);
+    aehd_msr_entry_add(cpu, MSR_IA32_SYSENTER_ESP, 0);
+    aehd_msr_entry_add(cpu, MSR_IA32_SYSENTER_EIP, 0);
+    aehd_msr_entry_add(cpu, MSR_PAT, 0);
+    if (has_msr_star) {
+        aehd_msr_entry_add(cpu, MSR_STAR, 0);
+    }
+    if (has_msr_hsave_pa) {
+        aehd_msr_entry_add(cpu, MSR_VM_HSAVE_PA, 0);
+    }
+    if (has_msr_tsc_aux) {
+        aehd_msr_entry_add(cpu, MSR_TSC_AUX, 0);
+    }
+    if (has_msr_tsc_adjust) {
+        aehd_msr_entry_add(cpu, MSR_TSC_ADJUST, 0);
+    }
+    if (has_msr_tsc_deadline) {
+        aehd_msr_entry_add(cpu, MSR_IA32_TSCDEADLINE, 0);
+    }
+    if (has_msr_misc_enable) {
+        aehd_msr_entry_add(cpu, MSR_IA32_MISC_ENABLE, 0);
+    }
+    if (has_msr_smbase) {
+        aehd_msr_entry_add(cpu, MSR_IA32_SMBASE, 0);
+    }
+    if (has_msr_feature_control) {
+        aehd_msr_entry_add(cpu, MSR_IA32_FEATURE_CONTROL, 0);
+    }
+    if (has_msr_bndcfgs) {
+        aehd_msr_entry_add(cpu, MSR_IA32_BNDCFGS, 0);
+    }
+    if (has_msr_xss) {
+        aehd_msr_entry_add(cpu, MSR_IA32_XSS, 0);
+    }
+
+
+    if (!env->tsc_valid) {
+        aehd_msr_entry_add(cpu, MSR_IA32_TSC, 0);
+        env->tsc_valid = !runstate_is_running();
+    }
+
+#ifdef TARGET_X86_64
+    aehd_msr_entry_add(cpu, MSR_CSTAR, 0);
+    aehd_msr_entry_add(cpu, MSR_KERNELGSBASE, 0);
+    aehd_msr_entry_add(cpu, MSR_FMASK, 0);
+    aehd_msr_entry_add(cpu, MSR_LSTAR, 0);
+#endif
+    if (has_msr_architectural_pmu) {
+        aehd_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR_CTRL, 0);
+        aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_CTRL, 0);
+        aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_STATUS, 0);
+        aehd_msr_entry_add(cpu, MSR_CORE_PERF_GLOBAL_OVF_CTRL, 0);
+        for (i = 0; i < MAX_FIXED_COUNTERS; i++) {
+            aehd_msr_entry_add(cpu, MSR_CORE_PERF_FIXED_CTR0 + i, 0);
+        }
+        for (i = 0; i < num_architectural_pmu_counters; i++) {
+            aehd_msr_entry_add(cpu, MSR_P6_PERFCTR0 + i, 0);
+            aehd_msr_entry_add(cpu, MSR_P6_EVNTSEL0 + i, 0);
+        }
+    }
+
+    if (has_msr_mtrr) {
+        aehd_msr_entry_add(cpu, MSR_MTRRdefType, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix64K_00000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix16K_80000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix16K_A0000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_C0000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_C8000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_D0000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_D8000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_E0000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_E8000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_F0000, 0);
+        aehd_msr_entry_add(cpu, MSR_MTRRfix4K_F8000, 0);
+        for (i = 0; i < MSR_MTRRcap_VCNT; i++) {
+            aehd_msr_entry_add(cpu, MSR_MTRRphysBase(i), 0);
+            aehd_msr_entry_add(cpu, MSR_MTRRphysMask(i), 0);
+        }
+    }
+
+    bufsize = sizeof(struct aehd_msrs) + cpu->aehd_msr_buf->nmsrs *
+              sizeof(struct aehd_msr_entry);
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_MSRS, cpu->aehd_msr_buf, bufsize,
+                          cpu->aehd_msr_buf, bufsize);
+    if (ret < 0) {
+        return ret;
+    } else {
+        ret = cpu->aehd_msr_buf->nmsrs;
+    }
+
+    /*
+     * MTRR masks: Each mask consists of 5 parts
+     * a  10..0: must be zero
+     * b  11   : valid bit
+     * c n-1.12: actual mask bits
+     * d  51..n: reserved must be zero
+     * e  63.52: reserved must be zero
+     *
+     * 'n' is the number of physical bits supported by the CPU and is
+     * apparently always <= 52.   We know our 'n' but don't know what
+     * the destinations 'n' is; it might be smaller, in which case
+     * it masks (c) on loading. It might be larger, in which case
+     * we fill 'd' so that d..c is consistent irrespetive of the 'n'
+     * we're migrating to.
+     */
+
+    if (cpu->fill_mtrr_mask) {
+        QEMU_BUILD_BUG_ON(TARGET_PHYS_ADDR_SPACE_BITS > 52);
+        assert(cpu->phys_bits <= TARGET_PHYS_ADDR_SPACE_BITS);
+        mtrr_top_bits = MAKE_64BIT_MASK(cpu->phys_bits, 52 - cpu->phys_bits);
+    } else {
+        mtrr_top_bits = 0;
+    }
+
+    for (i = 0; i < ret; i++) {
+        uint32_t index = msrs[i].index;
+        switch (index) {
+        case MSR_IA32_SYSENTER_CS:
+            env->sysenter_cs = msrs[i].data;
+            break;
+        case MSR_IA32_SYSENTER_ESP:
+            env->sysenter_esp = msrs[i].data;
+            break;
+        case MSR_IA32_SYSENTER_EIP:
+            env->sysenter_eip = msrs[i].data;
+            break;
+        case MSR_PAT:
+            env->pat = msrs[i].data;
+            break;
+        case MSR_STAR:
+            env->star = msrs[i].data;
+            break;
+#ifdef TARGET_X86_64
+        case MSR_CSTAR:
+            env->cstar = msrs[i].data;
+            break;
+        case MSR_KERNELGSBASE:
+            env->kernelgsbase = msrs[i].data;
+            break;
+        case MSR_FMASK:
+            env->fmask = msrs[i].data;
+            break;
+        case MSR_LSTAR:
+            env->lstar = msrs[i].data;
+            break;
+#endif
+        case MSR_IA32_TSC:
+            env->tsc = msrs[i].data;
+            break;
+        case MSR_TSC_AUX:
+            env->tsc_aux = msrs[i].data;
+            break;
+        case MSR_TSC_ADJUST:
+            env->tsc_adjust = msrs[i].data;
+            break;
+        case MSR_IA32_TSCDEADLINE:
+            env->tsc_deadline = msrs[i].data;
+            break;
+        case MSR_VM_HSAVE_PA:
+            env->vm_hsave = msrs[i].data;
+            break;
+        case MSR_MCG_STATUS:
+            env->mcg_status = msrs[i].data;
+            break;
+        case MSR_MCG_CTL:
+            env->mcg_ctl = msrs[i].data;
+            break;
+        case MSR_MCG_EXT_CTL:
+            env->mcg_ext_ctl = msrs[i].data;
+            break;
+        case MSR_IA32_MISC_ENABLE:
+            env->msr_ia32_misc_enable = msrs[i].data;
+            break;
+        case MSR_IA32_SMBASE:
+            env->smbase = msrs[i].data;
+            break;
+        case MSR_IA32_FEATURE_CONTROL:
+            env->msr_ia32_feature_control = msrs[i].data;
+            break;
+        case MSR_IA32_BNDCFGS:
+            env->msr_bndcfgs = msrs[i].data;
+            break;
+        case MSR_IA32_XSS:
+            env->xss = msrs[i].data;
+            break;
+        default:
+            if (msrs[i].index >= MSR_MC0_CTL &&
+                msrs[i].index < MSR_MC0_CTL + (env->mcg_cap & 0xff) * 4) {
+                env->mce_banks[msrs[i].index - MSR_MC0_CTL] = msrs[i].data;
+            }
+            break;
+        case MSR_CORE_PERF_FIXED_CTR_CTRL:
+            env->msr_fixed_ctr_ctrl = msrs[i].data;
+            break;
+        case MSR_CORE_PERF_GLOBAL_CTRL:
+            env->msr_global_ctrl = msrs[i].data;
+            break;
+        case MSR_CORE_PERF_GLOBAL_STATUS:
+            env->msr_global_status = msrs[i].data;
+            break;
+        case MSR_CORE_PERF_GLOBAL_OVF_CTRL:
+            env->msr_global_ovf_ctrl = msrs[i].data;
+            break;
+        case MSR_CORE_PERF_FIXED_CTR0 ...
+             MSR_CORE_PERF_FIXED_CTR0 + MAX_FIXED_COUNTERS - 1:
+            uint32_t offset = index - MSR_CORE_PERF_FIXED_CTR0;
+            env->msr_fixed_counters[offset] = msrs[i].data;
+            break;
+        case MSR_P6_PERFCTR0 ... MSR_P6_PERFCTR0 + MAX_GP_COUNTERS - 1:
+            env->msr_gp_counters[index - MSR_P6_PERFCTR0] = msrs[i].data;
+            break;
+        case MSR_P6_EVNTSEL0 ... MSR_P6_EVNTSEL0 + MAX_GP_COUNTERS - 1:
+            env->msr_gp_evtsel[index - MSR_P6_EVNTSEL0] = msrs[i].data;
+            break;
+        case MSR_MTRRdefType:
+            env->mtrr_deftype = msrs[i].data;
+            break;
+        case MSR_MTRRfix64K_00000:
+            env->mtrr_fixed[0] = msrs[i].data;
+            break;
+        case MSR_MTRRfix16K_80000:
+            env->mtrr_fixed[1] = msrs[i].data;
+            break;
+        case MSR_MTRRfix16K_A0000:
+            env->mtrr_fixed[2] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_C0000:
+            env->mtrr_fixed[3] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_C8000:
+            env->mtrr_fixed[4] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_D0000:
+            env->mtrr_fixed[5] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_D8000:
+            env->mtrr_fixed[6] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_E0000:
+            env->mtrr_fixed[7] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_E8000:
+            env->mtrr_fixed[8] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_F0000:
+            env->mtrr_fixed[9] = msrs[i].data;
+            break;
+        case MSR_MTRRfix4K_F8000:
+            env->mtrr_fixed[10] = msrs[i].data;
+            break;
+        case MSR_MTRRphysBase(0) ... MSR_MTRRphysMask(MSR_MTRRcap_VCNT - 1):
+            if (index & 1) {
+                env->mtrr_var[MSR_MTRRphysIndex(index)].mask = msrs[i].data |
+                                                               mtrr_top_bits;
+            } else {
+                env->mtrr_var[MSR_MTRRphysIndex(index)].base = msrs[i].data;
+            }
+            break;
+        }
+    }
+
+    return 0;
+}
+
+static int aehd_put_mp_state(X86CPU *cpu)
+{
+    struct aehd_mp_state mp_state = { .mp_state = cpu->env.mp_state };
+
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_MP_STATE,
+                           &mp_state, sizeof(mp_state), NULL, 0);
+}
+
+static int aehd_get_mp_state(X86CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    CPUX86State *env = &cpu->env;
+    struct aehd_mp_state mp_state;
+    int ret;
+
+    ret = aehd_vcpu_ioctl(cs, AEHD_GET_MP_STATE, NULL, 0,
+                          &mp_state, sizeof(mp_state));
+    if (ret < 0) {
+        return ret;
+    }
+    env->mp_state = mp_state.mp_state;
+    cs->halted = (mp_state.mp_state == AEHD_MP_STATE_HALTED);
+    return 0;
+}
+
+static int aehd_get_apic(X86CPU *cpu)
+{
+    DeviceState *apic = cpu->apic_state;
+    struct aehd_lapic_state gapic;
+    int ret;
+
+    if (apic) {
+        ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_LAPIC, NULL, 0,
+                              &gapic, sizeof(gapic));
+        if (ret < 0) {
+            return ret;
+        }
+
+        aehd_get_apic_state(apic, &gapic);
+    }
+    return 0;
+}
+
+static int aehd_put_apic(X86CPU *cpu)
+{
+    DeviceState *apic = cpu->apic_state;
+    struct aehd_lapic_state gapic;
+
+    if (apic) {
+        aehd_put_apic_state(apic, &gapic);
+
+        return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_LAPIC,
+                               &gapic, sizeof(gapic), NULL, 0);
+    }
+    return 0;
+}
+
+static int aehd_put_vcpu_events(X86CPU *cpu, int level)
+{
+    CPUState *cs = CPU(cpu);
+    CPUX86State *env = &cpu->env;
+    struct aehd_vcpu_events events = {};
+
+    events.exception.injected = env->exception_injected;
+    events.exception.nr = env->exception_nr;
+    events.exception.has_error_code = env->has_error_code;
+    events.exception.error_code = env->error_code;
+
+    events.interrupt.injected = (env->interrupt_injected >= 0);
+    events.interrupt.nr = env->interrupt_injected;
+    events.interrupt.soft = env->soft_interrupt;
+
+    events.nmi.injected = env->nmi_injected;
+    events.nmi.pending = env->nmi_pending;
+    events.nmi.masked = !!(env->hflags2 & HF2_NMI_MASK);
+
+    events.sipi_vector = env->sipi_vector;
+
+    if (has_msr_smbase) {
+        events.smi.smm = !!(env->hflags & HF_SMM_MASK);
+        events.smi.smm_inside_nmi = !!(env->hflags2 & HF2_SMM_INSIDE_NMI_MASK);
+        /*
+         * As soon as these are moved to the kernel, remove them
+         * from cs->interrupt_request.
+         */
+        events.smi.pending = cs->interrupt_request & CPU_INTERRUPT_SMI;
+        events.smi.latched_init = cs->interrupt_request & CPU_INTERRUPT_INIT;
+        cs->interrupt_request &= ~(CPU_INTERRUPT_INIT | CPU_INTERRUPT_SMI);
+        events.flags |= AEHD_VCPUEVENT_VALID_SMM;
+    }
+
+    events.flags = 0;
+    if (level >= AEHD_PUT_RESET_STATE) {
+        events.flags |=
+            AEHD_VCPUEVENT_VALID_NMI_PENDING | AEHD_VCPUEVENT_VALID_SIPI_VECTOR;
+    }
+
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_VCPU_EVENTS,
+                           &events, sizeof(events), NULL, 0);
+}
+
+static int aehd_get_vcpu_events(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_vcpu_events events;
+    int ret;
+
+    memset(&events, 0, sizeof(events));
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_VCPU_EVENTS,
+                          NULL, 0, &events, sizeof(events));
+    if (ret < 0) {
+        return ret;
+    }
+
+    env->exception_injected =
+       events.exception.injected ? events.exception.nr : -1;
+    env->has_error_code = events.exception.has_error_code;
+    env->error_code = events.exception.error_code;
+
+    env->interrupt_injected =
+        events.interrupt.injected ? events.interrupt.nr : -1;
+    env->soft_interrupt = events.interrupt.soft;
+
+    env->nmi_injected = events.nmi.injected;
+    env->nmi_pending = events.nmi.pending;
+    if (events.nmi.masked) {
+        env->hflags2 |= HF2_NMI_MASK;
+    } else {
+        env->hflags2 &= ~HF2_NMI_MASK;
+    }
+
+    if (events.flags & AEHD_VCPUEVENT_VALID_SMM) {
+        if (events.smi.smm) {
+            env->hflags |= HF_SMM_MASK;
+        } else {
+            env->hflags &= ~HF_SMM_MASK;
+        }
+        if (events.smi.pending) {
+            cpu_interrupt(CPU(cpu), CPU_INTERRUPT_SMI);
+        } else {
+            cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_SMI);
+        }
+        if (events.smi.smm_inside_nmi) {
+            env->hflags2 |= HF2_SMM_INSIDE_NMI_MASK;
+        } else {
+            env->hflags2 &= ~HF2_SMM_INSIDE_NMI_MASK;
+        }
+        if (events.smi.latched_init) {
+            cpu_interrupt(CPU(cpu), CPU_INTERRUPT_INIT);
+        } else {
+            cpu_reset_interrupt(CPU(cpu), CPU_INTERRUPT_INIT);
+        }
+    }
+
+    env->sipi_vector = events.sipi_vector;
+
+    return 0;
+}
+
+static int aehd_put_debugregs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_debugregs dbgregs;
+    int i;
+
+    for (i = 0; i < 4; i++) {
+        dbgregs.db[i] = env->dr[i];
+    }
+    dbgregs.dr6 = env->dr[6];
+    dbgregs.dr7 = env->dr[7];
+    dbgregs.flags = 0;
+
+    return aehd_vcpu_ioctl(CPU(cpu), AEHD_SET_DEBUGREGS,
+                           &dbgregs, sizeof(dbgregs), NULL, 0);
+}
+
+static int aehd_get_debugregs(X86CPU *cpu)
+{
+    CPUX86State *env = &cpu->env;
+    struct aehd_debugregs dbgregs;
+    int i, ret;
+
+    ret = aehd_vcpu_ioctl(CPU(cpu), AEHD_GET_DEBUGREGS,
+                          &dbgregs, sizeof(dbgregs), NULL, 0);
+    if (ret < 0) {
+        return ret;
+    }
+    for (i = 0; i < 4; i++) {
+        env->dr[i] = dbgregs.db[i];
+    }
+    env->dr[4] = env->dr[6] = dbgregs.dr6;
+    env->dr[5] = env->dr[7] = dbgregs.dr7;
+
+    return 0;
+}
+
+int aehd_arch_put_registers(CPUState *cpu, int level)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    int ret;
+
+    assert(cpu_is_stopped(cpu) || qemu_cpu_is_self(cpu));
+
+    if (level >= AEHD_PUT_RESET_STATE) {
+        ret = aehd_put_msr_feature_control(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    ret = aehd_getput_regs(x86_cpu, 1);
+    if (ret < 0) {
+        return ret;
+    }
+    ret = aehd_put_xsave(x86_cpu);
+    if (ret < 0) {
+        return ret;
+    }
+    ret = aehd_put_xcrs(x86_cpu);
+    if (ret < 0) {
+        return ret;
+    }
+    ret = aehd_put_sregs(x86_cpu);
+    if (ret < 0) {
+        return ret;
+    }
+    ret = aehd_put_msrs(x86_cpu, level);
+    if (ret < 0) {
+        return ret;
+    }
+    if (level >= AEHD_PUT_RESET_STATE) {
+        ret = aehd_put_mp_state(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+        ret = aehd_put_apic(x86_cpu);
+        if (ret < 0) {
+            return ret;
+        }
+    }
+
+    ret = aehd_put_tscdeadline_msr(x86_cpu);
+    if (ret < 0) {
+        return ret;
+    }
+
+    ret = aehd_put_vcpu_events(x86_cpu, level);
+    if (ret < 0) {
+        return ret;
+    }
+    ret = aehd_put_debugregs(x86_cpu);
+    if (ret < 0) {
+        return ret;
+    }
+    return 0;
+}
+
+int aehd_arch_get_registers(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    int ret;
+
+    assert(cpu_is_stopped(cs) || qemu_cpu_is_self(cs));
+
+    ret = aehd_getput_regs(cpu, 0);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_xsave(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_xcrs(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_sregs(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_msrs(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_mp_state(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_apic(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_vcpu_events(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = aehd_get_debugregs(cpu);
+    if (ret < 0) {
+        goto out;
+    }
+    ret = 0;
+ out:
+    cpu_sync_bndcs_hflags(&cpu->env);
+    return ret;
+}
+
+void aehd_arch_pre_run(CPUState *cpu, struct aehd_run *run)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+    int ret;
+
+    /* Inject NMI */
+    if (cpu->interrupt_request & (CPU_INTERRUPT_NMI | CPU_INTERRUPT_SMI)) {
+        if (cpu->interrupt_request & CPU_INTERRUPT_NMI) {
+            qemu_mutex_lock_iothread();
+            cpu->interrupt_request &= ~CPU_INTERRUPT_NMI;
+            qemu_mutex_unlock_iothread();
+            DPRINTF("injected NMI\n");
+            ret = aehd_vcpu_ioctl(cpu, AEHD_NMI, NULL, 0, NULL, 0);
+            if (ret < 0) {
+                fprintf(stderr, "AEHD: injection failed, NMI lost (%s)\n",
+                        strerror(-ret));
+            }
+        }
+        if (cpu->interrupt_request & CPU_INTERRUPT_SMI) {
+            qemu_mutex_lock_iothread();
+            cpu->interrupt_request &= ~CPU_INTERRUPT_SMI;
+            qemu_mutex_unlock_iothread();
+            DPRINTF("injected SMI\n");
+            ret = aehd_vcpu_ioctl(cpu, AEHD_SMI, NULL, 0, NULL, 0);
+            if (ret < 0) {
+                fprintf(stderr, "AEHD: injection failed, SMI lost (%s)\n",
+                        strerror(-ret));
+            }
+        }
+    }
+
+    /*
+     * Force the VCPU out of its inner loop to process any INIT requests
+     * or (for userspace APIC, but it is cheap to combine the checks here)
+     * pending TPR access reports.
+     */
+    if (cpu->interrupt_request & (CPU_INTERRUPT_INIT | CPU_INTERRUPT_TPR)) {
+        if ((cpu->interrupt_request & CPU_INTERRUPT_INIT) &&
+            !(env->hflags & HF_SMM_MASK)) {
+            cpu->exit_request = 1;
+        }
+        if (cpu->interrupt_request & CPU_INTERRUPT_TPR) {
+            cpu->exit_request = 1;
+        }
+    }
+}
+
+MemTxAttrs aehd_arch_post_run(CPUState *cpu, struct aehd_run *run)
+{
+    X86CPU *x86_cpu = X86_CPU(cpu);
+    CPUX86State *env = &x86_cpu->env;
+
+    if (run->flags & AEHD_RUN_X86_SMM) {
+        env->hflags |= HF_SMM_MASK;
+    } else {
+        env->hflags &= ~HF_SMM_MASK;
+    }
+    if (run->if_flag) {
+        env->eflags |= IF_MASK;
+    } else {
+        env->eflags &= ~IF_MASK;
+    }
+
+    cpu_set_apic_tpr(x86_cpu->apic_state, run->cr8);
+    cpu_set_apic_base(x86_cpu->apic_state, run->apic_base);
+
+    return cpu_get_mem_attrs(env);
+}
+
+int aehd_arch_process_async_events(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    if (cs->interrupt_request & CPU_INTERRUPT_MCE) {
+        /* We must not raise CPU_INTERRUPT_MCE if it's not supported. */
+        assert(env->mcg_cap);
+
+        cs->interrupt_request &= ~CPU_INTERRUPT_MCE;
+
+        aehd_cpu_synchronize_state(cs);
+
+        if (env->exception_injected == EXCP08_DBLE) {
+            /* this means triple fault */
+            qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
+            cs->exit_request = 1;
+            return 0;
+        }
+        env->exception_injected = EXCP12_MCHK;
+        env->has_error_code = 0;
+
+        cs->halted = 0;
+        if (env->mp_state == AEHD_MP_STATE_HALTED) {
+            env->mp_state = AEHD_MP_STATE_RUNNABLE;
+        }
+    }
+
+    if ((cs->interrupt_request & CPU_INTERRUPT_INIT) &&
+        !(env->hflags & HF_SMM_MASK)) {
+        aehd_cpu_synchronize_state(cs);
+        do_cpu_init(cpu);
+    }
+
+    return 0;
+}
+
+static int aehd_handle_halt(X86CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    CPUX86State *env = &cpu->env;
+
+    if (!((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+          (env->eflags & IF_MASK)) &&
+        !(cs->interrupt_request & CPU_INTERRUPT_NMI)) {
+        cs->halted = 1;
+        return EXCP_HLT;
+    }
+
+    return 0;
+}
+
+static int aehd_handle_tpr_access(X86CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    struct aehd_run *run = cs->aehd_run;
+
+    apic_handle_tpr_access_report(cpu->apic_state, run->tpr_access.rip,
+                                  run->tpr_access.is_write ? TPR_ACCESS_WRITE
+                                                           : TPR_ACCESS_READ);
+    return 1;
+}
+
+static bool host_supports_vmx(void)
+{
+    uint32_t ecx, unused;
+
+    host_cpuid(1, 0, &unused, &unused, &ecx, &unused);
+    return ecx & CPUID_EXT_VMX;
+}
+
+#define VMX_INVALID_GUEST_STATE 0x80000021
+
+int aehd_arch_handle_exit(CPUState *cs, struct aehd_run *run)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    uint64_t code;
+    int ret;
+
+    switch (run->exit_reason) {
+    case AEHD_EXIT_HLT:
+        DPRINTF("handle_hlt\n");
+        qemu_mutex_lock_iothread();
+        ret = aehd_handle_halt(cpu);
+        qemu_mutex_unlock_iothread();
+        break;
+    case AEHD_EXIT_SET_TPR:
+        ret = 0;
+        break;
+    case AEHD_EXIT_TPR_ACCESS:
+        qemu_mutex_lock_iothread();
+        ret = aehd_handle_tpr_access(cpu);
+        qemu_mutex_unlock_iothread();
+        break;
+    case AEHD_EXIT_FAIL_ENTRY:
+        code = run->fail_entry.hardware_entry_failure_reason;
+        fprintf(stderr, "AEHD: entry failed, hardware error 0x%" PRIx64 "\n",
+                code);
+        if (host_supports_vmx() && code == VMX_INVALID_GUEST_STATE) {
+            fprintf(stderr,
+                    "\nIf you're running a guest on an Intel machine without "
+                        "unrestricted mode\n"
+                    "support, the failure can be most likely due to the guest "
+                        "entering an invalid\n"
+                    "state for Intel VT. For example, the guest maybe running "
+                        "in big real mode\n"
+                    "which is not supported on less recent Intel processors."
+                        "\n\n");
+        }
+        ret = -1;
+        break;
+    case AEHD_EXIT_EXCEPTION:
+        fprintf(stderr, "AEHD: exception %d exit (error code 0x%x)\n",
+                run->ex.exception, run->ex.error_code);
+        ret = -1;
+        break;
+    case AEHD_EXIT_IOAPIC_EOI:
+        ioapic_eoi_broadcast(run->eoi.vector);
+        ret = 0;
+        break;
+    default:
+        fprintf(stderr, "AEHD: unknown exit reason %d\n", run->exit_reason);
+        ret = -1;
+        break;
+    }
+
+    return ret;
+}
+
+bool aehd_arch_stop_on_emulation_error(CPUState *cs)
+{
+    X86CPU *cpu = X86_CPU(cs);
+    CPUX86State *env = &cpu->env;
+
+    aehd_cpu_synchronize_state(cs);
+    return !(env->cr[0] & CR0_PE_MASK) ||
+           ((env->segs[R_CS].selector  & 3) != 3);
+}
+
+int aehd_arch_irqchip_create(MachineState *ms, AEHDState *s)
+{
+    return 0;
+}
+
 typedef struct MSIRouteEntry MSIRouteEntry;
 
 struct MSIRouteEntry {
diff --git a/target/i386/aehd/aehd_i386.h b/target/i386/aehd/aehd_i386.h
new file mode 100644
index 0000000000..622a9b1d63
--- /dev/null
+++ b/target/i386/aehd/aehd_i386.h
@@ -0,0 +1,26 @@
+/*
+ * QEMU AEHD support
+ *
+ * Copyright IBM, Corp. 2008
+ *
+ * Authors:
+ *  Anthony Liguori   <aliguori@us.ibm.com>
+ *
+ * Copyright (c) 2017 Intel Corporation
+ *  Written by:
+ *  Haitao Shan <hshan@google.com>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#ifndef QEMU_AEHD_I386_H
+#define QEMU_AEHD_I386_H
+
+#include "sysemu/aehd.h"
+
+void aehd_arch_reset_vcpu(X86CPU *cs);
+void aehd_arch_do_init_vcpu(X86CPU *cs);
+
+#endif /*QEMU_AEHD_I386_H */
diff --git a/target/i386/aehd/aehd_int.h b/target/i386/aehd/aehd_int.h
index 113f3ebf8e..738dfa72ad 100644
--- a/target/i386/aehd/aehd_int.h
+++ b/target/i386/aehd/aehd_int.h
@@ -45,6 +45,6 @@ struct AEHDState {
 };
 
 void aehd_memory_listener_register(AEHDState *s, AEHDMemoryListener *kml,
-                                  AddressSpace *as, int as_id);
+                                   AddressSpace *as, int as_id);
 
 #endif
diff --git a/target/i386/aehd/meson.build b/target/i386/aehd/meson.build
index 50880712db..b4c6364e96 100644
--- a/target/i386/aehd/meson.build
+++ b/target/i386/aehd/meson.build
@@ -1,4 +1,8 @@
+i386_ss.add(when: 'CONFIG_AEHD', if_false: files('aehd-stub.c'))
+
 i386_softmmu_ss.add(when: 'CONFIG_AEHD', if_true: files(
   'aehd-all.c',
   'aehd.c',
+  'aehd-cpu.c',
+  'aehd-accel-ops.c',
 ))
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index f3fbb0bf8b..83c250e64d 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -27,6 +27,7 @@
 #include "sysemu/reset.h"
 #include "sysemu/hvf.h"
 #include "kvm/kvm_i386.h"
+#include "aehd/aehd_i386.h"
 #include "sev.h"
 #include "qapi/error.h"
 #include "qapi/qapi-visit-machine.h"
@@ -1487,7 +1488,7 @@ uint32_t xsave_area_size(uint64_t mask, bool compacted)
 
 static inline bool accel_uses_host_cpuid(void)
 {
-    return kvm_enabled() || hvf_enabled();
+    return kvm_enabled() || hvf_enabled() || aehd_enabled();
 }
 
 static inline uint64_t x86_cpu_xsave_xcr0_components(X86CPU *cpu)
@@ -5067,6 +5068,13 @@ uint64_t x86_cpu_get_supported_feature_word(FeatureWord w,
                         wi->msr.index);
             break;
         }
+    } else if (aehd_enabled()) {
+        if (wi->type != CPUID_FEATURE_WORD) {
+            return 0;
+        }
+        r = aehd_arch_get_supported_cpuid(aehd_state, wi->cpuid.eax,
+                                                    wi->cpuid.ecx,
+                                                    wi->cpuid.reg);
     } else if (hvf_enabled()) {
         if (wi->type != CPUID_FEATURE_WORD) {
             return 0;
@@ -6161,6 +6169,8 @@ static void x86_cpu_reset_hold(Object *obj)
 
     if (kvm_enabled()) {
         kvm_arch_reset_vcpu(cpu);
+    } else if (aehd_enabled()) {
+        aehd_arch_reset_vcpu(cpu);
     }
 
     x86_cpu_set_sgxlepubkeyhash(env);
diff --git a/target/i386/cpu.h b/target/i386/cpu.h
index ea650e68a3..4b18f5442f 100644
--- a/target/i386/cpu.h
+++ b/target/i386/cpu.h
@@ -1793,7 +1793,7 @@ typedef struct CPUArchState {
     int64_t user_tsc_khz; /* for sanity check only */
     uint64_t apic_bus_freq;
     uint64_t tsc;
-#if defined(CONFIG_KVM) || defined(CONFIG_HVF)
+#if defined(CONFIG_KVM) || defined(CONFIG_AEHD) || defined(CONFIG_HVF)
     void *xsave_buf;
     uint32_t xsave_buf_len;
 #endif
@@ -1825,6 +1825,7 @@ typedef struct CPUArchState {
 } CPUX86State;
 
 struct kvm_msrs;
+struct aehd_msrs;
 
 /**
  * X86CPU:
@@ -1968,6 +1969,8 @@ struct ArchCPU {
 
     struct kvm_msrs *kvm_msr_buf;
 
+    struct aehd_msrs *aehd_msr_buf;
+
     int32_t node_id; /* NUMA node this CPU belongs to */
     int32_t socket_id;
     int32_t die_id;
diff --git a/target/i386/helper.c b/target/i386/helper.c
index 8857444819..fbf7b12d7a 100644
--- a/target/i386/helper.c
+++ b/target/i386/helper.c
@@ -23,6 +23,7 @@
 #include "exec/exec-all.h"
 #include "sysemu/runstate.h"
 #include "kvm/kvm_i386.h"
+#include "aehd/aehd_i386.h"
 #ifndef CONFIG_USER_ONLY
 #include "sysemu/hw_accel.h"
 #include "monitor/monitor.h"
@@ -596,6 +597,8 @@ void do_cpu_init(X86CPU *cpu)
 
     if (kvm_enabled()) {
         kvm_arch_do_init_vcpu(cpu);
+    } else if (aehd_enabled()) {
+        aehd_arch_do_init_vcpu(cpu);
     }
     apic_init_reset(cpu->apic_state);
 }
diff --git a/target/i386/meson.build b/target/i386/meson.build
index 76a90b73d5..57ddfbd4a4 100644
--- a/target/i386/meson.build
+++ b/target/i386/meson.build
@@ -10,6 +10,7 @@ i386_ss.add(when: 'CONFIG_SEV', if_true: files('host-cpu.c'))
 
 # x86 cpu type
 i386_ss.add(when: 'CONFIG_KVM', if_true: files('host-cpu.c'))
+i386_ss.add(when: 'CONFIG_AEHD', if_true: files('host-cpu.c'))
 i386_ss.add(when: 'CONFIG_HVF', if_true: files('host-cpu.c'))
 
 i386_softmmu_ss = ss.source_set()
-- 
2.40.0.rc0.216.gc4246ad0f0-goog


