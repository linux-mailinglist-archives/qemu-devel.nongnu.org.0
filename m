Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9469C308850
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:34:37 +0100 (CET)
Received: from localhost ([::1]:55890 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5S2u-0007ZZ-Gp
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:34:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWP-00059y-Ol
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:01 -0500
Received: from mail-wr1-x434.google.com ([2a00:1450:4864:20::434]:36771)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWJ-0007BB-V3
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:01:01 -0500
Received: by mail-wr1-x434.google.com with SMTP id 6so8391589wri.3
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=vItLqJg/MtoIe02dX0vZeY+tc6nMRkWMUI4JyuPC8J0=;
 b=jDRhudn6lIsqgeQ4cbJSE9DWwnw6aHDZ54XzWd8aa8pdBbKo1finXSeTzs6P3GDLYl
 AmVhKwcN8weA801VlhIydJfoNzWULiwnq3gEDQG2wr5IIVK6UHiEjd+aCfGDLYZgTiyE
 BDz/BxCitb4CTLiVnVBgn+ZDAPO7Vw/P1Gn8fYFv7QwI14mmT2JfwHJ7b5yrT6uZ7+Bu
 x1QJ64n7AFqqcskwlY9N7LOQCiNsgcQSpm2Sqjuq5jtPJkKqID4qu6tWQJRfUQO4DG37
 itNa7TMvbzYFxddgT8jJvDSzQzNzx/GKJIMPNVFn7o159MKm9Cl/3jR3+51j10R4M3Yz
 8W5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vItLqJg/MtoIe02dX0vZeY+tc6nMRkWMUI4JyuPC8J0=;
 b=C4broX1SfYcO1hV9BCAhmbZKLxoxBxQGmDehM5xNcqLekfjDU5AcODmpnCIdVn+hph
 mK0JmaAw2gMs95XQ5KDWEA3jt2Ndsb7OCjUKIRqo/6tN9/KQWbRHlz+KobLnukKBS6Xm
 vx/hyd3mKhluhl5djZjYt4IiY7DCIGWygXbsVJ1OdZRy0W8m/1HvPhATbwKYKHttEqOz
 MzVHe+hapqo+kAMrtLezoNWy5vmxFdcedioBxjnY09dQrUirRS7CuHbYHdxDovn83u7Y
 rUhQaKWeP0GHimmd57mDOou1RD+SlMbYPnEVFNZWx1/SAH6rgXtxVH26MrZNydPVchyf
 /zFw==
X-Gm-Message-State: AOAM532ukhKwqkv/dqza6LjSAcDkuzvdjmUPQfv6OpYefkqrKOTGVT3c
 ju6W3/Tl3LMkdnXc5Ne18Pihe+2RDa23yw==
X-Google-Smtp-Source: ABdhPJxK4XXKnQGobCBqHh76POSC+z9Ke+p+LTz1D3JP2gHzRU/+u4NHtcl7CZeRa8gdrJN3jKtIxA==
X-Received: by 2002:a05:6000:1043:: with SMTP id
 c3mr3984815wrx.140.1611918054595; 
 Fri, 29 Jan 2021 03:00:54 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.53
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:53 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/46] arm: Don't set freq properties on CMSDK timer, dualtimer,
 watchdog, ARMSSE
Date: Fri, 29 Jan 2021 11:00:10 +0000
Message-Id: <20210129110012.8660-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::434;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x434.google.com
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

Remove all the code that sets frequency properties on the CMSDK
timer, dualtimer and watchdog devices and on the ARMSSE SoC device:
these properties are unused now that the devices rely on their Clock
inputs instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-24-peter.maydell@linaro.org
Message-id: 20210121190622.22000-24-peter.maydell@linaro.org
---
 hw/arm/armsse.c    | 7 -------
 hw/arm/mps2-tz.c   | 1 -
 hw/arm/mps2.c      | 3 ---
 hw/arm/musca.c     | 1 -
 hw/arm/stellaris.c | 3 ---
 5 files changed, 15 deletions(-)

diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index 9a6b24c79aa..34855e667de 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -727,7 +727,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * it to the appropriate PPC port; then we can realize the PPC and
      * map its upstream ends to the right place in the container.
      */
-    qdev_prop_set_uint32(DEVICE(&s->timer0), "pclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
         return;
@@ -738,7 +737,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(&s->apb_ppc0), "port[0]", OBJECT(mr),
                              &error_abort);
 
-    qdev_prop_set_uint32(DEVICE(&s->timer1), "pclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
         return;
@@ -749,7 +747,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     object_property_set_link(OBJECT(&s->apb_ppc0), "port[1]", OBJECT(mr),
                              &error_abort);
 
-    qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
         return;
@@ -908,7 +905,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     /* Devices behind APB PPC1:
      *   0x4002f000: S32K timer
      */
-    qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
     qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
         return;
@@ -1002,7 +998,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     qdev_connect_gpio_out(DEVICE(&s->nmi_orgate), 0,
                           qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
 
-    qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
     qdev_connect_clock_in(DEVICE(&s->s32kwatchdog), "WDOGCLK", s->s32kclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32kwatchdog), errp)) {
         return;
@@ -1013,7 +1008,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
 
     /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
 
-    qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->nswatchdog), "WDOGCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->nswatchdog), errp)) {
         return;
@@ -1022,7 +1016,6 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                        armsse_get_common_irq_in(s, 1));
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
 
-    qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
     qdev_connect_clock_in(DEVICE(&s->swatchdog), "WDOGCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->swatchdog), errp)) {
         return;
diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index 7acdf490f28..90caa914934 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -413,7 +413,6 @@ static void mps2tz_common_init(MachineState *machine)
     object_property_set_link(OBJECT(&mms->iotkit), "memory",
                              OBJECT(system_memory), &error_abort);
     qdev_prop_set_uint32(iotkitdev, "EXP_NUMIRQ", MPS2TZ_NUMIRQ);
-    qdev_prop_set_uint32(iotkitdev, "MAINCLK_FRQ", SYSCLK_FRQ);
     qdev_connect_clock_in(iotkitdev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(iotkitdev, "S32KCLK", mms->s32kclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->iotkit), &error_fatal);
diff --git a/hw/arm/mps2.c b/hw/arm/mps2.c
index cd1c215f941..39add416db5 100644
--- a/hw/arm/mps2.c
+++ b/hw/arm/mps2.c
@@ -346,7 +346,6 @@ static void mps2_common_init(MachineState *machine)
         object_initialize_child(OBJECT(mms), name, &mms->timer[i],
                                 TYPE_CMSDK_APB_TIMER);
         sbd = SYS_BUS_DEVICE(&mms->timer[i]);
-        qdev_prop_set_uint32(DEVICE(&mms->timer[i]), "pclk-frq", SYSCLK_FRQ);
         qdev_connect_clock_in(DEVICE(&mms->timer[i]), "pclk", mms->sysclk);
         sysbus_realize_and_unref(sbd, &error_fatal);
         sysbus_mmio_map(sbd, 0, base);
@@ -355,7 +354,6 @@ static void mps2_common_init(MachineState *machine)
 
     object_initialize_child(OBJECT(mms), "dualtimer", &mms->dualtimer,
                             TYPE_CMSDK_APB_DUALTIMER);
-    qdev_prop_set_uint32(DEVICE(&mms->dualtimer), "pclk-frq", SYSCLK_FRQ);
     qdev_connect_clock_in(DEVICE(&mms->dualtimer), "TIMCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->dualtimer), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->dualtimer), 0,
@@ -363,7 +361,6 @@ static void mps2_common_init(MachineState *machine)
     sysbus_mmio_map(SYS_BUS_DEVICE(&mms->dualtimer), 0, 0x40002000);
     object_initialize_child(OBJECT(mms), "watchdog", &mms->watchdog,
                             TYPE_CMSDK_APB_WATCHDOG);
-    qdev_prop_set_uint32(DEVICE(&mms->watchdog), "wdogclk-frq", SYSCLK_FRQ);
     qdev_connect_clock_in(DEVICE(&mms->watchdog), "WDOGCLK", mms->sysclk);
     sysbus_realize(SYS_BUS_DEVICE(&mms->watchdog), &error_fatal);
     sysbus_connect_irq(SYS_BUS_DEVICE(&mms->watchdog), 0,
diff --git a/hw/arm/musca.c b/hw/arm/musca.c
index a9292482a06..945643c3cd7 100644
--- a/hw/arm/musca.c
+++ b/hw/arm/musca.c
@@ -385,7 +385,6 @@ static void musca_init(MachineState *machine)
     qdev_prop_set_uint32(ssedev, "EXP_NUMIRQ", mmc->num_irqs);
     qdev_prop_set_uint32(ssedev, "init-svtor", mmc->init_svtor);
     qdev_prop_set_uint32(ssedev, "SRAM_ADDR_WIDTH", mmc->sram_addr_width);
-    qdev_prop_set_uint32(ssedev, "MAINCLK_FRQ", SYSCLK_FRQ);
     qdev_connect_clock_in(ssedev, "MAINCLK", mms->sysclk);
     qdev_connect_clock_in(ssedev, "S32KCLK", mms->s32kclk);
     /*
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 9b67c739ef2..5acb043a07e 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -1415,9 +1415,6 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     if (board->dc1 & (1 << 3)) { /* watchdog present */
         dev = qdev_new(TYPE_LUMINARY_WATCHDOG);
 
-        /* system_clock_scale is valid now */
-        uint32_t mainclk = NANOSECONDS_PER_SECOND / system_clock_scale;
-        qdev_prop_set_uint32(dev, "wdogclk-frq", mainclk);
         qdev_connect_clock_in(dev, "WDOGCLK",
                               qdev_get_clock_out(ssys_dev, "SYSCLK"));
 
-- 
2.20.1


