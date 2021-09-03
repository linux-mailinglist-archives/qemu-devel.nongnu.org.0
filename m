Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7A54003D6
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:07:13 +0200 (CEST)
Received: from localhost ([::1]:46722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCem-0007jk-7D
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:07:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43308)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCZ1-0007Mv-8q
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:15 -0400
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b]:34814)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCYz-00054U-5v
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:14 -0400
Received: by mail-lj1-x22b.google.com with SMTP id f2so10570998ljn.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yMMCcuXLdyaBPmCUgPPerhqNmkQPKptjtBMuOYzNvJs=;
 b=IMbGo6Bhtj/hDuBsuwl0DgAKHW8OnHXFbvQYen7AL2c2r2VAJY0WxiNB1OdNiXcr0B
 xCvmq+7vHXFFQJZKn2Xp1d9lrTB4i62NY1wKKRIu8AjZPYZFb2PnPD86+wPwbuDlNsmq
 lSq2EGugXTBfdydEJNvPcZQzBK9JdSIEsGuqykpxlN7tiVwqDLtksMI1SoZWLV80gorg
 7ihtweuX4VjhgMVFvNAv6WJj3goavGyOhmzmTw2SRSvG4OLKaJAMYrRELfsF8vFUlRAl
 KjEYy75qb9xVNlH0yFtNMJ4BYA/6Fq9TaTuURhK/hFfCFcHSQdqB+jM6PwRyzi12B0oM
 s1tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yMMCcuXLdyaBPmCUgPPerhqNmkQPKptjtBMuOYzNvJs=;
 b=ZqM//wV3/IbXq99CrETHgJCOXkcw6VTvp2O5qxWMxUMKJorejsyLfILt+uNLlF4U21
 iGsbiKe+O4frepZ1O9k5xsDZZG2l6TEEiFDwN4TH/Uzdx88YEBomGLGwwic+DyNyWfr8
 7pEgV3DYcU4iPoiN+xPnRr1p15d60P2cUdo3HX0K91/QpDqWVxO6P0Sdoj5Hs1ef/qYh
 xGdXcBv5cS36b0Y8iqkyM/menQrhW28PQFTr6sj+ljPDjKSbwnN+3bEY9soHrPWaVUaR
 y9Ehwfx+TcAW44PG2fkKobTkLrCkiDpP1EJjfM5sqQHwTA7TR5oL8J0oK+hTjz4oaabr
 2tpA==
X-Gm-Message-State: AOAM531AtkiR+HW+P2vB7QjlHAAFKW4n+UL2B9spw6cS31CjmD5sIJLJ
 ZLuzdsUG26rbXqnK56fVinCXCwS4dlkfPX1JIGk=
X-Google-Smtp-Source: ABdhPJxW+0H9EMjC/NmC0e+kkwL9Bp/g+UdQoT1Op83YPp9XbjEgqWlpHgG05zu35rTkNOhMV3YJig==
X-Received: by 2002:a05:651c:490:: with SMTP id
 s16mr30365ljc.214.1630688469819; 
 Fri, 03 Sep 2021 10:01:09 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:09 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 06/14] target/riscv: Reassign instructions to the
 Zbs-extension
Date: Fri,  3 Sep 2021 19:00:52 +0200
Message-Id: <20210903170100.2529121-7-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22b;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22b.google.com
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
index 860fbc3775..ee8bc7435f 100644
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


