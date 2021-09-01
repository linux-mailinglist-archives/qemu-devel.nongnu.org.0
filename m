Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C39F53FD8A2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:24:26 +0200 (CEST)
Received: from localhost ([::1]:40032 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOLx-0006EB-OB
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:24:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43754)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcc-0007E6-8Y
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:45960)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcR-0005wx-Nl
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so1570586wms.4
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=grFRI+D7JkW2E8rV8tw+47QyhO8xc+d2mM/hwxYtrCo=;
 b=p08btrUlFFUsNsjc7O9O/IrtvFxq1sKK3d07ZMeXlTyGitJNcOCEIziWLxNSbmgzyX
 eXZKC+W+sgv0oBeSBR7sZKchLjsGrPazlfJhpJdKQU/GFwo1Wojz6TQ9sA94BEJITJh+
 6pH6LaRALfLGEoXhSEOKFxXujXzqcQZs94z0bwX0SzuffyY+6NyreGQkg9qB4oyNIcQA
 LBznKDm7jMOzsV4NFyiIyyuaWqcDSmrzGyIKVe2LOvfPgJFHX1O0LJVA5EwUwaIG8XI9
 0AJU5Mp5wsaPrDdmETjvhPpnqOsXsbUv8hSRv6iIuTYogMNSujE0ciX7bd8r9b0E8e67
 wrTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=grFRI+D7JkW2E8rV8tw+47QyhO8xc+d2mM/hwxYtrCo=;
 b=ox/g5z7tPKFKHvXU5se4Iy/D3rel8XL/ev6VTUyXFBmsWYsXqzHrj0Mefy9dyaZR9J
 EZApu59iMY54yEyo89uPt+y+DYOplJubfnEjnCwzBQAgV71bjx61JN4G9mx7chq/mTgn
 9UPm0r7r+AJ+nN3Jy4aNOwiDpN38PzqlQSFnifYMWBcWcKewkNk3a4qtfGym4tmHQTve
 Wv8X0tBZoEZUiNz5NKUTweHNX/L8d+Opf/Ve4QJsD3VGQdJ+fMbTcunbYIJ60F6qDRK0
 3fPVklf+8nS3ZbRPKgLEBI/BDESlGV7cqasRR8Qo0QlaTnvPkxL1TTkA+1nQoiU1NJsl
 yi4Q==
X-Gm-Message-State: AOAM530lWV8E2joLSl3VLd/py9b0u3nfAYV/vm6u/gxQrYCoLWVZO7U6
 RuvU+wSiLxyAn+hOKgaQyMBfii/LfyaP2Q==
X-Google-Smtp-Source: ABdhPJwqS4oHEHjuLCJIN025QAYWcLP23qbUkecy4bNCKDxAxejiBZHInkct6c4Hj6ybwaIcsqqckQ==
X-Received: by 2002:a1c:a5c2:: with SMTP id o185mr9068005wme.34.1630492641327; 
 Wed, 01 Sep 2021 03:37:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:21 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 38/51] hw/arm/stm32f205: Wire up sysclk and refclk
Date: Wed,  1 Sep 2021 11:36:40 +0100
Message-Id: <20210901103653.13435-39-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32e.google.com
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

Wire up the sysclk and refclk for the stm32f205 SoC.  This SoC always
runs the systick refclk at 1/8 the frequency of the main CPU clock,
so the board code only needs to provide a single sysclk clock.

Because there is only one board using this SoC, we convert the SoC
and the board together, rather than splitting it into "add clock to
SoC; connect clock in board; add error check in SoC code that clock
is wired up".

When the systick device starts honouring its clock inputs, this will
fix an emulation inaccuracy in the netduino2 board where the systick
reference clock was running at 1MHz rather than 15MHz.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-13-peter.maydell@linaro.org
---
 include/hw/arm/stm32f205_soc.h |  4 ++++
 hw/arm/netduino2.c             | 12 +++++++-----
 hw/arm/stm32f205_soc.c         | 30 ++++++++++++++++++++++++++++++
 3 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 75251494917..849d3ed8891 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -32,6 +32,7 @@
 #include "hw/or-irq.h"
 #include "hw/ssi/stm32f2xx_spi.h"
 #include "hw/arm/armv7m.h"
+#include "hw/clock.h"
 #include "qom/object.h"
 
 #define TYPE_STM32F205_SOC "stm32f205-soc"
@@ -67,6 +68,9 @@ struct STM32F205State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
+
+    Clock *sysclk;
+    Clock *refclk;
 };
 
 #endif
diff --git a/hw/arm/netduino2.c b/hw/arm/netduino2.c
index 1733b71507c..b5c0ba23ee5 100644
--- a/hw/arm/netduino2.c
+++ b/hw/arm/netduino2.c
@@ -26,6 +26,7 @@
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/arm/boot.h"
@@ -36,16 +37,17 @@
 static void netduino2_init(MachineState *machine)
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
     dev = qdev_new(TYPE_STM32F205_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 0bd215aebd7..c6b75a381d9 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -29,6 +29,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/stm32f205_soc.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "sysemu/sysemu.h"
 
 /* At the moment only Timer 2 to 5 are modelled */
@@ -74,6 +75,9 @@ static void stm32f205_soc_initfn(Object *obj)
     for (i = 0; i < STM_NUM_SPIS; i++) {
         object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
     }
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
 
 static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -85,6 +89,30 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
 
     MemoryRegion *system_memory = get_system_memory();
 
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
     memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
                            FLASH_SIZE, &error_fatal);
     memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
@@ -101,6 +129,8 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
-- 
2.20.1


