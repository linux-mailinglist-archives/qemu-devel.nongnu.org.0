Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6060A399CBA
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Jun 2021 10:38:51 +0200 (CEST)
Received: from localhost ([::1]:42972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1loisM-000365-Co
	for lists+qemu-devel@lfdr.de; Thu, 03 Jun 2021 04:38:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loida-0007gI-BG; Thu, 03 Jun 2021 04:23:36 -0400
Received: from bilbo.ozlabs.org ([2401:3900:2:1::2]:53305 helo=ozlabs.org)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1loidW-0000G1-S0; Thu, 03 Jun 2021 04:23:34 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4Fwf5p432Gz9t1r; Thu,  3 Jun 2021 18:22:38 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1622708558;
 bh=OL8anpbvcwrlrNWVj1Sfzf402aUXv92xHzon4EhJ+n4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hWtfPmholyKUUXcsRGNvDaE/ZIhzbebgojU+Opgs3i9vhDq3ByX/PdXYOTfImbxDW
 7+nl6zGwjw9snSCvYSX03S/wXSnwc9VmvKX5aUlA4w9QX0TZ57jzbGsQDjmmI52hpr
 +mHAx2IyntcYgV7KmDw+tmKwKtllKhthFinTEP+Q=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 27/42] target/ppc: powerpc_excp: Consolidade TLB miss code
Date: Thu,  3 Jun 2021 18:22:16 +1000
Message-Id: <20210603082231.601214-28-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210603082231.601214-1-david@gibson.dropbear.id.au>
References: <20210603082231.601214-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
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

The only difference in the code for Instruction fetch, Data load and
Data store TLB miss errors is that when called from an unsupported
processor (i.e. not one of 602, 603, 603e, G2, 7x5 or 74xx), they
abort with a message specific to the operation type (insn fetch, data
load/store).

If a processor does not support those interrupts we should not be
registering them in init_excp_<proc> to begin with, so that error
message would never be used.

I'm leaving the message in for completeness, but making it generic and
consolidating the three interrupts into the same case statement body.

Signed-off-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20210601214649.785647-4-farosas@linux.ibm.com>
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 target/ppc/excp_helper.c | 37 ++-----------------------------------
 1 file changed, 2 insertions(+), 35 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 9e3aae1c96..fd147e2a37 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -689,52 +689,20 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                   "is not implemented yet !\n");
         break;
     case POWERPC_EXCP_IFTLB:     /* Instruction fetch TLB error              */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_603E:
-        case POWERPC_EXCP_G2:
-            goto tlb_miss_tgpr;
-        case POWERPC_EXCP_7x5:
-            goto tlb_miss;
-        case POWERPC_EXCP_74xx:
-            goto tlb_miss_74xx;
-        default:
-            cpu_abort(cs, "Invalid instruction TLB miss exception\n");
-            break;
-        }
-        break;
     case POWERPC_EXCP_DLTLB:     /* Data load TLB miss                       */
-        switch (excp_model) {
-        case POWERPC_EXCP_602:
-        case POWERPC_EXCP_603:
-        case POWERPC_EXCP_603E:
-        case POWERPC_EXCP_G2:
-            goto tlb_miss_tgpr;
-        case POWERPC_EXCP_7x5:
-            goto tlb_miss;
-        case POWERPC_EXCP_74xx:
-            goto tlb_miss_74xx;
-        default:
-            cpu_abort(cs, "Invalid data load TLB miss exception\n");
-            break;
-        }
-        break;
     case POWERPC_EXCP_DSTLB:     /* Data store TLB miss                      */
         switch (excp_model) {
         case POWERPC_EXCP_602:
         case POWERPC_EXCP_603:
         case POWERPC_EXCP_603E:
         case POWERPC_EXCP_G2:
-        tlb_miss_tgpr:
             /* Swap temporary saved registers with GPRs */
             if (!(new_msr & ((target_ulong)1 << MSR_TGPR))) {
                 new_msr |= (target_ulong)1 << MSR_TGPR;
                 hreg_swap_gpr_tgpr(env);
             }
-            goto tlb_miss;
+            /* fall through */
         case POWERPC_EXCP_7x5:
-        tlb_miss:
 #if defined(DEBUG_SOFTWARE_TLB)
             if (qemu_log_enabled()) {
                 const char *es;
@@ -769,7 +737,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             msr |= ((env->last_way + 1) & (env->nb_ways - 1)) << 17;
             break;
         case POWERPC_EXCP_74xx:
-        tlb_miss_74xx:
 #if defined(DEBUG_SOFTWARE_TLB)
             if (qemu_log_enabled()) {
                 const char *es;
@@ -799,7 +766,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             msr |= env->error_code; /* key bit */
             break;
         default:
-            cpu_abort(cs, "Invalid data store TLB miss exception\n");
+            cpu_abort(cs, "Invalid TLB miss exception\n");
             break;
         }
         break;
-- 
2.31.1


