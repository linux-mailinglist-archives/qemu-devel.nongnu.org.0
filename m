Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 114F1509EF4
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:50:07 +0200 (CEST)
Received: from localhost ([::1]:32808 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhVK2-0004Kp-5J
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:50:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59568)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqS-0003Hn-Rj
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:32 -0400
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:37807)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUqG-0003Xb-DV
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:27 -0400
Received: by mail-wr1-x42b.google.com with SMTP id t6so2774198wra.4
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=yNOaXUrJUAeJ+AixS5fcfCSvW1JdJPD9+7LfvbRwH6I=;
 b=aA/uLGOQsns/PX4347e8rd7Y08PUpzNqA8Pi3t/J/s4riXwYLlqIOfjzXRvlY6+35u
 TyuIwZiAliJ9Yd0gD53ytcH/BV9jyLnOkduKIZDxk9mdCPtIHkldXOtw/ppoI0ScpgnA
 yubLZf2oOlZqXVaiQ1b7VCt1uMGXUuoNK+36oD/sTgktbl3edCCqJ8Qj8V5/rPkKVAgc
 j7jRRsZXEZZ64mXRtJ8kGubKALqOhj8dL8vqoTavfbLCFgixRn7nONXMXoQD0BYbp0Ix
 tWSON7WbvSluiARaih7Ugy8DEwb6K2wcf+baz/vNO2JQLeNs0J0rGDb8HEZQMYf8pI2u
 aAIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yNOaXUrJUAeJ+AixS5fcfCSvW1JdJPD9+7LfvbRwH6I=;
 b=4GozdLVR3xqNzfl3yiLAtKUeKKfOai9n526I2PDSjm6jVpQUD8oq8gTbdk89yj28gj
 tacXDzBWQSXiHPVuZI8Z0YXmmLOIwC9Xt4l43oblS45wwVlXUotxyxK/WKEKuEl6B87L
 3E+Q1APV6SrF57pdNBLtEoAJj5+PU0++2rJUXjuZJg3ma0SVavuCnOLMM2EsC3v3p+WK
 OddKPICplMb+lqU7n9R/e52asXYsJIBOrVYF6D9mrxvETrX6L8W3VS/7e0Dm1ja7h/XS
 oAV8EG0vTPSY/sB4espYJ4oDqRm7TpSyp3iOqHLxnkzE26iXnbzfRAIER6nlbOzbQ9Bv
 d7yw==
X-Gm-Message-State: AOAM530NKWuG7eyULG2z6+CbYSPApjHFZ3DqAorvi+CIhoXZ15oIZVxl
 dQ76mvaQ+SE5KJ8qbM9w6WQR+zdcgOPh1g==
X-Google-Smtp-Source: ABdhPJxn2oZX9qFgaE+Ck6PCYAcg18FFsCknXiZN+Rb5yZAE/Zdhfj18jEAeSy1YCa+nEb+0yXnFqg==
X-Received: by 2002:a05:6000:156a:b0:20a:9c1b:6b1b with SMTP id
 10-20020a056000156a00b0020a9c1b6b1bmr13222289wrz.683.1650539952579; 
 Thu, 21 Apr 2022 04:19:12 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.11
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:12 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 25/31] hw/arm/exynos4210: Drop Exynos4210Irq struct
Date: Thu, 21 Apr 2022 12:18:40 +0100
Message-Id: <20220421111846.2011565-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-19-peter.maydell@linaro.org
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


