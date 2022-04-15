Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2533A5027FF
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Apr 2022 12:11:11 +0200 (CEST)
Received: from localhost ([::1]:57882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nfIv0-000170-0l
	for lists+qemu-devel@lfdr.de; Fri, 15 Apr 2022 06:11:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nfISX-0002h8-2F
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:41:50 -0400
Received: from mail.loongson.cn ([114.242.206.163]:53510 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nfIST-0004Yq-Ju
 for qemu-devel@nongnu.org; Fri, 15 Apr 2022 05:41:44 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dx_xGqPVli41gkAA--.16856S27; 
 Fri, 15 Apr 2022 17:41:27 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 25/43] target/loongarch: Add LoongArch CSR instruction
Date: Fri, 15 Apr 2022 17:40:40 +0800
Message-Id: <20220415094058.3584233-26-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
References: <20220415094058.3584233-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dx_xGqPVli41gkAA--.16856S27
X-Coremail-Antispam: 1UD129KBjvAXoW3CFy7Cry8KFykXFy3tFW7twb_yoW8Gw13to
 W8AF45Jw48GryFvr9xCwnxXa1UXF1kCan5A34ku3WrG3W8Cryagr1rWwn5Z3yfJr10gryr
 ua42q3ZxGa93Ar9xn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
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
 target/loongarch/cpu-csr.h                    |   2 +
 target/loongarch/csr_helper.c                 | 186 ++++++++++++++++++
 target/loongarch/disas.c                      |  15 ++
 target/loongarch/helper.h                     |   9 +
 .../insn_trans/trans_privileged.c.inc         | 177 +++++++++++++++++
 target/loongarch/insns.decode                 |  13 ++
 target/loongarch/meson.build                  |   1 +
 target/loongarch/translate.c                  |   5 +
 8 files changed, 408 insertions(+)
 create mode 100644 target/loongarch/csr_helper.c
 create mode 100644 target/loongarch/insn_trans/trans_privileged.c.inc

diff --git a/target/loongarch/cpu-csr.h b/target/loongarch/cpu-csr.h
index 5c89605d1a..7a96ec7b6a 100644
--- a/target/loongarch/cpu-csr.h
+++ b/target/loongarch/cpu-csr.h
@@ -198,4 +198,6 @@ FIELD(CSR_DBG, ECODE, 16, 6)
 #define LOONGARCH_CSR_DERA           0x501 /* Debug era */
 #define LOONGARCH_CSR_DSAVE          0x502 /* Debug save */
 
+int cpu_csr_offset(unsigned csr_num);
+
 #endif /* LOONGARCH_CPU_CSR_H */
diff --git a/target/loongarch/csr_helper.c b/target/loongarch/csr_helper.c
new file mode 100644
index 0000000000..0884e85cb0
--- /dev/null
+++ b/target/loongarch/csr_helper.c
@@ -0,0 +1,186 @@
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
+#include "hw/loongarch/loongarch.h"
+#include "tcg/tcg-ldst.h"
+
+#define CSR_OFF(X)  \
+           [LOONGARCH_CSR_##X] = offsetof(CPULoongArchState, CSR_##X)
+#define CSR_OFF_ARRAY(X, N)  \
+           [LOONGARCH_CSR_##X(N)] = offsetof(CPULoongArchState, CSR_##X[N])
+
+static const uint64_t csr_offsets[] = {
+     CSR_OFF(CRMD),
+     CSR_OFF(PRMD),
+     CSR_OFF(EUEN),
+     CSR_OFF(MISC),
+     CSR_OFF(ECFG),
+     CSR_OFF(ESTAT),
+     CSR_OFF(ERA),
+     CSR_OFF(BADV),
+     CSR_OFF(BADI),
+     CSR_OFF(EENTRY),
+     CSR_OFF(TLBIDX),
+     CSR_OFF(TLBEHI),
+     CSR_OFF(TLBELO0),
+     CSR_OFF(TLBELO1),
+     CSR_OFF(ASID),
+     CSR_OFF(PGDL),
+     CSR_OFF(PGDH),
+     CSR_OFF(PGD),
+     CSR_OFF(PWCL),
+     CSR_OFF(PWCH),
+     CSR_OFF(STLBPS),
+     CSR_OFF(RVACFG),
+     [LOONGARCH_CSR_CPUID] = offsetof(CPUState, cpu_index)
+                             - offsetof(ArchCPU, env),
+     CSR_OFF(PRCFG1),
+     CSR_OFF(PRCFG2),
+     CSR_OFF(PRCFG3),
+     CSR_OFF_ARRAY(SAVE, 0),
+     CSR_OFF_ARRAY(SAVE, 1),
+     CSR_OFF_ARRAY(SAVE, 2),
+     CSR_OFF_ARRAY(SAVE, 3),
+     CSR_OFF_ARRAY(SAVE, 4),
+     CSR_OFF_ARRAY(SAVE, 5),
+     CSR_OFF_ARRAY(SAVE, 6),
+     CSR_OFF_ARRAY(SAVE, 7),
+     CSR_OFF_ARRAY(SAVE, 8),
+     CSR_OFF_ARRAY(SAVE, 9),
+     CSR_OFF_ARRAY(SAVE, 10),
+     CSR_OFF_ARRAY(SAVE, 11),
+     CSR_OFF_ARRAY(SAVE, 12),
+     CSR_OFF_ARRAY(SAVE, 13),
+     CSR_OFF_ARRAY(SAVE, 14),
+     CSR_OFF_ARRAY(SAVE, 15),
+     CSR_OFF(TID),
+     CSR_OFF(TCFG),
+     CSR_OFF(TVAL),
+     CSR_OFF(CNTC),
+     CSR_OFF(TICLR),
+     CSR_OFF(LLBCTL),
+     CSR_OFF(IMPCTL1),
+     CSR_OFF(IMPCTL2),
+     CSR_OFF(TLBRENTRY),
+     CSR_OFF(TLBRBADV),
+     CSR_OFF(TLBRERA),
+     CSR_OFF(TLBRSAVE),
+     CSR_OFF(TLBRELO0),
+     CSR_OFF(TLBRELO1),
+     CSR_OFF(TLBREHI),
+     CSR_OFF(TLBRPRMD),
+     CSR_OFF(MERRCTL),
+     CSR_OFF(MERRINFO1),
+     CSR_OFF(MERRINFO2),
+     CSR_OFF(MERRENTRY),
+     CSR_OFF(MERRERA),
+     CSR_OFF(MERRSAVE),
+     CSR_OFF(CTAG),
+     CSR_OFF_ARRAY(DMW, 0),
+     CSR_OFF_ARRAY(DMW, 1),
+     CSR_OFF_ARRAY(DMW, 2),
+     CSR_OFF_ARRAY(DMW, 3),
+     CSR_OFF(DBG),
+     CSR_OFF(DERA),
+     CSR_OFF(DSAVE),
+};
+
+int cpu_csr_offset(unsigned csr_num)
+{
+    if (csr_num < ARRAY_SIZE(csr_offsets)) {
+        return csr_offsets[csr_num];
+    }
+    return 0;
+}
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
+    env->CSR_ESTAT = FIELD_DP64(env->CSR_ESTAT, CSR_ESTAT, IS, val & 0x3);
+
+    return old_v;
+}
+
+target_ulong helper_csrwr_asid(CPULoongArchState *env, target_ulong val)
+{
+    int64_t old_v = env->CSR_ASID;
+
+    /* Only ASID filed of CSR_ASID can be written */
+    env->CSR_ASID = FIELD_DP64(env->CSR_ASID, CSR_ASID, ASID,
+                               val & R_CSR_ASID_ASID_MASK);
+    if (old_v != val) {
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
+
+void  helper_csr_update(CPULoongArchState *env, target_ulong new_val,
+                        target_ulong csr_offset)
+{
+    uint64_t *csr = (void *)env + csr_offset;
+
+    *csr = new_val;
+}
diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 9454ebb8e9..db0e0c73fe 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -205,6 +205,18 @@ static void output_rr_offs(DisasContext *ctx, arg_rr_offs *a,
            a->rd, a->offs, ctx->pc + a->offs);
 }
 
+static void output_r_csr(DisasContext *ctx, arg_r_csr *a,
+                         const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, %d", a->rd, a->csr);
+}
+
+static void output_rr_csr(DisasContext *ctx, arg_rr_csr *a,
+                          const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, r%d, %d", a->rd, a->rj, a->csr);
+}
+
 #define INSN(insn, type)                                    \
 static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
 {                                                           \
@@ -514,6 +526,9 @@ INSN(blt,          rr_offs)
 INSN(bge,          rr_offs)
 INSN(bltu,         rr_offs)
 INSN(bgeu,         rr_offs)
+INSN(csrrd,        r_csr)
+INSN(csrwr,        r_csr)
+INSN(csrxchg,      rr_csr)
 
 #define output_fcmp(C, PREFIX, SUFFIX)                                         \
 {                                                                              \
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index da1a2bced7..bd2cb3a9c5 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -92,3 +92,12 @@ DEF_HELPER_2(frint_s, i64, env, i64)
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
+DEF_HELPER_3(csr_update, void, env, tl, i64)
diff --git a/target/loongarch/insn_trans/trans_privileged.c.inc b/target/loongarch/insn_trans/trans_privileged.c.inc
new file mode 100644
index 0000000000..ba111779c2
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_privileged.c.inc
@@ -0,0 +1,177 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * LoongArch translation routines for the privileged instructions.
+ */
+
+#include "cpu-csr.h"
+
+static void gen_disas_exit(DisasContext *ctx)
+{
+    tcg_gen_movi_tl(cpu_pc, ctx->base.pc_next + 4);
+    ctx->base.is_jmp = DISAS_EXIT;
+}
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
+static bool ro_csr(int csr_num)
+{
+    /*
+     * For now qemu does not support any features of the MISC
+     * bits yet treat as a RO CSR.
+     */
+    if ((csr_num == LOONGARCH_CSR_BADI) ||
+        (csr_num == LOONGARCH_CSR_CPUID) ||
+        (csr_num == LOONGARCH_CSR_PRCFG1) ||
+        (csr_num == LOONGARCH_CSR_PRCFG2) ||
+        (csr_num == LOONGARCH_CSR_PRCFG3) ||
+        (csr_num == LOONGARCH_CSR_PGD) ||
+        (csr_num == LOONGARCH_CSR_TVAL) ||
+        (csr_num == LOONGARCH_CSR_MISC)) {
+        return true;
+    }
+
+    return false;
+}
+
+static bool trans_csrrd(DisasContext *ctx, arg_csrrd *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+
+    if (check_plv(ctx)) {
+        return false;
+    }
+
+    unsigned csr_offset = cpu_csr_offset(a->csr);
+    if (csr_offset == 0) {
+        /* CSR is undefined: read as 0 */
+        dest = tcg_constant_tl(0);
+        return true;
+    }
+
+    switch (a->csr) {
+    case LOONGARCH_CSR_PGD:
+        gen_helper_csrrd_pgd(dest, cpu_env);
+        break;
+    case LOONGARCH_CSR_TVAL:
+        gen_helper_csrrd_tval(dest, cpu_env);
+        break;
+    default:
+        tcg_gen_ld_tl(dest, cpu_env, csr_offset);
+    }
+    return true;
+}
+
+static bool trans_csrwr(DisasContext *ctx, arg_csrwr *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+
+    if (check_plv(ctx) || ro_csr(a->csr)) {
+        return false;
+    }
+
+    unsigned csr_offset = cpu_csr_offset(a->csr);
+    if (csr_offset == 0) {
+        /* CSR is undefined: write ignored. */
+        return true;
+    }
+
+    switch (a->csr) {
+    case LOONGARCH_CSR_ESTAT:
+        gen_helper_csrwr_estat(dest, cpu_env, src1);
+        break;
+    case LOONGARCH_CSR_ASID:
+        gen_helper_csrwr_asid(dest, cpu_env, src1);
+        gen_disas_exit(ctx);
+        break;
+    case LOONGARCH_CSR_TCFG:
+        gen_helper_csrwr_tcfg(dest, cpu_env, src1);
+        break;
+    case LOONGARCH_CSR_TICLR:
+        gen_helper_csrwr_ticlr(dest, cpu_env, src1);
+        break;
+    default:
+        {
+            TCGv temp = tcg_temp_new();
+            tcg_gen_ld_tl(temp, cpu_env, csr_offset);
+            tcg_gen_st_tl(src1, cpu_env, csr_offset);
+            tcg_gen_mov_tl(dest, temp);
+            tcg_temp_free(temp);
+
+            /* Cpu state may be changed, need exit */
+            if ((a->csr == LOONGARCH_CSR_CRMD) ||
+                (a->csr == LOONGARCH_CSR_EUEN)) {
+                gen_disas_exit(ctx);
+            }
+        }
+    }
+    return true;
+}
+
+static bool trans_csrxchg(DisasContext *ctx, arg_csrxchg *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv mask = gpr_src(ctx, a->rj, EXT_NONE);
+
+    if (check_plv(ctx) || ro_csr(a->csr)) {
+        return false;
+    }
+
+    unsigned csr_offset = cpu_csr_offset(a->csr);
+    if (csr_offset == 0) {
+        /* CSR is undefined: write ignored */
+        return true;
+    }
+
+    TCGv old_val = tcg_temp_new();
+    TCGv new_val = tcg_temp_new();
+    TCGv t0 = tcg_temp_new();
+    TCGv t1 = tcg_temp_new();
+
+    tcg_gen_ld_tl(old_val, cpu_env, csr_offset);
+    tcg_gen_and_tl(t0, src1, mask);
+    tcg_gen_not_tl(t1, mask);
+    tcg_gen_and_tl(t1, old_val, t1);
+    tcg_gen_or_tl(new_val, t1, t0);
+
+    switch (a->csr) {
+    case LOONGARCH_CSR_ESTAT:
+        gen_helper_csrwr_estat(dest, cpu_env, new_val);
+        break;
+    case LOONGARCH_CSR_ASID:
+        gen_helper_csrwr_asid(dest, cpu_env, new_val);
+        break;
+    case LOONGARCH_CSR_TCFG:
+        gen_helper_csrwr_tcfg(dest, cpu_env, new_val);
+        break;
+    case LOONGARCH_CSR_TICLR:
+        gen_helper_csrwr_ticlr(dest, cpu_env, new_val);
+        break;
+    default:
+        tcg_gen_mov_tl(dest, old_val);
+    }
+
+    gen_helper_csr_update(cpu_env, new_val, tcg_constant_tl(csr_offset));
+
+    if ((a->csr == LOONGARCH_CSR_ASID) || (a->csr == LOONGARCH_CSR_CRMD) ||
+        (a->csr == LOONGARCH_CSR_EUEN)) {
+        gen_disas_exit(ctx);
+    }
+
+    tcg_temp_free(t1);
+    tcg_temp_free(t0);
+    tcg_temp_free(new_val);
+    tcg_temp_free(old_val);
+
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
index f39ebe7967..c1cac2f006 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -26,6 +26,7 @@ TCGv_i32 cpu_fcsr0;
 TCGv_i64 cpu_fpr[32];
 
 #define DISAS_STOP       DISAS_TARGET_0
+#define DISAS_EXIT       DISAS_TARGET_1
 
 static inline int plus_1(DisasContext *ctx, int x)
 {
@@ -172,6 +173,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_fmov.c.inc"
 #include "insn_trans/trans_fmemory.c.inc"
 #include "insn_trans/trans_branch.c.inc"
+#include "insn_trans/trans_privileged.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
@@ -209,6 +211,9 @@ static void loongarch_tr_tb_stop(DisasContextBase *dcbase, CPUState *cs)
         break;
     case DISAS_NORETURN:
         break;
+    case DISAS_EXIT:
+        tcg_gen_exit_tb(NULL, 0);
+        break;
     default:
         g_assert_not_reached();
     }
-- 
2.31.1


