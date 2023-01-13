Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DBA3669B4B
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:02:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmW-0000qa-2w; Fri, 13 Jan 2023 09:11:44 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmM-0000pL-Ep
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:34 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmI-0003dl-HN
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:31 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 c4-20020a1c3504000000b003d9e2f72093so14040999wma.1
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0UjFAgB+hRTqOaCSG06n/BoGBnVJMNwagk4kbsnn0CU=;
 b=ULiYO3fl1uV9msj9tdAMEhO+h4oC2pikmw+C6APLZmhvD0TkPRijyN1slGRQtHKYQ9
 nvP1zkZDItRSRzzf8Rg5KfaBMWleDadY8DutT8aObJYFvDwaMGGIemDTclAag6yZPysD
 dvTPc5OgkirCSW1BV39QnV858eGrkYe85tdb8KTELY4fHQ1sVgrF27lgZuWZU2eWUEup
 2QAxCDqOq3qv7qaDEda/rCXotcw/ANHhx8NXUPSq6dt4psPhGlIy0gPENX51S3JvktCa
 qeueNz3mUN4g9q3Kolysb8h9MOqiowrQwegHojOXvcxV/v7tQ2h6arz2zzeKqqakabfJ
 uvKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0UjFAgB+hRTqOaCSG06n/BoGBnVJMNwagk4kbsnn0CU=;
 b=mTIIjJRDCXJdrcNUgEGFfJIDrgzvcRKGf3iZYcejZJ8aCeIzZm7dHad+Sy5KX/0XVS
 Gp3uMVuQoufHW2eUMvKGaOLmtOtty9zm3f8mLyqpQV1pt3Ro5e/nhMY1dlpxdWjPJAd5
 P69H/eR858v8sylucz0fjRVxllavNv2BeDD8cOczV5x1iXcliNFYIcieM/LpXPcKRIrK
 HGEuBbPP1w49hzjts/EijCOZ4CI0rjdxfQ2MoluS/j0V7NW6hprKIxY+lGpG7fvEUpWm
 WegI2+uEwxfk2rlz+3QTIDJlZ0chM5LPEK1+Fdy/LMFqi6B1ZBvTnRfJY560TDwTx3Aj
 izCw==
X-Gm-Message-State: AFqh2koK5sCPskMByVWaafKdLYBaJoOUqghUn9juxoHngegMgipKVwMN
 sRPpxoEiNNm7ovYUQLqnNDszxSQyzb1izscp
X-Google-Smtp-Source: AMrXdXsBheE39RwSHb8VGHFe+VOXTJlR+yhK6vtbvi5hZdSjFcPzi10afF5Bpsw0bJjjeBbZO+I2IQ==
X-Received: by 2002:a05:600c:3493:b0:3d2:370b:97f4 with SMTP id
 a19-20020a05600c349300b003d2370b97f4mr63294552wmq.16.1673619088908; 
 Fri, 13 Jan 2023 06:11:28 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:28 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/38] hw/arm/stm32f405: correctly describe the memory layout
Date: Fri, 13 Jan 2023 14:10:49 +0000
Message-Id: <20230113141126.535646-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x332.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: Felipe Balbi <balbi@kernel.org>

STM32F405 has 128K of SRAM and another 64K of CCM (Core-coupled
Memory) at a different base address. Correctly describe the memory
layout to give existing FW images a chance to run unmodified.

Reviewed-by: Alistair Francis <alistair@alistair23.me>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Signed-off-by: Felipe Balbi <balbi@kernel.org>
Message-id: 20221230145733.200496-2-balbi@kernel.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/stm32f405_soc.h | 5 ++++-
 hw/arm/stm32f405_soc.c         | 8 ++++++++
 2 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/include/hw/arm/stm32f405_soc.h b/include/hw/arm/stm32f405_soc.h
index 5bb0c8d5697..249ab5434ec 100644
--- a/include/hw/arm/stm32f405_soc.h
+++ b/include/hw/arm/stm32f405_soc.h
@@ -46,7 +46,9 @@ OBJECT_DECLARE_SIMPLE_TYPE(STM32F405State, STM32F405_SOC)
 #define FLASH_BASE_ADDRESS 0x08000000
 #define FLASH_SIZE (1024 * 1024)
 #define SRAM_BASE_ADDRESS 0x20000000
-#define SRAM_SIZE (192 * 1024)
+#define SRAM_SIZE (128 * 1024)
+#define CCM_BASE_ADDRESS 0x10000000
+#define CCM_SIZE (64 * 1024)
 
 struct STM32F405State {
     /*< private >*/
@@ -65,6 +67,7 @@ struct STM32F405State {
     STM32F2XXADCState adc[STM_NUM_ADCS];
     STM32F2XXSPIState spi[STM_NUM_SPIS];
 
+    MemoryRegion ccm;
     MemoryRegion sram;
     MemoryRegion flash;
     MemoryRegion flash_alias;
diff --git a/hw/arm/stm32f405_soc.c b/hw/arm/stm32f405_soc.c
index c07947d9f8b..cef23d7ee41 100644
--- a/hw/arm/stm32f405_soc.c
+++ b/hw/arm/stm32f405_soc.c
@@ -139,6 +139,14 @@ static void stm32f405_soc_realize(DeviceState *dev_soc, Error **errp)
     }
     memory_region_add_subregion(system_memory, SRAM_BASE_ADDRESS, &s->sram);
 
+    memory_region_init_ram(&s->ccm, NULL, "STM32F405.ccm", CCM_SIZE,
+                           &err);
+    if (err != NULL) {
+        error_propagate(errp, err);
+        return;
+    }
+    memory_region_add_subregion(system_memory, CCM_BASE_ADDRESS, &s->ccm);
+
     armv7m = DEVICE(&s->armv7m);
     qdev_prop_set_uint32(armv7m, "num-irq", 96);
     qdev_prop_set_string(armv7m, "cpu-type", s->cpu_type);
-- 
2.34.1


