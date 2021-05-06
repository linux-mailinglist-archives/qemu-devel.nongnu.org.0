Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AB083758F3
	for <lists+qemu-devel@lfdr.de>; Thu,  6 May 2021 19:08:43 +0200 (CEST)
Received: from localhost ([::1]:42802 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lehUQ-0006sL-49
	for lists+qemu-devel@lfdr.de; Thu, 06 May 2021 13:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44464)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh2x-0004qT-JO; Thu, 06 May 2021 12:40:23 -0400
Received: from [201.28.113.2] (port=23611 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <lucas.araujo@eldorado.org.br>)
 id 1leh2v-0001sf-9G; Thu, 06 May 2021 12:40:18 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Thu, 6 May 2021 13:39:52 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id F231D800E42;
 Thu,  6 May 2021 13:39:51 -0300 (-03)
From: "Lucas Mateus Castro (alqotel)" <lucas.araujo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v3 3/4] target/ppc: moved ppc_store_lpcr to misc_helper.c
Date: Thu,  6 May 2021 13:39:40 -0300
Message-Id: <20210506163941.106984-4-lucas.araujo@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
References: <20210506163941.106984-1-lucas.araujo@eldorado.org.br>
X-OriginalArrivalTime: 06 May 2021 16:39:52.0168 (UTC)
 FILETIME=[6FF69E80:01D74296]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=lucas.araujo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Cc: bruno.larsen@eldorado.org.br,
 "Lucas Mateus Castro \(alqotel\)" <lucas.araujo@eldorado.org.br>,
 farosas@linux.ibm.com, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moved the function ppc_store from mmu-hash64.c to misc_helper.c and the
prototype from mmu-hash64.h to cpu.h as it is a more appropriate place,
but it will have to have its implementation moved to a new file as
misc_helper.c should not be compiled in a !TCG environment.

Signed-off-by: Lucas Mateus Castro (alqotel) <lucas.araujo@eldorado.org.br>
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
2.17.1


