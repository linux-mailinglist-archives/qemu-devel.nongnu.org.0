Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F223E4675
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Aug 2021 15:23:31 +0200 (CEST)
Received: from localhost ([::1]:47624 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mD5FQ-0007Mt-V4
	for lists+qemu-devel@lfdr.de; Mon, 09 Aug 2021 09:23:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46948)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD54A-0003F0-5U; Mon, 09 Aug 2021 09:11:42 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:39591)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mD548-0001bL-J6; Mon, 09 Aug 2021 09:11:41 -0400
Received: by mail-qk1-x72d.google.com with SMTP id y130so5565085qkb.6;
 Mon, 09 Aug 2021 06:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=m8FpVNqpdajEAvVURtUo/K13IcgV+jHROgLtQDU1iOg=;
 b=Q6rP7VkyW5veRpHwNdTjslHTvbh2whPySfv+bJT8rXC0D5J5tNleW7LC6Klu9GtXaV
 lwghiR1jU2JZXy47rSM9MWuwRNz/iwXVXfat8Wg8JlIoyhiSkyUGUrwByXfb3ie1Vex1
 CrblddVhkSXYpEt1kGCPXR9QNxYGp0Fs1WhEoMxuao0pDywRGJasgGqu3zRXLehW7ZIC
 thuY1KCOokLPRl3S0qd4mXQATXnarQkhrGdGCjBRxSwTJbGiov/4hU+4wR6e8pyV9YE7
 NIZwMIvJUfzAUTI6Dl6xKiHpuhPw28cDQdnzU+p+TWFTXILGm6xf3CdwoN/37OGec828
 qqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m8FpVNqpdajEAvVURtUo/K13IcgV+jHROgLtQDU1iOg=;
 b=CsziBLU/sezAKknM2DJrka8fySBJgqrC+gS6swdTavgwJ2ps7I6w8ce6fDppgbl+Os
 n/m3kj6WduWDdOf/SHowyIYcEuQMGpSDjFvyDt4g+pyhFlmZfuP/E0AkfTlL/BbNLxD+
 hACyJA31ASkUydfcOZ3Rt0Hj4fRGpcyjxJe1MZ9qiwUQ3X5TPu3vzDyCUf9uahaSEH78
 N+aXv1292im30405kePXO7lAPTBeACwMGToVelZgDoBfR1g1OL7CJA+RXrXJexn2Q4IM
 rGJ1j++gKcIbtsW1R/pty3PjTA47jtq2eL4CRkzJx2uLihYEF8MpwVVNUaA5+sfhkgcH
 7fdg==
X-Gm-Message-State: AOAM530sOal9GAfua7+7ChEvrhIcuRcG1KPYSij11EngCKGazovrN17T
 vutAr69bAQpQ2qhKJXS79Zg52DZac5YYfg==
X-Google-Smtp-Source: ABdhPJyCnSA21pN+1kdP8F+ONWgwQaZOyQTVReVkqlj+FpPxgrMtt+CP0/JCRaP9indLvTzeUEhm5Q==
X-Received: by 2002:ae9:f504:: with SMTP id o4mr23443699qkg.17.1628514699288; 
 Mon, 09 Aug 2021 06:11:39 -0700 (PDT)
Received: from rekt.ibmuc.com ([191.19.172.190])
 by smtp.gmail.com with ESMTPSA id f3sm6757435qti.65.2021.08.09.06.11.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Aug 2021 06:11:39 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 13/19] target/ppc/translate: PMU: handle setting of PMCs while
 running
Date: Mon,  9 Aug 2021 10:10:51 -0300
Message-Id: <20210809131057.1694145-14-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210809131057.1694145-1-danielhb413@gmail.com>
References: <20210809131057.1694145-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x72d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
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
Cc: gustavo.romero@linaro.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
 groug@kaod.org, qemu-ppc@nongnu.org, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initial PMU support were made under the assumption that the counters
would be set before running the PMU and read after either freezing the
PMU manually or via a performance monitor alert.

Turns out that some EBB powerpc kernel tests set the counters after
unfreezing the counters. Setting a PMC value when the PMU is running
means that, at that moment, the baseline for calculating the events (set
in env->pmu_base_icount) needs to be updated. Updating this baseline
means that we need to update all the PMCs with their actual value at
that moment. Any existing counter negative timer needs to be discarded
an a new one, with the updated values, must be set again.

This patch does that via a new 'helper_store_pmc()' that is called in
the mtspr() callbacks of the PMU registers, spr_write_pmu_ureg() and
spr_write_pmu_generic() in target/ppc/translate.c

With this change, EBB powerpc kernel tests such as  'no_handler_test'
are now passing.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/helper.h            |  1 +
 target/ppc/pmu_book3s_helper.c | 36 ++++++++++++++++++++++++++++++++--
 target/ppc/translate.c         | 27 +++++++++++++++++++++++++
 3 files changed, 62 insertions(+), 2 deletions(-)

diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5122632784..757665b360 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/pmu_book3s_helper.c b/target/ppc/pmu_book3s_helper.c
index 58ae65e22b..e7af273cb6 100644
--- a/target/ppc/pmu_book3s_helper.c
+++ b/target/ppc/pmu_book3s_helper.c
@@ -173,7 +173,7 @@ void cpu_ppc_pmu_timer_init(CPUPPCState *env)
     env->pmu_intr_timer = timer;
 }
 
-static bool mmcr0_counter_neg_cond_enabled(uint64_t mmcr0)
+static bool counter_negative_cond_enabled(uint64_t mmcr0)
 {
     return mmcr0 & MMCR0_PMC1CE;
 }
@@ -219,9 +219,41 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
              * Start performance monitor alert timer for counter negative
              * events, if needed.
              */
-            if (mmcr0_counter_neg_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
+            if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
                 set_PMU_excp_timer(env);
             }
         }
     }
 }
+
+void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
+{
+    bool pmu_frozen = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
+    uint64_t curr_icount, icount_delta;
+
+    if (pmu_frozen) {
+        env->spr[sprn] = value;
+        return;
+    }
+
+    curr_icount = (uint64_t)icount_get_raw();
+    icount_delta = curr_icount - env->pmu_base_icount;
+
+    /* Update the counter with the events counted so far */
+    update_PMCs(env, icount_delta);
+
+    /* Set the counter to the desirable value after update_PMCs() */
+    env->spr[sprn] = value;
+
+    /*
+     * Delete the current timer and restart a new one with the
+     * updated values.
+     */
+    timer_del(env->pmu_intr_timer);
+
+    env->pmu_base_icount = curr_icount;
+
+    if (counter_negative_cond_enabled(env->spr[SPR_POWER_MMCR0])) {
+        set_PMU_excp_timer(env);
+    }
+}
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index afc254a03f..3e890cc4d8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -409,11 +409,25 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn)
 
 void spr_write_pmu_generic(DisasContext *ctx, int sprn, int gprn)
 {
+    TCGv_i32 t_sprn;
+
     switch (sprn) {
     case SPR_POWER_MMCR0:
         gen_icount_io_start(ctx);
         gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
         break;
+    case SPR_POWER_PMC1:
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+    case SPR_POWER_PMC5:
+    case SPR_POWER_PMC6:
+        gen_icount_io_start(ctx);
+
+        t_sprn = tcg_const_i32(sprn);
+        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+        tcg_temp_free_i32(t_sprn);
+        break;
     default:
         spr_write_generic(ctx, sprn, gprn);
     }
@@ -585,6 +599,7 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     TCGv t0, t1;
+    TCGv_i32 t_sprn;
     int effective_sprn = sprn + 0x10;
 
     if (((ctx->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) == 0) {
@@ -616,6 +631,18 @@ void spr_write_pmu_ureg(DisasContext *ctx, int sprn, int gprn)
         tcg_temp_free(t0);
         tcg_temp_free(t1);
         break;
+    case SPR_POWER_PMC1:
+    case SPR_POWER_PMC2:
+    case SPR_POWER_PMC3:
+    case SPR_POWER_PMC4:
+    case SPR_POWER_PMC5:
+    case SPR_POWER_PMC6:
+        gen_icount_io_start(ctx);
+
+        t_sprn = tcg_const_i32(effective_sprn);
+        gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+        tcg_temp_free_i32(t_sprn);
+        break;
     default:
         gen_store_spr(effective_sprn, cpu_gpr[gprn]);
         break;
-- 
2.31.1


