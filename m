Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 952856117F6
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:56 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRN-0004ja-Tj; Fri, 28 Oct 2022 12:42:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQo-0007V9-QM; Fri, 28 Oct 2022 12:42:06 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQm-0000I2-Sh; Fri, 28 Oct 2022 12:42:06 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 j6-20020a4ab1c6000000b004809a59818cso849563ooo.0; 
 Fri, 28 Oct 2022 09:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ir31LYHZTGIDQcAquycnBpVThnSNTbxaGN4PE53CcPA=;
 b=YH69QwIMyntUTYZOae2I1AFO5suusJH8kz0GwjDhCKh3KaaeRKI2neK3RHiqfZSxLC
 +B8GaJGr9swRhJdgO+kKP5SP2b1IeWwfNwUZDiSdtPzk8sPbZ1o5UcAnUzkiRodLRQYe
 Vaivu3wG6f+5Wz6tRO6QRNro0EoM5SGUzJ6YehAAGUXSbi+qYwNlk0Z5JsPHZF9Lpn1x
 goXkf6cJVcRkilq2UG0SA834AGXdqt5+rS922EUDqfw7T+NmvxpQ7K4hPxwKIEIkvspD
 H3SXc0N2jWli0g7NA2vvLOdi9/KEf9jfnU+1Ci3+9vB1cHBCPLlQyG0XnU/YWcxatt5v
 SG4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ir31LYHZTGIDQcAquycnBpVThnSNTbxaGN4PE53CcPA=;
 b=srVjhS35+rbVxTs/wxWDrUjqZVYFyCe2bmf0YB3aw+mgiXH8lfhRqxckA6WRXbKQ7o
 6af4Fq7w0pivs7ZewNxfrlhu41HK+UzKPyffQ8dXNLquZGqQHBP8Mrirs5mpaGao+rXZ
 /fLFn+opB7HJwrkSe7sfpLSzkEkEOk9NLhW0o48zynHp2hyv2592u7SbLDLBoK4k0iFe
 Ma7WUxYdTnDFxs2OjiGRHE7J8N46uhvl6MBPN4pR7ibkCGim+GOlhQAcaDUGsb0haY1G
 7pLOZv0LeY3NnNQKbvIX4vFHdQBaid0zlnjGdK2rKVvxV99pZ22WGV3l4g9J7dNoL5eU
 n2kQ==
X-Gm-Message-State: ACrzQf13tH2DFM0bTp6nJiLfghxTz/1pWkNIaA5cvi6DechU4c6xVZW6
 P5gGfWPGMeiA3Ed6At0SimJMPvK/a2SDWA==
X-Google-Smtp-Source: AMsMyM6/TvABCphHXvDPaFCspBtRgq1Y5eZUBplF7VUPb8sfSNa/E2cIatWbbQsegyb4ZIB5TkOHVQ==
X-Received: by 2002:a4a:9506:0:b0:476:4812:3edf with SMTP id
 m6-20020a4a9506000000b0047648123edfmr189981ooi.62.1666975322936; 
 Fri, 28 Oct 2022 09:42:02 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:01 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 28/62] target/ppc: move power-saving interrupt masking out of
 cpu_has_work_POWER9
Date: Fri, 28 Oct 2022 13:39:17 -0300
Message-Id: <20221028163951.810456-29-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=danielhb413@gmail.com; helo=mail-oo1-xc35.google.com
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

Move the interrupt masking logic out of cpu_has_work_POWER9 in a new
method, p9_interrupt_powersave, that only returns an interrupt if it can
wake the processor from power-saving mode.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-11-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/cpu_init.c | 126 +++++++++++++++++-------------------------
 1 file changed, 50 insertions(+), 76 deletions(-)

diff --git a/target/ppc/cpu_init.c b/target/ppc/cpu_init.c
index 07171c679c..9ecea10b48 100644
--- a/target/ppc/cpu_init.c
+++ b/target/ppc/cpu_init.c
@@ -6351,6 +6351,52 @@ static bool ppc_pvr_match_power9(PowerPCCPUClass *pcc, uint32_t pvr, bool best)
     return false;
 }
 
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
 static bool cpu_has_work_POWER9(CPUState *cs)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
@@ -6367,44 +6413,8 @@ static bool cpu_has_work_POWER9(CPUState *cs)
         if (!(psscr & PSSCR_EC)) {
             return true;
         }
-        /* External Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_EEE)) {
-            bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !FIELD_EX64_HV(env->msr) ||
-                FIELD_EX64(env->msr, MSR, PR)) {
-                return true;
-            }
-        }
-        /* Decrementer Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_DEE)) {
-            return true;
-        }
-        /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUPT_HMI))
-            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
-            return true;
-        }
-        /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-            return true;
-        }
-        /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-            return true;
-        }
-        /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
-            (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
+
+        return p9_interrupt_powersave(env) != 0;
     } else {
         return FIELD_EX64(env->msr, MSR, EE) &&
                (cs->interrupt_request & CPU_INTERRUPT_HARD);
@@ -6600,44 +6610,8 @@ static bool cpu_has_work_POWER10(CPUState *cs)
         if (!(psscr & PSSCR_EC)) {
             return true;
         }
-        /* External Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_EXT) &&
-            (env->spr[SPR_LPCR] & LPCR_EEE)) {
-            bool heic = !!(env->spr[SPR_LPCR] & LPCR_HEIC);
-            if (!heic || !FIELD_EX64_HV(env->msr) ||
-                FIELD_EX64(env->msr, MSR, PR)) {
-                return true;
-            }
-        }
-        /* Decrementer Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DECR) &&
-            (env->spr[SPR_LPCR] & LPCR_DEE)) {
-            return true;
-        }
-        /* Machine Check or Hypervisor Maintenance Exception */
-        if ((env->pending_interrupts & (PPC_INTERRUPT_MCK | PPC_INTERRUPT_HMI))
-            && (env->spr[SPR_LPCR] & LPCR_OEE)) {
-            return true;
-        }
-        /* Privileged Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_DOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_PDEE)) {
-            return true;
-        }
-        /* Hypervisor Doorbell Exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) &&
-            (env->spr[SPR_LPCR] & LPCR_HDEE)) {
-            return true;
-        }
-        /* Hypervisor virtualization exception */
-        if ((env->pending_interrupts & PPC_INTERRUPT_HVIRT) &&
-            (env->spr[SPR_LPCR] & LPCR_HVEE)) {
-            return true;
-        }
-        if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-            return true;
-        }
-        return false;
+
+        return p9_interrupt_powersave(env) != 0;
     } else {
         return FIELD_EX64(env->msr, MSR, EE) &&
                (cs->interrupt_request & CPU_INTERRUPT_HARD);
-- 
2.37.3


