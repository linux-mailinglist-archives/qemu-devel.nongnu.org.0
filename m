Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E24C950DCE7
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:39:09 +0200 (CEST)
Received: from localhost ([::1]:39104 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivBV-0006Ba-1H
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:39:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48292)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukL-0008C1-1F
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:05 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39408 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukI-0001Hw-EM
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:04 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S25; 
 Mon, 25 Apr 2022 17:10:50 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 23/43] target/loongarch: Add LoongArch interrupt and
 exception handle
Date: Mon, 25 Apr 2022 17:10:07 +0800
Message-Id: <20220425091027.2877892-24-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S25
X-Coremail-Antispam: 1UD129KBjvJXoWxtFyUWF1kCr4xJrW7XrW7twb_yoWDGrWfpF
 1IkrW0yry5JrZrA343J398Arn8Zw1xGws2va43GayFkr48Wry0qrWvqr9ruF17C3yrZrW7
 uFs3Ary5u3WUAFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: mark.cave-ayland@ilande.co.uk, richard.henderson@linaro.org,
 gaosong@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c       | 229 +++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h       |   2 +
 target/loongarch/internals.h |   2 +
 3 files changed, 233 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 8a6bc24630..f7c102dfc5 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -80,6 +80,214 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+void loongarch_cpu_set_irq(void *opaque, int irq, int level)
+{
+    LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
+    CPUState *cs = CPU(cpu);
+
+    if (irq < 0 || irq >= N_IRQS) {
+        return;
+    }
+
+    env->CSR_ESTAT = deposit64(env->CSR_ESTAT, irq, 1, level != 0);
+
+    if (FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS)) {
+        cpu_interrupt(cs, CPU_INTERRUPT_HARD);
+    } else {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+}
+
+static inline bool cpu_loongarch_hw_interrupts_enabled(CPULoongArchState *env)
+{
+    bool ret = 0;
+
+    ret = (FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE) &&
+          !(FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)));
+
+    return ret;
+}
+
+/* Check if there is pending and not masked out interrupt */
+static inline bool cpu_loongarch_hw_interrupts_pending(CPULoongArchState *env)
+{
+    uint32_t pending;
+    uint32_t status;
+    bool r;
+
+    pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
+    status  = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
+
+    r = (pending & status) != 0;
+    return r;
+}
+
+static void loongarch_cpu_do_interrupt(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool update_badinstr = 1;
+    int cause = -1;
+    const char *name;
+    bool tlbfill = FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR);
+    uint32_t vec_size = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
+
+    if (cs->exception_index != EXCCODE_INT) {
+        if (cs->exception_index < 0 ||
+            cs->exception_index > ARRAY_SIZE(excp_names)) {
+            name = "unknown";
+        } else {
+            name = excp_names[cs->exception_index];
+        }
+
+        qemu_log_mask(CPU_LOG_INT,
+                     "%s enter: pc " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                     " TLBRERA " TARGET_FMT_lx " %s exception\n", __func__,
+                     env->pc, env->CSR_ERA, env->CSR_TLBRERA, name);
+    }
+
+    switch (cs->exception_index) {
+    case EXCCODE_DBP:
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DCL, 1);
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, ECODE, 0xC);
+        goto set_DERA;
+    set_DERA:
+        env->CSR_DERA = env->pc;
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DST, 1);
+        env->pc = env->CSR_EENTRY + 0x480;
+        break;
+    case EXCCODE_INT:
+        if (FIELD_EX64(env->CSR_DBG, CSR_DBG, DST)) {
+            env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DEI, 1);
+            goto set_DERA;
+        }
+        QEMU_FALLTHROUGH;
+    case EXCCODE_PIF:
+        cause = cs->exception_index;
+        update_badinstr = 0;
+        break;
+    case EXCCODE_ADEM:
+    case EXCCODE_SYS:
+    case EXCCODE_BRK:
+    case EXCCODE_PIL:
+    case EXCCODE_PIS:
+    case EXCCODE_PME:
+    case EXCCODE_PNR:
+    case EXCCODE_PNX:
+    case EXCCODE_PPI:
+    case EXCCODE_INE:
+    case EXCCODE_IPE:
+    case EXCCODE_FPE:
+        cause = cs->exception_index;
+        break;
+    default:
+        qemu_log("Error: exception(%d) '%s' has not been supported\n",
+                 cs->exception_index, excp_names[cs->exception_index]);
+        abort();
+    }
+
+    if (update_badinstr) {
+        env->CSR_BADI = cpu_ldl_code(env, env->pc);
+    }
+
+    /* Save PLV and IE */
+    if (tlbfill) {
+        env->CSR_TLBRPRMD = FIELD_DP64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PPLV,
+                                       FIELD_EX64(env->CSR_CRMD,
+                                       CSR_CRMD, PLV));
+        env->CSR_TLBRPRMD = FIELD_DP64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PIE,
+                                       FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE));
+        /* set the DA mode */
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, DA, 1);
+        env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PG, 0);
+        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA,
+                                      PC, (env->pc >> 2));
+    } else {
+        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
+        env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PPLV,
+                                   FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV));
+        env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PIE,
+                                   FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE));
+        env->CSR_ERA = env->pc;
+    }
+
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
+
+    if  (cs->exception_index == EXCCODE_INT) {
+        /* Interrupt */
+        uint32_t vector = 0;
+        uint32_t pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
+        pending &= FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
+
+        /* Find the highest-priority interrupt. */
+        vector = 31 - clz32(pending);
+        env->pc = env->CSR_EENTRY + (EXCCODE_EXTERNAL_INT + vector) * vec_size;
+        qemu_log_mask(CPU_LOG_INT,
+                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                      " cause %d\n" "    A " TARGET_FMT_lx " D "
+                      TARGET_FMT_lx " vector = %d ExC %08lx ExS %08lx\n",
+                      __func__, env->pc, env->CSR_ERA,
+                      cause, env->CSR_BADV, env->CSR_DERA, vector,
+                      env->CSR_ECFG, env->CSR_ESTAT);
+    } else {
+        if (tlbfill) {
+            env->pc = env->CSR_TLBRENTRY;
+        } else {
+            env->pc = env->CSR_EENTRY;
+            env->pc += cause * vec_size;
+        }
+        qemu_log_mask(CPU_LOG_INT,
+                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                      " cause %d%s\n, ESTAT " TARGET_FMT_lx
+                      " EXCFG " TARGET_FMT_lx " BADVA " TARGET_FMT_lx
+                      "BADI " TARGET_FMT_lx " SYS_NUM " TARGET_FMT_lu
+                      " cpu %d asid 0x%lx" "\n", __func__, env->pc,
+                      tlbfill ? env->CSR_TLBRERA : env->CSR_ERA,
+                      cause, tlbfill ? "(refill)" : "", env->CSR_ESTAT,
+                      env->CSR_ECFG,
+                      tlbfill ? env->CSR_TLBRBADV : env->CSR_BADV,
+                      env->CSR_BADI, env->gpr[11], cs->cpu_index,
+                      env->CSR_ASID);
+    }
+    cs->exception_index = -1;
+}
+
+static void loongarch_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                                vaddr addr, unsigned size,
+                                                MMUAccessType access_type,
+                                                int mmu_idx, MemTxAttrs attrs,
+                                                MemTxResult response,
+                                                uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    if (access_type == MMU_INST_FETCH) {
+        do_raise_exception(env, EXCCODE_ADEF, retaddr);
+    } else {
+        do_raise_exception(env, EXCCODE_ADEM, retaddr);
+    }
+}
+
+static bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_HARD) {
+        LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+        CPULoongArchState *env = &cpu->env;
+
+        if (cpu_loongarch_hw_interrupts_enabled(env) &&
+            cpu_loongarch_hw_interrupts_pending(env)) {
+            /* Raise it */
+            cs->exception_index = EXCCODE_INT;
+            loongarch_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -91,6 +299,20 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 }
 #endif /* CONFIG_TCG */
 
+static bool loongarch_cpu_has_work(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool has_work = false;
+
+    if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        cpu_loongarch_hw_interrupts_pending(env)) {
+        has_work = true;
+    }
+
+    return has_work;
+}
+
 static void loongarch_3a5000_initfn(Object *obj)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
@@ -232,6 +454,8 @@ static void loongarch_cpu_reset(DeviceState *dev)
         env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
     }
 
+    env->pc = 0x1c000000;
+
     restore_fp_status(env);
     cs->exception_index = -1;
 }
@@ -264,6 +488,7 @@ static void loongarch_cpu_init(Object *obj)
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
+    qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
@@ -332,6 +557,9 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
 
     .tlb_fill = loongarch_cpu_tlb_fill,
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
+    .do_transaction_failed = loongarch_cpu_do_transaction_failed,
 };
 #endif /* CONFIG_TCG */
 
@@ -352,6 +580,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     device_class_set_parent_reset(dc, loongarch_cpu_reset, &lacc->parent_reset);
 
     cc->class_by_name = loongarch_cpu_class_by_name;
+    cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
     dc->vmsd = &vmstate_loongarch_cpu;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index a1b88f81eb..ea50b26eba 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -184,6 +184,8 @@ FIELD(CSR_CRMD, WE, 9, 1)
 extern const char * const regnames[32];
 extern const char * const fregnames[32];
 
+#define N_IRQS      13
+
 #define LOONGARCH_STLB         2048 /* 2048 STLB */
 #define LOONGARCH_MTLB         64   /* 64 MTLB */
 #define LOONGARCH_TLB_MAX      (LOONGARCH_STLB + LOONGARCH_MTLB)
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 2fed768653..69183e8bb5 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -30,6 +30,8 @@ void restore_fp_status(CPULoongArchState *env);
 
 extern const VMStateDescription vmstate_loongarch_cpu;
 
+void loongarch_cpu_set_irq(void *opaque, int irq, int level);
+
 bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             MMUAccessType access_type, int mmu_idx,
                             bool probe, uintptr_t retaddr);
-- 
2.31.1


