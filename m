Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 929233EA24C
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Aug 2021 11:46:26 +0200 (CEST)
Received: from localhost ([::1]:37768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mE7I9-0006vc-Ie
	for lists+qemu-devel@lfdr.de; Thu, 12 Aug 2021 05:46:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46842)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76a-0006HW-8C
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:28 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:35554)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mE76U-00085R-Uc
 for qemu-devel@nongnu.org; Thu, 12 Aug 2021 05:34:27 -0400
Received: by mail-wr1-x430.google.com with SMTP id q10so7379338wro.2
 for <qemu-devel@nongnu.org>; Thu, 12 Aug 2021 02:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+ohWM8OWbk1iWiPzDar2gc3/n7qlkWreHSd+FbDbzw4=;
 b=dXbbU1Ow+65aQcHovQA7Awmq/i9b7Rz0OAzPBIVSFzjyJLKFL7rDBL9wnGH3m+XYFf
 Kddao1imyy6/gApvGKoLlRHNKzyIkgUk0H3qOtCnx/MCbS2d2oME4VCIrvofBYlg95xQ
 dkOcWzIZQyWNNo6djRnzLGlXt9EEhEmK+TzgLFJV0dqQOBVML+yaIUBKHtPLWQPkK7P8
 oc3UHfze+PuaQ6H2iooYNIzLoj/2K0nNUQLc5pL87x9K59+SrfWfaW1XDHo56MQ9ghOM
 0ZE5HvuELcAN9FseWJzzZ4AruNoKxGTjFTAewN7qEY4BnHG/qNYA5pMTNsssM8O+kT5F
 Z0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+ohWM8OWbk1iWiPzDar2gc3/n7qlkWreHSd+FbDbzw4=;
 b=BzuF7rMS78g8Bu8yjfsxa4zjoGT4kuJQbGiToL89wsRoW2jtoq2vqYZxHqiTaAno0J
 aUsl2YRhDcrqddYDjT84aJS7GLN3re1jJmo86fLc+8fa2YKPa0z4o1xYgk+VkpvO4WwY
 JzE4/B035t4njMKBeeAoTWXofGrIsc0co1L5ycOIw4jxm6s4hyJoF7ptWBoQ+vWZXIEQ
 jnbe8HSDYV3AgNwg1zrUcNSDGkMnfU9AFbaw28dH5eUhZCBYUdYcBA75DuNJcJovn+P6
 hxSm9SwqehfitQaChao1fgMFYTX8rK+pA2uofZGLmHu57DPPMoGINy1gexFBMJ2ycmQx
 F3rw==
X-Gm-Message-State: AOAM532viwV4y37PMxmcV6SPbaFxgzwdRsztyk9mAwEt44seSvhFYwYI
 WqeNK44A0fEv54AY8e7+v+Fbng==
X-Google-Smtp-Source: ABdhPJxPErvFKE2Lb3PHIWeR0Xevv5Ynt5wWiT+jp8WKmZ6w/yq0yOgT1AAAaRotbYKY56VH5jDG2Q==
X-Received: by 2002:a5d:6908:: with SMTP id t8mr1863582wru.182.1628760861252; 
 Thu, 12 Aug 2021 02:34:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id l38sm8158506wmp.15.2021.08.12.02.34.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 02:34:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.2 23/25] hw/arm/stellaris: Split stellaris-gptm into its
 own file
Date: Thu, 12 Aug 2021 10:33:54 +0100
Message-Id: <20210812093356.1946-24-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210812093356.1946-1-peter.maydell@linaro.org>
References: <20210812093356.1946-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Damien Hedde <damien.hedde@greensocs.com>, Luc Michel <luc@lmichel.fr>,
 Alistair Francis <alistair@alistair23.me>,
 Subbaraya Sundeep <sundeep.lkml@gmail.com>, Joel Stanley <joel@jms.id.au>,
 Alexandre Iooss <erdnaxe@crans.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The implementation of the Stellaris general purpose timer module
device stellaris-gptm is currently in the same source file as the
board model.  Split it out into its own source file in hw/timer.

Apart from the new file comment headers and the Kconfig and
meson.build changes, this is just code movement.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 include/hw/timer/stellaris-gptm.h |  48 +++++
 hw/arm/stellaris.c                | 321 +-----------------------------
 hw/timer/stellaris-gptm.c         | 314 +++++++++++++++++++++++++++++
 hw/arm/Kconfig                    |   1 +
 hw/timer/Kconfig                  |   3 +
 hw/timer/meson.build              |   1 +
 6 files changed, 368 insertions(+), 320 deletions(-)
 create mode 100644 include/hw/timer/stellaris-gptm.h
 create mode 100644 hw/timer/stellaris-gptm.c

diff --git a/include/hw/timer/stellaris-gptm.h b/include/hw/timer/stellaris-gptm.h
new file mode 100644
index 00000000000..b8fa43c94bf
--- /dev/null
+++ b/include/hw/timer/stellaris-gptm.h
@@ -0,0 +1,48 @@
+/*
+ * Luminary Micro Stellaris General Purpose Timer Module
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#ifndef HW_TIMER_STELLARIS_GPTM_H
+#define HW_TIMER_STELLARIS_GPTM_H
+
+#include "qom/object.h"
+#include "hw/sysbus.h"
+#include "hw/irq.h"
+
+#define TYPE_STELLARIS_GPTM "stellaris-gptm"
+OBJECT_DECLARE_SIMPLE_TYPE(gptm_state, STELLARIS_GPTM)
+
+/*
+ * QEMU interface:
+ *  + sysbus MMIO region 0: register bank
+ *  + sysbus IRQ 0: timer interrupt
+ *  + unnamed GPIO output 0: trigger output for the ADC
+ */
+struct gptm_state {
+    SysBusDevice parent_obj;
+
+    MemoryRegion iomem;
+    uint32_t config;
+    uint32_t mode[2];
+    uint32_t control;
+    uint32_t state;
+    uint32_t mask;
+    uint32_t load[2];
+    uint32_t match[2];
+    uint32_t prescale[2];
+    uint32_t match_prescale[2];
+    uint32_t rtc;
+    int64_t tick[2];
+    struct gptm_state *opaque[2];
+    QEMUTimer *timer[2];
+    /* The timers have an alternate output used to trigger the ADC.  */
+    qemu_irq trigger;
+    qemu_irq irq;
+};
+
+#endif
diff --git a/hw/arm/stellaris.c b/hw/arm/stellaris.c
index a32c567ce11..8c547f146a9 100644
--- a/hw/arm/stellaris.c
+++ b/hw/arm/stellaris.c
@@ -26,6 +26,7 @@
 #include "hw/watchdog/cmsdk-apb-watchdog.h"
 #include "migration/vmstate.h"
 #include "hw/misc/unimp.h"
+#include "hw/timer/stellaris-gptm.h"
 #include "hw/qdev-clock.h"
 #include "qom/object.h"
 
@@ -55,309 +56,6 @@ typedef const struct {
     uint32_t peripherals;
 } stellaris_board_info;
 
-/* General purpose timer module.  */
-
-#define TYPE_STELLARIS_GPTM "stellaris-gptm"
-OBJECT_DECLARE_SIMPLE_TYPE(gptm_state, STELLARIS_GPTM)
-
-struct gptm_state {
-    SysBusDevice parent_obj;
-
-    MemoryRegion iomem;
-    uint32_t config;
-    uint32_t mode[2];
-    uint32_t control;
-    uint32_t state;
-    uint32_t mask;
-    uint32_t load[2];
-    uint32_t match[2];
-    uint32_t prescale[2];
-    uint32_t match_prescale[2];
-    uint32_t rtc;
-    int64_t tick[2];
-    struct gptm_state *opaque[2];
-    QEMUTimer *timer[2];
-    /* The timers have an alternate output used to trigger the ADC.  */
-    qemu_irq trigger;
-    qemu_irq irq;
-};
-
-static void gptm_update_irq(gptm_state *s)
-{
-    int level;
-    level = (s->state & s->mask) != 0;
-    qemu_set_irq(s->irq, level);
-}
-
-static void gptm_stop(gptm_state *s, int n)
-{
-    timer_del(s->timer[n]);
-}
-
-static void gptm_reload(gptm_state *s, int n, int reset)
-{
-    int64_t tick;
-    if (reset) {
-        tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
-    } else {
-        tick = s->tick[n];
-    }
-
-    if (s->config == 0) {
-        /* 32-bit CountDown.  */
-        uint32_t count;
-        count = s->load[0] | (s->load[1] << 16);
-        tick += (int64_t)count * system_clock_scale;
-    } else if (s->config == 1) {
-        /* 32-bit RTC.  1Hz tick.  */
-        tick += NANOSECONDS_PER_SECOND;
-    } else if (s->mode[n] == 0xa) {
-        /* PWM mode.  Not implemented.  */
-    } else {
-        qemu_log_mask(LOG_UNIMP,
-                      "GPTM: 16-bit timer mode unimplemented: 0x%x\n",
-                      s->mode[n]);
-        return;
-    }
-    s->tick[n] = tick;
-    timer_mod(s->timer[n], tick);
-}
-
-static void gptm_tick(void *opaque)
-{
-    gptm_state **p = (gptm_state **)opaque;
-    gptm_state *s;
-    int n;
-
-    s = *p;
-    n = p - s->opaque;
-    if (s->config == 0) {
-        s->state |= 1;
-        if ((s->control & 0x20)) {
-            /* Output trigger.  */
-            qemu_irq_pulse(s->trigger);
-        }
-        if (s->mode[0] & 1) {
-            /* One-shot.  */
-            s->control &= ~1;
-        } else {
-            /* Periodic.  */
-            gptm_reload(s, 0, 0);
-        }
-    } else if (s->config == 1) {
-        /* RTC.  */
-        uint32_t match;
-        s->rtc++;
-        match = s->match[0] | (s->match[1] << 16);
-        if (s->rtc > match)
-            s->rtc = 0;
-        if (s->rtc == 0) {
-            s->state |= 8;
-        }
-        gptm_reload(s, 0, 0);
-    } else if (s->mode[n] == 0xa) {
-        /* PWM mode.  Not implemented.  */
-    } else {
-        qemu_log_mask(LOG_UNIMP,
-                      "GPTM: 16-bit timer mode unimplemented: 0x%x\n",
-                      s->mode[n]);
-    }
-    gptm_update_irq(s);
-}
-
-static uint64_t gptm_read(void *opaque, hwaddr offset,
-                          unsigned size)
-{
-    gptm_state *s = (gptm_state *)opaque;
-
-    switch (offset) {
-    case 0x00: /* CFG */
-        return s->config;
-    case 0x04: /* TAMR */
-        return s->mode[0];
-    case 0x08: /* TBMR */
-        return s->mode[1];
-    case 0x0c: /* CTL */
-        return s->control;
-    case 0x18: /* IMR */
-        return s->mask;
-    case 0x1c: /* RIS */
-        return s->state;
-    case 0x20: /* MIS */
-        return s->state & s->mask;
-    case 0x24: /* CR */
-        return 0;
-    case 0x28: /* TAILR */
-        return s->load[0] | ((s->config < 4) ? (s->load[1] << 16) : 0);
-    case 0x2c: /* TBILR */
-        return s->load[1];
-    case 0x30: /* TAMARCHR */
-        return s->match[0] | ((s->config < 4) ? (s->match[1] << 16) : 0);
-    case 0x34: /* TBMATCHR */
-        return s->match[1];
-    case 0x38: /* TAPR */
-        return s->prescale[0];
-    case 0x3c: /* TBPR */
-        return s->prescale[1];
-    case 0x40: /* TAPMR */
-        return s->match_prescale[0];
-    case 0x44: /* TBPMR */
-        return s->match_prescale[1];
-    case 0x48: /* TAR */
-        if (s->config == 1) {
-            return s->rtc;
-        }
-        qemu_log_mask(LOG_UNIMP,
-                      "GPTM: read of TAR but timer read not supported\n");
-        return 0;
-    case 0x4c: /* TBR */
-        qemu_log_mask(LOG_UNIMP,
-                      "GPTM: read of TBR but timer read not supported\n");
-        return 0;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: read at bad offset 0x02%" HWADDR_PRIx "\n",
-                      offset);
-        return 0;
-    }
-}
-
-static void gptm_write(void *opaque, hwaddr offset,
-                       uint64_t value, unsigned size)
-{
-    gptm_state *s = (gptm_state *)opaque;
-    uint32_t oldval;
-
-    /*
-     * The timers should be disabled before changing the configuration.
-     * We take advantage of this and defer everything until the timer
-     * is enabled.
-     */
-    switch (offset) {
-    case 0x00: /* CFG */
-        s->config = value;
-        break;
-    case 0x04: /* TAMR */
-        s->mode[0] = value;
-        break;
-    case 0x08: /* TBMR */
-        s->mode[1] = value;
-        break;
-    case 0x0c: /* CTL */
-        oldval = s->control;
-        s->control = value;
-        /* TODO: Implement pause.  */
-        if ((oldval ^ value) & 1) {
-            if (value & 1) {
-                gptm_reload(s, 0, 1);
-            } else {
-                gptm_stop(s, 0);
-            }
-        }
-        if (((oldval ^ value) & 0x100) && s->config >= 4) {
-            if (value & 0x100) {
-                gptm_reload(s, 1, 1);
-            } else {
-                gptm_stop(s, 1);
-            }
-        }
-        break;
-    case 0x18: /* IMR */
-        s->mask = value & 0x77;
-        gptm_update_irq(s);
-        break;
-    case 0x24: /* CR */
-        s->state &= ~value;
-        break;
-    case 0x28: /* TAILR */
-        s->load[0] = value & 0xffff;
-        if (s->config < 4) {
-            s->load[1] = value >> 16;
-        }
-        break;
-    case 0x2c: /* TBILR */
-        s->load[1] = value & 0xffff;
-        break;
-    case 0x30: /* TAMARCHR */
-        s->match[0] = value & 0xffff;
-        if (s->config < 4) {
-            s->match[1] = value >> 16;
-        }
-        break;
-    case 0x34: /* TBMATCHR */
-        s->match[1] = value >> 16;
-        break;
-    case 0x38: /* TAPR */
-        s->prescale[0] = value;
-        break;
-    case 0x3c: /* TBPR */
-        s->prescale[1] = value;
-        break;
-    case 0x40: /* TAPMR */
-        s->match_prescale[0] = value;
-        break;
-    case 0x44: /* TBPMR */
-        s->match_prescale[0] = value;
-        break;
-    default:
-        qemu_log_mask(LOG_GUEST_ERROR,
-                      "GPTM: write at bad offset 0x02%" HWADDR_PRIx "\n",
-                      offset);
-    }
-    gptm_update_irq(s);
-}
-
-static const MemoryRegionOps gptm_ops = {
-    .read = gptm_read,
-    .write = gptm_write,
-    .endianness = DEVICE_NATIVE_ENDIAN,
-};
-
-static const VMStateDescription vmstate_stellaris_gptm = {
-    .name = "stellaris_gptm",
-    .version_id = 1,
-    .minimum_version_id = 1,
-    .fields = (VMStateField[]) {
-        VMSTATE_UINT32(config, gptm_state),
-        VMSTATE_UINT32_ARRAY(mode, gptm_state, 2),
-        VMSTATE_UINT32(control, gptm_state),
-        VMSTATE_UINT32(state, gptm_state),
-        VMSTATE_UINT32(mask, gptm_state),
-        VMSTATE_UNUSED(8),
-        VMSTATE_UINT32_ARRAY(load, gptm_state, 2),
-        VMSTATE_UINT32_ARRAY(match, gptm_state, 2),
-        VMSTATE_UINT32_ARRAY(prescale, gptm_state, 2),
-        VMSTATE_UINT32_ARRAY(match_prescale, gptm_state, 2),
-        VMSTATE_UINT32(rtc, gptm_state),
-        VMSTATE_INT64_ARRAY(tick, gptm_state, 2),
-        VMSTATE_TIMER_PTR_ARRAY(timer, gptm_state, 2),
-        VMSTATE_END_OF_LIST()
-    }
-};
-
-static void stellaris_gptm_init(Object *obj)
-{
-    DeviceState *dev = DEVICE(obj);
-    gptm_state *s = STELLARIS_GPTM(obj);
-    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
-
-    sysbus_init_irq(sbd, &s->irq);
-    qdev_init_gpio_out(dev, &s->trigger, 1);
-
-    memory_region_init_io(&s->iomem, obj, &gptm_ops, s,
-                          "gptm", 0x1000);
-    sysbus_init_mmio(sbd, &s->iomem);
-
-    s->opaque[0] = s->opaque[1] = s;
-}
-
-static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
-{
-    gptm_state *s = STELLARIS_GPTM(dev);
-    s->timer[0] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[0]);
-    s->timer[1] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[1]);
-}
-
 /* System controller.  */
 
 #define TYPE_STELLARIS_SYS "stellaris-sys"
@@ -1642,22 +1340,6 @@ static const TypeInfo stellaris_i2c_info = {
     .class_init    = stellaris_i2c_class_init,
 };
 
-static void stellaris_gptm_class_init(ObjectClass *klass, void *data)
-{
-    DeviceClass *dc = DEVICE_CLASS(klass);
-
-    dc->vmsd = &vmstate_stellaris_gptm;
-    dc->realize = stellaris_gptm_realize;
-}
-
-static const TypeInfo stellaris_gptm_info = {
-    .name          = TYPE_STELLARIS_GPTM,
-    .parent        = TYPE_SYS_BUS_DEVICE,
-    .instance_size = sizeof(gptm_state),
-    .instance_init = stellaris_gptm_init,
-    .class_init    = stellaris_gptm_class_init,
-};
-
 static void stellaris_adc_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -1696,7 +1378,6 @@ static const TypeInfo stellaris_sys_info = {
 static void stellaris_register_types(void)
 {
     type_register_static(&stellaris_i2c_info);
-    type_register_static(&stellaris_gptm_info);
     type_register_static(&stellaris_adc_info);
     type_register_static(&stellaris_sys_info);
 }
diff --git a/hw/timer/stellaris-gptm.c b/hw/timer/stellaris-gptm.c
new file mode 100644
index 00000000000..7846fe5f84e
--- /dev/null
+++ b/hw/timer/stellaris-gptm.c
@@ -0,0 +1,314 @@
+/*
+ * Luminary Micro Stellaris General Purpose Timer Module
+ *
+ * Copyright (c) 2006 CodeSourcery.
+ * Written by Paul Brook
+ *
+ * This code is licensed under the GPL.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "migration/vmstate.h"
+#include "hw/timer/stellaris-gptm.h"
+#include "hw/timer/armv7m_systick.h" /* Needed only for system_clock_scale */
+
+static void gptm_update_irq(gptm_state *s)
+{
+    int level;
+    level = (s->state & s->mask) != 0;
+    qemu_set_irq(s->irq, level);
+}
+
+static void gptm_stop(gptm_state *s, int n)
+{
+    timer_del(s->timer[n]);
+}
+
+static void gptm_reload(gptm_state *s, int n, int reset)
+{
+    int64_t tick;
+    if (reset) {
+        tick = qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL);
+    } else {
+        tick = s->tick[n];
+    }
+
+    if (s->config == 0) {
+        /* 32-bit CountDown.  */
+        uint32_t count;
+        count = s->load[0] | (s->load[1] << 16);
+        tick += (int64_t)count * system_clock_scale;
+    } else if (s->config == 1) {
+        /* 32-bit RTC.  1Hz tick.  */
+        tick += NANOSECONDS_PER_SECOND;
+    } else if (s->mode[n] == 0xa) {
+        /* PWM mode.  Not implemented.  */
+    } else {
+        qemu_log_mask(LOG_UNIMP,
+                      "GPTM: 16-bit timer mode unimplemented: 0x%x\n",
+                      s->mode[n]);
+        return;
+    }
+    s->tick[n] = tick;
+    timer_mod(s->timer[n], tick);
+}
+
+static void gptm_tick(void *opaque)
+{
+    gptm_state **p = (gptm_state **)opaque;
+    gptm_state *s;
+    int n;
+
+    s = *p;
+    n = p - s->opaque;
+    if (s->config == 0) {
+        s->state |= 1;
+        if ((s->control & 0x20)) {
+            /* Output trigger.  */
+            qemu_irq_pulse(s->trigger);
+        }
+        if (s->mode[0] & 1) {
+            /* One-shot.  */
+            s->control &= ~1;
+        } else {
+            /* Periodic.  */
+            gptm_reload(s, 0, 0);
+        }
+    } else if (s->config == 1) {
+        /* RTC.  */
+        uint32_t match;
+        s->rtc++;
+        match = s->match[0] | (s->match[1] << 16);
+        if (s->rtc > match)
+            s->rtc = 0;
+        if (s->rtc == 0) {
+            s->state |= 8;
+        }
+        gptm_reload(s, 0, 0);
+    } else if (s->mode[n] == 0xa) {
+        /* PWM mode.  Not implemented.  */
+    } else {
+        qemu_log_mask(LOG_UNIMP,
+                      "GPTM: 16-bit timer mode unimplemented: 0x%x\n",
+                      s->mode[n]);
+    }
+    gptm_update_irq(s);
+}
+
+static uint64_t gptm_read(void *opaque, hwaddr offset,
+                          unsigned size)
+{
+    gptm_state *s = (gptm_state *)opaque;
+
+    switch (offset) {
+    case 0x00: /* CFG */
+        return s->config;
+    case 0x04: /* TAMR */
+        return s->mode[0];
+    case 0x08: /* TBMR */
+        return s->mode[1];
+    case 0x0c: /* CTL */
+        return s->control;
+    case 0x18: /* IMR */
+        return s->mask;
+    case 0x1c: /* RIS */
+        return s->state;
+    case 0x20: /* MIS */
+        return s->state & s->mask;
+    case 0x24: /* CR */
+        return 0;
+    case 0x28: /* TAILR */
+        return s->load[0] | ((s->config < 4) ? (s->load[1] << 16) : 0);
+    case 0x2c: /* TBILR */
+        return s->load[1];
+    case 0x30: /* TAMARCHR */
+        return s->match[0] | ((s->config < 4) ? (s->match[1] << 16) : 0);
+    case 0x34: /* TBMATCHR */
+        return s->match[1];
+    case 0x38: /* TAPR */
+        return s->prescale[0];
+    case 0x3c: /* TBPR */
+        return s->prescale[1];
+    case 0x40: /* TAPMR */
+        return s->match_prescale[0];
+    case 0x44: /* TBPMR */
+        return s->match_prescale[1];
+    case 0x48: /* TAR */
+        if (s->config == 1) {
+            return s->rtc;
+        }
+        qemu_log_mask(LOG_UNIMP,
+                      "GPTM: read of TAR but timer read not supported\n");
+        return 0;
+    case 0x4c: /* TBR */
+        qemu_log_mask(LOG_UNIMP,
+                      "GPTM: read of TBR but timer read not supported\n");
+        return 0;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "GPTM: read at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
+        return 0;
+    }
+}
+
+static void gptm_write(void *opaque, hwaddr offset,
+                       uint64_t value, unsigned size)
+{
+    gptm_state *s = (gptm_state *)opaque;
+    uint32_t oldval;
+
+    /*
+     * The timers should be disabled before changing the configuration.
+     * We take advantage of this and defer everything until the timer
+     * is enabled.
+     */
+    switch (offset) {
+    case 0x00: /* CFG */
+        s->config = value;
+        break;
+    case 0x04: /* TAMR */
+        s->mode[0] = value;
+        break;
+    case 0x08: /* TBMR */
+        s->mode[1] = value;
+        break;
+    case 0x0c: /* CTL */
+        oldval = s->control;
+        s->control = value;
+        /* TODO: Implement pause.  */
+        if ((oldval ^ value) & 1) {
+            if (value & 1) {
+                gptm_reload(s, 0, 1);
+            } else {
+                gptm_stop(s, 0);
+            }
+        }
+        if (((oldval ^ value) & 0x100) && s->config >= 4) {
+            if (value & 0x100) {
+                gptm_reload(s, 1, 1);
+            } else {
+                gptm_stop(s, 1);
+            }
+        }
+        break;
+    case 0x18: /* IMR */
+        s->mask = value & 0x77;
+        gptm_update_irq(s);
+        break;
+    case 0x24: /* CR */
+        s->state &= ~value;
+        break;
+    case 0x28: /* TAILR */
+        s->load[0] = value & 0xffff;
+        if (s->config < 4) {
+            s->load[1] = value >> 16;
+        }
+        break;
+    case 0x2c: /* TBILR */
+        s->load[1] = value & 0xffff;
+        break;
+    case 0x30: /* TAMARCHR */
+        s->match[0] = value & 0xffff;
+        if (s->config < 4) {
+            s->match[1] = value >> 16;
+        }
+        break;
+    case 0x34: /* TBMATCHR */
+        s->match[1] = value >> 16;
+        break;
+    case 0x38: /* TAPR */
+        s->prescale[0] = value;
+        break;
+    case 0x3c: /* TBPR */
+        s->prescale[1] = value;
+        break;
+    case 0x40: /* TAPMR */
+        s->match_prescale[0] = value;
+        break;
+    case 0x44: /* TBPMR */
+        s->match_prescale[0] = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "GPTM: write at bad offset 0x02%" HWADDR_PRIx "\n",
+                      offset);
+    }
+    gptm_update_irq(s);
+}
+
+static const MemoryRegionOps gptm_ops = {
+    .read = gptm_read,
+    .write = gptm_write,
+    .endianness = DEVICE_NATIVE_ENDIAN,
+};
+
+static const VMStateDescription vmstate_stellaris_gptm = {
+    .name = "stellaris_gptm",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32(config, gptm_state),
+        VMSTATE_UINT32_ARRAY(mode, gptm_state, 2),
+        VMSTATE_UINT32(control, gptm_state),
+        VMSTATE_UINT32(state, gptm_state),
+        VMSTATE_UINT32(mask, gptm_state),
+        VMSTATE_UNUSED(8),
+        VMSTATE_UINT32_ARRAY(load, gptm_state, 2),
+        VMSTATE_UINT32_ARRAY(match, gptm_state, 2),
+        VMSTATE_UINT32_ARRAY(prescale, gptm_state, 2),
+        VMSTATE_UINT32_ARRAY(match_prescale, gptm_state, 2),
+        VMSTATE_UINT32(rtc, gptm_state),
+        VMSTATE_INT64_ARRAY(tick, gptm_state, 2),
+        VMSTATE_TIMER_PTR_ARRAY(timer, gptm_state, 2),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void stellaris_gptm_init(Object *obj)
+{
+    DeviceState *dev = DEVICE(obj);
+    gptm_state *s = STELLARIS_GPTM(obj);
+    SysBusDevice *sbd = SYS_BUS_DEVICE(obj);
+
+    sysbus_init_irq(sbd, &s->irq);
+    qdev_init_gpio_out(dev, &s->trigger, 1);
+
+    memory_region_init_io(&s->iomem, obj, &gptm_ops, s,
+                          "gptm", 0x1000);
+    sysbus_init_mmio(sbd, &s->iomem);
+
+    s->opaque[0] = s->opaque[1] = s;
+}
+
+static void stellaris_gptm_realize(DeviceState *dev, Error **errp)
+{
+    gptm_state *s = STELLARIS_GPTM(dev);
+    s->timer[0] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[0]);
+    s->timer[1] = timer_new_ns(QEMU_CLOCK_VIRTUAL, gptm_tick, &s->opaque[1]);
+}
+
+static void stellaris_gptm_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->vmsd = &vmstate_stellaris_gptm;
+    dc->realize = stellaris_gptm_realize;
+}
+
+static const TypeInfo stellaris_gptm_info = {
+    .name          = TYPE_STELLARIS_GPTM,
+    .parent        = TYPE_SYS_BUS_DEVICE,
+    .instance_size = sizeof(gptm_state),
+    .instance_init = stellaris_gptm_init,
+    .class_init    = stellaris_gptm_class_init,
+};
+
+static void stellaris_gptm_register_types(void)
+{
+    type_register_static(&stellaris_gptm_info);
+}
+
+type_init(stellaris_gptm_register_types)
diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 4ba0aca0676..a261b6f13bd 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -237,6 +237,7 @@ config STELLARIS
     select SSI_SD
     select STELLARIS_INPUT
     select STELLARIS_ENET # ethernet
+    select STELLARIS_GPTM # general purpose timer module
     select UNIMP
 
 config STM32VLDISCOVERY
diff --git a/hw/timer/Kconfig b/hw/timer/Kconfig
index bac25117155..1e73da7e120 100644
--- a/hw/timer/Kconfig
+++ b/hw/timer/Kconfig
@@ -52,5 +52,8 @@ config SSE_COUNTER
 config SSE_TIMER
     bool
 
+config STELLARIS_GPTM
+    bool
+
 config AVR_TIMER16
     bool
diff --git a/hw/timer/meson.build b/hw/timer/meson.build
index 1aa3cd22844..e67478a8f10 100644
--- a/hw/timer/meson.build
+++ b/hw/timer/meson.build
@@ -31,6 +31,7 @@ softmmu_ss.add(when: 'CONFIG_SH_TIMER', if_true: files('sh_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SLAVIO', if_true: files('slavio_timer.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_COUNTER', if_true: files('sse-counter.c'))
 softmmu_ss.add(when: 'CONFIG_SSE_TIMER', if_true: files('sse-timer.c'))
+softmmu_ss.add(when: 'CONFIG_STELLARIS_GPTM', if_true: files('stellaris-gptm.c'))
 softmmu_ss.add(when: 'CONFIG_STM32F2XX_TIMER', if_true: files('stm32f2xx_timer.c'))
 softmmu_ss.add(when: 'CONFIG_XILINX', if_true: files('xilinx_timer.c'))
 specific_ss.add(when: 'CONFIG_IBEX', if_true: files('ibex_timer.c'))
-- 
2.20.1


