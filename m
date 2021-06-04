Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BDB39BFC3
	for <lists+qemu-devel@lfdr.de>; Fri,  4 Jun 2021 20:37:21 +0200 (CEST)
Received: from localhost ([::1]:42640 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lpEh6-0001Ra-1f
	for lists+qemu-devel@lfdr.de; Fri, 04 Jun 2021 14:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf6-000767-Ot
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:16 -0400
Received: from mail-pj1-x102b.google.com ([2607:f8b0:4864:20::102b]:38554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lpEf1-0000x8-I3
 for qemu-devel@nongnu.org; Fri, 04 Jun 2021 14:35:16 -0400
Received: by mail-pj1-x102b.google.com with SMTP id
 m13-20020a17090b068db02901656cc93a75so7934827pjz.3
 for <qemu-devel@nongnu.org>; Fri, 04 Jun 2021 11:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X+8qtmFFIjwvz+51Kl21uuhzPS5UApPgPi1mRnqjng8=;
 b=EkngAqwxM2dkXK7YmApe7jOejznmjD4x/4QlJpa5mQ2YR98flPGgGxs+elH/WFRAm3
 bZkDaanxJ+0Kbm90jTor9/PNEZ+s9pwLFn7Z2UZX6WafJ3Y4IhtfYu52rPFOaLLGRNhV
 5v4WqFYIOXHXdyp2vJsE9CoppBE4fOEgy9z0QpdUX/PxS59lGgjRmwVK/08vHlkT5izz
 HHGbCIBReLNtZMYxVKFr+im2PZH1a5yo20qTzIs9q0LWduwlrBJYscikosIEsmk3HOp5
 Cjwb7UVJ07LJy3aQ+bddkPBv+pOawZ1mq7SBFXQzdluN9p7jfHKqNNTWY50QitdzP99s
 Aq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X+8qtmFFIjwvz+51Kl21uuhzPS5UApPgPi1mRnqjng8=;
 b=IbcbMQ+EfrZmhxOCLs7nHuByoVxekpPc9bvwcCu4MW4BhQv8+xTtQA0ZZtjTfaKgwl
 ml9B5hgTiRXaiPmI+9ET6ULtDf1RXWSknc7AB68IGoYSyPoNTM2aOH9ou0qvavwZ/qFd
 mZLEfTXW3e+ShO6GjpqExI4yODc0eISk/5lEGQ14mSbUSKnuGGwDjGf6gk6e1FlRlhXu
 2uq78aKgRk1xCW8mgH/FTd7ur2g5K7C8r1CW7MAsRlQzMEGbI0mB5d5qq6ncY1UlouzM
 vboxXrJhK0TPUizPNM1DeLX6M/Iju6Ynz09n6xhVSFi8PaSjx/rLTtNBxFGGC4FNv/Be
 Ycfw==
X-Gm-Message-State: AOAM5322FAfOITVSNAFBua8z+PaEMU4dT9SpKhQwjwJxUfdCZs460A8+
 R1bUxBtwZNiUL4vBqY6bmt5cq3KlHR4RnQ==
X-Google-Smtp-Source: ABdhPJwP/gKniXA+d2mjVOKsGxEh2iyw8xdXFRHsymF2Vu/fyvZK5okeIsyHVLl3WK8LN/+wAkZVYA==
X-Received: by 2002:a17:90b:4d11:: with SMTP id
 mw17mr18263244pjb.229.1622831709010; 
 Fri, 04 Jun 2021 11:35:09 -0700 (PDT)
Received: from localhost.localdomain (174-21-70-228.tukw.qwest.net.
 [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id m2sm2620578pgu.85.2021.06.04.11.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jun 2021 11:35:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] target/arm: Diagnose UNALLOCATED in
 disas_simd_three_reg_same_fp16
Date: Fri,  4 Jun 2021 11:35:06 -0700
Message-Id: <20210604183506.916654-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210604183506.916654-1-richard.henderson@linaro.org>
References: <20210604183506.916654-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102b.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This fprintf+assert has been in place since the beginning.
It is after to the fp_access_check, so we need to move the
check up.  Fold that in to the pairwise filter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 82 +++++++++++++++++++++++---------------
 1 file changed, 50 insertions(+), 32 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9bb15ca618..7f74d0e81a 100644
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
2.25.1


