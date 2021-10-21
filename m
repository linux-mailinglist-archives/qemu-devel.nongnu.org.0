Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C2F7A435A19
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 06:49:47 +0200 (CEST)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdQ1S-0007Ju-Tc
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 00:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42934)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZw-0006Us-BY; Thu, 21 Oct 2021 00:21:20 -0400
Received: from gandalf.ozlabs.org ([2404:9400:2:0:216:3eff:fee2:21ea]:35191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@gandalf.ozlabs.org>)
 id 1mdPZt-0000Sj-FF; Thu, 21 Oct 2021 00:21:18 -0400
Received: by gandalf.ozlabs.org (Postfix, from userid 1007)
 id 4HZZ5p5mpSz4xdW; Thu, 21 Oct 2021 15:20:30 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gibson.dropbear.id.au; s=201602; t=1634790030;
 bh=AHvt3jVno9VpQiUitApvasHrE+Rhsg/V2BQGQ+GEJhg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dcCbUQZ/SehIjQu3amGmabZDJkzMfjAPaWyJfYT98ZQfAWO34ipQPak2tVf5y585Q
 Ufbw1K7gZCDGLYJ35pxs8KFoQyjjZ/sO18uTzmCTldTdi5RwnM9T4eLNQKvNz7dx5z
 7fgvD9xK5Kp41gGaKRVfWyquq1MB8Zqhe735Om4A=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 21/25] target/ppc: add MMCR0 PMCC bits to hflags
Date: Thu, 21 Oct 2021 15:20:23 +1100
Message-Id: <20211021042027.345405-22-david@gibson.dropbear.id.au>
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

We're going to add PMU support for TCG PPC64 chips, based on IBM POWER8+
emulation and following PowerISA v3.1. This requires several PMU related
registers to be exposed to userspace (problem state). PowerISA v3.1
dictates that the PMCC bits of the MMCR0 register controls the level of
access of the PMU registers to problem state.

This patch start things off by exposing both PMCC bits to hflags,
allowing us to access them via DisasContext in the read/write callbacks
that we're going to add next.

Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
Message-Id: <20211018010133.315842-2-danielhb413@gmail.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         | 6 ++++++
 target/ppc/helper_regs.c | 6 ++++++
 target/ppc/translate.c   | 4 ++++
 3 files changed, 16 insertions(+)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index cc1911bc75..24d1f2cf97 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -343,6 +343,10 @@ typedef struct ppc_v3_pate_t {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+/* PMU bits */
+#define MMCR0_PMCC0  PPC_BIT(44)         /* PMC Control bit 0 */
+#define MMCR0_PMCC1  PPC_BIT(45)         /* PMC Control bit 1 */
+
 /* LPCR bits */
 #define LPCR_VPM0         PPC_BIT(0)
 #define LPCR_VPM1         PPC_BIT(1)
@@ -608,6 +612,8 @@ enum {
     HFLAGS_SE = 10,  /* MSR_SE -- from elsewhere on embedded ppc */
     HFLAGS_FP = 13,  /* MSR_FP */
     HFLAGS_PR = 14,  /* MSR_PR */
+    HFLAGS_PMCC0 = 15,  /* MMCR0 PMCC bit 0 */
+    HFLAGS_PMCC1 = 16,  /* MMCR0 PMCC bit 1 */
     HFLAGS_VSX = 23, /* MSR_VSX if cpu has VSX */
     HFLAGS_VR = 25,  /* MSR_VR if cpu has VRE */
 
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 1bfb480ecf..99562edd57 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -109,6 +109,12 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
     if (env->spr[SPR_LPCR] & LPCR_HR) {
         hflags |= 1 << HFLAGS_HR;
     }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC0) {
+        hflags |= 1 << HFLAGS_PMCC0;
+    }
+    if (env->spr[SPR_POWER_MMCR0] & MMCR0_PMCC1) {
+        hflags |= 1 << HFLAGS_PMCC1;
+    }
 
 #ifndef CONFIG_USER_ONLY
     if (!env->has_hv_mode || (msr & (1ull << MSR_HV))) {
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index d0d400cd8c..a4c5ef3701 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -175,6 +175,8 @@ struct DisasContext {
     bool tm_enabled;
     bool gtse;
     bool hr;
+    bool mmcr0_pmcc0;
+    bool mmcr0_pmcc1;
     ppc_spr_t *spr_cb; /* Needed to check rights for mfspr/mtspr */
     int singlestep_enabled;
     uint32_t flags;
@@ -8552,6 +8554,8 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->tm_enabled = (hflags >> HFLAGS_TM) & 1;
     ctx->gtse = (hflags >> HFLAGS_GTSE) & 1;
     ctx->hr = (hflags >> HFLAGS_HR) & 1;
+    ctx->mmcr0_pmcc0 = (hflags >> HFLAGS_PMCC0) & 1;
+    ctx->mmcr0_pmcc1 = (hflags >> HFLAGS_PMCC1) & 1;
 
     ctx->singlestep_enabled = 0;
     if ((hflags >> HFLAGS_SE) & 1) {
-- 
2.31.1


