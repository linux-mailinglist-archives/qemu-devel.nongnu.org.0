Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AEB603F7B4E
	for <lists+qemu-devel@lfdr.de>; Wed, 25 Aug 2021 19:14:00 +0200 (CEST)
Received: from localhost ([::1]:47090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIwTK-0006KZ-Ia
	for lists+qemu-devel@lfdr.de; Wed, 25 Aug 2021 13:13:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45254)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFk-0004oW-M8
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:52 -0400
Received: from mail-lj1-x22a.google.com ([2a00:1450:4864:20::22a]:45846)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mIwFi-0000ed-LZ
 for qemu-devel@nongnu.org; Wed, 25 Aug 2021 12:59:52 -0400
Received: by mail-lj1-x22a.google.com with SMTP id l18so37238442lji.12
 for <qemu-devel@nongnu.org>; Wed, 25 Aug 2021 09:59:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WuhLA4o6MnllyPTIKpZ+J9/GsU9TybsncAN7fG8PtfY=;
 b=I3Tgx2cbk4roqnY8Eqgz8+SRimprY6QOQQ0ZF9qJQASYckFfxySUpi7R7ZrbjVV9lW
 A9pZ6UK6GLugoxhFOaOrD2acTdGb9tFxQGj3OuygCXr9K0nXLxzEnx5spYshN+HOn7zY
 ooRWYMEurU1mAH/c+X3sg/vzX+egxGpmrT52AprQUexIDkztjCVO/dKhbD8dpiQ4AMb7
 n+yA1w2frgyw0zjcRXqeduaqTB08hj0PUV+JtvEMMmXlQsEb/vOWsK6e1S4Yw7FrcGKu
 Fmmbfo43YgLpXiSdjt8z++V8fDKTMny5md1qS1TkD02o/KjgOxxQY37Hr07E4Z2osnPi
 RkkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WuhLA4o6MnllyPTIKpZ+J9/GsU9TybsncAN7fG8PtfY=;
 b=mhYt67YvtSHGfd+hjPz7MaOwdGnh6z3hmI/WfRWPpTIPNUdtjaeX7twxIK6xIXuc5n
 q91ztu8+EIJDFwp3VDZkg5YYLOWr1TtX+CG6eColqk17EOXowvVBNakWZGFG2x7dY481
 7WPKwkxVdii55g3nZxU+xlgwG1IJa9D/8W0aNIHgTK11lsS/iqy5U4X/pga5988lM9wD
 0APHWav+waas0N0BDB4QxdY9m+bKKBTfjmcvEEhBpyOm6SX+CleMVY0nmYxB3f7TFwQY
 gGU1tXdICgnUhI4k0lAcK1zG8AHNo/FBRg4gtBL1kRfpa4sdsaJbccbvb+f8ufIRTuyd
 nzcg==
X-Gm-Message-State: AOAM532sDC6AdBmuU9FhJq3fFASheWhTy9YkBRgqXgP4/0qKElkVYF4z
 MxdWDwPI/71ETht7Aj1TyozcxlSTAPzx+vMM
X-Google-Smtp-Source: ABdhPJxPkD7fQ3aftrWfrhGDijXytePHkILo0XQyad2O0mQTL/1NtVvwPkXLjgav4egxE9NK/p0Amg==
X-Received: by 2002:a2e:85c4:: with SMTP id h4mr37590913ljj.321.1629910788991; 
 Wed, 25 Aug 2021 09:59:48 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id r2sm59619ljj.14.2021.08.25.09.59.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 09:59:48 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 11/14] target/riscv: Add rev8 instruction,
 removing grev/grevi
Date: Wed, 25 Aug 2021 18:59:04 +0200
Message-Id: <20210825165907.34026-12-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
References: <20210825165907.34026-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22a;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22a.google.com
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
Cc: Alistair Francis <alistair.francis@wdc.com>,
 Kito Cheng <kito.cheng@sifive.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Philipp Tomsich <philipp.tomsich@vrull.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The 1.0.0 version of Zbb does not contain grev/grevi.  Instead, a
rev8 instruction (equivalent to the rev8 pseudo-instruction built on
grevi from pre-0.93 draft-B) is available.

This commit adds the new rev8 instruction and removes grev/grevi.

Note that there is no W-form of this instruction (both a
sign-extending and zero-extending 32-bit version can easily be
synthesized by following rev8 with either a srai or srli instruction
on RV64) and that the opcode encodings for rev8 in RV32 and RV64 are
different.

Signed-off-by: Philipp Tomsich <philipp.tomsich@vrull.eu>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---

(no changes since v4)

Changes in v4:
- reorder trans_rev8* functions to be sequential
- rename rev8 to rev8_32 in decoder

Changes in v3:
- rev8-addition & grevi*-removal moved to a separate commit

 target/riscv/bitmanip_helper.c          | 40 -------------------------
 target/riscv/helper.h                   |  2 --
 target/riscv/insn32.decode              | 12 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 34 ++++++---------------
 target/riscv/translate.c                | 28 -----------------
 5 files changed, 16 insertions(+), 100 deletions(-)

diff --git a/target/riscv/bitmanip_helper.c b/target/riscv/bitmanip_helper.c
index bb48388fcd..f1b5e5549f 100644
--- a/target/riscv/bitmanip_helper.c
+++ b/target/riscv/bitmanip_helper.c
@@ -24,46 +24,6 @@
 #include "exec/helper-proto.h"
 #include "tcg/tcg.h"
 
-static const uint64_t adjacent_masks[] = {
-    dup_const(MO_8, 0x55),
-    dup_const(MO_8, 0x33),
-    dup_const(MO_8, 0x0f),
-    dup_const(MO_16, 0xff),
-    dup_const(MO_32, 0xffff),
-    UINT32_MAX
-};
-
-static inline target_ulong do_swap(target_ulong x, uint64_t mask, int shift)
-{
-    return ((x & mask) << shift) | ((x & ~mask) >> shift);
-}
-
-static target_ulong do_grev(target_ulong rs1,
-                            target_ulong rs2,
-                            int bits)
-{
-    target_ulong x = rs1;
-    int i, shift;
-
-    for (i = 0, shift = 1; shift < bits; i++, shift <<= 1) {
-        if (rs2 & shift) {
-            x = do_swap(x, adjacent_masks[i], shift);
-        }
-    }
-
-    return x;
-}
-
-target_ulong HELPER(grev)(target_ulong rs1, target_ulong rs2)
-{
-    return do_grev(rs1, rs2, TARGET_LONG_BITS);
-}
-
-target_ulong HELPER(grevw)(target_ulong rs1, target_ulong rs2)
-{
-    return do_grev(rs1, rs2, 32);
-}
-
 target_ulong HELPER(clmul)(target_ulong rs1, target_ulong rs2)
 {
     target_ulong result = 0;
diff --git a/target/riscv/helper.h b/target/riscv/helper.h
index 80561e8866..ae2e94542c 100644
--- a/target/riscv/helper.h
+++ b/target/riscv/helper.h
@@ -59,8 +59,6 @@ DEF_HELPER_FLAGS_2(fcvt_d_lu, TCG_CALL_NO_RWG, i64, env, tl)
 DEF_HELPER_FLAGS_1(fclass_d, TCG_CALL_NO_RWG_SE, tl, i64)
 
 /* Bitmanip */
-DEF_HELPER_FLAGS_2(grev, TCG_CALL_NO_RWG_SE, tl, tl, tl)
-DEF_HELPER_FLAGS_2(grevw, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmul, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 DEF_HELPER_FLAGS_2(clmulr, TCG_CALL_NO_RWG_SE, tl, tl, tl)
 
diff --git a/target/riscv/insn32.decode b/target/riscv/insn32.decode
index 8bcb602455..017eb50a49 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -682,6 +682,9 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
+# The encoding for rev8 differs between RV32 and RV64. 
+# rev8_32 denotes the RV32 variant.
+rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
 rol        0110000 .......... 001 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rori       01100 ............ 101 ..... 0010011 @sh
@@ -693,6 +696,10 @@ xnor       0100000 .......... 100 ..... 0110011 @r
 clzw       0110000 00000 ..... 001 ..... 0011011 @r2
 ctzw       0110000 00001 ..... 001 ..... 0011011 @r2
 cpopw      0110000 00010 ..... 001 ..... 0011011 @r2
+# The encoding for rev8 differs between RV32 and RV64.
+# When executing on RV64, the encoding used in RV32 is an illegal
+# instruction, so we use different handler functions to differentiate.
+rev8_64    011010 111000 ..... 101 ..... 0010011 @r2
 rolw       0110000 .......... 001 ..... 0111011 @r
 roriw      0110000 .......... 101 ..... 0011011 @sh5
 rorw       0110000 .......... 101 ..... 0111011 @r
@@ -701,15 +708,10 @@ rorw       0110000 .......... 101 ..... 0111011 @r
 pack       0000100 .......... 100 ..... 0110011 @r
 packu      0100100 .......... 100 ..... 0110011 @r
 packh      0000100 .......... 111 ..... 0110011 @r
-grev       0110100 .......... 101 ..... 0110011 @r
-grevi      01101. ........... 101 ..... 0010011 @sh
 
 # *** RV64B Standard Extension (in addition to RV32B) ***
 packw      0000100 .......... 100 ..... 0111011 @r
 packuw     0100100 .......... 100 ..... 0111011 @r
-grevw      0110100 .......... 101 ..... 0111011 @r
-
-greviw     0110100 .......... 101 ..... 0011011 @sh5
 
 # *** RV32 Zbc Standard Extension ***
 clmul      0000101 .......... 001 ..... 0110011 @r
diff --git a/target/riscv/insn_trans/trans_rvb.c.inc b/target/riscv/insn_trans/trans_rvb.c.inc
index f3b85ca189..b283c1dccf 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -198,23 +198,21 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, tcg_gen_rotl_tl);
 }
 
-static bool trans_grev(DisasContext *ctx, arg_grev *a)
+static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, gen_helper_grev);
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_bswap_tl);
 }
 
-static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-
-    if (a->shamt >= TARGET_LONG_BITS) {
-        return false;
-    }
-
-    return gen_grevi(ctx, a);
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, &tcg_gen_bswap_tl);
 }
 
+
 static void gen_orc_b(TCGv ret, TCGv source1)
 {
     TCGv  tmp = tcg_temp_new();
@@ -306,20 +304,6 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     return gen_shiftw(ctx, a, gen_rolw);
 }
 
-static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftw(ctx, a, gen_grevw);
-}
-
-static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shiftiw(ctx, a, gen_grevw);
-}
-
 #define GEN_TRANS_SHADD_UW(SHAMT)                             \
 static bool trans_sh##SHAMT##add_uw(DisasContext *ctx,        \
                                     arg_sh##SHAMT##add_uw *a) \
diff --git a/target/riscv/translate.c b/target/riscv/translate.c
index aabdd44663..f16ac8bb1a 100644
--- a/target/riscv/translate.c
+++ b/target/riscv/translate.c
@@ -601,28 +601,6 @@ static void gen_bext(TCGv ret, TCGv arg1, TCGv shamt)
     tcg_gen_andi_tl(ret, ret, 1);
 }
 
-static bool gen_grevi(DisasContext *ctx, arg_grevi *a)
-{
-    TCGv source1 = tcg_temp_new();
-    TCGv source2;
-
-    gen_get_gpr(source1, a->rs1);
-
-    if (a->shamt == (TARGET_LONG_BITS - 8)) {
-        /* rev8, byte swaps */
-        tcg_gen_bswap_tl(source1, source1);
-    } else {
-        source2 = tcg_temp_new();
-        tcg_gen_movi_tl(source2, a->shamt);
-        gen_helper_grev(source1, source1, source2);
-        tcg_temp_free(source2);
-    }
-
-    gen_set_gpr(a->rd, source1);
-    tcg_temp_free(source1);
-    return true;
-}
-
 #define GEN_SHADD(SHAMT)                                       \
 static void gen_sh##SHAMT##add(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                              \
@@ -710,12 +688,6 @@ static void gen_rolw(TCGv ret, TCGv arg1, TCGv arg2)
     tcg_temp_free_i32(t2);
 }
 
-static void gen_grevw(TCGv ret, TCGv arg1, TCGv arg2)
-{
-    tcg_gen_ext32u_tl(arg1, arg1);
-    gen_helper_grev(ret, arg1, arg2);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
-- 
2.25.1


