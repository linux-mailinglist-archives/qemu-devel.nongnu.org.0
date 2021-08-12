Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A60623EA229
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:38:04 +0200 (CEST)
Received: from localhost ([::1]:56156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7A3-0006xa-Ja
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:38:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46438)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76N-0005Nh-85
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:15 -0400
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:43876)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76J-0007sJ-4t
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:14 -0400
Received: by mail-wm1-x32c.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso4055286wms.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=BbTX/NucXCYFIRoCKoRXjBrwppGdZQUWNSG930H1Tcg=;
 b=FOAjLsI2VCzlzcNPNrmjL3FwdR+VCfAW+M7oIEoQfgEY6rXwznDu12xEfFmef7fDVc
 pUHbuH3sRvzCqgWVTvSSHq9wEU9zqPSiAPgMEBFlIAHSZUZ4wQdXlQWuAJxQCEykHFmM
 2fjpxNZUgKOnfL9P0Zxy8fztl1R9CYonWRgfIxeHm6Pj+RJGWmSdAodBbU8W4bhgLf3Q
 gksrV6SH/3WzIJJd5jTvEL3M0/l/GSY2Lpa4EOL3yNeOUU9VDuWgmWTvhvmfxVaD9Q1H
 7aB8hjXpSouiEgmNcSR8V4iuOglWJgg+eJRt1ZQ0bUvnmK3xdZFZliV7qBCh55oEkRi4
 44kw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BbTX/NucXCYFIRoCKoRXjBrwppGdZQUWNSG930H1Tcg=;
 b=SXn4EhNeupR26cJomfWJW32TLi6pkXyF9Jt0jQCk78G2r+6mNb3ZW3Si+N+XbpeFU9
 6Kz/nJI5/ZWftwuQWvr55JTlBCw2s5lYpAJRuHagdqAR0dRnR3l25B4XfJ8vWzJ4Fx2v
 5mBU0bEovgndgW5DRgABbeO8indILrlbGoYZdFXsh6Z5ZeCaCvtov6OyfMuzlPePu0uX
 xWKW7yW6IzGZm2vOB9d94tu2M6+51jGRdixW9klKSSkcIdFs/Tw66ZVUNojpEnmRvwOf
 9ghFw8cO5KeGPOGx3U+pcJn2PiwmTlT1fIRMdTz6Qqc/a/aUTeIvdc7gVi305EN3YH71
 aARw==
X-Gm-Message-State: AOAM53296eyLPIGZRhmO9TnyDeMGk2f23qNoJYaBQpgGQhgPGifqYnZt
 Tto9CPVzYGwm7g8RGDenQYEJgg==
X-Google-Smtp-Source: ABdhPJy0o+kLAgttdNQFmFQJklUnvv68pRSw1ZLb653ljaB3nv0BmYRcrfwfNhTrjcDFGX2cVpG6wg==
X-Received: by 2002:a7b:c144:: with SMTP id z4mr14184031wmi.55.1628760849526; 
 Thu, 12 Aug 2021 02:34:09 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:09 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 11/25] hw/arm/stm32f100: Wire up sysclk and refclk
Date: Thu, 12 Aug 2021 10:33:42 +0100
Message-Id: <20210812093356.1946-12-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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


