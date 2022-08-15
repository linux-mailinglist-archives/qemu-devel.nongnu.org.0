Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A00C593363
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Aug 2022 18:44:28 +0200 (CEST)
Received: from localhost ([::1]:52930 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNdCV-0001ap-DX
	for lists+qemu-devel@lfdr.de; Mon, 15 Aug 2022 12:44:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrC-0008NV-RZ; Mon, 15 Aug 2022 12:22:26 -0400
Received: from [200.168.210.66] (port=4179 helo=outlook.eldorado.org.br)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <matheus.ferst@eldorado.org.br>)
 id 1oNcrB-0005wd-99; Mon, 15 Aug 2022 12:22:26 -0400
Received: from p9ibm ([10.10.71.235]) by outlook.eldorado.org.br over TLS
 secured channel with Microsoft SMTPSVC(8.5.9600.16384); 
 Mon, 15 Aug 2022 13:20:44 -0300
Received: from eldorado.org.br (unknown [10.10.70.45])
 by p9ibm (Postfix) with ESMTP id 9BB4F800186;
 Mon, 15 Aug 2022 13:20:44 -0300 (-03)
From: Matheus Ferst <matheus.ferst@eldorado.org.br>
To: qemu-devel@nongnu.org,
	qemu-ppc@nongnu.org
Cc: clg@kaod.org, danielhb413@gmail.com, david@gibson.dropbear.id.au,
 groug@kaod.org, fbarrat@linux.ibm.com, alex.bennee@linaro.org,
 Matheus Ferst <matheus.ferst@eldorado.org.br>
Subject: [RFC PATCH 08/13] target/ppc: remove unused interrupts from
 ppc_pending_interrupt_p8
Date: Mon, 15 Aug 2022 13:20:14 -0300
Message-Id: <20220815162020.2420093-9-matheus.ferst@eldorado.org.br>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
References: <20220815162020.2420093-1-matheus.ferst@eldorado.org.br>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-OriginalArrivalTime: 15 Aug 2022 16:20:44.0860 (UTC)
 FILETIME=[F89CCFC0:01D8B0C2]
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

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
---
 target/ppc/excp_helper.c | 27 ---------------------------
 1 file changed, 27 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 13c2d5e2ce..0dbd385bf0 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1739,15 +1739,6 @@ static int ppc_pending_interrupt_p8(CPUPPCState *env)
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
@@ -1759,28 +1750,10 @@ static int ppc_pending_interrupt_p8(CPUPPCState *env)
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
-- 
2.25.1


