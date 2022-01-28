Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D034F49F235
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jan 2022 05:02:52 +0100 (CET)
Received: from localhost ([::1]:49252 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nDITL-0000nb-O7
	for lists+qemu-devel@lfdr.de; Thu, 27 Jan 2022 23:02:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39894)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nDIBq-00080P-QW
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:47 -0500
Received: from mail.loongson.cn ([114.242.206.163]:40450 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nDIBn-0002LY-VY
 for qemu-devel@nongnu.org; Thu, 27 Jan 2022 22:44:46 -0500
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9AxGuCMZvNhWCkFAA--.15604S13; 
 Fri, 28 Jan 2022 11:44:31 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v5 11/30] target/loongarch: Add LoongArch interrupt and
 exception handle
Date: Thu, 27 Jan 2022 22:43:53 -0500
Message-Id: <20220128034412.1262452-12-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
References: <20220128034412.1262452-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9AxGuCMZvNhWCkFAA--.15604S13
X-Coremail-Antispam: 1UD129KBjvAXoW3tr1xGw4fKrW5AFWfAr48tFb_yoW8JF4Uuo
 W7Ca1rA3W5Xr1FkFyDArnYqa1jqFykCw4vkr98ZwsxWa18C345G348K34Fv3y3ZF4rXFWr
 AFyI9Fn5XFZrJryfn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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
 Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

1.This patch Add loongarch interrupt and exception handle.
2.Rename the user excp to the exccode from the csr defintions.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 linux-user/loongarch64/cpu_loop.c             |   8 +-
 target/loongarch/cpu.c                        | 251 +++++++++++++++++-
 target/loongarch/cpu.h                        |  11 -
 target/loongarch/fpu_helper.c                 |   2 +-
 target/loongarch/insn_trans/trans_extra.c.inc |   4 +-
 target/loongarch/translate.c                  |   2 +-
 6 files changed, 252 insertions(+), 26 deletions(-)

diff --git a/linux-user/loongarch64/cpu_loop.c b/linux-user/loongarch64/cpu_loop.c
index 6628d215ca..dd58eb048f 100644
--- a/linux-user/loongarch64/cpu_loop.c
+++ b/linux-user/loongarch64/cpu_loop.c
@@ -28,7 +28,7 @@ void cpu_loop(CPULoongArchState *env)
         case EXCP_INTERRUPT:
             /* just indicate that signals should be handled asap */
             break;
-        case EXCP_SYSCALL:
+        case EXCCODE_SYS:
             env->pc += 4;
             ret = do_syscall(env, env->gpr[11],
                              env->gpr[4], env->gpr[5],
@@ -48,10 +48,10 @@ void cpu_loop(CPULoongArchState *env)
             }
             env->gpr[4] = ret;
             break;
-        case EXCP_INE:
+        case EXCCODE_INE:
             force_sig_fault(TARGET_SIGILL, 0, env->pc);
             break;
-        case EXCP_FPE:
+        case EXCCODE_FPE:
             si_code = TARGET_FPE_FLTUNK;
             if (GET_FP_CAUSE(env->fcsr0) & FP_INVALID) {
                 si_code = TARGET_FPE_FLTINV;
@@ -67,7 +67,7 @@ void cpu_loop(CPULoongArchState *env)
             force_sig_fault(TARGET_SIGFPE, si_code, env->pc);
             break;
         case EXCP_DEBUG:
-        case EXCP_BREAK:
+        case EXCCODE_BRK:
             force_sig_fault(TARGET_SIGTRAP, TARGET_TRAP_BRKPT, env->pc);
             break;
         case EXCP_ATOMIC:
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 0bb13cdbf6..962d3ab803 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -30,11 +30,23 @@ const char * const fregnames[32] = {
     "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
 };
 
-static const char * const excp_names[EXCP_LAST + 1] = {
-    [EXCP_SYSCALL] = "Syscall",
-    [EXCP_BREAK] = "Break",
-    [EXCP_INE] = "Instruction Non-Existent",
-    [EXCP_FPE] = "Floating Point Exception",
+static const char * const excp_names[] = {
+    [EXCCODE_INT] = "Interrupt",
+    [EXCCODE_PIL] = "Page invalid exception for load",
+    [EXCCODE_PIS] = "Page invalid exception for store",
+    [EXCCODE_PIF] = "Page invalid exception for fetch",
+    [EXCCODE_PME] = "Page modified exception",
+    [EXCCODE_PNR] = "Page Not Readable exception",
+    [EXCCODE_PNX] = "Page Not Executable exception",
+    [EXCCODE_PPI] = "Page Privilege error",
+    [EXCCODE_ADEF] = "Address error for instruction fetch",
+    [EXCCODE_ADEM] = "Address error for Memory access",
+    [EXCCODE_SYS] = "Syscall",
+    [EXCCODE_BRK] = "Break",
+    [EXCCODE_INE] = "Instruction Non-Existent",
+    [EXCCODE_IPE] = "Instruction privilege error",
+    [EXCCODE_FPE] = "Floating Point Exception",
+    [EXCCODE_DBP] = "Debug breakpoint",
 };
 
 const char *loongarch_exception_name(int32_t exception)
@@ -66,6 +78,216 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
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
+
+    switch (cs->exception_index) {
+    case EXCCODE_DBP:
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DCL, 1);
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, ECODE, 0xC);
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
+    env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, ECODE, cause);
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
+#endif
+
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
                                               const TranslationBlock *tb)
@@ -82,7 +304,16 @@ static bool loongarch_cpu_has_work(CPUState *cs)
 #ifdef CONFIG_USER_ONLY
     return true;
 #else
-#error System emulation TODO
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
 #endif
 }
 
@@ -235,8 +466,11 @@ static void loongarch_cpu_reset(DeviceState *dev)
         env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
     }
 
+#ifndef CONFIG_USER_ONLY
+    env->pc = 0x1c000000;
+#endif
     restore_fp_status(env);
-    cs->exception_index = EXCP_NONE;
+    cs->exception_index = -1;
 }
 
 static void loongarch_cpu_disas_set_info(CPUState *s, disassemble_info *info)
@@ -338,6 +572,9 @@ static struct TCGCPUOps loongarch_tcg_ops = {
 
 #if !defined(CONFIG_USER_ONLY)
     .tlb_fill = loongarch_cpu_tlb_fill,
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
+    .do_transaction_failed = loongarch_cpu_do_transaction_failed,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 7d5d682ac0..ca59a40781 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -423,17 +423,6 @@ typedef LoongArchCPU ArchCPU;
 
 #include "exec/cpu-all.h"
 
-/* Exceptions */
-enum {
-    EXCP_NONE          = -1,
-    EXCP_SYSCALL       = 0,
-    EXCP_BREAK,
-    EXCP_INE,
-    EXCP_FPE,
-
-    EXCP_LAST = EXCP_FPE,
-};
-
 #define CPU_INTERRUPT_WAKE CPU_INTERRUPT_TGT_INT_0
 
 #define LOONGARCH_CPU_TYPE_SUFFIX "-" TYPE_LOONGARCH_CPU
diff --git a/target/loongarch/fpu_helper.c b/target/loongarch/fpu_helper.c
index 9f5235c4f8..1baf012ef7 100644
--- a/target/loongarch/fpu_helper.c
+++ b/target/loongarch/fpu_helper.c
@@ -74,7 +74,7 @@ static void update_fcsr0_mask(CPULoongArchState *env, uintptr_t pc, int mask)
     }
 
     if (GET_FP_ENABLES(env->fcsr0) & flags) {
-        do_raise_exception(env, EXCP_FPE, pc);
+        do_raise_exception(env, EXCCODE_FPE, pc);
     } else {
         UPDATE_FP_FLAGS(env->fcsr0, flags);
     }
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
index bc622ced23..2ce95d3382 100644
--- a/target/loongarch/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -5,13 +5,13 @@
 
 static bool trans_break(DisasContext *ctx, arg_break *a)
 {
-    generate_exception(ctx, EXCP_BREAK);
+    generate_exception(ctx, EXCCODE_BRK);
     return true;
 }
 
 static bool trans_syscall(DisasContext *ctx, arg_syscall *a)
 {
-    generate_exception(ctx, EXCP_SYSCALL);
+    generate_exception(ctx, EXCCODE_SYS);
     return true;
 }
 
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 438a3cb515..c1cac2f006 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -185,7 +185,7 @@ static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
     if (!decode(ctx, ctx->opcode)) {
         qemu_log_mask(LOG_UNIMP, "Error: unknown opcode. 0x%lx: 0x%x\n",
                       ctx->base.pc_next, ctx->opcode);
-        generate_exception(ctx, EXCP_INE);
+        generate_exception(ctx, EXCCODE_INE);
     }
 
     for (int i = ctx->ntemp - 1; i >= 0; --i) {
-- 
2.27.0


