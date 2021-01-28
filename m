Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A551E307519
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 12:48:24 +0100 (CET)
Received: from localhost ([::1]:48662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l55mh-0000WB-Mo
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 06:48:23 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33772)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gc-0001RC-RU
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:06 -0500
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f]:38288)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gW-00068w-9X
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:06 -0500
Received: by mail-wm1-x32f.google.com with SMTP id y187so4304714wmd.3
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:41:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Y2K1kNTbNOMvi2EpXTLd2ToPKEqAh/Wj79aMwJhopKA=;
 b=JIRT16NxMAt4jGsxudcY7nyUYMc7HdDT7Q62QSd21ojMk9pOd3VdjogA0Bfwddkrxt
 HOajJg++U+vgKEJejBe1Nub9Xf891Dx5c7HPfNPSpARM7nw2KrrTvnaOwI2Ck5sJz3uf
 2MfB56EEp7a5RrepckUYmZcupE0EkyuD9PNvqOAL5BTqsjxy3zs5hFM2pIM2px3YQGjv
 3x3EAPGV5aBS4Z5NxZm84WwmsNfMOA4U/ZdrUI/TpY1tqQ4dBRaRi28SUttMaPfYYTug
 DtRCtSABPS86wjglSopxQA9A+ygw1+buOOXQzKfHChTRJc6t0XIvaFf7iAaIpeU89ea7
 lHIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Y2K1kNTbNOMvi2EpXTLd2ToPKEqAh/Wj79aMwJhopKA=;
 b=H45WpsTaWqBRLPiBx9YGmTKMFIIwbeg9ui7lBz15jYkdSbpH59+2sAf1vRcZFDLh3q
 2GW1hbQmavpfn9CM5VqUNgTpY54VCJ9wqGiwvOgAA126o96+s+yyKYsSkZXyoFqlsVJE
 z//wTzKEAWhIBuPqxQrtj5mGx2O1XWXhbnJGlVPCE2CO7dcgiU8at5VlyRkXvyjGjFGh
 CdXvyXQkLI8+rsPn2aYH5cHFsZdwUO99MS72CrSjPuD6N8Ac5TKVWQFSTO09qmiqQsSt
 5NYUy8drVnMC/Whkmpze6nowsfNdiXB0QZCP59LAnTlG7BBrp2uoURGfW+n2Z24VV3kT
 LAJg==
X-Gm-Message-State: AOAM531jEgzS+fMXkqg8kwD400MzSAIaFgyWPFb8O3U51JIpKFXC2TOR
 f2DxSxbqMHJsQXKbYk5kT7hXbg==
X-Google-Smtp-Source: ABdhPJwZnFECUz1kYZpnn0kXBg33+nbhBxPQKXwu/gMKWDAkeLm35/td7OQ9snPlZo5OzIzPvr/6zw==
X-Received: by 2002:a1c:df04:: with SMTP id w4mr8085586wmg.66.1611834118959;
 Thu, 28 Jan 2021 03:41:58 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:41:58 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 11/25] hw/arm/armsse: Wire up clocks
Date: Thu, 28 Jan 2021 11:41:31 +0000
Message-Id: <20210128114145.20536-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
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
Cc: Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Create two input clocks on the ARMSSE devices, one for the normal
MAINCLK, and one for the 32KHz S32KCLK, and wire these up to the
appropriate devices.  The old property-based clock frequency setting
will remain in place until conversion is complete.

This is a migration compatibility break for machines mps2-an505,
mps2-an521, musca-a, musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-12-peter.maydell@linaro.org
---
 include/hw/arm/armsse.h |  6 ++++++
 hw/arm/armsse.c         | 17 +++++++++++++++--
 2 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/include/hw/arm/armsse.h b/include/hw/arm/armsse.h
index 4860a793f4b..bfa1e79c4fe 100644
--- a/include/hw/arm/armsse.h
+++ b/include/hw/arm/armsse.h
@@ -37,6 +37,8 @@
  *  per-CPU identity and control register blocks
  *
  * QEMU interface:
+ *  + Clock input "MAINCLK": clock for CPUs and most peripherals
+ *  + Clock input "S32KCLK": slow 32KHz clock used for a few peripherals
  *  + QOM property "memory" is a MemoryRegion containing the devices provided
  *    by the board model.
  *  + QOM property "MAINCLK_FRQ" is the frequency of the main system clock
@@ -103,6 +105,7 @@
 #include "hw/misc/armsse-mhu.h"
 #include "hw/misc/unimp.h"
 #include "hw/or-irq.h"
+#include "hw/clock.h"
 #include "hw/core/split-irq.h"
 #include "hw/cpu/cluster.h"
 #include "qom/object.h"
@@ -209,6 +212,9 @@ struct ARMSSE {
 
     uint32_t nsccfg;
 
+    Clock *mainclk;
+    Clock *s32kclk;
+
     /* Properties */
     MemoryRegion *board_memory;
     uint32_t exp_numirq;
diff --git a/hw/arm/armsse.c b/hw/arm/armsse.c
index d2ba0459c44..4349ce9bfdb 100644
--- a/hw/arm/armsse.c
+++ b/hw/arm/armsse.c
@@ -21,6 +21,7 @@
 #include "hw/arm/armsse.h"
 #include "hw/arm/boot.h"
 #include "hw/irq.h"
+#include "hw/qdev-clock.h"
 
 /* Format of the System Information block SYS_CONFIG register */
 typedef enum SysConfigFormat {
@@ -241,6 +242,9 @@ static void armsse_init(Object *obj)
     assert(info->sram_banks <= MAX_SRAM_BANKS);
     assert(info->num_cpus <= SSE_MAX_CPUS);
 
+    s->mainclk = qdev_init_clock_in(DEVICE(s), "MAINCLK", NULL, NULL);
+    s->s32kclk = qdev_init_clock_in(DEVICE(s), "S32KCLK", NULL, NULL);
+
     memory_region_init(&s->container, obj, "armsse-container", UINT64_MAX);
 
     for (i = 0; i < info->num_cpus; i++) {
@@ -711,6 +715,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      * map its upstream ends to the right place in the container.
      */
     qdev_prop_set_uint32(DEVICE(&s->timer0), "pclk-frq", s->mainclk_frq);
+    qdev_connect_clock_in(DEVICE(&s->timer0), "pclk", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer0), errp)) {
         return;
     }
@@ -721,6 +726,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                              &error_abort);
 
     qdev_prop_set_uint32(DEVICE(&s->timer1), "pclk-frq", s->mainclk_frq);
+    qdev_connect_clock_in(DEVICE(&s->timer1), "pclk", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->timer1), errp)) {
         return;
     }
@@ -731,6 +737,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                              &error_abort);
 
     qdev_prop_set_uint32(DEVICE(&s->dualtimer), "pclk-frq", s->mainclk_frq);
+    qdev_connect_clock_in(DEVICE(&s->dualtimer), "TIMCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dualtimer), errp)) {
         return;
     }
@@ -889,6 +896,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
      *   0x4002f000: S32K timer
      */
     qdev_prop_set_uint32(DEVICE(&s->s32ktimer), "pclk-frq", S32KCLK);
+    qdev_connect_clock_in(DEVICE(&s->s32ktimer), "pclk", s->s32kclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32ktimer), errp)) {
         return;
     }
@@ -982,6 +990,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
                           qdev_get_gpio_in_named(DEVICE(&s->armv7m), "NMI", 0));
 
     qdev_prop_set_uint32(DEVICE(&s->s32kwatchdog), "wdogclk-frq", S32KCLK);
+    qdev_connect_clock_in(DEVICE(&s->s32kwatchdog), "WDOGCLK", s->s32kclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->s32kwatchdog), errp)) {
         return;
     }
@@ -992,6 +1001,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     /* 0x40080000 .. 0x4008ffff : ARMSSE second Base peripheral region */
 
     qdev_prop_set_uint32(DEVICE(&s->nswatchdog), "wdogclk-frq", s->mainclk_frq);
+    qdev_connect_clock_in(DEVICE(&s->nswatchdog), "WDOGCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->nswatchdog), errp)) {
         return;
     }
@@ -1000,6 +1010,7 @@ static void armsse_realize(DeviceState *dev, Error **errp)
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->nswatchdog), 0, 0x40081000);
 
     qdev_prop_set_uint32(DEVICE(&s->swatchdog), "wdogclk-frq", s->mainclk_frq);
+    qdev_connect_clock_in(DEVICE(&s->swatchdog), "WDOGCLK", s->mainclk);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->swatchdog), errp)) {
         return;
     }
@@ -1127,9 +1138,11 @@ static void armsse_idau_check(IDAUInterface *ii, uint32_t address,
 
 static const VMStateDescription armsse_vmstate = {
     .name = "iotkit",
-    .version_id = 1,
-    .minimum_version_id = 1,
+    .version_id = 2,
+    .minimum_version_id = 2,
     .fields = (VMStateField[]) {
+        VMSTATE_CLOCK(mainclk, ARMSSE),
+        VMSTATE_CLOCK(s32kclk, ARMSSE),
         VMSTATE_UINT32(nsccfg, ARMSSE),
         VMSTATE_END_OF_LIST()
     }
-- 
2.20.1


