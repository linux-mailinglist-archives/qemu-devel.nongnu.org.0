Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A17095FBD09
	for <lists+qemu-devel@lfdr.de>; Tue, 11 Oct 2022 23:34:00 +0200 (CEST)
Received: from localhost ([::1]:39696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oiMss-0004fV-Lj
	for lists+qemu-devel@lfdr.de; Tue, 11 Oct 2022 17:33:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMFi-0002xS-IU; Tue, 11 Oct 2022 16:53:27 -0400
Received: from [200.168.210.66] (port=63259 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oiMFg-0002Fr-O5; Tue, 11 Oct 2022 16:53:26 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Tue, 11 Oct 2022 17:48:43 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id BCAA08001F1;
 Tue, 11 Oct 2022 17:48:42 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 farosas@linux.ibm.com, Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [PATCH v3 15/29] target/ppc: remove unused interrupts from
 p8_deliver_interrupt
Date: Tue, 11 Oct 2022 17:48:15 -0300
Message-Id: <20221011204829.1641124-16-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
References: <20221011204829.1641124-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 11 Oct 2022 20:48:43.0031 (UTC)
 FILETIME=[D97EC270:01D8DDB2]
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

Remove the following unused interrupts from the POWER8 interrupt
processing method:
- PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
- Debug Interrupt: removed in Power ISA v2.07;
- Hypervisor Virtualization: introduced in Power ISA v3.0;
- Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
  for embedded CPUs;
- Critical Doorbell: processor does not implement the
  "Embedded.Processor Control" category;
- Programmable Interval Timer: 40x-only;
- PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
v3:
 - Keep Hypervisor and Privileged Doorbell interrupts, the category for
   processor control instruction became "Embedded.Processor Control" or
   "Server" on Power ISA v2.07, so the interrupts are still necessary.
---
 target/ppc/excp_helper.c | 36 ------------------------------------
 1 file changed, 36 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 1d1b26b8d8..662daad796 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1984,29 +1984,16 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
     CPUState *cs = env_cpu(env);
 
     switch (interrupt) {
-    case PPC_INTERRUPT_RESET: /* External reset */
-        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
-        powerpc_excp(cpu, POWERPC_EXCP_RESET);
-        break;
     case PPC_INTERRUPT_MCK: /* Machine check exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
         powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
         break;
-#if 0 /* TODO */
-    case PPC_INTERRUPT_DEBUG: /* External debug exception */
-        env->pending_interrupts &= ~PPC_INTERRUPT_DEBUG;
-        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
-        break;
-#endif
 
     case PPC_INTERRUPT_HDECR: /* Hypervisor decrementer exception */
         /* HDEC clears on delivery */
         env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
         powerpc_excp(cpu, POWERPC_EXCP_HDECR);
         break;
-    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
-        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-        break;
 
     case PPC_INTERRUPT_EXT:
         if (books_vhyp_promotes_external_to_hvirt(cpu)) {
@@ -2015,26 +2002,7 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
             powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
         }
         break;
-    case PPC_INTERRUPT_CEXT: /* External critical interrupt */
-        powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
-        break;
 
-    case PPC_INTERRUPT_WDT: /* Watchdog timer on embedded PowerPC */
-        env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
-        powerpc_excp(cpu, POWERPC_EXCP_WDT);
-        break;
-    case PPC_INTERRUPT_CDOORBELL:
-        env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
-        powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
-        break;
-    case PPC_INTERRUPT_FIT: /* Fixed interval timer on embedded PowerPC */
-        env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
-        powerpc_excp(cpu, POWERPC_EXCP_FIT);
-        break;
-    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded PowerPC */
-        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
-        powerpc_excp(cpu, POWERPC_EXCP_PIT);
-        break;
     case PPC_INTERRUPT_DECR: /* Decrementer exception */
         if (ppc_decr_clear_on_delivery(env)) {
             env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
@@ -2057,10 +2025,6 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
         env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
         powerpc_excp(cpu, POWERPC_EXCP_PERFM);
         break;
-    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
-        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
-        powerpc_excp(cpu, POWERPC_EXCP_THERM);
-        break;
     case PPC_INTERRUPT_EBB: /* EBB exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
         if (env->spr[SPR_BESCR] & BESCR_PMEO) {
-- 
2.25.1


