Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AA41B69CA45
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Feb 2023 12:52:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pU4i9-00021L-LG; Mon, 20 Feb 2023 06:52:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4ht-0001wH-OU
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:45 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pU4hq-00054k-Qu
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 06:51:44 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 bg25-20020a05600c3c9900b003e21af96703so187359wmb.2
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 03:51:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8vDECSWkZJOzUDc5E3O4noT+X5MoGsjXzgyJy24749w=;
 b=HnHhfq67peQnCtNeIz+oc3cKE2roXC8p42BRL1HBuOc1nLFSgPc2pNfllC/gdLtGlF
 ZxWlC2HfLAFcLBljOWmAIhwAmDddRUx46zhJCimqrrQ+QAvJ+HgMSEzVf8u3rCMpzYYd
 /W7XxQEviDtxVlOQ+PhL2JhdTWfJ6viTqapt+0WBEitcUMHHAYQ0Q3i+crqH4QbpjWbg
 MoBeP8AehzKN5TxtTFLcWjP0ZDiCQyrOO/2jbWC18E3gIZPz0340JauSOjInL5koalGr
 8jistWO7wnIcJos4JilROX/ewhEAvD2a7F7EyA5MEQS3WnlnO50UjpI1klsk3+GPllnh
 P8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8vDECSWkZJOzUDc5E3O4noT+X5MoGsjXzgyJy24749w=;
 b=y3rViCSL6xe+J2HExG8YSx07QIOjjhVRCiR+9szIhi5lvecA1j306eUSN7llzCdNYB
 Pt5l9A56Lr+Hem5cZ1hdmyJg83PtZJnU8gwV/QxnX6/U6pH11zjFH+5Dwhsd5dcvcaVx
 CjMZl1e2P5jY2LJwRnIFGNc4/K1SLY9D+CW41pBo8G30B/XtxAGjGa/oGoRq0d+BZr9E
 BSoYFMhUABBHIhoEl4K1y6RPAA6ssQnzJugChRSoRC0zw54XtXiDhoMSQvdBU3Pdfjx1
 7gp4JFBCNgvHwGlFnB3j8JUIVw+Y42ApX8fqwLiyggdEQ4bVheNjHEuo+sCfRcDhF2zW
 9f7A==
X-Gm-Message-State: AO0yUKXiqByMOYPgERwl3Tx0CSB59+QE+T/afkhj+gg9yDd9gfC0WPuu
 4r5Io171yciu5v6Ov0RQXMJiuj9xb6omtS6O
X-Google-Smtp-Source: AK7set/OLr35c1Ql1dx60zHEXlrHEhLKA/AoWNxrtHZgBsklzcI6CrLmIW27ENc5IdPmztDJYjLLsw==
X-Received: by 2002:a05:600c:4aa7:b0:3e2:59d:431d with SMTP id
 b39-20020a05600c4aa700b003e2059d431dmr7399248wmp.2.1676893901892; 
 Mon, 20 Feb 2023 03:51:41 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l37-20020a05600c1d2500b003db0ad636d1sm11717434wms.28.2023.02.20.03.51.40
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 20 Feb 2023 03:51:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 5/8] hw/char/xilinx_uartlite: Open-code
 xilinx_uartlite_create()
Date: Mon, 20 Feb 2023 12:51:11 +0100
Message-Id: <20230220115114.25237-6-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230220115114.25237-1-philmd@linaro.org>
References: <20230220115114.25237-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

Open-code the single use of xilinx_uartlite_create().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  7 +++++--
 include/hw/char/xilinx_uartlite.h        | 20 --------------------
 2 files changed, 5 insertions(+), 22 deletions(-)

diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petalogix_s3adsp1800_mmu.c
index 9d959d1ad8..505639c298 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -100,8 +100,11 @@ petalogix_s3adsp1800_init(MachineState *machine)
         irq[i] = qdev_get_gpio_in(dev, i);
     }
 
-    xilinx_uartlite_create(UARTLITE_BASEADDR, irq[UARTLITE_IRQ],
-                           serial_hd(0));
+    dev = qdev_new(TYPE_XILINX_UARTLITE);
+    qdev_prop_set_chr(dev, "chardev", serial_hd(0));
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(dev), &error_fatal);
+    sysbus_mmio_map(SYS_BUS_DEVICE(dev), 0, UARTLITE_BASEADDR);
+    sysbus_connect_irq(SYS_BUS_DEVICE(dev), 0, irq[UARTLITE_IRQ]);
 
     /* 2 timers at irq 2 @ 62 Mhz.  */
     dev = qdev_new("xlnx.xps-timer");
diff --git a/include/hw/char/xilinx_uartlite.h b/include/hw/char/xilinx_uartlite.h
index 753d3a453e..36d4e8444d 100644
--- a/include/hw/char/xilinx_uartlite.h
+++ b/include/hw/char/xilinx_uartlite.h
@@ -15,29 +15,9 @@
 #ifndef XILINX_UARTLITE_H
 #define XILINX_UARTLITE_H
 
-#include "hw/qdev-properties.h"
-#include "hw/sysbus.h"
-#include "qapi/error.h"
 #include "qom/object.h"
 
 #define TYPE_XILINX_UARTLITE "xlnx.xps-uartlite"
 OBJECT_DECLARE_SIMPLE_TYPE(XilinxUARTLite, XILINX_UARTLITE)
 
-static inline DeviceState *xilinx_uartlite_create(hwaddr addr,
-                                        qemu_irq irq,
-                                        Chardev *chr)
-{
-    DeviceState *dev;
-    SysBusDevice *s;
-
-    dev = qdev_new(TYPE_XILINX_UARTLITE);
-    s = SYS_BUS_DEVICE(dev);
-    qdev_prop_set_chr(dev, "chardev", chr);
-    sysbus_realize_and_unref(s, &error_fatal);
-    sysbus_mmio_map(s, 0, addr);
-    sysbus_connect_irq(s, 0, irq);
-
-    return dev;
-}
-
 #endif
-- 
2.38.1


