Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D3153611800
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Oct 2022 18:48:29 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ooSRt-0008QY-NZ; Fri, 28 Oct 2022 12:43:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSRC-0002NP-7r; Fri, 28 Oct 2022 12:42:30 -0400
Received: from mail-oi1-x22f.google.com ([2607:f8b0:4864:20::22f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1ooSR9-0000PF-CZ; Fri, 28 Oct 2022 12:42:29 -0400
Received: by mail-oi1-x22f.google.com with SMTP id y67so6721967oiy.1;
 Fri, 28 Oct 2022 09:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M4Fxp4cODLcYZIEwNi6y1xkrYaW+gf2ZSNXcHPPunCE=;
 b=O+pntgj6D17DGk/9W/WgwNTcbhYJyU3VII3vRwrG8tSONeqb/BkGPKOg7zj5nZno6e
 srJozGxVCuak/A4xhFEoLtN2Axwn+2ktffczLBKJAH+AfSval71GQrp0aKiXZGdP+AVo
 zPmSC/I4kzKk/9hQuX+eeSc6MwGkv3+RzQbAVcsXLn6pSa1eVNRtVDY4fLaOPLnJRoi9
 cM/vf05gYdJfUVmY0w+1U3bg0r6gsGXWty/4Z7vFodKdMvfVhxiQDVwpVGJuUPTMqcWH
 JfQ0wtIgA1dePjEWy5TeONkLgjLmuHBc2xR1RiefuxeqmEoX/zODsLv1qDufYD2/UFhb
 Tj2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M4Fxp4cODLcYZIEwNi6y1xkrYaW+gf2ZSNXcHPPunCE=;
 b=Q6Z3i/yrQysMez/LZHgayUCoVn8eNC2DQFGX/RDbl7qz3ZcIfoexJ1pgDB6EANeI/E
 cvol31Z7t/TRmdnpDvJ3bg21YKWXgKQYnXWl/YEm0eWaHx+HyLJ4iexcJzHCQqbGApSU
 HFsBq0vQgtSg5t6xvYh3915rsIEMa62QyZX52b8KPKCE/2N7dJelV6GtqXA8s9yDU7E9
 g5ZV0kwpR2W694ebkrRii+cXBf2cH8j2aV8cWB/LzSVc7n4gJJvmTriIohfhWo/F/HEz
 95xDGEDqul3FBVuySPPcqvanYME6Pr+rZttwmzNOxyn8MYKm8bI/KGO+YBRDksRHb1+i
 nhBg==
X-Gm-Message-State: ACrzQf3S6FXi6RaE0roAVNsB+LX0RxjP+NevO96Qz20SLJqU6ImSElAB
 oUuqJqo9u4xTyZkZu26m4fyHVYxDC7rZPg==
X-Google-Smtp-Source: AMsMyM5HmxuFKWJAr1amQrInkv3v4707gXc3fniFtwNaGXMbgulohOHESye87+ueorTEyqLuAnaEIQ==
X-Received: by 2002:a05:6808:1205:b0:354:2815:4f3c with SMTP id
 a5-20020a056808120500b0035428154f3cmr8700525oil.26.1666975345408; 
 Fri, 28 Oct 2022 09:42:25 -0700 (PDT)
Received: from balboa.COMFAST ([177.45.165.63])
 by smtp.gmail.com with ESMTPSA id
 s127-20020acaa985000000b00354b7120d60sm1658373oie.52.2022.10.28.09.42.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Oct 2022 09:42:24 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, stefanha@redhat.com,
 Matheus Ferst <matheus.ferst@eldorado.org.br>,
 Fabiano Rosas <farosas@linux.ibm.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Subject: [PULL 33/62] target/ppc: remove unused interrupts from
 p8_deliver_interrupt
Date: Fri, 28 Oct 2022 13:39:22 -0300
Message-Id: <20221028163951.810456-34-danielhb413@gmail.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221028163951.810456-1-danielhb413@gmail.com>
References: <20221028163951.810456-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::22f;
 envelope-from=danielhb413@gmail.com; helo=mail-oi1-x22f.google.com
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

Remove the following unused interrupts from the POWER8 interrupt
processing method:
- PPC_INTERRUPT_RESET: only raised for 6xx, 7xx, 970 and POWER5p;
- Debug Interrupt: removed in Power ISA v2.07;
- Hypervisor Virtualization: introduced in Power ISA v3.0;
- Critical Input, Watchdog Timer, and Fixed Interval Timer: only defined
  for embedded CPUs;
- Critical Doorbell: processor does not implement the
  "Embedded.Processor Control" category;
- Programmable Interval Timer: 40x-only;
- PPC_INTERRUPT_THERM: only raised for 970 and POWER5p;

Signed-off-by: Matheus Ferst <matheus.ferst@eldorado.org.br>
Reviewed-by: Fabiano Rosas <farosas@linux.ibm.com>
Message-Id: <20221011204829.1641124-16-matheus.ferst@eldorado.org.br>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 target/ppc/excp_helper.c | 30 ------------------------------
 1 file changed, 30 deletions(-)

diff --git a/target/ppc/excp_helper.c b/target/ppc/excp_helper.c
index c2ebb5280f..21cd8d02af 100644
--- a/target/ppc/excp_helper.c
+++ b/target/ppc/excp_helper.c
@@ -1990,10 +1990,6 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
     CPUState *cs = env_cpu(env);
 
     switch (interrupt) {
-    case PPC_INTERRUPT_RESET: /* External reset */
-        env->pending_interrupts &= ~PPC_INTERRUPT_RESET;
-        powerpc_excp(cpu, POWERPC_EXCP_RESET);
-        break;
     case PPC_INTERRUPT_MCK: /* Machine check exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_MCK;
         powerpc_excp(cpu, POWERPC_EXCP_MCHECK);
@@ -2004,9 +2000,6 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
         env->pending_interrupts &= ~PPC_INTERRUPT_HDECR;
         powerpc_excp(cpu, POWERPC_EXCP_HDECR);
         break;
-    case PPC_INTERRUPT_HVIRT: /* Hypervisor virtualization interrupt */
-        powerpc_excp(cpu, POWERPC_EXCP_HVIRT);
-        break;
 
     case PPC_INTERRUPT_EXT:
         if (books_vhyp_promotes_external_to_hvirt(cpu)) {
@@ -2015,26 +2008,7 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
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
@@ -2057,10 +2031,6 @@ static void p8_deliver_interrupt(CPUPPCState *env, int interrupt)
         env->pending_interrupts &= ~PPC_INTERRUPT_PERFM;
         powerpc_excp(cpu, POWERPC_EXCP_PERFM);
         break;
-    case PPC_INTERRUPT_THERM:  /* Thermal interrupt */
-        env->pending_interrupts &= ~PPC_INTERRUPT_THERM;
-        powerpc_excp(cpu, POWERPC_EXCP_THERM);
-        break;
     case PPC_INTERRUPT_EBB: /* EBB exception */
         env->pending_interrupts &= ~PPC_INTERRUPT_EBB;
         if (env->spr[SPR_BESCR] & BESCR_PMEO) {
-- 
2.37.3


