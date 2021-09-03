Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7520D4003CB
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 19:05:09 +0200 (CEST)
Received: from localhost ([::1]:41112 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMCch-0003oc-6e
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 13:05:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCZ2-0007QN-AI
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:16 -0400
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134]:41655)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philipp.tomsich@vrull.eu>)
 id 1mMCZ0-00055E-4h
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 13:01:16 -0400
Received: by mail-lf1-x134.google.com with SMTP id y34so12970281lfa.8
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 10:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=vrull-eu.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dFXolZKt0nDbC1saRJW1HJvG5PiI8fg5A/41EL/oZeQ=;
 b=Hm0BaW6QP0/gnWQ+CXwHys9lTDYvfxr7HgOd9398QVjXSO+OV+IBOtzc8wICxNOfxc
 6YFWysmbghnvp5rxAax5f+/Vm4gCSBSrTeFoNvPU86DXr/r0FfVVjVlQUfZ8YBBoYGjw
 vv2mqBLzEeDKlG2MhcMVfL8cAsy18btkPwmd4xu596QsJwIT8ynNipJh0QuQ5qTCgb7d
 NwhwrCt6HpILUgvwaxWK2vWlcUnHA6+DCpYwbjNXpCwc5G8aLxyJpRbK/EU9H7r3leCc
 OQgBptXJgVmVDnpP+VbpJZ2Lu5RPomRrTj4/O0J7Jy7K/BMEjpT0TBRCKbF6Ht5KaA8E
 gjUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dFXolZKt0nDbC1saRJW1HJvG5PiI8fg5A/41EL/oZeQ=;
 b=rtzTel49gBiKB3gOijgkPYcVSTOUohb4lpzdYuydjM3UdpesmJ76nBeuh6nsMFKaIU
 GWRoWQusjDNw8oRvUQfZL0YmOjCmaoyE1Z98enuAepLbfCJ6q5scdfXLqiPcoDJIYXrH
 zrqy3+nHocBuaq1bNWpLfdMUsHVhiAe96ngCvw1k+lMfqymYvI7JUkYAA6Vy81WfGu7T
 DJBUH5wltDLKiPLfoAeQwsZXKWAytfvj4DDy4hJfgCDipESzvgh0+dMttE36Pp+ynjUm
 Ovv6sAm99qEgxz/2ZCRt42ZFdQcagw3ZaPw4RQANwpIF0MAoiEPHZBg9LOONeqBbufh/
 uNvw==
X-Gm-Message-State: AOAM531pxqeA5jGEKc0KLMDdhICVyeTEXm+lCgWnpFo86e9S3rlq/qSA
 rIubxwy19TTeZkiLr/AibA43fAComQeOLl4pBV4=
X-Google-Smtp-Source: ABdhPJzSZicyqI0cZ3ykyrH1SzGiEfIq2PjMW8QeNvFYjdsyMTKNtuz1p+nzTE1rtYeiLWUqI3tdYQ==
X-Received: by 2002:a05:6512:241:: with SMTP id
 b1mr3468676lfo.99.1630688472256; 
 Fri, 03 Sep 2021 10:01:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f9:3a:1e26::2])
 by smtp.gmail.com with ESMTPSA id c3sm628401ljj.77.2021.09.03.10.01.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 10:01:11 -0700 (PDT)
From: Philipp Tomsich <philipp.tomsich@vrull.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 09/14] target/riscv: Add orc.b instruction for Zbb,
 removing gorc/gorci
Date: Fri,  3 Sep 2021 19:00:55 +0200
Message-Id: <20210903170100.2529121-10-philipp.tomsich@vrull.eu>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
References: <20210903170100.2529121-1-philipp.tomsich@vrull.eu>
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
 Kito Cheng <kito.cheng@sifive.com>,
 Alistair Francis <alistair.francis@wdc.com>,
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
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

---

Changes in v9:
- Picked up Alistair's Reviewed-by, after patman had failed to catch
  it for v8.

Changes in v8:
- Optimize orc.b further by reordering the shift/and, updating the
  comment to reflect that we put the truth-value into the LSB, and
  putting the (now only) constant in a temporary
- Fold the final bitwise-not into the second and, using and andc.

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

 target/riscv/bitmanip_helper.c          | 26 -----------------
 target/riscv/helper.h                   |  2 --
 target/riscv/insn32.decode              |  6 +---
 target/riscv/insn_trans/trans_rvb.c.inc | 39 +++++++++++--------------
 4 files changed, 18 insertions(+), 55 deletions(-)

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
index 8a318a2dbc..a9bda2c8ac 100644
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
index a509cfee11..59202196dc 100644
--- a/target/riscv/insn32.decode
+++ b/target/riscv/insn32.decode
@@ -681,6 +681,7 @@ max        0000101 .......... 110 ..... 0110011 @r
 maxu       0000101 .......... 111 ..... 0110011 @r
 min        0000101 .......... 100 ..... 0110011 @r
 minu       0000101 .......... 101 ..... 0110011 @r
+orc_b      001010 000111 ..... 101 ..... 0010011 @r2
 orn        0100000 .......... 110 ..... 0110011 @r
 rol        0110000 .......... 001 ..... 0110011 @r
 ror        0110000 .......... 101 ..... 0110011 @r
@@ -702,19 +703,14 @@ pack       0000100 .......... 100 ..... 0110011 @r
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
index 02f2913063..311174ea40 100644
--- a/target/riscv/insn_trans/trans_rvb.c.inc
+++ b/target/riscv/insn_trans/trans_rvb.c.inc
@@ -295,16 +295,27 @@ static bool trans_grevi(DisasContext *ctx, arg_grevi *a)
     return gen_shift_imm_fn(ctx, a, EXT_NONE, gen_grevi);
 }
 
-static bool trans_gorc(DisasContext *ctx, arg_gorc *a)
+static void gen_orc_b(TCGv ret, TCGv source1)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
+    TCGv  tmp = tcg_temp_new();
+    TCGv  ones = tcg_constant_tl(dup_const(MO_8, 0x01));
+
+    /* Set lsb in each byte if the byte was zero. */
+    tcg_gen_sub_tl(tmp, source1, ones);
+    tcg_gen_andc_tl(tmp, tmp, source1);
+    tcg_gen_shri_tl(tmp, tmp, 7);
+    tcg_gen_andc_tl(tmp, ones, tmp);
+
+    /* Replicate the lsb of each byte across the byte. */
+    tcg_gen_muli_tl(ret, tmp, 0xff);
+
+    tcg_temp_free(tmp);
 }
 
-static bool trans_gorci(DisasContext *ctx, arg_gorci *a)
+static bool trans_orc_b(DisasContext *ctx, arg_orc_b *a)
 {
-    REQUIRE_EXT(ctx, RVB);
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
+    REQUIRE_ZBB(ctx);
+    return gen_unary(ctx, a, EXT_ZERO, gen_orc_b);
 }
 
 #define GEN_SHADD(SHAMT)                                       \
@@ -474,22 +485,6 @@ static bool trans_greviw(DisasContext *ctx, arg_greviw *a)
     return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_grev);
 }
 
-static bool trans_gorcw(DisasContext *ctx, arg_gorcw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift(ctx, a, EXT_ZERO, gen_helper_gorc);
-}
-
-static bool trans_gorciw(DisasContext *ctx, arg_gorciw *a)
-{
-    REQUIRE_64BIT(ctx);
-    REQUIRE_EXT(ctx, RVB);
-    ctx->w = true;
-    return gen_shift_imm_tl(ctx, a, EXT_ZERO, gen_helper_gorc);
-}
-
 #define GEN_SHADD_UW(SHAMT)                                       \
 static void gen_sh##SHAMT##add_uw(TCGv ret, TCGv arg1, TCGv arg2) \
 {                                                                 \
-- 
2.25.1


