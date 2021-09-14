Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF0F540AEA4
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:10:14 +0200 (CEST)
Received: from localhost ([::1]:42946 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8CT-0004VV-Cn
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ83y-0005eg-8x
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57662 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ83h-0007sg-2p
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:24 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S10; 
 Tue, 14 Sep 2021 21:01:02 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 08/21] target/loongarch: Add fixed point atomic instruction
 translation
Date: Tue, 14 Sep 2021 21:00:18 +0800
Message-Id: <1631624431-30658-9-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S10
X-Coremail-Antispam: 1UD129KBjvJXoW3Jw4xKw43XFWxWFy8Gr4rZrb_yoWDGw1kpr
 42kryxXr4Fqry5Jr95tws0g343GFnIv347Wry3tr1kZF1UGF15JF18J39IkFWUXws5ZFW8
 KFWay34jkFy5JaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnUUvcSsGvfC2KfnxnUUI43ZEXa7xR_UUUUUUUUU==
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
X-Spam_score_int: 0
X-Spam_score: -0.0
X-Spam_bar: /
X-Spam_report: (-0.0 / 5.0 requ) SPF_HELO_PASS=-0.001,
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement fixed point atomic instruction translation.

This includes:
- LL.{W/D}, SC.{W/D}
- AM{SWAP/ADD/AND/OR/XOR/MAX/MIN}[_DB].{W/D}
- AM{MAX/MIN}[_DB].{WU/DU}

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
---
 target/loongarch/insn_trans/trans_atomic.c | 133 +++++++++++++++++++++++++++++
 target/loongarch/insns.decode              |  44 ++++++++++
 target/loongarch/translate.c               |   1 +
 3 files changed, 178 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_atomic.c

diff --git a/target/loongarch/insn_trans/trans_atomic.c b/target/loongarch/insn_trans/trans_atomic.c
new file mode 100644
index 0000000..7613f21
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_atomic.c
@@ -0,0 +1,133 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool gen_ll(DisasContext *ctx, arg_fmt_rdrjsi14 *a,
+                   void (*func)(TCGv, TCGv, int))
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv t0 = tcg_temp_new();
+
+    tcg_gen_addi_tl(t0, src1, a->si14 << 2);
+    func(dest, t0, ctx->mem_idx);
+    tcg_gen_st_tl(t0, cpu_env, offsetof(CPULoongArchState, lladdr));
+    tcg_gen_st_tl(dest, cpu_env, offsetof(CPULoongArchState, llval));
+    tcg_temp_free(t0);
+    return true;
+}
+
+static bool gen_sc(DisasContext *ctx, arg_fmt_rdrjsi14 *a, MemOp mop)
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
+    tcg_gen_addi_tl(t0, src1, a->si14 << 2);
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
+static bool gen_am(DisasContext *ctx, arg_fmt_rdrjrk *a,
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
+static bool gen_am_db(DisasContext *ctx, arg_fmt_rdrjrk *a,
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
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 807cb54..1ec3be6 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -174,6 +174,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_shift.c"
 #include "insn_trans/trans_bit.c"
 #include "insn_trans/trans_memory.c"
+#include "insn_trans/trans_atomic.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


