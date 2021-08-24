Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6422D3F6303
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:47:36 +0200 (CEST)
Received: from localhost ([::1]:55408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZaE-000710-E8
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:47:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKi-0000FY-BL; Tue, 24 Aug 2021 12:31:28 -0400
Received: from mail-qv1-xf35.google.com ([2607:f8b0:4864:20::f35]:41523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZKg-0000E6-8O; Tue, 24 Aug 2021 12:31:28 -0400
Received: by mail-qv1-xf35.google.com with SMTP id f7so12007461qvt.8;
 Tue, 24 Aug 2021 09:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IBYuexLfFzkFUk+1QV4/xLhe6ZXj3hk0Ze40UJe/nbo=;
 b=PMuC9VRg8LaNkFzDE9ATbjU1cAqGLQtTYUWHqQhbGwd37Skfobixwxb+zF3f2n9F94
 aVx/g0F4J8OnCt8N16OSG3zxLLBKpU8A3uzBMPI+ixdk+JlweDCq/IpyDCcIsfma0z4V
 iVA29MrtndukWEcqGKUJDqWA4piw1UMJpZcjRp2mULZjI8A2pfVtrghyHCCcWscveN76
 2tguZe3Hc0vF7qj7m4bGGAMP/fng4V3dS47U5nSKXGiD9aO36OwdsnAHvqklDknv+pKd
 Y0z9wdPMeXn/gy4yO9RWlBeDCbISwX6FljfcfU7zah8SDLhvt//hR2yHummX8EqlBT05
 NfqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IBYuexLfFzkFUk+1QV4/xLhe6ZXj3hk0Ze40UJe/nbo=;
 b=RQLJ45vHnuFza5qddAzUfG5sCR7UAje2iCctiWwKdJoOBOBMdXIUFQpoB+TsryvExN
 Folp9sO8B8AqzwJMa+dOF+I7Z93hXnfcRbThPf8WgsHZkvqaxUaTeB7MmyQe4j+ZG8QL
 qt0185aUswuxN7Hdf+bYWZly21Bus2VOdZIlBUDsRu0ua7ivJENu8R2Mz2FFVxC7ih3n
 AIzd9LTsKD/QJTfPP2BNBu7t12A8cICTMvMhbshnO37qc7KXNu7lIsyB1F6GmWjQHRp3
 Ijh5SDlGz6iiRMRr/ICFuGRg+GTFU1kME++BldCYiLK/NSr+S5sNf0lAl1VyuCq7FoBk
 Ni2g==
X-Gm-Message-State: AOAM5312ynfbVQZPo5688+kLdHmD0jGeiNmzr/voDZl2DRzFB3loulft
 7Ln1ADVNRWBbE3a9ikyh4iVqj7jiaDs=
X-Google-Smtp-Source: ABdhPJzEsclBMiltYLDkcKt7RrQduM1qpODt4EGIbpn/6h4z0lJTUbwnu9uR32b2f6MtfCCkRbh2hQ==
X-Received: by 2002:a05:6214:312:: with SMTP id
 i18mr6995755qvu.48.1629822684865; 
 Tue, 24 Aug 2021 09:31:24 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.31.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:31:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 15/16] target/ppc/translate: PMU: handle setting of PMCs
 while running
Date: Tue, 24 Aug 2021 13:30:31 -0300
Message-Id: <20210824163032.394099-16-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f35;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf35.google.com
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
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The initial PMU support were made under the assumption that the counters
would be set before running the PMU and read after either freezing the
PMU manually or via a performance monitor alert.

Turns out that some EBB powerpc kernel tests set the counters after
unfreezing the counters. Setting a PMC value when the PMU is running
means that, at that moment, the baseline for calculating cycle
events needs to be updated. Updating this baseline means that we need
to update all the PMCs with their actual value at that moment. Any
xisting counter negative timer needs to be discarded an a new one,
with the updated values, must be set again.

This patch does that via a new 'helper_store_pmc()' that is called in
the mtspr() callbacks of PMU counters. With this change, EBB powerpc kernel
tests such as 'no_handler_test' are now passing.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c   | 24 ++++++++++++------------
 target/ppc/helper.h     |  1 +
 target/ppc/power8_pmu.c | 27 +++++++++++++++++++++++++++
 target/ppc/spr_tcg.h    |  2 ++
 target/ppc/translate.c  | 35 +++++++++++++++++++++++++++++++++++
 5 files changed, 77 insertions(+), 12 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 71f052b052..563c457572 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6833,27 +6833,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
                      KVM_REG_PPC_MMCRA, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC_generic,
                      KVM_REG_PPC_PMC1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC_generic,
                      KVM_REG_PPC_PMC2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC_generic,
                      KVM_REG_PPC_PMC3, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC_generic,
                      KVM_REG_PPC_PMC4, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC_generic,
                      KVM_REG_PPC_PMC5, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC_generic,
                      KVM_REG_PPC_PMC6, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -6880,27 +6880,27 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 91a86992a5..52cb62b9e1 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -23,6 +23,7 @@ DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(insns_inc, void, env, i32)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8_pmu.c b/target/ppc/power8_pmu.c
index 28db086225..d235cc2b53 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -116,6 +116,14 @@ static void update_cycles_PMCs(CPUPPCState *env)
     if (PMC6_running) {
         update_PMC_PM_CYC(env, SPR_POWER_PMC6, time_delta);
     }
+
+    /*
+     * Update base_time for future calculations if we updated
+     * the PMCs while the PMU was running.
+     */
+    if (!(env->spr[SPR_POWER_MMCR0] & MMCR0_FC)) {
+        env->pmu_base_time = now;
+    }
 }
 
 static int64_t get_CYC_timeout(CPUPPCState *env, int sprn)
@@ -413,4 +421,23 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
     }
 }
 
+void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
+{
+    bool pmu_frozen = env->spr[SPR_POWER_MMCR0] & MMCR0_FC;
+
+    if (pmu_frozen) {
+        env->spr[sprn] = value;
+        return;
+    }
+
+    /*
+     * Update counters with the events counted so far, define
+     * the new value of the PMC and start a new cycle count
+     * session.
+     */
+    update_cycles_PMCs(env);
+    env->spr[sprn] = value;
+    start_cycle_count_session(env);
+}
+
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 2c5b056fc1..84f8ef39ab 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
@@ -45,6 +46,7 @@ void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 8302022852..d241795131 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -407,13 +407,29 @@ void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn)
     gen_icount_io_start(ctx);
     gen_helper_store_mmcr0(cpu_env, cpu_gpr[gprn]);
 }
+
+void spr_write_PMC_generic(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+
+    tcg_temp_free_i32(t_sprn);
+}
 #else
 void spr_write_MMCR0_generic(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
 }
+void spr_write_PMC_generic(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif
 
+
+
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
@@ -640,6 +656,20 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+
+void spr_write_PMC_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    /*
+     * All PMCs belongs to Group A SPRs. The same write access
+     * control done in spr_write_PMU_groupA_ureg() applies.
+     */
+    if (ctx->pmcc_clear) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        return;
+    }
+
+    spr_write_PMC_generic(ctx, sprn + 0x10, gprn);
+}
 #else
 void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
 {
@@ -650,6 +680,11 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_write_PMC_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif
 
 /* SPR common to all non-embedded PowerPC */
-- 
2.31.1


