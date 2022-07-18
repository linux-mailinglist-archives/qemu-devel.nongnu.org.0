Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F05C8578869
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:29:25 +0200 (CEST)
Received: from localhost ([::1]:40854 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUYf-00082f-3V
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:29:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURp-0007Lj-AR; Mon, 18 Jul 2022 13:22:21 -0400
Received: from mail-oa1-x2e.google.com ([2001:4860:4864:20::2e]:40571)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURn-0001fK-LH; Mon, 18 Jul 2022 13:22:21 -0400
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-10c0e6dd55eso25477550fac.7; 
 Mon, 18 Jul 2022 10:22:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yotMDKnrlvzuD84KZXN8hdzQeDs7OAIA1C+lLZ2UREw=;
 b=Nt2KWXK48bgWMKgKfRbv+d91EMjI1nIfav1Q1krSzupNb03EyfK8PcyfSV4zWyMrOR
 EwZhja0kwKmFTjuQ4o8SbD6rA7GBM/ACXzGW3CZYn/yFQuRfVcGbrbOk/dXY8Zax8U1y
 o7wY6BZt3BsJat6a6Ez7l6Xuf1k/tg4gxMn13v/JIvP1n30ammSoz9h+ZrFNniy0g2LN
 wQWdLsVuNJuRkQK2XlE72PTKRA2cWz+Zbd8FP8hg4yl/dOzywEtA3qu0Ec1wU6172WNC
 sw0MkHf1UEZDfv52GWsu0Z29Ng++sREHU8Z+a8buc43cs/mbKHvGybWUFoWkoLLL8mb9
 deEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yotMDKnrlvzuD84KZXN8hdzQeDs7OAIA1C+lLZ2UREw=;
 b=4I528g57W/0S12SYtlopOsF+fd6ecJUHBBOIOMFLYWwSAomWIg5eNAk//dV6O8hAgE
 tJjVsnbDFQNs5DFiluj/GydOuBtaX3t/3dYT5A6mZTD3MUgM7EJscq3NT0NToicgZTd6
 TKxdE5h99vK66IPUiK1yXqc4xNtLZgb8eCDR1u94fRA6488agZ9yFZORoEZvUbV5gblC
 +y/5uVhG4tw5T23zXxh/6Uz3Z7sCvC5vyCGJisbs3U3LMNt0wIRKGs7kjke0FSwR3VwK
 DTvCigW0ZctU7M0jydgseVzPtJoTtRaj+nyzokybHOHtDIV7cgws3o0pFw3bC6Gkcv/Q
 Tj+Q==
X-Gm-Message-State: AJIora+ARof+rnk+4qPPRmEk/Beekuj/rfFFTzjqFAH9yMJPB1ZI38I0
 ZsL+zWXq8VLpHgCRXZoHrSg6HW6EDGc=
X-Google-Smtp-Source: AGRyM1uLCMkcrPID8QdniCfmNYWLnHWPa2zREtRDBNLrOgICbTzrVu0Y4aCjHJavq50DuvY6/DoRAQ==
X-Received: by 2002:a05:6870:8186:b0:10c:2ed:44f9 with SMTP id
 k6-20020a056870818600b0010c02ed44f9mr18088868oae.35.1658164936924; 
 Mon, 18 Jul 2022 10:22:16 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:16 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Subject: [PULL 01/30] ppc64: Allocate IRQ lines with qdev_init_gpio_in()
Date: Mon, 18 Jul 2022 14:21:39 -0300
Message-Id: <20220718172208.1247624-2-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::2e;
 envelope-from=danielhb413@gmail.com; helo=mail-oa1-x2e.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 FREEMAIL_ENVFROM_END_DIGIT=0.25, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: Cédric Le Goater <clg@kaod.org>

This replaces the IRQ array 'irq_inputs' with GPIO lines, the goal
being to remove 'irq_inputs' when all CPUs have been converted.

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Acked-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220705145814.461723-2-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/intc/xics.c        | 10 ++++++----
 hw/intc/xive.c        |  4 ++--
 hw/ppc/mac_newworld.c |  8 ++++----
 hw/ppc/ppc.c          | 15 +++------------
 4 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/hw/intc/xics.c b/hw/intc/xics.c
index 24e67020db..5b0b4d9624 100644
--- a/hw/intc/xics.c
+++ b/hw/intc/xics.c
@@ -301,23 +301,25 @@ void icp_reset(ICPState *icp)
 static void icp_realize(DeviceState *dev, Error **errp)
 {
     ICPState *icp = ICP(dev);
+    PowerPCCPU *cpu;
     CPUPPCState *env;
     Error *err = NULL;
 
     assert(icp->xics);
     assert(icp->cs);
 
-    env = &POWERPC_CPU(icp->cs)->env;
+    cpu = POWERPC_CPU(icp->cs);
+    env = &cpu->env;
     switch (PPC_INPUT(env)) {
     case PPC_FLAGS_INPUT_POWER7:
-        icp->output = env->irq_inputs[POWER7_INPUT_INT];
+        icp->output = qdev_get_gpio_in(DEVICE(cpu), POWER7_INPUT_INT);
         break;
     case PPC_FLAGS_INPUT_POWER9: /* For SPAPR xics emulation */
-        icp->output = env->irq_inputs[POWER9_INPUT_INT];
+        icp->output = qdev_get_gpio_in(DEVICE(cpu), POWER9_INPUT_INT);
         break;
 
     case PPC_FLAGS_INPUT_970:
-        icp->output = env->irq_inputs[PPC970_INPUT_INT];
+        icp->output = qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
         break;
 
     default:
diff --git a/hw/intc/xive.c b/hw/intc/xive.c
index ae221fed73..a986b96843 100644
--- a/hw/intc/xive.c
+++ b/hw/intc/xive.c
@@ -695,8 +695,8 @@ static void xive_tctx_realize(DeviceState *dev, Error **errp)
     env = &cpu->env;
     switch (PPC_INPUT(env)) {
     case PPC_FLAGS_INPUT_POWER9:
-        tctx->hv_output = env->irq_inputs[POWER9_INPUT_HINT];
-        tctx->os_output = env->irq_inputs[POWER9_INPUT_INT];
+        tctx->hv_output = qdev_get_gpio_in(DEVICE(cpu), POWER9_INPUT_HINT);
+        tctx->os_output = qdev_get_gpio_in(DEVICE(cpu), POWER9_INPUT_INT);
         break;
 
     default:
diff --git a/hw/ppc/mac_newworld.c b/hw/ppc/mac_newworld.c
index c865921bdc..22405dd27a 100644
--- a/hw/ppc/mac_newworld.c
+++ b/hw/ppc/mac_newworld.c
@@ -276,16 +276,16 @@ static void ppc_core99_init(MachineState *machine)
 #if defined(TARGET_PPC64)
         case PPC_FLAGS_INPUT_970:
             openpic_irqs[i].irq[OPENPIC_OUTPUT_INT] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_INT];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_CINT] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_INT];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_INT);
             openpic_irqs[i].irq[OPENPIC_OUTPUT_MCK] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_MCP];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_MCP);
             /* Not connected ? */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_DEBUG] = NULL;
             /* Check this */
             openpic_irqs[i].irq[OPENPIC_OUTPUT_RESET] =
-                ((qemu_irq *)env->irq_inputs)[PPC970_INPUT_HRESET];
+                qdev_get_gpio_in(DEVICE(cpu), PPC970_INPUT_HRESET);
             break;
 #endif /* defined(TARGET_PPC64) */
         default:
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index fea70df45e..15f2b5f0f0 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -234,10 +234,7 @@ static void ppc970_set_irq(void *opaque, int pin, int level)
 
 void ppc970_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppc970_set_irq, cpu,
-                                                  PPC970_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppc970_set_irq, PPC970_INPUT_NB);
 }
 
 /* POWER7 internal IRQ controller */
@@ -260,10 +257,7 @@ static void power7_set_irq(void *opaque, int pin, int level)
 
 void ppcPOWER7_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&power7_set_irq, cpu,
-                                                  POWER7_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), power7_set_irq, POWER7_INPUT_NB);
 }
 
 /* POWER9 internal IRQ controller */
@@ -292,10 +286,7 @@ static void power9_set_irq(void *opaque, int pin, int level)
 
 void ppcPOWER9_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&power9_set_irq, cpu,
-                                                  POWER9_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), power9_set_irq, POWER9_INPUT_NB);
 }
 #endif /* defined(TARGET_PPC64) */
 
-- 
2.36.1


