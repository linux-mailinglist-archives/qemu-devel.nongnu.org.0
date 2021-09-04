Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D7EC400CF4
	for <lists+qemu-devel@lfdr.de>; Sat,  4 Sep 2021 22:46:49 +0200 (CEST)
Received: from localhost ([::1]:45070 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMcYp-0006Nk-SK
	for lists+qemu-devel@lfdr.de; Sat, 04 Sep 2021 16:46:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54362)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNv-0005wO-UX
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:32 -0400
Received: from mail-lf1-x12b.google.com ([2a00:1450:4864:20::12b]:42523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMcNs-0002v6-2f
 for qemu-devel@nongnu.org; Sat, 04 Sep 2021 16:35:30 -0400
Received: by mail-lf1-x12b.google.com with SMTP id t12so5327109lfg.9
 for <qemu-devel@nongnu.org>; Sat, 04 Sep 2021 13:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5dHAXq//g/AqUfLb7JWz95lR0xnkPOlYHD2HKpaX/Pk=;
 b=ElNqW9k1Xz27aYl7NKdM4PDP/Ee5fYsIMJfp13B3DVeXCDrINcyI1omfL1IzcJ/Xp0
 SbtaWLTKWyQYwFi3558rgsbYENU7YTH//YycJWFb3XCdQgxUuR6EVNuEQxUcSZ5u0LL3
 NVlMVMFcKXwOlSnceWYCFkxFx1eJnpLquKY8turwgCS5dROuCHrwuERjf8CJnHVvvei6
 c99B3uPWaBX2MfRJ43lVitAYGKLD9LdpgeN5cPr5U+srmD+MOGhu9K1MozdLO3aAS29l
 NpBfqLU6/62uhAMv7Zgbd24QSZP39s4cr7H7HVKjwesiVXpW/uHDQ3ENV3vgwd4/Aaca
 1RmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5dHAXq//g/AqUfLb7JWz95lR0xnkPOlYHD2HKpaX/Pk=;
 b=K3sqJT4A29cBeLADzRreosFzXoHli9IWcRLdTsnsGh26t2rEM5EZBCfTvp4+9xpPH6
 ELAudIiIy4SwZ8YALffDOecd3aYpJ2fLEBASRGfqMlz/Xb983/nguzcJ7Rn2t/XjDqty
 aihukI8mxknaLz+CWqjohvQczhsEyMoC+yF8Ps9Ge2J4WFhUTTJs5XTdgwU7ojLU1V5C
 6nAAJFzpQAjpsvPfm1h5aNs1DdMN5d+k75bxgj3hEfinIb852mvuMjSL6lAK6AzaHZhO
 4XPZ44/QCCOiDZnfWljwIOeIKAaJ9eF9+clqCVwkc1OM8y/TMtw0HHiC1L5Gk50Du4w9
 PkDw==
X-Gm-Message-State: AOAM530bE2BrMrgc6L3AxQx7gG0f1RU1RFvB6p9aVHbAq7jckIWrfn0j
 MgTlDWp1cF6R4ajr0po9Gr6vjhCExXEViosj4FE=
X-Google-Smtp-Source: ABdhPJyBD1rNyw6EGoVbYYMUKX7kbeZw/YbrUINepVzuHyRzOMvsz/meYarh3hfstGv702BVEySZ/g==
X-Received: by 2002:a05:6512:13a3:: with SMTP id
 p35mr3812062lfa.272.1630787725677; 
 Sat, 04 Sep 2021 13:35:25 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id v15sm326304lfq.142.2021.09.04.13.35.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Sep 2021 13:35:25 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v10 08/16] target/riscv: Reassign instructions to the
 Zbs-extension
Date: Sat,  4 Sep 2021 22:35:07 +0200
Message-Id: <20210904203516.2570119-9-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
References: <20210904203516.2570119-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12b.google.com
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

The following instructions are part of Zbs:
 - b{set,clr,ext,inv}
 - b{set,clr,ext,inv}i

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v3)

Changes in v3:
- The changes to the Zbs instructions (i.e. the REQUIRE_ZBS macro) and
  its use for qualifying the Zba instructions) are moved into a
  separate commit.

 target/riscv/insn32.decode              | 17 +++++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 25 +++++++++++++++----------
 2 files changed, 24 insertions(+), 18 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index e0f6e315a2..35a3563ff4 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -689,19 +689,11 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
-bset       0010100 .......... 001 ..... 0110011 @r
-bclr       0100100 .......... 001 ..... 0110011 @r
-binv       0110100 .......... 001 ..... 0110011 @r
-bext       0100100 .......... 101 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
 
-bseti      00101. ........... 001 ..... 0010011 @sh
-bclri      01001. ........... 001 ..... 0010011 @sh
-binvi      01101. ........... 001 ..... 0010011 @sh
-bexti      01001. ........... 101 ..... 0010011 @sh
 rori       01100. ........... 101 ..... 0010011 @sh
 grevi      01101. ........... 101 ..... 0010011 @sh
 gorci      00101. ........... 101 ..... 0010011 @sh
@@ -722,3 +714,12 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
+# *** RV32 Zbs Standard Extension ***
+bclr       0100100 .......... 001 ..... 0110011 @r
+bclri      01001. ........... 001 ..... 0010011 @sh
+bext       0100100 .......... 101 ..... 0110011 @r
+bexti      01001. ........... 101 ..... 0010011 @sh
+binv       0110100 .......... 001 ..... 0110011 @r
+binvi      01101. ........... 001 ..... 0010011 @sh
+bset       0010100 .......... 001 ..... 0110011 @r
+bseti      00101. ........... 001 ..... 0010011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 9891c4912a..2c2e4bc3d7 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,5 +1,5 @@
 /*
- * RISC-V translation routines for the RVB draft and Zba Standard Extension.
+ * RISC-V translation routines for the RVB draft Zb[as] Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
@@ -24,11 +24,16 @@
     }                                            \
 } while (0)
 
+#define REQUIRE_ZBS(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zbs) {      \
+        return false;                            \
+    }                                            \
+} while (0)
+
 static void gen_clz(TCGv ret, TCGv arg1)
 {
     tcg_gen_clzi_tl(ret, arg1, TARGET_LONG_BITS);
 }
-
 static bool trans_clz(DisasContext *ctx, arg_clz *a)
 {
     REQUIRE_EXT(ctx, RVB);
@@ -165,13 +170,13 @@ static void gen_bset(TCGv ret, TCGv arg1, TCGv shamt)
 
 static bool trans_bset(DisasContext *ctx, arg_bset *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_bset);
 }
 
 static bool trans_bseti(DisasContext *ctx, arg_bseti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bset);
 }
 
@@ -187,13 +192,13 @@ static void gen_bclr(TCGv ret, TCGv arg1, TCGv shamt)
 
 static bool trans_bclr(DisasContext *ctx, arg_bclr *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_bclr);
 }
 
 static bool trans_bclri(DisasContext *ctx, arg_bclri *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bclr);
 }
 
@@ -209,13 +214,13 @@ static void gen_binv(TCGv ret, TCGv arg1, TCGv shamt)
 
 static bool trans_binv(DisasContext *ctx, arg_binv *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_binv);
 }
 
 static bool trans_binvi(DisasContext *ctx, arg_binvi *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_binv);
 }
 
@@ -227,13 +232,13 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
 
 static bool trans_bext(DisasContext *ctx, arg_bext *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift(ctx, a, EXT_NONE, gen_bext);
 }
 
 static bool trans_bexti(DisasContext *ctx, arg_bexti *a)
 {
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBS(ctx);
     return gen_shift_imm_tl(ctx, a, EXT_NONE, gen_bext);
 }
 
-- 
2.25.1


