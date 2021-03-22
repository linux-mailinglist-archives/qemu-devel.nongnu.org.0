Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A63E344FC6
	for <lists+qemu-devel@lfdr.de>; Mon, 22 Mar 2021 20:20:34 +0100 (CET)
Received: from localhost ([::1]:43382 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOQ6L-0006kc-9T
	for lists+qemu-devel@lfdr.de; Mon, 22 Mar 2021 15:20:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44964)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1w-0004uo-0d; Mon, 22 Mar 2021 15:16:00 -0400
Received: from mx2.suse.de ([195.135.220.15]:48592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>)
 id 1lOQ1s-0003SN-OW; Mon, 22 Mar 2021 15:15:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0811AAF23;
 Mon, 22 Mar 2021 19:15:55 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [RFC v1 3/5] target/s390x: move sysemu-only code out to cpu-sysemu.c
Date: Mon, 22 Mar 2021 20:15:49 +0100
Message-Id: <20210322191551.25752-4-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210322191551.25752-1-cfontana@suse.de>
References: <20210322191551.25752-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: David Hildenbrand <david@redhat.com>, qemu-devel@nongnu.org,
 Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 Claudio Fontana <cfontana@suse.de>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/s390x/s390x-internal.h |   6 +
 target/s390x/cpu-sysemu.c     | 304 ++++++++++++++++++++++++++++++++++
 target/s390x/cpu.c            | 283 ++-----------------------------
 target/s390x/meson.build      |   1 +
 target/s390x/trace-events     |   2 +-
 5 files changed, 324 insertions(+), 272 deletions(-)
 create mode 100644 target/s390x/cpu-sysemu.c

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 11515bb617..171ecd59fb 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -244,6 +244,12 @@ void load_psw(CPUS390XState *env, uint64_t mask, uint64_t addr);
 #ifndef CONFIG_USER_ONLY
 unsigned int s390_cpu_halt(S390CPU *cpu);
 void s390_cpu_unhalt(S390CPU *cpu);
+void s390_cpu_init_sysemu(Object *obj);
+bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp);
+void s390_cpu_finalize(Object *obj);
+void s390_cpu_class_init_sysemu(CPUClass *cc);
+void s390_cpu_machine_reset_cb(void *opaque);
+
 #else
 static inline unsigned int s390_cpu_halt(S390CPU *cpu)
 {
diff --git a/target/s390x/cpu-sysemu.c b/target/s390x/cpu-sysemu.c
new file mode 100644
index 0000000000..6081b7ef32
--- /dev/null
+++ b/target/s390x/cpu-sysemu.c
@@ -0,0 +1,304 @@
+/*
+ * QEMU S/390 CPU - System Emulation-only code
+ *
+ * Copyright (c) 2009 Ulrich Hecht
+ * Copyright (c) 2011 Alexander Graf
+ * Copyright (c) 2012 SUSE LINUX Products GmbH
+ * Copyright (c) 2012 IBM Corp.
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; either version 2 of the License, or
+ * (at your option) any later version.
+ *
+ * This program is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * General Public License for more details.
+ *
+ * You should have received a copy of the GNU General Public License
+ * along with this program; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "cpu.h"
+#include "s390x-internal.h"
+#include "kvm_s390x.h"
+#include "sysemu/kvm.h"
+#include "sysemu/reset.h"
+#include "qemu/timer.h"
+#include "trace.h"
+#include "qapi/qapi-visit-run-state.h"
+#include "sysemu/hw_accel.h"
+
+#include "hw/s390x/pv.h"
+#include "hw/boards.h"
+#include "sysemu/arch_init.h"
+#include "sysemu/sysemu.h"
+#include "sysemu/tcg.h"
+
+/* S390CPUClass::load_normal() */
+static void s390_cpu_load_normal(CPUState *s)
+{
+    S390CPU *cpu = S390_CPU(s);
+    uint64_t spsw;
+
+    if (!s390_is_pv()) {
+        spsw = ldq_phys(s->as, 0);
+        cpu->env.psw.mask = spsw & PSW_MASK_SHORT_CTRL;
+        /*
+         * Invert short psw indication, so SIE will report a specification
+         * exception if it was not set.
+         */
+        cpu->env.psw.mask ^= PSW_MASK_SHORTPSW;
+        cpu->env.psw.addr = spsw & PSW_MASK_SHORT_ADDR;
+    } else {
+        /*
+         * Firmware requires us to set the load state before we set
+         * the cpu to operating on protected guests.
+         */
+        s390_cpu_set_state(S390_CPU_STATE_LOAD, cpu);
+    }
+    s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
+}
+
+void s390_cpu_machine_reset_cb(void *opaque)
+{
+    S390CPU *cpu = opaque;
+
+    run_on_cpu(CPU(cpu), s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
+}
+
+static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
+{
+    GuestPanicInformation *panic_info;
+    S390CPU *cpu = S390_CPU(cs);
+
+    cpu_synchronize_state(cs);
+    panic_info = g_malloc0(sizeof(GuestPanicInformation));
+
+    panic_info->type = GUEST_PANIC_INFORMATION_TYPE_S390;
+    panic_info->u.s390.core = cpu->env.core_id;
+    panic_info->u.s390.psw_mask = cpu->env.psw.mask;
+    panic_info->u.s390.psw_addr = cpu->env.psw.addr;
+    panic_info->u.s390.reason = cpu->env.crash_reason;
+
+    return panic_info;
+}
+
+static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
+                                        const char *name, void *opaque,
+                                        Error **errp)
+{
+    CPUState *cs = CPU(obj);
+    GuestPanicInformation *panic_info;
+
+    if (!cs->crash_occurred) {
+        error_setg(errp, "No crash occurred");
+        return;
+    }
+
+    panic_info = s390_cpu_get_crash_info(cs);
+
+    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
+                                     errp);
+    qapi_free_GuestPanicInformation(panic_info);
+}
+
+void s390_cpu_init_sysemu(Object *obj)
+{
+    CPUState *cs = CPU(obj);
+    S390CPU *cpu = S390_CPU(obj);
+
+    cs->start_powered_off = true;
+    object_property_add(obj, "crash-information", "GuestPanicInformation",
+                        s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
+    cpu->env.tod_timer =
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
+    cpu->env.cpu_timer =
+        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
+    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
+}
+
+bool s390_cpu_realize_sysemu(DeviceState *dev, Error **errp)
+{
+    S390CPU *cpu = S390_CPU(dev);
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int max_cpus = ms->smp.max_cpus;
+
+    if (cpu->env.core_id >= max_cpus) {
+        error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
+                   ", maximum core-id: %d", cpu->env.core_id,
+                   max_cpus - 1);
+        return false;
+    }
+
+    if (cpu_exists(cpu->env.core_id)) {
+        error_setg(errp, "Unable to add CPU with core-id: %" PRIu32
+                   ", it already exists", cpu->env.core_id);
+        return false;
+    }
+
+    /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. */
+    CPU(cpu)->cpu_index = cpu->env.core_id;
+    return true;
+}
+
+void s390_cpu_finalize(Object *obj)
+{
+    S390CPU *cpu = S390_CPU(obj);
+
+    timer_free(cpu->env.tod_timer);
+    timer_free(cpu->env.cpu_timer);
+
+    qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
+    g_free(cpu->irqstate);
+}
+
+void s390_cpu_class_init_sysemu(CPUClass *cc)
+{
+    S390CPUClass *scc = S390_CPU_CLASS(cc);
+
+    scc->load_normal = s390_cpu_load_normal;
+    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
+    cc->vmsd = &vmstate_s390_cpu;
+    cc->get_crash_info = s390_cpu_get_crash_info;
+    cc->write_elf64_note = s390_cpu_write_elf64_note;
+}
+
+static bool disabled_wait(CPUState *cpu)
+{
+    return cpu->halted && !(S390_CPU(cpu)->env.psw.mask &
+                            (PSW_MASK_IO | PSW_MASK_EXT | PSW_MASK_MCHECK));
+}
+
+static unsigned s390_count_running_cpus(void)
+{
+    CPUState *cpu;
+    int nr_running = 0;
+
+    CPU_FOREACH(cpu) {
+        uint8_t state = S390_CPU(cpu)->env.cpu_state;
+        if (state == S390_CPU_STATE_OPERATING ||
+            state == S390_CPU_STATE_LOAD) {
+            if (!disabled_wait(cpu)) {
+                nr_running++;
+            }
+        }
+    }
+
+    return nr_running;
+}
+
+unsigned int s390_cpu_halt(S390CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    trace_cpu_halt(cs->cpu_index);
+
+    if (!cs->halted) {
+        cs->halted = 1;
+        cs->exception_index = EXCP_HLT;
+    }
+
+    return s390_count_running_cpus();
+}
+
+void s390_cpu_unhalt(S390CPU *cpu)
+{
+    CPUState *cs = CPU(cpu);
+    trace_cpu_unhalt(cs->cpu_index);
+
+    if (cs->halted) {
+        cs->halted = 0;
+        cs->exception_index = -1;
+    }
+}
+
+unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
+ {
+    trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
+
+    switch (cpu_state) {
+    case S390_CPU_STATE_STOPPED:
+    case S390_CPU_STATE_CHECK_STOP:
+        /* halt the cpu for common infrastructure */
+        s390_cpu_halt(cpu);
+        break;
+    case S390_CPU_STATE_OPERATING:
+    case S390_CPU_STATE_LOAD:
+        /*
+         * Starting a CPU with a PSW WAIT bit set:
+         * KVM: handles this internally and triggers another WAIT exit.
+         * TCG: will actually try to continue to run. Don't unhalt, will
+         *      be done when the CPU actually has work (an interrupt).
+         */
+        if (!tcg_enabled() || !(cpu->env.psw.mask & PSW_MASK_WAIT)) {
+            s390_cpu_unhalt(cpu);
+        }
+        break;
+    default:
+        error_report("Requested CPU state is not a valid S390 CPU state: %u",
+                     cpu_state);
+        exit(1);
+    }
+    if (kvm_enabled() && cpu->env.cpu_state != cpu_state) {
+        kvm_s390_set_cpu_state(cpu, cpu_state);
+    }
+    cpu->env.cpu_state = cpu_state;
+
+    return s390_count_running_cpus();
+}
+
+int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_set_mem_limit(new_limit, hw_limit);
+    }
+    return 0;
+}
+
+void s390_set_max_pagesize(uint64_t pagesize, Error **errp)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_max_pagesize(pagesize, errp);
+    }
+}
+
+void s390_cmma_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_cmma_reset();
+    }
+}
+
+int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
+                                int vq, bool assign)
+{
+    if (kvm_enabled()) {
+        return kvm_s390_assign_subch_ioeventfd(notifier, sch_id, vq, assign);
+    } else {
+        return 0;
+    }
+}
+
+void s390_crypto_reset(void)
+{
+    if (kvm_enabled()) {
+        kvm_s390_crypto_reset();
+    }
+}
+
+void s390_enable_css_support(S390CPU *cpu)
+{
+    if (kvm_enabled()) {
+        kvm_s390_enable_css_support(cpu);
+    }
+}
+
+void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
+{
+    if (kvm_enabled()) {
+        kvm_s390_set_diag318(cs, arg.host_ulong);
+    }
+}
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ae054d264b..59efe48bcd 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -27,22 +27,11 @@
 #include "kvm_s390x.h"
 #include "sysemu/kvm.h"
 #include "sysemu/reset.h"
-#include "qemu/timer.h"
-#include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "trace.h"
-#include "qapi/visitor.h"
 #include "qapi/qapi-types-machine.h"
-#include "qapi/qapi-visit-run-state.h"
 #include "sysemu/hw_accel.h"
 #include "hw/qdev-properties.h"
-#ifndef CONFIG_USER_ONLY
-#include "hw/s390x/pv.h"
-#include "hw/boards.h"
-#include "sysemu/arch_init.h"
-#include "sysemu/sysemu.h"
-#include "sysemu/tcg.h"
-#endif
 #include "fpu/softfloat-helpers.h"
 #include "disas/capstone.h"
 
@@ -73,33 +62,6 @@ static bool s390_cpu_has_work(CPUState *cs)
     return s390_cpu_has_int(cpu);
 }
 
-#if !defined(CONFIG_USER_ONLY)
-/* S390CPUClass::load_normal() */
-static void s390_cpu_load_normal(CPUState *s)
-{
-    S390CPU *cpu = S390_CPU(s);
-    uint64_t spsw;
-
-    if (!s390_is_pv()) {
-        spsw = ldq_phys(s->as, 0);
-        cpu->env.psw.mask = spsw & PSW_MASK_SHORT_CTRL;
-        /*
-         * Invert short psw indication, so SIE will report a specification
-         * exception if it was not set.
-         */
-        cpu->env.psw.mask ^= PSW_MASK_SHORTPSW;
-        cpu->env.psw.addr = spsw & PSW_MASK_SHORT_ADDR;
-    } else {
-        /*
-         * Firmware requires us to set the load state before we set
-         * the cpu to operating on protected guests.
-         */
-        s390_cpu_set_state(S390_CPU_STATE_LOAD, cpu);
-    }
-    s390_cpu_set_state(S390_CPU_STATE_OPERATING, cpu);
-}
-#endif
-
 /* S390CPUClass::reset() */
 static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
 {
@@ -170,15 +132,6 @@ static void s390_cpu_reset(CPUState *s, cpu_reset_type type)
     }
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static void s390_cpu_machine_reset_cb(void *opaque)
-{
-    S390CPU *cpu = opaque;
-
-    run_on_cpu(CPU(cpu), s390_do_cpu_full_reset, RUN_ON_CPU_NULL);
-}
-#endif
-
 static void s390_cpu_disas_set_info(CPUState *cpu, disassemble_info *info)
 {
     info->mach = bfd_mach_s390_64;
@@ -192,9 +145,6 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
 {
     CPUState *cs = CPU(dev);
     S390CPUClass *scc = S390_CPU_GET_CLASS(dev);
-#if !defined(CONFIG_USER_ONLY)
-    S390CPU *cpu = S390_CPU(dev);
-#endif
     Error *err = NULL;
 
     /* the model has to be realized before qemu_init_vcpu() due to kvm */
@@ -204,23 +154,9 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    MachineState *ms = MACHINE(qdev_get_machine());
-    unsigned int max_cpus = ms->smp.max_cpus;
-    if (cpu->env.core_id >= max_cpus) {
-        error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
-                   ", maximum core-id: %d", cpu->env.core_id,
-                   max_cpus - 1);
+    if (!s390_cpu_realize_sysemu(dev, &err)) {
         goto out;
     }
-
-    if (cpu_exists(cpu->env.core_id)) {
-        error_setg(&err, "Unable to add CPU with core-id: %" PRIu32
-                   ", it already exists", cpu->env.core_id);
-        goto out;
-    }
-
-    /* sync cs->cpu_index and env->core_id. The latter is needed for TCG. */
-    cs->cpu_index = cpu->env.core_id;
 #endif
 
     cpu_exec_realizefn(cs, &err);
@@ -229,7 +165,7 @@ static void s390_cpu_realizefn(DeviceState *dev, Error **errp)
     }
 
 #if !defined(CONFIG_USER_ONLY)
-    qemu_register_reset(s390_cpu_machine_reset_cb, cpu);
+    qemu_register_reset(s390_cpu_machine_reset_cb, S390_CPU(dev));
 #endif
     s390_cpu_gdb_init(cs);
     qemu_init_vcpu(cs);
@@ -251,44 +187,6 @@ out:
     error_propagate(errp, err);
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static GuestPanicInformation *s390_cpu_get_crash_info(CPUState *cs)
-{
-    GuestPanicInformation *panic_info;
-    S390CPU *cpu = S390_CPU(cs);
-
-    cpu_synchronize_state(cs);
-    panic_info = g_malloc0(sizeof(GuestPanicInformation));
-
-    panic_info->type = GUEST_PANIC_INFORMATION_TYPE_S390;
-    panic_info->u.s390.core = cpu->env.core_id;
-    panic_info->u.s390.psw_mask = cpu->env.psw.mask;
-    panic_info->u.s390.psw_addr = cpu->env.psw.addr;
-    panic_info->u.s390.reason = cpu->env.crash_reason;
-
-    return panic_info;
-}
-
-static void s390_cpu_get_crash_info_qom(Object *obj, Visitor *v,
-                                        const char *name, void *opaque,
-                                        Error **errp)
-{
-    CPUState *cs = CPU(obj);
-    GuestPanicInformation *panic_info;
-
-    if (!cs->crash_occurred) {
-        error_setg(errp, "No crash occurred");
-        return;
-    }
-
-    panic_info = s390_cpu_get_crash_info(cs);
-
-    visit_type_GuestPanicInformation(v, "crash-information", &panic_info,
-                                     errp);
-    qapi_free_GuestPanicInformation(panic_info);
-}
-#endif
-
 static void s390_cpu_initfn(Object *obj)
 {
     CPUState *cs = CPU(obj);
@@ -296,169 +194,12 @@ static void s390_cpu_initfn(Object *obj)
 
     cpu_set_cpustate_pointers(cpu);
     cs->exception_index = EXCP_HLT;
-#if !defined(CONFIG_USER_ONLY)
-    cs->start_powered_off = true;
-    object_property_add(obj, "crash-information", "GuestPanicInformation",
-                        s390_cpu_get_crash_info_qom, NULL, NULL, NULL);
-    cpu->env.tod_timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_tod_timer, cpu);
-    cpu->env.cpu_timer =
-        timer_new_ns(QEMU_CLOCK_VIRTUAL, s390x_cpu_timer, cpu);
-    s390_cpu_set_state(S390_CPU_STATE_STOPPED, cpu);
-#endif
-}
 
-static void s390_cpu_finalize(Object *obj)
-{
 #if !defined(CONFIG_USER_ONLY)
-    S390CPU *cpu = S390_CPU(obj);
-
-    timer_free(cpu->env.tod_timer);
-    timer_free(cpu->env.cpu_timer);
-
-    qemu_unregister_reset(s390_cpu_machine_reset_cb, cpu);
-    g_free(cpu->irqstate);
+    s390_cpu_init_sysemu(obj);
 #endif
 }
 
-#if !defined(CONFIG_USER_ONLY)
-static bool disabled_wait(CPUState *cpu)
-{
-    return cpu->halted && !(S390_CPU(cpu)->env.psw.mask &
-                            (PSW_MASK_IO | PSW_MASK_EXT | PSW_MASK_MCHECK));
-}
-
-static unsigned s390_count_running_cpus(void)
-{
-    CPUState *cpu;
-    int nr_running = 0;
-
-    CPU_FOREACH(cpu) {
-        uint8_t state = S390_CPU(cpu)->env.cpu_state;
-        if (state == S390_CPU_STATE_OPERATING ||
-            state == S390_CPU_STATE_LOAD) {
-            if (!disabled_wait(cpu)) {
-                nr_running++;
-            }
-        }
-    }
-
-    return nr_running;
-}
-
-unsigned int s390_cpu_halt(S390CPU *cpu)
-{
-    CPUState *cs = CPU(cpu);
-    trace_cpu_halt(cs->cpu_index);
-
-    if (!cs->halted) {
-        cs->halted = 1;
-        cs->exception_index = EXCP_HLT;
-    }
-
-    return s390_count_running_cpus();
-}
-
-void s390_cpu_unhalt(S390CPU *cpu)
-{
-    CPUState *cs = CPU(cpu);
-    trace_cpu_unhalt(cs->cpu_index);
-
-    if (cs->halted) {
-        cs->halted = 0;
-        cs->exception_index = -1;
-    }
-}
-
-unsigned int s390_cpu_set_state(uint8_t cpu_state, S390CPU *cpu)
- {
-    trace_cpu_set_state(CPU(cpu)->cpu_index, cpu_state);
-
-    switch (cpu_state) {
-    case S390_CPU_STATE_STOPPED:
-    case S390_CPU_STATE_CHECK_STOP:
-        /* halt the cpu for common infrastructure */
-        s390_cpu_halt(cpu);
-        break;
-    case S390_CPU_STATE_OPERATING:
-    case S390_CPU_STATE_LOAD:
-        /*
-         * Starting a CPU with a PSW WAIT bit set:
-         * KVM: handles this internally and triggers another WAIT exit.
-         * TCG: will actually try to continue to run. Don't unhalt, will
-         *      be done when the CPU actually has work (an interrupt).
-         */
-        if (!tcg_enabled() || !(cpu->env.psw.mask & PSW_MASK_WAIT)) {
-            s390_cpu_unhalt(cpu);
-        }
-        break;
-    default:
-        error_report("Requested CPU state is not a valid S390 CPU state: %u",
-                     cpu_state);
-        exit(1);
-    }
-    if (kvm_enabled() && cpu->env.cpu_state != cpu_state) {
-        kvm_s390_set_cpu_state(cpu, cpu_state);
-    }
-    cpu->env.cpu_state = cpu_state;
-
-    return s390_count_running_cpus();
-}
-
-int s390_set_memory_limit(uint64_t new_limit, uint64_t *hw_limit)
-{
-    if (kvm_enabled()) {
-        return kvm_s390_set_mem_limit(new_limit, hw_limit);
-    }
-    return 0;
-}
-
-void s390_set_max_pagesize(uint64_t pagesize, Error **errp)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_max_pagesize(pagesize, errp);
-    }
-}
-
-void s390_cmma_reset(void)
-{
-    if (kvm_enabled()) {
-        kvm_s390_cmma_reset();
-    }
-}
-
-int s390_assign_subch_ioeventfd(EventNotifier *notifier, uint32_t sch_id,
-                                int vq, bool assign)
-{
-    if (kvm_enabled()) {
-        return kvm_s390_assign_subch_ioeventfd(notifier, sch_id, vq, assign);
-    } else {
-        return 0;
-    }
-}
-
-void s390_crypto_reset(void)
-{
-    if (kvm_enabled()) {
-        kvm_s390_crypto_reset();
-    }
-}
-
-void s390_enable_css_support(S390CPU *cpu)
-{
-    if (kvm_enabled()) {
-        kvm_s390_enable_css_support(cpu);
-    }
-}
-
-void s390_do_cpu_set_diag318(CPUState *cs, run_on_cpu_data arg)
-{
-    if (kvm_enabled()) {
-        kvm_s390_set_diag318(cs, arg.host_ulong);
-    }
-}
-#endif
-
 static gchar *s390_gdb_arch_name(CPUState *cs)
 {
     return g_strdup("s390:64-bit");
@@ -505,9 +246,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     dc->user_creatable = true;
 
     device_class_set_parent_reset(dc, s390_cpu_reset_full, &scc->parent_reset);
-#if !defined(CONFIG_USER_ONLY)
-    scc->load_normal = s390_cpu_load_normal;
-#endif
+
     scc->reset = s390_cpu_reset;
     cc->class_by_name = s390_cpu_class_by_name,
     cc->has_work = s390_cpu_has_work;
@@ -515,17 +254,15 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = s390_cpu_set_pc;
     cc->gdb_read_register = s390_cpu_gdb_read_register;
     cc->gdb_write_register = s390_cpu_gdb_write_register;
-#ifndef CONFIG_USER_ONLY
-    cc->get_phys_page_debug = s390_cpu_get_phys_page_debug;
-    cc->vmsd = &vmstate_s390_cpu;
-    cc->get_crash_info = s390_cpu_get_crash_info;
-    cc->write_elf64_note = s390_cpu_write_elf64_note;
-#endif
     cc->disas_set_info = s390_cpu_disas_set_info;
     cc->gdb_num_core_regs = S390_NUM_CORE_REGS;
     cc->gdb_core_xml_file = "s390x-core64.xml";
     cc->gdb_arch_name = s390_gdb_arch_name;
 
+#ifndef CONFIG_USER_ONLY
+    s390_cpu_class_init_sysemu(cc);
+#endif /* CONFIG_USER_ONLY */
+
     s390_cpu_model_class_register_props(oc);
 
 #ifdef CONFIG_TCG
@@ -539,7 +276,11 @@ static const TypeInfo s390_cpu_type_info = {
     .instance_size = sizeof(S390CPU),
     .instance_align = __alignof__(S390CPU),
     .instance_init = s390_cpu_initfn,
+
+#ifndef CONFIG_USER_ONLY
     .instance_finalize = s390_cpu_finalize,
+#endif /* !CONFIG_USER_ONLY */
+
     .abstract = true,
     .class_size = sizeof(S390CPUClass),
     .class_init = s390_cpu_class_init,
diff --git a/target/s390x/meson.build b/target/s390x/meson.build
index 60d7f1b908..a73bae3dc5 100644
--- a/target/s390x/meson.build
+++ b/target/s390x/meson.build
@@ -28,6 +28,7 @@ s390x_softmmu_ss.add(files(
   'machine.c',
   'mmu_helper.c',
   'sigp.c',
+  'cpu-sysemu.c',
 ))
 
 # Newer kernels on s390 check for an S390_PGSTE program header and
diff --git a/target/s390x/trace-events b/target/s390x/trace-events
index fda1ee8220..e6c5fc1d03 100644
--- a/target/s390x/trace-events
+++ b/target/s390x/trace-events
@@ -16,7 +16,7 @@ kvm_clear_cmma(int rc) "CMMA: clearing with result code %d"
 kvm_failed_cpu_state_set(int cpu_index, uint8_t state, const char *msg) "Warning: Unable to set cpu %d state %" PRIu8 " to KVM: %s"
 kvm_assign_subch_ioeventfd(int fd, uint32_t addr, bool assign, int datamatch) "fd: %d sch: @0x%x assign: %d vq: %d"
 
-# cpu.c
+# cpu-sysemu.c
 cpu_set_state(int cpu_index, uint8_t state) "setting cpu %d state to %" PRIu8
 cpu_halt(int cpu_index) "halting cpu %d"
 cpu_unhalt(int cpu_index) "unhalting cpu %d"
-- 
2.26.2


