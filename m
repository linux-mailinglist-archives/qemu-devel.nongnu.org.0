Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 572EE3601DA
	for <lists+qemu-devel@lfdr.de>; Thu, 15 Apr 2021 07:45:26 +0200 (CEST)
Received: from localhost ([::1]:59126 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWuof-0003Si-Aw
	for lists+qemu-devel@lfdr.de; Thu, 15 Apr 2021 01:45:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41396)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumT-00017R-Ko; Thu, 15 Apr 2021 01:43:09 -0400
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429]:37383)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWumO-0007NP-Kr; Thu, 15 Apr 2021 01:43:09 -0400
Received: by mail-pf1-x429.google.com with SMTP id o123so15322866pfb.4;
 Wed, 14 Apr 2021 22:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=M26yWQc4q67700097W0NkPStXmiNiZzPY2I6R9bkgkw=;
 b=ZC7+9Aqk/VW/POjP85tStkfhZ5AD4xxM1cPS4d5ez7o2iEvRgSrZc4LgfR6YB35d3k
 FaOUh7wV4RZJI6UeTPGIhf5wF1VRzYmr2c6qwLSUw7aDX/86fFaZa7aI9jHNJvEryFds
 ernCLvivglWL767ih/kxxzHRHOEltIQtJ9wNRPtjnnJSCN+NlAzHPo64wkMiVyaNNhfh
 1NI2/0jgqU5M05MCO/pSMX5eiTHFnC38hf55muxRrHpMcl/Jqv9tDWirxTinH/MYJM2+
 E9jMXMlxWF37azNVwk0OlNOOx59RAMldAMijSzpDNq9BRSQuTLd8R7B8mvJompQLQdOw
 B6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M26yWQc4q67700097W0NkPStXmiNiZzPY2I6R9bkgkw=;
 b=qNQ0/rjWi7dizk5uifaAxZiUVkWLfqirNkL+uQVv9sgbeVT00NHf2M9alsDA9EhsAn
 QOvHVVqthlL1ao+GWX/2ioGdAI2psgxmPwHwHUddhhm87V58ap0wNyXExIMsniOBsy3y
 x3jAMbEE/L4WG0+hwjFgu1wLR9vGY7nYZ5Fw2B+BM55euUANP/eebJW7jnnriilhylho
 6HHumkCd8+ityF/7J/HImCEL75Mmvq6apD0oxqZ+e4MreFQ/UMYERuQ/Fz+krguBEPQ9
 1AmyLCM0U1sh7wTq4ZFZaZvJQxIeXAiEUXkdjAdWteqmOylOM8xbOSitA4F1STKhaZuZ
 Rq8A==
X-Gm-Message-State: AOAM5300YVPnUDuXLwl8EKgXnJXv6zFZyDPXWn6eQEDI/eB4D5DU7mpj
 b5LARM6IqLaRPhsnqyD7v82jcfTcpfM=
X-Google-Smtp-Source: ABdhPJwI21v6bwL2zfl44bnSwBm9C13gxRmgaH+dAreW5ir4t0NUl1NxnFM/CPUNM+eC4FVjFUc28g==
X-Received: by 2002:a62:7793:0:b029:23d:f8f4:73c9 with SMTP id
 s141-20020a6277930000b029023df8f473c9mr1809050pfc.61.1618465381607; 
 Wed, 14 Apr 2021 22:43:01 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id c5sm946151pfp.183.2021.04.14.22.42.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Apr 2021 22:43:01 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH v2 4/4] target/ppc: Add POWER10 exception model
Date: Thu, 15 Apr 2021 15:42:27 +1000
Message-Id: <20210415054227.1793812-5-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210415054227.1793812-1-npiggin@gmail.com>
References: <20210415054227.1793812-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::429;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x429.google.com
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

POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
and it removes support for the LPCR[AIL]=0b10 mode.

Reviewed-by: Cédric Le Goater <clg@kaod.org>
Tested-by: Cédric Le Goater <clg@kaod.org>
Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c            |  7 ++++-
 target/ppc/cpu-qom.h            |  2 ++
 target/ppc/cpu.h                |  5 ++--
 target/ppc/excp_helper.c        | 51 +++++++++++++++++++++++++++++++--
 target/ppc/translate.c          |  3 +-
 target/ppc/translate_init.c.inc |  2 +-
 6 files changed, 62 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 2fbe04a689..6802cd4dc8 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1396,7 +1396,12 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
     }
 
     if (mflags == 1) {
-        /* AIL=1 is reserved */
+        /* AIL=1 is reserved in POWER8/POWER9 */
+        return H_UNSUPPORTED_FLAG;
+    }
+
+    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
+        /* AIL=2 is also reserved in POWER10 (ISA v3.1) */
         return H_UNSUPPORTED_FLAG;
     }
 
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
index 5200a16d23..9d35cdfa92 100644
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
index 964a58cfdc..38a1482519 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -170,7 +170,27 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
  * +-------------------------------------------------------+
  *
  * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be sent to
- * the hypervisor in AIL mode if the guest is radix.
+ * the hypervisor in AIL mode if the guest is radix. This is good for
+ * performance but allows the guest to influence the AIL of hypervisor
+ * interrupts using its MSR, and also the hypervisor must disallow guest
+ * interrupts (MSR[HV] 0->0) from using AIL if the hypervisor does not want to
+ * use AIL for its MSR[HV] 0->1 interrupts.
+ *
+ * POWER10 addresses those issues with a new LPCR[HAIL] bit that is applied to
+ * interrupts that begin execution with MSR[HV]=1 (so both MSR[HV] 0->1 and
+ * MSR[HV] 1->1).
+ *
+ * HAIL=1 is equivalent to AIL=3, for interrupts delivered with MSR[HV]=1.
+ *
+ * POWER10 behaviour is
+ * | LPCR[AIL] | LPCR[HAIL] | MSR[IR||DR] | MSR[HV] | new MSR[HV] | AIL |
+ * +-----------+------------+-------------+---------+-------------+-----+
+ * | a         | h          | 00/01/10    | 0       | 0           | 0   |
+ * | a         | h          | 11          | 0       | 0           | a   |
+ * | a         | h          | x           | 0       | 1           | h   |
+ * | a         | h          | 00/01/10    | 1       | 1           | 0   |
+ * | a         | h          | 11          | 1       | 1           | h   |
+ * +--------------------------------------------------------------------+
  */
 static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
                                       target_ulong msr,
@@ -210,6 +230,29 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
             /* AIL=1 is reserved */
             return;
         }
+
+    } else if (excp_model == POWERPC_EXCP_POWER10) {
+        if (!mmu_all_on && !hv_escalation) {
+            /*
+             * AIL works for HV interrupts even with guest MSR[IR/DR] disabled.
+             * Guest->guest and HV->HV interrupts do require MMU on.
+             */
+            return;
+        }
+
+        if (*new_msr & MSR_HVB) {
+            if (!(env->spr[SPR_LPCR] & LPCR_HAIL)) {
+                /* HV interrupts depend on LPCR[HAIL] */
+                return;
+            }
+            ail = 3; /* HAIL=1 gives AIL=3 behaviour for HV interrupts */
+        } else {
+            ail = (env->spr[SPR_LPCR] & LPCR_AIL) >> LPCR_AIL_SHIFT;
+        }
+        if (ail != 3) {
+            /* AIL=1 and AIL=2 are reserved */
+            return;
+        }
     } else {
         /* Other processors do not support AIL */
         return;
@@ -322,7 +365,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_POWER7 ||
         excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9) {
+        excp_model == POWERPC_EXCP_POWER9 ||
+        excp_model == POWERPC_EXCP_POWER10) {
         lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
     } else
 #endif /* defined(TARGET_PPC64) */
@@ -842,7 +886,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
         } else if (env->spr[SPR_LPCR] & LPCR_ILE) {
             new_msr |= (target_ulong)1 << MSR_LE;
         }
-    } else if (excp_model == POWERPC_EXCP_POWER9) {
+    } else if (excp_model == POWERPC_EXCP_POWER9 ||
+               excp_model == POWERPC_EXCP_POWER10) {
         if (new_msr & MSR_HVB) {
             if (env->spr[SPR_HID0] & HID0_POWER9_HILE) {
                 new_msr |= (target_ulong)1 << MSR_LE;
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
index a82d9ed647..76d82cc2f6 100644
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


