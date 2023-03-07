Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AF3796AE5EB
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Mar 2023 17:07:35 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pZZpF-0005ST-A8; Tue, 07 Mar 2023 11:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZZpA-0005Qt-Ks
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:06:01 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pZZp7-0002Sm-By
 for qemu-devel@nongnu.org; Tue, 07 Mar 2023 11:06:00 -0500
Received: from mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net
 [IPv6:2a02:6b8:c12:5da4:0:640:ef2d:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 8B8C9608D0;
 Tue,  7 Mar 2023 19:05:50 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:1223::1:36])
 by mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id d5eRk00OeKo0-2wYM5OQC; Tue, 07 Mar 2023 19:05:49 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1678205149; bh=imMF1bPfQoH0wNGQMIIAc5Z45ST3KT1vMXdJ36fPlTo=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=y2vYzKlfu0bfrleLh0FFsI4A4L7VqwVudpdvTp7NqVQWuVLHdLjMd9FEaEm5WuiqK
 997KdjNr/5kOntLhkmWqw4ZUSZx4zIp//QQyDYwJnd9ylub1TWeowQIE85eSZDDOh8
 OzCisJoN2epLb2kgoyloHKGBTnLgDpa/tmrpFGQc=
Authentication-Results: mail-nwsmtp-smtp-corp-main-26.myt.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru,
 vsementsov@yandex-team.ru, philmd@linaro.org
Subject: [PATCH v6 2/4] qapi: add DEVICE_ON and query-hotplug infrastructure
Date: Tue,  7 Mar 2023 19:05:35 +0300
Message-Id: <20230307160537.2261803-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
References: <20230307160537.2261803-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:c02:900:1:45:d181:df01;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
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

We have DEVICE_DELETED event, that signals that device_del command is
actually completed. But we don't have a counter-part for device_add.
Still it's sensible for SHPC and PCIe-native hotplug, as there are time
when the device in some intermediate state. Let's add an event that say
that the device is finally powered on, power indicator is on and
everything is OK for next manipulation on that device.

Motivations:
1. To be sure that device is "accepted" by guest. Guest may ignore
hotplugged device for some reason (for example during OS booting).
Management wants to catch this and handle the problem, instead of
silent assume that everything is OK. So, if we don't get the event by
some timeout, we can report an error, try to unplug/plug the disk again
or do some other things to handle the problem.

2. The device can't be removed (by blockdev-del) while power indicator
of hotplug controller is blinking (QEMU reports "guest is busy (power
indicator blinking)"). So, management should avoid removing the device
until it gets the DEVICE_ON event.
(Probably, better solution for this point is to automatically postpone
deletion until power indicator stops blinking)

3. Also, management tool may make a GUI visualization of power
indicator with help of this event.

As a counter-part add query-hotplug command, that shows "device-on"
state as well as some addtional information.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json         | 144 +++++++++++++++++++++++++++++++++++++++++
 include/hw/hotplug.h   |  12 ++++
 include/hw/qdev-core.h |   1 +
 include/monitor/qdev.h |   2 +
 hw/core/hotplug.c      |  13 ++++
 softmmu/qdev-monitor.c |  41 ++++++++++++
 6 files changed, 213 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 135cd81586..e37286da78 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -173,3 +173,147 @@
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
+# @HotplugInfo:
+#
+# Generic hotplug slot state.
+#
+# @type: type of the hotplug (shpc or pcie-native)
+#
+# @bus: The QOM path of the parent bus where device is hotplugged.
+#
+# @addr: The bus address for hotplugged device if applicable.
+#
+# @child: the hotplugged device
+#
+# @device-on: Device is powered-on by guest. This state changes at most
+#             once for the device and corresponds to DEVICE_ON event.
+#
+# Single: 8.0
+##
+{ 'union': 'HotplugInfo',
+  'base': { 'type': 'HotplugType',
+            'bus': 'DeviceAndPath',
+            '*addr': 'str',
+            'child': 'DeviceAndPath',
+            'device-on': 'bool' },
+  'discriminator': 'type',
+  'data': { 'shpc': 'HotplugSHPCState',
+            'pcie-native': 'HotplugPCIeNativeState' } }
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
+
+##
+# @DEVICE_ON:
+#
+# Emitted whenever the device insertion completion is acknowledged by the guest.
+# For now only emitted for SHPC and PCIe-native hotplug.
+#
+# Since: 8.0
+##
+{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
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
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f5b3b2f89a..dc2f91a2e2 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -180,6 +180,7 @@ struct DeviceState {
     char *id;
     char *canonical_path;
     bool realized;
+    bool device_on_sent; /* set once by SHPC or PCIE-hotplug */
     bool pending_deleted_event;
     int64_t pending_deleted_expires_ms;
     QDict *opts;
diff --git a/include/monitor/qdev.h b/include/monitor/qdev.h
index 1d57bf6577..c1c8798e89 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -36,4 +36,6 @@ DeviceState *qdev_device_add_from_qdict(const QDict *opts,
  */
 const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
 
+void qdev_hotplug_device_on_event(DeviceState *dev);
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
index b8d2c4dadd..e4956bbd94 100644
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
@@ -1146,3 +1177,13 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void qdev_hotplug_device_on_event(DeviceState *dev)
+{
+    if (dev->device_on_sent) {
+        return;
+    }
+
+    dev->device_on_sent = true;
+    qapi_event_send_device_on(dev->id, dev->canonical_path);
+}
-- 
2.34.1


