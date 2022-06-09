Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 820C054560F
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Jun 2022 22:58:36 +0200 (CEST)
Received: from localhost ([::1]:48060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzPEh-00010e-8v
	for lists+qemu-devel@lfdr.de; Thu, 09 Jun 2022 16:58:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmP-00043u-LU
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:21 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434]:38494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nzOmK-0008VG-K2
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 16:29:21 -0400
Received: by mail-pf1-x434.google.com with SMTP id e11so22035763pfj.5
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 13:29:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X4QBEGoTbGLTN/ILF22bIhYsyh/MJrjgKuORCxmlFdc=;
 b=WpcdIk92897aqlL+QJ8D4HvktLBSHenC7sw/M+jy8ce+Kro0tWHBy6qwiLeMCQ71me
 ExaL7Z2kJLca8PSiAqc4D4UXJcyFNoVSyu2UgZLQK+Z5YHGoVr2xXj9IuC5PJwEvpVWs
 pjas3C0Sqa/G8EBW2fmTQblQOY9Zec+HaFtBlaWVvr2nPq7+cEaQNDYoK04TRWCJ5X9R
 BmpUbNSV8rrmS4ly9bGTbWj/Qj3ON4CV3HIDDeXGqrLMzy2Y3twMg+nYIqnsQh+TcEN5
 fza9cs8G35FLjrwixqyFUCb8pJaos+DRA3xrX9bL8V/34I0UUGLS/BOIMf6E4Z0RxqWj
 rIvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X4QBEGoTbGLTN/ILF22bIhYsyh/MJrjgKuORCxmlFdc=;
 b=cxmra3N7aq9jPQIQXq0Ap2YIsLZ+189prudI6fYE522lNb5wrMxebaiNwlGZAwVCqC
 FfwxBf8jqKL76F3xlwM5r7x79CweK13LPELhXeqew3oBAp47DZIoyJXgJwt5QyS3wrCI
 s2wkxoLJan4qK21euSOdB8R80fh22FMk/ChyITvAEkvACoigkwdf/l8kJtOcijGURopH
 LhSVjpTuTTubxwsArYp1Gar80/X1YoFkNtiR4VuipSC1sk6zR+lJQeIUVAg7tCHQAEv1
 QkG1IGhi4mtKEI5AfT/14Uw3I0+nkKkwAYALs7pqEd6036Z7xicRAGO0yR6wVV4npW0g
 KBDA==
X-Gm-Message-State: AOAM533SyJLtv5G4A0WLTjIksmD0dhupPZCDwh4UONNOPMj0gR1rBpqR
 MeeAZJrid7Ka0kYOr7ptnkkJrLy4S6sqSQ==
X-Google-Smtp-Source: ABdhPJwaaNiuLbXDaYZHBvY2XpH+4bbW9PwJOdm575R/YdabdqwBEe+aGuXliYoJDfSMucbeG0m3Nw==
X-Received: by 2002:a63:8449:0:b0:3fc:85a5:5b69 with SMTP id
 k70-20020a638449000000b003fc85a55b69mr35876418pgd.261.1654806555201; 
 Thu, 09 Jun 2022 13:29:15 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:839f:476f:678:38a])
 by smtp.gmail.com with ESMTPSA id
 r20-20020a635d14000000b003fded88238esm7528139pgb.36.2022.06.09.13.29.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 13:29:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 14/23] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
Date: Thu,  9 Jun 2022 13:28:52 -0700
Message-Id: <20220609202901.1177572-15-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220609202901.1177572-1-richard.henderson@linaro.org>
References: <20220609202901.1177572-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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

We no longer need this value during translation,
as it is now handled within the helpers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  6 ++----
 target/arm/translate.h     |  2 --
 target/arm/helper.c        | 12 ++----------
 target/arm/translate-a64.c |  1 -
 target/arm/translate.c     |  1 -
 5 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 50b5a9c9fd..719613ad9e 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3104,11 +3104,9 @@ FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
 FIELD(TBFLAG_ANY, MMUIDX, 4, 4)
 /* Target EL if we take a floating-point-disabled exception */
 FIELD(TBFLAG_ANY, FPEXC_EL, 8, 2)
-/* For A-profile only, target EL for debug exceptions.  */
-FIELD(TBFLAG_ANY, DEBUG_TARGET_EL, 10, 2)
 /* Memory operations require alignment: SCTLR_ELx.A or CCR.UNALIGN_TRP */
-FIELD(TBFLAG_ANY, ALIGN_MEM, 12, 1)
-FIELD(TBFLAG_ANY, PSTATE__IL, 13, 1)
+FIELD(TBFLAG_ANY, ALIGN_MEM, 10, 1)
+FIELD(TBFLAG_ANY, PSTATE__IL, 11, 1)
 
 /*
  * Bit usage when in AArch32 state, both A- and M-profile.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 890e73194c..8685f55e80 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -59,8 +59,6 @@ typedef struct DisasContext {
      */
     uint32_t svc_imm;
     int current_el;
-    /* Debug target exception level for single-step exceptions */
-    int debug_target_el;
     GHashTable *cp_regs;
     uint64_t features; /* CPU features bits */
     bool aarch64;
diff --git a/target/arm/helper.c b/target/arm/helper.c
index ac9942d750..2b2c1998fd 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -11102,18 +11102,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
     return rebuild_hflags_common_32(env, fp_el, mmu_idx, flags);
 }
 
-static CPUARMTBFlags rebuild_hflags_aprofile(CPUARMState *env)
-{
-    CPUARMTBFlags flags = {};
-
-    DP_TBFLAG_ANY(flags, DEBUG_TARGET_EL, arm_debug_target_el(env));
-    return flags;
-}
-
 static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = {};
     int el = arm_current_el(env);
 
     if (arm_sctlr(env, el) & SCTLR_A) {
@@ -11139,7 +11131,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint64_t sctlr;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 0581118f56..4f6181a548 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14645,7 +14645,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->ss_active = EX_TBFLAG_ANY(tb_flags, SS_ACTIVE);
     dc->pstate_ss = EX_TBFLAG_ANY(tb_flags, PSTATE__SS);
     dc->is_ldex = false;
-    dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
 
     /* Bound the number of insns to execute to those left on the page.  */
     bound = -(dc->base.pc_first | TARGET_PAGE_MASK) / 4;
diff --git a/target/arm/translate.c b/target/arm/translate.c
index c7d422b541..b8a8972bac 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9350,7 +9350,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
         dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED);
     } else {
-        dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
         dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
         dc->hstr_active = EX_TBFLAG_A32(tb_flags, HSTR_ACTIVE);
         dc->ns = EX_TBFLAG_A32(tb_flags, NS);
-- 
2.34.1


