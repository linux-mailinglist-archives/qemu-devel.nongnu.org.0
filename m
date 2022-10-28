Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 302E76117E4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:46:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQQ-0003vK-Fg; Fri, 28 Oct 2022 12:41:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPV-0005vn-VF; Fri, 28 Oct 2022 12:40:47 -0400
Received: from mail-oa1-x2c.google.com ([2001:4860:4864:20::2c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSPS-0007zr-EC; Fri, 28 Oct 2022 12:40:44 -0400
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13ba86b5ac0so6914086fac.1; 
 Fri, 28 Oct 2022 09:40:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LxSNmjzrFS624LPprcaYhDdsvB6llevUea9XE9HzxMU=;
 b=Uq8YLjJdQ8h0CCapJlcTSxAevFt7EwYf2O7nqar4decA7V5MVFeC08Lw7l87ABolbu
 Bh7nUwGM7YTptheSUupg5pdKcfgVWLSYb5nHQumpj5yY85cDoTHeWIRbJleC1ihcBLII
 pyNX/Mx0+VK67DmevJHXCjswpg3CDKXICURFQNBo4fzAwPxxvMwMZZqxWN97ACHD4drY
 vjCN6Qd2JCUeD9w+vRdLF7eBRLHvlty+retiw2FUIl6MRP2VcR0yz/wTyBPcg9ru3Szj
 pnI+euAwjEn8ZDDTQAjpw0v10cD2jzXyA/o+XUuzI71oCRNGvS4sMaFZxGkbW2d5tlD7
 ddjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LxSNmjzrFS624LPprcaYhDdsvB6llevUea9XE9HzxMU=;
 b=4ZqspjG9vsSZfg1FlN9zUqIfMtbO/9psHYOwluqKyuEHDAgRaKLfy/Ct1EA6L95u5m
 scVonICRXO7fmHthu7OqSeK/QVhiw2sPt16oUZ8lxg1kpkUWauWPgnN2jr39Yxe1WrrB
 XbdHNUskfP55ebUr4LjHTWOpx+Y+DyAieEDjPIJnvi83MDD33VkSI6cKvWk0QlVbTD6O
 zLOrVP2ImQVHmi0fkw48Ivlq+TGVUgDlpvQBRfe4tYVu3fitjlD8+xGO2DAKdeazgMyu
 hTI3Yj41DtkSLusuMXYz1w128btz2RavaqmqfvW6F9T3WN/lSE3O5v4ya8E/cqMdF2hR
 Y4cA==
X-Gm-Message-State: ACrzQf2Sz0oVALFqUCY8lRVIuMdmqQF7lWYza1p9qWVu/ncnJfzSuHjO
 KN4nhyCshcKfJA5+moTm3Id5plDth/JHLg==
X-Google-Smtp-Source: AMsMyM7qilRnJp2pyYl3VggkyQUmzs4d8tr7yZ8w5U5e+knSexvWj1W2bwxG+ywTToT+2np2d1He1Q==
X-Received: by 2002:a05:6870:e3d1:b0:13c:9dbb:7e95 with SMTP id
 y17-20020a056870e3d100b0013c9dbb7e95mr16205oad.43.1666975240056; 
 Fri, 28 Oct 2022 09:40:40 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.40.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:40:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>,
 Richard Henderson <richard.henderson@linaro.org>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 09/62] target/ppc: Move V(ADD|SUB)CUW to decodetree and use gvec
Date: Fri, 28 Oct 2022 13:38:58 -0300
Message-Id: <20221028163951.810456-10-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2c;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2c.google.com
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

This patch moves VADDCUW and VSUBCUW to decodtree with gvec using an
implementation based on the helper, with the main difference being
changing the -1 (aka all bits set to 1) result returned by cmp when
true to +1. It also implemented a .fni4 version of those instructions
and dropped the helper.

vaddcuw:
rept    loop    master             patch
8       12500   0,01008200         0,00612400 (-39.3%)
25      4000    0,01091500         0,00471600 (-56.8%)
100     1000    0,01332500         0,00593700 (-55.4%)
500     200     0,01998500         0,01275700 (-36.2%)
2500    40      0,04704300         0,04364300 (-7.2%)
8000    12      0,10748200         0,11241000 (+4.6%)

vsubcuw:
rept    loop    master             patch
8       12500   0,01226200         0,00571600 (-53.4%)
25      4000    0,01493500         0,00462100 (-69.1%)
100     1000    0,01522700         0,00455100 (-70.1%)
500     200     0,02384600         0,01133500 (-52.5%)
2500    40      0,04935200         0,03178100 (-35.6%)
8000    12      0,09039900         0,09440600 (+4.4%)

Overall there was a gain in performance, but the TCGop code was still
slightly bigger in the new version (it went from 4 to 5).

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221019125040.48028-4-lucas.araujo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  2 -
 target/ppc/insn32.decode            |  2 +
 target/ppc/int_helper.c             | 18 ---------
 target/ppc/translate/vmx-impl.c.inc | 61 +++++++++++++++++++++++++++--
 target/ppc/translate/vmx-ops.c.inc  |  3 +-
 5 files changed, 60 insertions(+), 26 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index f02a9497b7..f7047ed2aa 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -193,11 +193,9 @@ DEF_HELPER_FLAGS_3(vslo, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsro, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vsrv, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_3(vslv, TCG_CALL_NO_RWG, void, avr, avr, avr)
-DEF_HELPER_FLAGS_3(vaddcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_2(vprtybw, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vprtybd, TCG_CALL_NO_RWG, void, avr, avr)
 DEF_HELPER_FLAGS_2(vprtybq, TCG_CALL_NO_RWG, void, avr, avr)
-DEF_HELPER_FLAGS_3(vsubcuw, TCG_CALL_NO_RWG, void, avr, avr, avr)
 DEF_HELPER_FLAGS_5(vaddsbs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddshs, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
 DEF_HELPER_FLAGS_5(vaddsws, TCG_CALL_NO_RWG, void, avr, avr, avr, avr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 4e142d5e23..c985f8f1bf 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -608,12 +608,14 @@ VRLQNM          000100 ..... ..... ..... 00101000101    @VX
 
 ## Vector Integer Arithmetic Instructions
 
+VADDCUW         000100 ..... ..... ..... 00110000000    @VX
 VADDCUQ         000100 ..... ..... ..... 00101000000    @VX
 VADDUQM         000100 ..... ..... ..... 00100000000    @VX
 
 VADDEUQM        000100 ..... ..... ..... ..... 111100   @VA
 VADDECUQ        000100 ..... ..... ..... ..... 111101   @VA
 
+VSUBCUW         000100 ..... ..... ..... 10110000000    @VX
 VSUBCUQ         000100 ..... ..... ..... 10101000000    @VX
 VSUBUQM         000100 ..... ..... ..... 10100000000    @VX
 
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index ae1ba8084d..f8dd12e8ae 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -492,15 +492,6 @@ static inline void set_vscr_sat(CPUPPCState *env)
     env->vscr_sat.u32[0] = 1;
 }
 
-void helper_vaddcuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(r->u32); i++) {
-        r->u32[i] = ~a->u32[i] < b->u32[i];
-    }
-}
-
 /* vprtybw */
 void helper_vprtybw(ppc_avr_t *r, ppc_avr_t *b)
 {
@@ -1962,15 +1953,6 @@ void helper_vsro(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 #endif
 }
 
-void helper_vsubcuw(ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
-{
-    int i;
-
-    for (i = 0; i < ARRAY_SIZE(r->u32); i++) {
-        r->u32[i] = a->u32[i] >= b->u32[i];
-    }
-}
-
 void helper_vsumsws(CPUPPCState *env, ppc_avr_t *r, ppc_avr_t *a, ppc_avr_t *b)
 {
     int64_t t;
diff --git a/target/ppc/translate/vmx-impl.c.inc b/target/ppc/translate/vmx-impl.c.inc
index 3acd585a2f..f52485a5f1 100644
--- a/target/ppc/translate/vmx-impl.c.inc
+++ b/target/ppc/translate/vmx-impl.c.inc
@@ -803,8 +803,6 @@ GEN_VXFORM(vsrv, 2, 28);
 GEN_VXFORM(vslv, 2, 29);
 GEN_VXFORM(vslo, 6, 16);
 GEN_VXFORM(vsro, 6, 17);
-GEN_VXFORM(vaddcuw, 0, 6);
-GEN_VXFORM(vsubcuw, 0, 22);
 
 static bool do_vector_gvec3_VX(DisasContext *ctx, arg_VX *a, int vece,
                                void (*gen_gvec)(unsigned, uint32_t, uint32_t,
@@ -2847,8 +2845,6 @@ static void gen_xpnd04_2(DisasContext *ctx)
 }
 
 
-GEN_VXFORM_DUAL(vsubcuw, PPC_ALTIVEC, PPC_NONE, \
-                xpnd04_1, PPC_NONE, PPC2_ISA300)
 GEN_VXFORM_DUAL(vsubsws, PPC_ALTIVEC, PPC_NONE, \
                 xpnd04_2, PPC_NONE, PPC2_ISA300)
 
@@ -3110,6 +3106,63 @@ TRANS_FLAGS2(ALTIVEC_207, VPMSUMD, do_vx_helper, gen_helper_VPMSUMD)
 TRANS_FLAGS2(ALTIVEC_207, VSUBCUQ, do_vx_helper, gen_helper_VSUBCUQ)
 TRANS_FLAGS2(ALTIVEC_207, VSUBUQM, do_vx_helper, gen_helper_VSUBUQM)
 
+static void gen_VADDCUW_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_not_vec(vece, a, a);
+    tcg_gen_cmp_vec(TCG_COND_LTU, vece, t, a, b);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(t, vece, 1));
+}
+
+static void gen_VADDCUW_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_not_i32(a, a);
+    tcg_gen_setcond_i32(TCG_COND_LTU, t, a, b);
+}
+
+static void gen_VSUBCUW_vec(unsigned vece, TCGv_vec t, TCGv_vec a, TCGv_vec b)
+{
+    tcg_gen_cmp_vec(TCG_COND_GEU, vece, t, a, b);
+    tcg_gen_and_vec(vece, t, t, tcg_constant_vec_matching(t, vece, 1));
+}
+
+static void gen_VSUBCUW_i32(TCGv_i32 t, TCGv_i32 a, TCGv_i32 b)
+{
+    tcg_gen_setcond_i32(TCG_COND_GEU, t, a, b);
+}
+
+static bool do_vx_vaddsubcuw(DisasContext *ctx, arg_VX *a, int add)
+{
+    static const TCGOpcode vecop_list[] = {
+        INDEX_op_cmp_vec, 0
+    };
+
+    static const GVecGen3 op[] = {
+        {
+            .fniv = gen_VSUBCUW_vec,
+            .fni4 = gen_VSUBCUW_i32,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+        {
+            .fniv = gen_VADDCUW_vec,
+            .fni4 = gen_VADDCUW_i32,
+            .opt_opc = vecop_list,
+            .vece = MO_32
+        },
+    };
+
+    REQUIRE_INSNS_FLAGS(ctx, ALTIVEC);
+    REQUIRE_VECTOR(ctx);
+
+    tcg_gen_gvec_3(avr_full_offset(a->vrt), avr_full_offset(a->vra),
+                   avr_full_offset(a->vrb), 16, 16, &op[add]);
+
+    return true;
+}
+
+TRANS(VSUBCUW, do_vx_vaddsubcuw, 0)
+TRANS(VADDCUW, do_vx_vaddsubcuw, 1)
+
 static bool do_vx_vmuleo(DisasContext *ctx, arg_VX *a, bool even,
                          void (*gen_mul)(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_i64))
 {
diff --git a/target/ppc/translate/vmx-ops.c.inc b/target/ppc/translate/vmx-ops.c.inc
index 7cd9d40e06..ded0234123 100644
--- a/target/ppc/translate/vmx-ops.c.inc
+++ b/target/ppc/translate/vmx-ops.c.inc
@@ -106,12 +106,11 @@ GEN_VXFORM_300(vsrv, 2, 28),
 GEN_VXFORM_300(vslv, 2, 29),
 GEN_VXFORM(vslo, 6, 16),
 GEN_VXFORM(vsro, 6, 17),
-GEN_VXFORM(vaddcuw, 0, 6),
 GEN_HANDLER_E_2(vprtybw, 0x4, 0x1, 0x18, 8, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E_2(vprtybd, 0x4, 0x1, 0x18, 9, 0, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E_2(vprtybq, 0x4, 0x1, 0x18, 10, 0, PPC_NONE, PPC2_ISA300),
 
-GEN_VXFORM_DUAL(vsubcuw, xpnd04_1, 0, 22, PPC_ALTIVEC, PPC_NONE),
+GEN_VXFORM(xpnd04_1, 0, 22),
 GEN_VXFORM_300(bcdsr, 0, 23),
 GEN_VXFORM_300(bcdsr, 0, 31),
 GEN_VXFORM_DUAL(vaddubs, vmul10uq, 0, 8, PPC_ALTIVEC, PPC_NONE),
-- 
2.37.3


