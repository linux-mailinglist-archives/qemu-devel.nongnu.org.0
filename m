Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABA9632B869
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Mar 2021 14:58:32 +0100 (CET)
Received: from localhost ([::1]:52626 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lHS1H-00031L-CM
	for lists+qemu-devel@lfdr.de; Wed, 03 Mar 2021 08:58:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56192)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwS-0005NG-8K; Wed, 03 Mar 2021 08:53:33 -0500
Received: from mail-qk1-x72b.google.com ([2607:f8b0:4864:20::72b]:44117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lHRwQ-0002Cg-IZ; Wed, 03 Mar 2021 08:53:32 -0500
Received: by mail-qk1-x72b.google.com with SMTP id 130so9314833qkh.11;
 Wed, 03 Mar 2021 05:53:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
 b=G22V3PeE/nBgIaZgtfvlHTy0jbU/p///+Y1J0CR5uOne24Fvy27ZSzGYWnhMfOkp/D
 zTPC+YYsP9rtupC70LBsUqEoTflT1TR2DsDxRJk0XjP0s0RE2guFLrdL3yq0P9GiqcTr
 wq3VS7mOP30F3nXyVGlHBTOxxMypbbXakDLGKiwYqJaYmh9ZOixCt5M5TL6BwtRFuSbD
 uE+Acjg87/v8kK77NuMXtZICRUSCwK3O+33XKOQkYkzM3hcf1ZLu0asQmXG08uIqiBYK
 FWCiEnSECH6IvAR540Q1Ms4+EgMFYP1XC8srrgxCxrEYKxkxTvye9Tm1dhKTbkBUJCq8
 bycg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
 b=YcAZeEFlV+uEAnRIVJrCTLGQVO8a+J1iHmTBN0n1otm7V7dcUL0u0Irtass7xX+gPT
 2uDncSOm83c230XWTNGMwM310TkX0Kspj7WlVYnhvha565sYIGFK2+U8ofJ5nmp8LJaO
 GNxV2dynXCyO4DGPepfRRRCDF+Vbz1tTH9VHntJdRee/CY4L+XW49xQsrTdp8TV2DHQ8
 7Tl3StCFI1QSYaAbe/5Q5P6ZAZ0SnVxtrEFtrrqMdfCrtEyFs/veeS40muS9HWZ8obrH
 RE4T51r9vcZpEprc8fLnn/kVrHRejv1y6zcNR61sXA6x5C4uXGGITBhDRWe8X6L3z5bw
 2Kpg==
X-Gm-Message-State: AOAM532/3f4Ws/W3EKE2OimaWDqZ8uOKQ7/HXtK4beyMEVRMbPiEL5Ri
 9WSRK3hSuGW9Dyj+sV0eif6awTsfr4s=
X-Google-Smtp-Source: ABdhPJxXTAX4tAsaQuhDMbe5EUrWc9NSri5PYzffalIIJJU3x4gbb14DvTt9O19EcyX8+JGdWGkaTw==
X-Received: by 2002:ae9:dcc4:: with SMTP id q187mr22694501qkf.5.1614779609596; 
 Wed, 03 Mar 2021 05:53:29 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id x187sm17425500qkd.83.2021.03.03.05.53.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:53:29 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v7 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module
 for QSPI
Date: Wed,  3 Mar 2021 21:52:52 +0800
Message-Id: <20210303135254.3970-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210303135254.3970-1-bmeng.cn@gmail.com>
References: <20210303135254.3970-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-qk1-x72b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: Bin Meng <bin.meng@windriver.com>,
 Francisco Iglesias <francisco.iglesias@xilinx.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, Xuzhou Cheng <xuzhou.cheng@windriver.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
link of GQSPI to CSU DMA.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

---

(no changes since v4)

Changes in v4:
- Rename "csu_dma" to "qspi_dma"

Changes in v3:
- new patch: xlnx-zynqmp: Add XLNX CSU DMA module

 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 12 ++++++++++++
 hw/arm/Kconfig               |  1 +
 3 files changed, 15 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index be15cc8814..2edeed911c 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -35,6 +35,7 @@
 #include "target/arm/cpu.h"
 #include "qom/object.h"
 #include "net/can_emu.h"
+#include "hw/dma/xlnx_csu_dma.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx,zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -108,6 +109,7 @@ struct XlnxZynqMPState {
     XlnxZynqMPRTC rtc;
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
+    XlnxCSUDMA qspi_dma;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 49465a2794..76cc3b5e78 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -50,6 +50,7 @@
 #define QSPI_ADDR           0xff0f0000
 #define LQSPI_ADDR          0xc0000000
 #define QSPI_IRQ            15
+#define QSPI_DMA_ADDR       0xff0f0800
 
 #define DP_ADDR             0xfd4a0000
 #define DP_IRQ              113
@@ -284,6 +285,8 @@ static void xlnx_zynqmp_init(Object *obj)
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
         object_initialize_child(obj, "adma[*]", &s->adma[i], TYPE_XLNX_ZDMA);
     }
+
+    object_initialize_child(obj, "qspi-dma", &s->qspi_dma, TYPE_XLNX_CSU_DMA);
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -643,6 +646,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
                            gic_spi[adma_ch_intr[i]]);
     }
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi_dma), errp)) {
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
+    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                             OBJECT(&s->qspi_dma), errp);
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4e6f4ffe90..27ec10f89b 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -353,6 +353,7 @@ config XLNX_ZYNQMP_ARM
     select SSI_M25P80
     select XILINX_AXI
     select XILINX_SPIPS
+    select XLNX_CSU_DMA
     select XLNX_ZYNQMP
     select XLNX_ZDMA
 
-- 
2.25.1


