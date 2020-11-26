Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 374432C5DA9
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Nov 2020 22:55:40 +0100 (CET)
Received: from localhost ([::1]:41458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kiPEp-0007DR-0a
	for lists+qemu-devel@lfdr.de; Thu, 26 Nov 2020 16:55:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36322)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <agraf@csgraf.de>)
 id 1kiP9q-0001oc-Lr; Thu, 26 Nov 2020 16:50:30 -0500
Received: from mail.csgraf.de ([188.138.100.120]:60626
 helo=zulu616.server4you.de) by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <agraf@csgraf.de>)
 id 1kiP9k-0005mq-LB; Thu, 26 Nov 2020 16:50:30 -0500
Received: from localhost.localdomain
 (dynamic-077-009-187-158.77.9.pool.telefonica.de [77.9.187.158])
 by csgraf.de (Postfix) with ESMTPSA id 78FFE39005A1;
 Thu, 26 Nov 2020 22:50:20 +0100 (CET)
From: Alexander Graf <agraf@csgraf.de>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/8] hvf: Add Apple Silicon support
Date: Thu, 26 Nov 2020 22:50:14 +0100
Message-Id: <20201126215017.41156-6-agraf@csgraf.de>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20201126215017.41156-1-agraf@csgraf.de>
References: <20201126215017.41156-1-agraf@csgraf.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=188.138.100.120; envelope-from=agraf@csgraf.de;
 helo=zulu616.server4you.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cameron Esfahani <dirty@apple.com>, Roman Bolshakov <r.bolshakov@yadro.com>,
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

With Apple Silicon available to the masses, it's a good time to add support
for driving its virtualization extensions from QEMU.

This patch adds all necessary architecture specific code to get basic VMs
working. It's still pretty raw, but definitely functional.

Known limitations:

  - Vtimer acknowledgement is hacky
  - Should implement more sysregs and fault on invalid ones then
  - WFI handling is missing, need to marry it with vtimer

Signed-off-by: Alexander Graf <agraf@csgraf.de>
---
 MAINTAINERS           |   5 +
 accel/hvf/hvf-cpus.c  |   4 +
 include/hw/core/cpu.h |   3 +-
 target/arm/hvf/hvf.c  | 345 ++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 356 insertions(+), 1 deletion(-)
 create mode 100644 target/arm/hvf/hvf.c

diff --git a/MAINTAINERS b/MAINTAINERS
index ca4b6d9279..9cd1d9d448 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -439,6 +439,11 @@ F: accel/accel.c
 F: accel/Makefile.objs
 F: accel/stubs/Makefile.objs
 
+Apple Silicon HVF CPUs
+M: Alexander Graf <agraf@csgraf.de>
+S: Maintained
+F: target/arm/hvf/
+
 X86 HVF CPUs
 M: Cameron Esfahani <dirty@apple.com>
 M: Roman Bolshakov <r.bolshakov@yadro.com>
diff --git a/accel/hvf/hvf-cpus.c b/accel/hvf/hvf-cpus.c
index f9bb5502b7..b9f674478d 100644
--- a/accel/hvf/hvf-cpus.c
+++ b/accel/hvf/hvf-cpus.c
@@ -60,6 +60,10 @@
 
 #include <Hypervisor/Hypervisor.h>
 
+#ifdef __aarch64__
+#define HV_VM_DEFAULT NULL
+#endif
+
 /* Memory slots */
 
 struct mac_slot {
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 3d92c967ff..a711eb04e4 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -463,7 +463,8 @@ struct CPUState {
 
     struct hax_vcpu_state *hax_vcpu;
 
-    int hvf_fd;
+    uint64_t hvf_fd;
+    void *hvf_exit;
 
     /* track IOMMUs whose translations we've cached in the TCG TLB */
     GArray *iommu_notifiers;
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
new file mode 100644
index 0000000000..6b9a02e21c
--- /dev/null
+++ b/target/arm/hvf/hvf.c
@@ -0,0 +1,345 @@
+/*
+ * QEMU Hypervisor.framework support for Apple Silicon
+
+ * Copyright 2020 Alexander Graf <agraf@csgraf.de>
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ *
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/error-report.h"
+
+#include "sysemu/runstate.h"
+#include "sysemu/hvf.h"
+#include "sysemu/hvf_int.h"
+#include "sysemu/hw_accel.h"
+
+#include <Hypervisor/Hypervisor.h>
+
+#include "exec/address-spaces.h"
+#include "hw/irq.h"
+#include "qemu/main-loop.h"
+#include "sysemu/accel.h"
+#include "target/arm/cpu.h"
+#include "target/arm/internals.h"
+
+#define HVF_DEBUG 0
+#define DPRINTF(...)                                        \
+    if (HVF_DEBUG) {                                        \
+        fprintf(stderr, "HVF %s:%d ", __func__, __LINE__);  \
+        fprintf(stderr, __VA_ARGS__);                       \
+        fprintf(stderr, "\n");                              \
+    }
+
+#define SYSREG(op0, op1, op2, crn, crm) \
+    ((op0 << 20) | (op2 << 17) | (op1 << 14) | (crn << 10) | (crm << 1))
+#define SYSREG_MASK           SYSREG(0x3, 0x7, 0x7, 0xf, 0xf)
+#define SYSREG_CNTPCT_EL0     SYSREG(3, 3, 1, 14, 0)
+#define SYSREG_PMCCNTR_EL0    SYSREG(3, 3, 0, 9, 13)
+
+struct hvf_reg_match {
+    int reg;
+    uint64_t offset;
+};
+
+static const struct hvf_reg_match hvf_reg_match[] = {
+    { HV_REG_X0,   offsetof(CPUARMState, xregs[0]) },
+    { HV_REG_X1,   offsetof(CPUARMState, xregs[1]) },
+    { HV_REG_X2,   offsetof(CPUARMState, xregs[2]) },
+    { HV_REG_X3,   offsetof(CPUARMState, xregs[3]) },
+    { HV_REG_X4,   offsetof(CPUARMState, xregs[4]) },
+    { HV_REG_X5,   offsetof(CPUARMState, xregs[5]) },
+    { HV_REG_X6,   offsetof(CPUARMState, xregs[6]) },
+    { HV_REG_X7,   offsetof(CPUARMState, xregs[7]) },
+    { HV_REG_X8,   offsetof(CPUARMState, xregs[8]) },
+    { HV_REG_X9,   offsetof(CPUARMState, xregs[9]) },
+    { HV_REG_X10,  offsetof(CPUARMState, xregs[10]) },
+    { HV_REG_X11,  offsetof(CPUARMState, xregs[11]) },
+    { HV_REG_X12,  offsetof(CPUARMState, xregs[12]) },
+    { HV_REG_X13,  offsetof(CPUARMState, xregs[13]) },
+    { HV_REG_X14,  offsetof(CPUARMState, xregs[14]) },
+    { HV_REG_X15,  offsetof(CPUARMState, xregs[15]) },
+    { HV_REG_X16,  offsetof(CPUARMState, xregs[16]) },
+    { HV_REG_X17,  offsetof(CPUARMState, xregs[17]) },
+    { HV_REG_X18,  offsetof(CPUARMState, xregs[18]) },
+    { HV_REG_X19,  offsetof(CPUARMState, xregs[19]) },
+    { HV_REG_X20,  offsetof(CPUARMState, xregs[20]) },
+    { HV_REG_X21,  offsetof(CPUARMState, xregs[21]) },
+    { HV_REG_X22,  offsetof(CPUARMState, xregs[22]) },
+    { HV_REG_X23,  offsetof(CPUARMState, xregs[23]) },
+    { HV_REG_X24,  offsetof(CPUARMState, xregs[24]) },
+    { HV_REG_X25,  offsetof(CPUARMState, xregs[25]) },
+    { HV_REG_X26,  offsetof(CPUARMState, xregs[26]) },
+    { HV_REG_X27,  offsetof(CPUARMState, xregs[27]) },
+    { HV_REG_X28,  offsetof(CPUARMState, xregs[28]) },
+    { HV_REG_X29,  offsetof(CPUARMState, xregs[29]) },
+    { HV_REG_X30,  offsetof(CPUARMState, xregs[30]) },
+    { HV_REG_PC,   offsetof(CPUARMState, pc) },
+};
+
+int hvf_get_registers(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t ret;
+    uint64_t val;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
+        ret = hv_vcpu_get_reg(cpu->hvf_fd, hvf_reg_match[i].reg, &val);
+        *(uint64_t *)((void *)env + hvf_reg_match[i].offset) = val;
+        assert_hvf_ok(ret);
+    }
+
+    val = 0;
+    ret = hv_vcpu_get_reg(cpu->hvf_fd, HV_REG_FPCR, &val);
+    assert_hvf_ok(ret);
+    vfp_set_fpcr(env, val);
+
+    val = 0;
+    ret = hv_vcpu_get_reg(cpu->hvf_fd, HV_REG_FPSR, &val);
+    assert_hvf_ok(ret);
+    vfp_set_fpsr(env, val);
+
+    ret = hv_vcpu_get_reg(cpu->hvf_fd, HV_REG_CPSR, &val);
+    assert_hvf_ok(ret);
+    pstate_write(env, val);
+
+    return 0;
+}
+
+int hvf_put_registers(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_return_t ret;
+    uint64_t val;
+    int i;
+
+    for (i = 0; i < ARRAY_SIZE(hvf_reg_match); i++) {
+        val = *(uint64_t *)((void *)env + hvf_reg_match[i].offset);
+        ret = hv_vcpu_set_reg(cpu->hvf_fd, hvf_reg_match[i].reg, val);
+
+        assert_hvf_ok(ret);
+    }
+
+    ret = hv_vcpu_set_reg(cpu->hvf_fd, HV_REG_FPCR, vfp_get_fpcr(env));
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_set_reg(cpu->hvf_fd, HV_REG_FPSR, vfp_get_fpsr(env));
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_set_reg(cpu->hvf_fd, HV_REG_CPSR, pstate_read(env));
+    assert_hvf_ok(ret);
+
+    ret = hv_vcpu_set_sys_reg(cpu->hvf_fd, HV_SYS_REG_MPIDR_EL1,
+                              arm_cpu->mp_affinity);
+    assert_hvf_ok(ret);
+
+    return 0;
+}
+
+void hvf_arch_vcpu_destroy(CPUState *cpu)
+{
+}
+
+int hvf_arch_init_vcpu(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    env->aarch64 = 1;
+
+    return 0;
+}
+
+static int hvf_process_events(CPUState *cpu)
+{
+    DPRINTF("");
+    return 0;
+}
+
+static int hvf_inject_interrupts(CPUState *cpu)
+{
+    if (cpu->interrupt_request & CPU_INTERRUPT_FIQ) {
+        DPRINTF("injecting FIQ");
+        hv_vcpu_set_pending_interrupt(cpu->hvf_fd, HV_INTERRUPT_TYPE_FIQ, true);
+    }
+
+    if (cpu->interrupt_request & CPU_INTERRUPT_HARD) {
+        DPRINTF("injecting IRQ");
+        hv_vcpu_set_pending_interrupt(cpu->hvf_fd, HV_INTERRUPT_TYPE_IRQ, true);
+    }
+
+    return 0;
+}
+
+int hvf_vcpu_exec(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+    hv_vcpu_exit_t *hvf_exit = cpu->hvf_exit;
+    int ret = 0;
+
+    if (hvf_process_events(cpu)) {
+        return EXCP_HLT;
+    }
+
+    do {
+        process_queued_cpu_work(cpu);
+
+        if (cpu->vcpu_dirty) {
+            hvf_put_registers(cpu);
+            cpu->vcpu_dirty = false;
+        }
+
+        if (hvf_inject_interrupts(cpu)) {
+            return EXCP_INTERRUPT;
+        }
+
+        qemu_mutex_unlock_iothread();
+        if (cpu->cpu_index && cpu->halted) {
+            qemu_mutex_lock_iothread();
+            return EXCP_HLT;
+        }
+
+        assert_hvf_ok(hv_vcpu_run(cpu->hvf_fd));
+
+        /* handle VMEXIT */
+        uint64_t exit_reason = hvf_exit->reason;
+        uint64_t syndrome = hvf_exit->exception.syndrome;
+        uint32_t ec = syn_get_ec(syndrome);
+
+        cpu_synchronize_state(cpu);
+
+        qemu_mutex_lock_iothread();
+
+        current_cpu = cpu;
+
+        switch (exit_reason) {
+        case HV_EXIT_REASON_EXCEPTION:
+            /* This is the main one, handle below. */
+            break;
+        case HV_EXIT_REASON_VTIMER_ACTIVATED:
+            qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 1);
+            continue;
+        case HV_EXIT_REASON_CANCELED:
+            /* we got kicked, no exit to process */
+            continue;
+        default:
+            assert(0);
+        }
+
+        ret = 0;
+        switch (ec) {
+        case EC_DATAABORT: {
+            bool isv = syndrome & ARM_EL_ISV;
+            bool iswrite = (syndrome >> 6) & 1;
+            bool s1ptw = (syndrome >> 7) & 1;
+            uint32_t sas = (syndrome >> 22) & 3;
+            uint32_t len = 1 << sas;
+            uint32_t srt = (syndrome >> 16) & 0x1f;
+            uint64_t val = 0;
+
+            DPRINTF("data abort: [pc=0x%llx va=0x%016llx pa=0x%016llx isv=%x "
+                    "iswrite=%x s1ptw=%x len=%d srt=%d]\n",
+                    env->pc, hvf_exit->exception.virtual_address,
+                    hvf_exit->exception.physical_address, isv, iswrite,
+                    s1ptw, len, srt);
+
+            assert(isv);
+
+            if (iswrite) {
+                val = env->xregs[srt];
+                address_space_write(&address_space_memory,
+                                    hvf_exit->exception.physical_address,
+                                    MEMTXATTRS_UNSPECIFIED, &val, len);
+
+                /*
+                 * We do not have a callback to see if the timer is out of
+                 * state. That means every MMIO write could potentially be
+                 * an EOI ends the vtimer. Until we get an actual callback,
+                 * let's just see if the timer is still pending on every
+                 * possible toggle point.
+                 */
+                qemu_set_irq(arm_cpu->gt_timer_outputs[GTIMER_VIRT], 0);
+                hv_vcpu_set_vtimer_mask(cpu->hvf_fd, false);
+            } else {
+                address_space_read(&address_space_memory,
+                                   hvf_exit->exception.physical_address,
+                                   MEMTXATTRS_UNSPECIFIED, &val, len);
+                env->xregs[srt] = val;
+            }
+
+            env->pc += 4;
+            break;
+        }
+        case EC_SYSTEMREGISTERTRAP: {
+            bool isread = (syndrome >> 21) & 1;
+            uint32_t rt = (syndrome >> 5) & 0x1f;
+            uint32_t reg = syndrome & SYSREG_MASK;
+            uint64_t val = 0;
+
+            if (isread) {
+                switch (reg) {
+                case SYSREG_CNTPCT_EL0:
+                    val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL) /
+                          gt_cntfrq_period_ns(arm_cpu);
+                    break;
+                case SYSREG_PMCCNTR_EL0:
+                    val = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+                    break;
+                default:
+                    DPRINTF("unhandled sysreg read %08x (op0=%d op1=%d op2=%d "
+                            "crn=%d crm=%d)", reg, (reg >> 20) & 0x3,
+                            (reg >> 14) & 0x7, (reg >> 17) & 0x7,
+                            (reg >> 10) & 0xf, (reg >> 1) & 0xf);
+                    break;
+                }
+
+                env->xregs[rt] = val;
+            } else {
+                val = env->xregs[rt];
+                switch (reg) {
+                case SYSREG_CNTPCT_EL0:
+                    break;
+                default:
+                    DPRINTF("unhandled sysreg write %08x", reg);
+                    break;
+                }
+            }
+
+            env->pc += 4;
+            break;
+        }
+        case EC_WFX_TRAP:
+            /* No halting yet */
+            break;
+        case EC_AA64_HVC:
+            if (arm_is_psci_call(arm_cpu, EXCP_HVC)) {
+                arm_handle_psci_call(arm_cpu);
+            } else {
+                DPRINTF("unknown HVC! %016llx", env->xregs[0]);
+                env->xregs[0] = -1;
+            }
+            break;
+        case EC_AA64_SMC:
+            if (arm_is_psci_call(arm_cpu, EXCP_SMC)) {
+                arm_handle_psci_call(arm_cpu);
+            } else {
+                DPRINTF("unknown SMC! %016llx", env->xregs[0]);
+                env->xregs[0] = -1;
+                env->pc += 4;
+            }
+            break;
+        default:
+            DPRINTF("exit: %llx [ec=0x%x pc=0x%llx]", syndrome, ec, env->pc);
+            error_report("%llx: unhandled exit %llx", env->pc, exit_reason);
+        }
+    } while (ret == 0);
+
+    return ret;
+}
-- 
2.24.3 (Apple Git-128)


