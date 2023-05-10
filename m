Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 197F86FDC82
	for <lists+qemu-devel@lfdr.de>; Wed, 10 May 2023 13:19:57 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pwhr2-00089f-Pj; Wed, 10 May 2023 07:19:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1pwhqs-000891-HR
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:19:22 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1pwhqm-0002Gs-Av
 for qemu-devel@nongnu.org; Wed, 10 May 2023 07:19:22 -0400
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-2fe3fb8e25fso4698852f8f.0
 for <qemu-devel@nongnu.org>; Wed, 10 May 2023 04:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1683717554; x=1686309554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=83nHV7+JGSLFSC2ddcRrk71dUHMFJqIUpmiDaEHj02c=;
 b=eKn/U2SkYS0gxp7i+CQgAa9WRzmlu1yggHa2BYqSlcMi5RexCIMDqTr5Xow+fqEsmw
 biI07XHgDZ9UEOlJfhICD3QCdkfswR5GRMLuym0uoGijEtzgL4EwgJX4qOuZq0N2YoPf
 iVm791r3kdEh88VKVn8ap51NGmth/i9WLCYxI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683717554; x=1686309554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=83nHV7+JGSLFSC2ddcRrk71dUHMFJqIUpmiDaEHj02c=;
 b=L3wgenczyV2u134Ds25RCPmKVcMsqY5SQrGwLDmlSiDDI3evSulXC9jwa68i338Fkv
 lU5EqotSRQyH1nPjOaOcEsjSvd4Jh4u2bwRctk7dNhoJKAxu/bSNHDgm5rX1beSlHG0r
 Wb+QD6y+a0sgXUy/E4JHe/ZfKQhAmImx58490TFH8EodVU9yWbJabIKneGFrsf/CuQkf
 89QwOyOK3G5KTFk9ULAEpSU5MGSC6R+/1pfnuNn+48FM0Q2nfMnj6ItLNtSpx2d73Xsw
 Guv8JBd+AKHOadmJskQnBevz/oQg3M4gnyGCNCbgyHn29Y4wCW/GJpaEFYiZNAp3fJ+n
 8MAQ==
X-Gm-Message-State: AC+VfDwCKylo3P7ulqskCnPjAc7N2lLB7GDjhXGIjlOayFz6QM0BImG2
 YqbU90m7piR6qVZ3abxKHQsrTxeJNmGTFnEKzHA=
X-Google-Smtp-Source: ACHHUZ4TVO8mdx/RnQNHpjEa+vuKoyBZSZV5e1fRQDPTNpj7BZWP/a8DLgBeNVaoZ4gcQujGqVX9hA==
X-Received: by 2002:a5d:534e:0:b0:306:791:24a9 with SMTP id
 t14-20020a5d534e000000b00306079124a9mr11372496wrv.0.1683717554130; 
 Wed, 10 May 2023 04:19:14 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:97c0:2f0a:108:d273])
 by smtp.gmail.com with ESMTPSA id
 n2-20020a5d4c42000000b003063db8f45bsm17039735wrt.23.2023.05.10.04.19.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 May 2023 04:19:13 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3] target/ppc: Fix fallback to MFSS for MFFS* instructions on
 pre 3.0 ISAs
Date: Wed, 10 May 2023 12:19:13 +0100
Message-Id: <20230510111913.1718734-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x432.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

The following commits changed the code such that the fallback to MFSS for MFFSCRN,
MFFSCRNI, MFFSCE and MFFSL on pre 3.0 ISAs was removed and became an illegal instruction:

  bf8adfd88b547680aa857c46098f3a1e94373160 - target/ppc: Move mffscrn[i] to decodetree
  394c2e2fda70da722f20fb60412d6c0ca4bfaa03 - target/ppc: Move mffsce to decodetree
  3e5bce70efe6bd1f684efbb21fd2a316cbf0657e - target/ppc: Move mffsl to decodetree

The hardware will handle them as a MFFS instruction as the code did previously.
This means applications that were segfaulting under qemu when encountering these
instructions which is used in glibc libm functions for example.

The fallback for MFFSCDRN and MFFSCDRNI added in a later patch was also missing.

This patch restores the fallback to MFSS for these instructions on pre 3.0s ISAs
as the hardware decoder would, fixing the segfaulting libm code. It doesn't have
the fallback for 3.0 onwards to match hardware behaviour.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 target/ppc/insn32.decode           | 20 +++++++++++++-------
 target/ppc/translate/fp-impl.c.inc | 22 ++++++++++++++++------
 2 files changed, 29 insertions(+), 13 deletions(-)

v3 - drop fallback to MFFS for 3.0 ISA to match hardware
v2 - switch to use decodetree pattern groups per feedback

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f8f589e9fd..4fcf3af8d0 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -390,13 +390,19 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
 ### Move To/From FPSCR
 
-MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
-MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
-MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
-MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
-MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
-MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
-MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
+{
+  # Before Power ISA v3.0, MFFS bits 11~15 were reserved and should be ignored
+  MFFS_ISA207     111111 ..... ----- ----- 1001000111 .   @X_t_rc
+  [
+    MFFS            111111 ..... 00000 ----- 1001000111 .   @X_t_rc
+    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
+    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
+    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
+    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
+  ]
+}
 
 ### Decimal Floating-Point Arithmetic Instructions
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 57d8437851..874774eade 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -568,6 +568,22 @@ static void store_fpscr_masked(TCGv_i64 fpscr, uint64_t clear_mask,
     gen_helper_store_fpscr(cpu_env, fpscr_masked, st_mask);
 }
 
+static bool trans_MFFS_ISA207(DisasContext *ctx, arg_X_t_rc *a)
+{
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        /*
+         * Before Power ISA v3.0, MFFS bits 11~15 were reserved, any instruction
+         * with OPCD=63 and XO=583 should be decoded as MFFS.
+         */
+        return trans_MFFS(ctx, a);
+    }
+    /*
+     * For Power ISA v3.0+, return false and let the pattern group
+     * select the correct instruction.
+     */
+    return false;
+}
+
 static bool trans_MFFS(DisasContext *ctx, arg_X_t_rc *a)
 {
     REQUIRE_FPU(ctx);
@@ -584,7 +600,6 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();
@@ -597,7 +612,6 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -614,7 +628,6 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -631,7 +644,6 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -647,7 +659,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -661,7 +672,6 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
 
 static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
 {
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();
-- 
2.39.2


