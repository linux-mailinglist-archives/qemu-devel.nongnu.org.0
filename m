Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D8B1514732
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:45:13 +0200 (CEST)
Received: from localhost ([::1]:53228 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkO7c-0006vP-LP
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:45:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNer-0006Tv-IQ
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:15:32 -0400
Received: from mail.loongson.cn ([114.242.206.163]:49012 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNen-00042L-54
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:15:28 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S10; 
 Fri, 29 Apr 2022 18:07:37 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 08/43] target/loongarch: Add fixed point atomic instruction
 translation
Date: Fri, 29 Apr 2022 18:06:54 +0800
Message-Id: <20220429100729.1572481-9-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S10
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4DCry3JFy5Zr43KFy5CFg_yoWfKry5pr
 4jyr18Gr40qry5Ar1ktws8W347GFnFy3yUWry3tr1kZFW7GF15XF18t39I9FW8Xa1kZryr
 KFW2y3yjkFyrJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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

From: Song Gao <gaosong@loongson.cn>

This includes:
- LL.{W/D}, SC.{W/D}
- AM{SWAP/ADD/AND/OR/XOR/MAX/MIN}[_DB].{W/D}
- AM{MAX/MIN}[_DB].{WU/DU}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 .../loongarch/insn_trans/trans_atomic.c.inc   | 113 ++++++++++++++++++
 .../loongarch/insn_trans/trans_memory.c.inc   |   2 +-
 target/loongarch/insns.decode                 |  44 +++++++
 target/loongarch/translate.c                  |   1 +
 4 files changed, 159 insertions(+), 1 deletion(-)
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc

diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
new file mode 100644
index 0000000000..6763c1c301
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_atomic.c.inc
@@ -0,0 +1,113 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_ll(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_addi_tl(t0, src1, a->imm);
+    tcg_gen_qemu_ld_i64(dest, t0, ctx->mem_idx, mop);
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
+    tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    tcg_temp_free(t0);
+
+    return true;
+}
+
+static bool gen_sc(DisasContext *ctx, arg_rr_i *a, MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rd, EXT_NONE);
+    TCGv t0 = tcg_temp_new();
+    TCGv val = tcg_temp_new();
+
+    TCGLabel *l1 = gen_new_label();
+    TCGLabel *done = gen_new_label();
+
+    tcg_gen_addi_tl(t0, src1, a->imm);
+    tcg_gen_brcond_tl(TCG_COND_EQ, t0, cpu_lladdr, l1);
+    tcg_gen_movi_tl(dest, 0);
+    tcg_gen_br(done);
+
+    gen_set_label(l1);
+    tcg_gen_mov_tl(val, src2);
+    /* generate cmpxchg */
+    tcg_gen_atomic_cmpxchg_tl(t0, cpu_lladdr, cpu_llval,
+                              val, ctx->mem_idx, mop);
+    tcg_gen_setcond_tl(TCG_COND_EQ, dest, t0, cpu_llval);
+    gen_set_label(done);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+    tcg_temp_free(t0);
+    tcg_temp_free(val);
+
+    return true;
+}
+
+static bool gen_am(DisasContext *ctx, arg_rrr *a,
+                   void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
+                   MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
+
+    if (a->rd != 0 && (a->rj == a->rd || a->rk == a->rd)) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Warning: source register overlaps destination register"
+                      "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
+                      ctx->base.pc_next - 4);
+        return false;
+    }
+
+    func(dest, addr, val, ctx->mem_idx, mop);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+TRANS(ll_w, gen_ll, MO_TESL)
+TRANS(sc_w, gen_sc, MO_TESL)
+TRANS(ll_d, gen_ll, MO_TEUQ)
+TRANS(sc_d, gen_sc, MO_TEUQ)
+TRANS(amswap_w, gen_am, tcg_gen_atomic_xchg_tl, MO_TESL)
+TRANS(amswap_d, gen_am, tcg_gen_atomic_xchg_tl, MO_TEUQ)
+TRANS(amadd_w, gen_am, tcg_gen_atomic_fetch_add_tl, MO_TESL)
+TRANS(amadd_d, gen_am, tcg_gen_atomic_fetch_add_tl, MO_TEUQ)
+TRANS(amand_w, gen_am, tcg_gen_atomic_fetch_and_tl, MO_TESL)
+TRANS(amand_d, gen_am, tcg_gen_atomic_fetch_and_tl, MO_TEUQ)
+TRANS(amor_w, gen_am, tcg_gen_atomic_fetch_or_tl, MO_TESL)
+TRANS(amor_d, gen_am, tcg_gen_atomic_fetch_or_tl, MO_TEUQ)
+TRANS(amxor_w, gen_am, tcg_gen_atomic_fetch_xor_tl, MO_TESL)
+TRANS(amxor_d, gen_am, tcg_gen_atomic_fetch_xor_tl, MO_TEUQ)
+TRANS(ammax_w, gen_am, tcg_gen_atomic_fetch_smax_tl, MO_TESL)
+TRANS(ammax_d, gen_am, tcg_gen_atomic_fetch_smax_tl, MO_TEUQ)
+TRANS(ammin_w, gen_am, tcg_gen_atomic_fetch_smin_tl, MO_TESL)
+TRANS(ammin_d, gen_am, tcg_gen_atomic_fetch_smin_tl, MO_TEUQ)
+TRANS(ammax_wu, gen_am, tcg_gen_atomic_fetch_umax_tl, MO_TESL)
+TRANS(ammax_du, gen_am, tcg_gen_atomic_fetch_umax_tl, MO_TEUQ)
+TRANS(ammin_wu, gen_am, tcg_gen_atomic_fetch_umin_tl, MO_TESL)
+TRANS(ammin_du, gen_am, tcg_gen_atomic_fetch_umin_tl, MO_TEUQ)
+TRANS(amswap_db_w, gen_am, tcg_gen_atomic_xchg_tl, MO_TESL)
+TRANS(amswap_db_d, gen_am, tcg_gen_atomic_xchg_tl, MO_TEUQ)
+TRANS(amadd_db_w, gen_am, tcg_gen_atomic_fetch_add_tl, MO_TESL)
+TRANS(amadd_db_d, gen_am, tcg_gen_atomic_fetch_add_tl, MO_TEUQ)
+TRANS(amand_db_w, gen_am, tcg_gen_atomic_fetch_and_tl, MO_TESL)
+TRANS(amand_db_d, gen_am, tcg_gen_atomic_fetch_and_tl, MO_TEUQ)
+TRANS(amor_db_w, gen_am, tcg_gen_atomic_fetch_or_tl, MO_TESL)
+TRANS(amor_db_d, gen_am, tcg_gen_atomic_fetch_or_tl, MO_TEUQ)
+TRANS(amxor_db_w, gen_am, tcg_gen_atomic_fetch_xor_tl, MO_TESL)
+TRANS(amxor_db_d, gen_am, tcg_gen_atomic_fetch_xor_tl, MO_TEUQ)
+TRANS(ammax_db_w, gen_am, tcg_gen_atomic_fetch_smax_tl, MO_TESL)
+TRANS(ammax_db_d, gen_am, tcg_gen_atomic_fetch_smax_tl, MO_TEUQ)
+TRANS(ammin_db_w, gen_am, tcg_gen_atomic_fetch_smin_tl, MO_TESL)
+TRANS(ammin_db_d, gen_am, tcg_gen_atomic_fetch_smin_tl, MO_TEUQ)
+TRANS(ammax_db_wu, gen_am, tcg_gen_atomic_fetch_umax_tl, MO_TESL)
+TRANS(ammax_db_du, gen_am, tcg_gen_atomic_fetch_umax_tl, MO_TEUQ)
+TRANS(ammin_db_wu, gen_am, tcg_gen_atomic_fetch_umin_tl, MO_TESL)
+TRANS(ammin_db_du, gen_am, tcg_gen_atomic_fetch_umin_tl, MO_TEUQ)
diff --git a/target/loongarch/insn_trans/trans_memory.c.inc b/target/loongarch/insn_trans/trans_memory.c.inc
index 10914acf52..d5eb31147c 100644
--- a/target/loongarch/insn_trans/trans_memory.c.inc
+++ b/target/loongarch/insn_trans/trans_memory.c.inc
@@ -172,7 +172,7 @@ static bool gen_stptr(DisasContext *ctx, arg_rr_i *a, MemOp mop)
 
     if (a->imm) {
         temp = tcg_temp_new();
-        tcg_gen_addi_tl(temp, addr, a->im);
+        tcg_gen_addi_tl(temp, addr, a->imm);
         addr = temp;
     }
 
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 1156e6965c..8d247aa68c 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -193,3 +193,47 @@ stle_b          0011 10000111 11100 ..... ..... .....    @rrr
 stle_h          0011 10000111 11101 ..... ..... .....    @rrr
 stle_w          0011 10000111 11110 ..... ..... .....    @rrr
 stle_d          0011 10000111 11111 ..... ..... .....    @rrr
+
+#
+# Fixed point atomic instruction
+#
+ll_w            0010 0000 .............. ..... .....     @rr_i14s2
+sc_w            0010 0001 .............. ..... .....     @rr_i14s2
+ll_d            0010 0010 .............. ..... .....     @rr_i14s2
+sc_d            0010 0011 .............. ..... .....     @rr_i14s2
+amswap_w        0011 10000110 00000 ..... ..... .....    @rrr
+amswap_d        0011 10000110 00001 ..... ..... .....    @rrr
+amadd_w         0011 10000110 00010 ..... ..... .....    @rrr
+amadd_d         0011 10000110 00011 ..... ..... .....    @rrr
+amand_w         0011 10000110 00100 ..... ..... .....    @rrr
+amand_d         0011 10000110 00101 ..... ..... .....    @rrr
+amor_w          0011 10000110 00110 ..... ..... .....    @rrr
+amor_d          0011 10000110 00111 ..... ..... .....    @rrr
+amxor_w         0011 10000110 01000 ..... ..... .....    @rrr
+amxor_d         0011 10000110 01001 ..... ..... .....    @rrr
+ammax_w         0011 10000110 01010 ..... ..... .....    @rrr
+ammax_d         0011 10000110 01011 ..... ..... .....    @rrr
+ammin_w         0011 10000110 01100 ..... ..... .....    @rrr
+ammin_d         0011 10000110 01101 ..... ..... .....    @rrr
+ammax_wu        0011 10000110 01110 ..... ..... .....    @rrr
+ammax_du        0011 10000110 01111 ..... ..... .....    @rrr
+ammin_wu        0011 10000110 10000 ..... ..... .....    @rrr
+ammin_du        0011 10000110 10001 ..... ..... .....    @rrr
+amswap_db_w     0011 10000110 10010 ..... ..... .....    @rrr
+amswap_db_d     0011 10000110 10011 ..... ..... .....    @rrr
+amadd_db_w      0011 10000110 10100 ..... ..... .....    @rrr
+amadd_db_d      0011 10000110 10101 ..... ..... .....    @rrr
+amand_db_w      0011 10000110 10110 ..... ..... .....    @rrr
+amand_db_d      0011 10000110 10111 ..... ..... .....    @rrr
+amor_db_w       0011 10000110 11000 ..... ..... .....    @rrr
+amor_db_d       0011 10000110 11001 ..... ..... .....    @rrr
+amxor_db_w      0011 10000110 11010 ..... ..... .....    @rrr
+amxor_db_d      0011 10000110 11011 ..... ..... .....    @rrr
+ammax_db_w      0011 10000110 11100 ..... ..... .....    @rrr
+ammax_db_d      0011 10000110 11101 ..... ..... .....    @rrr
+ammin_db_w      0011 10000110 11110 ..... ..... .....    @rrr
+ammin_db_d      0011 10000110 11111 ..... ..... .....    @rrr
+ammax_db_wu     0011 10000111 00000 ..... ..... .....    @rrr
+ammax_db_du     0011 10000111 00001 ..... ..... .....    @rrr
+ammin_db_wu     0011 10000111 00010 ..... ..... .....    @rrr
+ammin_db_du     0011 10000111 00011 ..... ..... .....    @rrr
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 3b8ada08ed..7118e6c17d 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -154,6 +154,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_shift.c.inc"
 #include "insn_trans/trans_bit.c.inc"
 #include "insn_trans/trans_memory.c.inc"
+#include "insn_trans/trans_atomic.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
2.31.1


