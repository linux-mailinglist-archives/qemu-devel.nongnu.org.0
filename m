Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A997E6CB4BA
	for <lists+qemu-devel@lfdr.de>; Tue, 28 Mar 2023 05:16:24 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pgzg7-0007P7-S1; Mon, 27 Mar 2023 23:07:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1pgzg0-0007Iq-6h
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:07:12 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1pgzfx-0000pU-5j
 for qemu-devel@nongnu.org; Mon, 27 Mar 2023 23:07:11 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxMI_QWSJkm9oSAA--.29124S3;
 Tue, 28 Mar 2023 11:06:56 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Dxyr24WSJkZukOAA--.10252S42; 
 Tue, 28 Mar 2023 11:06:56 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org
Subject: [RFC PATCH v2 40/44] target/loongarch: Implement vreplve vpack vpick
Date: Tue, 28 Mar 2023 11:06:27 +0800
Message-Id: <20230328030631.3117129-41-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230328030631.3117129-1-gaosong@loongson.cn>
References: <20230328030631.3117129-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Dxyr24WSJkZukOAA--.10252S42
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvAXoW3ur1rZw13urWrCr4xArW5KFg_yoW8GF13Co
 W3A3y5Jr48GryrGr1j9a4DXF4kJa40yanrJayDZw4UGrWkJr17tr1fG34rAayrZ34Igr93
 GwsxCFs8tw13Xw1kn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7KY7ZEXasCq-sGcSsGvf
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
 target/loongarch/disas.c                    |  35 +++++
 target/loongarch/helper.h                   |  18 +++
 target/loongarch/insn_trans/trans_lsx.c.inc | 154 ++++++++++++++++++++
 target/loongarch/insns.decode               |  34 +++++
 target/loongarch/lsx_helper.c               |  92 ++++++++++++
 5 files changed, 333 insertions(+)

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
index cdc007a072..bf03a16afd 100644
--- a/target/loongarch/helper.h
+++ b/target/loongarch/helper.h
@@ -668,3 +668,21 @@ DEF_HELPER_3(vsetallnez_b, void, env, i32, i32)
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
index b2489537ef..66cb67a19c 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3331,3 +3331,157 @@ TRANS(vreplgr2vr_b, gvec_dup, MO_8)
 TRANS(vreplgr2vr_h, gvec_dup, MO_16)
 TRANS(vreplgr2vr_w, gvec_dup, MO_32)
 TRANS(vreplgr2vr_d, gvec_dup, MO_64)
+
+static bool trans_vreplvei_b(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_8,vreg_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.B((a->imm))),
+                         16, 16);
+    return true;
+}
+
+static bool trans_vreplvei_h(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_16, vreg_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.H((a->imm))),
+                         16, 16);
+    return true;
+}
+static bool trans_vreplvei_w(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_32, vreg_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.W((a->imm))),
+                        16, 16);
+    return true;
+}
+static bool trans_vreplvei_d(DisasContext *ctx, arg_vv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_gvec_dup_mem(MO_64, vreg_full_offset(a->vd),
+                         offsetof(CPULoongArchState,
+                                  fpr[a->vj].vreg.D((a->imm))),
+                         16, 16);
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
+    func(t2, t1, vreg_full_offset(a->vj));
+    tcg_gen_gvec_dup_i64(vece, vreg_full_offset(a->vd), 16, 16, t2);
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
+    TCGv_i64 desthigh, destlow, high, low, t;
+
+    CHECK_SXE;
+
+    desthigh = tcg_temp_new_i64();
+    destlow = tcg_temp_new_i64();
+    high = tcg_temp_new_i64();
+    low = tcg_temp_new_i64();
+    t = tcg_constant_i64(0);
+
+    tcg_gen_ld_i64(high, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(1)));
+    tcg_gen_ld_i64(low, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(0)));
+
+    ofs = ((a->imm) & 0xf) * 8;
+    if (ofs < 64) {
+        tcg_gen_extract2_i64(desthigh, low, high, 64 -ofs);
+        tcg_gen_shli_i64(destlow, low, ofs);
+    } else {
+        tcg_gen_shli_i64(desthigh, low, ofs -64);
+        tcg_gen_mov_i64(destlow, t);
+    }
+
+    tcg_gen_st_i64(desthigh, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vd].vreg.D(1)));
+    tcg_gen_st_i64(destlow, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vd].vreg.D(0)));
+
+    return true;
+}
+
+static bool trans_vbsrl_v(DisasContext *ctx, arg_vv_i *a)
+{
+    TCGv_i64 desthigh, destlow, high, low, t;
+    int ofs;
+
+    CHECK_SXE;
+
+    desthigh = tcg_temp_new_i64();
+    destlow = tcg_temp_new_i64();
+    high = tcg_temp_new_i64();
+    low = tcg_temp_new_i64();
+    t = tcg_constant_i64(0);
+
+    tcg_gen_ld_i64(high, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(1)));
+    tcg_gen_ld_i64(low, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(0)));
+
+    ofs = ((a->imm) & 0xf) * 8;
+    if (ofs < 64) {
+        tcg_gen_extract2_i64(destlow, low, high, ofs);
+        tcg_gen_shri_i64(desthigh, high, ofs);
+    } else {
+        tcg_gen_shri_i64(destlow, high, ofs -64);
+        tcg_gen_mov_i64(desthigh, t);
+    }
+
+    tcg_gen_st_i64(desthigh, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vd].vreg.D(1)));
+    tcg_gen_st_i64(destlow, cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vd].vreg.D(0)));
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
index 996312d9b2..b8e0aa9d3b 100644
--- a/target/loongarch/lsx_helper.c
+++ b/target/loongarch/lsx_helper.c
@@ -3029,3 +3029,95 @@ SETALLNEZ(vsetallnez_b, 8, B)
 SETALLNEZ(vsetallnez_h, 16, H)
 SETALLNEZ(vsetallnez_w, 32, W)
 SETALLNEZ(vsetallnez_d, 64, D)
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
+    Vd->D(0) = temp.D(0);                                \
+    Vd->D(1) = temp.D(1);                                \
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
+    Vd->D(0) = temp.D(0);                                \
+    Vd->D(1) = temp.D(1);                                \
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
+    Vd->D(0) = temp.D(0);                                \
+    Vd->D(1) = temp.D(1);                                \
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
+    Vd->D(0) = temp.D(0);                                \
+    Vd->D(1) = temp.D(1);                                \
+}
+
+VPICKOD(vpickod_b, 16, B)
+VPICKOD(vpickod_h, 32, H)
+VPICKOD(vpickod_w, 64, W)
+VPICKOD(vpickod_d, 128, D)
-- 
2.31.1


