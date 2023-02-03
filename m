Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E5E2B689C61
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 15:57:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNxUR-0003H8-Sw; Fri, 03 Feb 2023 09:56:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUP-0003EB-PU
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:33 -0500
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNxUN-00062R-1b
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 09:56:33 -0500
Received: by mail-wr1-x432.google.com with SMTP id o18so4896176wrj.3
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 06:56:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vGKludMgGFMX+UQNF2Pkwb7HGkjwWKhIN+mg23C0/DM=;
 b=KPlkqMN9UHD8cpD/1lkqfCv6X7xEWggTCXYblmuXhu0/GZULwqVshuOWxS8tF3D2KI
 Lobpv+HAUSeiYJJwlZUJxKCHOr1+dBSffcrufnvd9rZU488lWvA11rWspas/rnXIJDIq
 fPII+bsuAgKyRK8pQXdxqg1mwA9UmWk0Tup080PpNiLluV1s0XY1wqZklyt3oBgRkGJG
 hGYPc4838Qlo7+cxll6M+OYtdMXXFVHRjA77EYdvr23Aimq+ZrYbjnh3DPBuR725iIn0
 vnT13uh0hV0b6j6jIocQVw9YA75wcyWi+2COIKllTJCcMEFT5dPcAW5Crmuv47WEEn9O
 PJOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vGKludMgGFMX+UQNF2Pkwb7HGkjwWKhIN+mg23C0/DM=;
 b=aXhho8ZnBUJX9CszcEWp3HNn2zUVeUeCuy6kqulIJ8naEVv0XRp37k1kbWol/j609a
 3xOytB8TieqvFo9WiuF44I8JfFGGo7b/YNhSluCeQ2kc+qDVdT83zHOqzVE/KgKGxvqB
 41ENNAqFFPFXEzI0N4OmVwZDkHTr/RAwmhhYyY4HJWb0Ma9yzNPoOnizMpsKssH+wQw+
 fqVFVBkWSP4vU9LYKcqy5XNwlzF54SxQyF6o1DEEcHbemcilqetq62j1YapvbiGAwb5n
 M0XuqwKhEu5u9azrvzMpDhXM6mboewIiuO4g6kyzshIy8YM7s+UexIRdQnUB7igq7x2a
 fJzw==
X-Gm-Message-State: AO0yUKUCU3Krmq0s5HRkDuUu5NDOLuTYqcVkhA+cDUcTUU0uTOjoY25u
 p7FFlaFilOdzJ7dxx9jA9HN7Tlxp4aOdI0Ja
X-Google-Smtp-Source: AK7set8dAwQgnzawxIVp3FZcF+QYEurC1LYYDnYpDxOdOJVORAvBqWjQIWfizdLrLVi6lnY59ZpHkQ==
X-Received: by 2002:a5d:50c8:0:b0:2c3:db98:3e9c with SMTP id
 f8-20020a5d50c8000000b002c3db983e9cmr36525wrt.24.1675436189559; 
 Fri, 03 Feb 2023 06:56:29 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 c13-20020a056000104d00b002bfebe2d67esm2250622wrx.9.2023.02.03.06.56.28
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 06:56:29 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Markus Armbruster <armbru@redhat.com>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>
Subject: [PATCH v2 10/15] hw/display/sm501: Embed OHCI QOM child in chipset
Date: Fri,  3 Feb 2023 15:55:31 +0100
Message-Id: <20230203145536.17585-11-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203145536.17585-1-philmd@linaro.org>
References: <20230203145536.17585-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::432;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x432.google.com
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

Note this device doesn't implement unrealize().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 17 ++++++++++-------
 1 file changed, 10 insertions(+), 7 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 52e42585af..0f7e09d7e2 100644
--- a/hw/display/sm501.c
+++ b/hw/display/sm501.c
@@ -28,6 +28,7 @@
 #include "qapi/error.h"
 #include "qemu/log.h"
 #include "qemu/module.h"
+#include "hw/usb/hcd-ohci.h"
 #include "hw/char/serial.h"
 #include "ui/console.h"
 #include "hw/sysbus.h"
@@ -1944,13 +1945,13 @@ struct SM501SysBusState {
     uint32_t vram_size;
     uint32_t base;
     SerialMM serial;
+    OHCISysBusState ohci;
 };
 
 static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 {
     SM501SysBusState *s = SYSBUS_SM501(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    DeviceState *usb_dev;
     MemoryRegion *mr;
 
     sm501_init(&s->state, dev, s->vram_size);
@@ -1963,13 +1964,11 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->state.mmio_region);
 
     /* bridge to usb host emulation module */
-    usb_dev = qdev_new("sysbus-ohci");
-    qdev_prop_set_uint32(usb_dev, "num-ports", 2);
-    qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
+    qdev_prop_set_uint64(DEVICE(&s->ohci), "dma-offset", s->base);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
-                       sysbus_mmio_get_region(SYS_BUS_DEVICE(usb_dev), 0));
-    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
+                       sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->ohci));
 
     /* bridge to serial emulation module */
     sysbus_realize(SYS_BUS_DEVICE(&s->serial), &error_fatal);
@@ -2016,8 +2015,12 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
 static void sm501_sysbus_init(Object *o)
 {
     SM501SysBusState *sm501 = SYSBUS_SM501(o);
+    OHCISysBusState *ohci = &sm501->ohci;
     SerialMM *smm = &sm501->serial;
 
+    object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
+    qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
+
     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
     qdev_set_legacy_instance_id(DEVICE(smm), SM501_UART0, 2);
     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
-- 
2.38.1


