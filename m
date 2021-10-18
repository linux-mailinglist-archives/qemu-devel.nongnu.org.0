Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14AE430D5B
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Oct 2021 03:14:14 +0200 (CEST)
Received: from localhost ([::1]:36072 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mcHED-0000j2-Sm
	for lists+qemu-devel@lfdr.de; Sun, 17 Oct 2021 21:14:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2d-0006m2-FR; Sun, 17 Oct 2021 21:02:17 -0400
Received: from mail-ua1-x936.google.com ([2607:f8b0:4864:20::936]:33409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mcH2Z-0001ee-9t; Sun, 17 Oct 2021 21:02:12 -0400
Received: by mail-ua1-x936.google.com with SMTP id i15so2011699uap.0;
 Sun, 17 Oct 2021 18:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=F+99HG8eac446L2n75fRM4jwi9udlnj1/OOSf7a8Hws=;
 b=fPR0SHCm9Dk7bVe92wS2mf0qoJMriuap6p7neFT8hBV86Uelvnrb3ROTHIxjwq4y59
 XsbCURFDZshLVd+C71Z7REn7yrNUyJYRd50MISf5sOIibAgC1/q9BStSqNOd6WEr+/9m
 YMUg+sHV+DQCC02V1ckifAEL0qoA9eyN8c4BRIOvSKI2OHuLMkAOUgJXaUtkgHi9MZOy
 dohCwm7tIFSD28xYwBFrvMcAMMOWONcdX6CJ4V9Qw//ixO1iGF2ZH0e0EWWmtMJ10bCv
 tHPRsk12t1Qo01P6yDWT7kBtWGp/VJVbvVA4WEJYfXnMUz/ntnjGoLb7Sgskqdzh6/8C
 2HAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=F+99HG8eac446L2n75fRM4jwi9udlnj1/OOSf7a8Hws=;
 b=PfVAAJ8RcX/v7Asx+NExKnXNy8hxes9fmLdgXyKd76SDn5fp2Lwk7MWIPkYh4Z4T0M
 KmcOP4b9as+vGhFOB3ODjLEOIJWBys1AXlVc+kwzl2cD9TvweKF4M/6GEGpPD+8q55+h
 j+S4MocY87jSNMmsq9tningu9u5mU5xDQicPy8S0WN1xZTwlvJJUAmK3BKiD/jRxPiWX
 dygskuSO9CylKeGPcfYucvmrtph7VRujXA1XA6JDFhCTU5RhQ5bKktcwwQg6XYDaXpFT
 vEP5L38VdRYZC0q2NCOZHBIsgrZMazE6L6x0hdGb8YxsIAm5qBKTOPX0JZ/x5UjXCUym
 3eQA==
X-Gm-Message-State: AOAM533IbCzfqlw9rJoLUQ6Ax9PAl/DAS7dqcIwTVooCJsDOBRVhhjCt
 j0V/n7uKeJ66FBp0L9SPM0VWPG2Ulkc=
X-Google-Smtp-Source: ABdhPJzNOy3XuQEoBlvHU7pVoik38GmdnuzBk7FQhxDKzQjb1YBALsWZ1dkYf7MwJTvUawnmzRrS2Q==
X-Received: by 2002:a05:6102:3ec3:: with SMTP id
 n3mr24787981vsv.48.1634518929672; 
 Sun, 17 Oct 2021 18:02:09 -0700 (PDT)
Received: from rekt.COMFAST ([179.247.137.170])
 by smtp.gmail.com with ESMTPSA id m15sm8271607vsh.31.2021.10.17.18.02.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 17 Oct 2021 18:02:09 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 11/15] target/ppc: PMU: handle setting of PMCs while running
Date: Sun, 17 Oct 2021 22:01:29 -0300
Message-Id: <20211018010133.315842-12-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211018010133.315842-1-danielhb413@gmail.com>
References: <20211018010133.315842-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
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
existing counter negative timer needs to be discarded an a new one,
with the updated values, must be set again.

This patch does that via a new 'helper_store_pmc()' that is called in
the mtspr() callbacks of PMU counters.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c            | 12 ++++++------
 target/ppc/helper.h              |  1 +
 target/ppc/power8-pmu-regs.c.inc | 17 ++++++++++++++++-
 target/ppc/power8-pmu.c          | 18 ++++++++++++++++++
 target/ppc/spr_tcg.h             |  1 +
 5 files changed, 42 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index eb1a0320b9..cf68e2c5a7 100644
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
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index 5814e2f251..b0ebfaff51 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -22,6 +22,7 @@ DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
 DEF_HELPER_2(store_mmcr1, void, env, tl)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(insns_inc, void, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index f8ca44cfdc..8a9e1f41ef 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -212,13 +212,23 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
     spr_read_PMC14_ureg(ctx, gprn, sprn);
 }
 
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_store_pmc(cpu_env, t_sprn, cpu_gpr[gprn]);
+
+    tcg_temp_free_i32(t_sprn);
+}
+
 void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     if (!spr_groupA_write_allowed(ctx)) {
         return;
     }
 
-    spr_write_ureg(ctx, sprn, gprn);
+    spr_write_PMC(ctx, sprn + 0x10, gprn);
 }
 
 void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
@@ -302,4 +312,9 @@ void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
 }
+
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index 3946314e9c..3fc09cebe4 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -343,4 +343,22 @@ void cpu_ppc_pmu_init(CPUPPCState *env)
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
+    pmu_events_update_cycles(env);
+    env->spr[sprn] = value;
+    start_cycle_count_session(env);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 28126da6e2..01fded3c15 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -28,6 +28,7 @@ void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR1(DisasContext *ctx, int sprn, int gprn);
 void spr_write_CTRL(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
-- 
2.31.1


