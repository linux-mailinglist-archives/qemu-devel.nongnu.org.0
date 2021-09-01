Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BE0763FD830
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 12:53:07 +0200 (CEST)
Received: from localhost ([::1]:57048 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLNre-0000s3-Qv
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 06:53:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcY-0007Ck-RY
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:31 -0400
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e]:34689)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcR-0005xG-OD
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:28 -0400
Received: by mail-wr1-x42e.google.com with SMTP id m9so3796135wrb.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=xim/VTGiMpFpK7yoj6VQGZClgrcpeiHaCqqogETdERo=;
 b=HKPdV4Y1CE4S5AdZxPf0rSu5tWkCBkYmpBq3+yFVOgTVwcpWfz+YJZwRClkyyOEMJw
 4Vyje26kj5ezLkWKQ874gOtpCBwgtf4/fXA91YGVktpWuQSTTgRNv2WhaOmUGeAhzkZi
 2CJGf9lodOkyaPT8p34+Grul9KKqJxl6B0hO3ek9AsGQ3A/geUdtqk9vVH8VHmHJP5m1
 wqfKRyIGfJx5xWDwkN8+KV/BpuwHftF3WmVe6iwpeVPWd+FJoDdmA/nYIW1+crg5nL+Q
 flAL9K42/c6O8tbcl3gLUlKFTiqiCDdiNgdEjUug+8/UsXnaa0J9cFr67FomIfmFIEK5
 5GbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xim/VTGiMpFpK7yoj6VQGZClgrcpeiHaCqqogETdERo=;
 b=hzfdaGZm/9/2/tpwYJttYhYa2OJposGv+UpBEXhSh4MiTIw9vqf9E2mUBz+HzuPJ8y
 cELZNjURB3lfdCdYXUweHq+vi7AZGmYshqqiHsukNHC591nJvBvP1Q17zXWMoWGCREXQ
 kP8PVzWvVo4OowLPwWsxsvS98K4DxV8rJl//z7Qp3irSpc2Pa4MOBHyoDbe1no8rK9O4
 xK+RwMO9pMcUv1oeurDwnYKp4T15MTorr7naDjLNlUvG53P/pceQ1ljS6qqrrWemuD50
 uAfsvD3jOF/rDWZNh6FXr7bYCczoV5RqruGUlDs+uwl2s05IA1Jyj1W2I2uwo/tdQ1jV
 +/Lg==
X-Gm-Message-State: AOAM531WnCI9AAL+P0Q+iZqF0Bo7ZkYWuYbpkhjoSACv0+Xmr46hXwX6
 nZuJfBe1xQtWG1BDspB5DYVxw9yDxt76Uw==
X-Google-Smtp-Source: ABdhPJzIUyusag5kKRWjAW9yM613x1jfVH759UJ3JBTF9xUGE09LVsu8uLaBrS/UW53JCNmMVFQTzw==
X-Received: by 2002:a5d:5452:: with SMTP id w18mr36533629wrv.221.1630492641911; 
 Wed, 01 Sep 2021 03:37:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.21
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/51] hw/arm/stm32f405: Wire up sysclk and refclk
Date: Wed,  1 Sep 2021 11:36:41 +0100
Message-Id: <20210901103653.13435-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
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

Wire up the sysclk and refclk for the stm32f405 SoC.  This SoC always
runs the systick refclk at 1/8 the frequency of the main CPU clock,
so the board code only needs to provide a single sysclk clock.

Because there is only one board using this SoC, we convert the SoC
and the board together, rather than splitting it into "add clock to
SoC; connect clock in board; add error check in SoC code that clock
is wired up".

When the systick device starts honouring its clock inputs, this will
fix an emulation inaccuracy in the netduinoplus2 board where the
systick reference clock was running at 1MHz rather than 21MHz.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-14-peter.maydell@linaro.org
---
 include/hw/arm/stm32f405_soc.h |  3 +++
 hw/arm/netduinoplus2.c         | 12 +++++++-----
 hw/arm/stm32f405_soc.c         | 30 ++++++++++++++++++++++++++++++
 3 files changed, 40 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 347105e709b..5bb0c8d5697 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -68,6 +68,9 @@ struct STM32F405State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
+
+    Clock *sysclk;
+    Clock *refclk;
 };
 
 #endif
diff --git a/hw/arm/netduinoplus2.c b/hw/arm/netduinoplus2.c
index d3ad7a2b675..a5a8999cc8c 100644
--- a/hw/arm/netduinoplus2.c
+++ b/hw/arm/netduinoplus2.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32f405_soc.h"
 #include "hw/arm/boot.h"
@@ -36,16 +37,17 @@
 static void netduinoplus2_init(MachineState *machine)
 {
     DeviceState *dev;
+    Clock *sysclk;
 
-    /*
-     * TODO: ideally we would model the SoC RCC and let it handle
-     * system_clock_scale, including its ability to define different
-     * possible SYSCLK sources.
-     */
     system_clock_scale = NANOSECONDS_PER_SECOND / SYSCLK_FRQ;
 
+    /* This clock doesn't need migration because it is fixed-frequency */
+    sysclk = clock_new(OBJECT(machine), "SYSCLK");
+    clock_set_hz(sysclk, SYSCLK_FRQ);
+
     dev = qdev_new(TYPE_STM32F405_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m4"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index cb04c111987..0019b7f4785 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -28,6 +28,7 @@
 #include "exec/address-spaces.h"
 #include "sysemu/sysemu.h"
 #include "hw/arm/stm32f405_soc.h"
+#include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
 
 #define SYSCFG_ADD                     0x40013800
@@ -80,6 +81,9 @@ static void stm32f405_soc_initfn(Object *obj)
     }
 
     object_initialize_child(obj, "exti", &s->exti, TYPE_STM32F4XX_EXTI);
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
 
 static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -91,6 +95,30 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     Error *err = NULL;
     int i;
 
+    /*
+     * We use s->refclk internally and only define it with qdev_init_clock_in()
+     * so it is correctly parented and not leaked on an init/deinit; it is not
+     * intended as an externally exposed clock.
+     */
+    if (clock_has_source(s->refclk)) {
+        error_setg(errp, "refclk clock must not be wired up by the board code");
+        return;
+    }
+
+    if (!clock_has_source(s->sysclk)) {
+        error_setg(errp, "sysclk clock must be wired up by the board code");
+        return;
+    }
+
+    /*
+     * TODO: ideally we should model the SoC RCC and its ability to
+     * change the sysclk frequency and define different sysclk sources.
+     */
+
+    /* The refclk always runs at frequency HCLK / 8 */
+    clock_set_mul_div(s->refclk, 8, 1);
+    clock_set_source(s->refclk, s->sysclk);
+
     memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F405.flash",
                            FLASH_SIZE, &err);
     if (err != NULL) {
@@ -116,6 +144,8 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(system_memory), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
-- 
2.20.1


