Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D211370630
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 09:27:26 +0200 (CEST)
Received: from localhost ([::1]:42610 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lck29-0008Ib-Ea
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 03:27:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lcjzf-0006vY-Vq; Sat, 01 May 2021 03:24:51 -0400
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e]:46606)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lcjzd-0003YA-S0; Sat, 01 May 2021 03:24:51 -0400
Received: by mail-pl1-x62e.google.com with SMTP id s20so157653plr.13;
 Sat, 01 May 2021 00:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=evwPWxFbg++RdgeYJYEEF07pvcfOxDn6UBMVw2R8gZ4=;
 b=Dnmwn550bczleaRSag1j29z2PgznPWYCjajdp57eUuQJnHymktrzSnOdDbG0NU5sY+
 Z+pyfdfu0evZbbHYrJXDtdTW3jwGpm5k+45T4k8BoJe2fNLmhgPTiJVbP6CHZmKM+SuL
 fWTU8/C0Us0KzrPav2BID1v6L5RagtYHiqFBoyzUptJgvl5zYu7Ig9eUkuUSbNhIQczY
 CpxJjC+I4rLXHJyrx1GGnciXeIjTMMkhR5PNhZ7yLT2X4wcSidh5BIdqI3PLedn0WF/s
 BySwHJxjJl8l4QzAyIKXpzezfQ6OZ1FLIx0g3fAMtZnjxG8aWZL8NlgQsmfHNgho1Wz8
 cvug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=evwPWxFbg++RdgeYJYEEF07pvcfOxDn6UBMVw2R8gZ4=;
 b=X2KEvNyEv5xwuLoObVq/htx6qUiKLLYW6qhmC3psIEpFqsZ+pUeM1tki3hA6pUPjn2
 FHhb+QCU28StSFn2rHR/IWJmtRC/ySzpuXl0Jb1AWwG9km2eRxpb9RzDky/eJxZ+gcl2
 M+jkDgzDBYqPdhyOSwyLV7qvj0QzrMV9gBUh/qffNF6XQuZdysot2zASEgvKY7ocnZvg
 mIA66GGsntnzqP7fqdUNSPYqJsoos8etn2JcoCzLDCMp/QLoCB2qDNpXkUd+tDDHNuYS
 yeKGqXH+DVqeMsyNYPKDLwD3p0CDpM4O7k70dHHs/KLFsiC0MLZzKsMMdjxwLqFyKCui
 EFVg==
X-Gm-Message-State: AOAM530trfoMNxaYLyynPxWbAEg8Q7a/M6et40GlVxCuaF2Qw78Lfya9
 lmPi7/KlHlsV6RogR3NbtvYnLpjkjmQ=
X-Google-Smtp-Source: ABdhPJzCc3pjUDnR0tvOGUDCPOYcL6WEdhr6NqSIQmHW5d6rQftfKdYqSkqetLCKxW2GKb2d/MY2Jw==
X-Received: by 2002:a17:902:c40c:b029:ed:7032:649c with SMTP id
 k12-20020a170902c40cb02900ed7032649cmr9573434plk.74.1619853887992; 
 Sat, 01 May 2021 00:24:47 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 14sm3868577pfi.145.2021.05.01.00.24.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 00:24:47 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 1/2] target/ppc: rework AIL logic in interrupt delivery
Date: Sat,  1 May 2021 17:24:34 +1000
Message-Id: <20210501072436.145444-2-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210501072436.145444-1-npiggin@gmail.com>
References: <20210501072436.145444-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62e;
 envelope-from=npiggin@gmail.com; helo=mail-pl1-x62e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The AIL logic is becoming unmanageable spread all over powerpc_excp(),
and it is slated to get even worse with POWER10 support.

Move it all to a new helper function.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c            |   3 +-
 target/ppc/cpu.h                |   8 --
 target/ppc/excp_helper.c        | 165 ++++++++++++++++++++------------
 target/ppc/translate_init.c.inc |   2 +-
 4 files changed, 108 insertions(+), 70 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..2fbe04a689 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1395,7 +1395,8 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
         return H_P4;
     }
 
-    if (mflags == AIL_RESERVED) {
+    if (mflags == 1) {
+        /* AIL=1 is reserved */
         return H_UNSUPPORTED_FLAG;
     }
 
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 8c18bb0762..be24a501fc 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -2405,14 +2405,6 @@ enum {
     HMER_XSCOM_STATUS_MASK      = PPC_BITMASK(21, 23),
 };
 
-/* Alternate Interrupt Location (AIL) */
-enum {
-    AIL_NONE                = 0,
-    AIL_RESERVED            = 1,
-    AIL_0001_8000           = 2,
-    AIL_C000_0000_0000_4000 = 3,
-};
-
 /*****************************************************************************/
 
 #define is_isa300(ctx) (!!(ctx->insns_flags2 & PPC2_ISA300))
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 344af66f66..73360bb872 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -136,25 +136,111 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
     return POWERPC_EXCP_RESET;
 }
 
-static uint64_t ppc_excp_vector_offset(CPUState *cs, int ail)
+/*
+ * AIL - Alternate Interrupt Location, a mode that allows interrupts to be
+ * taken with the MMU on, and which uses an alternate location (e.g., so the
+ * kernel/hv can map the vectors there with an effective address).
+ *
+ * An interrupt is considered to be taken "with AIL" or "AIL applies" if they
+ * are delivered in this way. AIL requires the LPCR to be set to enable this
+ * mode, and then a number of conditions have to be true for AIL to apply.
+ *
+ * First of all, SRESET, MCE, and HMI are always delivered without AIL, because
+ * they specifically want to be in real mode (e.g., the MCE might be signaling
+ * a SLB multi-hit which requires SLB flush before the MMU can be enabled).
+ *
+ * After that, behaviour depends on the current MSR[IR], MSR[DR], MSR[HV],
+ * whether or not the interrupt changes MSR[HV] from 0 to 1, and the current
+ * radix mode (LPCR[HR]).
+ *
+ * POWER8, POWER9 with LPCR[HR]=0
+ * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+ * +-----------+-------------+---------+-------------+-----+
+ * | a         | 00/01/10    | x       | x           | 0   |
+ * | a         | 11          | 0       | 1           | 0   |
+ * | a         | 11          | 1       | 1           | a   |
+ * | a         | 11          | 0       | 0           | a   |
+ * +-------------------------------------------------------+
+ *
+ * POWER9 with LPCR[HR]=1
+ * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+ * +-----------+-------------+---------+-------------+-----+
+ * | a         | 00/01/10    | x       | x           | 0   |
+ * | a         | 11          | x       | x           | a   |
+ * +-------------------------------------------------------+
+ *
+ * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be sent to
+ * the hypervisor in AIL mode if the guest is radix.
+ */
+static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
+                                      target_ulong msr,
+                                      target_ulong *new_msr,
+                                      target_ulong *vector)
 {
-    uint64_t offset = 0;
+#if defined(TARGET_PPC64)
+    CPUPPCState *env = &cpu->env;
+    bool mmu_all_on = ((msr >> MSR_IR) & 1) && ((msr >> MSR_DR) & 1);
+    bool hv_escalation = !(msr & MSR_HVB) && (*new_msr & MSR_HVB);
+    int ail = 0;
+
+    if (excp == POWERPC_EXCP_MCHECK ||
+        excp == POWERPC_EXCP_RESET ||
+        excp == POWERPC_EXCP_HV_MAINT) {
+        /* SRESET, MCE, HMI never apply AIL */
+        return;
+    }
 
-    switch (ail) {
-    case AIL_NONE:
-        break;
-    case AIL_0001_8000:
-        offset = 0x18000;
-        break;
-    case AIL_C000_0000_0000_4000:
-        offset = 0xc000000000004000ull;
-        break;
-    default:
-        cpu_abort(cs, "Invalid AIL combination %d\n", ail);
-        break;
+    if (excp_model == POWERPC_EXCP_POWER8 ||
+        excp_model == POWERPC_EXCP_POWER9) {
+        if (!mmu_all_on) {
+            /* AIL only works if MSR[IR] and MSR[DR] are both enabled. */
+            return;
+        }
+        if (hv_escalation && !(env->spr[SPR_LPCR] & LPCR_HR)) {
+            /*
+             * AIL does not work if there is a MSR[HV] 0->1 transition and the
+             * partition is in HPT mode. For radix guests, such interrupts are
+             * allowed to be delivered to the hypervisor in ail mode.
+             */
+            return;
+        }
+
+        ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
+	if (ail == 0) {
+            return;
+        }
+        if (ail == 1) {
+            /* AIL=1 is reserved, treat it like AIL=0 */
+            return;
+        }
+    } else {
+        /* Other processors do not support AIL */
+        return;
     }
 
-    return offset;
+    /*
+     * AIL applies, so the new MSR gets IR and DR set, and an offset applied
+     * to the new IP.
+     */
+    *new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
+
+    if (excp != POWERPC_EXCP_SYSCALL_VECTORED) {
+        if (ail == 2) {
+            *vector |= 0x0000000000018000ull;
+        } else if (ail == 3) {
+            *vector |= 0xc000000000004000ull;
+        }
+    } else {
+        /*
+	 * scv AIL is a little different. AIL=2 does not change the address,
+	 * only the MSR. AIL=3 replaces the 0x17000 base with 0xc...3000.
+	 */
+        if (ail == 3) {
+            *vector &= ~0x0000000000017000ull; /* Un-apply the base offset */
+            *vector |= 0xc000000000003000ull; /* Apply scv's AIL=3 offset */
+        }
+    }
+#endif
 }
 
 static inline void powerpc_set_excp_state(PowerPCCPU *cpu,
@@ -197,7 +283,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev = -1, ail;
+    int srr0, srr1, asrr0, asrr1, lev = -1;
     bool lpes0;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
@@ -238,25 +324,16 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
      *
      * On anything else, we behave as if LPES0 is 1
      * (externals don't alter MSR:HV)
-     *
-     * AIL is initialized here but can be cleared by
-     * selected exceptions
      */
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_POWER7 ||
         excp_model == POWERPC_EXCP_POWER8 ||
         excp_model == POWERPC_EXCP_POWER9) {
         lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
-        if (excp_model != POWERPC_EXCP_POWER7) {
-            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
-        } else {
-            ail = 0;
-        }
     } else
 #endif /* defined(TARGET_PPC64) */
     {
         lpes0 = true;
-        ail = 0;
     }
 
     /*
@@ -315,7 +392,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
              */
             new_msr |= (target_ulong)MSR_HVB;
         }
-        ail = 0;
 
         /* machine check exceptions don't have ME set */
         new_msr &= ~((target_ulong)1 << MSR_ME);
@@ -519,7 +595,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
                           "exception %d with no HV support\n", excp);
             }
         }
-        ail = 0;
         break;
     case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
     case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
@@ -790,24 +865,6 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     }
 #endif
 
-    /*
-     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
-     */
-    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
-        ail = 0;
-    }
-
-    /*
-     * AIL does not work if there is a MSR[HV] 0->1 transition and the
-     * partition is in HPT mode. For radix guests, such interrupts are
-     * allowed to be delivered to the hypervisor in ail mode.
-     */
-    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
-        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
-            ail = 0;
-        }
-    }
-
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
         cpu_abort(cs, "Raised an exception without defined vector %d\n",
@@ -848,23 +905,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         /* Save MSR */
         env->spr[srr1] = msr;
 
-        /* Handle AIL */
-        if (ail) {
-            new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
-            vector |= ppc_excp_vector_offset(cs, ail);
-        }
-
 #if defined(TARGET_PPC64)
     } else {
-        /* scv AIL is a little different */
-        if (ail) {
-            new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
-        }
-        if (ail == AIL_C000_0000_0000_4000) {
-            vector |= 0xc000000000003000ull;
-        } else {
-            vector |= 0x0000000000017000ull;
-        }
         vector += lev * 0x20;
 
         env->lr = env->nip;
@@ -872,6 +914,9 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
     }
 
+    /* This can update new_msr and vector if AIL applies */
+    ppc_excp_apply_ail(cpu, excp_model, excp, msr, &new_msr, &vector);
+
     powerpc_set_excp_state(cpu, vector, new_msr);
 }
 
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 9ab2c32cc4..01fa76e4a0 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -3457,7 +3457,7 @@ static void init_excp_POWER9(CPUPPCState *env)
 
 #if !defined(CONFIG_USER_ONLY)
     env->excp_vectors[POWERPC_EXCP_HVIRT]    = 0x00000EA0;
-    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00000000;
+    env->excp_vectors[POWERPC_EXCP_SYSCALL_VECTORED] = 0x00017000;
 #endif
 }
 
-- 
2.23.0


