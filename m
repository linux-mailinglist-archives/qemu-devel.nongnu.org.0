Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BEC15788D1
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:51:48 +0200 (CEST)
Received: from localhost ([::1]:56270 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUuJ-0007JT-Bc
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:51:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSe-0008ID-Lg; Mon, 18 Jul 2022 13:23:12 -0400
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335]:44602)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSc-0001sX-Dg; Mon, 18 Jul 2022 13:23:12 -0400
Received: by mail-ot1-x335.google.com with SMTP id
 o16-20020a9d4110000000b0061cac66bd6dso1249351ote.11; 
 Mon, 18 Jul 2022 10:23:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R2+q9+GnVKeandXKpBARg4+SXc08zNfN++i7bbZeDFc=;
 b=MVl77im81D2BGeaewqYBA19GTrqQvhn/YNdZoI8JGfFJfvCAkFh9LXZojRgo0wQ9Ca
 qguZvRHdUhjdPGbnoX9kvFUePsNZ4G5O/Fqbz/019xFVSj53jUyCWpUl9ydENgY7eVgh
 L75s5PKqW6FVWzWedGl5vxlfbFPtvRM01ioxhl99sWpZvzFZD/gvuTUFAUXtiDMGqNcl
 Bdo4Spimz+PjgEOrP3e0pLj33U77iDt3c21HCMvZuvUINPJ1JfkWLWbDWrnebYXNRFCE
 yK710OuzaP6ELwowsqFqXq3anK7KJebHfIxAm1UuSr15VVKTiZkilFFIHUI4PV7CVxav
 8Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R2+q9+GnVKeandXKpBARg4+SXc08zNfN++i7bbZeDFc=;
 b=nl2pjCR9QtB7r7pGhKF6DPxqac4klPzUGh3vX2da7UHJUiPqDIF/r2jhoqF5MGGlcz
 Ifc+mwgm+UT/tNauLKkknyrFHFEebu61BHsvE8MKMCunvF0J9k7q0QSndMLG7WB8e1eM
 zoG6Z0Y3af2Ovrb7rYqvIZ9vCD1hoQGBwCjlr3KrWvS1t8Bjr832HZT7M8/WNatY57Jr
 0F92q8Vyx3ERL/lntAS7AjLdarkS4KcIedGi5Cswo9J2WE4hfo+qCoiPVKfhaI+2pVmx
 qkmsic6Z7jDZG2R9wYjnNE2CnU1QHh8n8r0gdKVsGKOKOv8W1Jx+coPiZHRqICKS2+ZB
 Oflw==
X-Gm-Message-State: AJIora8R0VF9KeKKEKEM5tosczzJpITchfPbZN2okq88V8qkr+sfLfQc
 7cDIsxiDMJdpItOSOyhp4UqtwbYjncM=
X-Google-Smtp-Source: AGRyM1uoVFxbKr3Re9UrLPfU3qT0tUVc/jfCtJodVMc+32iXkV5OpwQ0lBUo728G4IcacroFgjg7lw==
X-Received: by 2002:a05:6830:2a01:b0:606:d153:1ba0 with SMTP id
 y1-20020a0568302a0100b00606d1531ba0mr11375802otu.35.1658164987745; 
 Mon, 18 Jul 2022 10:23:07 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.23.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:07 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 22/30] target/ppc: Move slbmfev to decodetree
Date: Mon, 18 Jul 2022 14:22:00 -0300
Message-Id: <20220718172208.1247624-23-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::335;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x335.google.com
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
Message-Id: <20220701133507.740619-8-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  2 ++
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 12 ------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 18 insertions(+), 14 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 98d6c40ac0..d1f9dff58f 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -678,7 +678,7 @@ DEF_HELPER_FLAGS_4(tlbie_isa300, TCG_CALL_NO_WG, void, \
         env, tl, tl, i32)
 DEF_HELPER_FLAGS_3(SLBMTE, TCG_CALL_NO_RWG, void, env, tl, tl)
 DEF_HELPER_2(load_slb_esid, tl, env, tl)
-DEF_HELPER_2(load_slb_vsid, tl, env, tl)
+DEF_HELPER_2(SLBMFEV, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(SLBIA, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 2fc6e9cb27..0e002999bd 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -872,6 +872,8 @@ SLBIA           011111 --... ----- ----- 0111110010 -   @X_ih
 
 SLBMTE          011111 ..... ----- ..... 0110010010 -   @X_tb
 
+SLBMFEV         011111 ..... ----- ..... 1101010011 -   @X_tb
+
 ## TLB Management Instructions
 
 &X_tlbie        rb rs ric prs:bool r:bool
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 1922960608..7854b91043 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -343,7 +343,7 @@ target_ulong helper_find_slb_vsid(CPUPPCState *env, target_ulong rb)
     return rt;
 }
 
-target_ulong helper_load_slb_vsid(CPUPPCState *env, target_ulong rb)
+target_ulong helper_SLBMFEV(CPUPPCState *env, target_ulong rb)
 {
     PowerPCCPU *cpu = env_archcpu(env);
     target_ulong rt = 0;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 169e97a706..e48a306036 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5363,17 +5363,6 @@ static void gen_slbmfee(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-static void gen_slbmfev(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_load_slb_vsid(cpu_gpr[rS(ctx->opcode)], cpu_env,
-                             cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
 
 static void gen_slbfee_(DisasContext *ctx)
 {
@@ -6829,7 +6818,6 @@ GEN_HANDLER2(mtsr_64b, "mtsr", 0x1F, 0x12, 0x06, 0x0010F801, PPC_SEGMENT_64B),
 GEN_HANDLER2(mtsrin_64b, "mtsrin", 0x1F, 0x12, 0x07, 0x001F0001,
              PPC_SEGMENT_64B),
 GEN_HANDLER2(slbmfee, "slbmfee", 0x1F, 0x13, 0x1C, 0x001F0001, PPC_SEGMENT_64B),
-GEN_HANDLER2(slbmfev, "slbmfev", 0x1F, 0x13, 0x1A, 0x001F0001, PPC_SEGMENT_64B),
 GEN_HANDLER2(slbfee_, "slbfee.", 0x1F, 0x13, 0x1E, 0x001F0000, PPC_SEGMENT_64B),
 #endif
 GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 47d672d29a..11f44e9366 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -79,6 +79,20 @@ static bool trans_SLBMTE(DisasContext *ctx, arg_SLBMTE *a)
     return true;
 }
 
+static bool trans_SLBMFEV(DisasContext *ctx, arg_SLBMFEV *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS(ctx, SEGMENT_64B);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBMFEV(cpu_gpr[a->rt], cpu_env, cpu_gpr[a->rb]);
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


