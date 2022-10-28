Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BF5E6117F4
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSl-0001Yp-SD; Fri, 28 Oct 2022 12:44:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSD-0004dp-RP; Fri, 28 Oct 2022 12:43:33 -0400
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSSB-0000op-J0; Fri, 28 Oct 2022 12:43:33 -0400
Received: by mail-oi1-x236.google.com with SMTP id i7so6718668oif.4;
 Fri, 28 Oct 2022 09:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwCee6JalNBuPwrTshw94wej6lkYLuxpGUnAwSsXZL4=;
 b=P4aBBUhG3SqGgpQ2Rk7b/UL0G9cJwIP3UYc5kLx4gk5vqd2B2zq8cZPDHiLrgpP5Li
 f2zfNy3+PXBvUrKU02RYE4B/+chRXdXQI23Iyly0IYJFEubJJeVSX2FSbe3ps8iSD5Zh
 oB7dCKP3VcgbBkn9Q6hl7+3Gd51ARi/7dgTyWfDMn6WaX4vogJaTxIGZHSIXjX/CALzb
 jxxjLKpzL6ChhApTJ7OGGaexfjDLgYrRSYGqkBPPqYCk9kVkC6NckgZFhJG8gVm+U3cD
 2Tkt5cpG2xOLWKJUMbjx4KQOCc4kdSCIRctCHkd14KLr6IM9FqEgxwCALkCMC0FlErrS
 w8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SwCee6JalNBuPwrTshw94wej6lkYLuxpGUnAwSsXZL4=;
 b=vFHO+9gc0k+mlrsk59XtetzizlDcMFfdwgChencpEp+ts0mBtNtiK362nKJCWdQ1QJ
 9bCMd3SIS7QuJH+dowDey6LF+IBb3LwX21bZzw0gSs012O+0aTTaBSz1CMXTxWZI7loU
 6S5BeKGoVxXRFrVZ+5AS4iWr18hUpUs35LvYV7+NvfsIZzNPh4QuAocQDajhm03YW8yK
 ejU75PQmSLV89mxVBga2yqYcvnnAIfFYxa/Qh8X0qmy3QslBzh02y62xGSPUyxtjjT/d
 /LH25Rv9wbCT8GZ5mHvpm1v679aSST8Fmxu8TS7U+xvIFMPHIW9JhJsq5RMExU6VzR0k
 YJcQ==
X-Gm-Message-State: ACrzQf2yTvVhNVQnY4zX7ghQX0wbxnLY/ZsyYEH8dqTV5tsO0an6U7jM
 +i4xxBZyl+n/G7ZfvOhhKqm6+RFDQ8PM1g==
X-Google-Smtp-Source: AMsMyM7/WepuycqoAmOLSoi+jQnLcqyeR0M1cQbAkXq9A5XCoBrGrzFZMUfj/NEDLi6Zg2Vn/c27cw==
X-Received: by 2002:a05:6808:1207:b0:353:e6cf:6d46 with SMTP id
 a7-20020a056808120700b00353e6cf6d46mr168499oil.207.1666975409722; 
 Fri, 28 Oct 2022 09:43:29 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.43.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:43:27 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 47/62] target/ppc: move the p*_interrupt_powersave methods to
 excp_helper.c
Date: Fri, 28 Oct 2022 13:39:36 -0300
Message-Id: <20221028163951.810456-48-danielhb413@gmail.com>
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

Move the methods to excp_helper.c and make them static.

Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Message-Id: <20221021142156.4134411-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c    | 102 ---------------------------------------
 target/ppc/excp_helper.c | 102 +++++++++++++++++++++++++++++++++++++++
 target/ppc/internal.h    |   6 ---
 3 files changed, 102 insertions(+), 108 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index b14905547c..32e94153d1 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -5960,30 +5960,6 @@ static bool ppc_pvr_match_power7(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-int p7_interrupt_powersave(CPUPPCState *env)
-{
-    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE0)) {
-        return PPC_INTERRUPT_EXT;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE1)) {
-        return PPC_INTERRUPT_DECR;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-        return PPC_INTERRUPT_MCK;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-        (env->spr[SPR_LPCR] & LPCR_P7_PECE2)) {
-        return PPC_INTERRUPT_HMI;
-    }
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
-    return 0;
-}
-
 POWERPC_FAMILY(POWER7)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -6120,38 +6096,6 @@ static bool ppc_pvr_match_power8(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return true;
 }
 
-int p8_interrupt_powersave(CPUPPCState *env)
-{
-    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
-        return PPC_INTERRUPT_EXT;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
-        return PPC_INTERRUPT_DECR;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-        return PPC_INTERRUPT_MCK;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
-        return PPC_INTERRUPT_HMI;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
-        return PPC_INTERRUPT_DOORBELL;
-    }
-    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
-        return PPC_INTERRUPT_HDOORBELL;
-    }
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
-    return 0;
-}
-
 POWERPC_FAMILY(POWER8)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
@@ -6325,52 +6269,6 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return false;
 }
 
-int p9_interrupt_powersave(CPUPPCState *env)
-{
-    /* External Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-        (env->spr[SPR_LPCR] & LPCR_EEE)) {
-        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-        if (!heic || !FIELD_EX64_HV(env->msr) ||
-            FIELD_EX64(env->msr, MSR, PR)) {
-            return PPC_INTERRUPT_EXT;
-        }
-    }
-    /* Decrementer Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-        (env->spr[SPR_LPCR] & LPCR_DEE)) {
-        return PPC_INTERRUPT_DECR;
-    }
-    /* Machine Check or Hypervisor Maintenance Exception */
-    if (env->spr[SPR_LPCR] & LPCR_OEE) {
-        if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
-            return PPC_INTERRUPT_MCK;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
-            return PPC_INTERRUPT_HMI;
-        }
-    }
-    /* Privileged Doorbell Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-        return PPC_INTERRUPT_DOORBELL;
-    }
-    /* Hypervisor Doorbell Exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-        return PPC_INTERRUPT_HDOORBELL;
-    }
-    /* Hypervisor virtualization exception */
-    if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
-        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-        return PPC_INTERRUPT_HVIRT;
-    }
-    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        return PPC_INTERRUPT_RESET;
-    }
-    return 0;
-}
-
 POWERPC_FAMILY(POWER9)(ObjectClass *oc, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(oc);
diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 07480079f7..09a81561d4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1692,6 +1692,30 @@ void ppc_cpu_do_interrupt(CPUState *cs)
      PPC_INTERRUPT_PIT | PPC_INTERRUPT_DOORBELL | PPC_INTERRUPT_HDOORBELL | \
      PPC_INTERRUPT_THERM | PPC_INTERRUPT_EBB)
 
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
 static int p7_next_unmasked_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -1750,6 +1774,38 @@ static int p7_next_unmasked_interrupt(CPUPPCState *env)
     PPC_INTERRUPT_CEXT | PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL |  \
     PPC_INTERRUPT_FIT | PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
 
+static int p8_interrupt_powersave(CPUPPCState *env)
+{
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE2)) {
+        return PPC_INTERRUPT_EXT;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE3)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_MCK) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return PPC_INTERRUPT_MCK;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HMI) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE4)) {
+        return PPC_INTERRUPT_HMI;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE0)) {
+        return PPC_INTERRUPT_DOORBELL;
+    }
+    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_P8_PECE1)) {
+        return PPC_INTERRUPT_HDOORBELL;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static int p8_next_unmasked_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
@@ -1825,6 +1881,52 @@ static int p8_next_unmasked_interrupt(CPUPPCState *env)
      PPC_INTERRUPT_WDT | PPC_INTERRUPT_CDOORBELL | PPC_INTERRUPT_FIT |  \
      PPC_INTERRUPT_PIT | PPC_INTERRUPT_THERM)
 
+static int p9_interrupt_powersave(CPUPPCState *env)
+{
+    /* External Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
+        (env->spr[SPR_LPCR] & LPCR_EEE)) {
+        bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
+        if (!heic || !FIELD_EX64_HV(env->msr) ||
+            FIELD_EX64(env->msr, MSR, PR)) {
+            return PPC_INTERRUPT_EXT;
+        }
+    }
+    /* Decrementer Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
+        (env->spr[SPR_LPCR] & LPCR_DEE)) {
+        return PPC_INTERRUPT_DECR;
+    }
+    /* Machine Check or Hypervisor Maintenance Exception */
+    if (env->spr[SPR_LPCR] & LPCR_OEE) {
+        if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
+            return PPC_INTERRUPT_MCK;
+        }
+        if (env->pending_interrupts & PPC_INTERRUPT_HMI) {
+            return PPC_INTERRUPT_HMI;
+        }
+    }
+    /* Privileged Doorbell Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_PDEE)) {
+        return PPC_INTERRUPT_DOORBELL;
+    }
+    /* Hypervisor Doorbell Exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
+        (env->spr[SPR_LPCR] & LPCR_HDEE)) {
+        return PPC_INTERRUPT_HDOORBELL;
+    }
+    /* Hypervisor virtualization exception */
+    if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
+        (env->spr[SPR_LPCR] & LPCR_HVEE)) {
+        return PPC_INTERRUPT_HVIRT;
+    }
+    if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
+        return PPC_INTERRUPT_RESET;
+    }
+    return 0;
+}
+
 static int p9_next_unmasked_interrupt(CPUPPCState *env)
 {
     PowerPCCPU *cpu = env_archcpu(env);
diff --git a/target/ppc/internal.h b/target/ppc/internal.h
index 25827ebf6f..337a362205 100644
--- a/target/ppc/internal.h
+++ b/target/ppc/internal.h
@@ -306,10 +306,4 @@ static inline int ger_pack_masks(int pmsk, int ymsk, int xmsk)
     return msk;
 }
 
-#if defined(TARGET_PPC64)
-int p9_interrupt_powersave(CPUPPCState *env);
-int p8_interrupt_powersave(CPUPPCState *env);
-int p7_interrupt_powersave(CPUPPCState *env);
-#endif
-
 #endif /* PPC_INTERNAL_H */
-- 
2.37.3


