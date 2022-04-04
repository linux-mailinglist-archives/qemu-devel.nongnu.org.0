Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E7EB4F18EE
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:54:59 +0200 (CEST)
Received: from localhost ([::1]:55722 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP2g-000731-CY
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:54:58 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44458)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvA-0004si-1c
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:13 -0400
Received: from [2a00:1450:4864:20::42f] (port=38878
 helo=mail-wr1-x42f.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv6-0000Tm-Mx
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:11 -0400
Received: by mail-wr1-x42f.google.com with SMTP id j12so7543508wrb.5
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VCMIJjBWjgawX2iD7t1I7maRrjdC+015k4SvdlYnj9o=;
 b=Q2Xvcf1nVFr9reWSqo1k5hZcXS568+xG+AV9ELF9bX23Q9ADuBVPPY87P5rhpEkvU1
 KdubMhrP151eL9E1e1N+rLmEShcBFA5wFdtVrZ9I6bssamsppPcMIe6yWl69V2YuxLVs
 yWkcGB4KP43gJWBxd9kA86eCNsYRCCrOFCukEtpAmV48TUJDGUccOnCQu7njuJZpVu4K
 bHuEuTEY6t+GUrCB1y05+I/S86LP9TCBI/cmGOsKwFcx2HEEc5N/dYRY8TtSznURU2cW
 A2BpV/olvdB+Z5myR55XIyKxN99RTTVusCLiMKIST9PdIFKw2Alhs2A+ZWrcQKvzendZ
 S0Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VCMIJjBWjgawX2iD7t1I7maRrjdC+015k4SvdlYnj9o=;
 b=JiLDVQVmlPKbbG+x+LXc5/sdoRQuVoq6lwFyV735QZfNBvlnmYmGKH0m9oVpTH9Myi
 8OOLDh+U11b5nreNUT5GWHuzAxwCyVAYub3roVpLr2E4d6GxnknhkHTFegYeuWMFATw3
 dSbc6Sb3l44OzBoGEveffZNSmIgDIEQfjPiJo084VEUKqMIcsiZqA3m7ukYsdOjy1M9R
 iKNkiMFPYjKYxB8KtyIN617KqlpnLf/Z/fqfiVixAGqtdPEaHFJv2y2N+Hh6lV9K0EdD
 HQjho9p/SU3/Gp32EUxCDpIPjzSue1nXmghYu/ztIkVxdGWWiF116QRwgbDAsHvir5kZ
 0A4Q==
X-Gm-Message-State: AOAM533G19KiixeAG+QNI8hvPFY7Vp3CLE9MwRQlLB3YSg9mgpCCGkXm
 IlCacfWq1Kv6eOmgqg9KYlGrsQ==
X-Google-Smtp-Source: ABdhPJzUrjPRI/OXJjcBEsMM8ExWf8PD8LjlYgbWmvsFvU32oncokPQpexlN/tOmUNT1o7w+c9SPkA==
X-Received: by 2002:a5d:44ca:0:b0:206:893:6b5c with SMTP id
 z10-20020a5d44ca000000b0020608936b5cmr276255wrr.145.1649087227385; 
 Mon, 04 Apr 2022 08:47:07 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:07 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 07/18] hw/arm/exynos4210: Move
 exynos4210_init_board_irqs() into exynos4210.c
Date: Mon,  4 Apr 2022 16:46:47 +0100
Message-Id: <20220404154658.565020-8-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42f
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01,
 UPPERCASE_50_75=0.008 autolearn=no autolearn_force=no
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The function exynos4210_init_board_irqs() currently lives in
exynos4210_gic.c, but it isn't really part of the exynos4210.gic
device -- it is a function that implements (some of) the wiring up of
interrupts between the SoC's GIC and combiner components.  This means
it fits better in exynos4210.c, which is the SoC-level code.  Move it
there. Similarly, exynos4210_git_irq() is used almost only in the
SoC-level code, so move it too.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |   4 -
 hw/arm/exynos4210.c         | 202 +++++++++++++++++++++++++++++++++++
 hw/intc/exynos4210_gic.c    | 204 ------------------------------------
 3 files changed, 202 insertions(+), 208 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index a9f186370ee..d83e96a091e 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -111,10 +111,6 @@ OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210State, EXYNOS4210_SOC)
 void exynos4210_write_secondary(ARMCPU *cpu,
         const struct arm_boot_info *info);
 
-/* Initialize board IRQs.
- * These IRQs contain splitted Int/External Combiner and External Gic IRQs */
-void exynos4210_init_board_irqs(Exynos4210State *s);
-
 /* Get IRQ number from exynos4210 IRQ subsystem stub.
  * To identify IRQ source use internal combiner group and bit number
  *  grp - group number
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 11e321d7830..742666ba779 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -101,6 +101,208 @@
 #define EXYNOS4210_PL330_BASE1_ADDR         0x12690000
 #define EXYNOS4210_PL330_BASE2_ADDR         0x12850000
 
+enum ExtGicId {
+    EXT_GIC_ID_MDMA_LCD0 = 66,
+    EXT_GIC_ID_PDMA0,
+    EXT_GIC_ID_PDMA1,
+    EXT_GIC_ID_TIMER0,
+    EXT_GIC_ID_TIMER1,
+    EXT_GIC_ID_TIMER2,
+    EXT_GIC_ID_TIMER3,
+    EXT_GIC_ID_TIMER4,
+    EXT_GIC_ID_MCT_L0,
+    EXT_GIC_ID_WDT,
+    EXT_GIC_ID_RTC_ALARM,
+    EXT_GIC_ID_RTC_TIC,
+    EXT_GIC_ID_GPIO_XB,
+    EXT_GIC_ID_GPIO_XA,
+    EXT_GIC_ID_MCT_L1,
+    EXT_GIC_ID_IEM_APC,
+    EXT_GIC_ID_IEM_IEC,
+    EXT_GIC_ID_NFC,
+    EXT_GIC_ID_UART0,
+    EXT_GIC_ID_UART1,
+    EXT_GIC_ID_UART2,
+    EXT_GIC_ID_UART3,
+    EXT_GIC_ID_UART4,
+    EXT_GIC_ID_MCT_G0,
+    EXT_GIC_ID_I2C0,
+    EXT_GIC_ID_I2C1,
+    EXT_GIC_ID_I2C2,
+    EXT_GIC_ID_I2C3,
+    EXT_GIC_ID_I2C4,
+    EXT_GIC_ID_I2C5,
+    EXT_GIC_ID_I2C6,
+    EXT_GIC_ID_I2C7,
+    EXT_GIC_ID_SPI0,
+    EXT_GIC_ID_SPI1,
+    EXT_GIC_ID_SPI2,
+    EXT_GIC_ID_MCT_G1,
+    EXT_GIC_ID_USB_HOST,
+    EXT_GIC_ID_USB_DEVICE,
+    EXT_GIC_ID_MODEMIF,
+    EXT_GIC_ID_HSMMC0,
+    EXT_GIC_ID_HSMMC1,
+    EXT_GIC_ID_HSMMC2,
+    EXT_GIC_ID_HSMMC3,
+    EXT_GIC_ID_SDMMC,
+    EXT_GIC_ID_MIPI_CSI_4LANE,
+    EXT_GIC_ID_MIPI_DSI_4LANE,
+    EXT_GIC_ID_MIPI_CSI_2LANE,
+    EXT_GIC_ID_MIPI_DSI_2LANE,
+    EXT_GIC_ID_ONENAND_AUDI,
+    EXT_GIC_ID_ROTATOR,
+    EXT_GIC_ID_FIMC0,
+    EXT_GIC_ID_FIMC1,
+    EXT_GIC_ID_FIMC2,
+    EXT_GIC_ID_FIMC3,
+    EXT_GIC_ID_JPEG,
+    EXT_GIC_ID_2D,
+    EXT_GIC_ID_PCIe,
+    EXT_GIC_ID_MIXER,
+    EXT_GIC_ID_HDMI,
+    EXT_GIC_ID_HDMI_I2C,
+    EXT_GIC_ID_MFC,
+    EXT_GIC_ID_TVENC,
+};
+
+enum ExtInt {
+    EXT_GIC_ID_EXTINT0 = 48,
+    EXT_GIC_ID_EXTINT1,
+    EXT_GIC_ID_EXTINT2,
+    EXT_GIC_ID_EXTINT3,
+    EXT_GIC_ID_EXTINT4,
+    EXT_GIC_ID_EXTINT5,
+    EXT_GIC_ID_EXTINT6,
+    EXT_GIC_ID_EXTINT7,
+    EXT_GIC_ID_EXTINT8,
+    EXT_GIC_ID_EXTINT9,
+    EXT_GIC_ID_EXTINT10,
+    EXT_GIC_ID_EXTINT11,
+    EXT_GIC_ID_EXTINT12,
+    EXT_GIC_ID_EXTINT13,
+    EXT_GIC_ID_EXTINT14,
+    EXT_GIC_ID_EXTINT15
+};
+
+/*
+ * External GIC sources which are not from External Interrupt Combiner or
+ * External Interrupts are starting from EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ,
+ * which is INTG16 in Internal Interrupt Combiner.
+ */
+
+static const uint32_t
+combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
+    /* int combiner groups 16-19 */
+    { }, { }, { }, { },
+    /* int combiner group 20 */
+    { 0, EXT_GIC_ID_MDMA_LCD0 },
+    /* int combiner group 21 */
+    { EXT_GIC_ID_PDMA0, EXT_GIC_ID_PDMA1 },
+    /* int combiner group 22 */
+    { EXT_GIC_ID_TIMER0, EXT_GIC_ID_TIMER1, EXT_GIC_ID_TIMER2,
+            EXT_GIC_ID_TIMER3, EXT_GIC_ID_TIMER4 },
+    /* int combiner group 23 */
+    { EXT_GIC_ID_RTC_ALARM, EXT_GIC_ID_RTC_TIC },
+    /* int combiner group 24 */
+    { EXT_GIC_ID_GPIO_XB, EXT_GIC_ID_GPIO_XA },
+    /* int combiner group 25 */
+    { EXT_GIC_ID_IEM_APC, EXT_GIC_ID_IEM_IEC },
+    /* int combiner group 26 */
+    { EXT_GIC_ID_UART0, EXT_GIC_ID_UART1, EXT_GIC_ID_UART2, EXT_GIC_ID_UART3,
+            EXT_GIC_ID_UART4 },
+    /* int combiner group 27 */
+    { EXT_GIC_ID_I2C0, EXT_GIC_ID_I2C1, EXT_GIC_ID_I2C2, EXT_GIC_ID_I2C3,
+            EXT_GIC_ID_I2C4, EXT_GIC_ID_I2C5, EXT_GIC_ID_I2C6,
+            EXT_GIC_ID_I2C7 },
+    /* int combiner group 28 */
+    { EXT_GIC_ID_SPI0, EXT_GIC_ID_SPI1, EXT_GIC_ID_SPI2 , EXT_GIC_ID_USB_HOST},
+    /* int combiner group 29 */
+    { EXT_GIC_ID_HSMMC0, EXT_GIC_ID_HSMMC1, EXT_GIC_ID_HSMMC2,
+     EXT_GIC_ID_HSMMC3, EXT_GIC_ID_SDMMC },
+    /* int combiner group 30 */
+    { EXT_GIC_ID_MIPI_CSI_4LANE, EXT_GIC_ID_MIPI_CSI_2LANE },
+    /* int combiner group 31 */
+    { EXT_GIC_ID_MIPI_DSI_4LANE, EXT_GIC_ID_MIPI_DSI_2LANE },
+    /* int combiner group 32 */
+    { EXT_GIC_ID_FIMC0, EXT_GIC_ID_FIMC1 },
+    /* int combiner group 33 */
+    { EXT_GIC_ID_FIMC2, EXT_GIC_ID_FIMC3 },
+    /* int combiner group 34 */
+    { EXT_GIC_ID_ONENAND_AUDI, EXT_GIC_ID_NFC },
+    /* int combiner group 35 */
+    { 0, 0, 0, EXT_GIC_ID_MCT_L1, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    /* int combiner group 36 */
+    { EXT_GIC_ID_MIXER },
+    /* int combiner group 37 */
+    { EXT_GIC_ID_EXTINT4, EXT_GIC_ID_EXTINT5, EXT_GIC_ID_EXTINT6,
+     EXT_GIC_ID_EXTINT7 },
+    /* groups 38-50 */
+    { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { },
+    /* int combiner group 51 */
+    { EXT_GIC_ID_MCT_L0, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    /* group 52 */
+    { },
+    /* int combiner group 53 */
+    { EXT_GIC_ID_WDT, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
+    /* groups 54-63 */
+    { }, { }, { }, { }, { }, { }, { }, { }, { }, { }
+};
+
+/*
+ * Initialize board IRQs.
+ * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
+ */
+static void exynos4210_init_board_irqs(Exynos4210State *s)
+{
+    uint32_t grp, bit, irq_id, n;
+    Exynos4210Irq *is = &s->irqs;
+
+    for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
+        irq_id = 0;
+        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
+                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
+            /* MCT_G0 is passed to External GIC */
+            irq_id = EXT_GIC_ID_MCT_G0;
+        }
+        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 5) ||
+                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 5)) {
+            /* MCT_G1 is passed to External and GIC */
+            irq_id = EXT_GIC_ID_MCT_G1;
+        }
+        if (irq_id) {
+            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
+                    is->ext_gic_irq[irq_id - 32]);
+        } else {
+            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
+                    is->ext_combiner_irq[n]);
+        }
+    }
+    for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
+        /* these IDs are passed to Internal Combiner and External GIC */
+        grp = EXYNOS4210_COMBINER_GET_GRP_NUM(n);
+        bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
+        irq_id = combiner_grp_to_gic_id[grp -
+                     EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
+
+        if (irq_id) {
+            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
+                    is->ext_gic_irq[irq_id - 32]);
+        }
+    }
+}
+
+/*
+ * Get IRQ number from exynos4210 IRQ subsystem stub.
+ * To identify IRQ source use internal combiner group and bit number
+ *  grp - group number
+ *  bit - bit number inside group
+ */
+uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
+{
+    return EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit);
+}
+
 static uint8_t chipid_and_omr[] = { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
 
diff --git a/hw/intc/exynos4210_gic.c b/hw/intc/exynos4210_gic.c
index 3b77a485780..d8cad537fbf 100644
--- a/hw/intc/exynos4210_gic.c
+++ b/hw/intc/exynos4210_gic.c
@@ -30,154 +30,6 @@
 #include "hw/arm/exynos4210.h"
 #include "qom/object.h"
 
-enum ExtGicId {
-    EXT_GIC_ID_MDMA_LCD0 = 66,
-    EXT_GIC_ID_PDMA0,
-    EXT_GIC_ID_PDMA1,
-    EXT_GIC_ID_TIMER0,
-    EXT_GIC_ID_TIMER1,
-    EXT_GIC_ID_TIMER2,
-    EXT_GIC_ID_TIMER3,
-    EXT_GIC_ID_TIMER4,
-    EXT_GIC_ID_MCT_L0,
-    EXT_GIC_ID_WDT,
-    EXT_GIC_ID_RTC_ALARM,
-    EXT_GIC_ID_RTC_TIC,
-    EXT_GIC_ID_GPIO_XB,
-    EXT_GIC_ID_GPIO_XA,
-    EXT_GIC_ID_MCT_L1,
-    EXT_GIC_ID_IEM_APC,
-    EXT_GIC_ID_IEM_IEC,
-    EXT_GIC_ID_NFC,
-    EXT_GIC_ID_UART0,
-    EXT_GIC_ID_UART1,
-    EXT_GIC_ID_UART2,
-    EXT_GIC_ID_UART3,
-    EXT_GIC_ID_UART4,
-    EXT_GIC_ID_MCT_G0,
-    EXT_GIC_ID_I2C0,
-    EXT_GIC_ID_I2C1,
-    EXT_GIC_ID_I2C2,
-    EXT_GIC_ID_I2C3,
-    EXT_GIC_ID_I2C4,
-    EXT_GIC_ID_I2C5,
-    EXT_GIC_ID_I2C6,
-    EXT_GIC_ID_I2C7,
-    EXT_GIC_ID_SPI0,
-    EXT_GIC_ID_SPI1,
-    EXT_GIC_ID_SPI2,
-    EXT_GIC_ID_MCT_G1,
-    EXT_GIC_ID_USB_HOST,
-    EXT_GIC_ID_USB_DEVICE,
-    EXT_GIC_ID_MODEMIF,
-    EXT_GIC_ID_HSMMC0,
-    EXT_GIC_ID_HSMMC1,
-    EXT_GIC_ID_HSMMC2,
-    EXT_GIC_ID_HSMMC3,
-    EXT_GIC_ID_SDMMC,
-    EXT_GIC_ID_MIPI_CSI_4LANE,
-    EXT_GIC_ID_MIPI_DSI_4LANE,
-    EXT_GIC_ID_MIPI_CSI_2LANE,
-    EXT_GIC_ID_MIPI_DSI_2LANE,
-    EXT_GIC_ID_ONENAND_AUDI,
-    EXT_GIC_ID_ROTATOR,
-    EXT_GIC_ID_FIMC0,
-    EXT_GIC_ID_FIMC1,
-    EXT_GIC_ID_FIMC2,
-    EXT_GIC_ID_FIMC3,
-    EXT_GIC_ID_JPEG,
-    EXT_GIC_ID_2D,
-    EXT_GIC_ID_PCIe,
-    EXT_GIC_ID_MIXER,
-    EXT_GIC_ID_HDMI,
-    EXT_GIC_ID_HDMI_I2C,
-    EXT_GIC_ID_MFC,
-    EXT_GIC_ID_TVENC,
-};
-
-enum ExtInt {
-    EXT_GIC_ID_EXTINT0 = 48,
-    EXT_GIC_ID_EXTINT1,
-    EXT_GIC_ID_EXTINT2,
-    EXT_GIC_ID_EXTINT3,
-    EXT_GIC_ID_EXTINT4,
-    EXT_GIC_ID_EXTINT5,
-    EXT_GIC_ID_EXTINT6,
-    EXT_GIC_ID_EXTINT7,
-    EXT_GIC_ID_EXTINT8,
-    EXT_GIC_ID_EXTINT9,
-    EXT_GIC_ID_EXTINT10,
-    EXT_GIC_ID_EXTINT11,
-    EXT_GIC_ID_EXTINT12,
-    EXT_GIC_ID_EXTINT13,
-    EXT_GIC_ID_EXTINT14,
-    EXT_GIC_ID_EXTINT15
-};
-
-/*
- * External GIC sources which are not from External Interrupt Combiner or
- * External Interrupts are starting from EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ,
- * which is INTG16 in Internal Interrupt Combiner.
- */
-
-static const uint32_t
-combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
-    /* int combiner groups 16-19 */
-    { }, { }, { }, { },
-    /* int combiner group 20 */
-    { 0, EXT_GIC_ID_MDMA_LCD0 },
-    /* int combiner group 21 */
-    { EXT_GIC_ID_PDMA0, EXT_GIC_ID_PDMA1 },
-    /* int combiner group 22 */
-    { EXT_GIC_ID_TIMER0, EXT_GIC_ID_TIMER1, EXT_GIC_ID_TIMER2,
-            EXT_GIC_ID_TIMER3, EXT_GIC_ID_TIMER4 },
-    /* int combiner group 23 */
-    { EXT_GIC_ID_RTC_ALARM, EXT_GIC_ID_RTC_TIC },
-    /* int combiner group 24 */
-    { EXT_GIC_ID_GPIO_XB, EXT_GIC_ID_GPIO_XA },
-    /* int combiner group 25 */
-    { EXT_GIC_ID_IEM_APC, EXT_GIC_ID_IEM_IEC },
-    /* int combiner group 26 */
-    { EXT_GIC_ID_UART0, EXT_GIC_ID_UART1, EXT_GIC_ID_UART2, EXT_GIC_ID_UART3,
-            EXT_GIC_ID_UART4 },
-    /* int combiner group 27 */
-    { EXT_GIC_ID_I2C0, EXT_GIC_ID_I2C1, EXT_GIC_ID_I2C2, EXT_GIC_ID_I2C3,
-            EXT_GIC_ID_I2C4, EXT_GIC_ID_I2C5, EXT_GIC_ID_I2C6,
-            EXT_GIC_ID_I2C7 },
-    /* int combiner group 28 */
-    { EXT_GIC_ID_SPI0, EXT_GIC_ID_SPI1, EXT_GIC_ID_SPI2 , EXT_GIC_ID_USB_HOST},
-    /* int combiner group 29 */
-    { EXT_GIC_ID_HSMMC0, EXT_GIC_ID_HSMMC1, EXT_GIC_ID_HSMMC2,
-     EXT_GIC_ID_HSMMC3, EXT_GIC_ID_SDMMC },
-    /* int combiner group 30 */
-    { EXT_GIC_ID_MIPI_CSI_4LANE, EXT_GIC_ID_MIPI_CSI_2LANE },
-    /* int combiner group 31 */
-    { EXT_GIC_ID_MIPI_DSI_4LANE, EXT_GIC_ID_MIPI_DSI_2LANE },
-    /* int combiner group 32 */
-    { EXT_GIC_ID_FIMC0, EXT_GIC_ID_FIMC1 },
-    /* int combiner group 33 */
-    { EXT_GIC_ID_FIMC2, EXT_GIC_ID_FIMC3 },
-    /* int combiner group 34 */
-    { EXT_GIC_ID_ONENAND_AUDI, EXT_GIC_ID_NFC },
-    /* int combiner group 35 */
-    { 0, 0, 0, EXT_GIC_ID_MCT_L1, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
-    /* int combiner group 36 */
-    { EXT_GIC_ID_MIXER },
-    /* int combiner group 37 */
-    { EXT_GIC_ID_EXTINT4, EXT_GIC_ID_EXTINT5, EXT_GIC_ID_EXTINT6,
-     EXT_GIC_ID_EXTINT7 },
-    /* groups 38-50 */
-    { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { }, { },
-    /* int combiner group 51 */
-    { EXT_GIC_ID_MCT_L0, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
-    /* group 52 */
-    { },
-    /* int combiner group 53 */
-    { EXT_GIC_ID_WDT, 0, 0, 0, EXT_GIC_ID_MCT_G0, EXT_GIC_ID_MCT_G1 },
-    /* groups 54-63 */
-    { }, { }, { }, { }, { }, { }, { }, { }, { }, { }
-};
-
 #define EXYNOS4210_GIC_NIRQ 160
 
 #define EXYNOS4210_EXT_GIC_CPU_REGION_SIZE     0x10000
@@ -192,62 +44,6 @@ combiner_grp_to_gic_id[64 - EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][8] = {
 #define EXYNOS4210_GIC_CPU_REGION_SIZE  0x100
 #define EXYNOS4210_GIC_DIST_REGION_SIZE 0x1000
 
-/*
- * Initialize board IRQs.
- * These IRQs contain splitted Int/External Combiner and External Gic IRQs.
- */
-void exynos4210_init_board_irqs(Exynos4210State *s)
-{
-    uint32_t grp, bit, irq_id, n;
-    Exynos4210Irq *is = &s->irqs;
-
-    for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
-        irq_id = 0;
-        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 4) ||
-                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 4)) {
-            /* MCT_G0 is passed to External GIC */
-            irq_id = EXT_GIC_ID_MCT_G0;
-        }
-        if (n == EXYNOS4210_COMBINER_GET_IRQ_NUM(1, 5) ||
-                n == EXYNOS4210_COMBINER_GET_IRQ_NUM(12, 5)) {
-            /* MCT_G1 is passed to External and GIC */
-            irq_id = EXT_GIC_ID_MCT_G1;
-        }
-        if (irq_id) {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_gic_irq[irq_id - 32]);
-        } else {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_combiner_irq[n]);
-        }
-    }
-    for (; n < EXYNOS4210_MAX_INT_COMBINER_IN_IRQ; n++) {
-        /* these IDs are passed to Internal Combiner and External GIC */
-        grp = EXYNOS4210_COMBINER_GET_GRP_NUM(n);
-        bit = EXYNOS4210_COMBINER_GET_BIT_NUM(n);
-        irq_id = combiner_grp_to_gic_id[grp -
-                     EXYNOS4210_MAX_EXT_COMBINER_OUT_IRQ][bit];
-
-        if (irq_id) {
-            s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_gic_irq[irq_id - 32]);
-        }
-    }
-}
-
-/*
- * Get IRQ number from exynos4210 IRQ subsystem stub.
- * To identify IRQ source use internal combiner group and bit number
- *  grp - group number
- *  bit - bit number inside group
- */
-uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
-{
-    return EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit);
-}
-
-/********* GIC part *********/
-
 #define TYPE_EXYNOS4210_GIC "exynos4210.gic"
 OBJECT_DECLARE_SIMPLE_TYPE(Exynos4210GicState, EXYNOS4210_GIC)
 
-- 
2.25.1


