Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B91663EA22B
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:38:27 +0200 (CEST)
Received: from localhost ([::1]:58400 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7AQ-0008RU-Ol
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:38:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46422)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76M-0005Mt-OT
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:14 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335]:44654)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76H-0007s3-PG
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:14 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so613349wml.3
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QZ34cRsgLtFiqWjLUrzVojRfLDZmQXmFHIvftQxhUGw=;
 b=yRx4qradlovMgIPQYHHX3TBntkvWqqJYA7i5X29khpZ4XoUJDetnKlX27tLiCC8KyP
 0kpdwgB0z1Mmpf5J5x+j384ix4X33biY1cu9zpPC+itwc8N8zyyFwvfpLY0Od+d5WNhc
 R/lRTNd+KlWFn5qkXp/vO3aCyNesU1LOFeyV2ca/MCJNLh6FqB6lD5J8fCqf+e2zBSlT
 qsc5XCzZ0TMRH2EFkVulOVSlKY3BqFwfwnOp/5Nm9YTYFH37oIvk1uHHMgUMqBrmu2FJ
 c9Ak0zHl3io3VGxoPhA68QGPUNzfikUvmxdYw+6xQmTUPLDWIexpmEOdheyisivD+mEh
 IZpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QZ34cRsgLtFiqWjLUrzVojRfLDZmQXmFHIvftQxhUGw=;
 b=TNOMBksx0CsFmiJmq81zHjtoqCa39Oo5JGZrEYyiF1+6V8Uz88/IZP15sfFbK/PEL5
 FZ2U4jJ7tePe/FaoClKc0Un7e//LeD/czQ1SzRJOIUvKDgYut+T4myyV/1ubD1tj1NZ7
 emS3gA3NiK8S+JAXJ6lmT7LTA3hGjn449D9cBnBHeL2EgAop3OKI9ziAcahPp3PHL8hx
 V1agNSXFdBnFAMpTAXLXLelUrIT/CfPfz5lixL2aH8b/IfpXnvenZRBlNQgCjtMubI5x
 QCcjFuidxBLXv4OjOp92cHqG/khVcwa7vL3zG32NRA/eOFc64UTT6AN48WTmbc8CXVav
 bCWg==
X-Gm-Message-State: AOAM530OQCd914420F026A1m2JsxCqrIClQzs0fXi+ZOBBHm1FZ6qdTA
 xyGaSm0KkwyTLPMaA3izTk5JCg==
X-Google-Smtp-Source: ABdhPJwXqd7Y7fUJgFliskb6YLbwGVhKFQ0RCr8XJUUGdme8h6MHc2QO5kP4Too/RidrKJ/skWYGEw==
X-Received: by 2002:a05:600c:ad8:: with SMTP id
 c24mr14212401wmr.28.1628760848595; 
 Thu, 12 Aug 2021 02:34:08 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:08 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 10/25] hw/arm: Don't allocate separate MemoryRegions
 in stm32 SoC realize
Date: Thu, 12 Aug 2021 10:33:41 +0100
Message-Id: <20210812093356.1946-11-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x335.google.com
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

In the realize methods of the stm32f100 and stm32f205 SoC objects, we
call g_new() to create new MemoryRegion objjects for the sram, flash,
and flash_alias.  This is unnecessary (and leaves open the
possibility of leaking the allocations if we exit from realize with
an error).  Make these MemoryRegions member fields of the device
state struct instead, as stm32f405 already does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/stm32f100_soc.h |  4 ++++
 include/hw/arm/stm32f205_soc.h |  4 ++++
 hw/arm/stm32f100_soc.c         | 17 +++++++----------
 hw/arm/stm32f205_soc.c         | 17 +++++++----------
 4 files changed, 22 insertions(+), 20 deletions(-)

diff --git a/include/hw/arm/stm32f100_soc.h b/include/hw/arm/stm32f100_soc.h
index 71bffcf4fd5..b7d71c6c634 100644
--- a/include/hw/arm/stm32f100_soc.h
+++ b/include/hw/arm/stm32f100_soc.h
@@ -52,6 +52,10 @@ struct STM32F100State {
 
     STM32F2XXUsartState usart[STM_NUM_USARTS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
+
+    MemoryRegion sram;
+    MemoryRegion flash;
+    MemoryRegion flash_alias;
 };
 
 #endif
diff --git a/include/hw/arm/stm32f205_soc.h b/include/hw/arm/stm32f205_soc.h
index 985ff63aa9e..75251494917 100644
--- a/include/hw/arm/stm32f205_soc.h
+++ b/include/hw/arm/stm32f205_soc.h
@@ -63,6 +63,10 @@ struct STM32F205State {
     STM32F2XXSPIState spi[STM_NUM_SPIS];
 
     qemu_or_irq *adc_irqs;
+
+    MemoryRegion sram;
+    MemoryRegion flash;
+    MemoryRegion flash_alias;
 };
 
 #endif
diff --git a/hw/arm/stm32f100_soc.c b/hw/arm/stm32f100_soc.c
index 0c4a5c66451..0be92b2c475 100644
--- a/hw/arm/stm32f100_soc.c
+++ b/hw/arm/stm32f100_soc.c
@@ -67,25 +67,22 @@ static void stm32f100_soc_realize(DeviceState *dev_soc, Error **errp)
     int i;
 
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flash = g_new(MemoryRegion, 1);
-    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
 
     /*
      * Init flash region
      * Flash starts at 0x08000000 and then is aliased to boot memory at 0x0
      */
-    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F100.flash",
+    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F100.flash",
                            FLASH_SIZE, &error_fatal);
-    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
-                             "STM32F100.flash.alias", flash, 0, FLASH_SIZE);
-    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
-    memory_region_add_subregion(system_memory, 0, flash_alias);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "STM32F100.flash.alias", &s->flash, 0, FLASH_SIZE);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
+    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
 
     /* Init SRAM region */
-    memory_region_init_ram(sram, NULL, "STM32F100.sram", SRAM_SIZE,
+    memory_region_init_ram(&s->sram, NULL, "STM32F100.sram", SRAM_SIZE,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     /* Init ARMv7m */
     armv7m = DEVICE(&s->armv7m);
diff --git a/hw/arm/stm32f205_soc.c b/hw/arm/stm32f205_soc.c
index 9cd41bf56da..0bd215aebd7 100644
--- a/hw/arm/stm32f205_soc.c
+++ b/hw/arm/stm32f205_soc.c
@@ -84,21 +84,18 @@ static void stm32f205_soc_realize(DeviceState *dev_soc, Error **errp)
     int i;
 
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
-    MemoryRegion *flash = g_new(MemoryRegion, 1);
-    MemoryRegion *flash_alias = g_new(MemoryRegion, 1);
 
-    memory_region_init_rom(flash, OBJECT(dev_soc), "STM32F205.flash",
+    memory_region_init_rom(&s->flash, OBJECT(dev_soc), "STM32F205.flash",
                            FLASH_SIZE, &error_fatal);
-    memory_region_init_alias(flash_alias, OBJECT(dev_soc),
-                             "STM32F205.flash.alias", flash, 0, FLASH_SIZE);
+    memory_region_init_alias(&s->flash_alias, OBJECT(dev_soc),
+                             "STM32F205.flash.alias", &s->flash, 0, FLASH_SIZE);
 
-    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, flash);
-    memory_region_add_subregion(system_memory, 0, flash_alias);
+    memory_region_add_subregion(system_memory, FLASH_BASE_ADDRESS, &s->flash);
+    memory_region_add_subregion(system_memory, 0, &s->flash_alias);
 
-    memory_region_init_ram(sram, NULL, "STM32F205.sram", SRAM_SIZE,
+    memory_region_init_ram(&s->sram, NULL, "STM32F205.sram", SRAM_SIZE,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
-- 
2.20.1


