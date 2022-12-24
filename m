Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3CA655927
	for <lists+qemu-devel@lfdr.de>; Sat, 24 Dec 2022 09:20:21 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p8zkQ-0007OB-Kj; Sat, 24 Dec 2022 03:19:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1p8zkB-0007Le-E7
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:19:02 -0500
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1p8zk8-0003sK-F3
 for qemu-devel@nongnu.org; Sat, 24 Dec 2022 03:18:59 -0500
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8CxZPB2taZjYEkIAA--.18477S3;
 Sat, 24 Dec 2022 16:16:54 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8CxPuRhtaZjuccKAA--.38440S42; 
 Sat, 24 Dec 2022 16:16:53 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH 40/43] target/loongarch: Implement vreplve vpack vpick
Date: Sat, 24 Dec 2022 16:16:30 +0800
Message-Id: <20221224081633.4185445-41-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20221224081633.4185445-1-gaosong@loongson.cn>
References: <20221224081633.4185445-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8CxPuRhtaZjuccKAA--.38440S42
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoWfJryUGry7uFy7Kw4UZr4xJFb_yoW8Xw1xuo
 WUXw45Jw4rJr1fGr9xKas8ZF1qv340yw4DJas09rW7GFyrJr1ayryfG3s5AayfZ3y8t3s5
 Cw4DCFy5tw4aqw1kn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqG1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVWxJVW8Jr1l84ACjcxK6I8E87Iv67AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aV
 CY1x0267AKxVW8Jr0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x2
 6I8E6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4
 IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AG
 Y7Cv6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s
 026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF
 0xvE2Ix0cI8IcVAFwI0_tr0E3s1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42
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
- VREPLVE[I].{B/H/W/D};
- VBSLL.V, VBSRL.V;
- VPACK{EV/OD}.{B/H/W/D};
- VPICK{EV/OD}.{B/H/W/D}.

Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  35 +++
 target/loongarch/helper.h                   |  30 +++
 target/loongarch/insn_trans/trans_lsx.c.inc |  42 ++++
 target/loongarch/insns.decode               |  34 +++
 target/loongarch/lsx_helper.c               | 226 ++++++++++++++++++++
 5 files changed, 367 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 2f7c726158..fd87f7fbe1 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -804,6 +804,11 @@ static void output_vr(DisasContext *ctx, arg_vr *a, const char *mnemonic)
     output(ctx, mnemonic, "v%d, r%d", a->vd, a->rj);
 }
 
+static void output_vvr(DisasContext *ctx, arg_vvr *a, const char *mnemonic)
+{
+    output(ctx, mnemonic, "v%d, v%d, r%d", a->vd, a->vj, a->rk);
+}
+
 INSN_LSX(vadd_b,           vvv)
 INSN_LSX(vadd_h,           vvv)
 INSN_LSX(vadd_w,           vvv)
@@ -1565,3 +1570,33 @@ INSN_LSX(vreplgr2vr_b,     vr)
 INSN_LSX(vreplgr2vr_h,     vr)
 INSN_LSX(vreplgr2vr_w,     vr)
 INSN_LSX(vreplgr2vr_d,     vr)
+
+INSN_LSX(vreplve_b,        vvr)
+INSN_LSX(vreplve_h,        vvr)
+INSN_LSX(vreplve_w,        vvr)
+INSN_LSX(vreplve_d,        vvr)
+INSN_LSX(vreplvei_b,       vv_i)
+INSN_LSX(vreplvei_h,       vv_i)
+INSN_LSX(vreplvei_w,       vv_i)
+INSN_LSX(vreplvei_d,       vv_i)
+
+INSN_LSX(vbsll_v,          vv_i)
+INSN_LSX(vbsrl_v,          vv_i)
+
+INSN_LSX(vpackev_b,        vvv)
+INSN_LSX(vpackev_h,        vvv)
+INSN_LSX(vpackev_w,        vvv)
+INSN_LSX(vpackev_d,        vvv)
+INSN_LSX(vpackod_b,        vvv)
+INSN_LSX(vpackod_h,        vvv)
+INSN_LSX(vpackod_w,        vvv)
+INSN_LSX(vpackod_d,        vvv)
+
+INSN_LSX(vpickev_b,        vvv)
+INSN_LSX(vpickev_h,        vvv)
+INSN_LSX(vpickev_w,        vvv)
+INSN_LSX(vpickev_d,        vvv)
+INSN_LSX(vpickod_b,        vvv)
+INSN_LSX(vpickod_h,        vvv)
+INSN_LSX(vpickod_w,        vvv)
+INSN_LSX(vpickod_d,        vvv)
diff --git a/target/loongarch/helper.h b/target/loongarch/helper.h
index 00570221c7..dfe3eb925f 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -809,3 +809,33 @@ DEF_HELPER_3(vreplgr2vr_b, void, env, i32, i32)
 DEF_HELPER_3(vreplgr2vr_h, void, env, i32, i32)
 DEF_HELPER_3(vreplgr2vr_w, void, env, i32, i32)
 DEF_HELPER_3(vreplgr2vr_d, void, env, i32, i32)
+
+DEF_HELPER_4(vreplve_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplve_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplve_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplve_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplvei_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplvei_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplvei_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vreplvei_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vbsll_v, void, env, i32, i32, i32)
+DEF_HELPER_4(vbsrl_v, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vpackev_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackev_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackev_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackev_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackod_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackod_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackod_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vpackod_d, void, env, i32, i32, i32)
+
+DEF_HELPER_4(vpickev_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickev_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickev_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickev_d, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickod_b, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickod_h, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickod_w, void, env, i32, i32, i32)
+DEF_HELPER_4(vpickod_d, void, env, i32, i32, i32)
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index c753e61b4c..0c74811bc4 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -110,6 +110,18 @@ static bool gen_vr(DisasContext *ctx, arg_vr *a,
     return true;
 }
 
+static bool gen_vvr(DisasContext *ctx, arg_vvr *a,
+                    void (*func)(TCGv_ptr, TCGv_i32, TCGv_i32, TCGv_i32))
+{
+    TCGv_i32 vd = tcg_constant_i32(a->vd);
+    TCGv_i32 vj = tcg_constant_i32(a->vj);
+    TCGv_i32 rk = tcg_constant_i32(a->rk);
+
+    CHECK_SXE;
+    func(cpu_env, vd, vj, rk);
+    return true;
+}
+
 TRANS(vadd_b, gen_vvv, gen_helper_vadd_b)
 TRANS(vadd_h, gen_vvv, gen_helper_vadd_h)
 TRANS(vadd_w, gen_vvv, gen_helper_vadd_w)
@@ -806,3 +818,33 @@ TRANS(vreplgr2vr_b, gen_vr, gen_helper_vreplgr2vr_b)
 TRANS(vreplgr2vr_h, gen_vr, gen_helper_vreplgr2vr_h)
 TRANS(vreplgr2vr_w, gen_vr, gen_helper_vreplgr2vr_w)
 TRANS(vreplgr2vr_d, gen_vr, gen_helper_vreplgr2vr_d)
+
+TRANS(vreplve_b, gen_vvr, gen_helper_vreplve_b)
+TRANS(vreplve_h, gen_vvr, gen_helper_vreplve_h)
+TRANS(vreplve_w, gen_vvr, gen_helper_vreplve_w)
+TRANS(vreplve_d, gen_vvr, gen_helper_vreplve_d)
+TRANS(vreplvei_b, gen_vv_i, gen_helper_vreplvei_b)
+TRANS(vreplvei_h, gen_vv_i, gen_helper_vreplvei_h)
+TRANS(vreplvei_w, gen_vv_i, gen_helper_vreplvei_w)
+TRANS(vreplvei_d, gen_vv_i, gen_helper_vreplvei_d)
+
+TRANS(vbsll_v, gen_vv_i, gen_helper_vbsll_v)
+TRANS(vbsrl_v, gen_vv_i, gen_helper_vbsrl_v)
+
+TRANS(vpackev_b, gen_vvv, gen_helper_vpackev_b)
+TRANS(vpackev_h, gen_vvv, gen_helper_vpackev_h)
+TRANS(vpackev_w, gen_vvv, gen_helper_vpackev_w)
+TRANS(vpackev_d, gen_vvv, gen_helper_vpackev_d)
+TRANS(vpackod_b, gen_vvv, gen_helper_vpackod_b)
+TRANS(vpackod_h, gen_vvv, gen_helper_vpackod_h)
+TRANS(vpackod_w, gen_vvv, gen_helper_vpackod_w)
+TRANS(vpackod_d, gen_vvv, gen_helper_vpackod_d)
+
+TRANS(vpickev_b, gen_vvv, gen_helper_vpickev_b)
+TRANS(vpickev_h, gen_vvv, gen_helper_vpickev_h)
+TRANS(vpickev_w, gen_vvv, gen_helper_vpickev_w)
+TRANS(vpickev_d, gen_vvv, gen_helper_vpickev_d)
+TRANS(vpickod_b, gen_vvv, gen_helper_vpickod_b)
+TRANS(vpickod_h, gen_vvv, gen_helper_vpickod_h)
+TRANS(vpickod_w, gen_vvv, gen_helper_vpickod_w)
+TRANS(vpickod_d, gen_vvv, gen_helper_vpickod_d)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index 45eff88830..7db72bd358 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -498,6 +498,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vr_i         vd rj imm
 &rv_i         rd vj imm
 &vr           vd rj
+&vvr          vd vj rk
 
 #
 # LSX Formats
@@ -505,6 +506,8 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @cv            .... ........ ..... ..... vj:5 .. cd:3    &cv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+@vv_ui1      .... ........ ..... .... imm:1 vj:5 vd:5    &vv_i
+@vv_ui2       .... ........ ..... ... imm:2 vj:5 vd:5    &vv_i
 @vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
@@ -523,6 +526,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @rv_ui2       .... ........ ..... ... imm:2 vj:5 rd:5    &rv_i
 @rv_ui1      .... ........ ..... .... imm:1 vj:5 rd:5    &rv_i
 @vr               .... ........ ..... ..... rj:5 vd:5    &vr
+@vvr               .... ........ ..... rk:5 vj:5 vd:5    &vvr
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1196,3 +1200,33 @@ vreplgr2vr_b     0111 00101001 11110 00000 ..... .....    @vr
 vreplgr2vr_h     0111 00101001 11110 00001 ..... .....    @vr
 vreplgr2vr_w     0111 00101001 11110 00010 ..... .....    @vr
 vreplgr2vr_d     0111 00101001 11110 00011 ..... .....    @vr
+
+vreplve_b        0111 00010010 00100 ..... ..... .....    @vvr
+vreplve_h        0111 00010010 00101 ..... ..... .....    @vvr
+vreplve_w        0111 00010010 00110 ..... ..... .....    @vvr
+vreplve_d        0111 00010010 00111 ..... ..... .....    @vvr
+vreplvei_b       0111 00101111 01111 0 .... ..... .....   @vv_ui4
+vreplvei_h       0111 00101111 01111 10 ... ..... .....   @vv_ui3
+vreplvei_w       0111 00101111 01111 110 .. ..... .....   @vv_ui2
+vreplvei_d       0111 00101111 01111 1110 . ..... .....   @vv_ui1
+
+vbsll_v          0111 00101000 11100 ..... ..... .....    @vv_ui5
+vbsrl_v          0111 00101000 11101 ..... ..... .....    @vv_ui5
+
+vpackev_b        0111 00010001 01100 ..... ..... .....    @vvv
+vpackev_h        0111 00010001 01101 ..... ..... .....    @vvv
+vpackev_w        0111 00010001 01110 ..... ..... .....    @vvv
+vpackev_d        0111 00010001 01111 ..... ..... .....    @vvv
+vpackod_b        0111 00010001 10000 ..... ..... .....    @vvv
+vpackod_h        0111 00010001 10001 ..... ..... .....    @vvv
+vpackod_w        0111 00010001 10010 ..... ..... .....    @vvv
+vpackod_d        0111 00010001 10011 ..... ..... .....    @vvv
+
+vpickev_b        0111 00010001 11100 ..... ..... .....    @vvv
+vpickev_h        0111 00010001 11101 ..... ..... .....    @vvv
+vpickev_w        0111 00010001 11110 ..... ..... .....    @vvv
+vpickev_d        0111 00010001 11111 ..... ..... .....    @vvv
+vpickod_b        0111 00010010 00000 ..... ..... .....    @vvv
+vpickod_h        0111 00010010 00001 ..... ..... .....    @vvv
+vpickod_w        0111 00010010 00010 ..... ..... .....    @vvv
+vpickod_d        0111 00010010 00011 ..... ..... .....    @vvv
diff --git a/target/loongarch/lsx_helper.c b/target/loongarch/lsx_helper.c
index 15dbf4fc32..b0017a7ab8 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -50,6 +50,11 @@
                        uint32_t vd, uint32_t rj) \
     { FUNC(env, vd, rj, BIT, __VA_ARGS__ ); }
 
+#define DO_HELPER_VV_R(NAME, BIT, FUNC, ...)                  \
+    void helper_##NAME(CPULoongArchState *env,                \
+                       uint32_t vd, uint32_t vj, uint32_t rk) \
+    { FUNC(env, vd, vj, rk, BIT, __VA_ARGS__); }
+
 static void helper_vvv(CPULoongArchState *env,
                        uint32_t vd, uint32_t vj, uint32_t vk, int bit,
                        void (*func)(vec_t*, vec_t*, vec_t*, int, int))
@@ -4545,3 +4550,224 @@ DO_HELPER_VR(vreplgr2vr_b, 8, helper_vr, do_replgr2vr)
 DO_HELPER_VR(vreplgr2vr_h, 16, helper_vr, do_replgr2vr)
 DO_HELPER_VR(vreplgr2vr_w, 32, helper_vr, do_replgr2vr)
 DO_HELPER_VR(vreplgr2vr_d, 64, helper_vr, do_replgr2vr)
+
+static void helper_vreplve(CPULoongArchState *env,
+                           uint32_t vd, uint32_t vj, uint32_t rk, int bit,
+                           void (*func)(vec_t*, vec_t*, uint64_t, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(Vd, Vj, env->gpr[rk], bit, i);
+    }
+}
+
+static void helper_vreplvei(CPULoongArchState *env,
+                            uint32_t vd, uint32_t vj, uint32_t imm, int bit,
+                            void (*func)(vec_t*, vec_t*, uint64_t, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    for (i = 0; i < LSX_LEN/bit; i++) {
+        func(Vd, Vj, imm, bit, i);
+    }
+}
+
+static void do_vreplve(vec_t *Vd, vec_t *Vj, uint64_t value, int bit, int n)
+{
+    uint32_t index = value % (LSX_LEN/bit);
+    switch (bit) {
+    case 8:
+        Vd->B[n] = Vj->B[index];
+        break;
+    case 16:
+        Vd->H[n] = Vj->H[index];
+        break;
+    case 32:
+        Vd->W[n] = Vj->W[index];
+        break;
+    case 64:
+        Vd->D[n] = Vj->D[index];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VV_R(vreplve_b, 8, helper_vreplve, do_vreplve)
+DO_HELPER_VV_R(vreplve_h, 16, helper_vreplve, do_vreplve)
+DO_HELPER_VV_R(vreplve_w, 32, helper_vreplve, do_vreplve)
+DO_HELPER_VV_R(vreplve_d, 64, helper_vreplve, do_vreplve)
+DO_HELPER_VV_I(vreplvei_b, 8, helper_vreplvei, do_vreplve)
+DO_HELPER_VV_I(vreplvei_h, 16, helper_vreplvei, do_vreplve)
+DO_HELPER_VV_I(vreplvei_w, 32, helper_vreplvei, do_vreplve)
+DO_HELPER_VV_I(vreplvei_d, 64, helper_vreplvei, do_vreplve)
+
+void helper_vbsll_v(CPULoongArchState *env,
+                    uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    uint32_t idx, i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t tmp;
+
+    tmp.D[0] = Vd->D[0];
+    tmp.D[1] = Vd->D[1];
+    idx = (imm & 0xf);
+    for(i = 0; i < 16; i++) {
+        tmp.B[i]  = (i < idx) ? 0 : Vj->B[i - idx];
+    }
+    Vd->D[0] = tmp.D[0];
+    Vd->D[1] = tmp.D[1];
+}
+
+void helper_vbsrl_v(CPULoongArchState *env,
+                    uint32_t vd, uint32_t vj, uint32_t imm)
+{
+    uint32_t idx, i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+
+    idx = (imm & 0xf);
+    for(i = 0; i < 16; i++) {
+        Vd->B[i]  = (i + idx > 15) ? 0 : Vj->B[i + idx];
+    }
+}
+
+static void helper_vvv_c(CPULoongArchState *env,
+                        uint32_t vd, uint32_t vj, uint32_t vk, int bit,
+                        void (*func)(vec_t*, vec_t*, vec_t*, int, int))
+{
+    int i;
+    vec_t *Vd = &(env->fpr[vd].vec);
+    vec_t *Vj = &(env->fpr[vj].vec);
+    vec_t *Vk = &(env->fpr[vk].vec);
+
+    vec_t temp;
+    temp.D[0] = 0;
+    temp.D[1] = 0;
+
+    for (i = 0; i < LSX_LEN/bit/2; i++) {
+        func(&temp, Vj, Vk, bit, i);
+    }
+    Vd->D[0] = temp.D[0];
+    Vd->D[1] = temp.D[1];
+}
+
+static void do_vpackev(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[2 * n + 1] = Vj->B[2 * n];
+        Vd->B[2 * n] = Vk->B[2 * n];
+        break;
+    case 16:
+        Vd->H[2 * n + 1] = Vj->H[2 * n];
+        Vd->H[2 * n] = Vk->H[2 * n];
+        break;
+    case 32:
+        Vd->W[2 * n + 1] = Vj->W[2 * n];
+        Vd->W[2 * n] = Vk->W[2 * n];
+        break;
+    case 64:
+        Vd->D[2 * n + 1] = Vj->D[2 * n];
+        Vd->D[2 * n] = Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vpackod(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[2 * n + 1] = Vj->B[2 * n + 1];
+        Vd->B[2 * n] = Vk->B[2 * n + 1];
+        break;
+    case 16:
+        Vd->H[2 * n + 1] = Vj->H[2 * n + 1];
+        Vd->H[2 * n] = Vk->H[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[2 * n + 1] = Vj->W[2 * n + 1];
+        Vd->W[2 * n] = Vk->W[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[2 * n + 1] = Vj->D[2 * n + 1];
+        Vd->D[2 * n] = Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vpackev_b, 8, helper_vvv_c, do_vpackev)
+DO_HELPER_VVV(vpackev_h, 16, helper_vvv_c, do_vpackev)
+DO_HELPER_VVV(vpackev_w, 32, helper_vvv_c, do_vpackev)
+DO_HELPER_VVV(vpackev_d, 64, helper_vvv_c, do_vpackev)
+DO_HELPER_VVV(vpackod_b, 8, helper_vvv_c, do_vpackod)
+DO_HELPER_VVV(vpackod_h, 16, helper_vvv_c, do_vpackod)
+DO_HELPER_VVV(vpackod_w, 32, helper_vvv_c, do_vpackod)
+DO_HELPER_VVV(vpackod_d, 64, helper_vvv_c, do_vpackod)
+
+static void do_vpickev(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n + 8] = Vj->B[2 * n];
+        Vd->B[n] = Vk->B[2 * n];
+        break;
+    case 16:
+        Vd->H[n + 4] = Vj->H[2 * n];
+        Vd->H[n] = Vk->H[2 * n];
+        break;
+    case 32:
+        Vd->W[n + 2] = Vj->W[2 * n];
+        Vd->W[n] = Vk->W[2 * n];
+        break;
+    case 64:
+        Vd->D[n + 1] = Vj->D[2 *n];
+        Vd->D[n] = Vk->D[2 * n];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+static void do_vpickod(vec_t *Vd, vec_t *Vj, vec_t *Vk, int bit, int n)
+{
+    switch (bit) {
+    case 8:
+        Vd->B[n + 8] = Vj->B[2 * n + 1];
+        Vd->B[n] = Vk->B[2 * n + 1];
+        break;
+    case 16:
+        Vd->H[n + 4] = Vj->H[2 * n + 1];
+        Vd->H[n] = Vk->H[2 * n + 1];
+        break;
+    case 32:
+        Vd->W[n + 2] = Vj->W[2 * n + 1];
+        Vd->W[n] = Vk->W[2 * n + 1];
+        break;
+    case 64:
+        Vd->D[n + 1] = Vj->D[2 *n + 1];
+        Vd->D[n] = Vk->D[2 * n + 1];
+        break;
+    default:
+        g_assert_not_reached();
+    }
+}
+
+DO_HELPER_VVV(vpickev_b, 8, helper_vvv_c, do_vpickev)
+DO_HELPER_VVV(vpickev_h, 16, helper_vvv_c, do_vpickev)
+DO_HELPER_VVV(vpickev_w, 32, helper_vvv_c, do_vpickev)
+DO_HELPER_VVV(vpickev_d, 64, helper_vvv_c, do_vpickev)
+DO_HELPER_VVV(vpickod_b, 8, helper_vvv_c, do_vpickod)
+DO_HELPER_VVV(vpickod_h, 16, helper_vvv_c, do_vpickod)
+DO_HELPER_VVV(vpickod_w, 32, helper_vvv_c, do_vpickod)
+DO_HELPER_VVV(vpickod_d, 64, helper_vvv_c, do_vpickod)
-- 
2.31.1


