Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FAEC33155D
	for <lists+qemu-devel@lfdr.de>; Mon,  8 Mar 2021 18:58:10 +0100 (CET)
Received: from localhost ([::1]:52972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lJK8v-0001pJ-7O
	for lists+qemu-devel@lfdr.de; Mon, 08 Mar 2021 12:58:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54078)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJlH-0007Sg-Vj
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:44 -0500
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d]:44818)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lJJky-0007CK-Li
 for qemu-devel@nongnu.org; Mon, 08 Mar 2021 12:33:43 -0500
Received: by mail-wr1-x42d.google.com with SMTP id h98so12288607wrh.11
 for <qemu-devel@nongnu.org>; Mon, 08 Mar 2021 09:33:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=FwS3SPX8y37ONXBWnC+0aZzPfEkxrlTDIJyPgPsjX4w=;
 b=hX+bQTYVIfoMarahcE0CILh2NiFpg6eqR6s6Hw1lKi3k3YcnHLZjZC46f6NqdVHNAH
 wJZ+zYUYOP371LzfmUhh+G5bnTMweHdE4PWil+UE+qPpyHqY430XrHZMOXU/4Cmq9+7f
 d3Hh8kPTa5zN3xDAA4R/RVhFH81qZwwYrJhFXOe7OLff18WFKYVosmKsbsqWrgBif8zD
 0Yt+Qjj9MfZCoTjZcDoLSB2q1hl//ydjAaaGvqV4Wh7Cy1KJczc9Oa/y+mJN+POdZ3YX
 LQpAK7xH11qAAy8GFSHNF5M5TLhuvDpVPBcwrEeNbYecJHT4V872iQS+LSEuxJ1D7Iqe
 0YGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FwS3SPX8y37ONXBWnC+0aZzPfEkxrlTDIJyPgPsjX4w=;
 b=RgELcIGufzRfx/va2YlOo0t1yA3/BbJbXRaDY1JtUW5FjpGIL/TZocpYhyef6HPD4y
 KO1bgOfKQMHOOHAAaYBMRW86maNfgYMZfvYkWROWMNzdFNfOsp2L3l14oxcEZF810SWY
 wZrWGjCEslMvbvZwLzci7p+e39IH9DX1UKV9roS+8fSq9p8D3UTC5d34im0rbhn75n8A
 L5IjGf0TCiTIOAYjzAmYdy5la79aZc8KDrSP6CqTG/A9cT419lh6e9M0j38Gi57RIF0m
 EzEhgBQksLESMdaf55jdkRVbyIoO3XQk6Us6PrZTbArMp8SGLBlPl7DX8r1JfMeDl1tm
 CpVA==
X-Gm-Message-State: AOAM530ePPpm8rNFOHj8CGqJG5tc0Dbl0Ka7w7kqvn4HJnwZMZ9Ljuq8
 Rvhr58oMEt9jOdJrbJAfdfli0U3ajIzegQ==
X-Google-Smtp-Source: ABdhPJwnGrkpfzIUM46o1FnUUgPUxHV3E/UQwsr5+kepi7QqgWF3x7SrRW4kFMH6MTZ6nPBmVWZ2zA==
X-Received: by 2002:adf:ee92:: with SMTP id b18mr22797577wro.275.1615224803232; 
 Mon, 08 Mar 2021 09:33:23 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i10sm18628217wrs.11.2021.03.08.09.33.22
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Mar 2021 09:33:22 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 50/54] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module for
 QSPI
Date: Mon,  8 Mar 2021 17:32:40 +0000
Message-Id: <20210308173244.20710-51-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210308173244.20710-1-peter.maydell@linaro.org>
References: <20210308173244.20710-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42d.google.com
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

From: Xuzhou Cheng <xuzhou.cheng@windriver.com>

Add a Xilinx CSU DMA module to ZynqMP SoC, and connent the stream
link of GQSPI to CSU DMA.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20210303135254.3970-4-bmeng.cn@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 12 ++++++++++++
 hw/arm/Kconfig               |  1 +
 3 files changed, 15 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index c83ef23e92d..1676a84ec82 100644
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
index e2056a764e2..7f01284a5c0 100644
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
@@ -638,6 +641,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
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
index f2b7a8fc0b0..8c37cf00da7 100644
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
2.20.1


