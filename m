Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA1B669CA5
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 16:43:26 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKmm-000103-8o; Fri, 13 Jan 2023 09:12:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmW-0000sf-2f
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:44 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmR-0003fm-T2
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:11:41 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 j34-20020a05600c1c2200b003da1b054057so3149247wms.5
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Qqq5jSaGqD+6ajO8SNo3n4GhKgld5h1XD9p1VGEHQsg=;
 b=dhSLX1WjzHn0KrSbEK9O4msp7LXloy/aEk0tmBNcWoB55inp4PL0KtRmr/WFtC37Zk
 OesxvdtvHpZgKg1ysaeB4yFPSqo/5wlf3t8SDzDqyqikf+tVhZUKfferkAjLXh/uUkB4
 4KWtZueZ/EF0zvLGWKo6iqTYVDryuz9A50FIoRRrFQuy6aIXTpO6iIJ8+zyScxY9EGO2
 NU4+I34nB27RT2KrNBx+3Np3GoSYlZXP+fjZzNL3/4iauyPc2+pEvMbGJa9U1YszV92B
 oOr+G3Ri0MiN/Amzo5e8bpcQG4X5FfLCld92JGxYGvXWJ1Asc70Gi6+etqC9/S4Lhu7z
 Qz+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Qqq5jSaGqD+6ajO8SNo3n4GhKgld5h1XD9p1VGEHQsg=;
 b=llag/36CAIXaPOGK4yMqGmXdZ87Ng4GCslISmcHcrlZgvw1qWN2087PFKRgiajAej4
 nYNFPcosBulSqbLp6xYByDzGne6q3CVkyi9ITxOszeER82mdNpEvPBKjj2kQO0mtCk0v
 0eRiq4fLcJJ7C/FDNzTH73oEGQIGGF6HOLGlskHQbl3vuqyTzyBHSQRq6Q5wNJ1zF7NR
 RwtoETM5yIZrShZUAHK2XRnOnKaxyWyGlCrs9VXvQnR/B11z0BUTh/6EbAv6GdgeX1cy
 m6DmKy1wkMjjU46AXgOv5/Suv0n+Js1V6aIrqpfUkbnVVU3nqsaR+9VZx2uObqcMlnDq
 CrIg==
X-Gm-Message-State: AFqh2kqfnv2AH2m0V9e5J9bmAsKjfOzZI9epURg4h2SggbQ9P3XbJ0w1
 lwe1CiyRELYRtohftRz6wpMphfECy65KHDX7
X-Google-Smtp-Source: AMrXdXtvYKoj4H0xFmeWkRtrLlaJBy1mumQzJQJJfXbuHMFCNb+GI6a0T4AGz0Gy4GY4k5ujFl4FwQ==
X-Received: by 2002:a05:600c:4e4f:b0:3cf:9d32:db67 with SMTP id
 e15-20020a05600c4e4f00b003cf9d32db67mr58189503wmq.3.1673619097613; 
 Fri, 13 Jan 2023 06:11:37 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.36
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:37 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 11/38] hw/arm/pxa2xx: Simplify pxa255_init()
Date: Fri, 13 Jan 2023 14:10:59 +0000
Message-Id: <20230113141126.535646-12-peter.maydell@linaro.org>
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

From: Philippe Mathieu-Daudé <philmd@linaro.org>

Since pxa255_init() must map the device in the system memory,
there is no point in passing get_system_memory() by argument.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109115316.2235-2-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/pxa.h | 2 +-
 hw/arm/gumstix.c     | 3 +--
 hw/arm/pxa2xx.c      | 4 +++-
 hw/arm/tosa.c        | 2 +-
 4 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
index 1095504b86f..c26007e57f9 100644
--- a/include/hw/arm/pxa.h
+++ b/include/hw/arm/pxa.h
@@ -195,6 +195,6 @@ struct PXA2xxI2SState {
 
 PXA2xxState *pxa270_init(MemoryRegion *address_space, unsigned int sdram_size,
                          const char *revision);
-PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size);
+PXA2xxState *pxa255_init(unsigned int sdram_size);
 
 #endif /* PXA_H */
diff --git a/hw/arm/gumstix.c b/hw/arm/gumstix.c
index 3a4bc332c42..c167518a46e 100644
--- a/hw/arm/gumstix.c
+++ b/hw/arm/gumstix.c
@@ -51,12 +51,11 @@ static void connex_init(MachineState *machine)
 {
     PXA2xxState *cpu;
     DriveInfo *dinfo;
-    MemoryRegion *address_space_mem = get_system_memory();
 
     uint32_t connex_rom = 0x01000000;
     uint32_t connex_ram = 0x04000000;
 
-    cpu = pxa255_init(address_space_mem, connex_ram);
+    cpu = pxa255_init(connex_ram);
 
     dinfo = drive_get(IF_PFLASH, 0, 0);
     if (!dinfo && !qtest_enabled()) {
diff --git a/hw/arm/pxa2xx.c b/hw/arm/pxa2xx.c
index 93dda83d7aa..8b8845fc630 100644
--- a/hw/arm/pxa2xx.c
+++ b/hw/arm/pxa2xx.c
@@ -11,6 +11,7 @@
 #include "qemu/error-report.h"
 #include "qemu/module.h"
 #include "qapi/error.h"
+#include "exec/address-spaces.h"
 #include "cpu.h"
 #include "hw/sysbus.h"
 #include "migration/vmstate.h"
@@ -2230,8 +2231,9 @@ PXA2xxState *pxa270_init(MemoryRegion *address_space,
 }
 
 /* Initialise a PXA255 integrated chip (ARM based core).  */
-PXA2xxState *pxa255_init(MemoryRegion *address_space, unsigned int sdram_size)
+PXA2xxState *pxa255_init(unsigned int sdram_size)
 {
+    MemoryRegion *address_space = get_system_memory();
     PXA2xxState *s;
     int i;
     DriveInfo *dinfo;
diff --git a/hw/arm/tosa.c b/hw/arm/tosa.c
index d5a6763cf9a..3ca2e4459ca 100644
--- a/hw/arm/tosa.c
+++ b/hw/arm/tosa.c
@@ -242,7 +242,7 @@ static void tosa_init(MachineState *machine)
     TC6393xbState *tmio;
     DeviceState *scp0, *scp1;
 
-    mpu = pxa255_init(address_space_mem, tosa_binfo.ram_size);
+    mpu = pxa255_init(tosa_binfo.ram_size);
 
     memory_region_init_rom(rom, NULL, "tosa.rom", TOSA_ROM, &error_fatal);
     memory_region_add_subregion(address_space_mem, 0, rom);
-- 
2.34.1


