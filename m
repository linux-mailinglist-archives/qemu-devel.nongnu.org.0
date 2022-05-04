Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4785151B093
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:28:20 +0200 (CEST)
Received: from localhost ([::1]:56954 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMXj-00058s-8g
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:28:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMFU-0004lQ-6v; Wed, 04 May 2022 17:09:28 -0400
Received: from [187.72.171.209] (port=31154 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMFS-0008Jd-O3; Wed, 04 May 2022 17:09:27 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:50 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 866BB800066;
 Wed,  4 May 2022 18:07:50 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 13/22] target/ppc: Remove msr_cm macro
Date: Wed,  4 May 2022 18:05:32 -0300
Message-Id: <20220504210541.115256-14-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:50.0931 (UTC)
 FILETIME=[039A6630:01D85FFB]
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

msr_cm macro hides the usage of env->msr, which is a bad behavior
Substitute it with FIELD_EX64 calls that explicitly use env->msr
as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/ppc/cpu.h        | 2 +-
 target/ppc/mmu_common.c | 2 +-
 target/ppc/mmu_helper.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 17b7f5f6d9..75a81d4304 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -354,6 +354,7 @@ typedef enum {
 #define MSR_RI   1  /* Recoverable interrupt                        1        */
 #define MSR_LE   0  /* Little-endian mode                           1 hflags */
 
+FIELD(MSR, CM, MSR_CM, 1)
 FIELD(MSR, GS, MSR_GS, 1)
 FIELD(MSR, POW, MSR_POW, 1)
 FIELD(MSR, CE, MSR_CE, 1)
@@ -480,7 +481,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #else
 #define msr_hv   (0)
 #endif
-#define msr_cm   ((env->msr >> MSR_CM)   & 1)
 #define msr_fe0  ((env->msr >> MSR_FE0)  & 1)
 #define msr_de   ((env->msr >> MSR_DE)   & 1)
 #define msr_fe1  ((env->msr >> MSR_FE1)  & 1)
diff --git a/target/ppc/mmu_common.c b/target/ppc/mmu_common.c
index 7e77b9b84a..031bb4493b 100644
--- a/target/ppc/mmu_common.c
+++ b/target/ppc/mmu_common.c
@@ -692,7 +692,7 @@ int ppcmas_tlb_check(CPUPPCState *env, ppcmas_tlb_t *tlb,
     hwaddr mask;
     uint32_t tlb_pid;
 
-    if (!msr_cm) {
+    if (!FIELD_EX64(env->msr, MSR, CM)) {
         /* In 32bit mode we can only address 32bit EAs */
         address = (uint32_t)address;
     }
diff --git a/target/ppc/mmu_helper.c b/target/ppc/mmu_helper.c
index 5bb5c71038..15239dc95b 100644
--- a/target/ppc/mmu_helper.c
+++ b/target/ppc/mmu_helper.c
@@ -1003,7 +1003,7 @@ void helper_booke206_tlbwe(CPUPPCState *env)
     /* Add a mask for page attributes */
     mask |= MAS2_ACM | MAS2_VLE | MAS2_W | MAS2_I | MAS2_M | MAS2_G | MAS2_E;
 
-    if (!msr_cm) {
+    if (!FIELD_EX64(env->msr, MSR, CM)) {
         /*
          * Executing a tlbwe instruction in 32-bit mode will set bits
          * 0:31 of the TLB EPN field to zero.
-- 
2.25.1


