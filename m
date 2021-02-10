Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 355EA316362
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Feb 2021 11:13:25 +0100 (CET)
Received: from localhost ([::1]:49882 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9mUu-0002Nr-8v
	for lists+qemu-devel@lfdr.de; Wed, 10 Feb 2021 05:13:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSI-0000CX-Fr; Wed, 10 Feb 2021 05:10:42 -0500
Received: from mail-ed1-x52b.google.com ([2a00:1450:4864:20::52b]:42200)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1l9mSF-00032i-NZ; Wed, 10 Feb 2021 05:10:42 -0500
Received: by mail-ed1-x52b.google.com with SMTP id z22so2201153edb.9;
 Wed, 10 Feb 2021 02:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=JBkF+md++JxbgPCPBt1zkTEigdVgs8bJYJpVeVVJpDc=;
 b=XizO0uMzp/iTYlFC8nNYf1EB7jc30Apjz22j2XoxK7QYDvT3tjH+iqhN2153Vv7mzL
 GeWCB5nURKf3CRNTcKFyf5cJjlLIX377idS8LOTfR47hX5V4+3LedVUiTC65xMK1EOjY
 Mz+TLWz+DmbJwnKYg5SxA8PEv5RYvv0iO5B/00UmFN3LAfPQU1rWrMeYgNvbLERcGLle
 0XGuOj1lD7FyvMgmjVWJr/0RBXDSyn0EnaPJ4xxS87Afjh7JrtG3Zfz6AWnYeBH39g3y
 eu6BaiLqdP7AsQsY+k+odF3cyvV092sQrLObcpghczeGQR1gePIiMzZ/w02iLdkeiFow
 kJqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=JBkF+md++JxbgPCPBt1zkTEigdVgs8bJYJpVeVVJpDc=;
 b=E/hL5ehBrvvZhaMobBXspj7dpIGVBHveu58b7207Zd4BzXhTxvoYMuHRd7cT27G8me
 3iNmb5dvSS6vpYYdHeGoyBOsdqBFdPBjuexapkzS/2j0rpwmwYY0sOfYoH0p5QBfX9JB
 S62WdFIoXZeCpKpyBf1tC/O75q3pYirsjECYf9Mp0yh9LIWPqo060jrVbkuLIPjYf950
 mgoObO7W9IjD5Hjc2cKsvJJ4sNdqONMlgDhdfispZnkGMYZ2y2TZ8w67htZhBLrikGI2
 8d4tTpsgITNHfgBtg+6VIVqNyNegCifOB/N5Fc2dGhXEtRwGHKTouq5YZbMl1Ss0ERg7
 A/ug==
X-Gm-Message-State: AOAM530NF3vop06qOY5G+EkaFOuSGN5bZ9iTSLE1bgMMPGn7Wx8htBC1
 f1Vvt9q/WcYBkKsyEtTQC8k=
X-Google-Smtp-Source: ABdhPJzkcOWFe3qMheHmi+w2KGP8Bc/YMtfRpju2MitzWRHxNd4lrW4FxdEEprfKxvqcgeoFiJYiKA==
X-Received: by 2002:aa7:c58e:: with SMTP id g14mr2485028edq.318.1612951837110; 
 Wed, 10 Feb 2021 02:10:37 -0800 (PST)
Received: from pek-vx-bsp2.wrs.com
 (ec2-44-242-66-180.us-west-2.compute.amazonaws.com. [44.242.66.180])
 by smtp.gmail.com with ESMTPSA id y11sm785418ejd.72.2021.02.10.02.10.32
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 10 Feb 2021 02:10:36 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 3/5] hw/arm: xlnx-zynqmp: Add XLNX CSU DMA module
Date: Wed, 10 Feb 2021 18:10:11 +0800
Message-Id: <1612951813-50542-4-git-send-email-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
References: <1612951813-50542-1-git-send-email-bmeng.cn@gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::52b;
 envelope-from=bmeng.cn@gmail.com; helo=mail-ed1-x52b.google.com
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

Insert XLNX CSU DMA module to ZynqMP SoC, and connent the stream
link of GQSPI to CSU DMA.

Signed-off-by: Xuzhou Cheng <xuzhou.cheng@windriver.com>
Signed-off-by: Bin Meng <bin.meng@windriver.com>

---

Changes in v3:
- new patch: xlnx-zynqmp: Add XLNX CSU DMA module

 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 14 ++++++++++++++
 hw/arm/Kconfig               |  1 +
 3 files changed, 17 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index be15cc8..d387c85 100644
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
+    XlnxCSUDMA csu_dma;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 76b94a5..ed34692 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -63,6 +63,9 @@
 #define RTC_ADDR            0xffa60000
 #define RTC_IRQ             26
 
+#define CSU_DMA_ADDR        0xff0f0800
+#define CSU_DMA_IRQ         15
+
 #define SDHCI_CAPABILITIES  0x280737ec6481 /* Datasheet: UG1085 (v1.7) */
 
 static const uint64_t gem_addr[XLNX_ZYNQMP_NUM_GEMS] = {
@@ -284,6 +287,8 @@ static void xlnx_zynqmp_init(Object *obj)
     for (i = 0; i < XLNX_ZYNQMP_NUM_ADMA_CH; i++) {
         object_initialize_child(obj, "adma[*]", &s->adma[i], TYPE_XLNX_ZDMA);
     }
+
+    object_initialize_child(obj, "csu-dma", &s->csu_dma, TYPE_XLNX_CSU_DMA);
 }
 
 static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
@@ -643,6 +648,15 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->adma[i]), 0,
                            gic_spi[adma_ch_intr[i]]);
     }
+
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->csu_dma), errp)) {
+        return;
+    }
+
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->csu_dma), 0, CSU_DMA_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->csu_dma), 0, gic_spi[CSU_DMA_IRQ]);
+    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                             OBJECT(&s->csu_dma), errp);
 }
 
 static Property xlnx_zynqmp_props[] = {
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index be017b9..0c0384c 100644
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
2.7.4


