Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F0B31FBF1
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Feb 2021 16:27:41 +0100 (CET)
Received: from localhost ([::1]:43076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lD7gy-0007YR-TE
	for lists+qemu-devel@lfdr.de; Fri, 19 Feb 2021 10:27:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34466)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD746-0002x0-Sv
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:30 -0500
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c]:35873)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lD73U-0003h0-NJ
 for qemu-devel@nongnu.org; Fri, 19 Feb 2021 09:47:30 -0500
Received: by mail-wm1-x32c.google.com with SMTP id a207so7911423wmd.1
 for <qemu-devel@nongnu.org>; Fri, 19 Feb 2021 06:46:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=cLMZo6jufPdvkgmcFJXx7AYUcA7XP1lsTzcJqm42xg4=;
 b=XBO+MWbQ243Bfa4AHVjedLMF53Bkvn/dKcAVB48kXkmSGDZdQZIHzT5FPRaKhvMi02
 BgovK9WJkxVvNa1n303PLM6+RIp+D399VLbOIqi3NlqC6vIQ9UxmKc8gJxv7fQ7Kxhsb
 OtyPkbc86xdjYLu2IuuW4JX4UKM7oV7Hgxk2fXqDuHWhe/B4iz6zjoWb2SVEVOTP20G7
 R2PV7Hv+cRM7BqhRudhDZObbdX8Gsj8a2DXHC5hLT3Ml+rQ5j8gn0OOJLz+0jIEdIQiU
 8OKxLjGxaA0eCVueZK9wqL9JkOxQHzgBAX8MYmx1q9ZzUoKBQPxzMhsW8UMuXPOkc2zT
 yxtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cLMZo6jufPdvkgmcFJXx7AYUcA7XP1lsTzcJqm42xg4=;
 b=ZPTGz61nZZnSLmfLGLWV+xup5K/xg/Jh3kxcQNL5FWHEze9f2nSSbHyGYLFK4PNeSc
 69jq8Gm3TXjyt3xTtw6Vju+Mu1pRzYpKVIMwCTibCuwIvyoG02yfZCmXXFWH3gl3/RjU
 nTNTrSO+0MO14tHSuXPjlvYGtTVD9/RsauZAMSr6zICBaCmO/AFASPz/fXff4Oz8vPQX
 G7wHHZFsk2in4UIKRbrn5PX9L6ONiukRulQS3q8Cf44bGvPp6zSjeeEQE3rf4LCBsxzl
 6QLZ5RfiuH88w1bzlMaxLQ/l6SPHKckip87I/mcg26MDJ7OuPsaPB0X++RAORDK6fL+L
 +hHg==
X-Gm-Message-State: AOAM531SEhxoLu0uSKBOhRib5KMC5Z9fLBMVQJhb70b1/5faG4oR1FSR
 qe0eQS2jRVnSZIRHo/ja/KBHHA==
X-Google-Smtp-Source: ABdhPJz8PV6gF9AdZNwwDclGwWFJYe5l+i2Zl7QSH7KtfmN9YafhyGu0ImpZWPlgNPMkfPJ7vVH+mQ==
X-Received: by 2002:a05:600c:4fd0:: with SMTP id
 o16mr7671589wmq.77.1613746011437; 
 Fri, 19 Feb 2021 06:46:51 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id q18sm2263628wrw.91.2021.02.19.06.46.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 06:46:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 42/44] hw/arm/mps2-tz: Add new mps3-an547 board
Date: Fri, 19 Feb 2021 14:46:15 +0000
Message-Id: <20210219144617.4782-43-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210219144617.4782-1-peter.maydell@linaro.org>
References: <20210219144617.4782-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x32c.google.com
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

Add support for the mps3-an547 board; this is an SSE-300 based
FPGA image that runs on the MPS3.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/mps2-tz.c | 146 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 144 insertions(+), 2 deletions(-)

diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
index bb72f78fb55..a1f43555013 100644
--- a/hw/arm/mps2-tz.c
+++ b/hw/arm/mps2-tz.c
@@ -17,6 +17,7 @@
  *  "mps2-an505" -- Cortex-M33 as documented in ARM Application Note AN505
  *  "mps2-an521" -- Dual Cortex-M33 as documented in Application Note AN521
  *  "mps2-an524" -- Dual Cortex-M33 as documented in Application Note AN524
+ *  "mps2-an547" -- Single Cortex-M55 as documented in Application Note AN547
  *
  * Links to the TRM for the board itself and to the various Application
  * Notes which document the FPGA images can be found here:
@@ -30,6 +31,8 @@
  * https://developer.arm.com/documentation/dai0521/latest/
  * Application Note AN524:
  * https://developer.arm.com/documentation/dai0524/latest/
+ * Application Note AN547:
+ * https://developer.arm.com/-/media/Arm%20Developer%20Community/PDF/DAI0547B_SSE300_PLUS_U55_FPGA_for_mps3.pdf
  *
  * The AN505 defers to the Cortex-M33 processor ARMv8M IoT Kit FVP User Guide
  * (ARM ECM0601256) for the details of some of the device layout:
@@ -37,6 +40,8 @@
  * Similarly, the AN521 and AN524 use the SSE-200, and the SSE-200 TRM defines
  * most of the device layout:
  *  https://developer.arm.com/documentation/101104/latest/
+ * and the AN547 uses the SSE-300, whose layout is in the SSE-300 TRM:
+ *  https://developer.arm.com/documentation/101773/latest/
  */
 
 #include "qemu/osdep.h"
@@ -68,13 +73,14 @@
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
-#define MPS2TZ_NUMIRQ_MAX 95
-#define MPS2TZ_RAM_MAX 4
+#define MPS2TZ_NUMIRQ_MAX 96
+#define MPS2TZ_RAM_MAX 5
 
 typedef enum MPS2TZFPGAType {
     FPGA_AN505,
     FPGA_AN521,
     FPGA_AN524,
+    FPGA_AN547,
 } MPS2TZFPGAType;
 
 /*
@@ -153,6 +159,7 @@ struct MPS2TZMachineState {
 #define TYPE_MPS2TZ_AN505_MACHINE MACHINE_TYPE_NAME("mps2-an505")
 #define TYPE_MPS2TZ_AN521_MACHINE MACHINE_TYPE_NAME("mps2-an521")
 #define TYPE_MPS3TZ_AN524_MACHINE MACHINE_TYPE_NAME("mps3-an524")
+#define TYPE_MPS3TZ_AN547_MACHINE MACHINE_TYPE_NAME("mps3-an547")
 
 OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
 
@@ -242,6 +249,49 @@ static const RAMInfo an524_raminfo[] = { {
     },
 };
 
+static const RAMInfo an547_raminfo[] = { {
+        .name = "itcm",
+        .base = 0x00000000,
+        .size = 512 * KiB,
+        .mpc = -1,
+        .mrindex = 0,
+    }, {
+        .name = "sram",
+        .base = 0x01000000,
+        .size = 2 * MiB,
+        .mpc = 0,
+        .mrindex = 1,
+    }, {
+        .name = "dtcm",
+        .base = 0x20000000,
+        .size = 4 * 128 * KiB,
+        .mpc = -1,
+        .mrindex = 2,
+    }, {
+        .name = "sram 2",
+        .base = 0x21000000,
+        .size = 4 * MiB,
+        .mpc = -1,
+        .mrindex = 3,
+    }, {
+        /* We don't model QSPI flash yet; for now expose it as simple ROM */
+        .name = "QSPI",
+        .base = 0x28000000,
+        .size = 8 * MiB,
+        .mpc = 1,
+        .mrindex = 4,
+        .flags = IS_ROM,
+    }, {
+        .name = "DDR",
+        .base = 0x60000000,
+        .size = 2 * GiB,
+        .mpc = 2,
+        .mrindex = -1,
+    }, {
+        .name = NULL,
+    },
+};
+
 static const RAMInfo *find_raminfo_for_mpc(MPS2TZMachineState *mms, int mpc)
 {
     MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_GET_CLASS(mms);
@@ -883,6 +933,55 @@ static void mps2tz_common_init(MachineState *machine)
         },
     };
 
+    const PPCInfo an547_ppcs[] = { {
+            .name = "apb_ppcexp0",
+            .ports = {
+                { "ssram-mpc", make_mpc, &mms->mpc[0], 0x57000000, 0x1000 },
+                { "qspi-mpc", make_mpc, &mms->mpc[1], 0x57001000, 0x1000 },
+                { "ddr-mpc", make_mpc, &mms->mpc[2], 0x57002000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp1",
+            .ports = {
+                { "i2c0", make_i2c, &mms->i2c[0], 0x49200000, 0x1000 },
+                { "i2c1", make_i2c, &mms->i2c[1], 0x49201000, 0x1000 },
+                { "spi0", make_spi, &mms->spi[0], 0x49202000, 0x1000, { 53 } },
+                { "spi1", make_spi, &mms->spi[1], 0x49203000, 0x1000, { 54 } },
+                { "spi2", make_spi, &mms->spi[2], 0x49204000, 0x1000, { 55 } },
+                { "i2c2", make_i2c, &mms->i2c[2], 0x49205000, 0x1000 },
+                { "i2c3", make_i2c, &mms->i2c[3], 0x49206000, 0x1000 },
+                { /* port 7 reserved */ },
+                { "i2c4", make_i2c, &mms->i2c[4], 0x49208000, 0x1000 },
+            },
+        }, {
+            .name = "apb_ppcexp2",
+            .ports = {
+                { "scc", make_scc, &mms->scc, 0x49300000, 0x1000 },
+                { "i2s-audio", make_unimp_dev, &mms->i2s_audio, 0x49301000, 0x1000 },
+                { "fpgaio", make_fpgaio, &mms->fpgaio, 0x49302000, 0x1000 },
+                { "uart0", make_uart, &mms->uart[0], 0x49303000, 0x1000, { 33, 34, 43 } },
+                { "uart1", make_uart, &mms->uart[1], 0x49304000, 0x1000, { 35, 36, 44 } },
+                { "uart2", make_uart, &mms->uart[2], 0x49305000, 0x1000, { 37, 38, 45 } },
+                { "uart3", make_uart, &mms->uart[3], 0x49306000, 0x1000, { 39, 40, 46 } },
+                { "uart4", make_uart, &mms->uart[4], 0x49307000, 0x1000, { 41, 42, 47 } },
+                { "uart5", make_uart, &mms->uart[5], 0x49308000, 0x1000, { 125, 126, 127 } },
+
+                { /* port 9 reserved */ },
+                { "clcd", make_unimp_dev, &mms->cldc, 0x4930a000, 0x1000 },
+                { "rtc", make_rtc, &mms->rtc, 0x4930b000, 0x1000 },
+            },
+        }, {
+            .name = "ahb_ppcexp0",
+            .ports = {
+                { "gpio0", make_unimp_dev, &mms->gpio[0], 0x41100000, 0x1000 },
+                { "gpio1", make_unimp_dev, &mms->gpio[1], 0x41101000, 0x1000 },
+                { "gpio2", make_unimp_dev, &mms->gpio[2], 0x41102000, 0x1000 },
+                { "gpio3", make_unimp_dev, &mms->gpio[3], 0x41103000, 0x1000 },
+                { "eth-usb", make_eth_usb, NULL, 0x41400000, 0x200000, { 49 } },
+            },
+        },
+    };
+
     switch (mmc->fpga_type) {
     case FPGA_AN505:
     case FPGA_AN521:
@@ -893,6 +992,10 @@ static void mps2tz_common_init(MachineState *machine)
         ppcs = an524_ppcs;
         num_ppcs = ARRAY_SIZE(an524_ppcs);
         break;
+    case FPGA_AN547:
+        ppcs = an547_ppcs;
+        num_ppcs = ARRAY_SIZE(an547_ppcs);
+        break;
     default:
         g_assert_not_reached();
     }
@@ -971,6 +1074,11 @@ static void mps2tz_common_init(MachineState *machine)
 
     create_unimplemented_device("FPGA NS PC", 0x48007000, 0x1000);
 
+    if (mmc->fpga_type == FPGA_AN547) {
+        create_unimplemented_device("U55 timing adapter 0", 0x48102000, 0x1000);
+        create_unimplemented_device("U55 timing adapter 1", 0x48103000, 0x1000);
+    }
+
     create_non_mpc_ram(mms);
 
     armv7m_load_kernel(ARM_CPU(first_cpu), machine->kernel_filename,
@@ -1105,6 +1213,33 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
     mps2tz_set_default_ram_info(mmc);
 }
 
+static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
+{
+    MachineClass *mc = MACHINE_CLASS(oc);
+    MPS2TZMachineClass *mmc = MPS2TZ_MACHINE_CLASS(oc);
+
+    mc->desc = "ARM MPS3 with AN547 FPGA image for Cortex-M55";
+    mc->default_cpus = 1;
+    mc->min_cpus = mc->default_cpus;
+    mc->max_cpus = mc->default_cpus;
+    mmc->fpga_type = FPGA_AN547;
+    mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m55");
+    mmc->scc_id = 0x41055470;
+    mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
+    mmc->apb_periph_frq = 25 * 1000 * 1000; /* 25MHz */
+    mmc->oscclk = an524_oscclk; /* same as AN524 */
+    mmc->len_oscclk = ARRAY_SIZE(an524_oscclk);
+    mmc->fpgaio_num_leds = 10;
+    mmc->fpgaio_has_switches = true;
+    mmc->fpgaio_has_dbgctrl = true;
+    mmc->numirq = 96;
+    mmc->uart_overflow_irq = 48;
+    mmc->init_svtor = 0x00000000;
+    mmc->raminfo = an547_raminfo;
+    mmc->armsse_type = TYPE_SSE300;
+    mps2tz_set_default_ram_info(mmc);
+}
+
 static const TypeInfo mps2tz_info = {
     .name = TYPE_MPS2TZ_MACHINE,
     .parent = TYPE_MACHINE,
@@ -1136,12 +1271,19 @@ static const TypeInfo mps3tz_an524_info = {
     .class_init = mps3tz_an524_class_init,
 };
 
+static const TypeInfo mps3tz_an547_info = {
+    .name = TYPE_MPS3TZ_AN547_MACHINE,
+    .parent = TYPE_MPS2TZ_MACHINE,
+    .class_init = mps3tz_an547_class_init,
+};
+
 static void mps2tz_machine_init(void)
 {
     type_register_static(&mps2tz_info);
     type_register_static(&mps2tz_an505_info);
     type_register_static(&mps2tz_an521_info);
     type_register_static(&mps3tz_an524_info);
+    type_register_static(&mps3tz_an547_info);
 }
 
 type_init(mps2tz_machine_init);
-- 
2.20.1


