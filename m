Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD542C6BD0
	for <lists+qemu-devel@lfdr.de>; Fri, 27 Nov 2020 20:08:58 +0100 (CET)
Received: from localhost ([::1]:36282 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kij73-0000wH-Dp
	for lists+qemu-devel@lfdr.de; Fri, 27 Nov 2020 14:08:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43722)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUq-0007MT-H5
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:28 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:44779)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <info@metux.net>) id 1kiiUm-00073o-GE
 for qemu-devel@nongnu.org; Fri, 27 Nov 2020 13:29:28 -0500
Received: from orion.localdomain ([95.114.158.11]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N1gWU-1k31zb1Py4-011yBD; Fri, 27 Nov 2020 19:29:19 +0100
From: "Enrico Weigelt, metux IT consult" <info@metux.net>
To: mst@redhat.com, ehabkost@redhat.com, crosa@redhat.com,
 qemu-devel@nongnu.org
Subject: [PATCH 5/5] hw: virtio: add virtio-gpio device emulation
Date: Fri, 27 Nov 2020 19:29:17 +0100
Message-Id: <20201127182917.2387-5-info@metux.net>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20201127182917.2387-1-info@metux.net>
References: <20201127182917.2387-1-info@metux.net>
X-Provags-ID: V03:K1:9x4tkuVzY43cF0yp4TsSBiASpypzeVIeOXuhx740vFj1QgkWugo
 wDOyr2OeOaF8R77Sv9d1DZ8+HMBumB/wC7T/bXtrtz/Jnr8p5zWQqbaE8rNBp6d2uteo9Sq
 DCV1xuos0oCKvVWcN0k+5PVegIUTd5nQJIimwx91uq7xkoFRV85go/CTFd1OcNm9rOpNolT
 e3wPYScE+9LszwA7s37cg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:w1bg3a21rj0=:nw/MkXZyfR2bUZHUIaczXH
 4qwE5sBu+YQKO4NX4zRWzLY+GHgZX/qHB9w8IMC8QmGnOWC+SfYwECiTp2sejLWSKPWsxszHz
 h49tsV9Z+M35ahagqN6+jLPWBqPSMY+bORQ+EYo1LUFCLUEheHTmB0yA9WQNwpuw4R7awtKJ8
 9x7kViQemcVxyhsE19GfJ0rSBZZlsc0BXH2LWu+9qY55Zfqpt1oCjUPvsQUQYAkpTUio9jMu6
 NlvJgq4GudLoCuSVM04P+RIthR/syaqb10CN4ZgibKA1Hda6UNyWi+XtlKOo1a0VTCo0jUMmM
 ZheEKJ1WVxoijQovPKzKXeeyD+Ye0RHdQWkITpy+xWG0+YSAvArEkclsSs8T+qSFI7YDhz6m8
 kwR9HQd6mZlPsymJgslXZWFIvhreJVIfGDWnzuZCuwRyPGw7VWXbI1dhn/XtA
Received-SPF: none client-ip=212.227.17.10; envelope-from=info@metux.net;
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

Adding a driver for virtio-based GPIOs. The driver connects to
specified gpio backend and routes all requests there.

Signed-off-by: Enrico Weigelt, metux IT consult <info@metux.net>
---
 MAINTAINERS             |   7 +
 hw/virtio/Kconfig       |   7 +
 hw/virtio/meson.build   |   1 +
 hw/virtio/virtio-gpio.c | 371 ++++++++++++++++++++++++++++++++++++++++++++++++
 4 files changed, 386 insertions(+)
 create mode 100644 hw/virtio/virtio-gpio.c

diff --git a/MAINTAINERS b/MAINTAINERS
index d3873121e2..57deed6c20 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2294,6 +2294,13 @@ S: Supported
 F: backends/gpio.c
 F: backends/gpio-builtin.c
 F: include/sysemu/gpio.h
+F: include/standard-headers/linux/virtio_gpio.h
+
+GPIO Virtio backend
+M: Enrico Weigelt, metux IT consult <info@metux.net>
+S: Supported
+F: hw/virtio/virtio-gpio.c
+F: include/hw/virtio/virtio-gpio.h
 
 Memory API
 M: Paolo Bonzini <pbonzini@redhat.com>
diff --git a/hw/virtio/Kconfig b/hw/virtio/Kconfig
index 0eda25c4e1..81da1ee763 100644
--- a/hw/virtio/Kconfig
+++ b/hw/virtio/Kconfig
@@ -33,6 +33,13 @@ config VIRTIO_BALLOON
     default y
     depends on VIRTIO
 
+config VIRTIO_GPIO
+    bool
+    default y
+    depends on VIRTIO
+    select BACKEND_GPIO
+    select BACKEND_GPIO_BUILTIN
+
 config VIRTIO_CRYPTO
     bool
     default y
diff --git a/hw/virtio/meson.build b/hw/virtio/meson.build
index fbff9bc9d4..88577ff812 100644
--- a/hw/virtio/meson.build
+++ b/hw/virtio/meson.build
@@ -25,6 +25,7 @@ virtio_ss.add(when: 'CONFIG_VHOST_USER_VSOCK', if_true: files('vhost-user-vsock.
 virtio_ss.add(when: 'CONFIG_VIRTIO_RNG', if_true: files('virtio-rng.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_IOMMU', if_true: files('virtio-iommu.c'))
 virtio_ss.add(when: 'CONFIG_VIRTIO_MEM', if_true: files('virtio-mem.c'))
+virtio_ss.add(when: 'CONFIG_VIRTIO_GPIO', if_true: files('virtio-gpio.c'))
 
 virtio_pci_ss = ss.source_set()
 virtio_pci_ss.add(when: 'CONFIG_VHOST_VSOCK', if_true: files('vhost-vsock-pci.c'))
diff --git a/hw/virtio/virtio-gpio.c b/hw/virtio/virtio-gpio.c
new file mode 100644
index 0000000000..37e7614c96
--- /dev/null
+++ b/hw/virtio/virtio-gpio.c
@@ -0,0 +1,371 @@
+/*
+ * A virtio device implementing a hardware gpio port.
+ *
+ * Copyright 2020 Enrico Weigelt, metux IT consult <info@metux.net>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qapi/error.h"
+#include "qemu/iov.h"
+#include "qemu/module.h"
+#include "qemu/timer.h"
+#include "hw/virtio/virtio.h"
+#include "hw/qdev-properties.h"
+#include "sysemu/gpio.h"
+#include "sysemu/runstate.h"
+#include "qom/object.h"
+#include "qom/object_interfaces.h"
+#include "trace.h"
+#include "qemu/error-report.h"
+#include "standard-headers/linux/virtio_ids.h"
+#include "standard-headers/linux/virtio_gpio.h"
+
+#define WARN(...) warn_report("virtio-gpio: " __VA_ARGS__)
+
+#define TYPE_VIRTIO_GPIO "virtio-gpio-device"
+OBJECT_DECLARE_SIMPLE_TYPE(VirtIOGPIO, VIRTIO_GPIO)
+#define VIRTIO_GPIO_GET_PARENT_CLASS(obj) \
+        OBJECT_GET_PARENT_CLASS(obj, TYPE_VIRTIO_GPIO)
+
+typedef struct VirtIOGPIO VirtIOGPIO;
+
+struct VirtIOGPIO {
+    VirtIODevice parent_obj;
+
+    VirtQueue *vq_in;
+    VirtQueue *vq_out;
+
+    uint32_t num_gpios;
+
+    char **gpio_names;
+    uint32_t gpio_names_len;
+
+    GpioBackend *gpio;
+    char *name;
+
+    VMChangeStateEntry *vmstate;
+    struct virtio_gpio_event reply_buffer;
+
+    void *config_buf;
+    int config_len;
+};
+
+static bool is_guest_ready(VirtIOGPIO *vgpio)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(vgpio);
+    if (virtio_queue_ready(vgpio->vq_in)
+        && (vdev->status & VIRTIO_CONFIG_S_DRIVER_OK)) {
+        return true;
+    }
+    return false;
+}
+
+static void virtio_gpio_reply(VirtIOGPIO *vgpio, int type, int pin, int value)
+{
+    VirtQueueElement *elem;
+    size_t len;
+
+    if (!virtio_queue_ready(vgpio->vq_out)) {
+        WARN("out queue is not ready yet");
+        return;
+    }
+
+    elem = virtqueue_pop(vgpio->vq_out, sizeof(VirtQueueElement));
+    if (!elem) {
+        WARN("failed to get xmit queue element");
+        return;
+    }
+
+    vgpio->reply_buffer.type = type;
+    vgpio->reply_buffer.pin = pin;
+    vgpio->reply_buffer.value = value;
+    len = iov_from_buf(elem->in_sg, elem->in_num, 0, &vgpio->reply_buffer,
+                       sizeof(struct virtio_gpio_event));
+    virtqueue_push(vgpio->vq_out, elem, len);
+    g_free(elem);
+    virtio_notify(VIRTIO_DEVICE(vgpio), vgpio->vq_out);
+}
+
+static int do_request(VirtIOGPIO *vgpio, struct virtio_gpio_event *reqbuf)
+{
+    switch (reqbuf->type) {
+    case VIRTIO_GPIO_EV_GUEST_REQUEST:
+        return gpio_backend_request(vgpio->gpio, reqbuf->pin);
+    case VIRTIO_GPIO_EV_GUEST_DIRECTION_INPUT:
+        return gpio_backend_direction_input(vgpio->gpio, reqbuf->pin);
+    case VIRTIO_GPIO_EV_GUEST_DIRECTION_OUTPUT:
+        return gpio_backend_direction_output(vgpio->gpio, reqbuf->pin,
+                                             reqbuf->value);
+    case VIRTIO_GPIO_EV_GUEST_GET_DIRECTION:
+        return gpio_backend_get_direction(vgpio->gpio, reqbuf->pin);
+    case VIRTIO_GPIO_EV_GUEST_GET_VALUE:
+        return gpio_backend_get_value(vgpio->gpio, reqbuf->pin);
+    case VIRTIO_GPIO_EV_GUEST_SET_VALUE:
+        return gpio_backend_set_value(vgpio->gpio, reqbuf->pin,
+                                      reqbuf->value);
+    }
+    WARN("unknown request type: %d", reqbuf->type);
+    return -EINVAL;
+}
+
+static int virtio_gpio_notify(void *obj, int pin, int event, int value)
+{
+    VirtIOGPIO *vgpio = obj;
+
+    switch (event) {
+    case GPIO_EVENT_LEVEL:
+        virtio_gpio_reply(vgpio, VIRTIO_GPIO_EV_HOST_LEVEL, pin, value);
+    break;
+    case GPIO_EVENT_INPUT:
+    break;
+    case GPIO_EVENT_OUTPUT:
+    break;
+    default:
+        WARN("unhandled notification: pin=%d event=%d value=%d", pin,
+             event, value);
+    break;
+    }
+
+    return 0;
+}
+
+static void virtio_gpio_process(VirtIOGPIO *vgpio)
+{
+    VirtQueueElement *elem;
+
+    if (!is_guest_ready(vgpio)) {
+        return;
+    }
+
+    while ((elem = virtqueue_pop(vgpio->vq_in, sizeof(VirtQueueElement)))) {
+        size_t offset = 0;
+        struct virtio_gpio_event reqbuf;
+        while ((iov_to_buf(elem->out_sg, elem->out_num, offset, &reqbuf,
+                           sizeof(reqbuf))) == sizeof(reqbuf))
+        {
+            offset += sizeof(reqbuf);
+            virtio_gpio_reply(vgpio, reqbuf.type | VIRTIO_GPIO_EV_REPLY,
+                              reqbuf.pin, do_request(vgpio, &reqbuf));
+        }
+        virtqueue_push(vgpio->vq_in, elem, sizeof(reqbuf));
+        virtio_notify(VIRTIO_DEVICE(vgpio), vgpio->vq_in);
+    }
+}
+
+static void virtio_gpio_handle_rx(VirtIODevice *vdev, VirtQueue *vq)
+{
+    VirtIOGPIO *vgpio = VIRTIO_GPIO(vdev);
+    virtio_gpio_process(vgpio);
+}
+
+static uint64_t virtio_gpio_get_features(VirtIODevice *vdev, uint64_t f,
+                                         Error **errp)
+{
+    return f;
+}
+
+static void virtio_gpio_get_config(VirtIODevice *vdev, uint8_t *config_data)
+{
+    VirtIOGPIO *vgpio = VIRTIO_GPIO(vdev);
+    memcpy(config_data, vgpio->config_buf, vgpio->config_len);
+}
+
+static void virtio_gpio_vm_state_change(void *opaque, int running,
+                                        RunState state)
+{
+    VirtIOGPIO *vgpio = opaque;
+
+    if (running && is_guest_ready(vgpio)) {
+        virtio_gpio_process(vgpio);
+    }
+}
+
+static void virtio_gpio_set_status(VirtIODevice *vdev, uint8_t status)
+{
+    VirtIOGPIO *vgpio = VIRTIO_GPIO(vdev);
+
+    if (!vdev->vm_running) {
+        return;
+    }
+
+    vdev->status = status;
+    virtio_gpio_process(vgpio);
+}
+
+static void virtio_gpio_default_backend(VirtIOGPIO *vgpio, DeviceState* dev,
+                                        Error **errp)
+{
+    Object *b = NULL;
+
+    if (vgpio->gpio != NULL) {
+        return;
+    }
+
+    b = object_new(TYPE_GPIO_BUILTIN);
+
+    if (!user_creatable_complete(USER_CREATABLE(b), errp)) {
+        object_unref(b);
+        return;
+    }
+
+    object_property_add_child(OBJECT(dev), "default-backend", b);
+
+    /* The child property took a reference, we can safely drop ours now */
+    object_unref(b);
+
+    object_property_set_link(OBJECT(dev), "gpio", b, &error_abort);
+}
+
+/* count the string array size */
+static int str_array_size(char **str, int len)
+{
+    int x;
+    int ret = 0;
+    for (x = 0; x < len; x++) {
+        ret += (str[x] ? strlen(str[x]) + 1 : 1);
+    }
+    return ret;
+}
+
+static void virtio_gpio_device_realize(DeviceState *dev, Error **errp)
+{
+    struct virtio_gpio_config *config;
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOGPIO *vgpio = VIRTIO_GPIO(dev);
+    int nbuf_len = 0;
+    char *bufptr;
+    int x;
+
+    /* make sure we have a backend */
+    virtio_gpio_default_backend(vgpio, dev, errp);
+
+    /* parameter checking */
+    if (vgpio->gpio == NULL) {
+        error_setg(errp, "'gpio' parameter expects a valid object");
+        return;
+    }
+
+    if ((vgpio->num_gpios < 1) && (vgpio->gpio_names_len > 0)) {
+        vgpio->num_gpios = vgpio->gpio_names_len;
+    }
+
+    if (vgpio->num_gpios < 1) {
+        vgpio->num_gpios = gpio_backend_get_ngpio(vgpio->gpio);
+    }
+
+    if (vgpio->num_gpios < 1) {
+        error_setg(errp,
+                   "'num_gpios' parameter invalid / no setting from backend");
+        return;
+    }
+
+    if (vgpio->gpio_names_len > vgpio->num_gpios) {
+        error_setg(errp, "'num_gpios' parameter less than 'len-gpio-names'");
+        return;
+    }
+
+    /* count required buffer space */
+    if (vgpio->gpio_names) {
+        nbuf_len = str_array_size(vgpio->gpio_names, vgpio->gpio_names_len)
+                 + (vgpio->num_gpios - vgpio->gpio_names_len);
+    } else {
+        nbuf_len = vgpio->num_gpios;
+    }
+
+    vgpio->config_len = sizeof(struct virtio_gpio_config) + nbuf_len;
+    vgpio->config_buf = calloc(1, vgpio->config_len);
+
+    /* fill out our struct */
+    config = vgpio->config_buf;
+    config->version = 1;
+    config->num_gpios = vgpio->num_gpios;
+    config->names_size = nbuf_len;
+    strncpy((char *)&config->name, vgpio->name, sizeof(config->name));
+    config->name[sizeof(config->name) - 1] = 0;
+
+    /* copy the names */
+    bufptr = (char *)(vgpio->config_buf) + sizeof(struct virtio_gpio_config);
+
+    for (x = 0; x < vgpio->gpio_names_len; x++) {
+        if (vgpio->gpio_names[x]) {
+            strcpy(bufptr, vgpio->gpio_names[x]);
+            bufptr += strlen(vgpio->gpio_names[x]) + 1;
+        } else {
+            *bufptr = 0;
+            bufptr++;
+        }
+    }
+
+    memset(&vgpio->reply_buffer, 0, sizeof(struct virtio_gpio_event));
+
+    gpio_backend_set_notify(vgpio->gpio, virtio_gpio_notify, vgpio);
+
+    virtio_init(vdev, "virtio-gpio", VIRTIO_ID_GPIO, vgpio->config_len);
+
+    vgpio->vq_out = virtio_add_queue(vdev, 256, NULL);
+    vgpio->vq_in = virtio_add_queue(vdev, 256, virtio_gpio_handle_rx);
+
+    vgpio->vmstate = qemu_add_vm_change_state_handler(
+                        virtio_gpio_vm_state_change, vgpio);
+}
+
+static void virtio_gpio_device_unrealize(DeviceState *dev)
+{
+    VirtIODevice *vdev = VIRTIO_DEVICE(dev);
+    VirtIOGPIO *vgpio = VIRTIO_GPIO(dev);
+
+    qemu_del_vm_change_state_handler(vgpio->vmstate);
+    virtio_del_queue(vdev, 0);
+    virtio_cleanup(vdev);
+}
+
+static const VMStateDescription vmstate_virtio_gpio = {
+    .name = "virtio-gpio",
+    .minimum_version_id = 1,
+    .version_id = 1,
+    .fields = (VMStateField[]) {
+        VMSTATE_VIRTIO_DEVICE,
+        VMSTATE_END_OF_LIST()
+    },
+};
+
+static Property virtio_gpio_properties[] = {
+    DEFINE_PROP_STRING("name", VirtIOGPIO, name),
+    DEFINE_PROP_UINT32("num-gpios", VirtIOGPIO, num_gpios, 0),
+    DEFINE_PROP_LINK("gpio", VirtIOGPIO, gpio, TYPE_GPIO_BACKEND,
+                     GpioBackend *),
+    DEFINE_PROP_ARRAY("gpio-names", VirtIOGPIO, gpio_names_len, gpio_names,
+                      qdev_prop_string, char*),
+    DEFINE_PROP_END_OF_LIST(),
+};
+
+static void virtio_gpio_class_init(ObjectClass *klass, void *data)
+{
+    DeviceClass *dc = DEVICE_CLASS(klass);
+    VirtioDeviceClass *vdc = VIRTIO_DEVICE_CLASS(klass);
+
+    device_class_set_props(dc, virtio_gpio_properties);
+    dc->vmsd = &vmstate_virtio_gpio;
+    set_bit(DEVICE_CATEGORY_MISC, dc->categories);
+    vdc->realize = virtio_gpio_device_realize;
+    vdc->unrealize = virtio_gpio_device_unrealize;
+    vdc->get_features = virtio_gpio_get_features;
+    vdc->set_status = virtio_gpio_set_status;
+    vdc->get_config = virtio_gpio_get_config;
+}
+
+static const TypeInfo virtio_gpio_info = {
+    .name = TYPE_VIRTIO_GPIO,
+    .parent = TYPE_VIRTIO_DEVICE,
+    .instance_size = sizeof(VirtIOGPIO),
+    .class_init = virtio_gpio_class_init,
+};
+
+static void virtio_register_types(void)
+{
+    type_register_static(&virtio_gpio_info);
+}
+
+type_init(virtio_register_types)
-- 
2.11.0


