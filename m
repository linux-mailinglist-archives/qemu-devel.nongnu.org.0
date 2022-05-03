Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07088519186
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:39:41 +0200 (CEST)
Received: from localhost ([::1]:45512 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1BD-0001q0-T0
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:39:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz8A-000871-53; Tue, 03 May 2022 16:28:22 -0400
Received: from [187.72.171.209] (port=8548 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz88-0005tQ-EQ; Tue, 03 May 2022 16:28:21 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 3 May 2022 17:25:40 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 263D4800491;
 Tue,  3 May 2022 17:25:40 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 19/21] target/ppc: Remove msr_hv macro
Date: Tue,  3 May 2022 17:24:39 -0300
Message-Id: <20220503202441.129549-20-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2022 20:25:40.0573 (UTC)
 FILETIME=[F4FAA8D0:01D85F2B]
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

msr_hv macro hides the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         | 12 ++++++------
 target/ppc/cpu_init.c    |  6 ++++--
 target/ppc/excp_helper.c |  8 ++++----
 target/ppc/mem_helper.c  |  4 ++--
 target/ppc/misc_helper.c |  2 +-
 target/ppc/mmu-radix64.c |  6 +++---
 6 files changed, 20 insertions(+), 18 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index daf1204a6a..f16a56fc55 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,12 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#if defined(TARGET_PPC64)
+FIELD(MSR, HV, MSR_HV, 1)
+#define FIELD_EX64_HV(storage) FIELD_EX64(storage, MSR, HV)
+#else
+#define FIELD_EX64_HV(storage) 0
+#endif
 FIELD(MSR, TS, MSR_TS0, 2)
 FIELD(MSR, CM, MSR_CM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
@@ -489,12 +495,6 @@ FIELD(MSR, LE, MSR_LE, 1)
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
index 10e7c41bc9..d4c7813de5 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6305,7 +6305,8 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !msr_hv || FIELD_EX64(env->msr, MSR, PR)) {
+            if (!heic || !FIELD_EX64_HV(env->msr) ||
+                FIELD_EX64(env->msr, MSR, PR)) {
                 return true;
             }
         }
@@ -6520,7 +6521,8 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         if ((env->pending_interrupts & (1u << PPC_INTERRUPT_EXT)) &&
             (env->spr[SPR_LPCR] & LPCR_EEE)) {
             bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !msr_hv || FIELD_EX64(env->msr, MSR, PR)) {
+            if (!heic || !FIELD_EX64_HV(env->msr) ||
+                FIELD_EX64(env->msr, MSR, PR)) {
                 return true;
             }
         }
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index aa201c63c6..cb752b184a 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1715,7 +1715,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HDECR)) {
         /* LPCR will be clear when not supported so this will work */
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
-        if ((async_deliver || msr_hv == 0) && hdice) {
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
             env->pending_interrupts &= ~(1 << PPC_INTERRUPT_HDECR);
             powerpc_excp(cpu, POWERPC_EXCP_HDECR);
@@ -1727,7 +1727,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
     if (env->pending_interrupts & (1 << PPC_INTERRUPT_HVIRT)) {
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
-        if ((async_deliver || msr_hv == 0) && hvice) {
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
             powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             return;
         }
@@ -1738,9 +1738,9 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
         bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
         /* HEIC blocks delivery to the hypervisor */
-        if ((async_deliver && !(heic && msr_hv &&
+        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
             !FIELD_EX64(env->msr, MSR, PR))) ||
-            (env->has_hv_mode && msr_hv == 0 && !lpes0)) {
+            (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
             if (books_vhyp_promotes_external_to_hvirt(cpu)) {
                 powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
             } else {
diff --git a/target/ppc/mem_helper.c b/target/ppc/mem_helper.c
index 9af135e88e..d1163f316c 100644
--- a/target/ppc/mem_helper.c
+++ b/target/ppc/mem_helper.c
@@ -612,11 +612,11 @@ void helper_tbegin(CPUPPCState *env)
     env->spr[SPR_TEXASR] =
         (1ULL << TEXASR_FAILURE_PERSISTENT) |
         (1ULL << TEXASR_NESTING_OVERFLOW) |
-        (msr_hv << TEXASR_PRIVILEGE_HV) |
+        (FIELD_EX64_HV(env->msr) << TEXASR_PRIVILEGE_HV) |
         (FIELD_EX64(env->msr, MSR, PR) << TEXASR_PRIVILEGE_PR) |
         (1ULL << TEXASR_FAILURE_SUMMARY) |
         (1ULL << TEXASR_TFIAR_EXACT);
-    env->spr[SPR_TFIAR] = env->nip | (msr_hv << 1) |
+    env->spr[SPR_TFIAR] = env->nip | (FIELD_EX64_HV(env->msr) << 1) |
                           FIELD_EX64(env->msr, MSR, PR);
     env->spr[SPR_TFHAR] = env->nip + 4;
     env->crf[0] = 0xB; /* 0b1010 = transaction failure */
diff --git a/target/ppc/misc_helper.c b/target/ppc/misc_helper.c
index 06aa716cab..b0a5e7ce76 100644
--- a/target/ppc/misc_helper.c
+++ b/target/ppc/misc_helper.c
@@ -73,7 +73,7 @@ void helper_hfscr_facility_check(CPUPPCState *env, uint32_t bit,
                                  const char *caller, uint32_t cause)
 {
 #ifdef TARGET_PPC64
-    if ((env->msr_mask & MSR_HVB) && !msr_hv &&
+    if ((env->msr_mask & MSR_HVB) && !FIELD_EX64(env->msr, MSR, HV) &&
                                      !(env->spr[SPR_HFSCR] & (1UL << bit))) {
         raise_hv_fu_exception(env, bit, caller, cause, GETPC());
     }
diff --git a/target/ppc/mmu-radix64.c b/target/ppc/mmu-radix64.c
index e88f51fd34..21ac958e48 100644
--- a/target/ppc/mmu-radix64.c
+++ b/target/ppc/mmu-radix64.c
@@ -37,7 +37,7 @@ static bool ppc_radix64_get_fully_qualified_addr(const CPUPPCState *env,
         return false;
     }
 
-    if (msr_hv) { /* MSR[HV] -> Hypervisor/bare metal */
+    if (FIELD_EX64(env->msr, MSR, HV)) { /* MSR[HV] -> Hypervisor/bare metal */
         switch (eaddr & R_EADDR_QUADRANT) {
         case R_EADDR_QUADRANT0:
             *lpid = 0;
@@ -306,7 +306,7 @@ static bool validate_pate(PowerPCCPU *cpu, uint64_t lpid, ppc_v3_pate_t *pate)
     if (!(pate->dw0 & PATE0_HR)) {
         return false;
     }
-    if (lpid == 0 && !msr_hv) {
+    if (lpid == 0 && !FIELD_EX64(env->msr, MSR, HV)) {
         return false;
     }
     if ((pate->dw0 & PATE1_R_PRTS) < 5) {
@@ -431,7 +431,7 @@ static int ppc_radix64_process_scoped_xlate(PowerPCCPU *cpu,
     *g_page_size = PRTBE_R_GET_RTS(prtbe0);
     base_addr = prtbe0 & PRTBE_R_RPDB;
     nls = prtbe0 & PRTBE_R_RPDS;
-    if (msr_hv || vhyp_flat_addressing(cpu)) {
+    if (FIELD_EX64(env->msr, MSR, HV) || vhyp_flat_addressing(cpu)) {
         /*
          * Can treat process table addresses as real addresses
          */
-- 
2.25.1


