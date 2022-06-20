Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F273552372
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jun 2022 20:02:58 +0200 (CEST)
Received: from localhost ([::1]:38994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o3Ljl-00061o-51
	for lists+qemu-devel@lfdr.de; Mon, 20 Jun 2022 14:02:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZt-0005aZ-RS
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:45 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:44650)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o3LZr-0001M7-27
 for qemu-devel@nongnu.org; Mon, 20 Jun 2022 13:52:45 -0400
Received: by mail-pg1-x534.google.com with SMTP id a14so1282696pgh.11
 for <qemu-devel@nongnu.org>; Mon, 20 Jun 2022 10:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OZpiX7LtYWl5urPMXRvMPogY6FpHDH7uieDT8X+wM0g=;
 b=lyS9bEfs/KFTbXGWofRu6KoP7tqbOIpCvJ4ClsMshs78OyVyFKzilzf10KGhyfK2+b
 nl4iYxqEJaTJgEND6SZ9YLlDUQS1g72ePk6/BsesxM07aj8JHpG+DpvkBE451hW4q59c
 wL1DMTPGY+naQqi8F68KOG9u+HVckanQBaB1EoyLMlEC+gjQIxU0kj96wo2TzVdKl5gN
 4XDDIBvZx3CT/Xmuqtjg2Tt7P8i8XmYoGByh7y3IMNhn7DU0XwoBnACN7SGgnpkauP6k
 z7Tu3F6P77qkeHjSAQwuTgPdweZ3JglCZ703+1hpGU2nG5BtU4sWmsk+M2gWECoBklLl
 lXZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OZpiX7LtYWl5urPMXRvMPogY6FpHDH7uieDT8X+wM0g=;
 b=GMYTKiDiB2VNu9oPv1dWxIas0yd6RgiAlI4LCPgk1Rfs3t+EQiexO8MaS5nC/L9eeb
 YOax83Bj6ANi1x9tYZX4X6Jj7p+pdGJUI1JGDSoDEJ1+mbVsDCzJq2ydhU9ssQwoaeI6
 ONZ7AcinJ9BMQW1a/L4U+QK0L21TXgB6Ykp6aWXY3B0NiYgHjn3AfPQP55D+1s0h+aZm
 8CBw7XETs4mFgYVLzmHiKzXM974SgmPmGfh0W+dmSrEIh5sjFXLdDqXUmGTOipiKu1I/
 RJYJMBPJ/XZetn/JvlYLXFWxqEBQL67Po7skEq09gGb0eAQosV8hjU+tJe0xGk57cMaf
 vjtQ==
X-Gm-Message-State: AJIora/DmvfrQzG0Ked5Va+Pl6/KAF9VGvZRJdyVrMwRTjNA4h+QHALk
 4Er5jVzY/nmeOrDgmJHb8vMHv64LpNDD1Q==
X-Google-Smtp-Source: AGRyM1tz8a2ceSWO/tom5njRTeJrm8lON0RCjUyvoSrkdJgDBEOWaIu7mV/JIdyv5Rx9H2BYm6xyBA==
X-Received: by 2002:a05:6a00:1496:b0:525:33c5:9c1e with SMTP id
 v22-20020a056a00149600b0052533c59c1emr650276pfu.31.1655747561689; 
 Mon, 20 Jun 2022 10:52:41 -0700 (PDT)
Received: from stoup.. ([2602:47:d49e:3c01:a3e0:8a80:7b85:aea6])
 by smtp.gmail.com with ESMTPSA id
 j14-20020aa7928e000000b00525133f98adsm5138138pfa.146.2022.06.20.10.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jun 2022 10:52:41 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 06/51] target/arm: Add SMCR_ELx
Date: Mon, 20 Jun 2022 10:51:50 -0700
Message-Id: <20220620175235.60881-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220620175235.60881-1-richard.henderson@linaro.org>
References: <20220620175235.60881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
index bb8cb959d1..dec52c6c3b 100644
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
index 3acc1dc378..2072f2a550 100644
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
2.34.1


