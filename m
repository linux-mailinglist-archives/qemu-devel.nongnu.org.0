Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 916DF3A8454
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Jun 2021 17:48:01 +0200 (CEST)
Received: from localhost ([::1]:45750 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltBIG-0000Va-Iu
	for lists+qemu-devel@lfdr.de; Tue, 15 Jun 2021 11:48:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42838)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEv-0005p7-I4
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:35 -0400
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333]:36736)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ltBEa-0000vP-V2
 for qemu-devel@nongnu.org; Tue, 15 Jun 2021 11:44:33 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 h11-20020a05600c350bb02901b59c28e8b4so2106435wmq.1
 for <qemu-devel@nongnu.org>; Tue, 15 Jun 2021 08:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PAJZt3oQr46El21qcu2kh9jE/StU5MJCbu3wcrVJdyg=;
 b=VHdUZvhx00mF8DcSAmVUt1DOVCWEvexS3tzf1bAa8RIrrlKxMDeoBzp3/+/zcArhVC
 +aoqe+C5HXZcXwtUMI0oHvQMCShLqjTiUTCJaA4jOmritD6qdftuz00QELpk0s0kZZn1
 5WzvHc0pY98r+SgEUY0NgN0TdPBrEsL1BWwHQWFHKrgM4klCf4ywBWXXLpD/ktu2zk5G
 /fqgwLh/6+T8BO2NNZtSmE2aVekubzGmm3+jGDgeeix3RLVhKfXgeyPYh7vlCZ5q/2Jf
 pU4fi3ZPGHXk1qVnI0yeJ1TR6rBkl2R8wC5vFvHqdESwQ0ZdNn2zz+JdIGZIFB6ZPYrc
 czdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PAJZt3oQr46El21qcu2kh9jE/StU5MJCbu3wcrVJdyg=;
 b=onebUZp3qHJFvCuSaVHoZ7zeJCKxPo+JoXl4wuhsSOcFGjUw+5F3g52Bo5dcNTUOcY
 pnn5wmyQde4RNbrrXdJdZrKJXWFxM1TYtWNeIgBSzhKZ+eFYuOoYj77rTFzpF2ZE8MfI
 4N+8ggnG/driWkWw1Ck6jij2vrZIPRkpm1f2YZTUyFb9UDUF6dItebeEuukvowvP3n/M
 /DdOY3tabldEbzM6Pgsj1+iPTly66i4vycf7+vMl1mDuLrzjzgaPVmAun2YO9u8Bm/bp
 cO174L6+3XCAeRR/0XSBKUmNYA8abL+RqrJ8aGeY3KZYNW4YP4WNTgH8v3YPPn/ZLDw0
 1i1A==
X-Gm-Message-State: AOAM5329fGaV+fmkYlKWGl6ohauqXZIFXPx/bpjnm8od0o3yjXYY+Fzp
 ygb5EiU+1UU0SoGi3fz0WYUCHbcr+7pt0w==
X-Google-Smtp-Source: ABdhPJxvHR7M9VF3PEqTBV4VFVbcnPftLr0afWu30aD74w66X9dXKiLaPcJqpOqne47MlteCR8L1Yw==
X-Received: by 2002:a05:600c:35c1:: with SMTP id
 r1mr5949076wmq.181.1623771851651; 
 Tue, 15 Jun 2021 08:44:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d15sm18985662wri.58.2021.06.15.08.44.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Jun 2021 08:44:11 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 04/28] target/arm: Diagnose UNALLOCATED in
 disas_simd_three_reg_same_fp16
Date: Tue, 15 Jun 2021 16:43:41 +0100
Message-Id: <20210615154405.21399-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210615154405.21399-1-peter.maydell@linaro.org>
References: <20210615154405.21399-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

This fprintf+assert has been in place since the beginning.
It is after to the fp_access_check, so we need to move the
check up.  Fold that in to the pairwise filter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210604183506.916654-4-richard.henderson@linaro.org
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-a64.c | 82 +++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9bb15ca6189..7f74d0e81a9 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11989,12 +11989,57 @@ static void disas_simd_three_reg_same(DisasContext *s, uint32_t insn)
  */
 static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
 {
-    int opcode, fpopcode;
-    int is_q, u, a, rm, rn, rd;
-    int datasize, elements;
-    int pass;
+    int opcode = extract32(insn, 11, 3);
+    int u = extract32(insn, 29, 1);
+    int a = extract32(insn, 23, 1);
+    int is_q = extract32(insn, 30, 1);
+    int rm = extract32(insn, 16, 5);
+    int rn = extract32(insn, 5, 5);
+    int rd = extract32(insn, 0, 5);
+    /*
+     * For these floating point ops, the U, a and opcode bits
+     * together indicate the operation.
+     */
+    int fpopcode = opcode | (a << 3) | (u << 4);
+    int datasize = is_q ? 128 : 64;
+    int elements = datasize / 16;
+    bool pairwise;
     TCGv_ptr fpst;
-    bool pairwise = false;
+    int pass;
+
+    switch (fpopcode) {
+    case 0x0: /* FMAXNM */
+    case 0x1: /* FMLA */
+    case 0x2: /* FADD */
+    case 0x3: /* FMULX */
+    case 0x4: /* FCMEQ */
+    case 0x6: /* FMAX */
+    case 0x7: /* FRECPS */
+    case 0x8: /* FMINNM */
+    case 0x9: /* FMLS */
+    case 0xa: /* FSUB */
+    case 0xe: /* FMIN */
+    case 0xf: /* FRSQRTS */
+    case 0x13: /* FMUL */
+    case 0x14: /* FCMGE */
+    case 0x15: /* FACGE */
+    case 0x17: /* FDIV */
+    case 0x1a: /* FABD */
+    case 0x1c: /* FCMGT */
+    case 0x1d: /* FACGT */
+        pairwise = false;
+        break;
+    case 0x10: /* FMAXNMP */
+    case 0x12: /* FADDP */
+    case 0x16: /* FMAXP */
+    case 0x18: /* FMINNMP */
+    case 0x1e: /* FMINP */
+        pairwise = true;
+        break;
+    default:
+        unallocated_encoding(s);
+        return;
+    }
 
     if (!dc_isar_feature(aa64_fp16, s)) {
         unallocated_encoding(s);
@@ -12005,31 +12050,6 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
         return;
     }
 
-    /* For these floating point ops, the U, a and opcode bits
-     * together indicate the operation.
-     */
-    opcode = extract32(insn, 11, 3);
-    u = extract32(insn, 29, 1);
-    a = extract32(insn, 23, 1);
-    is_q = extract32(insn, 30, 1);
-    rm = extract32(insn, 16, 5);
-    rn = extract32(insn, 5, 5);
-    rd = extract32(insn, 0, 5);
-
-    fpopcode = opcode | (a << 3) |  (u << 4);
-    datasize = is_q ? 128 : 64;
-    elements = datasize / 16;
-
-    switch (fpopcode) {
-    case 0x10: /* FMAXNMP */
-    case 0x12: /* FADDP */
-    case 0x16: /* FMAXP */
-    case 0x18: /* FMINNMP */
-    case 0x1e: /* FMINP */
-        pairwise = true;
-        break;
-    }
-
     fpst = fpstatus_ptr(FPST_FPCR_F16);
 
     if (pairwise) {
@@ -12152,8 +12172,6 @@ static void disas_simd_three_reg_same_fp16(DisasContext *s, uint32_t insn)
                 gen_helper_advsimd_acgt_f16(tcg_res, tcg_op1, tcg_op2, fpst);
                 break;
             default:
-                fprintf(stderr, "%s: insn 0x%04x, fpop 0x%2x @ 0x%" PRIx64 "\n",
-                        __func__, insn, fpopcode, s->pc_curr);
                 g_assert_not_reached();
             }
 
-- 
2.20.1


