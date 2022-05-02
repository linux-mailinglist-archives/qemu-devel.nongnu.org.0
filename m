Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D4A5B517219
	for <lists+qemu-devel@lfdr.de>; Mon,  2 May 2022 17:00:45 +0200 (CEST)
Received: from localhost ([::1]:55454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nlXXY-0005D4-RK
	for lists+qemu-devel@lfdr.de; Mon, 02 May 2022 11:00:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53876)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXEB-0003kF-C1; Mon, 02 May 2022 10:40:43 -0400
Received: from [187.72.171.209] (port=32289 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nlXE9-0002wc-R6; Mon, 02 May 2022 10:40:43 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 2 May 2022 11:40:03 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7B0BD8001CD;
 Mon,  2 May 2022 11:40:03 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH v2 11/21] target/ppc: Remove msr_gs macro
Date: Mon,  2 May 2022 11:39:24 -0300
Message-Id: <20220502143934.71908-12-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
References: <20220502143934.71908-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 02 May 2022 14:40:03.0933 (UTC)
 FILETIME=[8290C0D0:01D85E32]
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

msr_gs macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v2: Remove M_MSR_GS and use FIELD_EX64 instead
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         | 2 +-
 target/ppc/helper_regs.c | 2 +-
 target/ppc/mmu_helper.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 059a00ed65..4b69cd666d 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, GS, MSR_GS, 1)
 FIELD(MSR, POW, MSR_POW, 1)
 FIELD(MSR, CE, MSR_CE, 1)
 FIELD(MSR, ILE, MSR_ILE, 1)
@@ -479,7 +480,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 940f0207a0..88fcc01589 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -233,7 +233,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     }
     if ((env->mmu_model == POWERPC_MMU_BOOKE ||
          env->mmu_model == POWERPC_MMU_BOOKE206) &&
-        ((value >> MSR_GS) & 1) != msr_gs) {
+        !(value & env->msr & R_MSR_GS_MASK)) {
         cpu_interrupt_exittb(cs);
     }
     if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 142a717255..5bb5c71038 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -935,7 +935,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     }
 
     if (((env->spr[SPR_BOOKE_MAS0] & MAS0_ATSEL) == MAS0_ATSEL_LRAT) &&
-        !msr_gs) {
+        !FIELD_EX64(env->msr, MSR, GS)) {
         /* XXX we don't support direct LRAT setting yet */
         fprintf(stderr, "cpu: don't support LRAT setting yet\n");
         return;
@@ -962,7 +962,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
                                POWERPC_EXCP_INVAL_INVAL, GETPC());
     }
 
-    if (msr_gs) {
+    if (FIELD_EX64(env->msr, MSR, GS)) {
         cpu_abort(env_cpu(env), "missing HV implementation\n");
     }
 
-- 
2.25.1


