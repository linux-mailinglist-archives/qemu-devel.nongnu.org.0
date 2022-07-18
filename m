Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AA93578886
	for <lists+qemu-devel@lfdr.de>; Mon, 18 Jul 2022 19:35:06 +0200 (CEST)
Received: from localhost ([::1]:55378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oDUe9-0001F5-JE
	for lists+qemu-devel@lfdr.de; Mon, 18 Jul 2022 13:35:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURz-0007Xs-4d; Mon, 18 Jul 2022 13:22:31 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37789)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <danielhb413@gmail.com>)
 id 1oDURw-0001iF-I6; Mon, 18 Jul 2022 13:22:30 -0400
Received: by mail-ot1-x331.google.com with SMTP id
 l9-20020a056830268900b006054381dd35so9714244otu.4; 
 Mon, 18 Jul 2022 10:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3EAdGvPl897Fy2GKSuCuXls7u3a5WgaSifOKaz/yNew=;
 b=qT1JUaiVndwPOma+yV5EubNuuzIyR65CsdOrCYe84g+cbkuKWxyLqjbXuqKcfRJtTv
 C/gDzrZJYHszPqK/Kv6wu0Sc9vTevmQjr1XevrMpWlTO26iws1i72tAeo99IvSx36Y9s
 hXkXhVm92cVfX0zSQQG9LCi86xOdRPo+DsvBAQFwwJX/WMP8wGQuUrdRCo/QqdDrxA6y
 jrSQV6vLXUOwdEbk0MH7GSvA89X+BFG5w+kej07jJca1fvELeBeUdlkAY4E0NL1TS371
 7xICF/58/1adx2X1PfaLVUmEsmnxdv2JTjynBZCbUFoUzTB0ONcU8Y3Wfh1iAUXjJnns
 c21Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3EAdGvPl897Fy2GKSuCuXls7u3a5WgaSifOKaz/yNew=;
 b=8CZtTQWf5vkQH8DHVhujncJMjKR3BPesZWOy1nEUkKf06g2m0nmhRhqS35/nKOvA+f
 4l2dYoJEPveHTpl5jEPDeLy0wok4vQZEnjTGHxvcRTxfKhwrn9TJtzZanzBk6hY/hQR0
 1qB178xci0ADu1DsEEwMfyxVvhvYexrEkUxd3Z5SWxflIS5ED+Ps2n7qkUatH1yai8Zp
 IptU+ndHRTKM7x+3DHcoGul/0BRzItKKpVB6sgpdOExqPA7klp8zsrgnQyaJR3e9Pk1/
 9qpFq2E9miINdkf11lXf6HXzqioB7/zFydhljZaBYV/JeI8KyrbQAy5p2BUtcYNugsxd
 W+pA==
X-Gm-Message-State: AJIora8uoj0Pd9WmSIxFayZJjMHyWihv0n5qlHBzz2xLGK1h+KsYEGYE
 WtzOyZc2sjSoTQqvnmmFqQG6nnTWmic=
X-Google-Smtp-Source: AGRyM1uNAHbfe0F6Bh/w1HtMxMs/gpZMF5XSWGg3W8GMShmwqx6xUFxYyKJsytf9wZamj1BQlYQIMQ==
X-Received: by 2002:a05:6830:268c:b0:618:5cc0:417d with SMTP id
 l12-20020a056830268c00b006185cc0417dmr11482754otu.196.1658164943728; 
 Mon, 18 Jul 2022 10:22:23 -0700 (PDT)
Received: from balboa.ibmmodules.com (201-27-97-88.dsl.telesp.net.br.
 [201.27.97.88]) by smtp.gmail.com with ESMTPSA id
 j27-20020a056870169b00b0010c33621645sm6523856oae.55.2022.07.18.10.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jul 2022 10:22:23 -0700 (PDT)
From: Daniel Henrique Barboza <danielhb413@gmail.com>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, danielhb413@gmail.com, peter.maydell@linaro.org,
 richard.henderson@linaro.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Subject: [PULL 04/30] ppc/e500: Allocate IRQ lines with qdev_init_gpio_in()
Date: Mon, 18 Jul 2022 14:21:42 -0300
Message-Id: <20220718172208.1247624-5-danielhb413@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718172208.1247624-1-danielhb413@gmail.com>
References: <20220718172208.1247624-1-danielhb413@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::331;
 envelope-from=danielhb413@gmail.com; helo=mail-ot1-x331.google.com
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

Signed-off-by: Cédric Le Goater <clg@kaod.org>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Message-Id: <20220705145814.461723-5-clg@kaod.org>
Signed-off-by: Daniel Henrique Barboza <danielhb413@gmail.com>
---
 hw/ppc/e500.c | 8 ++++----
 hw/ppc/ppc.c  | 5 +----
 2 files changed, 5 insertions(+), 8 deletions(-)

diff --git a/hw/ppc/e500.c b/hw/ppc/e500.c
index 7f7f5b3452..757cfaa62f 100644
--- a/hw/ppc/e500.c
+++ b/hw/ppc/e500.c
@@ -861,7 +861,6 @@ void ppce500_init(MachineState *machine)
     for (i = 0; i < smp_cpus; i++) {
         PowerPCCPU *cpu;
         CPUState *cs;
-        qemu_irq *input;
 
         cpu = POWERPC_CPU(object_new(machine->cpu_type));
         env = &cpu->env;
@@ -885,9 +884,10 @@ void ppce500_init(MachineState *machine)
             firstenv = env;
         }
 
-        input = (qemu_irq *)env->irq_inputs;
-        irqs[i].irq[OPENPIC_OUTPUT_INT] = input[PPCE500_INPUT_INT];
-        irqs[i].irq[OPENPIC_OUTPUT_CINT] = input[PPCE500_INPUT_CINT];
+        irqs[i].irq[OPENPIC_OUTPUT_INT] =
+            qdev_get_gpio_in(DEVICE(cpu), PPCE500_INPUT_INT);
+        irqs[i].irq[OPENPIC_OUTPUT_CINT] =
+            qdev_get_gpio_in(DEVICE(cpu), PPCE500_INPUT_CINT);
         env->spr_cb[SPR_BOOKE_PIR].default_value = cs->cpu_index = i;
         env->mpic_iack = pmc->ccsrbar_base + MPC8544_MPIC_REGS_OFFSET + 0xa0;
 
diff --git a/hw/ppc/ppc.c b/hw/ppc/ppc.c
index 161e5f9087..690f448cb9 100644
--- a/hw/ppc/ppc.c
+++ b/hw/ppc/ppc.c
@@ -474,10 +474,7 @@ static void ppce500_set_irq(void *opaque, int pin, int level)
 
 void ppce500_irq_init(PowerPCCPU *cpu)
 {
-    CPUPPCState *env = &cpu->env;
-
-    env->irq_inputs = (void **)qemu_allocate_irqs(&ppce500_set_irq,
-                                                  cpu, PPCE500_INPUT_NB);
+    qdev_init_gpio_in(DEVICE(cpu), ppce500_set_irq, PPCE500_INPUT_NB);
 }
 
 /* Enable or Disable the E500 EPR capability */
-- 
2.36.1


