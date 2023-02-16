Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3049B699BDD
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:06:18 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicK-0000FA-GU; Thu, 16 Feb 2023 13:04:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicI-0000EG-M7
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:22 -0500
Received: from forwardcorp1c.mail.yandex.net ([178.154.239.200])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicG-0005q8-Ry
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:22 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1c.mail.yandex.net (Yandex) with ESMTP id A651560153;
 Thu, 16 Feb 2023 21:04:16 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-DbdLt7Bv; Thu, 16 Feb 2023 21:04:15 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570655; bh=VH7cB3OHOb41tMa8KzVmevyAQ6J4RBo6JMPZOuTkaSM=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=pu4Nz/A6fYG6u6jep9Z0QII1YLW7ok9uYZkx9qumgbM1BvApGALGPlOHY+BIrHWOK
 LrtORcntTDY69pDICFKfgJpCTR+gbBvHEIA6raUcgKprs7nsZyQW9jDa+AGvbmzpeM
 CGm5EYRxomQnB2dr3pEWBcw6LMf2r4EhfvcRdNNA=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 17/18] pcie: implement HOTPLUG_STATE event and query-hotplug
Date: Thu, 16 Feb 2023 21:03:55 +0300
Message-Id: <20230216180356.156832-18-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230216180356.156832-1-vsementsov@yandex-team.ru>
References: <20230216180356.156832-1-vsementsov@yandex-team.ru>
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
especially the power led. At this step implement the prepared
infrastructure in PCIe.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/hw/pci/pcie.h |  2 ++
 hw/pci/pcie.c         | 78 +++++++++++++++++++++++++++++++++++++++++++
 hw/pci/pcie_port.c    |  1 +
 3 files changed, 81 insertions(+)

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
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index b8c24cf45f..636f962a23 100644
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
@@ -1100,3 +1148,33 @@ void pcie_acs_reset(PCIDevice *dev)
         pci_set_word(dev->config + dev->exp.acs_cap + PCI_ACS_CTRL, 0);
     }
 }
+
+HotplugInfo *pcie_cap_slot_get_hotplug_state(HotplugHandler *hotplug_dev,
+                                             DeviceState *dev, Error **errp)
+{
+    PCIDevice *hotplug_pdev = PCI_DEVICE(hotplug_dev);
+    uint8_t *exp_cap = hotplug_pdev->config + hotplug_pdev->exp.exp_cap;
+    uint16_t sltctl = pci_get_word(exp_cap + PCI_EXP_SLTCTL);
+    uint16_t power_led = sltctl & PCI_EXP_SLTCTL_PIC;
+    uint16_t attn_led = sltctl & PCI_EXP_SLTCTL_AIC;
+    uint16_t pcc = sltctl & PCI_EXP_SLTCTL_PCC;
+    HotplugInfo *res = g_new(HotplugInfo, 1);
+
+    *res = (HotplugInfo) {
+        .bus = qdev_new_device_and_path(DEVICE(hotplug_pdev)),
+        .child = qdev_new_device_and_path(dev),
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
-- 
2.34.1


