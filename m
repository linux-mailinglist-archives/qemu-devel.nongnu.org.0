Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D6DC266285F
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 15:24:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEsl5-0001n5-8g; Mon, 09 Jan 2023 09:04:20 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskt-0001kp-7E
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:03 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEskq-0006hz-5Y
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 09:04:02 -0500
Received: by mail-wr1-x42d.google.com with SMTP id r2so8260436wrv.7
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 06:03:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jRUzznDEJ6kakLGhAZbOD3VcgJyHcfc9OyelkV2R1Lo=;
 b=btg5pIBALEQkmXYpw+Da8lJr1eqx6tfYB483fUP1sWx6tDNgT6PQYsbvF45VBe5Uxb
 M+6VWwqOt2OlEFv+Ex70/SG7a1EcwXexXH6UCEtV9UDoBW3/9W0t4IRXvAvqakkCW1nS
 fC1e3EitWwSWiksNyy1HSvg5a3x2btKolUaJrskyvOcmaTFwQrKVVq3x3MUaGjvMmci+
 M5/+wFUCVkJj2/+rgC1D+m0bovO6W2dQ9e40tqNclSKi/uEMzUS8BN4HpOHLWp23PL97
 rP32aEEjUaxfR8h4Ckd0pmlvVu1YJZ4zkiMNygmNr4Mg7/96Or5xOjPB/Mqy4W3spx+a
 Wt0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jRUzznDEJ6kakLGhAZbOD3VcgJyHcfc9OyelkV2R1Lo=;
 b=quOyASP+1R8Y4DcASoa1gqR1EJ/mCjjFd6qC13vzwzgWXaZNe8pbiX3qzSLGRddNai
 EqzFh25ESks1J0U0WXnVscqJcLxKOOflT3BN4VtPqvgCWwJacuYzTr3Ugt9ONgPa6q5G
 zF02HlQ47NenayRSP+JjvWMB1ODfB7KxisY64Nob49gi8NSaVILSNMD81FfwsYMh/IfM
 A/iwZVx8I9GnLzhvKl5z6A6HtyfAekIkmQdahF+o/lpBrcAHImROmyafybWTvLMHHl34
 qTo5Zm6Wf9qIeCs2TTyeQQICWwdExlkeWn6bNrUusVop+H8tdmDCCtS1l0GaUYT1B8AX
 j8QQ==
X-Gm-Message-State: AFqh2kqpeKpyoHGHv4VhUELcFs9U7q+ieSkr2YpfV0rIQsrmbFpG52S9
 iYKh4iNT2diuqRgGpMDpQL+ndGZR1YXctHOJ
X-Google-Smtp-Source: AMrXdXvXIci2Nebp9sTQBcgHakGkw8hWZbQOiWpYWekspDWyRO1YXwK8IM8eeZ9zph8OSHYHTHLSDQ==
X-Received: by 2002:a05:6000:4087:b0:2bb:db44:7994 with SMTP id
 da7-20020a056000408700b002bbdb447994mr5279890wrb.28.1673273038349; 
 Mon, 09 Jan 2023 06:03:58 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 k2-20020a5d5182000000b00236545edc91sm8761504wrv.76.2023.01.09.06.03.57
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 06:03:58 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Havard Skinnemoen <hskinnemoen@google.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>, Tyrone Ting <kfting@nuvoton.com>
Subject: [PATCH 10/14] hw/arm/npcm7xx: Declare QOM macros using
 OBJECT_DECLARE_SIMPLE_TYPE()
Date: Mon,  9 Jan 2023 15:03:02 +0100
Message-Id: <20230109140306.23161-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109140306.23161-1-philmd@linaro.org>
References: <20230109140306.23161-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42d.google.com
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

NPCM7XX models have been commited after the conversion from
commit 8063396bf3 ("Use OBJECT_DECLARE_SIMPLE_TYPE when possible").
Manually convert them.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
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
index 7d8442107a..93330a408d 100644
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
index ce593235d9..f1b7e4a48d 100644
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
index 7d59ee917e..3555e6836f 100644
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
index d5c8d16ca4..5ed4a4672b 100644
--- a/include/hw/misc/npcm7xx_clk.h
+++ b/include/hw/misc/npcm7xx_clk.h
@@ -175,6 +175,6 @@ struct NPCM7xxCLKState {
 };
 
 #define TYPE_NPCM7XX_CLK "npcm7xx-clk"
-#define NPCM7XX_CLK(obj) OBJECT_CHECK(NPCM7xxCLKState, (obj), TYPE_NPCM7XX_CLK)
+OBJECT_DECLARE_SIMPLE_TYPE(NPCM7xxCLKState, NPCM7XX_CLK)
 
 #endif /* NPCM7XX_CLK_H */
diff --git a/include/hw/misc/npcm7xx_gcr.h b/include/hw/misc/npcm7xx_gcr.h
index 9419e0a7d2..c0bbdda77e 100644
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
index 36785e3ba8..d6384382ce 100644
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
index 7ad632a93a..bf953440ac 100644
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
index 5e85fd439d..650375dc2c 100644
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
index eac7f29816..b789007160 100644
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
index d728f0a40d..ad8002f766 100644
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
2.38.1


