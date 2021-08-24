Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B72AD3F62B4
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Aug 2021 18:33:25 +0200 (CEST)
Received: from localhost ([::1]:54456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mIZMV-0001u8-Ok
	for lists+qemu-devel@lfdr.de; Tue, 24 Aug 2021 12:33:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55764)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZK7-0007Ie-LM; Tue, 24 Aug 2021 12:30:51 -0400
Received: from mail-qk1-x736.google.com ([2607:f8b0:4864:20::736]:36614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1mIZK5-0008IT-78; Tue, 24 Aug 2021 12:30:51 -0400
Received: by mail-qk1-x736.google.com with SMTP id e14so23811822qkg.3;
 Tue, 24 Aug 2021 09:30:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=rz7hG1GHe/fi1AN0Vqe3seSE5hPFp1s5jqpcAoJcTuU=;
 b=FkOf9c0lYNf00y8dNBUgcusIYSvTqKzcZGBD17O25FJ/Nl8jwx1v/IymqDQQ4/rHBu
 fsXYK0Mb0x0WaR+nYzyzQYAxNntvPOwqm6gF63AcysyeKzqUaIz4GBZp5ggXuXqn+Hhv
 DgwHOZb7cHC3G8kezFJqyNdgsoDWn3zHqcVfqeXQxXRLMspAvVYf8RF3d23mr2rm8Qdf
 VyWPYBdgLh6amW9xKkw+1yblvH8O+vbAQ9nkI92v/p1qvCGBdiGxp/O8ZvJxQS6TVS88
 b6VmC1rwaAObLsqrWGxBUV6sbfIFej/oub398TxOpz7FZS7BBTreUNtQfWmOw/KmqRAB
 TDLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=rz7hG1GHe/fi1AN0Vqe3seSE5hPFp1s5jqpcAoJcTuU=;
 b=Z7JaKZX7GN56hS3dfSme1yp/D+gkpHg0uZwDjEGvTfd2Gk+Vke9TB8GiPt3IchTr6B
 mM/jdz1Irreg4gWIE/XO3XUEYbntFRIRFsVMEFWUmQdidINMwGacQluCSsYsnd1IrVkc
 vxL0+8Z6UTT9izaAiseONQmSgXCamRUnudIbGopKCRrpIFU5vAKdiWk2vGVmE3ZSfCOy
 CaIOTya65Cfiuusm6OpLwtq3vLP/G3afeVrUOBX9jTujcMZbJ1IaLf422li0ARTPnneF
 g7XzHF3UM58+ebwbqUwWuX7ialNmKJv3ef1h3Hs0VG2G2b/70sxhWajDbHVKz6vV7wFb
 w7Qg==
X-Gm-Message-State: AOAM532LT6nIh1uYQmkmrm041zaRjV9yE6uuzJZI5QexUZsxOZT+sLGY
 fOa+sgalxBME/3m3jB6nyfdDJAjsiUs=
X-Google-Smtp-Source: ABdhPJygC89W9e2r6wt4FdEyuUiCDOV6xDRHV81ksrgYeXKqmNlIozkiocID72699H8oz+dsKfiWHg==
X-Received: by 2002:a37:b901:: with SMTP id j1mr26898485qkf.311.1629822647531; 
 Tue, 24 Aug 2021 09:30:47 -0700 (PDT)
Received: from rekt.ihost.com ([179.247.162.205])
 by smtp.gmail.com with ESMTPSA id 75sm10951474qko.100.2021.08.24.09.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Aug 2021 09:30:47 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 01/16] target/ppc: add user write access control for PMU
 SPRs
Date: Tue, 24 Aug 2021 13:30:17 -0300
Message-Id: <20210824163032.394099-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210824163032.394099-1-danielhb413@gmail.com>
References: <20210824163032.394099-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::736;
 envelope-from=danielhb413@gmail.com; helo=mail-qk1-x736.google.com
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

We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
emulation and following PowerISA v3.1.

PowerISA v3.1 defines two PMU registers groups, A and B:

- group A contains all performance monitor counters (PMCs), MMCR0, MMCR2
and MMCRA;

- group B contains MMCR1, MMCR3, SIER, SIER2, SIER3, SIAR, SDAR.

Group A have read/write non-privileged access depending on MMCR0_PMCC
bits. Group B is always userspace read only.

Userspace will require to write Group A registers, and at the same time
some Linux PMU selftests deliberately test if we are allowing write
access when we shouldn't. This patch address the access control of Group
A PMU registers by doing the following:

- add a 'pmcc_clear' flag in DisasContext. This will map whether
MMCR0_PMCC bits are cleared by checking HFLAGS_PMCCCLEAR;

- create a spr_write_PMU_groupA_ureg() that will be used to all
userspace writes of PMU regs. The reg will apply the proper access
control before forwarding execution to spr_write_ureg().

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu.h         |  4 ++++
 target/ppc/cpu_init.c    | 18 +++++++++---------
 target/ppc/helper_regs.c |  3 +++
 target/ppc/spr_tcg.h     |  1 +
 target/ppc/translate.c   | 37 +++++++++++++++++++++++++++++++++++++
 5 files changed, 54 insertions(+), 9 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 500205229c..627fc8d732 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -342,6 +342,9 @@ typedef struct ppc_v3_pate_t {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+/* PMU bits */
+#define MMCR0_PMCC  PPC_BITMASK(44, 45) /* PMC Control */
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
@@ -606,6 +609,7 @@ enum {
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
+    HFLAGS_PMCCCLEAR = 15, /* PMU MMCR0 PMCC equal to 0b00 */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 66deb18a6b..c72c7fabea 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6868,7 +6868,7 @@ static void register_book3s_pmu_sup_sprs(CPUPPCState *env)
 static void register_book3s_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR0, "UMMCR0",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCR1, "UMMCR1",
@@ -6876,31 +6876,31 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UMMCRA, "UMMCRA",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
@@ -6976,7 +6976,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_ureg, &spr_write_PMU_groupA_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 405450d863..4c1d9575ac 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -106,6 +106,9 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_LPCR] & LPCR_GTSE) {
         hflags |= 1 << HFLAGS_GTSE;
     }
+    if (((env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC) >> 18) == 0) {
+        hflags |= 1 << HFLAGS_PMCCCLEAR;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index 0be5f347d5..027ec4c3f7 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -40,6 +40,7 @@ void spr_read_601_rtcl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 171b216e17..3a1eafbba8 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -175,6 +175,7 @@ struct DisasContext {
     bool spe_enabled;
     bool tm_enabled;
     bool gtse;
+    bool pmcc_clear;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -526,6 +527,41 @@ void spr_write_ureg(DisasContext *ctx, int sprn, int gprn)
 }
 #endif
 
+#if defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY)
+/*
+ * User write function for PMU group A regs. PowerISA v3.1
+ * defines Group A sprs as:
+ *
+ * "The non-privileged read/write Performance Monitor registers
+ * (i.e., the PMCs, MMCR0, MMCR2, and MMCRA at SPR numbers
+ * 771-776, 779, 769, and 770, respectively)"
+ *
+ * These SPRs have a common user write access control via
+ * MMCR0 bits 44 and 45 (PMCC).
+ */
+void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    /*
+     * For group A PMU sprs, if PMCC = 0b00, PowerISA v3.1
+     * dictates that:
+     *
+     * "If an attempt is made to write to an SPR in group A in
+     * problem state, a Hypervisor Emulation Assistance
+     * interrupt will occur."
+     */
+    if (ctx->pmcc_clear) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_INVAL_SPR);
+        return;
+    }
+    spr_write_ureg(ctx, sprn, gprn);
+}
+#else
+void spr_write_PMU_groupA_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
+#endif
+
 /* SPR common to all non-embedded PowerPC */
 /* DECR */
 #if !defined(CONFIG_USER_ONLY)
@@ -8539,6 +8575,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->vsx_enabled = (hflags >> HFLAGS_VSX) & 1;
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
+    ctx->pmcc_clear = (hflags >> HFLAGS_PMCCCLEAR) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.31.1


