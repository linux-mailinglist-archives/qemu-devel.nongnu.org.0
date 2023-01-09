Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28EB16620B3
	for <lists+qemu-devel@lfdr.de>; Mon,  9 Jan 2023 09:56:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pEnin-0005fj-Tt; Mon, 09 Jan 2023 03:41:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnim-0005fJ-5M
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:41:32 -0500
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pEnik-0001iJ-8x
 for qemu-devel@nongnu.org; Mon, 09 Jan 2023 03:41:31 -0500
Received: by mail-wm1-x32e.google.com with SMTP id
 m8-20020a05600c3b0800b003d96f801c48so8416285wms.0
 for <qemu-devel@nongnu.org>; Mon, 09 Jan 2023 00:41:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HTqoT3kxPcjorZ3mugLt6fynVNQ3ed1VmFMT7P6iTBY=;
 b=YgSNwICSTdBN20I0dQ+7Tcgu3fsIsNfGWs9BHqt5lyQ1ieWs23OzjVVDtIbh7od5Uq
 vU3/iqdr6GLDXuo7UwGD5oTZobSr+a3VwqcXpLNjIj4y1iypO9dUHn86gmbyPtyTmmMh
 ue3XZGBqbY/ct6j9iLdhzyERR5kVQ8Y2fCOUTDJ+B7WFNV2761P7BBx5M23t3nlciafi
 qUmrAEtP/CXRlLwjaCrTtDM5wyfHZzWRsz5xrmALIzPe59pGgzN6t2n5l+j0DQqiyGAo
 Yi1lk+UPa0+16MWa77rOK3IvVFFFYpXTSfR8pxEWrma1Rlo1+9JwRLrYV6Og67v6/G65
 lkqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HTqoT3kxPcjorZ3mugLt6fynVNQ3ed1VmFMT7P6iTBY=;
 b=cAuZsB5F4NzeLz3kiGifLBHcF+iqjz0toFDsk/DpKK1tUuOf264f55VVnneq20zZuA
 G0eEYNlhJea85h/IcxYb7v3bT/JgUXEUvQMnooFSgekI0Q1DzgMXieGFM9i4nd8CpHu6
 Tm5+ut/EozrI6B6tWuyu0FhMN/Zkg2XkSIMwPuaMTvxTx40IdmvIxBUbD+5r3+3v5xeX
 xzOMgx0Cz+oFHwxGpqQ6XfCbEw3nTEAFfd2VePPdS7a413yDjg7Qt/nNioK9SV54Kk73
 7MRB1aXAVyoNX0ZX+uHX2h+0MOq0+4rHKKc9DvNDlIQkdzKZyr592mzSIlMN3N6rv1P/
 rUpA==
X-Gm-Message-State: AFqh2koggBeYS4iwYOxPmr7pwvpQ2ybieys5NODBeMlw9cKJ8XThgyl+
 BuGo8GdoETbrDvozuN3wKbYg0TanY9HvGdxw
X-Google-Smtp-Source: AMrXdXv/yMuHySQCqNp8xbpmsp6zifHByLh+tS3DoniKpFc9X5QZoLqqCKUcoT2S3V6MmypMlT++Ug==
X-Received: by 2002:a05:600c:21d9:b0:3d1:d396:1adc with SMTP id
 x25-20020a05600c21d900b003d1d3961adcmr55848029wmj.14.1673253688366; 
 Mon, 09 Jan 2023 00:41:28 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 bg42-20020a05600c3caa00b003b4cba4ef71sm17107033wmb.41.2023.01.09.00.41.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 09 Jan 2023 00:41:28 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, qemu-trivial@nongnu.org,
 Jan Kiszka <jan.kiszka@web.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 1/5] hw/i2c/bitbang_i2c: Define TYPE_GPIO_I2C in public header
Date: Mon,  9 Jan 2023 09:41:17 +0100
Message-Id: <20230109084121.72138-2-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230109084121.72138-1-philmd@linaro.org>
References: <20230109084121.72138-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Define TYPE_GPIO_I2C in the public "hw/i2c/bitbang_i2c.h"
header and use it in hw/arm/musicpal.c.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/musicpal.c            | 3 ++-
 hw/i2c/bitbang_i2c.c         | 1 -
 include/hw/i2c/bitbang_i2c.h | 2 ++
 3 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
index b65c020115..813232682f 100644
--- a/hw/arm/musicpal.c
+++ b/hw/arm/musicpal.c
@@ -25,6 +25,7 @@
 #include "hw/block/flash.h"
 #include "ui/console.h"
 #include "hw/i2c/i2c.h"
+#include "hw/i2c/bitbang_i2c.h"
 #include "hw/irq.h"
 #include "hw/or-irq.h"
 #include "hw/audio/wm8750.h"
@@ -1300,7 +1301,7 @@ static void musicpal_init(MachineState *machine)
 
     dev = sysbus_create_simple(TYPE_MUSICPAL_GPIO, MP_GPIO_BASE,
                                qdev_get_gpio_in(pic, MP_GPIO_IRQ));
-    i2c_dev = sysbus_create_simple("gpio_i2c", -1, NULL);
+    i2c_dev = sysbus_create_simple(TYPE_GPIO_I2C, -1, NULL);
     i2c = (I2CBus *)qdev_get_child_bus(i2c_dev, "i2c");
 
     lcd_dev = sysbus_create_simple(TYPE_MUSICPAL_LCD, MP_LCD_BASE, NULL);
diff --git a/hw/i2c/bitbang_i2c.c b/hw/i2c/bitbang_i2c.c
index e9a0612a04..ac84bf0262 100644
--- a/hw/i2c/bitbang_i2c.c
+++ b/hw/i2c/bitbang_i2c.c
@@ -162,7 +162,6 @@ void bitbang_i2c_init(bitbang_i2c_interface *s, I2CBus *bus)
 
 /* GPIO interface.  */
 
-#define TYPE_GPIO_I2C "gpio_i2c"
 OBJECT_DECLARE_SIMPLE_TYPE(GPIOI2CState, GPIO_I2C)
 
 struct GPIOI2CState {
diff --git a/include/hw/i2c/bitbang_i2c.h b/include/hw/i2c/bitbang_i2c.h
index 92334e9016..a079e6d70f 100644
--- a/include/hw/i2c/bitbang_i2c.h
+++ b/include/hw/i2c/bitbang_i2c.h
@@ -3,6 +3,8 @@
 
 #include "hw/i2c/i2c.h"
 
+#define TYPE_GPIO_I2C "gpio_i2c"
+
 typedef struct bitbang_i2c_interface bitbang_i2c_interface;
 
 #define BITBANG_I2C_SDA 0
-- 
2.38.1


