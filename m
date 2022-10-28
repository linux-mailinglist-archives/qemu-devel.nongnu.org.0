Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B7586117D0
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:43:44 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSSH-00054j-8G; Fri, 28 Oct 2022 12:43:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRd-0007XD-9Z; Fri, 28 Oct 2022 12:42:58 -0400
Received: from mail-oi1-x22d.google.com ([2607:f8b0:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRb-0000ZC-NZ; Fri, 28 Oct 2022 12:42:57 -0400
Received: by mail-oi1-x22d.google.com with SMTP id s206so6725988oie.3;
 Fri, 28 Oct 2022 09:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=513OQwf1KYQzMFUuOswxOfMcfrck8dRAlQfLTWyU38I=;
 b=GLBXpXd0fsj9BRhGmF6sslioDX4zX/s8NalvPKZZRGdGy1CFh5d0j9lGXyTzD1o2ih
 wpgA7ksV5MzNRHCd89//DEJxchSLDUupPlV8R7MXP7BHeq+qWwDscruBrOPDBbIiLz5V
 q0kbq0ENIltglQOui/LcG1JD6yiW/iocAyqEcXiosVi3kcYxVnOr6Oh6UMQONYpRzXJX
 4kme5wnEybtMRSlC1XCVbppljcHwvw+H4CCqCknrUT81teLnpa/L2hE7mrWNGmEIJumY
 gMWkjd+eytUeqRWCQMVgObgbiSGY6bp5sV+J4aoxzGiqabgVO955j342ok4PAY+JQMrT
 2kOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=513OQwf1KYQzMFUuOswxOfMcfrck8dRAlQfLTWyU38I=;
 b=20xJkt7pnbW9o9P/c/+PSv1e1HpY3/4ZYSCCB/ryJACiSjRSRx5BwB39laVXU4Deg+
 Uf5I5IEkKvTAUrBDs41J2R6ll11r32hPDkOu5McFyZEG90ulb4iovO6SuVEzZtfkmg7g
 mT3Lz0VX1sM8x7SYMZvVyJ024diFOF3166n3DjSPexs5drrYilgPuFtUZ1VY9MSG7qUy
 PGXPNtFdZGdBYP9Z9Ar4paJRDZ1auh4ZyVg7tUSxANs7uC861yy3Koodll8ffQaHxmdv
 2jEDFNshLvQjbOHlYlZs3R5Z71Rx7qNWQ4IKJgnRKLI79ylvKQFL7iAb6OBwNDN/HoMn
 iqmQ==
X-Gm-Message-State: ACrzQf33+SdzoZo4kzcuY8/JvNnoGxFcqGQW/dZXm/pYQzwP6UYDAJ9/
 IQ/SSC3AxN5+S88QqhvGQj7YLlCvWfB2YA==
X-Google-Smtp-Source: AMsMyM5YDozbW4GV3HdNWaZKwaTsWZKhAYzBkIPi/1aW5S5huyX0TAD8YYVTkMI9cHN5X+ur3ooQlQ==
X-Received: by 2002:a05:6808:14c1:b0:354:d3bf:67b with SMTP id
 f1-20020a05680814c100b00354d3bf067bmr8822750oiw.160.1666975373912; 
 Fri, 28 Oct 2022 09:42:53 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:53 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 40/62] target/ppc: remove unused interrupts from
 p7_deliver_interrupt
Date: Fri, 28 Oct 2022 13:39:29 -0300
Message-Id: <20221028163951.810456-41-danielhb413@gmail.com>
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

Remove the following unused interrupts from the POWER7 interrupt
processing method:
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
Message-Id: <20221011204829.1641124-23-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 50 ----------------------------------------
 1 file changed, 50 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index 5bb05016fd..5373e088b4 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -2051,10 +2051,6 @@ static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
     CPUState *cs = env_cpu(env);
 
     switch (interrupt) {
-    case PPC_INTERRUPT_RESET: /* External reset */
-        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
-        powerpc_excp(cpu, POWERPC_EXCP_RESET);
-        break;
     case PPC_INTERRUPT_MCK: /* Machine check exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
         powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
@@ -2065,9 +2061,6 @@ static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
         env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
         powerpc_excp(cpu, POWERPC_EXCP_HDECR);
         break;
-    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
-        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-        break;
 
     case PPC_INTERRUPT_EXT:
         if (books_vhyp_promotes_external_to_hvirt(cpu)) {
@@ -2076,60 +2069,17 @@ static void p7_deliver_interrupt(CPUPPCState *env, int interrupt)
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
-    case PPC_INTERRUPT_PIT: /* Programmable interval timer on embedded ppc */
-        env->pending_interrupts &= ~PPC_INTERRUPT_PIT;
-        powerpc_excp(cpu, POWERPC_EXCP_PIT);
-        break;
     case PPC_INTERRUPT_DECR: /* Decrementer exception */
         if (ppc_decr_clear_on_delivery(env)) {
             env->pending_interrupts &= ~PPC_INTERRUPT_DECR;
         }
         powerpc_excp(cpu, POWERPC_EXCP_DECR);
         break;
-    case PPC_INTERRUPT_DOORBELL:
-        env->pending_interrupts &= ~PPC_INTERRUPT_DOORBELL;
-        if (is_book3s_arch2x(env)) {
-            powerpc_excp(cpu, POWERPC_EXCP_SDOOR);
-        } else {
-            powerpc_excp(cpu, POWERPC_EXCP_DOORI);
-        }
-        break;
-    case PPC_INTERRUPT_HDOORBELL:
-        env->pending_interrupts &= ~PPC_INTERRUPT_HDOORBELL;
-        powerpc_excp(cpu, POWERPC_EXCP_SDOOR_HV);
-        break;
     case PPC_INTERRUPT_PERFM:
         env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
         powerpc_excp(cpu, POWERPC_EXCP_PERFM);
         break;
-    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
-        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
-        powerpc_excp(cpu, POWERPC_EXCP_THERM);
-        break;
-    case PPC_INTERRUPT_EBB: /* EBB exception */
-        env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
-        if (env->spr[SPR_BESCR] & BESCR_PMEO) {
-            powerpc_excp(cpu, POWERPC_EXCP_PERFM_EBB);
-        } else if (env->spr[SPR_BESCR] & BESCR_EEO) {
-            powerpc_excp(cpu, POWERPC_EXCP_EXTERNAL_EBB);
-        }
-        break;
     case 0:
         /*
          * This is a bug ! It means that has_work took us out of halt without
-- 
2.37.3


