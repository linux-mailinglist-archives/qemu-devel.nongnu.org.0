Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C59E56897D4
	for <lists+qemu-devel@lfdr.de>; Fri,  3 Feb 2023 12:38:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNuNk-0008D6-1M; Fri, 03 Feb 2023 06:37:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNi-0008At-1x
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:26 -0500
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pNuNf-0001GR-PW
 for qemu-devel@nongnu.org; Fri, 03 Feb 2023 06:37:25 -0500
Received: by mail-wm1-x333.google.com with SMTP id
 k8-20020a05600c1c8800b003dc57ea0dfeso5822822wms.0
 for <qemu-devel@nongnu.org>; Fri, 03 Feb 2023 03:37:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K+cjiRrUxf8pio68qBRhIQ1AivvB4oG5DvRMp0FNP4E=;
 b=joz2Q7NZy4LkvmEZpfE9ThGOiVfDAdi8oJL5jrAOgFOWlgGMpFnKpAsL0pFYk5yaRr
 YgsXnGUPddj0LkVytcsGSr5f8pNuMcMoqvTLANfyn1y1HfRkRHCsreTsXHAxun6QkHyG
 kRXq2v2IOfWAsrtEE9CefhygHGCBQjk8PaZCXr5glY6q6SFOojEbTm4aT1vwhkyR7MkK
 Q3IV0tDKzvoJ6/5ZLJmxpPsMz7DZbitKWjr0aYjcgLsCBh32bK5jTojYeAOadBujvc96
 b9mlFZaBxuRE5LJtbUC4BCBS5I7ksYXytx2DgN5UPQsjq5w0UFluEm0rFgGjQZsKgAcq
 BYeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K+cjiRrUxf8pio68qBRhIQ1AivvB4oG5DvRMp0FNP4E=;
 b=eAhP8ON7lReFaDkh7rMfI0Z1Fw0F73KUAzSU72fpN7roEOz4Nsr85KxbwaA+g3oevQ
 NcWZLGfhSxBqz5Jreba0xDHDcRXzOUhW3+z6sathgBZZd58pSqcU3zHg61LmdkLoOyFx
 y+/GYlaF4XDxtZsActu2EK4j0jhfA94BzbEym78dB64ytB4dO4v+eTXSJcUw4fJi9jW/
 0u1hdPn+m6o0BNycqtKIH/opb9W1fW1uDULue5uc+JJW+PLao1Rfw1C/pxo4e8m1mmak
 KD91jRDckX8vfdRoyGWFiby1qSbmlz7sEb7Zwxof/l2tR0qrAhZZSXvnnsGbRKs+TBmO
 akeQ==
X-Gm-Message-State: AO0yUKV4FZ8LYDhOlN3VMvvdq8iyDhs/21IbmPiilHYHOoyAJ1Nx4O0O
 ztKHCiTBDc5GtOrKsdQcnZJDYp2Den4tgT3J
X-Google-Smtp-Source: AK7set+PODevprb22UtDTgByUeA2ihJdt8lJvodnGMBHD4WlnuNgRD8uXK6pGvngkdbbZKh4RfutnA==
X-Received: by 2002:a05:600c:210a:b0:3df:12db:2779 with SMTP id
 u10-20020a05600c210a00b003df12db2779mr8379657wml.3.1675424242406; 
 Fri, 03 Feb 2023 03:37:22 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 i14-20020a1c540e000000b003db03725e86sm2517792wmb.8.2023.02.03.03.37.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 03 Feb 2023 03:37:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 BALATON Zoltan <balaton@eik.bme.hu>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>
Subject: [PATCH 6/9] hw/display/sm501: QOM-alias 'dma-offset' property in
 chipset object
Date: Fri,  3 Feb 2023 12:36:47 +0100
Message-Id: <20230203113650.78146-7-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230203113650.78146-1-philmd@linaro.org>
References: <20230203113650.78146-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::333;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x333.google.com
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

No need to use an intermediate 'dma-offset' property in the
chipset object. Alias the property, so when the machine (here
r2d-plus) sets the value on the chipset, it is propagated to
the OHCI object.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/display/sm501.c | 22 +++++++++++-----------
 hw/sh4/r2d.c       |  2 +-
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/hw/display/sm501.c b/hw/display/sm501.c
index 52e42585af..49a648e952 100644
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
@@ -1942,7 +1943,7 @@ struct SM501SysBusState {
     /*< public >*/
     SM501State state;
     uint32_t vram_size;
-    uint32_t base;
+    OHCISysBusState ohci;
     SerialMM serial;
 };
 
@@ -1950,7 +1951,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 {
     SM501SysBusState *s = SYSBUS_SM501(dev);
     SysBusDevice *sbd = SYS_BUS_DEVICE(dev);
-    DeviceState *usb_dev;
     MemoryRegion *mr;
 
     sm501_init(&s->state, dev, s->vram_size);
@@ -1963,13 +1963,10 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
     sysbus_init_mmio(sbd, &s->state.mmio_region);
 
     /* bridge to usb host emulation module */
-    usb_dev = qdev_new("sysbus-ohci");
-    qdev_prop_set_uint32(usb_dev, "num-ports", 2);
-    qdev_prop_set_uint64(usb_dev, "dma-offset", s->base);
-    sysbus_realize_and_unref(SYS_BUS_DEVICE(usb_dev), &error_fatal);
+    sysbus_realize_and_unref(SYS_BUS_DEVICE(&s->ohci), &error_fatal);
     memory_region_add_subregion(&s->state.mmio_region, SM501_USB_HOST,
-                       sysbus_mmio_get_region(SYS_BUS_DEVICE(usb_dev), 0));
-    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(usb_dev));
+                       sysbus_mmio_get_region(SYS_BUS_DEVICE(&s->ohci), 0));
+    sysbus_pass_irq(sbd, SYS_BUS_DEVICE(&s->ohci));
 
     /* bridge to serial emulation module */
     sysbus_realize(SYS_BUS_DEVICE(&s->serial), &error_fatal);
@@ -1980,7 +1977,6 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
 
 static Property sm501_sysbus_properties[] = {
     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
-    DEFINE_PROP_UINT32("base", SM501SysBusState, base, 0),
     DEFINE_PROP_END_OF_LIST(),
 };
 
@@ -2016,15 +2012,19 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
 static void sm501_sysbus_init(Object *o)
 {
     SM501SysBusState *sm501 = SYSBUS_SM501(o);
+    OHCISysBusState *ohci = &sm501->ohci;
     SerialMM *smm = &sm501->serial;
 
+    object_initialize_child(o, "ohci", ohci, TYPE_SYSBUS_OHCI);
+    object_property_add_alias(o, "base", OBJECT(ohci), "dma-offset");
+    qdev_prop_set_uint32(DEVICE(ohci), "num-ports", 2);
+
     object_initialize_child(o, "serial", smm, TYPE_SERIAL_MM);
     qdev_set_legacy_instance_id(DEVICE(smm), SM501_UART0, 2);
     qdev_prop_set_uint8(DEVICE(smm), "regshift", 2);
     qdev_prop_set_uint8(DEVICE(smm), "endianness", DEVICE_LITTLE_ENDIAN);
 
-    object_property_add_alias(o, "chardev",
-                              OBJECT(smm), "chardev");
+    object_property_add_alias(o, "chardev", OBJECT(smm), "chardev");
 }
 
 static const TypeInfo sm501_sysbus_info = {
diff --git a/hw/sh4/r2d.c b/hw/sh4/r2d.c
index 39fc4f19d9..279724ffbb 100644
--- a/hw/sh4/r2d.c
+++ b/hw/sh4/r2d.c
@@ -274,7 +274,7 @@ static void r2d_init(MachineState *machine)
     dev = qdev_new("sysbus-sm501");
     busdev = SYS_BUS_DEVICE(dev);
     qdev_prop_set_uint32(dev, "vram-size", SM501_VRAM_SIZE);
-    qdev_prop_set_uint32(dev, "base", 0x10000000);
+    qdev_prop_set_uint64(dev, "base", 0x10000000);
     qdev_prop_set_chr(dev, "chardev", serial_hd(2));
     sysbus_realize_and_unref(busdev, &error_fatal);
     sysbus_mmio_map(busdev, 0, 0x10000000);
-- 
2.38.1


