Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7816D5788E2
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:53:56 +0200 (CEST)
Received: from localhost ([::1]:34820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUwN-0003YY-Kb
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:53:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSd-0008Ez-7u; Mon, 18 Jul 2022 13:23:11 -0400
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32]:45656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDUSa-0001rX-OI; Mon, 18 Jul 2022 13:23:10 -0400
Received: by mail-oa1-x32.google.com with SMTP id
 586e51a60fabf-10c0052da61so25491341fac.12; 
 Mon, 18 Jul 2022 10:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HOa1oDVfER0PKhCUub+DXE/bhE9iK8+7YVFoGPJfgn8=;
 b=J2cQ+l6eDBJzo9kRga2y72KgZG6Y/vYYL44Nsa3UUZfInDREG3E5zDNO8Q+OQn8DP2
 GqviTVEMZRhxMCzyuanHDIE76RPQdXaJlipURnD9oGambLhfanSiNH5QZIjslegR9WD3
 AcFL4BTlXD56Eera5KzQJvOQLxnXapnMueGKw/ZQ7aDdJGNEEupoRiZDkLLw2ivBwbP8
 6ZB+J7DBLgF2oyU1ZBVJxMbkw2UBmOjZ4d6we8FiFZYYdeWZ0Cy2CTHvzLdij30OyBvt
 ETW0CPQ2rZallfHOOeduXLvsUU8FMfTRbhX8K0WGMcoGMmr1bDyklLlEySIWH19LKN9h
 ii5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HOa1oDVfER0PKhCUub+DXE/bhE9iK8+7YVFoGPJfgn8=;
 b=d/LEZsh/hbbHHntA4nbM9LMu71SEQmXygcVwL1VR/ViRsV1J3Y0VwStDg0L499ZDKn
 Rdhhs4+liodBfgY055Un6MRzPx80jRaJ5uTbxp/jl3C46GqVH04gNX83zI5JyXl96od+
 RID+Vk1grSTmim/prEyTx/q6tRTSqbJth2g42ksx7ukL8Ja1Jr59u4PRv7uIZty85yfY
 3xLRjZ25ygjJ/uym8cGxpwEV3gHzzRXD5DLyHhhQthuzN23IwdrLPx+YNW10BTXMSSzI
 Gj8M+5RIaQisKqxFwzbrFfM/nMU8drY9pTSfosCRMCFnBv4jYgZ36Ac1djCNcTQXWJFJ
 RSyA==
X-Gm-Message-State: AJIora/3GgCuOI2ZIbN+vqYrJxeHljLaKzN127OC0AdOl1p6cncsLHFX
 DhTItcqdNXL8SJZPeyG4QFEH+qfKi3k=
X-Google-Smtp-Source: AGRyM1sSXhb18eg794GtzVc2ZgmI9U+3CzB8tMxDlN2HlgyWvfK0rn1fnWPP2puimvBaIZ0m6rskrw==
X-Received: by 2002:a05:6871:714:b0:10c:9c:ea5e with SMTP id
 f20-20020a056871071400b0010c009cea5emr17597544oap.133.1658164980637; 
 Mon, 18 Jul 2022 10:23:00 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:23:00 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 Lucas Coutinho <lucas.coutinho@eldorado.org.br>,
 Leandro Lupori <leandro.lupori@eldorado.org.br>
Subject: [PULL 19/30] target/ppc: Move slbieg to decodetree
Date: Mon, 18 Jul 2022 14:21:57 -0300
Message-Id: <20220718172208.1247624-20-danielhb413@gmail.com>
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
Message-Id: <20220701133507.740619-5-lucas.coutinho@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h                          |  2 +-
 target/ppc/insn32.decode                     |  1 +
 target/ppc/mmu-hash64.c                      |  2 +-
 target/ppc/translate.c                       | 13 -------------
 target/ppc/translate/storage-ctrl-impl.c.inc | 14 ++++++++++++++
 5 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 7c93037257..e5e59d1924 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -682,7 +682,7 @@ DEF_HELPER_2(load_slb_vsid, tl, env, tl)
 DEF_HELPER_2(find_slb_vsid, tl, env, tl)
 DEF_HELPER_FLAGS_2(slbia, TCG_CALL_NO_RWG, void, env, i32)
 DEF_HELPER_FLAGS_2(SLBIE, TCG_CALL_NO_RWG, void, env, tl)
-DEF_HELPER_FLAGS_2(slbieg, TCG_CALL_NO_RWG, void, env, tl)
+DEF_HELPER_FLAGS_2(SLBIEG, TCG_CALL_NO_RWG, void, env, tl)
 #endif
 DEF_HELPER_FLAGS_2(load_sr, TCG_CALL_NO_RWG, tl, env, tl)
 DEF_HELPER_FLAGS_3(store_sr, TCG_CALL_NO_RWG, void, env, tl, tl)
diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index 0fe6c33805..9df73ce30f 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -863,6 +863,7 @@ VMODUQ          000100 ..... ..... ..... 11000001011    @VX
 ## SLB Management Instructions
 
 SLBIE           011111 ----- ----- ..... 0110110010 -   @X_rb
+SLBIEG          011111 ..... ----- ..... 0111010010 -   @X_tb
 
 ## TLB Management Instructions
 
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 03f71a82ec..a842fbd6f6 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -202,7 +202,7 @@ void helper_SLBIE(CPUPPCState *env, target_ulong addr)
     __helper_slbie(env, addr, false);
 }
 
-void helper_slbieg(CPUPPCState *env, target_ulong addr)
+void helper_SLBIEG(CPUPPCState *env, target_ulong addr)
 {
     __helper_slbie(env, addr, true);
 }
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 244eefd965..591b6dc817 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -5466,18 +5466,6 @@ static void gen_slbia(DisasContext *ctx)
 #endif /* defined(CONFIG_USER_ONLY) */
 }
 
-/* slbieg */
-static void gen_slbieg(DisasContext *ctx)
-{
-#if defined(CONFIG_USER_ONLY)
-    GEN_PRIV(ctx);
-#else
-    CHK_SV(ctx);
-
-    gen_helper_slbieg(cpu_env, cpu_gpr[rB(ctx->opcode)]);
-#endif /* defined(CONFIG_USER_ONLY) */
-}
-
 /* slbsync */
 static void gen_slbsync(DisasContext *ctx)
 {
@@ -6882,7 +6870,6 @@ GEN_HANDLER(tlbia, 0x1F, 0x12, 0x0B, 0x03FFFC01, PPC_MEM_TLBIA),
 GEN_HANDLER(tlbsync, 0x1F, 0x16, 0x11, 0x03FFF801, PPC_MEM_TLBSYNC),
 #if defined(TARGET_PPC64)
 GEN_HANDLER(slbia, 0x1F, 0x12, 0x0F, 0x031FFC01, PPC_SLBI),
-GEN_HANDLER_E(slbieg, 0x1F, 0x12, 0x0E, 0x001F0001, PPC_NONE, PPC2_ISA300),
 GEN_HANDLER_E(slbsync, 0x1F, 0x12, 0x0A, 0x03FFF801, PPC_NONE, PPC2_ISA300),
 #endif
 GEN_HANDLER(eciwx, 0x1F, 0x16, 0x0D, 0x00000001, PPC_EXTERN),
diff --git a/target/ppc/translate/storage-ctrl-impl.c.inc b/target/ppc/translate/storage-ctrl-impl.c.inc
index 3fa64be067..d699a370f5 100644
--- a/target/ppc/translate/storage-ctrl-impl.c.inc
+++ b/target/ppc/translate/storage-ctrl-impl.c.inc
@@ -37,6 +37,20 @@ static bool trans_SLBIE(DisasContext *ctx, arg_SLBIE *a)
     return true;
 }
 
+static bool trans_SLBIEG(DisasContext *ctx, arg_SLBIEG *a)
+{
+    REQUIRE_64BIT(ctx);
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_SV(ctx);
+
+#if !defined(CONFIG_USER_ONLY) && defined(TARGET_PPC64)
+    gen_helper_SLBIEG(cpu_env, cpu_gpr[a->rb]);
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


