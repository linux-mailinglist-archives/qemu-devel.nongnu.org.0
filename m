Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 68A033F8CB1
	for <lists+qemu-devel@lfdr.de>; Thu, 26 Aug 2021 19:07:12 +0200 (CEST)
Received: from localhost ([::1]:48266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mJIqN-00033y-FD
	for lists+qemu-devel@lfdr.de; Thu, 26 Aug 2021 13:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImd-00052a-Gm
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:19 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:46643)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mJImX-0008FV-H6
 for qemu-devel@nongnu.org; Thu, 26 Aug 2021 13:03:16 -0400
Received: by mail-wr1-x42a.google.com with SMTP id f5so6089565wrm.13
 for <qemu-devel@nongnu.org>; Thu, 26 Aug 2021 10:03:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=zsdsn6GEibPooC9i8v4/KTHqsG/TGIImbYgqLlFLm94=;
 b=vjOPRL+W4MnGR2V40YLm0LA+XN3r7WYiuYYLGcmawVmz+EQ92Af7PSTSSWKHX5uxEF
 4OS7U3SWhGJ3+RZKlii3epgOHhcphQSQLvEKs+H6yxV9lECZywa1O2wBD/rd+k8HsWAQ
 l/BOaHPb3w/0RnIdEjJG9JqEVgaI1SiGyL57my1HH3ppwIBbgnSziou06SxdIjpnCtCb
 gN7axgzf9mlTgWWd8uciZqBsNh3fuA5qwI1mlvT/DWIHUBV5xn+SU/akPCe8qAdt821K
 SnhhaO52LojFO/o2TOMbY3si28LsdOd9qvwCVKbI0+B0+5kdB5B4QdI1/rC2OJtLVNTL
 qsPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zsdsn6GEibPooC9i8v4/KTHqsG/TGIImbYgqLlFLm94=;
 b=RwHzQNdr7li/I6qJB6x6iTEscvGjnKK6ucX/s8Ly4EwXPUd+WD1C1/zAMtVqZMrzpp
 rlfQz3VCYaFSv3NbaMiSq7fI6I4ckH4s6HZFqyQV97gX/NlRrtS1H3kAfp6NzneTmxnQ
 WPqM9U0m1EtuvtzzUNGVSjUTZIBeynCaXjYeyCu7xBR4Krd+HgqpA9xERklgNYS0Tznl
 sJJN8fMZ+fi1Ex6UFfHvM60rrhLHmXL3t9AG/gQi9wesfdCdeuPeOdE6gjPQZxZaK2fr
 hkzHYcqIMD9gTxU8J8uTDQv35ArIW2UVqYIfkN3vPskW2pgVA9BZclvaFchyHogQvDzg
 3E1w==
X-Gm-Message-State: AOAM5323du9X2bRbu109H9d+SB1Sonsz317C1WL8yAsXJXyLK7Cb6BXF
 Kjg1VE+ziTy5WObjjx9l9LeHIrMdGA0a2Q==
X-Google-Smtp-Source: ABdhPJwHOSNoH20B4nUORfde1u3DQ9rjCwroAVGGTcUaCphCT9tRQ8jSQWZdp/FNS36q4jCPnBw+hw==
X-Received: by 2002:adf:e901:: with SMTP id f1mr5264854wrm.13.1629997391331;
 Thu, 26 Aug 2021 10:03:11 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id i21sm3632470wrb.62.2021.08.26.10.03.10
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Aug 2021 10:03:10 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 01/37] hw/arm/xlnx-zynqmp: Realize qspi controller *after*
 qspi_dma
Date: Thu, 26 Aug 2021 18:02:31 +0100
Message-Id: <20210826170307.27733-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210826170307.27733-1-peter.maydell@linaro.org>
References: <20210826170307.27733-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
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

From: Philippe Mathieu-Daudé <philmd@redhat.com>

If we link QOM object (a) as a property of QOM object (b),
we must set the property *before* (b) is realized.

Move QSPI realization *after* QSPI DMA.

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-id: 20210819163422.2863447-2-philmd@redhat.com
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 hw/arm/xlnx-zynqmp.c | 42 ++++++++++++++++++++----------------------
 1 file changed, 20 insertions(+), 22 deletions(-)

diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
index 3597e8db4de..9724978761b 100644
--- a/hw/arm/xlnx-zynqmp.c
+++ b/hw/arm/xlnx-zynqmp.c
@@ -570,26 +570,6 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
         g_free(bus_name);
     }
 
-    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
-        return;
-    }
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
-    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
-    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
-
-    for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
-        gchar *bus_name;
-        gchar *target_bus;
-
-        /* Alias controller SPI bus to the SoC itself */
-        bus_name = g_strdup_printf("qspi%d", i);
-        target_bus = g_strdup_printf("spi%d", i);
-        object_property_add_alias(OBJECT(s), bus_name,
-                                  OBJECT(&s->qspi), target_bus);
-        g_free(bus_name);
-        g_free(target_bus);
-    }
-
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->dp), errp)) {
         return;
     }
@@ -646,8 +626,26 @@ static void xlnx_zynqmp_realize(DeviceState *dev, Error **errp)
 
     sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi_dma), 0, QSPI_DMA_ADDR);
     sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi_dma), 0, gic_spi[QSPI_IRQ]);
-    object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
-                             OBJECT(&s->qspi_dma), errp);
+
+    if (!object_property_set_link(OBJECT(&s->qspi), "stream-connected-dma",
+                                  OBJECT(&s->qspi_dma), errp)) {
+         return;
+    }
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->qspi), errp)) {
+        return;
+    }
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 0, QSPI_ADDR);
+    sysbus_mmio_map(SYS_BUS_DEVICE(&s->qspi), 1, LQSPI_ADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(&s->qspi), 0, gic_spi[QSPI_IRQ]);
+
+    for (i = 0; i < XLNX_ZYNQMP_NUM_QSPI_BUS; i++) {
+        g_autofree gchar *bus_name = g_strdup_printf("qspi%d", i);
+        g_autofree gchar *target_bus = g_strdup_printf("spi%d", i);
+
+        /* Alias controller SPI bus to the SoC itself */
+        object_property_add_alias(OBJECT(s), bus_name,
+                                  OBJECT(&s->qspi), target_bus);
+    }
 }
 
 static Property xlnx_zynqmp_props[] = {
-- 
2.20.1


