Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A2165417BC
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 23:05:48 +0200 (CEST)
Received: from localhost ([::1]:56208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nygOZ-0008Pr-9m
	for lists+qemu-devel@lfdr.de; Tue, 07 Jun 2022 17:05:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34132)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftR-00089B-Oi
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:37 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:46976)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyftM-0007Bp-15
 for qemu-devel@nongnu.org; Tue, 07 Jun 2022 16:33:37 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 k5-20020a17090a404500b001e8875e6242so5675467pjg.5
 for <qemu-devel@nongnu.org>; Tue, 07 Jun 2022 13:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9o/b8H5uwznoVSQFJWAs54gwTyIT2NUPwpnhLmyD5pU=;
 b=ITe3JCHLzVhOr+UyrjeRoG1Tsre/E2JO0xH6C8f470B9+V/OX4e3WIo/3rTYzPWD1g
 Qwa2aOXbLJX+R9EHZh/CkLc7h4KwD9odPVwmrCw1FG7sfHhjS466bZx4h8wiUwtzC8dw
 ME4cU9k/vW9iCY85yOJJTLTFdrQM0RE105CU8s9O9b/EyFNuWdjxckIZN19z/z/+8EMv
 o+cp09LHAVO8dpZVUTzhmXy1LcnjMwIjfhRuGgT3NnoKd72UBwUjevbB7WK63oMPkxSW
 m563E7GO7U/gHi5qCPnJ2/ccJBICBI8g8jlLicYs5eRFdPAn9lNGsG2onkqdBB7lcSDI
 QnWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9o/b8H5uwznoVSQFJWAs54gwTyIT2NUPwpnhLmyD5pU=;
 b=Dzjb1nEeUQvWLo/CJHRB2iAM1YxxrLzdehZx5z8evhLZOtG3kN2ghTewN3KqA5gZce
 CncPp4INn4SzDk7pmWN+TnBYDA7tvARVvNjFnM5gmvYlmP1IUor4BXAU/Wx42ktWolaJ
 Jm3QDK3+xARJQZJac0LQLcNIa5DmSZxrOZ+UQPELzp6O3BZtnt1pf1CwgqYVpKLqaOr2
 8exDd6hGQ7cihF4fXbbzqtX/uIughKJj+nT875PlWhNRRDdpj3Vw6dodInlOHlCBXs+p
 ppRV8mm+BFqSlmSkTiqYPxe1qYqUqNvNTBB0uFEiSk/nnCor6fzaSXa2Rq5+/MrnwKRA
 RnXQ==
X-Gm-Message-State: AOAM5321qJP8diWpoUWLsDEj3F0K10buDsBL2DDiupuqqaeJ4QsFcLGU
 EfJu2VaRp85JiX1wxwez0BivxWiPdht5XA==
X-Google-Smtp-Source: ABdhPJwOwv+DkTOV4tc9Kb/W3ZTRbQNXRfknGlejDay75lyyK8Z3i44GA9KC6ES6TnhJttgTcQBILg==
X-Received: by 2002:a17:902:d504:b0:167:756a:f99d with SMTP id
 b4-20020a170902d50400b00167756af99dmr13702910plg.6.1654634011200; 
 Tue, 07 Jun 2022 13:33:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s22-20020a17090aba1600b001d9780b7779sm4227856pjr.15.2022.06.07.13.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:33:30 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 26/71] target/arm: Add SMCR_ELx
Date: Tue,  7 Jun 2022 13:32:21 -0700
Message-Id: <20220607203306.657998-27-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h    |  8 ++++++--
 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index f1a459af8b..2f43b00843 100644
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
index e2d6d89a5d..46318515a8 100644
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


