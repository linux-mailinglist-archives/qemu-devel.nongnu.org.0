Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA6C509E84
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:26:17 +0200 (CEST)
Received: from localhost ([::1]:42848 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhUwy-00038w-MA
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:26:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpq-0002k5-6I
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:54 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:42864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpo-0003QB-0Y
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:18:53 -0400
Received: by mail-wr1-x429.google.com with SMTP id bv16so6181619wrb.9
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:18:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=f47lw1QPcXaJplbJJd1gYAYuTWuO7WWJTSxjhTHJnU4=;
 b=Ffg3eyFjT+HmD1OynSuN7IaOH5LGe6roPgC/RFrlP5CldS7QsqBrvOh9oV3kI7aOeY
 TjfhdZZgVRoEPk5vvWYBGvlpglQXnahTTiEmo5UdrNNX+SQM1EHa7ETkklb8eVJgbVzi
 vTKJ5FdY74l2dLK7Y7L9AKBRQzd5vD/NWkE0OtM5Nnwo4eRIw3bKC3Qp9JJqKPkSmIoY
 RU63Z22Lr3w1p5YsfoPoEGXS8Ub0uaykfcTp63IE4gxi0i4y8m1syHzzuK3S3dIO4VLj
 8iCJkCtO1F2hS5wc9nBZjigomYcnQkbzR1WhHqoeEycJfiUKrV2NIWVp+TwB060+5Fwn
 7Gow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=f47lw1QPcXaJplbJJd1gYAYuTWuO7WWJTSxjhTHJnU4=;
 b=rdroUZ+9vCWYvHrtMLEXjSqn13tv/5XVq+86DD24na9p7NxMhP+wwJnL4HaAXgZned
 OsE786GPhGmqrs0Qp5gUcJBks8xQk/N4jeJ3eRqmUFmJrdWTRHDVHBiUzI9Os0MdhwdY
 8WQ4YVleIfYkzwSK8jXqSVip9i8oamA0emG/LrzY7X8+2kevlO0qCKDqL0J9URmIXBlh
 ocWJ4lNM5n1gIBGAV+klK7kcmF33QIX0NJYDPLPoD62XWq+odbiQiUZn/ukuCLQEpx8t
 JSjbncds+EhkYUHR1x1qJn1ElMqcLHeVjZ0Pf+TJx9u8tyomrnsrHh3k4cK/l6su7vY5
 142Q==
X-Gm-Message-State: AOAM5327/mMZyIXU0eiGvnfoipLTC80v0U4NrpZFIuz1giuBD27/N1tQ
 RHg0bfLbsK7qARW1v3+3LIuLCnf9HYDPIQ==
X-Google-Smtp-Source: ABdhPJyfXnSbUvWYQDvnpgLsh49pZLkmgGtutdiNQW9xnLraJBnlVRVdjZxN3QJW56Y8dEW9s2x5Sg==
X-Received: by 2002:a5d:4a81:0:b0:207:9abe:2908 with SMTP id
 o1-20020a5d4a81000000b002079abe2908mr18818289wrq.341.1650539930676; 
 Thu, 21 Apr 2022 04:18:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.18.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:18:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 03/31] hw/arm/xlnx-zynqmp: Connect 4 TTC timers
Date: Thu, 21 Apr 2022 12:18:18 +0100
Message-Id: <20220421111846.2011565-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: "Edgar E. Iglesias" <edgar.iglesias@amd.com>

Connect the 4 TTC timers on the ZynqMP.

Signed-off-by: Edgar E. Iglesias <edgar.iglesias@amd.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Luc Michel <luc@lmichel.fr>
Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
Message-id: 20220331222017.2914409-3-edgar.iglesias@gmail.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/xlnx-zynqmp.h |  4 ++++
 hw/arm/xlnx-zynqmp.c         | 22 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/include/hw/arm/xlnx-zynqmp.h b/include/hw/arm/xlnx-zynqmp.h
index 9d9a9d0bf9d..85fd9f53daa 100644
--- a/include/hw/arm/xlnx-zynqmp.h
+++ b/include/hw/arm/xlnx-zynqmp.h
@@ -41,6 +41,7 @@
 #include "hw/or-irq.h"
 #include "hw/misc/xlnx-zynqmp-apu-ctrl.h"
 #include "hw/misc/xlnx-zynqmp-crf.h"
+#include "hw/timer/cadence_ttc.h"
 
 #define TYPE_XLNX_ZYNQMP "xlnx-zynqmp"
 OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
@@ -84,6 +85,8 @@ OBJECT_DECLARE_SIMPLE_TYPE(XlnxZynqMPState, XLNX_ZYNQMP)
 #define XLNX_ZYNQMP_MAX_RAM_SIZE (XLNX_ZYNQMP_MAX_LOW_RAM_SIZE + \
                                   XLNX_ZYNQMP_MAX_HIGH_RAM_SIZE)
 
+#define XLNX_ZYNQMP_NUM_TTC 4
+
 /*
  * Unimplemented mmio regions needed to boot some images.
  */
@@ -128,6 +131,7 @@ struct XlnxZynqMPState {
     qemu_or_irq qspi_irq_orgate;
     XlnxZynqMPAPUCtrl apu_ctrl;
     XlnxZynqMPCRF crf;
+    CadenceTTCState ttc[XLNX_ZYNQMP_NUM_TTC];
 
     char *boot_cpu;
     ARMCPU *boot_cpu_ptr;
diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 5bfe285a191..375309e68eb 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -68,6 +68,9 @@
 #define APU_ADDR            0xfd5c0000
 #define APU_IRQ             153
 
+#define TTC0_ADDR           0xFF110000
+#define TTC0_IRQ            36
+
 #define IPI_ADDR            0xFF300000
 #define IPI_IRQ             64
 
@@ -316,6 +319,24 @@ static void xlnx_zynqmp_create_crf(XlnxZynqMPState *s, qemu_irq *gic)
     sysbus_connect_irq(sbd, 0, gic[CRF_IRQ]);
 }
 
+static void xlnx_zynqmp_create_ttc(XlnxZynqMPState *s, qemu_irq *gic)
+{
+    SysBusDevice *sbd;
+    int i, irq;
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_TTC; i++) {
+        object_initialize_child(OBJECT(s), "ttc[*]", &s->ttc[i],
+                                TYPE_CADENCE_TTC);
+        sbd = SYS_BUS_DEVICE(&s->ttc[i]);
+
+        sysbus_realize(sbd, &error_fatal);
+        sysbus_mmio_map(sbd, 0, TTC0_ADDR + i * 0x10000);
+        for (irq = 0; irq < 3; irq++) {
+            sysbus_connect_irq(sbd, irq, gic[TTC0_IRQ + i * 3 + irq]);
+        }
+    }
+}
+
 static void xlnx_zynqmp_create_unimp_mmio(XlnxZynqMPState *s)
 {
     static const struct UnimpInfo {
@@ -721,6 +742,7 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
     xlnx_zynqmp_create_efuse(s, gic_spi);
     xlnx_zynqmp_create_apu_ctrl(s, gic_spi);
     xlnx_zynqmp_create_crf(s, gic_spi);
+    xlnx_zynqmp_create_ttc(s, gic_spi);
     xlnx_zynqmp_create_unimp_mmio(s);
 
     for (i = 0; i < XLNX_ZYNQMP_NUM_GDMA_CH; i++) {
-- 
2.25.1


