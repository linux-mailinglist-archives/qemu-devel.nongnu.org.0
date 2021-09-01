Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 70F9B3FD885
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:14:46 +0200 (CEST)
Received: from localhost ([::1]:49244 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOCb-0001Sv-G7
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:14:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43668)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcX-0007Cj-20
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:31 -0400
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432]:43933)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcQ-0005wN-1a
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:28 -0400
Received: by mail-wr1-x432.google.com with SMTP id b6so3705851wrh.10
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZH+7uLQj2dLMKVJSJdfJETvzXmbYV5Lk1vf1xsCoB0Y=;
 b=NbikmXaKk1OWulDOh2pSCrzQEApRQ5JtFeuIOBImKgpnAhiIU+2Vrt/rtRjaCI2KOf
 pTuSctLJ6yc25/qBVG0sMoupEA9S8N3pmisVhgVWrAmqNrYx33tGetEAzYscYSDer1zK
 x4m2187C/ShJ2xcIIcDBv6kxar8qaqaKrsMgQfMI2dyh+BLx0xej2EvSlcxtkCSQu76Q
 xscm22JwPN6ZCncoDlyhLIyhToSCLUtjIZ1Og64VrQbuiN3DrssM/N4yJWLSNk80zwPk
 jRrvDSS42HIUIc5pYFGOcvmmCgsZlp+AjJrhd3jAdTGf+JMKgH4/yrLuPQHN1z2ffTp+
 FUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZH+7uLQj2dLMKVJSJdfJETvzXmbYV5Lk1vf1xsCoB0Y=;
 b=Yc9VN48fw6PJWQDX6Fwm7A/yfiZCOUiSlMnQU2ZGwP37flLi2maEKQdPoaERJiWxwq
 nUBNCIbizVdDNGJhlnt9XTfNKCPsGX6MYbXD/s7TdX27Q6gBPsf9l4HLTocmqeXcA1Ae
 z7mXmqGVyzeaVCcyiRM/ZA6Y5HuNIk8+vXzJDyzBeVsIVTC71M4ptzN1Eu+3lRIhoKvf
 Ohx0IOWTtbXb85HtmMkREE8MlISoeY4OWyqy/RzJQaX3Uxu+IMwKpBxmMDUYAdm3f5x5
 KMdECdmUgKJQ79RnhEBWn/xfKPdHpzLNb22Euiq+ce5oPT1fvZGbsSHZt79tjRCwhkOe
 Xt2g==
X-Gm-Message-State: AOAM530S3jAlbciRAePZLssPn3fuEiZ43r6IPL9qpuXyTJ5LQdYD/NEv
 LlMm85dvyk9XyGY9HgTMP/FpiXV3jmroNg==
X-Google-Smtp-Source: ABdhPJxGhhKfWWAR4JFRy3LDc5ZkexAMYltWhA4zEXcL/1GuetqNHD3EMhUlA9C3wEYgiUYZkcjNPQ==
X-Received: by 2002:adf:cf0b:: with SMTP id o11mr37435847wrj.72.1630492640680; 
 Wed, 01 Sep 2021 03:37:20 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.20
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 37/51] hw/arm/stm32f100: Wire up sysclk and refclk
Date: Wed,  1 Sep 2021 11:36:39 +0100
Message-Id: <20210901103653.13435-38-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x432.google.com
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

Wire up the sysclk and refclk for the stm32f100 SoC.  This SoC always
runs the systick refclk at 1/8 the frequency of the main CPU clock,
so the board code only needs to provide a single sysclk clock.

Because there is only one board using this SoC, we convert the SoC
and the board together, rather than splitting it into "add clock to
SoC; connect clock in board; add error check in SoC code that clock
is wired up".

When the systick device starts honouring its clock inputs, this will
fix an emulation inaccuracy in the stm32vldiscovery board where the
systick reference clock was running at 1MHz rather than 3MHz.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-12-peter.maydell@linaro.org
---
 include/hw/arm/stm32f100_soc.h |  4 ++++
 hw/arm/stm32f100_soc.c         | 30 ++++++++++++++++++++++++++++++
 hw/arm/stm32vldiscovery.c      | 12 +++++++-----
 3 files changed, 41 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
index b7d71c6c634..40cd415b284 100644
--- a/include/hw/arm/stm32f100_soc.h
+++ b/include/hw/arm/stm32f100_soc.h
@@ -29,6 +29,7 @@
 #include "hw/ssi/stm32f2xx_spi.h"
 #include "hw/arm/armv7m.h"
 #include "qom/object.h"
+#include "hw/clock.h"
 
 #define TYPE_STM32F100_SOC "stm32f100-soc"
 OBJECT_DECLARE_SIMPLE_TYPE(STM32F100State, STM32F100_SOC)
@@ -56,6 +57,9 @@ struct STM32F100State {
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
+
+    Clock *sysclk;
+    Clock *refclk;
 };
 
 #endif
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index 0be92b2c475..f7b344ba9fb 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -30,6 +30,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/stm32f100_soc.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "hw/misc/unimp.h"
 #include "sysemu/sysemu.h"
 
@@ -57,6 +58,9 @@ static void stm32f100_soc_initfn(Object *obj)
     for (i = 0; i < STM_NUM_SPIS; i++) {
         object_initialize_child(obj, "spi[*]", &s->spi[i], TYPE_STM32F2XX_SPI);
     }
+
+    s->sysclk = qdev_init_clock_in(DEVICE(s), "sysclk", NULL, NULL, 0);
+    s->refclk = qdev_init_clock_in(DEVICE(s), "refclk", NULL, NULL, 0);
 }
 
 static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
@@ -68,6 +72,30 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
 
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
     /*
      * Init flash region
      * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
@@ -89,6 +117,8 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     qdev_prop_set_uint32(armv7m, "num-irq", 61);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
     qdev_prop_set_bit(armv7m, "enable-bitband", true);
+    qdev_connect_clock_in(armv7m, "cpuclk", s->sysclk);
+    qdev_connect_clock_in(armv7m, "refclk", s->refclk);
     object_property_set_link(OBJECT(&s->armv7m), "memory",
                              OBJECT(get_system_memory()), &error_abort);
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->armv7m), errp)) {
diff --git a/hw/arm/stm32vldiscovery.c b/hw/arm/stm32vldiscovery.c
index 7e8191ebf5f..07e401a818d 100644
--- a/hw/arm/stm32vldiscovery.c
+++ b/hw/arm/stm32vldiscovery.c
@@ -27,6 +27,7 @@
 #include "qapi/error.h"
 #include "hw/boards.h"
 #include "hw/qdev-properties.h"
+#include "hw/qdev-clock.h"
 #include "qemu/error-report.h"
 #include "hw/arm/stm32f100_soc.h"
 #include "hw/arm/boot.h"
@@ -39,16 +40,17 @@
 static void stm32vldiscovery_init(MachineState *machine)
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
     dev = qdev_new(TYPE_STM32F100_SOC);
     qdev_prop_set_string(dev, "cpu-type", ARM_CPU_TYPE_NAME("cortex-m3"));
+    qdev_connect_clock_in(dev, "sysclk", sysclk);
     sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
 
     armv7m_load_kernel(ARM_CPU(first_cpu),
-- 
2.20.1


