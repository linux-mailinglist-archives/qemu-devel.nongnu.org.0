Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0918635DF95
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Apr 2021 14:59:34 +0200 (CEST)
Received: from localhost ([::1]:38794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWIdh-0002Yj-51
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 08:59:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36434)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZh-0006md-C4; Tue, 13 Apr 2021 08:55:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:51830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWIZe-0005Y3-Ks; Tue, 13 Apr 2021 08:55:25 -0400
Received: by mail-pj1-x102a.google.com with SMTP id i4so8414176pjk.1;
 Tue, 13 Apr 2021 05:55:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=t0WAbrXaPLQMSV4AqG2CTLm18dTF7Arnz9djWAGjyfI=;
 b=j/31hx5sD09/1Cz4r4e1FLqHCv5R3NVL+/e33o+DZgbCa9Zvi2RkKS0rkPREptL5Gu
 r47NQ88pdS0NrsK4kv1KrYPkvY0//g/El8T6jaK89tRmoIOgtkmqGO+AHHrzRebajU+V
 lAuZG9kgawoOsQIBJg8nSe0PwQr6JWn6I8iF41K8ME2wH4Fsm7W/tmAxUegDWTtv79zj
 kjPOXsizKe6RlB2wkKC16EcoweXq7pNtAqbSO9VXY/g3UIwONLxL6cHT8dEMa7PhTT6O
 zdoxGyCo+Zn+vLLPI77sgVGxW+TT0XWD5ui13/IrzisvUYdXI97zM8Ondp3fbGjybh9+
 Lfow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t0WAbrXaPLQMSV4AqG2CTLm18dTF7Arnz9djWAGjyfI=;
 b=qT2fhDGjwyt1VB9KAaXEF1hZs8ngZxLR7AsVKlOPFomD83ERmvUEVBxiJyhNj13b4p
 S6ATV+8edXH/veTlZjUKpSEURUvyR/q5vQhRk6IjanJqvYM2+uZdqKpDO6XV83D+eBSr
 Qj+X/+CenYQZWhS6ynTh7650rDNWwGMW9Zqj8TII3wItwrBs5TaE8dzCNtLthRd+M4ZJ
 hctFICXDKOezH6DnteBhB78EhisWG6Qd2NmjHA3FO4fWBVlGkmx0xe5Jx1xVlsfZo3a8
 e0I2M6IHqqkT8N8XJEOnGduaSKrEMJzAcvqJwJu2/HMj1lcp9Z3cMrqnMjLxUyu5Ut76
 E4Ow==
X-Gm-Message-State: AOAM531fCV102fwgtUZytYgfeiksaOq83z9ixllJ+K+Qth+jtj8K7JST
 Tua0QXEtchqni2ryzu67+wbO5RN/gyA=
X-Google-Smtp-Source: ABdhPJwJFV3PSgrcI0SsTMt6yh43/qBtlVGsG7TWh/cAcOty0ixgVxdbD5yglLRIUuKbDFBzJ086yg==
X-Received: by 2002:a17:903:30c3:b029:ea:afe2:56f5 with SMTP id
 s3-20020a17090330c3b02900eaafe256f5mr20304712plc.64.1618318517156; 
 Tue, 13 Apr 2021 05:55:17 -0700 (PDT)
Received: from bobo.ozlabs.ibm.com (193-116-90-211.tpgi.com.au.
 [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id s40sm9627352pfw.133.2021.04.13.05.55.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 05:55:16 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v1 3/3] target/ppc: Add POWER10 exception model
Date: Tue, 13 Apr 2021 22:54:48 +1000
Message-Id: <20210413125448.1689545-4-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210413125448.1689545-1-npiggin@gmail.com>
References: <20210413125448.1689545-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102a.google.com
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
Cc: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>,
 qemu-devel@nongnu.org, Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
and it removes support for the LPCR[AIL]=0b10 mode.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c            |   5 ++
 target/ppc/cpu-qom.h            |   2 +
 target/ppc/cpu.h                |   5 +-
 target/ppc/excp_helper.c        | 114 ++++++++++++++++++++++++++------
 target/ppc/translate.c          |   3 +-
 target/ppc/translate_init.c.inc |   2 +-
 6 files changed, 107 insertions(+), 24 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c..2f65f20f72 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1399,6 +1399,11 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
         return H_UNSUPPORTED_FLAG;
     }
 
+    if (mflags == AIL_0001_8000 && (pcc->insns_flags2 & PPC2_ISA310)) {
+        /* AIL 2 is also reserved in ISA v3.1 */
+        return H_UNSUPPORTED_FLAG;
+    }
+
     spapr_set_all_lpcrs(mflags << LPCR_AIL_SHIFT, LPCR_AIL);
 
     return H_SUCCESS;
diff --git a/target/ppc/cpu-qom.h b/target/ppc/cpu-qom.h
index 118baf8d41..06b6571bc9 100644
--- a/target/ppc/cpu-qom.h
+++ b/target/ppc/cpu-qom.h
@@ -116,6 +116,8 @@ enum powerpc_excp_t {
     POWERPC_EXCP_POWER8,
     /* POWER9 exception model           */
     POWERPC_EXCP_POWER9,
+    /* POWER10 exception model           */
+    POWERPC_EXCP_POWER10,
 };
 
 /*****************************************************************************/
diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index e73416da68..24e53e0ac3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,10 +354,11 @@ typedef struct ppc_v3_pate_t {
 #define LPCR_PECE_U_SHIFT (63 - 19)
 #define LPCR_PECE_U_MASK  (0x7ull << LPCR_PECE_U_SHIFT)
 #define LPCR_HVEE         PPC_BIT(17) /* Hypervisor Virt Exit Enable */
-#define LPCR_RMLS_SHIFT   (63 - 37)
+#define LPCR_RMLS_SHIFT   (63 - 37)   /* RMLS (removed in ISA v3.0) */
 #define LPCR_RMLS         (0xfull << LPCR_RMLS_SHIFT)
+#define LPCR_HAIL         PPC_BIT(37) /* ISA v3.1 HV AIL=3 equivalent */
 #define LPCR_ILE          PPC_BIT(38)
-#define LPCR_AIL_SHIFT    (63 - 40)      /* Alternate interrupt location */
+#define LPCR_AIL_SHIFT    (63 - 40)   /* Alternate interrupt location */
 #define LPCR_AIL          (3ull << LPCR_AIL_SHIFT)
 #define LPCR_UPRT         PPC_BIT(41) /* Use Process Table */
 #define LPCR_EVIRT        PPC_BIT(42) /* Enhanced Virtualisation */
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index b8881c0f85..e8bf0598b4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -197,7 +197,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
     CPUState *cs = CPU(cpu);
     CPUPPCState *env = &cpu->env;
     target_ulong msr, new_msr, vector;
-    int srr0, srr1, asrr0, asrr1, lev = -1, ail;
+    int srr0, srr1, asrr0, asrr1, lev = -1;
+    int ail, hail, using_ail;
     bool lpes0;
 
     qemu_log_mask(CPU_LOG_INT, "Raise exception at " TARGET_FMT_lx
@@ -239,24 +240,39 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
      * On anything else, we behave as if LPES0 is 1
      * (externals don't alter MSR:HV)
      *
-     * AIL is initialized here but can be cleared by
-     * selected exceptions
+     * ail/hail are initialized here but can be cleared by
+     * selected exceptions, and other conditions afterwards.
      */
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_POWER7 ||
         excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9) {
+        excp_model == POWERPC_EXCP_POWER9 ||
+        excp_model == POWERPC_EXCP_POWER10) {
         lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         if (excp_model != POWERPC_EXCP_POWER7) {
             ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
         } else {
             ail = 0;
         }
+        if (excp_model == POWERPC_EXCP_POWER10) {
+            if (AIL_0001_8000) {
+                ail = 0; /* AIL=2 is reserved in ISA v3.1 */
+            }
+
+            if (env->spr[SPR_LPCR] & LPCR_HAIL) {
+                hail = AIL_C000_0000_0000_4000;
+            } else {
+                hail = 0;
+            }
+        } else {
+            hail = ail;
+        }
     } else
 #endif /* defined(TARGET_PPC64) */
     {
         lpes0 = true;
         ail = 0;
+        hail = 0;
     }
 
     /*
@@ -316,6 +332,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             new_msr |= (target_ulong)MSR_HVB;
         }
         ail = 0;
+        hail = 0;
 
         /* machine check exceptions don't have ME set */
         new_msr &= ~((target_ulong)1 << MSR_ME);
@@ -520,6 +537,7 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
             }
         }
         ail = 0;
+        hail = 0;
         break;
     case POWERPC_EXCP_DSEG:      /* Data segment exception                   */
     case POWERPC_EXCP_ISEG:      /* Instruction segment exception            */
@@ -773,7 +791,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
             new_msr |= (target_ulong)1 << MSR_LE;
         }
-    } else if (excp_model == POWERPC_EXCP_POWER9) {
+    } else if (excp_model == POWERPC_EXCP_POWER9 ||
+               excp_model == POWERPC_EXCP_POWER10) {
         if (new_msr & MSR_HVB) {
             if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
                 new_msr |= (target_ulong)1 << MSR_LE;
@@ -791,22 +810,77 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #endif
 
     /*
-     * AIL only works if MSR[IR] and MSR[DR] are both enabled.
+     * The ail variable is for AIL behaviour for interrupts that begin
+     * execution with MSR[HV]=0, and the hail variable is for AIL behaviour for
+     * interrupts that begin execution with MSR[HV]=1.
+     *
+     * There is a large matrix of behaviours depending on the processor and
+     * the current operating modes when the interrupt is taken, and the
+     * interrupt type. The below tables lists behaviour for interrupts except
+     * for SRESET, machine check, and HMI (which are all taken in real mode
+     * with AIL 0).
+     *
+     * POWER8, POWER9 with LPCR[HR]=0
+     * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+     * +-----------+-------------+---------+-------------+-----+
+     * | a         | 00/01/10    | x       | x           | 0   |
+     * | a         | 11          | 0       | 1           | 0   |
+     * | a         | 11          | 1       | 1           | a   |
+     * | a         | 11          | 0       | 0           | a   |
+     * +-------------------------------------------------------+
+     *
+     * POWER9 with LPCR[HR]=1
+     * | LPCR[AIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+     * +-----------+-------------+---------+-------------+-----+
+     * | a         | 00/01/10    | x       | x           | 0   |
+     * | a         | 11          | x       | x           | a   |
+     * +-------------------------------------------------------+
+     *
+     * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be
+     * sent to the hypervisor in AIL mode if the guest is radix (LPCR[HR]=1).
+     * This is good for performance but allows the guest to influence the
+     * AIL of the hypervisor interrupt using its MSR, and also the hypervisor
+     * must disallow guest interrupts (MSR[HV] 0->0) from using AIL if the
+     * hypervisor does not want to use AIL for its MSR[HV] 0->1 interrupts.
+     *
+     * POWER10 addresses those issues with a new LPCR[HAIL] bit that is
+     * applied to interrupt that begin execution with MSR[HV]=1 (so both
+     * MSR[HV] 0->1 and 1->1).
+     *
+     * POWER10 behaviour is
+     * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+     * +-----------+------------+-------------+---------+-------------+-----+
+     * | a         | h          | 00/01/10    | 0       | 0           | 0   |
+     * | a         | h          | 11          | 0       | 0           | a   |
+     * | a         | h          | x           | 0       | 1           | h   |
+     * | a         | h          | 00/01/10    | 1       | 1           | 0   |
+     * | a         | h          | 11          | 1       | 1           | h   |
+     * +--------------------------------------------------------------------+
      */
-    if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
-        ail = 0;
-    }
 
-    /*
-     * AIL does not work if there is a MSR[HV] 0->1 transition and the
-     * partition is in HPT mode. For radix guests, such interrupts are
-     * allowed to be delivered to the hypervisor in ail mode.
-     */
-    if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
-        if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
+    if (excp_model == POWERPC_EXCP_POWER8 ||
+        excp_model == POWERPC_EXCP_POWER9) {
+        if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
             ail = 0;
+            hail = 0;
+        } else if ((new_msr & MSR_HVB) && !(msr & MSR_HVB)) {
+            if (!(env->spr[SPR_LPCR] & LPCR_HR)) {
+                hail = 0;
+            }
+        }
+    } else if (excp_model == POWERPC_EXCP_POWER10) {
+        if ((new_msr & MSR_HVB) == (msr & MSR_HVB)) {
+            if (!((msr >> MSR_IR) & 1) || !((msr >> MSR_DR) & 1)) {
+                ail = 0;
+                hail = 0;
+            }
         }
     }
+    if (new_msr & MSR_HVB) {
+        using_ail = hail;
+    } else {
+        using_ail = ail;
+    }
 
     vector = env->excp_vectors[excp];
     if (vector == (target_ulong)-1ULL) {
@@ -849,18 +923,18 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         env->spr[srr1] = msr;
 
         /* Handle AIL */
-        if (ail) {
+        if (using_ail) {
             new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
-            vector |= ppc_excp_vector_offset(cs, ail);
+            vector |= ppc_excp_vector_offset(cs, using_ail);
         }
 
 #if defined(TARGET_PPC64)
     } else {
         /* scv AIL is a little different */
-        if (ail) {
+        if (using_ail) {
             new_msr |= (1 << MSR_IR) | (1 << MSR_DR);
         }
-        if (ail == AIL_C000_0000_0000_4000) {
+        if (using_ail == AIL_C000_0000_0000_4000) {
             vector |= 0xc000000000003000ull;
         } else {
             vector |= 0x0000000000017000ull;
diff --git a/target/ppc/translate.c b/target/ppc/translate.c
index 0984ce637b..e9ed001229 100644
--- a/target/ppc/translate.c
+++ b/target/ppc/translate.c
@@ -7731,7 +7731,8 @@ void ppc_cpu_dump_state(CPUState *cs, FILE *f, int flags)
 #if defined(TARGET_PPC64)
     if (env->excp_model == POWERPC_EXCP_POWER7 ||
         env->excp_model == POWERPC_EXCP_POWER8 ||
-        env->excp_model == POWERPC_EXCP_POWER9)  {
+        env->excp_model == POWERPC_EXCP_POWER9 ||
+        env->excp_model == POWERPC_EXCP_POWER10)  {
         qemu_fprintf(f, "HSRR0 " TARGET_FMT_lx " HSRR1 " TARGET_FMT_lx "\n",
                      env->spr[SPR_HSRR0], env->spr[SPR_HSRR1]);
     }
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index 70f9b9b150..5d427e9d38 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -9317,7 +9317,7 @@ POWERPC_FAMILY(POWER10)(ObjectClass *oc, void *data)
     pcc->radix_page_info = &POWER10_radix_page_info;
     pcc->lrg_decr_bits = 56;
 #endif
-    pcc->excp_model = POWERPC_EXCP_POWER9;
+    pcc->excp_model = POWERPC_EXCP_POWER10;
     pcc->bus_model = PPC_FLAGS_INPUT_POWER9;
     pcc->bfd_mach = bfd_mach_ppc64;
     pcc->flags = POWERPC_FLAG_VRE | POWERPC_FLAG_SE |
-- 
2.23.0


