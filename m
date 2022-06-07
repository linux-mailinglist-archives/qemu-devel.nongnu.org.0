Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76F9F53F421
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 04:54:37 +0200 (CEST)
Received: from localhost ([::1]:40634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyPMa-0001eC-IG
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 22:54:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33202)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG5-000759-6l
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:53 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:38776)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyPG1-0000M8-R8
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 22:47:52 -0400
Received: by mail-pf1-x42b.google.com with SMTP id e11so14269823pfj.5
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 19:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QmQpF4c3kmNYfBUp2TaNf+q5uPwew90N4u3cCME1guM=;
 b=S75OyDrHT4Ouydsi9/9DRIbIH3mKmfUEFFrJgCseFhXmE7yNKV+7dcwFRF1iY4E4PL
 7X/Y1fZiDLJRtpZpZoU0zgTGDCp2Os8ogyGkKWamru7yh5Hp145Kk/WPcPyFrf3geFvX
 Ce8zB96w9N+uxV1vvNZz2c1H7/XvFzE3aXP+ttNszllnBdtjnKX9XW0Oqqcx8BsCdtjm
 QcwItBVvVEIKyF6Rv6Gx9lurVPXi6Foqaz1bYAsIptqSROCdPjV7thOWQBm9oPmB0cEf
 PpaSrEbvvF46RKVZUsDiqwIvTU+seoFrfITTiQR52UkntMNHw17jzo5Fmieg1uEeFSku
 0v9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmQpF4c3kmNYfBUp2TaNf+q5uPwew90N4u3cCME1guM=;
 b=YROSyD9bbth7GJlmbxHa7XmkLTSI9+/11kiAuod7+kP3Bplj4yTYqUhDFZ7peS/UP8
 WeGFj1yIob/X32CNGK7ivXbXXqfvn6PeuoVCd7SOVd3dgz6qB4DxhYX70xiG6asBc467
 MCKQAreA1vUisAuwzH4YjEHG3keofyzXc0JVQeywzB23bkKAa5X/vVWUe8oL5AMt5/BO
 A2C2c0+DLmvDR8UUVz0V1eJjWI9vFXrREGwh9CajuLQIJkUVZtbglhlphtVIudgbjfV/
 40f1n4McRXWbhU4rP0+uJCFg+e1nRdkb+fcwKbvvea34hmXtneGgS1GlF9XKm1bjjsb4
 +hRQ==
X-Gm-Message-State: AOAM532mwrtIeYTLdlRLRrZBwbreNrHttdy1cwHstsxhk1uQ6P/1w/NM
 BNdKdsavJnggqKj5fkfQ/ctis0+7k2c6TA==
X-Google-Smtp-Source: ABdhPJxqXJFZu2AMz7J49wEmhg1xhbrnBlog/s92iIhYTuU3D8mN+e++qGzGXz6LJSzbK2z1/UdXyg==
X-Received: by 2002:a05:6a00:1485:b0:518:e601:dffb with SMTP id
 v5-20020a056a00148500b00518e601dffbmr27330492pfu.38.1654570068384; 
 Mon, 06 Jun 2022 19:47:48 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:d3db:cca:e5c9:6531])
 by smtp.gmail.com with ESMTPSA id
 y26-20020aa7805a000000b0051876d83714sm7476904pfm.196.2022.06.06.19.47.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 19:47:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v2 15/25] target/arm: Remove TBFLAG_ANY.DEBUG_TARGET_EL
Date: Mon,  6 Jun 2022 19:47:24 -0700
Message-Id: <20220607024734.541321-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607024734.541321-1-richard.henderson@linaro.org>
References: <20220607024734.541321-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           |  6 ++----
 target/arm/translate.h     |  2 --
 target/arm/helper.c        | 12 ++----------
 target/arm/translate-a64.c |  1 -
 target/arm/translate.c     |  1 -
 5 files changed, 4 insertions(+), 18 deletions(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 92c9758e86..5224dc2c85 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -3085,11 +3085,9 @@ FIELD(TBFLAG_ANY, BE_DATA, 3, 1)
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
index c720a7e26c..4a93cac65f 100644
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
index 40da63913c..eeca1a5dc8 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -13630,18 +13630,10 @@ static CPUARMTBFlags rebuild_hflags_m32(CPUARMState *env, int fp_el,
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
@@ -13667,7 +13659,7 @@ static CPUARMTBFlags rebuild_hflags_a32(CPUARMState *env, int fp_el,
 static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
                                         ARMMMUIdx mmu_idx)
 {
-    CPUARMTBFlags flags = rebuild_hflags_aprofile(env);
+    CPUARMTBFlags flags = {};
     ARMMMUIdx stage1 = stage_1_mmu_idx(mmu_idx);
     uint64_t tcr = regime_tcr(env, mmu_idx)->raw_tcr;
     uint64_t sctlr;
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a5c66ce085..b45039a124 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14644,7 +14644,6 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
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


