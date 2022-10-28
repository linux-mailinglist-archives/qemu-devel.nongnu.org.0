Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CCC46117F5
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:47:55 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSQu-0008GW-Q1; Fri, 28 Oct 2022 12:42:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQI-0002vV-F1; Fri, 28 Oct 2022 12:41:34 -0400
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSQF-0008Es-Og; Fri, 28 Oct 2022 12:41:34 -0400
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-13ae8117023so6859865fac.9; 
 Fri, 28 Oct 2022 09:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GjKm8T9F0wZnGFU3pwg/oPVDVSeYkx0NLz5pDnDIRVw=;
 b=Y1gGQi7FDXGzZPBoGEjIR222lA8bbWZdN6g5kmq7nLjTZ2CKBvF6t8w2vMI2uGB3i6
 59IHHQhmUHlLK06cbcfPyAXbu9uHZjBLyhZJ9ZTKNxSNqPx0cwCOwdkC/fMp7nGU1GZs
 G2FQyhuQHit+uxa3RgrDiJyiJKUjpwYsAC68a5ZTy7eZS0K9/PQOGYu75STvdBQWR4ot
 D/fjDTd9iW33tW+eukQEUvkehW+9LZ0KNw0jjUNvRm7udfCYeQ8qs0pI62TKiZ0BCwY8
 ZoQ8gIa5t+jXRNtBdjOX8jpPqPKvo04rYpcwcCbjMtVtWgKhNddEBTRV0Wb9p7onkEPH
 L8RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GjKm8T9F0wZnGFU3pwg/oPVDVSeYkx0NLz5pDnDIRVw=;
 b=R9Zc7JYS63GeUXuGU6pyZaz4kFmzYIKHwXa5TNm0R+YwGw2iHos3Er4hsP9YqbDEKT
 n27/bJkjpeWKyg1uB4c/W+QfAwd9xFLxaUuHe4GlfVuNEAJEtXb9tW/OWEJQvVqNtnQB
 HNXZdavu4ypkNHRdvRosOq3IKBdobGXo3oOzaIzJ0awmvtw7mAxgK7+DQ0CcU9nKZpFF
 5eAqL1+8iQ3u3uyZ49ngEsoi1iqZBr1YOK6wL3LqkJHS8+uiPUdXMC93mUq+0nNBAIGK
 6UHhEHNcQcRribFU5VSbUGlGdamAUspf5PJ2R+YjwWFRdU2CxQYEIS0pNxrS3GYlkBz7
 X0BA==
X-Gm-Message-State: ACrzQf0LCGC1WN+tk4sxizavmiXLbkb4997CO3pmjcHTp/snovAEtgFO
 n9NphTxEJKk7BQbhWTjzjWCsmByr+ok7BA==
X-Google-Smtp-Source: AMsMyM40urW9SxG+CMSxyUvevFF1WJP74xXgFumN1rLH7n04bf9xK120Bc5LgdLokMXelDA7q1FYAQ==
X-Received: by 2002:a05:6870:b414:b0:130:ea11:761c with SMTP id
 x20-20020a056870b41400b00130ea11761cmr37080oap.62.1666975289272; 
 Fri, 28 Oct 2022 09:41:29 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:41:28 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 21/62] target/ppc: split interrupt masking and delivery from
 ppc_hw_interrupt
Date: Fri, 28 Oct 2022 13:39:10 -0300
Message-Id: <20221028163951.810456-22-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x29.google.com
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

Split ppc_hw_interrupt into an interrupt masking method,
ppc_next_unmasked_interrupt, and an interrupt processing method,
ppc_deliver_interrupt.

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-4-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 201 ++++++++++++++++++++++++---------------
 1 file changed, 125 insertions(+), 76 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 37d352619b..759bad582d 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1684,29 +1684,22 @@ void ppc_cpu_do_interrupt(CPUState *cs)
     powerpc_excp(cpu, cs->exception_index);
 }
 
-static void ppc_hw_interrupt(CPUPPCState *env)
+static int ppc_next_unmasked_interrupt(CPUPPCState *env)
 {
-    PowerPCCPU *cpu = env_archcpu(env);
     bool async_deliver;
 
     /* External reset */
     if (env->pending_interrupts & PPC_INTERRUPT_RESET) {
-        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
-        powerpc_excp(cpu, POWERPC_EXCP_RESET);
-        return;
+        return PPC_INTERRUPT_RESET;
     }
     /* Machine check exception */
     if (env->pending_interrupts & PPC_INTERRUPT_MCK) {
-        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
-        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
-        return;
+        return PPC_INTERRUPT_MCK;
     }
 #if 0 /* TODO */
     /* External debug exception */
     if (env->pending_interrupts & PPC_INTERRUPT_DEBUG) {
-        env->pending_interrupts &= ~PPC_INTERRUPT_DEBUG;
-        powerpc_excp(cpu, POWERPC_EXCP_DEBUG);
-        return;
+        return PPC_INTERRUPT_DEBUG;
     }
 #endif
 
@@ -1724,9 +1717,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         bool hdice = !!(env->spr[SPR_LPCR] & LPCR_HDICE);
         if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hdice) {
             /* HDEC clears on delivery */
-            env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
-            powerpc_excp(cpu, POWERPC_EXCP_HDECR);
-            return;
+            return PPC_INTERRUPT_HDECR;
         }
     }
 
@@ -1735,8 +1726,7 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         /* LPCR will be clear when not supported so this will work */
         bool hvice = !!(env->spr[SPR_LPCR] & LPCR_HVICE);
         if ((async_deliver || !FIELD_EX64_HV(env->msr)) && hvice) {
-            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-            return;
+            return PPC_INTERRUPT_HVIRT;
         }
     }
 
@@ -1748,77 +1738,47 @@ static void ppc_hw_interrupt(CPUPPCState *env)
         if ((async_deliver && !(heic && FIELD_EX64_HV(env->msr) &&
             !FIELD_EX64(env->msr, MSR, PR))) ||
             (env->has_hv_mode && !FIELD_EX64_HV(env->msr) && !lpes0)) {
-            if (books_vhyp_promotes_external_to_hvirt(cpu)) {
-                powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-            } else {
-                powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
-            }
-            return;
+            return PPC_INTERRUPT_EXT;
         }
     }
     if (FIELD_EX64(env->msr, MSR, CE)) {
         /* External critical interrupt */
         if (env->pending_interrupts & PPC_INTERRUPT_CEXT) {
-            powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
-            return;
+            return PPC_INTERRUPT_CEXT;
         }
     }
     if (async_deliver != 0) {
         /* Watchdog timer on embedded PowerPC */
         if (env->pending_interrupts & PPC_INTERRUPT_WDT) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
-            powerpc_excp(cpu, POWERPC_EXCP_WDT);
-            return;
+            return PPC_INTERRUPT_WDT;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_CDOORBELL) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
-            powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
-            return;
+            return PPC_INTERRUPT_CDOORBELL;
         }
         /* Fixed interval timer on embedded PowerPC */
         if (env->pending_interrupts & PPC_INTERRUPT_FIT) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
-            powerpc_excp(cpu, POWERPC_EXCP_FIT);
-            return;
+            return PPC_INTERRUPT_FIT;
         }
         /* Programmable interval timer on embedded PowerPC */
         if (env->pending_interrupts & PPC_INTERRUPT_PIT) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
-            powerpc_excp(cpu, POWERPC_EXCP_PIT);
-            return;
+            return PPC_INTERRUPT_PIT;
         }
         /* Decrementer exception */
         if (env->pending_interrupts & PPC_INTERRUPT_DECR) {
-            if (ppc_decr_clear_on_delivery(env)) {
-                env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
-            }
-            powerpc_excp(cpu, POWERPC_EXCP_DECR);
-            return;
+            return PPC_INTERRUPT_DECR;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_DOORBELL) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
-            if (is_book3s_arch2x(env)) {
-                powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
-            } else {
-                powerpc_excp(cpu, POWERPC_EXCP_DOORI);
-            }
-            return;
+            return PPC_INTERRUPT_DOORBELL;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_HDOORBELL) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
-            powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
-            return;
+            return PPC_INTERRUPT_HDOORBELL;
         }
         if (env->pending_interrupts & PPC_INTERRUPT_PERFM) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
-            powerpc_excp(cpu, POWERPC_EXCP_PERFM);
-            return;
+            return PPC_INTERRUPT_PERFM;
         }
         /* Thermal interrupt */
         if (env->pending_interrupts & PPC_INTERRUPT_THERM) {
-            env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
-            powerpc_excp(cpu, POWERPC_EXCP_THERM);
-            return;
+            return PPC_INTERRUPT_THERM;
         }
         /* EBB exception */
         if (env->pending_interrupts & PPC_INTERRUPT_EBB) {
@@ -1828,20 +1788,100 @@ static void ppc_hw_interrupt(CPUPPCState *env)
              */
             if (FIELD_EX64(env->msr, MSR, PR) &&
                 (env->spr[SPR_BESCR] & BESCR_GE)) {
-                env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
-
-                if (env->spr[SPR_BESCR] & BESCR_PMEO) {
-                    powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
-                } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
-                    powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
-                }
-
-                return;
+                return PPC_INTERRUPT_EBB;
             }
         }
     }
 
-    if (env->resume_as_sreset) {
+    return 0;
+}
+
+static void ppc_deliver_interrupt(CPUPPCState *env, int interrupt)
+{
+    PowerPCCPU *cpu = env_archcpu(env);
+    CPUState *cs = env_cpu(env);
+
+    switch (interrupt) {
+    case PPC_INTERRUPT_RESET: /* External reset */
+        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
+        powerpc_excp(cpu, POWERPC_EXCP_RESET);
+        break;
+    case PPC_INTERRUPT_MCK: /* Machine check exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
+        powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
+        break;
+
+    case PPC_INTERRUPT_HDECR: /* Hypervisor decrementer exception */
+        /* HDEC clears on delivery */
+        env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
+        powerpc_excp(cpu, POWERPC_EXCP_HDECR);
+        break;
+    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
+        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+        break;
+
+    case PPC_INTERRUPT_EXT:
+        if (books_vhyp_promotes_external_to_hvirt(cpu)) {
+            powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
+        } else {
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL);
+        }
+        break;
+    case PPC_INTERRUPT_CEXT: /* External critical interrupt */
+        powerpc_excp(cpu, POWERPC_EXCP_CRITICAL);
+        break;
+
+    case PPC_INTERRUPT_WDT: /* Watchdog timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_WDT;
+        powerpc_excp(cpu, POWERPC_EXCP_WDT);
+        break;
+    case PPC_INTERRUPT_CDOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_CDOORBELL;
+        powerpc_excp(cpu, POWERPC_EXCP_DOORCI);
+        break;
+    case PPC_INTERRUPT_FIT: /* Fixed interval timer on embedded PowerPC */
+        env->pending_interrupts &= ~PPC_INTERRUPT_FIT;
+        powerpc_excp(cpu, POWERPC_EXCP_FIT);
+        break;
+    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded ppc */
+        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
+        powerpc_excp(cpu, POWERPC_EXCP_PIT);
+        break;
+    case PPC_INTERRUPT_DECR: /* Decrementer exception */
+        if (ppc_decr_clear_on_delivery(env)) {
+            env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
+        }
+        powerpc_excp(cpu, POWERPC_EXCP_DECR);
+        break;
+    case PPC_INTERRUPT_DOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
+        if (is_book3s_arch2x(env)) {
+            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
+        } else {
+            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
+        }
+        break;
+    case PPC_INTERRUPT_HDOORBELL:
+        env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
+        powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
+        break;
+    case PPC_INTERRUPT_PERFM:
+        env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
+        powerpc_excp(cpu, POWERPC_EXCP_PERFM);
+        break;
+    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
+        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
+        powerpc_excp(cpu, POWERPC_EXCP_THERM);
+        break;
+    case PPC_INTERRUPT_EBB: /* EBB exception */
+        env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
+        if (env->spr[SPR_BESCR] & BESCR_PMEO) {
+            powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
+        } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
+            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
+        }
+        break;
+    case 0:
         /*
          * This is a bug ! It means that has_work took us out of halt without
          * anything to deliver while in a PM state that requires getting
@@ -1853,8 +1893,10 @@ static void ppc_hw_interrupt(CPUPPCState *env)
          * It generally means a discrepancy between the wakeup conditions in the
          * processor has_work implementation and the logic in this function.
          */
-        cpu_abort(env_cpu(env),
-                  "Wakeup from PM state but interrupt Undelivered");
+        assert(!env->resume_as_sreset);
+        break;
+    default:
+        cpu_abort(cs, "Invalid PowerPC interrupt %d. Aborting\n", interrupt);
     }
 }
 
@@ -1890,15 +1932,22 @@ bool ppc_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
 {
     PowerPCCPU *cpu = POWERPC_CPU(cs);
     CPUPPCState *env = &cpu->env;
+    int interrupt;
 
-    if (interrupt_request & CPU_INTERRUPT_HARD) {
-        ppc_hw_interrupt(env);
-        if (env->pending_interrupts == 0) {
-            cs->interrupt_request &= ~CPU_INTERRUPT_HARD;
-        }
-        return true;
+    if ((interrupt_request & CPU_INTERRUPT_HARD) == 0) {
+        return false;
     }
-    return false;
+
+    interrupt = ppc_next_unmasked_interrupt(env);
+    if (interrupt == 0) {
+        return false;
+    }
+
+    ppc_deliver_interrupt(env, interrupt);
+    if (env->pending_interrupts == 0) {
+        cpu_reset_interrupt(cs, CPU_INTERRUPT_HARD);
+    }
+    return true;
 }
 
 #endif /* !CONFIG_USER_ONLY */
-- 
2.37.3


