Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DBA3F6699B3
	for <lists+qemu-devel@lfdr.de>; Fri, 13 Jan 2023 15:14:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pGKnS-0001li-P7; Fri, 13 Jan 2023 09:12:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKn2-0001G0-66
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:17 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pGKmj-0003qH-UY
 for qemu-devel@nongnu.org; Fri, 13 Jan 2023 09:12:04 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so17443400wms.2
 for <qemu-devel@nongnu.org>; Fri, 13 Jan 2023 06:11:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
 :reply-to; bh=tpD3Y/TLa5go/ZF5qsKJC0PbSMsoHaH/UgS/kvdff3s=;
 b=bh2brmQCKCsSD6PdNT/wVOAwSb4xYMc4wWiSaCmFXX+Cani3kZwd91NquQymRjWVE1
 bmnOSiVCxDuU5Cok3FMuL5GE7Ea5iKiHLKCOhnh/jFmzyxr8Aj/s13LSVcZymh6Ro8a/
 GOEcBU1XYyrv2jhhx/XK4Lo9+85bd7m9jaF1+V8fIEy4b1HvVXCIJ2G7SKwa+uNEt0ee
 W+cbwHc2qc/5wyr429jkbHp3+sgUjwOlsseASwbOHy+Xfk2U5zmwTnWukkyPGrt5W/SA
 bPqZs4+lZS3QCICNrqAPvlVLeaZxU5V1dbEy3E2V+7Efms0MiSd+TA8E5hMiJgnxpz2A
 QkWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tpD3Y/TLa5go/ZF5qsKJC0PbSMsoHaH/UgS/kvdff3s=;
 b=qo4ksTT2QCBZ4ibUGzIh4lkjRp3nUY5RP5wi5MIjhfhd06pCskmG62RW8q35dFq/q5
 CA9Odcof3NYRoEHA3k257tCaUtaL0qILhdrqGbO0JyeUW4VDWg3zXj1LwyR0YsRBm2rS
 ZbMTHUr7yMiCye3XxMhF+Cr0WooNRn91UCsuHD4ychwy1+XB5v4xuhd9ds48wM3V9xrM
 c9XXgRrFnIJhPZpPatfOnjrdjZozblD9UuEUmclOFfPUeuufkKAwGqmDABV0QVB7HiVl
 ppcQjlAYv7T5tFZjTc+pZVP9en07KoH0jJzRoJgGv8WduPkDRnAahy4rJqAgIiKSctsT
 984A==
X-Gm-Message-State: AFqh2kq8Eq/ToWmnCupeBEdoi1xDF9BqUbLnKpgkEVsY5WL8UkulwxCh
 raFTGNewySPGCAAB5aiEr++whXAZSFbbxfF/
X-Google-Smtp-Source: AMrXdXsx5EZnLclQjBUUaou/02AanLrSAx/P75MMRyMI6eye7Litg9IQ/+aQxlRabJMqEJ17T494Xw==
X-Received: by 2002:a05:600c:42d5:b0:3d6:e790:c9a0 with SMTP id
 j21-20020a05600c42d500b003d6e790c9a0mr69158614wme.10.1673619116227; 
 Fri, 13 Jan 2023 06:11:56 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 n36-20020a05600c502400b003da0b75de94sm5334464wmr.8.2023.01.13.06.11.55
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jan 2023 06:11:55 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 33/38] hw/arm/npcm7xx: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Fri, 13 Jan 2023 14:11:21 +0000
Message-Id: <20230113141126.535646-34-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230113141126.535646-1-peter.maydell@linaro.org>
References: <20230113141126.535646-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

NPCM7XX models have been commited after the conversion from
commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
Manually convert them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20230109140306.23161-11-philmd@linaro.org
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/adc/npcm7xx_adc.h   |  7 +++----
 include/hw/arm/npcm7xx.h       | 18 ++++++------------
 include/hw/i2c/npcm7xx_smbus.h |  7 +++----
 include/hw/misc/npcm7xx_clk.h  |  2 +-
 include/hw/misc/npcm7xx_gcr.h  |  6 +++---
 include/hw/misc/npcm7xx_mft.h  |  7 +++----
 include/hw/misc/npcm7xx_pwm.h  |  3 +--
 include/hw/misc/npcm7xx_rng.h  |  6 +++---
 include/hw/net/npcm7xx_emc.h   |  5 +----
 include/hw/sd/npcm7xx_sdhci.h  |  4 ++--
 10 files changed, 26 insertions(+), 39 deletions(-)

diff --git a/include/hw/adc/npcm7xx_adc.h b/include/hw/adc/npcm7xx_adc.h
index 7d8442107ae..93330a408d2 100644
--- a/include/hw/adc/npcm7xx_adc.h
+++ b/include/hw/adc/npcm7xx_adc.h
@@ -42,7 +42,7 @@
  * @iref: The internal reference voltage, initialized at launch time.
  * @rv: The calibrated output values of 0.5V and 1.5V for the ADC.
  */
-typedef struct {
+struct NPCM7xxADCState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -60,10 +60,9 @@ typedef struct {
     uint32_t     iref;
 
     uint16_t     calibration_r_values[NPCM7XX_ADC_NUM_CALIB];
-} NPCM7xxADCState;
+};
 
 #define TYPE_NPCM7XX_ADC "npcm7xx-adc"
-#define NPCM7XX_ADC(obj) \
-    OBJECT_CHECK(NPCM7xxADCState, (obj), TYPE_NPCM7XX_ADC)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxADCState, NPCM7XX_ADC)
 
 #endif /* NPCM7XX_ADC_H */
diff --git a/include/hw/arm/npcm7xx.h b/include/hw/arm/npcm7xx.h
index ce593235d94..f1b7e4a48d3 100644
--- a/include/hw/arm/npcm7xx.h
+++ b/include/hw/arm/npcm7xx.h
@@ -52,7 +52,7 @@
 
 #define NPCM7XX_NR_PWM_MODULES 2
 
-typedef struct NPCM7xxMachine {
+struct NPCM7xxMachine {
     MachineState        parent;
     /*
      * PWM fan splitter. each splitter connects to one PWM output and
@@ -60,11 +60,10 @@ typedef struct NPCM7xxMachine {
      */
     SplitIRQ            fan_splitter[NPCM7XX_NR_PWM_MODULES *
                                      NPCM7XX_PWM_PER_MODULE];
-} NPCM7xxMachine;
+};
 
 #define TYPE_NPCM7XX_MACHINE MACHINE_TYPE_NAME("npcm7xx")
-#define NPCM7XX_MACHINE(obj)                                            \
-    OBJECT_CHECK(NPCM7xxMachine, (obj), TYPE_NPCM7XX_MACHINE)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxMachine, NPCM7XX_MACHINE)
 
 typedef struct NPCM7xxMachineClass {
     MachineClass        parent;
@@ -77,7 +76,7 @@ typedef struct NPCM7xxMachineClass {
 #define NPCM7XX_MACHINE_GET_CLASS(obj)                                  \
     OBJECT_GET_CLASS(NPCM7xxMachineClass, (obj), TYPE_NPCM7XX_MACHINE)
 
-typedef struct NPCM7xxState {
+struct NPCM7xxState {
     DeviceState         parent;
 
     ARMCPU              cpu[NPCM7XX_MAX_NUM_CPUS];
@@ -105,10 +104,10 @@ typedef struct NPCM7xxState {
     NPCM7xxFIUState     fiu[2];
     NPCM7xxEMCState     emc[2];
     NPCM7xxSDHCIState   mmc;
-} NPCM7xxState;
+};
 
 #define TYPE_NPCM7XX    "npcm7xx"
-#define NPCM7XX(obj)    OBJECT_CHECK(NPCM7xxState, (obj), TYPE_NPCM7XX)
+OBJECT_DECLARE_TYPE(NPCM7xxState, NPCM7xxClass, NPCM7XX)
 
 #define TYPE_NPCM730    "npcm730"
 #define TYPE_NPCM750    "npcm750"
@@ -122,11 +121,6 @@ typedef struct NPCM7xxClass {
     uint32_t            num_cpus;
 } NPCM7xxClass;
 
-#define NPCM7XX_CLASS(klass)                                            \
-    OBJECT_CLASS_CHECK(NPCM7xxClass, (klass), TYPE_NPCM7XX)
-#define NPCM7XX_GET_CLASS(obj)                                          \
-    OBJECT_GET_CLASS(NPCM7xxClass, (obj), TYPE_NPCM7XX)
-
 /**
  * npcm7xx_load_kernel - Loads memory with everything needed to boot
  * @machine - The machine containing the SoC to be booted.
diff --git a/include/hw/i2c/npcm7xx_smbus.h b/include/hw/i2c/npcm7xx_smbus.h
index 7d59ee917eb..3555e6836fb 100644
--- a/include/hw/i2c/npcm7xx_smbus.h
+++ b/include/hw/i2c/npcm7xx_smbus.h
@@ -68,7 +68,7 @@ typedef enum NPCM7xxSMBusStatus {
  * @rx_cur: The current position of rx_fifo.
  * @status: The current status of the SMBus.
  */
-typedef struct NPCM7xxSMBusState {
+struct NPCM7xxSMBusState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -104,10 +104,9 @@ typedef struct NPCM7xxSMBusState {
     uint8_t      rx_cur;
 
     NPCM7xxSMBusStatus status;
-} NPCM7xxSMBusState;
+};
 
 #define TYPE_NPCM7XX_SMBUS "npcm7xx-smbus"
-#define NPCM7XX_SMBUS(obj) OBJECT_CHECK(NPCM7xxSMBusState, (obj), \
-                                        TYPE_NPCM7XX_SMBUS)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxSMBusState, NPCM7XX_SMBUS)
 
 #endif /* NPCM7XX_SMBUS_H */
diff --git a/include/hw/misc/npcm7xx_clk.h b/include/hw/misc/npcm7xx_clk.h
index d5c8d16ca42..5ed4a4672b3 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -175,6 +175,6 @@ struct NPCM7xxCLKState {
 };
 
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
-#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NPCM7XX_CLK)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
 #endif /* NPCM7XX_CLK_H */
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 9419e0a7d2a..c0bbdda77e5 100644
--- a/include/hw/misc/npcm7xx_gcr.h
+++ b/include/hw/misc/npcm7xx_gcr.h
@@ -55,7 +55,7 @@
  */
 #define NPCM7XX_GCR_NR_REGS (0x148 / sizeof(uint32_t))
 
-typedef struct NPCM7xxGCRState {
+struct NPCM7xxGCRState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -65,9 +65,9 @@ typedef struct NPCM7xxGCRState {
     uint32_t reset_pwron;
     uint32_t reset_mdlr;
     uint32_t reset_intcr3;
-} NPCM7xxGCRState;
+};
 
 #define TYPE_NPCM7XX_GCR "npcm7xx-gcr"
-#define NPCM7XX_GCR(obj) OBJECT_CHECK(NPCM7xxGCRState, (obj), TYPE_NPCM7XX_GCR)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxGCRState, NPCM7XX_GCR)
 
 #endif /* NPCM7XX_GCR_H */
diff --git a/include/hw/misc/npcm7xx_mft.h b/include/hw/misc/npcm7xx_mft.h
index 36785e3ba81..d6384382cea 100644
--- a/include/hw/misc/npcm7xx_mft.h
+++ b/include/hw/misc/npcm7xx_mft.h
@@ -49,7 +49,7 @@
  * @max_rpm: The maximum rpm for fans. Order: A0, B0, A1, B1.
  * @duty: The duty cycles for fans, relative to NPCM7XX_PWM_MAX_DUTY.
  */
-typedef struct NPCM7xxMFTState {
+struct NPCM7xxMFTState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -61,10 +61,9 @@ typedef struct NPCM7xxMFTState {
 
     uint32_t    max_rpm[NPCM7XX_MFT_FANIN_COUNT];
     uint32_t    duty[NPCM7XX_MFT_FANIN_COUNT];
-} NPCM7xxMFTState;
+};
 
 #define TYPE_NPCM7XX_MFT "npcm7xx-mft"
-#define NPCM7XX_MFT(obj) \
-    OBJECT_CHECK(NPCM7xxMFTState, (obj), TYPE_NPCM7XX_MFT)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxMFTState, NPCM7XX_MFT)
 
 #endif /* NPCM7XX_MFT_H */
diff --git a/include/hw/misc/npcm7xx_pwm.h b/include/hw/misc/npcm7xx_pwm.h
index 7ad632a93a1..bf953440acc 100644
--- a/include/hw/misc/npcm7xx_pwm.h
+++ b/include/hw/misc/npcm7xx_pwm.h
@@ -101,7 +101,6 @@ struct NPCM7xxPWMState {
 };
 
 #define TYPE_NPCM7XX_PWM "npcm7xx-pwm"
-#define NPCM7XX_PWM(obj) \
-    OBJECT_CHECK(NPCM7xxPWMState, (obj), TYPE_NPCM7XX_PWM)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxPWMState, NPCM7XX_PWM)
 
 #endif /* NPCM7XX_PWM_H */
diff --git a/include/hw/misc/npcm7xx_rng.h b/include/hw/misc/npcm7xx_rng.h
index 5e85fd439d8..650375dc2cd 100644
--- a/include/hw/misc/npcm7xx_rng.h
+++ b/include/hw/misc/npcm7xx_rng.h
@@ -18,7 +18,7 @@
 
 #include "hw/sysbus.h"
 
-typedef struct NPCM7xxRNGState {
+struct NPCM7xxRNGState {
     SysBusDevice parent;
 
     MemoryRegion iomem;
@@ -26,9 +26,9 @@ typedef struct NPCM7xxRNGState {
     uint8_t rngcs;
     uint8_t rngd;
     uint8_t rngmode;
-} NPCM7xxRNGState;
+};
 
 #define TYPE_NPCM7XX_RNG "npcm7xx-rng"
-#define NPCM7XX_RNG(obj) OBJECT_CHECK(NPCM7xxRNGState, (obj), TYPE_NPCM7XX_RNG)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxRNGState, NPCM7XX_RNG)
 
 #endif /* NPCM7XX_RNG_H */
diff --git a/include/hw/net/npcm7xx_emc.h b/include/hw/net/npcm7xx_emc.h
index eac7f298167..b789007160a 100644
--- a/include/hw/net/npcm7xx_emc.h
+++ b/include/hw/net/npcm7xx_emc.h
@@ -277,10 +277,7 @@ struct NPCM7xxEMCState {
     bool rx_active;
 };
 
-typedef struct NPCM7xxEMCState NPCM7xxEMCState;
-
 #define TYPE_NPCM7XX_EMC "npcm7xx-emc"
-#define NPCM7XX_EMC(obj) \
-    OBJECT_CHECK(NPCM7xxEMCState, (obj), TYPE_NPCM7XX_EMC)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxEMCState, NPCM7XX_EMC)
 
 #endif /* NPCM7XX_EMC_H */
diff --git a/include/hw/sd/npcm7xx_sdhci.h b/include/hw/sd/npcm7xx_sdhci.h
index d728f0a40de..ad8002f766d 100644
--- a/include/hw/sd/npcm7xx_sdhci.h
+++ b/include/hw/sd/npcm7xx_sdhci.h
@@ -51,7 +51,7 @@ typedef struct NPCM7xxRegs {
     uint32_t boottoctrl;
 } NPCM7xxRegisters;
 
-typedef struct NPCM7xxSDHCIState {
+struct NPCM7xxSDHCIState {
     SysBusDevice parent;
 
     MemoryRegion container;
@@ -60,6 +60,6 @@ typedef struct NPCM7xxSDHCIState {
     NPCM7xxRegisters regs;
 
     SDHCIState sdhci;
-} NPCM7xxSDHCIState;
+};
 
 #endif /* NPCM7XX_SDHCI_H */
-- 
2.34.1


