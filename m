Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB005465186
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 16:25:25 +0100 (CET)
Received: from localhost ([::1]:43996 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msRU4-0006z9-Lw
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 10:25:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMu-0006Y6-Ft; Wed, 01 Dec 2021 10:18:00 -0500
Received: from [2607:f8b0:4864:20::930] (port=46822
 helo=mail-ua1-x930.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1msRMq-0003Jf-UM; Wed, 01 Dec 2021 10:18:00 -0500
Received: by mail-ua1-x930.google.com with SMTP id az37so49718487uab.13;
 Wed, 01 Dec 2021 07:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=u/BTqOHmaFMuU5xzub1ZrirSeeCHZjw/YQB11naE2yc=;
 b=MbydfSv47VmBhe++V15rRWWoi2tPIYa8JBUPYiHC8tAjq+Bq1UEvYJYflh0p7bIkVC
 c5kvJyNGhzBQ7AYTpw3N1vTnIUOVHesibLJZlW7vx5zX9E9m6Wb9VB6DOcMwXOauHTnj
 81T1TaIN4sO8f26J3w7DUdi5Cg+vguMvIGejFl5mkEj70MlhaiZIEzAxo703+JAE7+2z
 VystpDTaE8gS/vHVHonHctHcl+8b+fDA9ao4tdc2cnBl9QW8Vh6cFOc0VicrCBg/CNcw
 pYvBD73P1QcSxAGGVeqBeFFusC+GxPqJK3objPduz7pk+Q6OLS4OHsuD3mH8f4H4Loou
 VmBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=u/BTqOHmaFMuU5xzub1ZrirSeeCHZjw/YQB11naE2yc=;
 b=HxlRnn2xyz44IktUo2YroRcN6DSls3hNdTJDLgOXWezpU6TFqEN/3/ybP2l7XR6QF8
 nmBdIlvLqsEF5PIv9MnvzdZRZW50w8kusLiSBWTBluSCo5kQ+YvwGhoR+E10M7tsVNKI
 0MGj7EeCK47vTY0Hw4kV6g4pBu2QS/5Gl5cHyo3cSQywk+1QG0jBp2Nd1uXipq1wCXEa
 E+vMb01JiJPPiNAydsDxd2V/953cWUmAe1TYO8dj9CG6BYjkmW3zXYH01b555Qvyy+yD
 IGlevsWExRmYKfIobxLTDZD0YyIHRkZD7V0CpQUuVF8zCDKwyVGVRANiIj3W1MJmlhMB
 s9uQ==
X-Gm-Message-State: AOAM5319VkAUShs84rtqL5HwDHAeFmJuiou6fqR4+xwrs6seForPaVCx
 uuU35X9oSWZ/VslepDEeM4rh2PnldZg=
X-Google-Smtp-Source: ABdhPJyn4xHC4uwLde9vIceXLV8Hn666EYh5hW+sT3fMqBP4ksLBmnHRXa0wPvLB9f0I7FjdQHqQQA==
X-Received: by 2002:a05:6102:c06:: with SMTP id
 x6mr8076899vss.23.1638371875645; 
 Wed, 01 Dec 2021 07:17:55 -0800 (PST)
Received: from rekt.COMFAST ([177.68.212.35])
 by smtp.gmail.com with ESMTPSA id q26sm109610vsp.23.2021.12.01.07.17.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 07:17:55 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 03/10] target/ppc: PMU: update counters on PMCs r/w
Date: Wed,  1 Dec 2021 12:17:27 -0300
Message-Id: <20211201151734.654994-4-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211201151734.654994-1-danielhb413@gmail.com>
References: <20211201151734.654994-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::930
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::930;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x930.google.com
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001, PDS_HP_HELO_NORDNS=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: richard.henderson@linaro.org,
 Daniel Henrique Barboza <danielhb413@gmail.com>, qemu-ppc@nongnu.org,
 clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Calling pmu_update_cycles() on every PMC read/write operation ensures
that the values being fetched are up to date with the current PMU state.

In theory we can get away by just trapping PMCs reads, but we're going
to trap PMC writes to deal with counter overflow logic later on.  Let's
put the required wiring for that and make our lives a bit easier in the
next patches.

Reviewed-by: David Gibson <david@gibson.dropbear.id.au>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c            | 12 ++++++------
 target/ppc/helper.h              |  2 ++
 target/ppc/power8-pmu-regs.c.inc | 29 +++++++++++++++++++++++++++--
 target/ppc/power8-pmu.c          | 14 ++++++++++++++
 target/ppc/spr_tcg.h             |  2 ++
 5 files changed, 51 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index e0b6fe4057..a7f47ec322 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6833,27 +6833,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
                      KVM_REG_PPC_MMCRA, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC1, "PMC1",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC1, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC2, "PMC2",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC2, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC3, "PMC3",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC3, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC4, "PMC4",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC4, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC5, "PMC5",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC5, 0x00000000);
     spr_register_kvm(env, SPR_POWER_PMC6, "PMC6",
                      SPR_NOACCESS, SPR_NOACCESS,
-                     &spr_read_generic, &spr_write_generic,
+                     &spr_read_PMC, &spr_write_PMC,
                      KVM_REG_PPC_PMC6, 0x00000000);
     spr_register_kvm(env, SPR_POWER_SIAR, "SIAR",
                      SPR_NOACCESS, SPR_NOACCESS,
diff --git a/target/ppc/helper.h b/target/ppc/helper.h
index ea60a7493c..d7567f75b4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,8 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
+DEF_HELPER_2(read_pmc, tl, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
 DEF_HELPER_1(check_tlb_flush_global, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index fbb8977641..f0c9cc343b 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -181,13 +181,23 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
     tcg_temp_free(masked_gprn);
 }
 
+void spr_read_PMC(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv_i32 t_sprn = tcg_const_i32(sprn);
+
+    gen_icount_io_start(ctx);
+    gen_helper_read_pmc(cpu_gpr[gprn], cpu_env, t_sprn);
+
+    tcg_temp_free_i32(t_sprn);
+}
+
 void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
 {
     if (!spr_groupA_read_allowed(ctx)) {
         return;
     }
 
-    spr_read_ureg(ctx, gprn, sprn);
+    spr_read_PMC(ctx, gprn, sprn + 0x10);
 }
 
 void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
@@ -206,13 +216,23 @@ void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
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
@@ -280,4 +300,9 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
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
index 5e689144d7..7131f52ccc 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -133,6 +133,20 @@ void helper_store_mmcr0(CPUPPCState *env, target_ulong value)
     hreg_compute_hflags(env);
 }
 
+target_ulong helper_read_pmc(CPUPPCState *env, uint32_t sprn)
+{
+    pmu_update_cycles(env);
+
+    return env->spr[sprn];
+}
+
+void helper_store_pmc(CPUPPCState *env, uint32_t sprn, uint64_t value)
+{
+    pmu_update_cycles(env);
+
+    env->spr[sprn] = value;
+}
+
 static void fire_PMC_interrupt(PowerPCCPU *cpu)
 {
     CPUPPCState *env = &cpu->env;
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index eb1d0c2bf0..1e79a0522a 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -26,6 +26,7 @@ void spr_noaccess(DisasContext *ctx, int gprn, int sprn);
 void spr_read_generic(DisasContext *ctx, int gprn, int sprn);
 void spr_write_generic(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn);
 void spr_read_xer(DisasContext *ctx, int gprn, int sprn);
 void spr_write_xer(DisasContext *ctx, int sprn, int gprn);
 void spr_read_lr(DisasContext *ctx, int gprn, int sprn);
@@ -35,6 +36,7 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_PMC(DisasContext *ctx, int gprn, int sprn);
 void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
-- 
2.31.1


