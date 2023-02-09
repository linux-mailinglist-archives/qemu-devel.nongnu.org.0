Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BB4006911EE
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:10:11 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDx-0001el-FH; Thu, 09 Feb 2023 15:08:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDp-0001cQ-Ps
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:45 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDn-0002ip-Ed
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:45 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id F399F61C2D;
 Thu,  9 Feb 2023 23:08:34 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-lPO6Ujrb; Thu, 09 Feb 2023 23:08:34 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973314; bh=iyn4nbke5GIAljYsZK/MS0nRcNZ7kRP3DJVSY/W+SVw=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=R6gXbSMaWjKfp90U7iR5XWQjSLgsX+e0PPhVgk4QskqUbPpuff7eiRPZO40vA5mJe
 9QUhBRRZbMKMg2LmQs/cS0yOPnzzVPzJOEjyH2pt0JMvCUIaERY51gZXiHhz1fBGQb
 98OMqt1TjT3h1ad7bUZv8GmarGPN2FYzRf/lFB08=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 13/15] qapi: add HOTPLUG_STATE event
Date: Thu,  9 Feb 2023 23:08:06 +0300
Message-Id: <20230209200808.869275-14-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230209200808.869275-1-vsementsov@yandex-team.ru>
References: <20230209200808.869275-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.136;
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
especially the power led. Add an event that helps.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json       | 62 ++++++++++++++++++++++++++++++++++++++++++++
 include/hw/pci/pci.h | 15 +++++++++++
 hw/pci/pci.c         | 33 +++++++++++++++++++++++
 hw/pci/pcie.c        | 49 ++++++++++++++++++++++++++++++++++
 hw/pci/shpc.c        | 42 ++++++++++++++++++++++++++++++
 5 files changed, 201 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2708fb4e99..40dc34f091 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -158,3 +158,65 @@
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @HotplugLedState:
+#
+# Since: 8.0
+##
+{ 'enum': 'HotplugLedState',
+  'data': [ 'on', 'blink', 'off' ] }
+
+##
+# @HotplugPowerState:
+#
+# Since: 8.0
+##
+{ 'enum': 'HotplugPowerState',
+  'data': [ 'on', 'off' ] }
+
+##
+# @HotplugSlotState:
+#
+# Since: 8.0
+##
+{ 'enum': 'HotplugSlotState',
+  'data': [ 'power-only', 'enabled', 'disabled' ] }
+
+##
+# @HotplugState:
+#
+# @hotplug-device: hotplug device id
+# @hotplug-path: hotplug device path
+# @hotplug-slot: hotplug device slot (only for SHPC)
+# @device: device name
+# @path: device path
+# @power-led: Power Indicator
+# @attention-led: Attention Indicator
+# @state: slot state, only for SHPC hotplug controller
+# @power: Power Controller state, only for PCIe hotplug
+#
+# Since: 8.0
+##
+{ 'struct': 'HotplugState',
+  'data': { '*hotplug-device': 'str',
+            'hotplug-path': 'str',
+            '*hotplug-slot': 'int',
+            '*device': 'str',
+            'path': 'str',
+            '*power-led': 'HotplugLedState',
+            '*attention-led': 'HotplugLedState',
+            '*state': 'HotplugSlotState',
+            '*power': 'HotplugPowerState' } }
+
+##
+# @HOTPLUG_STATE:
+#
+# Emitted whenever the state of hotplug controller is changed.
+# Only changed values are included into event.
+# Only SHPC and PCIe-native hotplug are supported.
+#
+# Since: 8.0
+##
+{ 'event': 'HOTPLUG_STATE',
+  'data': 'HotplugState' }
diff --git a/include/hw/pci/pci.h b/include/hw/pci/pci.h
index b6c9c44527..900e22a7d3 100644
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
@@ -611,4 +614,16 @@ static inline void pci_irq_pulse(PCIDevice *pci_dev)
 MSIMessage pci_get_msi_message(PCIDevice *dev, int vector);
 void pci_set_power(PCIDevice *pci_dev, bool state);
 
+void pci_hotplug_state_event(DeviceState *hotplug_dev,
+                             bool has_slot, int64_t slot,
+                             DeviceState *dev,
+                             HotplugLedState power_led_old,
+                             HotplugLedState power_led_new,
+                             HotplugLedState attention_led_old,
+                             HotplugLedState attention_led_new,
+                             HotplugSlotState state_old,
+                             HotplugSlotState state_new,
+                             HotplugPowerState power_old,
+                             HotplugPowerState power_new);
+
 #endif
diff --git a/hw/pci/pci.c b/hw/pci/pci.c
index 34fd1fb5b8..b7374d3d66 100644
--- a/hw/pci/pci.c
+++ b/hw/pci/pci.c
@@ -2772,6 +2772,39 @@ void pci_set_power(PCIDevice *d, bool state)
     }
 }
 
+void pci_hotplug_state_event(DeviceState *hotplug_dev,
+                             bool has_slot, int64_t slot,
+                             DeviceState *dev,
+                             HotplugLedState power_led_old,
+                             HotplugLedState power_led_new,
+                             HotplugLedState attention_led_old,
+                             HotplugLedState attention_led_new,
+                             HotplugSlotState state_old,
+                             HotplugSlotState state_new,
+                             HotplugPowerState power_old,
+                             HotplugPowerState power_new)
+{
+    bool pwr_led = power_led_new != power_led_old;
+    bool attn_led = attention_led_new != attention_led_old;
+    bool state = state_new != state_old;
+    bool pwr = power_new != power_old;
+
+    if (!(pwr_led || attn_led || state || pwr)) {
+        /* No changes - no event */
+        return;
+    }
+
+    qapi_event_send_hotplug_state(hotplug_dev->id,
+                                  hotplug_dev->canonical_path,
+                                  has_slot, slot,
+                                  dev ? dev->id : NULL,
+                                  dev ? dev->canonical_path : NULL,
+                                  pwr_led, power_led_new,
+                                  attn_led, attention_led_new,
+                                  state, state_new,
+                                  pwr, power_new);
+}
+
 static const TypeInfo pci_device_type_info = {
     .name = TYPE_PCI_DEVICE,
     .parent = TYPE_DEVICE,
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 774ce85619..37e2979b3c 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -45,6 +45,35 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
         (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
 }
 
+static HotplugLedState pcie_led_state_to_qapi(uint16_t value)
+{
+    switch (value) {
+    case PCI_EXP_SLTCTL_PWR_IND_ON:
+    case PCI_EXP_SLTCTL_ATTN_IND_ON:
+        return HOTPLUG_LED_STATE_ON;
+    case PCI_EXP_SLTCTL_PWR_IND_BLINK:
+    case PCI_EXP_SLTCTL_ATTN_IND_BLINK:
+        return HOTPLUG_LED_STATE_BLINK;
+    case PCI_EXP_SLTCTL_PWR_IND_OFF:
+    case PCI_EXP_SLTCTL_ATTN_IND_OFF:
+        return HOTPLUG_LED_STATE_OFF;
+    default:
+        abort();
+    }
+}
+
+static HotplugPowerState pcie_power_state_to_qapi(uint16_t value)
+{
+    switch (value) {
+    case PCI_EXP_SLTCTL_PWR_ON:
+        return HOTPLUG_POWER_STATE_ON;
+    case PCI_EXP_SLTCTL_PWR_OFF:
+        return HOTPLUG_POWER_STATE_OFF;
+    default:
+        abort();
+    }
+}
+
 /***************************************************************************
  * pci express capability helper functions
  */
@@ -728,9 +757,13 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
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
 
     if (ranges_overlap(addr, len, pos + PCI_EXP_SLTSTA, 2)) {
         /*
@@ -768,6 +801,22 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                         sltsta);
     }
 
+    power_led = val & PCI_EXP_SLTCTL_PIC;
+    attn_led = val & PCI_EXP_SLTCTL_AIC;
+    pcc = val & PCI_EXP_SLTCTL_PCC;
+    old_power_led = old_slt_ctl & PCI_EXP_SLTCTL_PIC;
+    old_attn_led = old_slt_ctl & PCI_EXP_SLTCTL_AIC;
+    old_pcc = old_slt_ctl & PCI_EXP_SLTCTL_PCC;
+
+    pci_hotplug_state_event(DEVICE(dev), false, 0, child_dev,
+                            pcie_led_state_to_qapi(old_power_led),
+                            pcie_led_state_to_qapi(power_led),
+                            pcie_led_state_to_qapi(old_attn_led),
+                            pcie_led_state_to_qapi(attn_led),
+                            0, 0, /* no state */
+                            pcie_power_state_to_qapi(old_pcc),
+                            pcie_power_state_to_qapi(pcc));
+
     /*
      * If the slot is populated, power indicator is off and power
      * controller is off, it is safe to detach the devices.
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 9f964b1d70..3c62d6b054 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -8,6 +8,8 @@
 #include "hw/pci/pci.h"
 #include "hw/pci/pci_bus.h"
 #include "hw/pci/msi.h"
+#include "qapi/qapi-types-qdev.h"
+#include "qapi/qapi-events-qdev.h"
 
 /* TODO: model power only and disabled slot states. */
 /* TODO: handle SERR and wakeups */
@@ -123,6 +125,34 @@
 #define SHPC_PCI_TO_IDX(pci_slot) ((pci_slot) - 1)
 #define SHPC_IDX_TO_PHYSICAL(slot) ((slot) + 1)
 
+static HotplugLedState shpc_led_state_to_qapi(uint8_t value)
+{
+    switch (value) {
+    case SHPC_LED_ON:
+        return HOTPLUG_LED_STATE_ON;
+    case SHPC_LED_BLINK:
+        return HOTPLUG_LED_STATE_BLINK;
+    case SHPC_LED_OFF:
+        return HOTPLUG_LED_STATE_OFF;
+    default:
+        abort();
+    }
+}
+
+static HotplugSlotState shpc_slot_state_to_qapi(uint8_t value)
+{
+    switch (value) {
+    case SHPC_STATE_PWRONLY:
+        return HOTPLUG_SLOT_STATE_POWER_ONLY;
+    case SHPC_STATE_ENABLED:
+        return HOTPLUG_SLOT_STATE_ENABLED;
+    case SHPC_STATE_DISABLED:
+        return HOTPLUG_SLOT_STATE_DISABLED;
+    default:
+        abort();
+    }
+}
+
 static uint8_t shpc_get_status(SHPCDevice *shpc, int slot, uint16_t msk)
 {
     uint8_t *status = shpc->config + SHPC_SLOT_STATUS(slot);
@@ -268,9 +298,12 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
 {
     SHPCDevice *shpc = d->shpc;
     int slot = SHPC_LOGICAL_TO_IDX(target);
+    int pci_slot = SHPC_IDX_TO_PCI(slot);
     uint8_t old_state = shpc_get_status(shpc, slot, SHPC_SLOT_STATE_MASK);
     uint8_t old_power = shpc_get_status(shpc, slot, SHPC_SLOT_PWR_LED_MASK);
     uint8_t old_attn = shpc_get_status(shpc, slot, SHPC_SLOT_ATTN_LED_MASK);
+    DeviceState *child_dev =
+        DEVICE(shpc->sec_bus->devices[PCI_DEVFN(pci_slot, 0)]);
 
     if (target < SHPC_CMD_TRGT_MIN || slot >= shpc->nslots) {
         shpc_invalid_command(shpc);
@@ -302,6 +335,15 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
         shpc_set_status(shpc, slot, state, SHPC_SLOT_STATE_MASK);
     }
 
+    pci_hotplug_state_event(DEVICE(d), true, SHPC_IDX_TO_PCI(slot), child_dev,
+                            shpc_led_state_to_qapi(old_power),
+                            shpc_led_state_to_qapi(power ?: old_power),
+                            shpc_led_state_to_qapi(old_attn),
+                            shpc_led_state_to_qapi(attn ?: old_attn),
+                            shpc_slot_state_to_qapi(old_state),
+                            shpc_slot_state_to_qapi(state ?: old_state),
+                            0, 0 /* no PCC */);
+
     if (!shpc_slot_is_off(old_state, old_power, old_attn) &&
         shpc_slot_is_off(state, power, attn))
     {
-- 
2.34.1


