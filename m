Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EA2D96F715A
	for <lists+qemu-devel@lfdr.de>; Thu,  4 May 2023 19:43:40 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pucpN-0000ND-RF; Thu, 04 May 2023 13:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <gaosong@loongson.cn>)
 id 1puY6R-0005JZ-Iz
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:30:31 -0400
Received: from mail.loongson.cn ([114.242.206.163] helo=loongson.cn)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gaosong@loongson.cn>) id 1puY6N-0003UG-HU
 for qemu-devel@nongnu.org; Thu, 04 May 2023 08:30:31 -0400
Received: from loongson.cn (unknown [10.2.5.185])
 by gateway (Coremail) with SMTP id _____8BxqOnwpFNk2aAEAA--.7633S3;
 Thu, 04 May 2023 20:28:32 +0800 (CST)
Received: from localhost.localdomain (unknown [10.2.5.185])
 by localhost.localdomain (Coremail) with SMTP id
 AQAAf8Cx77PapFNk1uxJAA--.5674S40; 
 Thu, 04 May 2023 20:28:31 +0800 (CST)
From: Song Gao <gaosong@loongson.cn>
To: qemu-devel@nongnu.org
Cc: richard.henderson@linaro.org,
	gaosong@loongson.cn
Subject: [PATCH v5 38/44] target/loongarch: Implement vinsgr2vr vpickve2gr
 vreplgr2vr
Date: Thu,  4 May 2023 20:28:04 +0800
Message-Id: <20230504122810.4094787-39-gaosong@loongson.cn>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20230504122810.4094787-1-gaosong@loongson.cn>
References: <20230504122810.4094787-1-gaosong@loongson.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: AQAAf8Cx77PapFNk1uxJAA--.5674S40
X-CM-SenderInfo: 5jdr20tqj6z05rqj20fqof0/
X-Coremail-Antispam: 1Uk129KBjvJXoW3GF48XrWrZr4rCr4kZr1rXrb_yoW3Zryfpr
 1Fv347Cr40qr1fXa4vkw15WF15Kr13Cr1j93sIqw109Fy7JF1DJF4rJrWj9rWUXF4kWay8
 KFykAFyUGFWrt37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUj1kv1TuYvTs0mT0YCTnIWj
 qI5I8CrVACY4xI64kE6c02F40Ex7xfYxn0WfASr-VFAUDa7-sFnT9fnUUIcSsGvfJTRUUU
 bnxFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4
 AK67xGY2AK021l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF
 7I0E14v26r4UJVWxJr1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7
 CjxVAFwI0_GcCE3s1le2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF0cIa020Ex4CE
 44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E74AGY7Cv6cx26rWlOx8S6xCaFVCjc4
 AY6r1j6r4UM4x0Y48IcxkI7VAKI48JMxAIw28IcxkI7VAKI48JMxAIw28IcVCjz48v1sIE
 Y20_WwCFx2IqxVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E74
 80Y4vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jrv_JF1lIxkGc2Ij64vIr41lIxAIcVC0
 I7IYx2IY67AKxVW7JVWDJwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UMIIF0xvE42
 xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWxJVW8Jr1lIxAIcVC2z280aVCY
 1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7xRE6wZ7UUUUU==
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
- VINSGR2VR.{B/H/W/D};
- VPICKVE2GR.{B/H/W/D}[U];
- VREPLGR2VR.{B/H/W/D}.

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Song Gao <gaosong@loongson.cn>
---
 target/loongarch/disas.c                    |  33 ++++++
 target/loongarch/insn_trans/trans_lsx.c.inc | 110 ++++++++++++++++++++
 target/loongarch/insns.decode               |  30 ++++++
 3 files changed, 173 insertions(+)

diff --git a/target/loongarch/disas.c b/target/loongarch/disas.c
index ecf0c7b577..7255a2aa4f 100644
--- a/target/loongarch/disas.c
+++ b/target/loongarch/disas.c
@@ -818,6 +818,21 @@ static void output_vvvv(DisasContext *ctx, arg_vvvv *a, const char *mnemonic)
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
@@ -1561,3 +1576,21 @@ INSN_LSX(vsetallnez_b,     cv)
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
diff --git a/target/loongarch/insn_trans/trans_lsx.c.inc b/target/loongarch/insn_trans/trans_lsx.c.inc
index 964c3c47bf..e722b79bea 100644
--- a/target/loongarch/insn_trans/trans_lsx.c.inc
+++ b/target/loongarch/insn_trans/trans_lsx.c.inc
@@ -3823,3 +3823,113 @@ TRANS(vsetallnez_b, gen_cv, gen_helper_vsetallnez_b)
 TRANS(vsetallnez_h, gen_cv, gen_helper_vsetallnez_h)
 TRANS(vsetallnez_w, gen_cv, gen_helper_vsetallnez_w)
 TRANS(vsetallnez_d, gen_cv, gen_helper_vsetallnez_d)
+
+static bool trans_vinsgr2vr_b(DisasContext *ctx, arg_vr_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_st8_i64(cpu_gpr[a->rj], cpu_env,
+                    offsetof(CPULoongArchState, fpr[a->vd].vreg.B(a->imm)));
+    return true;
+}
+
+static bool trans_vinsgr2vr_h(DisasContext *ctx, arg_vr_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_st16_i64(cpu_gpr[a->rj], cpu_env,
+                    offsetof(CPULoongArchState, fpr[a->vd].vreg.H(a->imm)));
+    return true;
+}
+
+static bool trans_vinsgr2vr_w(DisasContext *ctx, arg_vr_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_st32_i64(cpu_gpr[a->rj], cpu_env,
+                     offsetof(CPULoongArchState, fpr[a->vd].vreg.W(a->imm)));
+    return true;
+}
+
+static bool trans_vinsgr2vr_d(DisasContext *ctx, arg_vr_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_st_i64(cpu_gpr[a->rj], cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vd].vreg.D(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_b(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld8s_i64(cpu_gpr[a->rd], cpu_env,
+                     offsetof(CPULoongArchState, fpr[a->vj].vreg.B(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_h(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld16s_i64(cpu_gpr[a->rd], cpu_env,
+                      offsetof(CPULoongArchState, fpr[a->vj].vreg.H(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_w(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld32s_i64(cpu_gpr[a->rd], cpu_env,
+                      offsetof(CPULoongArchState, fpr[a->vj].vreg.W(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_d(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld_i64(cpu_gpr[a->rd], cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_bu(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld8u_i64(cpu_gpr[a->rd], cpu_env,
+                     offsetof(CPULoongArchState, fpr[a->vj].vreg.B(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_hu(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld16u_i64(cpu_gpr[a->rd], cpu_env,
+                      offsetof(CPULoongArchState, fpr[a->vj].vreg.H(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_wu(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld32u_i64(cpu_gpr[a->rd], cpu_env,
+                      offsetof(CPULoongArchState, fpr[a->vj].vreg.W(a->imm)));
+    return true;
+}
+
+static bool trans_vpickve2gr_du(DisasContext *ctx, arg_rv_i *a)
+{
+    CHECK_SXE;
+    tcg_gen_ld_i64(cpu_gpr[a->rd], cpu_env,
+                   offsetof(CPULoongArchState, fpr[a->vj].vreg.D(a->imm)));
+    return true;
+}
+
+static bool gvec_dup(DisasContext *ctx, arg_vr *a, MemOp mop)
+{
+    CHECK_SXE;
+
+    tcg_gen_gvec_dup_i64(mop, vec_full_offset(a->vd),
+                         16, ctx->vl/8, cpu_gpr[a->rj]);
+    return true;
+}
+
+TRANS(vreplgr2vr_b, gvec_dup, MO_8)
+TRANS(vreplgr2vr_h, gvec_dup, MO_16)
+TRANS(vreplgr2vr_w, gvec_dup, MO_32)
+TRANS(vreplgr2vr_d, gvec_dup, MO_64)
diff --git a/target/loongarch/insns.decode b/target/loongarch/insns.decode
index d8feeadc41..d1d255ab82 100644
--- a/target/loongarch/insns.decode
+++ b/target/loongarch/insns.decode
@@ -496,6 +496,9 @@ dbcl             0000 00000010 10101 ...............      @i15
 &vv_i         vd vj imm
 &vvvv         vd vj vk va
 &vvv_fcond    vd vj vk fcond
+&vr_i         vd rj imm
+&rv_i         rd vj imm
+&vr           vd rj
 
 #
 # LSX Formats
@@ -512,6 +515,15 @@ dbcl             0000 00000010 10101 ...............      @i15
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
@@ -1167,3 +1179,21 @@ vsetallnez_b     0111 00101001 11001 01100 ..... 00 ...   @cv
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
-- 
2.31.1


