Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 85D875BD3C5
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 19:34:09 +0200 (CEST)
Received: from localhost ([::1]:55692 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaKem-0001vt-2R
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 13:34:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSp-0005ad-Kh
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:21:47 -0400
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529]:40860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaKSn-0000Ps-VT
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 13:21:47 -0400
Received: by mail-pg1-x529.google.com with SMTP id 207so18939162pgc.7
 for <qemu-devel@nongnu.org>; Mon, 19 Sep 2022 10:21:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=9UzldcR0b1o/X+kC4vXAaVIzBakXO1OmfFUhrcDp5d4=;
 b=CnyLZpYXR/q+z6MF4m8Z1wUhwPQNur+hHNqN3Pij/IGwYIIklbcIf6k+IG2IVo0BWd
 FMmcvI1qfP+Zgb3zBC6nBuNtRUaVFmIQXYC786TT0SJ7u5T/8sDoIhrpws+yUL5N/G1d
 jiYcrwVZ1GwZCJjwzLDoG1BFrPQGCyVC97eV+DLLcAV3k7IoXT6XCY/yp7UEe4nOU/KC
 I297iSt54KeV5m+sRFilXjdlXEjk4sw9WUdTQ8ywivhKLWSscrzNBp6xI7p5zYHa7RGe
 wjuRWdmVw3BSh/bekb+gHPeI/9XdqxD6KXwij6y9VDMi2GEGq9VZ0irEFYpK+7hXHOKA
 pKtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=9UzldcR0b1o/X+kC4vXAaVIzBakXO1OmfFUhrcDp5d4=;
 b=nglIceR+G1tbfy85PitsLPrOI2Ci4xcTtqUV4lGLBXznJkWRtPypFjSJME3FJDmlNI
 h7yx3VSywLEaWAKp3mWxtBGHfunjM3UomUmE8TdaaVd0M4WKkBK5BkecT7Hla87NuW6D
 p3LttQNXPguzmoJZm3BsgjPBJv4uLB6oZMfpiMyaEPRKR3MzeKMxr6BBGlAW3M8dspRE
 jxgXCzyVdHPwf07jyUWGXSEAf4I+aLU9NUGRpWbYOXAEWs9xXfJ2fl9nr1XhIk5C0jcy
 JEfW+3EmrGWTAJZaQen9izZZW9Uh+0Bl4+yB1Kvbij2xpzAZQBfTNawZw6t9iBcKFFdS
 TPzQ==
X-Gm-Message-State: ACrzQf1gKj/jvokiDxFz/OZArJ7KmeMpI2HgQ9biToHWpBuRkRDva9KN
 U2/ui8mYRJJ4kKghbw8jmV5OIg==
X-Google-Smtp-Source: AMsMyM5iBcOiE+rMVVDaXQQsHLYMNzeqIe+p3fDCq4JkFe67+HmbaQRhr97KEpXOj64h5PIquvAgdw==
X-Received: by 2002:a65:6e9a:0:b0:435:6009:4b62 with SMTP id
 bm26-20020a656e9a000000b0043560094b62mr16662675pgb.596.1663608104658; 
 Mon, 19 Sep 2022 10:21:44 -0700 (PDT)
Received: from localhost ([49.7.199.210]) by smtp.gmail.com with ESMTPSA id
 q6-20020aa79826000000b0053e99f2bf16sm20580111pfl.78.2022.09.19.10.21.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 10:21:44 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au, joel@jms.id.au,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com,
 Jian Zhang <zhangjian.3032@bytedance.com>
Subject: [PATCH 1/3] hw/gpio/aspeed_gpio: Add gpios in/out init
Date: Tue, 20 Sep 2022 01:21:10 +0800
Message-Id: <20220919172112.2706026-2-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
References: <20220919172112.2706026-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::529;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pg1-x529.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Mon, 19 Sep 2022 13:29:46 -0400
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

Add gpios in/out init for aspeed gpio to add the ability to connect
to other gpio devices.

Based the qdev-core.h comments, If you want to connect a GPIO to other
devices, you need to call qdev_init_gpio_in() or qdev_init_gpio_out().

```
For input gpios:
 *
 * Outbound GPIO lines can be connected to any qemu_irq, but the common
 * case is connecting them to another device's inbound GPIO line, using
 * the qemu_irq returned by qdev_get_gpio_in() or qdev_get_gpio_in_named().

For output gpios:
 * This function is intended to be used by board code or SoC "container"
 * device models to wire up the GPIO lines; usually the return value
 * will be passed to qdev_connect_gpio_out() or a similar function to
 * connect another device's output GPIO line to this input.
```

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 hw/gpio/aspeed_gpio.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
index e99c4c6329..616ec8db52 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1018,6 +1018,17 @@ static void aspeed_gpio_reset(DeviceState *dev)
     memset(s->sets, 0, sizeof(s->sets));
 }
 
+static void aspeed_gpio_set(void *opaque, int line, int new_state)
+{
+    AspeedGPIOState *s = ASPEED_GPIO(opaque);
+    uint32_t set_idx, pin;
+
+    set_idx = line / ASPEED_GPIOS_PER_SET;
+    pin = line % ASPEED_GPIOS_PER_SET;
+
+    aspeed_gpio_set_pin_level(s, set_idx, pin, new_state);
+}
+
 static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
 {
     AspeedGPIOState *s = ASPEED_GPIO(dev);
@@ -1042,6 +1053,12 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
     memory_region_init_io(&s->iomem, OBJECT(s), &aspeed_gpio_ops, s,
             TYPE_ASPEED_GPIO, 0x800);
 
+    /* TODO: Maybe could in named, not anonymous is better */
+    qdev_init_gpio_out(dev, &s->gpios[0][0],
+                       ASPEED_GPIO_MAX_NR_SETS * ASPEED_GPIOS_PER_SET);
+    qdev_init_gpio_in(dev, aspeed_gpio_set,
+                      ASPEED_GPIO_MAX_NR_SETS * ASPEED_GPIOS_PER_SET);
+
     sysbus_init_mmio(sbd, &s->iomem);
 }
 
-- 
2.25.1


