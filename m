Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D9FF6308857
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:37:23 +0100 (CET)
Received: from localhost ([::1]:37230 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S5a-00036D-Va
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:37:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWT-0005CF-7o
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:05 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:53569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWL-0007BQ-18
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:04 -0500
Received: by mail-wm1-x32f.google.com with SMTP id j18so6496750wmi.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dmUaGgriEhx0mSkPdXXGRqxxRRW9jjlroxPjEYaS55o=;
 b=RBPi+YW2dJW+AikqvR0kOH0e7QrqgOq0BcfScII4d2lgH35uJxyNs0Mr7J+Ihs7MPg
 awFj2VVvHGy8WCMQj0CjBClGi+LZMQYfhZmHj7mPOTxcrKiBgWYpEls+x7pJ5fQMXV3C
 0HnIeyFqD760on8mr/4IO1q9SL9Xi6mpBzB3gb3hMCqy91EEP6d49SfdnOkCh6ZC9rkK
 +ApOK+HQMIqvvF5kRy6TSw+6TzKu25tS/wMtZFzQp4Ef1drnvWvQdkCXsTVxZKCVxahG
 KLQqK7oPTgl4l/lXZph+gTQsS1KhSnHgwKZfaRcnkU8a16mYpFHw/VImi9XQaMVU1por
 22pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmUaGgriEhx0mSkPdXXGRqxxRRW9jjlroxPjEYaS55o=;
 b=TzLueYGg1RACFkpcfxHe0cDe4YjymWN2Pa3LKjoBRuB5NVDYH/MWJ+9R/8CArQrN3O
 eYvLX7hFvojtyVL5UtD0uzDXeDg6GLyYCJROX1kOyBdgyGKgobnFdkCKfEzhqYWApwQM
 7thevUI5Ff9Y6tUYzIzbUTkqwxx6jCMs/O5Sac6ScjUt6UF04dajhmPYgRy44UQodnOo
 g6qHuHaPSTKdvKQmfHkqXHhgjWWDs8CicOwR/E+7lMO5G81/NEKykjsSBzZHLPd2x49j
 JcTrskLd6X1rsaUPU/i98wINVqzSAXUx+md/Ol0Q3obL9PoL4UHMgZiMO+BBzybKAys0
 rBIg==
X-Gm-Message-State: AOAM531UN+amiMckHr/6NwusaCHm/9rUliYNoEj+0EXP9i32YNxOleeQ
 sHIFFpVx4RhvkZUVlhWxNf66k1hEMEx9uA==
X-Google-Smtp-Source: ABdhPJz9Wn9m56It9BTwN3RGUbyptKtWqujgphamNBIYSphYaKaqYQaf0tdtkSOc/0iyRgauKIYXaA==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr3211377wmb.135.1611918055455; 
 Fri, 29 Jan 2021 03:00:55 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.54
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:54 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 45/46] arm: Remove frq properties on CMSDK timer, dualtimer,
 watchdog, ARMSSE
Date: Fri, 29 Jan 2021 11:00:11 +0000
Message-Id: <20210129110012.8660-46-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32f.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Now no users are setting the frq properties on the CMSDK timer,
dualtimer, watchdog or ARMSSE SoC devices, we can remove the
properties and the struct fields that back them.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-25-peter.maydell@linaro.org
Message-id: 20210121190622.22000-25-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h                  | 2 --
 include/hw/timer/cmsdk-apb-dualtimer.h   | 2 --
 include/hw/timer/cmsdk-apb-timer.h       | 2 --
 include/hw/watchdog/cmsdk-apb-watchdog.h | 2 --
 hw/arm/armsse.c                          | 2 --
 hw/timer/cmsdk-apb-dualtimer.c           | 6 ------
 hw/timer/cmsdk-apb-timer.c               | 6 ------
 hw/watchdog/cmsdk-apb-watchdog.c         | 6 ------
 8 files changed, 28 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index bfa1e79c4fe..676cd4f36b0 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -41,7 +41,6 @@
  *  + Clock input "S32KCLK": slow 32KHz clock used for a few peripherals
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
  *    by the board model.
- *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
  *  + QOM property "EXP_NUMIRQ" sets the number of expansion interrupts.
  *    (In hardware, the SSE-200 permits the number of expansion interrupts
  *    for the two CPUs to be configured separately, but we restrict it to
@@ -218,7 +217,6 @@ struct ARMSSE {
     /* Properties */
     MemoryRegion *board_memory;
     uint32_t exp_numirq;
-    uint32_t mainclk_frq;
     uint32_t sram_addr_width;
     uint32_t init_svtor;
     bool cpu_fpu[SSE_MAX_CPUS];
diff --git a/include/hw/timer/cmsdk-apb-dualtimer.h b/include/hw/timer/cmsdk-apb-dualtimer.h
index 3adbb01dd34..f3ec86c00b5 100644
--- a/include/hw/timer/cmsdk-apb-dualtimer.h
+++ b/include/hw/timer/cmsdk-apb-dualtimer.h
@@ -16,7 +16,6 @@
  * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
  *
  * QEMU interface:
- *  + QOM property "pclk-frq": frequency at which the timer is clocked
  *  + Clock input "TIMCLK": clock (for both timers)
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: combined timer interrupt TIMINTC
@@ -63,7 +62,6 @@ struct CMSDKAPBDualTimer {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq timerintc;
-    uint32_t pclk_frq;
     Clock *timclk;
 
     CMSDKAPBDualTimerModule timermod[CMSDK_APB_DUALTIMER_NUM_MODULES];
diff --git a/include/hw/timer/cmsdk-apb-timer.h b/include/hw/timer/cmsdk-apb-timer.h
index 54f7ec8c502..c4c7eae8499 100644
--- a/include/hw/timer/cmsdk-apb-timer.h
+++ b/include/hw/timer/cmsdk-apb-timer.h
@@ -23,7 +23,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(CMSDKAPBTimer, CMSDK_APB_TIMER)
 
 /*
  * QEMU interface:
- *  + QOM property "pclk-frq": frequency at which the timer is clocked
  *  + Clock input "pclk": clock for the timer
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: timer interrupt TIMERINT
@@ -35,7 +34,6 @@ struct CMSDKAPBTimer {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq timerint;
-    uint32_t pclk_frq;
     struct ptimer_state *timer;
     Clock *pclk;
 
diff --git a/include/hw/watchdog/cmsdk-apb-watchdog.h b/include/hw/watchdog/cmsdk-apb-watchdog.h
index 34069ca6969..c6b3e78731e 100644
--- a/include/hw/watchdog/cmsdk-apb-watchdog.h
+++ b/include/hw/watchdog/cmsdk-apb-watchdog.h
@@ -16,7 +16,6 @@
  * https://developer.arm.com/products/system-design/system-design-kits/cortex-m-system-design-kit
  *
  * QEMU interface:
- *  + QOM property "wdogclk-frq": frequency at which the watchdog is clocked
  *  + Clock input "WDOGCLK": clock for the watchdog's timer
  *  + sysbus MMIO region 0: the register bank
  *  + sysbus IRQ 0: watchdog interrupt
@@ -53,7 +52,6 @@ struct CMSDKAPBWatchdog {
     /*< public >*/
     MemoryRegion iomem;
     qemu_irq wdogint;
-    uint32_t wdogclk_frq;
     bool is_luminary;
     struct ptimer_state *timer;
     Clock *wdogclk;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 34855e667de..26e1a8c95b6 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -48,7 +48,6 @@ static Property iotkit_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], true),
@@ -60,7 +59,6 @@ static Property armsse_properties[] = {
     DEFINE_PROP_LINK("memory", ARMSSE, board_memory, TYPE_MEMORY_REGION,
                      MemoryRegion *),
     DEFINE_PROP_UINT32("EXP_NUMIRQ", ARMSSE, exp_numirq, 64),
-    DEFINE_PROP_UINT32("MAINCLK_FRQ", ARMSSE, mainclk_frq, 0),
     DEFINE_PROP_UINT32("SRAM_ADDR_WIDTH", ARMSSE, sram_addr_width, 15),
     DEFINE_PROP_UINT32("init-svtor", ARMSSE, init_svtor, 0x10000000),
     DEFINE_PROP_BOOL("CPU0_FPU", ARMSSE, cpu_fpu[0], false),
diff --git a/hw/timer/cmsdk-apb-dualtimer.c b/hw/timer/cmsdk-apb-dualtimer.c
index 828127b366f..ef49f5852d3 100644
--- a/hw/timer/cmsdk-apb-dualtimer.c
+++ b/hw/timer/cmsdk-apb-dualtimer.c
@@ -533,11 +533,6 @@ static const VMStateDescription cmsdk_apb_dualtimer_vmstate = {
     }
 };
 
-static Property cmsdk_apb_dualtimer_properties[] = {
-    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBDualTimer, pclk_frq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cmsdk_apb_dualtimer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -545,7 +540,6 @@ static void cmsdk_apb_dualtimer_class_init(ObjectClass *klass, void *data)
     dc->realize = cmsdk_apb_dualtimer_realize;
     dc->vmsd = &cmsdk_apb_dualtimer_vmstate;
     dc->reset = cmsdk_apb_dualtimer_reset;
-    device_class_set_props(dc, cmsdk_apb_dualtimer_properties);
 }
 
 static const TypeInfo cmsdk_apb_dualtimer_info = {
diff --git a/hw/timer/cmsdk-apb-timer.c b/hw/timer/cmsdk-apb-timer.c
index f053146d88f..ee51ce3369c 100644
--- a/hw/timer/cmsdk-apb-timer.c
+++ b/hw/timer/cmsdk-apb-timer.c
@@ -261,11 +261,6 @@ static const VMStateDescription cmsdk_apb_timer_vmstate = {
     }
 };
 
-static Property cmsdk_apb_timer_properties[] = {
-    DEFINE_PROP_UINT32("pclk-frq", CMSDKAPBTimer, pclk_frq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -273,7 +268,6 @@ static void cmsdk_apb_timer_class_init(ObjectClass *klass, void *data)
     dc->realize = cmsdk_apb_timer_realize;
     dc->vmsd = &cmsdk_apb_timer_vmstate;
     dc->reset = cmsdk_apb_timer_reset;
-    device_class_set_props(dc, cmsdk_apb_timer_properties);
 }
 
 static const TypeInfo cmsdk_apb_timer_info = {
diff --git a/hw/watchdog/cmsdk-apb-watchdog.c b/hw/watchdog/cmsdk-apb-watchdog.c
index 9cad0c67da4..302f1711738 100644
--- a/hw/watchdog/cmsdk-apb-watchdog.c
+++ b/hw/watchdog/cmsdk-apb-watchdog.c
@@ -373,11 +373,6 @@ static const VMStateDescription cmsdk_apb_watchdog_vmstate = {
     }
 };
 
-static Property cmsdk_apb_watchdog_properties[] = {
-    DEFINE_PROP_UINT32("wdogclk-frq", CMSDKAPBWatchdog, wdogclk_frq, 0),
-    DEFINE_PROP_END_OF_LIST(),
-};
-
 static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -385,7 +380,6 @@ static void cmsdk_apb_watchdog_class_init(ObjectClass *klass, void *data)
     dc->realize = cmsdk_apb_watchdog_realize;
     dc->vmsd = &cmsdk_apb_watchdog_vmstate;
     dc->reset = cmsdk_apb_watchdog_reset;
-    device_class_set_props(dc, cmsdk_apb_watchdog_properties);
 }
 
 static const TypeInfo cmsdk_apb_watchdog_info = {
-- 
2.20.1


