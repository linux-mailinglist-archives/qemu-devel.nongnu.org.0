Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0502A4F18EB
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:54:36 +0200 (CEST)
Received: from localhost ([::1]:54136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP2J-0005xd-3r
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:54:35 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv4-0004lu-A1
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:06 -0400
Received: from [2a00:1450:4864:20::431] (port=41608
 helo=mail-wr1-x431.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv1-0000Rq-0X
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:05 -0400
Received: by mail-wr1-x431.google.com with SMTP id k23so2585596wrd.8
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lPVeqGU3QtuMTZFr+Heg6nSw8gOhs+MYyoNagN2IvIs=;
 b=OtX6+S3DxsnKaCee2O008thC7nKFNzXl/Sxv/3vdg30RisSyj3K7XJ/2+PiW4+1cqO
 gzOxKkjVCLsQigTXy3mqVSySInKZy1cIbDNogOaWZQ7TOQyMkuUajgzeRo96/1uD+bvw
 D6qm4jAaKat5E/sVq3PcAUABe6V0SoQJmrcjwCVZttOMctiNnvSJ3gtEZMDLMQaCuVyr
 SbdbfKPDCl8iE6L+p2pAlU08RQK5onF7WmYUEcRm/w7XVUv8mUNVgxsUyObOg3KNyajZ
 2DlcY05VZpxEfX/PeGF3T9s8sy9GELTSpvYn51jBGYYl4dmV45Jj48gvrSBMCGZXTIuX
 +j3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lPVeqGU3QtuMTZFr+Heg6nSw8gOhs+MYyoNagN2IvIs=;
 b=H/ROiOedzvflvQdMKSNFpVHucR7X+tjf3ZR1DkaEACXIg/E1d02wqvkq6/allO0uBn
 NJOgVkHvkhvbNXwEG/OYyO/KTWBfIWHdCoTQqQUgk73+y7MgmcqzbA2GJ/sw2mXUlY5i
 65KJVDW9ZsnX3NGN+HjJ7YSBMqaMt5t6CQfIMskMmboAT89JRcT8DUn21MnaGuwiNOw4
 Q0pyl7yPIvWVdzLVDY2nqftv1TpkYfwi3/HYqfBxvn/eZi8lbvJi9Pws9FuEKMV5L+ie
 yIMlxbpUPM6FTinS11ozWQoj4tAY/9Xs6jY5k2lygIMDyGmspudbFONz9o0qeVp0JfwF
 P1LA==
X-Gm-Message-State: AOAM531NoZtrnGrwtzmHL1LD6sS0Hy0T/9MhYhz/FTHUyFLWNEr/9iJV
 cjlCcGTUjXWNkF/wFwpt9CcyUTWb0lNe5g==
X-Google-Smtp-Source: ABdhPJxDMXxoB4OUObXJGuSl/5ENbh5YLhHk0Hoz2Ga+DipSrZnShbKZmT3Agvf0jpDMUH5D/wMqmw==
X-Received: by 2002:adf:f24d:0:b0:206:96b:4ea1 with SMTP id
 b13-20020adff24d000000b00206096b4ea1mr284796wrp.694.1649087221620; 
 Mon, 04 Apr 2022 08:47:01 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:01 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 01/18] hw/arm/exynos4210: Use TYPE_OR_IRQ instead of
 custom OR-gate device
Date: Mon,  4 Apr 2022 16:46:41 +0100
Message-Id: <20220404154658.565020-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::431
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::431;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x431.google.com
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
 Zongyuan Li <zongyuan.li@smartx.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The Exynos4210 SoC device currently uses a custom device
"exynos4210.irq_gate" to model the OR gate that feeds each CPU's IRQ
line.  We have a standard TYPE_OR_IRQ device for this now, so use
that instead.

(This is a migration compatibility break, but that is OK for this
machine type.)

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  1 +
 hw/arm/exynos4210.c         | 31 ++++++++++++++++---------------
 2 files changed, 17 insertions(+), 15 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 60b9e126f55..3999034053e 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -102,6 +102,7 @@ struct Exynos4210State {
     MemoryRegion bootreg_mem;
     I2CBus *i2c_if[EXYNOS4210_I2C_NUMBER];
     qemu_or_irq pl330_irq_orgate[EXYNOS4210_NUM_DMA];
+    qemu_or_irq cpu_irq_orgate[EXYNOS4210_NCPUS];
 };
 
 #define TYPE_EXYNOS4210_SOC "exynos4210"
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 0299e81f853..dfc0a4eec25 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -205,7 +205,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 {
     Exynos4210State *s = EXYNOS4210_SOC(socdev);
     MemoryRegion *system_mem = get_system_memory();
-    qemu_irq gate_irq[EXYNOS4210_NCPUS][EXYNOS4210_IRQ_GATE_NINPUTS];
     SysBusDevice *busdev;
     DeviceState *dev, *uart[4], *pl330[3];
     int i, n;
@@ -235,18 +234,13 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
 
     /* IRQ Gate */
     for (i = 0; i < EXYNOS4210_NCPUS; i++) {
-        dev = qdev_new("exynos4210.irq_gate");
-        qdev_prop_set_uint32(dev, "n_in", EXYNOS4210_IRQ_GATE_NINPUTS);
-        sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
-        /* Get IRQ Gate input in gate_irq */
-        for (n = 0; n < EXYNOS4210_IRQ_GATE_NINPUTS; n++) {
-            gate_irq[i][n] = qdev_get_gpio_in(dev, n);
-        }
-        busdev = SYS_BUS_DEVICE(dev);
-
-        /* Connect IRQ Gate output to CPU's IRQ line */
-        sysbus_connect_irq(busdev, 0,
-                           qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
+        DeviceState *orgate = DEVICE(&s->cpu_irq_orgate[i]);
+        object_property_set_int(OBJECT(orgate), "num-lines",
+                                EXYNOS4210_IRQ_GATE_NINPUTS,
+                                &error_abort);
+        qdev_realize(orgate, NULL, &error_abort);
+        qdev_connect_gpio_out(orgate, 0,
+                              qdev_get_gpio_in(DEVICE(s->cpu[i]), ARM_CPU_IRQ));
     }
 
     /* Private memory region and Internal GIC */
@@ -256,7 +250,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_SMP_PRIVATE_BASE_ADDR);
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        sysbus_connect_irq(busdev, n, gate_irq[n][0]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
     for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
         s->irqs.int_gic_irq[n] = qdev_get_gpio_in(dev, n);
@@ -275,7 +270,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     /* Map Distributer interface */
     sysbus_mmio_map(busdev, 1, EXYNOS4210_EXT_GIC_DIST_BASE_ADDR);
     for (n = 0; n < EXYNOS4210_NCPUS; n++) {
-        sysbus_connect_irq(busdev, n, gate_irq[n][1]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 1));
     }
     for (n = 0; n < EXYNOS4210_EXT_GIC_NIRQ; n++) {
         s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(dev, n);
@@ -488,6 +484,11 @@ static void exynos4210_init(Object *obj)
         object_initialize_child(obj, name, orgate, TYPE_OR_IRQ);
         g_free(name);
     }
+
+    for (i = 0; i < ARRAY_SIZE(s->cpu_irq_orgate); i++) {
+        g_autofree char *name = g_strdup_printf("cpu-irq-orgate%d", i);
+        object_initialize_child(obj, name, &s->cpu_irq_orgate[i], TYPE_OR_IRQ);
+    }
 }
 
 static void exynos4210_class_init(ObjectClass *klass, void *data)
-- 
2.25.1


