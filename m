Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68BF3435A27
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 07:05:27 +0200 (CEST)
Received: from localhost ([::1]:37082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQGc-0001BU-HR
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 01:05:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42940)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZx-0006WQ-2p; Thu, 21 Oct 2021 00:21:21 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:46519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZt-0000Za-V5; Thu, 21 Oct 2021 00:21:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p5xgcz4xdY; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=fERvpXSTg1BfarES3CGhZHRLqXv8rpDezo0X7vDukUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=YdW2YAVxVlb5wxX6kHxtVOZXbGZPEmC38M5Hhg8GleOBSwWGbifiOeCRBNrYuXlqf
 dkczLj/tFAVPy8hYdbujW6u1N4qiB6MkLuKkTu24bngKSWQOj1oGpfupx1jyV1ggGr
 5V6XaOkoaLkPfkBphM6sApMi1a3DR/kewGpXBPts=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 23/25] target/ppc: add user read/write functions for MMCR2
Date: Thu, 21 Oct 2021 15:20:25 +1100
Message-Id: <20211021042027.345405-24-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=dgibson@gandalf.ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, qemu-devel@nongnu.org, groug@kaod.org,
 qemu-ppc@nongnu.org, clg@kaod.org, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Daniel Henrique Barboza <danielhb413@gmail.com>

Similar to the previous patch, let's add problem state read/write access to
the MMCR2 SPR, which is also a group A PMU SPR that needs to be filtered
to be read/written by userspace.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211018010133.315842-4-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h                 |  9 +++
 target/ppc/cpu_init.c            |  2 +-
 target/ppc/power8-pmu-regs.c.inc | 98 ++++++++++++++++++++++++++++----
 target/ppc/spr_tcg.h             |  2 +
 4 files changed, 99 insertions(+), 12 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 0bd008f4b8..0472ec9154 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,15 @@ typedef struct ppc_v3_pate_t {
 #define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
 /* MMCR0 userspace r/w mask */
 #define MMCR0_UREG_MASK (MMCR0_FC | MMCR0_PMAO | MMCR0_PMAE)
+/* MMCR2 userspace r/w mask */
+#define MMCR2_FC1P0  PPC_BIT(1)          /* MMCR2 FCnP0 for PMC1 */
+#define MMCR2_FC2P0  PPC_BIT(10)         /* MMCR2 FCnP0 for PMC2 */
+#define MMCR2_FC3P0  PPC_BIT(19)         /* MMCR2 FCnP0 for PMC3 */
+#define MMCR2_FC4P0  PPC_BIT(28)         /* MMCR2 FCnP0 for PMC4 */
+#define MMCR2_FC5P0  PPC_BIT(37)         /* MMCR2 FCnP0 for PMC5 */
+#define MMCR2_FC6P0  PPC_BIT(46)         /* MMCR2 FCnP0 for PMC6 */
+#define MMCR2_UREG_MASK (MMCR2_FC1P0 | MMCR2_FC2P0 | MMCR2_FC3P0 | \
+                         MMCR2_FC4P0 | MMCR2_FC5P0 | MMCR2_FC6P0)
 
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 375bdca1e1..ad88e54950 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6975,7 +6975,7 @@ static void register_power8_pmu_sup_sprs(CPUPPCState *env)
 static void register_power8_pmu_user_sprs(CPUPPCState *env)
 {
     spr_register(env, SPR_POWER_UMMCR2, "UMMCR2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_MMCR2_ureg, &spr_write_MMCR2_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIER, "USIER",
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index 37c812dd4d..fb95175183 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -55,6 +55,33 @@ static bool spr_groupA_write_allowed(DisasContext *ctx)
     return false;
 }
 
+/*
+ * Helper function to avoid code repetition between MMCR0 and
+ * MMCR2 problem state write functions.
+ *
+ * 'ret' must be tcg_temp_freed() by the caller.
+ */
+static TCGv masked_gprn_for_spr_write(int gprn, int sprn,
+                                      uint64_t spr_mask)
+{
+    TCGv ret = tcg_temp_new();
+    TCGv t0 = tcg_temp_new();
+
+    /* 'ret' starts with all mask bits cleared */
+    gen_load_spr(ret, sprn);
+    tcg_gen_andi_tl(ret, ret, ~(spr_mask));
+
+    /* Apply the mask into 'gprn' in a temp var */
+    tcg_gen_andi_tl(t0, cpu_gpr[gprn], spr_mask);
+
+    /* Add the masked gprn bits into 'ret' */
+    tcg_gen_or_tl(ret, ret, t0);
+
+    tcg_temp_free(t0);
+
+    return ret;
+}
+
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
     TCGv t0;
@@ -79,29 +106,68 @@ void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
-    TCGv t0, t1;
+    TCGv masked_gprn;
 
     if (!spr_groupA_write_allowed(ctx)) {
         return;
     }
 
-    t0 = tcg_temp_new();
-    t1 = tcg_temp_new();
-
     /*
      * Filter out all bits but FC, PMAO, and PMAE, according
      * to ISA v3.1, in 10.4.4 Monitor Mode Control Register 0,
      * fourth paragraph.
      */
-    tcg_gen_andi_tl(t0, cpu_gpr[gprn], MMCR0_UREG_MASK);
-    gen_load_spr(t1, SPR_POWER_MMCR0);
-    tcg_gen_andi_tl(t1, t1, ~(MMCR0_UREG_MASK));
-    /* Keep all other bits intact */
-    tcg_gen_or_tl(t1, t1, t0);
-    gen_store_spr(SPR_POWER_MMCR0, t1);
+    masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR0,
+                                            MMCR0_UREG_MASK);
+    gen_store_spr(SPR_POWER_MMCR0, masked_gprn);
+
+    tcg_temp_free(masked_gprn);
+}
+
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    TCGv t0;
+
+    if (!spr_groupA_read_allowed(ctx)) {
+        return;
+    }
+
+    t0 = tcg_temp_new();
+
+    /*
+     * On read, filter out all bits that are not FCnP0 bits.
+     * When MMCR0[PMCC] is set to 0b10 or 0b11, providing
+     * problem state programs read/write access to MMCR2,
+     * only the FCnP0 bits can be accessed. All other bits are
+     * not changed when mtspr is executed in problem state, and
+     * all other bits return 0s when mfspr is executed in problem
+     * state, according to ISA v3.1, section 10.4.6 Monitor Mode
+     * Control Register 2, p. 1316, third paragraph.
+     */
+    gen_load_spr(t0, SPR_POWER_MMCR2);
+    tcg_gen_andi_tl(t0, t0, MMCR2_UREG_MASK);
+    tcg_gen_mov_tl(cpu_gpr[gprn], t0);
 
     tcg_temp_free(t0);
-    tcg_temp_free(t1);
+}
+
+void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    TCGv masked_gprn;
+
+    if (!spr_groupA_write_allowed(ctx)) {
+        return;
+    }
+
+    /*
+     * Filter the bits that can be written using MMCR2_UREG_MASK,
+     * similar to what is done in spr_write_MMCR0_ureg().
+     */
+    masked_gprn = masked_gprn_for_spr_write(gprn, SPR_POWER_MMCR2,
+                                            MMCR2_UREG_MASK);
+    gen_store_spr(SPR_POWER_MMCR2, masked_gprn);
+
+    tcg_temp_free(masked_gprn);
 }
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
@@ -113,4 +179,14 @@ void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index b28b095097..cb7f40eedf 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -33,6 +33,7 @@ void spr_read_ctr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
@@ -42,6 +43,7 @@ void spr_read_601_rtcu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
-- 
2.31.1


