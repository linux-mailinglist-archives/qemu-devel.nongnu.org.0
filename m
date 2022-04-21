Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 80F1A509E8F
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Apr 2022 13:32:46 +0200 (CEST)
Received: from localhost ([::1]:54224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhV3F-00041u-L4
	for lists+qemu-devel@lfdr.de; Thu, 21 Apr 2022 07:32:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59392)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUq1-00036s-Nc
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:06 -0400
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c]:35748)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nhUpz-0003VB-TB
 for qemu-devel@nongnu.org; Thu, 21 Apr 2022 07:19:05 -0400
Received: by mail-wr1-x42c.google.com with SMTP id k22so6228648wrd.2
 for <qemu-devel@nongnu.org>; Thu, 21 Apr 2022 04:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=/ffir/t2Hx0u1CtjBTRNm3H/5/bT+TQ8gxlGGj0T27Q=;
 b=br+s5mkL5fknQLnUEEjkazjt+BUZLYKwxAwJg22m7cPqwhiUsTYtNuTSw0GzCAS4ZB
 o+qosPgMSYfVlgXw+hDkwRbHnP+QY5TODlreOZ1ry2XJDkHLaI5VZWyaWu9R4s1Ha06e
 wgvJlgbPq4O/0OkwaSs/PNUzBSWEs8+/YqojC4iJVcudbnh6R7mPEOTkdQ+VWaG1QHeU
 uaPVMEv+XpPNj3+xKGXaolgLKzKa1ssbU7x3g/ID5GUO1raIWzyK1GuzqnheKYYoGJp9
 XpZXBJwkpsreajfZoT4g8uNhk7HugBinsz3VPtnbUu4EDulTtK0+kSj8bwS2NSCBWYgD
 kVAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/ffir/t2Hx0u1CtjBTRNm3H/5/bT+TQ8gxlGGj0T27Q=;
 b=cG79vDgURjaJBY9eqmMDykrSp9EIHOPtDVde9abFlWPcnfgP1c2XVdPAmudMS/lbTJ
 VOLQlu/fNUcF5EQ1H98NOnepVpZXB/AIbDiKWXNIZ9am1SzYHAqyGFactApz2NgHrnn9
 y/GFrRIMZ2lDS8zWymsudc66Pyh/9KZhq1p/2c8zD/u3mrkatz8ZyTAGxmZnSdLizuDo
 zKwrZrhbJ0YtqFkKHgvugy4jLzbq8o4iqpkdhFfm67wb3ZDFct2Tkb6pyu12Hqyzc1Ve
 c4+Ch/Sxe7zk4OINxnkthC+p32Xe/syKAk+YUVA/UGX+DwPdke6Wf3ABu0LTWJ0baNSm
 xRBQ==
X-Gm-Message-State: AOAM531XuxsNKfguJZ0kqtqTNK0BeJPxCUBP6cXTiAvqnuFduMEicX+6
 Odg8rW/s8DBLWL8zhW8DJr6EpbjAapMqdg==
X-Google-Smtp-Source: ABdhPJy5EO73Vn8P1zV0I0mglPXKsOI69D6yestYNDgLeEg6Z6s0sAOhTMWHTy/1tVbe6GycUN3Tkw==
X-Received: by 2002:adf:e687:0:b0:207:a4c4:b928 with SMTP id
 r7-20020adfe687000000b00207a4c4b928mr18988594wrm.629.1650539942598; 
 Thu, 21 Apr 2022 04:19:02 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a5d6d04000000b0020a8bbbb72bsm2597694wrq.97.2022.04.21.04.19.01
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Apr 2022 04:19:02 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 16/31] hw/arm/exynos4210: Drop ext_gic_irq[] from Exynos4210Irq
 struct
Date: Thu, 21 Apr 2022 12:18:31 +0100
Message-Id: <20220421111846.2011565-17-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220421111846.2011565-1-peter.maydell@linaro.org>
References: <20220421111846.2011565-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42c.google.com
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

The only time we use the ext_gic_irq[] array in the Exynos4210Irq
struct is during realize of the SoC -- we initialize it with the
input IRQs of the external GIC device, and then connect those to
outputs of other devices further on in realize (including in the
exynos4210_init_board_irqs() function).  Now that the ext_gic object
is easily accessible as s->ext_gic we can make the connections
directly from one device to the other without going via this array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-id: 20220404154658.565020-10-peter.maydell@linaro.org
---
 include/hw/arm/exynos4210.h |  1 -
 hw/arm/exynos4210.c         | 12 ++++++------
 2 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index f35ae90000f..08f52c511ff 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -83,7 +83,6 @@
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-    qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
 } Exynos4210Irq;
 
 struct Exynos4210State {
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index 2058df9aecf..5a41af089f9 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -257,6 +257,7 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 {
     uint32_t grp, bit, irq_id, n;
     Exynos4210Irq *is = &s->irqs;
+    DeviceState *extgicdev = DEVICE(&s->ext_gic);
 
     for (n = 0; n < EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ; n++) {
         irq_id = 0;
@@ -272,7 +273,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
         }
         if (irq_id) {
             s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_gic_irq[irq_id - 32]);
+                                             qdev_get_gpio_in(extgicdev,
+                                                              irq_id - 32));
         } else {
             s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
                     is->ext_combiner_irq[n]);
@@ -287,7 +289,8 @@ static void exynos4210_init_board_irqs(Exynos4210State *s)
 
         if (irq_id) {
             s->irq_table[n] = qemu_irq_split(is->int_combiner_irq[n],
-                    is->ext_gic_irq[irq_id - 32]);
+                                             qdev_get_gpio_in(extgicdev,
+                                                              irq_id - 32));
         }
     }
 }
@@ -466,9 +469,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 1));
     }
-    for (n = 0; n < EXYNOS4210_EXT_GIC_NIRQ; n++) {
-        s->irqs.ext_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->ext_gic), n);
-    }
 
     /* Internal Interrupt Combiner */
     dev = qdev_new("exynos4210.combiner");
@@ -487,7 +487,7 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
-        sysbus_connect_irq(busdev, n, s->irqs.ext_gic_irq[n]);
+        sysbus_connect_irq(busdev, n, qdev_get_gpio_in(DEVICE(&s->ext_gic), n));
     }
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 1);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_EXT_COMBINER_BASE_ADDR);
-- 
2.25.1


