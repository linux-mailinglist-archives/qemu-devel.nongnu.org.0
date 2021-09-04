Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E09E0400CEC
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:39:51 +0200 (CEST)
Received: from localhost ([::1]:59266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcS6-0005I2-SW
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:39:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54372)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNw-0005x0-Hz
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:32 -0400
Received: from mail-lf1-x130.google.com ([2a00:1450:4864:20::130]:47004)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNs-0002w2-Rf
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:31 -0400
Received: by mail-lf1-x130.google.com with SMTP id t19so5304631lfe.13
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=nW1AmF80GQibnJUz/lpsEwkkMCzOQ1t43DsbHzBdtVA=;
 b=llrPqEGOefid3tYtRys0RxA37lIJ4nGQn0aJ3sbnFEQkecoNklCZ7P2KglxUxcvcqL
 IIRTuc1lY2c5P4TT/7JyLrNgWFSwug2aMaMrclrer5DQ6NGzBXjra6guKKC5s4IU7HnW
 Fyfd+yoTdFep+z4pUJvk3pbfpUbl1O1bjRTpdpOHk5Y9p5MsFiABGj7qQRYVSxO6VV3t
 mV3fUOdmpMi0PnhfMXtasFHo+gEsK/K3dXTFx+dpHpiRPelqU71jRSieyzz/y4q4J8u3
 2bep0jtCM2cxyQrYC5PSUC4BpUhOlMVfAaKArnaVRdPFG5qXLSoVRxajuntfR9KQSzaC
 Grfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=nW1AmF80GQibnJUz/lpsEwkkMCzOQ1t43DsbHzBdtVA=;
 b=ECwZ44Cam+SkZZDZCmVoNsCcHpLwHINMl8IkiNVmSgmd9xiRWaeG0Q1mM9eFIRDzci
 BxVeS/+HtQC2f78V/9Ug74wXupItnpwMtxYxB3RDYwuwV4IZe6RCvp+w6Y3Pw5fbriRu
 HAbUNi8FgyxthjrXapKsj8CAeTkognEcJu0rh0+dvc8Yq8dU1Dbduep414Tob3M/hDhZ
 ipEWJYpNvHuYvdv0vqu7HpeZRBQCqHL5n21JPRN0c3R70Jo4gyJu2bNAYHABYb7CJn/z
 l1PHx3dyvUfaKcLcq8KJyep+zre8HCSCS5aN+5V3wCHrIqYZRf9Wvej4RtTbridH1btG
 0Gkw==
X-Gm-Message-State: AOAM530A+DlbSeBHBppcH+FHtLvB5IvBj7uKuoHuQizRKXaWH3xXGo8F
 VLIXZy17E+fHv5opdkxigIanz4rGOFTUMqBtgRc=
X-Google-Smtp-Source: ABdhPJxcm9ldhiCUw+LVsb2u6/MLMSFtW0l7hPR+9llK9gdyoas+IL67pCzvefFM3PUlfeAi3hR4mA==
X-Received: by 2002:a05:6512:15a2:: with SMTP id
 bp34mr4022505lfb.221.1630787727135; 
 Sat, 04 Sep 2021 13:35:27 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:26 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 10/16] target/riscv: Reassign instructions to the
 Zbb-extension
Date: Sat,  4 Sep 2021 22:35:09 +0200
Message-Id: <20210904203516.2570119-11-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::130;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x130.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This reassigns the instructions that are part of Zbb into it, with the
notable exceptions of the instructions (rev8, zext.w and orc.b) that
changed due to gorci, grevi and pack not being part of Zb[abcs].

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- The changes to the Zbb instructions (i.e. use the REQUIRE_ZBB macro)
  are now in a separate commit.

 target/riscv/insn32.decode              | 40 ++++++++++---------
 target/riscv/insn_trans/trans_rvb.c.inc | 51 ++++++++++++++-----------
 2 files changed, 50 insertions(+), 41 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 1658bb4217..a509cfee11 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -672,45 +672,47 @@ sh2add_uw  0010000 .......... 100 ..... 0111011 @r
 sh3add_uw  0010000 .......... 110 ..... 0111011 @r
 slli_uw    00001 ............ 001 ..... 0011011 @sh
 
-# *** RV32B Standard Extension ***
+# *** RV32 Zbb Standard Extension ***
+andn       0100000 .......... 111 ..... 0110011 @r
 clz        011000 000000 ..... 001 ..... 0010011 @r2
-ctz        011000 000001 ..... 001 ..... 0010011 @r2
 cpop       011000 000010 ..... 001 ..... 0010011 @r2
+ctz        011000 000001 ..... 001 ..... 0010011 @r2
+max        0000101 .......... 110 ..... 0110011 @r
+maxu       0000101 .......... 111 ..... 0110011 @r
+min        0000101 .......... 100 ..... 0110011 @r
+minu       0000101 .......... 101 ..... 0110011 @r
+orn        0100000 .......... 110 ..... 0110011 @r
+rol        0110000 .......... 001 ..... 0110011 @r
+ror        0110000 .......... 101 ..... 0110011 @r
+rori       01100 ............ 101 ..... 0010011 @sh
 sext_b     011000 000100 ..... 001 ..... 0010011 @r2
 sext_h     011000 000101 ..... 001 ..... 0010011 @r2
-
-andn       0100000 .......... 111 ..... 0110011 @r
-orn        0100000 .......... 110 ..... 0110011 @r
 xnor       0100000 .......... 100 ..... 0110011 @r
+
+# *** RV64 Zbb Standard Extension (in addition to RV32 Zbb) ***
+clzw       0110000 00000 ..... 001 ..... 0011011 @r2
+ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
+cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+rolw       0110000 .......... 001 ..... 0111011 @r
+roriw      0110000 .......... 101 ..... 0011011 @sh5
+rorw       0110000 .......... 101 ..... 0111011 @r
+
+# *** RV32B Standard Extension ***
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
-min        0000101 .......... 100 ..... 0110011 @r
-minu       0000101 .......... 101 ..... 0110011 @r
-max        0000101 .......... 110 ..... 0110011 @r
-maxu       0000101 .......... 111 ..... 0110011 @r
-ror        0110000 .......... 101 ..... 0110011 @r
-rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
 
-rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
-clzw       0110000 00000 ..... 001 ..... 0011011 @r2
-ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
-cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
-
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-rorw       0110000 .......... 101 ..... 0111011 @r
-rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
 
-roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index bc98f289b3..9768271639 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the Zb[acs] Standard Extension.
+ * RISC-V translation routines for the Zb[abcs] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,6 +24,12 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBB(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbb) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 #define REQUIRE_ZBC(ctx) do {                    \
     if (!RISCV_CPU(ctx->cs)->cfg.ext_zbc) {      \
         return false;                            \
@@ -40,9 +46,10 @@ static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
+
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, gen_clz);
 }
 
@@ -53,31 +60,31 @@ static void gen_ctz(TCGv ret, TCGv arg1)
 
 static bool trans_ctz(DisasContext *ctx, arg_ctz *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, gen_ctz);
 }
 
 static bool trans_cpop(DisasContext *ctx, arg_cpop *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
 
 static bool trans_andn(DisasContext *ctx, arg_andn *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_andc_tl);
 }
 
 static bool trans_orn(DisasContext *ctx, arg_orn *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_orc_tl);
 }
 
 static bool trans_xnor(DisasContext *ctx, arg_xnor *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_NONE, tcg_gen_eqv_tl);
 }
 
@@ -124,37 +131,37 @@ static bool trans_packh(DisasContext *ctx, arg_packh *a)
 
 static bool trans_min(DisasContext *ctx, arg_min *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smin_tl);
 }
 
 static bool trans_max(DisasContext *ctx, arg_max *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_smax_tl);
 }
 
 static bool trans_minu(DisasContext *ctx, arg_minu *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umin_tl);
 }
 
 static bool trans_maxu(DisasContext *ctx, arg_maxu *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_arith(ctx, a, EXT_SIGN, tcg_gen_umax_tl);
 }
 
 static bool trans_sext_b(DisasContext *ctx, arg_sext_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext8s_tl);
 }
 
 static bool trans_sext_h(DisasContext *ctx, arg_sext_h *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, tcg_gen_ext16s_tl);
 }
 
@@ -250,19 +257,19 @@ static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 
 static bool trans_ror(DisasContext *ctx, arg_ror *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotr_tl);
 }
 
 static bool trans_rori(DisasContext *ctx, arg_rori *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift_imm_fn(ctx, a, EXT_NONE, tcg_gen_rotri_tl);
 }
 
 static bool trans_rol(DisasContext *ctx, arg_rol *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
@@ -337,7 +344,7 @@ static void gen_clzw(TCGv ret, TCGv arg1)
 static bool trans_clzw(DisasContext *ctx, arg_clzw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_ZERO, gen_clzw);
 }
 
@@ -350,14 +357,14 @@ static void gen_ctzw(TCGv ret, TCGv arg1)
 static bool trans_ctzw(DisasContext *ctx, arg_ctzw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     return gen_unary(ctx, a, EXT_NONE, gen_ctzw);
 }
 
 static bool trans_cpopw(DisasContext *ctx, arg_cpopw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w = true;
     return gen_unary(ctx, a, EXT_ZERO, tcg_gen_ctpop_tl);
 }
@@ -414,7 +421,7 @@ static void gen_rorw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w = true;
     return gen_shift(ctx, a, EXT_NONE, gen_rorw);
 }
@@ -422,7 +429,7 @@ static bool trans_rorw(DisasContext *ctx, arg_rorw *a)
 static bool trans_roriw(DisasContext *ctx, arg_roriw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w = true;
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_rorw);
 }
@@ -448,7 +455,7 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBB(ctx);
     ctx->w = true;
     return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
-- 
2.25.1


