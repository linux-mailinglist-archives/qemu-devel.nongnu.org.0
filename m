Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DE82655950
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:33:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjE-0006aP-9i; Sat, 24 Dec 2022 03:18:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziP-0006Bc-AH
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:09 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziM-0001gF-0W
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:09 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8DxtfB0taZjXUkIAA--.18289S3;
 Sat, 24 Dec 2022 16:16:52 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S40; 
 Sat, 24 Dec 2022 16:16:52 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 38/43] target/loongarch: Implement vbitsel vset
Date: Sat, 24 Dec 2022 16:16:28 +0800
Message-Id: <20221224081633.4185445-39-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S40
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3AF18Xr17GF1DWryUtF1fWFg_yoWfZr1kp3
 yIyry3tr4UJFZ7X3ZYvw1Yv3Z8XrsxKw1j9a1fK3yv9w47WF1DAr40q3y29F45X3yvvFyj
 g3WUA34q9a95Xa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 be8Fc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26F4j6r4UJwA2z4x0Y4vEx4A2jsIE14v26r4UJVWxJr1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26r4UJVWxJr1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020E
 x4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFV
 Cjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v
 1sIEY20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I
 0E7480Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAI
 cVC0I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0x
 vE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280
 aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VBITSEL.V;
- VBITSELI.B;
- VSET{EQZ/NEZ}.V;
- VSETANYEQZ.{B/H/W/D};
- VSETALLNEZ.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  20 ++++
 target/loongarch/helper.h                   |  14 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  25 +++++
 target/loongarch/insns.decode               |  17 +++
 target/loongarch/lsx_helper.c               | 116 ++++++++++++++++++++
 5 files changed, 192 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 0ea5418e5e..88e6ed1eef 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -763,6 +763,12 @@ static bool trans_##insn(DisasContext *ctx, arg_##type * a) \
     return true;                                            \
 }
 
+static void output_cv(DisasContext *ctx, arg_cv *a,
+                        const char *mnemonic)
+{
+    output(ctx, mnemonic, "fcc%d, v%d", a->cd, a->vj);
+}
+
 static void output_vvv(DisasContext *ctx, arg_vvv *a, const char *mnemonic)
 {
     output(ctx, mnemonic, "v%d, v%d, v%d", a->vd, a->vj, a->vk);
@@ -1512,3 +1518,17 @@ static bool trans_vfcmp_cond_##suffix(DisasContext *ctx, \
 
 LSX_FCMP_INSN(s)
 LSX_FCMP_INSN(d)
+
+INSN_LSX(vbitsel_v,        vvvv)
+INSN_LSX(vbitseli_b,       vv_i)
+
+INSN_LSX(vseteqz_v,        cv)
+INSN_LSX(vsetnez_v,        cv)
+INSN_LSX(vsetanyeqz_b,     cv)
+INSN_LSX(vsetanyeqz_h,     cv)
+INSN_LSX(vsetanyeqz_w,     cv)
+INSN_LSX(vsetanyeqz_d,     cv)
+INSN_LSX(vsetallnez_b,     cv)
+INSN_LSX(vsetallnez_h,     cv)
+INSN_LSX(vsetallnez_w,     cv)
+INSN_LSX(vsetallnez_d,     cv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 9d8ade9dc8..1bef2a901f 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -777,3 +777,17 @@ DEF_HELPER_5(vfcmp_s_s, void, env, i32, i32, i32, i32)
 DEF_HELPER_5(vfcmp_c_d, void, env, i32, i32, i32, i32)
 /* vfcmp.sXXX.d */
 DEF_HELPER_5(vfcmp_s_d, void, env, i32, i32, i32, i32)
+
+DEF_HELPER_5(vbitsel_v, void, env, i32, i32, i32, i32)
+DEF_HELPER_4(vbitseli_b, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vseteqz_v, void, env, i32, i32)
+DEF_HELPER_3(vsetnez_v, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_b, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_h, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_w, void, env, i32, i32)
+DEF_HELPER_3(vsetanyeqz_d, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_b, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_h, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_w, void, env, i32, i32)
+DEF_HELPER_3(vsetallnez_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 522d660113..7bf7f33724 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -50,6 +50,17 @@ static bool gen_vv(DisasContext *ctx, arg_vv *a,
     return true;
 }
 
+static bool gen_cv(DisasContext *ctx, arg_cv *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 cd = tcg_constant_i32(a->cd);
+
+    CHECK_SXE;
+    func(cpu_env, cd, vj);
+    return true;
+}
+
 static bool gen_vvvv(DisasContext *ctx, arg_vvvv *a,
                      void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32,
                                   TCGv_i32, TCGv_i32))
@@ -728,3 +739,17 @@ static bool trans_vfcmp_cond_d(DisasContext *ctx, arg_vvv_fcond *a)
 
     return true;
 }
+
+TRANS(vbitsel_v, gen_vvvv, gen_helper_vbitsel_v)
+TRANS(vbitseli_b, gen_vv_i, gen_helper_vbitseli_b)
+
+TRANS(vseteqz_v, gen_cv, gen_helper_vseteqz_v)
+TRANS(vsetnez_v, gen_cv, gen_helper_vsetnez_v)
+TRANS(vsetanyeqz_b, gen_cv, gen_helper_vsetanyeqz_b)
+TRANS(vsetanyeqz_h, gen_cv, gen_helper_vsetanyeqz_h)
+TRANS(vsetanyeqz_w, gen_cv, gen_helper_vsetanyeqz_w)
+TRANS(vsetanyeqz_d, gen_cv, gen_helper_vsetanyeqz_d)
+TRANS(vsetallnez_b, gen_cv, gen_helper_vsetallnez_b)
+TRANS(vsetallnez_h, gen_cv, gen_helper_vsetallnez_h)
+TRANS(vsetallnez_w, gen_cv, gen_helper_vsetallnez_w)
+TRANS(vsetallnez_d, gen_cv, gen_helper_vsetallnez_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 5b4114c39b..fb1cc29aff 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -490,6 +490,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 #
 
 &vv           vd vj
+&cv           cd vj
 &vvv          vd vj vk
 &vv_i         vd vj imm
 &vvvv         vd vj vk va
@@ -499,6 +500,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 # LSX Formats
 #
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
+@cv            .... ........ ..... ..... vj:5 .. cd:3    &cv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
 @vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
@@ -1149,3 +1151,18 @@ vslti_du         0111 00101000 10011 ..... ..... .....    @vv_ui5
 
 vfcmp_cond_s     0000 11000101 ..... ..... ..... .....    @vvv_fcond
 vfcmp_cond_d     0000 11000110 ..... ..... ..... .....    @vvv_fcond
+
+vbitsel_v        0000 11010001 ..... ..... ..... .....    @vvvv
+
+vbitseli_b       0111 00111100 01 ........ ..... .....    @vv_ui8
+
+vseteqz_v        0111 00101001 11001 00110 ..... 00 ...   @cv
+vsetnez_v        0111 00101001 11001 00111 ..... 00 ...   @cv
+vsetanyeqz_b     0111 00101001 11001 01000 ..... 00 ...   @cv
+vsetanyeqz_h     0111 00101001 11001 01001 ..... 00 ...   @cv
+vsetanyeqz_w     0111 00101001 11001 01010 ..... 00 ...   @cv
+vsetanyeqz_d     0111 00101001 11001 01011 ..... 00 ...   @cv
+vsetallnez_b     0111 00101001 11001 01100 ..... 00 ...   @cv
+vsetallnez_h     0111 00101001 11001 01101 ..... 00 ...   @cv
+vsetallnez_w     0111 00101001 11001 01110 ..... 00 ...   @cv
+vsetallnez_d     0111 00101001 11001 01111 ..... 00 ...   @cv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 1e5a1d989a..f4cdfae87a 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -31,6 +31,10 @@
                        uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va) \
     { FUNC(env, vd, vj, vk, va, BIT, __VA_ARGS__); }
 
+#define DO_HELPER_CV(NAME, BIT, FUNC, ...)                               \
+    void helper_##NAME(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
+    { FUNC(env, cd, vj, BIT, __VA_ARGS__); }
+
 static void helper_vvv(CPULoongArchState *env,
                        uint32_t vd, uint32_t vj, uint32_t vk, int bit,
                        void (*func)(vec_t*, vec_t*, vec_t*, int, int))
@@ -4275,3 +4279,115 @@ void helper_v## name ##_d(CPULoongArchState *env, uint32_t vd,      \
 
 LSX_FCMP_D(fcmp_c)
 LSX_FCMP_D(fcmp_s)
+
+void helper_vbitsel_v(CPULoongArchState *env,
+                      uint32_t vd, uint32_t vj, uint32_t vk, uint32_t va)
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+    vec_t *Va = &(env->fpr[va].vec);
+
+    Vd->D[0] = (Vk->D[0] & Va->D[0]) | (Vj->D[0] & ~(Va->D[0]));
+    Vd->D[1] = (Vk->D[1] & Va->D[1]) | (Vj->D[1] & ~(Va->D[1]));
+}
+
+static void do_vbitseli_b(vec_t *Vd, vec_t *Vj, uint32_t imm, int bit, int n)
+{
+    Vd->B[n] = (~Vd->B[n] & Vj->B[n] ) | (Vd->B[n] & imm);
+}
+
+DO_HELPER_VV_I(vbitseli_b, 8, helper_vv_i, do_vbitseli_b)
+
+void helper_vseteqz_v(CPULoongArchState *env, uint32_t cd, uint32_t vj)
+{
+    vec_t *Vj = &(env->fpr[vj].vec);
+    env->cf[cd & 0x7] = (Vj->Q[0] == 0);
+}
+
+void helper_vsetnez_v(CPULoongArchState *env, uint32_t cd, uint32_t vj)
+{
+    vec_t *Vj = &(env->fpr[vj].vec);
+    env->cf[cd & 0x7] = (Vj->Q[0] != 0);
+}
+
+static void helper_setanyeqz(CPULoongArchState *env,
+                             uint32_t cd, uint32_t vj, int bit,
+                             bool (*func)(vec_t*, int, int))
+{
+    int i;
+    bool ret = false;
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        ret |= func(Vj, bit, i);
+    }
+    env->cf[cd & 0x7] = ret;
+}
+
+static void helper_setallnez(CPULoongArchState *env,
+                             uint32_t cd, uint32_t vj, int bit,
+                             bool (*func)(vec_t*, int, int))
+{
+    int i;
+    bool ret = true;
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        ret &= func(Vj, bit, i);
+    }
+    env->cf[cd & 0x7] = ret;
+}
+
+static bool do_setanyeqz(vec_t *Vj, int bit, int n)
+{
+    bool ret = false;
+    switch (bit) {
+    case 8:
+        ret = (Vj->B[n] == 0);
+        break;
+    case 16:
+        ret = (Vj->H[n] == 0);
+        break;
+    case 32:
+        ret = (Vj->W[n] == 0);
+        break;
+    case 64:
+        ret = (Vj->D[n] == 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return ret;
+}
+
+static bool do_setallnez(vec_t *Vj, int bit, int n)
+{
+    bool ret = false;
+    switch (bit) {
+    case 8:
+        ret = (Vj->B[n] != 0);
+        break;
+    case 16:
+        ret = (Vj->H[n] != 0);
+        break;
+    case 32:
+        ret = (Vj->W[n] != 0);
+        break;
+    case 64:
+        ret = (Vj->D[n] != 0);
+        break;
+    default:
+        g_assert_not_reached();
+    }
+    return ret;
+}
+
+DO_HELPER_CV(vsetanyeqz_b, 8, helper_setanyeqz, do_setanyeqz)
+DO_HELPER_CV(vsetanyeqz_h, 16, helper_setanyeqz, do_setanyeqz)
+DO_HELPER_CV(vsetanyeqz_w, 32, helper_setanyeqz, do_setanyeqz)
+DO_HELPER_CV(vsetanyeqz_d, 64, helper_setanyeqz, do_setanyeqz)
+DO_HELPER_CV(vsetallnez_b, 8, helper_setallnez, do_setallnez)
+DO_HELPER_CV(vsetallnez_h, 16, helper_setallnez, do_setallnez)
+DO_HELPER_CV(vsetallnez_w, 32, helper_setallnez, do_setallnez)
+DO_HELPER_CV(vsetallnez_d, 64, helper_setallnez, do_setallnez)
-- 
2.31.1


