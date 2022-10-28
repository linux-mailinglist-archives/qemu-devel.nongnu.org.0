Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7081E6117D4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:44:10 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSC-00042f-UA; Fri, 28 Oct 2022 12:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRR-0005iN-U0; Fri, 28 Oct 2022 12:42:46 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRP-0000VD-2v; Fri, 28 Oct 2022 12:42:45 -0400
Received: by mail-oi1-x236.google.com with SMTP id u132so6766267oib.0;
 Fri, 28 Oct 2022 09:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yPavTNlQ07S4mnLlTlA9khW+XLhgi0uIRg/ayMaCQrA=;
 b=XXoT3u9DHzxzX0NBrKovN0bgfysq5QMRdvJdxu+L3BulMNfwq7+loiXw1WCHDlS1bh
 XQ1+sWqzu4YejAJAsXbBbeJr/6fuGlzIG6iR0mBgbYvYvaqeHi73VIykmrp7QtWcmHmU
 VIEkgKJYgH/4WA0dyuE1qbYEytRBNhh+5I/j5a1r5HR7E18AvhVNcOIbxzFZqYIa8R3+
 sPeGFgKG+2ccZff3GiQWPT2j2Ka2sYEc1INkFixuGuz32g2zrqbf2yB8R8mnFXbN3gVG
 CoiAoT7canOAbwFeW0/CF/jtCnTpnssLUXxqyl4rJxua1dz9miJR8N3cupITgPgRZrzm
 Qsdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yPavTNlQ07S4mnLlTlA9khW+XLhgi0uIRg/ayMaCQrA=;
 b=70NwQX3cQcIAbSXJxD5kN2KFwKk8KTi0Q51cSxd9sJYTtiz/CKeSK1O/LMxx4ovXII
 zAM5wORvM5LMzyEfG3lRDZXDHmX2ID7QvjFtlwnfc36Mm7ych9PQSd45sUbUc31kIpRD
 8oNqTjRhLd92WVu54xFu9tqRiidKLMRsjiJQoLEOm/mV0BhtQRTjemAzQ+AZAZbx+4Mj
 8lmTAc3PRbKpdpTTOuCg652BEnTWQvrj9pAtuyFWh1skBsLXJS9OfeKx7t+Ch01O/D5h
 UDDQYZbixDrozLwgvTdTzcGo346++N4KNcjKUcVmSBON2Nv5jTplfP+V0T8hlk0Sy64A
 wc/w==
X-Gm-Message-State: ACrzQf2BYwCVTEV5gaP23iD+ZWHExxfgJld+AdcDN7UA61Wf25icw+oY
 dNpb8epratSXE8c4/a5lPed6vHtTnuUKyA==
X-Google-Smtp-Source: AMsMyM4cD0Ggs19vUBl5VI8MNzqlWEsLcoxvw3F/Q7XUYhwj3xGIHlD/TH4saIFXWGqFJUp+O/f5FA==
X-Received: by 2002:a05:6808:1407:b0:359:a7d2:633d with SMTP id
 w7-20020a056808140700b00359a7d2633dmr8733449oiv.237.1666975361427; 
 Fri, 28 Oct 2022 09:42:41 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:40 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 37/62] target/ppc: create an interrupt masking method for POWER7
Date: Fri, 28 Oct 2022 13:39:26 -0300
Message-Id: <20221028163951.810456-38-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::236;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x236.google.com
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
Message-Id: <20221011204829.1641124-20-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 108 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 108 insertions(+)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 9fa75c55c9..d99b76ce22 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1685,6 +1685,112 @@ void ppc_cpu_do_interrupt(CPUState *cs)
 }
 
 #if defined(TARGET_PPC64)
+static int p7_next_unmasked_interrupt(CPUPPCState *env)
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
 #define P8_UNUSED_INTERRUPTS \
     (PPC_INTERRUPT_RESET | PPC_INTERRUPT_DEBUG | PPC_INTERRUPT_HVIRT |  \
     PPC_INTERRUPT_CEXT | PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL |  \
@@ -1972,6 +2078,8 @@ static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 {
     switch (env->excp_model) {
 #if defined(TARGET_PPC64)
+    case POWERPC_EXCP_POWER7:
+        return p7_next_unmasked_interrupt(env);
     case POWERPC_EXCP_POWER8:
         return p8_next_unmasked_interrupt(env);
     case POWERPC_EXCP_POWER9:
-- 
2.37.3


