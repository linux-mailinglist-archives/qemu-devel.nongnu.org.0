Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0625C4006C7
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Sep 2021 22:41:07 +0200 (CEST)
Received: from localhost ([::1]:46108 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mMFzm-0002pR-0S
	for lists+qemu-devel@lfdr.de; Fri, 03 Sep 2021 16:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFr4-0003RD-AT; Fri, 03 Sep 2021 16:32:06 -0400
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33]:37440)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mMFr2-0001qh-50; Fri, 03 Sep 2021 16:32:05 -0400
Received: by mail-qv1-xf33.google.com with SMTP id z7so374328qvi.4;
 Fri, 03 Sep 2021 13:32:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2MJZJrFdktYXtFoQdGXTvFoY49sKFDFxhHwwCtIgHC8=;
 b=OYi+yStXwUvKYpt70z32KClVj6GFHfJWktGkaHEVajHgNwhiKl2kXH9SwiidKp3tDP
 jeIkug70y8Z/XmgHxnQoQwGKH8xl7ose9RKv3tak+1FFc5dz2EIJwge70e/CMGhPhVpZ
 o+kvi7VUsAnnkrogeiWgBchJmGVM7AkQq1ZKX99s4qK3+DQmLFlLu+WFVEqQKotwPg9G
 FspvPGQy9Hh1Eo4f+BC2+zcluBT7V0fChQ0FUzJhPaEvn+8Uf9dNvMNGwEunVTpj/zvA
 EWScqmTgxI57fvVotHGhmn0S54/goxS5ePuAx302+5aLoD0+j+my130k1HGDk1hxx2lT
 07Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2MJZJrFdktYXtFoQdGXTvFoY49sKFDFxhHwwCtIgHC8=;
 b=esz4hssR4Ed2eof+tuiwTHp3oyaJIdrdiQmbuqojH81hPP7JimYyEtpx1ZITuE2t17
 9HMRKm94MCNfmHXMwIwb989m2F8JpPJpFsMDg4uM9Uay6H8T7C7rr263/YuXkLup8o93
 3foNO0qiF5JqdvprQcDADqrRTCSPbgWb4idPcEZPMtU/XegTan6wBE1MYCCO00/CAXq8
 1Lk7N7q9uzWJTczfEpifBHp/NaN2aA/2B9Q38hxrZLSU1DfV9PPAEnOnRw2QRmWIXrOy
 SjPy+ucXQ2LrW/VD7xD8N8er8eV6ZHc1gvBEqAaVa7f5NJ+YDNZYdgt3CUmoWwgJ8zdV
 ErTw==
X-Gm-Message-State: AOAM533ifDCr5/Ntg/NYGY+2VwqHgRVWprLtM3Q1k88MsVHMwACYOiEd
 KS7nOJCeMh7Noiy19sQ6W6kKAyd2ZDo=
X-Google-Smtp-Source: ABdhPJw6JcffuDGZoWRGw3NyjBqDp4ngU4w9fN8m+iL6JzinQUChKgqerrL8ceBfqxwCyvl8lPVHsA==
X-Received: by 2002:a0c:e513:: with SMTP id l19mr678298qvm.40.1630701122593;
 Fri, 03 Sep 2021 13:32:02 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.136.122])
 by smtp.gmail.com with ESMTPSA id z6sm285613qtq.78.2021.09.03.13.32.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 13:32:02 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 14/15] target/ppc/translate: PMU: handle setting of PMCs
 while running
Date: Fri,  3 Sep 2021 17:31:15 -0300
Message-Id: <20210903203116.80628-15-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210903203116.80628-1-danielhb413@gmail.com>
References: <20210903203116.80628-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f33;
 envelope-from=danielhb413@gmail.com; helo=mail-qv1-xf33.google.com
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
Cc: Daniel Henrique Barboza <danielhb413@gmail.com>,
 richard.henderson@linaro.org, groug@kaod.org, qemu-ppc@nongnu.org,
 clg@kaod.org, matheus.ferst@eldorado.org.br, david@gibson.dropbear.id.au
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
index 0013cba5ff..ee300d5931 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6832,27 +6832,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
                      KVM_REG_PPC_MMCRA, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC3, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC4, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC5, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_generic, &spr_write_PMC,
                      KVM_REG_PPC_PMC6, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
                      SPR_NOACCESS, SPR_NOACCESS,
@@ -6879,27 +6879,27 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, &spr_write_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, &spr_write_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, &spr_write_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, &spr_write_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, &spr_write_ureg,
+                 &spr_read_ureg, &spr_write_PMC_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, &spr_write_ureg,
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
index edece140aa..9707f6e3cf 100644
--- a/target/ppc/power8_pmu.c
+++ b/target/ppc/power8_pmu.c
@@ -117,6 +117,14 @@ static void update_cycles_PMCs(CPUPPCState *env)
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
@@ -416,4 +424,23 @@ void helper_insns_inc(CPUPPCState *env, uint32_t num_insns)
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
index 5e6ed36eb1..ced714bd09 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -27,6 +27,7 @@ void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
@@ -46,6 +47,7 @@ void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_ureg(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index c23ae2479c..2c5c14b4f1 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -431,13 +431,29 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
      */
     ctx->base.is_jmp = DISAS_EXIT_UPDATE;
 }
+
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+
+    tcg_temp_free_i32(t_sprn);
+}
 #else
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
 }
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif
 
+
+
 #if !defined(CONFIG_USER_ONLY)
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn)
 {
@@ -641,6 +657,20 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(t0);
     tcg_temp_free(t1);
 }
+
+void spr_write_PMC_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    /*
+     * All PMCs belongs to Group A SPRs and can't be written by
+     * userspace if PMCC = 0b00.
+     */
+    if (ctx->pmcc_clear) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        return;
+    }
+
+    spr_write_PMC(ctx, sprn + 0x10, gprn);
+}
 #else
 void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 {
@@ -651,6 +681,11 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_write_PMC_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
 
 /* SPR common to all non-embedded PowerPC */
-- 
2.31.1


