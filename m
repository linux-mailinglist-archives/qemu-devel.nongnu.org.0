Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 398E54A8626
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Feb 2022 15:24:45 +0100 (CET)
Received: from localhost ([::1]:49248 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nFd2S-0001vZ-5k
	for lists+qemu-devel@lfdr.de; Thu, 03 Feb 2022 09:24:44 -0500
Received: from eggs.gnu.org ([209.51.188.92]:52834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgI-0005MR-GE; Thu, 03 Feb 2022 09:01:50 -0500
Received: from [2a00:1450:4864:20::131] (port=43895
 helo=mail-lf1-x131.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nFcgG-0000Rq-Si; Thu, 03 Feb 2022 09:01:50 -0500
Received: by mail-lf1-x131.google.com with SMTP id u6so6129139lfm.10;
 Thu, 03 Feb 2022 06:01:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NQupA5Y18UtYDXxrSHsWoqHw/Jxb7tl2Kdbr+7k1aW8=;
 b=fueQlx1ujU6D/rtLYjXQPYt1dQ8CLjjTcCxrCJG0dPkrS5jKXlwa7G/nF4ILJfiUQ4
 UaW/nVdPm9DoKESla/YOkK2DBjFSPYuyL6LdG/IeEJqhGBEecOv/u5qzpUiHQKqRgDLp
 My7wAjP64mJy8HEh3L0urA2+UZrwNpDj0r3qdSULupL5d9s5CHJWZNw7O8Ln6w7226gU
 s01X34Pf1qYqdP5n8rsVGm0b/wcEWjDKgxhqluzUwzq0lv+sixYzB0R2GDr35e5f4UZO
 vs0G4c/U1BmTAD43Tx3y2tElUmDH6yqNTSUfbAyiK+0hjMlougoMAX/KG1Ai4HsoXJel
 PF1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NQupA5Y18UtYDXxrSHsWoqHw/Jxb7tl2Kdbr+7k1aW8=;
 b=r5yWgv9IY60+FpzNpLY75EN0JyJmPGxdZS0aTKe4J1DBIdWwuTXodqrW3qSu4GEefc
 HoL4OpNXVy/NBFhyU1RT7oac1FHsrMvB1ch6Sjketpiqn0xr8Pwzv696Elk5fbsAawyq
 R3WAmNPnM9ttubpTBOcNXwAnUzoSlcA4mWLcEqlkN/+WH+PFXGY9QjkQd41rAPlzDAon
 1bVca2kY+2vDgjBUeKVoj/+ZgUTcoXSBP8muVVNYrwrO8Pc+4nKnP2KhjlSjoITbasZO
 qWeJyCPwnp9tA6VmmMlcRrQw41CXcdWHJ3WHTz9+Q5KQqh1cURd7bmpjylcw7gZ6la+1
 RQuA==
X-Gm-Message-State: AOAM531r/JbYc8NU3SVHi3GTIQS04gJONog0prGOfQwDuGugsPQYjTPb
 43TvXVQbr1TfeT54uTFZ4wj619h6T/Q+6g==
X-Google-Smtp-Source: ABdhPJyRTIsvxsF3ncyuOhnWebUMrUaYXkDsjLwAbc53ugv0wCc3h4gZiqRszqBLeqiy2+A7Cal/Aw==
X-Received: by 2002:ac2:4304:: with SMTP id l4mr27635248lfh.304.1643896906742; 
 Thu, 03 Feb 2022 06:01:46 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id u26sm2583661lfi.307.2022.02.03.06.01.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Feb 2022 06:01:46 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Date: Thu,  3 Feb 2022 15:01:39 +0100
Message-Id: <20220203140141.310870-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220203140141.310870-1-edgar.iglesias@gmail.com>
References: <20220203140141.310870-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::131
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x131.google.com
X-Spam_score_int: -12
X-Spam_score: -1.3
X-Spam_bar: -
X-Spam_report: (-1.3 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, f4bug@amsat.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP CRF - Clock Reset FPD device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 99ceb8a609..d5a3ad3df2 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -38,6 +38,7 @@
 #include "hw/dma/xlnx_csu_dma.h"
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
+#include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -122,6 +123,7 @@ struct XlnxZynqMPState {
     XlnxZDMA gdma[XLNX_ZYNQMP_NUM_GDMA_CH];
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
+    XlnxZynqMPCRF crf;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3dae51a786..9f433ee5d8 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -51,6 +51,9 @@
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
 
+#define CRF_ADDR            0xfd1a0000
+#define CRF_IRQ             120
+
 /* Serializer/Deserializer.  */
 #define SERDES_ADDR         0xfd400000
 #define SERDES_SIZE         0x20000
@@ -280,6 +283,18 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
 }
 
+static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+
+    object_initialize_child(OBJECT(s), "crf", &s->crf, TYPE_XLNX_ZYNQMP_CRF);
+    sbd = SYS_BUS_DEVICE(&s->crf);
+
+    sysbus_realize(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, CRF_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
+}
+
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -683,6 +698,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1


