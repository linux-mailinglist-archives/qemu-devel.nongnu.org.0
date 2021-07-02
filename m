Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A0BD3BA0FE
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:13:07 +0200 (CEST)
Received: from localhost ([::1]:54366 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzIyg-0001ok-9H
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:13:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImW-0007nr-37
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:32 -0400
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:38820)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImM-0007kY-Hk
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:31 -0400
Received: by mail-wm1-x32d.google.com with SMTP id
 b14-20020a1c1b0e0000b02901fc3a62af78so2460700wmb.3
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Ebqzt5ZIHqZm+iB4X9Qs06Rde3OOWozrg8wxZKLSslA=;
 b=ifz23+H2XSNRJM33HUo1fbzVxwcWPxcNZIZp4Dlf1ZYMEdpFBg/N+GHyHOCpoVozFl
 niRcZxqNLQpMv2l+Bon3xPelMVScnm9sQN4iV/BhqozfEro5BvPiG0VQ8zgkthcLcj8p
 dCgZ/RLqJVMsXp5sQbzejtZ0DomifGAvbJ7eMUvXDO+nC2ByUyheLJ+ReOM1BlxH5cus
 Th/VfklVtrd5gznjmLPVn4SiFyV0qexWfnwvA8DgrpUBG9OwHt/vuRS+30y1doqnyOzw
 J/6KaiVOldLAPkK2nbawE8DeGaMcp9OrBt6uSNgf8IlruHtXiSoXZNhr4BCti4gIubGY
 j+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ebqzt5ZIHqZm+iB4X9Qs06Rde3OOWozrg8wxZKLSslA=;
 b=Hj4QrBhwtWQPVIcnSkrHJ0GoWkmFEOP0R0uPX0jxg0YfI8o966iZJFjHzvK5bUKQWu
 nVupVNdWmeSEUlpq3kBSEZkPoOrzxrMYi1dZTFI4rqCuB2L7SU7ffsgCnF01DJhLHAv0
 Ueidu42iwGDdjHy406CqRvTs/dEc1qb8Y/SQ5oPVm4NWFfd03soZZzOewUI/epswucnX
 0J+z7R8TO2fuGxoeOQXSB7Nzas4tdnpHDO17OOynJqHOM+LMu1mn6vyNB+kGLE83/dmx
 50dBTkdWebKjnLODLENtKDv7gun4THspBSGl2XzNU0ObKl8qkzpbJ3+ganDaDDJuT6XN
 HDeA==
X-Gm-Message-State: AOAM5335F9/7bJsV2jsMhjcn27mTSPxlyTAF/h2aaHrZgs2BL2dBOFUn
 ZzCm0S29IdfhxW7A9l2BXfbN+3qKzH7fcme1
X-Google-Smtp-Source: ABdhPJxkamQ95cFXfoG0Hj0MLS9y33KBCbf+m5uEs34pckPKRuEX4UkpFfREcD8fIdavqKnFwD/PXQ==
X-Received: by 2002:a7b:c154:: with SMTP id z20mr3507757wmi.155.1625230812982; 
 Fri, 02 Jul 2021 06:00:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.12
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 23/24] target/arm: Implement MVE shifts by immediate
Date: Fri,  2 Jul 2021 13:59:53 +0100
Message-Id: <20210702125954.13247-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement the MVE shifts by immediate, which perform shifts
on a single general-purpose register.

These patterns overlap with the long-shift-by-immediates,
so we have to rearrange the grouping a little here.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-18-peter.maydell@linaro.org
---
 target/arm/helper-mve.h |  3 ++
 target/arm/translate.h  |  1 +
 target/arm/t32.decode   | 31 ++++++++++++++-----
 target/arm/mve_helper.c | 10 ++++++
 target/arm/translate.c  | 68 +++++++++++++++++++++++++++++++++++++++--
 5 files changed, 104 insertions(+), 9 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 7a4316bf8df..1fba9d6422d 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -458,3 +458,6 @@ DEF_HELPER_FLAGS_3(mve_sqrshrl, TCG_CALL_NO_RWG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(mve_uqrshll, TCG_CALL_NO_RWG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(mve_sqrshrl48, TCG_CALL_NO_RWG, i64, env, i64, i32)
 DEF_HELPER_FLAGS_3(mve_uqrshll48, TCG_CALL_NO_RWG, i64, env, i64, i32)
+
+DEF_HELPER_FLAGS_3(mve_uqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_sqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 10e94335818..2c7ca2a1f77 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -466,6 +466,7 @@ typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
 typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
 typedef void WideShiftImmFn(TCGv_i64, TCGv_i64, int64_t shift);
 typedef void WideShiftFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i32);
+typedef void ShiftImmFn(TCGv_i32, TCGv_i32, int32_t shift);
 
 /**
  * arm_tbflags_from_tb:
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index dc76dee44d4..1c3406c67aa 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -50,6 +50,7 @@
 
 &mve_shl_ri      rdalo rdahi shim
 &mve_shl_rr      rdalo rdahi rm
+&mve_sh_ri       rda shim
 
 # rdahi: bits [3:1] from insn, bit 0 is 1
 # rdalo: bits [3:1] from insn, bit 0 is 0
@@ -71,6 +72,8 @@
                  &mve_shl_ri shim=%imm5_12_6 rdalo=%rdalo_17 rdahi=%rdahi_9
 @mve_shl_rr      ....... .... . ... . rm:4  ... . .. .. .... \
                  &mve_shl_rr rdalo=%rdalo_17 rdahi=%rdahi_9
+@mve_sh_ri       ....... .... . rda:4 . ... ... . .. .. .... \
+                 &mve_sh_ri shim=%imm5_12_6
 
 {
   TST_xrri       1110101 0000 1 .... 0 ... 1111 .... ....     @S_xrr_shi
@@ -86,14 +89,28 @@ BIC_rrri         1110101 0001 . .... 0 ... .... .... ....     @s_rrr_shi
   # the rest fall through (where ORR_rrri and MOV_rxri will end up
   # handling them as r13 and r15 accesses with the same semantics as A32).
   [
-    LSLL_ri      1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
-    LSRL_ri      1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
-    ASRL_ri      1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
+    {
+      UQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 00 1111  @mve_sh_ri
+      LSLL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 00 1111  @mve_shl_ri
+      UQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
+    }
 
-    UQSHLL_ri    1110101 0010 1 ... 1 0 ... ... 1 .. 00 1111  @mve_shl_ri
-    URSHRL_ri    1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
-    SRSHRL_ri    1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
-    SQSHLL_ri    1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
+    {
+      URSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 01 1111  @mve_sh_ri
+      LSRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 01 1111  @mve_shl_ri
+      URSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 01 1111  @mve_shl_ri
+    }
+
+    {
+      SRSHR_ri   1110101 0010 1 ....  0 ...  1111 .. 10 1111  @mve_sh_ri
+      ASRL_ri    1110101 0010 1 ... 0 0 ... ... 1 .. 10 1111  @mve_shl_ri
+      SRSHRL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 10 1111  @mve_shl_ri
+    }
+
+    {
+      SQSHL_ri   1110101 0010 1 ....  0 ...  1111 .. 11 1111  @mve_sh_ri
+      SQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
+    }
 
     LSLL_rr      1110101 0010 1 ... 0 ....  ... 1  0000 1101  @mve_shl_rr
     ASRL_rr      1110101 0010 1 ... 0 ....  ... 1  0010 1101  @mve_shl_rr
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index bba150c7904..5e60e2a9d83 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1628,3 +1628,13 @@ uint64_t HELPER(mve_uqrshll48)(CPUARMState *env, uint64_t n, uint32_t shift)
 {
     return do_uqrshl48_d(n, (int8_t)shift, true, &env->QF);
 }
+
+uint32_t HELPER(mve_uqshl)(CPUARMState *env, uint32_t n, uint32_t shift)
+{
+    return do_uqrshl_bhs(n, (int8_t)shift, 32, false, &env->QF);
+}
+
+uint32_t HELPER(mve_sqshl)(CPUARMState *env, uint32_t n, uint32_t shift)
+{
+    return do_sqrshl_bhs(n, (int8_t)shift, 32, false, &env->QF);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index f1237524310..e38619b571b 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -3218,8 +3218,14 @@ static void gen_srshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 
 static void gen_srshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t;
 
+    /* Handle shift by the input size for the benefit of trans_SRSHR_ri */
+    if (sh == 32) {
+        tcg_gen_movi_i32(d, 0);
+        return;
+    }
+    t = tcg_temp_new_i32();
     tcg_gen_extract_i32(t, a, sh - 1, 1);
     tcg_gen_sari_i32(d, a, sh);
     tcg_gen_add_i32(d, d, t);
@@ -3419,8 +3425,14 @@ static void gen_urshr16_i64(TCGv_i64 d, TCGv_i64 a, int64_t sh)
 
 static void gen_urshr32_i32(TCGv_i32 d, TCGv_i32 a, int32_t sh)
 {
-    TCGv_i32 t = tcg_temp_new_i32();
+    TCGv_i32 t;
 
+    /* Handle shift by the input size for the benefit of trans_URSHR_ri */
+    if (sh == 32) {
+        tcg_gen_extract_i32(d, a, sh - 1, 1);
+        return;
+    }
+    t = tcg_temp_new_i32();
     tcg_gen_extract_i32(t, a, sh - 1, 1);
     tcg_gen_shri_i32(d, a, sh);
     tcg_gen_add_i32(d, d, t);
@@ -5861,6 +5873,58 @@ static bool trans_SQRSHRL48_rr(DisasContext *s, arg_mve_shl_rr *a)
     return do_mve_shl_rr(s, a, gen_helper_mve_sqrshrl48);
 }
 
+static bool do_mve_sh_ri(DisasContext *s, arg_mve_sh_ri *a, ShiftImmFn *fn)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        /* Decode falls through to ORR/MOV UNPREDICTABLE handling */
+        return false;
+    }
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !arm_dc_feature(s, ARM_FEATURE_M_MAIN) ||
+        a->rda == 13 || a->rda == 15) {
+        /* These rda cases are UNPREDICTABLE; we choose to UNDEF */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    if (a->shim == 0) {
+        a->shim = 32;
+    }
+    fn(cpu_R[a->rda], cpu_R[a->rda], a->shim);
+
+    return true;
+}
+
+static bool trans_URSHR_ri(DisasContext *s, arg_mve_sh_ri *a)
+{
+    return do_mve_sh_ri(s, a, gen_urshr32_i32);
+}
+
+static bool trans_SRSHR_ri(DisasContext *s, arg_mve_sh_ri *a)
+{
+    return do_mve_sh_ri(s, a, gen_srshr32_i32);
+}
+
+static void gen_mve_sqshl(TCGv_i32 r, TCGv_i32 n, int32_t shift)
+{
+    gen_helper_mve_sqshl(r, cpu_env, n, tcg_constant_i32(shift));
+}
+
+static bool trans_SQSHL_ri(DisasContext *s, arg_mve_sh_ri *a)
+{
+    return do_mve_sh_ri(s, a, gen_mve_sqshl);
+}
+
+static void gen_mve_uqshl(TCGv_i32 r, TCGv_i32 n, int32_t shift)
+{
+    gen_helper_mve_uqshl(r, cpu_env, n, tcg_constant_i32(shift));
+}
+
+static bool trans_UQSHL_ri(DisasContext *s, arg_mve_sh_ri *a)
+{
+    return do_mve_sh_ri(s, a, gen_mve_uqshl);
+}
+
 /*
  * Multiply and multiply accumulate
  */
-- 
2.20.1


