Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BEC06117FB
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:48:14 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSE-0004g0-UG; Fri, 28 Oct 2022 12:43:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRV-0006Pj-Cd; Fri, 28 Oct 2022 12:42:49 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRT-0000Wk-Eh; Fri, 28 Oct 2022 12:42:49 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13ae8117023so6863571fac.9; 
 Fri, 28 Oct 2022 09:42:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=XkeXzKRu3IzCRK5CnD2Ad5iL9BjLmwVEpCH96Ljrr6w=;
 b=YQtOmZMLxR2iucBJjGcRqJg6HLC/ownXnscx2amaqgdVFeAWGW2x95tVGa99BxjWum
 9XrxdiyGOw3lUoIS6H6xU5XekZ/2TcoQuSVCnETqY9PtFOmT8Yokg/EUpNvOQukK13LT
 FTydtLnGZx1S4aK7JduDFPa49q2hvUT4W6jHdrEyy3WlMYIgJjomdWgm+zD6O4HPgEd3
 pqtFmHN+f3hB5VpI2wT6wkp0U262/eVu5ooG539vD5m9FVk4jf9QPiOM//OS9gllDr3/
 nSAWekkUIGiNtNbVY4XZIbH7dcNDDAjIhpjJCU8GOQSun5Z6BkNvBzXH30T3/VghLTO1
 K4PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XkeXzKRu3IzCRK5CnD2Ad5iL9BjLmwVEpCH96Ljrr6w=;
 b=8RcTBlat5dFmb/U0V26ECYRjTz1wpC1Z5al4QtqDrtbPs5BaWZN0qyQK5wt++bJBsg
 +ILZTnuLCyJqQyYro+yhmm8sJeLPn9KrKE6H4SnyOVS/pz2TJBye/uQIHBnnzLU7umBu
 ChfKrwUpiOrMEB8f9zYN3aRn/kcv2EC9SnOCPbyuwJK5EZbQuN/yJ79cfCrbl+RyLFVz
 h/ogFkAy22xjPcVY/HQArnrRa2R68lTNzjH3o2SW9lI1A7R7vGaJYW2FDFDokn64r2Mu
 9X2NkTTHzPyJuRHtqWA+1eMtRUGkRWpDm6K3lQ7k3VyXVYhdk8DR0r+NUZepxdgsVPxB
 87VQ==
X-Gm-Message-State: ACrzQf0dKTML59zoDFRIORXsqn75GIkZIDMJPC65D4B34DUghBaKaYOT
 RwTUbPUfIsYK9FghB8TSfS6gSUaaa1lfJQ==
X-Google-Smtp-Source: AMsMyM59HoZHmKxx2tyPn9VTqxb5tTYSJafrlRiCmWzV7cC8ht9kvk888obIDWETBFbOyIt8Bk5UfQ==
X-Received: by 2002:a05:6870:f622:b0:130:8d6:cbdb with SMTP id
 ek34-20020a056870f62200b0013008d6cbdbmr9419222oab.265.1666975365706; 
 Fri, 28 Oct 2022 09:42:45 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:44 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 38/62] target/ppc: remove unused interrupts from
 p7_next_unmasked_interrupt
Date: Fri, 28 Oct 2022 13:39:27 -0300
Message-Id: <20221028163951.810456-39-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2d;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2d.google.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Matheus Ferst <matheus.ferst@eldorado.org.br>

Remove the following unused interrupts from the POWER7 interrupt masking
method:
- PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
- Hypervisor Virtualization: introduced in Power ISA v3.0;
- Hypervisor Doorbell and Event-Based Branch: introduced in
  Power ISA v2.07;
- Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
  for embedded CPUs;
- Doorbell and Critical Doorbell Interrupt: processor does not implement
  the Embedded.Processor Control category;
- Programmable Interval Timer: 40x-only;
- PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-21-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 63 +++++-----------------------------------
 1 file changed, 8 insertions(+), 55 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index d99b76ce22..08db3a4658 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1685,14 +1685,18 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 }
 
 #if defined(TARGET_PPC64)
+#define P7_UNUSED_INTERRUPTS \
+    (PPC_INTERRUPT_RESET | PPC_INTERRUPT_HVIRT | PPC_INTERRUPT_CEXT |       \
+     PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |      \
+     PPC_INTERRUPT_PIT | PPC_INTERRUPT_DOORBELL | PPC_INTERRUPT_HDOORBELL | \
+     PPC_INTERRUPT_THERM | PPC_INTERRUPT_EBB)
+
 static int p7_next_unmasked_interrupt(CPUPPCState *env)
 {
     bool async_deliver;
 
-    /* External reset */
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
+    assert((env->pending_interrupts & P7_UNUSED_INTERRUPTS) == 0);
+
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
         return PPC_INTERRUPT_MCK;
@@ -1716,15 +1720,6 @@ static int p7_next_unmasked_interrupt(CPUPPCState *env)
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
@@ -1736,56 +1731,14 @@ static int p7_next_unmasked_interrupt(CPUPPCState *env)
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
-        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
-            return PPC_INTERRUPT_CDOORBELL;
-        }
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
         }
-        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
-            return PPC_INTERRUPT_DOORBELL;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
-            return PPC_INTERRUPT_HDOORBELL;
-        }
         if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
             return PPC_INTERRUPT_PERFM;
         }
-        /* Thermal interrupt */
-        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
-            return PPC_INTERRUPT_THERM;
-        }
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
2.37.3


