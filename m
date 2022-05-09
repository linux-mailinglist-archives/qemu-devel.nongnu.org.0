Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 301D051FC80
	for <lists+qemu-devel@lfdr.de>; Mon,  9 May 2022 14:18:43 +0200 (CEST)
Received: from localhost ([::1]:57170 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1no2La-000082-99
	for lists+qemu-devel@lfdr.de; Mon, 09 May 2022 08:18:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49768)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22X-0007EE-9I
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:01 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:42926)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1no22V-0001Gn-9j
 for qemu-devel@nongnu.org; Mon, 09 May 2022 07:59:00 -0400
Received: by mail-wr1-x436.google.com with SMTP id e24so19108668wrc.9
 for <qemu-devel@nongnu.org>; Mon, 09 May 2022 04:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vceOIhx7TgPek853xQx9nRZrn5XzWmRekZy6kMIQLHM=;
 b=jDD6IlsQ9JjrxAmW8owpTZQ6OTI54wUiYtmu9oNICosINeB+VD1KlTxzrjxGY2rGIl
 Pa9fE+/Lwr/+jO3+4yu9YHZLPXA1+kmJCuda4Sy+yOb5wZcVixQx0c/tDzT3gojeyPu1
 zjoalsaeBqnb38Mi0R2Uhw4oK8F49qg6dRnn5pcbYkx9ysD08nW9Jf6s9WC2PL0lRWXT
 xTw+vEgxgzujSGzelYqMx2AYz+b+oK48WNXhhk5Vv3H2nusZmNQ+FOXKt80VBrfDptyN
 IVEas9gTMx3SMcMQ7gn3/q9iaYrl9AK1SGG55k2EdZH7dOwMgVZIqq/Mq9OO7JL3GZ4F
 OgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vceOIhx7TgPek853xQx9nRZrn5XzWmRekZy6kMIQLHM=;
 b=6A8lUY7QvFH6ZtmaKfygCdqKX6k5LRnTPTw2ExBp8sVSaxTXK7JEuNcEAoU5xrPscl
 h1KuD2LXtajrN4tjt/HjYGHrMrv3pULwjNCPTS8SekBp3+IaFKHOm8N+muPRzQHU4FNT
 przHvGQfam+pxAMsfrwf+AOKfe0uuVHiguvGfTD6cpDpRgVMjWYLU7nOONUmjAqD3JLP
 d0XPtTsGEh9d4VHy2t5au0ROijdtsH6X9ibuk++/I4cIihjU2NgovKmjbas4Wj/QRGjJ
 J6JCgQF//brRvfrX9Rq7GGXD6hWekJTZvylV/0b76p6PSD5uBqwIMO7kqOXxn1qVHGun
 gc4g==
X-Gm-Message-State: AOAM532OvIveI4TcZOQgo/4q9el2U9hneQINX9NTo2lZ67dNQTl2DeIZ
 5tZJvP+uNblk4YqR3wfZiLQrCl96JzhSpQ==
X-Google-Smtp-Source: ABdhPJwcxuVk9wSgKo7G2eXmSk2QcOjAOgpyGe9eEky+KCCRNbkw20rpk4V2uPvCzq4axinY/lEx2Q==
X-Received: by 2002:adf:fa42:0:b0:20a:e8d6:58b8 with SMTP id
 y2-20020adffa42000000b0020ae8d658b8mr13912991wrr.64.1652097538460; 
 Mon, 09 May 2022 04:58:58 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bs6-20020a056000070600b0020c5253d8bdsm12199928wrb.9.2022.05.09.04.58.57
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 May 2022 04:58:58 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 10/32] target/arm: Annotate arm_max_initfn with FEAT identifiers
Date: Mon,  9 May 2022 12:58:26 +0100
Message-Id: <20220509115848.3521805-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509115848.3521805-1-peter.maydell@linaro.org>
References: <20220509115848.3521805-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

Update the legacy feature names to the current names.
Provide feature names for id changes that were not marked.
Sort the field updates into increasing bitfield order.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220506180242.216785-10-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu64.c   | 100 +++++++++++++++++++++----------------------
 target/arm/cpu_tcg.c |  48 ++++++++++-----------
 2 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 6da42af56eb..5fce40a6bc0 100644
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
index b0dbf2c991b..bc8f9d0edf5 100644
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
2.25.1


