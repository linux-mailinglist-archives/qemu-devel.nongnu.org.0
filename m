Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 219966AB3C0
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Mar 2023 01:42:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pYyuJ-0004Y2-EN; Sun, 05 Mar 2023 19:40:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytw-0004Vu-EX
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:29 -0500
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pYytt-0006bR-0W
 for qemu-devel@nongnu.org; Sun, 05 Mar 2023 19:40:28 -0500
Received: by mail-pl1-x633.google.com with SMTP id ky4so8529461plb.3
 for <qemu-devel@nongnu.org>; Sun, 05 Mar 2023 16:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678063224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=t3LZsiSFgJtrXFA52btjSZrUrRcI5C6QQgGMRyWKYOw=;
 b=rKgTX2oHTnumL9T4lYucdUcQKfb2cBVfKCn9e7j/xmS8c61faYkYxDjZTeFlXDCX8W
 f37lN8vFelxR043rk0yOcYeXA1erxJ4Hs0ppc5c9m+g/T7+HT4G/jKc+zX0P8Z4j4Bwg
 8FUz3n7+wsp5tXbcspA8MgEhv9N1nng7sPTEHuGt8zM0Af7M6MdGXLVWyPSVGzr7WknE
 /OPmnAjT0S4WeXR54Qgxuon4vuH+WF8AWAtaQS1FMbx6oPQG11mxUHk3SbfHDz76AVSG
 wU2TYU49Y6DZHTNcwLf7udFsKSXFuK9VrDh5T5eYsCcDlLHtx4PonfwBgszel1IA/T+y
 BNKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678063224;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=t3LZsiSFgJtrXFA52btjSZrUrRcI5C6QQgGMRyWKYOw=;
 b=5karduZGww2FE2uNsq6yNUcGFLrb0246Z58mzmUgbAEyu54jCObB46y7RqIWht6jiM
 ye3l32VnXOplAZmQNt6cu1c2N1mBU8Nk0WjO3oVLflIAhZr0VjMv9O6slWgWRsO7E85U
 w4HwddzRXjX0gNDvygjLunx+9ElpdwHund9XP7gXDT8F2yr+vBhoym3wp+gpCxIA4pBN
 qtmLZQc6Je84bBWKaYipemoF1/nw2evbHbCg8/pTpmhyqVDeMfXbwvdSeoAfBMlaBcop
 eur0ULdqx5a8VLcnxhWPM22RZDW7f33Az9vqJG9yEo1m1TrDF8ZP7J2k7aoso9g9oPMU
 Qaew==
X-Gm-Message-State: AO0yUKWHWQcuO23HqFk/QSPSVD4VrD249IUwO4fHzEay//jqdI49zI7t
 O5bhPqGBioGT9HIJoT2KjJW14PP+MdfL5RgndhcCSA==
X-Google-Smtp-Source: AK7set9gMlsY6cXr6MmPK/DGl6FOP7UX6MwsqMRl9Bw1vCI6p2PUckvAfb1hL0nwvCbSAixFcMmcTQ==
X-Received: by 2002:a17:90b:180c:b0:237:9f75:694d with SMTP id
 lw12-20020a17090b180c00b002379f75694dmr9809328pjb.18.1678063224197; 
 Sun, 05 Mar 2023 16:40:24 -0800 (PST)
Received: from stoup.. ([2602:ae:154a:9f01:87cc:49bb:2900:c08b])
 by smtp.gmail.com with ESMTPSA id
 r13-20020a17090b050d00b002372106a5c2sm6567901pjz.37.2023.03.05.16.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Mar 2023 16:40:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org
Subject: [PULL 32/84] target/cris: Drop cris_alu_free_temps
Date: Sun,  5 Mar 2023 16:39:02 -0800
Message-Id: <20230306003954.1866998-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230306003954.1866998-1-richard.henderson@linaro.org>
References: <20230306003954.1866998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::633;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x633.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Translators are no longer required to free tcg temporaries.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/cris/translate.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/target/cris/translate.c b/target/cris/translate.c
index a959b27373..76db745fe2 100644
--- a/target/cris/translate.c
+++ b/target/cris/translate.c
@@ -1467,14 +1467,6 @@ static inline void cris_alu_alloc_temps(DisasContext *dc, int size, TCGv *t)
     }
 }
 
-static inline void cris_alu_free_temps(DisasContext *dc, int size, TCGv *t)
-{
-    if (size != 4) {
-        tcg_temp_free(t[0]);
-        tcg_temp_free(t[1]);
-    }
-}
-
 static int dec_and_r(CPUCRISState *env, DisasContext *dc)
 {
     TCGv t[2];
@@ -1488,7 +1480,6 @@ static int dec_and_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_AND, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1518,7 +1509,6 @@ static int dec_lsl_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSL, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1535,7 +1525,6 @@ static int dec_lsr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_LSR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1552,7 +1541,6 @@ static int dec_asr_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
     tcg_gen_andi_tl(t[1], t[1], 63);
     cris_alu(dc, CC_OP_ASR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1568,7 +1556,6 @@ static int dec_muls_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 1, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULS, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1584,7 +1571,6 @@ static int dec_mulu_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_MULU, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1610,7 +1596,6 @@ static int dec_xor_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_XOR, cpu_R[dc->op2], t[0], t[1], 4);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1639,7 +1624,6 @@ static int dec_cmp_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_CMP, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1666,7 +1650,6 @@ static int dec_add_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_ADD, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1755,7 +1738,6 @@ static int dec_or_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_OR, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1796,7 +1778,6 @@ static int dec_neg_r(CPUCRISState *env, DisasContext *dc)
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
 
     cris_alu(dc, CC_OP_NEG, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
@@ -1825,7 +1806,6 @@ static int dec_sub_r(CPUCRISState *env, DisasContext *dc)
     cris_alu_alloc_temps(dc, size, t);
     dec_prep_alu_r(dc, dc->op1, dc->op2, size, 0, t[0], t[1]);
     cris_alu(dc, CC_OP_SUB, cpu_R[dc->op2], t[0], t[1], size);
-    cris_alu_free_temps(dc, size, t);
     return 2;
 }
 
-- 
2.34.1


