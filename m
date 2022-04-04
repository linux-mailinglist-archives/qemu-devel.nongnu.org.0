Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F2D0E4F1909
	for <lists+qemu-devel@lfdr.de>; Mon,  4 Apr 2022 17:59:10 +0200 (CEST)
Received: from localhost ([::1]:43960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nbP6k-0001J8-25
	for lists+qemu-devel@lfdr.de; Mon, 04 Apr 2022 11:59:10 -0400
Received: from eggs.gnu.org ([209.51.188.92]:44320)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv6-0004nI-SY
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:09 -0400
Received: from [2a00:1450:4864:20::42b] (port=35734
 helo=mail-wr1-x42b.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nbOv4-0000Sh-3V
 for qemu-devel@nongnu.org; Mon, 04 Apr 2022 11:47:07 -0400
Received: by mail-wr1-x42b.google.com with SMTP id w21so15181489wra.2
 for <qemu-devel@nongnu.org>; Mon, 04 Apr 2022 08:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JriftgZJ9tNiOTYedkPYR5b8es/GLFwCKeN4JFkzOK0=;
 b=neOB8Pmke5sILRSu/ZSOtl19ctDmz/ZZpIQIa/DC+jK0j95g9mROlwRcQE3lD8CqvG
 RYA+JRnJlKBOMkmYzA/tbsDcfFWWl+FVB2EmRaxHKrpLgVaMeZ7UmjrA1+HZTJOe9JPt
 Kx5CTlXIUOPQZmKy5ELNBwqgfu1GcJWgXmmvUtu877QOaKiIE9Lm7o5pu7wZtGWXgACg
 23tUO03HqFB5f++ICenaYvZTriQRFIPQEm3UQTmJ104V/6tZd1bdOFoWx5MgZK3uVtOR
 HvXRgn40gLxY5+Z1rVoypVFe8qAKHjNDoOTEwCWgj1YdcHsB4neOncSYSx7dklywq85R
 YUNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JriftgZJ9tNiOTYedkPYR5b8es/GLFwCKeN4JFkzOK0=;
 b=VasiscAfau0zsYWI/mXtBKAH4AbSsPJQU6wSuRgyLmJS7rBE9QSc4Qrzkg2/Ex80J7
 iPovoiN1JSAtNsnV6uV9s4bFxRR1f57WCUK+U7I/yq+QTSR3/2+3vIG0xLkLROg5xTzu
 VZjyAgt+E9Qg91lwUMKAuPISqiybi4IfYcNIy1HK0WS1P4xODH8hYsM8J4FvUGLqUAa3
 hjHEP0FOraulAFhrnkrOFUYaBRHZDQjqECA3XdmEbB5sR3Gu0pBwzAZue+KD9cml8IOH
 K/CXbDjkai3yCpwWEcPZuTXr7wYdlTN4E11iMNeaJp44z1aOlkt62KjGUWEqVvu0ereN
 ymgg==
X-Gm-Message-State: AOAM532GofMW7QrfYGgZUnkkMUMRo04f9E90t60yjkHflfet7KXRp647
 FbTSQhaRhqrq0NQI2ZV6t5SIPQ==
X-Google-Smtp-Source: ABdhPJxf0AHneZyyN8iWgDAN4Eumtypv5Cjfy5CuUTQ7gQcyrpXAYariIJ6GyUK77P3ldn1JCFUTyA==
X-Received: by 2002:a5d:5510:0:b0:206:1150:9f65 with SMTP id
 b16-20020a5d5510000000b0020611509f65mr296878wrv.160.1649087224359; 
 Mon, 04 Apr 2022 08:47:04 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 c8-20020a056000184800b002040e925afasm11731347wri.59.2022.04.04.08.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 04 Apr 2022 08:47:04 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-7.1 04/18] hw/arm/exynos4210: Drop int_gic_irq[] from
 Exynos4210Irq struct
Date: Mon,  4 Apr 2022 16:46:44 +0100
Message-Id: <20220404154658.565020-5-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220404154658.565020-1-peter.maydell@linaro.org>
References: <20220404154658.565020-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2a00:1450:4864:20::42b
 (failed)
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
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

The only time we use the int_gic_irq[] array in the Exynos4210Irq
struct is in the exynos4210_realize() function: we initialize it with
the GPIO inputs of the a9mpcore device, and then a bit later on we
connect those to the outputs of the internal combiner.  Now that the
a9mpcore object is easily accessible as s->a9mpcore we can make the
connection directly from one device to the other without going via
this array.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/arm/exynos4210.h | 1 -
 hw/arm/exynos4210.c         | 6 ++----
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/include/hw/arm/exynos4210.h b/include/hw/arm/exynos4210.h
index 215c039b414..923ce987627 100644
--- a/include/hw/arm/exynos4210.h
+++ b/include/hw/arm/exynos4210.h
@@ -82,7 +82,6 @@
 typedef struct Exynos4210Irq {
     qemu_irq int_combiner_irq[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
     qemu_irq ext_combiner_irq[EXYNOS4210_MAX_EXT_COMBINER_IN_IRQ];
-    qemu_irq int_gic_irq[EXYNOS4210_INT_GIC_NIRQ];
     qemu_irq ext_gic_irq[EXYNOS4210_EXT_GIC_NIRQ];
     qemu_irq board_irqs[EXYNOS4210_MAX_INT_COMBINER_IN_IRQ];
 } Exynos4210Irq;
diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
index ef4d646eb91..60fc5a2ffe7 100644
--- a/hw/arm/exynos4210.c
+++ b/hw/arm/exynos4210.c
@@ -252,9 +252,6 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
         sysbus_connect_irq(busdev, n,
                            qdev_get_gpio_in(DEVICE(&s->cpu_irq_orgate[n]), 0));
     }
-    for (n = 0; n < EXYNOS4210_INT_GIC_NIRQ; n++) {
-        s->irqs.int_gic_irq[n] = qdev_get_gpio_in(DEVICE(&s->a9mpcore), n);
-    }
 
     /* Cache controller */
     sysbus_create_simple("l2x0", EXYNOS4210_L2X0_BASE_ADDR, NULL);
@@ -281,7 +278,8 @@ static void exynos4210_realize(DeviceState *socdev, Error **errp)
     busdev = SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(busdev, &error_fatal);
     for (n = 0; n < EXYNOS4210_MAX_INT_COMBINER_OUT_IRQ; n++) {
-        sysbus_connect_irq(busdev, n, s->irqs.int_gic_irq[n]);
+        sysbus_connect_irq(busdev, n,
+                           qdev_get_gpio_in(DEVICE(&s->a9mpcore), n));
     }
     exynos4210_combiner_get_gpioin(&s->irqs, dev, 0);
     sysbus_mmio_map(busdev, 0, EXYNOS4210_INT_COMBINER_BASE_ADDR);
-- 
2.25.1


