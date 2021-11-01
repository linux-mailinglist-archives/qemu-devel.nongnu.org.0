Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C6D5F442167
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 21:08:43 +0100 (CET)
Received: from localhost ([::1]:57076 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhdbm-0005AZ-DG
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 16:08:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHG-0000AX-5j
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:40260)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mhcHD-0008Pm-VQ
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 14:43:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635792203;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zP0Zzar9NcpirKydIFsBcmX/ZgtzRAXafWTr0rzZA9Y=;
 b=P6OpwXt3c79ScGH5qWd8G6ZHRGJ7WJqIWkkjx9OYXMskW3TvTuh6ALBxy29kcRG7cyc/UB
 hnz3rHPtZbqdfnRug5fDmpJM4OZvvvtiiDrr5qPXPK7Or0yDdOad65J1bVRk3LqcgLAY+9
 i/TpNO5WSz/Sn/igHEp73FLKDNTXFYY=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-423-OXnXspcGPJ6l--y-8SSTHQ-1; Mon, 01 Nov 2021 14:43:22 -0400
X-MC-Unique: OXnXspcGPJ6l--y-8SSTHQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 f3-20020a5d50c3000000b00183ce1379feso1918020wrt.5
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 11:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zP0Zzar9NcpirKydIFsBcmX/ZgtzRAXafWTr0rzZA9Y=;
 b=OroXBbWw+V4CH8VuRbJfMjQHlqTeZase85lukIA5C70Y5y/1zsd0XmlAcpfGR75T2x
 jJbDTeW7CPq4dkfZ9Ckoyx2UFLlBk2lshjlCWgnlcYZYoSIsyXPXO71CzjaLgqUBoA8z
 wKnWoMKww9dpbwdb6mml7F7ijoLxmCjQ3UXCVGaILZKg2eLVsLWCM2TeFN6j8tuR/mPh
 komHYgHz/zLHWmn/tsE8GqMMX5w058oadyG6zcXUyzmYRu2OdXGuVTnzZbdsrKdOV4WE
 YKT0v58LVJ+MUXgG05Oge1s2cIAm23gpvc1JsbxkNap1bI7k8fWkXWHosdHbcgKhkyHx
 li/A==
X-Gm-Message-State: AOAM5313rxPHlUdKXIg8IwtSNtPwjlr5EiZiqSFSp72t/IMnn7rDvFiV
 dauFO95WcmjmI20xb98Gzbmw8aMD+VuTraLo1TwOR0Og3ULbuQTeCPyQdev0IddORieqjeb7lyQ
 FGr3lnoi6r/dOPkN7mcGNz6FrhpyVvan4UlOUvKGRachyZfcTDfmmSxcJf4Gl43Yd
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr740639wmn.153.1635792201060; 
 Mon, 01 Nov 2021 11:43:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJysnc/rIs757lBgpRlW4l367oMuNqH+BKNG0J3j46i7dg3+kfgCTM3Q/LXgHkwQFSCs2dCtPA==
X-Received: by 2002:a05:600c:2f01:: with SMTP id
 r1mr740601wmn.153.1635792200765; 
 Mon, 01 Nov 2021 11:43:20 -0700 (PDT)
Received: from x1w.. (62.red-83-57-168.dynamicip.rima-tde.net. [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id
 u20sm338753wmq.3.2021.11.01.11.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 11:43:20 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 04/10] hw/core: Extract hotplug-related functions to
 qdev-hotplug.c
Date: Mon,  1 Nov 2021 19:42:53 +0100
Message-Id: <20211101184259.2859090-5-philmd@redhat.com>
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Yanan Wang <wangyanan55@huawei.com>
Acked-by: Eduardo Habkost <ehabkost@redhat.com>
Message-Id: <20211028150521.1973821-4-philmd@redhat.com>
---
 hw/core/qdev-hotplug.c | 73 ++++++++++++++++++++++++++++++++++++++++++
 hw/core/qdev.c         | 60 ----------------------------------
 hw/core/meson.build    |  1 +
 3 files changed, 74 insertions(+), 60 deletions(-)
 create mode 100644 hw/core/qdev-hotplug.c

diff --git a/hw/core/qdev-hotplug.c b/hw/core/qdev-hotplug.c
new file mode 100644
index 00000000000..d495d0e9c70
--- /dev/null
+++ b/hw/core/qdev-hotplug.c
@@ -0,0 +1,73 @@
+/*
+ * QDev Hotplug handlers
+ *
+ * Copyright (c) Red Hat
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ *
+ * This work is licensed under the terms of the GNU GPL, version 2 or later.
+ * See the COPYING file in the top-level directory.
+ */
+
+#include "qemu/osdep.h"
+#include "hw/qdev-core.h"
+#include "hw/boards.h"
+
+HotplugHandler *qdev_get_machine_hotplug_handler(DeviceState *dev)
+{
+    MachineState *machine;
+    MachineClass *mc;
+    Object *m_obj = qdev_get_machine();
+
+    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
+        machine = MACHINE(m_obj);
+        mc = MACHINE_GET_CLASS(machine);
+        if (mc->get_hotplug_handler) {
+            return mc->get_hotplug_handler(machine, dev);
+        }
+    }
+
+    return NULL;
+}
+
+bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
+{
+    MachineState *machine;
+    MachineClass *mc;
+    Object *m_obj = qdev_get_machine();
+
+    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
+        machine = MACHINE(m_obj);
+        mc = MACHINE_GET_CLASS(machine);
+        if (mc->hotplug_allowed) {
+            return mc->hotplug_allowed(machine, dev, errp);
+        }
+    }
+
+    return true;
+}
+
+HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev)
+{
+    if (dev->parent_bus) {
+        return dev->parent_bus->hotplug_handler;
+    }
+    return NULL;
+}
+
+HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
+{
+    HotplugHandler *hotplug_ctrl = qdev_get_machine_hotplug_handler(dev);
+
+    if (hotplug_ctrl == NULL && dev->parent_bus) {
+        hotplug_ctrl = qdev_get_bus_hotplug_handler(dev);
+    }
+    return hotplug_ctrl;
+}
+
+/* can be used as ->unplug() callback for the simple cases */
+void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
+                                  DeviceState *dev, Error **errp)
+{
+    qdev_unrealize(dev);
+}
diff --git a/hw/core/qdev.c b/hw/core/qdev.c
index 1e38f997245..84f3019440f 100644
--- a/hw/core/qdev.c
+++ b/hw/core/qdev.c
@@ -33,7 +33,6 @@
 #include "qapi/visitor.h"
 #include "qemu/error-report.h"
 #include "qemu/option.h"
-#include "hw/hotplug.h"
 #include "hw/irq.h"
 #include "hw/qdev-properties.h"
 #include "hw/boards.h"
@@ -238,58 +237,6 @@ void qdev_set_legacy_instance_id(DeviceState *dev, int alias_id,
     dev->alias_required_for_version = required_for_version;
 }
 
-HotplugHandler *qdev_get_machine_hotplug_handler(DeviceState *dev)
-{
-    MachineState *machine;
-    MachineClass *mc;
-    Object *m_obj = qdev_get_machine();
-
-    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
-        machine = MACHINE(m_obj);
-        mc = MACHINE_GET_CLASS(machine);
-        if (mc->get_hotplug_handler) {
-            return mc->get_hotplug_handler(machine, dev);
-        }
-    }
-
-    return NULL;
-}
-
-bool qdev_hotplug_allowed(DeviceState *dev, Error **errp)
-{
-    MachineState *machine;
-    MachineClass *mc;
-    Object *m_obj = qdev_get_machine();
-
-    if (object_dynamic_cast(m_obj, TYPE_MACHINE)) {
-        machine = MACHINE(m_obj);
-        mc = MACHINE_GET_CLASS(machine);
-        if (mc->hotplug_allowed) {
-            return mc->hotplug_allowed(machine, dev, errp);
-        }
-    }
-
-    return true;
-}
-
-HotplugHandler *qdev_get_bus_hotplug_handler(DeviceState *dev)
-{
-    if (dev->parent_bus) {
-        return dev->parent_bus->hotplug_handler;
-    }
-    return NULL;
-}
-
-HotplugHandler *qdev_get_hotplug_handler(DeviceState *dev)
-{
-    HotplugHandler *hotplug_ctrl = qdev_get_machine_hotplug_handler(dev);
-
-    if (hotplug_ctrl == NULL && dev->parent_bus) {
-        hotplug_ctrl = qdev_get_bus_hotplug_handler(dev);
-    }
-    return hotplug_ctrl;
-}
-
 static int qdev_prereset(DeviceState *dev, void *opaque)
 {
     trace_qdev_reset_tree(dev, object_get_typename(OBJECT(dev)));
@@ -371,13 +318,6 @@ static void device_reset_child_foreach(Object *obj, ResettableChildCallback cb,
     }
 }
 
-/* can be used as ->unplug() callback for the simple cases */
-void qdev_simple_device_unplug_cb(HotplugHandler *hotplug_dev,
-                                  DeviceState *dev, Error **errp)
-{
-    qdev_unrealize(dev);
-}
-
 bool qdev_realize(DeviceState *dev, BusState *bus, Error **errp)
 {
     assert(!dev->realized && !dev->parent_bus);
diff --git a/hw/core/meson.build b/hw/core/meson.build
index cc1ebb8e0f4..c9fe6441d92 100644
--- a/hw/core/meson.build
+++ b/hw/core/meson.build
@@ -11,6 +11,7 @@
   'irq.c',
   'clock.c',
   'qdev-clock.c',
+  'qdev-hotplug.c',
 ))
 
 common_ss.add(files('cpu-common.c'))
-- 
2.31.1


