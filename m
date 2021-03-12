Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 06DB8338F8A
	for <lists+qemu-devel@lfdr.de>; Fri, 12 Mar 2021 15:12:40 +0100 (CET)
Received: from localhost ([::1]:45300 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lKiWs-00051k-WC
	for lists+qemu-devel@lfdr.de; Fri, 12 Mar 2021 09:12:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43950)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiDL-0003AQ-4u
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:27 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436]:37835)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lKiCx-00021r-KI
 for qemu-devel@nongnu.org; Fri, 12 Mar 2021 08:52:26 -0500
Received: by mail-wr1-x436.google.com with SMTP id x16so1820551wrn.4
 for <qemu-devel@nongnu.org>; Fri, 12 Mar 2021 05:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=UVxVIzW10UkvRJjjjhVol9+RVcohnyl43lJMNv50yXA=;
 b=N1DslPMevtXHEtafR+0BByPxDfOBMtCiDIOzLVyRw6XtKIBnvprZX2P95GTTwBMvJd
 V6B3xB9iwoTDsEJ6wzmclBLUrjiilvpw0pWc4ERAYxhYA9XvMezHNSlcfkUNjtEqyCdQ
 ZBCpwUz+lOUS8nA3JpoMG6GMKQdjC7ngeVeFkr7MDKsJy3QjAjyY5x0thG6M5JoeA973
 OutBcxZrYCJiUpjmuXebQ5NDafedIkmzzPuhuKF/Hyxe0aOmS59lUplaLJ5Emg/kr4+j
 eDduOpCWhzW1/5RWsY4sQ8kGDLPQn+0uyMrP/Rj23jNHnzmZRKlUm3W10mIyQp44EWly
 r8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UVxVIzW10UkvRJjjjhVol9+RVcohnyl43lJMNv50yXA=;
 b=h6f+GLR4A32KSyBG4Ad50BbAxj/SSffHRN9CAvdSWhNr4+cc88bRlxhTNN9aWXYso2
 orV+6iBUr9mDAJebCVF6UC9rniT199C11tjf+W5QxfTBn/VAALjFXwxO8LWZjKKZzhoS
 uKY7KMYFbcgo7SV6HunP9K8eQchyCO6mqbk50PZWd8Yt1+qAO12UJGmWV4rNSGqXUokE
 PFBPVvQZXxzzrD7yGXkdG4Kqzgjofi5LFalE8jwcSzsVU/nxMlg3dc7DIXMs0lRUZkGG
 lTUWFPhHxiYDUJX2N3mvadt1GW0qF+PQuT4y74BveC/gYsgfBwsZpz2J1rB6T7Uq3nLF
 dqxQ==
X-Gm-Message-State: AOAM533AsJb0loaiVNfICIw6nF/cpbA2f11fnz57RAAycmVMAUUpYkrz
 uDUKCpiuDOTFNM0BVJLLEjkFWOjHau4cvYkW
X-Google-Smtp-Source: ABdhPJwypN6NFwazKIvggYfE3CyNKDPeWs3s8BMylIlCAKLKoRMwST2ymMovFyZaDBHPc27vDvHtKw==
X-Received: by 2002:adf:a4d0:: with SMTP id h16mr14017372wrb.52.1615557122078; 
 Fri, 12 Mar 2021 05:52:02 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id m6sm7964994wrv.73.2021.03.12.05.52.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 12 Mar 2021 05:52:01 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 28/39] hw/arm: Add MFT device to NPCM7xx Soc
Date: Fri, 12 Mar 2021 13:51:29 +0000
Message-Id: <20210312135140.1099-29-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210312135140.1099-1-peter.maydell@linaro.org>
References: <20210312135140.1099-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

This patch adds the recently implemented MFT device to the NPCM7XX
SoC file.

Reviewed-by: Doug Evans <dje@google.com>
Reviewed-by: Tyrone Ting <kfting@nuvoton.com>
Signed-off-by: Hao Wu <wuhaotsh@google.com>
Message-id: 20210311180855.149764-4-wuhaotsh@google.com
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 docs/system/arm/nuvoton.rst |  2 +-
 include/hw/arm/npcm7xx.h    |  2 ++
 hw/arm/npcm7xx.c            | 45 ++++++++++++++++++++++++++++++-------
 3 files changed, 40 insertions(+), 9 deletions(-)

diff --git a/docs/system/arm/nuvoton.rst b/docs/system/arm/nuvoton.rst
index f9fb9224da9..d3cf2d9cd7e 100644
--- a/docs/system/arm/nuvoton.rst
+++ b/docs/system/arm/nuvoton.rst
@@ -45,6 +45,7 @@ Supported devices
  * Pulse Width Modulation (PWM)
  * SMBus controller (SMBF)
  * Ethernet controller (EMC)
+ * Tachometer
 
 Missing devices
 ---------------
@@ -63,7 +64,6 @@ Missing devices
  * Peripheral SPI controller (PSPI)
  * SD/MMC host
  * PECI interface
- * Tachometer
  * PCI and PCIe root complex and bridges
  * VDM and MCTP support
  * Serial I/O expansion
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index d32849a456b..3f70554d0f6 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -24,6 +24,7 @@
 #include "hw/mem/npcm7xx_mc.h"
 #include "hw/misc/npcm7xx_clk.h"
 #include "hw/misc/npcm7xx_gcr.h"
+#include "hw/misc/npcm7xx_mft.h"
 #include "hw/misc/npcm7xx_pwm.h"
 #include "hw/misc/npcm7xx_rng.h"
 #include "hw/net/npcm7xx_emc.h"
@@ -82,6 +83,7 @@ typedef struct NPCM7xxState {
     NPCM7xxTimerCtrlState tim[3];
     NPCM7xxADCState     adc;
     NPCM7xxPWMState     pwm[2];
+    NPCM7xxMFTState     mft[8];
     NPCM7xxOTPState     key_storage;
     NPCM7xxOTPState     fuse_array;
     NPCM7xxMCState      mc;
diff --git a/hw/arm/npcm7xx.c b/hw/arm/npcm7xx.c
index 9bd1e83f021..495b0f8e91d 100644
--- a/hw/arm/npcm7xx.c
+++ b/hw/arm/npcm7xx.c
@@ -122,6 +122,14 @@ enum NPCM7xxInterrupt {
     NPCM7XX_SMBUS15_IRQ,
     NPCM7XX_PWM0_IRQ            = 93,   /* PWM module 0 */
     NPCM7XX_PWM1_IRQ,                   /* PWM module 1 */
+    NPCM7XX_MFT0_IRQ            = 96,   /* MFT module 0 */
+    NPCM7XX_MFT1_IRQ,                   /* MFT module 1 */
+    NPCM7XX_MFT2_IRQ,                   /* MFT module 2 */
+    NPCM7XX_MFT3_IRQ,                   /* MFT module 3 */
+    NPCM7XX_MFT4_IRQ,                   /* MFT module 4 */
+    NPCM7XX_MFT5_IRQ,                   /* MFT module 5 */
+    NPCM7XX_MFT6_IRQ,                   /* MFT module 6 */
+    NPCM7XX_MFT7_IRQ,                   /* MFT module 7 */
     NPCM7XX_EMC2RX_IRQ          = 114,
     NPCM7XX_EMC2TX_IRQ,
     NPCM7XX_GPIO0_IRQ           = 116,
@@ -172,6 +180,18 @@ static const hwaddr npcm7xx_pwm_addr[] = {
     0xf0104000,
 };
 
+/* Register base address for each MFT Module */
+static const hwaddr npcm7xx_mft_addr[] = {
+    0xf0180000,
+    0xf0181000,
+    0xf0182000,
+    0xf0183000,
+    0xf0184000,
+    0xf0185000,
+    0xf0186000,
+    0xf0187000,
+};
+
 /* Direct memory-mapped access to each SMBus Module. */
 static const hwaddr npcm7xx_smbus_addr[] = {
     0xf0080000,
@@ -417,6 +437,10 @@ static void npcm7xx_init(Object *obj)
         object_initialize_child(obj, "pwm[*]", &s->pwm[i], TYPE_NPCM7XX_PWM);
     }
 
+    for (i = 0; i < ARRAY_SIZE(s->mft); i++) {
+        object_initialize_child(obj, "mft[*]", &s->mft[i], TYPE_NPCM7XX_MFT);
+    }
+
     for (i = 0; i < ARRAY_SIZE(s->emc); i++) {
         object_initialize_child(obj, "emc[*]", &s->emc[i], TYPE_NPCM7XX_EMC);
     }
@@ -603,6 +627,19 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(sbd, i, npcm7xx_irq(s, NPCM7XX_PWM0_IRQ + i));
     }
 
+    /* MFT Modules. Cannot fail. */
+    QEMU_BUILD_BUG_ON(ARRAY_SIZE(npcm7xx_mft_addr) != ARRAY_SIZE(s->mft));
+    for (i = 0; i < ARRAY_SIZE(s->mft); i++) {
+        SysBusDevice *sbd = SYS_BUS_DEVICE(&s->mft[i]);
+
+        qdev_connect_clock_in(DEVICE(&s->mft[i]), "clock-in",
+                              qdev_get_clock_out(DEVICE(&s->clk),
+                                                 "apb4-clock"));
+        sysbus_realize(sbd, &error_abort);
+        sysbus_mmio_map(sbd, 0, npcm7xx_mft_addr[i]);
+        sysbus_connect_irq(sbd, 0, npcm7xx_irq(s, NPCM7XX_MFT0_IRQ + i));
+    }
+
     /*
      * EMC Modules. Cannot fail.
      * The mapping of the device to its netdev backend works as follows:
@@ -680,14 +717,6 @@ static void npcm7xx_realize(DeviceState *dev, Error **errp)
     create_unimplemented_device("npcm7xx.peci",         0xf0100000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[1]",      0xf0101000,   4 * KiB);
     create_unimplemented_device("npcm7xx.siox[2]",      0xf0102000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[0]",       0xf0180000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[1]",       0xf0181000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[2]",       0xf0182000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[3]",       0xf0183000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[4]",       0xf0184000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[5]",       0xf0185000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[6]",       0xf0186000,   4 * KiB);
-    create_unimplemented_device("npcm7xx.mft[7]",       0xf0187000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pspi1",        0xf0200000,   4 * KiB);
     create_unimplemented_device("npcm7xx.pspi2",        0xf0201000,   4 * KiB);
     create_unimplemented_device("npcm7xx.ahbpci",       0xf0400000,   1 * MiB);
-- 
2.20.1


