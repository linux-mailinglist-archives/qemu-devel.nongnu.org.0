Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 07384699BE6
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:07:27 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicI-0000DC-U0; Thu, 16 Feb 2023 13:04:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicG-0000BB-Qn
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:20 -0500
Received: from forwardcorp1c.mail.yandex.net
 ([2a02:6b8:c03:500:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicE-0005pm-Oe
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:20 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A1BAE60118;
 Thu, 16 Feb 2023 21:04:14 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-QU880Xs5; Thu, 16 Feb 2023 21:04:13 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570653; bh=OyvAP+cr+sIZsDK+/VjfcuCfl/E3nXVANIYC8bVM7Gg=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=N6IHZT5AG4vbqnzcie9zs/wN/F82GSyN/I71ucJILYCkLO2s1Oq0sJmCbKx3d6XdU
 Wb6DvIR1ZzrUhSuOtWlkEARdjw0Q5lqGQ/QEl0t/Fcqk3D6CL7raVRAfb3nBKB5DrN
 9AMsOGSUMKjxXPwAAHuwyNwEu3thNAe9pNwKdWpI=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 15/18] qapi: add HOTPLUG_STATE infrastructure
Date: Thu, 16 Feb 2023 21:03:53 +0300
Message-Id: <20230216180356.156832-16-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c03:500:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1c.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

For PCIe and SHPC hotplug it's important to track led indicators,
especially the power led. Add an event that helps.

This commits adds infrastructure for HOTPLUG_STATE event and
corresponding query command. The implementation for PCIe and SHPC will
follow in further commits.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json         | 175 +++++++++++++++++++++++++++++++++++++++++
 include/hw/hotplug.h   |  12 +++
 include/monitor/qdev.h |   5 ++
 hw/core/hotplug.c      |  13 +++
 softmmu/qdev-monitor.c |  50 ++++++++++++
 5 files changed, 255 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 135cd81586..6f2d8d6647 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -173,3 +173,178 @@
 #
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR', 'data': 'DeviceAndPath' }
+
+##
+# @LedActivity:
+#
+# Three-state led indicator state.
+#
+# @on: Indicator is on.
+#
+# @blink: Indicator is blinking.
+#
+# @off: Indicator is off.
+#
+# Since: 8.0
+##
+{ 'enum': 'LedActivity',
+  'data': [ 'on', 'blink', 'off' ] }
+
+##
+# @HotplugSHPCSlotState:
+#
+# Standard Hot-Plug Controller slot state.
+#
+# @power-only: Slot is powered on but neither clock nor bus are connected.
+#
+# @enabled: Slot is powered on, clock and bus are connected, the card is
+#           fully functional from a hardware standpoint.
+#
+# @disabled: Slot is disabled, card is safe to be removed.
+#
+# Since: 8.0
+##
+{ 'enum': 'HotplugSHPCSlotState',
+  'data': [ 'power-only', 'enabled', 'disabled' ] }
+
+##
+# @HotplugBaseState:
+#
+# Base structure for SHPC and PCIe-native hotplug.
+#
+# @power-led: Power indicator. When power indicator is on the device is
+#             ready and accepted by guest. Off status means that device
+#             is safe to remove and blinking is an intermediate state of
+#             hot-plug or hot-unplug.
+#
+# @attention-led: Attention indicator. Off status means normal operation,
+#                 On signals about operational problem, Blinking is for
+#                 locating the slot.
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugBaseState',
+  'data': { '*power-led': 'LedActivity',
+            '*attention-led': 'LedActivity' } }
+
+##
+# @HotplugSHPCState:
+#
+# Standard Hot Plug Controller state.
+#
+# @slot-state: The slot state field of Slot Status.
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugSHPCState',
+  'base': 'HotplugBaseState',
+  'data': { '*slot-state': 'HotplugSHPCSlotState' } }
+
+##
+# @HotplugPCIeNativeState:
+#
+# PCIe Native hotplug slot state.
+#
+# @power-on: PCIe Power Controller Control of Slot Control Register.
+#            True means Power On (Power Controller Control bit is 0),
+#            False means Power Off (Power Controller Control bit is 1).
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugPCIeNativeState',
+  'base': 'HotplugBaseState',
+  'data': { '*power-on': 'bool' } }
+
+##
+# @HotplugType:
+#
+# Type of hotplug controller / provider.
+#
+# @shpc: Standard Hot Plug Controller
+#
+# @pcie-native: PCIe Native hotplug
+#
+# Since: 8.0
+##
+{ 'enum': 'HotplugType',
+  'data': ['shpc', 'pcie-native'] }
+
+##
+# @HotplugState:
+#
+# Generic hotplug slot state.
+#
+# @type: type of the hotplug (shpc or pcie-native)
+#
+# Single: 8.0
+##
+{ 'union': 'HotplugState',
+  'base': { 'type': 'HotplugType' },
+  'discriminator': 'type',
+  'data': { 'shpc': 'HotplugSHPCState',
+            'pcie-native': 'HotplugPCIeNativeState' } }
+
+##
+# @HotplugBase:
+#
+# @bus: The QOM path of the parent bus where device is hotplugged.
+#
+# @addr: The bus address for hotplugged device if applicable.
+#
+# @child: the hotplugged device's QOM path. The field absent if
+#         there is no device at the moment.
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugBase',
+  'data': { 'bus': 'DeviceAndPath',
+            '*addr': 'str',
+            'child': 'DeviceAndPath' } }
+
+##
+# @HotplugEvent:
+#
+# @changed: The hotplug controller states being changed. The state
+#           fields that are not changed are not included into @changed.
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugEvent',
+  'base': 'HotplugBase',
+  'data': { 'changed': 'HotplugState' } }
+
+##
+# @HotplugInfo:
+#
+# @state: Current hotplug controller state. All applicable fields are
+#         included into @state.
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugInfo',
+  'base': 'HotplugBase',
+  'data': { 'state': 'HotplugState' } }
+
+##
+# @HOTPLUG_STATE:
+#
+# Emitted whenever the state of hotplug controller changes.
+# Only changed values are included into event. Any change of any field
+# of the state trigger the event. Several fields are included into one
+# event if they are changed simultaneously.
+#
+# Since: 8.0
+##
+{ 'event': 'HOTPLUG_STATE',
+  'data': 'HotplugEvent' }
+
+##
+# @query-hotplug:
+#
+# Query the state of hotplug controller.
+#
+# Since: 8.0
+##
+{ 'command': 'query-hotplug',
+  'data': { 'id': 'str' },
+  'returns': 'HotplugInfo' }
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index e15f59c8b3..b82261d91e 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -13,6 +13,7 @@
 #define HOTPLUG_H
 
 #include "qom/object.h"
+#include "qapi/qapi-types-qdev.h"
 
 #define TYPE_HOTPLUG_HANDLER "hotplug-handler"
 
@@ -58,6 +59,8 @@ struct HotplugHandlerClass {
     hotplug_fn plug;
     hotplug_fn unplug_request;
     hotplug_fn unplug;
+    HotplugInfo *(*get_hotplug_state)(HotplugHandler *plug_handler,
+                                      DeviceState *plugged_dev, Error **errp);
 };
 
 /**
@@ -94,4 +97,13 @@ void hotplug_handler_unplug_request(HotplugHandler *plug_handler,
 void hotplug_handler_unplug(HotplugHandler *plug_handler,
                             DeviceState *plugged_dev,
                             Error **errp);
+
+/**
+ * hotplug_handler_get_hotplug_state:
+ *
+ * Calls #HotplugHandlerClass.get_hotplug_state callback of @plug_handler.
+ */
+HotplugInfo *hotplug_handler_get_hotplug_state(HotplugHandler *plug_handler,
+                                               DeviceState *plugged_dev,
+                                               Error **errp);
 #endif
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 1d57bf6577..a61d5f8f1f 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -1,6 +1,8 @@
 #ifndef MONITOR_QDEV_H
 #define MONITOR_QDEV_H
 
+#include "qapi/qapi-types-qdev.h"
+
 /*** monitor commands ***/
 
 void hmp_info_qtree(Monitor *mon, const QDict *qdict);
@@ -36,4 +38,7 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
  */
 const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
 
+void qdev_hotplug_state_event(DeviceState *bus, const char *addr,
+                              DeviceState *child, HotplugState *changed_state);
+
 #endif
diff --git a/hw/core/hotplug.c b/hw/core/hotplug.c
index 17ac986685..08d6d03760 100644
--- a/hw/core/hotplug.c
+++ b/hw/core/hotplug.c
@@ -57,6 +57,19 @@ void hotplug_handler_unplug(HotplugHandler *plug_handler,
     }
 }
 
+HotplugInfo *hotplug_handler_get_hotplug_state(HotplugHandler *plug_handler,
+                                               DeviceState *plugged_dev,
+                                               Error **errp)
+{
+    HotplugHandlerClass *hdc = HOTPLUG_HANDLER_GET_CLASS(plug_handler);
+
+    if (hdc->get_hotplug_state) {
+        return hdc->get_hotplug_state(plug_handler, plugged_dev, errp);
+    }
+
+    return NULL;
+}
+
 static const TypeInfo hotplug_handler_info = {
     .name          = TYPE_HOTPLUG_HANDLER,
     .parent        = TYPE_INTERFACE,
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..d1cc770d11 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -25,6 +25,7 @@
 #include "sysemu/arch_init.h"
 #include "qapi/error.h"
 #include "qapi/qapi-commands-qdev.h"
+#include "qapi/qapi-events-qdev.h"
 #include "qapi/qmp/dispatch.h"
 #include "qapi/qmp/qdict.h"
 #include "qapi/qmp/qerror.h"
@@ -956,6 +957,36 @@ void qmp_device_del(const char *id, Error **errp)
     }
 }
 
+HotplugInfo *qmp_query_hotplug(const char *id, Error **errp)
+{
+    DeviceState *dev = find_device_state(id, errp);
+    HotplugHandler *hotplug_ctrl;
+
+    if (!dev) {
+        return NULL;
+    }
+
+    if (dev->parent_bus && !qbus_is_hotpluggable(dev->parent_bus)) {
+        error_setg(errp, QERR_BUS_NO_HOTPLUG, dev->parent_bus->name);
+        return NULL;
+    }
+
+    if (!DEVICE_GET_CLASS(dev)->hotpluggable) {
+        error_setg(errp, QERR_DEVICE_NO_HOTPLUG,
+                   object_get_typename(OBJECT(dev)));
+        return NULL;
+    }
+
+    hotplug_ctrl = qdev_get_hotplug_handler(dev);
+    /*
+     * hotpluggable device MUST have HotplugHandler, if it doesn't
+     * then something is very wrong with it.
+     */
+    g_assert(hotplug_ctrl);
+
+    return hotplug_handler_get_hotplug_state(hotplug_ctrl, dev, errp);
+}
+
 void hmp_device_add(Monitor *mon, const QDict *qdict)
 {
     Error *err = NULL;
@@ -1146,3 +1177,22 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void qdev_hotplug_state_event(DeviceState *bus, const char *addr,
+                              DeviceState *child, HotplugState *changed_state)
+{
+    DeviceAndPath child_desc, bus_desc = {
+        .device = bus->id,
+        .path = bus->canonical_path,
+    };
+
+    if (child) {
+        child_desc = (DeviceAndPath) {
+            .device = child->id,
+            .path = child->canonical_path,
+        };
+    }
+
+    qapi_event_send_hotplug_state(&bus_desc, addr, child ? &child_desc : NULL,
+                                  changed_state);
+}
-- 
2.34.1


