Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1B457890A
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:58:23 +0200 (CEST)
Received: from localhost ([::1]:46436 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDV0g-00036T-M9
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:58:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43740)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSt-0008Tm-0l; Mon, 18 Jul 2022 13:23:31 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:45656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSg-0001rX-Aa; Mon, 18 Jul 2022 13:23:15 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10c0052da61so25492985fac.12; 
 Mon, 18 Jul 2022 10:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ecm0aGPpM/Brdyc0zvZDqO70yYxydNUKE7SsapLu95s=;
 b=RCr+fN8CSja5ahxfiL/rFMKmZMs/1wX+AMabJOqZAUUkYamXy/icYf7UOvSIIU6nmS
 8yoBwescatzqtLFPQSTcmw6rU08+ZgDXed9AMeGEERtZ0To+AE4Qje0/d8qav+77InJo
 BZFF+3h3dZMNwL6fefxYchHWWoNmSrxkONN8AGbbBTbn38Mkph0/l+Czx99srYaDWeeX
 i01eJlvWKLLsfpiFQuQ5jbaMYlqVdOKohNWIZGadajJJ8RaewURG7YhGuiZ+qCHahFCB
 5gvOxv8PGWFXNztOFJowVLiRULPB84b92+D6A8eSYDeQRgSBWW3y3tDeNUpFnWr49KH9
 fTpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ecm0aGPpM/Brdyc0zvZDqO70yYxydNUKE7SsapLu95s=;
 b=KZr7OYvEATIHs6mIGsXSoZWM/Iek4BkgrGdJ5XGcvLgA1R0PeNM768g+HkcIIaKTHA
 eak5Q9IPlvxtVStg/M6nnSlYp/YSyLJncGfMWGrx7DVGb80o/howhLQFCBB0xEPivGoX
 zuan4lF98pMM4TqNAGnEhW9rXp4gjVzdkQalExt2tynWpIx+CFyteJqLkKCtghBxDoNC
 rHjRMwgEUpH1ygc5FIPoaFdFkcMGNN2SBiLEX6nsulCTOyy5IffrkV+FPz8lcG19mTpY
 LcHsDyO4n6OwfkqHZvy0MBA0j1MhhLDAmEWbI4hk1Fy2MyN60STe4X6CDPdZoT4lQwgI
 +JAw==
X-Gm-Message-State: AJIora8G4ckGFMSlBuskQjttzsDo1PojJpyGPCbd/v/d/DExmxt1mnM0
 6ELHFiyX6/BbvGFaq5KFLgIAtg7dX4s=
X-Google-Smtp-Source: AGRyM1uesdNXt3fqvD9GBy/ckRE7MOY7fOW8riJsXX4kVbjD6fbejB4JmI/nxdUg285r9oPO6PKLdQ==
X-Received: by 2002:a05:6808:1416:b0:337:e23b:1d3c with SMTP id
 w22-20020a056808141600b00337e23b1d3cmr16517140oiv.111.1658164993237; 
 Mon, 18 Jul 2022 10:23:13 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:12 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 24/30] target/ppc: Move slbfee to decodetree
Date: Mon, 18 Jul 2022 14:22:02 -0300
Message-Id: <20220718172208.1247624-25-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::32;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x32.google.com
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

From: Lucas Coutinho <lucas.coutinho@eldorado.org.br>

Reviewed-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
Signed-off-by: Lucas Coutinho <lucas.coutinho@eldorado.org.br>
Message-Id: <20220701133507.740619-10-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  2 ++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 26 ---------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 34 ++++++++++++++++++++
 5 files changed, 38 insertions(+), 28 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 0baa2ca0f3..ef2dc30194 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -679,7 +679,7 @@ DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
 DEF_HELPER_FLAGS_3(SLBMTE, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(SLBMFEE, tl, env, tl)
 DEF_HELPER_2(SLBMFEV, tl, env, tl)
-DEF_HELPER_2(find_slb_vsid, tl, env, tl)
+DEF_HELPER_2(SLBFEE, tl, env, tl)
 DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 8b431c6f32..5049c98691 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -875,6 +875,8 @@ SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
 SLBMFEV         011111 ..... ----- ..... 1101010011 -   @X_tb
 SLBMFEE         011111 ..... ----- ..... 1110010011 -   @X_tb
 
+SLBFEE          011111 ..... ----- ..... 1111010011 1   @X_tb
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 5d73d64436..7ec7a67a78 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -331,7 +331,7 @@ target_ulong helper_SLBMFEE(CPUPPCState *env, target_ulong rb)
     return rt;
 }
 
-target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
+target_ulong helper_SLBFEE(CPUPPCState *env, target_ulong rb)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     target_ulong rt = 0;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index eae60f5370..d7a785164b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5351,31 +5351,6 @@ static void gen_mtsrin_64b(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-
-static void gen_slbfee_(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
-#else
-    TCGLabel *l1, *l2;
-
-    if (unlikely(ctx->pr)) {
-        gen_hvpriv_exception(ctx, POWERPC_EXCP_PRIV_OPC);
-        return;
-    }
-    gen_helper_find_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
-                             cpu_gpr[rB(ctx->opcode)]);
-    l1 = gen_new_label();
-    l2 = gen_new_label();
-    tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
-    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_gpr[rS(ctx->opcode)], -1, l1);
-    tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], CRF_EQ);
-    tcg_gen_br(l2);
-    gen_set_label(l1);
-    tcg_gen_movi_tl(cpu_gpr[rS(ctx->opcode)], 0);
-    gen_set_label(l2);
-#endif
-}
 #endif /* defined(TARGET_PPC64) */
 
 /***                      Lookaside buffer management                      ***/
@@ -6805,7 +6780,6 @@ GEN_HANDLER2(mfsrin_64b, "mfsrin", 0x1F, 0x13, 0x14, 0x001F0001,
 GEN_HANDLER2(mtsr_64b, "mtsr", 0x1F, 0x12, 0x06, 0x0010F801, PPC_SEGMENT_64B),
 GEN_HANDLER2(mtsrin_64b, "mtsrin", 0x1F, 0x12, 0x07, 0x001F0001,
              PPC_SEGMENT_64B),
-GEN_HANDLER2(slbfee_, "slbfee.", 0x1F, 0x13, 0x1E, 0x001F0000, PPC_SEGMENT_64B),
 #endif
 GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
 /*
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index f0854b137f..d7e2bb185f 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -107,6 +107,40 @@ static bool trans_SLBMFEE(DisasContext *ctx, arg_SLBMFEE *a)
     return true;
 }
 
+static bool trans_SLBFEE(DisasContext *ctx, arg_SLBFEE *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SEGMENT_64B);
+
+#if defined(CONFIG_USER_ONLY)
+    gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+#else
+
+#if defined(TARGET_PPC64)
+    TCGLabel *l1, *l2;
+
+    if (unlikely(ctx->pr)) {
+        gen_inval_exception(ctx, POWERPC_EXCP_PRIV_REG);
+        return true;
+    }
+    gen_helper_SLBFEE(cpu_gpr[a->rt], cpu_env,
+                             cpu_gpr[a->rb]);
+    l1 = gen_new_label();
+    l2 = gen_new_label();
+    tcg_gen_trunc_tl_i32(cpu_crf[0], cpu_so);
+    tcg_gen_brcondi_tl(TCG_COND_EQ, cpu_gpr[a->rt], -1, l1);
+    tcg_gen_ori_i32(cpu_crf[0], cpu_crf[0], CRF_EQ);
+    tcg_gen_br(l2);
+    gen_set_label(l1);
+    tcg_gen_movi_tl(cpu_gpr[a->rt], 0);
+    gen_set_label(l2);
+#else
+    qemu_build_not_reached();
+#endif
+#endif
+    return true;
+}
+
 static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
 {
 #if defined(CONFIG_USER_ONLY)
-- 
2.36.1


