Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FDC350C02D
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:11:22 +0200 (CEST)
Received: from localhost ([::1]:59986 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhygb-0004dl-EX
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:11:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45074)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySL-00051A-7G; Fri, 22 Apr 2022 14:56:37 -0400
Received: from [187.72.171.209] (port=10601 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySI-0000Zc-K4; Fri, 22 Apr 2022 14:56:35 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id CC77980031F;
 Fri, 22 Apr 2022 15:54:54 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 11/20] target/ppc: Substitute msr_gs macro with new M_MSR_GS
 macro
Date: Fri, 22 Apr 2022 15:54:41 -0300
Message-Id: <20220422185450.107256-12-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:55.0077 (UTC)
 FILETIME=[74AAA950:01D8567A]
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
 target/ppc/cpu.h         | 2 +-
 target/ppc/helper_regs.c | 2 +-
 target/ppc/mmu_helper.c  | 4 ++--
 3 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index aa20a604ab..15f5d059a3 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#define M_MSR_GS (1ull << MSR_GS)
 #define M_MSR_POW (1ull << MSR_POW)
 #define M_MSR_CE (1ull << MSR_CE)
 #define M_MSR_ILE (1ull << MSR_ILE)
@@ -478,7 +479,6 @@ typedef enum {
 #define msr_hv   (0)
 #endif
 #define msr_cm   ((env->msr >> MSR_CM)   & 1)
-#define msr_gs   ((env->msr >> MSR_GS)   & 1)
 #define msr_fp   ((env->msr >> MSR_FP)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index a9bedfce50..2742938abf 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -233,7 +233,7 @@ int hreg_store_msr(CPUPPCState *env, target_ulong value, int alter_hv)
     }
     if ((env->mmu_model == POWERPC_MMU_BOOKE ||
          env->mmu_model == POWERPC_MMU_BOOKE206) &&
-        ((value >> MSR_GS) & 1) != msr_gs) {
+        !(value & env->msr & M_MSR_GS)) {
         cpu_interrupt_exittb(cs);
     }
     if (unlikely((env->flags & POWERPC_FLAG_TGPR) &&
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 142a717255..9044b7b036 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -935,7 +935,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     }
 
     if (((env->spr[SPR_BOOKE_MAS0] & MAS0_ATSEL) == MAS0_ATSEL_LRAT) &&
-        !msr_gs) {
+        !(env->msr & M_MSR_GS)) {
         /* XXX we don't support direct LRAT setting yet */
         fprintf(stderr, "cpu: don't support LRAT setting yet\n");
         return;
@@ -962,7 +962,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
                                POWERPC_EXCP_INVAL_INVAL, GETPC());
     }
 
-    if (msr_gs) {
+    if (env->msr & M_MSR_GS) {
         cpu_abort(env_cpu(env), "missing HV implementation\n");
     }
 
-- 
2.25.1


