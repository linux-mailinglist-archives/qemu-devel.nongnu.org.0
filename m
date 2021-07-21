Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 55F393D0BA4
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:59:42 +0200 (CEST)
Received: from localhost ([::1]:43236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m690v-0007JQ-CC
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:59:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46138)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1m68vD-000337-QP
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:47 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49632 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1m68vB-0002BZ-6O
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:53:47 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0CO7vdg5VEiAA--.21107S13; 
 Wed, 21 Jul 2021 17:53:30 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 11/22] target/loongarch: Add fixed point atomic instruction
 translation
Date: Wed, 21 Jul 2021 17:53:07 +0800
Message-Id: <1626861198-6133-12-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
References: <1626861198-6133-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0CO7vdg5VEiAA--.21107S13
X-Coremail-Antispam: 1UD129KBjvJXoW3ur4kJrW8Arykuw47CFWfKrg_yoWkXr47pr
 1jkry7Xr40qr17Jr95tw45G3WDCFnrC3y2gr9xtwnYvF4UXF15JF1kA3yjgFW7Xrn5uFW0
 yFW3AFyj9Fy5taUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, chenhuacai@gmail.com,
 philmd@redhat.com, richard.henderson@linaro.org, laurent@vivier.eu,
 maobibo@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, alex.bennee@linaro.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement fixed point atomic instruction translation.

This includes:
- LL.{W/D}, SC.{W/D}
- AM{SWAP/ADD/AND/OR/XOR/MAX/MIN}[_DB].{W/D}
- AM{MAX/MIN}[_DB].{WU/DU}

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/insns.decode |  44 +++++++++
 target/loongarch/trans.inc.c  | 210 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  |  32 +++++++
 3 files changed, 286 insertions(+)

diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 08fd232..574c055 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -216,3 +216,47 @@ stle_b           0011 10000111 11100 ..... ..... .....    @fmt_rdrjrk
 stle_h           0011 10000111 11101 ..... ..... .....    @fmt_rdrjrk
 stle_w           0011 10000111 11110 ..... ..... .....    @fmt_rdrjrk
 stle_d           0011 10000111 11111 ..... ..... .....    @fmt_rdrjrk
+
+#
+# Fixed point atomic instruction
+#
+ll_w             0010 0000 .............. ..... .....     @fmt_rdrjsi14
+sc_w             0010 0001 .............. ..... .....     @fmt_rdrjsi14
+ll_d             0010 0010 .............. ..... .....     @fmt_rdrjsi14
+sc_d             0010 0011 .............. ..... .....     @fmt_rdrjsi14
+amswap_w         0011 10000110 00000 ..... ..... .....    @fmt_rdrjrk
+amswap_d         0011 10000110 00001 ..... ..... .....    @fmt_rdrjrk
+amadd_w          0011 10000110 00010 ..... ..... .....    @fmt_rdrjrk
+amadd_d          0011 10000110 00011 ..... ..... .....    @fmt_rdrjrk
+amand_w          0011 10000110 00100 ..... ..... .....    @fmt_rdrjrk
+amand_d          0011 10000110 00101 ..... ..... .....    @fmt_rdrjrk
+amor_w           0011 10000110 00110 ..... ..... .....    @fmt_rdrjrk
+amor_d           0011 10000110 00111 ..... ..... .....    @fmt_rdrjrk
+amxor_w          0011 10000110 01000 ..... ..... .....    @fmt_rdrjrk
+amxor_d          0011 10000110 01001 ..... ..... .....    @fmt_rdrjrk
+ammax_w          0011 10000110 01010 ..... ..... .....    @fmt_rdrjrk
+ammax_d          0011 10000110 01011 ..... ..... .....    @fmt_rdrjrk
+ammin_w          0011 10000110 01100 ..... ..... .....    @fmt_rdrjrk
+ammin_d          0011 10000110 01101 ..... ..... .....    @fmt_rdrjrk
+ammax_wu         0011 10000110 01110 ..... ..... .....    @fmt_rdrjrk
+ammax_du         0011 10000110 01111 ..... ..... .....    @fmt_rdrjrk
+ammin_wu         0011 10000110 10000 ..... ..... .....    @fmt_rdrjrk
+ammin_du         0011 10000110 10001 ..... ..... .....    @fmt_rdrjrk
+amswap_db_w      0011 10000110 10010 ..... ..... .....    @fmt_rdrjrk
+amswap_db_d      0011 10000110 10011 ..... ..... .....    @fmt_rdrjrk
+amadd_db_w       0011 10000110 10100 ..... ..... .....    @fmt_rdrjrk
+amadd_db_d       0011 10000110 10101 ..... ..... .....    @fmt_rdrjrk
+amand_db_w       0011 10000110 10110 ..... ..... .....    @fmt_rdrjrk
+amand_db_d       0011 10000110 10111 ..... ..... .....    @fmt_rdrjrk
+amor_db_w        0011 10000110 11000 ..... ..... .....    @fmt_rdrjrk
+amor_db_d        0011 10000110 11001 ..... ..... .....    @fmt_rdrjrk
+amxor_db_w       0011 10000110 11010 ..... ..... .....    @fmt_rdrjrk
+amxor_db_d       0011 10000110 11011 ..... ..... .....    @fmt_rdrjrk
+ammax_db_w       0011 10000110 11100 ..... ..... .....    @fmt_rdrjrk
+ammax_db_d       0011 10000110 11101 ..... ..... .....    @fmt_rdrjrk
+ammin_db_w       0011 10000110 11110 ..... ..... .....    @fmt_rdrjrk
+ammin_db_d       0011 10000110 11111 ..... ..... .....    @fmt_rdrjrk
+ammax_db_wu      0011 10000111 00000 ..... ..... .....    @fmt_rdrjrk
+ammax_db_du      0011 10000111 00001 ..... ..... .....    @fmt_rdrjrk
+ammin_db_wu      0011 10000111 00010 ..... ..... .....    @fmt_rdrjrk
+ammin_db_du      0011 10000111 00011 ..... ..... .....    @fmt_rdrjrk
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index e38001b..a87da4a 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -2874,3 +2874,213 @@ static bool trans_stle_d(DisasContext *ctx, arg_stle_d *a)
 }
 
 #undef DECL_ARG
+
+/* Fixed point atomic instruction translation */
+static bool trans_ll_w(DisasContext *ctx, arg_ll_w *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si14 << 2);
+    tcg_gen_mov_tl(t1, t0);
+    tcg_gen_qemu_ld32s(t0, t0, ctx->mem_idx);
+    tcg_gen_st_tl(t1, cpu_env, offsetof(CPULoongArchState, lladdr));
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, llval));
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_sc_w(DisasContext *ctx, arg_sc_w *a)
+{
+    gen_loongarch_st_cond(ctx, a->rd, a->rj, a->si14 << 2, MO_TESL, false);
+    return true;
+}
+
+static bool trans_ll_d(DisasContext *ctx, arg_ll_d *a)
+{
+    TCGv t0, t1;
+    TCGv Rd = cpu_gpr[a->rd];
+
+    if (a->rd == 0) {
+        /* Nop */
+        return true;
+    }
+
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_base_offset_addr(t0, a->rj, a->si14 << 2);
+    tcg_gen_mov_tl(t1, t0);
+    tcg_gen_qemu_ld64(t0, t0, ctx->mem_idx);
+    tcg_gen_st_tl(t1, cpu_env, offsetof(CPULoongArchState, lladdr));
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, llval));
+    tcg_gen_mov_tl(Rd, t0);
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+
+    return true;
+}
+
+static bool trans_sc_d(DisasContext *ctx, arg_sc_d *a)
+{
+    gen_loongarch_st_cond(ctx, a->rd, a->rj, a->si14 << 2, MO_TEQ, false);
+    return true;
+}
+
+#define TRANS_AM_W(name, op)                                      \
+static bool trans_ ## name(DisasContext *ctx, arg_ ## name * a)   \
+{                                                                 \
+    TCGv addr, val, ret;                                          \
+    TCGv Rd = cpu_gpr[a->rd];                                     \
+    int mem_idx = ctx->mem_idx;                                   \
+                                                                  \
+    if (a->rd == 0) {                                             \
+        return true;                                              \
+    }                                                             \
+    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) { \
+        printf("%s: warning, register equal\n", __func__);        \
+        return false;                                             \
+    }                                                             \
+                                                                  \
+    addr = get_gpr(a->rj);                                        \
+    val = get_gpr(a->rk);                                         \
+    ret = tcg_temp_new();                                         \
+                                                                  \
+    tcg_gen_atomic_##op##_tl(ret, addr, val, mem_idx, MO_TESL |   \
+                            ctx->default_tcg_memop_mask);         \
+    tcg_gen_mov_tl(Rd, ret);                                      \
+                                                                  \
+    tcg_temp_free(ret);                                           \
+                                                                  \
+    return true;                                                  \
+}
+#define TRANS_AM_D(name, op)                                      \
+static bool trans_ ## name(DisasContext *ctx, arg_ ## name * a)   \
+{                                                                 \
+    TCGv addr, val, ret;                                          \
+    TCGv Rd = cpu_gpr[a->rd];                                     \
+    int mem_idx = ctx->mem_idx;                                   \
+                                                                  \
+    if (a->rd == 0) {                                             \
+        return true;                                              \
+    }                                                             \
+    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) { \
+        printf("%s: warning, register equal\n", __func__);        \
+        return false;                                             \
+    }                                                             \
+    addr = get_gpr(a->rj);                                        \
+    val = get_gpr(a->rk);                                         \
+    ret = tcg_temp_new();                                         \
+                                                                  \
+    tcg_gen_atomic_##op##_tl(ret, addr, val, mem_idx, MO_TEQ |    \
+                            ctx->default_tcg_memop_mask);         \
+    tcg_gen_mov_tl(Rd, ret);                                      \
+                                                                  \
+    tcg_temp_free(ret);                                           \
+                                                                  \
+    return true;                                                  \
+}
+#define TRANS_AM(name, op)   \
+    TRANS_AM_W(name##_w, op) \
+    TRANS_AM_D(name##_d, op)
+TRANS_AM(amswap, xchg)      /* trans_amswap_w, trans_amswap_d */
+TRANS_AM(amadd, fetch_add)  /* trans_amadd_w, trans_amadd_d   */
+TRANS_AM(amand, fetch_and)  /* trans_amand_w, trans_amand_d   */
+TRANS_AM(amor, fetch_or)    /* trans_amor_w, trans_amor_d     */
+TRANS_AM(amxor, fetch_xor)  /* trans_amxor_w, trans_amxor_d   */
+TRANS_AM(ammax, fetch_smax) /* trans_ammax_w, trans_ammax_d   */
+TRANS_AM(ammin, fetch_smin) /* trans_ammin_w, trans_ammin_d   */
+TRANS_AM_W(ammax_wu, fetch_umax)    /* trans_ammax_wu */
+TRANS_AM_D(ammax_du, fetch_umax)    /* trans_ammax_du */
+TRANS_AM_W(ammin_wu, fetch_umin)    /* trans_ammin_wu */
+TRANS_AM_D(ammin_du, fetch_umin)    /* trans_ammin_du */
+#undef TRANS_AM
+#undef TRANS_AM_W
+#undef TRANS_AM_D
+
+#define TRANS_AM_DB_W(name, op)                                   \
+static bool trans_ ## name(DisasContext *ctx, arg_ ## name * a)   \
+{                                                                 \
+    TCGv addr, val, ret;                                          \
+    TCGv Rd = cpu_gpr[a->rd];                                     \
+    int mem_idx = ctx->mem_idx;                                   \
+                                                                  \
+    if (a->rd == 0) {                                             \
+        return true;                                              \
+    }                                                             \
+    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) { \
+        printf("%s: warning, register equal\n", __func__);        \
+        return false;                                             \
+    }                                                             \
+                                                                  \
+    addr = get_gpr(a->rj);                                        \
+    val = get_gpr(a->rk);                                         \
+    ret = tcg_temp_new();                                         \
+                                                                  \
+    gen_loongarch_sync(0x10);                                     \
+    tcg_gen_atomic_##op##_tl(ret, addr, val, mem_idx, MO_TESL |   \
+                            ctx->default_tcg_memop_mask);         \
+    tcg_gen_mov_tl(Rd, ret);                                      \
+                                                                  \
+    tcg_temp_free(ret);                                           \
+                                                                  \
+    return true;                                                  \
+}
+#define TRANS_AM_DB_D(name, op)                                   \
+static bool trans_ ## name(DisasContext *ctx, arg_ ## name * a)   \
+{                                                                 \
+    TCGv addr, val, ret;                                          \
+    TCGv Rd = cpu_gpr[a->rd];                                     \
+    int mem_idx = ctx->mem_idx;                                   \
+                                                                  \
+    if (a->rd == 0) {                                             \
+        return true;                                              \
+    }                                                             \
+    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) { \
+        printf("%s: warning, register equal\n", __func__);        \
+        return false;                                             \
+    }                                                             \
+                                                                  \
+    addr = get_gpr(a->rj);                                        \
+    val = get_gpr(a->rk);                                         \
+    ret = tcg_temp_new();                                         \
+                                                                  \
+    gen_loongarch_sync(0x10);                                     \
+    tcg_gen_atomic_##op##_tl(ret, addr, val, mem_idx, MO_TEQ |    \
+                            ctx->default_tcg_memop_mask);         \
+    tcg_gen_mov_tl(Rd, ret);                                      \
+                                                                  \
+    tcg_temp_free(ret);                                           \
+                                                                  \
+    return true;                                                  \
+}
+#define TRANS_AM_DB(name, op)      \
+    TRANS_AM_DB_W(name##_db_w, op) \
+    TRANS_AM_DB_D(name##_db_d, op)
+TRANS_AM_DB(amswap, xchg)      /* trans_amswap_db_w, trans_amswap_db_d */
+TRANS_AM_DB(amadd, fetch_add)  /* trans_amadd_db_w, trans_amadd_db_d   */
+TRANS_AM_DB(amand, fetch_and)  /* trans_amand_db_w, trans_amand_db_d   */
+TRANS_AM_DB(amor, fetch_or)    /* trans_amor_db_w, trans_amor_db_d     */
+TRANS_AM_DB(amxor, fetch_xor)  /* trans_amxor_db_w, trans_amxor_db_d   */
+TRANS_AM_DB(ammax, fetch_smax) /* trans_ammax_db_w, trans_ammax_db_d   */
+TRANS_AM_DB(ammin, fetch_smin) /* trans_ammin_db_w, trans_ammin_db_d   */
+TRANS_AM_DB_W(ammax_db_wu, fetch_umax)    /* trans_ammax_db_wu */
+TRANS_AM_DB_D(ammax_db_du, fetch_umax)    /* trans_ammax_db_du */
+TRANS_AM_DB_W(ammin_db_wu, fetch_umin)    /* trans_ammin_db_wu */
+TRANS_AM_DB_D(ammin_db_du, fetch_umin)    /* trans_ammin_db_du */
+#undef TRANS_AM_DB
+#undef TRANS_AM_DB_W
+#undef TRANS_AM_DB_D
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 6ce2d6a..2d3547f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -306,6 +306,38 @@ static void gen_loongarch_sync(int stype)
     tcg_gen_mb(tcg_mo);
 }
 
+/* loongarch st cond */
+static void gen_loongarch_st_cond(DisasContext *ctx, int rd, int base,
+                                  int offset, MemOp tcg_mo, bool eva)
+{
+    TCGv Rd = cpu_gpr[rd];
+    TCGv t0 = tcg_temp_new();
+    TCGv addr = tcg_temp_new();
+    TCGv val = tcg_temp_new();
+    TCGLabel *l1 = gen_new_label();
+    TCGLabel *done = gen_new_label();
+
+    /* compare the address against that of the preceding LL */
+    gen_base_offset_addr(addr, base, offset);
+    tcg_gen_brcond_tl(TCG_COND_EQ, addr, cpu_lladdr, l1);
+    tcg_gen_movi_tl(t0, 0);
+    tcg_gen_mov_tl(Rd, t0);
+    tcg_gen_br(done);
+
+    gen_set_label(l1);
+    /* generate cmpxchg */
+    gen_load_gpr(val, rd);
+    tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llval, val,
+                              eva ? LOONGARCH_HFLAG_UM : ctx->mem_idx, tcg_mo);
+    tcg_gen_setcond_tl(TCG_COND_EQ, t0, t0, cpu_llval);
+    tcg_gen_mov_tl(Rd, t0);
+
+    gen_set_label(done);
+    tcg_temp_free(t0);
+    tcg_temp_free(addr);
+    tcg_temp_free(val);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


