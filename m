Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 97F1E50C03C
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:20:43 +0200 (CEST)
Received: from localhost ([::1]:51362 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhype-0000v8-Ll
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:20:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45346)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTc-00089t-8R; Fri, 22 Apr 2022 14:57:56 -0400
Received: from [187.72.171.209] (port=45652 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhyTa-0000lo-IV; Fri, 22 Apr 2022 14:57:55 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 6F35580031F;
 Fri, 22 Apr 2022 15:54:55 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 17/20] target/ppc: Substitute msr_fe macro with new M_MSR_FE
 macro
Date: Fri, 22 Apr 2022 15:54:47 -0300
Message-Id: <20220422185450.107256-18-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:55.0686 (UTC)
 FILETIME=[75079660:01D8567A]
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
 target/ppc/cpu.h         |  5 +++--
 target/ppc/excp_helper.c | 12 ++++++------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 1767a3a430..b957fc95e0 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -362,6 +362,9 @@ typedef enum {
 #define M_MSR_PR (1ull << MSR_PR)
 #define M_MSR_FP (1ull << MSR_FP)
 #define M_MSR_ME (1ull << MSR_ME)
+#define M_MSR_FE0 (1ull << MSR_FE0)
+#define M_MSR_FE1 (1ull << MSR_FE1)
+#define M_MSR_FE (M_MSR_FE0 | M_MSR_FE1)
 #define M_MSR_EP (1ull << MSR_EP)
 #define M_MSR_IR (1ull << MSR_IR)
 #define M_MSR_DR (1ull << MSR_DR)
@@ -483,8 +486,6 @@ typedef enum {
 #else
 #define msr_hv   (0)
 #endif
-#define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
-#define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ts   ((env->msr >> MSR_TS1)  & 3)
 
 #define DBCR0_ICMP (1 << 27)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 3e52061cd6..88e5eb91f1 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -478,7 +478,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || !(env->msr & M_MSR_FP)) {
+            if (!(env->msr & M_MSR_FE) || !(env->msr & M_MSR_FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -615,7 +615,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || !(env->msr & M_MSR_FP)) {
+            if (!(env->msr & M_MSR_FE) || !(env->msr & M_MSR_FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -788,7 +788,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || !(env->msr & M_MSR_FP)) {
+            if (!(env->msr & M_MSR_FE) || !(env->msr & M_MSR_FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -973,7 +973,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || !(env->msr & M_MSR_FP)) {
+            if (!(env->msr & M_MSR_FE) || !(env->msr & M_MSR_FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1171,7 +1171,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || !(env->msr & M_MSR_FP)) {
+            if (!(env->msr & M_MSR_FE) || !(env->msr & M_MSR_FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
@@ -1434,7 +1434,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_PROGRAM:   /* Program exception                        */
         switch (env->error_code & ~0xF) {
         case POWERPC_EXCP_FP:
-            if ((msr_fe0 == 0 && msr_fe1 == 0) || !(env->msr & M_MSR_FP)) {
+            if (!(env->msr & M_MSR_FE) || !(env->msr & M_MSR_FP)) {
                 trace_ppc_excp_fp_ignore();
                 powerpc_reset_excp_state(cpu);
                 return;
-- 
2.25.1


