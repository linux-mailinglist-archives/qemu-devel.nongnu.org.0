Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8383C658E4F
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Dec 2022 16:25:19 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pAulA-0001IB-Hy; Thu, 29 Dec 2022 10:23:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAul8-0001HY-Kv
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:54 -0500
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pAul6-0007t0-AE
 for qemu-devel@nongnu.org; Thu, 29 Dec 2022 10:23:54 -0500
Received: by mail-wm1-x332.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso10264876wms.5
 for <qemu-devel@nongnu.org>; Thu, 29 Dec 2022 07:23:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wtm2mfHrpS5K/nDn4meqp35AVTYNEJHCIxdRSmJIby4=;
 b=IkQ+oIugBj46dyLFu0+B1vV7hQw3FaQFHkfDXiwco3j3yRjbfjtW7hI4/I7qBSXPyp
 MjBNXIgunhARfqMKygIgQC6be5XFFM+oRJMbsh7bOWuJBNGaAy802OYOrBXQTOd/e5/V
 LnarijKPjZgyd7Q9jivb70xv/wfrVw4YUYMdoOBM8o26b7jax+/lryAsqGmytGt0nYP7
 ftMlbs+LUU7R0iNVYtuSZ2OwvQvkX8t99VpCTpcOfU3BtViTVbDRLHatbDNlKUTyPMDE
 SrTLa+l1B4aLevx3f18LGXmamHgAc7ws7Ma09UW+3DQSpjS8nwHs2JhA5u+gnQBDTum6
 Z4kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wtm2mfHrpS5K/nDn4meqp35AVTYNEJHCIxdRSmJIby4=;
 b=foAXQSYrwgNyQBsUXxeCtPmHd7ydpZVkWfWnGq468q+CEGoQuJQTlBv+J6DFgKmkLq
 pw0fYlICKykj/KegnZfX5BY54kpHVefSoszhq6s53YHYW7XpdCzHjOzfh7tXKxT7Of9p
 OXkJxAe5alQYzqxE7M7XB8mq964eYWwQw7xkfgHoVYhxw51xKR0Z/VHlMaSKaCl3xM4m
 tt5ib1PBB/BcMCqytlUkj66jojRSQlifAuTtjMBGCWeKUtmM3g3xnln54KOQMvbMnORB
 BRj3GAlLp9ZUXTMa2KtTbb+L8AmvAAQzdnC7cqDKgj1oBkq3OIhkFwtAnxiPeCkL4zFl
 3HbQ==
X-Gm-Message-State: AFqh2kro9Q5PuOn9RCWGC7K86rVzmgY3u9cQ6JjKc9K4Cq13lVSPE5Tp
 DKx2b84fJPnbXrPR7FeOxJ7HA5XaDu0TldfH
X-Google-Smtp-Source: AMrXdXvZcg3iboiGV4duT49iy4F1//f1MebY1NnnsR3yNuHrXLrAanpyiPHwtwEaw7qfLpOTCLrhtA==
X-Received: by 2002:a05:600c:1e18:b0:3d2:5e4e:701 with SMTP id
 ay24-20020a05600c1e1800b003d25e4e0701mr20264466wmb.31.1672327430750; 
 Thu, 29 Dec 2022 07:23:50 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a5d4fca000000b00281eab50380sm9641905wrw.117.2022.12.29.07.23.49
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Thu, 29 Dec 2022 07:23:50 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Steven Lee <steven_lee@aspeedtech.com>, Peter Delevoryas <peter@pjd.dev>,
 Peter Delevoryas <pdel@meta.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Beraldo Leal <bleal@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Troy Lee <troy_lee@aspeedtech.com>, Andrew Jeffery <andrew@aj.id.au>,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Delevoryas <pdel@fb.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 4/9] hw/arm/aspeed_ast10x0: Map I3C peripheral
Date: Thu, 29 Dec 2022 16:23:20 +0100
Message-Id: <20221229152325.32041-5-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221229152325.32041-1-philmd@linaro.org>
References: <20221229152325.32041-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::332;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x332.google.com
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

Since I don't have access to the datasheet, the relevant
values were found in:
https://github.com/AspeedTech-BMC/zephyr/blob/v00.01.08/dts/arm/aspeed/ast10x0.dtsi

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/arm/aspeed_ast10x0.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/hw/arm/aspeed_ast10x0.c b/hw/arm/aspeed_ast10x0.c
index d7dbc1a801..53ea6d471f 100644
--- a/hw/arm/aspeed_ast10x0.c
+++ b/hw/arm/aspeed_ast10x0.c
@@ -54,6 +54,7 @@ static const hwaddr aspeed_soc_ast1030_memmap[] = {
     [ASPEED_DEV_WDT]       = 0x7E785000,
     [ASPEED_DEV_LPC]       = 0x7E789000,
     [ASPEED_DEV_PECI]      = 0x7E78B000,
+    [ASPEED_DEV_I3C]       = 0x7E7A0000,
     [ASPEED_DEV_I2C]       = 0x7E7B0000,
 };
 
@@ -89,6 +90,7 @@ static const int aspeed_soc_ast1030_irqmap[] = {
     [ASPEED_DEV_ADC]       = 46,
     [ASPEED_DEV_SPI1]      = 65,
     [ASPEED_DEV_SPI2]      = 66,
+    [ASPEED_DEV_I3C]       = 102, /* 102 -> 105 */
     [ASPEED_DEV_I2C]       = 110, /* 110 ~ 123 */
     [ASPEED_DEV_KCS]       = 138, /* 138 -> 142 */
     [ASPEED_DEV_UDC]       = 9,
@@ -130,6 +132,8 @@ static void aspeed_soc_ast1030_init(Object *obj)
     snprintf(typename, sizeof(typename), "aspeed.i2c-%s", socname);
     object_initialize_child(obj, "i2c", &s->i2c, typename);
 
+    object_initialize_child(obj, "i3c", &s->i3c, TYPE_ASPEED_I3C);
+
     snprintf(typename, sizeof(typename), "aspeed.timer-%s", socname);
     object_initialize_child(obj, "timerctrl", &s->timerctrl, typename);
 
@@ -240,6 +244,18 @@ static void aspeed_soc_ast1030_realize(DeviceState *dev_soc, Error **errp)
         sysbus_connect_irq(SYS_BUS_DEVICE(&s->i2c.busses[i]), 0, irq);
     }
 
+    /* I3C */
+    if (!sysbus_realize(SYS_BUS_DEVICE(&s->i3c), errp)) {
+        return;
+    }
+    aspeed_mmio_map(s, SYS_BUS_DEVICE(&s->i3c), 0, sc->memmap[ASPEED_DEV_I3C]);
+    for (i = 0; i < ASPEED_I3C_NR_DEVICES; i++) {
+        qemu_irq irq = qdev_get_gpio_in(DEVICE(&s->armv7m),
+                                        sc->irqmap[ASPEED_DEV_I3C] + i);
+        /* The AST1030 I2C controller has one IRQ per bus. */
+        sysbus_connect_irq(SYS_BUS_DEVICE(&s->i3c.devices[i]), 0, irq);
+    }
+
     /* PECI */
     if (!sysbus_realize(SYS_BUS_DEVICE(&s->peci), errp)) {
         return;
-- 
2.38.1


