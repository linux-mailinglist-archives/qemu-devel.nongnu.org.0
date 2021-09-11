Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B6BE40789B
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:03:30 +0200 (CEST)
Received: from localhost ([::1]:36520 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3bN-0005HZ-87
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:03:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YU-0002R2-BC
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:30 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:43841)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YP-0005d7-Ua
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:30 -0400
Received: by mail-lf1-x134.google.com with SMTP id h16so10350435lfk.10
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UrugHd5AdxT+1/u890pdl7jVMrh+pwlXyGYA013pOSs=;
 b=ZXAVuab+Hs7y3rNN3RLnExth41bMgAo6gtOoHrAF62y6ybI3jLD95yTNd6MzwS6cZ1
 +vBRg2Ti0I+0dJQaeHpn5381JUZEuSXs7TnKg4An5vQfoGngSlLffbMCTmGiI7cyKnT6
 LshoCWGNsBwahChbzz21pidLnISASL3pDzARVEgMhVCFRLf1PPhFnSAhPXYQRUdGHjL0
 vwJyZDl2fC8xOxeO7g+vMlpFXSbVOgQn6ZP+Wo8p8JBPDSZleKIswunNRobsuVFIWytQ
 kTPBHWABB/gq3/5VXVUFy5mDBiBZYx8J7T6UxeZ5xmyfT3t3AIVIOlh+eVo2ISxZded7
 Wpnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UrugHd5AdxT+1/u890pdl7jVMrh+pwlXyGYA013pOSs=;
 b=GarjmXEjz1lBTxsAt0STliPHAp+Ji0xPDzljLLeROK1b+LZN8ht/uxjBHOmy+yMsJH
 2/DJj4tv7PqRuvM6YkODI0VFmLYvGxwiUnjalSQCCJvo+zhtrDnywhM2oZPA0CDyPw6V
 X0G5jOrUP6bcqK+8+IreXm0Qs5dvCT2rj5vT47NkgXY7dhxgzZ3IjbklTvWqw27a5J0K
 FnLGIpjf6y3RoURVdyFt5lZoq3/nruGWdoL6FaKM61ou2iGjtd+1z+TcUeJwukLg/fXZ
 yuDvv0DJ/gYQgFf7YQQEitB03bYQbFL+4dweZo3tCU0CWih/DVkevHueY2BIEYs1MDpd
 DVYg==
X-Gm-Message-State: AOAM532MhqIN5e1kKoiukIPzb6IRsyBoEwyWBW8Aoze9mcGGEhRGC76q
 6je/cP71lxVwI+4++PfERizoxq49vtkaNUnc
X-Google-Smtp-Source: ABdhPJw16pNx9mJIAP0kSoY2li8FvagIw7FpeWXyCNdhz3Gee5bbE7ply6tqbXRze6VWsH80DYvTpA==
X-Received: by 2002:a05:6512:130b:: with SMTP id
 x11mr2232548lfu.366.1631368824141; 
 Sat, 11 Sep 2021 07:00:24 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:23 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 05/16] target/riscv: Reassign instructions to the
 Zba-extension
Date: Sat, 11 Sep 2021 16:00:05 +0200
Message-Id: <20210911140016.834071-6-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::134;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x134.google.com
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
 Kito Cheng <kito.cheng@sifive.com>, Bin Meng <bmeng.cn@gmail.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The following instructions are part of Zba:
 - add.uw (RV64 only)
 - sh[123]add (RV32 and RV64)
 - sh[123]add.uw (RV64-only)
 - slli.uw (RV64-only)

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
---

(no changes since v10)

Changes in v10:
- Split off gen_add_uw() fix into a separate patch, as requested.

Changes in v9:
- Rebased to 8880cc4362.
- Update gen_add_uw() to use a temporary instead of messing with
  arg1 (fixes a regression after rebase on CF3 and SPEC2017).

Changes in v3:
- The changes to the Zba instructions (i.e. the REQUIRE_ZBA macro
  and its use for qualifying the Zba instructions) are moved into
  a separate commit.

 target/riscv/insn32.decode              | 20 ++++++++++++--------
 target/riscv/insn_trans/trans_rvb.c.inc | 16 +++++++++++-----
 2 files changed, 23 insertions(+), 13 deletions(-)

diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 2cd921d51c..86f1166dab 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -660,6 +660,18 @@ vamomaxd_v      10100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamominud_v     11000 . . ..... ..... 111 ..... 0101111 @r_wdvm
 vamomaxud_v     11100 . . ..... ..... 111 ..... 0101111 @r_wdvm
 
+# *** RV32 Zba Standard Extension ***
+sh1add     0010000 .......... 010 ..... 0110011 @r
+sh2add     0010000 .......... 100 ..... 0110011 @r
+sh3add     0010000 .......... 110 ..... 0110011 @r
+
+# *** RV64 Zba Standard Extension (in addition to RV32 Zba) ***
+add_uw     0000100 .......... 000 ..... 0111011 @r
+sh1add_uw  0010000 .......... 010 ..... 0111011 @r
+sh2add_uw  0010000 .......... 100 ..... 0111011 @r
+sh3add_uw  0010000 .......... 110 ..... 0111011 @r
+slli_uw    00001 ............ 001 ..... 0011011 @sh
+
 # *** RV32B Standard Extension ***
 clz        011000 000000 ..... 001 ..... 0010011 @r2
 ctz        011000 000001 ..... 001 ..... 0010011 @r2
@@ -687,9 +699,6 @@ ror        0110000 .......... 101 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
 gorc       0010100 .......... 101 ..... 0110011 @r
-sh1add     0010000 .......... 010 ..... 0110011 @r
-sh2add     0010000 .......... 100 ..... 0110011 @r
-sh3add     0010000 .......... 110 ..... 0110011 @r
 
 bseti      00101. ........... 001 ..... 0010011 @sh
 bclri      01001. ........... 001 ..... 0010011 @sh
@@ -718,10 +727,6 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 rolw       0110000 .......... 001 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
 gorcw      0010100 .......... 101 ..... 0111011 @r
-sh1add_uw  0010000 .......... 010 ..... 0111011 @r
-sh2add_uw  0010000 .......... 100 ..... 0111011 @r
-sh3add_uw  0010000 .......... 110 ..... 0111011 @r
-add_uw     0000100 .......... 000 ..... 0111011 @r
 
 bsetiw     0010100 .......... 001 ..... 0011011 @sh5
 bclriw     0100100 .......... 001 ..... 0011011 @sh5
@@ -732,4 +737,3 @@ roriw      0110000 .......... 101 ..... 0011011 @sh5
 greviw     0110100 .......... 101 ..... 0011011 @sh5
 gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
-slli_uw    00001. ........... 001 ..... 0011011 @sh
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 73d1e45026..fd549c7b0f 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -1,8 +1,9 @@
 /*
- * RISC-V translation routines for the RVB Standard Extension.
+ * RISC-V translation routines for the RVB draft and Zba Standard Extension.
  *
  * Copyright (c) 2020 Kito Cheng, kito.cheng@sifive.com
  * Copyright (c) 2020 Frank Chang, frank.chang@sifive.com
+ * Copyright (c) 2021 Philipp Tomsich, philipp.tomsich@vrull.eu
  *
  * This program is free software; you can redistribute it and/or modify it
  * under the terms and conditions of the GNU General Public License,
@@ -17,6 +18,11 @@
  * this program.  If not, see <http://www.gnu.org/licenses/>.
  */
 
+#define REQUIRE_ZBA(ctx) do {                    \
+    if (!RISCV_CPU(ctx->cs)->cfg.ext_zba) {      \
+        return false;                            \
+    }                                            \
+} while (0)
 
 static void gen_clz(TCGv ret, TCGv arg1)
 {
@@ -339,7 +345,7 @@ GEN_SHADD(3)
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
-    REQUIRE_EXT(ctx, RVB);                                                 \
+    REQUIRE_ZBA(ctx);                                                      \
     return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add);                \
 }
 
@@ -616,7 +622,7 @@ static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
 {                                                             \
     REQUIRE_64BIT(ctx);                                       \
-    REQUIRE_EXT(ctx, RVB);                                    \
+    REQUIRE_ZBA(ctx);                                         \
     return gen_arith(ctx, a, EXT_NONE, gen_sh##SHAMT##add_uw);  \
 }
 
@@ -635,7 +641,7 @@ static void gen_add_uw(TCGv ret, TCGv arg1, TCGv arg2)
 static bool trans_add_uw(DisasContext *ctx, arg_add_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
     return gen_arith(ctx, a, EXT_NONE, gen_add_uw);
 }
 
@@ -647,6 +653,6 @@ static void gen_slli_uw(TCGv dest, TCGv src, target_long shamt)
 static bool trans_slli_uw(DisasContext *ctx, arg_slli_uw *a)
 {
     REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
+    REQUIRE_ZBA(ctx);
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_slli_uw);
 }
-- 
2.25.1


