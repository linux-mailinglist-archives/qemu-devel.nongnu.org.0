Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A457655936
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:25:48 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zjC-0006Xp-In; Sat, 24 Dec 2022 03:17:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8ziQ-0006Ce-E0
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:11 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8ziM-0001ge-QX
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:17:10 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8Cxbet1taZjXkkIAA--.18623S3;
 Sat, 24 Dec 2022 16:16:53 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S41; 
 Sat, 24 Dec 2022 16:16:52 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 39/43] target/loongarch: Implement vinsgr2vr vpickve2gr
 vreplgr2vr
Date: Sat, 24 Dec 2022 16:16:29 +0800
Message-Id: <20221224081633.4185445-40-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S41
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3urW3Wr4DXFy8ZF1xZw1xuFg_yoW8Jw43Co
 Z7W34Yyw18Jw1fur9Ik3WDW3WDJ340vw4DJayDuwnrGa4rJr12k348Gwn5Aa1kJFyFyFyU
 GwsxAFy3tayagryDn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
 IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2
 jsIEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
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
- VINSGR2VR.{B/H/W/D};
- VPICKVE2GR.{B/H/W/D}[U];
- VREPLGR2VR.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  33 +++++
 target/loongarch/helper.h                   |  18 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  53 +++++++
 target/loongarch/insns.decode               |  30 ++++
 target/loongarch/lsx_helper.c               | 154 ++++++++++++++++++++
 5 files changed, 288 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 88e6ed1eef..2f7c726158 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -789,6 +789,21 @@ static void output_vvvv(DisasContext *ctx, arg_vvvv *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, v%d, v%d, v%d", a->vd, a->vj, a->vk, a->va);
 }
 
+static void output_vr_i(DisasContext *ctx, arg_vr_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, r%d, 0x%x", a->vd, a->rj, a->imm);
+}
+
+static void output_rv_i(DisasContext *ctx, arg_rv_i *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "r%d, v%d, 0x%x", a->rd, a->vj,  a->imm);
+}
+
+static void output_vr(DisasContext *ctx, arg_vr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, r%d", a->vd, a->rj);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -1532,3 +1547,21 @@ INSN_LSX(vsetallnez_b,     cv)
 INSN_LSX(vsetallnez_h,     cv)
 INSN_LSX(vsetallnez_w,     cv)
 INSN_LSX(vsetallnez_d,     cv)
+
+INSN_LSX(vinsgr2vr_b,      vr_i)
+INSN_LSX(vinsgr2vr_h,      vr_i)
+INSN_LSX(vinsgr2vr_w,      vr_i)
+INSN_LSX(vinsgr2vr_d,      vr_i)
+INSN_LSX(vpickve2gr_b,     rv_i)
+INSN_LSX(vpickve2gr_h,     rv_i)
+INSN_LSX(vpickve2gr_w,     rv_i)
+INSN_LSX(vpickve2gr_d,     rv_i)
+INSN_LSX(vpickve2gr_bu,    rv_i)
+INSN_LSX(vpickve2gr_hu,    rv_i)
+INSN_LSX(vpickve2gr_wu,    rv_i)
+INSN_LSX(vpickve2gr_du,    rv_i)
+
+INSN_LSX(vreplgr2vr_b,     vr)
+INSN_LSX(vreplgr2vr_h,     vr)
+INSN_LSX(vreplgr2vr_w,     vr)
+INSN_LSX(vreplgr2vr_d,     vr)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 1bef2a901f..00570221c7 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -791,3 +791,21 @@ DEF_HELPER_3(vsetallnez_b, void, env, i32, i32)
 DEF_HELPER_3(vsetallnez_h, void, env, i32, i32)
 DEF_HELPER_3(vsetallnez_w, void, env, i32, i32)
 DEF_HELPER_3(vsetallnez_d, void, env, i32, i32)
+
+DEF_HELPER_4(vinsgr2vr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vinsgr2vr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vinsgr2vr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vinsgr2vr_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_bu, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_hu, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_wu, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickve2gr_du, void, env, i32, i32, i32)
+
+DEF_HELPER_3(vreplgr2vr_b, void, env, i32, i32)
+DEF_HELPER_3(vreplgr2vr_h, void, env, i32, i32)
+DEF_HELPER_3(vreplgr2vr_w, void, env, i32, i32)
+DEF_HELPER_3(vreplgr2vr_d, void, env, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 7bf7f33724..c753e61b4c 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -75,6 +75,41 @@ static bool gen_vvvv(DisasContext *ctx, arg_vvvv *a,
     return true;
 }
 
+static bool gen_vr_i(DisasContext *ctx, arg_vr_i *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 rj = tcg_constant_i32(a->rj);
+    TCGv_i32 imm = tcg_constant_i32(a->imm);
+
+    CHECK_SXE;
+    func(cpu_env, vd, rj, imm);
+    return true;
+}
+
+static bool gen_rv_i(DisasContext *ctx, arg_rv_i *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 rd = tcg_constant_i32(a->rd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 imm = tcg_constant_i32(a->imm);
+
+    CHECK_SXE;
+    func(cpu_env, rd, vj, imm);
+    return true;
+}
+
+static bool gen_vr(DisasContext *ctx, arg_vr *a,
+                   void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 rj = tcg_constant_i32(a->rj);
+
+    CHECK_SXE;
+    func(cpu_env, vd, rj);
+    return true;
+}
+
 TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
 TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
 TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
@@ -753,3 +788,21 @@ TRANS(vsetallnez_b, gen_cv, gen_helper_vsetallnez_b)
 TRANS(vsetallnez_h, gen_cv, gen_helper_vsetallnez_h)
 TRANS(vsetallnez_w, gen_cv, gen_helper_vsetallnez_w)
 TRANS(vsetallnez_d, gen_cv, gen_helper_vsetallnez_d)
+
+TRANS(vinsgr2vr_b, gen_vr_i, gen_helper_vinsgr2vr_b)
+TRANS(vinsgr2vr_h, gen_vr_i, gen_helper_vinsgr2vr_h)
+TRANS(vinsgr2vr_w, gen_vr_i, gen_helper_vinsgr2vr_w)
+TRANS(vinsgr2vr_d, gen_vr_i, gen_helper_vinsgr2vr_d)
+TRANS(vpickve2gr_b, gen_rv_i, gen_helper_vpickve2gr_b)
+TRANS(vpickve2gr_h, gen_rv_i, gen_helper_vpickve2gr_h)
+TRANS(vpickve2gr_w, gen_rv_i, gen_helper_vpickve2gr_w)
+TRANS(vpickve2gr_d, gen_rv_i, gen_helper_vpickve2gr_d)
+TRANS(vpickve2gr_bu, gen_rv_i, gen_helper_vpickve2gr_bu)
+TRANS(vpickve2gr_hu, gen_rv_i, gen_helper_vpickve2gr_hu)
+TRANS(vpickve2gr_wu, gen_rv_i, gen_helper_vpickve2gr_wu)
+TRANS(vpickve2gr_du, gen_rv_i, gen_helper_vpickve2gr_du)
+
+TRANS(vreplgr2vr_b, gen_vr, gen_helper_vreplgr2vr_b)
+TRANS(vreplgr2vr_h, gen_vr, gen_helper_vreplgr2vr_h)
+TRANS(vreplgr2vr_w, gen_vr, gen_helper_vreplgr2vr_w)
+TRANS(vreplgr2vr_d, gen_vr, gen_helper_vreplgr2vr_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index fb1cc29aff..45eff88830 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -495,6 +495,9 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vv_i         vd vj imm
 &vvvv         vd vj vk va
 &vvv_fcond    vd vj vk fcond
+&vr_i         vd rj imm
+&rv_i         rd vj imm
+&vr           vd rj
 
 #
 # LSX Formats
@@ -511,6 +514,15 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv_i5           .... ........ ..... imm:s5 vj:5 vd:5    &vv_i
 @vvvv               .... ........ va:5 vk:5 vj:5 vd:5    &vvvv
 @vvv_fcond      .... ........ fcond:5  vk:5 vj:5 vd:5    &vvv_fcond
+@vr_ui4         .... ........ ..... . imm:4 rj:5 vd:5    &vr_i
+@vr_ui3        .... ........ ..... .. imm:3 rj:5 vd:5    &vr_i
+@vr_ui2       .... ........ ..... ... imm:2 rj:5 vd:5    &vr_i
+@vr_ui1      .... ........ ..... .... imm:1 rj:5 vd:5    &vr_i
+@rv_ui4         .... ........ ..... . imm:4 vj:5 rd:5    &rv_i
+@rv_ui3        .... ........ ..... .. imm:3 vj:5 rd:5    &rv_i
+@rv_ui2       .... ........ ..... ... imm:2 vj:5 rd:5    &rv_i
+@rv_ui1      .... ........ ..... .... imm:1 vj:5 rd:5    &rv_i
+@vr               .... ........ ..... ..... rj:5 vd:5    &vr
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1166,3 +1178,21 @@ vsetallnez_b     0111 00101001 11001 01100 ..... 00 ...   @cv
 vsetallnez_h     0111 00101001 11001 01101 ..... 00 ...   @cv
 vsetallnez_w     0111 00101001 11001 01110 ..... 00 ...   @cv
 vsetallnez_d     0111 00101001 11001 01111 ..... 00 ...   @cv
+
+vinsgr2vr_b      0111 00101110 10111 0 .... ..... .....   @vr_ui4
+vinsgr2vr_h      0111 00101110 10111 10 ... ..... .....   @vr_ui3
+vinsgr2vr_w      0111 00101110 10111 110 .. ..... .....   @vr_ui2
+vinsgr2vr_d      0111 00101110 10111 1110 . ..... .....   @vr_ui1
+vpickve2gr_b     0111 00101110 11111 0 .... ..... .....   @rv_ui4
+vpickve2gr_h     0111 00101110 11111 10 ... ..... .....   @rv_ui3
+vpickve2gr_w     0111 00101110 11111 110 .. ..... .....   @rv_ui2
+vpickve2gr_d     0111 00101110 11111 1110 . ..... .....   @rv_ui1
+vpickve2gr_bu    0111 00101111 00111 0 .... ..... .....   @rv_ui4
+vpickve2gr_hu    0111 00101111 00111 10 ... ..... .....   @rv_ui3
+vpickve2gr_wu    0111 00101111 00111 110 .. ..... .....   @rv_ui2
+vpickve2gr_du    0111 00101111 00111 1110 . ..... .....   @rv_ui1
+
+vreplgr2vr_b     0111 00101001 11110 00000 ..... .....    @vr
+vreplgr2vr_h     0111 00101001 11110 00001 ..... .....    @vr
+vreplgr2vr_w     0111 00101001 11110 00010 ..... .....    @vr
+vreplgr2vr_d     0111 00101001 11110 00011 ..... .....    @vr
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index f4cdfae87a..15dbf4fc32 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -35,6 +35,21 @@
     void helper_##NAME(CPULoongArchState *env, uint32_t cd, uint32_t vj) \
     { FUNC(env, cd, vj, BIT, __VA_ARGS__); }
 
+#define DO_HELPER_VR_I(NAME, BIT, FUNC, ...)                   \
+    void helper_##NAME(CPULoongArchState *env,                 \
+                       uint32_t vd, uint32_t rj, uint32_t imm) \
+    { FUNC(env, vd, rj, imm, BIT, __VA_ARGS__ ); }
+
+#define DO_HELPER_RV_I(NAME, BIT, FUNC, ...)                   \
+    void helper_##NAME(CPULoongArchState *env,                 \
+                       uint32_t rd, uint32_t vj, uint32_t imm) \
+    { FUNC(env, rd, vj, imm, BIT, __VA_ARGS__ ); }
+
+#define DO_HELPER_VR(NAME, BIT, FUNC, ...)       \
+    void helper_##NAME(CPULoongArchState *env,   \
+                       uint32_t vd, uint32_t rj) \
+    { FUNC(env, vd, rj, BIT, __VA_ARGS__ ); }
+
 static void helper_vvv(CPULoongArchState *env,
                        uint32_t vd, uint32_t vj, uint32_t vk, int bit,
                        void (*func)(vec_t*, vec_t*, vec_t*, int, int))
@@ -4391,3 +4406,142 @@ DO_HELPER_CV(vsetallnez_b, 8, helper_setallnez, do_setallnez)
 DO_HELPER_CV(vsetallnez_h, 16, helper_setallnez, do_setallnez)
 DO_HELPER_CV(vsetallnez_w, 32, helper_setallnez, do_setallnez)
 DO_HELPER_CV(vsetallnez_d, 64, helper_setallnez, do_setallnez)
+
+static void helper_vr_i(CPULoongArchState *env,
+                        uint32_t vd, uint32_t rj, uint32_t imm, int bit,
+                        void (*func)(vec_t*, uint64_t, uint32_t, int))
+{
+    vec_t *Vd = &(env->fpr[vd].vec);
+    uint64_t Rj = env->gpr[rj];
+
+    imm %= (LSX_LEN/bit);
+
+    func(Vd, Rj, imm, bit);
+}
+
+static void do_insgr2vr(vec_t *Vd, uint64_t value, uint32_t imm, int bit)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[imm] = (int8_t)value;
+        break;
+    case 16:
+        Vd->H[imm] = (int16_t)value;
+        break;
+    case 32:
+        Vd->W[imm] = (int32_t)value;
+        break;
+    case 64:
+        Vd->D[imm] = (int64_t)value;
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VR_I(vinsgr2vr_b, 8, helper_vr_i, do_insgr2vr)
+DO_HELPER_VR_I(vinsgr2vr_h, 16, helper_vr_i, do_insgr2vr)
+DO_HELPER_VR_I(vinsgr2vr_w, 32, helper_vr_i, do_insgr2vr)
+DO_HELPER_VR_I(vinsgr2vr_d, 64, helper_vr_i, do_insgr2vr)
+
+static void helper_rv_i(CPULoongArchState *env,
+                        uint32_t rd, uint32_t vj, uint32_t imm, int bit,
+                        void (*func)(CPULoongArchState*, uint32_t, vec_t*,
+                                     uint32_t, int))
+{
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    imm %=(LSX_LEN/bit);
+
+    func(env, rd, Vj, imm, bit);
+}
+
+static void do_pickve2gr_s(CPULoongArchState *env,
+                           uint32_t rd, vec_t *Vj, uint32_t imm, int bit)
+{
+    switch (bit) {
+    case 8:
+        env->gpr[rd] = Vj->B[imm];
+        break;
+    case 16:
+        env->gpr[rd] = Vj->H[imm];
+        break;
+    case 32:
+        env->gpr[rd] = Vj->W[imm];
+        break;
+    case 64:
+        env->gpr[rd] = Vj->D[imm];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_pickve2gr_u(CPULoongArchState *env,
+                           uint32_t rd, vec_t *Vj, uint32_t imm, int bit)
+{
+    switch (bit) {
+    case 8:
+        env->gpr[rd] = (uint8_t)Vj->B[imm];
+        break;
+    case 16:
+        env->gpr[rd] = (uint16_t)Vj->H[imm];
+        break;
+    case 32:
+        env->gpr[rd] = (uint32_t)Vj->W[imm];
+        break;
+    case 64:
+        env->gpr[rd] = (uint64_t)Vj->D[imm];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_RV_I(vpickve2gr_b, 8, helper_rv_i, do_pickve2gr_s)
+DO_HELPER_RV_I(vpickve2gr_h, 16, helper_rv_i, do_pickve2gr_s)
+DO_HELPER_RV_I(vpickve2gr_w, 32, helper_rv_i, do_pickve2gr_s)
+DO_HELPER_RV_I(vpickve2gr_d, 64, helper_rv_i, do_pickve2gr_s)
+DO_HELPER_RV_I(vpickve2gr_bu, 8, helper_rv_i, do_pickve2gr_u)
+DO_HELPER_RV_I(vpickve2gr_hu, 16, helper_rv_i, do_pickve2gr_u)
+DO_HELPER_RV_I(vpickve2gr_wu, 32, helper_rv_i, do_pickve2gr_u)
+DO_HELPER_RV_I(vpickve2gr_du, 64, helper_rv_i, do_pickve2gr_u)
+
+static void helper_vr(CPULoongArchState *env,
+                      uint32_t vd, uint32_t rj, int bit,
+                      void (*func)(CPULoongArchState*,
+                                   vec_t*, uint32_t,  int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(env, Vd, rj, bit, i);
+    }
+}
+
+static void do_replgr2vr(CPULoongArchState *env,
+                         vec_t *Vd, uint32_t rj, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n] = (int8_t)env->gpr[rj];
+        break;
+    case 16:
+        Vd->H[n] = (int16_t)env->gpr[rj];
+        break;
+    case 32:
+        Vd->W[n] = (int32_t)env->gpr[rj];
+        break;
+    case 64:
+        Vd->D[n] = (int64_t)env->gpr[rj];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VR(vreplgr2vr_b, 8, helper_vr, do_replgr2vr)
+DO_HELPER_VR(vreplgr2vr_h, 16, helper_vr, do_replgr2vr)
+DO_HELPER_VR(vreplgr2vr_w, 32, helper_vr, do_replgr2vr)
+DO_HELPER_VR(vreplgr2vr_d, 64, helper_vr, do_replgr2vr)
-- 
2.31.1


