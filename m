Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A9C74078A4
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:10:09 +0200 (CEST)
Received: from localhost ([::1]:52366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3hk-0007ci-P6
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:10:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YV-0002S6-My
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:36 -0400
Received: from mail-lf1-x12a.google.com ([2a00:1450:4864:20::12a]:37663)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YS-0005fH-8M
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:31 -0400
Received: by mail-lf1-x12a.google.com with SMTP id l10so10373288lfg.4
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fDbKXeRCOn8doM4hltDgFnWUb0/luIseF3X5q+IPM+Q=;
 b=U5LutKCWH/qTqyFY6Uld1ocxbbXMDVegxR1yMJYZNazzIb4HjaVKjZ0qUdcf9H3036
 Of9k/GiiwYM4NFiVWe51c5g+aa2Xm0/+60Fc65S9pMhv7XQCjhhozaai0vEpuR90W1NH
 h0Xtmc7+4NnEOZyrG1LhYQcgMuoSr0KvtEvGGdpKE3UxQYyrfkHl5ac6Ojk8g+uwvzDj
 yJJHYUbxJOOzqVUHBxH8gH0NH2CFq1de43twhBR8fLvFEfxPKeZy+M8hCDUFocrJ9HA3
 f5SsdhX7N2BhsePamMxVNPx/sdNazlHuBDvDpLCW4ILMrCj+/XnJhrEMaaPWmBnr1oCz
 9f5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fDbKXeRCOn8doM4hltDgFnWUb0/luIseF3X5q+IPM+Q=;
 b=apr4PBJ0xAGy55ZJxXTGPMX2v7MvXhfshZJ/PNarHMyP02NZpq0vZCNjsgBhHHoBIw
 1LqXl+A7I0ZVmKFk/YTJY5OJ1TVhnQPZB1U5sSEKFehxVrdQQ+44AFd+N36h3y+07aGU
 Z+0Jzs6BBRlsIkVhhlzH0/uFFi5/dRbgeA72U4p+aJSCupIKNbQuAiugUkbBJTcOzEqv
 HesC1XiGUs8R0Pbfz4Sns+Y5RdBeI62tbZnRZw+vR0AOJfMKn1sQT5x09tiTLIoiUj5a
 eFzmtaLof5hxivRbgOXj2HhHEC7FNvlgBsSvqLRsL3o0SBuuXDyoDuyN0E/9h7PlVYxF
 fy+A==
X-Gm-Message-State: AOAM531FDSsMgoLtEK2eY4Uskjd8fLrA6wsz4+ZDCNWaH97MGOAfOxhb
 UdHXWEBw/nhXhO0zRxAcaR6AjP9YaxwsKJEs
X-Google-Smtp-Source: ABdhPJx3yPE7ydDhaVpspOld6hPobg+CvOJWQftcRY+7T6hvOxt86pUORe4lg/GNsmWvbMFKJbyduw==
X-Received: by 2002:a05:6512:684:: with SMTP id
 t4mr2103184lfe.399.1631368826491; 
 Sat, 11 Sep 2021 07:00:26 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:26 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 08/16] target/riscv: Reassign instructions to the
 Zbs-extension
Date: Sat, 11 Sep 2021 16:00:08 +0200
Message-Id: <20210911140016.834071-9-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lf1-x12a.google.com
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

The following instructions are part of Zbs:
 - b{set,clr,ext,inv}
 - b{set,clr,ext,inv}i

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Acked-by: Bin Meng <bmeng.cn@gmail.com>
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
index a5bf40f95b..861364e3e5 100644
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


