Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 24C8C6911EA
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDx-0001f9-Qz; Thu, 09 Feb 2023 15:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDp-0001cL-Mh
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:45 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDn-0002jM-8F
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:45 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id 184985E6B9;
 Thu,  9 Feb 2023 23:08:37 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-bdPQi8fz; Thu, 09 Feb 2023 23:08:36 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973316; bh=8iV6c/j2vC5DlLdSxlYdvYM4RehP8AYMRSU4gVE43JA=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=g+UQ/8hpzRmIaDldt69qrlFGq6ve+Rt/qni25QUHMwIPK3TuBvZc4IkyKzDLsxpF5
 ldT/Rh7iSSE+K7JRFW1hxEeyKXw4ps+nu320Q97aAHIK414jiRh0flls1VvZsbaYpp
 q61L3OpkXNB3rDsu6XXKHg6U6V4MlkXTdApd8B7M=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 15/15] qapi: introduce query-hotplug command
Date: Thu,  9 Feb 2023 23:08:08 +0300
Message-Id: <20230209200808.869275-16-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209200808.869275-1-vsementsov@yandex-team.ru>
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
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

Add a command that returns same information like HOTPLUG_STATE event.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json                  | 11 +++++++
 include/hw/hotplug.h            | 12 ++++++++
 include/hw/pci/pci_bridge.h     |  2 ++
 include/hw/pci/pcie.h           |  2 ++
 include/hw/pci/shpc.h           |  2 ++
 hw/core/hotplug.c               | 13 ++++++++
 hw/pci-bridge/pci_bridge_dev.c  | 14 +++++++++
 hw/pci-bridge/pcie_pci_bridge.c |  1 +
 hw/pci/pcie.c                   | 28 +++++++++++++++++
 hw/pci/pcie_port.c              |  1 +
 hw/pci/shpc.c                   | 54 ++++++++++++++++++++++++++-------
 softmmu/qdev-monitor.c          | 30 ++++++++++++++++++
 12 files changed, 159 insertions(+), 11 deletions(-)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 94da7ca228..c3c2dfc388 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -244,3 +244,14 @@
 ##
 { 'event': 'DEVICE_ON',
   'data': { '*device': 'str', 'path': 'str' } }
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
+  'returns': 'HotplugState' }
diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index e15f59c8b3..a6ed7aa382 100644
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
+    HotplugState *(*get_hotplug_state)(HotplugHandler *plug_handler,
+                                       DeviceState *plugged_dev, Error **errp);
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
+HotplugState *hotplug_handler_get_hotplug_state(HotplugHandler *plug_handler,
+                                                DeviceState *plugged_dev,
+                                                Error **errp);
 #endif
diff --git a/include/hw/pci/pci_bridge.h b/include/hw/pci/pci_bridge.h
index 63a7521567..566cf8df7b 100644
--- a/include/hw/pci/pci_bridge.h
+++ b/include/hw/pci/pci_bridge.h
@@ -126,6 +126,8 @@ void pci_bridge_dev_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                               Error **errp);
 void pci_bridge_dev_unplug_request_cb(HotplugHandler *hotplug_dev,
                                       DeviceState *dev, Error **errp);
+HotplugState *pci_bridge_dev_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                               DeviceState *dev, Error **errp);
 
 /*
  * before qdev initialization(qdev_init()), this function sets bus_name and
diff --git a/include/hw/pci/pcie.h b/include/hw/pci/pcie.h
index 3cc2b15957..2379227a70 100644
--- a/include/hw/pci/pcie.h
+++ b/include/hw/pci/pcie.h
@@ -146,4 +146,6 @@ void pcie_cap_slot_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                              Error **errp);
 void pcie_cap_slot_unplug_request_cb(HotplugHandler *hotplug_dev,
                                      DeviceState *dev, Error **errp);
+HotplugState *pcie_cap_slot_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                              DeviceState *dev, Error **errp);
 #endif /* QEMU_PCIE_H */
diff --git a/include/hw/pci/shpc.h b/include/hw/pci/shpc.h
index 89c7a3b7fa..b68ec30a87 100644
--- a/include/hw/pci/shpc.h
+++ b/include/hw/pci/shpc.h
@@ -51,6 +51,8 @@ void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                            Error **errp);
 void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp);
+HotplugState *shpc_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp);
 
 extern VMStateInfo shpc_vmstate_info;
 #define SHPC_VMSTATE(_field, _type,  _test) \
diff --git a/hw/core/hotplug.c b/hw/core/hotplug.c
index 17ac986685..c60ab86ce2 100644
--- a/hw/core/hotplug.c
+++ b/hw/core/hotplug.c
@@ -57,6 +57,19 @@ void hotplug_handler_unplug(HotplugHandler *plug_handler,
     }
 }
 
+HotplugState *hotplug_handler_get_hotplug_state(HotplugHandler *plug_handler,
+                                                DeviceState *plugged_dev,
+                                                Error **errp)
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
index 4b2696ea7f..21bb3551f0 100644
--- a/hw/pci-bridge/pci_bridge_dev.c
+++ b/hw/pci-bridge/pci_bridge_dev.c
@@ -241,6 +241,19 @@ void pci_bridge_dev_unplug_request_cb(HotplugHandler *hotplug_dev,
     shpc_device_unplug_request_cb(hotplug_dev, dev, errp);
 }
 
+HotplugState *pci_bridge_dev_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                               DeviceState *dev, Error **errp)
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
index bc7e60ff9d..67427c0cf2 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -1161,3 +1161,31 @@ void pcie_acs_reset(PCIDevice *dev)
         pci_set_word(dev->config + dev->exp.acs_cap + PCI_ACS_CTRL, 0);
     }
 }
+
+HotplugState *pcie_cap_slot_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                              DeviceState *dev, Error **errp)
+{
+    PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
+    DeviceState *hotplug_ds = DEVICE(hotplug_pdev);
+    uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
+    uint16_t power_led = sltctl & PCI_EXP_SLTCTL_PIC;
+    uint16_t attn_led = sltctl & PCI_EXP_SLTCTL_AIC;
+    uint16_t pcc = sltctl & PCI_EXP_SLTCTL_PCC;
+    HotplugState *res = g_new(HotplugState, 1);
+
+    *res = (HotplugState) {
+        .hotplug_device = g_strdup(hotplug_ds->id),
+        .hotplug_path = g_strdup(hotplug_ds->canonical_path),
+        .device = g_strdup(dev->id),
+        .path = g_strdup(dev->canonical_path),
+        .has_power_led = true,
+        .power_led = pcie_led_state_to_qapi(power_led),
+        .has_attention_led = true,
+        .attention_led = pcie_led_state_to_qapi(attn_led),
+        .has_power = true,
+        .power = pcie_power_state_to_qapi(pcc),
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
index cce9cf19b5..4fb37a2436 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -550,8 +550,9 @@ static const MemoryRegionOps shpc_mmio_ops = {
         .max_access_size = 4,
     },
 };
-static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
-                                    SHPCDevice *shpc, Error **errp)
+
+static bool shpc_device_get_slot(PCIDevice *affected_dev, int *slot,
+                                 SHPCDevice *shpc, Error **errp)
 {
     int pci_slot = PCI_SLOT(affected_dev->devfn);
     *slot = SHPC_PCI_TO_IDX(pci_slot);
@@ -561,21 +562,20 @@ static void shpc_device_plug_common(PCIDevice *affected_dev, int *slot,
                    "controller. Valid slots are between %d and %d.",
                    pci_slot, SHPC_IDX_TO_PCI(0),
                    SHPC_IDX_TO_PCI(shpc->nslots) - 1);
-        return;
+        return false;
     }
+
+    return true;
 }
 
 void shpc_device_plug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
                             Error **errp)
 {
-    Error *local_err = NULL;
     PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
     SHPCDevice *shpc = pci_hotplug_dev->shpc;
     int slot;
 
-    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
         return;
     }
 
@@ -617,16 +617,13 @@ void shpc_device_unplug_cb(HotplugHandler *hotplug_dev, DeviceState *dev,
 void shpc_device_unplug_request_cb(HotplugHandler *hotplug_dev,
                                    DeviceState *dev, Error **errp)
 {
-    Error *local_err = NULL;
     PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
     SHPCDevice *shpc = pci_hotplug_dev->shpc;
     uint8_t state;
     uint8_t led;
     int slot;
 
-    shpc_device_plug_common(PCI_DEVICE(dev), &slot, shpc, &local_err);
-    if (local_err) {
-        error_propagate(errp, local_err);
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
         return;
     }
 
@@ -770,6 +767,41 @@ void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int l)
     shpc_cap_update_dword(d);
 }
 
+HotplugState *shpc_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                     DeviceState *dev, Error **errp)
+{
+    PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
+    DeviceState *hotplug_ds = DEVICE(pci_hotplug_dev);
+    SHPCDevice *shpc = pci_hotplug_dev->shpc;
+    int slot;
+    uint8_t state, power, attn;
+    HotplugState *res;
+
+    if (!shpc_device_get_slot(PCI_DEVICE(dev), &slot, shpc, errp)) {
+        return NULL;
+    }
+
+    state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
+    power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
+    attn = shpc_get_status(shpc, slot, SHPC_SLOT_ATTN_LED_MASK);
+
+    res = g_new(HotplugState, 1);
+    *res = (HotplugState) {
+        .hotplug_device = g_strdup(hotplug_ds->id),
+        .hotplug_path = g_strdup(hotplug_ds->canonical_path),
+        .device = g_strdup(dev->id),
+        .path = g_strdup(dev->canonical_path),
+        .has_power_led = true,
+        .power_led = shpc_led_state_to_qapi(power),
+        .has_attention_led = true,
+        .attention_led = shpc_led_state_to_qapi(attn),
+        .has_state = true,
+        .state = shpc_slot_state_to_qapi(state),
+    };
+
+    return res;
+}
+
 static int shpc_save(QEMUFile *f, void *pv, size_t size,
                      const VMStateField *field, JSONWriter *vmdesc)
 {
diff --git a/softmmu/qdev-monitor.c b/softmmu/qdev-monitor.c
index b8d2c4dadd..bd47c117dc 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -956,6 +956,36 @@ void qmp_device_del(const char *id, Error **errp)
     }
 }
 
+HotplugState *qmp_query_hotplug(const char *id, Error **errp)
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
-- 
2.34.1


