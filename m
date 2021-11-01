Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B976B442135
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 20:59:09 +0100 (CET)
Received: from localhost ([::1]:37194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdSW-0008Lv-Ct
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 15:59:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56546)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcH4-0007xC-Te
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:14 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35630)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcH1-0008OY-69
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:13 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792189;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SNHZNzBP1nSDzMaqDz3IAOQ774k1f3QsulMN2SnaIMo=;
 b=cDrHqgxB9nhoG4Cac84ItsZjgVpKUoVMWQzDsYEBFnXPhezMATrGByEqtp4HfxUk3fV2bt
 0A/+N/zL5H5cGUKK3kIMiN4wA+kII5QtMXiaUz/ovHLZK4wl7HdSzCDzGToLv4kRX/nm0x
 /HD8PZyXxm4qePS05Sz1/Cx2bW/3vbA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-399-SlI3BDg6MUWzfN3_iHbn_A-1; Mon, 01 Nov 2021 14:43:07 -0400
X-MC-Unique: SlI3BDg6MUWzfN3_iHbn_A-1
Received: by mail-wr1-f71.google.com with SMTP id
 c4-20020adfed84000000b00185ca4eba36so1388103wro.21
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SNHZNzBP1nSDzMaqDz3IAOQ774k1f3QsulMN2SnaIMo=;
 b=vZYG8zMz/4KBTMU+u+o7Vn1K/ix5S2aZlXtyvfx3ir29/cuicj5w1HzR84yMWDAaq6
 DbSPvPf6qTQjdS3kHoAOxKDJ6uOgEqX39pDErDNzgX2Er+y9CW04aAJmmn0sKKypIYE3
 6D1Jo6ggvhE23Twmh9N2j24qdQdKpu0kWnA5ZZwjQB3uMQ4xihKC8fl7EuCi45lzsgeG
 9R/aPhbTKH+JmCE/nwERKJ+z5B1si3jh21QdRt2MkIJHjXtEDkv9dbTjTBhjI1hbampT
 zcV9PQgC3g6wFOXg6NIRS/zuV9XI/x4j32O+xEDFmqweoBYHi15g38BDH5C+3xfrYE1Q
 pTKg==
X-Gm-Message-State: AOAM531irqt2Z68bu/oP5H8S2Wql1ki7rC9RBwd66MHh2y5gfYK4j+X3
 aw7/Odu2QThGw8WzYPHx9b0G5AXAhLz58ew56ooF4H3pj01tEzonx/UlHp/4g/dYu/P95Q9s28f
 +DTkzOk0IV2DlgtqMrr3wmJZXjBL91Fk/4uJX42m0o2y6OaLzNeN9C6cottOYA7mL
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr18701267wrn.423.1635792186153; 
 Mon, 01 Nov 2021 11:43:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwK0A4GsLFI09HL8uK4Dy9tYyGhnRz4MQ34BHU2niGUY0C7pJB23Whiez8jzowsMPR17s0s6A==
X-Received: by 2002:adf:ce0e:: with SMTP id p14mr18701194wrn.423.1635792185774; 
 Mon, 01 Nov 2021 11:43:05 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 w15sm5760475wrk.77.2021.11.01.11.43.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:05 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 01/10] machine: Move gpio code to hw/core/gpio.c
Date: Mon,  1 Nov 2021 19:42:50 +0100
Message-Id: <20211101184259.2859090-2-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211101184259.2859090-1-philmd@redhat.com>
References: <20211101184259.2859090-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Only softmmu code uses gpio, so move gpio code from qdev.c to
gpio.c and compile it only on softmmu mode.

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Message-Id: <20190425200051.19906-2-ehabkost@redhat.com>
Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
---
 hw/core/gpio.c      | 197 ++++++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c      | 174 --------------------------------------
 hw/core/meson.build |   1 +
 3 files changed, 198 insertions(+), 174 deletions(-)
 create mode 100644 hw/core/gpio.c

diff --git a/hw/core/gpio.c b/hw/core/gpio.c
new file mode 100644
index 00000000000..8e6b4f5edf3
--- /dev/null
+++ b/hw/core/gpio.c
@@ -0,0 +1,197 @@
+/*
+ * qdev GPIO helpers
+ *
+ *  Copyright (c) 2009 CodeSourcery
+ *
+ * This library is free software; you can redistribute it and/or
+ * modify it under the terms of the GNU Lesser General Public
+ * License as published by the Free Software Foundation; either
+ * version 2 of the License, or (at your option) any later version.
+ *
+ * This library is distributed in the hope that it will be useful,
+ * but WITHOUT ANY WARRANTY; without even the implied warranty of
+ * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
+ * Lesser General Public License for more details.
+ *
+ * You should have received a copy of the GNU Lesser General Public
+ * License along with this library; if not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "hw/irq.h"
+#include "qapi/error.h"
+
+static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
+                                               const char *name)
+{
+    NamedGPIOList *ngl;
+
+    QLIST_FOREACH(ngl, &dev->gpios, node) {
+        /* NULL is a valid and matchable name. */
+        if (g_strcmp0(name, ngl->name) == 0) {
+            return ngl;
+        }
+    }
+
+    ngl = g_malloc0(sizeof(*ngl));
+    ngl->name = g_strdup(name);
+    QLIST_INSERT_HEAD(&dev->gpios, ngl, node);
+    return ngl;
+}
+
+void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
+                                         qemu_irq_handler handler,
+                                         void *opaque,
+                                         const char *name, int n)
+{
+    int i;
+    NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
+
+    assert(gpio_list->num_out == 0 || !name);
+    gpio_list->in = qemu_extend_irqs(gpio_list->in, gpio_list->num_in, handler,
+                                     opaque, n);
+
+    if (!name) {
+        name = "unnamed-gpio-in";
+    }
+    for (i = gpio_list->num_in; i < gpio_list->num_in + n; i++) {
+        gchar *propname = g_strdup_printf("%s[%u]", name, i);
+
+        object_property_add_child(OBJECT(dev), propname,
+                                  OBJECT(gpio_list->in[i]));
+        g_free(propname);
+    }
+
+    gpio_list->num_in += n;
+}
+
+void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n)
+{
+    qdev_init_gpio_in_named(dev, handler, NULL, n);
+}
+
+void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
+                              const char *name, int n)
+{
+    int i;
+    NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
+
+    assert(gpio_list->num_in == 0 || !name);
+
+    if (!name) {
+        name = "unnamed-gpio-out";
+    }
+    memset(pins, 0, sizeof(*pins) * n);
+    for (i = 0; i < n; ++i) {
+        gchar *propname = g_strdup_printf("%s[%u]", name,
+                                          gpio_list->num_out + i);
+
+        object_property_add_link(OBJECT(dev), propname, TYPE_IRQ,
+                                 (Object **)&pins[i],
+                                 object_property_allow_set_link,
+                                 OBJ_PROP_LINK_STRONG);
+        g_free(propname);
+    }
+    gpio_list->num_out += n;
+}
+
+void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n)
+{
+    qdev_init_gpio_out_named(dev, pins, NULL, n);
+}
+
+qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n)
+{
+    NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
+
+    assert(n >= 0 && n < gpio_list->num_in);
+    return gpio_list->in[n];
+}
+
+qemu_irq qdev_get_gpio_in(DeviceState *dev, int n)
+{
+    return qdev_get_gpio_in_named(dev, NULL, n);
+}
+
+void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
+                                 qemu_irq pin)
+{
+    char *propname = g_strdup_printf("%s[%d]",
+                                     name ? name : "unnamed-gpio-out", n);
+    if (pin && !OBJECT(pin)->parent) {
+        /* We need a name for object_property_set_link to work */
+        object_property_add_child(container_get(qdev_get_machine(),
+                                                "/unattached"),
+                                  "non-qdev-gpio[*]", OBJECT(pin));
+    }
+    object_property_set_link(OBJECT(dev), propname, OBJECT(pin), &error_abort);
+    g_free(propname);
+}
+
+qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
+{
+    g_autofree char *propname = g_strdup_printf("%s[%d]",
+                                     name ? name : "unnamed-gpio-out", n);
+
+    qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
+                                                      NULL);
+
+    return ret;
+}
+
+/* disconnect a GPIO output, returning the disconnected input (if any) */
+
+static qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
+                                               const char *name, int n)
+{
+    char *propname = g_strdup_printf("%s[%d]",
+                                     name ? name : "unnamed-gpio-out", n);
+
+    qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
+                                                      NULL);
+    if (ret) {
+        object_property_set_link(OBJECT(dev), propname, NULL, NULL);
+    }
+    g_free(propname);
+    return ret;
+}
+
+qemu_irq qdev_intercept_gpio_out(DeviceState *dev, qemu_irq icpt,
+                                 const char *name, int n)
+{
+    qemu_irq disconnected = qdev_disconnect_gpio_out_named(dev, name, n);
+    qdev_connect_gpio_out_named(dev, name, n, icpt);
+    return disconnected;
+}
+
+void qdev_connect_gpio_out(DeviceState *dev, int n, qemu_irq pin)
+{
+    qdev_connect_gpio_out_named(dev, NULL, n, pin);
+}
+
+void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
+                     const char *name)
+{
+    int i;
+    NamedGPIOList *ngl = qdev_get_named_gpio_list(dev, name);
+
+    for (i = 0; i < ngl->num_in; i++) {
+        const char *nm = ngl->name ? ngl->name : "unnamed-gpio-in";
+        char *propname = g_strdup_printf("%s[%d]", nm, i);
+
+        object_property_add_alias(OBJECT(container), propname,
+                                  OBJECT(dev), propname);
+        g_free(propname);
+    }
+    for (i = 0; i < ngl->num_out; i++) {
+        const char *nm = ngl->name ? ngl->name : "unnamed-gpio-out";
+        char *propname = g_strdup_printf("%s[%d]", nm, i);
+
+        object_property_add_alias(OBJECT(container), propname,
+                                  OBJECT(dev), propname);
+        g_free(propname);
+    }
+    QLIST_REMOVE(ngl, node);
+    QLIST_INSERT_HEAD(&container->gpios, ngl, node);
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 7f06403752d..1e38f997245 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -436,180 +436,6 @@ BusState *qdev_get_parent_bus(DeviceState *dev)
     return dev->parent_bus;
 }
 
-static NamedGPIOList *qdev_get_named_gpio_list(DeviceState *dev,
-                                               const char *name)
-{
-    NamedGPIOList *ngl;
-
-    QLIST_FOREACH(ngl, &dev->gpios, node) {
-        /* NULL is a valid and matchable name. */
-        if (g_strcmp0(name, ngl->name) == 0) {
-            return ngl;
-        }
-    }
-
-    ngl = g_malloc0(sizeof(*ngl));
-    ngl->name = g_strdup(name);
-    QLIST_INSERT_HEAD(&dev->gpios, ngl, node);
-    return ngl;
-}
-
-void qdev_init_gpio_in_named_with_opaque(DeviceState *dev,
-                                         qemu_irq_handler handler,
-                                         void *opaque,
-                                         const char *name, int n)
-{
-    int i;
-    NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
-
-    assert(gpio_list->num_out == 0 || !name);
-    gpio_list->in = qemu_extend_irqs(gpio_list->in, gpio_list->num_in, handler,
-                                     opaque, n);
-
-    if (!name) {
-        name = "unnamed-gpio-in";
-    }
-    for (i = gpio_list->num_in; i < gpio_list->num_in + n; i++) {
-        gchar *propname = g_strdup_printf("%s[%u]", name, i);
-
-        object_property_add_child(OBJECT(dev), propname,
-                                  OBJECT(gpio_list->in[i]));
-        g_free(propname);
-    }
-
-    gpio_list->num_in += n;
-}
-
-void qdev_init_gpio_in(DeviceState *dev, qemu_irq_handler handler, int n)
-{
-    qdev_init_gpio_in_named(dev, handler, NULL, n);
-}
-
-void qdev_init_gpio_out_named(DeviceState *dev, qemu_irq *pins,
-                              const char *name, int n)
-{
-    int i;
-    NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
-
-    assert(gpio_list->num_in == 0 || !name);
-
-    if (!name) {
-        name = "unnamed-gpio-out";
-    }
-    memset(pins, 0, sizeof(*pins) * n);
-    for (i = 0; i < n; ++i) {
-        gchar *propname = g_strdup_printf("%s[%u]", name,
-                                          gpio_list->num_out + i);
-
-        object_property_add_link(OBJECT(dev), propname, TYPE_IRQ,
-                                 (Object **)&pins[i],
-                                 object_property_allow_set_link,
-                                 OBJ_PROP_LINK_STRONG);
-        g_free(propname);
-    }
-    gpio_list->num_out += n;
-}
-
-void qdev_init_gpio_out(DeviceState *dev, qemu_irq *pins, int n)
-{
-    qdev_init_gpio_out_named(dev, pins, NULL, n);
-}
-
-qemu_irq qdev_get_gpio_in_named(DeviceState *dev, const char *name, int n)
-{
-    NamedGPIOList *gpio_list = qdev_get_named_gpio_list(dev, name);
-
-    assert(n >= 0 && n < gpio_list->num_in);
-    return gpio_list->in[n];
-}
-
-qemu_irq qdev_get_gpio_in(DeviceState *dev, int n)
-{
-    return qdev_get_gpio_in_named(dev, NULL, n);
-}
-
-void qdev_connect_gpio_out_named(DeviceState *dev, const char *name, int n,
-                                 qemu_irq pin)
-{
-    char *propname = g_strdup_printf("%s[%d]",
-                                     name ? name : "unnamed-gpio-out", n);
-    if (pin && !OBJECT(pin)->parent) {
-        /* We need a name for object_property_set_link to work */
-        object_property_add_child(container_get(qdev_get_machine(),
-                                                "/unattached"),
-                                  "non-qdev-gpio[*]", OBJECT(pin));
-    }
-    object_property_set_link(OBJECT(dev), propname, OBJECT(pin), &error_abort);
-    g_free(propname);
-}
-
-qemu_irq qdev_get_gpio_out_connector(DeviceState *dev, const char *name, int n)
-{
-    g_autofree char *propname = g_strdup_printf("%s[%d]",
-                                     name ? name : "unnamed-gpio-out", n);
-
-    qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
-                                                      NULL);
-
-    return ret;
-}
-
-/* disconnect a GPIO output, returning the disconnected input (if any) */
-
-static qemu_irq qdev_disconnect_gpio_out_named(DeviceState *dev,
-                                               const char *name, int n)
-{
-    char *propname = g_strdup_printf("%s[%d]",
-                                     name ? name : "unnamed-gpio-out", n);
-
-    qemu_irq ret = (qemu_irq)object_property_get_link(OBJECT(dev), propname,
-                                                      NULL);
-    if (ret) {
-        object_property_set_link(OBJECT(dev), propname, NULL, NULL);
-    }
-    g_free(propname);
-    return ret;
-}
-
-qemu_irq qdev_intercept_gpio_out(DeviceState *dev, qemu_irq icpt,
-                                 const char *name, int n)
-{
-    qemu_irq disconnected = qdev_disconnect_gpio_out_named(dev, name, n);
-    qdev_connect_gpio_out_named(dev, name, n, icpt);
-    return disconnected;
-}
-
-void qdev_connect_gpio_out(DeviceState * dev, int n, qemu_irq pin)
-{
-    qdev_connect_gpio_out_named(dev, NULL, n, pin);
-}
-
-void qdev_pass_gpios(DeviceState *dev, DeviceState *container,
-                     const char *name)
-{
-    int i;
-    NamedGPIOList *ngl = qdev_get_named_gpio_list(dev, name);
-
-    for (i = 0; i < ngl->num_in; i++) {
-        const char *nm = ngl->name ? ngl->name : "unnamed-gpio-in";
-        char *propname = g_strdup_printf("%s[%d]", nm, i);
-
-        object_property_add_alias(OBJECT(container), propname,
-                                  OBJECT(dev), propname);
-        g_free(propname);
-    }
-    for (i = 0; i < ngl->num_out; i++) {
-        const char *nm = ngl->name ? ngl->name : "unnamed-gpio-out";
-        char *propname = g_strdup_printf("%s[%d]", nm, i);
-
-        object_property_add_alias(OBJECT(container), propname,
-                                  OBJECT(dev), propname);
-        g_free(propname);
-    }
-    QLIST_REMOVE(ngl, node);
-    QLIST_INSERT_HEAD(&container->gpios, ngl, node);
-}
-
 BusState *qdev_get_child_bus(DeviceState *dev, const char *name)
 {
     BusState *bus;
diff --git a/hw/core/meson.build b/hw/core/meson.build
index 18f44fb7c24..86f26f0a60f 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -27,6 +27,7 @@
 softmmu_ss.add(files(
   'cpu-sysemu.c',
   'fw-path-provider.c',
+  'gpio.c',
   'loader.c',
   'machine-hmp-cmds.c',
   'machine.c',
-- 
2.31.1


