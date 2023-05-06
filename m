Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 82EE76F8F89
	for <lists+qemu-devel@lfdr.de>; Sat,  6 May 2023 08:53:28 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pvBmm-0001md-4f; Sat, 06 May 2023 02:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1pvBmj-0001lr-Ud
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:52:49 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.purdie@linuxfoundation.org>)
 id 1pvBme-0007SC-P3
 for qemu-devel@nongnu.org; Sat, 06 May 2023 02:52:49 -0400
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-306281edf15so2422213f8f.1
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 23:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linuxfoundation.org; s=google; t=1683355962; x=1685947962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VjumudQQk/CWLVl1+7rZiix37mmyHi4PACJ/ym2y3PE=;
 b=FCmWhGrf/NogKtZ4vyKRverb/ReawgjpLQXq7006EwL+/4kFqXvrGAoAjMfW89CV1P
 88xTa/yYBdYNN1qBTF4j5GAdHvXjJykCvOjhdp9py/6qInnk6rEG3aPKvQa/9lukasIf
 xrRcvRFsoaDQ8c80j7oGQOwbPncZdrRsVJvWo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683355962; x=1685947962;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VjumudQQk/CWLVl1+7rZiix37mmyHi4PACJ/ym2y3PE=;
 b=WiOTa50mrzNZ91VMNNwc7RgkWCJaiIXe5ncufaBqp0SskVxFbZ7+Yw6AQd8GoG3FKr
 GUc86jKo2O5gTK+laYTV8VGOHaSkkm2q0h7yaCCwKgNK17S3Ia5ywdrWFEjX/NDLXFC4
 OhUrmybcLDJDxBsPPCwqjRVWIeKDv576vWkf1bAyEzRn06UsHmx/RArVLHkXuwgVMuyF
 dIQAZjSCNXaQS13sEvTT8U+d1p6kxAs/36leCb3350HZ5OgiGPKz1pZQNQxlX6iZlFxQ
 m3sdOLy6ByuOyalYqCiwIAo53pFlAbzEE7cE6OL1WU+JW6iHu3p3hKVr7T+PV/ZbNY/F
 9mMw==
X-Gm-Message-State: AC+VfDwUBj+3KjZzTLqXSP9z1WL42SQvCkmhvs/Pf/PR7zWDrM1txCo7
 Gdmg+NDkTTsrcwHoHznYtIM93GrxFpEOsUjY7Gw=
X-Google-Smtp-Source: ACHHUZ6X61HiyM6ixESuIFeDA/Cnge8ozBMTfAx4UUDquaEUH2m1f6T+1jX9UyPEjFBKv0rMrhcLjA==
X-Received: by 2002:adf:ef4a:0:b0:306:44a9:76a0 with SMTP id
 c10-20020adfef4a000000b0030644a976a0mr3479108wrp.9.1683355962458; 
 Fri, 05 May 2023 23:52:42 -0700 (PDT)
Received: from max.int.rpsys.net ([2001:8b0:aba:5f3c:5ad6:c230:741:f234])
 by smtp.gmail.com with ESMTPSA id
 z4-20020adff744000000b002fbdb797483sm4462803wrp.49.2023.05.05.23.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 05 May 2023 23:52:42 -0700 (PDT)
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2] target/ppc: Fix fallback to MFSS for MFFS* instructions on
 pre 3.0 ISAs
Date: Sat,  6 May 2023 07:52:40 +0100
Message-Id: <20230506065240.3177798-1-richard.purdie@linuxfoundation.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=richard.purdie@linuxfoundation.org;
 helo=mail-wr1-x430.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
as the hardware decoder would, fixing the segfaulting libm code. It and also ensures
the MFSS instruction is used for currently reserved bits to handle other potential
ISA additions more correctly.

Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
---
 target/ppc/insn32.decode           | 19 ++++++++++++-------
 target/ppc/translate/fp-impl.c.inc | 30 ++++++++++++++++++++++++------
 2 files changed, 36 insertions(+), 13 deletions(-)

v2 - switch to use decodetree pattern groups per feedback

diff --git a/target/ppc/insn32.decode b/target/ppc/insn32.decode
index f8f589e9fd..3c4e2c2fc2 100644
--- a/target/ppc/insn32.decode
+++ b/target/ppc/insn32.decode
@@ -390,13 +390,18 @@ SETNBCR         011111 ..... ..... ----- 0111100000 -   @X_bi
 
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
+  [
+    MFFSCE          111111 ..... 00001 ----- 1001000111 -   @X_t
+    MFFSCRN         111111 ..... 10110 ..... 1001000111 -   @X_tb
+    MFFSCDRN        111111 ..... 10100 ..... 1001000111 -   @X_tb
+    MFFSCRNI        111111 ..... 10111 ---.. 1001000111 -   @X_imm2
+    MFFSCDRNI       111111 ..... 10101 --... 1001000111 -   @X_imm3
+    MFFSL           111111 ..... 11000 ----- 1001000111 -   @X_t
+  ]
+  MFFS            111111 ..... ----- ----- 1001000111 .   @X_t_rc
+}
 
 ### Decimal Floating-Point Arithmetic Instructions
 
diff --git a/target/ppc/translate/fp-impl.c.inc b/target/ppc/translate/fp-impl.c.inc
index 57d8437851..10dfd91aa4 100644
--- a/target/ppc/translate/fp-impl.c.inc
+++ b/target/ppc/translate/fp-impl.c.inc
@@ -584,7 +584,10 @@ static bool trans_MFFSCE(DisasContext *ctx, arg_X_t *a)
 {
     TCGv_i64 fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        return false;
+    }
+
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();
@@ -597,7 +600,10 @@ static bool trans_MFFSCRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        return false;
+    }
+
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -614,7 +620,10 @@ static bool trans_MFFSCDRN(DisasContext *ctx, arg_X_tb *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        return false;
+    }
+
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -631,7 +640,10 @@ static bool trans_MFFSCRNI(DisasContext *ctx, arg_X_imm2 *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        return false;
+    }
+
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -647,7 +659,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
 {
     TCGv_i64 t1, fpscr;
 
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        return false;
+    }
+
     REQUIRE_FPU(ctx);
 
     t1 = tcg_temp_new_i64();
@@ -661,7 +676,10 @@ static bool trans_MFFSCDRNI(DisasContext *ctx, arg_X_imm3 *a)
 
 static bool trans_MFFSL(DisasContext *ctx, arg_X_t *a)
 {
-    REQUIRE_INSNS_FLAGS2(ctx, ISA300);
+    if (!(ctx->insns_flags2 & PPC2_ISA300)) {
+        return false;
+    }
+
     REQUIRE_FPU(ctx);
 
     gen_reset_fpstatus();
-- 
2.39.2


