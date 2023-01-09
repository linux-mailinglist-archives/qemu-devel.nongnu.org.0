Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A55266214D
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 10:20:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEoIT-000115-6P; Mon, 09 Jan 2023 04:18:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIQ-00010a-Mk
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:22 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEoIO-0002pt-PV
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 04:18:22 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 p3-20020a05600c1d8300b003d9ee5f125bso1993063wms.4
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 01:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=miUjczJli4sjte3qvrNKZ22sCjWcBk4KGoFkszIvwKk=;
 b=nq5G4QrvABE1DYPK+SRCCjgQb1t1cliZ08cI2zck3TZBWCfR18K4xyNMl6ufCxqowx
 l7QL8Wsn3GRdyfpA9vZEX0zD0jvhQYkJEoPW19f6wE+0v4XGO4wWaLiw1WTqA7mEKk1L
 lAc8Nhu3MzWagAJn2KrazxAQMH0rycJ2PGq+w8EgGp9ttdmDAjnVXQnd6cblITq77hq0
 nPkY8w9QaAyFYSvFe0phw4+/T/mHCDkQZCutojInCq7wzb+Tt5+LbuVMht/sd5lkv7BW
 u3JoIPGhOJODhxBgSwJ0dnO4E/PSjHb9y+4ja+BH4fLDzCPYpsA4XOxySwM1ukeshJNj
 0rtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=miUjczJli4sjte3qvrNKZ22sCjWcBk4KGoFkszIvwKk=;
 b=vkjkvgaVfFukkTtB+D7OhDkosH+1tOcsZDY37GTElgByJ1iO5wx9/KGwe4lx3BOckB
 sbt4mOdqOcLwOILRWrPfzvHcsYdO8+mbmipMIPHbmn7VU1L1YlUnu11goQZUvlSHcDLG
 GvMXjSA6WFgqjkLkGQcka2lKmc77VYFi4QlGwlrSgz0y6oijRmkOmwM1TNFkq2AI8D6i
 lEa7RoJamW/CldSjMWlhvJZbqr3qXKO6Iq1v6+e3kyQLge43y74Ytwm2ULrYqRleYR5a
 7xVqsjc6rNH1wEK/dlQlbKnhY6IwQI4NMNm+BE2NdZlTxgHntkx/kamBNLV3pu74IUU5
 EQSg==
X-Gm-Message-State: AFqh2kqEi7bvJv5U5b+Q32L7UJQKbAkZolYDolzcAGo0GxLGTmCBRB7p
 tFDhb3VU03ArOUg0i6kcN+t/WNNc1EYS4Ojq
X-Google-Smtp-Source: AMrXdXubp4CtVJQ0k5E/IzSaqsB1u0IfOVEem90TZyMr0mQmTDawytI22cbKz/SSorq7hRPusArLVA==
X-Received: by 2002:a05:600c:1e1d:b0:3cf:b07a:cd2f with SMTP id
 ay29-20020a05600c1e1d00b003cfb07acd2fmr44838537wmb.37.1673255899250; 
 Mon, 09 Jan 2023 01:18:19 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a05600c4e5200b003d9876aa04asm12699130wmq.41.2023.01.09.01.18.18
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 01:18:18 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/5] hw/i2c/versatile_i2c: Rename versatile_i2c ->
 arm_sbcon_i2c
Date: Mon,  9 Jan 2023 10:17:54 +0100
Message-Id: <20230109091754.79499-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109091754.79499-1-philmd@linaro.org>
References: <20230109091754.79499-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This device model started with the Versatile board, named
TYPE_VERSATILE_I2C, then ended up renamed TYPE_ARM_SBCON_I2C
as per the official "ARM SBCon two-wire serial bus interface"
description from:
https://developer.arm.com/documentation/dui0440/b/programmer-s-reference/two-wire-serial-bus-interface--sbcon

Use the latter name as a better description.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/Kconfig                              |  4 ++--
 hw/i2c/Kconfig                              |  2 +-
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 24 ++++++++++-----------
 hw/i2c/meson.build                          |  2 +-
 4 files changed, 16 insertions(+), 16 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (81%)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 17fcde8e1c..7db0ad7e8f 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -207,7 +207,7 @@ config REALVIEW
     select PL110
     select PL181  # display
     select PL310  # cache controller
-    select VERSATILE_I2C
+    select ARM_SBCON_I2C
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
 
@@ -472,7 +472,7 @@ config MPS2
     select SPLIT_IRQ
     select UNIMP
     select CMSDK_APB_WATCHDOG
-    select VERSATILE_I2C
+    select ARM_SBCON_I2C
 
 config FSL_IMX7
     bool
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index 9bb8870517..7ac9cadffa 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -14,7 +14,7 @@ config SMBUS_EEPROM
     bool
     select SMBUS
 
-config VERSATILE_I2C
+config ARM_SBCON_I2C
     bool
     select BITBANG_I2C
 
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/arm_sbcon_i2c.c
similarity index 81%
rename from hw/i2c/versatile_i2c.c
rename to hw/i2c/arm_sbcon_i2c.c
index d19df62265..979ccbe0ed 100644
--- a/hw/i2c/versatile_i2c.c
+++ b/hw/i2c/arm_sbcon_i2c.c
@@ -37,7 +37,7 @@ REG32(CONTROL_CLR, 4)
 #define SCL BIT(0)
 #define SDA BIT(1)
 
-static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
+static uint64_t arm_sbcon_i2c_read(void *opaque, hwaddr offset,
                                    unsigned size)
 {
     ArmSbconI2CState *s = opaque;
@@ -52,7 +52,7 @@ static uint64_t versatile_i2c_read(void *opaque, hwaddr offset,
     }
 }
 
-static void versatile_i2c_write(void *opaque, hwaddr offset,
+static void arm_sbcon_i2c_write(void *opaque, hwaddr offset,
                                 uint64_t value, unsigned size)
 {
     ArmSbconI2CState *s = opaque;
@@ -72,13 +72,13 @@ static void versatile_i2c_write(void *opaque, hwaddr offset,
     s->in = bitbang_i2c_set(&s->bitbang, BITBANG_I2C_SDA, (s->out & SDA) != 0);
 }
 
-static const MemoryRegionOps versatile_i2c_ops = {
-    .read = versatile_i2c_read,
-    .write = versatile_i2c_write,
+static const MemoryRegionOps arm_sbcon_i2c_ops = {
+    .read = arm_sbcon_i2c_read,
+    .write = arm_sbcon_i2c_write,
     .endianness = DEVICE_NATIVE_ENDIAN,
 };
 
-static void versatile_i2c_init(Object *obj)
+static void arm_sbcon_i2c_init(Object *obj)
 {
     DeviceState *dev = DEVICE(obj);
     ArmSbconI2CState *s = ARM_SBCON_I2C(obj);
@@ -87,21 +87,21 @@ static void versatile_i2c_init(Object *obj)
 
     bus = i2c_init_bus(dev, "i2c");
     bitbang_i2c_init(&s->bitbang, bus);
-    memory_region_init_io(&s->iomem, obj, &versatile_i2c_ops, s,
+    memory_region_init_io(&s->iomem, obj, &arm_sbcon_i2c_ops, s,
                           "arm_sbcon_i2c", 0x1000);
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-static const TypeInfo versatile_i2c_info = {
+static const TypeInfo arm_sbcon_i2c_info = {
     .name          = TYPE_ARM_SBCON_I2C,
     .parent        = TYPE_SYS_BUS_DEVICE,
     .instance_size = sizeof(ArmSbconI2CState),
-    .instance_init = versatile_i2c_init,
+    .instance_init = arm_sbcon_i2c_init,
 };
 
-static void versatile_i2c_register_types(void)
+static void arm_sbcon_i2c_register_types(void)
 {
-    type_register_static(&versatile_i2c_info);
+    type_register_static(&arm_sbcon_i2c_info);
 }
 
-type_init(versatile_i2c_register_types)
+type_init(arm_sbcon_i2c_register_types)
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index d3df273251..021bafc9f5 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -11,7 +11,7 @@ i2c_ss.add(when: 'CONFIG_MPC_I2C', if_true: files('mpc_i2c.c'))
 i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
 i2c_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_smbus.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
-i2c_ss.add(when: 'CONFIG_VERSATILE_I2C', if_true: files('versatile_i2c.c'))
+i2c_ss.add(when: 'CONFIG_ARM_SBCON_I2C', if_true: files('arm_sbcon_i2c.c'))
 i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
-- 
2.38.1


