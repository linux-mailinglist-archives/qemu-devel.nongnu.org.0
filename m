Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 10C3E51B07F
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:27:18 +0200 (CEST)
Received: from localhost ([::1]:53948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMWj-00031Q-5M
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:27:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60612)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMFR-0004iT-NV; Wed, 04 May 2022 17:09:25 -0400
Received: from [187.72.171.209] (port=31154 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMFQ-0008Jd-2k; Wed, 04 May 2022 17:09:25 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 435D5800902;
 Wed,  4 May 2022 18:07:50 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 12/22] target/ppc: Remove msr_fp macro
Date: Wed,  4 May 2022 18:05:31 -0300
Message-Id: <20220504210541.115256-13-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:50.0634 (UTC)
 FILETIME=[036D14A0:01D85FFB]
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

msr_fp macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h         |  2 +-
 target/ppc/excp_helper.c | 18 ++++++++++++------
 2 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index bd5dffc9b1..17b7f5f6d9 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -360,6 +360,7 @@ FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
 FIELD(MSR, EE, MSR_EE, 1)
 FIELD(MSR, PR, MSR_PR, 1)
+FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, DS, MSR_DS, 1)
 FIELD(MSR, LE, MSR_LE, 1)
@@ -480,7 +481,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index e254ae806c..30baad0489 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -478,7 +478,8 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -615,7 +616,8 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -788,7 +790,8 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -973,7 +976,8 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1171,7 +1175,8 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1434,7 +1439,8 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || msr_fp == 0) {
+            if ((msr_fe0 == 0 && msr_fe1 == 0) ||
+                !FIELD_EX64(env->msr, MSR, FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
-- 
2.25.1


