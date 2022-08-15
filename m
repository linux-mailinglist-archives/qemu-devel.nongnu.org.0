Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF6A593364
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:44:30 +0200 (CEST)
Received: from localhost ([::1]:52936 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNdCX-0001j5-W7
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:44:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrN-000089-6k; Mon, 15 Aug 2022 12:22:41 -0400
Received: from [200.168.210.66] (port=4179 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrI-0005wd-Rd; Mon, 15 Aug 2022 12:22:34 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:45 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id EF20A800186;
 Mon, 15 Aug 2022 13:20:44 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 10/13] target/ppc: remove unused interrupts from
 ppc_pending_interrupt_p7
Date: Mon, 15 Aug 2022 13:20:16 -0300
Message-Id: <20220815162020.2420093-11-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:45.0219 (UTC)
 FILETIME=[F8D39730:01D8B0C2]
X-Host-Lookup-Failed: Reverse DNS lookup failed for 200.168.210.66 (failed)
Received-SPF: pass client-ip=200.168.210.66;
 envelope-from=matheus.ferst@eldorado.org.br; helo=outlook.eldorado.org.br
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

The Hypervisor Virtualization Interrupt was introduced in PowerISA v3.0.
Critical Input, Watchdog Timer, and Fixed Interval Timer are only
defined for embedded CPUs. The Programmable Interval Timer is 40x-only.
The Event-Based Branch Facility was added in PowerISA v2.07.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/excp_helper.c | 38 --------------------------------------
 1 file changed, 38 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index a67ab28661..b4c1198ea2 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1731,15 +1731,6 @@ static int ppc_pending_interrupt_p7(CPUPPCState *env)
         }
     }
 
-    /* Hypervisor virtualization interrupt */
-    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
-        /* LPCR will be clear when not supported so this will work */
-        bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
-        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
-            return PPC_INTERRUPT_HVIRT;
-        }
-    }
-
     /* External interrupt can ignore MSR:EE under some circumstances */
     if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
         bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
@@ -1751,28 +1742,10 @@ static int ppc_pending_interrupt_p7(CPUPPCState *env)
             return PPC_INTERRUPT_EXT;
         }
     }
-    if (FIELD_EX64(env->msr, MSR, CE)) {
-        /* External critical interrupt */
-        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
-            return PPC_INTERRUPT_CEXT;
-        }
-    }
     if (async_deliver != 0) {
-        /* Watchdog timer on embedded PowerPC */
-        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
-            return PPC_INTERRUPT_WDT;
-        }
         if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
             return PPC_INTERRUPT_CDOORBELL;
         }
-        /* Fixed interval timer on embedded PowerPC */
-        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
-            return PPC_INTERRUPT_FIT;
-        }
-        /* Programmable interval timer on embedded PowerPC */
-        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
-            return PPC_INTERRUPT_PIT;
-        }
         /* Decrementer exception */
         if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
             return PPC_INTERRUPT_DECR;
@@ -1790,17 +1763,6 @@ static int ppc_pending_interrupt_p7(CPUPPCState *env)
         if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
             return PPC_INTERRUPT_THERM;
         }
-        /* EBB exception */
-        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
-            /*
-             * EBB exception must be taken in problem state and
-             * with BESCR_GE set.
-             */
-            if (FIELD_EX64(env->msr, MSR, PR) &&
-                (env->spr[SPR_BESCR] & BESCR_GE)) {
-                return PPC_INTERRUPT_EBB;
-            }
-        }
     }
 
     return 0;
-- 
2.25.1


