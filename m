Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94257432FD4
	for <lists+qemu-devel@lfdr.de>; Tue, 19 Oct 2021 09:41:11 +0200 (CEST)
Received: from localhost ([::1]:44854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcjkD-0001Ll-Es
	for lists+qemu-devel@lfdr.de; Tue, 19 Oct 2021 03:41:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55924)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mcjf1-0001L8-5b
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:34918 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mcjex-0004WB-9y
 for qemu-devel@nongnu.org; Tue, 19 Oct 2021 03:35:46 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxP2s1dW5h3HwcAA--.43474S12; 
 Tue, 19 Oct 2021 15:35:35 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 10/31] target/loongarch: Add loongarch interrupt and exception
 handle
Date: Tue, 19 Oct 2021 15:34:56 +0800
Message-Id: <1634628917-10031-11-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1634628917-10031-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9DxP2s1dW5h3HwcAA--.43474S12
X-Coremail-Antispam: 1UD129KBjvJXoW3uFW3AF4fCr13ury3XryrWFg_yoWDAF1UpF
 1IkrW2yr9xXrZ3Aw13Jws0vrn5Zw18Kwn2qasxG3WFyrWxXr1F9rWvq3srZF9xCrW5Aw47
 uFs3ArW5WF1UZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: p1dqw5xldry3tdq6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163;
 envelope-from=yangxiaojuan@loongson.cn; helo=loongson.cn
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@loongson.cn,
 mst@redhat.com, philmd@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, peterx@redhat.com, f4bug@amsat.org,
 yangxiaojuan@loongson.cn, alistair.francis@wdc.com, maobibo@loongson.cn,
 gaosong@loongson.cn, pbonzini@redhat.com, mark.cave-ayland@ilande.co.uk,
 bmeng.cn@gmail.com, alex.bennee@linaro.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch Add loongarch interrupt and exception handle.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 293 +++++++++++++++++++++++++++++++++++++++++
 target/loongarch/cpu.h |   6 +-
 2 files changed, 298 insertions(+), 1 deletion(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 7fa3851251..3e3cf233db 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -45,7 +45,10 @@ static const char * const excp_names[EXCP_LAST + 1] = {
     [EXCP_TLBPE] = "TLB priviledged error",
     [EXCP_TLBNX] = "TLB execute-inhibit",
     [EXCP_TLBNR] = "TLB read-inhibit",
+    [EXCP_EXT_INTERRUPT] = "interrupt",
     [EXCP_DBP] = "debug breakpoint",
+    [EXCP_IBE] = "instruction bus error",
+    [EXCP_DBE] = "data bus error",
 };
 
 const char *loongarch_exception_name(int32_t exception)
@@ -79,6 +82,275 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+#if !defined(CONFIG_USER_ONLY)
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
+    unsigned int size = 0;
+    uint64_t vs = FIELD_EX64(env->CSR_ECFG, CSR_ECFG, VS);
+
+    switch (vs) {
+    case 0:
+        break;
+    case 1:
+        size = 2 * 4;   /* #Insts * inst_size */
+        break;
+    case 2:
+        size = 4 * 4;
+        break;
+    case 3:
+        size = 8 * 4;
+        break;
+    case 4:
+        size = 16 * 4;
+        break;
+    case 5:
+        size = 32 * 4;
+        break;
+    case 6:
+        size = 64 * 4;
+        break;
+    case 7:
+        size = 128 * 4;
+        break;
+    default:
+        qemu_log("%s: unexpected value", __func__);
+        assert(0);
+    }
+
+    return size;
+}
+
+#define is_refill(cs, env) (((cs->exception_index == EXCP_TLBL) \
+        || (cs->exception_index == EXCP_TLBS))  \
+        && (env->error_code & EXCP_TLB_NOMATCH))
+
+static void loongarch_cpu_do_interrupt(CPUState *cs)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool update_badinstr = 0;
+    int cause = -1;
+    const char *name;
+
+    if (qemu_loglevel_mask(CPU_LOG_INT)
+        && cs->exception_index != EXCP_EXT_INTERRUPT) {
+        if (cs->exception_index < 0 || cs->exception_index > EXCP_LAST) {
+            name = "unknown";
+        } else {
+            name = excp_names[cs->exception_index];
+        }
+
+        qemu_log("%s enter: pc " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                 " TLBRERA 0x%016lx" " %s exception\n", __func__,
+                 env->pc, env->CSR_ERA, env->CSR_TLBRERA, name);
+    }
+
+    switch (cs->exception_index) {
+    case EXCP_SYSCALL:
+        cause = EXCCODE_SYS;
+        update_badinstr = 1;
+        break;
+    case EXCP_BREAK:
+        cause = EXCCODE_BRK;
+        update_badinstr = 1;
+        break;
+    case EXCP_INE:
+        cause = EXCCODE_INE;
+        update_badinstr = 1;
+        break;
+    case EXCP_FPE:
+        cause = EXCCODE_FPE;
+        update_badinstr = 1;
+        break;
+    case EXCP_ADEL:
+        cause = EXCCODE_ADEF;
+        update_badinstr = !(env->error_code & EXCP_INST_NOTAVAIL);
+        break;
+    case EXCP_ADES:
+        cause = EXCCODE_ADEM;
+        update_badinstr = 1;
+        break;
+    case EXCP_DBP:
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DCL, 1);
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, ECODE, 0xC);
+        env->CSR_DERA = env->pc;
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DST, 1);
+        env->pc = env->exception_base + 0x480;
+        break;
+    case EXCP_EXT_INTERRUPT:
+        cause = 0;
+        break;
+    case EXCP_TLBL:
+        if (env->error_code & EXCP_INST_NOTAVAIL) {
+            cause = EXCCODE_PIF;
+        } else {
+            cause = EXCCODE_PIL;
+        }
+        update_badinstr = !(env->error_code & EXCP_INST_NOTAVAIL);
+        break;
+    case EXCP_TLBS:
+        cause = EXCCODE_PIS;
+        update_badinstr = 1;
+        break;
+    case EXCP_TLBM:
+        cause = EXCCODE_PME;
+        break;
+    case EXCP_TLBPE:
+        cause = EXCCODE_PPI;
+        break;
+    case EXCP_TLBNX:
+        cause = EXCCODE_PNX;
+        break;
+    case EXCP_TLBNR:
+        cause = EXCCODE_PNR;
+        update_badinstr = 1;
+        break;
+    case EXCP_IBE:
+        cause = EXCCODE_ADEF;
+        break;
+    case EXCP_DBE:
+        cause = EXCCODE_ADEM;
+        break;
+    default:
+        qemu_log("Error: exception(%d) '%s' has not been supported\n",
+                 cs->exception_index, excp_names[cs->exception_index]);
+        abort();
+    }
+
+    if (is_refill(cs, env)) {
+        env->CSR_TLBRERA = env->pc;
+        env->CSR_TLBRERA |= 1;
+    } else {
+        env->CSR_ERA = env->pc;
+    }
+
+    if (update_badinstr) {
+        env->CSR_BADI = cpu_ldl_code(env, env->pc);
+    }
+
+    /* save PLV and IE */
+    if (is_refill(cs, env)) {
+        env->CSR_TLBRPRMD = FIELD_DP64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PPLV,
+                                       FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV));
+        env->CSR_TLBRPRMD = FIELD_DP64(env->CSR_TLBRPRMD, CSR_TLBRPRMD, PIE,
+                                       FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE));
+    } else {
+        env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PPLV,
+                                   FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV));
+        env->CSR_PRMD = FIELD_DP64(env->CSR_PRMD, CSR_PRMD, PIE,
+                                   FIELD_EX64(env->CSR_CRMD, CSR_CRMD, IE));
+    }
+
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, PLV, 0);
+    env->CSR_CRMD = FIELD_DP64(env->CSR_CRMD, CSR_CRMD, IE, 0);
+
+    uint32_t vec_size = get_vint_size(env);
+    env->pc = env->CSR_EENTRY;
+    env->pc += cause * vec_size;
+    if (is_refill(cs, env)) {
+        /* TLB Refill */
+        env->pc = env->CSR_TLBRENTRY;
+    }
+    if  (cs->exception_index == EXCP_EXT_INTERRUPT) {
+        /* Interrupt */
+        uint32_t vector = 0;
+        uint32_t pending = FIELD_EX64(env->CSR_ESTAT, CSR_ESTAT, IS);
+        pending &= FIELD_EX64(env->CSR_ECFG, CSR_ECFG, LIE);
+
+        /* Find the highest-priority interrupt. */
+        while (pending >>= 1) {
+            vector++;
+        }
+        env->pc = env->CSR_EENTRY + (EXCODE_IP + vector) * vec_size;
+        if (qemu_loglevel_mask(CPU_LOG_INT)) {
+            qemu_log("%s: PC " TARGET_FMT_lx " ERA " TARGET_FMT_lx
+                     " cause %d\n" "    A " TARGET_FMT_lx " D "
+                     TARGET_FMT_lx " vector = %d ExC %08lx ExS %08lx\n",
+                     __func__, env->pc, env->CSR_ERA,
+                     cause, env->CSR_BADV, env->CSR_DERA, vector,
+                     env->CSR_ECFG, env->CSR_ESTAT);
+        }
+    }
+
+    /* Excode */
+    env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
+
+    if (qemu_loglevel_mask(CPU_LOG_INT) && cs->exception_index != EXCP_EXT_INTERRUPT) {
+        qemu_log("%s: PC " TARGET_FMT_lx " ERA 0x%08lx"  " cause %d%s\n"
+                 " ESTAT %08lx EXCFG 0x%08lx BADVA 0x%08lx BADI 0x%08lx \
+                 SYS_NUM %lu cpu %d asid 0x%lx" "\n",
+                 __func__, env->pc,
+                 is_refill(cs, env) ? env->CSR_TLBRERA : env->CSR_ERA,
+                 cause,
+                 is_refill(cs, env) ? "(refill)" : "",
+                 env->CSR_ESTAT, env->CSR_ECFG,
+                 is_refill(cs, env) ? env->CSR_TLBRBADV : env->CSR_BADV,
+                 env->CSR_BADI, env->gpr[11], cs->cpu_index,
+                 env->CSR_ASID
+         );
+    }
+    cs->exception_index = EXCP_NONE;
+}
+
+static void loongarch_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                    vaddr addr, unsigned size,
+                                    MMUAccessType access_type,
+                                    int mmu_idx, MemTxAttrs attrs,
+                                    MemTxResult response, uintptr_t retaddr)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+
+    if (access_type == MMU_INST_FETCH) {
+        do_raise_exception(env, EXCP_IBE, retaddr);
+    } else {
+        do_raise_exception(env, EXCP_DBE, retaddr);
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
+            cs->exception_index = EXCP_EXT_INTERRUPT;
+            env->error_code = 0;
+            loongarch_cpu_do_interrupt(cs);
+            return true;
+        }
+    }
+    return false;
+}
+#endif
+
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -92,7 +364,20 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 
 static bool loongarch_cpu_has_work(CPUState *cs)
 {
+#ifdef CONFIG_USER_ONLY
     return true;
+#else
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    bool has_work = false;
+
+    if ((cs->interrupt_request & CPU_INTERRUPT_HARD) &&
+        cpu_loongarch_hw_interrupts_pending(env)) {
+            has_work = true;
+    }
+
+    return has_work;
+#endif
 }
 
 static void set_loongarch_cpucfg(CPULoongArchState *env)
@@ -192,6 +477,7 @@ static void loongarch_cpu_reset(DeviceState *dev)
     set_loongarch_cpucfg(env);
 #ifndef CONFIG_USER_ONLY
     set_loongarch_csr(env);
+    env->pc = env->exception_base;
 #endif
     env->fcsr0_mask = 0x1f1f031f;
     env->fcsr0 = 0x0;
@@ -223,6 +509,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     ls3a5k_mmu_init(env);
+    env->exception_base = 0x1C000000;
 #endif
 
     cpu_reset(cs);
@@ -330,6 +617,12 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
     .tlb_fill = loongarch_cpu_tlb_fill,
+
+#if !defined(CONFIG_USER_ONLY)
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
+    .do_transaction_failed = loongarch_cpu_do_transaction_failed,
+#endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
 
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index d39c618d6b..182b03fb33 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -82,6 +82,7 @@ struct CPULoongArchState {
     CPU_LOONGARCH_CSR
     CPULoongArchTLBContext *tlb;
     int error_code;
+    target_ulong exception_base;
 #endif
 };
 
@@ -166,9 +167,12 @@ enum {
     EXCP_TLBPE,
     EXCP_TLBNX,
     EXCP_TLBNR,
+    EXCP_EXT_INTERRUPT,
     EXCP_DBP,
+    EXCP_IBE,
+    EXCP_DBE,
 
-    EXCP_LAST = EXCP_DBP,
+    EXCP_LAST = EXCP_DBE,
 };
 
 #define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
-- 
2.27.0


