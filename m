Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A9A4B514661
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Apr 2022 12:13:29 +0200 (CEST)
Received: from localhost ([::1]:53466 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nkNcu-0002KE-OV
	for lists+qemu-devel@lfdr.de; Fri, 29 Apr 2022 06:13:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <yangxiaojuan@loongson.cn>)
 id 1nkNXR-0007V7-4C
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:07:49 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45980 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <yangxiaojuan@loongson.cn>) id 1nkNXL-0002zd-So
 for qemu-devel@nongnu.org; Fri, 29 Apr 2022 06:07:48 -0400
Received: from localhost.localdomain (unknown [10.2.5.185])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9Dxb9vhuGtiZicDAA--.14518S11; 
 Fri, 29 Apr 2022 18:07:40 +0800 (CST)
From: Xiaojuan Yang <yangxiaojuan@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 09/43] target/loongarch: Add fixed point extra instruction
 translation
Date: Fri, 29 Apr 2022 18:06:55 +0800
Message-Id: <20220429100729.1572481-10-yangxiaojuan@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
References: <20220429100729.1572481-1-yangxiaojuan@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf9Dxb9vhuGtiZicDAA--.14518S11
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4Dtw15uFW3Kr18Cry8Krg_yoWxtFW8pF
 1xAryUGr48Jry3Zwn7tw45tr1UZrs3Ca17Xayftw1ruF47XF1kXr48t39IkFWUJr1DXryj
 va13A34DKFWUXaUanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
- CRC[C].W.{B/H/W/D}.W
- SYSCALL
- BREAK
- ASRT{LE/GT}.D
- RDTIME{L/H}.W, RDTIME.D
- CPUCFG

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                     |  4 ++
 target/loongarch/insn_trans/trans_extra.c.inc | 68 +++++++++++++++++++
 target/loongarch/insns.decode                 | 19 ++++++
 target/loongarch/op_helper.c                  | 26 +++++++
 target/loongarch/translate.c                  |  1 +
 5 files changed, 118 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_extra.c.inc

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 100622bfc2..638c2efc51 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -11,3 +11,7 @@ DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_FLAGS_3(asrtle_d, TCG_CALL_NO_WG, void, env, tl, tl)
 DEF_HELPER_FLAGS_3(asrtgt_d, TCG_CALL_NO_WG, void, env, tl, tl)
+
+DEF_HELPER_FLAGS_3(crc32, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_3(crc32c, TCG_CALL_NO_RWG_SE, tl, tl, tl, tl)
+DEF_HELPER_FLAGS_2(cpucfg, TCG_CALL_NO_RWG_SE, tl, env, tl)
diff --git a/target/loongarch/insn_trans/trans_extra.c.inc b/target/loongarch/insn_trans/trans_extra.c.inc
new file mode 100644
index 0000000000..549f75a867
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_extra.c.inc
@@ -0,0 +1,68 @@
+/* SPDX-License-Identifier: GPL-2.0-or-later */
+/*
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ */
+
+static bool trans_break(DisasContext *ctx, arg_break *a)
+{
+    generate_exception(ctx, EXCCODE_BRK);
+    return true;
+}
+
+static bool trans_syscall(DisasContext *ctx, arg_syscall *a)
+{
+    generate_exception(ctx, EXCCODE_SYS);
+    return true;
+}
+
+static bool trans_asrtle_d(DisasContext *ctx, arg_asrtle_d * a)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    gen_helper_asrtle_d(cpu_env, src1, src2);
+    return true;
+}
+
+static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
+{
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    gen_helper_asrtgt_d(cpu_env, src1, src2);
+    return true;
+}
+
+static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_cpucfg(dest, cpu_env, src1);
+    gen_set_gpr(a->rd, dest, EXT_NONE);
+
+    return true;
+}
+
+static bool gen_crc(DisasContext *ctx, arg_rrr *a,
+                    void (*func)(TCGv, TCGv, TCGv, TCGv),
+                    TCGv tsz)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_SIGN);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    func(dest, src2, src1, tsz);
+    gen_set_gpr(a->rd, dest, EXT_SIGN);
+
+    return true;
+}
+
+TRANS(crc_w_b_w, gen_crc, gen_helper_crc32, tcg_constant_tl(1))
+TRANS(crc_w_h_w, gen_crc, gen_helper_crc32, tcg_constant_tl(2))
+TRANS(crc_w_w_w, gen_crc, gen_helper_crc32, tcg_constant_tl(4))
+TRANS(crc_w_d_w, gen_crc, gen_helper_crc32, tcg_constant_tl(8))
+TRANS(crcc_w_b_w, gen_crc, gen_helper_crc32c, tcg_constant_tl(1))
+TRANS(crcc_w_h_w, gen_crc, gen_helper_crc32c, tcg_constant_tl(2))
+TRANS(crcc_w_w_w, gen_crc, gen_helper_crc32c, tcg_constant_tl(4))
+TRANS(crcc_w_d_w, gen_crc, gen_helper_crc32c, tcg_constant_tl(8))
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 8d247aa68c..98774dbddb 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -17,6 +17,7 @@
 &i            imm
 &r_i          rd imm
 &rr           rd rj
+&rr_jk        rj rk
 &rrr          rd rj rk
 &rr_i         rd rj imm
 &hint_r_i     hint rj imm
@@ -28,6 +29,7 @@
 #
 @i15                       .... ........ ..... imm:15    &i
 @rr               .... ........ ..... ..... rj:5 rd:5    &rr
+@rr_jk            .... ........ ..... rk:5 rj:5 .....    &rr_jk
 @rrr               .... ........ ..... rk:5 rj:5 rd:5    &rrr
 @r_i20                          .... ... imm:s20 rd:5    &r_i
 @rr_ui5           .... ........ ..... imm:5 rj:5 rd:5    &rr_i
@@ -237,3 +239,20 @@ ammax_db_wu     0011 10000111 00000 ..... ..... .....    @rrr
 ammax_db_du     0011 10000111 00001 ..... ..... .....    @rrr
 ammin_db_wu     0011 10000111 00010 ..... ..... .....    @rrr
 ammin_db_du     0011 10000111 00011 ..... ..... .....    @rrr
+
+#
+# Fixed point extra instruction
+#
+crc_w_b_w       0000 00000010 01000 ..... ..... .....    @rrr
+crc_w_h_w       0000 00000010 01001 ..... ..... .....    @rrr
+crc_w_w_w       0000 00000010 01010 ..... ..... .....    @rrr
+crc_w_d_w       0000 00000010 01011 ..... ..... .....    @rrr
+crcc_w_b_w      0000 00000010 01100 ..... ..... .....    @rrr
+crcc_w_h_w      0000 00000010 01101 ..... ..... .....    @rrr
+crcc_w_w_w      0000 00000010 01110 ..... ..... .....    @rrr
+crcc_w_d_w      0000 00000010 01111 ..... ..... .....    @rrr
+break           0000 00000010 10100 ...............      @i15
+syscall         0000 00000010 10110 ...............      @i15
+asrtle_d        0000 00000000 00010 ..... ..... 00000    @rr_jk
+asrtgt_d        0000 00000000 00011 ..... ..... 00000    @rr_jk
+cpucfg          0000 00000000 00000 11011 ..... .....    @rr
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index bd2db783c9..18e565ce7f 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -13,6 +13,8 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "internals.h"
+#include "qemu/crc32c.h"
+#include <zlib.h>
 
 /* Exceptions helpers */
 void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
@@ -55,3 +57,27 @@ void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
         do_raise_exception(env, EXCCODE_ADEM, GETPC());
     }
 }
+
+target_ulong helper_crc32(target_ulong val, target_ulong m, uint64_t sz)
+{
+    uint8_t buf[8];
+    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
+
+    m &= mask;
+    stq_le_p(buf, m);
+    return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
+}
+
+target_ulong helper_crc32c(target_ulong val, target_ulong m, uint64_t sz)
+{
+    uint8_t buf[8];
+    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
+    m &= mask;
+    stq_le_p(buf, m);
+    return (int32_t) (crc32c(val, buf, sz) ^ 0xffffffff);
+}
+
+target_ulong helper_cpucfg(CPULoongArchState *env, target_ulong rj)
+{
+    return rj > 21 ? 0 : env->cpucfg[rj];
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 7118e6c17d..5baeb74afa 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -155,6 +155,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_bit.c.inc"
 #include "insn_trans/trans_memory.c.inc"
 #include "insn_trans/trans_atomic.c.inc"
+#include "insn_trans/trans_extra.c.inc"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
2.31.1


