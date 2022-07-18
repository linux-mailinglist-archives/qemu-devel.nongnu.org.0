Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 226435788E4
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:54:20 +0200 (CEST)
Received: from localhost ([::1]:36738 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUwl-0004oc-87
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:54:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43710)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSf-0008LY-HY; Mon, 18 Jul 2022 13:23:13 -0400
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33]:35468)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSd-0001tG-Nr; Mon, 18 Jul 2022 13:23:13 -0400
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so24365009fac.2; 
 Mon, 18 Jul 2022 10:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JneWFqL6Svykeck+7bHr9XVjlGFRmRmTHw2TtqOVAmU=;
 b=iICHX96dLQskR9ARt9y6n7dktx6u984ZeqjqIAosWFrQOSobqU1IyYKc+IdKAL+GjF
 6OxyOj/s/vdQt+uAalcHg5MaUjiI0XguS4jUC3XvwT/vmdJcaDfo9VE3kZ+MlitoRYoA
 pOx4G+BLia29gmP3rrE4plPuEQcLJvY/sq6WdxFk83cHvHPIT2iDgyy7vSV13O6FE9vy
 AzWNIVK7aUd+cqTQLTrjFTwubldvhVPQddNMEOgOzcB7PMYQ8BOag2QNEbuAejzLJIID
 Uh8CCUcijSiPs4HVxG0MCUBrzU4O81WmvJbpWBtgejutbAkdSn2fMA+ILhJpj4IZeg/Z
 jPNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JneWFqL6Svykeck+7bHr9XVjlGFRmRmTHw2TtqOVAmU=;
 b=W+nrjJdTsvVWQSTeilSk3/FXAkITdSZb+xxdUWxy+PIcUHBLn9waAzcQa3cu59ndFM
 rmRADcCEm2kevaLKTdlCvZgL5/YlhBVhLpvQ11CrIwFoVavOQsneTBrqTAG9mF4TuFPw
 uKauC8tnk8tIapfDiIGQHODpbn1mbYb/MHxpIP4vmpImVIpUfrYN0uk6pgWcRnRhDRsf
 Dje8aRdBykN9CAe1mmoOmHKgjwkaGQBrZwHR0vOUQGVohnXmvWgvRZl7KqfopOGE73Oq
 TTryX6qgXMirfTKGPvZ4OINv8lMaHA0p7iYqTguf66dXuVB/oKJDmvDkEOQA59ui2xTm
 P7Lg==
X-Gm-Message-State: AJIora9YCqUzrUkUwKbz92nwX0j+3biy8jEmzTposc97UMMxCgyVRfV8
 X705lDg4sDCyJuBvU3fLD2vzszRyQMo=
X-Google-Smtp-Source: AGRyM1sTcKhsdLZK+s5qwbNn5GCLOrfjJqDWPs1mcIvH+Ch20fJheesc54RNLwINL59Wnyoz3sNbOw==
X-Received: by 2002:a05:6871:88b:b0:f2:bdee:1461 with SMTP id
 r11-20020a056871088b00b000f2bdee1461mr15763564oaq.299.1658164990131; 
 Mon, 18 Jul 2022 10:23:10 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 23/30] target/ppc: Move slbmfee to decodetree
Date: Mon, 18 Jul 2022 14:22:01 -0300
Message-Id: <20220718172208.1247624-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x33.google.com
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
Message-Id: <20220701133507.740619-9-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  1 +
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 13 -------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index d1f9dff58f..0baa2ca0f3 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -677,7 +677,7 @@ DEF_HELPER_FLAGS_2(tlbiva, TCG_CALL_NO_RWG, void, env, tl)
 DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
         env, tl, tl, i32)
 DEF_HELPER_FLAGS_3(SLBMTE, TCG_CALL_NO_RWG, void, env, tl, tl)
-DEF_HELPER_2(load_slb_esid, tl, env, tl)
+DEF_HELPER_2(SLBMFEE, tl, env, tl)
 DEF_HELPER_2(SLBMFEV, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0e002999bd..8b431c6f32 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -873,6 +873,7 @@ SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
 SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
 
 SLBMFEV         011111 ..... ----- ..... 1101010011 -   @X_tb
+SLBMFEE         011111 ..... ----- ..... 1110010011 -   @X_tb
 
 ## TLB Management Instructions
 
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 7854b91043..5d73d64436 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -319,7 +319,7 @@ void helper_SLBMTE(CPUPPCState *env, target_ulong rb, target_ulong rs)
     }
 }
 
-target_ulong helper_load_slb_esid(CPUPPCState *env, target_ulong rb)
+target_ulong helper_SLBMFEE(CPUPPCState *env, target_ulong rb)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     target_ulong rt = 0;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e48a306036..eae60f5370 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5351,18 +5351,6 @@ static void gen_mtsrin_64b(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-static void gen_slbmfee(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_load_slb_esid(cpu_gpr[rS(ctx->opcode)], cpu_env,
-                             cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 
 static void gen_slbfee_(DisasContext *ctx)
 {
@@ -6817,7 +6805,6 @@ GEN_HANDLER2(mfsrin_64b, "mfsrin", 0x1F, 0x13, 0x14, 0x001F0001,
 GEN_HANDLER2(mtsr_64b, "mtsr", 0x1F, 0x12, 0x06, 0x0010F801, PPC_SEGMENT_64B),
 GEN_HANDLER2(mtsrin_64b, "mtsrin", 0x1F, 0x12, 0x07, 0x001F0001,
              PPC_SEGMENT_64B),
-GEN_HANDLER2(slbmfee, "slbmfee", 0x1F, 0x13, 0x1C, 0x001F0001, PPC_SEGMENT_64B),
 GEN_HANDLER2(slbfee_, "slbfee.", 0x1F, 0x13, 0x1E, 0x001F0000, PPC_SEGMENT_64B),
 #endif
 GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 11f44e9366..f0854b137f 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -93,6 +93,20 @@ static bool trans_SLBMFEV(DisasContext *ctx, arg_SLBMFEV *a)
     return true;
 }
 
+static bool trans_SLBMFEE(DisasContext *ctx, arg_SLBMFEE *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SEGMENT_64B);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBMFEE(cpu_gpr[a->rt], cpu_env, cpu_gpr[a->rb]);
+#else
+    qemu_build_not_reached();
+#endif
+    return true;
+}
+
 static bool do_tlbie(DisasContext *ctx, arg_X_tlbie *a, bool local)
 {
 #if defined(CONFIG_USER_ONLY)
-- 
2.36.1


