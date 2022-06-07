Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 48572541A82
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:33:58 +0200 (CEST)
Received: from localhost ([::1]:51322 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygpp-0002Yi-8s
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:33:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36172)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwr-00074V-MH
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:09 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:44681)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwk-0008FN-Fe
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:37:09 -0400
Received: by mail-pl1-x62c.google.com with SMTP id h1so15783115plf.11
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=82yuKxX8pMTqpPKtHE5QelO5OO41QYfrwZUlFAo4P7w=;
 b=BreawBXY9enZFIP3Rs46FVFvH6xUeZTQmqf1OvRZ/7IUZGyYuRSAiybGHJGMfxBl9Z
 GpApFx6nU/hms+mSfe5x4iSw273YUu5YvyQonzZCClPphSnbHX/plOCqjm3c87HqEmac
 KUipLn7hBLOwucGwWDkwXlq6GMgJeb9/1nKGwV3wuzkEFjtV/uJ48X+LA/znU8r6lOxb
 OZfn7d5Ky/earCyKN9bzE8mPsw/6IgV0nnvBw3hSCQdZ13qTYJymNJW9PQhLbnluq1oS
 q4opxK7DSiobmya5pSi9Xo1/HFU/XKyLcsQhi3UPTOJZ0wohaVQ9JY1X9BvjKDeoZXSk
 01MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=82yuKxX8pMTqpPKtHE5QelO5OO41QYfrwZUlFAo4P7w=;
 b=vHDFIrx5vMG04R2ik7T0Ie48Lht9T/EW63xyqZkLgXFqyr0Orp1YgfsA1jbkuNvLJI
 DTRcMnetlfFAI2WdtWKyJALWpgINxIJMfFs8Tx1hIMfwu8fvl9OzynGL7J7tHcx1AZ6V
 4dqJQSoWuxoB+8UoLq4g2dyXklmIJBFI04iifjC1FkS/D4OrxFJcVJQ/TtJIprQA82Qr
 FHz1iPdF2V3HjeFwSL0KxqSmilimTxQ+RURkuW8gbVA7JS2KfTYS4KLacUoI+wfcQhrj
 SrOFtnUmn76e8YM12tBLkPFAv1rAQI4k7KnJJkRxvuXWhfT48V/JX/lboOJ+hF3b9lVm
 +iIw==
X-Gm-Message-State: AOAM533R/W3h+lD20s3PfQsbqFgj2ACV46DSZ+4PCM8YmZSB4ZC0hnnJ
 ugrlDeP8oKs/EH1Q5jCfMDV/mzcDGgs2wQ==
X-Google-Smtp-Source: ABdhPJzG9H51z15HpuzVMNiQ5RsKUiJ3WHQJdb2LGtUfO6rcOelwpdKqi/WgoWFrH9qWS34EU1meOA==
X-Received: by 2002:a17:903:2cf:b0:151:a932:f1f0 with SMTP id
 s15-20020a17090302cf00b00151a932f1f0mr31356879plk.130.1654634221623; 
 Tue, 07 Jun 2022 13:37:01 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 58/71] target/arm: Enable SME for -cpu max
Date: Tue,  7 Jun 2022 13:32:53 -0700
Message-Id: <20220607203306.657998-59-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu64.c            | 11 +++++++++++
 docs/system/arm/emulation.rst |  4 ++++
 2 files changed, 15 insertions(+)

diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
index aaf2c243d6..d77522e278 100644
--- a/target/arm/cpu64.c
+++ b/target/arm/cpu64.c
@@ -1017,6 +1017,7 @@ static void aarch64_max_initfn(Object *obj)
      * we do for EL2 with the virtualization=on property.
      */
     t = FIELD_DP64(t, ID_AA64PFR1, MTE, 3);       /* FEAT_MTE3 */
+    t = FIELD_DP64(t, ID_AA64PFR1, SME, 1);       /* FEAT_SME */
     t = FIELD_DP64(t, ID_AA64PFR1, CSV2_FRAC, 0); /* FEAT_CSV2_2 */
     cpu->isar.id_aa64pfr1 = t;
 
@@ -1067,6 +1068,16 @@ static void aarch64_max_initfn(Object *obj)
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
 
diff --git a/docs/system/arm/emulation.rst b/docs/system/arm/emulation.rst
index 49cc3e8340..834289cb8e 100644
--- a/docs/system/arm/emulation.rst
+++ b/docs/system/arm/emulation.rst
@@ -63,6 +63,10 @@ the following architecture extensions:
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
-- 
2.34.1


