Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E9D44F1935
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 18:14:50 +0200 (CEST)
Received: from localhost ([::1]:51940 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbPLt-0000pZ-8t
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 12:14:49 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44846)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvL-00053P-7G
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:23 -0400
Received: from [2a00:1450:4864:20::333] (port=38764
 helo=mail-wm1-x333.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOvH-0000YT-TC
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:22 -0400
Received: by mail-wm1-x333.google.com with SMTP id
 r11-20020a1c440b000000b0038ccb70e239so2342714wma.3
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RN7aOH0afMEAT2akl46RtlGW9JR9cRx5sHRZC9BW2bQ=;
 b=yiC7RO0vJJ15p0RTWtv58eHUuRwm11YYdShCOfiZ4LL/mLVRIJLF7ocvLqE2X6si7h
 NYSBugzSfMd2uU+LsDkiNN+cnbcnP7KAFwjsz9EtWdvti4Zes3EOLKx8mrily429LaTh
 GqPOzox2+gNYVlbSZ3daSIZHXhachp8g9u1AgOtZTPXIFqLasqA5RaTKXlnbMVNti2pW
 3jK3HlioPJE91zsOgHmyvV8e4tR/ccaQ3ADOX6NCQIzDpk56BByPSrFIC0yMK0mQDnX3
 skPSLIkYwh5dwA53Gv1uNQ8/ifwb/x1hadyxylEjatlZ3VqJp9qTaK1NEaw/yc3sa6lb
 w/ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RN7aOH0afMEAT2akl46RtlGW9JR9cRx5sHRZC9BW2bQ=;
 b=LQ44gK4S7NZ6atlYWkWfjPTbH8iY9nZMgntDqIpZluvShapAH3HMCp/C4SVQa1BJx+
 KvXgjUSIoNjqY58zCuLhqoYL5Y8HWBQA4bK5q7z3R+XYVqdIR3CazqxywYViyOwISWou
 s7FocqMfSW0xMXvtZEY/0KBUUzRG8dHzolJYi3uGXTFQWm/rpk6NHuLXTUvGxPb/XwWE
 EohPxJyyPRb6094B1/kkdzBIykD7XvIxW6khs0AKF/dg4EdGlH0cteNhoGNjf/U9SK3S
 D35L9UyjOTxZiZCnYqY1y0Q8UsrPCJnWT//sYtru9aHgaJH3dGJQ3CucplTPIx5stU3y
 wNOQ==
X-Gm-Message-State: AOAM533Sgdc2i1v7fF0DwKQ29jyC7uck5KBfdu6gYu5QFWQbGDlAU6NT
 ugUuoA9pEmAyMLeVJUGk3CZhBQ==
X-Google-Smtp-Source: ABdhPJykIDOvnhv/Cjgj/RW0Q6HEd5FVqXEaw+ZXOtD2oObDjMR+4aq7xPnEUTdZRgVQLWKmlh9o0g==
X-Received: by 2002:a05:600c:4e92:b0:38c:73e8:7dcd with SMTP id
 f18-20020a05600c4e9200b0038c73e87dcdmr127892wmq.196.1649087238629; 
 Mon, 04 Apr 2022 08:47:18 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:18 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 18/18] hw/arm/exynos4210: Drop Exynos4210Irq struct
Date: Mon,  4 Apr 2022 16:46:58 +0100
Message-Id: <20220404154658.565020-19-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::333
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x333.google.com
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

The only time we use the int_combiner_irq[] and ext_combiner_irq[]
arrays in the Exynos4210Irq struct is during realize of the SoC -- we
initialize them with the input IRQs of the combiner devices, and then
connect those to outputs of other devices in
exynos4210_init_board_irqs().  Now that the combiner objects are
easily accessible as s->int_combiner and s->ext_combiner we can make
the connections directly from one device to the other without going
via these arrays.

Since these are the only two remaining elements of Exynos4210Irq,
we can remove that struct entirely.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h |  6 ------
 hw/arm/exynos4210.c         | 34 ++++++++--------------------------
 2 files changed, 8 insertions(+), 32 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index d38be8767b3..97353f1c02f 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -82,17 +82,11 @@
  */
 #define EXYNOS4210_NUM_SPLITTERS (EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ + 38)
 
-typedef struct Exynos4210Irq {
-    qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
-    qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-} Exynos4210Irq;
-
 struct Exynos4210State {
     /*< private >*/
     SysBusDevice parent_obj;
     /*< public >*/
     ARMCPU *cpu[EXYNOS4210_NCPUS];
-    Exynos4210Irq irqs;
     qemu_irq irq_table[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 
     MemoryRegion chipid_mem;
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 27c6ab27123..8dafa2215b6 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -331,8 +331,9 @@ static int mapline_size(const int *mapline)
 static void exynos4210_init_board_irqs(Exynos4210State *s)
 {
     uint32_t grp, bit, irq_id, n;
-    Exynos4210Irq *is = &s->irqs;
     DeviceState *extgicdev = DEVICE(&s->ext_gic);
+    DeviceState *intcdev = DEVICE(&s->int_combiner);
+    DeviceState *extcdev = DEVICE(&s->ext_combiner);
     int splitcount = 0;
     DeviceState *splitter;
     const int *mapline;
@@ -375,8 +376,10 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
         splitin = 0;
         for (;;) {
             s->irq_table[in] = qdev_get_gpio_in(splitter, 0);
-            qdev_connect_gpio_out(splitter, splitin, is->int_combiner_irq[in]);
-            qdev_connect_gpio_out(splitter, splitin + 1, is->ext_combiner_irq[in]);
+            qdev_connect_gpio_out(splitter, splitin,
+                                  qdev_get_gpio_in(intcdev, in));
+            qdev_connect_gpio_out(splitter, splitin + 1,
+                                  qdev_get_gpio_in(extcdev, in));
             splitin += 2;
             if (!mapline) {
                 break;
@@ -414,11 +417,11 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
             qdev_realize(splitter, NULL, &error_abort);
             splitcount++;
             s->irq_table[n] = qdev_get_gpio_in(splitter, 0);
-            qdev_connect_gpio_out(splitter, 0, is->int_combiner_irq[n]);
+            qdev_connect_gpio_out(splitter, 0, qdev_get_gpio_in(intcdev, n));
             qdev_connect_gpio_out(splitter, 1,
                                   qdev_get_gpio_in(extgicdev, irq_id - 32));
         } else {
-            s->irq_table[n] = is->int_combiner_irq[n];
+            s->irq_table[n] = qdev_get_gpio_in(intcdev, n);
         }
     }
     /*
@@ -440,25 +443,6 @@ uint32_t exynos4210_get_irq(uint32_t grp, uint32_t bit)
     return EXYNOS4210_COMBINER_GET_IRQ_NUM(grp, bit);
 }
 
-/*
- * Get Combiner input GPIO into irqs structure
- */
-static void exynos4210_combiner_get_gpioin(Exynos4210Irq *irqs,
-                                           DeviceState *dev, int ext)
-{
-    int n;
-    int max;
-    qemu_irq *irq;
-
-    max = ext ? EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ :
-        EXYNOS4210_MAX_INT_COMBINER_IN_IRQ;
-    irq = ext ? irqs->ext_combiner_irq : irqs->int_combiner_irq;
-
-    for (n = 0; n < max; n++) {
-        irq[n] = qdev_get_gpio_in(dev, n);
-    }
-}
-
 static uint8_t chipid_and_omr[] = { 0x11, 0x02, 0x21, 0x43,
                                     0x09, 0x00, 0x00, 0x00 };
 
@@ -630,7 +614,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->int_combiner), 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
 
     /* External Interrupt Combiner */
@@ -640,7 +623,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
         sysbus_connect_irq(busdev, n, qdev_get_gpio_in(DEVICE(&s->ext_gic), n));
     }
-    exynos4210_combiner_get_gpioin(&s->irqs, DEVICE(&s->ext_combiner), 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
 
     /* Initialize board IRQs. */
-- 
2.25.1


