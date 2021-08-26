Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E15FB3F8CD4
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:19:37 +0200 (CEST)
Received: from localhost ([::1]:33208 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJJ2O-0005Wf-Vz
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45334)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn9-0006Js-My
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:53 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:42722)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJIn3-0000Ct-Sk
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:51 -0400
Received: by mail-wr1-x42c.google.com with SMTP id q11so6137482wrr.9
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X8kvI1tXhBduKhpPX7T3tR8UDJI3V14LEubP46mHPig=;
 b=urqQcifb43IbdUGc/ce//ROfrLDVhhjIGkFbfe3xA7VX/3GGsImhwiIl8LlUOVvZYu
 gK5t7Rg3+eNBaPY81DhFeEbjl/EsFZwpZrwynuamnKZbNPF2CKEW8uc5lg28AxItGusB
 Wx0HWcy+u81y2LckTSNjvVy9PW07IENmEWI/cSw2U7h4i9f5lcCSXoruK/oDnw+T3RM/
 nfkWZmZLStR8qdH/9vpWPV3dJMQUQmHEzU4LlPVSNUUfiiZoyd1k8eUpviJXN8rdWvP7
 EeYujR5SGANoPS423axcC6WvPMuVBINIFAAT9BvryOGjqeMH14aOlv5nyieqSC8cqstN
 c67g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X8kvI1tXhBduKhpPX7T3tR8UDJI3V14LEubP46mHPig=;
 b=KmXsIMvbrNW1pvyjfwyZ4IMWVI/e9B4QHHd0k/5RIx7GHP6jRl8w+NjIs44uiQQ/JS
 mG4r/vuKT4yU4oNt9Nb+Zrh0M1EcGOSsxTsrIT63EssBtp3XS6nNKMNn6RMd+yTwcoQV
 FF0iHt1HnWMHONLnruh+L9f1xWhstwy+ZqRDJ8YcXiAjv6nRh9blQKM8ywO0yw9/h5tM
 YzmGOSEABU25/DKD52dkzo85Acj5LVedvEXJA2YyB+pMi4XbM0H8galoOrSEHzJrfMg0
 OtDunJg1KcOqoZg38Tc/7ECGkIv3i2zSenCVOeXMfa/ka/QqaCQIG9jDMryhCxp4WKQW
 JbDg==
X-Gm-Message-State: AOAM530f3EkVAhoq0a3d5Pg/rGk7/P/Jd0wELMTGfsHF9NbCogqbgl8a
 dTaODfGztgF1nv9IKo+Z+fHQ9ktIVK4NPQ==
X-Google-Smtp-Source: ABdhPJzgWzvb22G30al7mfi9jUN2+DWCQ8El9xNLATPUmrluiXyeOZDJn9jRQKbMh4Owcv4XIhTYlw==
X-Received: by 2002:adf:e702:: with SMTP id c2mr5127699wrm.397.1629997424529; 
 Thu, 26 Aug 2021 10:03:44 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:44 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/37] target/arm: Implement HSTR.TJDBX
Date: Thu, 26 Aug 2021 18:03:04 +0100
Message-Id: <20210826170307.27733-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

In v7A, the HSTR register has a TJDBX bit which traps NS EL0/EL1
access to the JOSCR and JMCR trivial Jazelle registers, and also BXJ.
Implement these traps. In v8A this HSTR bit doesn't exist, so don't
trap for v8A CPUs.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20210816180305.20137-3-peter.maydell@linaro.org
---
 target/arm/cpu.h       |  1 +
 target/arm/helper.h    |  2 ++
 target/arm/syndrome.h  |  7 +++++++
 target/arm/helper.c    | 17 +++++++++++++++++
 target/arm/op_helper.c | 16 ++++++++++++++++
 target/arm/translate.c | 12 ++++++++++++
 6 files changed, 55 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 0cd3206041e..09760333ccd 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1542,6 +1542,7 @@ static inline void xpsr_write(CPUARMState *env, uint32_t val, uint32_t mask)
 #define SCR_ATA               (1U << 26)
 
 #define HSTR_TTEE (1 << 16)
+#define HSTR_TJDBX (1 << 17)
 
 /* Return the current FPSCR value.  */
 uint32_t vfp_get_fpscr(CPUARMState *env);
diff --git a/target/arm/helper.h b/target/arm/helper.h
index aee8f0019b4..448a86edfdc 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -73,6 +73,8 @@ DEF_HELPER_2(v7m_vlldm, void, env, i32)
 
 DEF_HELPER_2(v8m_stackcheck, void, env, i32)
 
+DEF_HELPER_FLAGS_2(check_bxj_trap, TCG_CALL_NO_WG, void, env, i32)
+
 DEF_HELPER_4(access_check_cp_reg, void, env, ptr, i32, i32)
 DEF_HELPER_3(set_cp_reg, void, env, ptr, i32)
 DEF_HELPER_2(get_cp_reg, i32, env, ptr)
diff --git a/target/arm/syndrome.h b/target/arm/syndrome.h
index 39a31260f2d..8dd88a0cb17 100644
--- a/target/arm/syndrome.h
+++ b/target/arm/syndrome.h
@@ -36,6 +36,7 @@ enum arm_exception_class {
     EC_ADVSIMDFPACCESSTRAP    = 0x07,
     EC_FPIDTRAP               = 0x08,
     EC_PACTRAP                = 0x09,
+    EC_BXJTRAP                = 0x0a,
     EC_CP14RRTTRAP            = 0x0c,
     EC_BTITRAP                = 0x0d,
     EC_ILLEGALSTATE           = 0x0e,
@@ -215,6 +216,12 @@ static inline uint32_t syn_btitrap(int btype)
     return (EC_BTITRAP << ARM_EL_EC_SHIFT) | btype;
 }
 
+static inline uint32_t syn_bxjtrap(int cv, int cond, int rm)
+{
+    return (EC_BXJTRAP << ARM_EL_EC_SHIFT) | ARM_EL_IL |
+        (cv << 24) | (cond << 20) | rm;
+}
+
 static inline uint32_t syn_insn_abort(int same_el, int ea, int s1ptw, int fsc)
 {
     return (EC_INSNABORT << ARM_EL_EC_SHIFT) | (same_el << ARM_EL_EC_SHIFT)
diff --git a/target/arm/helper.c b/target/arm/helper.c
index 54ac8c54b1f..d2dd4aa0b80 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -7602,6 +7602,21 @@ static CPAccessResult access_jazelle(CPUARMState *env, const ARMCPRegInfo *ri,
     return CP_ACCESS_OK;
 }
 
+static CPAccessResult access_joscr_jmcr(CPUARMState *env,
+                                        const ARMCPRegInfo *ri, bool isread)
+{
+    /*
+     * HSTR.TJDBX traps JOSCR and JMCR accesses, but it exists only
+     * in v7A, not in v8A.
+     */
+    if (!arm_feature(env, ARM_FEATURE_V8) &&
+        arm_current_el(env) < 2 && !arm_is_secure_below_el3(env) &&
+        (env->cp15.hstr_el2 & HSTR_TJDBX)) {
+        return CP_ACCESS_TRAP_EL2;
+    }
+    return CP_ACCESS_OK;
+}
+
 static const ARMCPRegInfo jazelle_regs[] = {
     { .name = "JIDR",
       .cp = 14, .crn = 0, .crm = 0, .opc1 = 7, .opc2 = 0,
@@ -7609,9 +7624,11 @@ static const ARMCPRegInfo jazelle_regs[] = {
       .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "JOSCR",
       .cp = 14, .crn = 1, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .accessfn = access_joscr_jmcr,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     { .name = "JMCR",
       .cp = 14, .crn = 2, .crm = 0, .opc1 = 7, .opc2 = 0,
+      .accessfn = access_joscr_jmcr,
       .access = PL1_RW, .type = ARM_CP_CONST, .resetvalue = 0 },
     REGINFO_SENTINEL
 };
diff --git a/target/arm/op_helper.c b/target/arm/op_helper.c
index e98fd863057..70b42b55fd0 100644
--- a/target/arm/op_helper.c
+++ b/target/arm/op_helper.c
@@ -224,6 +224,22 @@ void HELPER(setend)(CPUARMState *env)
     arm_rebuild_hflags(env);
 }
 
+void HELPER(check_bxj_trap)(CPUARMState *env, uint32_t rm)
+{
+    /*
+     * Only called if in NS EL0 or EL1 for a BXJ for a v7A CPU;
+     * check if HSTR.TJDBX means we need to trap to EL2.
+     */
+    if (env->cp15.hstr_el2 & HSTR_TJDBX) {
+        /*
+         * We know the condition code check passed, so take the IMPDEF
+         * choice to always report CV=1 COND 0xe
+         */
+        uint32_t syn = syn_bxjtrap(1, 0xe, rm);
+        raise_exception_ra(env, EXCP_HYP_TRAP, syn, 2, GETPC());
+    }
+}
+
 #ifndef CONFIG_USER_ONLY
 /* Function checks whether WFx (WFI/WFE) instructions are set up to be trapped.
  * The function returns the target EL (1-3) if the instruction is to be trapped;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index 115aa768b6a..24b7f49d767 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -6440,6 +6440,18 @@ static bool trans_BXJ(DisasContext *s, arg_BXJ *a)
     if (!ENABLE_ARCH_5J || arm_dc_feature(s, ARM_FEATURE_M)) {
         return false;
     }
+    /*
+     * v7A allows BXJ to be trapped via HSTR.TJDBX. We don't waste a
+     * TBFLAGS bit on a basically-never-happens case, so call a helper
+     * function to check for the trap and raise the exception if needed
+     * (passing it the register number for the syndrome value).
+     * v8A doesn't have this HSTR bit.
+     */
+    if (!arm_dc_feature(s, ARM_FEATURE_V8) &&
+        arm_dc_feature(s, ARM_FEATURE_EL2) &&
+        s->current_el < 2 && s->ns) {
+        gen_helper_check_bxj_trap(cpu_env, tcg_constant_i32(a->rm));
+    }
     /* Trivial implementation equivalent to bx.  */
     gen_bx(s, load_reg(s, a->rm));
     return true;
-- 
2.20.1


