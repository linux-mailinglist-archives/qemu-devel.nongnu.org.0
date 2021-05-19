Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86DCA388E78
	for <lists+qemu-devel@lfdr.de>; Wed, 19 May 2021 14:58:15 +0200 (CEST)
Received: from localhost ([::1]:41482 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ljLmA-0002cO-KN
	for lists+qemu-devel@lfdr.de; Wed, 19 May 2021 08:58:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33058)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgY-0000YQ-GM; Wed, 19 May 2021 08:52:26 -0400
Received: from ozlabs.org ([203.11.71.1]:53117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ljLgW-00017V-D5; Wed, 19 May 2021 08:52:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FlXnX3n7bz9sXb; Wed, 19 May 2021 22:52:00 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1621428720;
 bh=cp94RMxdRnL1gmIniTu0xmX7fpO39+otKZIehCuWm/4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=CBsRuTtcj2364Bi0URSl5FUYPf0pQdr2oDygHTg1pHEpzCil+2VwJlNMisMxMjv/w
 LVlGAlQLQ7LAsUdjw0+fklTyHeqwbdEd+Nx2OQTSPxs/PJLFF9IEpSD3M8s3N1VsB5
 vT8qq8TtwU21GIhOLQ3e97LieuOsyw3N/JM54FoY=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 08/48] target/ppc: moved ppc_store_lpcr to misc_helper.c
Date: Wed, 19 May 2021 22:51:08 +1000
Message-Id: <20210519125148.27720-9-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210519125148.27720-1-david@gibson.dropbear.id.au>
References: <20210519125148.27720-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
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
Cc: richard.henderson@linaro.org,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>

Moved the function ppc_store from mmu-hash64.c to misc_helper.c and the
prototype from mmu-hash64.h to cpu.h as it is a more appropriate place,
but it will have to have its implementation moved to a new file as
misc_helper.c should not be compiled in a !TCG environment.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
Message-Id: <20210506163941.106984-4-lucas.araujo@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/cpu.h         |  1 +
 target/ppc/misc_helper.c | 10 ++++++++++
 target/ppc/mmu-hash64.c  | 10 ----------
 target/ppc/mmu-hash64.h  |  1 -
 4 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 733a2168c4..a976e7f7b0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -1297,6 +1297,7 @@ void ppc_store_sdr1(CPUPPCState *env, target_ulong value);
 void ppc_store_ptcr(CPUPPCState *env, target_ulong value);
 #endif /* !defined(CONFIG_USER_ONLY) */
 void ppc_store_msr(CPUPPCState *env, target_ulong value);
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 
 void ppc_cpu_list(void);
 
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 002958be26..08a31da289 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -261,6 +261,16 @@ void ppc_store_msr(CPUPPCState *env, target_ulong value)
     hreg_store_msr(env, value, 0);
 }
 
+void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
+{
+    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
+    CPUPPCState *env = &cpu->env;
+
+    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
+    /* The gtse bit affects hflags */
+    hreg_compute_hflags(env);
+}
+
 /*
  * This code is lifted from MacOnLinux. It is called whenever THRM1,2
  * or 3 is read an fixes up the values in such a way that will make
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index be3596f27b..c4a4bc7cd2 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -1120,16 +1120,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu, target_ulong ptex,
     cpu->env.tlb_need_flush = TLB_NEED_GLOBAL_FLUSH | TLB_NEED_LOCAL_FLUSH;
 }
 
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val)
-{
-    PowerPCCPUClass *pcc = POWERPC_CPU_GET_CLASS(cpu);
-    CPUPPCState *env = &cpu->env;
-
-    env->spr[SPR_LPCR] = val & pcc->lpcr_mask;
-    /* The gtse bit affects hflags */
-    hreg_compute_hflags(env);
-}
-
 void helper_store_lpcr(CPUPPCState *env, target_ulong val)
 {
     PowerPCCPU *cpu = env_archcpu(env);
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 5dfd7f8b93..4b8b8e7950 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -15,7 +15,6 @@ void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte0, target_ulong pte1);
 unsigned ppc_hash64_hpte_page_shift_noslb(PowerPCCPU *cpu,
                                           uint64_t pte0, uint64_t pte1);
-void ppc_store_lpcr(PowerPCCPU *cpu, target_ulong val);
 void ppc_hash64_init(PowerPCCPU *cpu);
 void ppc_hash64_finalize(PowerPCCPU *cpu);
 #endif
-- 
2.31.1


