Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 49821663C77
	for <lists+qemu-devel@lfdr.de>; Tue, 10 Jan 2023 10:13:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pF9wx-0005g4-I7; Tue, 10 Jan 2023 03:25:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wv-0005e1-2A
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:37 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pF9wt-0004T0-99
 for qemu-devel@nongnu.org; Tue, 10 Jan 2023 03:25:36 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso11159592wms.5
 for <qemu-devel@nongnu.org>; Tue, 10 Jan 2023 00:25:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rl8UZbbfBdr+8xfBuGOP7BJXh/NrLDijG8q8CoIHOmk=;
 b=p/51JqktB+D0Ev2QBj/AL1LmIzR1MwKmRZDdmaleUJSF9x3tywhGX+dNVtxE7EhExN
 +JAvl8MjPIaWpCxvbfERDg7wgr3JnRCi6QZ2vtPwtIqvo0iQrkhx1Is7c+mqEE9/P+FI
 hj9T5XOP4zmJmT/CC8M+kyPFdEaKbTPIKXLBfazjVW3k+h18l+0LA9BR1OI4jeQuTetL
 eG+sLj1604HMrNMaa2KMSC9XjWaHVZP2TxnoyeJE38Q/Hx2nD2owNTmf5dfBLlxBcwBT
 bQC7F4sQNLcT0lPq2XH6XTHaEXcV17hwtv9RlEWstT2WPz7SQ8CSYfstQbXVQJQHTYz9
 ltNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rl8UZbbfBdr+8xfBuGOP7BJXh/NrLDijG8q8CoIHOmk=;
 b=MCi19RcZDAXkYpSZ1RlF3MeoHycykJRO9ZTxGNi/Hk40jW3X/YRwbkaTbzoHfmfQRF
 uiJUcl0iK/I+ElZ5HNDGeqAbmYKUy3mEQHoCHkyu/FyjUT9SFrVkS00Rpz7zr+EdbBB1
 hH/VHWFmmNCF7A5q/Dhgg5KUak1ZYJY8hDn/HusLD/rbFOSXevpwWKC2OdpeVp99LKBl
 AdH+88BtJZBy870kf4efJJDh+kveJ8KpmhMj8RkSQRs/0HucZQVmjlVPMmjlKKDsc7xz
 4wqaXl6Bk1xeezDFjDwVioPm5V4itJ8Q9HqL32eE6wzdUtUMgS/XXI43MCpCITEf8qKT
 nLhw==
X-Gm-Message-State: AFqh2kp5fd9cx9LHfycTQRECxWTXex1a4+Ht4VQ6q+jj2phU9hSHeFqE
 89sEq7Q5xvUDGYo/g9uZnoyueXAM/lO2Hxs9
X-Google-Smtp-Source: AMrXdXskS1vy7ZK0laYyYHegfnaUmr44WbpUy50Pm645Q8j99sje4IUQ4FW5XR5Ey7HQZ09slwEniw==
X-Received: by 2002:a05:600c:34cd:b0:3d5:1175:92c3 with SMTP id
 d13-20020a05600c34cd00b003d5117592c3mr47919044wmq.23.1673339134408; 
 Tue, 10 Jan 2023 00:25:34 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 f7-20020a5d6647000000b002bbeb700c38sm5445555wrw.91.2023.01.10.00.25.33
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 10 Jan 2023 00:25:34 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>
Subject: [PATCH v2 5/5] hw/i2c/versatile_i2c: Rename versatile_i2c ->
 arm_sbcon_i2c
Date: Tue, 10 Jan 2023 09:25:08 +0100
Message-Id: <20230110082508.24038-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230110082508.24038-1-philmd@linaro.org>
References: <20230110082508.24038-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

This device model started with the Versatile board, named
TYPE_VERSATILE_I2C, then ended up renamed TYPE_ARM_SBCON_I2C
as per the official "ARM SBCon two-wire serial bus interface"
description from:
https://developer.arm.com/documentation/dui0440/b/programmer-s-reference/two-wire-serial-bus-interface--sbcon

Use the latter name as a better description.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 MAINTAINERS                                 |  1 +
 hw/arm/Kconfig                              |  4 ++--
 hw/i2c/Kconfig                              |  2 +-
 hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} | 24 ++++++++++-----------
 hw/i2c/meson.build                          |  2 +-
 5 files changed, 17 insertions(+), 16 deletions(-)
 rename hw/i2c/{versatile_i2c.c => arm_sbcon_i2c.c} (81%)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5606e5dbd2..e6bfce8fe2 100644
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
index 6e7340aaac..32ac30abae 100644
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


