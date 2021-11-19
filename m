Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C3A9456A3C
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 07:30:46 +0100 (CET)
Received: from localhost ([::1]:35234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mnxQ5-0001tI-FH
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 01:30:45 -0500
Received: from eggs.gnu.org ([209.51.188.92]:46270)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mnx9i-0003ri-CR
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:13:50 -0500
Received: from mail.loongson.cn ([114.242.206.163]:46644 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mnx9b-0004XP-Ii
 for qemu-devel@nongnu.org; Fri, 19 Nov 2021 01:13:48 -0500
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxj8+KQJdhSG0AAA--.1952S10; 
 Fri, 19 Nov 2021 14:13:39 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 08/26] target/loongarch: Add fixed point atomic
 instruction translation
Date: Fri, 19 Nov 2021 14:13:12 +0800
Message-Id: <1637302410-24632-9-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
References: <1637302410-24632-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9Dxj8+KQJdhSG0AAA--.1952S10
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4kZr1DAF47CFWxtFW5Jrb_yoWftFy5pr
 42yr18Xr40qry5Ar1ktws8Ww17CFnFy3yUWry3tr18ZF47GF15XF18J39IkFW7Xan5Zry8
 KFW2y3yjkFyrJaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: Xiaojuan Yang <yangxiaojuan@loongson.cn>, richard.henderson@linaro.org,
 laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This includes:
- LL.{W/D}, SC.{W/D}
- AM{SWAP/ADD/AND/OR/XOR/MAX/MIN}[_DB].{W/D}
- AM{MAX/MIN}[_DB].{WU/DU}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/insn_trans/trans_atomic.c.inc | 130 +++++++++++++++++++++++++
 target/loongarch/insns.decode                  |  44 +++++++++
 target/loongarch/translate.c                   |   1 +
 3 files changed, 175 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c.inc

diff --git a/target/loongarch/insn_trans/trans_atomic.c.inc b/target/loongarch/insn_trans/trans_atomic.c.inc
new file mode 100644
index 0000000..96957bb
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_atomic.c.inc
@@ -0,0 +1,130 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool gen_ll(DisasContext *ctx, arg_rr_i *a,
+                   void (*func)(TCGv, TCGv, int))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_addi_tl(t0, src1, a->imm << 2);
+    func(dest, t0, ctx->mem_idx);
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
+    tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
+    tcg_temp_free(t0);
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
+    tcg_gen_addi_tl(t0, src1, a->imm << 2);
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
+    tcg_temp_free(t0);
+    tcg_temp_free(val);
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
+    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Warning: source register overlaps destination register"
+                      "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
+                      ctx->base.pc_next - 4);
+        return false;
+    }
+
+    func(dest, addr, val, ctx->mem_idx, mop);
+    return true;
+}
+
+static bool gen_am_db(DisasContext *ctx, arg_rrr *a,
+                      void (*func)(TCGv, TCGv, TCGv, TCGArg, MemOp),
+                      MemOp mop)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv addr = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv val = gpr_src(ctx, a->rk, EXT_NONE);
+
+    if ((a->rd != 0) && ((a->rj == a->rd) || (a->rk == a->rd))) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "Warning: source register overlaps destination register"
+                      "in atomic insn at pc=0x" TARGET_FMT_lx "\n",
+                      ctx->base.pc_next - 4);
+        return false;
+    }
+
+    gen_loongarch_sync(0x10);
+    func(dest, addr, val, ctx->mem_idx, mop);
+
+    return true;
+}
+
+TRANS(ll_w, gen_ll, tcg_gen_qemu_ld32s)
+TRANS(sc_w, gen_sc, MO_TESL)
+TRANS(ll_d, gen_ll, tcg_gen_qemu_ld64)
+TRANS(sc_d, gen_sc, MO_TEQ)
+TRANS(amswap_w, gen_am, tcg_gen_atomic_xchg_tl, MO_TESL)
+TRANS(amswap_d, gen_am, tcg_gen_atomic_xchg_tl, MO_TEQ)
+TRANS(amadd_w, gen_am, tcg_gen_atomic_fetch_add_tl, MO_TESL)
+TRANS(amadd_d, gen_am, tcg_gen_atomic_fetch_add_tl, MO_TEQ)
+TRANS(amand_w, gen_am, tcg_gen_atomic_fetch_and_tl, MO_TESL)
+TRANS(amand_d, gen_am, tcg_gen_atomic_fetch_and_tl, MO_TEQ)
+TRANS(amor_w, gen_am, tcg_gen_atomic_fetch_or_tl, MO_TESL)
+TRANS(amor_d, gen_am, tcg_gen_atomic_fetch_or_tl, MO_TEQ)
+TRANS(amxor_w, gen_am, tcg_gen_atomic_fetch_xor_tl, MO_TESL)
+TRANS(amxor_d, gen_am, tcg_gen_atomic_fetch_xor_tl, MO_TEQ)
+TRANS(ammax_w, gen_am, tcg_gen_atomic_fetch_smax_tl, MO_TESL)
+TRANS(ammax_d, gen_am, tcg_gen_atomic_fetch_smax_tl, MO_TEQ)
+TRANS(ammin_w, gen_am, tcg_gen_atomic_fetch_smin_tl, MO_TESL)
+TRANS(ammin_d, gen_am, tcg_gen_atomic_fetch_smin_tl, MO_TEQ)
+TRANS(ammax_wu, gen_am, tcg_gen_atomic_fetch_umax_tl, MO_TESL)
+TRANS(ammax_du, gen_am, tcg_gen_atomic_fetch_umax_tl, MO_TEQ)
+TRANS(ammin_wu, gen_am, tcg_gen_atomic_fetch_umin_tl, MO_TESL)
+TRANS(ammin_du, gen_am, tcg_gen_atomic_fetch_umin_tl, MO_TEQ)
+TRANS(amswap_db_w, gen_am_db, tcg_gen_atomic_xchg_tl, MO_TESL)
+TRANS(amswap_db_d, gen_am_db, tcg_gen_atomic_xchg_tl, MO_TEQ)
+TRANS(amadd_db_w, gen_am_db, tcg_gen_atomic_fetch_add_tl, MO_TESL)
+TRANS(amadd_db_d, gen_am_db, tcg_gen_atomic_fetch_add_tl, MO_TEQ)
+TRANS(amand_db_w, gen_am_db, tcg_gen_atomic_fetch_and_tl, MO_TESL)
+TRANS(amand_db_d, gen_am_db, tcg_gen_atomic_fetch_and_tl, MO_TEQ)
+TRANS(amor_db_w, gen_am_db, tcg_gen_atomic_fetch_or_tl, MO_TESL)
+TRANS(amor_db_d, gen_am_db, tcg_gen_atomic_fetch_or_tl, MO_TEQ)
+TRANS(amxor_db_w, gen_am_db, tcg_gen_atomic_fetch_xor_tl, MO_TESL)
+TRANS(amxor_db_d, gen_am_db, tcg_gen_atomic_fetch_xor_tl, MO_TEQ)
+TRANS(ammax_db_w, gen_am_db, tcg_gen_atomic_fetch_smax_tl, MO_TESL)
+TRANS(ammax_db_d, gen_am_db, tcg_gen_atomic_fetch_smax_tl, MO_TEQ)
+TRANS(ammin_db_w, gen_am_db, tcg_gen_atomic_fetch_smin_tl, MO_TESL)
+TRANS(ammin_db_d, gen_am_db, tcg_gen_atomic_fetch_smin_tl, MO_TEQ)
+TRANS(ammax_db_wu, gen_am_db, tcg_gen_atomic_fetch_umax_tl, MO_TESL)
+TRANS(ammax_db_du, gen_am_db, tcg_gen_atomic_fetch_umax_tl, MO_TEQ)
+TRANS(ammin_db_wu, gen_am_db, tcg_gen_atomic_fetch_umin_tl, MO_TESL)
+TRANS(ammin_db_du, gen_am_db, tcg_gen_atomic_fetch_umin_tl, MO_TEQ)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 3f4ac76..c222c4a 100644
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
+ll_w            0010 0000 .............. ..... .....     @rr_i14
+sc_w            0010 0001 .............. ..... .....     @rr_i14
+ll_d            0010 0010 .............. ..... .....     @rr_i14
+sc_d            0010 0011 .............. ..... .....     @rr_i14
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
index 9ff83cf..1be899f 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -178,6 +178,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_shift.c.inc"
 #include "insn_trans/trans_bit.c.inc"
 #include "insn_trans/trans_memory.c.inc"
+#include "insn_trans/trans_atomic.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


