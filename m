Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AEC1327F71
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Mar 2021 14:27:36 +0100 (CET)
Received: from localhost ([::1]:59822 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lGiaF-0008FG-8d
	for lists+qemu-devel@lfdr.de; Mon, 01 Mar 2021 08:27:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTU-0003Wv-BS; Mon, 01 Mar 2021 08:20:36 -0500
Received: from mail-pg1-x532.google.com ([2607:f8b0:4864:20::532]:38809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1lGiTS-0003ID-LY; Mon, 01 Mar 2021 08:20:36 -0500
Received: by mail-pg1-x532.google.com with SMTP id e6so11543959pgk.5;
 Mon, 01 Mar 2021 05:20:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
 b=H3jOsNk19srdpHmQV0Fsmp+DsuYy4eNQo8wNTWFKbe23jC+c8sAFEpt8FVY1U9+bUV
 BG6h8sL4HcaOYJ1k8Golt251cf5zu+zLhD9dl3qjNmMnfqAozQ4IEkU7ETqYwCAyxLlQ
 aaOj/ZnPw85OqIyGo3/3D7/aDfHKM+uHBVLzxDZLSs/1bb4yXnPCmnj91J+oIQBoVD8C
 tdD7hnJWAiOadmFvEMIT6gCR8RaEehJPHp7oXjJQLQswCbvGrGmiLs2wg0k954p7UD7S
 L9/7/MVCDcjkyeqzU/mbarUNDJ7eIiKbmAf1q/522bAC9a9YI9CQNal+RvagXxMvgnU6
 wSdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E8/sVwG2wDDumeb0HVHtgZ67kaGTJTkb0zPWfTfzhtU=;
 b=RNQHWQ9MBWhPnjW6OTAII2TsS+K0LrQl9OQ4hmVlpRREyVtkVWBjpQRaTyxE+Z5KwE
 FIXw4qSOyKVcz19YX+szNILwiM877Ggbop6NA+Pi0chM/m7pH9a7foLNSRwA/FL217Do
 n+xffHdEZ03RglNFwhdpoy/olpMzVrenfwLf3AooL+W3CAUrENkoa4qpyMTagZZytK0D
 2JFnv12bArRDqfwE0ojHvcxtbYJ/P/58EaH5X2PIHLmoG5g1raDA8PUJWs+8yBeNEuoz
 VilpwoJn4sH519/G1a7MQTAZqZjzgDxserCGNBQcEuBZ340i/JcRJyQ4BhdTTYvcrR68
 duKA==
X-Gm-Message-State: AOAM531C6L4JJnOgxWL5Md0FQyu2B/LLVoRhBEoJ1cPwWTnBd+6guDlL
 MpG2xwFameBSPuEGX+q13Ec=
X-Google-Smtp-Source: ABdhPJwHyxz38MjDLVjfF78qlW25/s7bHnXerzcwwOHd6VRv1MSa4YUE382EphWEBbpVMAcCet/hUA==
X-Received: by 2002:a05:6a00:1a0c:b029:1ee:6e00:eb42 with SMTP id
 g12-20020a056a001a0cb02901ee6e00eb42mr7919452pfv.31.1614604833100; 
 Mon, 01 Mar 2021 05:20:33 -0800 (PST)
Received: from i9-aorus-gtx1080.localdomain (144.168.56.201.16clouds.com.
 [144.168.56.201])
 by smtp.gmail.com with ESMTPSA id q2sm17748793pfl.158.2021.03.01.05.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Mar 2021 05:20:32 -0800 (PST)
From: Bin Meng <bmeng.cn@gmail.com>
To: Alistair Francis <alistair.francis@wdc.com>,
 "Edgar E . Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 3/5] hw/arm: xlnx-zynqmp: Connect a Xilinx CSU DMA module
 for QSPI
Date: Mon,  1 Mar 2021 21:20:09 +0800
Message-Id: <20210301132011.8494-4-bmeng.cn@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210301132011.8494-1-bmeng.cn@gmail.com>
References: <20210301132011.8494-1-bmeng.cn@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::532;
 envelope-from=bmeng.cn@gmail.com; helo=mail-pg1-x532.google.com
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
 Xuzhou Cheng <xuzhou.cheng@windriver.com>, Bin Meng <bin.meng@windriver.com>,
 qemu-devel@nongnu.org, Francisco Iglesias <francisco.iglesias@xilinx.com>,
 qemu-arm@nongnu.org
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


