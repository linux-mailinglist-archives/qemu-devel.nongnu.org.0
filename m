Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EC373BA113
	for <lists+qemu-devel@lfdr.de>; Fri,  2 Jul 2021 15:16:26 +0200 (CEST)
Received: from localhost ([::1]:36368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lzJ1t-0000NK-EV
	for lists+qemu-devel@lfdr.de; Fri, 02 Jul 2021 09:16:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33436)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImV-0007nI-Q0
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:31 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33769)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lzImM-0007kd-PL
 for qemu-devel@nongnu.org; Fri, 02 Jul 2021 09:00:31 -0400
Received: by mail-wr1-x42f.google.com with SMTP id i8so12440964wrc.0
 for <qemu-devel@nongnu.org>; Fri, 02 Jul 2021 06:00:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=IKpyCKIs/jrOVc5VAvk0L9f//34jaxchmo8sNz+qRQU=;
 b=SJDja9h6UtfNAUg5oK/VRP6/tKbJqSiZ5Q40Q/rsV7W6W8HMEwIWnncmcE2gz1f8OZ
 kwNS9gh9+5DAd3VjEQUYI26QIhRyP8ch7/YIPFtlOkEdqss48Hk1OQBIY1gNJ5dJeCyM
 ke1h+beSlMBnwvfJ98sylpus46dpMkE2gfMqycmc/vV5SQens1lf1s2EvrWdIXzGjjmO
 GYtTHozlAwIVnKUETcgnbf3j8ZEbCYXs7q4oZspGOel5RD6JX62cbuhGiPSV2tTB8g+1
 j6uVyjAqL5dvZOzp7gXGKTL0wLMSRovHmktRDSU+IH2PRVIS6fa/dMRt6NiqB/vXKKdv
 4/iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IKpyCKIs/jrOVc5VAvk0L9f//34jaxchmo8sNz+qRQU=;
 b=DosyhV0OZHN8VNRfpdbaobNxAVCy97qTwEncArfHUScYL/XNeSsgB1OphpHF9vUEff
 0e19szOec5nLuMUgVb1ZF1Zl/8L1T1l/z0Y0rVAyV/k46UcvvMP0uRaiKE+Z3Fuf6CKh
 d9ybhnecvHTq6zzygBBln25kARa2vy5dHAuNGnjlhI0fhpkv+9/9h6BSx75u38qO8aeJ
 HDpBI1kXOuv86tFfGq3ZVF9uBF2W8s8I8+m2KbDYhc4KbEC7cv0oSSO5le7THv7zCiZ8
 KgBoOWn9PA+8F9n8yCw/jzZMeg8F0zUklLaPB55TmaNmbQo+xejkhabAYs6uJHqpeMA6
 rFzg==
X-Gm-Message-State: AOAM531n2SYlr94sSjQQ1c7EnFc1J8X6zAnCpbv1td0NsZW7z9oXYZje
 rVcViAuuItCTy292Tt7BO3U6WUL0PZxU21yX
X-Google-Smtp-Source: ABdhPJxne8l1zUs96rwAhqEOEw8rZFHm6kO0lq9/H4otng32/UOQC9yptKcHQ4Uq4fWlMolHmGiNTQ==
X-Received: by 2002:a05:6000:1787:: with SMTP id
 e7mr5643314wrg.167.1625230813682; 
 Fri, 02 Jul 2021 06:00:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id s3sm3333351wro.30.2021.07.02.06.00.13
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jul 2021 06:00:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/24] target/arm: Implement MVE shifts by register
Date: Fri,  2 Jul 2021 13:59:54 +0100
Message-Id: <20210702125954.13247-25-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210702125954.13247-1-peter.maydell@linaro.org>
References: <20210702125954.13247-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Implement the MVE shifts by register, which perform
shifts on a single general-purpose register.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210628135835.6690-19-peter.maydell@linaro.org
---
 target/arm/helper-mve.h |  2 ++
 target/arm/translate.h  |  1 +
 target/arm/t32.decode   | 18 ++++++++++++++----
 target/arm/mve_helper.c | 10 ++++++++++
 target/arm/translate.c  | 30 ++++++++++++++++++++++++++++++
 5 files changed, 57 insertions(+), 4 deletions(-)

diff --git a/target/arm/helper-mve.h b/target/arm/helper-mve.h
index 1fba9d6422d..56e40844ad9 100644
--- a/target/arm/helper-mve.h
+++ b/target/arm/helper-mve.h
@@ -461,3 +461,5 @@ DEF_HELPER_FLAGS_3(mve_uqrshll48, TCG_CALL_NO_RWG, i64, env, i64, i32)
 
 DEF_HELPER_FLAGS_3(mve_uqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
 DEF_HELPER_FLAGS_3(mve_sqshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_uqrshl, TCG_CALL_NO_RWG, i32, env, i32, i32)
+DEF_HELPER_FLAGS_3(mve_sqrshr, TCG_CALL_NO_RWG, i32, env, i32, i32)
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 2c7ca2a1f77..241596c5bda 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -467,6 +467,7 @@ typedef void AtomicThreeOpFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGArg, MemOp);
 typedef void WideShiftImmFn(TCGv_i64, TCGv_i64, int64_t shift);
 typedef void WideShiftFn(TCGv_i64, TCGv_ptr, TCGv_i64, TCGv_i32);
 typedef void ShiftImmFn(TCGv_i32, TCGv_i32, int32_t shift);
+typedef void ShiftFn(TCGv_i32, TCGv_ptr, TCGv_i32, TCGv_i32);
 
 /**
  * arm_tbflags_from_tb:
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index 1c3406c67aa..2d47f31f143 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -51,6 +51,7 @@
 &mve_shl_ri      rdalo rdahi shim
 &mve_shl_rr      rdalo rdahi rm
 &mve_sh_ri       rda shim
+&mve_sh_rr       rda rm
 
 # rdahi: bits [3:1] from insn, bit 0 is 1
 # rdalo: bits [3:1] from insn, bit 0 is 0
@@ -74,6 +75,7 @@
                  &mve_shl_rr rdalo=%rdalo_17 rdahi=%rdahi_9
 @mve_sh_ri       ....... .... . rda:4 . ... ... . .. .. .... \
                  &mve_sh_ri shim=%imm5_12_6
+@mve_sh_rr       ....... .... . rda:4 rm:4 .... .... .... &mve_sh_rr
 
 {
   TST_xrri       1110101 0000 1 .... 0 ... 1111 .... ....     @S_xrr_shi
@@ -112,10 +114,18 @@ BIC_rrri         1110101 0001 . .... 0 ... .... .... ....     @s_rrr_shi
       SQSHLL_ri  1110101 0010 1 ... 1 0 ... ... 1 .. 11 1111  @mve_shl_ri
     }
 
-    LSLL_rr      1110101 0010 1 ... 0 ....  ... 1  0000 1101  @mve_shl_rr
-    ASRL_rr      1110101 0010 1 ... 0 ....  ... 1  0010 1101  @mve_shl_rr
-    UQRSHLL64_rr 1110101 0010 1 ... 1 ....  ... 1  0000 1101  @mve_shl_rr
-    SQRSHRL64_rr 1110101 0010 1 ... 1 ....  ... 1  0010 1101  @mve_shl_rr
+    {
+      UQRSHL_rr    1110101 0010 1 ....  ....  1111 0000 1101  @mve_sh_rr
+      LSLL_rr      1110101 0010 1 ... 0 .... ... 1 0000 1101  @mve_shl_rr
+      UQRSHLL64_rr 1110101 0010 1 ... 1 .... ... 1 0000 1101  @mve_shl_rr
+    }
+
+    {
+      SQRSHR_rr    1110101 0010 1 ....  ....  1111 0010 1101  @mve_sh_rr
+      ASRL_rr      1110101 0010 1 ... 0 .... ... 1 0010 1101  @mve_shl_rr
+      SQRSHRL64_rr 1110101 0010 1 ... 1 .... ... 1 0010 1101  @mve_shl_rr
+    }
+
     UQRSHLL48_rr 1110101 0010 1 ... 1 ....  ... 1  1000 1101  @mve_shl_rr
     SQRSHRL48_rr 1110101 0010 1 ... 1 ....  ... 1  1010 1101  @mve_shl_rr
   ]
diff --git a/target/arm/mve_helper.c b/target/arm/mve_helper.c
index 5e60e2a9d83..db5d6220854 100644
--- a/target/arm/mve_helper.c
+++ b/target/arm/mve_helper.c
@@ -1638,3 +1638,13 @@ uint32_t HELPER(mve_sqshl)(CPUARMState *env, uint32_t n, uint32_t shift)
 {
     return do_sqrshl_bhs(n, (int8_t)shift, 32, false, &env->QF);
 }
+
+uint32_t HELPER(mve_uqrshl)(CPUARMState *env, uint32_t n, uint32_t shift)
+{
+    return do_uqrshl_bhs(n, (int8_t)shift, 32, true, &env->QF);
+}
+
+uint32_t HELPER(mve_sqrshr)(CPUARMState *env, uint32_t n, uint32_t shift)
+{
+    return do_sqrshl_bhs(n, -(int8_t)shift, 32, true, &env->QF);
+}
diff --git a/target/arm/translate.c b/target/arm/translate.c
index e38619b571b..28e478927df 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -5925,6 +5925,36 @@ static bool trans_UQSHL_ri(DisasContext *s, arg_mve_sh_ri *a)
     return do_mve_sh_ri(s, a, gen_mve_uqshl);
 }
 
+static bool do_mve_sh_rr(DisasContext *s, arg_mve_sh_rr *a, ShiftFn *fn)
+{
+    if (!arm_dc_feature(s, ARM_FEATURE_V8_1M)) {
+        /* Decode falls through to ORR/MOV UNPREDICTABLE handling */
+        return false;
+    }
+    if (!dc_isar_feature(aa32_mve, s) ||
+        !arm_dc_feature(s, ARM_FEATURE_M_MAIN) ||
+        a->rda == 13 || a->rda == 15 || a->rm == 13 || a->rm == 15 ||
+        a->rm == a->rda) {
+        /* These rda/rm cases are UNPREDICTABLE; we choose to UNDEF */
+        unallocated_encoding(s);
+        return true;
+    }
+
+    /* The helper takes care of the sign-extension of the low 8 bits of Rm */
+    fn(cpu_R[a->rda], cpu_env, cpu_R[a->rda], cpu_R[a->rm]);
+    return true;
+}
+
+static bool trans_SQRSHR_rr(DisasContext *s, arg_mve_sh_rr *a)
+{
+    return do_mve_sh_rr(s, a, gen_helper_mve_sqrshr);
+}
+
+static bool trans_UQRSHL_rr(DisasContext *s, arg_mve_sh_rr *a)
+{
+    return do_mve_sh_rr(s, a, gen_helper_mve_uqrshl);
+}
+
 /*
  * Multiply and multiply accumulate
  */
-- 
2.20.1


