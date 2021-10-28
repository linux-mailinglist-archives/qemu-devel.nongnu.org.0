Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B57543E4A4
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Oct 2021 17:10:14 +0200 (CEST)
Received: from localhost ([::1]:60464 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mg72j-0001s2-Cb
	for lists+qemu-devel@lfdr.de; Thu, 28 Oct 2021 11:10:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39624)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yZ-0006lP-4G
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:55 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43693)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@redhat.com>) id 1mg6yM-00079A-N5
 for qemu-devel@nongnu.org; Thu, 28 Oct 2021 11:05:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635433541;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BP2YG+UwU9At2GQjrOrvf7QoxC3M4wZVtXRCu8IsEeY=;
 b=TjkGzlmgXnOkH2gZG4zrYyTFvctDXxl5L4wYAOpcjZx4j2gMMLTl0cwaDTPsom1Rd+LRYi
 CVwSek6WEzyhXxa09MCZZAs+AM/bZiOkaW0wj0Ab00wRJiw6611ocEDPiwxoXY7q80rFkE
 QnS8SU7CSxx8XP42p6caEVz1BDdHHFk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-379-7gVa7QvqN-iod2DJO9LNNA-1; Thu, 28 Oct 2021 11:05:40 -0400
X-MC-Unique: 7gVa7QvqN-iod2DJO9LNNA-1
Received: by mail-wr1-f70.google.com with SMTP id
 f18-20020a5d58f2000000b001645b92c65bso2236832wrd.6
 for <qemu-devel@nongnu.org>; Thu, 28 Oct 2021 08:05:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BP2YG+UwU9At2GQjrOrvf7QoxC3M4wZVtXRCu8IsEeY=;
 b=XfN9Z9pAROd7p0Yf+jyUaaAiDcfXZOHDuitnoNVDHnWn9cgoqj8V/bqi+QRdmtrX7l
 z8fOiPE1Rvw06uLwwdkUUOzgJzHdoD0fStP8XGBUTyv62I0M5VPS1j8BiaztXYPg8zfc
 VfuetpuKOKp+RsS5dJkmhIZec7lxmiKCwWkFbkW3vpBLITR+Z5C/naimWYq0uszcmuJp
 Q8tbhrSGVD0PYxD5ULKcXoJRHN2pZ5EHztD+G8ECIhDgGzxR5UBhii0bsQC+t6wCaeUy
 gssci3d4VI+BkqXJHtkyU1CZXGCvxROGhZwCWN+W7n2yso+8mFTlmEV0WWPLVfuPkEaj
 TiNA==
X-Gm-Message-State: AOAM532AsZE4tKKfguNJSP4WS+e4mqMYNdsHMV+xLqpzkS9Egxv8rMNq
 rQrSclc/wC32wuMPyZCfbbh2rkyeDMLYycvKukkEzdWV4l3bc6mGVwvFJINZ3PjZQX3ouLeGUu+
 ghsP1RI74W7RkbWeD/y0sxN+WrkSGILhcleojgT1jETsqYdGXLAoh9w7Eq0Ftn4B5
X-Received: by 2002:adf:959a:: with SMTP id p26mr6332351wrp.342.1635433538356; 
 Thu, 28 Oct 2021 08:05:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfdaIODQY29LG0UaL6aZJ/CT3C9MkLEbsk0ssVIEjXTS5y0fcCVo0BKxF3WM4rkYpS0feH1Q==
X-Received: by 2002:adf:959a:: with SMTP id p26mr6332298wrp.342.1635433538083; 
 Thu, 28 Oct 2021 08:05:38 -0700 (PDT)
Received: from x1w.redhat.com (62.red-83-57-168.dynamicip.rima-tde.net.
 [83.57.168.62])
 by smtp.gmail.com with ESMTPSA id e9sm3252978wrn.2.2021.10.28.08.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Oct 2021 08:05:37 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/4] hw/core: Extract hotplug-related functions to
 qdev-hotplug.c
Date: Thu, 28 Oct 2021 17:05:20 +0200
Message-Id: <20211028150521.1973821-4-philmd@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211028150521.1973821-1-philmd@redhat.com>
References: <20211028150521.1973821-1-philmd@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=philmd@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 Igor Mammedov <imammedo@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
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
index 7f06403752d..cede76fce47 100644
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
index 4d04069f85f..85f2ad1374b 100644
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


