Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CC6016117CB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:43:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQl-0006rw-FS; Fri, 28 Oct 2022 12:42:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQA-0001dm-7a; Fri, 28 Oct 2022 12:41:28 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQ5-0008Ky-Io; Fri, 28 Oct 2022 12:41:24 -0400
Received: by mail-oi1-x236.google.com with SMTP id g10so6679922oif.10;
 Fri, 28 Oct 2022 09:41:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4PdblXmKrwDvcs6KxN1I8n8aZ9nDoE5bUtGBz1p9NeE=;
 b=OWEz79mdtcdVAM8NyWiJv3p8nvlNeIDAjCS6+vz2zfqKdwKHeaI3Y0EdNf70Ju2Lsu
 8Qih4gz5I43syr3EV4yX4a5W2tixAP+QWMwKprR78pte91GnoZmx5pTEC/cj50J3OqaR
 MAAGW/fd7cxZ1OY8jhcDeeW0dAesGVuyWlub040GzirCTLC0z5xC8mWBDADaSJ7A9qKv
 ietRBr1/bwlYZVqwMTJmPM52OymEy1S4vCGbShY5e5UVZJJ3s6Y/XhhfeXhGhzmqyMaz
 K2wJlzxE8YXY1Qxc2KGjTeXbk9nwN6SPNZpawsbgXX0vVHvVRSC0GyovTE5YJAMjZKCR
 cUkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4PdblXmKrwDvcs6KxN1I8n8aZ9nDoE5bUtGBz1p9NeE=;
 b=PqMzaPJWGKkubn9EL7373nsuUrI0RBHym2wxO+XxjG/mC35+Jj8FH0Q/G2VbIurdwT
 /mr64Ty5egzSzKCOkapMCRtMZ2juXlk4+O8/25h2AS9mryuZ9i+WiaJGdrMoUP+ZO24D
 rCCIOKgyOoP26wTjh7qTl5Xfq4qRR/CMcyFKJhA19NxsVHMUv/i8/vvP2LHbeSzOztLZ
 Hfp3V9uDDmAFcEej7KhRVe4Hd7bsELPnWlHKosjMkBJUIWA7jWc67PWK4QBnmRvSn29C
 AS4L/+546FRHqsNXumCElJq2SJzyj1fo7CPw43dA6L5iCoQlX4ikYHan3kArOWOGk2XR
 890Q==
X-Gm-Message-State: ACrzQf25KY7ERJoCdWunIaIsNWzv/y2gadULwEKPZaFtLflvxWfDVpqW
 /3/yR/qxUvDA98iAyuQBjmjKdeeXCN+szg==
X-Google-Smtp-Source: AMsMyM7IMLGDcrzpH/UxsLcfA0pNU3UEZw+jRD8Osu7DkVf2fCbGwv7Xn6DKyoLq/ftSib+NoRpZfg==
X-Received: by 2002:aca:f0c2:0:b0:34f:df0b:2de9 with SMTP id
 o185-20020acaf0c2000000b0034fdf0b2de9mr8687783oih.245.1666975278942; 
 Fri, 28 Oct 2022 09:41:18 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:18 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 18/62] target/ppc: Use gvec to decode XVTSTDC[DS]P
Date: Fri, 28 Oct 2022 13:39:07 -0300
Message-Id: <20221028163951.810456-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Used gvec to translate XVTSTDCSP and XVTSTDCDP.

xvtstdcsp:
rept    loop    imm     master version  prev version        current version
25      4000    0       0,206200        0,040730 (-80.2%)    0,040740 (-80.2%)
25      4000    1       0,205120        0,053650 (-73.8%)    0,053510 (-73.9%)
25      4000    3       0,206160        0,058630 (-71.6%)    0,058570 (-71.6%)
25      4000    51      0,217110        0,191490 (-11.8%)    0,192320 (-11.4%)
25      4000    127     0,206160        0,191490 (-7.1%)     0,192640 (-6.6%)
8000    12      0       1,234719        0,418833 (-66.1%)    0,386365 (-68.7%)
8000    12      1       1,232417        1,435979 (+16.5%)    1,462792 (+18.7%)
8000    12      3       1,232760        1,766073 (+43.3%)    1,743990 (+41.5%)
8000    12      51      1,239281        1,319562 (+6.5%)     1,423479 (+14.9%)
8000    12      127     1,231708        1,315760 (+6.8%)     1,426667 (+15.8%)

xvtstdcdp:
rept    loop    imm     master version  prev version    current version
25      4000    0       0,159930        0,040830 (-74.5%)    0,040610 (-74.6%)
25      4000    1       0,160640        0,053670 (-66.6%)    0,053480 (-66.7%)
25      4000    3       0,160020        0,063030 (-60.6%)    0,062960 (-60.7%)
25      4000    51      0,160410        0,128620 (-19.8%)    0,127470 (-20.5%)
25      4000    127     0,160330        0,127670 (-20.4%)    0,128690 (-19.7%)
8000    12      0       1,190365        0,422146 (-64.5%)    0,388417 (-67.4%)
8000    12      1       1,191292        1,445312 (+21.3%)    1,428698 (+19.9%)
8000    12      3       1,188687        1,980656 (+66.6%)    1,975354 (+66.2%)
8000    12      51      1,191250        1,264500 (+6.1%)     1,355083 (+13.8%)
8000    12      127     1,197313        1,266729 (+5.8%)     1,349156 (+12.7%)

Overall, these instructions are the hardest ones to measure performance
as the gvec implementation is affected by the immediate. Above there are
5 different scenarios when it comes to immediate and 2 when it comes to
rept/loop combination. The immediates scenarios are: all bits are 0
therefore the target register should just be changed to 0, with 1 bit
set, with 2 bits set in a combination the new implementation can deal
with using gvec, 4 bits set and the new implementation can't deal with
it using gvec and all bits set. The rept/loop scenarios are high loop
and low rept (so it should spend more time executing it than translating
it) and high rept low loop (so it should spend more time translating it
than executing this code).
These comparisons are between the upstream version, a previous similar
implementation and a one with a cleaner code(this one).
For a comparison with o previous different implementation:
<20221010191356.83659-13-lucas.araujo@eldorado.org.br>

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-13-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/translate/vsx-impl.c.inc | 167 ++++++++++++++++++++++++++--
 1 file changed, 157 insertions(+), 10 deletions(-)

diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index af410cbf1b..4deb29ee42 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -632,6 +632,8 @@ static void gen_mtvsrws(DisasContext *ctx)
 #define SGN_MASK_SP 0x8000000080000000ull
 #define EXP_MASK_DP  0x7FF0000000000000ull
 #define EXP_MASK_SP 0x7F8000007F800000ull
+#define FRC_MASK_DP (~(SGN_MASK_DP | EXP_MASK_DP))
+#define FRC_MASK_SP (~(SGN_MASK_SP | EXP_MASK_SP))
 
 #define VSX_SCALAR_MOVE(name, op, sgn_mask)                       \
 static void glue(gen_, name)(DisasContext *ctx)                   \
@@ -1112,23 +1114,168 @@ GEN_VSX_HELPER_X2(xscvhpdp, 0x16, 0x15, 0x10, PPC2_ISA300)
 GEN_VSX_HELPER_R2(xscvsdqp, 0x04, 0x1A, 0x0A, PPC2_ISA300)
 GEN_VSX_HELPER_X2(xscvspdp, 0x12, 0x14, 0, PPC2_VSX)
 
+/* test if +Inf */
+static void gen_is_pos_inf(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, exp_msk));
+}
+
+/* test if -Inf */
+static void gen_is_neg_inf(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk | exp_msk));
+}
+
+/* test if +Inf or -Inf */
+static void gen_is_any_inf(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_andc_vec(vece, b, b, tcg_constant_vec_matching(t, vece, sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, exp_msk));
+}
+
+/* test if +0 */
+static void gen_is_pos_zero(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+}
+
+/* test if -0 */
+static void gen_is_neg_zero(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk));
+}
+
+/* test if +0 or -0 */
+static void gen_is_any_zero(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_andc_vec(vece, b, b, tcg_constant_vec_matching(t, vece, sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_EQ, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+}
+
+/* test if +Denormal */
+static void gen_is_pos_denormal(unsigned vece, TCGv_vec t,
+                                TCGv_vec b, int64_t v)
+{
+    uint64_t frc_msk = (vece == MO_32) ? (uint32_t)FRC_MASK_SP : FRC_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_LEU, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, frc_msk));
+    tcg_gen_cmp_vec(TCG_COND_NE, vece, b, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+    tcg_gen_and_vec(vece, t, t, b);
+}
+
+/* test if -Denormal */
+static void gen_is_neg_denormal(unsigned vece, TCGv_vec t,
+                                TCGv_vec b, int64_t v)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    uint64_t frc_msk = (vece == MO_32) ? (uint32_t)FRC_MASK_SP : FRC_MASK_DP;
+    tcg_gen_cmp_vec(TCG_COND_LEU, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk | frc_msk));
+    tcg_gen_cmp_vec(TCG_COND_GTU, vece, b, b,
+                    tcg_constant_vec_matching(t, vece, sgn_msk));
+    tcg_gen_and_vec(vece, t, t, b);
+}
+
+/* test if +Denormal or -Denormal */
+static void gen_is_any_denormal(unsigned vece, TCGv_vec t,
+                                TCGv_vec b, int64_t v)
+{
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    uint64_t frc_msk = (vece == MO_32) ? (uint32_t)FRC_MASK_SP : FRC_MASK_DP;
+    tcg_gen_andc_vec(vece, b, b, tcg_constant_vec_matching(t, vece, sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_LE, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, frc_msk));
+    tcg_gen_cmp_vec(TCG_COND_NE, vece, b, b,
+                    tcg_constant_vec_matching(t, vece, 0));
+    tcg_gen_and_vec(vece, t, t, b);
+}
+
+/* test if NaN */
+static void gen_is_nan(unsigned vece, TCGv_vec t, TCGv_vec b, int64_t v)
+{
+    uint64_t exp_msk = (vece == MO_32) ? (uint32_t)EXP_MASK_SP : EXP_MASK_DP;
+    uint64_t sgn_msk = (vece == MO_32) ? (uint32_t)SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_and_vec(vece, b, b, tcg_constant_vec_matching(t, vece, ~sgn_msk));
+    tcg_gen_cmp_vec(TCG_COND_GT, vece, t, b,
+                    tcg_constant_vec_matching(t, vece, exp_msk));
+}
+
 static bool do_xvtstdc(DisasContext *ctx, arg_XX2_uim *a, unsigned vece)
 {
-    static const GVecGen2i op[] = {
-        {
-            .fnoi = gen_helper_XVTSTDCSP,
-            .vece = MO_32
-        },
-        {
-            .fnoi = gen_helper_XVTSTDCDP,
-            .vece = MO_64
-        },
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, 0
+    };
+
+    GVecGen2i op = {
+        .fnoi = (vece == MO_32) ? gen_helper_XVTSTDCSP : gen_helper_XVTSTDCDP,
+        .vece = vece,
+        .opt_opc = vecop_list
     };
 
     REQUIRE_VSX(ctx);
 
+    switch (a->uim) {
+    case 0:
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), true);
+        set_cpu_vsr(a->xt, tcg_constant_i64(0), false);
+        return true;
+    case ((1 << 0) | (1 << 1)):
+        /* test if +Denormal or -Denormal */
+        op.fniv = gen_is_any_denormal;
+        break;
+    case (1 << 0):
+        /* test if -Denormal */
+        op.fniv = gen_is_neg_denormal;
+        break;
+    case (1 << 1):
+        /* test if +Denormal */
+        op.fniv = gen_is_pos_denormal;
+        break;
+    case ((1 << 2) | (1 << 3)):
+        /* test if +0 or -0 */
+        op.fniv = gen_is_any_zero;
+        break;
+    case (1 << 2):
+        /* test if -0 */
+        op.fniv = gen_is_neg_zero;
+        break;
+    case (1 << 3):
+        /* test if +0 */
+        op.fniv = gen_is_pos_zero;
+        break;
+    case ((1 << 4) | (1 << 5)):
+        /* test if +Inf or -Inf */
+        op.fniv = gen_is_any_inf;
+        break;
+    case (1 << 4):
+        /* test if -Inf */
+        op.fniv = gen_is_neg_inf;
+        break;
+    case (1 << 5):
+        /* test if +Inf */
+        op.fniv = gen_is_pos_inf;
+        break;
+    case (1 << 6):
+        /* test if NaN */
+        op.fniv = gen_is_nan;
+        break;
+    }
     tcg_gen_gvec_2i(vsr_full_offset(a->xt), vsr_full_offset(a->xb),
-                    16, 16, (int32_t)(a->uim), &op[vece - MO_32]);
+                    16, 16, a->uim, &op);
 
     return true;
 }
-- 
2.37.3


