Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A13CA3C1EE3
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:26:56 +0200 (CEST)
Received: from localhost ([::1]:59834 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j2N-0000WT-MX
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:26:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itd-0000xL-03; Fri, 09 Jul 2021 01:17:53 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:40195 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1itb-0001w6-3e; Fri, 09 Jul 2021 01:17:52 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHd3YwGz9sfR; Fri,  9 Jul 2021 15:17:33 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807853;
 bh=W1hgkBfntpE0AVG54dGL+htM4AdTKAwQqPJZRbk5Sfg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Un/gFhqHayno7RWrnNUV6AvenIsHKERR5avajE2uMAQBkRuFR7IRpO/I3vn7PesPm
 OAD9r3gaXU7QvuV4R87sXJmdJ0jy8lojTCgLzI4imQTRIMoElRi63UajDf1967zWq8
 YFyMnGNSwd8RhnsqOkMI8jcWNYOiV8zpbwWZtK1I=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 07/33] target/ppc: Use bool success for ppc_radix64_xlate
Date: Fri,  9 Jul 2021 15:17:02 +1000
Message-Id: <20210709051728.170203-8-david@gibson.dropbear.id.au>
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

Instead of returning non-zero for failure, return true for success.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20210621125115.67717-5-bruno.larsen@eldorado.org.br>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
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
2.31.1


