Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 251BD6117D9
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:44:33 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRV-0006Fs-Cd; Fri, 28 Oct 2022 12:42:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQx-0000TK-Mb; Fri, 28 Oct 2022 12:42:15 -0400
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQv-0000Ko-NT; Fri, 28 Oct 2022 12:42:15 -0400
Received: by mail-oa1-x2d.google.com with SMTP id
 586e51a60fabf-13b6c1c89bdso6836954fac.13; 
 Fri, 28 Oct 2022 09:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6V/k4dzfWQNAToVF+rbcK2lUFqnnOHrV0RbyF2HNRKM=;
 b=RAu6OZKylNMgH/whGxDbcm+UoHafev55KwykdoBtehTmsjRbxavvdXviYvVFQ4u4pY
 iZaF5jnB+G8h1L/LgH5OAebJCOVgY4ptEI31/OiH8leSz+QMNIjOD2JT5lfr93FsvoEZ
 iPuNtjMjTccNM1s2jeKh4fpn3/IxJqASTDDL0IMNs9sSmrk3Uw/cBHpobBPavK8mE6gE
 jyTGUyuR9Wmr9EAgvaxHneRZlkCy3ffnI8at4ll7TFju79whn5ixTqKnErFI9OJsjy0o
 FFbo9fecg3ObTdKlpW/q/gpYbG6NA7KjFt2PWIRbuseQLqDO+rTnbMjUar7RU6I2qt5Q
 sg3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6V/k4dzfWQNAToVF+rbcK2lUFqnnOHrV0RbyF2HNRKM=;
 b=BJ9rTY0N34kIQ5CWkVgRdWSNhzqNaIH8SDtY1DnVmPB2jLFT3ZBW9tSsVEsCh8tg45
 AgkAvrAQSTs++g2BFCtfnmzo3FPgxLPOOO43PrQHljoAcYivBhM7muhDlZYIlfxfTVZg
 sgADUqmhGDvUN1lC2wNSJjkTxwWjyRMNZLEqJNFwBjTn3qDrbU53txT/T3TbuIUX2Cld
 bopI3+iBBqUPNYBqz+KUPLkK2MfCOTjVQrPrwauE7cZhCb5wMC8E5fov/+JwzzOICfMn
 yNhWCEncydFF+HEEpVfzvM696heC8tyZX4Pd4fFuYY0Opc5HaanbkzkdwIOb9r6jPpBG
 De6g==
X-Gm-Message-State: ACrzQf0Y3xn/2TqQdoDulW+gpQhgEMHiOADpfxOALz4sMoiG9v9Q3FNi
 ebmODNeOQpM/hvYj9dXVGvCux51lvDeQew==
X-Google-Smtp-Source: AMsMyM7fT6P/XUO+jJwP6zWL43DXPLLknKY0WATC8DkEoZK8JNPkM2eeVfJzKfPPm0/uCmhhvjqUTw==
X-Received: by 2002:a05:6870:5890:b0:136:8cc1:1aa6 with SMTP id
 be16-20020a056870589000b001368cc11aa6mr22154oab.21.1666975331564; 
 Fri, 28 Oct 2022 09:42:11 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:10 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 30/62] target/ppc: create an interrupt masking method for POWER8
Date: Fri, 28 Oct 2022 13:39:19 -0300
Message-Id: <20221028163951.810456-31-danielhb413@gmail.com>
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

The new method is identical to ppc_next_unmasked_interrupt_generic,
processor-specific code will be added/removed in the following patches.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-13-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 108 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 836c90b9a8..c7b303a9a7 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1685,6 +1685,112 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 }
 
 #if defined(TARGET_PPC64)
+static int p8_next_unmasked_interrupt(CPUPPCState *env)
+{
+    bool async_deliver;
+
+    /* External reset */
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    /* Machine check exception */
+    if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
+        return PPC_INTERRUPT_MCK;
+    }
+
+    /*
+     * For interrupts that gate on MSR:EE, we need to do something a
+     * bit more subtle, as we need to let them through even when EE is
+     * clear when coming out of some power management states (in order
+     * for them to become a 0x100).
+     */
+    async_deliver = FIELD_EX64(env->msr, MSR, EE) || env->resume_as_sreset;
+
+    /* Hypervisor decrementer exception */
+    if (env->pending_interrupts & PPC_INTERRUPT_HDECR) {
+        /* LPCR will be clear when not supported so this will work */
+        bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
+            /* HDEC clears on delivery */
+            return PPC_INTERRUPT_HDECR;
+        }
+    }
+
+    /* Hypervisor virtualization interrupt */
+    if (env->pending_interrupts & PPC_INTERRUPT_HVIRT) {
+        /* LPCR will be clear when not supported so this will work */
+        bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
+        if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
+            return PPC_INTERRUPT_HVIRT;
+        }
+    }
+
+    /* External interrupt can ignore MSR:EE under some circumstances */
+    if (env->pending_interrupts & PPC_INTERRUPT_EXT) {
+        bool lpes0 = !!(env->spr[SPR_LPCR] & LPCR_LPES0);
+        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
+        /* HEIC blocks delivery to the hypervisor */
+        if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
+            !FIELD_EX64(env->msr, MSR, PR))) ||
+            (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
+            return PPC_INTERRUPT_EXT;
+        }
+    }
+    if (FIELD_EX64(env->msr, MSR, CE)) {
+        /* External critical interrupt */
+        if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
+            return PPC_INTERRUPT_CEXT;
+        }
+    }
+    if (async_deliver != 0) {
+        /* Watchdog timer on embedded PowerPC */
+        if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
+            return PPC_INTERRUPT_WDT;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
+            return PPC_INTERRUPT_CDOORBELL;
+        }
+        /* Fixed interval timer on embedded PowerPC */
+        if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
+            return PPC_INTERRUPT_FIT;
+        }
+        /* Programmable interval timer on embedded PowerPC */
+        if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
+            return PPC_INTERRUPT_PIT;
+        }
+        /* Decrementer exception */
+        if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
+            return PPC_INTERRUPT_DECR;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
+            return PPC_INTERRUPT_DOORBELL;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
+            return PPC_INTERRUPT_HDOORBELL;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
+            return PPC_INTERRUPT_PERFM;
+        }
+        /* Thermal interrupt */
+        if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
+            return PPC_INTERRUPT_THERM;
+        }
+        /* EBB exception */
+        if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
+            /*
+             * EBB exception must be taken in problem state and
+             * with BESCR_GE set.
+             */
+            if (FIELD_EX64(env->msr, MSR, PR) &&
+                (env->spr[SPR_BESCR] & BESCR_GE)) {
+                return PPC_INTERRUPT_EBB;
+            }
+        }
+    }
+
+    return 0;
+}
+
 #define P9_UNUSED_INTERRUPTS \
     (PPC_INTERRUPT_RESET | PPC_INTERRUPT_DEBUG | PPC_INTERRUPT_CEXT |   \
      PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |  \
@@ -1897,6 +2003,8 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 {
     switch (env->excp_model) {
 #if defined(TARGET_PPC64)
+    case POWERPC_EXCP_POWER8:
+        return p8_next_unmasked_interrupt(env);
     case POWERPC_EXCP_POWER9:
     case POWERPC_EXCP_POWER10:
         return p9_next_unmasked_interrupt(env);
-- 
2.37.3


