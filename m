Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9054631CE68
	for <lists+qemu-devel@lfdr.de>; Tue, 16 Feb 2021 17:50:33 +0100 (CET)
Received: from localhost ([::1]:51686 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lC3YW-00017Q-93
	for lists+qemu-devel@lfdr.de; Tue, 16 Feb 2021 11:50:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40976)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC33Q-0000Vs-MY
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:24 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329]:38554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lC32Z-0002ZB-5A
 for qemu-devel@nongnu.org; Tue, 16 Feb 2021 11:18:24 -0500
Received: by mail-wm1-x329.google.com with SMTP id x4so15010489wmi.3
 for <qemu-devel@nongnu.org>; Tue, 16 Feb 2021 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=7++HAIPf+kBQsOI8XyUWZnHk1HqjunJMxoWabmHNDsM=;
 b=be0rTGXjg7/DcttXy8vPzaTGzJ/cBQDN3KeIoOcCyK4ercsMkZcjLha98PSLFVB0gM
 qM8B2Iwtg5M4G9YAswhH3yiivvQsJ225eZkvJHfV68n56ZzGTygiMsP145kjdBbTKRx3
 +nqDLsjhZe5lEmF3OiPxlE00h6QrHd1neE2nQ0Z1i9bw7KES+aMUkZ/P0/NTnRpJ5Uos
 apAZdZgFLVAXSt1Xh+q472EbCQgDSaGxe9U5VCNovsS/9SExqb9wkus1WzBVrYges72P
 tTWjqnrBOQx/gPBNE6fVqf0AKvBIEs5FlTUJonCx21jLOCAPdmU+x0lJSd7m48xLAP8q
 wz4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7++HAIPf+kBQsOI8XyUWZnHk1HqjunJMxoWabmHNDsM=;
 b=kM7i5RLi5REktIkdnR7cd/TmL7TufD/sMQ/odE770ocBvZCfjeFAtaYO/Oit0lXtC3
 JrTRKy6sRaH15aNDkjx+C4cGno2mD1XFVZcYLYxGu+f2jm2X5ESWhJPalUb+ofFkupT9
 +t0x6Nq6tBME3EY7DZy7CORBa7hyp+YI4AowvnoZXllGSb40Q/g+LJA3CE8FoOXmFiOV
 Sg+tA2yloxygJyPZULhHFNdTQqa04R5MraKhH49n5n4pX5U8Emv/c2tN7WkLAujtMIBZ
 mNBcl41WrZLCTr5t1iRSuLJfJ5B+hZQqbDsAX5pbI0tg2lwJ1ZZIyeE4CoygI0ulPTJ2
 q4Ww==
X-Gm-Message-State: AOAM533TrltG0s5bYOAWGbZzgIwCI3UyRmCpb+2aNnJ1Jpqs3gC4KnsT
 AZ9hnpqo4Zbnm72gWB16WDcGutJrQIZAJA==
X-Google-Smtp-Source: ABdhPJztEADRee3qGLH2v0sc/KxF+BQVXS9lzjVNtPVlrQOvmOVph/f2fnhUHt3l5aowT7hK7e2JCA==
X-Received: by 2002:a1c:28c1:: with SMTP id o184mr3713315wmo.183.1613492249522; 
 Tue, 16 Feb 2021 08:17:29 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id d5sm30630482wrb.14.2021.02.16.08.17.28
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Feb 2021 08:17:29 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 39/40] hw/arm: Add npcm7xx emc model
Date: Tue, 16 Feb 2021 16:16:57 +0000
Message-Id: <20210216161658.29881-40-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210216161658.29881-1-peter.maydell@linaro.org>
References: <20210216161658.29881-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x329.google.com
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

From: Doug Evans <dje@google.com>

This is a 10/100 ethernet device that has several features.
Only the ones needed by the Linux driver have been implemented.
See npcm7xx_emc.c for a list of unimplemented features.

Reviewed-by: Hao Wu <wuhaotsh@google.com>
Reviewed-by: Avi Fishman <avi.fishman@nuvoton.com>
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Doug Evans <dje@google.com>
Message-id: 20210213002520.1374134-3-dje@google.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst |  3 ++-
 include/hw/arm/npcm7xx.h    |  2 ++
 hw/arm/npcm7xx.c            | 50 +++++++++++++++++++++++++++++++++++--
 3 files changed, 52 insertions(+), 3 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index 34fc799b2df..f9fb9224da9 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -44,6 +44,7 @@ Supported devices
  * Analog to Digital Converter (ADC)
  * Pulse Width Modulation (PWM)
  * SMBus controller (SMBF)
+ * Ethernet controller (EMC)
 
 Missing devices
 ---------------
@@ -57,7 +58,7 @@ Missing devices
    * Shared memory (SHM)
    * eSPI slave interface
 
- * Ethernet controllers (GMAC and EMC)
+ * Ethernet controller (GMAC)
  * USB device (USBD)
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index cea1bd1f620..d32849a456b 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -26,6 +26,7 @@
 #include "hw/misc/npcm7xx_gcr.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
+#include "hw/net/npcm7xx_emc.h"
 #include "hw/nvram/npcm7xx_otp.h"
 #include "hw/timer/npcm7xx_timer.h"
 #include "hw/ssi/npcm7xx_fiu.h"
@@ -90,6 +91,7 @@ typedef struct NPCM7xxState {
     EHCISysBusState     ehci;
     OHCISysBusState     ohci;
     NPCM7xxFIUState     fiu[2];
+    NPCM7xxEMCState     emc[2];
 } NPCM7xxState;
 
 #define TYPE_NPCM7XX    "npcm7xx"
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index f8950f94708..9bd1e83f021 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -82,6 +82,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_UART1_IRQ,
     NPCM7XX_UART2_IRQ,
     NPCM7XX_UART3_IRQ,
+    NPCM7XX_EMC1RX_IRQ          = 15,
+    NPCM7XX_EMC1TX_IRQ,
     NPCM7XX_TIMER0_IRQ          = 32,   /* Timer Module 0 */
     NPCM7XX_TIMER1_IRQ,
     NPCM7XX_TIMER2_IRQ,
@@ -120,6 +122,8 @@ enum NPCM7xxInterrupt {
     NPCM7XX_SMBUS15_IRQ,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
+    NPCM7XX_EMC2RX_IRQ          = 114,
+    NPCM7XX_EMC2TX_IRQ,
     NPCM7XX_GPIO0_IRQ           = 116,
     NPCM7XX_GPIO1_IRQ,
     NPCM7XX_GPIO2_IRQ,
@@ -188,6 +192,12 @@ static const hwaddr npcm7xx_smbus_addr[] = {
     0xf008f000,
 };
 
+/* Register base address for each EMC Module */
+static const hwaddr npcm7xx_emc_addr[] = {
+    0xf0825000,
+    0xf0826000,
+};
+
 static const struct {
     hwaddr regs_addr;
     uint32_t unconnected_pins;
@@ -406,6 +416,10 @@ static void npcm7xx_init(Object *obj)
     for (i = 0; i < ARRAY_SIZE(s->pwm); i++) {
         object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
+        object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
+    }
 }
 
 static void npcm7xx_realize(DeviceState *dev, Error **errp)
@@ -589,6 +603,40 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
     }
 
+    /*
+     * EMC Modules. Cannot fail.
+     * The mapping of the device to its netdev backend works as follows:
+     * emc[i] = nd_table[i]
+     * This works around the inability to specify the netdev property for the
+     * emc device: it's not pluggable and thus the -device option can't be
+     * used.
+     */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_emc_addr) != ARRAY_SIZE(s->emc));
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(s->emc) != 2);
+    for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
+        s->emc[i].emc_num = i;
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->emc[i]);
+        if (nd_table[i].used) {
+            qemu_check_nic_model(&nd_table[i], TYPE_NPCM7XX_EMC);
+            qdev_set_nic_properties(DEVICE(sbd), &nd_table[i]);
+        }
+        /*
+         * The device exists regardless of whether it's connected to a QEMU
+         * netdev backend. So always instantiate it even if there is no
+         * backend.
+         */
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_emc_addr[i]);
+        int tx_irq = i == 0 ? NPCM7XX_EMC1TX_IRQ : NPCM7XX_EMC2TX_IRQ;
+        int rx_irq = i == 0 ? NPCM7XX_EMC1RX_IRQ : NPCM7XX_EMC2RX_IRQ;
+        /*
+         * N.B. The values for the second argument sysbus_connect_irq are
+         * chosen to match the registration order in npcm7xx_emc_realize.
+         */
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, tx_irq));
+        sysbus_connect_irq(sbd, 1, npcm7xx_irq(s, rx_irq));
+    }
+
     /*
      * Flash Interface Unit (FIU). Can fail if incorrect number of chip selects
      * specified, but this is a programming error.
@@ -649,8 +697,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.vcd",          0xf0810000,  64 * KiB);
     create_unimplemented_device("npcm7xx.ece",          0xf0820000,   8 * KiB);
     create_unimplemented_device("npcm7xx.vdma",         0xf0822000,   8 * KiB);
-    create_unimplemented_device("npcm7xx.emc1",         0xf0825000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.emc2",         0xf0826000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[0]",      0xf0830000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[1]",      0xf0831000,   4 * KiB);
     create_unimplemented_device("npcm7xx.usbd[2]",      0xf0832000,   4 * KiB);
-- 
2.20.1


