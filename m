Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9692450C033
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 21:15:07 +0200 (CEST)
Received: from localhost ([::1]:40696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhykE-0002C2-KD
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 15:15:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45112)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySQ-0005Ei-9y; Fri, 22 Apr 2022 14:56:42 -0400
Received: from [187.72.171.209] (port=10601 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nhySO-0000Zc-Ne; Fri, 22 Apr 2022 14:56:41 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Fri, 22 Apr 2022 15:54:55 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 0D98780060F;
 Fri, 22 Apr 2022 15:54:55 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Subject: [PATCH 13/20] target/ppc: Substitute msr_cm macro with new M_MSR_CM
 macro
Date: Fri, 22 Apr 2022 15:54:43 -0300
Message-Id: <20220422185450.107256-14-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
References: <20220422185450.107256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 22 Apr 2022 18:54:55.0296 (UTC)
 FILETIME=[74CC1400:01D8567A]
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
 target/ppc/cpu.h        | 2 +-
 target/ppc/mmu_common.c | 2 +-
 target/ppc/mmu_helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 634c05a9d2..e26530fa09 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -353,6 +353,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+#define M_MSR_CM (1ull << MSR_CM)
 #define M_MSR_GS (1ull << MSR_GS)
 #define M_MSR_POW (1ull << MSR_POW)
 #define M_MSR_CE (1ull << MSR_CE)
@@ -479,7 +480,6 @@ typedef enum {
 #else
 #define msr_hv   (0)
 #endif
-#define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
 #define msr_ep   ((env->msr >> MSR_EP)   & 1)
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index b7865d24b2..a82649f2ff 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -692,7 +692,7 @@ int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
     hwaddr mask;
     uint32_t tlb_pid;
 
-    if (!msr_cm) {
+    if (!(env->msr & M_MSR_CM)) {
         /* In 32bit mode we can only address 32bit EAs */
         address = (uint32_t)address;
     }
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 9044b7b036..6c49920d0a 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1003,7 +1003,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     /* Add a mask for page attributes */
     mask |= MAS2_ACM | MAS2_VLE | MAS2_W | MAS2_I | MAS2_M | MAS2_G | MAS2_E;
 
-    if (!msr_cm) {
+    if (!(env->msr & M_MSR_CM)) {
         /*
          * Executing a tlbwe instruction in 32-bit mode will set bits
          * 0:31 of the TLB EPN field to zero.
-- 
2.25.1


