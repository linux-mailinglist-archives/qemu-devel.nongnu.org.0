Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CB3F051B066
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:23:35 +0200 (CEST)
Received: from localhost ([::1]:47226 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMT8-0006iW-Sv
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:23:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60314)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMEL-0002FG-Gw; Wed, 04 May 2022 17:08:17 -0400
Received: from [187.72.171.209] (port=62190 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMEJ-0007Ne-VB; Wed, 04 May 2022 17:08:17 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:49 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 62EDA800066;
 Wed,  4 May 2022 18:07:49 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 09/22] target/ppc: Remove msr_pow macro
Date: Wed,  4 May 2022 18:05:28 -0300
Message-Id: <20220504210541.115256-10-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:49.0806 (UTC)
 FILETIME=[02EEBCE0:01D85FFB]
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

msr_pow macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/excp_helper.c | 12 ++++++------
 target/ppc/helper_regs.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b1883b23e2..5a83c4b028 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, POW, MSR_POW, 1)
 FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
@@ -478,7 +479,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
-#define msr_pow  ((env->msr >> MSR_POW)  & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index ca80c1ed63..ee63641dd0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -661,7 +661,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_ITLB:      /* Instruction TLB error                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -853,7 +853,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -1038,7 +1038,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_DECR:      /* Decrementer exception                    */
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -1248,7 +1248,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         env->spr[SPR_BOOKE_ESR] = ESR_SPV;
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             cpu_abort(cs, "Trying to deliver power-saving system reset "
                       "exception %d with no HV support\n", excp);
         }
@@ -1507,7 +1507,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
         break;
     case POWERPC_EXCP_RESET:     /* System reset exception                   */
         /* A power-saving exception sets ME, otherwise it is unchanged */
-        if (msr_pow) {
+        if (FIELD_EX64(env->msr, MSR, POW)) {
             /* indicate that we resumed from power save mode */
             msr |= 0x10000;
             new_msr |= ((target_ulong)1 << MSR_ME);
@@ -1519,7 +1519,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
              */
             new_msr |= (target_ulong)MSR_HVB;
         } else {
-            if (msr_pow) {
+            if (FIELD_EX64(env->msr, MSR, POW)) {
                 cpu_abort(cs, "Trying to deliver power-saving system reset "
                           "exception %d with no HV support\n", excp);
             }
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 77bc57415c..79c0143a7a 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -261,7 +261,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     env->msr = value;
     hreg_compute_hflags(env);
 #if !defined(CONFIG_USER_ONLY)
-    if (unlikely(msr_pow == 1)) {
+    if (unlikely(FIELD_EX64(env->msr, MSR, POW))) {
         if (!env->pending_interrupts && (*env->check_pow)(env)) {
             cs->halted = 1;
             excp = EXCP_HALTED;
-- 
2.25.1


