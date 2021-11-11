Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2C7044CF45
	for <lists+qemu-devel@lfdr.de>; Thu, 11 Nov 2021 02:52:09 +0100 (CET)
Received: from localhost ([::1]:34784 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkzG5-00055O-4O
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 20:52:09 -0500
Received: from eggs.gnu.org ([209.51.188.92]:53842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1mkz0X-0005ip-Nu
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:06 -0500
Received: from mail.loongson.cn ([114.242.206.163]:54022 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1mkz0U-0001iq-8w
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 20:36:04 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxr9Ngc4xh9RMCAA--.4955S13; 
 Thu, 11 Nov 2021 09:35:45 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [RFC PATCH v2 11/30] target/loongarch: Add LoongArch interrupt and
 exception handle
Date: Thu, 11 Nov 2021 09:35:09 +0800
Message-Id: <1636594528-8175-12-git-send-email-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
References: <1636594528-8175-1-git-send-email-yangxiaojuan@loongson.cn>
X-CM-TRANSID: AQAAf9Dxr9Ngc4xh9RMCAA--.4955S13
X-Coremail-Antispam: 1UD129KBjvJXoWxuFWxuF4kKF1UWw45Kr48WFg_yoWfKry8pa
 1IkrW0yr15Xrn3A343J390yrn5Zw1Ikwn7XasxG3WFkr4xXr10vrWvqr9rXF13CrWrZrW7
 uFnxAFW5WF1UZFJanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Song Gao <gaosong@loongson.cn>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch Add loongarch interrupt and exception handle.

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/cpu.c | 279 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 279 insertions(+)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 7db6e21298..fa528d5510 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -80,6 +80,250 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
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
+    bool update_badinstr = 0;
+    int cause = -1;
+    const char *name;
+    bool tlbfill = FIELD_EX64(env->CSR_TLBRERA, CSR_TLBRERA, ISTLBR);
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
+    case EXCP_IPE:
+        cause = EXCCODE_IPE;
+        update_badinstr = 1;
+        break;
+    case EXCP_FPE:
+        cause = EXCCODE_FPE;
+        update_badinstr = 1;
+        break;
+    case EXCP_ADE:
+        cause = EXCCODE_ADE;
+        update_badinstr = 1;
+        break;
+    case EXCP_DBP:
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DCL, 1);
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, ECODE, 0xC);
+        env->CSR_DERA = env->pc;
+        env->CSR_DBG = FIELD_DP64(env->CSR_DBG, CSR_DBG, DST, 1);
+        env->pc = env->CSR_EENTRY + 0x480;
+        break;
+    case EXCP_EXT_INTERRUPT:
+        cause = 0;
+        break;
+    case EXCP_TLBL:
+        cause = EXCCODE_PIL;
+        update_badinstr = 1;
+        break;
+    case EXCP_TLBS:
+        cause = EXCCODE_PIS;
+        update_badinstr = 1;
+        break;
+    case EXCP_INST_NOTAVAIL:
+        cause = EXCCODE_PIF;
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
+        cause = EXCCODE_ADE;
+        break;
+    case EXCP_DBE:
+        cause = EXCCODE_ADE;
+        break;
+    default:
+        qemu_log("Error: exception(%d) '%s' has not been supported\n",
+                 cs->exception_index, excp_names[cs->exception_index]);
+        abort();
+    }
+
+    if (tlbfill) {
+        env->CSR_TLBRERA = FIELD_DP64(env->CSR_TLBRERA, CSR_TLBRERA,
+                                      PC, (env->pc >> 2));
+    } else {
+        env->CSR_ERA = env->pc;
+    }
+
+    if (update_badinstr) {
+        env->CSR_BADI = cpu_ldl_code(env, env->pc);
+    }
+
+    /* Save PLV and IE */
+    if (tlbfill) {
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
+    if (tlbfill) {
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
+                 __func__, env->pc, tlbfill ? env->CSR_TLBRERA : env->CSR_ERA,
+                 cause, tlbfill ? "(refill)" : "", env->CSR_ESTAT, env->CSR_ECFG,
+                 tlbfill ? env->CSR_TLBRBADV : env->CSR_BADV, env->CSR_BADI,
+                 env->gpr[11], cs->cpu_index, env->CSR_ASID
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
@@ -93,7 +337,20 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 
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
+        has_work = true;
+    }
+
+    return has_work;
+#endif
 }
 
 static void loongarch_3a5000_initfn(Object *obj)
@@ -211,6 +468,9 @@ static void loongarch_cpu_reset(DeviceState *dev)
     data = FIELD_DP64(data, CSR_CRMD, DATM, 1);
     env->CSR_CRMD = data;
 
+#ifndef CONFIG_USER_ONLY
+    env->pc = env->CSR_EENTRY;
+#endif
     restore_fp_status(env);
     cs->exception_index = EXCP_NONE;
 }
@@ -238,6 +498,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
 
 #ifndef CONFIG_USER_ONLY
     loongarch_mmu_init(env);
+    env->CSR_EENTRY = 0x1C000000;
 #endif
 
     cpu_reset(cs);
@@ -285,6 +546,21 @@ void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
         }
     }
 
+#ifndef CONFIG_USER_ONLY
+    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
+    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
+    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
+    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
+    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
+    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
+    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
+    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
+    qemu_fprintf(f, "EENTRY            0x%lx\n", env->CSR_EENTRY);
+    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
+    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
+                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
+#endif
+
 #ifndef CONFIG_USER_ONLY
     qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
     qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
@@ -320,6 +596,9 @@ static struct TCGCPUOps loongarch_tcg_ops = {
 
 #if !defined(CONFIG_USER_ONLY)
     .tlb_fill = loongarch_cpu_tlb_fill,
+    .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
+    .do_interrupt = loongarch_cpu_do_interrupt,
+    .do_transaction_failed = loongarch_cpu_do_transaction_failed,
 #endif /* !CONFIG_USER_ONLY */
 };
 #endif /* CONFIG_TCG */
-- 
2.27.0


