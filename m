Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BFD4078A1
	for <lists+qemu-devel@lfdr.de>; Sat, 11 Sep 2021 16:06:52 +0200 (CEST)
Received: from localhost ([::1]:45056 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mP3ed-0002Zg-9F
	for lists+qemu-devel@lfdr.de; Sat, 11 Sep 2021 10:06:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34102)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YZ-0002SD-KL
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:36 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d]:44985)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mP3YW-0005hw-GZ
 for qemu-devel@nongnu.org; Sat, 11 Sep 2021 10:00:35 -0400
Received: by mail-lj1-x22d.google.com with SMTP id s3so8173351ljp.11
 for <qemu-devel@nongnu.org>; Sat, 11 Sep 2021 07:00:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GweIzS54WqTKf6IqBV3AdVl1HQmu1uUxyAEPx7PWPEw=;
 b=NE8oqWRTRiQCLiOiZAhM6SUxbitDtJL3jdfQcYtcLBgtdCWCt2j0PBhal4Ii+UAsxp
 CLpZuLjq22B3heEvuR8nC9WlKo5oL4MDOyQLTgp/VetqLZrOyFQcn9KL2AdZJvt16Fr0
 OdnQ8leq3YAtutg7y18GZsKCmxs312apm6aVsLpKBwX1WInOCDVa8WpgZ4C8QDItVdAY
 sbStutXmGMIJqQ9Rjaf60bCG1xwnK+5lUy41T+jZwHogSX2wGho8j3qgtXr5pDeXKh5l
 H0JMxOg4MFB72S7J2oUgVvESiiWq52xY5atLg3KlE6JkqRy7dgR/1FW/9Qg8sOH6SpaT
 jgBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GweIzS54WqTKf6IqBV3AdVl1HQmu1uUxyAEPx7PWPEw=;
 b=f9TabHgsIDc/ucAMPIhjkfvxpPtUJtPSBfb8JfFFlviMpG76tF1IQmCKgze4e4SDhB
 puQWDvTIZ4OsiK+CZO3qM1dhZ2zhXc1wz9Lg2cAb/7tYPA8nxwb0DHpReOU9WgmI/fCR
 5TH+ETg9yLYfJmyK2z21gPIf00pCC8gpbs3J1anFxh5RA5l/xPPO4skuNauqnNZPWJV+
 lCcKIl3u68XKPCr2tb0QEc41uZM6rLhTPqz/uzeARruwrD51hu8wUKQmLjq4thWi/u12
 k2ngPAVJVUknWnkzBFF1yjnWhPaTEqpW3z6V3YQmjRRW6hgnNSDpucKJkNCQlYpdKxPG
 ISIg==
X-Gm-Message-State: AOAM531nA+5nIsA59jqK3EB5rOuFuWTX+3dP6E9ld3poHZjPEvPBEHbY
 301jzE1SIjnDeCADOPgRNyWR5t/RkTAsUVoc
X-Google-Smtp-Source: ABdhPJxuDGGPVXgio6PDDaODG1YJA7L88VCfPUSF+o/F+xRIPwcunzA2xyRqBPrbhuvP4XpZA3c0cQ==
X-Received: by 2002:a2e:9915:: with SMTP id v21mr2347377lji.108.1631368830724; 
 Sat, 11 Sep 2021 07:00:30 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id u15sm213052lfk.26.2021.09.11.07.00.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Sep 2021 07:00:30 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v11 13/16] target/riscv: Add rev8 instruction,
 removing grev/grevi
Date: Sat, 11 Sep 2021 16:00:13 +0200
Message-Id: <20210911140016.834071-14-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
References: <20210911140016.834071-1-philipp.tomsich@vrull.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=philipp.tomsich@vrull.eu; helo=mail-lj1-x22d.google.com
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
---

(no changes since v9)

Changes in v9:
- Rebased to 8880cc4362.
- Fixes a whitespace-at-the-end-of-line warning for the rev8 comment
  in insn32.decode

Changes in v4:
- reorder trans_rev8* functions to be sequential
- rename rev8 to rev8_32 in decoder

Changes in v3:
- rev8-addition & grevi*-removal moved to a separate commit

 target/riscv/bitmanip_helper.c          | 40 -------------------------
 target/riscv/helper.h                   |  2 --
 target/riscv/insn32.decode              | 12 ++++----
 target/riscv/insn_trans/trans_rvb.c.inc | 40 +++++--------------------
 4 files changed, 15 insertions(+), 79 deletions(-)

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
index a9bda2c8ac..c7a5376227 100644
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
index 59202196dc..901a66c0f5 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -683,6 +683,9 @@ min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
 orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
+# The encoding for rev8 differs between RV32 and RV64.
+# rev8_32 denotes the RV32 variant.
+rev8_32    011010 011000 ..... 101 ..... 0010011 @r2
 rol        0110000 .......... 001 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
 rori       01100 ............ 101 ..... 0010011 @sh
@@ -694,6 +697,10 @@ xnor       0100000 .......... 100 ..... 0110011 @r
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
@@ -702,15 +709,10 @@ rorw       0110000 .......... 101 ..... 0111011 @r
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
index 951b3d7073..201a2ffb4b 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -273,26 +273,18 @@ static bool trans_rol(DisasContext *ctx, arg_rol *a)
     return gen_shift(ctx, a, EXT_NONE, tcg_gen_rotl_tl);
 }
 
-static bool trans_grev(DisasContext *ctx, arg_grev *a)
+static bool trans_rev8_32(DisasContext *ctx, arg_rev8_32 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_NONE, gen_helper_grev);
-}
-
-static void gen_grevi(TCGv dest, TCGv src, target_long shamt)
-{
-    if (shamt == TARGET_LONG_BITS - 8) {
-        /* rev8, byte swaps */
-        tcg_gen_bswap_tl(dest, src);
-    } else {
-        gen_helper_grev(dest, src, tcg_constant_tl(shamt));
-    }
+    REQUIRE_32BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
 
-static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
+static bool trans_rev8_64(DisasContext *ctx, arg_rev8_64 *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
+    REQUIRE_64BIT(ctx);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_NONE, tcg_gen_bswap_tl);
 }
 
 static void gen_orc_b(TCGv ret, TCGv source1)
@@ -471,22 +463,6 @@ static bool trans_rolw(DisasContext *ctx, arg_rolw *a)
     return gen_shift(ctx, a, EXT_NONE, gen_rolw);
 }
 
-static bool trans_grevw(DisasContext *ctx, arg_grevw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_grev);
-}
-
-static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
-- 
2.25.1


