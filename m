Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9A3AE99A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Jun 2021 15:03:25 +0200 (CEST)
Received: from localhost ([::1]:33698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lvJaG-00033Y-GA
	for lists+qemu-devel@lfdr.de; Mon, 21 Jun 2021 09:03:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41936)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQB-0007oj-LB; Mon, 21 Jun 2021 08:52:59 -0400
Received: from [201.28.113.2] (port=47857 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <bruno.larsen@eldorado.org.br>)
 id 1lvJQA-0004nA-11; Mon, 21 Jun 2021 08:52:59 -0400
Received: from power9a ([10.10.71.235]) by outlook.eldorado.org.br with
 Microsoft SMTPSVC(8.5.9600.16384); Mon, 21 Jun 2021 09:51:39 -0300
Received: from eldorado.org.br (unknown [10.10.71.235])
 by power9a (Postfix) with ESMTP id C0679800055;
 Mon, 21 Jun 2021 09:51:39 -0300 (-03)
From: "Bruno Larsen (billionai)" <bruno.larsen@eldorado.org.br>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 04/10] target/ppc: Use bool success for ppc_radix64_xlate
Date: Mon, 21 Jun 2021 09:51:09 -0300
Message-Id: <20210621125115.67717-5-bruno.larsen@eldorado.org.br>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
References: <20210621125115.67717-1-bruno.larsen@eldorado.org.br>
X-OriginalArrivalTime: 21 Jun 2021 12:51:39.0898 (UTC)
 FILETIME=[2DBC85A0:01D7669C]
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

Instead of returning non-zero for failure, return true for success.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/mmu-radix64.c | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index dd5ae69052..2d5f0850c9 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -463,10 +463,10 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
  *              | = On        | Process Scoped |    Scoped     |
  *              +-------------+----------------+---------------+
  */
-static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
-                             MMUAccessType access_type,
-                             hwaddr *raddr, int *psizep, int *protp,
-                             bool guest_visible)
+static bool ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
+                              MMUAccessType access_type,
+                              hwaddr *raddr, int *psizep, int *protp,
+                              bool guest_visible)
 {
     CPUPPCState *env = &cpu->env;
     uint64_t lpid, pid;
@@ -492,7 +492,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         }
         *protp = PAGE_READ | PAGE_WRITE | PAGE_EXEC;
         *psizep = TARGET_PAGE_BITS;
-        return 0;
+        return true;
     }
 
     /*
@@ -510,7 +510,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         if (guest_visible) {
             ppc_radix64_raise_segi(cpu, access_type, eaddr);
         }
-        return 1;
+        return false;
     }
 
     /* Get Process Table */
@@ -523,13 +523,13 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
             if (guest_visible) {
                 ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_NOPTE);
             }
-            return 1;
+            return false;
         }
         if (!validate_pate(cpu, lpid, &pate)) {
             if (guest_visible) {
                 ppc_radix64_raise_si(cpu, access_type, eaddr, DSISR_R_BADCONFIG);
             }
-            return 1;
+            return false;
         }
     }
 
@@ -549,7 +549,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                                                    pate, &g_raddr, &prot,
                                                    &psize, guest_visible);
         if (ret) {
-            return ret;
+            return false;
         }
         *psizep = MIN(*psizep, psize);
         *protp &= prot;
@@ -573,7 +573,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
                                                      &prot, &psize, false,
                                                      guest_visible);
             if (ret) {
-                return ret;
+                return false;
             }
             *psizep = MIN(*psizep, psize);
             *protp &= prot;
@@ -582,7 +582,7 @@ static int ppc_radix64_xlate(PowerPCCPU *cpu, vaddr eaddr,
         }
     }
 
-    return 0;
+    return true;
 }
 
 int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
@@ -593,8 +593,8 @@ int ppc_radix64_handle_mmu_fault(PowerPCCPU *cpu, vaddr eaddr,
     hwaddr raddr;
 
     /* Translate eaddr to raddr (where raddr is addr qemu needs for access) */
-    if (ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
-                          &page_size, &prot, true)) {
+    if (!ppc_radix64_xlate(cpu, eaddr, access_type, &raddr,
+                           &page_size, &prot, true)) {
         return 1;
     }
 
@@ -608,8 +608,8 @@ hwaddr ppc_radix64_get_phys_page_debug(PowerPCCPU *cpu, target_ulong eaddr)
     int psize, prot;
     hwaddr raddr;
 
-    if (ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
-                          &psize, &prot, false)) {
+    if (!ppc_radix64_xlate(cpu, eaddr, MMU_DATA_LOAD, &raddr,
+                           &psize, &prot, false)) {
         return -1;
     }
 
-- 
2.17.1


