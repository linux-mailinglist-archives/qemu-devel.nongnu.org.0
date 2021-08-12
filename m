Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D409D3EA284
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:53:12 +0200 (CEST)
Received: from localhost ([::1]:58234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7Oh-0003iD-Uh
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:53:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46906)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76d-0006Uv-FE
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:31 -0400
Received: from mail-wr1-x431.google.com ([2a00:1450:4864:20::431]:45704)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76W-000875-O8
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:31 -0400
Received: by mail-wr1-x431.google.com with SMTP id v4so235623wro.12
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JrO8pXzBjKu0CYeoFLRGkh6olNA2hx/ha44oSWqPp6c=;
 b=I3glhpa/FzBgLVPthKziZ6PuybZux2jd5E09mE2lu41sX4fmy4pORIOU9zZncIXGIQ
 ImPG+afXJfjB0fTZyQx0Novx9eDrHehiFW87W1Mmk/nG/ScwVBvx1KDhUkliW5YOe0mG
 GH5kQgkpXnLa0H1BkT+ecJU43o8fYYQqQIXmo23lRKmOsDMN07/bb2pBnqlITX8pfJYP
 B2sqgN8aPqGwvv3AotLWIxJpkMBi2R7ZrubsybPuo9KQ8ot5+Fkd6IP81KnXokhGkZul
 G+cL/qxzTwjgJO+2W4QEVlwa1t6M1FK/tfWe+HfpXgsgIrilAM9lfjkUvjBMkXuWNwBi
 53Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JrO8pXzBjKu0CYeoFLRGkh6olNA2hx/ha44oSWqPp6c=;
 b=h7F0G5J7PHkpoVEfuI55V01NnP5iqkVy3jNm8dCdLdiKXI37NUe7pNlWd8LUB/WUWM
 Tc2XUysMe1ndBsvSbno5ycrN8reOdWzkP+4GDhB/MBUqef2Yd54hyS1e+H+UYr6Ox6Pm
 TDKEYIsdBMfDB5nLDEHtiRrzMsthM5IuBd3Qk8CnhQvA97AsxIMgIKEE5rDU2/hLpNdM
 3Ex6LJGFVZqGeWSdznXNe6+WhIgxSQgsnq4nzxOeZfxtvSwQM4m/bNspXII7tKZTmkJ+
 EEe+lr9D0yBfyANNcTfSJUbEwrx9EufU8V9Nd0Q47lEuKvArALcct71WClKayrDIIDf0
 kGcA==
X-Gm-Message-State: AOAM5330KSUWkhRgSueHviAY7LvrdSZPerEsNJAgKC4Owg6oXx4rZzrc
 N7WZt+aeTqyvP2z7cde2fVWIuQ==
X-Google-Smtp-Source: ABdhPJw8HPKkx/GqNVmIxmc0mls4fnr2EtoknO1TwzjdoY8FBTOzjrL1ZbUSWjB1tW5F+kZ3unCp5Q==
X-Received: by 2002:adf:ba4d:: with SMTP id t13mr2902037wrg.424.1628760863212; 
 Thu, 12 Aug 2021 02:34:23 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:22 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 25/25] arm: Remove system_clock_scale global
Date: Thu, 12 Aug 2021 10:33:56 +0100
Message-Id: <20210812093356.1946-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

All the devices that used to use system_clock_scale have now been
converted to use Clock inputs instead, so the global is no longer
needed; remove it and all the code that sets it.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/armv7m_systick.h | 22 ----------------------
 hw/arm/armsse.c                   | 17 +----------------
 hw/arm/mps2.c                     |  2 --
 hw/arm/msf2-soc.c                 |  2 --
 hw/arm/netduino2.c                |  2 --
 hw/arm/netduinoplus2.c            |  2 --
 hw/arm/nrf51_soc.c                |  2 --
 hw/arm/stellaris.c                |  7 ++++---
 hw/arm/stm32vldiscovery.c         |  2 --
 hw/timer/armv7m_systick.c         |  2 --
 10 files changed, 5 insertions(+), 55 deletions(-)

diff --git a/include/hw/timer/armv7m_systick.h b/include/hw/timer/armv7m_systick.h
index 38adf8d274e..ee09b138810 100644
--- a/include/hw/timer/armv7m_systick.h
+++ b/include/hw/timer/armv7m_systick.h
@@ -47,26 +47,4 @@ struct SysTickState {
     Clock *cpuclk;
 };
 
-/*
- * Multiplication factor to convert from system clock ticks to qemu timer
- * ticks. This should be set (by board code, usually) to a value
- * equal to NANOSECONDS_PER_SECOND / frq, where frq is the clock frequency
- * in Hz of the CPU.
- *
- * This value is used by the systick device when it is running in
- * its "use the CPU clock" mode (ie when SYST_CSR.CLKSOURCE == 1) to
- * set how fast the timer should tick.
- *
- * TODO: we should refactor this so that rather than using a global
- * we use a device property or something similar. This is complicated
- * because (a) the property would need to be plumbed through from the
- * board code down through various layers to the systick device
- * and (b) the property needs to be modifiable after realize, because
- * the stellaris board uses this to implement the behaviour where the
- * guest can reprogram the PLL registers to downclock the CPU, and the
- * systick device needs to react accordingly. Possibly this should
- * be deferred until we have a good API for modelling clock trees.
- */
-extern int system_clock_scale;
-
 #endif
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 70b52c3d4b9..aecdeb9815a 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -689,17 +689,6 @@ static void armsse_forward_sec_resp_cfg(ARMSSE *s)
     qdev_connect_gpio_out(dev_splitter, 2, s->sec_resp_cfg_in);
 }
 
-static void armsse_mainclk_update(void *opaque, ClockEvent event)
-{
-    ARMSSE *s = ARM_SSE(opaque);
-
-    /*
-     * Set system_clock_scale from our Clock input; this is what
-     * controls the tick rate of the CPU SysTick timer.
-     */
-    system_clock_scale = clock_ticks_to_ns(s->mainclk, 1);
-}
-
 static void armsse_init(Object *obj)
 {
     ARMSSE *s = ARM_SSE(obj);
@@ -711,8 +700,7 @@ static void armsse_init(Object *obj)
     assert(info->sram_banks <= MAX_SRAM_BANKS);
     assert(info->num_cpus <= SSE_MAX_CPUS);
 
-    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK",
-                                    armsse_mainclk_update, s, ClockUpdate);
+    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL, 0);
     s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL, 0);
 
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
@@ -1654,9 +1642,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * devices in the ARMSSE.
      */
     sysbus_init_mmio(SYS_BUS_DEVICE(s), &s->container);
-
-    /* Set initial system_clock_scale from MAINCLK */
-    armsse_mainclk_update(s, ClockUpdate);
 }
 
 static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index 3671f49ad7b..4634aa1a1ca 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -439,8 +439,6 @@ static void mps2_common_init(MachineState *machine)
                  qdev_get_gpio_in(armv7m,
                                   mmc->fpga_type == FPGA_AN511 ? 47 : 13));
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
                        0x400000);
 }
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index dbc6d936a76..b5fe9f364d5 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -144,8 +144,6 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
         return;
     }
 
-    system_clock_scale = clock_ticks_to_ns(s->m3clk, 1);
-
     for (i = 0; i < MSF2_NUM_UARTS; i++) {
         if (serial_hd(i)) {
             serial_mm_init(get_system_memory(), uart_addr[i], 2,
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index b5c0ba23ee5..3365da11bf7 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -39,8 +39,6 @@ static void netduino2_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index a5a8999cc8c..76cea8e4891 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -39,8 +39,6 @@ static void netduinoplus2_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
diff --git a/hw/arm/nrf51_soc.c b/hw/arm/nrf51_soc.c
index e3e849a32b1..34da0d62f00 100644
--- a/hw/arm/nrf51_soc.c
+++ b/hw/arm/nrf51_soc.c
@@ -84,8 +84,6 @@ static void nrf51_soc_realize(DeviceState *dev_soc, Error **errp)
      * will always provide one).
      */
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / HCLK_FRQ;
-
     object_property_set_link(OBJECT(&s->cpu), "memory", OBJECT(&s->container),
                              &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->cpu), errp)) {
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 3e7d1dabad1..78827ace6b8 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -263,17 +263,18 @@ static bool ssys_use_rcc2(ssys_state *s)
  */
 static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
 {
+    int period_ns;
     /*
      * SYSDIV field specifies divisor: 0 == /1, 1 == /2, etc.  Input
      * clock is 200MHz, which is a period of 5 ns. Dividing the clock
      * frequency by X is the same as multiplying the period by X.
      */
     if (ssys_use_rcc2(s)) {
-        system_clock_scale = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
+        period_ns = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
     } else {
-        system_clock_scale = 5 * (((s->rcc >> 23) & 0xf) + 1);
+        period_ns = 5 * (((s->rcc >> 23) & 0xf) + 1);
     }
-    clock_set_ns(s->sysclk, system_clock_scale);
+    clock_set_ns(s->sysclk, period_ns);
     if (propagate_clock) {
         clock_propagate(s->sysclk);
     }
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 9b79004703b..04036da3ee0 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -42,8 +42,6 @@ static void stm32vldiscovery_init(MachineState *machine)
     DeviceState *dev;
     Clock *sysclk;
 
-    system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
-
     /* This clock doesn't need migration because it is fixed-frequency */
     sysclk = clock_new(OBJECT(machine), "SYSCLK");
     clock_set_hz(sysclk, SYSCLK_FRQ);
diff --git a/hw/timer/armv7m_systick.c b/hw/timer/armv7m_systick.c
index 39cca206cfd..9f92830968b 100644
--- a/hw/timer/armv7m_systick.c
+++ b/hw/timer/armv7m_systick.c
@@ -29,8 +29,6 @@
 #define SYSCALIB_NOREF (1U << 31)
 #define SYSCALIB_SKEW (1U << 30)
 
-int system_clock_scale;
-
 static void systick_set_period_from_clock(SysTickState *s)
 {
     /*
-- 
2.20.1


