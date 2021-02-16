Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 89FCD31CE3A
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:41:10 +0100 (CET)
Received: from localhost ([::1]:58724 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3PR-0000FN-4Q
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:41:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40852)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC33D-0000H1-Uv
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:13 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:40443)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32U-0002XO-Ce
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:09 -0500
Received: by mail-wr1-x42b.google.com with SMTP id v14so13773608wro.7
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=0UrAqxs2CL5jokH0yLA3JrB6tz+n6Z0MaeUkxlhcczE=;
 b=L64zyvdwvDOnH5Se4CNDj6I7lec/kyDnch2e/M1oukXU+uyJIwIuuPXgj1mMs2qspK
 bLSJ8eYr3Dl9A5ZbnpHmFw0p/vKrvX+V2vNNawIXdr/CU+lIVPh6vi6i3MNPtx3qPiPt
 McwMjmnoQ47PwxvUuWivNi/lKa6VbOKdM6AEAQX9TISkaRudWS/y1662360FGm8fquLf
 X4/+p+oAZ6EVn1a0QkWPqH9uO2afjrEgUOuRV2O8K0y1oSjSJZPsqKiEcGBa3hM2tmSt
 X3zDY8czrZHQy4QC4bcIXhnFT+sRe8lbdR6O/6lEj7bF2H2Iezn5OA5VEQsjOnLb3Zpe
 1QLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0UrAqxs2CL5jokH0yLA3JrB6tz+n6Z0MaeUkxlhcczE=;
 b=rh5AGAsqQV3WyWSCr13DQecLZO2DRhY13CLxo1o1HF207Eooa5fkM6AS3DU5eMK8D9
 Bz4T1PBS99aznXKrEu1WkzF1oY9YX1bEpbtDZFcJEDQXfdAIlgMuH3sLDYaepDHJhYIy
 K7pmFdttEUhpdEhepWKaiL407AOWxk38jfiiGWyEQAK1D/BjZy8LCInaSCled2OZj0Z3
 iP7dEbB1tyspVRGLO9Ka6e4OosJaxrYcwIVOV+6MUmvHDNhyi8OVSWCIaIqM33JwBszK
 A/IjFrDvcyGXAIY23mJycNm84uhjxiTcGqvr79Lt+TAL8lIg4yE5wIX9TKyU2OffdMNO
 E0Rw==
X-Gm-Message-State: AOAM53077EH3S+9yStNVT1jl7ObJ5GVDKyoDbxTK+xUFrRG8g9TvDIRR
 UCSmLX5wbaaXbDvhKcSOrfak2wB++IlY4g==
X-Google-Smtp-Source: ABdhPJytiIuxr/FWY/lkv4WMKYjAt8PVnEtGpz9x6tU1pMKrqp9XlK5FbScyUb/E1yNTdLfM1Dnu9A==
X-Received: by 2002:a05:6000:1547:: with SMTP id
 7mr24697509wry.301.1613492244903; 
 Tue, 16 Feb 2021 08:17:24 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:24 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 34/40] hw/arm: Add I2C sensors and EEPROM for GSJ machine
Date: Tue, 16 Feb 2021 16:16:52 +0000
Message-Id: <20210216161658.29881-35-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

From: Hao Wu <wuhaotsh@google.com>

Add AT24 EEPROM and temperature sensors for GSJ machine.

Reviewed-by: Doug Evans<dje@google.com>
Reviewed-by: Tyrong Ting<kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210210220426.3577804-4-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/npcm7xx_boards.c | 27 +++++++++++++++++++++++++++
 hw/arm/Kconfig          |  1 +
 2 files changed, 28 insertions(+)

diff --git a/hw/arm/npcm7xx_boards.c b/hw/arm/npcm7xx_boards.c
index 47a215bd015..fbf6ce8e028 100644
--- a/hw/arm/npcm7xx_boards.c
+++ b/hw/arm/npcm7xx_boards.c
@@ -19,6 +19,7 @@
 #include "exec/address-spaces.h"
 #include "hw/arm/npcm7xx.h"
 #include "hw/core/cpu.h"
+#include "hw/i2c/smbus_eeprom.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
 #include "qapi/error.h"
@@ -104,6 +105,17 @@ static I2CBus *npcm7xx_i2c_get_bus(NPCM7xxState *soc, uint32_t num)
     return I2C_BUS(qdev_get_child_bus(DEVICE(&soc->smbus[num]), "i2c-bus"));
 }
 
+static void at24c_eeprom_init(NPCM7xxState *soc, int bus, uint8_t addr,
+                              uint32_t rsize)
+{
+    I2CBus *i2c_bus = npcm7xx_i2c_get_bus(soc, bus);
+    I2CSlave *i2c_dev = i2c_slave_new("at24c-eeprom", addr);
+    DeviceState *dev = DEVICE(i2c_dev);
+
+    qdev_prop_set_uint32(dev, "rom-size", rsize);
+    i2c_slave_realize_and_unref(i2c_dev, i2c_bus, &error_abort);
+}
+
 static void npcm750_evb_i2c_init(NPCM7xxState *soc)
 {
     /* lm75 temperature sensor on SVB, tmp105 is compatible */
@@ -116,6 +128,20 @@ static void npcm750_evb_i2c_init(NPCM7xxState *soc)
     i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 6), "tmp105", 0x48);
 }
 
+static void quanta_gsj_i2c_init(NPCM7xxState *soc)
+{
+    /* GSJ machine have 4 max31725 temperature sensors, tmp105 is compatible. */
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 1), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 2), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 3), "tmp105", 0x5c);
+    i2c_slave_create_simple(npcm7xx_i2c_get_bus(soc, 4), "tmp105", 0x5c);
+
+    at24c_eeprom_init(soc, 9, 0x55, 8192);
+    at24c_eeprom_init(soc, 10, 0x55, 8192);
+
+    /* TODO: Add additional i2c devices. */
+}
+
 static void npcm750_evb_init(MachineState *machine)
 {
     NPCM7xxState *soc;
@@ -141,6 +167,7 @@ static void quanta_gsj_init(MachineState *machine)
     npcm7xx_load_bootrom(machine, soc);
     npcm7xx_connect_flash(&soc->fiu[0], 0, "mx25l25635e",
                           drive_get(IF_MTD, 0, 0));
+    quanta_gsj_i2c_init(soc);
     npcm7xx_load_kernel(machine, soc);
 }
 
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index be017b997ab..4e6f4ffe90c 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -370,6 +370,7 @@ config NPCM7XX
     bool
     select A9MPCORE
     select ARM_GIC
+    select AT24C  # EEPROM
     select PL310  # cache controller
     select SERIAL
     select SSI
-- 
2.20.1


