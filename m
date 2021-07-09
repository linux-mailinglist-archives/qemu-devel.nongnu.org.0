Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6C133C1EDB
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:23:38 +0200 (CEST)
Received: from localhost ([::1]:51450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1izB-0002BN-My
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:23:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35096)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itc-0000wx-Sh; Fri, 09 Jul 2021 01:17:52 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:51417 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1ita-0001vm-QO; Fri, 09 Jul 2021 01:17:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd1x3Lz9sXM; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=74urRj6f055VnsLsqp8XF+lYeV+epmK/BmGaLFdYfYQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=T7EZCNIqCOrFPw9+pTzkohv422HlrnDEeqTRAkKyqnGsIhubUQp3RmiAjTNTT2TaT
 B4vsEofpSZ1LQRgRFXBKkYpVkvxkb58CmvlsdsVxS2kPk/BNOjfyPM7n94HJCNAMcb
 WAZu6TNvqcZEpbjXl8b/YrBl2XjhsIgwFcFfH24I=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 05/33] target/ppc: Use MMUAccessType with *_handle_mmu_fault
Date: Fri,  9 Jul 2021 15:17:00 +1000
Message-Id: <20210709051728.170203-6-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, Richard Henderson <richard.henderson@linaro.org>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Richard Henderson <richard.henderson@linaro.org>

These changes were waiting until we didn't need to match
the function type of PowerPCCPUClass.handle_mmu_fault.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621125115.67717-3-bruno.larsen@eldorado.org.br>
Reviewed-by: Greg Kurz <groug@kaod.org>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


