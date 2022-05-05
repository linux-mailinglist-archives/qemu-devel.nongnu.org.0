Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C65BE51C8BB
	for <lists+qemu-devel@lfdr.de>; Thu,  5 May 2022 21:12:39 +0200 (CEST)
Received: from localhost ([::1]:58898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmgty-0002j1-Pj
	for lists+qemu-devel@lfdr.de; Thu, 05 May 2022 15:12:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYY-0002mr-BS
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:30 -0400
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232]:44008)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nmgYQ-0004Qa-Bp
 for qemu-devel@nongnu.org; Thu, 05 May 2022 14:50:29 -0400
Received: by mail-oi1-x232.google.com with SMTP id v65so5241290oig.10
 for <qemu-devel@nongnu.org>; Thu, 05 May 2022 11:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z9jnYlb3diHDx/Tz1NJJu7ooSfZI5A88/Vi2Hs36v6U=;
 b=N5qrZHIPA0O+oO+JhJJ6Vmw8GJRlVjBb8R1DKOzCRoYRih93VZdai4XjfG+hc9KrZa
 5+TdCFRKsUwU3Ngtg/i/vzIY+lOeLRTSDOY6peNhijNFHDVh1w4zZkKvoy6+qsijhKpO
 Fj1Sw++AwaaK9AfxiG/k1ftWmelaEAHlWvbaE/jkCNIvdSfErWQRFX/K1zrxCKpJyePN
 53PeNqOXxw/cAb76NzS7BCIRXDPw+K0Ncdyb8xGRuudQlJ0LutCVRjTL1p9L4kRdF/WF
 Rq6GiQZlBt4IiamIT85+naBicaFGqs+e4JGw2MpruGZ6LyvmLa7VxNTJYZvbVA0BAqYt
 fyhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z9jnYlb3diHDx/Tz1NJJu7ooSfZI5A88/Vi2Hs36v6U=;
 b=mHX0nr5X7VThEFe1u5LipBHEDZr8TMD6dEKqhb24LNrJmS3ziQkycaMBXOih+CC7N5
 7KGNpkkYzU5GevburY9oWhx7bl2w9o2bbSqkxrS5L/OrPPW7iUSf6ERqJk75GY4caa8o
 0Lh0DHUMVn7Z5RgqNLofRrR3q8cM9xToMfadaTfC66kS8nQwAQeCS+s+WfrhtunFx2oD
 8N8jcFJ83SOsmt/4fR+Np/RSt2Bh5jg0GBbdcIurdHLymgCOm0pv6vN6Hz6TzkNJmMoe
 wZJ33Eeytj2D6cU2caS+5MG0iu2JQLhYwBGRWSRDOQetK6+ng/dbpYfpsZVgGzo9YhB3
 DT+w==
X-Gm-Message-State: AOAM531UMUBF9AxoSXqb8FkrwJfPT408JlA39Ire+/k0qN9eu2OaPsJA
 S5JXuxOJ4CbF+JbhAxRM4W1PMhzcatFf02j4
X-Google-Smtp-Source: ABdhPJw+kUFhvxtvjZlFpCzKeBlEYJKx1ZnlVBVFvD2aJM5KJEsvDI20MGmuHzzdk/Ldbk8VqTb1jQ==
X-Received: by 2002:a54:4e9a:0:b0:325:7334:68f0 with SMTP id
 c26-20020a544e9a000000b00325733468f0mr3349420oiy.130.1651776621180; 
 Thu, 05 May 2022 11:50:21 -0700 (PDT)
Received: from stoup.. ([2607:fb90:5fe8:83ea:bbf4:c9ef:4f3:11c6])
 by smtp.gmail.com with ESMTPSA id
 s36-20020a0568302aa400b0060603221259sm857273otu.41.2022.05.05.11.50.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 May 2022 11:50:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 09/24] target/arm: Annotate arm_max_initfn with FEAT
 identifiers
Date: Thu,  5 May 2022 13:49:51 -0500
Message-Id: <20220505185006.200555-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220505185006.200555-1-richard.henderson@linaro.org>
References: <20220505185006.200555-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::232;
 envelope-from=richard.henderson@linaro.org; helo=mail-oi1-x232.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Update the legacy feature names to the current names.
Provide feature names for id changes that were not marked.
Sort the field updates into increasing bitfield order.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c   | 100 +++++++++++++++++++++----------------------
 target/arm/cpu_tcg.c |  48 ++++++++++-----------
 2 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6da42af56e..5fce40a6bc 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -713,51 +713,51 @@ static void aarch64_max_initfn(Object *obj)
     cpu->midr = t;
 
     t = cpu->isar.id_aa64isar0;
-    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2); /* AES + PMULL */
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2); /* SHA512 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, AES, 2);      /* FEAT_PMULL */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA1, 1);     /* FEAT_SHA1 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA2, 2);     /* FEAT_SHA512 */
     t = FIELD_DP64(t, ID_AA64ISAR0, CRC32, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);
-    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2); /* v8.5-CondM */
-    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2); /* FEAT_TLBIRANGE */
-    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR0, ATOMIC, 2);   /* FEAT_LSE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RDM, 1);      /* FEAT_RDM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SHA3, 1);     /* FEAT_SHA3 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM3, 1);      /* FEAT_SM3 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, SM4, 1);      /* FEAT_SM4 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, DP, 1);       /* FEAT_DotProd */
+    t = FIELD_DP64(t, ID_AA64ISAR0, FHM, 1);      /* FEAT_FHM */
+    t = FIELD_DP64(t, ID_AA64ISAR0, TS, 2);       /* FEAT_FlagM2 */
+    t = FIELD_DP64(t, ID_AA64ISAR0, TLB, 2);      /* FEAT_TLBIRANGE */
+    t = FIELD_DP64(t, ID_AA64ISAR0, RNDR, 1);     /* FEAT_RNG */
     cpu->isar.id_aa64isar0 = t;
 
     t = cpu->isar.id_aa64isar1;
-    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);
-    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);
-    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2); /* ARMv8.4-RCPC */
-    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);
+    t = FIELD_DP64(t, ID_AA64ISAR1, DPB, 2);      /* FEAT_DPB2 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, JSCVT, 1);    /* FEAT_JSCVT */
+    t = FIELD_DP64(t, ID_AA64ISAR1, FCMA, 1);     /* FEAT_FCMA */
+    t = FIELD_DP64(t, ID_AA64ISAR1, LRCPC, 2);    /* FEAT_LRCPC2 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, FRINTTS, 1);  /* FEAT_FRINTTS */
+    t = FIELD_DP64(t, ID_AA64ISAR1, SB, 1);       /* FEAT_SB */
+    t = FIELD_DP64(t, ID_AA64ISAR1, SPECRES, 1);  /* FEAT_SPECRES */
+    t = FIELD_DP64(t, ID_AA64ISAR1, BF16, 1);     /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ISAR1, I8MM, 1);     /* FEAT_I8MM */
     cpu->isar.id_aa64isar1 = t;
 
     t = cpu->isar.id_aa64pfr0;
+    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);        /* FEAT_FP16 */
+    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);   /* FEAT_FP16 */
     t = FIELD_DP64(t, ID_AA64PFR0, SVE, 1);
-    t = FIELD_DP64(t, ID_AA64PFR0, FP, 1);
-    t = FIELD_DP64(t, ID_AA64PFR0, ADVSIMD, 1);
-    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);
-    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);
+    t = FIELD_DP64(t, ID_AA64PFR0, SEL2, 1);      /* FEAT_SEL2 */
+    t = FIELD_DP64(t, ID_AA64PFR0, DIT, 1);       /* FEAT_DIT */
     cpu->isar.id_aa64pfr0 = t;
 
     t = cpu->isar.id_aa64pfr1;
-    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);
-    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);
+    t = FIELD_DP64(t, ID_AA64PFR1, BT, 1);        /* FEAT_BTI */
+    t = FIELD_DP64(t, ID_AA64PFR1, SSBS, 2);      /* FEAT_SSBS2 */
     /*
      * Begin with full support for MTE. This will be downgraded to MTE=0
      * during realize if the board provides no tag memory, much like
      * we do for EL2 with the virtualization=on property.
      */
-    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);
+    t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     cpu->isar.id_aa64pfr1 = t;
 
     t = cpu->isar.id_aa64mmfr0;
@@ -769,37 +769,37 @@ static void aarch64_max_initfn(Object *obj)
     cpu->isar.id_aa64mmfr0 = t;
 
     t = cpu->isar.id_aa64mmfr1;
-    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1); /* HPD */
-    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);
-    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);
-    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2); /* ATS1E1 */
-    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* VMID16 */
-    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1); /* TTS2UXN */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VMIDBITS, 2); /* FEAT_VMID16 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, VH, 1);       /* FEAT_VHE */
+    t = FIELD_DP64(t, ID_AA64MMFR1, HPDS, 1);     /* FEAT_HPDS */
+    t = FIELD_DP64(t, ID_AA64MMFR1, LO, 1);       /* FEAT_LOR */
+    t = FIELD_DP64(t, ID_AA64MMFR1, PAN, 2);      /* FEAT_PAN2 */
+    t = FIELD_DP64(t, ID_AA64MMFR1, XNX, 1);      /* FEAT_XNX */
     cpu->isar.id_aa64mmfr1 = t;
 
     t = cpu->isar.id_aa64mmfr2;
-    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);
-    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1); /* TTCNP */
-    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1); /* TTST */
-    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1); /* FEAT_LVA */
-    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1); /* FEAT_TTL */
-    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2); /* FEAT_BBM at level 2 */
+    t = FIELD_DP64(t, ID_AA64MMFR2, CNP, 1);      /* FEAT_TTCNP */
+    t = FIELD_DP64(t, ID_AA64MMFR2, UAO, 1);      /* FEAT_UAO */
+    t = FIELD_DP64(t, ID_AA64MMFR2, VARANGE, 1);  /* FEAT_LVA */
+    t = FIELD_DP64(t, ID_AA64MMFR2, ST, 1);       /* FEAT_TTST */
+    t = FIELD_DP64(t, ID_AA64MMFR2, TTL, 1);      /* FEAT_TTL */
+    t = FIELD_DP64(t, ID_AA64MMFR2, BBM, 2);      /* FEAT_BBM at level 2 */
     cpu->isar.id_aa64mmfr2 = t;
 
     t = cpu->isar.id_aa64zfr0;
     t = FIELD_DP64(t, ID_AA64ZFR0, SVEVER, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);  /* PMULL */
-    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);
-    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);
+    t = FIELD_DP64(t, ID_AA64ZFR0, AES, 2);       /* FEAT_SVE_PMULL128 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BITPERM, 1);   /* FEAT_SVE_BitPerm */
+    t = FIELD_DP64(t, ID_AA64ZFR0, BFLOAT16, 1);  /* FEAT_BF16 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, SHA3, 1);      /* FEAT_SVE_SHA3 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, SM4, 1);       /* FEAT_SVE_SM4 */
+    t = FIELD_DP64(t, ID_AA64ZFR0, I8MM, 1);      /* FEAT_I8MM */
+    t = FIELD_DP64(t, ID_AA64ZFR0, F32MM, 1);     /* FEAT_F32MM */
+    t = FIELD_DP64(t, ID_AA64ZFR0, F64MM, 1);     /* FEAT_F64MM */
     cpu->isar.id_aa64zfr0 = t;
 
     t = cpu->isar.id_aa64dfr0;
-    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5); /* v8.4-PMU */
+    t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
     /* Replicate the same data to the 32-bit id registers.  */
diff --git a/target/arm/cpu_tcg.c b/target/arm/cpu_tcg.c
index b0dbf2c991..bc8f9d0edf 100644
--- a/target/arm/cpu_tcg.c
+++ b/target/arm/cpu_tcg.c
@@ -28,55 +28,55 @@ void aa32_max_features(ARMCPU *cpu)
 
     /* Add additional features supported by QEMU */
     t = cpu->isar.id_isar5;
-    t = FIELD_DP32(t, ID_ISAR5, AES, 2);
-    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);
-    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);
+    t = FIELD_DP32(t, ID_ISAR5, AES, 2);          /* FEAT_PMULL */
+    t = FIELD_DP32(t, ID_ISAR5, SHA1, 1);         /* FEAT_SHA1 */
+    t = FIELD_DP32(t, ID_ISAR5, SHA2, 1);         /* FEAT_SHA256 */
     t = FIELD_DP32(t, ID_ISAR5, CRC32, 1);
-    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);
-    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);
+    t = FIELD_DP32(t, ID_ISAR5, RDM, 1);          /* FEAT_RDM */
+    t = FIELD_DP32(t, ID_ISAR5, VCMA, 1);         /* FEAT_FCMA */
     cpu->isar.id_isar5 = t;
 
     t = cpu->isar.id_isar6;
-    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);
-    t = FIELD_DP32(t, ID_ISAR6, DP, 1);
-    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SB, 1);
-    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);
-    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);
-    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);
+    t = FIELD_DP32(t, ID_ISAR6, JSCVT, 1);        /* FEAT_JSCVT */
+    t = FIELD_DP32(t, ID_ISAR6, DP, 1);           /* Feat_DotProd */
+    t = FIELD_DP32(t, ID_ISAR6, FHM, 1);          /* FEAT_FHM */
+    t = FIELD_DP32(t, ID_ISAR6, SB, 1);           /* FEAT_SB */
+    t = FIELD_DP32(t, ID_ISAR6, SPECRES, 1);      /* FEAT_SPECRES */
+    t = FIELD_DP32(t, ID_ISAR6, BF16, 1);         /* FEAT_AA32BF16 */
+    t = FIELD_DP32(t, ID_ISAR6, I8MM, 1);         /* FEAT_AA32I8MM */
     cpu->isar.id_isar6 = t;
 
     t = cpu->isar.mvfr1;
-    t = FIELD_DP32(t, MVFR1, FPHP, 3);     /* v8.2-FP16 */
-    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);   /* v8.2-FP16 */
+    t = FIELD_DP32(t, MVFR1, FPHP, 3);            /* FEAT_FP16 */
+    t = FIELD_DP32(t, MVFR1, SIMDHP, 2);          /* FEAT_FP16 */
     cpu->isar.mvfr1 = t;
 
     t = cpu->isar.mvfr2;
-    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3); /* SIMD MaxNum */
-    t = FIELD_DP32(t, MVFR2, FPMISC, 4);   /* FP MaxNum */
+    t = FIELD_DP32(t, MVFR2, SIMDMISC, 3);        /* SIMD MaxNum */
+    t = FIELD_DP32(t, MVFR2, FPMISC, 4);          /* FP MaxNum */
     cpu->isar.mvfr2 = t;
 
     t = cpu->isar.id_mmfr3;
-    t = FIELD_DP32(t, ID_MMFR3, PAN, 2); /* ATS1E1 */
+    t = FIELD_DP32(t, ID_MMFR3, PAN, 2);          /* FEAT_PAN2 */
     cpu->isar.id_mmfr3 = t;
 
     t = cpu->isar.id_mmfr4;
-    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1); /* AA32HPD */
-    t = FIELD_DP32(t, ID_MMFR4, AC2, 1); /* ACTLR2, HACTLR2 */
-    t = FIELD_DP32(t, ID_MMFR4, CNP, 1); /* TTCNP */
-    t = FIELD_DP32(t, ID_MMFR4, XNX, 1); /* TTS2UXN */
+    t = FIELD_DP32(t, ID_MMFR4, HPDS, 1);         /* FEAT_AA32HPD */
+    t = FIELD_DP32(t, ID_MMFR4, AC2, 1);          /* ACTLR2, HACTLR2 */
+    t = FIELD_DP32(t, ID_MMFR4, CNP, 1);          /* FEAT_TTCNP */
+    t = FIELD_DP32(t, ID_MMFR4, XNX, 1);          /* FEAT_XNX*/
     cpu->isar.id_mmfr4 = t;
 
     t = cpu->isar.id_pfr0;
-    t = FIELD_DP32(t, ID_PFR0, DIT, 1);
+    t = FIELD_DP32(t, ID_PFR0, DIT, 1);           /* FEAT_DIT */
     cpu->isar.id_pfr0 = t;
 
     t = cpu->isar.id_pfr2;
-    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);
+    t = FIELD_DP32(t, ID_PFR2, SSBS, 1);          /* FEAT_SSBS */
     cpu->isar.id_pfr2 = t;
 
     t = cpu->isar.id_dfr0;
-    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5); /* v8.4-PMU */
+    t = FIELD_DP32(t, ID_DFR0, PERFMON, 5);       /* FEAT_PMUv3p4 */
     cpu->isar.id_dfr0 = t;
 }
 
-- 
2.34.1


