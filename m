Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B05F46117C9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:43:12 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRX-0006Wy-2n; Fri, 28 Oct 2022 12:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSR4-0001L6-AT; Fri, 28 Oct 2022 12:42:22 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSR0-0000Mc-Un; Fri, 28 Oct 2022 12:42:21 -0400
Received: by mail-oi1-x22d.google.com with SMTP id g10so6682711oif.10;
 Fri, 28 Oct 2022 09:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6mXlNPdAoj1FjmOYP8e40/ceUFFEafWriATngeoKtlo=;
 b=IHuR3dB0iQvUEswL0KViDXa24Yylm+liSEmbLOsCbrP/RInxMAZkHnw7Fuls113T/n
 i/ocn86DBmiyRfDld12/mKUA2KlnUS3A/9L1ZUOJ37/9+rLsITd/VHe88eQPD1dWLAlw
 RrzcLt8gy02qev5BPeyPTLjSZTZwg1BRQ5MTj3h5pQaCB2rIjxB6BRaje33sDTE2nIe2
 Y6sIwQQB87C5PqPPaMhDhL1DlXL866uv6JF3DEzkimeSvkwrIBdoLO+KCDZuu0dT8cun
 NczptdqVO76SINhjx1L5wlaKJHzJybnyuWq8HGs9k187EkKhdV0WC8E/KW3hfspzzkuc
 hyjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6mXlNPdAoj1FjmOYP8e40/ceUFFEafWriATngeoKtlo=;
 b=E6SHfMWqn8LgMGAWqexhNvv30C+RPss/d1tGt0RCIGGGfz4iF9odddcNwTiHhm0D39
 /SfpjilP1iyE1eI2Uxf0isPnUQ5kxi2V4GMGJvyniylI3otWYgHpZjabQ+5+QyEXds1G
 ePlLyh2XTf8+QpSPfMJZh6x2ngYu7QRrUG5ZBJxSWF2sEJpWPN99J5bYEmM5ju3AUB+g
 AZOt4+1wP4hdC8OezN4uGLU2kdKdT9QpVhetwQy5FQ540mbaoUVbdOkSOxVmqBthxFlg
 TjSlFeGLBlVQrAuv3c7H8C5bSFPa/SaEkBIxDpe39OeCUuvvEKV7s23B9IqzVLYDDfjC
 y9fg==
X-Gm-Message-State: ACrzQf1OR0HCHTtJKrq6cZIc6G3aU5YFnFAyQMFek39m8UFwejmIySa/
 JL1gEmmuzKlvWOT9daEISolCM038josPQg==
X-Google-Smtp-Source: AMsMyM6SSdRLNibqc2z9OzSx9ywJ5NbeRWQ6xf9gFCIKOx4sRvik93V3LWoY7WnOXbq1pnS9yzHLlQ==
X-Received: by 2002:a54:4196:0:b0:355:15ff:b43 with SMTP id
 22-20020a544196000000b0035515ff0b43mr8934238oiy.200.1666975336420; 
 Fri, 28 Oct 2022 09:42:16 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:14 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 31/62] target/ppc: remove unused interrupts from
 p8_next_unmasked_interrupt
Date: Fri, 28 Oct 2022 13:39:20 -0300
Message-Id: <20221028163951.810456-32-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22d;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22d.google.com
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

Remove the following unused interrupts from the POWER8 interrupt masking
method:
- PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970, and POWER5p;
- Debug Interrupt: removed in Power ISA v2.07;
- Hypervisor Virtualization: introduced in Power ISA v3.0;
- Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
  for embedded CPUs;
- Critical Doorbell: processor does not implement the "Embedded.Processor
  Control" category;
- Programmable Interval Timer: 40x-only;
- PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-14-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 45 +++++++---------------------------------
 1 file changed, 7 insertions(+), 38 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c7b303a9a7..2bb636a439 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1685,14 +1685,17 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 }
 
 #if defined(TARGET_PPC64)
+#define P8_UNUSED_INTERRUPTS \
+    (PPC_INTERRUPT_RESET | PPC_INTERRUPT_DEBUG | PPC_INTERRUPT_HVIRT |  \
+    PPC_INTERRUPT_CEXT | PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL |  \
+    PPC_INTERRUPT_FIT | PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
+
 static int p8_next_unmasked_interrupt(CPUPPCState *env)
 {
     bool async_deliver;
 
-    /* External reset */
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
+    assert((env->pending_interrupts & P8_UNUSED_INTERRUPTS) == 0);
+
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
         return PPC_INTERRUPT_MCK;
@@ -1716,15 +1719,6 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
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
@@ -1736,28 +1730,7 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
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
@@ -1771,10 +1744,6 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
         if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
             return PPC_INTERRUPT_PERFM;
         }
-        /* Thermal interrupt */
-        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
-            return PPC_INTERRUPT_THERM;
-        }
         /* EBB exception */
         if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
             /*
-- 
2.37.3


