Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88151546A83
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Jun 2022 18:35:47 +0200 (CEST)
Received: from localhost ([::1]:56352 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nzhbu-00008a-Ko
	for lists+qemu-devel@lfdr.de; Fri, 10 Jun 2022 12:35:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37380)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhB0-0007fK-Qr
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:59 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzhAy-0007GR-6T
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 12:07:58 -0400
Received: by mail-wr1-x42b.google.com with SMTP id q15so29093511wrc.11
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 09:07:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0oScPFEaQR9vt1vNhOOVEHubvg87l9aIRvm/ApbcDyg=;
 b=F9r43uo/SfrWzTnPiMb7wD7FYcviLVbszjJsbnVFid1VgVW9xImQhL6/z3S49x5EH2
 j6rIIsE+dH+zu9VU2SdbcV9enV9j9q8JaA5p2DK+2PKtW1JxPLA1cRHWj2GyAp6eIE0s
 rg8EaZUU28Md0rTRdaMF8d//Xy8+914nvlAMJPIXqnavBJinfZrL9YpKv0NxqtSLniD1
 pQae6GBJmLPqmyv93+F9yA3SRKkkrqknAmiL0/luX+MrYD5O8ndBBeWKtBDIzVoujhh2
 HOOEfztbtMhM0UBvbq2hynA95EUJVPEgvwjRhndi0ZnfkjFG38M82z39mjvgCHTnfdLt
 KmHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0oScPFEaQR9vt1vNhOOVEHubvg87l9aIRvm/ApbcDyg=;
 b=zxbDhoZfiXxM+fHjNHp+nPr9CLYeXycus3i9ZvxuVLfpE3QEGq/ldi9IrwPx9pAhLD
 yICBtriHJuiMrbOK1dfP0xGa6fI6Ohca7YoLtSThd71vDk2yajIsDahXNPqqNKq0XHl1
 hTdGYZjAgvS6nsf8atXca8ttNG33qxuGcgjbmTh0hmV3agCIdf3jei9V5LoM0plompAt
 b1wrG/aSjex9oF1l74yfHO6BG4Pc4VuQKDpAo3Kb/ZfNS0hrVcE5B+KFnu8GJ9zyLjOz
 sT8cOA7ew0QFSJ8eZKPeKYXEh7tPbX2iYHFjTHghciE+9/q2S5ZUtYjIMc1SRSGYwsge
 6i4w==
X-Gm-Message-State: AOAM531ojJQJmwWUx2vAEueGDaf9fGR11UBtbM/DrJ3ikiCQH6BHg6sQ
 NJ61xciM0TEhDVkTWZCuc14RGm0yY1BNAQ==
X-Google-Smtp-Source: ABdhPJz/Sh4vCrFncVmIl4lO9Nk7KnfAb3v27V7Z027aNz8eZNFxfrIf58u97OV24m31JXLCD1by/Q==
X-Received: by 2002:adf:ef01:0:b0:20a:8068:ca5e with SMTP id
 e1-20020adfef01000000b0020a8068ca5emr44088869wro.661.1654877273561; 
 Fri, 10 Jun 2022 09:07:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 bp11-20020a5d5a8b000000b0020c5253d926sm14276053wrb.114.2022.06.10.09.07.52
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jun 2022 09:07:53 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 14/28] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
Date: Fri, 10 Jun 2022 17:07:24 +0100
Message-Id: <20220610160738.2230762-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220610160738.2230762-1-peter.maydell@linaro.org>
References: <20220610160738.2230762-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

We no longer need this value during translation,
as it is now handled within the helpers.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220609202901.1177572-15-richard.henderson@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h           |  6 ++----
 target/arm/translate.h     |  2 --
 target/arm/helper.c        | 12 ++----------
 target/arm/translate-a64.c |  1 -
 target/arm/translate.c     |  1 -
 5 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 50b5a9c9fd0..719613ad9ee 100644
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
index 890e73194c3..8685f55e800 100644
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
index ac9942d750d..2b2c1998fd1 100644
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
index 0581118f566..4f6181a5483 100644
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
index c7d422b5415..b8a8972bac9 100644
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
2.25.1


