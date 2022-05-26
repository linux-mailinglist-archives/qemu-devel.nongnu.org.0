Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B7B305355ED
	for <lists+qemu-devel@lfdr.de>; Fri, 27 May 2022 00:01:58 +0200 (CEST)
Received: from localhost ([::1]:58092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nuLYL-0002vt-R0
	for lists+qemu-devel@lfdr.de; Thu, 26 May 2022 18:01:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCZ-0001xj-LD; Thu, 26 May 2022 17:39:29 -0400
Received: from mail-oi1-x235.google.com ([2607:f8b0:4864:20::235]:42963)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1nuLCX-00087c-RP; Thu, 26 May 2022 17:39:27 -0400
Received: by mail-oi1-x235.google.com with SMTP id q10so3632533oia.9;
 Thu, 26 May 2022 14:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXRBSWKb4PLjXZLqu3E7JPfkFMAssAWYop7DBinq1Io=;
 b=AhWNET7RRQuVa5zRTeng2AHTwh4UsKq87Gp+sv0OzJCc2WCQKjMkXmg5DjYxqxfV6P
 LDej6jDMoqpJFQUxwsYqzEj6J+FEDp2+Lz0bJsuISun21T0VHS9lAf9YPD4dhTVSehi8
 3dGS1npggXGAT3Ci2Opf3ASeHKzwW8StvE0Rnyh4QvYznlVxqQGmjvqWi7SvOX3cco+q
 XB/6+ieyk2AQ3gyqsz0m/YEdjnyYWbHQyqMrc1b9cSp9I3vwaVDmSbo7/yNC8N+qLmcS
 kiJHOrWMsUDXiDkxbhrtbvQE/9bPSIhxvehyWRmmdon/+OvGPyOsJc98UEucZajomwcg
 qHkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXRBSWKb4PLjXZLqu3E7JPfkFMAssAWYop7DBinq1Io=;
 b=7SrnhTFx/aPrhAeYR5cqQmJTcxEhjFac9XxFnGBH+w2jZa/Fep+NTxXBjzUcFl5+kE
 D1pmlesXIzRJ149izRgL95euHk8zCLPcc/tb4TkGl0+H2pa7fslwSoLA7B3nUu+zDL+b
 eFRcLQgPnXR1oF67NIcLxZ2fsfHMILarVtKfKRIZzYkhRvup6pPa1vIsAV5VyIqN+OYy
 ty6DpEFO1fTEXQRdCvCnLugKII2q01Hv96HEelirCaYvQLUPrxbVUbhbAseQ1QZutycP
 37MTnngOkBetJERgiL/x8omKa/i1+Va3e1GvLB5NgeNe21elIJbzIg8gSi3C8B8yPviS
 /h+Q==
X-Gm-Message-State: AOAM530XVFhAi9+AkRwySXdtLnikWWbjnxv+6mBhwf7R/RZaf4f65I0h
 6awK38cCAIAcQWww7Z58Xns21Bnt3uw=
X-Google-Smtp-Source: ABdhPJysRC4yXz0zp9paSSXVc6smaMEXtuRoOWcFXuMScN0+/cnOMq8qzMxSbrhMQtNH38i9mU3CCA==
X-Received: by 2002:a05:6808:1487:b0:32b:ac3a:6316 with SMTP id
 e7-20020a056808148700b0032bac3a6316mr2255526oiw.75.1653601163846; 
 Thu, 26 May 2022 14:39:23 -0700 (PDT)
Received: from balboa.COMFAST (189-46-169-45.dsl.telesp.net.br.
 [189.46.169.45]) by smtp.gmail.com with ESMTPSA id
 l43-20020a0568302b2b00b00606ad72bdcbsm1066999otv.38.2022.05.26.14.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 May 2022 14:39:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 18/34] target/ppc: declare xxextractuw and xxinsertw helpers
 with call flags
Date: Thu, 26 May 2022 18:37:59 -0300
Message-Id: <20220526213815.92701-19-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220526213815.92701-1-danielhb413@gmail.com>
References: <20220526213815.92701-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::235;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x235.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Move xxextractuw and xxinsertw to decodetree, declare both helpers with
TCG_CALL_NO_RWG, and drop the unused env argument.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220517123929.284511-9-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                 |  4 +-
 target/ppc/insn32.decode            |  9 +++-
 target/ppc/int_helper.c             |  6 +--
 target/ppc/translate/vsx-impl.c.inc | 67 +++++++++++++----------------
 target/ppc/translate/vsx-ops.c.inc  |  2 -
 5 files changed, 41 insertions(+), 47 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index aed1b24fdb..640a70cd5c 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -528,9 +528,9 @@ DEF_HELPER_FLAGS_2(XXGENPCVDM_be_exp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_FLAGS_2(XXGENPCVDM_be_comp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_FLAGS_2(XXGENPCVDM_le_exp, TCG_CALL_NO_RWG, void, vsr, avr)
 DEF_HELPER_FLAGS_2(XXGENPCVDM_le_comp, TCG_CALL_NO_RWG, void, vsr, avr)
-DEF_HELPER_4(xxextractuw, void, env, vsr, vsr, i32)
+DEF_HELPER_FLAGS_3(XXEXTRACTUW, TCG_CALL_NO_RWG, void, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXPERMX, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, tl)
-DEF_HELPER_4(xxinsertw, void, env, vsr, vsr, i32)
+DEF_HELPER_FLAGS_3(XXINSERTW, TCG_CALL_NO_RWG, void, vsr, vsr, i32)
 DEF_HELPER_FLAGS_2(XVXSIGSP, TCG_CALL_NO_RWG, void, vsr, vsr)
 DEF_HELPER_FLAGS_5(XXEVAL, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
 DEF_HELPER_FLAGS_5(XXBLENDVB, TCG_CALL_NO_RWG, void, vsr, vsr, vsr, vsr, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 483349ff6d..435cf1320c 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -161,8 +161,10 @@
 &XX2            xt xb
 @XX2            ...... ..... ..... ..... ......... ..           &XX2 xt=%xx_xt xb=%xx_xb
 
-&XX2_uim2       xt xb uim:uint8_t
-@XX2_uim2       ...... ..... ... uim:2 ..... ......... ..       &XX2_uim2 xt=%xx_xt xb=%xx_xb
+&XX2_uim        xt xb uim:uint8_t
+@XX2_uim2       ...... ..... ... uim:2 ..... ......... ..       &XX2_uim xt=%xx_xt xb=%xx_xb
+
+@XX2_uim4       ...... ..... . uim:4 ..... ......... ..         &XX2_uim xt=%xx_xt xb=%xx_xb
 
 &XX2_bf_xb      bf xb
 @XX2_bf_xb      ...... bf:3 .. ..... ..... ......... . .        &XX2_bf_xb xb=%xx_xb
@@ -666,6 +668,9 @@ XXSPLTW         111100 ..... ---.. ..... 010100100 . .  @XX2_uim2
 
 ## VSX Permute Instructions
 
+XXEXTRACTUW     111100 ..... - .... ..... 010100101 ..  @XX2_uim4
+XXINSERTW       111100 ..... - .... ..... 010110101 ..  @XX2_uim4
+
 XXPERM          111100 ..... ..... ..... 00011010 ...   @XX3
 XXPERMR         111100 ..... ..... ..... 00111010 ...   @XX3
 XXPERMDI        111100 ..... ..... ..... 0 .. 01010 ... @XX3_dm
diff --git a/target/ppc/int_helper.c b/target/ppc/int_helper.c
index 8c1674510b..9a361ad241 100644
--- a/target/ppc/int_helper.c
+++ b/target/ppc/int_helper.c
@@ -1647,8 +1647,7 @@ VSTRI(VSTRIHL, H, 8, true)
 VSTRI(VSTRIHR, H, 8, false)
 #undef VSTRI
 
-void helper_xxextractuw(CPUPPCState *env, ppc_vsr_t *xt,
-                        ppc_vsr_t *xb, uint32_t index)
+void helper_XXEXTRACTUW(ppc_vsr_t *xt, ppc_vsr_t *xb, uint32_t index)
 {
     ppc_vsr_t t = { };
     size_t es = sizeof(uint32_t);
@@ -1663,8 +1662,7 @@ void helper_xxextractuw(CPUPPCState *env, ppc_vsr_t *xt,
     *xt = t;
 }
 
-void helper_xxinsertw(CPUPPCState *env, ppc_vsr_t *xt,
-                      ppc_vsr_t *xb, uint32_t index)
+void helper_XXINSERTW(ppc_vsr_t *xt, ppc_vsr_t *xb, uint32_t index)
 {
     ppc_vsr_t t = *xt;
     size_t es = sizeof(uint32_t);
diff --git a/target/ppc/translate/vsx-impl.c.inc b/target/ppc/translate/vsx-impl.c.inc
index ca11e2c4b8..900c1a1ab2 100644
--- a/target/ppc/translate/vsx-impl.c.inc
+++ b/target/ppc/translate/vsx-impl.c.inc
@@ -1585,7 +1585,7 @@ static bool trans_XXSEL(DisasContext *ctx, arg_XX4 *a)
     return true;
 }
 
-static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim2 *a)
+static bool trans_XXSPLTW(DisasContext *ctx, arg_XX2_uim *a)
 {
     int tofs, bofs;
 
@@ -1795,42 +1795,35 @@ static void gen_xxsldwi(DisasContext *ctx)
     tcg_temp_free_i64(xtl);
 }
 
-#define VSX_EXTRACT_INSERT(name)                                \
-static void gen_##name(DisasContext *ctx)                       \
-{                                                               \
-    TCGv_ptr xt, xb;                                            \
-    TCGv_i32 t0;                                                \
-    TCGv_i64 t1;                                                \
-    uint8_t uimm = UIMM4(ctx->opcode);                          \
-                                                                \
-    if (unlikely(!ctx->vsx_enabled)) {                          \
-        gen_exception(ctx, POWERPC_EXCP_VSXU);                  \
-        return;                                                 \
-    }                                                           \
-    xt = gen_vsr_ptr(xT(ctx->opcode));                          \
-    xb = gen_vsr_ptr(xB(ctx->opcode));                          \
-    t0 = tcg_temp_new_i32();                                    \
-    t1 = tcg_temp_new_i64();                                    \
-    /*                                                          \
-     * uimm > 15 out of bound and for                           \
-     * uimm > 12 handle as per hardware in helper               \
-     */                                                         \
-    if (uimm > 15) {                                            \
-        tcg_gen_movi_i64(t1, 0);                                \
-        set_cpu_vsr(xT(ctx->opcode), t1, true);                 \
-        set_cpu_vsr(xT(ctx->opcode), t1, false);                \
-        return;                                                 \
-    }                                                           \
-    tcg_gen_movi_i32(t0, uimm);                                 \
-    gen_helper_##name(cpu_env, xt, xb, t0);                     \
-    tcg_temp_free_ptr(xb);                                      \
-    tcg_temp_free_ptr(xt);                                      \
-    tcg_temp_free_i32(t0);                                      \
-    tcg_temp_free_i64(t1);                                      \
-}
-
-VSX_EXTRACT_INSERT(xxextractuw)
-VSX_EXTRACT_INSERT(xxinsertw)
+static bool do_vsx_extract_insert(DisasContext *ctx, arg_XX2_uim *a,
+    void (*gen_helper)(TCGv_ptr, TCGv_ptr, TCGv_i32))
+{
+    TCGv_i64 zero = tcg_constant_i64(0);
+    TCGv_ptr xt, xb;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_VSX(ctx);
+
+    /*
+     * uim > 15 out of bound and for
+     * uim > 12 handle as per hardware in helper
+     */
+    if (a->uim > 15) {
+        set_cpu_vsr(a->xt, zero, true);
+        set_cpu_vsr(a->xt, zero, false);
+    } else {
+        xt = gen_vsr_ptr(a->xt);
+        xb = gen_vsr_ptr(a->xb);
+        gen_helper(xt, xb, tcg_constant_i32(a->uim));
+        tcg_temp_free_ptr(xb);
+        tcg_temp_free_ptr(xt);
+    }
+
+    return true;
+}
+
+TRANS(XXEXTRACTUW, do_vsx_extract_insert, gen_helper_XXEXTRACTUW)
+TRANS(XXINSERTW, do_vsx_extract_insert, gen_helper_XXINSERTW)
 
 #ifdef TARGET_PPC64
 static void gen_xsxexpdp(DisasContext *ctx)
diff --git a/target/ppc/translate/vsx-ops.c.inc b/target/ppc/translate/vsx-ops.c.inc
index 4524c5b02a..bff14bbece 100644
--- a/target/ppc/translate/vsx-ops.c.inc
+++ b/target/ppc/translate/vsx-ops.c.inc
@@ -320,5 +320,3 @@ VSX_LOGICAL(xxlorc, 0x8, 0x15, PPC2_VSX207),
 GEN_XX3FORM(xxmrghw, 0x08, 0x02, PPC2_VSX),
 GEN_XX3FORM(xxmrglw, 0x08, 0x06, PPC2_VSX),
 GEN_XX3FORM_DM(xxsldwi, 0x08, 0x00),
-GEN_XX2FORM_EXT(xxextractuw, 0x0A, 0x0A, PPC2_ISA300),
-GEN_XX2FORM_EXT(xxinsertw, 0x0A, 0x0B, PPC2_ISA300),
-- 
2.36.1


