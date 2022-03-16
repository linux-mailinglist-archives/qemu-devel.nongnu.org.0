Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ABACD4DB6D3
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Mar 2022 17:57:29 +0100 (CET)
Received: from localhost ([::1]:52788 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nUWxk-0005hY-Qc
	for lists+qemu-devel@lfdr.de; Wed, 16 Mar 2022 12:57:28 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39702)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnc-0000DB-Ci; Wed, 16 Mar 2022 12:47:02 -0400
Received: from [2a00:1450:4864:20::135] (port=36369
 helo=mail-lf1-x135.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <edgar.iglesias@gmail.com>)
 id 1nUWnY-0006F8-Jl; Wed, 16 Mar 2022 12:46:59 -0400
Received: by mail-lf1-x135.google.com with SMTP id bt26so4746159lfb.3;
 Wed, 16 Mar 2022 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tGTBF/y2wQbN0XmDkMvRwX4ezSjQX0z4lRw24qY9In0=;
 b=DzUhXEcu9boutu1Eli9iJqOUK0Fs6lE56BzkMGjyauH8S2J4ddTfFitLJC/+wo6wBK
 85eSRhfkEaLxqpu36Ol++aGyFNi4WrRbLJTjR8Ma4ngt8EeXp95KlQ8fTptNqy+ermjq
 pDlQAavUJumSG8hTQfrmWLnnbrprI49wFBNz02Xw7GtfoeGuMJj85CeKuktGgpj2fjed
 7997Qny2OCx6q5i4Hc/N0cT+Hzdx+zJ2jzpOesohMBp2ceq3KOkLIMH9uMl1jY9DQs72
 y0CMZYyYJPfpqUkBKkDtVzmSnOv0EsAmoKot0f4dAJRiQlwX7rdBi0lDS/HFG9WZssG2
 ks3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tGTBF/y2wQbN0XmDkMvRwX4ezSjQX0z4lRw24qY9In0=;
 b=2Cee7jXd/ml9n0drkZpyc/9+jKsE0Kt7zcPKr0/M4cnUP4OjQVdxUqSacI1vXOGJr2
 k+wMp7thU+V+vLIKC79GQBpOZISpWR73Kbb5EAk6dFuIBVjxXE5iyl5huTexft8mLMAC
 9XsbZHzENqUHUqguRiLYjvxgE0DBds63q4+sicpAXh5h8Ca+fKAAhwOTzHJDaX2/Hoxw
 Cp+fsUilQwmQlpKZNCgZlguO91E6Q7gUMBgiENzJ5dvOrXQ2yrVlAW3XU8CyS2ruxi0I
 x7oPmRx2NUo2uxVacXi09Z2/LYa17fMVZQtG3VdvpiX1p4fjiJeQLwDL6O6xk+E6fK1L
 zpVQ==
X-Gm-Message-State: AOAM530RkYd0TIn7hyqzJmoRu7hJB5FDrKhF7mdXJ+KoPkA2OB/+pLF4
 gW353N98OHQ68n+ggZ5Xh+7pBj6tPiRkoA==
X-Google-Smtp-Source: ABdhPJwMk1KuG5a/f6Y4wqrZJ8QVSSOvyCyc4w3jhu0W0YQqTFTl1L2R4guNtesYJgV8tJKQf9CmIQ==
X-Received: by 2002:a05:6512:1150:b0:449:f3c4:cc65 with SMTP id
 m16-20020a056512115000b00449f3c4cc65mr126191lfg.615.1647449213837; 
 Wed, 16 Mar 2022 09:46:53 -0700 (PDT)
Received: from gmail.com (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
 by smtp.gmail.com with ESMTPSA id
 x33-20020a0565123fa100b00443d3cffd89sm217135lfa.210.2022.03.16.09.46.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 09:46:53 -0700 (PDT)
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 6/6] hw/arm/xlnx-zynqmp: Connect the ZynqMP APU Control
Date: Wed, 16 Mar 2022 17:46:45 +0100
Message-Id: <20220316164645.2303510-7-edgar.iglesias@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
References: <20220316164645.2303510-1-edgar.iglesias@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::135
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::135;
 envelope-from=edgar.iglesias@gmail.com; helo=mail-lf1-x135.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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
Cc: edgar.iglesias@xilinx.com, peter.maydell@linaro.org, luc@lmichel.fr,
 edgar.iglesias@amd.com, sai.pavan.boddu@xilinx.com, frasse.iglesias@gmail.com,
 alistair@alistair23.me, richard.henderson@linaro.org, f4bug@amsat.org,
 francisco.iglesias@xilinx.com, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>

Connect the ZynqMP APU Control device.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Francisco Iglesias <francisco.iglesias@xilinx.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
---
 include/hw/arm/xlnx-zynqmp.h |  4 +++-
 hw/arm/xlnx-zynqmp.c         | 25 +++++++++++++++++++++++--
 2 files changed, 26 insertions(+), 3 deletions(-)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 7938f223a4..9d9a9d0bf9 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -39,6 +39,7 @@
 #include "hw/nvram/xlnx-bbram.h"
 #include "hw/nvram/xlnx-zynqmp-efuse.h"
 #include "hw/or-irq.h"
+#include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
@@ -86,7 +87,7 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
-#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 2
+#define XLNX_ZYNQMP_NUM_UNIMP_AREAS 1
 
 struct XlnxZynqMPState {
     /*< private >*/
@@ -125,6 +126,7 @@ struct XlnxZynqMPState {
     XlnxZDMA adma[XLNX_ZYNQMP_NUM_ADMA_CH];
     XlnxCSUDMA qspi_dma;
     qemu_or_irq qspi_irq_orgate;
+    XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
 
     char *boot_cpu;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index f4575eea7f..5bfe285a19 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -66,7 +66,7 @@
 #define DPDMA_IRQ           116
 
 #define APU_ADDR            0xfd5c0000
-#define APU_SIZE            0x100
+#define APU_IRQ             153
 
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
@@ -283,6 +283,27 @@ static void xlnx_zynqmp_create_efuse(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[EFUSE_IRQ]);
 }
 
+static void xlnx_zynqmp_create_apu_ctrl(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+    int i;
+
+    object_initialize_child(OBJECT(s), "apu-ctrl", &s->apu_ctrl,
+                            TYPE_XLNX_ZYNQMP_APU_CTRL);
+    sbd = SYS_BUS_DEVICE(&s->apu_ctrl);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_APU_CPUS; i++) {
+        g_autofree gchar *name = g_strdup_printf("cpu%d", i);
+
+        object_property_set_link(OBJECT(&s->apu_ctrl), name,
+                                 OBJECT(&s->apu_cpu[i]), &error_abort);
+    }
+
+    sysbus_realize(sbd, &error_fatal);
+    sysbus_mmio_map(sbd, 0, APU_ADDR);
+    sysbus_connect_irq(sbd, 0, gic[APU_IRQ]);
+}
+
 static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
 {
     SysBusDevice *sbd;
@@ -302,7 +323,6 @@ static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
         hwaddr base;
         hwaddr size;
     } unimp_areas[ARRAY_SIZE(s->mr_unimp)] = {
-        { .name = "apu", APU_ADDR, APU_SIZE },
         { .name = "serdes", SERDES_ADDR, SERDES_SIZE },
     };
     unsigned int nr;
@@ -699,6 +719,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     xlnx_zynqmp_create_bbram(s, gic_spi);
     xlnx_zynqmp_create_efuse(s, gic_spi);
+    xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
-- 
2.25.1


