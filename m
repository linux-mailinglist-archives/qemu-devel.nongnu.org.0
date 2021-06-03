Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 16C45399CB9
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:38:50 +0200 (CEST)
Received: from localhost ([::1]:42860 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loisL-000326-3h
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidU-0007Ws-Bh; Thu, 03 Jun 2021 04:23:28 -0400
Received: from bilbo.ozlabs.org ([203.11.71.1]:38323 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidS-0000C3-Jo; Thu, 03 Jun 2021 04:23:28 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5p0GjWz9t10; Thu,  3 Jun 2021 18:22:37 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708558;
 bh=7XCyyicopD+KliJrC1vNXiyCbu18JV5HsK9uW6aFv/c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=SrxOWavA/bm6+0vdiTDD5QiUhcQCIKb7WCGCuGTJSYJ3un/cxhSv9DVUDzp8CCx/q
 nHHvzGP4ZoozNg8ym7xJU46TugMmYkoDLZ9S64gdgqlYax8aOVOnX/WlYWPo0OzzO3
 PEPEiX8a+nmxd+kLWkXoDylk6NtIS3sMbPmwn5bE=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 25/42] target/ppc: powerpc_excp: Move lpes code to where it is
 used
Date: Thu,  3 Jun 2021 18:22:14 +1000
Message-Id: <20210603082231.601214-26-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=203.11.71.1; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.249,
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
 qemu-devel@nongnu.org, Fabiano Rosas <farosas@linux.ibm.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Fabiano Rosas <farosas@linux.ibm.com>

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210601214649.785647-2-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 47 +++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 22 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 04418054f5..5ea8503b46 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -333,7 +333,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
     int srr0, srr1, asrr0, asrr1, lev = -1;
-    bool lpes0;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
                   " => %08x (%02x)\n", env->nip, excp, env->error_code);
@@ -365,27 +364,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         excp = powerpc_reset_wakeup(cs, env, excp, &msr);
     }
 
-    /*
-     * Exception targeting modifiers
-     *
-     * LPES0 is supported on POWER7/8/9
-     * LPES1 is not supported (old iSeries mode)
-     *
-     * On anything else, we behave as if LPES0 is 1
-     * (externals don't alter MSR:HV)
-     */
-#if defined(TARGET_PPC64)
-    if (excp_model == POWERPC_EXCP_POWER7 ||
-        excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9 ||
-        excp_model == POWERPC_EXCP_POWER10) {
-        lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-    } else
-#endif /* defined(TARGET_PPC64) */
-    {
-        lpes0 = true;
-    }
-
     /*
      * Hypervisor emulation assistance interrupt only exists on server
      * arch 2.05 server or later. We also don't want to generate it if
@@ -473,8 +451,32 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         msr |= env->error_code;
         break;
     case POWERPC_EXCP_EXTERNAL:  /* External input                           */
+    {
+        bool lpes0;
+
         cs = CPU(cpu);
 
+        /*
+         * Exception targeting modifiers
+         *
+         * LPES0 is supported on POWER7/8/9
+         * LPES1 is not supported (old iSeries mode)
+         *
+         * On anything else, we behave as if LPES0 is 1
+         * (externals don't alter MSR:HV)
+         */
+#if defined(TARGET_PPC64)
+        if (excp_model == POWERPC_EXCP_POWER7 ||
+            excp_model == POWERPC_EXCP_POWER8 ||
+            excp_model == POWERPC_EXCP_POWER9 ||
+            excp_model == POWERPC_EXCP_POWER10) {
+            lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+        } else
+#endif /* defined(TARGET_PPC64) */
+        {
+            lpes0 = true;
+        }
+
         if (!lpes0) {
             new_msr |= (target_ulong)MSR_HVB;
             new_msr |= env->msr & ((target_ulong)1 << MSR_RI);
@@ -486,6 +488,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             env->spr[SPR_BOOKE_EPR] = ldl_phys(cs->as, env->mpic_iack);
         }
         break;
+    }
     case POWERPC_EXCP_ALIGN:     /* Alignment exception                      */
         /* Get rS/rD and rA from faulting opcode */
         /*
-- 
2.31.1


