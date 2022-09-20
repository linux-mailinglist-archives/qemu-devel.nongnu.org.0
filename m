Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 932FE5BF061
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:43:53 +0200 (CEST)
Received: from localhost ([::1]:43038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaly4-00037X-I7
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:43:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56700)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGY-0004RU-4W
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:51 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45767)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGU-0007Qt-E6
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:41 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 p1-20020a17090a2d8100b0020040a3f75eso3339146pjd.4
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 11:46:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=qlTkrqVb2aMkLpsUHrMoW58Kky3kHTKxI6M8gj2V1zA=;
 b=LBX0XO9yQRjLND9QEAKvEB6zfPznF3dsCCHx05wtFKbOHtyRAGkUoHkJ39fzvKD6kk
 9sVfDrfFDqNou/tLpdBJC3QUilSBtr0FQbYbiTbqrHLXuCa9J2+YdrTjn57PWyxJJEJT
 hGcy8qTMQhysnCc8MEdu49uLbR96Meuwa7VjA6qqPHrx5QNlcFSEMFZbLsEykXdqTHiu
 Lw1/qawKpNjjaLljYJ56RK171qgdvFhwfr3MPNCZE0Aeclh95TVv0Y1+DcfILr9BuH6N
 cfmszz7PiD+sbSlwJazt/ObeKpAmmsRrsft68cT57/eGGpD6ZtyRelgtDiaeorY3rI/j
 UnSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=qlTkrqVb2aMkLpsUHrMoW58Kky3kHTKxI6M8gj2V1zA=;
 b=mPiEdr0MBTdXt1Ub1t0eJ5UZrtFYGiJVHE8NpdZn5Kz5ytb8Txs26zht2zgc4ToCDl
 CBTkVg/cagh39lepEjrpK+TvYMlz3mYFtTQHkKOzZVfCNXk8f4z0r8UpFvjrEF1Tg0Sx
 yNjo8u2qQkstOeOT1t+pdPyWIx019rui3fXCFBD6cVVq1JKO71XFm5SWRYkvP7nk0Kl/
 yl5WPq5seQ5q2N5NQ5i5yIMNWoZA+tnsE0+xSy7VAIpPG2N1iQG8K0qKPw6fNKyl2r3x
 6F7gIV9Kr8r9RcTDSl5yZnkYj4Fp8xxI1pWtSQa23/uhGLOxBXwQOtjqCVEHlmU6SGc5
 dHdQ==
X-Gm-Message-State: ACrzQf2mepfoW4osbyBEERVhcpzSO5WhJyKUiPHezNfCxuozLR2s6oIA
 9MslZzTOxpOMPVJMpmaENv/IAg==
X-Google-Smtp-Source: AMsMyM55kfMcocVonbj2msJBNmbeXWteVDWaf9trrIo5VUCyBUJrE4vSt6OrG77dD7XkQK0fqdhYwg==
X-Received: by 2002:a17:902:e5cd:b0:176:ad01:ab47 with SMTP id
 u13-20020a170902e5cd00b00176ad01ab47mr958363plf.133.1663699596882; 
 Tue, 20 Sep 2022 11:46:36 -0700 (PDT)
Received: from localhost ([49.7.199.230]) by smtp.gmail.com with ESMTPSA id
 x2-20020a17090a1f8200b0020379616053sm203667pja.57.2022.09.20.11.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:46:36 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: f4bug@amsat.org, peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
Subject: [PATCH v2 2/3] hw/gpio/aspeed_gpio: Add gpios in/out init
Date: Wed, 21 Sep 2022 02:46:18 +0800
Message-Id: <20220920184619.3370115-3-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
index 1e267dd482..51f5f1c386 100644
--- a/hw/gpio/aspeed_gpio.c
+++ b/hw/gpio/aspeed_gpio.c
@@ -1013,6 +1013,17 @@ static void aspeed_gpio_reset(DeviceState *dev)
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
@@ -1037,6 +1048,12 @@ static void aspeed_gpio_realize(DeviceState *dev, Error **errp)
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


