Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A849B50DD35
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Apr 2022 11:53:14 +0200 (CEST)
Received: from localhost ([::1]:36626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nivP7-0006wY-Pk
	for lists+qemu-devel@lfdr.de; Mon, 25 Apr 2022 05:53:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48522)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1niukY-0008LY-Ev
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:21 -0400
Received: from mail.loongson.cn ([114.242.206.163]:39648 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1niukS-0001Kp-E2
 for qemu-devel@nongnu.org; Mon, 25 Apr 2022 05:11:16 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxn8+DZWZi+7gwAA--.18850S27; 
 Mon, 25 Apr 2022 17:10:50 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 25/43] target/loongarch: Add LoongArch CSR instruction
Date: Mon, 25 Apr 2022 17:10:09 +0800
Message-Id: <20220425091027.2877892-26-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
References: <20220425091027.2877892-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxn8+DZWZi+7gwAA--.18850S27
X-Coremail-Antispam: 1UD129KBjvAXoW3Zr4kur45tF15KrW5Xw15twb_yoW8Wry7Ao
 WxAF45Jw4kGryY9r90g3ZIq3yjvrykCrs5A34kuF1rua1rWrnFgrs5Ww1rA3yxGr10g34r
 X3W2qa43Krn3Ar9rn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
 AaLaJ3UjIYCTnIWjDUYxBIdaVFxhVjvjDU0xZFpf9x0zRUUUUUUUUU=
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

This includes:
- CSRRD
- CSRWR
- CSRXCHG

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/csr_helper.c                 |  87 ++++++
 target/loongarch/disas.c                      |  95 +++++++
 target/loongarch/helper.h                     |   8 +
 .../insn_trans/trans_privileged.c.inc         | 258 ++++++++++++++++++
 target/loongarch/insns.decode                 |  13 +
 target/loongarch/meson.build                  |   1 +
 target/loongarch/translate.c                  |  11 +-
 7 files changed, 472 insertions(+), 1 deletion(-)
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc

diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
new file mode 100644
index 0000000000..739cf4d1ec
--- /dev/null
+++ b/target/loongarch/csr_helper.c
@@ -0,0 +1,87 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * LoongArch emulation helpers for CSRs
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "cpu.h"
+#include "internals.h"
+#include "qemu/host-utils.h"
+#include "exec/helper-proto.h"
+#include "exec/exec-all.h"
+#include "exec/cpu_ldst.h"
+#include "hw/irq.h"
+#include "cpu-csr.h"
+#include "tcg/tcg-ldst.h"
+
+target_ulong helper_csrrd_pgd(CPULoongArchState *env)
+{
+    int64_t v;
+
+    if (env->CSR_TLBRERA & 0x1) {
+        v = env->CSR_TLBRBADV;
+    } else {
+        v = env->CSR_BADV;
+    }
+
+    if ((v >> 63) & 0x1) {
+        v = env->CSR_PGDH;
+    } else {
+        v = env->CSR_PGDL;
+    }
+
+    return v;
+}
+
+target_ulong helper_csrrd_tval(CPULoongArchState *env)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
+
+    return cpu_loongarch_get_constant_timer_ticks(cpu);
+}
+
+target_ulong helper_csrwr_estat(CPULoongArchState *env, target_ulong val)
+{
+    int64_t old_v = env->CSR_ESTAT;
+
+    /* Only IS[1:0] can be written */
+    env->CSR_ESTAT = deposit64(env->CSR_ESTAT, 0, 2, val);
+
+    return old_v;
+}
+
+target_ulong helper_csrwr_asid(CPULoongArchState *env, target_ulong val)
+{
+    int64_t old_v = env->CSR_ASID;
+
+    /* Only ASID filed of CSR_ASID can be written */
+    env->CSR_ASID = deposit64(env->CSR_ASID, 0, 10, val);
+    if (old_v != env->CSR_ASID) {
+        tlb_flush(env_cpu(env));
+    }
+    return old_v;
+}
+
+target_ulong helper_csrwr_tcfg(CPULoongArchState *env, target_ulong val)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
+    int64_t old_v = env->CSR_TCFG;
+
+    cpu_loongarch_store_constant_timer_config(cpu, val);
+
+    return old_v;
+}
+
+target_ulong helper_csrwr_ticlr(CPULoongArchState *env, target_ulong val)
+{
+    LoongArchCPU *cpu = LOONGARCH_CPU(env_cpu(env));
+    int64_t old_v = 0;
+
+    if (val & 0x1) {
+        loongarch_cpu_set_irq(cpu, IRQ_TIMER, 0);
+    }
+    return old_v;
+}
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 9454ebb8e9..c76b82dfdf 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -8,6 +8,7 @@
 #include "qemu/osdep.h"
 #include "disas/dis-asm.h"
 #include "qemu/bitops.h"
+#include "cpu-csr.h"
 
 typedef struct {
     disassemble_info *info;
@@ -25,6 +26,84 @@ static inline int shl_2(DisasContext *ctx, int x)
     return x << 2;
 }
 
+#define CSR_NAME(REG) \
+    [LOONGARCH_CSR_##REG] = (#REG)
+
+static const char * const csr_names[] = {
+    CSR_NAME(CRMD),
+    CSR_NAME(PRMD),
+    CSR_NAME(EUEN),
+    CSR_NAME(MISC),
+    CSR_NAME(ECFG),
+    CSR_NAME(ESTAT),
+    CSR_NAME(ERA),
+    CSR_NAME(BADV),
+    CSR_NAME(BADI),
+    CSR_NAME(EENTRY),
+    CSR_NAME(TLBIDX),
+    CSR_NAME(TLBEHI),
+    CSR_NAME(TLBELO0),
+    CSR_NAME(TLBELO1),
+    CSR_NAME(ASID),
+    CSR_NAME(PGDL),
+    CSR_NAME(PGDH),
+    CSR_NAME(PGD),
+    CSR_NAME(PWCL),
+    CSR_NAME(PWCH),
+    CSR_NAME(STLBPS),
+    CSR_NAME(RVACFG),
+    CSR_NAME(CPUID),
+    CSR_NAME(PRCFG1),
+    CSR_NAME(PRCFG2),
+    CSR_NAME(PRCFG3),
+    CSR_NAME(SAVE(0)),
+    CSR_NAME(SAVE(1)),
+    CSR_NAME(SAVE(2)),
+    CSR_NAME(SAVE(3)),
+    CSR_NAME(SAVE(4)),
+    CSR_NAME(SAVE(5)),
+    CSR_NAME(SAVE(6)),
+    CSR_NAME(SAVE(7)),
+    CSR_NAME(SAVE(8)),
+    CSR_NAME(SAVE(9)),
+    CSR_NAME(SAVE(10)),
+    CSR_NAME(SAVE(11)),
+    CSR_NAME(SAVE(12)),
+    CSR_NAME(SAVE(13)),
+    CSR_NAME(SAVE(14)),
+    CSR_NAME(SAVE(15)),
+    CSR_NAME(TID),
+    CSR_NAME(TCFG),
+    CSR_NAME(TVAL),
+    CSR_NAME(CNTC),
+    CSR_NAME(TICLR),
+    CSR_NAME(LLBCTL),
+    CSR_NAME(IMPCTL1),
+    CSR_NAME(IMPCTL2),
+    CSR_NAME(TLBRENTRY),
+    CSR_NAME(TLBRBADV),
+    CSR_NAME(TLBRERA),
+    CSR_NAME(TLBRSAVE),
+    CSR_NAME(TLBRELO0),
+    CSR_NAME(TLBRELO1),
+    CSR_NAME(TLBREHI),
+    CSR_NAME(TLBRPRMD),
+    CSR_NAME(MERRCTL),
+    CSR_NAME(MERRINFO1),
+    CSR_NAME(MERRINFO2),
+    CSR_NAME(MERRENTRY),
+    CSR_NAME(MERRERA),
+    CSR_NAME(MERRSAVE),
+    CSR_NAME(CTAG),
+    CSR_NAME(DMW(0)),
+    CSR_NAME(DMW(1)),
+    CSR_NAME(DMW(2)),
+    CSR_NAME(DMW(3)),
+    CSR_NAME(DBG),
+    CSR_NAME(DERA),
+    CSR_NAME(DSAVE),
+};
+
 #define output(C, INSN, FMT, ...)                                   \
 {                                                                   \
     (C)->info->fprintf_func((C)->info->stream, "%08x   %-9s\t" FMT, \
@@ -205,6 +284,19 @@ static void output_rr_offs(DisasContext *ctx, arg_rr_offs *a,
            a->rd, a->offs, ctx->pc + a->offs);
 }
 
+static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
+                         const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, %d # %s", a->rd, a->csr, csr_names[a->csr]);
+}
+
+static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
+                          const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, %d # %s",
+           a->rd, a->rj, a->csr, csr_names[a->csr]);
+}
+
 #define INSN(insn, type)                                    \
 static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
 {                                                           \
@@ -514,6 +606,9 @@ INSN(blt,          rr_offs)
 INSN(bge,          rr_offs)
 INSN(bltu,         rr_offs)
 INSN(bgeu,         rr_offs)
+INSN(csrrd,        r_csr)
+INSN(csrwr,        r_csr)
+INSN(csrxchg,      rr_csr)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index da1a2bced7..5a6754eb65 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -92,3 +92,11 @@ DEF_HELPER_2(frint_s, i64, env, i64)
 DEF_HELPER_2(frint_d, i64, env, i64)
 
 DEF_HELPER_FLAGS_2(set_rounding_mode, TCG_CALL_NO_RWG, void, env, i32)
+
+/* CSRs helper */
+DEF_HELPER_1(csrrd_pgd, i64, env)
+DEF_HELPER_1(csrrd_tval, i64, env)
+DEF_HELPER_2(csrwr_estat, i64, env, tl)
+DEF_HELPER_2(csrwr_asid, i64, env, tl)
+DEF_HELPER_2(csrwr_tcfg, i64, env, tl)
+DEF_HELPER_2(csrwr_ticlr, i64, env, tl)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
new file mode 100644
index 0000000000..0fc5d7935c
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -0,0 +1,258 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * LoongArch translation routines for the privileged instructions.
+ */
+
+#include "cpu-csr.h"
+
+typedef void (*GenCSRRead)(TCGv dest, TCGv_ptr env);
+typedef void (*GenCSRWrite)(TCGv dest, TCGv_ptr env, TCGv src);
+
+typedef struct {
+    int offset;
+    int flags;
+    GenCSRRead readfn;
+    GenCSRWrite writefn;
+} CSRInfo;
+
+enum {
+    CSRFL_READONLY = (1 << 0),
+    CSRFL_EXITTB   = (1 << 1),
+    CSRFL_IO       = (1 << 2),
+};
+
+#define CSR_OFF_FUNCS(NAME, FL, RD, WR)                    \
+    [LOONGARCH_CSR_##NAME] = {                             \
+        .offset = offsetof(CPULoongArchState, CSR_##NAME), \
+        .flags = FL, .readfn = RD, .writefn = WR           \
+    }
+
+#define CSR_OFF_ARRAY(NAME, N)                                \
+    [LOONGARCH_CSR_##NAME(N)] = {                             \
+        .offset = offsetof(CPULoongArchState, CSR_##NAME[N]), \
+        .flags = 0, .readfn = NULL, .writefn = NULL           \
+    }
+
+#define CSR_OFF_FLAGS(NAME, FL) \
+    CSR_OFF_FUNCS(NAME, FL, NULL, NULL)
+
+#define CSR_OFF(NAME) \
+    CSR_OFF_FLAGS(NAME, 0)
+
+static const CSRInfo csr_info[] = {
+    CSR_OFF_FLAGS(CRMD, CSRFL_EXITTB),
+    CSR_OFF(PRMD),
+    CSR_OFF_FLAGS(EUEN, CSRFL_EXITTB),
+    CSR_OFF_FLAGS(MISC, CSRFL_READONLY),
+    CSR_OFF(ECFG),
+    CSR_OFF_FUNCS(ESTAT, CSRFL_EXITTB, NULL, gen_helper_csrwr_estat),
+    CSR_OFF(ERA),
+    CSR_OFF(BADV),
+    CSR_OFF_FLAGS(BADI, CSRFL_READONLY),
+    CSR_OFF(EENTRY),
+    CSR_OFF(TLBIDX),
+    CSR_OFF(TLBEHI),
+    CSR_OFF(TLBELO0),
+    CSR_OFF(TLBELO1),
+    CSR_OFF_FUNCS(ASID, CSRFL_EXITTB, NULL, gen_helper_csrwr_asid),
+    CSR_OFF(PGDL),
+    CSR_OFF(PGDH),
+    CSR_OFF_FUNCS(PGD, CSRFL_READONLY, gen_helper_csrrd_pgd, NULL),
+    CSR_OFF(PWCL),
+    CSR_OFF(PWCH),
+    CSR_OFF(STLBPS),
+    CSR_OFF(RVACFG),
+    CSR_OFF_FLAGS(CPUID, CSRFL_READONLY),
+    CSR_OFF_FLAGS(PRCFG1, CSRFL_READONLY),
+    CSR_OFF_FLAGS(PRCFG2, CSRFL_READONLY),
+    CSR_OFF_FLAGS(PRCFG3, CSRFL_READONLY),
+    CSR_OFF_ARRAY(SAVE, 0),
+    CSR_OFF_ARRAY(SAVE, 1),
+    CSR_OFF_ARRAY(SAVE, 2),
+    CSR_OFF_ARRAY(SAVE, 3),
+    CSR_OFF_ARRAY(SAVE, 4),
+    CSR_OFF_ARRAY(SAVE, 5),
+    CSR_OFF_ARRAY(SAVE, 6),
+    CSR_OFF_ARRAY(SAVE, 7),
+    CSR_OFF_ARRAY(SAVE, 8),
+    CSR_OFF_ARRAY(SAVE, 9),
+    CSR_OFF_ARRAY(SAVE, 10),
+    CSR_OFF_ARRAY(SAVE, 11),
+    CSR_OFF_ARRAY(SAVE, 12),
+    CSR_OFF_ARRAY(SAVE, 13),
+    CSR_OFF_ARRAY(SAVE, 14),
+    CSR_OFF_ARRAY(SAVE, 15),
+    CSR_OFF(TID),
+    CSR_OFF_FUNCS(TCFG, CSRFL_IO, NULL, gen_helper_csrwr_tcfg),
+    CSR_OFF_FUNCS(TVAL, CSRFL_READONLY | CSRFL_IO, gen_helper_csrrd_tval, NULL),
+    CSR_OFF(CNTC),
+    CSR_OFF_FUNCS(TICLR, CSRFL_IO, NULL, gen_helper_csrwr_ticlr),
+    CSR_OFF(LLBCTL),
+    CSR_OFF(IMPCTL1),
+    CSR_OFF(IMPCTL2),
+    CSR_OFF(TLBRENTRY),
+    CSR_OFF(TLBRBADV),
+    CSR_OFF(TLBRERA),
+    CSR_OFF(TLBRSAVE),
+    CSR_OFF(TLBRELO0),
+    CSR_OFF(TLBRELO1),
+    CSR_OFF(TLBREHI),
+    CSR_OFF(TLBRPRMD),
+    CSR_OFF(MERRCTL),
+    CSR_OFF(MERRINFO1),
+    CSR_OFF(MERRINFO2),
+    CSR_OFF(MERRENTRY),
+    CSR_OFF(MERRERA),
+    CSR_OFF(MERRSAVE),
+    CSR_OFF(CTAG),
+    CSR_OFF_ARRAY(DMW, 0),
+    CSR_OFF_ARRAY(DMW, 1),
+    CSR_OFF_ARRAY(DMW, 2),
+    CSR_OFF_ARRAY(DMW, 3),
+    CSR_OFF(DBG),
+    CSR_OFF(DERA),
+    CSR_OFF(DSAVE),
+};
+
+static bool check_plv(DisasContext *ctx)
+{
+    if (ctx->base.tb->flags == MMU_USER_IDX) {
+        generate_exception(ctx, EXCCODE_IPE);
+        return true;
+    }
+    return false;
+}
+
+static const CSRInfo *get_csr(unsigned csr_num)
+{
+    const CSRInfo *csr;
+
+    if (csr_num >= ARRAY_SIZE(csr_info)) {
+        return NULL;
+    }
+    csr = &csr_info[csr_num];
+    if (csr->offset == 0) {
+        return NULL;
+    }
+    return csr;
+}
+
+static bool check_csr_flags(DisasContext *ctx, const CSRInfo *csr, bool write)
+{
+    if ((csr->flags & CSRFL_READONLY) && write) {
+        return false;
+    }
+    if ((csr->flags & CSRFL_IO) &&
+        (tb_cflags(ctx->base.tb) & CF_USE_ICOUNT)) {
+        gen_io_start();
+        ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+    } else if ((csr->flags & CSRFL_EXITTB) && write) {
+        ctx->base.is_jmp = DISAS_EXIT_UPDATE;
+    }
+    return true;
+}
+
+static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
+{
+    TCGv dest;
+    const CSRInfo *csr;
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    csr = get_csr(a->csr);
+    if (csr == NULL) {
+        /* CSR is undefined: read as 0. */
+        dest = tcg_constant_tl(0);
+    } else {
+        check_csr_flags(ctx, csr, false);
+        dest = gpr_dst(ctx, a->rd, EXT_NONE);
+        if (csr->readfn) {
+            csr->readfn(dest, cpu_env);
+        } else {
+            tcg_gen_ld_tl(dest, cpu_env, csr->offset);
+        }
+    }
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    return true;
+}
+
+static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
+{
+    TCGv dest, src1;
+    const CSRInfo *csr;
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    csr = get_csr(a->csr);
+    if (csr == NULL) {
+        /* CSR is undefined: write ignored, read old_value as 0. */
+        gen_set_gpr(a->rd, tcg_constant_tl(0), EXT_NONE);
+        return true;
+    }
+    if (!check_csr_flags(ctx, csr, true)) {
+        /* CSR is readonly: trap. */
+        return false;
+    }
+    src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    if (csr->writefn) {
+        dest = gpr_dst(ctx, a->rd, EXT_NONE);
+        csr->writefn(dest, cpu_env, src1);
+    } else {
+        dest = temp_new(ctx);
+        tcg_gen_ld_tl(dest, cpu_env, csr->offset);
+        tcg_gen_st_tl(src1, cpu_env, csr->offset);
+    }
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    return true;
+}
+
+static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
+{
+    TCGv src1, mask, oldv, newv, temp;
+    const CSRInfo *csr;
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+    csr = get_csr(a->csr);
+    if (csr == NULL) {
+        /* CSR is undefined: write ignored, read old_value as 0. */
+        gen_set_gpr(a->rd, tcg_constant_tl(0), EXT_NONE);
+        return true;
+    }
+
+    if (!check_csr_flags(ctx, csr, true)) {
+        /* CSR is readonly: trap. */
+        return false;
+    }
+
+    /* So far only readonly csrs have readfn. */
+    assert(csr->readfn == NULL);
+
+    src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    mask = gpr_src(ctx, a->rj, EXT_NONE);
+    oldv = tcg_temp_new();
+    newv = tcg_temp_new();
+    temp = tcg_temp_new();
+
+    tcg_gen_ld_tl(oldv, cpu_env, csr->offset);
+    tcg_gen_and_tl(newv, src1, mask);
+    tcg_gen_andc_tl(temp, oldv, mask);
+    tcg_gen_or_tl(newv, newv, temp);
+
+    if (csr->writefn) {
+        csr->writefn(oldv, cpu_env, newv);
+    } else {
+        tcg_gen_st_tl(newv, cpu_env, csr->offset);
+    }
+    gen_set_gpr(a->rd, oldv, EXT_NONE);
+
+    tcg_temp_free(temp);
+    tcg_temp_free(newv);
+    tcg_temp_free(oldv);
+    return true;
+}
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 9b293dfdf9..43005ca283 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -45,6 +45,8 @@
 &c_offs       cj offs
 &offs         offs
 &rr_offs      rj rd offs
+&r_csr        rd csr
+&rr_csr       rd rj csr
 
 #
 # Formats
@@ -85,6 +87,8 @@
 @c_offs21      .... .. ................ .. cj:3 .....    &c_offs      offs=%offs21
 @offs26            .... .. ..........................    &offs        offs=%offs26
 @rr_offs16         .... .. ................ rj:5 rd:5    &rr_offs     offs=%offs16
+@r_csr                    .... .... csr:14 ..... rd:5    &r_csr
+@rr_csr                    .... .... csr:14 rj:5 rd:5    &rr_csr
 
 #
 # Fixed point arithmetic operation instruction
@@ -437,3 +441,12 @@ blt             0110 00 ................ ..... .....     @rr_offs16
 bge             0110 01 ................ ..... .....     @rr_offs16
 bltu            0110 10 ................ ..... .....     @rr_offs16
 bgeu            0110 11 ................ ..... .....     @rr_offs16
+
+#
+# Core instructions
+#
+{
+  csrrd             0000 0100 .............. 00000 .....     @r_csr
+  csrwr             0000 0100 .............. 00001 .....     @r_csr
+  csrxchg           0000 0100 .............. ..... .....     @rr_csr
+}
diff --git a/target/loongarch/meson.build b/target/loongarch/meson.build
index 04e15ba1e3..d11829a6cc 100644
--- a/target/loongarch/meson.build
+++ b/target/loongarch/meson.build
@@ -19,6 +19,7 @@ loongarch_softmmu_ss.add(files(
   'machine.c',
   'tlb_helper.c',
   'constant_timer.c',
+  'csr_helper.c',
 ))
 
 loongarch_ss.add_all(when: 'CONFIG_TCG', if_true: [loongarch_tcg_ss])
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index e850c55b0c..82694f487f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -25,7 +25,9 @@ static TCGv cpu_lladdr, cpu_llval;
 TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
-#define DISAS_STOP       DISAS_TARGET_0
+#define DISAS_STOP        DISAS_TARGET_0
+#define DISAS_EXIT        DISAS_TARGET_1
+#define DISAS_EXIT_UPDATE DISAS_TARGET_2
 
 static inline int plus_1(DisasContext *ctx, int x)
 {
@@ -172,6 +174,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fmov.c.inc"
 #include "insn_trans/trans_fmemory.c.inc"
 #include "insn_trans/trans_branch.c.inc"
+#include "insn_trans/trans_privileged.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
@@ -209,6 +212,12 @@ static void loongarch_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         break;
     case DISAS_NORETURN:
         break;
+    case DISAS_EXIT_UPDATE:
+        tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next);
+        QEMU_FALLTHROUGH;
+    case DISAS_EXIT:
+        tcg_gen_exit_tb(NULL, 0);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.31.1


