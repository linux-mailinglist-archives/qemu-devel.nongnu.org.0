Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5366F611A39
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 20:38:08 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooUDg-0003Gh-7n; Fri, 28 Oct 2022 14:36:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ooUDe-0003GI-OF; Fri, 28 Oct 2022 14:36:38 -0400
Received: from [200.168.210.66] (helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <leandro.lupori@eldorado.org.br>)
 id 1ooUDb-0004sB-Qh; Fri, 28 Oct 2022 14:36:38 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 28 Oct 2022 15:36:29 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id C8A65800094;
 Fri, 28 Oct 2022 15:36:28 -0300 (-03)
From: Leandro Lupori <leandro.lupori@eldorado.org.br>
To: qemu-ppc@nongnu.org,
	qemu-devel@nongnu.org
Cc: danielhb413@gmail.com, clg@kaod.org, david@gibson.dropbear.id.au,
 groug@kaod.org, Leandro Lupori <leandro.lupori@eldorado.org.br>,
 Victor Colombo <victor.colombo@eldorado.org.br>
Subject: [PATCH] target/ppc: Fix regression in Radix MMU
Date: Fri, 28 Oct 2022 15:36:17 -0300
Message-Id: <20221028183617.121786-1-leandro.lupori@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-OriginalArrivalTime: 28 Oct 2022 18:36:29.0356 (UTC)
 FILETIME=[31ADC6C0:01D8EAFC]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=leandro.lupori@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Commit 47e83d9107 ended up unintentionally changing the control flow
of ppc_radix64_process_scoped_xlate(). When guest_visible is false,
it must not raise an exception, even if the radix configuration is
not valid.

This regression prevented Linux boot in a nested environment with
L1 using TCG and emulating KVM (cap-nested-hv=on) and L2 using
KVM. L2 would hang on Linux's futex_init(), when it tested how a
futex_atomic_cmpxchg_inatomic() handled a fault, because L1 would
start a loop of trying to perform partition scoped translations
and raising exceptions.

Fixes: 47e83d9107 ("target/ppc: Improve Radix xlate level validation")
Reported-by: Victor Colombo <victor.colombo@eldorado.org.br>
Signed-off-by: Leandro Lupori <leandro.lupori@eldorado.org.br>
---
 target/ppc/mmu-radix64.c | 28 ++++++++++++++++++++--------
 1 file changed, 20 insertions(+), 8 deletions(-)

diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index 00f2e9fa2e..171379db69 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -238,6 +238,8 @@ static void ppc_radix64_set_rc(PowerPCCPU *cpu, MMUAccessType access_type,
 
 static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
 {
+    bool ret;
+
     /*
      * Check if this is a valid level, according to POWER9 and POWER10
      * Processor User's Manuals, sections 4.10.4.1 and 5.10.6.1, respectively:
@@ -249,16 +251,24 @@ static bool ppc_radix64_is_valid_level(int level, int psize, uint64_t nls)
      */
     switch (level) {
     case 0:     /* Root Page Dir */
-        return psize == 52 && nls == 13;
+        ret = psize == 52 && nls == 13;
+        break;
     case 1:
     case 2:
-        return nls == 9;
+        ret = nls == 9;
+        break;
     case 3:
-        return nls == 9 || nls == 5;
+        ret = nls == 9 || nls == 5;
+        break;
     default:
-        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix level: %d\n", level);
-        return false;
+        ret = false;
+    }
+
+    if (unlikely(!ret)) {
+        qemu_log_mask(LOG_GUEST_ERROR, "invalid radix configuration: "
+                      "level %d size %d nls %ld\n", level, psize, nls);
     }
+    return ret;
 }
 
 static int ppc_radix64_next_level(AddressSpace *as, vaddr eaddr,
@@ -519,11 +529,13 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
 
             if (!ppc_radix64_is_valid_level(level++, *g_page_size, nls)) {
                 fault_cause |= DSISR_R_BADCONFIG;
-                return 1;
+                ret = 1;
+            } else {
+                ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK,
+                                             &h_raddr, &nls, g_page_size,
+                                             &pte, &fault_cause);
             }
 
-            ret = ppc_radix64_next_level(cs->as, eaddr & R_EADDR_MASK, &h_raddr,
-                                         &nls, g_page_size, &pte, &fault_cause);
             if (ret) {
                 /* No valid pte */
                 if (guest_visible) {
-- 
2.25.1


