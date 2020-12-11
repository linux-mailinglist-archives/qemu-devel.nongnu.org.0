Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B84D2D6F63
	for <lists+qemu-devel@lfdr.de>; Fri, 11 Dec 2020 05:41:03 +0100 (CET)
Received: from localhost ([::1]:52712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1knaEo-0006tC-FH
	for lists+qemu-devel@lfdr.de; Thu, 10 Dec 2020 23:41:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqi-0005yo-BC; Thu, 10 Dec 2020 23:16:09 -0500
Received: from ozlabs.org ([2401:3900:2:1::2]:35545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1knZqc-0000uQ-UL; Thu, 10 Dec 2020 23:16:05 -0500
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Cscrf6YDkz9sXX; Fri, 11 Dec 2020 15:15:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1607660114;
 bh=fi1OCAmD51L422wOA0Op4lrQhSY509yAY53QJkTV0ck=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jnC+jm/BAqQmVMW2XHT3cwgjOUzRfpKlpRDx+SbxafoW6sWZkSBcbaVLwaqYyu7Vh
 KbLFVscTm40LWQBEG1zDhSR5UjjBktL8gbruatwh703EwzUAZipe1txmTe7dTCx4SE
 ypQFj09qdNOHn6WBapFadv8ku3JjNnMicPxt0GvQ=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org
Subject: [PULL 26/30] target/ppc: Introduce an mmu_is_64bit() helper
Date: Fri, 11 Dec 2020 15:15:03 +1100
Message-Id: <20201211041507.425378-27-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201211041507.425378-1-david@gibson.dropbear.id.au>
References: <20201211041507.425378-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, groug@kaod.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Greg Kurz <groug@kaod.org>

Callers don't really need to know how 64-bit MMU model enums are
computed. Hide this in a helper.

Signed-off-by: Greg Kurz <groug@kaod.org>
Message-Id: <20201209173536.1437351-3-groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu-qom.h            |  5 +++++
 target/ppc/excp_helper.c        |  4 ++--
 target/ppc/machine.c            |  4 ++--
 target/ppc/mmu-hash64.c         |  2 +-
 target/ppc/mmu_helper.c         | 10 +++++-----
 target/ppc/translate.c          |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 7 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 5fdb96f04d..63b9e8632c 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -74,6 +74,11 @@ enum powerpc_mmu_t {
     POWERPC_MMU_3_00       = POWERPC_MMU_64 | 0x00000005,
 };
 
+static inline bool mmu_is_64bit(powerpc_mmu_t mmu_model)
+{
+    return mmu_model & POWERPC_MMU_64;
+}
+
 /*****************************************************************************/
 /* Exception model                                                           */
 typedef enum powerpc_excp_t powerpc_excp_t;
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 74f987080f..85de7e6c90 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -266,7 +266,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
      */
     if (excp == POWERPC_EXCP_HV_EMU
 #if defined(TARGET_PPC64)
-        && !((env->mmu_model & POWERPC_MMU_64) && (env->msr_mask & MSR_HVB))
+        && !(mmu_is_64bit(env->mmu_model) && (env->msr_mask & MSR_HVB))
 #endif /* defined(TARGET_PPC64) */
 
     ) {
@@ -824,7 +824,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             vector = (uint32_t)vector;
         }
     } else {
-        if (!msr_isf && !(env->mmu_model & POWERPC_MMU_64)) {
+        if (!msr_isf && !mmu_is_64bit(env->mmu_model)) {
             vector = (uint32_t)vector;
         } else {
             new_msr |= (target_ulong)1 << MSR_SF;
diff --git a/target/ppc/machine.c b/target/ppc/machine.c
index c38e7b1268..d9d911b9b1 100644
--- a/target/ppc/machine.c
+++ b/target/ppc/machine.c
@@ -550,7 +550,7 @@ static bool sr_needed(void *opaque)
 #ifdef TARGET_PPC64
     PowerPCCPU *cpu = opaque;
 
-    return !(cpu->env.mmu_model & POWERPC_MMU_64);
+    return !mmu_is_64bit(cpu->env.mmu_model);
 #else
     return true;
 #endif
@@ -606,7 +606,7 @@ static bool slb_needed(void *opaque)
     PowerPCCPU *cpu = opaque;
 
     /* We don't support any of the old segment table based 64-bit CPUs */
-    return cpu->env.mmu_model & POWERPC_MMU_64;
+    return mmu_is_64bit(cpu->env.mmu_model);
 }
 
 static int slb_post_load(void *opaque, int version_id)
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 1b1248fc90..0fabc10302 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1140,7 +1140,7 @@ void ppc_hash64_init(PowerPCCPU *cpu)
     PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
 
     if (!pcc->hash64_opts) {
-        assert(!(env->mmu_model & POWERPC_MMU_64));
+        assert(!mmu_is_64bit(env->mmu_model));
         return;
     }
 
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 9f22b66ea9..ca88658cba 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -2002,7 +2002,7 @@ void helper_store_601_batl(CPUPPCState *env, uint32_t nr, target_ulong value)
 void ppc_tlb_invalidate_all(CPUPPCState *env)
 {
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         env->tlb_need_flush = 0;
         tlb_flush(env_cpu(env));
     } else
@@ -2046,7 +2046,7 @@ void ppc_tlb_invalidate_one(CPUPPCState *env, target_ulong addr)
 #if !defined(FLUSH_ALL_TLBS)
     addr &= TARGET_PAGE_MASK;
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         /* tlbie invalidate TLBs for all segments */
         /*
          * XXX: given the fact that there are too many segments to invalidate,
@@ -2091,7 +2091,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value)
     qemu_log_mask(CPU_LOG_MMU, "%s: " TARGET_FMT_lx "\n", __func__, value);
     assert(!cpu->vhyp);
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         target_ulong sdr_mask = SDR_64_HTABORG | SDR_64_HTABSIZE;
         target_ulong htabsize = value & SDR_64_HTABSIZE;
 
@@ -2144,7 +2144,7 @@ void ppc_store_ptcr(CPUPPCState *env, target_ulong value)
 target_ulong helper_load_sr(CPUPPCState *env, target_ulong sr_num)
 {
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         /* XXX */
         return 0;
     }
@@ -2158,7 +2158,7 @@ void helper_store_sr(CPUPPCState *env, target_ulong srnum, target_ulong value)
             "%s: reg=%d " TARGET_FMT_lx " " TARGET_FMT_lx "\n", __func__,
             (int)srnum, value, env->sr[srnum]);
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         PowerPCCPU *cpu = env_archcpu(env);
         uint64_t esid, vsid;
 
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index e68dd65ad3..0984ce637b 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7892,7 +7892,7 @@ static void ppc_tr_init_disas_context(DisasContextBase *dcbase, CPUState *cs)
     ctx->insns_flags = env->insns_flags;
     ctx->insns_flags2 = env->insns_flags2;
     ctx->access_type = -1;
-    ctx->need_access_type = !(env->mmu_model & POWERPC_MMU_64);
+    ctx->need_access_type = !mmu_is_64bit(env->mmu_model);
     ctx->le_mode = !!(env->hflags & (1 << MSR_LE));
     ctx->default_tcg_memop_mask = ctx->le_mode ? MO_LE : MO_BE;
     ctx->flags = env->flags;
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index e4082cfde7..a4d0038828 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10671,7 +10671,7 @@ static void ppc_cpu_reset(DeviceState *dev)
 #endif
 
 #if defined(TARGET_PPC64)
-    if (env->mmu_model & POWERPC_MMU_64) {
+    if (mmu_is_64bit(env->mmu_model)) {
         msr |= (1ULL << MSR_SF);
     }
 #endif
-- 
2.29.2


