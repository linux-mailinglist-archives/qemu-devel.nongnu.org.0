Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C04325ECEF3
	for <lists+qemu-devel@lfdr.de>; Tue, 27 Sep 2022 22:50:02 +0200 (CEST)
Received: from localhost ([::1]:41540 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1odHWj-0001hh-OZ
	for lists+qemu-devel@lfdr.de; Tue, 27 Sep 2022 16:50:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38808)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH3m-0004Ub-C7; Tue, 27 Sep 2022 16:20:08 -0400
Received: from [200.168.210.66] (port=2929 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1odH3k-00039l-N8; Tue, 27 Sep 2022 16:20:06 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 27 Sep 2022 17:16:00 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 7F48C800476;
 Tue, 27 Sep 2022 17:16:00 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH v2 24/29] target/ppc: move power-saving interrupt masking
 out of cpu_has_work_POWER7
Date: Tue, 27 Sep 2022 17:15:39 -0300
Message-Id: <20220927201544.4088567-25-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
References: <20220927201544.4088567-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 27 Sep 2022 20:16:00.0749 (UTC)
 FILETIME=[F619C9D0:01D8D2AD]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
X-Spam_score_int: -10
X-Spam_score: -1.1
X-Spam_bar: -
X-Spam_report: (-1.1 / 5.0 requ) BAYES_00=-1.9, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Move the interrupt masking logic out of cpu_has_work_POWER7 in a new
method, p7_interrupt_powersave, that only returns an interrupt if it can
wake the processor from power-saving mode. No functional change
intended.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/cpu_init.c | 45 ++++++++++++++++++++++++-------------------
 1 file changed, 25 insertions(+), 20 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 319d2355ec..dd127cbeea 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5960,6 +5960,30 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
+static int p7_interrupt_powersave(CPUPPCState *env)
+{
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
+        return PPC_INTERRUPT_EXT;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return PPC_INTERRUPT_MCK;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
+        return PPC_INTERRUPT_HMI;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static bool cpu_has_work_POWER7(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -5969,26 +5993,7 @@ static bool cpu_has_work_POWER7(CPUState *cs)
         if (!(cs->interrupt_request & CPU_INTERRUPT_HARD)) {
             return false;
         }
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-            (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
+        return p7_interrupt_powersave(env) != 0;
     } else {
         return FIELD_EX64(env->msr, MSR, EE) &&
                (cs->interrupt_request & CPU_INTERRUPT_HARD);
-- 
2.25.1


