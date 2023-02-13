Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF85694798
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:03:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZPC-0006if-OG; Mon, 13 Feb 2023 09:02:11 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOu-0006gZ-OT
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:51 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOo-0005w2-8H
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:46 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 4D9105E639;
 Mon, 13 Feb 2023 17:01:28 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-oy9BMlTC; Mon, 13 Feb 2023 17:01:27 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296887; bh=Bo13gVGwgbNxJks2SVli/0VXWctB3CE+vVVtbZSoObU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=NInyvLt/24HGj8Dq/ktcZ3biadOqH7ME45rgjFqMDX3QGTduWWjCSwROsiOo8gB43
 y0gVZnM+s8YofHvnpNordIJq4BGXYRKgkj0+PWzOr/hcCk4a6KpE0fEyn0T8BUy4tx
 C8YV6JNYss5+ATiolgYBpxhhPfS94Ehg/WJaXp68=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 15/16] qapi: add HOTPLUG_STATE event
Date: Mon, 13 Feb 2023 17:01:02 +0300
Message-Id: <20230213140103.1518173-16-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.200;
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

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json                  | 175 ++++++++++++++++++++++++++++++++
 include/hw/hotplug.h            |  12 +++
 include/hw/pci/pci.h            |   3 +
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/pcie.h           |   2 +
 include/hw/pci/shpc.h           |   2 +
 include/monitor/qdev.h          |   5 +
 hw/core/hotplug.c               |  13 +++
 hw/pci-bridge/pci_bridge_dev.c  |  14 +++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/pcie.c                   |  79 ++++++++++++++
 hw/pci/pcie_port.c              |   1 +
 hw/pci/shpc.c                   | 102 ++++++++++++++++++-
 softmmu/qdev-monitor.c          |  39 +++++++
 14 files changed, 445 insertions(+), 5 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 325ef554f9..b6ad311dd4 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -166,3 +166,178 @@
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': { 'type': 'str', 'features': [ 'deprecated' ] },
             'path': 'str' } }
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
+# @disabled: Slot is disabled, card us safe to be removed.
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
+  'data': { 'bus': 'str',
+            '*addr': 'str',
+            '*child': 'str' } }
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
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b6c9c44527..8ebd0ad51e 100644
--- a/include/hw/pci/pci.h
+++ b/include/hw/pci/pci.h
@@ -7,6 +7,9 @@
 /* PCI includes legacy ISA access.  */
 #include "hw/isa/isa.h"
 
+#include "qapi/qapi-types-qdev.h"
+#include "qapi/qapi-events-qdev.h"
+
 extern bool pci_available;
 
 /* PCI bus */
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 63a7521567..b8cb86a6f7 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -126,6 +126,8 @@ void pci_bridge_dev_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp);
 void pci_bridge_dev_unplug_request_cb(HotplugHandler *hotplug_dev,
                                       DeviceState *dev, Error **errp);
+HotplugInfo *pci_bridge_dev_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                              DeviceState *dev, Error **errp);
 
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name and
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 3cc2b15957..f755a7cacb 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -146,4 +146,6 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp);
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
+HotplugInfo *pcie_cap_slot_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                             DeviceState *dev, Error **errp);
 #endif /* QEMU_PCIE_H */
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index 89c7a3b7fa..bf722ce65d 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -51,6 +51,8 @@ void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                            Error **errp);
 void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
+HotplugInfo *shpc_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp);
 
 extern VMStateInfo shpc_vmstate_info;
 #define SHPC_VMSTATE(_field, _type,  _test) \
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
diff --git a/hw/pci-bridge/pci_bridge_dev.c b/hw/pci-bridge/pci_bridge_dev.c
index 4b2696ea7f..69ffe93e2a 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -241,6 +241,19 @@ void pci_bridge_dev_unplug_request_cb(HotplugHandler *hotplug_dev,
     shpc_device_unplug_request_cb(hotplug_dev, dev, errp);
 }
 
+HotplugInfo *pci_bridge_dev_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                              DeviceState *dev, Error **errp)
+{
+    PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
+
+    if (!shpc_present(pci_hotplug_dev)) {
+        error_setg(errp, "standard hotplug controller has been disabled for "
+                   "this %s", object_get_typename(OBJECT(hotplug_dev)));
+        return NULL;
+    }
+    return shpc_get_hotplug_state(hotplug_dev, dev, errp);
+}
+
 static void pci_bridge_dev_class_init(ObjectClass *klass, void *data)
 {
     DeviceClass *dc = DEVICE_CLASS(klass);
@@ -261,6 +274,7 @@ static void pci_bridge_dev_class_init(ObjectClass *klass, void *data)
     hc->plug = pci_bridge_dev_plug_cb;
     hc->unplug = pci_bridge_dev_unplug_cb;
     hc->unplug_request = pci_bridge_dev_unplug_request_cb;
+    hc->get_hotplug_state = pci_bridge_dev_get_hotplug_state;
 }
 
 static const TypeInfo pci_bridge_dev_info = {
diff --git a/hw/pci-bridge/pcie_pci_bridge.c b/hw/pci-bridge/pcie_pci_bridge.c
index 2301b2ca0b..959b536303 100644
--- a/hw/pci-bridge/pcie_pci_bridge.c
+++ b/hw/pci-bridge/pcie_pci_bridge.c
@@ -157,6 +157,7 @@ static void pcie_pci_bridge_class_init(ObjectClass *klass, void *data)
     hc->plug = pci_bridge_dev_plug_cb;
     hc->unplug = pci_bridge_dev_unplug_cb;
     hc->unplug_request = pci_bridge_dev_unplug_request_cb;
+    hc->get_hotplug_state = pci_bridge_dev_get_hotplug_state;
 }
 
 static const TypeInfo pcie_pci_bridge_info = {
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index b8c24cf45f..08ac37581e 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -19,6 +19,8 @@
  */
 
 #include "qemu/osdep.h"
+
+#include "monitor/qdev.h"
 #include "qapi/error.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie.h"
@@ -45,6 +47,23 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
         && (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
 }
 
+static LedActivity pcie_led_state_to_qapi(uint16_t value)
+{
+    switch (value) {
+    case PCI_EXP_SLTCTL_PWR_IND_ON:
+    case PCI_EXP_SLTCTL_ATTN_IND_ON:
+        return LED_ACTIVITY_ON;
+    case PCI_EXP_SLTCTL_PWR_IND_BLINK:
+    case PCI_EXP_SLTCTL_ATTN_IND_BLINK:
+        return LED_ACTIVITY_BLINK;
+    case PCI_EXP_SLTCTL_PWR_IND_OFF:
+    case PCI_EXP_SLTCTL_ATTN_IND_OFF:
+        return LED_ACTIVITY_OFF;
+    default:
+        abort();
+    }
+}
+
 /***************************************************************************
  * pci express capability helper functions
  */
@@ -728,9 +747,17 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                                 uint16_t old_slt_ctl, uint16_t old_slt_sta,
                                 uint32_t addr, uint32_t val, int len)
 {
+    PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(dev));
     uint32_t pos = dev->exp.exp_cap;
     uint8_t *exp_cap = dev->config + pos;
     uint16_t sltsta = pci_get_word(exp_cap + PCI_EXP_SLTSTA);
+    uint16_t power_led, attn_led, pcc, old_power_led, old_attn_led, old_pcc;
+    DeviceState *child_dev =
+        DEVICE(pci_find_the_only_child(sec_bus, pci_bus_num(sec_bus), NULL));
+    HotplugState changed_state = {
+        .type = HOTPLUG_TYPE_PCIE_NATIVE,
+    };
+    HotplugPCIeNativeState *cs = &changed_state.u.pcie_native;
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
         /*
@@ -768,6 +795,27 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                         sltsta);
     }
 
+    power_led = val & PCI_EXP_SLTCTL_PIC;
+    old_power_led = old_slt_ctl & PCI_EXP_SLTCTL_PIC;
+    cs->has_power_led = power_led != old_power_led;
+    cs->power_led = cs->has_power_led ? pcie_led_state_to_qapi(power_led) : 0;
+
+    attn_led = val & PCI_EXP_SLTCTL_AIC;
+    old_attn_led = old_slt_ctl & PCI_EXP_SLTCTL_AIC;
+    cs->has_attention_led = attn_led != old_attn_led;
+    cs->attention_led =
+        cs->has_attention_led ? pcie_led_state_to_qapi(attn_led) : 0;
+
+    pcc = val & PCI_EXP_SLTCTL_PCC;
+    old_pcc = old_slt_ctl & PCI_EXP_SLTCTL_PCC;
+    cs->has_power_on = pcc != old_pcc;
+    cs->power_on = cs->has_power_on ? pcc == PCI_EXP_SLTCTL_PWR_ON : false;
+
+
+    if (cs->has_power_led || cs->has_attention_led || cs->has_power_on) {
+        qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &changed_state);
+    }
+
     /*
      * If the slot is populated, power indicator is off and power
      * controller is off, it is safe to detach the devices.
@@ -1100,3 +1148,34 @@ void pcie_acs_reset(PCIDevice *dev)
         pci_set_word(dev->config + dev->exp.acs_cap + PCI_ACS_CTRL, 0);
     }
 }
+
+HotplugInfo *pcie_cap_slot_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                             DeviceState *dev, Error **errp)
+{
+    PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
+    DeviceState *hotplug_ds = DEVICE(hotplug_pdev);
+    uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
+    uint16_t power_led = sltctl & PCI_EXP_SLTCTL_PIC;
+    uint16_t attn_led = sltctl & PCI_EXP_SLTCTL_AIC;
+    uint16_t pcc = sltctl & PCI_EXP_SLTCTL_PCC;
+    HotplugInfo *res = g_new(HotplugInfo, 1);
+
+    *res = (HotplugInfo) {
+        .bus = g_strdup(hotplug_ds->canonical_path),
+        .child = g_strdup(dev->canonical_path),
+        .state = g_new(HotplugState, 1),
+    };
+
+    *res->state = (HotplugState) {
+        .type = HOTPLUG_TYPE_PCIE_NATIVE,
+        .u.pcie_native.has_power_led = true,
+        .u.pcie_native.power_led = pcie_led_state_to_qapi(power_led),
+        .u.pcie_native.has_attention_led = true,
+        .u.pcie_native.attention_led = pcie_led_state_to_qapi(attn_led),
+        .u.pcie_native.has_power_on = true,
+        .u.pcie_native.power_on = pcc == PCI_EXP_SLTCTL_PWR_ON,
+    };
+
+    return res;
+}
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 65a397ad23..8b28efc52d 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -188,6 +188,7 @@ static void pcie_slot_class_init(ObjectClass *oc, void *data)
     hc->plug = pcie_cap_slot_plug_cb;
     hc->unplug = pcie_cap_slot_unplug_cb;
     hc->unplug_request = pcie_cap_slot_unplug_request_cb;
+    hc->get_hotplug_state = pcie_cap_slot_get_hotplug_state;
 }
 
 static const TypeInfo pcie_slot_type_info = {
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e7bc7192f1..70447bba08 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -8,6 +8,9 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/msi.h"
+#include "qapi/qapi-types-qdev.h"
+#include "qapi/qapi-events-qdev.h"
+#include "monitor/qdev.h"
 
 /* TODO: model power only and disabled slot states. */
 /* TODO: handle SERR and wakeups */
@@ -123,6 +126,39 @@
 #define SHPC_PCI_TO_IDX(pci_slot) ((pci_slot) - 1)
 #define SHPC_IDX_TO_PHYSICAL(slot) ((slot) + 1)
 
+static char *shpc_idx_to_pci_addr(int slot)
+{
+    return g_strdup_printf("%d", SHPC_IDX_TO_PCI(slot));
+}
+
+static LedActivity shpc_led_state_to_qapi(uint8_t value)
+{
+    switch (value) {
+    case SHPC_LED_ON:
+        return LED_ACTIVITY_ON;
+    case SHPC_LED_BLINK:
+        return LED_ACTIVITY_BLINK;
+    case SHPC_LED_OFF:
+        return LED_ACTIVITY_OFF;
+    default:
+        abort();
+    }
+}
+
+static HotplugSHPCSlotState shpc_slot_state_to_qapi(uint8_t value)
+{
+    switch (value) {
+    case SHPC_STATE_PWRONLY:
+        return HOTPLUGSHPC_SLOT_STATE_POWER_ONLY;
+    case SHPC_STATE_ENABLED:
+        return HOTPLUGSHPC_SLOT_STATE_ENABLED;
+    case SHPC_STATE_DISABLED:
+        return HOTPLUGSHPC_SLOT_STATE_DISABLED;
+    default:
+        abort();
+    }
+}
+
 static uint8_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
 {
     uint8_t *status = shpc->config + SHPC_SLOT_STATUS(slot);
@@ -268,9 +304,16 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
 {
     SHPCDevice *shpc = d->shpc;
     int slot = SHPC_LOGICAL_TO_IDX(target);
+    int pci_slot = SHPC_IDX_TO_PCI(slot);
     uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
     uint8_t old_attn = shpc_get_status(shpc, slot, SHPC_SLOT_ATTN_LED_MASK);
+    HotplugState changed_state = {
+        .type = HOTPLUG_TYPE_SHPC,
+    };
+    HotplugSHPCState *cs = &changed_state.u.shpc;
+    DeviceState *child_dev =
+        DEVICE(shpc->sec_bus->devices[PCI_DEVFN(pci_slot, 0)]);
 
     if (target < SHPC_CMD_TRGT_MIN || slot >= shpc->nslots) {
         shpc_invalid_command(shpc);
@@ -284,24 +327,34 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
 
     if (power == SHPC_LED_NO) {
         power = old_power;
-    } else {
-        /* TODO: send event to monitor */
+    } else if (power != old_power) {
+        cs->has_power_led = true;
+        cs->power_led = shpc_led_state_to_qapi(power);
         shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
     }
 
     if (attn == SHPC_LED_NO) {
         attn = old_attn;
-    } else {
-        /* TODO: send event to monitor */
+    } else if (attn != old_attn) {
+        cs->has_attention_led = true;
+        cs->attention_led = shpc_led_state_to_qapi(attn);
         shpc_set_status(shpc, slot, attn, SHPC_SLOT_ATTN_LED_MASK);
     }
 
     if (state == SHPC_STATE_NO) {
         state = old_state;
-    } else {
+    } else if (state != old_state) {
+        cs->has_slot_state = true;
+        cs->slot_state = shpc_slot_state_to_qapi(state);
         shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
     }
 
+    if (cs->has_power_led || cs->has_attention_led || cs->has_slot_state) {
+        g_autofree char *addr = shpc_idx_to_pci_addr(slot);
+
+        qdev_hotplug_state_event(DEVICE(d), addr, child_dev, &changed_state);
+    }
+
     if (!shpc_slot_is_off(old_state, old_power, old_attn) &&
         shpc_slot_is_off(state, power, attn))
     {
@@ -713,6 +766,45 @@ void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int l)
     shpc_cap_update_dword(d);
 }
 
+HotplugInfo *shpc_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
+    DeviceState *hotplug_ds = DEVICE(pci_hotplug_dev);
+    SHPCDevice *shpc = pci_hotplug_dev->shpc;
+    int slot;
+    uint8_t state, power, attn;
+    HotplugInfo *res;
+
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
+        return NULL;
+    }
+
+    state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
+    power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
+    attn = shpc_get_status(shpc, slot, SHPC_SLOT_ATTN_LED_MASK);
+
+    res = g_new(HotplugInfo, 1);
+    *res = (HotplugInfo) {
+        .bus = g_strdup(hotplug_ds->canonical_path),
+        .addr = shpc_idx_to_pci_addr(slot),
+        .child = g_strdup(dev->canonical_path),
+        .state = g_new(HotplugState, 1),
+    };
+
+    *res->state = (HotplugState) {
+        .type = HOTPLUG_TYPE_SHPC,
+        .u.shpc.has_power_led = true,
+        .u.shpc.power_led = shpc_led_state_to_qapi(power),
+        .u.shpc.has_attention_led = true,
+        .u.shpc.attention_led = shpc_led_state_to_qapi(attn),
+        .u.shpc.has_slot_state = true,
+        .u.shpc.slot_state = shpc_slot_state_to_qapi(state),
+    };
+
+    return res;
+}
+
 static int shpc_save(QEMUFile *f, void *pv, size_t size,
                      const VMStateField *field, JSONWriter *vmdesc)
 {
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..95b7d34700 100644
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
@@ -1146,3 +1177,11 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     }
     return true;
 }
+
+void qdev_hotplug_state_event(DeviceState *bus, const char *addr,
+                              DeviceState *child, HotplugState *changed_state)
+{
+    qapi_event_send_hotplug_state(bus->canonical_path,
+                                  addr, child ? child->canonical_path : NULL,
+                                  changed_state);
+}
-- 
2.34.1


