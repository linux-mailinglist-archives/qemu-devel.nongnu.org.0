Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B39C961A19D
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Nov 2022 20:55:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1or2lP-0005Rd-Ib; Fri, 04 Nov 2022 15:54:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1or1dv-00056x-7V; Fri, 04 Nov 2022 14:42:16 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <francesco.cagnin@gmail.com>)
 id 1or1dr-0004a0-Qz; Fri, 04 Nov 2022 14:42:14 -0400
Received: by mail-wr1-x42e.google.com with SMTP id g12so8197701wrs.10;
 Fri, 04 Nov 2022 11:42:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=p9AwIQERZ9cPqVc9yQGPgfkQyPCzkTPEbXtojUrtknU=;
 b=YEq2yKwHvkd7ziU+a2JsUi5s6ZqhA8A8KsRWzZo3P8Og5kQUOl2iPAtLGXeVyi2lf2
 SYee4Wh5HYLpcF0RAopD3pRC9w1ADB7k+GZEkf4xCVkX+D+GXlynT+Zsq2DSdPLCLPpb
 YeSfwWOwgcKTf48z2FslM34Si889nRBPOEQ5w07imC5aDY5ngxoAVT0y2oQZ1risCiRM
 b8UplvbCNKHIfmOXi5A0f0bFrF85O9uEV+j2aFxgdlllkiCVmyVwCGzVh7vgBtEnC581
 AZ4OHkIcQZfOyKIZR4Mf8JB9UWMPr8We3IRXGvYIEG8BBfMVm/JX+iYbDAIqPnck3XTm
 rP7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=p9AwIQERZ9cPqVc9yQGPgfkQyPCzkTPEbXtojUrtknU=;
 b=zGphWLbgMQ4Y63JNwMe4NvKrsQBT6X366EUZIQUk6vIG/AJAUrYNnK6fAYASGpwLyZ
 xEDxjkTkztjUvg9+xIjH4zlv13fad7JD53RFRJhM0YE/+87BWSJ0j2R+2hyzyxuhcd+t
 y8p5VrMtzmHTys6oaGYwp2W79UqsIc0xnUC4MCcdyIRAccOjR1+MFIvDuqK8aSwcKtuI
 qdoKsmgFcY8UTE8d1gvBtwfoncyQUXtonX5sty6b5DyN3KpV6FQNzCjzVAxmxmf0dMhr
 PLHpuZUZJEbmkuogLljTSFe4vD2T1iUq2e6gzdTPkK2MynHiqWNx2xPLFGW6ZuVv4cdr
 2sug==
X-Gm-Message-State: ACrzQf3t1h1H9xiXPGMq2V2hAEzTNgbGe/Tjp15UCPl5hexEdZbleG/k
 nGMa7Ico9VP96Y6EdOlkPzyo1IXHlCio2w==
X-Google-Smtp-Source: AMsMyM7NgYEV9qV9a2yOgxrnbcLktuMziQzVP9mMP4tdMYyoU5CBpWFXmpVq511BM+ZkqO3OoNpo3g==
X-Received: by 2002:a05:6000:2c1:b0:236:d474:f053 with SMTP id
 o1-20020a05600002c100b00236d474f053mr17089227wry.517.1667587328920; 
 Fri, 04 Nov 2022 11:42:08 -0700 (PDT)
Received: from localhost.localdomain (216.87.95.79.rev.sfr.net. [79.95.87.216])
 by smtp.gmail.com with ESMTPSA id
 q11-20020a05600000cb00b00236e9755c02sm22217wrx.111.2022.11.04.11.42.07
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 04 Nov 2022 11:42:08 -0700 (PDT)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: dirty@apple.com, r.bolshakov@yadro.com, peter.maydell@linaro.org,
 qemu-arm@nongnu.org, agraf@csgraf.de, pbonzini@redhat.com,
 Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH 2/3] hvf: implement guest debugging on Apple Silicon hosts
Date: Fri,  4 Nov 2022 19:41:00 +0100
Message-Id: <20221104184101.6923-3-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221104184101.6923-1-fcagnin@quarkslab.com>
References: <20221104184101.6923-1-fcagnin@quarkslab.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=francesco.cagnin@gmail.com; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 04 Nov 2022 15:53:47 -0400
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Francesco Cagnin <fcagnin@quarkslab.com>

Support is added for single-stepping, software breakpoints, hardware
breakpoints and watchpoints. The code has been structured like the KVM
counterpart (and many parts are basically identical).

Guests can be debugged through the gdbstub.

Signed-off-by: Francesco Cagnin <fcagnin@quarkslab.com>
---
 accel/hvf/hvf-accel-ops.c | 124 ++++++++++++++++++++++++
 accel/hvf/hvf-all.c       |  24 +++++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++++++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 194 +++++++++++++++++++++++++++++++++++++-
 6 files changed, 374 insertions(+), 1 deletion(-)

diff --git a/accel/hvf/hvf-accel-ops.c b/accel/hvf/hvf-accel-ops.c
index 24913ca9c4..5ff5778d55 100644
--- a/accel/hvf/hvf-accel-ops.c
+++ b/accel/hvf/hvf-accel-ops.c
@@ -52,6 +52,7 @@
 #include "qemu/main-loop.h"
 #include "exec/address-spaces.h"
 #include "exec/exec-all.h"
+#include "exec/gdbstub.h"
 #include "sysemu/cpus.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
@@ -340,12 +341,18 @@ static int hvf_accel_init(MachineState *ms)
     return hvf_arch_init();
 }
 
+static int hvf_gdbstub_sstep_flags(void)
+{
+    return SSTEP_ENABLE;
+}
+
 static void hvf_accel_class_init(ObjectClass *oc, void *data)
 {
     AccelClass *ac = ACCEL_CLASS(oc);
     ac->name = "HVF";
     ac->init_machine = hvf_accel_init;
     ac->allowed = &hvf_allowed;
+    ac->gdbstub_supported_sstep_flags = hvf_gdbstub_sstep_flags;
 }
 
 static const TypeInfo hvf_accel_type = {
@@ -462,6 +469,118 @@ static void hvf_start_vcpu_thread(CPUState *cpu)
                        cpu, QEMU_THREAD_JOINABLE);
 }
 
+static bool hvf_supports_guest_debug(void)
+{
+#ifdef TARGET_AARCH64
+    return true;
+#else
+    return false;
+#endif
+}
+
+static int hvf_insert_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+{
+    struct hvf_sw_breakpoint *bp;
+    int err;
+
+    if (type == GDB_BREAKPOINT_SW) {
+        bp = hvf_find_sw_breakpoint(cpu, addr);
+        if (bp) {
+            bp->use_count++;
+            return 0;
+        }
+
+        bp = g_new(struct hvf_sw_breakpoint, 1);
+        bp->pc = addr;
+        bp->use_count = 1;
+        err = hvf_arch_insert_sw_breakpoint(cpu, bp);
+        if (err) {
+            g_free(bp);
+            return err;
+        }
+
+        QTAILQ_INSERT_HEAD(&hvf_state->hvf_sw_breakpoints, bp, entry);
+    } else {
+        err = hvf_arch_insert_hw_breakpoint(addr, len, type);
+        if (err) {
+            return err;
+        }
+    }
+
+    CPU_FOREACH(cpu) {
+        err = hvf_update_guest_debug(cpu);
+        if (err) {
+            return err;
+        }
+    }
+    return 0;
+}
+
+static int hvf_remove_breakpoint(CPUState *cpu, int type, hwaddr addr, hwaddr len)
+{
+    struct hvf_sw_breakpoint *bp;
+    int err;
+
+    if (type == GDB_BREAKPOINT_SW) {
+        bp = hvf_find_sw_breakpoint(cpu, addr);
+        if (!bp) {
+            return -ENOENT;
+        }
+
+        if (bp->use_count > 1) {
+            bp->use_count--;
+            return 0;
+        }
+
+        err = hvf_arch_remove_sw_breakpoint(cpu, bp);
+        if (err) {
+            return err;
+        }
+
+        QTAILQ_REMOVE(&hvf_state->hvf_sw_breakpoints, bp, entry);
+        g_free(bp);
+    } else {
+        err = hvf_arch_remove_hw_breakpoint(addr, len, type);
+        if (err) {
+            return err;
+        }
+    }
+
+    CPU_FOREACH(cpu) {
+        err = hvf_update_guest_debug(cpu);
+        if (err) {
+            return err;
+        }
+    }
+    return 0;
+}
+
+static void hvf_remove_all_breakpoints(CPUState *cpu)
+{
+    struct hvf_sw_breakpoint *bp, *next;
+    HVFState *s = hvf_state;
+    CPUState *tmpcpu;
+
+    QTAILQ_FOREACH_SAFE(bp, &s->hvf_sw_breakpoints, entry, next) {
+        if (hvf_arch_remove_sw_breakpoint(cpu, bp) != 0) {
+            /* Try harder to find a CPU that currently sees the breakpoint. */
+            CPU_FOREACH(tmpcpu)
+            {
+                if (hvf_arch_remove_sw_breakpoint(tmpcpu, bp) == 0) {
+                    break;
+                }
+            }
+        }
+        QTAILQ_REMOVE(&s->hvf_sw_breakpoints, bp, entry);
+        g_free(bp);
+    }
+    hvf_arch_remove_all_hw_breakpoints();
+
+    CPU_FOREACH(cpu) {
+        hvf_update_guest_debug(cpu);
+    }
+}
+
 static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
 {
     AccelOpsClass *ops = ACCEL_OPS_CLASS(oc);
@@ -473,6 +592,11 @@ static void hvf_accel_ops_class_init(ObjectClass *oc, void *data)
     ops->synchronize_post_init = hvf_cpu_synchronize_post_init;
     ops->synchronize_state = hvf_cpu_synchronize_state;
     ops->synchronize_pre_loadvm = hvf_cpu_synchronize_pre_loadvm;
+
+    ops->supports_guest_debug = hvf_supports_guest_debug;
+    ops->insert_breakpoint = hvf_insert_breakpoint;
+    ops->remove_breakpoint = hvf_remove_breakpoint;
+    ops->remove_all_breakpoints = hvf_remove_all_breakpoints;
 };
 static const TypeInfo hvf_accel_ops_type = {
     .name = ACCEL_OPS_NAME("hvf"),
diff --git a/accel/hvf/hvf-all.c b/accel/hvf/hvf-all.c
index 0043f4d308..35c37b537e 100644
--- a/accel/hvf/hvf-all.c
+++ b/accel/hvf/hvf-all.c
@@ -10,6 +10,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/error-report.h"
+#include "exec/gdbstub.h"
 #include "sysemu/hvf.h"
 #include "sysemu/hvf_int.h"
 
@@ -44,3 +45,26 @@ void assert_hvf_ok(hv_return_t ret)
 
     abort();
 }
+
+struct hvf_sw_breakpoint *hvf_find_sw_breakpoint(CPUState *cpu, target_ulong pc)
+{
+    struct hvf_sw_breakpoint *bp;
+
+    QTAILQ_FOREACH(bp, &hvf_state->hvf_sw_breakpoints, entry) {
+        if (bp->pc == pc) {
+            return bp;
+        }
+    }
+    return NULL;
+}
+
+int hvf_sw_breakpoints_active(CPUState *cpu)
+{
+    return !QTAILQ_EMPTY(&hvf_state->hvf_sw_breakpoints);
+}
+
+int hvf_update_guest_debug(CPUState *cpu)
+{
+    hvf_arch_update_guest_debug(cpu);
+    return 0;
+}
diff --git a/cpu.c b/cpu.c
index 4a7d865427..1fd531aabd 100644
--- a/cpu.c
+++ b/cpu.c
@@ -33,6 +33,7 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
+#include "sysemu/hvf.h"
 #include "sysemu/replay.h"
 #include "exec/cpu-common.h"
 #include "exec/exec-all.h"
@@ -389,6 +390,8 @@ void cpu_single_step(CPUState *cpu, int enabled)
         cpu->singlestep_enabled = enabled;
         if (kvm_enabled()) {
             kvm_update_guest_debug(cpu, 0);
+        } else if (hvf_enabled()) {
+            hvf_update_guest_debug(cpu);
         }
         trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }
diff --git a/include/sysemu/hvf.h b/include/sysemu/hvf.h
index bb70082e45..3e99c80416 100644
--- a/include/sysemu/hvf.h
+++ b/include/sysemu/hvf.h
@@ -36,4 +36,33 @@ typedef struct HVFState HVFState;
 DECLARE_INSTANCE_CHECKER(HVFState, HVF_STATE,
                          TYPE_HVF_ACCEL)
 
+#ifdef NEED_CPU_H
+#include "cpu.h"
+
+int hvf_update_guest_debug(CPUState *cpu);
+
+struct hvf_sw_breakpoint {
+    target_ulong pc;
+    target_ulong saved_insn;
+    int use_count;
+    QTAILQ_ENTRY(hvf_sw_breakpoint) entry;
+};
+
+struct hvf_sw_breakpoint *hvf_find_sw_breakpoint(CPUState *cpu,
+                                                 target_ulong pc);
+
+int hvf_sw_breakpoints_active(CPUState *cpu);
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp);
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp);
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len,
+                                  int type);
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len,
+                                  int type);
+void hvf_arch_remove_all_hw_breakpoints(void);
+
+void hvf_arch_update_guest_debug(CPUState *cpu);
+
+#endif /* NEED_CPU_H */
+
 #endif
diff --git a/include/sysemu/hvf_int.h b/include/sysemu/hvf_int.h
index 6545f7cd61..3592239fdc 100644
--- a/include/sysemu/hvf_int.h
+++ b/include/sysemu/hvf_int.h
@@ -45,6 +45,7 @@ struct HVFState {
 
     hvf_vcpu_caps *hvf_caps;
     uint64_t vtimer_offset;
+    QTAILQ_HEAD(, hvf_sw_breakpoint) hvf_sw_breakpoints;
 };
 extern HVFState *hvf_state;
 
diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 060aa0ccf4..211b296500 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -31,6 +31,24 @@
 #include "trace/trace-target_arm_hvf.h"
 #include "migration/vmstate.h"
 
+#include "exec/gdbstub.h"
+
+static bool trap_debug_exceptions;
+
+static void hvf_arm_init_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+
+    max_hw_bps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 12, 4);
+    hw_breakpoints =
+        g_array_sized_new(true, true, sizeof(HWBreakpoint), max_hw_bps);
+
+    max_hw_wps = 1 + extract64(arm_cpu->isar.id_aa64dfr0, 20, 4);
+    hw_watchpoints =
+        g_array_sized_new(true, true, sizeof(HWWatchpoint), max_hw_wps);
+    return;
+}
+
 #define HVF_SYSREG(crn, crm, op0, op1, op2) \
         ENCODE_AA64_CP_REG(CP_REG_ARM64_SYSREG_CP, crn, crm, op0, op1, op2)
 #define PL1_WRITE_MASK 0x4
@@ -621,6 +639,8 @@ int hvf_arch_init_vcpu(CPUState *cpu)
                               &arm_cpu->isar.id_aa64mmfr0);
     assert_hvf_ok(ret);
 
+    hvf_arm_init_debug(cpu);
+
     return 0;
 }
 
@@ -1166,6 +1186,7 @@ int hvf_vcpu_exec(CPUState *cpu)
 {
     ARMCPU *arm_cpu = ARM_CPU(cpu);
     CPUARMState *env = &arm_cpu->env;
+    int ret;
     hv_vcpu_exit_t *hvf_exit = cpu->hvf->exit;
     hv_return_t r;
     bool advance_pc = false;
@@ -1180,6 +1201,9 @@ int hvf_vcpu_exec(CPUState *cpu)
 
     flush_cpu_state(cpu);
 
+    r = hv_vcpu_set_trap_debug_exceptions(cpu->hvf->fd, trap_debug_exceptions);
+    assert_hvf_ok(r);
+
     qemu_mutex_unlock_iothread();
     assert_hvf_ok(hv_vcpu_run(cpu->hvf->fd));
 
@@ -1188,6 +1212,7 @@ int hvf_vcpu_exec(CPUState *cpu)
     uint64_t syndrome = hvf_exit->exception.syndrome;
     uint32_t ec = syn_get_ec(syndrome);
 
+    ret = 0;
     qemu_mutex_lock_iothread();
     switch (exit_reason) {
     case HV_EXIT_REASON_EXCEPTION:
@@ -1207,6 +1232,47 @@ int hvf_vcpu_exec(CPUState *cpu)
     hvf_sync_vtimer(cpu);
 
     switch (ec) {
+    case EC_SOFTWARESTEP: {
+        ret = EXCP_DEBUG;
+
+        if (!cpu->singlestep_enabled) {
+            error_report("EC_SOFTWARESTEP but single-stepping not enabled");
+        }
+        break;
+    }
+    case EC_AA64_BKPT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        if (!hvf_find_sw_breakpoint(cpu, env->pc)) {
+            error_report("EC_AA64_BKPT but unknown sw breakpoint");
+        }
+        break;
+    }
+    case EC_BREAKPOINT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        if (!find_hw_breakpoint(cpu, env->pc)) {
+            error_report("EC_BREAKPOINT but unknown hw breakpoint");
+        }
+        break;
+    }
+    case EC_WATCHPOINT: {
+        ret = EXCP_DEBUG;
+
+        cpu_synchronize_state(cpu);
+
+        CPUWatchpoint *wp =
+            find_hw_watchpoint(cpu, hvf_exit->exception.virtual_address);
+        if (!wp) {
+            error_report("EXCP_DEBUG but unknown hw watchpoint");
+        }
+        cpu->watchpoint_hit = wp;
+        break;
+    }
     case EC_DATAABORT: {
         bool isv = syndrome & ARM_EL_ISV;
         bool iswrite = (syndrome >> 6) & 1;
@@ -1313,7 +1379,7 @@ int hvf_vcpu_exec(CPUState *cpu)
         assert_hvf_ok(r);
     }
 
-    return 0;
+    return ret;
 }
 
 static const VMStateDescription vmstate_hvf_vtimer = {
@@ -1347,3 +1413,129 @@ int hvf_arch_init(void)
     qemu_add_vm_change_state_handler(hvf_vm_state_change, &vtimer);
     return 0;
 }
+
+static inline bool hvf_arm_hw_debug_active(CPUState *cpu)
+{
+    return ((cur_hw_wps > 0) || (cur_hw_bps > 0));
+}
+
+static const uint32_t brk_insn = 0xd4200000;
+
+int hvf_arch_insert_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    if (cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&bp->saved_insn, 4, 0) ||
+        cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&brk_insn, 4, 1)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+int hvf_arch_remove_sw_breakpoint(CPUState *cpu, struct hvf_sw_breakpoint *bp)
+{
+    static uint32_t brk;
+
+    if (cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&brk, 4, 0) ||
+        brk != brk_insn ||
+        cpu_memory_rw_debug(cpu, bp->pc, (uint8_t *)&bp->saved_insn, 4, 1)) {
+        return -EINVAL;
+    }
+    return 0;
+}
+
+int hvf_arch_insert_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return insert_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return insert_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+int hvf_arch_remove_hw_breakpoint(target_ulong addr, target_ulong len, int type)
+{
+    switch (type) {
+    case GDB_BREAKPOINT_HW:
+        return delete_hw_breakpoint(addr);
+    case GDB_WATCHPOINT_READ:
+    case GDB_WATCHPOINT_WRITE:
+    case GDB_WATCHPOINT_ACCESS:
+        return delete_hw_watchpoint(addr, len, type);
+    default:
+        return -ENOSYS;
+    }
+}
+
+void hvf_arch_remove_all_hw_breakpoints(void)
+{
+    if (cur_hw_wps > 0) {
+        g_array_remove_range(hw_watchpoints, 0, cur_hw_wps);
+    }
+    if (cur_hw_bps > 0) {
+        g_array_remove_range(hw_breakpoints, 0, cur_hw_bps);
+    }
+}
+
+#define MDSCR_EL1_SS_SHIFT  0
+#define MDSCR_EL1_MDE_SHIFT 15
+
+void hvf_arch_update_guest_debug(CPUState *cpu)
+{
+    ARMCPU *arm_cpu = ARM_CPU(cpu);
+    CPUARMState *env = &arm_cpu->env;
+
+    cpu_synchronize_state(cpu);
+
+    trap_debug_exceptions = false;
+
+    if (cpu->singlestep_enabled) {
+        trap_debug_exceptions = true;
+
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 1);
+        pstate_write(env, pstate_read(env) | PSTATE_SS);
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_SS_SHIFT, 1, 0);
+    }
+
+    if (hvf_sw_breakpoints_active(cpu)) {
+        trap_debug_exceptions = true;
+    }
+
+    if (hvf_arm_hw_debug_active(cpu)) {
+        trap_debug_exceptions = true;
+
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 1);
+
+        int i;
+        for (i = 0; i < cur_hw_bps; i++) {
+            HWBreakpoint *bp = get_hw_bp(i);
+            env->cp15.dbgbcr[i] = bp->bcr;
+            env->cp15.dbgbvr[i] = bp->bvr;
+        }
+        for (i = 0; i < cur_hw_wps; i++) {
+            HWWatchpoint *bp = get_hw_wp(i);
+            env->cp15.dbgwcr[i] = bp->wcr;
+            env->cp15.dbgwvr[i] = bp->wvr;
+        }
+    } else {
+        env->cp15.mdscr_el1 =
+            deposit64(env->cp15.mdscr_el1, MDSCR_EL1_MDE_SHIFT, 1, 0);
+
+        int i;
+        for (i = 0; i < max_hw_bps; i++) {
+            env->cp15.dbgbcr[i] = 0;
+            env->cp15.dbgbvr[i] = 0;
+        }
+        for (i = 0; i < max_hw_wps; i++) {
+            env->cp15.dbgwcr[i] = 0;
+            env->cp15.dbgwvr[i] = 0;
+        }
+    }
+}
-- 
2.38.1


