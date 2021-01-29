Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 920A9308833
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 12:22:53 +0100 (CET)
Received: from localhost ([::1]:43216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5RrY-0007fv-Jc
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 06:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RWI-0004wY-8I
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:54 -0500
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:52197)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l5RW9-00076d-F0
 for qemu-devel@nongnu.org; Fri, 29 Jan 2021 06:00:53 -0500
Received: by mail-wm1-x330.google.com with SMTP id m2so6511136wmm.1
 for <qemu-devel@nongnu.org>; Fri, 29 Jan 2021 03:00:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=jPNInFcZRqUL6RSZboTJeMy6Ihc+QO3ISy9yB391PuA=;
 b=E6GFJtVXdXwkv6ccoPUo7ZcYAmFL5R22lVa4y3QdHd5p+7rUtu1YH9/fLaLNU2dnKL
 pvAuUtOHi2/OThdu2qwR4HnERsmVEJlxDC/VH8a+k0R0WAInafQHdP1yohHa2z+4g8ew
 /xBN+5d3apL1VtsGy126OvS32Sapd/Oj/UuV9i78E5NAqRCcTRc1GZ7kVzqCBXfp1+8B
 DUiQRJYH4J7W0eaVRDAJ8Ujdix7aj8t+SUvSohKB6m8uLrjPSZycpHfZr09s+AtadW2w
 ACF/t9hCAUf5xhOPKLKei+lxhqF6CBKKmqGTl6bSGcJAAaa4J4txOmccoVZOm8P9kW2+
 lYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jPNInFcZRqUL6RSZboTJeMy6Ihc+QO3ISy9yB391PuA=;
 b=VRHR4+V092NJtMHVOXFjDAv21ne1fm6OxHXW9WSjtifEhPkO/zMn4t/GwyGwnwt6i6
 472d0a+NsV0Vd3DgRVLD6M2efjwXp9xGDc643oZBR39vU8H+Q3pN8cwYojwNVfJKFPXu
 yBfqHna4mnVh6CwVhGWwB0HZVvGLS/xgscS00jmp4OAqvLaPWfIqscCdDr2sB0xcUEbL
 gMD2Sg1RWCm4NIGFImQkrVIp+GgNs3S4XXBnaaYY8hRoeP0UtGbVdil2E+CV6WEvqWYx
 nIjyvxAt0mPIVFApwOKm8QUxJsiCpRj++KnJe0t0QF+GBHaKSJOVU0AWvcnf2T0W0Q3Q
 XkqQ==
X-Gm-Message-State: AOAM531Un74xKN8Hm7ADLcFq7MD3kDDjPdZWVBDz3VLMgE/SvabY+Rha
 oGg2JF70OSmikki9q32gjTVzZlC8VXF2JA==
X-Google-Smtp-Source: ABdhPJx/I3QASKS+jn6hWjWnNrNFQZcA/kZdEY/MPnwPjHLKFAtopsT73EJCPP6T7y8uGvdF14VtvA==
X-Received: by 2002:a1c:730f:: with SMTP id d15mr3210423wmb.135.1611918043930; 
 Fri, 29 Jan 2021 03:00:43 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id w20sm9268761wmm.12.2021.01.29.03.00.43
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Jan 2021 03:00:43 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 32/46] hw/arm/armsse: Wire up clocks
Date: Fri, 29 Jan 2021 10:59:58 +0000
Message-Id: <20210129110012.8660-33-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210129110012.8660-1-peter.maydell@linaro.org>
References: <20210129110012.8660-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::330;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x330.google.com
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

Create two input clocks on the ARMSSE devices, one for the normal
MAINCLK, and one for the 32KHz S32KCLK, and wire these up to the
appropriate devices.  The old property-based clock frequency setting
will remain in place until conversion is complete.

This is a migration compatibility break for machines mps2-an505,
mps2-an521, musca-a, musca-b1.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Tested-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-id: 20210128114145.20536-12-peter.maydell@linaro.org
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


