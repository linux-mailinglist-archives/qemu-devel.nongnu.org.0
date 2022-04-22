Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 76B4E50C05A
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:27:58 +0200 (CEST)
Received: from localhost ([::1]:38886 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhywf-0004Bm-JL
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:27:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTh-0008MH-5i; Fri, 22 Apr 2022 14:58:04 -0400
Received: from [187.72.171.209] (port=45652 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTf-0000lo-Fk; Fri, 22 Apr 2022 14:58:00 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id A6F5980060F;
 Fri, 22 Apr 2022 15:54:55 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 19/20] target/ppc: Substitute msr_hv macro with new M_MSR_HV
 macro
Date: Fri, 22 Apr 2022 15:54:49 -0300
Message-Id: <20220422185450.107256-20-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:55.0967 (UTC)
 FILETIME=[753276F0:01D8567A]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 187.72.171.209 (failed)
Received-SPF: pass client-ip=187.72.171.209;
 envelope-from=victor.colombo@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -4
X-Spam_score: -0.5
X-Spam_bar: /
X-Spam_report: (-0.5 / 5.0 requ) BAYES_00=-1.9, PDS_HP_HELO_NORDNS=0.659,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: danielhb413@gmail.com, richard.henderson@linaro.org, groug@kaod.org,
 victor.colombo@eldorado.org.br, clg@kaod.org, david@gibson.dropbear.id.au
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         | 11 +++++------
 target/ppc/cpu_init.c    |  4 ++--
 target/ppc/excp_helper.c |  9 +++++----
 target/ppc/mem_helper.c  |  5 +++--
 target/ppc/misc_helper.c |  2 +-
 target/ppc/mmu-radix64.c |  6 +++---
 6 files changed, 19 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index ee00b27818..3cbecc96d8 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,11 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#if defined(TARGET_PPC64)
+#define M_MSR_HV (1ull << MSR_HV)
+#else
+#define M_MSR_HV 0
+#endif
 #define M_MSR_TS0 (1ull << MSR_TS0)
 #define M_MSR_TS1 (1ull << MSR_TS1)
 #define M_MSR_TS (M_MSR_TS0 | M_MSR_TS1)
@@ -484,12 +489,6 @@ typedef enum {
 #define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities */
 #define HFSCR_IC_MSGP  0xA
 
-#if defined(TARGET_PPC64)
-#define msr_hv   ((env->msr >> MSR_HV)   & 1)
-#else
-#define msr_hv   (0)
-#endif
-
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
 #define DBSR_ICMP (1 << 27)
diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 4d949ab1f1..d2a7911a86 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6305,7 +6305,7 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !msr_hv || (env->msr & M_MSR_PR)) {
+            if (!heic || !(env->msr & M_MSR_HV) || (env->msr & M_MSR_PR)) {
                 return true;
             }
         }
@@ -6520,7 +6520,7 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !msr_hv || (env->msr & M_MSR_PR)) {
+            if (!heic || !(env->msr & M_MSR_HV) || (env->msr & M_MSR_PR)) {
                 return true;
             }
         }
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 88e5eb91f1..06bee7689b 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1715,7 +1715,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
         /* LPCR will be clear when not supported so this will work */
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
-        if ((async_deliver || msr_hv == 0) && hdice) {
+        if ((async_deliver || !(env->msr & M_MSR_HV)) && hdice) {
             /* HDEC clears on delivery */
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
             powerpc_excp(cpu, POWERPC_EXCP_HDECR);
@@ -1727,7 +1727,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HVIRT)) {
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
-        if ((async_deliver || msr_hv == 0) && hvice) {
+        if ((async_deliver || !(env->msr & M_MSR_HV)) && hvice) {
             powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             return;
         }
@@ -1738,8 +1738,9 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
-        if ((async_deliver && !(heic && msr_hv && !(env->msr & M_MSR_PR))) ||
-            (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
+        if ((async_deliver && !(heic && (env->msr & M_MSR_HV) &&
+            !(env->msr & M_MSR_PR))) ||
+            (env->has_hv_mode && !(env->msr & M_MSR_HV) && !lpes0)) {
             if (books_vhyp_promotes_external_to_hvirt(cpu)) {
                 powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             } else {
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 8ff99a6568..d3964a7eb0 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -612,11 +612,12 @@ void helper_tbegin(CPUPPCState *env)
     env->spr[SPR_TEXASR] =
         (1ULL << TEXASR_FAILURE_PERSISTENT) |
         (1ULL << TEXASR_NESTING_OVERFLOW) |
-        (msr_hv << TEXASR_PRIVILEGE_HV) |
+        (!!(env->msr & M_MSR_HV) << TEXASR_PRIVILEGE_HV) |
         (!!(env->msr & M_MSR_PR) << TEXASR_PRIVILEGE_PR) |
         (1ULL << TEXASR_FAILURE_SUMMARY) |
         (1ULL << TEXASR_TFIAR_EXACT);
-    env->spr[SPR_TFIAR] = env->nip | (msr_hv << 1) | !!(env->msr & M_MSR_PR);
+    env->spr[SPR_TFIAR] = env->nip | (!!(env->msr & M_MSR_HV) << 1) |
+                          !!(env->msr & M_MSR_PR);
     env->spr[SPR_TFHAR] = env->nip + 4;
     env->crf[0] = 0xB; /* 0b1010 = transaction failure */
 }
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 06aa716cab..90b97abb07 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -73,7 +73,7 @@ void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
                                  const char *caller, uint32_t cause)
 {
 #ifdef TARGET_PPC64
-    if ((env->msr_mask & MSR_HVB) && !msr_hv &&
+    if ((env->msr_mask & MSR_HVB) && !(env->msr & M_MSR_HV) &&
                                      !(env->spr[SPR_HFSCR] & (1UL << bit))) {
         raise_hv_fu_exception(env, bit, caller, cause, GETPC());
     }
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index d7b8b97ee7..09b202071d 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -37,7 +37,7 @@ static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
         return false;
     }
 
-    if (msr_hv) { /* MSR[HV] -> Hypervisor/bare metal */
+    if (env->msr & M_MSR_HV) { /* MSR[HV] -> Hypervisor/bare metal */
         switch (eaddr & R_EADDR_QUADRANT) {
         case R_EADDR_QUADRANT0:
             *lpid = 0;
@@ -305,7 +305,7 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
     if (!(pate->dw0 & PATE0_HR)) {
         return false;
     }
-    if (lpid == 0 && !msr_hv) {
+    if (lpid == 0 && !(env->msr & M_MSR_HV)) {
         return false;
     }
     if ((pate->dw0 & PATE1_R_PRTS) < 5) {
@@ -430,7 +430,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     *g_page_size = PRTBE_R_GET_RTS(prtbe0);
     base_addr = prtbe0 & PRTBE_R_RPDB;
     nls = prtbe0 & PRTBE_R_RPDS;
-    if (msr_hv || vhyp_flat_addressing(cpu)) {
+    if ((env->msr & M_MSR_HV) || vhyp_flat_addressing(cpu)) {
         /*
          * Can treat process table addresses as real addresses
          */
-- 
2.25.1


