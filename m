Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 155F8531D73
	for <lists+qemu-devel@lfdr.de>; Mon, 23 May 2022 23:13:49 +0200 (CEST)
Received: from localhost ([::1]:46560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ntFN6-0007aT-5C
	for lists+qemu-devel@lfdr.de; Mon, 23 May 2022 17:13:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42542)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEyL-0000ay-Dc
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:13 -0400
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635]:41488)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ntEy9-00052D-CV
 for qemu-devel@nongnu.org; Mon, 23 May 2022 16:48:13 -0400
Received: by mail-pl1-x635.google.com with SMTP id s14so14123662plk.8
 for <qemu-devel@nongnu.org>; Mon, 23 May 2022 13:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXDNe7UAiSjLL81qtpI/xgpK//7QQXPJ6zCsJfDQpFw=;
 b=z3petxkLcmX5NT0SjAkaCua/Q0ApUEU+obVhXuzm0SROUzOqf8yGRYKMyz6de9v9jn
 UUWd650fHNfWFeEBl900PV7jqTTHj9SCGKRN8QKmfnwPvDnbzJtLT+hknA/aMGLVVQZH
 jBC1JlH7d+LdNq88A3o9eTRs07v/FNV4y1IDi0ctjzePQhfq5KCYH8x6NfGWhwu+5s8E
 4CVzcHpLaUN56XsCNhZXHERj2lm/dd6AdcspNq11FNhq2w5NhMbGFY2pa4t1TRfGCo26
 WNbN03CToneEYArKuB4IHY6LANuZGeFRa1d8tPX8nXUxbY0zFFD4101t/bUnf8/uNXYy
 ysSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXDNe7UAiSjLL81qtpI/xgpK//7QQXPJ6zCsJfDQpFw=;
 b=FHJIHb+Q6VSNFO/y9h6hkrmAUAlGB1+MewPMo/5NFeES7MSamQ1mAymMWRsSkH86vs
 5xuWmy8Br/mwwxjvlAOCdjBpiMTFXlh/xUDosPfXOQSO5Q5Lh0+0ZAYlTdKCpSaynwEa
 Lq46WmIIF3n/ulehjCmXizVgoh04cZkhE4oL94dcodUfv4bs2h8iYpDKtt/5kK28MdWz
 joZxMY4s/+GsMqQcii41/7OEMHeWrIGmA5/9J7VjaqrVlwlWBQ/PTc7WDQh9kimd9tG6
 vz0mrMDlRy64Vv4mZxbdWJCK5YvU/RxMtylqRafdCDOJHzzqn+CNn+0ino7ll/peob9L
 ayCQ==
X-Gm-Message-State: AOAM530zIOcXRdUQnV64wAdJnn0ZFdUzbHdq5w0bR0qsugvVaELMZyjx
 Q9Q1gsG+iD5zMCnO44jGzHoXC6A+PtY0oQ==
X-Google-Smtp-Source: ABdhPJzaQLMxff7hwF2njaRzeNduRlXNX/6/JIL+prsMNyzrlEcRyFJ14c7Zl9v58Db5OvvOK7RWpg==
X-Received: by 2002:a17:903:2d0:b0:14d:8a8d:cb1 with SMTP id
 s16-20020a17090302d000b0014d8a8d0cb1mr24329246plk.50.1653338880568; 
 Mon, 23 May 2022 13:48:00 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 c16-20020a624e10000000b0050dc7628142sm7721788pfb.28.2022.05.23.13.47.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 May 2022 13:48:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 16/18] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
Date: Mon, 23 May 2022 13:47:40 -0700
Message-Id: <20220523204742.740932-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220523204742.740932-1-richard.henderson@linaro.org>
References: <20220523204742.740932-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x635.google.com
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9, DKIM_INVALID=0.1,
 DKIM_SIGNED=0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  6 ++----
 target/arm/translate.h     |  2 --
 target/arm/helper.c        | 12 ++----------
 target/arm/translate-a64.c |  1 -
 target/arm/translate.c     |  1 -
 5 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 90cdc7b1de..5bc6382fce 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3064,11 +3064,9 @@ FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
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
index c03dbfb618..cd9ee41bbd 100644
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
index e0be96b988..63c3fee5ff 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13626,18 +13626,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
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
@@ -13663,7 +13655,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint64_t sctlr;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index f502545307..cc9344b015 100644
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
index 87a899d638..59d7542a48 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -9354,7 +9354,6 @@ static void arm_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
         dc->v7m_lspact = EX_TBFLAG_M32(tb_flags, LSPACT);
         dc->mve_no_pred = EX_TBFLAG_M32(tb_flags, MVE_NO_PRED);
     } else {
-        dc->debug_target_el = EX_TBFLAG_ANY(tb_flags, DEBUG_TARGET_EL);
         dc->sctlr_b = EX_TBFLAG_A32(tb_flags, SCTLR__B);
         dc->hstr_active = EX_TBFLAG_A32(tb_flags, HSTR_ACTIVE);
         dc->ns = EX_TBFLAG_A32(tb_flags, NS);
-- 
2.34.1


