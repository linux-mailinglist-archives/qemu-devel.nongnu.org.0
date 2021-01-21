Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEEEB2FF413
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Jan 2021 20:17:29 +0100 (CET)
Received: from localhost ([::1]:47696 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l2fSS-0002cT-Rx
	for lists+qemu-devel@lfdr.de; Thu, 21 Jan 2021 14:17:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55660)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fIB-0002H6-1N
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:52 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:36708)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l2fHz-0005pM-Gg
 for qemu-devel@nongnu.org; Thu, 21 Jan 2021 14:06:49 -0500
Received: by mail-wr1-x430.google.com with SMTP id 6so2824931wri.3
 for <qemu-devel@nongnu.org>; Thu, 21 Jan 2021 11:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NEZ5U7Po5BeujzVL1PMxzLMD8dogU0kUTKX4d32S7Mw=;
 b=yae5CO8Pdpe1iCQd1WZYhi23ZllqMFL4g+A/13mTrfun9hlfzhyBy9VEID5WM+0bch
 z5dZrEquwThQ8AMai651EEcttcY8H5VpXgGklpP/Xm+Y8hEL2b6LYnhHruluNcGbjp0o
 0Bzc5efxuTDU3gjZzlNDXBD5JMfwUl0ZkWKLhUqPxCdfDkyzp986+1B8EPupdOIW6HSd
 85ack7jonZnobQ0reN+jFjzZubW7ZZbZ+oyKJIechoCaFfC5dO2pz0u9NszdGutg63dx
 uHSThFO+kPVbt6B9KbXE+x31/QFC1sCo1rhvFSTKK0bq7MhHtmuxgcTaHM+nS4uENQ5g
 riNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NEZ5U7Po5BeujzVL1PMxzLMD8dogU0kUTKX4d32S7Mw=;
 b=bpaGJ57aFSryszjHAKvg22sCGQy8nkrh/p+akdPqEbxYM67H8tzopebW9vTY16HIvk
 2WrgIXJ0TRtpM0b8l1TL2gxtOIMJvy99lqQ5vHkBXhvqfjdw11k8CatNXHMF83nLagZZ
 QdbwrOCeXrVWS6V+aFBo5jQF3begIvLLiJOQ+xENftkevVrxKh40TOjO3LPX8SS1oIsc
 KcDeUykoSSQsET1Aq4N9Fy0mOVMQCVra/gGS/4qKE26wNDpXUg8q6myJh0z+RHZK2216
 IJp79eTmghxNhUfrrU7uLadZ8XnM4OuVLNJggZ34G0LNkTsecyT29L7BDkrSK3sUCvk4
 xslw==
X-Gm-Message-State: AOAM531QZwqFvzK7lpl5Io4FhNrjYraTAoGykOcammY5lQ10pkmw177m
 +jOoAvQ1Uc6QnskOIxfLKBFFJg==
X-Google-Smtp-Source: ABdhPJzd8zq3H0OQk9JUwXldL1wksWUqcC9tOkplhwB7g4YdGPgUKZYh6Vtl4QkUMQRYQzmB62hAzQ==
X-Received: by 2002:adf:8285:: with SMTP id 5mr847952wrc.289.1611255996081;
 Thu, 21 Jan 2021 11:06:36 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m18sm9820686wrw.43.2021.01.21.11.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 11:06:35 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 11/25] hw/arm/armsse: Wire up clocks
Date: Thu, 21 Jan 2021 19:06:08 +0000
Message-Id: <20210121190622.22000-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210121190622.22000-1-peter.maydell@linaro.org>
References: <20210121190622.22000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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

Create two input clocks on the ARMSSE devices, one for the normal
MAINCLK, and one for the 32KHz S32KCLK, and wire these up to the
appropriate devices.  The old property-based clock frequency setting
will remain in place until conversion is complete.

This is a migration compatibility break for machines mps2-an505,
mps2-an521, musca-a, musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
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


