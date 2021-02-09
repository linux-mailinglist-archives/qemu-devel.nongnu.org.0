Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A3314DB9
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:04:39 +0100 (CET)
Received: from localhost ([::1]:58732 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9Qow-00054V-EA
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:04:38 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34822)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berardi.dav@gmail.com>)
 id 1l9QnP-000468-GK; Tue, 09 Feb 2021 06:03:03 -0500
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:42089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <berardi.dav@gmail.com>)
 id 1l9QnM-0000XM-G3; Tue, 09 Feb 2021 06:03:02 -0500
Received: by mail-wr1-x430.google.com with SMTP id r21so4846327wrr.9;
 Tue, 09 Feb 2021 03:02:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=date:from:to:cc:subject:message-id:mime-version:content-disposition;
 bh=0WWcMg4JsER/8CpHpHb1Sg9R4hoc8deFkLkW0zU4jvs=;
 b=T6yUIP9j9O7om7HxufmL0dH+7sriyouBDDtKOAL+Ppis9zQ8KAzQYGQUDWGjx915pC
 nvcC8KVhEMla0Kv+yut4OgGtnkdNXk3B8sSyLxgMLv2YkUX/e3hNPcpRN0hLm5/GtPbX
 8O1rv+EW0MejfnJKyrAHhCvnqS3ZBmqnMWUDz0G5AF0+ktBnjIwQ02Edr/Zs137Zqm62
 XYLrrvVMlY4PpIYipZOn9s52zO5GEjq+qGxFz+kljBBDTRKDz1udZ9LkVBH4f1aNkCw4
 1wv1n+B8KHfJWH6DnS4Bda6xKpjXJxByFL+ILP9h+mGHcTVXXB0Iq3JOC0BWeZOjf/vd
 6+aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
 :content-disposition;
 bh=0WWcMg4JsER/8CpHpHb1Sg9R4hoc8deFkLkW0zU4jvs=;
 b=pX8//xTiX8GpAAVtIBfN5qF+OPXCYfgJTzwjPYEhfy7s6YzrTjCet5CRL63r63yqJD
 wEbizR9mExJsJE3fyDC1dm3oJ3uC2bC7E2EseidZ9jQBzobTqQM5RRD0jrzwIjKLoAhW
 y8VhiNjGRZ8/XZgJAmCn9H0uAbX/9v5t16TbJ52HBltY1f1dUmgAUSSUOyDZ9iuCa/k+
 AYF1za+waTIewYUGeid4aJg9qYtm3leN1NbeU8jppXK0VPjAITMXmvXBe6yosnU1dvHC
 QbH9JDDK+4Z07X/MbSDfkt9jK6/V+YTukp+QiVpLn1QIm1jSs+7kgPiWNSto5+0RpM5v
 hxLQ==
X-Gm-Message-State: AOAM530DgtoAC5mW8iQLUzU7cKUjipyI7OeDTaMqQyNZHQQqrpg1oqVw
 FDx6MSqe4oX4XqB84uyIDKalLnntddwwyA==
X-Google-Smtp-Source: ABdhPJyxt8/bXy7Vcrpztfwnpyqn2Br1MkezkiNBAbTjF+Bq01RBDHDWnLx53jH1aZje6GRDmBRU3w==
X-Received: by 2002:adf:f68e:: with SMTP id v14mr24547262wrp.273.1612868577687; 
 Tue, 09 Feb 2021 03:02:57 -0800 (PST)
Received: from localhost ([37.163.141.139])
 by smtp.gmail.com with ESMTPSA id t8sm3503346wmq.36.2021.02.09.03.02.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Feb 2021 03:02:56 -0800 (PST)
Date: Tue, 9 Feb 2021 12:02:52 +0100
From: Davide Berardi <berardi.dav@gmail.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] Raspberry PI GPIO interrupt support
Message-ID: <20210209110252.GA14409@carpenter.lan>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=berardi.dav@gmail.com; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The bcm2835 GPIOs now generate interrupts.
This modification enables QTEST clients to trigger interrupt-based
interfaces.

Signed-off-by: Davide Berardi <berardi.dav@gmail.com>
---
   hw/arm/bcm2835_peripherals.c   |   2 +
   hw/gpio/bcm2835_gpio.c         | 105 +++++++++++++++++++++++++++++++++
   hw/intc/bcm2835_ic.c           |   2 -
   include/hw/gpio/bcm2835_gpio.h |  12 ++++
   4 files changed, 119 insertions(+), 2 deletions(-)

diff --git a/hw/arm/bcm2835_peripherals.c b/hw/arm/bcm2835_peripherals.c
index dcff13433e..101c3e6fba 100644
--- a/hw/arm/bcm2835_peripherals.c
+++ b/hw/arm/bcm2835_peripherals.c
@@ -114,6 +114,8 @@ static void bcm2835_peripherals_init(Object *obj)
                                      OBJECT(&s->sdhci.sdbus));
       object_property_add_const_link(OBJECT(&s->gpio), "sdbus-sdhost",
                                      OBJECT(&s->sdhost.sdbus));
+    object_property_add_const_link(OBJECT(&s->gpio), "ic",
+                                   OBJECT(&s->ic));
   
       /* Mphi */
       object_initialize_child(obj, "mphi", &s->mphi, TYPE_BCM2835_MPHI);
diff --git a/hw/gpio/bcm2835_gpio.c b/hw/gpio/bcm2835_gpio.c
index abdddbc67c..2952ebe1da 100644
--- a/hw/gpio/bcm2835_gpio.c
+++ b/hw/gpio/bcm2835_gpio.c
@@ -7,6 +7,9 @@
    *  Clement Deschamps <clement.deschamps@antfield.fr>
    *  Luc Michel <luc.michel@antfield.fr>
    *
+ * GPIO Interrupt support
+ *  Davide Berardi <berardi.dav@gmail.com>
+ *
    * This work is licensed under the terms of the GNU GPL, version 2 or later.
    * See the COPYING file in the top-level directory.
    */
@@ -20,6 +23,7 @@
   #include "migration/vmstate.h"
   #include "hw/sd/sd.h"
   #include "hw/gpio/bcm2835_gpio.h"
+#include "hw/intc/bcm2835_ic.h"
   #include "hw/irq.h"
   
   #define GPFSEL0   0x00
@@ -110,6 +114,29 @@ static int gpfsel_is_out(BCM2835GpioState *s, int index)
       return 0;
   }
   
+static inline int get_bit_2_u32(const uint32_t idx,
+                                const uint32_t v1, const uint32_t v2)
+{
+    uint64_t v = v1 | ((uint64_t)v2) << 32;
+    return !!(v & (1 << idx));
+}
+
+static int ren_detect(BCM2835GpioState *s, int index)
+{
+    if (index >= 0 && index < 54) {
+        return get_bit_2_u32(index, s->ren0, s->ren1);
+    }
+    return 0;
+}
+
+static int fen_detect(BCM2835GpioState *s, int index)
+{
+    if (index >= 0 && index < 54) {
+        return get_bit_2_u32(index, s->fen0, s->fen1);
+    }
+    return 0;
+}
+
   static void gpset(BCM2835GpioState *s,
           uint32_t val, uint8_t start, uint8_t count, uint32_t *lev)
   {
@@ -120,6 +147,20 @@ static void gpset(BCM2835GpioState *s,
       for (i = 0; i < count; i++) {
           if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
               qemu_set_irq(s->out[start + i], 1);
+        } else if ((changes & cur) && ren_detect(s, start + i)) {
+            /* If this is an input and must check rising edge */
+            int irqline = 0;
+            if (i > 27)
+                irqline = 1;
+            if (i > 45)
+                irqline = 2;
+
+            /* Set the bit in the events */
+            if (i < 32)
+                s->eds0 |= cur;
+            else
+                s->eds1 |= cur;
+            qemu_set_irq(s->irq[irqline], 1);
           }
           cur <<= 1;
       }
@@ -137,6 +178,15 @@ static void gpclr(BCM2835GpioState *s,
       for (i = 0; i < count; i++) {
           if ((changes & cur) && (gpfsel_is_out(s, start + i))) {
               qemu_set_irq(s->out[start + i], 0);
+        } else if ((changes & cur) && fen_detect(s, start + i)) {
+            /* If this is an input we must check falling edge */
+            int irqline = 0;
+            if (i > 27)
+                irqline = 1;
+            if (i > 45)
+              irqline = 2;
+
+            qemu_set_irq(s->irq[irqline], 1);
           }
           cur <<= 1;
       }
@@ -144,6 +194,34 @@ static void gpclr(BCM2835GpioState *s,
       *lev &= ~val;
   }
   
+static int gpio_from_value(uint64_t value, int bank)
+{
+    int i;
+    for (i = 0 ; i < 32; ++i)
+        if (value & (1 << i))
+           return i + (32 * bank);
+    return 0;
+}
+
+static void eds_clear(BCM2835GpioState *s, uint64_t value, int bank)
+{
+    int gpio = 0;
+    int irqline = 0;
+    if (bank) {
+        s->eds0 &= ~value;
+    } else {
+        s->eds1 &= (~value & 0x3f);
+    }
+    gpio = gpio_from_value(value, bank);
+
+    if (gpio > 27)
+       irqline = 1;
+    if (gpio > 45)
+       irqline = 2;
+
+    qemu_set_irq(s->irq[irqline], 0);
+}
+
   static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
           unsigned size)
   {
@@ -170,11 +248,17 @@ static uint64_t bcm2835_gpio_read(void *opaque, hwaddr offset,
       case GPLEV1:
           return s->lev1;
       case GPEDS0:
+        return s->eds0;
       case GPEDS1:
+        return s->eds1;
       case GPREN0:
+        return s->ren0;
       case GPREN1:
+        return s->ren1;
       case GPFEN0:
+        return s->fen0;
       case GPFEN1:
+        return s->fen1;
       case GPHEN0:
       case GPHEN1:
       case GPLEN0:
@@ -228,11 +312,23 @@ static void bcm2835_gpio_write(void *opaque, hwaddr offset,
           /* Read Only */
           break;
       case GPEDS0:
+        eds_clear(s, value, 0);
+        break;
       case GPEDS1:
+        eds_clear(s, value, 1);
+        break;
       case GPREN0:
+        s->ren0 = value;
+        break;
       case GPREN1:
+        s->ren1 = value;
+        break;
       case GPFEN0:
+        s->fen0 = value;
+        break;
       case GPFEN1:
+        s->fen1 = value;
+        break;
       case GPHEN0:
       case GPHEN1:
       case GPLEN0:
@@ -310,6 +406,7 @@ static void bcm2835_gpio_init(Object *obj)
   
   static void bcm2835_gpio_realize(DeviceState *dev, Error **errp)
   {
+    int i;
       BCM2835GpioState *s = BCM2835_GPIO(dev);
       Object *obj;
   
@@ -318,6 +415,14 @@ static void bcm2835_gpio_realize(DeviceState *dev, Error **errp)
   
       obj = object_property_get_link(OBJECT(dev), "sdbus-sdhost", &error_abort);
       s->sdbus_sdhost = SD_BUS(obj);
+
+    obj = object_property_get_link(OBJECT(dev), "ic", &error_abort);
+    s->ic = BCM2835_IC(obj);
+
+    for (i = 0 ; i < 3; ++i) {
+        s->irq[i] = qdev_get_gpio_in_named(DEVICE(obj),
+                                           BCM2835_IC_GPU_IRQ, i + 49);
+    }
   }
   
   static void bcm2835_gpio_class_init(ObjectClass *klass, void *data)
diff --git a/hw/intc/bcm2835_ic.c b/hw/intc/bcm2835_ic.c
index 9000d995e8..b381dc6603 100644
--- a/hw/intc/bcm2835_ic.c
+++ b/hw/intc/bcm2835_ic.c
@@ -57,7 +57,6 @@ static void bcm2835_ic_update(BCM2835ICState *s)
   static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
   {
       BCM2835ICState *s = opaque;
-
       assert(irq >= 0 && irq < 64);
       trace_bcm2835_ic_set_gpu_irq(irq, level);
       s->gpu_irq_level = deposit64(s->gpu_irq_level, irq, 1, level != 0);
@@ -67,7 +66,6 @@ static void bcm2835_ic_set_gpu_irq(void *opaque, int irq, int level)
   static void bcm2835_ic_set_arm_irq(void *opaque, int irq, int level)
   {
       BCM2835ICState *s = opaque;
-
       assert(irq >= 0 && irq < 8);
       trace_bcm2835_ic_set_cpu_irq(irq, level);
       s->arm_irq_level = deposit32(s->arm_irq_level, irq, 1, level != 0);
diff --git a/include/hw/gpio/bcm2835_gpio.h b/include/hw/gpio/bcm2835_gpio.h
index 1c53a05090..cad3e987d3 100644
--- a/include/hw/gpio/bcm2835_gpio.h
+++ b/include/hw/gpio/bcm2835_gpio.h
@@ -7,6 +7,9 @@
    *  Clement Deschamps <clement.deschamps@antfield.fr>
    *  Luc Michel <luc.michel@antfield.fr>
    *
+ * GPIO External support
+ *  Davide Berardi <berardi.dav@gmail.com>
+ *
    * This work is licensed under the terms of the GNU GPL, version 2 or later.
    * See the COPYING file in the top-level directory.
    */
@@ -17,6 +20,7 @@
   #include "hw/sd/sd.h"
   #include "hw/sysbus.h"
   #include "qom/object.h"
+#include "hw/intc/bcm2835_ic.h"
   
   struct BCM2835GpioState {
       SysBusDevice parent_obj;
@@ -27,11 +31,19 @@ struct BCM2835GpioState {
       SDBus sdbus;
       SDBus *sdbus_sdhci;
       SDBus *sdbus_sdhost;
+    BCM2835ICState *ic;
   
       uint8_t fsel[54];
       uint32_t lev0, lev1;
+    /* Event detection */
+    uint32_t eds0, eds1;
+    /* Edge selector */
+    uint32_t ren0, ren1;
+    uint32_t fen0, fen1;
+
       uint8_t sd_fsel;
       qemu_irq out[54];
+    qemu_irq irq[3];
   };
   
   #define TYPE_BCM2835_GPIO "bcm2835_gpio"
-- 
2.30.0


