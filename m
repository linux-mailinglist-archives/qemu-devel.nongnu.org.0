Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B90130754C
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:59:26 +0100 (CET)
Received: from localhost ([::1]:55902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55xN-0006w7-I0
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:59:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33850)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55ge-0001VP-SI
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:10 -0500
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:40941)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gY-00069S-6V
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:08 -0500
Received: by mail-wr1-x433.google.com with SMTP id c12so5055458wrc.7
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xRN3YGEBWk7hWGjfWYQ25vV7dydgRP+ZNx8pvaqAtbo=;
 b=QLzfGl/gsUVWZmRpP9wyWVS3NGPbItHdl8o3M545DlUsBIFJiwyOZd3nbbeBzKmP6q
 erUFt7BmfdiK9uiHkPtiqoglrHzmr+b4/7VScpVsCdyGNdO/VzcEN9K85f43cLabXd3L
 fzEBPO3RLszMZ6zPDjbqhQ8WkwKNcL5VsfI+UOzKWnp0mYtPgRpTQx3EnpGSvwqWYk45
 VQlTFOy33GQakUxTJ+SpLao1Padump7xnQWaBpZDZK7xB5zkKvSzvfxtPMWc8dgN18O/
 0b7k7Gmmt+AbjKbpAk6sloEk6ky28zFbUkOSBpSCPWNj2AUSSKiKdfIDYpqpudBGX8LN
 ScMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xRN3YGEBWk7hWGjfWYQ25vV7dydgRP+ZNx8pvaqAtbo=;
 b=Vk+42qTOAVlXg3YMoMo+frG0VsrEx1dPpr5u+ecbosVlvBMQJxDFKJoz4fosSuKnY4
 q4ajQ5NPaXC0VP/ia/EWcWyHKlE8J3tRQr3u5EsG1eeT2WCcd/SZOBBjQYMVeKEjNNtP
 pn5XPTyWwoHM/B2bvzt9CAjQ1o6qAsC7gIsy29UFrc9fDESp0+cwWpWg8A7wMhtNr5nU
 SzC1JTZOUVTF0MCUIvTCIBCgUdTqrpTaNRvnurKROVo+yXfrAI98H/X2cGAutLZ0opM0
 3PUtLU18mASO3W2GJgByWsUbgi78M5bsTbvMF9HgYVPW5xlud06czozsgXrb3PNRikTJ
 bW9A==
X-Gm-Message-State: AOAM530m6x0kPhgAN5LIesF451kDyeahYe2LC9LYDl9UUYPf0h59Er3m
 H8kxBvhetUfUOvJdFgbzb2sA2A==
X-Google-Smtp-Source: ABdhPJxXiPmyZC/ktwQkNej3qbfXqdReqc2ajIzqDUWBJDF8j0i4KEMjzQrYzsN3Y361fxqiS7eO6w==
X-Received: by 2002:adf:ba49:: with SMTP id t9mr15993891wrg.183.1611834120834; 
 Thu, 28 Jan 2021 03:42:00 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:00 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 13/25] hw/arm/mps2: Create and connect SYSCLK Clock
Date: Thu, 28 Jan 2021 11:41:33 +0000
Message-Id: <20210128114145.20536-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x433.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a fixed-frequency Clock object to be the SYSCLK, and wire it
up to the devices that require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-14-peter.maydell@linaro.org
---
 hw/arm/mps2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index f762d1b46af..cd1c215f941 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -46,6 +46,7 @@
 #include "hw/net/lan9118.h"
 #include "net/net.h"
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
+#include "hw/qdev-clock.h"
 #include "qom/object.h"
 
 typedef enum MPS2FPGAType {
@@ -84,6 +85,7 @@ struct MPS2MachineState {
     CMSDKAPBDualTimer dualtimer;
     CMSDKAPBWatchdog watchdog;
     CMSDKAPBTimer timer[2];
+    Clock *sysclk;
 };
 
 #define TYPE_MPS2_MACHINE "mps2"
@@ -140,6 +142,10 @@ static void mps2_common_init(MachineState *machine)
         exit(EXIT_FAILURE);
     }
 
+    /* This clock doesn't need migration because it is fixed-frequency */
+    mms->sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(mms->sysclk, SYSCLK_FRQ);
+
     /* The FPGA images have an odd combination of different RAMs,
      * because in hardware they are different implementations and
      * connected to different buses, giving varying performance/size
@@ -341,6 +347,7 @@ static void mps2_common_init(MachineState *machine)
                                 TYPE_CMSDK_APB_TIMER);
         sbd = SYS_BUS_DEVICE(&mms->timer[i]);
         qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
+        qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
         sysbus_realize_and_unref(sbd, &error_fatal);
         sysbus_mmio_map(sbd, 0, base);
         sysbus_connect_irq(sbd, 0, qdev_get_gpio_in(armv7m, irqno));
@@ -349,6 +356,7 @@ static void mps2_common_init(MachineState *machine)
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
     qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
                        qdev_get_gpio_in(armv7m, 10));
@@ -356,6 +364,7 @@ static void mps2_common_init(MachineState *machine)
     object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
     qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
+    qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
                        qdev_get_gpio_in_named(armv7m, "NMI", 0));
-- 
2.20.1


