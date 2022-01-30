Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD1CC4A3AEA
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Jan 2022 00:16:34 +0100 (CET)
Received: from localhost ([::1]:44810 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nEJQv-0006hd-Cg
	for lists+qemu-devel@lfdr.de; Sun, 30 Jan 2022 18:16:33 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35012)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMr-00039u-Q3; Sun, 30 Jan 2022 18:12:21 -0500
Received: from [2a00:1450:4864:20::135] (port=37810
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nEJMn-0000w9-Du; Sun, 30 Jan 2022 18:12:21 -0500
Received: by mail-lf1-x135.google.com with SMTP id n8so23223490lfq.4;
 Sun, 30 Jan 2022 15:12:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bd2AMWAUfiP5xzyAtAcOhyVGbieKTdY7Q9XEQbU5ajc=;
 b=IEC9XlcFjS4A3HVSJUSMiqaecFuQAy2RFMt2seBqlSYVdCVRXO+WZcB9lQwqidpt15
 mf/f3mKoVNJz2VdvDE+7EsP4xlvdKVZqRTVNokDuigAVV0AVK86wNJrQblMkGJF+SQUV
 Nqos/FZJ1NYyD4UzZ7bOKca4cDoVQ94lobaFfVse42FKuIY0Js80sg6Owsqh8/9lyz8y
 h/2drT/ZxpjSE9ESnoITT9l3qKFAuSJxnZvsN1a7BPM2/zM5WgwucwAaeCqQ6NT0Q2ce
 dM3dt6C1jmXQYWpPR9uvA470fCDE88NbYFTEtLHrRSAMLS/NmaYY4fZBa1uaU/4ETeCT
 xcNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bd2AMWAUfiP5xzyAtAcOhyVGbieKTdY7Q9XEQbU5ajc=;
 b=W5DkzzhtJ1RCdcf40ihV67nCo+a5x1gWJwrX+NBont50ICtrzC+KV9j+HoyuxFkFr7
 Z4JE/cUa204vZLJ/me0jCZkj13KF9gPl7bJCzGj1oEsaYVmYeucB6UqTxJrmAhBlqQqM
 UscvXJHj979y8kT5JH8iQyh6otO7uK1W6X0wWFtw0cpAymbaV2qj+GBY7XPjbBPq/6tB
 NdJLECDw3RcpI5vZW3YDqvK8tYZLB+ZsSN3p8H7/N8/B0yi0tr492YRGSubMzirWPavU
 LMkHeziMPVWKCr3uKNxQ2ZmeL0f05DnAsGD2srEKa1b3grddQfUFKib2zIWX7O+Deddz
 8zMg==
X-Gm-Message-State: AOAM533kQNMx7ZfsfHwCI8D2pLxWLJ1ZRvra1mBe4/MDDR1rQQMxclKm
 Rb+9v7+pgtdXKi0hW3SxQsCuxdi7cyXiZQ==
X-Google-Smtp-Source: ABdhPJz/1URFDeQPYLKpsegs4SkliBE3KRQQlE60yUeXzYnKJkuEipC2gTakMbArtIFVWTGT9IqBiQ==
X-Received: by 2002:a05:6512:305:: with SMTP id
 t5mr13358174lfp.165.1643584331605; 
 Sun, 30 Jan 2022 15:12:11 -0800 (PST)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id f5sm154579ljm.84.2022.01.30.15.12.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 15:12:11 -0800 (PST)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v1 4/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Date: Mon, 31 Jan 2022 00:12:04 +0100
Message-Id: <20220130231206.34035-5-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130231206.34035-1-edgar.iglesias@gmail.com>
References: <20220130231206.34035-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
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
 richard.henderson@linaro.org, francisco.iglesias@xilinx.com,
 frederic.konrad@adacore.com, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP CRF - Clock Reset FPD device.

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
index ba44e95899..857d3c9636 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -51,6 +51,9 @@
 #define QSPI_IRQ            15
 #define QSPI_DMA_ADDR       0xff0f0800
 
+#define CRF_ADDR            0xfd1a0000
+#define CRF_IRQ             120
+
 #define SERDES_ADDR         0xfd400000
 #define SERDES_SIZE         0x20000
 
@@ -279,6 +282,18 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
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
@@ -682,6 +697,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1


