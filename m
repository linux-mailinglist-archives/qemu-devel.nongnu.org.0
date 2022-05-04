Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D8E51B13A
	for <lists+qemu-devel@lfdr.de>; Wed,  4 May 2022 23:39:47 +0200 (CEST)
Received: from localhost ([::1]:52144 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nmMio-0004Op-G4
	for lists+qemu-devel@lfdr.de; Wed, 04 May 2022 17:39:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32946)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMHF-0005Yr-1b; Wed, 04 May 2022 17:11:17 -0400
Received: from [187.72.171.209] (port=23462 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <victor.colombo@eldorado.org.br>)
 id 1nmMHB-0000P9-Ne; Wed, 04 May 2022 17:11:15 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Wed, 4 May 2022 18:07:52 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 747DF800902;
 Wed,  4 May 2022 18:07:52 -0300 (-03)
From: =?UTF-8?q?V=C3=ADctor=20Colombo?= <victor.colombo@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, richard.henderson@linaro.org, balaton@eik.bme.hu,
 victor.colombo@eldorado.org.br
Subject: [PATCH v4 20/22] target/ppc: Remove msr_de macro
Date: Wed,  4 May 2022 18:05:39 -0300
Message-Id: <20220504210541.115256-21-victor.colombo@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
References: <20220504210541.115256-1-victor.colombo@eldorado.org.br>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 04 May 2022 21:07:52.0854 (UTC)
 FILETIME=[04BFD360:01D85FFB]
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

msr_de macro hides the usage of env->msr, which is a bad
behavior. Substitute it with FIELD_EX64 calls that explicitly use
env->msr as a parameter.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>

---

v4: Add this patch as an usage of msr_de was added in another patch
    https://patchew.org/QEMU/20220421011729.1148727-1-bmeng.cn@gmail.com/
Signed-off-by: Víctor Colombo <victor.colombo@eldorado.org.br>
---
 target/ppc/cpu.h         | 3 +--
 target/ppc/helper_regs.c | 4 ++--
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/target/ppc/cpu.h b/target/ppc/cpu.h
index 9f19b3c0a8..af249239d5 100644
--- a/target/ppc/cpu.h
+++ b/target/ppc/cpu.h
@@ -371,6 +371,7 @@ FIELD(MSR, PR, MSR_PR, 1)
 FIELD(MSR, FP, MSR_FP, 1)
 FIELD(MSR, ME, MSR_ME, 1)
 FIELD(MSR, FE0, MSR_FE0, 1)
+FIELD(MSR, DE, MSR_DE, 1)
 FIELD(MSR, FE1, MSR_FE1, 1)
 FIELD(MSR, EP, MSR_EP, 1)
 FIELD(MSR, IR, MSR_IR, 1)
@@ -495,8 +496,6 @@ FIELD(MSR, LE, MSR_LE, 1)
 #define HFSCR_MSGP     PPC_BIT(53) /* Privileged Message Send Facilities */
 #define HFSCR_IC_MSGP  0xA
 
-#define msr_de   ((env->msr >> MSR_DE)   & 1)
-
 #define DBCR0_ICMP (1 << 27)
 #define DBCR0_BRT (1 << 26)
 #define DBSR_ICMP (1 << 27)
diff --git a/target/ppc/helper_regs.c b/target/ppc/helper_regs.c
index 97cd263131..6159a15b7b 100644
--- a/target/ppc/helper_regs.c
+++ b/target/ppc/helper_regs.c
@@ -63,10 +63,10 @@ static uint32_t hreg_compute_hflags_value(CPUPPCState *env)
 
     if (ppc_flags & POWERPC_FLAG_DE) {
         target_ulong dbcr0 = env->spr[SPR_BOOKE_DBCR0];
-        if ((dbcr0 & DBCR0_ICMP) && msr_de) {
+        if ((dbcr0 & DBCR0_ICMP) && FIELD_EX64(env->msr, MSR, DE)) {
             hflags |= 1 << HFLAGS_SE;
         }
-        if ((dbcr0 & DBCR0_BRT) && msr_de) {
+        if ((dbcr0 & DBCR0_BRT) && FIELD_EX64(env->msr, MSR, DE)) {
             hflags |= 1 << HFLAGS_BE;
         }
     } else {
-- 
2.25.1


