Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7D73B5DEE
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:25:09 +0200 (CEST)
Received: from localhost ([::1]:48332 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqK2-0002I4-Hb
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:25:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52492)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq6h-0004hM-9L
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:11:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:46926 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq6a-00042W-26
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:11:19 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S8;
 Mon, 28 Jun 2021 20:04:48 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 06/20] target/loongarch: Add main translation routines
Date: Mon, 28 Jun 2021 20:04:31 +0800
Message-Id: <1624881885-31692-7-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S8
X-Coremail-Antispam: 1UD129KBjvAXoW3tFW8XrWkGF1UGw45AFyrWFg_yoW8CF45uo
 W7CF45Ary8GrnxZr9akr4kJa42qF4Ika1UJa90va1kWa18CrW5tF9xKw15ZrW7JF4kGay7
 WF9avF17Xan7Jrnxn29KB7ZKAUJUUUU3529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch add main translation routines and
basic functions for translation.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/helper.h    |  10 +
 target/loongarch/op_helper.c |  28 +++
 target/loongarch/translate.c | 537 +++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.h |  58 +++++
 4 files changed, 633 insertions(+)
 create mode 100644 target/loongarch/helper.h
 create mode 100644 target/loongarch/op_helper.c
 create mode 100644 target/loongarch/translate.c
 create mode 100644 target/loongarch/translate.h

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
new file mode 100644
index 0000000..6c7e19b
--- /dev/null
+++ b/target/loongarch/helper.h
@@ -0,0 +1,10 @@
+/*
+ * QEMU LoongArch CPU
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+DEF_HELPER_3(raise_exception_err, noreturn, env, i32, int)
+DEF_HELPER_2(raise_exception, noreturn, env, i32)
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
new file mode 100644
index 0000000..97113e4
--- /dev/null
+++ b/target/loongarch/op_helper.c
@@ -0,0 +1,28 @@
+/*
+ * LoongArch emulation helpers for qemu.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "internal.h"
+#include "qemu/host-utils.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+
+/* Exceptions helpers */
+void helper_raise_exception_err(CPULoongArchState *env, uint32_t exception,
+                                int error_code)
+{
+    do_raise_exception_err(env, exception, error_code, 0);
+}
+
+void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
+{
+    do_raise_exception(env, exception, GETPC());
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
new file mode 100644
index 0000000..83efd39
--- /dev/null
+++ b/target/loongarch/translate.c
@@ -0,0 +1,537 @@
+/*
+ * LoongArch emulation for QEMU - main translation routines.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internal.h"
+#include "tcg/tcg-op.h"
+#include "exec/translator.h"
+#include "exec/helper-proto.h"
+#include "exec/helper-gen.h"
+#include "semihosting/semihost.h"
+
+#include "exec/translator.h"
+#include "exec/log.h"
+#include "qemu/qemu-print.h"
+#include "fpu_helper.h"
+#include "translate.h"
+#include "instmap.h"
+
+/* global register indices */
+TCGv cpu_gpr[32], cpu_PC;
+TCGv btarget, bcond;
+static TCGv cpu_lladdr, cpu_llval;
+static TCGv_i32 hflags;
+TCGv_i32 fpu_fcsr0;
+TCGv_i64 fpu_f64[32];
+
+#include "exec/gen-icount.h"
+
+#define DISAS_STOP       DISAS_TARGET_0
+#define DISAS_EXIT       DISAS_TARGET_1
+
+static const char * const regnames[] = {
+    "r0", "ra", "tp", "sp", "a0", "a1", "a2", "a3",
+    "a4", "a5", "a6", "a7", "t0", "t1", "t2", "t3",
+    "t4", "t5", "t6", "t7", "t8", "x0", "fp", "s0",
+    "s1", "s2", "s3", "s4", "s5", "s6", "s7", "s8",
+};
+
+static const char * const fregnames[] = {
+    "f0",  "f1",  "f2",  "f3",  "f4",  "f5",  "f6",  "f7",
+    "f8",  "f9",  "f10", "f11", "f12", "f13", "f14", "f15",
+    "f16", "f17", "f18", "f19", "f20", "f21", "f22", "f23",
+    "f24", "f25", "f26", "f27", "f28", "f29", "f30", "f31",
+};
+
+/* General purpose registers moves. */
+void gen_load_gpr(TCGv t, int reg)
+{
+    if (reg == 0) {
+        tcg_gen_movi_tl(t, 0);
+    } else {
+        tcg_gen_mov_tl(t, cpu_gpr[reg]);
+    }
+}
+
+void gen_store_gpr(TCGv t, int reg)
+{
+    if (reg != 0) {
+        tcg_gen_mov_tl(cpu_gpr[reg], t);
+    }
+}
+
+static inline void gen_save_pc(target_ulong pc)
+{
+    tcg_gen_movi_tl(cpu_PC, pc);
+}
+
+static inline void save_cpu_state(DisasContext *ctx, int do_save_pc)
+{
+    if (do_save_pc && ctx->base.pc_next != ctx->saved_pc) {
+        gen_save_pc(ctx->base.pc_next);
+        ctx->saved_pc = ctx->base.pc_next;
+    }
+    if (ctx->hflags != ctx->saved_hflags) {
+        tcg_gen_movi_i32(hflags, ctx->hflags);
+        ctx->saved_hflags = ctx->hflags;
+        switch (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
+        case LOONGARCH_HFLAG_BR:
+            break;
+        case LOONGARCH_HFLAG_BC:
+        case LOONGARCH_HFLAG_B:
+            tcg_gen_movi_tl(btarget, ctx->btarget);
+            break;
+        }
+    }
+}
+
+static inline void restore_cpu_state(CPULoongArchState *env, DisasContext *ctx)
+{
+    ctx->saved_hflags = ctx->hflags;
+    switch (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
+    case LOONGARCH_HFLAG_BR:
+        break;
+    case LOONGARCH_HFLAG_BC:
+    case LOONGARCH_HFLAG_B:
+        ctx->btarget = env->btarget;
+        break;
+    }
+}
+
+void generate_exception_err(DisasContext *ctx, int excp, int err)
+{
+    TCGv_i32 texcp = tcg_const_i32(excp);
+    TCGv_i32 terr = tcg_const_i32(err);
+    save_cpu_state(ctx, 1);
+    gen_helper_raise_exception_err(cpu_env, texcp, terr);
+    tcg_temp_free_i32(terr);
+    tcg_temp_free_i32(texcp);
+    ctx->base.is_jmp = DISAS_NORETURN;
+}
+
+void generate_exception_end(DisasContext *ctx, int excp)
+{
+    generate_exception_err(ctx, excp, 0);
+}
+
+void gen_reserved_instruction(DisasContext *ctx)
+{
+    generate_exception_end(ctx, EXCP_INE);
+}
+
+void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
+{
+    tcg_gen_extrl_i64_i32(t, fpu_f64[reg]);
+}
+
+void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg)
+{
+    TCGv_i64 t64 = tcg_temp_new_i64();
+    tcg_gen_extu_i32_i64(t64, t);
+    tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 0, 32);
+    tcg_temp_free_i64(t64);
+}
+
+static void gen_load_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
+{
+    tcg_gen_extrh_i64_i32(t, fpu_f64[reg]);
+}
+
+static void gen_store_fpr32h(DisasContext *ctx, TCGv_i32 t, int reg)
+{
+    TCGv_i64 t64 = tcg_temp_new_i64();
+    tcg_gen_extu_i32_i64(t64, t);
+    tcg_gen_deposit_i64(fpu_f64[reg], fpu_f64[reg], t64, 32, 32);
+    tcg_temp_free_i64(t64);
+}
+
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
+{
+    tcg_gen_mov_i64(t, fpu_f64[reg]);
+}
+
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg)
+{
+    tcg_gen_mov_i64(fpu_f64[reg], t);
+}
+
+/* Addresses computation */
+void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1)
+{
+    tcg_gen_add_tl(ret, arg0, arg1);
+}
+
+/* Sign-extract the low 32-bits to a target_long. */
+void gen_move_low32(TCGv ret, TCGv_i64 arg)
+{
+    tcg_gen_ext32s_i64(ret, arg);
+}
+
+/* Sign-extract the high 32-bits to a target_long.  */
+void gen_move_high32(TCGv ret, TCGv_i64 arg)
+{
+    tcg_gen_sari_i64(ret, arg, 32);
+}
+
+void check_fpu_enabled(DisasContext *ctx)
+{
+    /* Nop */
+}
+
+/*
+ * This code generates a "reserved instruction" exception if 64-bit
+ * instructions are not enabled.
+ */
+void check_loongarch_64(DisasContext *ctx)
+{
+    if (unlikely(!(ctx->hflags & LOONGARCH_HFLAG_64))) {
+        gen_reserved_instruction(ctx);
+    }
+}
+
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset)
+{
+    if (base == 0) {
+        tcg_gen_movi_tl(addr, offset);
+    } else if (offset == 0) {
+        gen_load_gpr(addr, base);
+    } else {
+        tcg_gen_movi_tl(addr, offset);
+        gen_op_addr_add(ctx, addr, cpu_gpr[base], addr);
+    }
+}
+
+
+static inline bool use_goto_tb(DisasContext *ctx, target_ulong dest)
+{
+    return true;
+}
+
+static inline void gen_goto_tb(DisasContext *ctx, int n, target_ulong dest)
+{
+    if (use_goto_tb(ctx, dest)) {
+        tcg_gen_goto_tb(n);
+        gen_save_pc(dest);
+        tcg_gen_exit_tb(ctx->base.tb, n);
+    } else {
+        gen_save_pc(dest);
+        tcg_gen_lookup_and_goto_ptr();
+    }
+}
+
+static inline void clear_branch_hflags(DisasContext *ctx)
+{
+    ctx->hflags &= ~LOONGARCH_HFLAG_BMASK;
+    if (ctx->base.is_jmp == DISAS_NEXT) {
+        save_cpu_state(ctx, 0);
+    } else {
+        /*
+         * It is not safe to save ctx->hflags as hflags may be changed
+         * in execution time.
+         */
+        tcg_gen_andi_i32(hflags, hflags, ~LOONGARCH_HFLAG_BMASK);
+    }
+}
+
+static void gen_branch(DisasContext *ctx, int insn_bytes)
+{
+    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
+        int proc_hflags = ctx->hflags & LOONGARCH_HFLAG_BMASK;
+        /* Branches completion */
+        clear_branch_hflags(ctx);
+        ctx->base.is_jmp = DISAS_NORETURN;
+        switch (proc_hflags & LOONGARCH_HFLAG_BMASK) {
+        case LOONGARCH_HFLAG_B:
+            /* unconditional branch */
+            gen_goto_tb(ctx, 0, ctx->btarget);
+            break;
+        case LOONGARCH_HFLAG_BC:
+            /* Conditional branch */
+            {
+                TCGLabel *l1 = gen_new_label();
+
+                tcg_gen_brcondi_tl(TCG_COND_NE, bcond, 0, l1);
+                gen_goto_tb(ctx, 1, ctx->base.pc_next + insn_bytes);
+                gen_set_label(l1);
+                gen_goto_tb(ctx, 0, ctx->btarget);
+            }
+            break;
+        case LOONGARCH_HFLAG_BR:
+            /* unconditional branch to register */
+            tcg_gen_mov_tl(cpu_PC, btarget);
+            tcg_gen_lookup_and_goto_ptr();
+            break;
+        default:
+            fprintf(stderr, "unknown branch 0x%x\n", proc_hflags);
+            abort();
+        }
+    }
+}
+
+static void loongarch_tr_init_disas_context(DisasContextBase *dcbase,
+                                            CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    CPULoongArchState *env = cs->env_ptr;
+
+    ctx->page_start = ctx->base.pc_first & TARGET_PAGE_MASK;
+    ctx->saved_pc = -1;
+    ctx->insn_flags = env->insn_flags;
+    ctx->btarget = 0;
+    ctx->PAMask = env->PAMask;
+    /* Restore state from the tb context.  */
+    ctx->hflags = (uint32_t)ctx->base.tb->flags;
+    restore_cpu_state(env, ctx);
+    ctx->mem_idx = LOONGARCH_HFLAG_UM;
+    ctx->default_tcg_memop_mask = MO_UNALN;
+}
+
+static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
+{
+}
+
+static void loongarch_tr_insn_start(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    tcg_gen_insn_start(ctx->base.pc_next, ctx->hflags & LOONGARCH_HFLAG_BMASK,
+                       ctx->btarget);
+}
+
+static bool loongarch_tr_breakpoint_check(DisasContextBase *dcbase,
+                                          CPUState *cs,
+                                          const CPUBreakpoint *bp)
+{
+    return true;
+}
+
+/* 128 and 256 msa vector instructions are not supported yet */
+static bool decode_lsx(uint32_t opcode)
+{
+    uint32_t value = (opcode & 0xff000000);
+
+    if ((opcode & 0xf0000000) == 0x70000000) {
+        return true;
+    } else if ((opcode & 0xfff00000) == 0x38400000) {
+        return true;
+    } else {
+        switch (value) {
+        case 0x09000000:
+        case 0x0a000000:
+        case 0x0e000000:
+        case 0x0f000000:
+        case 0x2c000000:
+        case 0x30000000:
+        case 0x31000000:
+        case 0x32000000:
+        case 0x33000000:
+            return true;
+        }
+    }
+    return false;
+}
+
+static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
+{
+    CPULoongArchState *env = cs->env_ptr;
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+    int insn_bytes = 4;
+
+    ctx->opcode = cpu_ldl_code(env, ctx->base.pc_next);
+
+    if (!decode(ctx, ctx->opcode)) {
+        if (!decode_lsx(ctx->opcode)) {
+            fprintf(stderr, "Error: unkown opcode. 0x%lx: 0x%x\n",
+                    ctx->base.pc_next, ctx->opcode);
+        }
+        generate_exception_end(ctx, EXCP_INE);
+    }
+
+    if (ctx->hflags & LOONGARCH_HFLAG_BMASK) {
+        gen_branch(ctx, insn_bytes);
+    }
+    ctx->base.pc_next += insn_bytes;
+}
+
+static void loongarch_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
+{
+    DisasContext *ctx = container_of(dcbase, DisasContext, base);
+
+    switch (ctx->base.is_jmp) {
+    case DISAS_STOP:
+        gen_save_pc(ctx->base.pc_next);
+        tcg_gen_lookup_and_goto_ptr();
+        break;
+    case DISAS_NEXT:
+    case DISAS_TOO_MANY:
+        save_cpu_state(ctx, 0);
+        gen_goto_tb(ctx, 0, ctx->base.pc_next);
+        break;
+    case DISAS_EXIT:
+        tcg_gen_exit_tb(NULL, 0);
+        break;
+    case DISAS_NORETURN:
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void loongarch_tr_disas_log(const DisasContextBase *dcbase, CPUState *cs)
+{
+    qemu_log("IN: %s\n", lookup_symbol(dcbase->pc_first));
+    log_target_disas(cs, dcbase->pc_first, dcbase->tb->size);
+}
+
+static const TranslatorOps loongarch_tr_ops = {
+    .init_disas_context = loongarch_tr_init_disas_context,
+    .tb_start           = loongarch_tr_tb_start,
+    .insn_start         = loongarch_tr_insn_start,
+    .breakpoint_check   = loongarch_tr_breakpoint_check,
+    .translate_insn     = loongarch_tr_translate_insn,
+    .tb_stop            = loongarch_tr_tb_stop,
+    .disas_log          = loongarch_tr_disas_log,
+};
+
+void gen_intermediate_code(CPUState *cs, TranslationBlock *tb, int max_insns)
+{
+    DisasContext ctx;
+
+    translator_loop(&loongarch_tr_ops, &ctx.base, cs, tb, max_insns);
+}
+
+static void fpu_dump_state(CPULoongArchState *env, FILE * f, int flags)
+{
+    int i;
+    int is_fpu64 = 1;
+
+#define printfpr(fp)                                              \
+    do {                                                          \
+        if (is_fpu64)                                             \
+            qemu_fprintf(f, "w:%08x d:%016" PRIx64                \
+                        " fd:%13g fs:%13g psu: %13g\n",           \
+                        (fp)->w[FP_ENDIAN_IDX], (fp)->d,          \
+                        (double)(fp)->fd,                         \
+                        (double)(fp)->fs[FP_ENDIAN_IDX],          \
+                        (double)(fp)->fs[!FP_ENDIAN_IDX]);        \
+        else {                                                    \
+            fpr_t tmp;                                            \
+            tmp.w[FP_ENDIAN_IDX] = (fp)->w[FP_ENDIAN_IDX];        \
+            tmp.w[!FP_ENDIAN_IDX] = ((fp) + 1)->w[FP_ENDIAN_IDX]; \
+            qemu_fprintf(f, "w:%08x d:%016" PRIx64                \
+                        " fd:%13g fs:%13g psu:%13g\n",            \
+                        tmp.w[FP_ENDIAN_IDX], tmp.d,              \
+                        (double)tmp.fd,                           \
+                        (double)tmp.fs[FP_ENDIAN_IDX],            \
+                        (double)tmp.fs[!FP_ENDIAN_IDX]);          \
+        }                                                         \
+    } while (0)
+
+
+    qemu_fprintf(f,
+                 "FCSR0 0x%08x  SR.FR %d  fp_status 0x%02x\n",
+                 env->active_fpu.fcsr0, is_fpu64,
+                 get_float_exception_flags(&env->active_fpu.fp_status));
+    for (i = 0; i < 32; (is_fpu64) ? i++ : (i += 2)) {
+        qemu_fprintf(f, "%3s: ", fregnames[i]);
+        printfpr(&env->active_fpu.fpr[i]);
+    }
+
+#undef printfpr
+}
+
+void loongarch_cpu_dump_state(CPUState *cs, FILE *f, int flags)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(cs);
+    CPULoongArchState *env = &cpu->env;
+    int i;
+
+    qemu_fprintf(f, "pc=0x" TARGET_FMT_lx " ds %04x "
+                 TARGET_FMT_lx " " TARGET_FMT_ld "\n",
+                 env->active_tc.PC, env->hflags, env->btarget, env->bcond);
+    for (i = 0; i < 32; i++) {
+        if ((i & 3) == 0) {
+            qemu_fprintf(f, "GPR%02d:", i);
+        }
+        qemu_fprintf(f, " %s " TARGET_FMT_lx,
+                     regnames[i], env->active_tc.gpr[i]);
+        if ((i & 3) == 3) {
+            qemu_fprintf(f, "\n");
+        }
+    }
+
+    qemu_fprintf(f, "EUEN            0x%lx\n", env->CSR_EUEN);
+    qemu_fprintf(f, "ESTAT           0x%lx\n", env->CSR_ESTAT);
+    qemu_fprintf(f, "ERA             0x%lx\n", env->CSR_ERA);
+    qemu_fprintf(f, "CRMD            0x%lx\n", env->CSR_CRMD);
+    qemu_fprintf(f, "PRMD            0x%lx\n", env->CSR_PRMD);
+    qemu_fprintf(f, "BadVAddr        0x%lx\n", env->CSR_BADV);
+    qemu_fprintf(f, "TLB refill ERA  0x%lx\n", env->CSR_TLBRERA);
+    qemu_fprintf(f, "TLB refill BadV 0x%lx\n", env->CSR_TLBRBADV);
+    qemu_fprintf(f, "EEPN            0x%lx\n", env->CSR_EEPN);
+    qemu_fprintf(f, "BadInstr        0x%lx\n", env->CSR_BADI);
+    qemu_fprintf(f, "PRCFG1    0x%lx\nPRCFG2     0x%lx\nPRCFG3     0x%lx\n",
+                 env->CSR_PRCFG1, env->CSR_PRCFG3, env->CSR_PRCFG3);
+    if ((flags & CPU_DUMP_FPU) && (env->hflags & LOONGARCH_HFLAG_FPU)) {
+        fpu_dump_state(env, f, flags);
+    }
+}
+
+void loongarch_tcg_init(void)
+{
+    int i;
+
+    for (i = 0; i < 32; i++)
+        cpu_gpr[i] = tcg_global_mem_new(cpu_env,
+                                        offsetof(CPULoongArchState,
+                                                 active_tc.gpr[i]),
+                                        regnames[i]);
+
+    for (i = 0; i < 32; i++) {
+        int off = offsetof(CPULoongArchState, active_fpu.fpr[i].d);
+        fpu_f64[i] = tcg_global_mem_new_i64(cpu_env, off, fregnames[i]);
+    }
+
+    cpu_PC = tcg_global_mem_new(cpu_env,
+                                offsetof(CPULoongArchState,
+                                         active_tc.PC), "PC");
+    bcond = tcg_global_mem_new(cpu_env,
+                               offsetof(CPULoongArchState, bcond), "bcond");
+    btarget = tcg_global_mem_new(cpu_env,
+                                 offsetof(CPULoongArchState, btarget),
+                                 "btarget");
+    hflags = tcg_global_mem_new_i32(cpu_env,
+                                    offsetof(CPULoongArchState, hflags),
+                                    "hflags");
+    fpu_fcsr0 = tcg_global_mem_new_i32(cpu_env,
+                                   offsetof(CPULoongArchState,
+                                            active_fpu.fcsr0), "fcsr0");
+    cpu_lladdr = tcg_global_mem_new(cpu_env,
+                                    offsetof(CPULoongArchState, lladdr),
+                                    "lladdr");
+    cpu_llval = tcg_global_mem_new(cpu_env,
+                                   offsetof(CPULoongArchState, llval),
+                                   "llval");
+}
+
+void restore_state_to_opc(CPULoongArchState *env, TranslationBlock *tb,
+                          target_ulong *data)
+{
+    env->active_tc.PC = data[0];
+    env->hflags &= ~LOONGARCH_HFLAG_BMASK;
+    env->hflags |= data[1];
+    switch (env->hflags & LOONGARCH_HFLAG_BMASK) {
+    case LOONGARCH_HFLAG_BR:
+        break;
+    case LOONGARCH_HFLAG_BC:
+    case LOONGARCH_HFLAG_B:
+        env->btarget = data[2];
+        break;
+    }
+}
diff --git a/target/loongarch/translate.h b/target/loongarch/translate.h
new file mode 100644
index 0000000..c7f2b4b
--- /dev/null
+++ b/target/loongarch/translate.h
@@ -0,0 +1,58 @@
+/*
+ * LoongArch translation routines.
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+#ifndef TARGET_LOONGARCH_TRANSLATE_H
+#define TARGET_LOONGARCH_TRANSLATE_H
+
+#include "exec/translator.h"
+
+#define LOONGARCH_DEBUG_DISAS 0
+
+typedef struct DisasContext {
+    DisasContextBase base;
+    target_ulong saved_pc;
+    target_ulong page_start;
+    uint32_t opcode;
+    uint64_t insn_flags;
+    /* Routine used to access memory */
+    int mem_idx;
+    MemOp default_tcg_memop_mask;
+    uint32_t hflags, saved_hflags;
+    target_ulong btarget;
+    uint64_t PAMask;
+} DisasContext;
+
+void generate_exception_err(DisasContext *ctx, int excp, int err);
+void generate_exception_end(DisasContext *ctx, int excp);
+void gen_reserved_instruction(DisasContext *ctx);
+
+void check_insn(DisasContext *ctx, uint64_t flags);
+void check_loongarch_64(DisasContext *ctx);
+void check_fpu_enabled(DisasContext *ctx);
+
+void gen_base_offset_addr(DisasContext *ctx, TCGv addr, int base, int offset);
+void gen_move_low32(TCGv ret, TCGv_i64 arg);
+void gen_move_high32(TCGv ret, TCGv_i64 arg);
+void gen_load_gpr(TCGv t, int reg);
+void gen_store_gpr(TCGv t, int reg);
+void gen_load_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
+void gen_load_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+void gen_store_fpr32(DisasContext *ctx, TCGv_i32 t, int reg);
+void gen_store_fpr64(DisasContext *ctx, TCGv_i64 t, int reg);
+
+/*
+ * Address Computation and Large Constant Instructions
+ */
+void gen_op_addr_add(DisasContext *ctx, TCGv ret, TCGv arg0, TCGv arg1);
+
+extern TCGv cpu_gpr[32], cpu_PC;
+extern TCGv_i32 fpu_fscr0;
+extern TCGv_i64 fpu_f64[32];
+extern TCGv bcond;
+
+#endif
-- 
1.8.3.1


