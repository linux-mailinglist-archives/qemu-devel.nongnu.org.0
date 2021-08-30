Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 991823FB476
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Aug 2021 13:20:52 +0200 (CEST)
Received: from localhost ([::1]:39372 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mKfLP-0000Fk-M7
	for lists+qemu-devel@lfdr.de; Mon, 30 Aug 2021 07:20:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39266)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGh-00076N-TQ
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:59 -0400
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236]:38522)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mKfGb-0004YL-L5
 for qemu-devel@nongnu.org; Mon, 30 Aug 2021 07:15:59 -0400
Received: by mail-lj1-x236.google.com with SMTP id c12so25244284ljr.5
 for <qemu-devel@nongnu.org>; Mon, 30 Aug 2021 04:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5wl5BEjCMsqlfaxLZWV8QWmwwmKLVxBeWMsVg1xjg+A=;
 b=dSe8B2s+yezWwYnYPr/S9LH9bQ8mLWpYaqP0HMay8DoJinGdyeeNiwLhsGtYi2aPyg
 JqDrYHv0NkDl3nKVKOA4HLT5iOhOc13E9YAsNXH6M2wmHKGqAZnFc3ABWO9atY8i9ErL
 EhsE2Xp6oSCDsrei8+JgrtO9AjP6129hmSYH3KffEJMlHyA9JT4KkIZiZZKs8DICWVt6
 UXjymUyHWtbIOcM9iG70YxuN4l8HuqV9UbUeN9tW7+KDq+cAQHF2IZCeOua1QI+218A6
 ipXXtrd104ZljVQ1g9ffeCNSRaq0PWPaAPwL354nT0/sHUbIyiecG7mqJtbe0pPuAjLi
 hZkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5wl5BEjCMsqlfaxLZWV8QWmwwmKLVxBeWMsVg1xjg+A=;
 b=KHHjRZEha2Z0MgPdPZVUchuWN3IBMbw+fWGs8PmP3QkxUD/uRBUwP8UgjWFV/LFF5m
 oQu/YJs96xJLAgQnrBc3QVwRlMsNJWzSczCdTa8LEVMkJ9YWd0KD+L+pXpZFDLaGFmzL
 wcrBSNdzxGELJt2We/sWgCd6ra24qdJ2lMbELzMCiLiX1sJ/nmu3e0rD0QkX+/tLcNIp
 pL1UixS/aKEJhxjKf2Ry5gbPEJCSx0HyO9tF0OmIilaMCW2F56p0e9Tq+BI3HxmuSbUJ
 c15p+Z2TGAHCLhu+HJtBhEjJoVhRLj0DFpO7n8249Zc44nC/G3+I7ia7se5se1dubnDE
 M37w==
X-Gm-Message-State: AOAM531oO1Y6lxzaqUP5WIvI1awCS9+kfMslhHud54nq4XQa97Vll5v6
 jXX/W+GvPCjQhaE3rDCiE/iyiJsoAlPropWL
X-Google-Smtp-Source: ABdhPJzBsbDJSJQeotSXSkobxsRHkEgvC87q06ADnWVB/oNZ7slgvWNeRbTzLSJVSZ/Ab54+wrlGpw==
X-Received: by 2002:a2e:2417:: with SMTP id k23mr20091011ljk.256.1630322151941; 
 Mon, 30 Aug 2021 04:15:51 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id j3sm1790129ljq.84.2021.08.30.04.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Aug 2021 04:15:51 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 09/14] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
Date: Mon, 30 Aug 2021 13:15:07 +0200
Message-Id: <20210830111511.1905048-10-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
References: <20210830111511.1905048-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::236;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x236.google.com
X-Spam_score_int: 0
X-Spam_score: 0.0
X-Spam_bar: /
X-Spam_report: (0.0 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 1.0.0 version of Zbb does not contain gorc/gorci.  Instead, a
orc.b instruction (equivalent to the orc.b pseudo-instruction built on
gorci from pre-0.93 draft-B) is available, mainly targeting
string-processing workloads.

This commit adds the new orc.b instruction and removed gorc/gorci.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

---

Changes in v7:
- Free TCG temporary in gen_orc_b().

Changes in v6:
- Fixed orc.b (now passes SPEC w/ optimized string functions) by
  adding the missing final negation.

Changes in v4:
- Change orc.b to implementation suggested by Richard Henderson

Changes in v3:
- Moved orc.b and gorc/gorci changes into separate commit.
- Using the simpler orc.b implementation suggested by Richard Henderson

 target/riscv/bitmanip_helper.c          | 26 ----------------
 target/riscv/helper.h                   |  2 --
 target/riscv/insn32.decode              |  6 +---
 target/riscv/insn_trans/trans_rvb.c.inc | 40 ++++++++++++-------------
 target/riscv/translate.c                |  6 ----
 5 files changed, 21 insertions(+), 59 deletions(-)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index 73be5a81c7..bb48388fcd 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -64,32 +64,6 @@ target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
     return do_grev(rs1, rs2, 32);
 }
 
-static target_ulong do_gorc(target_ulong rs1,
-                            target_ulong rs2,
-                            int bits)
-{
-    target_ulong x = rs1;
-    int i, shift;
-
-    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
-        if (rs2 & shift) {
-            x |= do_swap(x, adjacent_masks[i], shift);
-        }
-    }
-
-    return x;
-}
-
-target_ulong HELPER(gorc)(target_ulong rs1, target_ulong rs2)
-{
-    return do_gorc(rs1, rs2, TARGET_LONG_BITS);
-}
-
-target_ulong HELPER(gorcw)(target_ulong rs1, target_ulong rs2)
-{
-    return do_gorc(rs1, rs2, 32);
-}
-
 target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result = 0;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index c559c860a7..80561e8866 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -61,8 +61,6 @@ DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 /* Bitmanip */
 DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(gorc, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(gorcw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index faa56836d8..8bcb602455 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -680,6 +680,7 @@ max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
 min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
+orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
@@ -701,19 +702,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
 grev       0110100 .......... 101 ..... 0110011 @r
-gorc       0010100 .......... 101 ..... 0110011 @r
-
 grevi      01101. ........... 101 ..... 0010011 @sh
-gorci      00101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
 grevw      0110100 .......... 101 ..... 0111011 @r
-gorcw      0010100 .......... 101 ..... 0111011 @r
 
 greviw     0110100 .......... 101 ..... 0011011 @sh5
-gorciw     0010100 .......... 101 ..... 0011011 @sh5
 
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index 03b3724c96..cb4aa168fb 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -215,18 +215,32 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_grevi(ctx, a);
 }
 
-static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+static void gen_orc_b(TCGv ret, TCGv source1)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_gorc);
+    TCGv  tmp = tcg_temp_new();
+
+    /* Set msb in each byte if the byte was zero. */
+    tcg_gen_subi_tl(tmp, source1, dup_const(MO_8, 0x01));
+    tcg_gen_andc_tl(tmp, tmp, source1);
+    tcg_gen_andi_tl(tmp, tmp, dup_const(MO_8, 0x80));
+
+    /* Replicate the msb of each byte across the byte. */
+    tcg_gen_shri_tl(tmp, tmp, 7);
+    tcg_gen_muli_tl(tmp, tmp, 0xff);
+
+    /* Negate */
+    tcg_gen_not_tl(ret, tmp);
+
+    tcg_temp_free(tmp);
 }
 
-static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shifti(ctx, a, gen_helper_gorc);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &gen_orc_b);
 }
 
+
 #define GEN_TRANS_SHADD(SHAMT)                                             \
 static bool trans_sh##SHAMT##add(DisasContext *ctx, arg_sh##SHAMT##add *a) \
 {                                                                          \
@@ -308,20 +322,6 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     return gen_shiftiw(ctx, a, gen_grevw);
 }
 
-static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_gorcw);
-}
-
-static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_gorcw);
-}
-
 #define GEN_TRANS_SHADD_UW(SHAMT)                             \
 static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index fc22ae82d0..5c099ff007 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -710,12 +710,6 @@ static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
     gen_helper_grev(ret, arg1, arg2);
 }
 
-static void gen_gorcw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_gorcw(ret, arg1, arg2);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
-- 
2.25.1


