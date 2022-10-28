Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 257256117E3
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:46:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQh-00061F-CW; Fri, 28 Oct 2022 12:41:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPy-0000Vz-WC; Fri, 28 Oct 2022 12:41:23 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPv-0008Es-Pw; Fri, 28 Oct 2022 12:41:14 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13ae8117023so6858830fac.9; 
 Fri, 28 Oct 2022 09:41:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ppqz18mS5Svpmzs6DzgrMpVIEnsIWsMRP9qc7J5r1Vg=;
 b=ZcXKZRvC8Q/xNxQZQ+R0OP3+h83ZqD+Gps8y+5ExnAy0ZZi9n0t1mHAm2VZiCcCayB
 LZKRy8Y/2fpG+s3HN9ntsPnSZxmEjEZG8zWzKVGLiUtloc9hGIiTq1jNL1g6PLe4Q/UG
 m1S8BpJyVkCrSzlzehivZy6KnrHCG+OOLkBRMPSNHvvYadYvguiXmKrgUoDj86MR5NyW
 WS0IpwLvJ/BIN5bZJkeyMkDIoIxqIfE9I4Khh0eQbxTsgIc+Fm2BHXK3h5HigX+aV0iH
 oW0HzbuzzPjOGRqaS037nJpXWya1iS41y5EvTYfjC04tRV4JTGAQ7SBLMTjv1y4fsoLW
 /BzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ppqz18mS5Svpmzs6DzgrMpVIEnsIWsMRP9qc7J5r1Vg=;
 b=p0+UqizAjgRFEMGjl8Wsm36Bl8jbg4YIC46WZ6AHaq+yB9ZddUb3xMUQa2Sci2Nzfd
 m92LtH8twzvCChtWsCd/TsHa15WnMVAx1rY/j7DmNQJHC5S5+rIna+M/AcFS7ngDmMqR
 A4PjyJnG8+O1IIozgEchCXA1Axd8P/pJEJsA9JkSdZT7abNRCqwL2Snv5+qtKQkGWYv7
 Nw3J0s44YNN1qiJ4vcYgld4URYcLdRde3ByUOSyoAgQY9JYgxV77FGIK9VX+Bm1bifaL
 h5PoUuLbptVk9kHH1EZqTWCnD013OfFTYOwbnZNeMPpn2T3pLWOb0J+F+1J8WHxtSyeY
 T0pg==
X-Gm-Message-State: ACrzQf0+6MalZZixgpUJLMkQ70M6ytJY97jINRNACT1vLdcaLsO1VncH
 kQZl7We3txDTLmkzjfIRAEYWDipdcKdqMA==
X-Google-Smtp-Source: AMsMyM4z2RfhsFkr0iIcojtRD3JwxnpA+AbjrAcbf/Yiro9Y8I9RHzC/We7zBYRGYaR2vrsMzDKCXQ==
X-Received: by 2002:a05:6870:818c:b0:13b:8a11:82ed with SMTP id
 k12-20020a056870818c00b0013b8a1182edmr9767652oae.8.1666975268720; 
 Fri, 28 Oct 2022 09:41:08 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:06 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 15/62] target/ppc: Use gvec to decode XVCPSGN[SD]P
Date: Fri, 28 Oct 2022 13:39:04 -0300
Message-Id: <20221028163951.810456-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

Moved XVCPSGNSP and XVCPSGNDP to decodetree and used gvec to translate
them.

xvcpsgnsp:
rept    loop    master             patch
8       12500   0,00561400         0,00537900 (-4.2%)
25      4000    0,00562100         0,00400000 (-28.8%)
100     1000    0,00696900         0,00416300 (-40.3%)
500     200     0,02211900         0,00840700 (-62.0%)
2500    40      0,09328600         0,02728300 (-70.8%)
8000    12      0,27295300         0,06867800 (-74.8%)

xvcpsgndp:
rept    loop    master             patch
8       12500   0,00556300         0,00584200 (+5.0%)
25      4000    0,00482700         0,00431700 (-10.6%)
100     1000    0,00585800         0,00464400 (-20.7%)
500     200     0,01565300         0,00839700 (-46.4%)
2500    40      0,05766500         0,02430600 (-57.8%)
8000    12      0,19875300         0,07947100 (-60.0%)

Like the previous instructions there seemed to be a improvement on
translation time.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-10-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode            |   2 +
 target/ppc/translate/vsx-impl.c.inc | 109 ++++++++++++++--------------
 target/ppc/translate/vsx-ops.c.inc  |   3 -
 3 files changed, 55 insertions(+), 59 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 395339ce40..3594c0c960 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -762,6 +762,8 @@ XVNABSDP        111100 ..... 00000 ..... 111101001 ..   @XX2
 XVNABSSP        111100 ..... 00000 ..... 110101001 ..   @XX2
 XVNEGDP         111100 ..... 00000 ..... 111111001 ..   @XX2
 XVNEGSP         111100 ..... 00000 ..... 110111001 ..   @XX2
+XVCPSGNDP       111100 ..... ..... ..... 11110000 ...   @XX3
+XVCPSGNSP       111100 ..... ..... ..... 11010000 ...   @XX3
 
 ## VSX Scalar Multiply-Add Instructions
 
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index 8717e20d08..1c289238ec 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -729,62 +729,6 @@ VSX_SCALAR_MOVE_QP(xsnabsqp, OP_NABS, SGN_MASK_DP)
 VSX_SCALAR_MOVE_QP(xsnegqp, OP_NEG, SGN_MASK_DP)
 VSX_SCALAR_MOVE_QP(xscpsgnqp, OP_CPSGN, SGN_MASK_DP)
 
-#define VSX_VECTOR_MOVE(name, op, sgn_mask)                      \
-static void glue(gen_, name)(DisasContext *ctx)                  \
-    {                                                            \
-        TCGv_i64 xbh, xbl, sgm;                                  \
-        if (unlikely(!ctx->vsx_enabled)) {                       \
-            gen_exception(ctx, POWERPC_EXCP_VSXU);               \
-            return;                                              \
-        }                                                        \
-        xbh = tcg_temp_new_i64();                                \
-        xbl = tcg_temp_new_i64();                                \
-        sgm = tcg_temp_new_i64();                                \
-        get_cpu_vsr(xbh, xB(ctx->opcode), true);                 \
-        get_cpu_vsr(xbl, xB(ctx->opcode), false);                \
-        tcg_gen_movi_i64(sgm, sgn_mask);                         \
-        switch (op) {                                            \
-            case OP_ABS: {                                       \
-                tcg_gen_andc_i64(xbh, xbh, sgm);                 \
-                tcg_gen_andc_i64(xbl, xbl, sgm);                 \
-                break;                                           \
-            }                                                    \
-            case OP_NABS: {                                      \
-                tcg_gen_or_i64(xbh, xbh, sgm);                   \
-                tcg_gen_or_i64(xbl, xbl, sgm);                   \
-                break;                                           \
-            }                                                    \
-            case OP_NEG: {                                       \
-                tcg_gen_xor_i64(xbh, xbh, sgm);                  \
-                tcg_gen_xor_i64(xbl, xbl, sgm);                  \
-                break;                                           \
-            }                                                    \
-            case OP_CPSGN: {                                     \
-                TCGv_i64 xah = tcg_temp_new_i64();               \
-                TCGv_i64 xal = tcg_temp_new_i64();               \
-                get_cpu_vsr(xah, xA(ctx->opcode), true);         \
-                get_cpu_vsr(xal, xA(ctx->opcode), false);        \
-                tcg_gen_and_i64(xah, xah, sgm);                  \
-                tcg_gen_and_i64(xal, xal, sgm);                  \
-                tcg_gen_andc_i64(xbh, xbh, sgm);                 \
-                tcg_gen_andc_i64(xbl, xbl, sgm);                 \
-                tcg_gen_or_i64(xbh, xbh, xah);                   \
-                tcg_gen_or_i64(xbl, xbl, xal);                   \
-                tcg_temp_free_i64(xah);                          \
-                tcg_temp_free_i64(xal);                          \
-                break;                                           \
-            }                                                    \
-        }                                                        \
-        set_cpu_vsr(xT(ctx->opcode), xbh, true);                 \
-        set_cpu_vsr(xT(ctx->opcode), xbl, false);                \
-        tcg_temp_free_i64(xbh);                                  \
-        tcg_temp_free_i64(xbl);                                  \
-        tcg_temp_free_i64(sgm);                                  \
-    }
-
-VSX_VECTOR_MOVE(xvcpsgndp, OP_CPSGN, SGN_MASK_DP)
-VSX_VECTOR_MOVE(xvcpsgnsp, OP_CPSGN, SGN_MASK_SP)
-
 #define TCG_OP_IMM_i64(FUNC, OP, IMM)                           \
     static void FUNC(TCGv_i64 t, TCGv_i64 b)                    \
     {                                                           \
@@ -852,6 +796,59 @@ TRANS(XVABSSP, do_vsx_msb_op, MO_32, do_xvabs_vec, do_xvabssp_i64)
 TRANS(XVNABSSP, do_vsx_msb_op, MO_32, do_xvnabs_vec, do_xvnabssp_i64)
 TRANS(XVNEGSP, do_vsx_msb_op, MO_32, do_xvneg_vec, do_xvnegsp_i64)
 
+static void do_xvcpsgndp_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_andi_i64(a, a, SGN_MASK_DP);
+    tcg_gen_andi_i64(b, b, ~SGN_MASK_DP);
+    tcg_gen_or_i64(t, a, b);
+}
+
+static void do_xvcpsgnsp_i64(TCGv_i64 t, TCGv_i64 a, TCGv_i64 b)
+{
+    tcg_gen_andi_i64(a, a, SGN_MASK_SP);
+    tcg_gen_andi_i64(b, b, ~SGN_MASK_SP);
+    tcg_gen_or_i64(t, a, b);
+}
+
+static void do_xvcpsgn_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    uint64_t msb = (vece == MO_32) ? SGN_MASK_SP : SGN_MASK_DP;
+    tcg_gen_bitsel_vec(vece, t, tcg_constant_vec_matching(t, vece, msb), a, b);
+}
+
+static bool do_xvcpsgn(DisasContext *ctx, arg_XX3 *a, unsigned vece)
+{
+    static const TCGOpcode vecop_list[] = {
+        0
+    };
+
+    static const GVecGen3 op[] = {
+        {
+            .fni8 = do_xvcpsgnsp_i64,
+            .fniv = do_xvcpsgn_vec,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fni8 = do_xvcpsgndp_i64,
+            .fniv = do_xvcpsgn_vec,
+            .opt_opc = vecop_list,
+            .vece = MO_64
+        },
+    };
+
+    REQUIRE_INSNS_FLAGS2(ctx, VSX);
+    REQUIRE_VSX(ctx);
+
+    tcg_gen_gvec_3(vsr_full_offset(a->xt), vsr_full_offset(a->xa),
+                   vsr_full_offset(a->xb), 16, 16, &op[vece - MO_32]);
+
+    return true;
+}
+
+TRANS(XVCPSGNSP, do_xvcpsgn, MO_32)
+TRANS(XVCPSGNDP, do_xvcpsgn, MO_64)
+
 #define VSX_CMP(name, op1, op2, inval, type)                                  \
 static void gen_##name(DisasContext *ctx)                                     \
 {                                                                             \
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index b77324e0a8..f7d7377379 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -165,9 +165,6 @@ GEN_XX3FORM(name, opc2, opc3 | 1, fl2)
 GEN_XX2FORM_DCMX(xvtstdcdp, 0x14, 0x1E, PPC2_ISA300),
 GEN_XX2FORM_DCMX(xvtstdcsp, 0x14, 0x1A, PPC2_ISA300),
 
-GEN_XX3FORM(xvcpsgndp, 0x00, 0x1E, PPC2_VSX),
-GEN_XX3FORM(xvcpsgnsp, 0x00, 0x1A, PPC2_VSX),
-
 GEN_XX3FORM(xsadddp, 0x00, 0x04, PPC2_VSX),
 GEN_VSX_XFORM_300(xsaddqp, 0x04, 0x00, 0x0),
 GEN_XX3FORM(xssubdp, 0x00, 0x05, PPC2_VSX),
-- 
2.37.3


