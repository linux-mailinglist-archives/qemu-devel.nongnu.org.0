Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8710656837D
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 11:31:24 +0200 (CEST)
Received: from localhost ([::1]:41296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o91NT-0001cz-JZ
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 05:31:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90M0-0006iO-2A
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:49 -0400
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431]:33578)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o90Ly-0000mY-Fa
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 04:25:47 -0400
Received: by mail-pf1-x431.google.com with SMTP id n12so13789727pfq.0
 for <qemu-devel@nongnu.org>; Wed, 06 Jul 2022 01:25:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=asVIVIoowKUhkyzxDq1stWKniA6O4cXXCtHWZbtFt2Q=;
 b=A4bi2Wt1/yill0hOQ8JbL5QHzZxSrAqRK9S93r0jrd1wyxlb40kmlfuNT+ukO2kddW
 gWdrmgqq/6Tdmand/FEIylhEdH6I8ug46Z12RgBeICXgYRPWUbPIPB5K7vy6lKDww6F4
 ttnhzJ6qFKkq7c0Yjvq3huNKVtvsen8aNa9StO3gPbP3nAfdFZyYXJbR8QkMeZovXc67
 qMyrTI9LQdgxeSKkroiVQQ6oX4cZ0QJhOlp5BoRHN2tY3ycIqDo3m07t0QJ70KYmB2Ka
 MCtISrNvszJw5+1opdAhUEhps4QDi+89IvAz1sDDp1+cUIIVk8s0RJzunYb0hfkUd+MJ
 DksA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=asVIVIoowKUhkyzxDq1stWKniA6O4cXXCtHWZbtFt2Q=;
 b=3dsPFz5sMTZ9DwUHGVo4t/5i0jjN+nAHUqVTWkKTpd0bCN7dzMDOTaXqiywRn9qmBo
 gUNc+Dv8/rFKSPupltzBY+V1d9YT5RiF4Unowgt6nDQK0UoMjjuelaKO8yzgXBLHspC+
 ms7TR9gRGRo7XLxft8yW0mlXllZoNBmkHWpjeXaJ2QIuY7VbSyU6Nu4hThGcz1RBD6dL
 KnMke6VVav/cuMPnAhOOYh8Q2xgLVEtg95oZKNrIJTer/ll8/KobCoUDdYR1TV/4aKvb
 RA7cvjRcpa+ISVhY9Bg4U3NPx0o+HEDqGDBOm36IEjKU84Ld+hFFZ/CW55iVdSe7jBPr
 3mfg==
X-Gm-Message-State: AJIora9jOrWdvusklDdCxCs19Etmko8tjHJOnEaN3oscyhTtGOk5YFbJ
 QHcyRWtpoFBD6+Cmtp8sAdvvbFwMXVQDHjc9
X-Google-Smtp-Source: AGRyM1vKUvkcr2PjKxY1wvESQZLq8iRqjlVJUf+qpbPblkXX2Id5qCYwDe8gTogpLbdcU4lrtlJ8ag==
X-Received: by 2002:aa7:9823:0:b0:525:15b1:3297 with SMTP id
 q3-20020aa79823000000b0052515b13297mr45774128pfl.13.1657095945261; 
 Wed, 06 Jul 2022 01:25:45 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 t17-20020a170902e85100b00162529828aesm25199256plg.109.2022.07.06.01.25.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Jul 2022 01:25:44 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v5 32/45] target/arm: Enable SME for -cpu max
Date: Wed,  6 Jul 2022 13:53:58 +0530
Message-Id: <20220706082411.1664825-33-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220706082411.1664825-1-richard.henderson@linaro.org>
References: <20220706082411.1664825-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::431;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x431.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

Note that SME remains effectively disabled for user-only,
because we do not yet set CPACR_EL1.SMEN.  This needs to
wait until the kernel ABI is implemented.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 docs/system/arm/emulation.rst |  4 ++++
 target/arm/cpu64.c            | 11 +++++++++++
 2 files changed, 15 insertions(+)

diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 83b4410065..8e494c8bea 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -65,6 +65,10 @@ the following architecture extensions:
 - FEAT_SHA512 (Advanced SIMD SHA512 instructions)
 - FEAT_SM3 (Advanced SIMD SM3 instructions)
 - FEAT_SM4 (Advanced SIMD SM4 instructions)
+- FEAT_SME (Scalable Matrix Extension)
+- FEAT_SME_FA64 (Full A64 instruction set in Streaming SVE mode)
+- FEAT_SME_F64F64 (Double-precision floating-point outer product instructions)
+- FEAT_SME_I16I64 (16-bit to 64-bit integer widening outer product instructions)
 - FEAT_SPECRES (Speculation restriction instructions)
 - FEAT_SSBS (Speculative Store Bypass Safe)
 - FEAT_TLBIOS (TLB invalidate instructions in Outer Shareable domain)
diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index 19188d6cc2..40a0f043d0 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1018,6 +1018,7 @@ static void aarch64_max_initfn(Object *obj)
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
     t = FIELD_DP64(t, ID_AA64PFR1, RAS_FRAC, 0);  /* FEAT_RASv1p1 + FEAT_DoubleFault */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1068,6 +1069,16 @@ static void aarch64_max_initfn(Object *obj)
     t = FIELD_DP64(t, ID_AA64DFR0, PMUVER, 5);    /* FEAT_PMUv3p4 */
     cpu->isar.id_aa64dfr0 = t;
 
+    t = cpu->isar.id_aa64smfr0;
+    t = FIELD_DP64(t, ID_AA64SMFR0, F32F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, B16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F16F32, 1);   /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I8I32, 0xf);  /* FEAT_SME */
+    t = FIELD_DP64(t, ID_AA64SMFR0, F64F64, 1);   /* FEAT_SME_F64F64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, I16I64, 0xf); /* FEAT_SME_I16I64 */
+    t = FIELD_DP64(t, ID_AA64SMFR0, FA64, 1);     /* FEAT_SME_FA64 */
+    cpu->isar.id_aa64smfr0 = t;
+
     /* Replicate the same data to the 32-bit id registers.  */
     aa32_max_features(cpu);
 
-- 
2.34.1


