Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8291B544195
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 04:46:53 +0200 (CEST)
Received: from localhost ([::1]:43898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nz8CC-0005Eh-If
	for lists+qemu-devel@lfdr.de; Wed, 08 Jun 2022 22:46:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42500)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1nz87u-0005HK-ML
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 22:42:27 -0400
Received: from mail.loongson.cn ([114.242.206.163]:43498 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1nz87q-0008VV-0d
 for qemu-devel@nongnu.org; Wed, 08 Jun 2022 22:42:26 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9BxWeQBXqFiaLAyAA--.53544S10; 
 Thu, 09 Jun 2022 10:42:18 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org, laurent@vivier.eu, gaosong@loongson.cn,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>
Subject: [PATCH v15 8/9] target/loongarch: Adjust functions and structure to
 support user-mode
Date: Thu,  9 Jun 2022 10:42:08 +0800
Message-Id: <20220609024209.2406188-9-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220609024209.2406188-1-gaosong@loongson.cn>
References: <20220609024209.2406188-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9BxWeQBXqFiaLAyAA--.53544S10
X-Coremail-Antispam: 1UD129KBjvJXoW3tFyrZryUXr17GF1fKw4rZrb_yoWkGF1fpr
 y7uryYkr48trZ7Ja4xJ390gF98XF4I93y2va1fK34Ska17Xr1DZr18t3sIgFy5G3ykWryI
 9F18Aa45Z3WUJa7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Some functions and member of the structure are different with softmmu-mode
So we need adjust them to support user-mode.

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/cpu.c                        | 22 ++++++++++--
 target/loongarch/cpu.h                        |  6 ++++
 target/loongarch/helper.h                     |  5 +--
 target/loongarch/insn_trans/trans_extra.c.inc | 14 ++++++++
 .../insn_trans/trans_privileged.c.inc         | 36 +++++++++++++++++++
 target/loongarch/internals.h                  |  2 ++
 target/loongarch/op_helper.c                  | 12 +++++++
 7 files changed, 93 insertions(+), 4 deletions(-)

diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 4c8f96bc3a..472e258f68 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -18,7 +18,6 @@
 #include "fpu/softfloat-helpers.h"
 #include "cpu-csr.h"
 #include "sysemu/reset.h"
-#include "hw/loader.h"
 
 const char * const regnames[32] = {
     "r0", "r1", "r2", "r3", "r4", "r5", "r6", "r7",
@@ -82,6 +81,7 @@ static void loongarch_cpu_set_pc(CPUState *cs, vaddr value)
     env->pc = value;
 }
 
+#ifndef CONFIG_USER_ONLY
 #include "hw/loongarch/virt.h"
 
 void loongarch_cpu_set_irq(void *opaque, int irq, int level)
@@ -292,6 +292,7 @@ static bool loongarch_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
     }
     return false;
 }
+#endif
 
 #ifdef CONFIG_TCG
 static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
@@ -306,6 +307,9 @@ static void loongarch_cpu_synchronize_from_tb(CPUState *cs,
 
 static bool loongarch_cpu_has_work(CPUState *cs)
 {
+#ifdef CONFIG_USER_ONLY
+    return true;
+#else
     LoongArchCPU *cpu = LOONGARCH_CPU(cs);
     CPULoongArchState *env = &cpu->env;
     bool has_work = false;
@@ -316,6 +320,7 @@ static bool loongarch_cpu_has_work(CPUState *cs)
     }
 
     return has_work;
+#endif
 }
 
 static void loongarch_la464_initfn(Object *obj)
@@ -464,7 +469,9 @@ static void loongarch_cpu_reset(DeviceState *dev)
         env->CSR_DMW[n] = FIELD_DP64(env->CSR_DMW[n], CSR_DMW, PLV3, 0);
     }
 
+#ifndef CONFIG_USER_ONLY
     env->pc = 0x1c000000;
+#endif
 
     restore_fp_status(env);
     cs->exception_index = -1;
@@ -495,6 +502,7 @@ static void loongarch_cpu_realizefn(DeviceState *dev, Error **errp)
     lacc->parent_realize(dev, errp);
 }
 
+#ifndef CONFIG_USER_ONLY
 static void loongarch_qemu_write(void *opaque, hwaddr addr,
                                  uint64_t val, unsigned size)
 {
@@ -529,13 +537,16 @@ static const MemoryRegionOps loongarch_qemu_ops = {
         .max_access_size = 8,
     },
 };
+#endif
 
 static void loongarch_cpu_init(Object *obj)
 {
     LoongArchCPU *cpu = LOONGARCH_CPU(obj);
-    CPULoongArchState *env = &cpu->env;
 
+#ifdef CONFIG_USER_ONLY
     cpu_set_cpustate_pointers(cpu);
+#else
+    CPULoongArchState *env = &cpu->env;
     qdev_init_gpio_in(DEVICE(cpu), loongarch_cpu_set_irq, N_IRQS);
     timer_init_ns(&cpu->timer, QEMU_CLOCK_VIRTUAL,
                   &loongarch_constant_timer_cb, cpu);
@@ -545,6 +556,7 @@ static void loongarch_cpu_init(Object *obj)
     memory_region_init_io(&env->iocsr_mem, OBJECT(cpu), &loongarch_qemu_ops,
                           NULL, "iocsr_misc", 0x428);
     memory_region_add_subregion(&env->system_iocsr, 0, &env->iocsr_mem);
+#endif
 }
 
 static ObjectClass *loongarch_cpu_class_by_name(const char *cpu_model)
@@ -612,18 +624,22 @@ static struct TCGCPUOps loongarch_tcg_ops = {
     .initialize = loongarch_translate_init,
     .synchronize_from_tb = loongarch_cpu_synchronize_from_tb,
 
+#ifndef CONFIG_USER_ONLY
     .tlb_fill = loongarch_cpu_tlb_fill,
     .cpu_exec_interrupt = loongarch_cpu_exec_interrupt,
     .do_interrupt = loongarch_cpu_do_interrupt,
     .do_transaction_failed = loongarch_cpu_do_transaction_failed,
+#endif
 };
 #endif /* CONFIG_TCG */
 
+#ifndef CONFIG_USER_ONLY
 #include "hw/core/sysemu-cpu-ops.h"
 
 static const struct SysemuCPUOps loongarch_sysemu_ops = {
     .get_phys_page_debug = loongarch_cpu_get_phys_page_debug,
 };
+#endif
 
 static void loongarch_cpu_class_init(ObjectClass *c, void *data)
 {
@@ -639,8 +655,10 @@ static void loongarch_cpu_class_init(ObjectClass *c, void *data)
     cc->has_work = loongarch_cpu_has_work;
     cc->dump_state = loongarch_cpu_dump_state;
     cc->set_pc = loongarch_cpu_set_pc;
+#ifndef CONFIG_USER_ONLY
     dc->vmsd = &vmstate_loongarch_cpu;
     cc->sysemu_ops = &loongarch_sysemu_ops;
+#endif
     cc->disas_set_info = loongarch_cpu_disas_set_info;
     cc->gdb_read_register = loongarch_cpu_gdb_read_register;
     cc->gdb_write_register = loongarch_cpu_gdb_write_register;
diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 71a5036c3c..19eed2f0c1 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -303,6 +303,7 @@ typedef struct CPUArchState {
     uint64_t CSR_DERA;
     uint64_t CSR_DSAVE;
 
+#ifndef CONFIG_USER_ONLY
     LoongArchTLB  tlb[LOONGARCH_TLB_MAX];
 
     AddressSpace address_space_iocsr;
@@ -310,6 +311,7 @@ typedef struct CPUArchState {
     MemoryRegion iocsr_mem;
     bool load_elf;
     uint64_t elf_address;
+#endif
 } CPULoongArchState;
 
 /**
@@ -360,12 +362,16 @@ struct LoongArchCPUClass {
 
 static inline int cpu_mmu_index(CPULoongArchState *env, bool ifetch)
 {
+#ifdef CONFIG_USER_ONLY
+    return MMU_USER_IDX;
+#else
     uint8_t pg = FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PG);
 
     if (!pg) {
         return MMU_DA_IDX;
     }
     return FIELD_EX64(env->CSR_CRMD, CSR_CRMD, PLV);
+#endif
 }
 
 static inline void cpu_get_tb_cpu_state(CPULoongArchState *env,
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 85c11a60d4..ee42707868 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -93,8 +93,7 @@ DEF_HELPER_2(frint_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
 
-DEF_HELPER_1(rdtime_d, i64, env)
-
+#ifndef CONFIG_USER_ONLY
 /* CSRs helper */
 DEF_HELPER_1(csrrd_pgd, i64, env)
 DEF_HELPER_1(csrrd_tval, i64, env)
@@ -128,3 +127,5 @@ DEF_HELPER_4(lddir, tl, env, tl, tl, i32)
 DEF_HELPER_4(ldpte, void, env, tl, tl, i32)
 DEF_HELPER_1(ertn, void, env)
 DEF_HELPER_1(idle, void, env)
+DEF_HELPER_1(rdtime_d, i64, env)
+#endif
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
index ad713cd61e..f1980497ac 100644
--- a/target/loongarch/insn_trans/trans_extra.c.inc
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -33,6 +33,7 @@ static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
     return true;
 }
 
+#ifndef CONFIG_USER_ONLY
 static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
                        bool word, bool high)
 {
@@ -50,20 +51,33 @@ static bool gen_rdtime(DisasContext *ctx, arg_rr *a,
 
     return true;
 }
+#endif
 
 static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
 {
+#ifdef CONFIG_USER_ONLY
+    return cpu_get_host_ticks();
+#else
     return gen_rdtime(ctx, a, 1, 0);
+#endif
 }
 
 static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
 {
+#ifdef CONFIG_USER_ONLY
+    return cpu_get_host_ticks();
+#else
     return gen_rdtime(ctx, a, 1, 1);
+#endif
 }
 
 static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
 {
+#ifdef CONFIG_USER_ONLY
+    return cpu_get_host_ticks();
+#else
     return gen_rdtime(ctx, a, 0, 0);
+#endif
 }
 
 static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
index 53596c4f77..9c4dcbfcfb 100644
--- a/target/loongarch/insn_trans/trans_privileged.c.inc
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -7,6 +7,41 @@
 
 #include "cpu-csr.h"
 
+#ifdef CONFIG_USER_ONLY
+
+#define GEN_FALSE_TRANS(name)   \
+static bool trans_##name(DisasContext *ctx, arg_##name * a)  \
+{   \
+    return false;   \
+}
+
+GEN_FALSE_TRANS(csrrd)
+GEN_FALSE_TRANS(csrwr)
+GEN_FALSE_TRANS(csrxchg)
+GEN_FALSE_TRANS(iocsrrd_b)
+GEN_FALSE_TRANS(iocsrrd_h)
+GEN_FALSE_TRANS(iocsrrd_w)
+GEN_FALSE_TRANS(iocsrrd_d)
+GEN_FALSE_TRANS(iocsrwr_b)
+GEN_FALSE_TRANS(iocsrwr_h)
+GEN_FALSE_TRANS(iocsrwr_w)
+GEN_FALSE_TRANS(iocsrwr_d)
+GEN_FALSE_TRANS(tlbsrch)
+GEN_FALSE_TRANS(tlbrd)
+GEN_FALSE_TRANS(tlbwr)
+GEN_FALSE_TRANS(tlbfill)
+GEN_FALSE_TRANS(tlbclr)
+GEN_FALSE_TRANS(tlbflush)
+GEN_FALSE_TRANS(invtlb)
+GEN_FALSE_TRANS(cacop)
+GEN_FALSE_TRANS(ldpte)
+GEN_FALSE_TRANS(lddir)
+GEN_FALSE_TRANS(ertn)
+GEN_FALSE_TRANS(dbcl)
+GEN_FALSE_TRANS(idle)
+
+#else
+
 typedef void (*GenCSRRead)(TCGv dest, TCGv_ptr env);
 typedef void (*GenCSRWrite)(TCGv dest, TCGv_ptr env, TCGv src);
 
@@ -464,3 +499,4 @@ static bool trans_idle(DisasContext *ctx, arg_idle *a)
     ctx->base.is_jmp = DISAS_NORETURN;
     return true;
 }
+#endif
diff --git a/target/loongarch/internals.h b/target/loongarch/internals.h
index 9d50fbdd81..ebca7a1a25 100644
--- a/target/loongarch/internals.h
+++ b/target/loongarch/internals.h
@@ -33,6 +33,7 @@ const char *loongarch_exception_name(int32_t exception);
 
 void restore_fp_status(CPULoongArchState *env);
 
+#ifndef CONFIG_USER_ONLY
 extern const VMStateDescription vmstate_loongarch_cpu;
 
 void loongarch_cpu_set_irq(void *opaque, int irq, int level);
@@ -48,6 +49,7 @@ bool loongarch_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                             bool probe, uintptr_t retaddr);
 
 hwaddr loongarch_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
+#endif
 
 int loongarch_cpu_gdb_read_register(CPUState *cs, GByteArray *mem_buf, int n);
 int loongarch_cpu_gdb_write_register(CPUState *cs, uint8_t *mem_buf, int n);
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index d87049851f..49fbd1343c 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -49,14 +49,24 @@ target_ulong helper_bitswap(target_ulong v)
 void helper_asrtle_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj > rk) {
+#ifdef CONFIG_USER_ONLY
+        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
+                              MMU_DATA_LOAD, true, GETPC());
+#else
         do_raise_exception(env, EXCCODE_ADEM, GETPC());
+#endif
     }
 }
 
 void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
 {
     if (rj <= rk) {
+#ifdef CONFIG_USER_ONLY
+        cpu_loop_exit_sigsegv(env_cpu(env), GETPC(),
+                              MMU_DATA_LOAD, true, GETPC());
+#else
         do_raise_exception(env, EXCCODE_ADEM, GETPC());
+#endif
     }
 }
 
@@ -84,6 +94,7 @@ target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
     return rj > 21 ? 0 : env->cpucfg[rj];
 }
 
+#ifndef CONFIG_USER_ONLY
 uint64_t helper_rdtime_d(CPULoongArchState *env)
 {
     uint64_t plv;
@@ -131,3 +142,4 @@ void helper_idle(CPULoongArchState *env)
     cs->halted = 1;
     do_raise_exception(env, EXCP_HLT, 0);
 }
+#endif
-- 
2.31.1


