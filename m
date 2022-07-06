Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7630B5693A8
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 22:54:17 +0200 (CEST)
Received: from localhost ([::1]:34682 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9C2E-0004GH-T5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 16:54:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BME-0000fK-JZ; Wed, 06 Jul 2022 16:10:49 -0400
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35]:37561)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1o9BMB-0003bB-Uo; Wed, 06 Jul 2022 16:10:46 -0400
Received: by mail-vk1-xa35.google.com with SMTP id b5so7938529vkp.4;
 Wed, 06 Jul 2022 13:10:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nR+nMc+iB37iWPDuQDQ4fTBigbZEn2Uh/4ZIhXPO9Tk=;
 b=QnccdGEnXSXln+JA5U428of6mXO3ud6Di18oVnVsYodVXwxzdDMDMaoUZTC37wCBly
 cWD+C1rKgyC4N8qUfHtIU2aS/0fElVJiLABa6KSU/xo2bTQ0CBxs87qtLHE/mthIvCwZ
 YKu6Djy9pFGagWhzMuktH/M+2xO9mimSJefGtsvILQ9gdU/Nn0lkDHHSbkLrPvCq6QWV
 /aJqlVO5AnEpnITr7Vrquj3ZXlcS+hYt985/fSw4ZXbbR1YCHYkNFuQp1oO1ciYocVia
 EnfTnHBePbMg/OKeZv/fsqN0sX/tNWU+VM5tAQsLHiRZ4lKj7tycyezVAzzGtHM0UNqJ
 5tnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nR+nMc+iB37iWPDuQDQ4fTBigbZEn2Uh/4ZIhXPO9Tk=;
 b=BP++r1IKXEDTfov7CxI6y8KrZ0G/AgQLf5X5w+sAt+pFv/h8EHiAsn61ROkvXkZO/G
 aTeFOzjXrb7MK3Yf1MiID7iln46MiYuM3J3hiqOZatUTRFH5wTFHSqgUCi8k5d99F4xp
 zFlemI+jk7sFHF1PY/BmgYwSEmAUtY0fdAAbL/NVjkV4wT5DQfew/869eOnwjL4KXw7W
 xWydovzbIQvImCv7IEpwccmH51Sa7v1KGB2P3LwvRjiPoddat/5I/jZFkpu71BRJL4Dt
 oJtHFpW1lt2vteZB3szSLXw3PGiTieSyfJu7t1mzdmX105xPZUOyPvwiq/rGdbtOTGoa
 8OlA==
X-Gm-Message-State: AJIora+1dH0uqt1Bb+Vu2k2vQmApsd1h1Um4bp3pSpyChxxozwLHQRx5
 juToVm3wyYeItHA+Lvc8iZ+8mz4FRDE=
X-Google-Smtp-Source: AGRyM1vZmtiDJsxC/uM61g4cnjO1SZfqc+gVnPE9Q4yWva28t41P128y2YBOrJ6mae2jm5gaEfBNfg==
X-Received: by 2002:a1f:2aca:0:b0:370:9de2:51f7 with SMTP id
 q193-20020a1f2aca000000b003709de251f7mr21223131vkq.11.1657138236435; 
 Wed, 06 Jul 2022 13:10:36 -0700 (PDT)
Received: from balboa.ibmuc.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 r22-20020a056122015600b003744975035asm788662vko.19.2022.07.06.13.10.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 13:10:36 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PULL 23/34] target/ppc: Move mffsce to decodetree
Date: Wed,  6 Jul 2022 17:09:35 -0300
Message-Id: <20220706200946.471114-24-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220706200946.471114-1-danielhb413@gmail.com>
References: <20220706200946.471114-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=danielhb413@gmail.com; helo=mail-vk1-xa35.google.com
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
Message-Id: <20220629162904.105060-4-victor.colombo@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/insn32.decode           |  4 +++
 target/ppc/translate/fp-impl.c.inc | 46 +++++++++++-------------------
 target/ppc/translate/fp-ops.c.inc  |  2 --
 3 files changed, 20 insertions(+), 32 deletions(-)

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f63098d024..7cb7faabac 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -94,6 +94,9 @@
 
 @X_tp_a_bp_rc   ...... ....0 ra:5 ....0 .......... rc:1         &X_rc rt=%x_frtp rb=%x_frbp
 
+&X_t            rt
+@X_t            ...... rt:5 ..... ..... .......... .            &X_t
+
 &X_tb           rt rb
 @X_tb           ...... rt:5 ..... rb:5 .......... .             &X_tb
 
@@ -339,6 +342,7 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
 ### Move To/From FPSCR
 
+MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
 MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
 MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index bcb7ec2689..64e26b9b42 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -655,36 +655,6 @@ static void gen_mffsl(DisasContext *ctx)
     tcg_temp_free_i64(t0);
 }
 
-/* mffsce */
-static void gen_mffsce(DisasContext *ctx)
-{
-    TCGv_i64 t0;
-    TCGv_i32 mask;
-
-    if (unlikely(!(ctx->insns_flags2 & PPC2_ISA300))) {
-        return gen_mffs(ctx);
-    }
-
-    if (unlikely(!ctx->fpu_enabled)) {
-        gen_exception(ctx, POWERPC_EXCP_FPU);
-        return;
-    }
-
-    t0 = tcg_temp_new_i64();
-
-    gen_reset_fpstatus();
-    tcg_gen_extu_tl_i64(t0, cpu_fpscr);
-    set_fpr(rD(ctx->opcode), t0);
-
-    /* Clear exception enable bits in the FPSCR.  */
-    tcg_gen_andi_i64(t0, t0, ~FP_ENABLES);
-    mask = tcg_const_i32(0x0003);
-    gen_helper_store_fpscr(cpu_env, t0, mask);
-
-    tcg_temp_free_i32(mask);
-    tcg_temp_free_i64(t0);
-}
-
 static TCGv_i64 place_from_fpscr(int rt, uint64_t mask)
 {
     TCGv_i64 fpscr = tcg_temp_new_i64();
@@ -712,6 +682,22 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
     tcg_temp_free_i64(fpscr_masked);
 }
 
+static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
+{
+    TCGv_i64 fpscr;
+
+    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    REQUIRE_FPU(ctx);
+
+    gen_reset_fpstatus();
+    fpscr = place_from_fpscr(a->rt, UINT64_MAX);
+    store_fpscr_masked(fpscr, FP_ENABLES, tcg_constant_i64(0), 0x0003);
+
+    tcg_temp_free_i64(fpscr);
+
+    return true;
+}
+
 static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1, fpscr;
diff --git a/target/ppc/translate/fp-ops.c.inc b/target/ppc/translate/fp-ops.c.inc
index a27a1be9f5..a76943b8bf 100644
--- a/target/ppc/translate/fp-ops.c.inc
+++ b/target/ppc/translate/fp-ops.c.inc
@@ -75,8 +75,6 @@ GEN_HANDLER_E(fmrgew, 0x3F, 0x06, 0x1E, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER_E(fmrgow, 0x3F, 0x06, 0x1A, 0x00000001, PPC_NONE, PPC2_VSX207),
 GEN_HANDLER(mcrfs, 0x3F, 0x00, 0x02, 0x0063F801, PPC_FLOAT),
 GEN_HANDLER_E_2(mffs, 0x3F, 0x07, 0x12, 0x00, 0x00000000, PPC_FLOAT, PPC_NONE),
-GEN_HANDLER_E_2(mffsce, 0x3F, 0x07, 0x12, 0x01, 0x00000000, PPC_FLOAT,
-    PPC2_ISA300),
 GEN_HANDLER_E_2(mffsl, 0x3F, 0x07, 0x12, 0x18, 0x00000000, PPC_FLOAT,
     PPC2_ISA300),
 GEN_HANDLER(mtfsb0, 0x3F, 0x06, 0x02, 0x001FF800, PPC_FLOAT),
-- 
2.36.1


