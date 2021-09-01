Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F21A33FD889
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:16:56 +0200 (CEST)
Received: from localhost ([::1]:51812 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOEi-0003Fy-1o
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:16:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43720)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNca-0007DG-4s
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:38581)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcP-0005wB-TX
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:30 -0400
Received: by mail-wr1-x430.google.com with SMTP id u16so3751066wrn.5
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ZW7hOgDfBwQm6WjLSXPRTnwUiqdqnjJPibh0v1ucACM=;
 b=D83mRXsUWoshHo0ePBj4u3+g55akx9iDmTjELC4g2P/E5H+KVKlRFF2EZPsJbChC57
 amASoAWV5xj6Y7GMfw1bjCwRhKtouZPxrqtOs+VBWqszD+VesFcpPbJdNLQdZHUiCEKN
 b2iUqLGJXHTaQF1JZS4Fj05q5N6YkwFvlp6pOfpVeChg47YcdXdKPBhc0TeGzIEnS3RP
 z5wcnq+a8EmuEfr2yewJCQELOmiBp0Y50Vt3qpB9GS9KNe9XqgX7n3boF2eHQ5KsDmpg
 6BJDE+6ow9C+DYKXAML1dRnEXgfIokmZfjRpk/AKlg3NaWEFFsLvFYLYUWHgZDrEgiOE
 I+jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZW7hOgDfBwQm6WjLSXPRTnwUiqdqnjJPibh0v1ucACM=;
 b=gZC3vM0djSz3dEOoZxeUaA3u/OsWr+N9FIlEaxHzOxfSD751KS7BkSgg1pGyIljCa0
 AkKG0D+cWwIQ0+3IaEDg0wTGO6iKQWtd8NSBYeHg6CwnX1fEnMVRSBb1KTaOnDVeQsTz
 AacOQ/fnZvYYps/dtTvkKMs3+L5UPp0eSoJla/S4mrZY9953H/ERDWhsogCnbkgjbibQ
 gXjz4fR+l29u+gZK/n6TFLzR4UukV4hiYfTs6a+VQxlA5Vc4Y2yeq9HYDTkJRSaolIhM
 sdT7LR0qO3bwC0ern99/MBFi9yPiFgQMt2IRlX2DcutgoyumsTfU6dElhw6oN3LIqe2e
 eIgQ==
X-Gm-Message-State: AOAM5313WHEMhNxrGbFId4kjY1QzSfnHCfR4Cr4KI43V2dH5goBru3WU
 oBzlFxadMjQNvFroMAr+6cswW5F+alueug==
X-Google-Smtp-Source: ABdhPJysvT5lLv/J5ZzJN3ejjFL1ERH8+1x3Dln/8O+66q4wMJ3RoSkpxxAKbKagcXtF2XKcJroEtA==
X-Received: by 2002:adf:82a8:: with SMTP id 37mr37515831wrc.123.1630492639903; 
 Wed, 01 Sep 2021 03:37:19 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.19
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:19 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 36/51] hw/arm: Don't allocate separate MemoryRegions in stm32
 SoC realize
Date: Wed,  1 Sep 2021 11:36:38 +0100
Message-Id: <20210901103653.13435-37-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
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

In the realize methods of the stm32f100 and stm32f205 SoC objects, we
call g_new() to create new MemoryRegion objects for the sram, flash,
and flash_alias.  This is unnecessary (and leaves open the
possibility of leaking the allocations if we exit from realize with
an error).  Make these MemoryRegions member fields of the device
state struct instead, as stm32f405 already does.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Message-id: 20210812093356.1946-11-peter.maydell@linaro.org
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


