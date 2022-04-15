Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A6B9F50284E
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:30:57 +0200 (CEST)
Received: from localhost ([::1]:57868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfJE8-00049o-6i
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:30:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34520)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfISX-0002h6-1j
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:41:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53498 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfISS-0004Yh-2A
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:41:43 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xGqPVli41gkAA--.16856S25; 
 Fri, 15 Apr 2022 17:41:26 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 23/43] target/loongarch: Add LoongArch interrupt and
 exception handle
Date: Fri, 15 Apr 2022 17:40:38 +0800
Message-Id: <20220415094058.3584233-24-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_xGqPVli41gkAA--.16856S25
X-Coremail-Antispam: 1UD129KBjvJXoWfJryUKF1fuw1rZw4kJrWrZrb_yoWDAFW3pF
 1IkrW0yry5JrZrA343J390yrn8Zw1xCws2vay3Ga4Fkr48Wry0qrWvqr9rXF17C3yrZrW7
 uFs3AFW5u3WUJFJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
 target/loongarch/cpu.c       | 261 +++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h       |   2 +
 target/loongarch/internals.h |   2 +
 3 files changed, 265 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 2581e60e49..65d2c48201 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -80,6 +80,246 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
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
+    if (level) {
+        env->CSR_ESTAT |= 1 << irq;
+    } else {
+        env->CSR_ESTAT &= ~(1 << irq);
+    }
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
+static inline unsigned int get_vint_size(CPULoongArchState *env)
+{
+    uint64_t vs = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
+    uint64_t size = 0;
+
+    if (vs == 0) {
+        return 0;
+    }
+
+    if (vs < 8) {
+        size = 1 << (vs + 2);
+    }
+
+    if (vs > 8) {
+        qemu_log("%s: unexpected value", __func__);
+        assert(0);
+    }
+
+    return size;
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
+    if (cs->exception_index == EXCCODE_INT &&
+       (FIELD_EX64(env->CSR_DBG, CSR_DBG, DST))) {
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DEI, 1);
+        goto set_DERA;
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
+    uint32_t vec_size = get_vint_size(env);
+    env->pc = env->CSR_EENTRY;
+    env->pc += cause * vec_size;
+    if (tlbfill) {
+        /* TLB Refill */
+        env->pc = env->CSR_TLBRENTRY;
+    }
+    if  (cs->exception_index == EXCCODE_INT) {
+        /* Interrupt */
+        uint32_t vector = 0;
+        uint32_t pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
+        pending &= FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
+
+        /* Find the highest-priority interrupt. */
+        while (pending >>= 1) {
+            vector++;
+        }
+        env->pc = env->CSR_EENTRY + (EXCCODE_EXTERNAL_INT + vector) * vec_size;
+        qemu_log_mask(CPU_LOG_INT,
+                      "%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                      " cause %d\n" "    A " TARGET_FMT_lx " D "
+                      TARGET_FMT_lx " vector = %d ExC %08lx ExS %08lx\n",
+                      __func__, env->pc, env->CSR_ERA,
+                      cause, env->CSR_BADV, env->CSR_DERA, vector,
+                      env->CSR_ECFG, env->CSR_ESTAT);
+    }
+
+    if (!tlbfill) {
+        env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
+    }
+
+    if (cs->exception_index != EXCCODE_INT) {
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
@@ -91,6 +331,20 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
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
@@ -232,6 +486,8 @@ static void loongarch_cpu_reset(DeviceState *dev)
         env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
     }
 
+    env->pc = 0x1c000000;
+
     restore_fp_status(env);
     cs->exception_index = -1;
 }
@@ -264,6 +520,7 @@ static void loongarch_cpu_init(Object *obj)
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
 
     cpu_set_cpustate_pointers(cpu);
+    qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
@@ -332,6 +589,9 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
 
     .tlb_fill = loongarch_cpu_tlb_fill,
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
+    .do_transaction_failed = loongarch_cpu_do_transaction_failed,
 };
 #endif /* CONFIG_TCG */
 
@@ -352,6 +612,7 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
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
index a14f70a7e0..3d64926db7 100644
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


