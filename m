Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D3A63CE44
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 05:15:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0EU7-00032H-TZ; Tue, 29 Nov 2022 23:14:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0EU6-00031t-12
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:14:10 -0500
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <evgeny.v.ermakov@gmail.com>)
 id 1p0ETy-000254-MK
 for qemu-devel@nongnu.org; Tue, 29 Nov 2022 23:14:09 -0500
Received: by mail-lf1-x12d.google.com with SMTP id f13so25095495lfa.6
 for <qemu-devel@nongnu.org>; Tue, 29 Nov 2022 20:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r/nMGcwmelHTeaPt7Ul1UnwKfhIhG9Ik4jEhGde7u1Y=;
 b=H8O44t7iNRLfzaeEvAwxsEXpRaAYkRtO3a29XqaWZCzrumgGLsU7XBKLUNgSWrc5ed
 MEM8CaAXIJhYtAfDDcPMGalqqORqbdpzG1QTlhN/tMVrzXL9K6zLYssatnfYbtLimzyl
 01mpSIs7j5h089/K5Siq+eUzObC4QYRuhIAulP2SkYX3hgK/OTYfic2xQab80L9SSDGR
 DG1KtiQicqahPJHU+QKGXXpCRSF5pxPq8Ter7IIxEYOLvR3kjMzWSF+gUHYyYi8UynwO
 uiEAQceby6KHBFLrDuW+DKllSidOPeBYSNreErxrMDsrQp9OLkiSBeWzfbXYYmSTv8mX
 S1vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r/nMGcwmelHTeaPt7Ul1UnwKfhIhG9Ik4jEhGde7u1Y=;
 b=Y+Nhd/t+ZjhiaLKqbaPeJI4I+3SAwSU8X2fA+wEJA8eCh66/0AMLPGKpHLKn+RA2Rt
 P3gdkjvmpHcgxQAykyhvs6SC0fqYFtKBMHHjgCWsBZppnqb45C4Gq3Pw65gTqi0MOGbq
 8dUBalRpX49lRwOsuhwawoOYoqppJbMImOZvSUCO7WNkvCDlUuuAes3Miz0jaZ2ubu7M
 xYWNlBWKxU6tPmlYHfFQgcjOQJpM3cpdd0I+8UZeD17k9zhrD/CwyY8OigSWl13y/7pv
 Nbj0eseoC/eQ3/GBseyFTC65FpC1/6DJzaIsQC+PIk2cZWNk+JnylTEPXl/ECKlKLBy+
 VEhA==
X-Gm-Message-State: ANoB5pmLMFzojreZbFmE9RKs4dDvLnxep1GLktSNIlQZDvh0IBOK0llO
 paIvNxIgQ9kmSWqcYHiPimhPUrA8HwI=
X-Google-Smtp-Source: AA0mqf4FHJlUnM9vfXqDBfmpETG5r0ewUvRc3sdjt8G5Pw421IxZeQC5zLZ2OCY0FYIxRYiVMtXUWw==
X-Received: by 2002:a19:ca55:0:b0:4b5:2ae5:d3bd with SMTP id
 h21-20020a19ca55000000b004b52ae5d3bdmr1379832lfj.46.1669781640553; 
 Tue, 29 Nov 2022 20:14:00 -0800 (PST)
Received: from front.loc ([80.83.238.100])
 by smtp.googlemail.com with ESMTPSA id
 f27-20020a19381b000000b004a25468d86asm81737lfa.68.2022.11.29.20.13.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Nov 2022 20:14:00 -0800 (PST)
From: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
To: qemu-devel@nongnu.org
Cc: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
Subject: [PATCH 2/2] hw/input: Add FT5336 touch controller
Date: Wed, 30 Nov 2022 15:12:59 +1100
Message-Id: <20221130041259.12032-3-evgeny.v.ermakov@gmail.com>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
References: <20221130041259.12032-1-evgeny.v.ermakov@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::12d;
 envelope-from=evgeny.v.ermakov@gmail.com; helo=mail-lf1-x12d.google.com
X-Spam_score_int: -5
X-Spam_score: -0.6
X-Spam_bar: /
X-Spam_report: (-0.6 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
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

Signed-off-by: Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
---
 include/hw/input/ft5336.h |  14 ++
 hw/input/ft5336.c         | 357 ++++++++++++++++++++++++++++++++++++++
 hw/input/Kconfig          |   4 +
 hw/input/meson.build      |   2 +
 4 files changed, 377 insertions(+)
 create mode 100644 include/hw/input/ft5336.h
 create mode 100644 hw/input/ft5336.c

diff --git a/include/hw/input/ft5336.h b/include/hw/input/ft5336.h
new file mode 100644
index 0000000000..7bef3f9efb
--- /dev/null
+++ b/include/hw/input/ft5336.h
@@ -0,0 +1,14 @@
+/*
+ * FT5336 touch controller
+ *
+ * Copyright (c) 2022 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef HW_INPUT_FT5336_H
+#define HW_INPUT_FT5336_H
+
+#define TYPE_FT5336 "ft5336"
+
+#endif
diff --git a/hw/input/ft5336.c b/hw/input/ft5336.c
new file mode 100644
index 0000000000..bacf79201a
--- /dev/null
+++ b/hw/input/ft5336.c
@@ -0,0 +1,357 @@
+/*
+ * FT5336 touch controller
+ *
+ * Copyright (c) 2022 Evgeny Ermakov <evgeny.v.ermakov@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "hw/input/ft5336.h"
+#include "hw/i2c/i2c.h"
+#include "hw/irq.h"
+#include "migration/vmstate.h"
+#include "qemu/module.h"
+#include "qemu/log.h"
+#include "qemu/timer.h"
+#include "ui/input.h"
+#include "qom/object.h"
+
+OBJECT_DECLARE_SIMPLE_TYPE(FT5336TouchState, FT5336)
+
+struct FT5336TouchState {
+    I2CSlave parent_obj;
+
+    uint8_t i2c_cycle;
+    uint8_t reg;
+
+    qemu_irq irq;
+
+    int32_t abs_x;
+    int32_t abs_y;
+    uint16_t touch_x;
+    uint16_t touch_y;
+    bool touch_press;
+
+    bool inte;
+};
+
+/* I2C Slave address of touchscreen FocalTech FT5336 */
+#define FT5336_I2C_SLAVE_ADDRESS            0x70
+
+/* Maximum border values of the touchscreen pad */
+#define FT5336_MAX_WIDTH                    ((uint16_t)480)     /* Touchscreen pad max width   */
+#define FT5336_MAX_HEIGHT                   ((uint16_t)272)     /* Touchscreen pad max height  */
+
+/* Max detectable simultaneous touches */
+#define FT5336_MAX_DETECTABLE_TOUCH         0x05
+
+
+enum {
+    FT5336_P_XH               = 0x00,
+    FT5336_P_XL               = 0x01,
+    FT5336_P_YH               = 0x02,
+    FT5336_P_YL               = 0x03,
+   /* Values Pn_XH and Pn_YH related */
+#define FT5336_TOUCH_EVT_FLAG_PRESS_DOWN    0x00
+#define FT5336_TOUCH_EVT_FLAG_LIFT_UP       0x01
+#define FT5336_TOUCH_EVT_FLAG_CONTACT       0x02
+#define FT5336_TOUCH_EVT_FLAG_NO_EVENT      0x03
+
+    FT5336_P_WEIGHT           = 0x04,
+    /* Values Pn_WEIGHT related  */
+#define FT5336_TOUCH_WEIGHT_MASK            0xFF
+#define FT5336_TOUCH_WEIGHT_SHIFT           0x00
+
+    FT5336_P_MISC             = 0x05
+    /* Values related to FT5336_Pn_MISC_REG */
+#define FT5336_TOUCH_AREA_MASK              (0x04 << 4))
+#define FT5336_TOUCH_AREA_SHIFT             0x04
+};
+
+enum {
+    FT5336_R_MODE               = 0x00,
+#define FT5336_DEV_MODE_WORKING             0x00
+#define FT5336_DEV_MODE_FACTORY             0x04
+
+#define FT5336_DEV_MODE_MASK                0x07
+#define FT5336_DEV_MODE_SHIFT               0x04
+
+    FT5336_R_GEST_ID            = 0x01,
+#define FT5336_GEST_ID_NO_GESTURE           0x00
+#define FT5336_GEST_ID_MOVE_UP              0x10
+#define FT5336_GEST_ID_MOVE_RIGHT           0x14
+#define FT5336_GEST_ID_MOVE_DOWN            0x18
+#define FT5336_GEST_ID_MOVE_LEFT            0x1C
+#define FT5336_GEST_ID_SINGLE_CLICK         0x20
+#define FT5336_GEST_ID_DOUBLE_CLICK         0x22
+#define FT5336_GEST_ID_ROTATE_CLOCKWISE     0x28
+#define FT5336_GEST_ID_ROTATE_C_CLOCKWISE   0x29
+#define FT5336_GEST_ID_ZOOM_IN              0x40
+#define FT5336_GEST_ID_ZOOM_OUT             0x49
+
+    FT5336_R_STAT               = 0x02,
+#define FT5336_TD_STAT_MASK                 0x0F
+#define FT5336_TD_STAT_SHIFT                0x00
+
+    FT5336_R_P1_BASE            = 0x03,
+    FT5336_R_P2_BASE            = 0x09,
+    FT5336_R_P3_BASE            = 0x0f,
+    FT5336_R_P4_BASE            = 0x15,
+    FT5336_R_P5_BASE            = 0x1b,
+    FT5336_R_P6_BASE            = 0x21,
+    FT5336_R_P7_BASE            = 0x27,
+    FT5336_R_P8_BASE            = 0x2d,
+    FT5336_R_P9_BASE            = 0x33,
+    FT5336_R_P10_BASE           = 0x39,
+
+#define FT5336_TOUCH_EVT_FLAG_SHIFT         0x06
+#define FT5336_TOUCH_EVT_FLAG_MASK          (3 << FT5336_TOUCH_EVT_FLAG_SHIFT))
+
+#define FT5336_TOUCH_POS_MSB_MASK           0x0F
+#define FT5336_TOUCH_POS_MSB_SHIFT          0x00
+
+    /* Values Pn_XL and Pn_YL related */
+#define FT5336_TOUCH_POS_LSB_MASK           0xFF
+#define FT5336_TOUCH_POS_LSB_SHIFT          0x00
+
+    FT5336_R_TH_GROUP           = 0x80,
+    /* Values FT5336_TH_GROUP_REG : threshold related  */
+#define FT5336_THRESHOLD_MASK               0xFF
+#define FT5336_THRESHOLD_SHIFT              0x00
+
+    FT5336_R_TH_DIFF            = 0x85,
+
+    FT5336_R_CTRL               = 0x86,
+    /* Values related to FT5336_CTRL_REG */
+
+    /* Will keep the Active mode when there is no touching */
+#define FT5336_CTRL_KEEP_ACTIVE_MODE        0x00
+
+    /* Switching from Active mode to Monitor mode automatically when there is no touching */
+#define FT5336_CTRL_KEEP_AUTO_SWITCH_MONITOR_MODE  0x01
+    FT5336_R_TIMEENTERMONITOR   = 0x87,
+    FT5336_R_PERIODACTIVE       = 0x88,
+    FT5336_R_PERIODMONITOR      = 0x89,
+    FT5336_R_RADIAN_VALUE       = 0x91,
+    FT5336_R_OFFSET_LEFT_RIGHT  = 0x92,
+    FT5336_R_OFFSET_UP_DOWN     = 0x93,
+    FT5336_R_DISTANCE_LEFT      = 0x94,
+    FT5336_R_DISTANCE_UP_DOWN   = 0x95,
+    FT5336_R_DISTANCE_ZOOM      = 0x96,
+
+    FT5336_R_LIB_VER_H          = 0xa1,
+    FT5336_R_LIB_VER_L          = 0xa2,
+    FT5336_R_CIPHER             = 0xa3,
+
+    FT5336_R_GMODE              = 0xa4,
+#define FT5336_G_MODE_INTERRUPT_MASK        0x03
+#define FT5336_G_MODE_INTERRUPT_SHIFT       0x00
+
+    /* Possible values of FT5336_GMODE_REG */
+#define FT5336_G_MODE_INTERRUPT_POLLING     0x00
+#define FT5336_G_MODE_INTERRUPT_TRIGGER     0x01
+
+    FT5336_R_PWR_MODE           = 0xa5,
+    FT5336_R_FIRMID             = 0xa6,
+
+    FT5336_R_CHIP_ID            = 0xa8,
+    /*  Possible values of FT5336_CHIP_ID_REG */
+#define FT5336_ID_VALUE                     0x51
+
+    FT5336_R_RELEASE_CODE_ID    = 0xaf,
+    /* Release code version */
+#define FT5336_RELEASE_CODE_ID_REG          0xAF
+
+    FT5336_R_STATE              = 0xbc,
+};
+
+
+static uint8_t ft5336_touch_read(FT5336TouchState *s, int reg, int byte)
+{
+    switch (reg) {
+    case FT5336_R_CHIP_ID:
+        return FT5336_ID_VALUE;
+    case FT5336_R_STAT:
+        return s->touch_press ? 1 : 0;
+    case FT5336_R_P1_BASE:
+        switch (byte) {
+        case FT5336_P_XH: return extract16(s->touch_x, 8, 8);
+        case FT5336_P_XL: return extract16(s->touch_x, 0, 8);
+        case FT5336_P_YH: return extract16(s->touch_y, 8, 8);
+        case FT5336_P_YL: return extract16(s->touch_y, 0, 8);
+        default:
+            return 0;
+        }
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unknown register %02x\n", __func__, reg);
+        return 0;
+    }
+}
+
+static void ft5336_touch_write(FT5336TouchState *s, int reg, int byte, uint8_t value)
+{
+    switch (reg) {
+    case FT5336_R_GMODE:
+        s->inte = value;
+        break;
+    default:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: unknown register %02x\n", __func__, reg);
+        break;
+    }
+}
+
+static int ft5336_i2c_event(I2CSlave *i2c, enum i2c_event event)
+{
+    FT5336TouchState *s = FT5336(i2c);
+
+    switch (event) {
+    case I2C_START_RECV:
+    case I2C_START_SEND:
+        s->i2c_cycle = 0;
+        break;
+    default:
+        break;
+    }
+
+    return 0;
+}
+
+static uint8_t ft5336_i2c_recv(I2CSlave *i2c)
+{
+    FT5336TouchState *s = FT5336(i2c);
+
+    return ft5336_touch_read(s, s->reg, s->i2c_cycle++);
+}
+
+static int ft5336_i2c_send(I2CSlave *i2c, uint8_t data)
+{
+    FT5336TouchState *s = FT5336(i2c);
+
+    if (!s->i2c_cycle) {
+        s->reg = data;
+    } else {
+        ft5336_touch_write(s, s->reg, s->i2c_cycle - 1, data);
+    }
+    s->i2c_cycle++;
+
+    return 0;
+}
+
+static void ft5336_input_event(DeviceState *dev, QemuConsole *src,
+                               InputEvent *evt)
+{
+    FT5336TouchState *s = FT5336(dev);
+    InputBtnEvent *btn = NULL;
+    InputMoveEvent *move = NULL;
+
+    switch (evt->type) {
+    case INPUT_EVENT_KIND_BTN:
+        btn = evt->u.btn.data;
+        s->touch_press = btn->down;
+        break;
+    case INPUT_EVENT_KIND_ABS:
+        move = evt->u.rel.data;
+        if (move->axis == INPUT_AXIS_X) {
+            s->abs_x = move->value;
+        } else if (move->axis == INPUT_AXIS_Y) {
+            s->abs_y = move->value;
+        }
+        break;
+    default:
+        break;
+    }
+}
+
+static void ft5336_input_sync(DeviceState *dev)
+{
+    FT5336TouchState *s = FT5336(dev);;
+
+    s->touch_x = qemu_input_scale_axis(s->abs_x,
+                                       INPUT_EVENT_ABS_MIN,
+                                       INPUT_EVENT_ABS_MAX, 0, 1777);
+    s->touch_y = qemu_input_scale_axis(s->abs_y,
+                                       INPUT_EVENT_ABS_MIN,
+                                       INPUT_EVENT_ABS_MAX, 0, 1023);
+
+    if (s->touch_press) {
+        if (s->inte) {
+            qemu_irq_pulse(s->irq);
+        }
+    }
+}
+
+static QemuInputHandler ft5336_input_handler = {
+    .name = "QEMU FT5336-driven Touchscreen",
+    .mask = INPUT_EVENT_MASK_BTN | INPUT_EVENT_MASK_ABS,
+    .event = ft5336_input_event,
+    .sync = ft5336_input_sync
+};
+
+static void ft5336_touch_reset_enter(Object *obj, ResetType type)
+{
+    FT5336TouchState *s = FT5336(obj);
+
+    s->inte = false;
+}
+
+static void ft5336_realize(DeviceState *dev, Error **errp)
+{
+    FT5336TouchState *s = FT5336(dev);
+    qdev_init_gpio_out(dev, &s->irq, 1);
+
+    qemu_input_handler_register((DeviceState *) s, &ft5336_input_handler);
+}
+
+static int ft5336_touch_post_load(void *opaque, int version_id)
+{
+    /* FT5336TouchState *s = opaque; */
+
+    return 0;
+}
+
+static const VMStateDescription vmstate_ft5336_touch = {
+    .name = TYPE_FT5336,
+    .version_id = 0,
+    .minimum_version_id = 0,
+    .post_load = ft5336_touch_post_load,
+    .fields = (VMStateField[]) {
+        VMSTATE_I2C_SLAVE(parent_obj, FT5336TouchState),
+        VMSTATE_UINT8(i2c_cycle, FT5336TouchState),
+        VMSTATE_UINT8(reg, FT5336TouchState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void ft5336_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    I2CSlaveClass *sc = I2C_SLAVE_CLASS(klass);
+    ResettableClass *rc = RESETTABLE_CLASS(klass);
+
+    dc->realize = ft5336_realize;
+    dc->vmsd = &vmstate_ft5336_touch;
+    set_bit(DEVICE_CATEGORY_INPUT, dc->categories);
+    rc->phases.enter = ft5336_touch_reset_enter;
+
+    sc->event = ft5336_i2c_event;
+    sc->recv = ft5336_i2c_recv;
+    sc->send = ft5336_i2c_send;
+}
+
+static const TypeInfo ft5336_info = {
+    .name          = TYPE_FT5336,
+    .parent        = TYPE_I2C_SLAVE,
+    .instance_size = sizeof(FT5336TouchState),
+    .class_init    = ft5336_class_init
+};
+
+static void ft5336_register_types(void)
+{
+    type_register_static(&ft5336_info);
+}
+
+type_init(ft5336_register_types)
diff --git a/hw/input/Kconfig b/hw/input/Kconfig
index 55865bb386..73a6f67216 100644
--- a/hw/input/Kconfig
+++ b/hw/input/Kconfig
@@ -46,3 +46,7 @@ config TSC210X
 
 config LASIPS2
     select PS2
+
+config FT5336
+    bool
+    depends on I2C
diff --git a/hw/input/meson.build b/hw/input/meson.build
index 8deb011d4a..c892ecbeb7 100644
--- a/hw/input/meson.build
+++ b/hw/input/meson.build
@@ -16,3 +16,5 @@ softmmu_ss.add(when: 'CONFIG_VHOST_USER_INPUT', if_true: files('vhost-user-input
 softmmu_ss.add(when: 'CONFIG_PXA2XX', if_true: files('pxa2xx_keypad.c'))
 softmmu_ss.add(when: 'CONFIG_TSC210X', if_true: files('tsc210x.c'))
 softmmu_ss.add(when: 'CONFIG_LASIPS2', if_true: files('lasips2.c'))
+
+softmmu_ss.add(when: 'CONFIG_FT5336', if_true: files('ft5336.c'))
-- 
2.38.1


