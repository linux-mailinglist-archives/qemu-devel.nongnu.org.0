Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 089573FD8B3
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 13:27:36 +0200 (CEST)
Received: from localhost ([::1]:46506 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLOP1-00026a-4N
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 07:27:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43756)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcc-0007E7-AL
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:35 -0400
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330]:51927)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mLNcV-00060e-AH
 for qemu-devel@nongnu.org; Wed, 01 Sep 2021 06:37:34 -0400
Received: by mail-wm1-x330.google.com with SMTP id u15so1524471wmj.1
 for <qemu-devel@nongnu.org>; Wed, 01 Sep 2021 03:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FHlQJkP738avfN2ghaMhCgKtY64B2XdP/tvv/GsErWE=;
 b=Y8KBl81eIiKV6xNIVgYJarRDQcivRMsrPE6unb3qfEBkMtEsSugTMZRpwFc72WGcGm
 s52Yg6BUYuZID9OvuENrHACI0dNHlFQKSRd0eZ3cCc2H1yl5KeEWSE+zYKR9h0vBEbKu
 61WmLg8l0EHxprOhDuqeBmkj+HIx5sqp5EW9em84rrWhsQlBA38t37PyAuFTwmfSXQme
 WE7KoaWLeGpMMNlSSDAN2WcJgg5gEvpOIaca1IV6eIMtHkskYWrFgYTT/su6X4tfgDEE
 Tt27u8FcTirwy/foVZHPc61R1hLoTt49VOkuMVk+YPdR+8FYjhv3IrXowtp5xUALEZZI
 PUTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FHlQJkP738avfN2ghaMhCgKtY64B2XdP/tvv/GsErWE=;
 b=rqvXzlwBW7wQV9nPjXyhubqe1cFMkjPShg3ZcKWP3CKxUJB61Z+PNgNrfaP8dj2tlM
 gVW24mee3MYuFAnFQo3obRIWk+EVREBEDIcEtpFhnr8VGZHfRVNrBLlq041736wyv2We
 egk9bqwi8adM7FBhyNo/s+qMfYwwUr2ef1J20MLA5v9Rl1PZi5lu9qwpFkPYibr1ahVs
 FTNH3y325HJsDbIm33mBE8b/Cl0sho9j6PUulKeD795HwxXYZUQupB+7Xq81lCjPgGHP
 U8fF9YIZU/BJQIcn9F7pOdHa8aemx3UIj5lYmoTIoUz17E/K4xbw0/OvMFYDoHHtoBqY
 bTbg==
X-Gm-Message-State: AOAM530DNECq2/il9V7xPHHhlPfrTlZiWInCo1gnNWOqYceXaRrRPd8w
 avuij0GR5/ixInhnLf3f5tkOOuzhwyJLNg==
X-Google-Smtp-Source: ABdhPJzhqjNPNzN/XoM7A3x1+4BI5g4agO3t3Mj5KImg8uvff9SbvMoWhYaKUMlxjWT2J+lq3MfHaA==
X-Received: by 2002:a1c:9d50:: with SMTP id g77mr8725488wme.67.1630492645454; 
 Wed, 01 Sep 2021 03:37:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j207sm5494771wmj.40.2021.09.01.03.37.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Sep 2021 03:37:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 44/51] hw/arm/msf2_soc: Don't allocate separate MemoryRegions
Date: Wed,  1 Sep 2021 11:36:46 +0100
Message-Id: <20210901103653.13435-45-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210901103653.13435-1-peter.maydell@linaro.org>
References: <20210901103653.13435-1-peter.maydell@linaro.org>
MIME-Version: 1.0
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

In the realize method of the msf2-soc SoC object, we call g_new() to
create new MemoryRegion objects for the nvm, nvm_alias, and sram.
This is unnecessary; make these MemoryRegions member fields of the
device state struct instead.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Alexandre Iooss <erdnaxe@crans.org>
Message-id: 20210812093356.1946-19-peter.maydell@linaro.org
---
 include/hw/arm/msf2-soc.h |  4 ++++
 hw/arm/msf2-soc.c         | 17 +++++++----------
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/include/hw/arm/msf2-soc.h b/include/hw/arm/msf2-soc.h
index d4061846855..38e10ce20aa 100644
--- a/include/hw/arm/msf2-soc.h
+++ b/include/hw/arm/msf2-soc.h
@@ -65,6 +65,10 @@ struct MSF2State {
     MSSTimerState timer;
     MSSSpiState spi[MSF2_NUM_SPIS];
     MSF2EmacState emac;
+
+    MemoryRegion nvm;
+    MemoryRegion nvm_alias;
+    MemoryRegion sram;
 };
 
 #endif
diff --git a/hw/arm/msf2-soc.c b/hw/arm/msf2-soc.c
index 5cfe7caf834..f36788054b3 100644
--- a/hw/arm/msf2-soc.c
+++ b/hw/arm/msf2-soc.c
@@ -83,11 +83,8 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
     int i;
 
     MemoryRegion *system_memory = get_system_memory();
-    MemoryRegion *nvm = g_new(MemoryRegion, 1);
-    MemoryRegion *nvm_alias = g_new(MemoryRegion, 1);
-    MemoryRegion *sram = g_new(MemoryRegion, 1);
 
-    memory_region_init_rom(nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
+    memory_region_init_rom(&s->nvm, OBJECT(dev_soc), "MSF2.eNVM", s->envm_size,
                            &error_fatal);
     /*
      * On power-on, the eNVM region 0x60000000 is automatically
@@ -95,15 +92,15 @@ static void m2sxxx_soc_realize(DeviceState *dev_soc, Error **errp)
      * start address (0x0). We do not support remapping other eNVM,
      * eSRAM and DDR regions by guest(via Sysreg) currently.
      */
-    memory_region_init_alias(nvm_alias, OBJECT(dev_soc), "MSF2.eNVM", nvm, 0,
-                             s->envm_size);
+    memory_region_init_alias(&s->nvm_alias, OBJECT(dev_soc), "MSF2.eNVM",
+                             &s->nvm, 0, s->envm_size);
 
-    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, nvm);
-    memory_region_add_subregion(system_memory, 0, nvm_alias);
+    memory_region_add_subregion(system_memory, ENVM_BASE_ADDRESS, &s->nvm);
+    memory_region_add_subregion(system_memory, 0, &s->nvm_alias);
 
-    memory_region_init_ram(sram, NULL, "MSF2.eSRAM", s->esram_size,
+    memory_region_init_ram(&s->sram, NULL, "MSF2.eSRAM", s->esram_size,
                            &error_fatal);
-    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, sram);
+    memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 81);
-- 
2.20.1


