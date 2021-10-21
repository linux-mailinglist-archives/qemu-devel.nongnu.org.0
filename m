Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B408435A41
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 07:17:40 +0200 (CEST)
Received: from localhost ([::1]:46344 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQSQ-0007j7-63
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 01:17:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZx-0006WO-2P; Thu, 21 Oct 2021 00:21:21 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:39015)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZu-0000bg-Gv; Thu, 21 Oct 2021 00:21:20 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p674lz4xdZ; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=vdQpF435Qd0JvCll7QdFc8Y5d7rR4y5CRsvUiPHXpxo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Y5MrlST9diqW6zx9vrVSUmepB4TbN1RaOX5t70thHdCgzHOUMD+7u16CJ1sFHJdng
 u/MIYozEuEj792aaWLBR62XJ6/X3Jx4b9v6TYRYcSk9bHAImiLF0ML3o+T7jZbtRWW
 7rYwYEEbXWSPQ3urw5K7ZZrHpbvVVQzMkpyCcQ6E=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 24/25] target/ppc: adding user read/write functions for PMCs
Date: Thu, 21 Oct 2021 15:20:26 +1100
Message-Id: <20211021042027.345405-25-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211021042027.345405-1-david@gibson.dropbear.id.au>
References: <20211021042027.345405-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2404:9400:2:0:216:3eff:fee2:21ea;
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

Problem state needs to be able to read and write the PMU counters,
otherwise it won't be aware of any sampling result that the PMU produces
after a Perf run.

This patch does that in a similar fashion as already done in the
previous patches. PMCs 5 and 6 have a special condition, aside from the
constraints that are common with PMCs 1-4, where they are not part of the
PMU if MMCR0_PMCC is 0b11.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211018010133.315842-5-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu_init.c            | 12 +++---
 target/ppc/power8-pmu-regs.c.inc | 70 ++++++++++++++++++++++++++++++++
 target/ppc/spr_tcg.h             |  4 ++
 3 files changed, 80 insertions(+), 6 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index ad88e54950..65545ba9ca 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6879,27 +6879,27 @@ static void register_book3s_pmu_user_sprs(CPUPPCState *env)
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC1, "UPMC1",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC2, "UPMC2",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC3, "UPMC3",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC4, "UPMC4",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC14_ureg, &spr_write_PMC14_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC5, "UPMC5",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC56_ureg, &spr_write_PMC56_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_UPMC6, "UPMC6",
-                 &spr_read_ureg, SPR_NOACCESS,
+                 &spr_read_PMC56_ureg, &spr_write_PMC56_ureg,
                  &spr_read_ureg, &spr_write_ureg,
                  0x00000000);
     spr_register(env, SPR_POWER_USIAR, "USIAR",
diff --git a/target/ppc/power8-pmu-regs.c.inc b/target/ppc/power8-pmu-regs.c.inc
index fb95175183..7391851238 100644
--- a/target/ppc/power8-pmu-regs.c.inc
+++ b/target/ppc/power8-pmu-regs.c.inc
@@ -169,6 +169,56 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 
     tcg_temp_free(masked_gprn);
 }
+
+void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    if (!spr_groupA_read_allowed(ctx)) {
+        return;
+    }
+
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    /*
+     * If PMCC = 0b11, PMC5 and PMC6 aren't included in the Performance
+     * Monitor, and a read attempt results in a Facility Unavailable
+     * Interrupt.
+     */
+    if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        return;
+    }
+
+    /* The remaining steps are similar to PMCs 1-4 userspace read */
+    spr_read_PMC14_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    if (!spr_groupA_write_allowed(ctx)) {
+        return;
+    }
+
+    spr_write_ureg(ctx, sprn, gprn);
+}
+
+void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    /*
+     * If PMCC = 0b11, PMC5 and PMC6 aren't included in the Performance
+     * Monitor, and a write attempt results in a Facility Unavailable
+     * Interrupt.
+     */
+    if (ctx->mmcr0_pmcc0 && ctx->mmcr0_pmcc1) {
+        gen_hvpriv_exception(ctx, POWERPC_EXCP_FU);
+        return;
+    }
+
+    /* The remaining steps are similar to PMCs 1-4 userspace write */
+    spr_write_PMC14_ureg(ctx, sprn, gprn);
+}
 #else
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn)
 {
@@ -189,4 +239,24 @@ void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn)
 {
     spr_noaccess(ctx, gprn, sprn);
 }
+
+void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn)
+{
+    spr_read_ureg(ctx, gprn, sprn);
+}
+
+void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
+
+void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn)
+{
+    spr_noaccess(ctx, gprn, sprn);
+}
 #endif /* defined(TARGET_PPC64) && !defined(CONFIG_USER_ONLY) */
diff --git a/target/ppc/spr_tcg.h b/target/ppc/spr_tcg.h
index cb7f40eedf..520f1ef233 100644
--- a/target/ppc/spr_tcg.h
+++ b/target/ppc/spr_tcg.h
@@ -34,6 +34,8 @@ void spr_write_ctr(DisasContext *ctx, int sprn, int gprn);
 void spr_read_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR0_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_MMCR2_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_PMC14_ureg(DisasContext *ctx, int gprn, int sprn);
+void spr_read_PMC56_ureg(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbl(DisasContext *ctx, int gprn, int sprn);
 void spr_read_tbu(DisasContext *ctx, int gprn, int sprn);
 void spr_read_atbl(DisasContext *ctx, int gprn, int sprn);
@@ -44,6 +46,8 @@ void spr_read_spefscr(DisasContext *ctx, int gprn, int sprn);
 void spr_write_spefscr(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR0_ureg(DisasContext *ctx, int sprn, int gprn);
 void spr_write_MMCR2_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC14_ureg(DisasContext *ctx, int sprn, int gprn);
+void spr_write_PMC56_ureg(DisasContext *ctx, int sprn, int gprn);
 
 #ifndef CONFIG_USER_ONLY
 void spr_write_generic32(DisasContext *ctx, int sprn, int gprn);
-- 
2.31.1


