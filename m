Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDF1698AED
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 04:09:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSUeF-0007VS-Ef; Wed, 15 Feb 2023 22:09:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUeB-0007RF-AQ
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:23 -0500
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pSUe9-0000CQ-7W
 for qemu-devel@nongnu.org; Wed, 15 Feb 2023 22:09:23 -0500
Received: by mail-pj1-x1033.google.com with SMTP id
 n20-20020a17090aab9400b00229ca6a4636so4494293pjq.0
 for <qemu-devel@nongnu.org>; Wed, 15 Feb 2023 19:09:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rrGYft0PYoFjdkgdndGx+3sC+bi057jkIwu9gTCtgvM=;
 b=W6tqc5Al7n+lfcfdM7MHYKXstmkf/Wnm1CIiLCfWNMyIiYzXD0vPpD0CbXRUeDbmzL
 kyhUOJJzsUmWYTmZ0VpHRiq8xsAA6HOdgqCi8gy2rFhyRClqm5ISHYASBM7JHjNKEfFQ
 EFJADJq2dcGoVQV4N5Vks/VpLmfxvh2nEp3cUEZQeCZzk7ZIzCh588VOvFm8aI5Tofpi
 rrMBOVG94ad7tH2uNJZ9NNIMgG1DI+en3ad9IkErsEPMz5GYmc/4mnYH72U4warDo/J7
 4zS/LZBLVoBkAwrathClt8q/ely1qjsRfs02Zm7uKR+uw/AbnnP/xg9iHEKp6r1VjKXx
 Nmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rrGYft0PYoFjdkgdndGx+3sC+bi057jkIwu9gTCtgvM=;
 b=gXyzqyELGYhpgJ6fOInPlZtHzd5NuKF2XE1Sa1rxZR2OoVYnC0KsGwuM8X92cLP8VS
 nGcbg5QhEuNCw+IXVKgJR52rIDXhZY45D4ix9G2Mx6AE+X/CRloMEf+k8ldp8oQjP4Df
 bdCx676psyHf+ik6ia3wdAiDSo23HNp9fcbZI3PQoWqn7oti6758t+nPZCXRSS3PXToO
 y/5bqvqLFGWsVTM7XQV/GTymnYlssv3RfPl8YOZo7MAHl9F27PXJ5ZFpEMdXG3SJLSPb
 Fwlii2orcnlWwokEXqVRUZQS6zl1kk1L8hTXxc34SoPuienY56nJGhY5nz9lxTJhvftM
 zYYw==
X-Gm-Message-State: AO0yUKXAlQh3y+YEIFZ5DNjWqjTdYAvd9wvoYo0Fa0NvGb49u3hNeu+3
 Phebg0NglyfJTdVXV7P/zjSCrzujqNhjxI52t1s=
X-Google-Smtp-Source: AK7set9Mw2NekA0mKDKfmiTM8K1wdj5O8GUnEhrcJA6VtPO7CRQvejKoG8dKRkNzjU3z7EDIiC2JQg==
X-Received: by 2002:a05:6a20:a0a4:b0:bc:6ef3:1e74 with SMTP id
 r36-20020a056a20a0a400b000bc6ef31e74mr3459034pzj.37.1676516959986; 
 Wed, 15 Feb 2023 19:09:19 -0800 (PST)
Received: from stoup.. (rrcs-74-87-59-234.west.biz.rr.com. [74.87.59.234])
 by smtp.gmail.com with ESMTPSA id
 i25-20020aa79099000000b005810a54fdefsm79051pfa.114.2023.02.15.19.09.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Feb 2023 19:09:19 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v1 15/19] target/arm: Add SCTLR.nAA to TBFLAG_A64
Date: Wed, 15 Feb 2023 17:08:50 -1000
Message-Id: <20230216030854.1212208-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216030854.1212208-1-richard.henderson@linaro.org>
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1033;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1033.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h           | 3 ++-
 target/arm/translate.h     | 2 ++
 target/arm/helper.c        | 6 ++++++
 target/arm/translate-a64.c | 1 +
 4 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 2108caf753..b814c52469 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1243,7 +1243,7 @@ void pmu_init(ARMCPU *cpu);
 #define SCTLR_D       (1U << 5) /* up to v5; RAO in v6 */
 #define SCTLR_CP15BEN (1U << 5) /* v7 onward */
 #define SCTLR_L       (1U << 6) /* up to v5; RAO in v6 and v7; RAZ in v8 */
-#define SCTLR_nAA     (1U << 6) /* when v8.4-LSE is implemented */
+#define SCTLR_nAA     (1U << 6) /* when FEAT_LSE2 is implemented */
 #define SCTLR_B       (1U << 7) /* up to v6; RAZ in v7 */
 #define SCTLR_ITD     (1U << 7) /* v8 onward */
 #define SCTLR_S       (1U << 8) /* up to v6; RAZ in v7 */
@@ -3247,6 +3247,7 @@ FIELD(TBFLAG_A64, SVL, 24, 4)
 /* Indicates that SME Streaming mode is active, and SMCR_ELx.FA64 is not. */
 FIELD(TBFLAG_A64, SME_TRAP_NONSTREAMING, 28, 1)
 FIELD(TBFLAG_A64, FGT_ERET, 29, 1)
+FIELD(TBFLAG_A64, NAA, 30, 1)
 
 /*
  * Helpers for using the above.
diff --git a/target/arm/translate.h b/target/arm/translate.h
index 809479f9b7..46a60f8987 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -137,6 +137,8 @@ typedef struct DisasContext {
     bool fgt_eret;
     /* True if fine-grained trap on SVC is enabled */
     bool fgt_svc;
+    /* True if FEAT_LSE2 SCTLR_ELx.nAA is set */
+    bool naa;
     /*
      * >= 0, a copy of PSTATE.BTYPE, which will be 0 without v8.5-BTI.
      *  < 0, set by the current instruction.
diff --git a/target/arm/helper.c b/target/arm/helper.c
index c62ed05c12..d1683155a1 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -12053,6 +12053,12 @@ static CPUARMTBFlags rebuild_hflags_a64(CPUARMState *env, int el, int fp_el,
         }
     }
 
+    if (cpu_isar_feature(aa64_lse2, env_archcpu(env))) {
+        if (sctlr & SCTLR_nAA) {
+            DP_TBFLAG_A64(flags, NAA, 1);
+        }
+    }
+
     /* Compute the condition for using AccType_UNPRIV for LDTR et al. */
     if (!(env->pstate & PSTATE_UAO)) {
         switch (mmu_idx) {
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index caeb91efa5..56c9d63664 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -14813,6 +14813,7 @@ static void aarch64_tr_init_disas_context(DisasContextBase *dcbase,
     dc->pstate_sm = EX_TBFLAG_A64(tb_flags, PSTATE_SM);
     dc->pstate_za = EX_TBFLAG_A64(tb_flags, PSTATE_ZA);
     dc->sme_trap_nonstreaming = EX_TBFLAG_A64(tb_flags, SME_TRAP_NONSTREAMING);
+    dc->naa = EX_TBFLAG_A64(tb_flags, NAA);
     dc->vec_len = 0;
     dc->vec_stride = 0;
     dc->cp_regs = arm_cpu->cp_regs;
-- 
2.34.1


