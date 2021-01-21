Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 889E12FF48E
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:32:53 +0100 (CET)
Received: from localhost ([::1]:54686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fhM-0000zH-IV
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:32:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55824)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIO-0002QL-BU
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:04 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:32901)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI1-0005pe-3G
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:07:04 -0500
Received: by mail-wr1-x436.google.com with SMTP id 7so2831345wrz.0
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HsBmuYHOmkArh8+q9PdOyKcEeylmhF/poYkrDZaJKS8=;
 b=yisn4cUGdww2SlwDR5c54nQMqTTYh8EOQhrsJdfyPmvpyRwCE4n9L7WBTuUtLtCA3C
 WOYyIvqlt49QfbiliXLikJBY8lUhhUi/1TPb98YY5RYpUUXHg39iN4RgC8ZuuQoYzwS1
 8E4yWg5nDiapQt03a3FT35rlSoWzWIVpL7xut+bnmMs+/tDyeOUhEe7lq1t2XZKyNwTu
 P3amsZQnvd6TFsZPQXZ5ht9fmyFYuQtDlmdzPicSkT8s6qZS4lWElGFNDUOYj+WQsoq9
 4V1rqC/6OgbVHtBm+OJtevMXKPxxFXz+WjlN99igzXoo5Bthw1EstlGNvFmvqsqowCq/
 RZWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HsBmuYHOmkArh8+q9PdOyKcEeylmhF/poYkrDZaJKS8=;
 b=FCxpzEJTAzwWBMrCqkO2v6pBR/MrX+3J3NMMjLIHhRtwAdS5lVy4Oxv+WtnG9uiCxF
 SrWEt+IdvVQIemY/XQgOz0vJqAd+zt4hiQQC1KHPPVC5YxOMY3jg2LK4VImZWvnu29q8
 nvQaZ9urxojV/sNaUYxGwwLdYi4vkKhMIddP2iFGBN7Ki0AQgsO9FDAcn2+M+BtU92ix
 DHaM7TsbVUKhxoAlzIHRMwKraqgpAgMezXjjmj6z8LrqbYov8ldsnvhG/8w2+0xs0avh
 GGPUoRUutEDskRCBF/xNwhDIFB/Phrqn7E+psumz+Hy0OS5OcUEy/iSWx7tQ5T3g9IJd
 BeCA==
X-Gm-Message-State: AOAM532iLBh1x/+uBgd6cFK3Yk0+M01kKGYvqFfcUeWxduTaFG94rrxS
 fPJ3dcC5c1lNkr1TZQ9VGHWqwg==
X-Google-Smtp-Source: ABdhPJzCOY3Tpk8wDFnDTt2e2WcOYscY7KjjSu3EgsAMGKKY4ihR+p2gphdTxZi6Mv2o/Gprbp5eVA==
X-Received: by 2002:adf:f512:: with SMTP id q18mr900026wro.55.1611255997892;
 Thu, 21 Jan 2021 11:06:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/25] hw/arm/mps2: Create and connect SYSCLK Clock
Date: Thu, 21 Jan 2021 19:06:10 +0000
Message-Id: <20210121190622.22000-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create a fixed-frequency Clock object to be the SYSCLK, and wire it
up to the devices that require it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


