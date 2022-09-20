Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DAD55BF050
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Sep 2022 00:41:28 +0200 (CEST)
Received: from localhost ([::1]:48924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oalvh-00059U-Kv
	for lists+qemu-devel@lfdr.de; Tue, 20 Sep 2022 18:41:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56694)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGX-0004RM-TB
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:51 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:45718)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <zhangjian.3032@bytedance.com>)
 id 1oaiGS-0007QI-F4
 for qemu-devel@nongnu.org; Tue, 20 Sep 2022 14:46:40 -0400
Received: by mail-pl1-x62c.google.com with SMTP id w20so3276228ply.12
 for <qemu-devel@nongnu.org>; Tue, 20 Sep 2022 11:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance-com.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=BkN0v0ZPP63Cq9RhTuOZT0vrTdJqzyTY4NgyNGv1bT8=;
 b=pbZVtQoZctznEkUDonMjdTGgxode2S8ruXdS4GCR7IvZZx6M8VpS3vzrYQFDL0XYWi
 r8dlh3IIO/JsPcLEhtRvDeOeQouFYd+wO2SNH4PxkqZcr6FFYIbQ2xnqShIkmHtZeRvo
 rzszIFV6kFkv1rXk1uuMVRdkKGrY3Z0v26TScXvPI2oLDuArnt2OFilspXuIi75fQK9r
 O08wpQcP39kMG/w/yjG2VFA58AUHvYv7iZYczJ+wyVR8AK1fXeVDGzfGUeUQsSW37E/d
 YBkgiAqI/aut5W3wczWtE9HxX/uvyIC0csPL2waGtRkCgmUk/khUlZz8xCjtif7XcdPj
 tSNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=BkN0v0ZPP63Cq9RhTuOZT0vrTdJqzyTY4NgyNGv1bT8=;
 b=RE+aue/B/cMvmdy1PTKHRHI5QSRzDk1KS4W9TAkfoW/HIDdFTk0Pc1z4Uf78jCO0qG
 HV+iGY0FQBrmwpoacZHi4y1k2DmiL/6CFe3diuZWrp9QJU3LT2xi+3pABtxQOTO2HPLc
 tSJFG2N/SrDh7sgVEqUHIlUpF6Kxe20u8DYGutGEgdljpRYbJV83IGknYoP5Ns6jDenu
 TNmLBRRtS45MnGfVkghzuR0xnQ2IgiCiapO/x6AvPuBSlxrqDn5U4Hd5ocpHERSFsrGF
 JT7Aghcljb8xpEVArHursBk2qFFp1k+DhxqdHAEqvQ6rjos50pMlYLxCocwHrNUiWkHx
 rNjg==
X-Gm-Message-State: ACrzQf02cc7suCZ1o8vxkSAJB6AhazOBX8eSDaKn459JgHk3v6E3nvHB
 nGthvCHpyWz4L1BAyWCiUj77Gw==
X-Google-Smtp-Source: AMsMyM7JMrSPDGZ1OMpeJYyZh9ISGLuvgRZBOe3ydLO4MjOXYmSVkOLDEZMtPHht+xDFHq68Rjg7SQ==
X-Received: by 2002:a17:902:ea11:b0:178:f0a:7472 with SMTP id
 s17-20020a170902ea1100b001780f0a7472mr992875plg.46.1663699591649; 
 Tue, 20 Sep 2022 11:46:31 -0700 (PDT)
Received: from localhost ([49.7.199.180]) by smtp.gmail.com with ESMTPSA id
 y129-20020a62ce87000000b005480167b921sm224810pfg.172.2022.09.20.11.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 11:46:31 -0700 (PDT)
From: Jian Zhang <zhangjian.3032@bytedance.com>
To: f4bug@amsat.org, peter.maydell@linaro.org, clg@kaod.org, andrew@aj.id.au,
 joel@jms.id.au, qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc: yulei.sh@bytedance.com, tangyiwei.2022@bytedance.com,
 chentingting.2150@bytedance.com, yuhao.17@bytedance.com,
 wangxiaohua.1217@bytedance.com, xiening.xll@bytedance.com
Subject: [PATCH v2 1/3] hw/misc/latching_switch: Add a simple latching_switch
 device
Date: Wed, 21 Sep 2022 02:46:17 +0800
Message-Id: <20220920184619.3370115-2-zhangjian.3032@bytedance.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
References: <20220920184619.3370115-1-zhangjian.3032@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=zhangjian.3032@bytedance.com; helo=mail-pl1-x62c.google.com
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

Implement a simple latching switch device.

The latching switch is a switch that can be turned on and off.
When the input new state and match the trigger edge, the switch
state will be toggled.

This device privide 2 properties `state(bool)` and `trigger-edge(string)`,
and 2 gpios `input` and `output`.

The `state` property is the initial state of the switch, and the `trigger-edge`
property is the edge that will trigger the switch state to be toggled,
the value can be `rising`, `falling` or `both`.

Signed-off-by: Jian Zhang <zhangjian.3032@bytedance.com>
---
 MAINTAINERS                       |   2 +
 hw/misc/Kconfig                   |   3 +
 hw/misc/latching_switch.c         | 212 ++++++++++++++++++++++++++++++
 hw/misc/meson.build               |   1 +
 include/hw/misc/latching_switch.h |  56 ++++++++
 5 files changed, 274 insertions(+)
 create mode 100644 hw/misc/latching_switch.c
 create mode 100644 include/hw/misc/latching_switch.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 1729c0901c..0b252a9339 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1066,6 +1066,8 @@ F: include/hw/net/ftgmac100.h
 F: docs/system/arm/aspeed.rst
 F: tests/qtest/*aspeed*
 F: hw/arm/fby35.c
+F: include/hw/misc/latching_switch.h
+F: hw/misc/latching_switch.c
 
 NRF51
 M: Joel Stanley <joel@jms.id.au>
diff --git a/hw/misc/Kconfig b/hw/misc/Kconfig
index cbabe9f78c..96345c6456 100644
--- a/hw/misc/Kconfig
+++ b/hw/misc/Kconfig
@@ -139,6 +139,9 @@ config UNIMP
 config LED
     bool
 
+config LATCHING_SWITCH
+    bool
+
 config MAC_VIA
     bool
     select MOS6522
diff --git a/hw/misc/latching_switch.c b/hw/misc/latching_switch.c
new file mode 100644
index 0000000000..03ce40b77c
--- /dev/null
+++ b/hw/misc/latching_switch.c
@@ -0,0 +1,212 @@
+/*
+ * QEMU single Latching Switch device
+ *
+ * Copyright (C) 2022 Jian Zhang <zhangjian.3032@bytedance.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qapi/visitor.h"
+#include "migration/vmstate.h"
+#include "hw/qdev-properties.h"
+#include "hw/irq.h"
+#include "hw/misc/latching_switch.h"
+#include "trace.h"
+
+static void toggle_output(LatchingSwitchState *s)
+{
+    s->state = !(s->state);
+    qemu_set_irq(s->output, !!(s->state));
+}
+
+static void input_handler(void *opaque, int line, int new_state)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(opaque);
+
+    assert(line == 0);
+
+    if (s->trigger_edge == TRIGGER_EDGE_FALLING && new_state == 0) {
+        toggle_output(s);
+    } else if (s->trigger_edge == TRIGGER_EDGE_RISING && new_state == 1) {
+        toggle_output(s);
+    } else if (s->trigger_edge == TRIGGER_EDGE_BOTH) {
+        toggle_output(s);
+    }
+}
+
+static void latching_switch_reset(DeviceState *dev)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(dev);
+    /* reset to off */
+    s->state = false;
+    /* reset to falling edge trigger */
+    s->trigger_edge = TRIGGER_EDGE_FALLING;
+}
+
+static const VMStateDescription vmstate_latching_switch = {
+    .name = TYPE_LATCHING_SWITCH,
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_BOOL(state, LatchingSwitchState),
+        VMSTATE_U8(trigger_edge, LatchingSwitchState),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
+static void latching_switch_realize(DeviceState *dev, Error **errp)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(dev);
+
+    /* init a input io */
+    qdev_init_gpio_in(dev, input_handler, 1);
+
+    /* init a output io */
+    qdev_init_gpio_out(dev, &(s->output), 1);
+}
+
+static void latching_switch_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+
+    dc->desc = "Latching Switch";
+    dc->vmsd = &vmstate_latching_switch;
+    dc->reset = latching_switch_reset;
+    dc->realize = latching_switch_realize;
+    set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
+}
+
+static void latching_switch_get_state(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(obj);
+    bool value = s->state;
+
+    visit_type_bool(v, name, &value, errp);
+}
+
+static void latching_switch_set_state(Object *obj, Visitor *v, const char *name,
+                                      void *opaque, Error **errp)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(obj);
+    bool value;
+    Error *err = NULL;
+
+    visit_type_bool(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (value != s->state) {
+        toggle_output(s);
+    }
+}
+static void latching_switch_get_trigger_edge(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(obj);
+    int value = s->trigger_edge;
+    char *p = NULL;
+
+    if (value == TRIGGER_EDGE_FALLING) {
+        p = g_strdup("falling");
+        visit_type_str(v, name, &p, errp);
+    } else if (value == TRIGGER_EDGE_RISING) {
+        p = g_strdup("rising");
+        visit_type_str(v, name, &p, errp);
+    } else if (value == TRIGGER_EDGE_BOTH) {
+        p = g_strdup("both");
+        visit_type_str(v, name, &p, errp);
+    } else {
+        error_setg(errp, "Invalid trigger edge value");
+    }
+    g_free(p);
+}
+
+static void latching_switch_set_trigger_edge(Object *obj, Visitor *v,
+                                             const char *name, void *opaque,
+                                             Error **errp)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(obj);
+    char *value;
+    Error *err = NULL;
+
+    visit_type_str(v, name, &value, &err);
+    if (err) {
+        error_propagate(errp, err);
+        return;
+    }
+
+    if (strcmp(value, "falling") == 0) {
+        s->trigger_edge = TRIGGER_EDGE_FALLING;
+    } else if (strcmp(value, "rising") == 0) {
+        s->trigger_edge = TRIGGER_EDGE_RISING;
+    } else if (strcmp(value, "both") == 0) {
+        s->trigger_edge = TRIGGER_EDGE_BOTH;
+    } else {
+        error_setg(errp, "Invalid trigger edge type: %s", value);
+    }
+}
+
+static void latching_switch_init(Object *obj)
+{
+    LatchingSwitchState *s = LATCHING_SWITCH(obj);
+
+    s->state = false;
+    s->trigger_edge = TRIGGER_EDGE_FALLING;
+
+    object_property_add(obj, "state", "bool",
+                        latching_switch_get_state,
+                        latching_switch_set_state,
+                        NULL, NULL);
+    object_property_add(obj, "trigger-edge", "string",
+                        latching_switch_get_trigger_edge,
+                        latching_switch_set_trigger_edge,
+                        NULL, NULL);
+}
+
+static const TypeInfo latching_switch_info = {
+    .name = TYPE_LATCHING_SWITCH,
+    .parent = TYPE_DEVICE,
+    .instance_size = sizeof(LatchingSwitchState),
+    .class_init = latching_switch_class_init,
+    .instance_init = latching_switch_init,
+};
+
+static void latching_switch_register_types(void)
+{
+    type_register_static(&latching_switch_info);
+}
+
+type_init(latching_switch_register_types);
+
+LatchingSwitchState *latching_switch_create_simple(Object *parentobj,
+                                                   bool state,
+                                                   uint8_t trigger_edge)
+{
+    static const char *name = "latching-switch";
+    DeviceState *dev;
+
+    dev = qdev_new(TYPE_LATCHING_SWITCH);
+
+    qdev_prop_set_bit(dev, "state", state);
+
+    if (trigger_edge == TRIGGER_EDGE_FALLING) {
+        qdev_prop_set_string(dev, "trigger-edge", "falling");
+    } else if (trigger_edge == TRIGGER_EDGE_RISING) {
+        qdev_prop_set_string(dev, "trigger-edge", "rising");
+    } else if (trigger_edge == TRIGGER_EDGE_BOTH) {
+        qdev_prop_set_string(dev, "trigger-edge", "both");
+    } else {
+        error_report("Invalid trigger edge value");
+        exit(1);
+    }
+
+    object_property_add_child(parentobj, name, OBJECT(dev));
+    qdev_realize_and_unref(dev, NULL, &error_fatal);
+
+    return LATCHING_SWITCH(dev);
+}
diff --git a/hw/misc/meson.build b/hw/misc/meson.build
index 95268eddc0..23b5c7f69e 100644
--- a/hw/misc/meson.build
+++ b/hw/misc/meson.build
@@ -9,6 +9,7 @@ softmmu_ss.add(when: 'CONFIG_SGA', if_true: files('sga.c'))
 softmmu_ss.add(when: 'CONFIG_UNIMP', if_true: files('unimp.c'))
 softmmu_ss.add(when: 'CONFIG_EMPTY_SLOT', if_true: files('empty_slot.c'))
 softmmu_ss.add(when: 'CONFIG_LED', if_true: files('led.c'))
+softmmu_ss.add(when: 'CONFIG_LATCHING_SWITCH', if_true: files('latching_switch.c'))
 softmmu_ss.add(when: 'CONFIG_PVPANIC_COMMON', if_true: files('pvpanic.c'))
 
 # ARM devices
diff --git a/include/hw/misc/latching_switch.h b/include/hw/misc/latching_switch.h
new file mode 100644
index 0000000000..de1d9d27a4
--- /dev/null
+++ b/include/hw/misc/latching_switch.h
@@ -0,0 +1,56 @@
+/*
+ * QEMU single Latching Switch device
+ *
+ * Copyright (C) Jian Zhang <zhangjian.3032@bytedance.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_MISC_LATCHING_SWITCH_H
+#define HW_MISC_LATCHING_SWITCH_H
+
+#include "qom/object.h"
+#include "hw/qdev-core.h"
+
+#define TYPE_LATCHING_SWITCH "latching-switch"
+
+enum TriggerEdge {
+    TRIGGER_EDGE_FALLING,
+    TRIGGER_EDGE_RISING,
+    TRIGGER_EDGE_BOTH,
+};
+
+struct LatchingSwitchState {
+    /* Private */
+    DeviceState parent_obj;
+
+    /* Public */
+    qemu_irq input;
+    qemu_irq output;
+
+    /* Properties */
+    bool state;
+    uint8_t trigger_edge;
+    char *description;
+};
+typedef struct LatchingSwitchState LatchingSwitchState;
+DECLARE_INSTANCE_CHECKER(LatchingSwitchState, LATCHING_SWITCH,
+                         TYPE_LATCHING_SWITCH)
+
+/**
+ * latching_switch_create_simple: Create and realize a  device
+ * @parentobj: the parent object
+ * @state: the initial state of the switch
+ * @trigger_edge: the trigger edge of the switch
+ *                0: falling edge
+ *                1: rising edge
+ *                2: both edge
+ *
+ * Create the device state structure, initialize it, and
+ * drop the reference to it (the device is realized).
+ *
+ */
+LatchingSwitchState *latching_switch_create_simple(Object *parentobj,
+                                                   bool state,
+                                                   uint8_t trigger_edge);
+
+#endif /* HW_MISC_LATCHING_SWITCH_H */
-- 
2.25.1


