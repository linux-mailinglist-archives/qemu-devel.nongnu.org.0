Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1EED5E767F
	for <lists+qemu-devel@lfdr.de>; Fri, 23 Sep 2022 11:09:30 +0200 (CEST)
Received: from localhost ([::1]:52272 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1obega-0005Rp-VU
	for lists+qemu-devel@lfdr.de; Fri, 23 Sep 2022 05:09:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56504)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeMK-00059N-Dw; Fri, 23 Sep 2022 04:48:35 -0400
Received: from gandalf.ozlabs.org ([150.107.74.76]:57019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org>)
 id 1obeME-0005Lt-T7; Fri, 23 Sep 2022 04:48:30 -0400
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
 by gandalf.ozlabs.org (Postfix) with ESMTP id 4MYm5N04WGz4xGg;
 Fri, 23 Sep 2022 18:48:24 +1000 (AEST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by mail.ozlabs.org (Postfix) with ESMTPSA id 4MYm5K3NT2z4xGN;
 Fri, 23 Sep 2022 18:48:21 +1000 (AEST)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PATCH 4/6] cputlb: used cached CPUClass in our hot-paths
Date: Fri, 23 Sep 2022 10:48:01 +0200
Message-Id: <20220923084803.498337-5-clg@kaod.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20220923084803.498337-1-clg@kaod.org>
References: <20220923084803.498337-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=150.107.74.76;
 envelope-from=SRS0=gbDQ=Z2=kaod.org=clg@ozlabs.org; helo=gandalf.ozlabs.org
X-Spam_score_int: -16
X-Spam_score: -1.7
X-Spam_bar: -
X-Spam_report: (-1.7 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alex Bennée <alex.bennee@linaro.org>

Before: 35.912 s ±  0.168 s
  After: 35.565 s ±  0.087 s

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220811151413.3350684-5-alex.bennee@linaro.org>
Signed-off-by: Cédric Le Goater <clg@kaod.org>
---
 accel/tcg/cputlb.c | 15 ++++++---------
 1 file changed, 6 insertions(+), 9 deletions(-)

diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index 8fad2d9b83cd..193bfc1cfc14 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1291,15 +1291,14 @@ void tlb_set_page(CPUState *cpu, target_ulong vaddr,
 static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
                      MMUAccessType access_type, int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
     bool ok;
 
     /*
      * This is not a probe, so only valid return is success; failure
      * should result in exception + longjmp to the cpu loop.
      */
-    ok = cc->tcg_ops->tlb_fill(cpu, addr, size,
-                               access_type, mmu_idx, false, retaddr);
+    ok = cpu->cc->tcg_ops->tlb_fill(cpu, addr, size,
+                                    access_type, mmu_idx, false, retaddr);
     assert(ok);
 }
 
@@ -1307,9 +1306,8 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
                                         MMUAccessType access_type,
                                         int mmu_idx, uintptr_t retaddr)
 {
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+    cpu->cc->tcg_ops->do_unaligned_access(cpu, addr, access_type,
+                                          mmu_idx, retaddr);
 }
 
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
@@ -1539,10 +1537,9 @@ static int probe_access_internal(CPUArchState *env, target_ulong addr,
     if (!tlb_hit_page(tlb_addr, page_addr)) {
         if (!victim_tlb_hit(env, mmu_idx, index, elt_ofs, page_addr)) {
             CPUState *cs = env_cpu(env);
-            CPUClass *cc = CPU_GET_CLASS(cs);
 
-            if (!cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
-                                       mmu_idx, nonfault, retaddr)) {
+            if (!cs->cc->tcg_ops->tlb_fill(cs, addr, fault_size, access_type,
+                                           mmu_idx, nonfault, retaddr)) {
                 /* Non-faulting page table read failed.  */
                 *phost = NULL;
                 return TLB_INVALID_MASK;
-- 
2.37.3


