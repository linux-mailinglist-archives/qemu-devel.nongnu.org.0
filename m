Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DC90D50C028
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:07:45 +0200 (CEST)
Received: from localhost ([::1]:51048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhyd7-0006Tj-05
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:07:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45054)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySI-0004vv-Kw; Fri, 22 Apr 2022 14:56:34 -0400
Received: from [187.72.171.209] (port=10601 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySG-0000Zc-0F; Fri, 22 Apr 2022 14:56:33 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:54 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id AD62480060F;
 Fri, 22 Apr 2022 15:54:54 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 10/20] target/ppc: Substitute msr_me macro with new M_MSR_ME
 macro
Date: Fri, 22 Apr 2022 15:54:40 -0300
Message-Id: <20220422185450.107256-11-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:54.0999 (UTC)
 FILETIME=[749EC270:01D8567A]
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
 target/ppc/cpu.h         |  2 +-
 target/ppc/excp_helper.c | 12 ++++++------
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index b79c00dd65..aa20a604ab 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -358,6 +358,7 @@ typedef enum {
 #define M_MSR_ILE (1ull << MSR_ILE)
 #define M_MSR_EE (1ull << MSR_EE)
 #define M_MSR_PR (1ull << MSR_PR)
+#define M_MSR_ME (1ull << MSR_ME)
 #define M_MSR_DS (1ull << MSR_DS)
 #define M_MSR_LE (1ull << MSR_LE)
 
@@ -479,7 +480,6 @@ typedef enum {
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
-#define msr_me   ((env->msr >> MSR_ME)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 91af089d2e..0548b493a7 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -444,7 +444,7 @@ static void powerpc_excp_40x(PowerPCCPU *cpu, int excp)
         srr1 = SPR_40x_SRR3;
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!(env->msr & M_MSR_ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -575,7 +575,7 @@ static void powerpc_excp_6xx(PowerPCCPU *cpu, int excp)
     case POWERPC_EXCP_CRITICAL:    /* Critical input                         */
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!(env->msr & M_MSR_ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -748,7 +748,7 @@ static void powerpc_excp_7xx(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!(env->msr & M_MSR_ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -933,7 +933,7 @@ static void powerpc_excp_74xx(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!(env->msr & M_MSR_ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -1128,7 +1128,7 @@ static void powerpc_excp_booke(PowerPCCPU *cpu, int excp)
         srr1 = SPR_BOOKE_CSRR1;
         break;
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!(env->msr & M_MSR_ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
@@ -1366,7 +1366,7 @@ static void powerpc_excp_books(PowerPCCPU *cpu, int excp)
 
     switch (excp) {
     case POWERPC_EXCP_MCHECK:    /* Machine check exception                  */
-        if (msr_me == 0) {
+        if (!(env->msr & M_MSR_ME)) {
             /*
              * Machine check exception is not enabled.  Enter
              * checkstop state.
-- 
2.25.1


