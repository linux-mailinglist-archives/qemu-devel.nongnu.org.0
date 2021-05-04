Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E8213725AB
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:06:20 +0200 (CEST)
Received: from localhost ([::1]:41214 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldoCJ-0007Bv-Hu
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:06:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60456)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzy-0005ER-RK; Tue, 04 May 2021 01:53:36 -0400
Received: from ozlabs.org ([203.11.71.1]:60029)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldnzu-0004fy-L1; Tue, 04 May 2021 01:53:33 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CK2HFbz9sWP; Tue,  4 May 2021 15:53:17 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107597;
 bh=oW4gZLOC55a8GtLu9aFZEjL0E+dLRASXBtOs5tL/xpw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=QazuReShYv9d9YYcApIrSml4UbUWrVzhLV+hxfZe5Ow0OOi4S7XBexXu/ne0Qp9ES
 aehyZPoD+h0GLBkgd2pkXSfRLDqFs1IcspLlZAZLKUu7npRVLvHNspKzqdpTYcdbKL
 Tz+lDt6nglU6KxlFyT9hE6EwZ+UTzYD7e0vcyaSQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 10/46] target/ppc: Extract post_load_update_msr
Date: Tue,  4 May 2021 15:52:36 +1000
Message-Id: <20210504055312.306823-11-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.25,
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
Cc: Richard Henderson <richard.henderson@linaro.org>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

Extract post_load_update_msr to share between cpu_load_old
and cpu_post_load in updating the msr.

Suggested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210323184340.619757-2-richard.henderson@linaro.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/machine.c | 30 ++++++++++++++----------------
 1 file changed, 14 insertions(+), 16 deletions(-)

diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index 1f7a353c78..09c5765a87 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -10,6 +10,18 @@
 #include "kvm_ppc.h"
 #include "exec/helper-proto.h"
 
+static void post_load_update_msr(CPUPPCState *env)
+{
+    target_ulong msr = env->msr;
+
+    /*
+     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
+     * before restoring.  Note that this recomputes hflags and mem_idx.
+     */
+    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
+    ppc_store_msr(env, msr);
+}
+
 static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
 {
     PowerPCCPU *cpu = opaque;
@@ -21,7 +33,6 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     int32_t slb_nr;
 #endif
     target_ulong xer;
-    target_ulong msr;
 
     for (i = 0; i < 32; i++) {
         qemu_get_betls(f, &env->gpr[i]);
@@ -117,13 +128,7 @@ static int cpu_load_old(QEMUFile *f, void *opaque, int version_id)
     qemu_get_sbe32(f); /* Discard unused mmu_idx */
     qemu_get_sbe32(f); /* Discard unused power_mode */
 
-    /*
-     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring.  Note that this recomputes hflags and mem_idx.
-     */
-    msr = env->msr;
-    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
-    ppc_store_msr(env, msr);
+    post_load_update_msr(env);
 
     return 0;
 }
@@ -343,7 +348,6 @@ static int cpu_post_load(void *opaque, int version_id)
     PowerPCCPU *cpu = opaque;
     CPUPPCState *env = &cpu->env;
     int i;
-    target_ulong msr;
 
     /*
      * If we're operating in compat mode, we should be ok as long as
@@ -417,13 +421,7 @@ static int cpu_post_load(void *opaque, int version_id)
         ppc_store_sdr1(env, env->spr[SPR_SDR1]);
     }
 
-    /*
-     * Invalidate all supported msr bits except MSR_TGPR/MSR_HVB
-     * before restoring.  Note that this recomputes hflags and mem_idx.
-     */
-    msr = env->msr;
-    env->msr ^= env->msr_mask & ~((1ULL << MSR_TGPR) | MSR_HVB);
-    ppc_store_msr(env, msr);
+    post_load_update_msr(env);
 
     return 0;
 }
-- 
2.31.1


