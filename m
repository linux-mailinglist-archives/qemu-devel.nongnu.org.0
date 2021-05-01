Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6211A370631
	for <lists+qemu-devel@lfdr.de>; Sat,  1 May 2021 09:27:35 +0200 (CEST)
Received: from localhost ([::1]:43096 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lck2I-0008US-FA
	for lists+qemu-devel@lfdr.de; Sat, 01 May 2021 03:27:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59536)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lcjzj-00073U-KS; Sat, 01 May 2021 03:24:55 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:36645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <npiggin@gmail.com>)
 id 1lcjzh-0003aH-EM; Sat, 01 May 2021 03:24:55 -0400
Received: by mail-pf1-x435.google.com with SMTP id p4so677779pfo.3;
 Sat, 01 May 2021 00:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E0F9/KLOhWuCyN1oXQD9/ojrA34JN8vWaK0Zg0xgVWM=;
 b=AdDE5JVDYyAzHd03pgT6U+EUk9xqTDJ6ZYR1A9sLzCbM3xjdkKGP7QB8RLTUJrgtP4
 wQlvE3ZKNM5v3RvyE2NGuyaLqvOiZJHmgcAl/8b9csCgCfphqTjGnaYmOHgCFBJjjop6
 261wOz3Oqtpf4/OSFjY7RkUv9NahTIPudAkRUjg/dTKWSob4mrciI7GmzhmS4Wwu6zUR
 HrXTfyNT0GTiOSsLylMZjNblOtBtc3xe/CzhSYfksFaEsw1EeXa3Yjg8tL06uU6onXse
 NMK0zUy3fBPlz1C3ZkFxHJEsN3wUK5WBI4g9t1sQnpotslgEDljfivTz+UBr1WOj61Yt
 2Agg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E0F9/KLOhWuCyN1oXQD9/ojrA34JN8vWaK0Zg0xgVWM=;
 b=FuA9sumJkjKykS7DMv8L1KWRbQiMX0DvvMDHURJ7+Q8BnRLW7m4xxV+JWMltH3k8QE
 4nHWjSjdWsPsa+nNFGEbSgPQp6jhLxmIaWIEfPPG7wo5ZhtZIA6UxLyuj53nIktRIfU+
 qBdZuil/NkXPuwgZEgD4KaOOB2o2Vp6N1Cqc3BJPwQ7K4XLP+VX0xKdeZ9+Dh4ne+TJ4
 arnTidcCDwTBZ64isk3h/bHkZn+wurAfHd2Ml8OQTNKnCbCB/Si6HKdELn8JsrKQcpef
 VsXopyB8CRJSHZIN1vksV5Ep934YuSHxp4AIGzXTbecc8AdMGpfzM/++EhZO7wKt5ks0
 fglw==
X-Gm-Message-State: AOAM533eZoW3d0KCfsLbAQ5Eo70JdnTPVfemUKWCIbs11Ta6SK2wQGxp
 uxGDsxFjfgzFfmbnwjHlWiLpN8Wd8Ws=
X-Google-Smtp-Source: ABdhPJzyPSLbv2p13IEvicN8sv/Th7SqgxXKEN2se7pSVofrpbWcZWi66HV9i2MZkFHmOVS7j2XUqQ==
X-Received: by 2002:a65:420d:: with SMTP id c13mr8313273pgq.370.1619853891591; 
 Sat, 01 May 2021 00:24:51 -0700 (PDT)
Received: from bobo.ibm.com ([61.68.127.20])
 by smtp.gmail.com with ESMTPSA id 14sm3868577pfi.145.2021.05.01.00.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 May 2021 00:24:51 -0700 (PDT)
From: Nicholas Piggin <npiggin@gmail.com>
To: qemu-ppc@nongnu.org
Subject: [PATCH 2/2] target/ppc: Add POWER10 exception model
Date: Sat,  1 May 2021 17:24:35 +1000
Message-Id: <20210501072436.145444-3-npiggin@gmail.com>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20210501072436.145444-1-npiggin@gmail.com>
References: <20210501072436.145444-1-npiggin@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=npiggin@gmail.com; helo=mail-pf1-x435.google.com
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
 target/ppc/cpu.h                |  5 +--
 target/ppc/excp_helper.c        | 54 +++++++++++++++++++++++++++++++--
 target/ppc/translate.c          |  3 +-
 target/ppc/translate_init.c.inc |  2 +-
 6 files changed, 65 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 2fbe04a689..7275d0bba1 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1396,7 +1396,12 @@ static target_ulong h_set_mode_resource_addr_trans_mode(PowerPCCPU *cpu,
     }
 
     if (mflags == 1) {
-        /* AIL=1 is reserved */
+        /* AIL=1 is reserved in POWER8/POWER9/POWER10 */
+        return H_UNSUPPORTED_FLAG;
+    }
+
+    if (mflags == 2 && (pcc->insns_flags2 & PPC2_ISA310)) {
+        /* AIL=2 is reserved in POWER10 (ISA v3.1) */
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
index be24a501fc..8a076fab48 100644
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
index 73360bb872..5e30a5a056 100644
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
@@ -213,6 +233,32 @@ static inline void ppc_excp_apply_ail(PowerPCCPU *cpu, int excp_model, int excp,
             /* AIL=1 is reserved, treat it like AIL=0 */
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
+	if (ail == 0) {
+            return;
+        }
+        if (ail == 1 || ail == 2) {
+            /* AIL=1 and AIL=2 are reserved, treat them like AIL=0 */
+            return;
+        }
     } else {
         /* Other processors do not support AIL */
         return;
@@ -328,7 +374,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
 #if defined(TARGET_PPC64)
     if (excp_model == POWERPC_EXCP_POWER7 ||
         excp_model == POWERPC_EXCP_POWER8 ||
-        excp_model == POWERPC_EXCP_POWER9) {
+        excp_model == POWERPC_EXCP_POWER9 ||
+        excp_model == POWERPC_EXCP_POWER10) {
         lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
     } else
 #endif /* defined(TARGET_PPC64) */
@@ -848,7 +895,8 @@ static inline void powerpc_excp(PowerPCCPU *cpu, int excp_model, int excp)
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
index a53463b9b8..3bbd4cf6ac 100644
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
index 01fa76e4a0..78cd2243f4 100644
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


