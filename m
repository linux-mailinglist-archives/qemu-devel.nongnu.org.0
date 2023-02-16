Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 88F67699BD9
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:06:12 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicK-0000FC-Ly; Thu, 16 Feb 2023 13:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicI-0000CV-8g
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:22 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicG-0005pw-7J
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:21 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id A2A1C62A6A;
 Thu, 16 Feb 2023 21:04:15 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-cue6GkBm; Thu, 16 Feb 2023 21:04:14 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570654; bh=0Ns0Dm8+dRFEZWzommPVlRJ5i+t3D8sggsA9XHOWcFI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=HbrtPQttYUgn/b8tRWaIHYUoO8oWElFKg98eK6c3NM/ZCTalR4bx5thScAv2lSrIF
 mPfkbfqYhj9jWJlsOySsxRQMgTKRLJBZ3g0SGg5V6uAVFK5NdDewFu4+vmhqbJj1IZ
 Ge7X3H6YhMXG9jsFOQMPiebtn4HQElogvdVHvDNY=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 16/18] shpc: implement HOTPLUG_STATE event and query-hotplug
Date: Thu, 16 Feb 2023 21:03:54 +0300
Message-Id: <20230216180356.156832-17-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
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

For PCIe and SHPC hotplug it's important to track led indicators,
especially the power led.

At this step, implement the prepared infrastructure in SHPC.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/hw/pci/pci_bridge.h     |   2 +
 include/hw/pci/shpc.h           |   2 +
 include/monitor/qdev.h          |   2 +
 hw/pci-bridge/pci_bridge_dev.c  |  14 +++++
 hw/pci-bridge/pcie_pci_bridge.c |   1 +
 hw/pci/shpc.c                   | 101 ++++++++++++++++++++++++++++++--
 softmmu/qdev-monitor.c          |  17 ++++++
 7 files changed, 134 insertions(+), 5 deletions(-)

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
index a61d5f8f1f..780e64bcdc 100644
--- a/include/monitor/qdev.h
+++ b/include/monitor/qdev.h
@@ -41,4 +41,6 @@ const char *qdev_set_id(DeviceState *dev, char *id, Error **errp);
 void qdev_hotplug_state_event(DeviceState *bus, const char *addr,
                               DeviceState *child, HotplugState *changed_state);
 
+DeviceAndPath *qdev_new_device_and_path(DeviceState *dev);
+
 #endif
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
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e7bc7192f1..6a4f93949d 100644
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
@@ -713,6 +766,44 @@ void shpc_cap_write_config(PCIDevice *d, uint32_t addr, uint32_t val, int l)
     shpc_cap_update_dword(d);
 }
 
+HotplugInfo *shpc_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                    DeviceState *dev, Error **errp)
+{
+    PCIDevice *pci_hotplug_dev = PCI_DEVICE(hotplug_dev);
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
+        .bus = qdev_new_device_and_path(DEVICE(pci_hotplug_dev)),
+        .addr = shpc_idx_to_pci_addr(slot),
+        .child = qdev_new_device_and_path(dev),
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
index d1cc770d11..adbba2b8d3 100644
--- a/softmmu/qdev-monitor.c
+++ b/softmmu/qdev-monitor.c
@@ -1178,6 +1178,23 @@ bool qmp_command_available(const QmpCommand *cmd, Error **errp)
     return true;
 }
 
+DeviceAndPath *qdev_new_device_and_path(DeviceState *dev)
+{
+    DeviceAndPath *res;
+
+    if (!dev) {
+        return NULL;
+    }
+
+    res = g_new(DeviceAndPath, 1);
+    *res = (DeviceAndPath) {
+        .device = g_strdup(dev->id),
+        .path = g_strdup(dev->canonical_path),
+    };
+
+    return res;
+}
+
 void qdev_hotplug_state_event(DeviceState *bus, const char *addr,
                               DeviceState *child, HotplugState *changed_state)
 {
-- 
2.34.1


