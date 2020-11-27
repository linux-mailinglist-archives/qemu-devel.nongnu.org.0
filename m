Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 256DE2C6BCD
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:06:41 +0100 (CET)
Received: from localhost ([::1]:57286 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kij4q-0006KX-5f
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:06:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43688)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUp-0007M1-3a
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:27 -0500
Received: from mout.kundenserver.de ([217.72.192.75]:48475)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUl-00073L-Ej
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:26 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Mo7if-1kPOMP1XPn-00pgGC; Fri, 27 Nov 2020 19:29:18 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: mst@redhat.com, ehabkost@redhat.com, crosa@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 2/5] backends: introduce gpio backend subsystem
Date: Fri, 27 Nov 2020 19:29:14 +0100
Message-Id: <20201127182917.2387-2-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201127182917.2387-1-info@metux.net>
References: <20201127182917.2387-1-info@metux.net>
X-Provags-ID: V03:K1:lAlJbKOOCZ2db15vXILeB3yZyDFHii5jiefS1F62Mtx4TR0TAxU
 WUXQ8rc9Muom7+2HoCljKU26LoYwMi96R4L460C9vzCkDkCLK8PFTqWlF5qJvqxZ49VPIY6
 AtSDBsp38rMSXHtjhCWKTmBoMRqa7f5jvz6CXYhKyMhi4TkHmr+ndWUI+JC62oqPa2At3/r
 UXPgWZjGV3zaTQpqZY6wQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0://nGqypOBSs=:PycHBQgrkjcXi2Qxxl9/bj
 /tiEMaEKMyvmAoa4H1Gk/k/GKhDc6b+l6GMcj+07j/aH/Cmo1w/E3qNFT8L5uyvgIqGt0fd0v
 8LCoGF604DNPIK2jsUhwgkAhmpEOTTNwWuPCJpV7/L2rbx3bslgC0Qji7LOeNybffTK9lsodL
 tNm/fP2jIt342E6MDJI5KTs58UP4/SwYTcDMSfqWpWFhb8aPzbWkPHt2jeH99ZKtFnuAoPyTT
 qL+iuN+6qicvTTezbya8vThgydtpOCtgpB4ZwdYQmd6Mvt7UgKjlpKKkzvycNwqHrA9x3GE9d
 A++xuLg8VkYenUcaBpKRwtVT4fI2xukuL+F306CufqSmj2OLIurcbbhXmoI/HMCLhcrxREC5x
 ywAzF27C6Xup+S3k9cV0vyGmBC9cU1Jd/v3f53/SC2d4q9EN6CphaSAfoz1yg
Received-SPF: none client-ip=217.72.192.75; envelope-from=info@metux.net;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Fri, 27 Nov 2020 14:04:07 -0500
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Introducing a backend subsys for hardware GPIOs, so we can now
let simulated GPIO devices actually do something, by talking to
pluggable GPIO backends (eg. speaking to host's gpio subsystem,
gpiod, custom simulation, etc).

This patch does not implement any actual gpio backend, nor any
any any hw simulation drivers yet - just the generic infrastructure.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 MAINTAINERS           |   6 ++
 backends/Kconfig      |   4 +
 backends/gpio.c       | 255 ++++++++++++++++++++++++++++++++++++++++++++++++++
 backends/meson.build  |   1 +
 include/sysemu/gpio.h |  76 +++++++++++++++
 5 files changed, 342 insertions(+)
 create mode 100644 backends/gpio.c
 create mode 100644 include/sysemu/gpio.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 68bc160f41..bfa29a4560 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2288,6 +2288,12 @@ S: Maintained
 F: gdbstub*
 F: gdb-xml/
 
+GPIO Backend API
+M: Enrico Weigelt, metux IT consult <info@metux.net>
+S: Supported
+F: backends/gpio.c
+F: include/sysemu/gpio.h
+
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
 S: Supported
diff --git a/backends/Kconfig b/backends/Kconfig
index f35abc1609..2f17189472 100644
--- a/backends/Kconfig
+++ b/backends/Kconfig
@@ -1 +1,5 @@
 source tpm/Kconfig
+
+config BACKEND_GPIO
+    bool "Enable GPIO backends"
+    default y
diff --git a/backends/gpio.c b/backends/gpio.c
new file mode 100644
index 0000000000..dc539b0791
--- /dev/null
+++ b/backends/gpio.c
@@ -0,0 +1,255 @@
+/*
+ * QEMU GPIO Backend
+ *
+ * Copyright 2020 Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include <errno.h>
+#include "qemu/osdep.h"
+#include "sysemu/gpio.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qemu/module.h"
+#include "qom/object_interfaces.h"
+#include "qemu/error-report.h"
+#include "sysemu/gpio.h"
+
+#define GPIO_FORMAT_VALUE       "gpio%d.value"
+#define GPIO_FORMAT_DIRECTION   "gpio%d.direction"
+
+#define BACKEND_OP_HEAD \
+    if (!gpio) \
+        return -EFAULT;
+
+#define BACKEND_CLASSOP_HEAD(op) \
+    GpioBackendClass *klass; \
+    BACKEND_OP_HEAD \
+    klass = GPIO_BACKEND_GET_CLASS(gpio); \
+    if (!klass) \
+        return -EFAULT; \
+    if (!klass->op) \
+        return -EUNATCH;
+
+int gpio_backend_set_notify(GpioBackend *gpio,
+                            gpio_backend_notify_t proc,
+                            void *consumer)
+{
+    BACKEND_OP_HEAD
+
+    gpio->notify_proc = proc;
+    gpio->notify_consumer = consumer;
+
+    return 0;
+}
+
+int gpio_backend_send_notify(GpioBackend *gpio, int pin, int event, int value)
+{
+    BACKEND_OP_HEAD
+
+    if (gpio->notify_proc) {
+        return gpio->notify_proc(gpio->notify_consumer, pin, event, value);
+    }
+
+    return 0;
+}
+
+int gpio_backend_request(GpioBackend *gpio, int pin)
+{
+    BACKEND_CLASSOP_HEAD(request);
+    return klass->request(gpio, pin);
+}
+
+int gpio_backend_set_value(GpioBackend *gpio, int pin, int state)
+{
+    BACKEND_CLASSOP_HEAD(set_value);
+    return klass->set_value(gpio, pin, state);
+}
+
+int gpio_backend_get_value(GpioBackend *gpio, int pin)
+{
+    BACKEND_CLASSOP_HEAD(get_value);
+    return klass->get_value(gpio, pin);
+}
+
+int gpio_backend_direction_output(GpioBackend *gpio, int pin, int state)
+{
+    BACKEND_CLASSOP_HEAD(direction_output);
+    return klass->direction_output(gpio, pin, state);
+}
+
+int gpio_backend_direction_input(GpioBackend *gpio, int pin)
+{
+    BACKEND_CLASSOP_HEAD(direction_input);
+    return klass->direction_input(gpio, pin);
+}
+
+int gpio_backend_get_direction(GpioBackend *gpio, int pin)
+{
+    BACKEND_CLASSOP_HEAD(get_direction);
+    return klass->get_direction(gpio, pin);
+}
+
+int gpio_backend_get_ngpio(GpioBackend *gpio)
+{
+    BACKEND_CLASSOP_HEAD(get_ngpio);
+    return klass->get_ngpio(gpio);
+}
+
+static void getattr_value(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    int pin;
+    int64_t val = 0;
+    GpioBackend *gpio = GPIO_BACKEND(obj);
+
+    if (sscanf(name, GPIO_FORMAT_VALUE, &pin) != 1) {
+        error_setg(errp,
+                  "gpio: getattr_value() illegal property: \"%s\"",
+                   name);
+        return;
+    }
+
+    val = gpio_backend_get_value(gpio, pin);
+    visit_type_int(v, name, &val, errp);
+}
+
+static void setattr_value(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    int pin;
+    int64_t val = 0;
+    GpioBackend *gpio = GPIO_BACKEND(obj);
+
+    if (!visit_type_int(v, name, &val, errp)) {
+        return;
+    }
+
+    if (sscanf(name, GPIO_FORMAT_VALUE, &pin) != 1) {
+        error_setg(errp,
+                   "gpio: setattr_value() illegal property: \"%s\"",
+                   name);
+        return;
+    }
+
+    gpio_backend_set_value(gpio, pin, val);
+    gpio_backend_send_notify(gpio, pin, GPIO_EVENT_LEVEL, val);
+}
+
+static void getattr_direction(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    int pin;
+    GpioBackend *gpio = GPIO_BACKEND(obj);
+    char str[16] = { 0 };
+    char *val = str;
+
+    if (sscanf(name, GPIO_FORMAT_DIRECTION, &pin) != 1) {
+        error_setg(errp,
+                   "gpio: getattr_direction() illegal property: \"%s\"",
+                   name);
+        return;
+    }
+
+    strcpy(str, (gpio_backend_get_direction(gpio, pin)
+                    == QEMU_GPIO_DIRECTION_INPUT) ? "in" : "out");
+    visit_type_str(v, name, &val, errp);
+}
+
+static void setattr_direction(Object *obj, Visitor *v, const char *name,
+                              void *opaque, Error **errp)
+{
+    int pin;
+    GpioBackend *gpio = GPIO_BACKEND(obj);
+    char *val;
+
+    if (!visit_type_str(v, name, &val, errp)) {
+        return;
+    }
+
+    if (sscanf(name, GPIO_FORMAT_DIRECTION, &pin) != 1) {
+        error_setg(errp, "gpio: setattr_direction() illegal property: \"%s\"",
+                   name);
+        return;
+    }
+
+    if (strcmp(val, "in") == 0) {
+        gpio_backend_direction_input(gpio, pin);
+        gpio_backend_send_notify(gpio, pin, GPIO_EVENT_INPUT, 0);
+        return;
+    }
+
+    if (strcmp(val, "out") == 0) {
+        gpio_backend_direction_output(gpio, pin, QEMU_GPIO_LINE_INACTIVE);
+        gpio_backend_send_notify(gpio, pin, GPIO_EVENT_OUTPUT, 0);
+        return;
+    }
+
+    error_setg(errp, "gpio: setattr_direction() illegal value: \"%s\"", val);
+    return;
+}
+
+int gpio_backend_register(GpioBackend *gpio)
+{
+    int pin;
+    int ngpio = gpio_backend_get_ngpio(gpio);
+
+    if (ngpio < 1) {
+        error_report("gpio_backend_register() illegal number of gpios: %d",
+                     ngpio);
+        return -EINVAL;
+    }
+
+    for (pin = 0; pin < ngpio; pin++) {
+        char name[64];
+        snprintf(name, sizeof(name), GPIO_FORMAT_VALUE, pin);
+        object_property_add(OBJECT(gpio), name, "bool", getattr_value,
+                            setattr_value, NULL, NULL);
+        snprintf(name, sizeof(name), GPIO_FORMAT_DIRECTION, pin);
+        object_property_add(OBJECT(gpio), name, "string", getattr_direction,
+                            setattr_direction, NULL, NULL);
+    }
+
+    return 0;
+}
+
+int gpio_backend_unregister(GpioBackend *s)
+{
+    /* nothing to do for now */
+    return 0;
+}
+
+static void gpio_backend_init(Object *obj)
+{
+}
+
+static void gpio_backend_finalize(Object *obj)
+{
+}
+
+static void gpio_backend_class_init(ObjectClass *oc, void *data)
+{
+}
+
+static const TypeInfo gpio_backend_info = {
+    .name = TYPE_GPIO_BACKEND,
+    .parent = TYPE_OBJECT,
+    .instance_size = sizeof(GpioBackend),
+    .instance_init = gpio_backend_init,
+    .instance_finalize = gpio_backend_finalize,
+    .class_size = sizeof(GpioBackendClass),
+    .class_init = gpio_backend_class_init,
+    .abstract = true,
+    .interfaces = (InterfaceInfo[]) {
+        { TYPE_USER_CREATABLE },
+        { }
+    }
+};
+
+static void register_types(void)
+{
+    type_register_static(&gpio_backend_info);
+}
+
+type_init(register_types);
diff --git a/backends/meson.build b/backends/meson.build
index 484456ece7..332ad7379a 100644
--- a/backends/meson.build
+++ b/backends/meson.build
@@ -15,5 +15,6 @@ softmmu_ss.add(when: ['CONFIG_VHOST_USER', 'CONFIG_VIRTIO'], if_true: files('vho
 softmmu_ss.add(when: 'CONFIG_VIRTIO_CRYPTO', if_true: files('cryptodev-vhost.c'))
 softmmu_ss.add(when: ['CONFIG_VIRTIO_CRYPTO', 'CONFIG_VHOST_CRYPTO'], if_true: files('cryptodev-vhost-user.c'))
 softmmu_ss.add(when: 'CONFIG_GIO', if_true: [files('dbus-vmstate.c'), gio])
+softmmu_ss.add(when: 'CONFIG_BACKEND_GPIO', if_true: files('gpio.c'))
 
 subdir('tpm')
diff --git a/include/sysemu/gpio.h b/include/sysemu/gpio.h
new file mode 100644
index 0000000000..0cfd62b192
--- /dev/null
+++ b/include/sysemu/gpio.h
@@ -0,0 +1,76 @@
+/*
+ * QEMU GPIO backend
+ *
+ * Copyright 2020 Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#ifndef QEMU_GPIO_H
+#define QEMU_GPIO_H
+
+#include "qemu/queue.h"
+#include "qom/object.h"
+
+#define TYPE_GPIO_BACKEND "gpio-backend"
+OBJECT_DECLARE_TYPE(GpioBackend, GpioBackendClass, GPIO_BACKEND)
+
+/* dont change them - drivers rely on these values */
+#define QEMU_GPIO_DIRECTION_OUTPUT  0
+#define QEMU_GPIO_DIRECTION_INPUT   1
+
+#define QEMU_GPIO_LINE_INACTIVE     0
+#define QEMU_GPIO_LINE_ACTIVE       1
+
+/*
+ * notification callback from gpio backend to consumer/frontend
+ *
+ * consumer:    pointer to/for the consumer object
+ * gpio_id:     id of the gpio (-1 = all at once)
+ * event:       whats happened
+ */
+typedef int (*gpio_backend_notify_t)(void *consumer, int gpio, int event,
+                                     int value);
+
+#define GPIO_EVENT_INPUT  1
+#define GPIO_EVENT_OUTPUT 2
+#define GPIO_EVENT_LEVEL  3
+
+struct GpioBackendClass {
+    ObjectClass parent_class;
+    bool opened;
+
+    char *name;
+
+    int (*request)(GpioBackend *s, int gpio);
+    int (*direction_input)(GpioBackend *s, int gpio);
+    int (*direction_output)(GpioBackend *s, int gpio, int state);
+    int (*get_direction)(GpioBackend *s, int gpio);
+    int (*set_value)(GpioBackend *s, int gpio, int state);
+    int (*get_value)(GpioBackend *s, int gpio);
+    int (*get_ngpio)(GpioBackend *s);
+};
+
+struct GpioBackend {
+    Object parent;
+    gpio_backend_notify_t notify_proc;
+    void *notify_consumer;
+};
+
+/* call wrappers to gpio backend */
+int gpio_backend_request(GpioBackend *s, int gpio);
+int gpio_backend_direction_input(GpioBackend *s, int gpio);
+int gpio_backend_direction_output(GpioBackend *s, int gpio, int state);
+int gpio_backend_get_direction(GpioBackend *s, int gpio);
+int gpio_backend_set_value(GpioBackend *s, int gpio, int state);
+int gpio_backend_get_value(GpioBackend *s, int gpio);
+int gpio_backend_set_notify(GpioBackend *s, gpio_backend_notify_t proc,
+                            void *consumer);
+int gpio_backend_send_notify(GpioBackend *s, int gpio, int event, int value);
+int gpio_backend_get_ngpio(GpioBackend *s);
+
+/* used by backend drivers for common initializations */
+int gpio_backend_register(GpioBackend *s);
+int gpio_backend_unregister(GpioBackend *s);
+
+#endif /* QEMU_GPIO_H */
-- 
2.11.0


