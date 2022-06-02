Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0AD2553C0C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Jun 2022 00:24:56 +0200 (CEST)
Received: from localhost ([::1]:43568 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nwtFP-0003BY-1E
	for lists+qemu-devel@lfdr.de; Thu, 02 Jun 2022 18:24:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37552)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsh9-000584-M0
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:31 -0400
Received: from mail-pg1-x530.google.com ([2607:f8b0:4864:20::530]:41489)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgw-00007w-A9
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:31 -0400
Received: by mail-pg1-x530.google.com with SMTP id e66so5779812pgc.8
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jxcguvnsju5QCxGIYXvo3WToRmgWIw+so5bs8Lrowps=;
 b=lwPV3v2dyW7D8viKYg8e4ChKZoCs9REUmOpvuc/h0WavZ9CJOqPMjWlbrR4A2WlGAo
 w71Urz5GyOwzvkRR66PycDqYjE2JAdIc6A9fYnHNSYyEdLbLtMFJmmtnnfknCmzIpIOj
 fiWs34M9Z7tVYrQxuvtps9Q/OiM0C5o82cH0wTZEmmYNuJW+T5a5XU1MsGemAmebeCWv
 asQsQgMzOM3KofYey+KpbvGVLqZYIlbXmWFWxIs4ENDm/igvjQYDX4h8YpF+kz0n4kdN
 +VGFyKa1rNRkHa1aQPUr84JYvitIqMCOeZuafIvYpzK51BMpOQHChkUNxmbziDz5wvqP
 VrAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jxcguvnsju5QCxGIYXvo3WToRmgWIw+so5bs8Lrowps=;
 b=SJJ9NZKZOPM3xharybcYbcB/e63OHe3Y9ECR49aZzkdKByBafpXcEPQejH8XuOgWSQ
 5UbFwTx8PWM3UC9BPGqbXWKr6pmF2IfVPLWbEBTXtlKpwzjaXW9YlJ0tGMsnUHrmQkXu
 0ji+hljm31JJxNwtAqm5YgPb5G8LKbnwpkucWuF9f8G+d1l/5+Ic7g/JbrmcMt3N5S7T
 Fw+n8Nrsgmu91P+yjjsKF27n8N7UWhVC/qhABCj3Etk7eNBZ/sKH6lEnHRN1+XphT7AN
 7n/bCXGdGYKNOgUQEHm2uJLj4DZpd0nmBHGSDXc0Du7vhHKgCZnEeSFcNAfM87ZT/0iU
 YNwQ==
X-Gm-Message-State: AOAM533ZLQDdf21XCrGSWZo+xSmwCMRohnbCT87dEjovevxpmBmUXTjq
 +fpQ84BRs4SCxgKRHE8EnJcJQhwdUTR3mw==
X-Google-Smtp-Source: ABdhPJx8VPgKPfigfMJ66HlPvbQommXRDkCVXyJKMXrKEDErm04c70LYKF8tZDLbFE7uKT1tpuv4lg==
X-Received: by 2002:a62:d10e:0:b0:51b:d711:b189 with SMTP id
 z14-20020a62d10e000000b0051bd711b189mr2908885pfg.40.1654206557103; 
 Thu, 02 Jun 2022 14:49:17 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:16 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 26/71] target/arm: Add SMCR_ELx
Date: Thu,  2 Jun 2022 14:48:08 -0700
Message-Id: <20220602214853.496211-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::530;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x530.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

These cpregs control the streaming vector length and whether the
full a64 instruction set is allowed while in streaming mode.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  8 ++++++--
 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 31b764556c..1ae1b7122b 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -669,8 +669,8 @@ typedef struct CPUArchState {
         float_status standard_fp_status;
         float_status standard_fp_status_f16;
 
-        /* ZCR_EL[1-3] */
-        uint64_t zcr_el[4];
+        uint64_t zcr_el[4];   /* ZCR_EL[1-3] */
+        uint64_t smcr_el[4];  /* SMCR_EL[1-3] */
     } vfp;
     uint64_t exclusive_addr;
     uint64_t exclusive_val;
@@ -1434,6 +1434,10 @@ FIELD(CPTR_EL3, TCPAC, 31, 1)
 FIELD(SVCR, SM, 0, 1)
 FIELD(SVCR, ZA, 1, 1)
 
+/* Fields for SMCR_ELx. */
+FIELD(SMCR, LEN, 0, 4)
+FIELD(SMCR, FA64, 31, 1)
+
 /* Write a new value to v7m.exception, thus transitioning into or out
  * of Handler mode; this may result in a change of active stack pointer.
  */
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 366420385a..4149570b95 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5883,6 +5883,8 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
          */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
+        { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
+          "SMCR_EL1", "SMCR_EL2", "SMCR_EL12", isar_feature_aa64_sme },
 
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
@@ -6361,6 +6363,30 @@ static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
     env->svcr = value;
 }
 
+static void smcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
+                       uint64_t value)
+{
+    int cur_el = arm_current_el(env);
+    int old_len = sve_vqm1_for_el(env, cur_el);
+    int new_len;
+
+    QEMU_BUILD_BUG_ON(ARM_MAX_VQ > R_SMCR_LEN_MASK + 1);
+    value &= R_SMCR_LEN_MASK | R_SMCR_FA64_MASK;
+    raw_write(env, ri, value);
+
+    /*
+     * Note that it is CONSTRAINED UNPREDICTABLE what happens to ZA storage
+     * when SVL is widened (old values kept, or zeros).  Choose to keep the
+     * current values for simplicity.  But for QEMU internals, we must still
+     * apply the narrower SVL to the Zregs and Pregs -- see the comment
+     * above aarch64_sve_narrow_vq.
+     */
+    new_len = sve_vqm1_for_el(env, cur_el);
+    if (new_len < old_len) {
+        aarch64_sve_narrow_vq(env, new_len + 1);
+    }
+}
+
 static const ARMCPRegInfo sme_reginfo[] = {
     { .name = "TPIDR2_EL0", .state = ARM_CP_STATE_AA64,
       .opc0 = 3, .opc1 = 3, .crn = 13, .crm = 0, .opc2 = 5,
@@ -6371,6 +6397,21 @@ static const ARMCPRegInfo sme_reginfo[] = {
       .access = PL0_RW, .type = ARM_CP_SME,
       .fieldoffset = offsetof(CPUARMState, svcr),
       .writefn = svcr_write, .raw_writefn = raw_write },
+    { .name = "SMCR_EL1", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 0, .crn = 1, .crm = 2, .opc2 = 6,
+      .access = PL1_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[1]),
+      .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMCR_EL2", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 4, .crn = 1, .crm = 2, .opc2 = 6,
+      .access = PL2_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[2]),
+      .writefn = smcr_write, .raw_writefn = raw_write },
+    { .name = "SMCR_EL3", .state = ARM_CP_STATE_AA64,
+      .opc0 = 3, .opc1 = 6, .crn = 1, .crm = 2, .opc2 = 6,
+      .access = PL3_RW, .type = ARM_CP_SME,
+      .fieldoffset = offsetof(CPUARMState, vfp.smcr_el[3]),
+      .writefn = smcr_write, .raw_writefn = raw_write },
 };
 #endif /* TARGET_AARCH64 */
 
-- 
2.34.1


