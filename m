Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B1D5E307561
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 13:04:35 +0100 (CET)
Received: from localhost ([::1]:34552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l562M-0001qf-Qh
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 07:04:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:33996)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55go-0001by-0T
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:18 -0500
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f]:33199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1l55gc-0006Bi-61
 for qemu-devel@nongnu.org; Thu, 28 Jan 2021 06:42:17 -0500
Received: by mail-wr1-x42f.google.com with SMTP id 7so5083267wrz.0
 for <qemu-devel@nongnu.org>; Thu, 28 Jan 2021 03:42:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Nifpo3xw4kmKoRcteNDK5FWNa7gwn40E7uhxQ3t57k8=;
 b=DEigW+LNQIRdeoxucN046sw1VoXfBRM18pNoo8A6+BHBR9TUK5qeF4dlxRWWzjEr7H
 80y6KtnhiYPa0VXTBE3brhlyA6Mz41OerMSKnbP4viPb8ag18pJprkYqaTFtzhUA50tT
 4yHB4CnwTurld1flzO8A+KASgq1gbsAn/hD46StFPyhcd3eHsnPrWSIqq4HCzMQ8dnS/
 SczOZfcvG5EdUfVv7PSYi7NK1JRSEHxD313FvBh3yxfEbv7gFUeeb0khhseuYCrAvyd8
 9QotK1BHOwTp7hUluDw2BVgledfJHFZe8FuYWCLw8BhHn1FvGpprJhG2/PGMWU4CyOE0
 ws9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Nifpo3xw4kmKoRcteNDK5FWNa7gwn40E7uhxQ3t57k8=;
 b=lgTkOmFF/Orn86MGW+J1y0fZvNryt/kk9ER/Wb8IuDMUIvjrk3wFhYtSdozP7DsIgD
 60Z/hUBkTJwI9RHFfLuYbLrRWnYJeuU0wbAZ445c60Has4lltTvOwp6emflOiBuhWFcW
 9rfZ6e3a2fI2J37EH6IoA7TqA0J17tO4Ntzqr029nMRXu5lFGmW7Nr9rXToGmKo88V+6
 FIdxptTr2X75cIs89xTG1Wr48obvjBxUV8lT4PuXy61Vz5h2JwzLs5FAfgIpRZssWcdL
 7o+MVmRYM1CkPnsfPIJbLkTVutH7QaSlhyoi4AYd9sYrs1CXXCGFZklS/OiIp2AXFnRq
 YJ1Q==
X-Gm-Message-State: AOAM530fvF/96zfeBEGjVq5+oxE6iDR361lTaqe7w/AB5Xqo9TpoNoxD
 a2kdgmy9319ZDnjPQFKl/BaBNQ==
X-Google-Smtp-Source: ABdhPJzkyTfPAsYlxliSe0yoD7OwC7tGzsvgQaRhbOudnvr9zFibTPWHPqPfdK6lD8w/NHDnSc/4gA==
X-Received: by 2002:adf:c6c1:: with SMTP id c1mr6580310wrh.326.1611834124537; 
 Thu, 28 Jan 2021 03:42:04 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q9sm6431033wme.18.2021.01.28.03.42.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Jan 2021 03:42:04 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 17/25] hw/arm/stellaris: Create Clock input for watchdog
Date: Thu, 28 Jan 2021 11:41:37 +0000
Message-Id: <20210128114145.20536-18-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210128114145.20536-1-peter.maydell@linaro.org>
References: <20210128114145.20536-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
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

Create and connect the Clock input for the watchdog device on the
Stellaris boards.  Because the Stellaris boards model the ability to
change the clock rate by programming PLL registers, we have to create
an output Clock on the ssys_state device and wire it up to the
watchdog.

Note that the old comment on ssys_calculate_system_clock() got the
units wrong -- system_clock_scale is in nanoseconds, not
milliseconds.  Improve the commentary to clarify how we are
calculating the period.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210121190622.22000-18-peter.maydell@linaro.org
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/stellaris.c | 43 +++++++++++++++++++++++++++++++------------
 1 file changed, 31 insertions(+), 12 deletions(-)

diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index 0194ede2fe0..9b67c739ef2 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -26,6 +26,7 @@
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "migration/vmstate.h"
 #include "hw/misc/unimp.h"
+#include "hw/qdev-clock.h"
 #include "cpu.h"
 #include "qom/object.h"
 
@@ -377,6 +378,7 @@ struct ssys_state {
     uint32_t clkvclr;
     uint32_t ldoarst;
     qemu_irq irq;
+    Clock *sysclk;
     /* Properties (all read-only registers) */
     uint32_t user0;
     uint32_t user1;
@@ -555,15 +557,26 @@ static bool ssys_use_rcc2(ssys_state *s)
 }
 
 /*
- * Caculate the sys. clock period in ms.
+ * Calculate the system clock period. We only want to propagate
+ * this change to the rest of the system if we're not being called
+ * from migration post-load.
  */
-static void ssys_calculate_system_clock(ssys_state *s)
+static void ssys_calculate_system_clock(ssys_state *s, bool propagate_clock)
 {
+    /*
+     * SYSDIV field specifies divisor: 0 == /1, 1 == /2, etc.  Input
+     * clock is 200MHz, which is a period of 5 ns. Dividing the clock
+     * frequency by X is the same as multiplying the period by X.
+     */
     if (ssys_use_rcc2(s)) {
         system_clock_scale = 5 * (((s->rcc2 >> 23) & 0x3f) + 1);
     } else {
         system_clock_scale = 5 * (((s->rcc >> 23) & 0xf) + 1);
     }
+    clock_set_ns(s->sysclk, system_clock_scale);
+    if (propagate_clock) {
+        clock_propagate(s->sysclk);
+    }
 }
 
 static void ssys_write(void *opaque, hwaddr offset,
@@ -598,7 +611,7 @@ static void ssys_write(void *opaque, hwaddr offset,
             s->int_status |= (1 << 6);
         }
         s->rcc = value;
-        ssys_calculate_system_clock(s);
+        ssys_calculate_system_clock(s, true);
         break;
     case 0x070: /* RCC2 */
         if (ssys_board_class(s) == DID0_CLASS_SANDSTORM) {
@@ -610,7 +623,7 @@ static void ssys_write(void *opaque, hwaddr offset,
             s->int_status |= (1 << 6);
         }
         s->rcc2 = value;
-        ssys_calculate_system_clock(s);
+        ssys_calculate_system_clock(s, true);
         break;
     case 0x100: /* RCGC0 */
         s->rcgc[0] = value;
@@ -679,7 +692,8 @@ static void stellaris_sys_reset_hold(Object *obj)
 {
     ssys_state *s = STELLARIS_SYS(obj);
 
-    ssys_calculate_system_clock(s);
+    /* OK to propagate clocks from the hold phase */
+    ssys_calculate_system_clock(s, true);
 }
 
 static void stellaris_sys_reset_exit(Object *obj)
@@ -690,7 +704,7 @@ static int stellaris_sys_post_load(void *opaque, int version_id)
 {
     ssys_state *s = opaque;
 
-    ssys_calculate_system_clock(s);
+    ssys_calculate_system_clock(s, false);
 
     return 0;
 }
@@ -713,6 +727,7 @@ static const VMStateDescription vmstate_stellaris_sys = {
         VMSTATE_UINT32_ARRAY(dcgc, ssys_state, 3),
         VMSTATE_UINT32(clkvclr, ssys_state),
         VMSTATE_UINT32(ldoarst, ssys_state),
+        /* No field for sysclk -- handled in post-load instead */
         VMSTATE_END_OF_LIST()
     }
 };
@@ -738,11 +753,12 @@ static void stellaris_sys_instance_init(Object *obj)
     memory_region_init_io(&s->iomem, obj, &ssys_ops, s, "ssys", 0x00001000);
     sysbus_init_mmio(sbd, &s->iomem);
     sysbus_init_irq(sbd, &s->irq);
+    s->sysclk = qdev_init_clock_out(DEVICE(s), "SYSCLK");
 }
 
-static int stellaris_sys_init(uint32_t base, qemu_irq irq,
-                              stellaris_board_info * board,
-                              uint8_t *macaddr)
+static DeviceState *stellaris_sys_init(uint32_t base, qemu_irq irq,
+                                       stellaris_board_info *board,
+                                       uint8_t *macaddr)
 {
     DeviceState *dev = qdev_new(TYPE_STELLARIS_SYS);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
@@ -774,7 +790,7 @@ static int stellaris_sys_init(uint32_t base, qemu_irq irq,
      */
     device_cold_reset(dev);
 
-    return 0;
+    return dev;
 }
 
 /* I2C controller.  */
@@ -1341,6 +1357,7 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
     int flash_size;
     I2CBus *i2c;
     DeviceState *dev;
+    DeviceState *ssys_dev;
     int i;
     int j;
 
@@ -1391,8 +1408,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         }
     }
 
-    stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
-                       board, nd_table[0].macaddr.a);
+    ssys_dev = stellaris_sys_init(0x400fe000, qdev_get_gpio_in(nvic, 28),
+                                  board, nd_table[0].macaddr.a);
 
 
     if (board->dc1 & (1 << 3)) { /* watchdog present */
@@ -1401,6 +1418,8 @@ static void stellaris_init(MachineState *ms, stellaris_board_info *board)
         /* system_clock_scale is valid now */
         uint32_t mainclk = NANOSECONDS_PER_SECOND / system_clock_scale;
         qdev_prop_set_uint32(dev, "wdogclk-frq", mainclk);
+        qdev_connect_clock_in(dev, "WDOGCLK",
+                              qdev_get_clock_out(ssys_dev, "SYSCLK"));
 
         sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
         sysbus_mmio_map(SYS_BUS_DEVICE(dev),
-- 
2.20.1


