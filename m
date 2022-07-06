Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1020E56937A
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:41:36 +0200 (CEST)
Received: from localhost ([::1]:47800 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Bq2-0001vX-HL
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:41:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BME-0000fM-Lb; Wed, 06 Jul 2022 16:10:49 -0400
Received: from mail-vk1-xa32.google.com ([2607:f8b0:4864:20::a32]:38440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMC-0003bi-3V; Wed, 06 Jul 2022 16:10:46 -0400
Received: by mail-vk1-xa32.google.com with SMTP id j15so7938829vkp.5;
 Wed, 06 Jul 2022 13:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PUqQ2QlpqGYA7/h2/XJN3ilXAms2r2OCt21ILMDWdJ4=;
 b=pDt+9Yy+NhcOSiOPvEsbtsblz+oSvIklfH5/sjKUtSd7dPM0KgbZA90wzpQYUpbPAI
 vdjs+cnoUv6QepfxS9uM139CWG6X2kWc+eA66Rnqm1SQeR9BXDrnHFXPY1Iffpzyp2B6
 jHcRq/XN+iwJz69re08h3E/M18ShECPI1MM1TPS/7CoOq+5gQaqTUGP4NW0WxcdJg5db
 EJB+vzrTbC52tWlazAp+6ZFrkmZy5Rw8vodpcrurlcIdiGp0juEBDjG1iZTtB5jwPSZB
 4Qe5ECUcS/3aum4BkEeBBcZ2tMrvJ0fc/6hUbYc+hQeHILW85qb9hc/C0UeAk1N2sC60
 x6ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PUqQ2QlpqGYA7/h2/XJN3ilXAms2r2OCt21ILMDWdJ4=;
 b=Gtp7aacUu2ga9V3XWxov+sUPPlL6oQxKO4yuPbwaxTLymy8bt3Fg9/FmJ4GTPpNT9e
 p2xCC2iNIprzTHBiGWWiG364KNurNlSomGbwnoVrVOYfV7+VyjmtcPdOVR+s0q8DCbjj
 e11U1u24ry8uEN+l/nimrnYs44wHJesvd7BkV5VfR14xe7FcAgxXyiwpDe7X7l4s1PTZ
 ajOpiSGvNavCdNx6DcokhrGSxULe9eZsjdKdRyZqAAf4CQykTQ8UicMXiXO3gf1fg1GQ
 hZ+k92RvdnmkLCoHRMn8B3onsELjn1cxc4nvFvw627Rr/Vsefy8TY5rGfpTx5YLYL6v+
 mzZw==
X-Gm-Message-State: AJIora8pUPLfzrcyde1geiVyIPmo1q5xM8YtHaJqWinX2gyFPe1wQwmi
 tVq23CxYjeIvu6wP05hrZEtLaCp8uMM=
X-Google-Smtp-Source: AGRyM1sUASFXnr9f7uuVuhdz2IrRiQVzYKr9nxExK1yU765XS9ygllCjY+V9sJTDf0jnXKNYP2a5dQ==
X-Received: by 2002:ac5:c5d5:0:b0:36c:617c:ac6f with SMTP id
 g21-20020ac5c5d5000000b0036c617cac6fmr24375135vkl.35.1657138238345; 
 Wed, 06 Jul 2022 13:10:38 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:38 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 24/34] target/ppc: Move mffsl to decodetree
Date: Wed,  6 Jul 2022 17:09:36 -0300
Message-Id: <20220706200946.471114-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a32;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa32.google.com
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

From: Víctor Colombo <victor.colombo@eldorado.org.br>

Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20220629162904.105060-5-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  1 +
 target/ppc/translate/fp-impl.c.inc | 38 +++++++++++++-----------------
 target/ppc/translate/fp-ops.c.inc  |  2 --
 3 files changed, 17 insertions(+), 24 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 7cb7faabac..6b68689357 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -345,6 +345,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
 
 ### Decimal Floating-Point Arithmetic Instructions
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 64e26b9b42..4f4d57c611 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -633,28 +633,6 @@ static void gen_mffs(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
 
-/* mffsl */
-static void gen_mffsl(DisasContext *ctx)
-{
-    TCGv_i64 t0;
-
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
-
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-    t0 = tcg_temp_new_i64();
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    /* Mask everything except mode, status, and enables.  */
-    tcg_gen_andi_i64(t0, t0, FP_DRN | FP_STATUS | FP_ENABLES | FP_RN);
-    set_fpr(rD(ctx->opcode), t0);
-    tcg_temp_free_i64(t0);
-}
-
 static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
 {
     TCGv_i64 fpscr = tcg_temp_new_i64();
@@ -739,6 +717,22 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
     return true;
 }
 
+static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
+{
+    TCGv_i64 fpscr;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt,
+        FP_DRN | FP_STATUS | FP_ENABLES | FP_NI | FP_RN);
+
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 /* mtfsb0 */
 static void gen_mtfsb0(DisasContext *ctx)
 {
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index a76943b8bf..f8c35124ae 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -75,8 +75,6 @@ GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
 GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC_NONE),
-GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
-    PPC2_ISA300),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsb1, 0x3F, 0x06, 0x01, 0x001FF800, PPC_FLOAT),
 GEN_HANDLER(mtfsf, 0x3F, 0x07, 0x16, 0x00000000, PPC_FLOAT),
-- 
2.36.1


