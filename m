Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6428F3AE97C
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 14:57:15 +0200 (CEST)
Received: from localhost ([::1]:49152 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJUI-0002fn-DJ
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 08:57:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41864)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQ6-0007Yc-1e; Mon, 21 Jun 2021 08:52:54 -0400
Received: from [201.28.113.2] (port=47857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQ4-0004nA-6X; Mon, 21 Jun 2021 08:52:53 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 09:51:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id 6EF48800055;
 Mon, 21 Jun 2021 09:51:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 02/10] target/ppc: Use MMUAccessType with *_handle_mmu_fault
Date: Mon, 21 Jun 2021 09:51:07 -0300
Message-Id: <20210621125115.67717-3-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 Jun 2021 12:51:39.0586 (UTC)
 FILETIME=[2D8CEA20:01D7669C]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 201.28.113.2 (failed)
Received-SPF: pass client-ip=201.28.113.2;
 envelope-from=bruno.larsen@eldorado.org.br; helo=outlook.eldorado.org.br
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
Cc: farosas@linux.ibm.com, Richard Henderson <richard.henderson@linaro.org>,
 luis.pires@eldorado.org.br, Greg Kurz <groug@kaod.org>,
 lucas.araujo@eldorado.org.br, fernando.valle@eldorado.org.br,
 qemu-ppc@nongnu.org, clg@kaod.org, matheus.ferst@eldorado.org.br,
 david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These changes were waiting until we didn't need to match
the function type of PowerPCCPUClass.handle_mmu_fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-hash32.c  | 7 ++-----
 target/ppc/mmu-hash32.h  | 4 ++--
 target/ppc/mmu-hash64.c  | 6 +-----
 target/ppc/mmu-hash64.h  | 4 ++--
 target/ppc/mmu-radix64.c | 7 ++-----
 target/ppc/mmu-radix64.h | 4 ++--
 6 files changed, 11 insertions(+), 21 deletions(-)

diff --git a/target/ppc/mmu-hash32.c b/target/ppc/mmu-hash32.c
index 9f0a497657..8f19b43e47 100644
--- a/target/ppc/mmu-hash32.c
+++ b/target/ppc/mmu-hash32.c
@@ -415,8 +415,8 @@ static hwaddr ppc_hash32_pte_raddr(target_ulong sr, ppc_hash_pte32_t pte,
     return (rpn & ~mask) | (eaddr & mask);
 }
 
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                int mmu_idx)
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -425,11 +425,8 @@ int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
     ppc_hash_pte32_t pte;
     int prot;
     int need_prot;
-    MMUAccessType access_type;
     hwaddr raddr;
 
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
     need_prot = prot_for_access_type(access_type);
 
     /* 1. Handle real mode accesses */
diff --git a/target/ppc/mmu-hash32.h b/target/ppc/mmu-hash32.h
index 898021f0d8..30e35718a7 100644
--- a/target/ppc/mmu-hash32.h
+++ b/target/ppc/mmu-hash32.h
@@ -5,8 +5,8 @@
 
 hwaddr get_pteg_offset32(PowerPCCPU *cpu, hwaddr hash);
 hwaddr ppc_hash32_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
-                                int mmu_idx);
+int ppc_hash32_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
+                                MMUAccessType access_type, int mmu_idx);
 
 /*
  * Segment register definitions
diff --git a/target/ppc/mmu-hash64.c b/target/ppc/mmu-hash64.c
index 708dffc31b..2febd369b1 100644
--- a/target/ppc/mmu-hash64.c
+++ b/target/ppc/mmu-hash64.c
@@ -874,7 +874,7 @@ static int build_vrma_slbe(PowerPCCPU *cpu, ppc_slb_t *slb)
 }
 
 int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
-                                int rwx, int mmu_idx)
+                                MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
@@ -884,13 +884,9 @@ int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr ptex;
     ppc_hash_pte64_t pte;
     int exec_prot, pp_prot, amr_prot, prot;
-    MMUAccessType access_type;
     int need_prot;
     hwaddr raddr;
 
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
-
     /*
      * Note on LPCR usage: 970 uses HID4, but our special variant of
      * store_spr copies relevant fields into env->spr[SPR_LPCR].
diff --git a/target/ppc/mmu-hash64.h b/target/ppc/mmu-hash64.h
index 4b8b8e7950..3e8a8eec1f 100644
--- a/target/ppc/mmu-hash64.h
+++ b/target/ppc/mmu-hash64.h
@@ -8,8 +8,8 @@ void dump_slb(PowerPCCPU *cpu);
 int ppc_store_slb(PowerPCCPU *cpu, target_ulong slot,
                   target_ulong esid, target_ulong vsid);
 hwaddr ppc_hash64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
-int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address, int rw,
-                                int mmu_idx);
+int ppc_hash64_handle_mmu_fault(PowerPCCPU *cpu, vaddr address,
+                                MMUAccessType access_type, int mmu_idx);
 void ppc_hash64_tlb_flush_hpte(PowerPCCPU *cpu,
                                target_ulong pte_index,
                                target_ulong pte0, target_ulong pte1);
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index b6d191c1d8..1c707d387d 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -555,19 +555,16 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
     return 0;
 }
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                 int mmu_idx)
+int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                 MMUAccessType access_type, int mmu_idx)
 {
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     int page_size, prot;
     bool relocation;
-    MMUAccessType access_type;
     hwaddr raddr;
 
     assert(!(msr_hv && cpu->vhyp));
-    assert((rwx == 0) || (rwx == 1) || (rwx == 2));
-    access_type = rwx;
 
     relocation = (access_type == MMU_INST_FETCH ? msr_ir : msr_dr);
     /* HV or virtual hypervisor Real Mode Access */
diff --git a/target/ppc/mmu-radix64.h b/target/ppc/mmu-radix64.h
index f28c5794d0..94bd72cb38 100644
--- a/target/ppc/mmu-radix64.h
+++ b/target/ppc/mmu-radix64.h
@@ -44,8 +44,8 @@
 
 #ifdef TARGET_PPC64
 
-int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr, int rwx,
-                                 int mmu_idx);
+int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
+                                 MMUAccessType access_type, int mmu_idx);
 hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong addr);
 
 static inline int ppc_radix64_get_prot_eaa(uint64_t pte)
-- 
2.17.1


