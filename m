Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AB603457671
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Nov 2021 19:33:34 +0100 (CET)
Received: from localhost ([::1]:34092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mo8hZ-0002LC-87
	for lists+qemu-devel@lfdr.de; Fri, 19 Nov 2021 13:33:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37528)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XE-0004Cl-UR; Fri, 19 Nov 2021 13:22:53 -0500
Received: from [2607:f8b0:4864:20::936] (port=34418
 helo=mail-ua1-x936.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mo8XD-0001og-Be; Fri, 19 Nov 2021 13:22:52 -0500
Received: by mail-ua1-x936.google.com with SMTP id n6so23099399uak.1;
 Fri, 19 Nov 2021 10:22:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BlmV/E8KIapKdDMz4e6/WeqM4VwT5pdESjQ3gXisXpk=;
 b=C7Qg9klXMw67OKnut2ifTzvjX2MVjPMtKBB7oKWI0DzpEOYDmCNArYa/Z1GQcZ58xs
 B9sLkLs6PjFLYFewcwUfTm7lBD5iniVrFHia+GxLRVvPiGEBXxf3RT5Sol7dAg+hCTAj
 cxPJmD0AZOsqT9dNCziz1JcCCdQl1gdfEmSN+1WwCma4JLVH0pa4gsia1G5hLmKno8I7
 UcISy6nXOHjGTxMxb6OiTo/EZM4fv8yWZb5rp5Er7Csj3GDdg/FrNL7Tpu/a+zbQuvfH
 RgFglAknUTgzsdSgr4wr6OWnV3811+1uXhexLfmb1CmDrZ28eyUZDw6xlDjmDQufIioo
 5kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BlmV/E8KIapKdDMz4e6/WeqM4VwT5pdESjQ3gXisXpk=;
 b=AoVktVPGDVchPUIoxate9DdxN4OxWBZOn5ZopnDPtJGj0nY1jyEADC91uQKMQB0DsY
 OoIbA2QB7ST//LQrKDldiXSK9xn+sWDf9pCWSdTpowiJ2wJnhfsiT9n+gZnXkFckxi12
 fKAVyBQJJAfqxgDIodfzYMFcf+y+W6THCmFZPztZwhuZNXnLp5oVhi8LmadPRxyHQhux
 o2HtiWFIaHmyN1vwUCZ+4IQvMrLvkgZkOi6bEkj/BQzgtS8HB5wt2xNmli7xA0aPFsVx
 Xxvy6BC/iV4FHgdvpItwZGktAe9zN6bsljrekZyQyxzM6ETC3PzZY0UX8lFmY+8BE/WK
 Ct0Q==
X-Gm-Message-State: AOAM530KqZgUO1ZA9cJf2kO3A7Cpv16W51zj8VaM0WYppVGeQINS68vK
 YuJbGnY8gBfyOG/ZttFnLjYytSyK03eoWA==
X-Google-Smtp-Source: ABdhPJyhn4vWMd5lcTZn8Pb97THEED2bP7G6qUyxVaIh3zJRPzfqRqGpYOsdaQiBXIp9mjvDNZQLzg==
X-Received: by 2002:ab0:6414:: with SMTP id x20mr53675419uao.81.1637346170033; 
 Fri, 19 Nov 2021 10:22:50 -0800 (PST)
Received: from rekt.ibmuc.com ([152.250.208.89])
 by smtp.gmail.com with ESMTPSA id x142sm339871vsx.15.2021.11.19.10.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Nov 2021 10:22:49 -0800 (PST)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH for-7.0 v7 06/10] target/ppc: PMU: handle setting of PMCs
 while running
Date: Fri, 19 Nov 2021 15:22:12 -0300
Message-Id: <20211119182216.628676-7-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211119182216.628676-1-danielhb413@gmail.com>
References: <20211119182216.628676-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::936
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::936;
 envelope-from=danielhb413@gmail.com; helo=mail-ua1-x936.google.com
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
 target/ppc/power8-pmu-regs.c.inc | 16 +++++++++++++++-
 target/ppc/power8-pmu.c          | 18 ++++++++++++++++++
 target/ppc/spr_tcg.h             |  1 +
 5 files changed, 41 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 6ac6bcf7b9..3188a886c5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6833,27 +6833,27 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
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
index f397c05f65..ce05470fd4 100644
--- a/target/ppc/helper.h
+++ b/target/ppc/helper.h
@@ -21,6 +21,7 @@ DEF_HELPER_1(hrfid, void, env)
 DEF_HELPER_2(store_lpcr, void, env, tl)
 DEF_HELPER_2(store_pcr, void, env, tl)
 DEF_HELPER_2(store_mmcr0, void, env, tl)
+DEF_HELPER_3(store_pmc, void, env, i32, i64)
 DEF_HELPER_2(insns_inc, void, env, i32)
 #endif
 DEF_HELPER_1(check_tlb_flush_local, void, env)
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index a92437b0c4..3406649130 100644
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
@@ -286,4 +296,8 @@ void spr_write_MMCR0(DisasContext *ctx, int sprn, int gprn)
 {
     spr_write_generic(ctx, sprn, gprn);
 }
+void spr_write_PMC(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_write_generic(ctx, sprn, gprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/power8-pmu.c b/target/ppc/power8-pmu.c
index e43a74cc66..ed7fd0c898 100644
--- a/target/ppc/power8-pmu.c
+++ b/target/ppc/power8-pmu.c
@@ -344,4 +344,22 @@ void cpu_ppc_pmu_init(CPUPPCState *env)
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
+    pmu_update_cycles(env, env->spr[SPR_POWER_MMCR0]);
+    env->spr[sprn] = value;
+    start_cycle_count_session(env);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index fdc6adfc31..aae57baf23 100644
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
-- 
2.31.1


