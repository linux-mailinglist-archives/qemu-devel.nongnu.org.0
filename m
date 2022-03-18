Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCF34DDA9F
	for <lists+qemu-devel@lfdr.de>; Fri, 18 Mar 2022 14:35:57 +0100 (CET)
Received: from localhost ([::1]:49742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nVClo-00017P-Ca
	for lists+qemu-devel@lfdr.de; Fri, 18 Mar 2022 09:35:56 -0400
Received: from eggs.gnu.org ([209.51.188.92]:46238)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZk-0006pZ-GS
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:28 -0400
Received: from [2a00:1450:4864:20::42a] (port=45975
 helo=mail-wr1-x42a.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nVCZi-0002D6-SB
 for qemu-devel@nongnu.org; Fri, 18 Mar 2022 09:23:28 -0400
Received: by mail-wr1-x42a.google.com with SMTP id p9so11694338wra.12
 for <qemu-devel@nongnu.org>; Fri, 18 Mar 2022 06:23:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=M+rv6/ppXtq2kDSvTeXWplmy40yq0BQABdfBEeBpaGI=;
 b=JTu3oHDjBG+azCn/Wf6D0XLy2UuC4BQqXRFQfMEh0av75+G0tUlQmiuvG9dN77IGDV
 7vR5BkAc2GfuvomikXN53B9NhevucOb9RigLh+4tcl0j/Ry+Y4K/WGBO2ufYJMeApkVr
 0vuK1DBGPJIh4Id99fdWAmaBfM1TVuBhW85K214xJegS8vShtOblbzyQUPfyu6v+Q+9/
 KIjhC6M0rWfdtoiffWTb8RzzY0FpevEErj/fAHm/OMhE8biNA8xfyvRVNapqR71CWZwy
 wqCyzqZ6rqdsG1QAfXqjYhS7galKaqS0oLhe7FbgDdOf7OivtGXbbBnXzYnla9SMPRMM
 yLtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=M+rv6/ppXtq2kDSvTeXWplmy40yq0BQABdfBEeBpaGI=;
 b=WcnNhQrjrc/PIgwAosCAoQuqpvXmdSVrX3JHuI41bzwI+qaOKK86IdeGNyA+FABUk8
 8jNAqyTgi2JzZxtEVipQChHP0YhGLTc2RODNv+cVlAkT7Adx9cEg7G2+QhypzlqihR13
 gaIdvZkx3V9ib9BRfCfPxbNtA2wILF+5Anxy9z7Gown+XiyFNquCz65EwrVhmyKaTgEH
 fxMQZz60CXBovDt0JXeyKtlLKMIrBhMBdmdh2+ICCVRHXD1N8KRPVz/D8p8tMFk5xHik
 KOm9qi+Stk7AoBOdKXilFobhtIET33fUtFYO4QtuphQP14R7tJds/WcDi5/uYlLw+zM6
 q2qQ==
X-Gm-Message-State: AOAM533LutJDdLquD2dN9XoZ0tkocF4cA4/PNczUifPTll75ApWME3E7
 D4VdskU1NklHFF00F8VXrw9tkNrWkguZjA==
X-Google-Smtp-Source: ABdhPJz6x/uFS9FsYLgZoyfdeNolhzwG/lkPXDZLHx+HDbfAzw2DrdbBUotuPdIaEmxeLO56SSu69A==
X-Received: by 2002:adf:dd4d:0:b0:203:f178:b78b with SMTP id
 u13-20020adfdd4d000000b00203f178b78bmr4678716wrm.93.1647609805520; 
 Fri, 18 Mar 2022 06:23:25 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a05600015cf00b00203e324347bsm6316599wry.102.2022.03.18.06.23.24
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Mar 2022 06:23:25 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/21] hw/arm/xlnx-zynqmp: Connect the ZynqMP CRF
Date: Fri, 18 Mar 2022 13:23:01 +0000
Message-Id: <20220318132306.3254960-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220318132306.3254960-1-peter.maydell@linaro.org>
References: <20220318132306.3254960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42a
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 PDS_HP_HELO_NORDNS=0.659, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP CRF - Clock Reset FPD device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Message-id: 20220316164645.2303510-5-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  2 ++
 hw/arm/xlnx-zynqmp.c         | 16 ++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 0552ba18b41..7938f223a4a 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -39,6 +39,7 @@
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
 #include "hw/or-irq.h"
+#include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -124,6 +125,7 @@ struct XlnxZynqMPState {
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
     qemu_or_irq qspi_irq_orgate;
+    XlnxZynqMPCRF crf;
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 47324cdc441..f4575eea7fa 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -52,6 +52,9 @@
 #define QSPI_DMA_ADDR       0xff0f0800
 #define NUM_QSPI_IRQ_LINES  2
 
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
@@ -684,6 +699,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1


