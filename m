Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 079B53B5DDC
	for <lists+qemu-devel@lfdr.de>; Mon, 28 Jun 2021 14:18:36 +0200 (CEST)
Received: from localhost ([::1]:33486 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lxqDj-0000Z1-2t
	for lists+qemu-devel@lfdr.de; Mon, 28 Jun 2021 08:18:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1lxq0r-0002ga-9s
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:19 -0400
Received: from mail.loongson.cn ([114.242.206.163]:45548 helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1lxq0o-0001D3-0z
 for qemu-devel@nongnu.org; Mon, 28 Jun 2021 08:05:17 -0400
Received: from kvm-dev1.localdomain (unknown [10.2.5.134])
 by mail.loongson.cn (Coremail) with SMTP id AQAAf9DxL0LdutlgOrYZAA--.8747S14; 
 Mon, 28 Jun 2021 20:05:00 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Subject: [PATCH 12/20] target/loongarch: Add fixed point extra instruction
 translation
Date: Mon, 28 Jun 2021 20:04:37 +0800
Message-Id: <1624881885-31692-13-git-send-email-gaosong@loongson.cn>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
References: <1624881885-31692-1-git-send-email-gaosong@loongson.cn>
X-CM-TRANSID: AQAAf9DxL0LdutlgOrYZAA--.8747S14
X-Coremail-Antispam: 1UD129KBjvJXoW3GF4fGF1xtw45uFyUKry3urg_yoWfCF13pr
 18CryUGr48tFy3Z3sxKw15Jr45Ar1xu3W2q3yftw18AF1xWF1DXr10y3yakF4UGr1kZr43
 Zas8AFWDKFyUXaUanT9S1TB71UUUUjDqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
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
Cc: peter.maydell@linaro.org, thuth@redhat.com, richard.henderson@linaro.org,
 laurent@vivier.eu, maobibo@loongson.cn, alistair.francis@wdc.com,
 pbonzini@redhat.com, philmd@redhat.com
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
---
 target/loongarch/helper.h     |   4 ++
 target/loongarch/insns.decode |  25 ++++++++++
 target/loongarch/op_helper.c  |  69 ++++++++++++++++++++++++++
 target/loongarch/trans.inc.c  | 111 ++++++++++++++++++++++++++++++++++++++++++
 target/loongarch/translate.c  |  27 ++++++++++
 5 files changed, 236 insertions(+)

diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 5cd38c8..a60f293 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -21,3 +21,7 @@ DEF_HELPER_FLAGS_1(loongarch_dbitswap, TCG_CALL_NO_RWG_SE, tl, tl)
 
 DEF_HELPER_3(asrtle_d, void, env, tl, tl)
 DEF_HELPER_3(asrtgt_d, void, env, tl, tl)
+
+DEF_HELPER_3(crc32, tl, tl, tl, i32)
+DEF_HELPER_3(crc32c, tl, tl, tl, i32)
+DEF_HELPER_2(cpucfg, tl, env, tl)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index beb2e4a..209e147 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -27,6 +27,7 @@
 %si14    10:s14
 %hint    0:5
 %whint   0:15
+%code    0:15
 
 #
 # Argument sets
@@ -47,6 +48,8 @@
 &fmt_hintrjsi12     hint rj si12
 &fmt_hintrjrk       hint rj rk
 &fmt_whint          whint
+&fmt_rjrk           rj rk
+&fmt_code           code
 
 #
 # Formats
@@ -67,6 +70,8 @@
 @fmt_hintrjrk        .... ........ ..... ..... ..... .....    &fmt_hintrjrk       %hint %rj %rk
 @fmt_whint           .... ........ ..... ...............      &fmt_whint          %whint
 @fmt_rdrjsi14        .... .... .............. ..... .....     &fmt_rdrjsi14       %rd %rj %si14
+@fmt_rjrk            .... ........ ..... ..... ..... .....    &fmt_rjrk           %rj %rk
+@fmt_code            .... ........ ..... ...............      &fmt_code           %code
 
 #
 # Fixed point arithmetic operation instruction
@@ -263,3 +268,23 @@ ammax_db_wu      0011 10000111 00000 ..... ..... .....    @fmt_rdrjrk
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
index 66499d4..55ebff1 100644
--- a/target/loongarch/op_helper.c
+++ b/target/loongarch/op_helper.c
@@ -14,6 +14,8 @@
 #include "exec/helper-proto.h"
 #include "exec/exec-all.h"
 #include "exec/cpu_ldst.h"
+#include "qemu/crc32c.h"
+#include <zlib.h>
 
 /* Exceptions helpers */
 void helper_raise_exception_err(CPULoongArchState *env, uint32_t exception,
@@ -160,3 +162,70 @@ void helper_asrtgt_d(CPULoongArchState *env, target_ulong rj, target_ulong rk)
         do_raise_exception(env, EXCP_ADE, GETPC());
     }
 }
+
+target_ulong helper_crc32(target_ulong val, target_ulong m, uint32_t sz)
+{
+    uint8_t buf[8];
+    target_ulong mask = ((sz * 8) == 64) ? -1ULL : ((1ULL << (sz * 8)) - 1);
+
+    m &= mask;
+    stq_le_p(buf, m);
+    return (int32_t) (crc32(val ^ 0xffffffff, buf, sz) ^ 0xffffffff);
+}
+
+target_ulong helper_crc32c(target_ulong val, target_ulong m, uint32_t sz)
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
+    target_ulong r = 0;
+
+    switch (rj) {
+    case 0:
+        r = env->CSR_MCSR0 & 0xffffffff;
+        break;
+    case 1:
+        r = (env->CSR_MCSR0 & 0xffffffff00000000) >> 32;
+        break;
+    case 2:
+        r = env->CSR_MCSR1 & 0xffffffff;
+        break;
+    case 3:
+        r = (env->CSR_MCSR1 & 0xffffffff00000000) >> 32;
+        break;
+    case 4:
+        r = env->CSR_MCSR2 & 0xffffffff;
+        break;
+    case 5:
+        r = (env->CSR_MCSR2 & 0xffffffff00000000) >> 32;
+        break;
+    case 6:
+        r = env->CSR_MCSR3 & 0xffffffff;
+        break;
+    case 10:
+        r = env->CSR_MCSR8 & 0xffffffff;
+        break;
+    case 11:
+        r = (env->CSR_MCSR8 & 0xffffffff00000000) >> 32;
+        break;
+    case 12:
+        r = env->CSR_MCSR9 & 0xffffffff;
+        break;
+    case 13:
+        r = (env->CSR_MCSR9 & 0xffffffff00000000) >> 32;
+        break;
+    case 14:
+        r = env->CSR_MCSR10 & 0xffffffff;
+        break;
+    case 30:
+        r = env->CSR_MCSR24 & 0xffffffff;
+        break;
+    }
+    return r;
+}
diff --git a/target/loongarch/trans.inc.c b/target/loongarch/trans.inc.c
index 3f1e64f..a63782d 100644
--- a/target/loongarch/trans.inc.c
+++ b/target/loongarch/trans.inc.c
@@ -1333,3 +1333,114 @@ TRANS_AM_DB_D(ammin_db_du, fetch_umin)    /* trans_ammin_db_du */
 #undef TRANS_AM_DB
 #undef TRANS_AM_DB_W
 #undef TRANS_AM_DB_D
+
+/* Fixed point extra instruction translation */
+static bool trans_crc_w_b_w(DisasContext *ctx, arg_crc_w_b_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 1, 0);
+    return true;
+}
+
+static bool trans_crc_w_h_w(DisasContext *ctx, arg_crc_w_h_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 2, 0);
+    return true;
+}
+
+static bool trans_crc_w_w_w(DisasContext *ctx, arg_crc_w_w_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 4, 0);
+    return true;
+}
+
+static bool trans_crc_w_d_w(DisasContext *ctx, arg_crc_w_d_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 8, 0);
+    return true;
+}
+static bool trans_crcc_w_b_w(DisasContext *ctx, arg_crcc_w_b_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 1, 1);
+    return true;
+}
+
+static bool trans_crcc_w_h_w(DisasContext *ctx, arg_crcc_w_h_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 2, 1);
+    return true;
+}
+
+static bool trans_crcc_w_w_w(DisasContext *ctx, arg_crcc_w_w_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 4, 1);
+    return true;
+}
+
+static bool trans_crcc_w_d_w(DisasContext *ctx, arg_crcc_w_d_w *a)
+{
+    gen_crc32(ctx, a->rd, a->rj, a->rk, 8, 1);
+    return true;
+}
+
+static bool trans_break(DisasContext *ctx, arg_break *a)
+{
+    generate_exception_end(ctx, EXCP_BREAK);
+    return true;
+}
+
+static bool trans_syscall(DisasContext *ctx, arg_syscall *a)
+{
+    generate_exception_end(ctx, EXCP_SYSCALL);
+    return true;
+}
+
+static bool trans_asrtle_d(DisasContext *ctx, arg_asrtle_d * a)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    gen_load_gpr(t1, a->rj);
+    gen_load_gpr(t2, a->rk);
+    gen_helper_asrtle_d(cpu_env, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    return true;
+}
+
+static bool trans_asrtgt_d(DisasContext *ctx, arg_asrtgt_d * a)
+{
+    TCGv t1 = tcg_temp_new();
+    TCGv t2 = tcg_temp_new();
+    gen_load_gpr(t1, a->rj);
+    gen_load_gpr(t2, a->rk);
+    gen_helper_asrtgt_d(cpu_env, t1, t2);
+    tcg_temp_free(t1);
+    tcg_temp_free(t2);
+    return true;
+}
+
+static bool trans_rdtimel_w(DisasContext *ctx, arg_rdtimel_w *a)
+{
+    /* Nop */
+    return true;
+}
+
+static bool trans_rdtimeh_w(DisasContext *ctx, arg_rdtimeh_w *a)
+{
+    /* Nop */
+    return true;
+}
+
+static bool trans_rdtime_d(DisasContext *ctx, arg_rdtime_d *a)
+{
+    /* Nop */
+    return true;
+}
+
+static bool trans_cpucfg(DisasContext *ctx, arg_cpucfg *a)
+{
+    TCGv t0 = tcg_temp_new();
+    gen_load_gpr(t0, a->rj);
+    gen_helper_cpucfg(cpu_gpr[a->rd], cpu_env, t0);
+    tcg_temp_free(t0);
+    return true;
+}
diff --git a/target/loongarch/translate.c b/target/loongarch/translate.c
index bf14507..571ef58 100644
--- a/target/loongarch/translate.c
+++ b/target/loongarch/translate.c
@@ -1318,6 +1318,33 @@ static void gen_loongarch_st_cond(DisasContext *ctx, int rd, int base,
     tcg_temp_free(val);
 }
 
+static void gen_crc32(DisasContext *ctx, int rd, int rj, int rk, int sz,
+                      int crc32c)
+{
+    TCGv t0;
+    TCGv t1;
+    TCGv_i32 tsz = tcg_const_i32(1 << sz);
+    if (rd == 0) {
+        /* Treat as NOP. */
+        return;
+    }
+    t0 = tcg_temp_new();
+    t1 = tcg_temp_new();
+
+    gen_load_gpr(t0, rk);
+    gen_load_gpr(t1, rj);
+
+    if (crc32c) {
+        gen_helper_crc32c(cpu_gpr[rd], t0, t1, tsz);
+    } else {
+        gen_helper_crc32(cpu_gpr[rd], t0, t1, tsz);
+    }
+
+    tcg_temp_free(t0);
+    tcg_temp_free(t1);
+    tcg_temp_free_i32(tsz);
+}
+
 static void loongarch_tr_tb_start(DisasContextBase *dcbase, CPUState *cs)
 {
 }
-- 
1.8.3.1


