Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E936677CC1
	for <lists+qemu-devel@lfdr.de>; Mon, 23 Jan 2023 14:41:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pJx03-0006GW-Iw; Mon, 23 Jan 2023 08:36:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzb-0005xF-U7
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:15 -0500
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pJwzX-0002M5-PM
 for qemu-devel@nongnu.org; Mon, 23 Jan 2023 08:36:09 -0500
Received: by mail-wm1-x32a.google.com with SMTP id
 m5-20020a05600c4f4500b003db03b2559eso8559675wmq.5
 for <qemu-devel@nongnu.org>; Mon, 23 Jan 2023 05:36:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+Nl5qo/slZRtjVNjxVllWsAsU0f66RVRp0rLB7RBFmo=;
 b=gnzg3txinoLY8ckenAFQ+qpfw6YovOer2/DVYAGGAt3bW04TjOKr6Oby80vHQvFOqo
 OougmmifssCRCwHvFi/Bh5k3iR6TCfzclb3uvsWEqoPJ6fqzuHsaBcunBWFga/J9iJIu
 gk/cdveYIQlwHlwptmGLo6ttewNGOZusDOn78n+ZJyRq0xNNFx8Z8DtBL9m63wt51+p7
 y8fSeqgh7hiKC0NvfaU8jJaIik+/W+QlH8RrTOzSzIHQuI8AHqBg4X4hePVCW3V/rK/J
 b6OKP7njPdYlNZnTnJXhnVYJX1peE4Imm9HsAJVUlR559OTd1hq20sx6yxPfmJg1UVVh
 T2+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Nl5qo/slZRtjVNjxVllWsAsU0f66RVRp0rLB7RBFmo=;
 b=8FgBaf6KWbwvKP04LwOtXBzaHEhEftAkZhNEetNWkE9HcYa3GP7yHZk7V06vm2tto0
 fNuquvhrJDsJFo6o+A7DldwWMpYocDDiN/bSovzk6aDKLC5JH5ZhHm85+/Y6s4G8tiGv
 Ybk+7V+dAFp42BoMR4b9g10/Opyf1E6LvtlqQ6VTFhzElENtEwzx1vempkEI5XdUJKJ6
 gWQZf/xtRqKZVRVCs3pNn0SaxTRXQqcctShN6DtPqLYutLuo2dY7INEopG0uEDMhlGsS
 XQpf59oyMHLfB817Sr/DjzyjwaiIuHvqP+cw3ihSrOhy+Fq2pkXnjk/y4ilmGtWcULkT
 wGQg==
X-Gm-Message-State: AFqh2kruqb5iwYTfWkktaUsXePUxZTZOgGtKNHefNAObUdmxsRKTnj4t
 gL3BlYBLaZLib/IGrrsTcZiLaj7coqt/Ko2Y
X-Google-Smtp-Source: AMrXdXsMVR9Iu2PDoS2tsFmyB5MQ8XU0ifxXOIUa6XgtB5YUZilYEtCOMb24Y74iDDm7cOUa5aQeZA==
X-Received: by 2002:a05:600c:35ce:b0:3db:1caf:1020 with SMTP id
 r14-20020a05600c35ce00b003db1caf1020mr17289064wmq.35.1674480966591; 
 Mon, 23 Jan 2023 05:36:06 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 d19-20020a05600c34d300b003a6125562e1sm10817457wmq.46.2023.01.23.05.36.05
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jan 2023 05:36:05 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 12/26] hw/i2c/versatile_i2c: Rename versatile_i2c ->
 arm_sbcon_i2c
Date: Mon, 23 Jan 2023 13:35:39 +0000
Message-Id: <20230123133553.2171158-13-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230123133553.2171158-1-peter.maydell@linaro.org>
References: <20230123133553.2171158-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32a.google.com
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

This device model started with the Versatile board, named
TYPE_VERSATILE_I2C, then ended up renamed TYPE_ARM_SBCON_I2C
as per the official "ARM SBCon two-wire serial bus interface"
description from:
https://developer.arm.com/documentation/dui0440/b/programmer-s-reference/two-wire-serial-bus-interface--sbcon

Use the latter name as a better description.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230110082508.24038-6-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 MAINTAINERS                                 |  1 +
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 24 ++++++++++-----------
 hw/arm/Kconfig                              |  4 ++--
 hw/i2c/Kconfig                              |  2 +-
 hw/i2c/meson.build                          |  2 +-
 5 files changed, 17 insertions(+), 16 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (81%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 08ad1e5341e..c581c11a645 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -942,6 +942,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
 L: qemu-arm@nongnu.org
 S: Maintained
 F: hw/*/versatile*
+F: hw/i2c/arm_sbcon_i2c.c
 F: include/hw/i2c/arm_sbcon_i2c.h
 F: hw/misc/arm_sysctl.c
 F: docs/system/arm/versatile.rst
diff --git a/hw/i2c/versatile_i2c.c b/hw/i2c/arm_sbcon_i2c.c
similarity index 81%
rename from hw/i2c/versatile_i2c.c
rename to hw/i2c/arm_sbcon_i2c.c
index d19df62265a..979ccbe0ed6 100644
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
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 19d6b9d95f5..2d157de9b8b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -211,7 +211,7 @@ config REALVIEW
     select PL110
     select PL181  # display
     select PL310  # cache controller
-    select VERSATILE_I2C
+    select ARM_SBCON_I2C
     select DS1338 # I2C RTC+NVRAM
     select USB_OHCI
 
@@ -481,7 +481,7 @@ config MPS2
     select SPLIT_IRQ
     select UNIMP
     select CMSDK_APB_WATCHDOG
-    select VERSATILE_I2C
+    select ARM_SBCON_I2C
 
 config FSL_IMX7
     bool
diff --git a/hw/i2c/Kconfig b/hw/i2c/Kconfig
index f8ec461be3d..14886b35dac 100644
--- a/hw/i2c/Kconfig
+++ b/hw/i2c/Kconfig
@@ -14,7 +14,7 @@ config SMBUS_EEPROM
     bool
     select SMBUS
 
-config VERSATILE_I2C
+config ARM_SBCON_I2C
     bool
     select BITBANG_I2C
 
diff --git a/hw/i2c/meson.build b/hw/i2c/meson.build
index e4c8e14a527..3996564c25c 100644
--- a/hw/i2c/meson.build
+++ b/hw/i2c/meson.build
@@ -12,7 +12,7 @@ i2c_ss.add(when: 'CONFIG_ALLWINNER_I2C', if_true: files('allwinner-i2c.c'))
 i2c_ss.add(when: 'CONFIG_NRF51_SOC', if_true: files('microbit_i2c.c'))
 i2c_ss.add(when: 'CONFIG_NPCM7XX', if_true: files('npcm7xx_smbus.c'))
 i2c_ss.add(when: 'CONFIG_SMBUS_EEPROM', if_true: files('smbus_eeprom.c'))
-i2c_ss.add(when: 'CONFIG_VERSATILE_I2C', if_true: files('versatile_i2c.c'))
+i2c_ss.add(when: 'CONFIG_ARM_SBCON_I2C', if_true: files('arm_sbcon_i2c.c'))
 i2c_ss.add(when: 'CONFIG_OMAP', if_true: files('omap_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PPC4XX', if_true: files('ppc4xx_i2c.c'))
 i2c_ss.add(when: 'CONFIG_PCA954X', if_true: files('i2c_mux_pca954x.c'))
-- 
2.34.1


