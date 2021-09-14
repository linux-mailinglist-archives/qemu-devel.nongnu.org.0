Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED9DC40AECF
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Sep 2021 15:21:21 +0200 (CEST)
Received: from localhost ([::1]:46024 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mQ8NF-00012M-0c
	for lists+qemu-devel@lfdr.de; Tue, 14 Sep 2021 09:21:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37574)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1mQ83y-0005h5-JI
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:26 -0400
Received: from mail.loongson.cn ([114.242.206.163]:57694 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1mQ83h-0007sm-Tf
 for qemu-devel@nongnu.org; Tue, 14 Sep 2021 09:01:26 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxheXvnEBhNJ0GAA--.21668S11; 
 Tue, 14 Sep 2021 21:01:04 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 09/21] target/loongarch: Add fixed point extra instruction
 translation
Date: Tue, 14 Sep 2021 21:00:19 +0800
Message-Id: <1631624431-30658-10-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
References: <1631624431-30658-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxheXvnEBhNJ0GAA--.21668S11
X-Coremail-Antispam: 1UD129KBjvJXoW3Xr4kZr4kArW8XF4rWF1UGFg_yoW3CrWDpF
 1xCryUGrW8Jry7Z3s5Kw45tr15Xr4fuF47X3yftw1rAF17XF1DJr48t39IkFWUJw1DXryj
 qa13AryDKFyUXaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, philmd@redhat.com,
 richard.henderson@linaro.org, laurent@vivier.eu, peterx@redhat.com,
 gaosong@loongson.cn, yangxiaojuan@loongson.cn, alistair.francis@wdc.com,
 maobibo@loongson.cn, pbonzini@redhat.com, bmeng.cn@gmail.com,
 alex.bennee@linaro.org, chenhuacai@loongson.cn
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch implement fixed point extra instruction translation.

This includes:
- CRC[C].W.{B/H/W/D}.W
- SYSCALL
- BREAK
- ASRT{LE/GT}.D
- RDTIME{L/H}.W, RDTIME.D
- CPUCFG

Signed-off-by: Song Gao <gaosong@loongson.cn>
Signed-off-by: XiaoJuan Yang <yangxiaojuan@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/helper.h                 |  4 ++
 target/loongarch/insn_trans/trans_extra.c | 87 +++++++++++++++++++++++++++++++
 target/loongarch/insns.decode             | 25 +++++++++
 target/loongarch/op_helper.c              | 26 +++++++++
 target/loongarch/translate.c              |  1 +
 5 files changed, 143 insertions(+)
 create mode 100644 target/loongarch/insn_trans/trans_extra.c

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 09b5a3d..e4b4595 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -14,3 +14,7 @@ DEF_HELPER_FLAGS_1(bitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_3(asrtle_d, void, env, tl, tl)
 DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
+
+DEF_HELPER_3(crc32, tl, tl, tl, tl)
+DEF_HELPER_3(crc32c, tl, tl, tl, tl)
+DEF_HELPER_2(cpucfg, tl, env, tl)
diff --git a/target/loongarch/insn_trans/trans_extra.c b/target/loongarch/insn_trans/trans_extra.c
new file mode 100644
index 0000000..8da3b40
--- /dev/null
+++ b/target/loongarch/insn_trans/trans_extra.c
@@ -0,0 +1,87 @@
+/*
+ * LoongArch translate functions
+ *
+ * Copyright (c) 2021 Loongson Technology Corporation Limited
+ *
+ * SPDX-License-Identifier: LGPL-2.1+
+ */
+
+static bool trans_break(DisasContext *ctx, arg_break *a)
+{
+    generate_exception(ctx, EXCP_BREAK);
+    return true;
+}
+
+static bool trans_syscall(DisasContext *ctx, arg_syscall *a)
+{
+    generate_exception(ctx, EXCP_SYSCALL);
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
+static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
+    return true;
+}
+
+static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
+    return true;
+}
+
+static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
+{
+    tcg_gen_movi_tl(cpu_gpr[a->rd], 0);
+    return true;
+}
+
+static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_NONE);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+
+    gen_helper_cpucfg(dest, cpu_env, src1);
+    return true;
+}
+
+static bool gen_crc(DisasContext *ctx, arg_fmt_rdrjrk *a,
+                    void (*func)(TCGv, TCGv, TCGv, TCGv),
+                    TCGv tsz)
+{
+    TCGv dest = gpr_dst(ctx, a->rd, EXT_SIGN);
+    TCGv src1 = gpr_src(ctx, a->rj, EXT_NONE);
+    TCGv src2 = gpr_src(ctx, a->rk, EXT_NONE);
+
+    func(dest, src2, src1, tsz);
+
+    gen_set_gpr(a->rd, dest, EXT_SIGN);
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
index 574c055..66bc314 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -27,6 +27,7 @@
 %si14    10:s14
 %hint    0:5
 %whint   0:15
+%code    0:15
 
 #
 # Argument sets
@@ -46,6 +47,8 @@
 &fmt_rdrjsi14       rd rj si14
 &fmt_hintrjsi12     hint rj si12
 &fmt_whint          whint
+&fmt_rjrk           rj rk
+&fmt_code           code
 
 #
 # Formats
@@ -65,6 +68,8 @@
 @fmt_hintrjsi12      .... ...... ............ ..... .....     &fmt_hintrjsi12     %hint %rj %si12
 @fmt_whint           .... ........ ..... ...............      &fmt_whint          %whint
 @fmt_rdrjsi14        .... .... .............. ..... .....     &fmt_rdrjsi14       %rd %rj %si14
+@fmt_rjrk            .... ........ ..... ..... ..... .....    &fmt_rjrk           %rj %rk
+@fmt_code            .... ........ ..... ...............      &fmt_code           %code
 
 #
 # Fixed point arithmetic operation instruction
@@ -260,3 +265,23 @@ ammax_db_wu      0011 10000111 00000 ..... ..... .....    @fmt_rdrjrk
 ammax_db_du      0011 10000111 00001 ..... ..... .....    @fmt_rdrjrk
 ammin_db_wu      0011 10000111 00010 ..... ..... .....    @fmt_rdrjrk
 ammin_db_du      0011 10000111 00011 ..... ..... .....    @fmt_rdrjrk
+
+#
+# Fixed point extra instruction
+#
+crc_w_b_w        0000 00000010 01000 ..... ..... .....    @fmt_rdrjrk
+crc_w_h_w        0000 00000010 01001 ..... ..... .....    @fmt_rdrjrk
+crc_w_w_w        0000 00000010 01010 ..... ..... .....    @fmt_rdrjrk
+crc_w_d_w        0000 00000010 01011 ..... ..... .....    @fmt_rdrjrk
+crcc_w_b_w       0000 00000010 01100 ..... ..... .....    @fmt_rdrjrk
+crcc_w_h_w       0000 00000010 01101 ..... ..... .....    @fmt_rdrjrk
+crcc_w_w_w       0000 00000010 01110 ..... ..... .....    @fmt_rdrjrk
+crcc_w_d_w       0000 00000010 01111 ..... ..... .....    @fmt_rdrjrk
+break            0000 00000010 10100 ...............      @fmt_code
+syscall          0000 00000010 10110 ...............      @fmt_code
+asrtle_d         0000 00000000 00010 ..... ..... 00000    @fmt_rjrk
+asrtgt_d         0000 00000000 00011 ..... ..... 00000    @fmt_rjrk
+rdtimel_w        0000 00000000 00000 11000 ..... .....    @fmt_rdrj
+rdtimeh_w        0000 00000000 00000 11001 ..... .....    @fmt_rdrj
+rdtime_d         0000 00000000 00000 11010 ..... .....    @fmt_rdrj
+cpucfg           0000 00000000 00000 11011 ..... .....    @fmt_rdrj
diff --git a/target/loongarch/op_helper.c b/target/loongarch/op_helper.c
index a4ffaf9..0a1a47b 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -14,6 +14,8 @@
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
 #include "internals.h"
+#include "qemu/crc32c.h"
+#include <zlib.h>
 
 /* Exceptions helpers */
 void helper_raise_exception(CPULoongArchState *env, uint32_t exception)
@@ -57,3 +59,27 @@ void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
         do_raise_exception(env, EXCP_ADE, GETPC());
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
+    return env->cpucfg[rj];
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index 1ec3be6..d0e1daa 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -175,6 +175,7 @@ static void gen_set_gpr(int reg_num, TCGv t, DisasExtend dst_ext)
 #include "insn_trans/trans_bit.c"
 #include "insn_trans/trans_memory.c"
 #include "insn_trans/trans_atomic.c"
+#include "insn_trans/trans_extra.c"
 
 static void loongarch_tr_translate_insn(DisasContextBase *dcbase, CPUState *cs)
 {
-- 
1.8.3.1


