Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84E6EA85D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 12:33:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppo4E-0007bJ-Kk; Fri, 21 Apr 2023 06:32:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppo47-0007Tx-Ve
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:32:35 -0400
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ppo44-0005QM-Fc
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 06:32:31 -0400
Received: from mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 (mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net
 [IPv6:2a02:6b8:c0c:7f29:0:640:9a2b:0])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id E218661569;
 Fri, 21 Apr 2023 13:32:22 +0300 (MSK)
Received: from vsementsov-nix.yandex.net (unknown [2a02:6b8:b081:8816::1:4])
 by mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net (smtpcorp/Yandex) with
 ESMTPSA id 8WcxnS1Op4Y0-OdiaXwgj; Fri, 21 Apr 2023 13:32:21 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1682073141; bh=2rBwgjc78E9+5GRVSs2tZZND+qPNYCWt7dKeNF58fUA=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=c+ZvFCrvdKQ1sJmc1dn6aql4T5S+C7fFse4oKrLWwYbyk+bBSdw1Jop/r6DuCX/+g
 TwN4s0zDn0fblpx9h3/qkvlgRFskdP7rBN/kWp2p8nA9RscrZIUsxvR8BkuRcMt040
 CDj2jiDseqq2JJMWINf7qyzHk+H40f7QnmXlp0L4=
Authentication-Results: mail-nwsmtp-smtp-corp-main-44.iva.yp-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, philmd@linaro.org,
 antonkuchin@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v7 2/4] qapi: add DEVICE_ON and query-hotplug infrastructure
Date: Fri, 21 Apr 2023 13:32:05 +0300
Message-Id: <20230421103207.845847-3-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230421103207.845847-1-vsementsov@yandex-team.ru>
References: <20230421103207.845847-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1b.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

New query-hotplug command in additon to "device-on" state also provides
SHPC/PCIe-native specific hotplug controller properties (like leds)
that may help to determine real state of hotplug controller. That may
help to get additional information for further debugging when DEVICE_ON
/ DEVICE_DELETED not come in time as expected.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/core/hotplug.c      |  13 ++++
 include/hw/hotplug.h   |  12 ++++
 include/hw/qdev-core.h |   1 +
 include/monitor/qdev.h |   2 +
 qapi/qdev.json         | 144 +++++++++++++++++++++++++++++++++++++++++
 softmmu/qdev-monitor.c |  41 ++++++++++++
 6 files changed, 213 insertions(+)

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
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index a9840ed485..9c43e1263b 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -13,6 +13,7 @@
 #define HOTPLUG_H
 
 #include "qom/object.h"
+#include "qapi/qapi-types-qdev.h"
 
 #define TYPE_HOTPLUG_HANDLER "hotplug-handler"
 
@@ -60,6 +61,8 @@ struct HotplugHandlerClass {
     hotplug_fn unplug_request;
     hotplug_fn unplug;
     bool (*is_hotpluggable_bus)(HotplugHandler *plug_handler, BusState *bus);
+    HotplugInfo *(*get_hotplug_state)(HotplugHandler *plug_handler,
+                                      DeviceState *plugged_dev, Error **errp);
 };
 
 /**
@@ -96,4 +99,13 @@ void hotplug_handler_unplug_request(HotplugHandler *plug_handler,
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
index bd50ad5ee1..63889e41c0 100644
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
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 135cd81586..ffd20c43e0 100644
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
+# Since: 8.1
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
+# Since: 8.1
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
+# Since: 8.1
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
+# Since: 8.1
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
+# Since: 8.1
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
+# Since: 8.1
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
+# Single: 8.1
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
+# Since: 8.1
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
+# Since: 8.1
+##
+{ 'event': 'DEVICE_ON', 'data': 'DeviceAndPath' }
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


