Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EF02FF408
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:15:51 +0100 (CET)
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fQs-0001Kg-7e
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:15:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55572)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fI5-0002En-FN
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:47 -0500
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336]:52022)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHz-0005o7-Do
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:45 -0500
Received: by mail-wm1-x336.google.com with SMTP id m2so2404689wmm.1
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=J9BR/GO6dAcwmljpzro+bgjrMat3zg7pQ+dtLLqxHsc=;
 b=u2DYnA5U4Z8C3w7JhcYg0Vixe5xG6Jep7LASdE1W3KY+Xj7m+J/12cImVpSSKCBBhE
 l35JrWTh1MaUQJD8+vO9/Kmv9ZBsiGrMZbqyciGiaIS73Wsz6AkV5A8a3RhyQHAuCZL+
 XdK6DapBZi8hAg5BNjFmirw+qIbFIndKAi20hgXaWAOrik35x74OF3qFUEWYhqcTG37o
 0ay2Ze4AXXXEwk+pdP0dwAIYdYjI9ntVc3aFiZ+qsu1p+dK7c8V5UiULtYJSdmI+hc6J
 jPIFTro/oO0q+1QKAyu0m/GBXhxX523EpqlgWhsclABlZALXj/5O8fk2O9sEVY7OgQ3/
 TZmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=J9BR/GO6dAcwmljpzro+bgjrMat3zg7pQ+dtLLqxHsc=;
 b=Dj1JDw2KF+j7pFrGJAFo9DhW+86LcS9HuIhFwbtLEXIm0OJ6YqBNzHMxMTtg3GX6HC
 QyIoYfNOZfPjOIMAti3FMzc3dY4xJdqZoHYXTPLzMowAfxhROc7fzUJi/IPZDGRa99Ew
 qIWzBJeRwYyY6pwSnydI1ujUNJyFY8b/FpyZYTV2peHIz8f6VAMZ2Uyrr5FcyUFyuQUx
 7XArE4IZdKKJ8Sv9kPtOSfc32IFTJ9ZI9EoTl0cz4VkHwC1Pwm+Heiy1zeyu+x4z3hjO
 ML1v7eTFnE3vKB+xR04tEvTY7grP6UsJCLNwSGX69djFOdqCPgFkjtglct5K/d5fpytN
 53VQ==
X-Gm-Message-State: AOAM532qO2TVJaLYm/PpvZTT4DY1oSDmQm5VlLP5mfoDsyiIa0G586uz
 mAADN41kH0o4ouyGcQ835kfkSQ==
X-Google-Smtp-Source: ABdhPJw2IApMd7gR3s/xvq5/5+BhVug3/B5Rcn0ThUOIrKqoTNB4fia+Tj94qrttVQCBiWCFOEB+tg==
X-Received: by 2002:a7b:ca4d:: with SMTP id m13mr788208wml.28.1611255992323;
 Thu, 21 Jan 2021 11:06:32 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:31 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 07/25] hw/timer/cmsdk-apb-timer: Add Clock input
Date: Thu, 21 Jan 2021 19:06:04 +0000
Message-Id: <20210121190622.22000-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::336;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x336.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

As the first step in converting the CMSDK_APB_TIMER device to the
Clock framework, add a Clock input.  For the moment we do nothing
with this clock; we will change the behaviour from using the pclk-frq
property to using the Clock once all the users of this device have
been converted to wire up the Clock.

Since the device doesn't already have a doc comment for its "QEMU
interface", we add one including the new Clock.

This is a migration compatibility break for machines mps2-an505,
mps2-an521, musca-a, musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/cmsdk-apb-timer.h | 9 +++++++++
 hw/timer/cmsdk-apb-timer.c         | 7 +++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index baa009bb2da..fc2aa97acac 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -15,11 +15,19 @@
 #include "hw/qdev-properties.h"
 #include "hw/sysbus.h"
 #include "hw/ptimer.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_CMSDK_APB_TIMER "cmsdk-apb-timer"
 OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
 
+/*
+ * QEMU interface:
+ *  + QOM property "pclk-frq": frequency at which the timer is clocked
+ *  + Clock input "pclk": clock for the timer
+ *  + sysbus MMIO region 0: the register bank
+ *  + sysbus IRQ 0: timer interrupt TIMERINT
+ */
 struct CMSDKAPBTimer {
     /*< private >*/
     SysBusDevice parent_obj;
@@ -29,6 +37,7 @@ struct CMSDKAPBTimer {
     qemu_irq timerint;
     uint32_t pclk_frq;
     struct ptimer_state *timer;
+    Clock *pclk;
 
     uint32_t ctrl;
     uint32_t value;
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index ae9c5422540..c63145ff553 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -35,6 +35,7 @@
 #include "hw/sysbus.h"
 #include "hw/irq.h"
 #include "hw/registerfields.h"
+#include "hw/qdev-clock.h"
 #include "hw/timer/cmsdk-apb-timer.h"
 #include "migration/vmstate.h"
 
@@ -212,6 +213,7 @@ static void cmsdk_apb_timer_init(Object *obj)
                           s, "cmsdk-apb-timer", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->timerint);
+    s->pclk = qdev_init_clock_in(DEVICE(s), "pclk", NULL, NULL);
 }
 
 static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
@@ -236,10 +238,11 @@ static void cmsdk_apb_timer_realize(DeviceState *dev, Error **errp)
 
 static const VMStateDescription cmsdk_apb_timer_vmstate = {
     .name = "cmsdk-apb-timer",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
         VMSTATE_PTIMER(timer, CMSDKAPBTimer),
+        VMSTATE_CLOCK(pclk, CMSDKAPBTimer),
         VMSTATE_UINT32(ctrl, CMSDKAPBTimer),
         VMSTATE_UINT32(value, CMSDKAPBTimer),
         VMSTATE_UINT32(reload, CMSDKAPBTimer),
-- 
2.20.1


