Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD6035EB72
	for <lists+qemu-devel@lfdr.de>; Wed, 14 Apr 2021 05:28:32 +0200 (CEST)
Received: from localhost ([::1]:55928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lWWCd-0002bU-GF
	for lists+qemu-devel@lfdr.de; Tue, 13 Apr 2021 23:28:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWW8G-0006qN-KQ; Tue, 13 Apr 2021 23:24:02 -0400
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d]:51198)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lWW8D-0003ce-Vp; Tue, 13 Apr 2021 23:24:00 -0400
Received: by mail-pj1-x102d.google.com with SMTP id u11so5880000pjr.0;
 Tue, 13 Apr 2021 20:23:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ISqCfvePphae68szf7yjOoOBLEqDPA6tRjmQMiXccUg=;
 b=dEjuH7Kv1vX/INPFkZ6OOvaqS2ojy7pcr9D91bozaijHJs0DWUo7GvXZqiWROa0aU9
 IMcPz9PWrLN9H3/rCciIRnApADBzwJUDB44V26fY55Cj2b0xxLJfSLUZ197mKF1WwEGC
 ipxTlJ1RE/MwqNHDERh3bF0rprkNeEk8b58N461lbb4QkLgUyCGVf8EWotEsVhdGqeh3
 jN1fiD36sEXBKVHi9JMi05KVGt/ck7NRtwvk68K4S8pcuwqZ4ueyKVotvr02fnvgcfBU
 wUV5ds2dBjv3Y8pWOyIOS/Gli7va1rDcIja3RnYAk8XmEhV9fAcS2/O5oX+GzFAfnXev
 Wgow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ISqCfvePphae68szf7yjOoOBLEqDPA6tRjmQMiXccUg=;
 b=A1a3Nkhhq4PPqQTmrDl6CCer0mD3Hlc6aou/NtAzeDN1JzCnAGFgZ3UsHK7rMbH7Vd
 ks2Qgkwq6b7PvVPdakJwm91Mg7aM+leu4/swFnrLquAmzS/d+E8nTRRhG9poVgKQurap
 i67i1cMCN14lhvbIjN0P7qLLRcH6bVkIN0JqQunB0qV0IknAlweGipJt5wOnCv6mAZhr
 MvhZMYN61QXn8x1CR8esoHd2IRJnSyP5+Bodc0x8KnznnGGhKpsqnWSGt0TXpkIHQLls
 y8LmQ1jbVg9czZiacUwwFRYe+U8Ph9l4PBzGM1QitmnYUG9ZoZdkQ3wPhH1DgCJpTeo0
 jtmw==
X-Gm-Message-State: AOAM532gWgEEZR3cXLYU4OPEcA6+x/lMAJMKVAn1Qa/UwFbdZMea8MD7
 45Js1waE+CWE6Z9nSM59gHYKwJiiK2k=
X-Google-Smtp-Source: ABdhPJwk16TZH/scE1KWuofz/i6eKL9Hnfb9edIBTafhejQlXExRtfLdjDqVC1ldqA8meKYQyn84Jw==
X-Received: by 2002:a17:90b:4a50:: with SMTP id
 lb16mr1078518pjb.229.1618370636315; 
 Tue, 13 Apr 2021 20:23:56 -0700 (PDT)
Received: from bobo.ibm.com (193-116-90-211.tpgi.com.au. [193.116.90.211])
 by smtp.gmail.com with ESMTPSA id fa6sm3407435pjb.2.2021.04.13.20.23.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Apr 2021 20:23:56 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [RFC PATCH 2/2] target/ppc: Add POWER10 exception model
Date: Wed, 14 Apr 2021 13:23:43 +1000
Message-Id: <20210414032343.1720010-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210414032343.1720010-1-npiggin@gmail.com>
References: <20210414032343.1720010-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=npiggin@gmail.com; helo=mail-pj1-x102d.google.com
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
Cc: Fabiano Rosas <farosas@linux.ibm.com>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@fr.ibm.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

POWER10 adds a new bit that modifies interrupt behaviour, LPCR[HAIL],
and it removes support for the LPCR[AIL]=0b10 mode.

Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
---
 hw/ppc/spapr_hcall.c            |  7 +++++-
 target/ppc/cpu-qom.h            |  2 ++
 target/ppc/cpu.h                |  5 ++--
 target/ppc/excp_helper.c        | 43 +++++++++++++++++++++++++++++++++
 target/ppc/translate.c          |  3 ++-
 target/ppc/translate_init.c.inc |  2 +-
 6 files changed, 57 insertions(+), 5 deletions(-)

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
index 9ff316767c..19931361a0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -172,6 +172,26 @@ static int powerpc_reset_wakeup(CPUState *cs, CPUPPCState *env, int excp,
  *
  * The difference with POWER9 being that MSR[HV] 0->1 interrupts can be
  * sent to the hypervisor in AIL mode if the guest is radix (LPCR[HR]=1).
+ * This is good for performance but allows the guest to influence the
+ * AIL of hypervisor interrupts using its MSR, and also the hypervisor
+ * must disallow guest interrupts (MSR[HV] 0->0) from using AIL if the
+ * hypervisor does not want to use AIL for its MSR[HV] 0->1 interrupts.
+ *
+ * POWER10 addresses those issues with a new LPCR[HAIL] bit that is
+ * applied to interrupt that begin execution with MSR[HV]=1 (so both
+ * MSR[HV] 0->1 and 1->1).
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
@@ -211,6 +231,29 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
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


