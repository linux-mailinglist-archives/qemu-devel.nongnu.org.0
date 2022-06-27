Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F2055B938
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Jun 2022 12:41:40 +0200 (CEST)
Received: from localhost ([::1]:59908 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o5mBX-0001X9-JM
	for lists+qemu-devel@lfdr.de; Mon, 27 Jun 2022 06:41:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltJ-0002JZ-NF
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:50 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a]:44576)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o5ltG-0004sY-Gq
 for qemu-devel@nongnu.org; Mon, 27 Jun 2022 06:22:48 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 be14-20020a05600c1e8e00b003a04a458c54so1319529wmb.3
 for <qemu-devel@nongnu.org>; Mon, 27 Jun 2022 03:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=myu9f+rViX6h8d0L3J1Djnr/C3QVHRwUhjQjh6R87+8=;
 b=k3rpxp0n/bqtAhF5BurilQzMlhca5l6bvUUhErlp6tdLo0T0luco4GIgVPOu7cKgR2
 ++gJE4KnFkh0CqYfbvOzJZZ0QCn5Zl8jAoYUHB818kjVnlej3/igqsYn/1Hl1t050UKI
 DpRHRDBNS7XJCO15VNLWmnQ5/NrjyrlqVx6D0J5DtgTR2uvGf8KoXwgjk6Qd4ICedYnT
 tRIdIR/ofQA3rmZdplh/N6ZbJ4acbdHdWybCVBWCwhG8aikUg/TPzt63PllvmgvHZcca
 S0ZxIsXwPad5NMyrjlsW+Su5H+6SC37YZNs8LlbSAiDZ35oSFJT+uH0PSROpNWFRLEoT
 /oJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=myu9f+rViX6h8d0L3J1Djnr/C3QVHRwUhjQjh6R87+8=;
 b=Y40qmPiTDGwwv4B5VLGdj+ylugISrk7nGYkHwlZf/J/7d8KEq4/Jtzj5YLCdPwSNG4
 hO+NHU57KIVLS8pxW+2jAp7XhflawLn3si+LefxNE6iQt66AqAdAmgzILumac/XjFUJU
 10RQT+d8k+3mEIGcZNBOrge7DgiMBCeYG6IqxEfsjovo0j5qiaxy6S361piIIXGy7r/T
 zRzhFoFggrov09c6czSkGL1e4XU8f4nhxhZzKYGhsV1bFrISBiJZpHuR5MY3emp183H3
 rmxhe8amD7rZHey6ZqdEuoDgFEwCecN08LeuMm2D9+ecAayTpOQX0qFqaho/fUA318at
 12Jw==
X-Gm-Message-State: AJIora8se8y9WqizbhWSqmoz9GgUTeE9m+6z4SJem0AjR0HX8Nf3YR/k
 Yl3xrmy5/5DOpZlSNPRZrbIfeRyS/SKocQ==
X-Google-Smtp-Source: AGRyM1t+/PBSl678kCIL1P8EsQ24QQXlnQMj1dXXtIEov7gR+NdIi4IoQpH2BGRqO330KTCNJJPjLA==
X-Received: by 2002:a05:600c:3ace:b0:3a0:4ea4:5f77 with SMTP id
 d14-20020a05600c3ace00b003a04ea45f77mr155817wms.57.1656325365189; 
 Mon, 27 Jun 2022 03:22:45 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d11-20020a5d6dcb000000b0020e6ce4dabdsm9754335wrz.103.2022.06.27.03.22.44
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 03:22:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 09/25] target/arm: Add SMCR_ELx
Date: Mon, 27 Jun 2022 11:22:20 +0100
Message-Id: <20220627102236.3097629-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220627102236.3097629-1-peter.maydell@linaro.org>
References: <20220627102236.3097629-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

From: Richard Henderson <richard.henderson@linaro.org>

These cpregs control the streaming vector length and whether the
full a64 instruction set is allowed while in streaming mode.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220620175235.60881-7-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h    |  8 ++++++--
 target/arm/helper.c | 41 +++++++++++++++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+), 2 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index bb8cb959d12..dec52c6c3b9 100644
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
index 3acc1dc378a..2072f2a550e 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -5879,6 +5879,8 @@ static void define_arm_vh_e2h_redirects_aliases(ARMCPU *cpu)
          */
         { K(3, 0,  1, 2, 0), K(3, 4,  1, 2, 0), K(3, 5, 1, 2, 0),
           "ZCR_EL1", "ZCR_EL2", "ZCR_EL12", isar_feature_aa64_sve },
+        { K(3, 0,  1, 2, 6), K(3, 4,  1, 2, 6), K(3, 5, 1, 2, 6),
+          "SMCR_EL1", "SMCR_EL2", "SMCR_EL12", isar_feature_aa64_sme },
 
         { K(3, 0,  5, 6, 0), K(3, 4,  5, 6, 0), K(3, 5, 5, 6, 0),
           "TFSR_EL1", "TFSR_EL2", "TFSR_EL12", isar_feature_aa64_mte },
@@ -6357,6 +6359,30 @@ static void svcr_write(CPUARMState *env, const ARMCPRegInfo *ri,
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
@@ -6367,6 +6393,21 @@ static const ARMCPRegInfo sme_reginfo[] = {
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
2.25.1


