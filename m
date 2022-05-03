Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 927755191E8
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 00:54:24 +0200 (CEST)
Received: from localhost ([::1]:46458 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm1PT-0004Ba-7P
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 18:54:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz7k-00077R-If; Tue, 03 May 2022 16:27:56 -0400
Received: from [187.72.171.209] (port=8548 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlz7j-0005tQ-01; Tue, 03 May 2022 16:27:56 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 3 May 2022 17:25:39 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 8EA64800491;
 Tue,  3 May 2022 17:25:39 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v3 17/21] target/ppc: Remove msr_fe0 and msr_fe1 macros
Date: Tue,  3 May 2022 17:24:37 -0300
Message-Id: <20220503202441.129549-18-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
References: <20220503202441.129549-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 03 May 2022 20:25:39.0948 (UTC)
 FILETIME=[F49B4AC0:01D85F2B]
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

msr_fe0 and msr_fe1 macros hide the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v3: Added a combined macro for FE0 and FE1. Use it to simplify
    conditionals. Removed Richard's R-b because of this change.
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         | 11 +++++++++--
 target/ppc/excp_helper.c | 18 ++++++------------
 2 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9683e6a359..cc7ca1d47d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -363,12 +363,21 @@ FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
+FIELD(MSR, FE0, MSR_FE0, 1)
+FIELD(MSR, FE1, MSR_FE1, 1)
 FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
 FIELD(MSR, DR, MSR_DR, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
 
+/*
+ * FE0 and FE1 bits are not side-by-side
+ * so we can't combine them using FIELD()
+ */
+#define FIELD_EX64_FE(msr) \
+    ((FIELD_EX64(msr, MSR, FE0) << 1) | FIELD_EX64(msr, MSR, FE1))
+
 /* PMU bits */
 #define MMCR0_FC     PPC_BIT(32)         /* Freeze Counters  */
 #define MMCR0_PMAO   PPC_BIT(56)         /* Perf Monitor Alert Ocurred */
@@ -484,8 +493,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #else
 #define msr_hv   (0)
 #endif
-#define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
-#define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 30baad0489..aa201c63c6 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -478,8 +478,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -616,8 +615,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -790,8 +788,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -976,8 +973,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1175,8 +1171,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1439,8 +1434,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
-                !FIELD_EX64(env->msr, MSR, FP)) {
+            if (!FIELD_EX64_FE(env->msr) || !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
-- 
2.25.1


