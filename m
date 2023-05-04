Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B27346F6C13
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 14:36:43 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puY4t-0001xj-Rh; Thu, 04 May 2023 08:28:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY4p-0001vv-2o
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:51 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY4k-00033O-CG
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:28:50 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8AxFunwpFNk2KAEAA--.7549S3;
 Thu, 04 May 2023 20:28:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S41; 
 Thu, 04 May 2023 20:28:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 39/44] target/loongarch: Implement vreplve vpack vpick
Date: Thu,  4 May 2023 20:28:05 +0800
Message-Id: <20230504122810.4094787-40-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S41
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3KrWfZFWrXr1UAr4DuryDKFg_yoW8Jw4xXo
 W3G3y5Jw48GryrCr1j9a4DXF4DJ340yanrJa98Zw4UGFW8Jr17tr1fGw1rAayfZ340gr93
 JwsFkF45tw1Yqw1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
 J3Ic02F40EFcxC0VAKzVAqx4xG6I80ebIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJU
 UUqv1xkIjI8I6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64
 kEwVA0rcxSw2x7M28EF7xvwVC0I7IYx2IY67AKxVWDJVCq3wA2z4x0Y4vE2Ix0cI8IcVCY
 1x0267AKxVW8Jr0_Cr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6x
 kF7I0E14v26rxl6s0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l57IF6xkI12xvs2x26I8E
 6xACxx1l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWrMcvjeVCFs4IE7x
 kEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
 6cx26rWl4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x
 8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1Y6r17MIIYrxkI7VAKI48JMIIF0xvE
 2Ix0cI8IcVAFwI0_Ar0_tr1lIxAIcVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwCI42IY6x
 AIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Cr0_Gr1UMIIF0xvEx4A2jsIE
 c7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zRVWlkUUUUU=
Received-SPF: pass client-ip=114.242.206.163; envelope-from=gaosong@loongson.cn;
 helo=loongson.cn
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This patch includes:
- VREPLVE[I].{B/H/W/D};
- VBSLL.V, VBSRL.V;
- VPACK{EV/OD}.{B/H/W/D};
- VPICK{EV/OD}.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  35 +++++
 target/loongarch/helper.h                   |  18 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 144 ++++++++++++++++++++
 target/loongarch/insns.decode               |  34 +++++
 target/loongarch/lsx_helper.c               |  88 ++++++++++++
 5 files changed, 319 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index 7255a2aa4f..c6cf782725 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -833,6 +833,11 @@ static void output_vr(DisasContext *ctx, arg_vr *a, const char *mnemonic)
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
@@ -1594,3 +1599,33 @@ INSN_LSX(vreplgr2vr_b,     vr)
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
index 8eb2738cd0..51ad694be2 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -653,3 +653,21 @@ DEF_HELPER_3(vsetallnez_b, void, env, i32, i32)
 DEF_HELPER_3(vsetallnez_h, void, env, i32, i32)
 DEF_HELPER_3(vsetallnez_w, void, env, i32, i32)
 DEF_HELPER_3(vsetallnez_d, void, env, i32, i32)
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
index e722b79bea..1146ace1b7 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3933,3 +3933,147 @@ TRANS(vreplgr2vr_b, gvec_dup, MO_8)
 TRANS(vreplgr2vr_h, gvec_dup, MO_16)
 TRANS(vreplgr2vr_w, gvec_dup, MO_32)
 TRANS(vreplgr2vr_d, gvec_dup, MO_64)
+
+static bool trans_vreplvei_b(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_8,vec_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.B((a->imm))),
+                         16, ctx->vl/8);
+    return true;
+}
+
+static bool trans_vreplvei_h(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_16, vec_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.H((a->imm))),
+                         16, ctx->vl/8);
+    return true;
+}
+static bool trans_vreplvei_w(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_32, vec_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.W((a->imm))),
+                        16, ctx->vl/8);
+    return true;
+}
+static bool trans_vreplvei_d(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_64, vec_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.D((a->imm))),
+                         16, ctx->vl/8);
+    return true;
+}
+
+static bool gen_vreplve(DisasContext *ctx, arg_vvr *a, int vece, int bit,
+                        void (*func)(TCGv_i64, TCGv_ptr, tcg_target_long))
+{
+    TCGv_i64 t0 = tcg_temp_new_i64();
+    TCGv_ptr t1 = tcg_temp_new_ptr();
+    TCGv_i64 t2 = tcg_temp_new_i64();
+
+    CHECK_SXE;
+
+    tcg_gen_andi_i64(t0, gpr_src(ctx, a->rk, EXT_NONE), (LSX_LEN/bit) -1);
+    tcg_gen_shli_i64(t0, t0, vece);
+    if (HOST_BIG_ENDIAN) {
+        tcg_gen_xori_i64(t0, t0, vece << ((LSX_LEN/bit) -1));
+    }
+
+    tcg_gen_trunc_i64_ptr(t1, t0);
+    tcg_gen_add_ptr(t1, t1, cpu_env);
+    func(t2, t1, vec_full_offset(a->vj));
+    tcg_gen_gvec_dup_i64(vece, vec_full_offset(a->vd), 16, ctx->vl/8, t2);
+
+    return true;
+}
+
+TRANS(vreplve_b, gen_vreplve, MO_8,  8, tcg_gen_ld8u_i64)
+TRANS(vreplve_h, gen_vreplve, MO_16, 16, tcg_gen_ld16u_i64)
+TRANS(vreplve_w, gen_vreplve, MO_32, 32, tcg_gen_ld32u_i64)
+TRANS(vreplve_d, gen_vreplve, MO_64, 64, tcg_gen_ld_i64)
+
+static bool trans_vbsll_v(DisasContext *ctx, arg_vv_i *a)
+{
+    int ofs;
+    TCGv_i64 desthigh, destlow, high, low;
+
+    CHECK_SXE;
+
+    desthigh = tcg_temp_new_i64();
+    destlow = tcg_temp_new_i64();
+    high = tcg_temp_new_i64();
+    low = tcg_temp_new_i64();
+
+    get_vreg64(low, a->vj, 0);
+
+    ofs = ((a->imm) & 0xf) * 8;
+    if (ofs < 64) {
+        get_vreg64(high, a->vj, 1);
+        tcg_gen_extract2_i64(desthigh, low, high, 64 - ofs);
+        tcg_gen_shli_i64(destlow, low, ofs);
+    } else {
+        tcg_gen_shli_i64(desthigh, low, ofs - 64);
+        destlow = tcg_constant_i64(0);
+    }
+
+    set_vreg64(desthigh, a->vd, 1);
+    set_vreg64(destlow, a->vd, 0);
+
+    return true;
+}
+
+static bool trans_vbsrl_v(DisasContext *ctx, arg_vv_i *a)
+{
+    TCGv_i64 desthigh, destlow, high, low;
+    int ofs;
+
+    CHECK_SXE;
+
+    desthigh = tcg_temp_new_i64();
+    destlow = tcg_temp_new_i64();
+    high = tcg_temp_new_i64();
+    low = tcg_temp_new_i64();
+
+    get_vreg64(high, a->vj, 1);
+
+    ofs = ((a->imm) & 0xf) * 8;
+    if (ofs < 64) {
+        get_vreg64(low, a->vj, 0);
+        tcg_gen_extract2_i64(destlow, low, high, ofs);
+        tcg_gen_shri_i64(desthigh, high, ofs);
+    } else {
+        tcg_gen_shri_i64(destlow, high, ofs - 64);
+        desthigh = tcg_constant_i64(0);
+    }
+
+    set_vreg64(desthigh, a->vd, 1);
+    set_vreg64(destlow, a->vd, 0);
+
+    return true;
+}
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
index d1d255ab82..ab9e9e422f 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -499,6 +499,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vr_i         vd rj imm
 &rv_i         rd vj imm
 &vr           vd rj
+&vvr          vd vj rk
 
 #
 # LSX Formats
@@ -506,6 +507,8 @@ dbcl             0000 00000010 10101 ...............      @i15
 @vv               .... ........ ..... ..... vj:5 vd:5    &vv
 @cv            .... ........ ..... ..... vj:5 .. cd:3    &cv
 @vvv               .... ........ ..... vk:5 vj:5 vd:5    &vvv
+@vv_ui1      .... ........ ..... .... imm:1 vj:5 vd:5    &vv_i
+@vv_ui2       .... ........ ..... ... imm:2 vj:5 vd:5    &vv_i
 @vv_ui3        .... ........ ..... .. imm:3 vj:5 vd:5    &vv_i
 @vv_ui4         .... ........ ..... . imm:4 vj:5 vd:5    &vv_i
 @vv_ui5           .... ........ ..... imm:5 vj:5 vd:5    &vv_i
@@ -524,6 +527,7 @@ dbcl             0000 00000010 10101 ...............      @i15
 @rv_ui2       .... ........ ..... ... imm:2 vj:5 rd:5    &rv_i
 @rv_ui1      .... ........ ..... .... imm:1 vj:5 rd:5    &rv_i
 @vr               .... ........ ..... ..... rj:5 vd:5    &vr
+@vvr               .... ........ ..... rk:5 vj:5 vd:5    &vvr
 
 vadd_b           0111 00000000 10100 ..... ..... .....    @vvv
 vadd_h           0111 00000000 10101 ..... ..... .....    @vvv
@@ -1197,3 +1201,33 @@ vreplgr2vr_b     0111 00101001 11110 00000 ..... .....    @vr
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
index 2fda1a72cb..d5e1a1231d 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -2766,3 +2766,91 @@ SETALLNEZ(vsetallnez_b, MO_8)
 SETALLNEZ(vsetallnez_h, MO_16)
 SETALLNEZ(vsetallnez_w, MO_32)
 SETALLNEZ(vsetallnez_d, MO_64)
+
+#define VPACKEV(NAME, BIT, E)                            \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        temp.E(2 * i + 1) = Vj->E(2 * i);                \
+        temp.E(2 *i) = Vk->E(2 * i);                     \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VPACKEV(vpackev_b, 16, B)
+VPACKEV(vpackev_h, 32, H)
+VPACKEV(vpackev_w, 64, W)
+VPACKEV(vpackev_d, 128, D)
+
+#define VPACKOD(NAME, BIT, E)                            \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        temp.E(2 * i + 1) = Vj->E(2 * i + 1);            \
+        temp.E(2 * i) = Vk->E(2 * i + 1);                \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VPACKOD(vpackod_b, 16, B)
+VPACKOD(vpackod_h, 32, H)
+VPACKOD(vpackod_w, 64, W)
+VPACKOD(vpackod_d, 128, D)
+
+#define VPICKEV(NAME, BIT, E)                            \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        temp.E(i + LSX_LEN/BIT) = Vj->E(2 * i);          \
+        temp.E(i) = Vk->E(2 * i);                        \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VPICKEV(vpickev_b, 16, B)
+VPICKEV(vpickev_h, 32, H)
+VPICKEV(vpickev_w, 64, W)
+VPICKEV(vpickev_d, 128, D)
+
+#define VPICKOD(NAME, BIT, E)                            \
+void HELPER(NAME)(CPULoongArchState *env,                \
+                  uint32_t vd, uint32_t vj, uint32_t vk) \
+{                                                        \
+    int i;                                               \
+    VReg temp;                                           \
+    VReg *Vd = &(env->fpr[vd].vreg);                     \
+    VReg *Vj = &(env->fpr[vj].vreg);                     \
+    VReg *Vk = &(env->fpr[vk].vreg);                     \
+                                                         \
+    for (i = 0; i < LSX_LEN/BIT; i++) {                  \
+        temp.E(i + LSX_LEN/BIT) = Vj->E(2 * i + 1);      \
+        temp.E(i) = Vk->E(2 * i + 1);                    \
+    }                                                    \
+    *Vd = temp;                                          \
+}
+
+VPICKOD(vpickod_b, 16, B)
+VPICKOD(vpickod_h, 32, H)
+VPICKOD(vpickod_w, 64, W)
+VPICKOD(vpickod_d, 128, D)
-- 
2.31.1


