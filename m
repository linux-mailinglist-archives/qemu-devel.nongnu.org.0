Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E28773725E4
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 08:41:06 +0200 (CEST)
Received: from localhost ([::1]:49684 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ldojx-0002bb-VW
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 02:41:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60712)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0X-0006C9-Qi; Tue, 04 May 2021 01:54:09 -0400
Received: from ozlabs.org ([203.11.71.1]:46407)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1ldo0V-00055Z-MI; Tue, 04 May 2021 01:54:09 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4FZ8CN1mXKz9t0G; Tue,  4 May 2021 15:53:19 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1620107600;
 bh=kHU+IpRVWH4mT4/KamL8kAx2HykZRBjU4mtZkvOiTis=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GDCCToeXnnmKNOemjdgNoP6OFGUj0fWJBPbqtE5P4Qj2Gn866aJV1n7lkdSQHfKOB
 Br/vHD1kiF9W7scyv8/W16FhN3gpGZxqVV29vl8tBHzR0OKriw5uxqvQS0hIQXvb7k
 Y9MdOSp5gjS8JjbwXdrM9OLLOMj9r76iiU608IZs=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 31/46] target/ppc: Fix POWER9 radix guest HV interrupt AIL
 behaviour
Date: Tue,  4 May 2021 15:52:57 +1000
Message-Id: <20210504055312.306823-32-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210504055312.306823-1-david@gibson.dropbear.id.au>
References: <20210504055312.306823-1-david@gibson.dropbear.id.au>
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
Cc: David Gibson <david@gibson.dropbear.id.au>, qemu-ppc@nongnu.org,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Nicholas Piggin <npiggin@gmail.com>

ISA v3.0 radix guest execution has a quirk in AIL behaviour such that
the LPCR[AIL] value can apply to hypervisor interrupts.

This affects machines that emulate HV=1 mode (i.e., powernv9).

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
Message-Id: <20210415054227.1793812-2-npiggin@gmail.com>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5c95e0c103..344af66f66 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -791,14 +791,23 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
 
     /*
-     * AIL only works if there is no HV transition and we are running
-     * with translations enabled
+     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
      */
-    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1) ||
-        ((new_msr & MSR_HVB) && !(msr & MSR_HVB))) {
+    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
         ail = 0;
     }
 
+    /*
+     * AIL does not work if there is a MSR[HV] 0->1 transition and the
+     * partition is in HPT mode. For radix guests, such interrupts are
+     * allowed to be delivered to the hypervisor in ail mode.
+     */
+    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
+        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
+            ail = 0;
+        }
+    }
+
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
-- 
2.31.1


