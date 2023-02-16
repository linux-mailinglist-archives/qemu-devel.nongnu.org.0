Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 62C68699BCA
	for <lists+qemu-devel@lfdr.de>; Thu, 16 Feb 2023 19:05:07 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pSicM-0000Fq-CI; Thu, 16 Feb 2023 13:04:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicJ-0000Ew-CF
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:23 -0500
Received: from forwardcorp1b.mail.yandex.net
 ([2a02:6b8:c02:900:1:45:d181:df01])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pSicH-0005qS-M9
 for qemu-devel@nongnu.org; Thu, 16 Feb 2023 13:04:23 -0500
Received: from iva8-99b070b76c56.qloud-c.yandex.net
 (iva8-99b070b76c56.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0c:1099:0:640:99b0:70b7])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id BC44062A6E;
 Thu, 16 Feb 2023 21:04:17 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8813::1:16])
 by iva8-99b070b76c56.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 u3q89J0Qp8c1-peyGi9TG; Thu, 16 Feb 2023 21:04:16 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676570656; bh=6LzK5JcKoqQp/AREI8ga/H9CKv30XnA168S3R/9Tv0I=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=HKQHbfXxtwmILHkkBqz/vgvEcVxfwS5v8oR7Wr3793tv8P+lfE2c4P26e0WsPm4US
 g1gpxAwtftOIyvp2Y4E4/owmPhQq1T6YNROFoGlVPAoCzxKUCdzqGj5eVsXfYfkoeh
 NDHU1C9oTYZAjw6IaR8U1knkBiNofJqnDazP0D74=
Authentication-Results: iva8-99b070b76c56.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v5 18/18] qapi: introduce DEVICE_ON event
Date: Thu, 16 Feb 2023 21:03:56 +0300
Message-Id: <20230216180356.156832-19-vsementsov@yandex-team.ru>
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

We have DEVICE_DELETED event, that signals that device_del command is
actually completed. But we don't have a counter-part for device_add.
Still it's sensible for SHPC and PCIe-native hotplug, as there are time
when the device in some intermediate state. Let's add an event that say
that the device is finally powered on, power indicator is on and
everything is OK for next manipulation on that device.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json | 10 ++++++++++
 hw/pci/pcie.c  | 14 ++++++++++++++
 hw/pci/shpc.c  | 12 ++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 6f2d8d6647..116a8a7de8 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -348,3 +348,13 @@
 { 'command': 'query-hotplug',
   'data': { 'id': 'str' },
   'returns': 'HotplugInfo' }
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
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 636f962a23..4297e4e8dc 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -22,6 +22,7 @@
 
 #include "monitor/qdev.h"
 #include "qapi/error.h"
+#include "qapi/qapi-events-qdev.h"
 #include "hw/pci/pci_bridge.h"
 #include "hw/pci/pcie.h"
 #include "hw/pci/msix.h"
@@ -47,6 +48,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
         && (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
 }
 
+static bool pcie_sltctl_powered_on(uint16_t sltctl)
+{
+    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON &&
+        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_ON &&
+        (sltctl & PCI_EXP_SLTCTL_AIC) == PCI_EXP_SLTCTL_ATTN_IND_OFF;
+}
+
 static LedActivity pcie_led_state_to_qapi(uint16_t value)
 {
     switch (value) {
@@ -816,6 +824,12 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &changed_state);
     }
 
+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
+        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
+    {
+        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
+    }
+
     /*
      * If the slot is populated, power indicator is off and power
      * controller is off, it is safe to detach the devices.
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 6a4f93949d..380b2b83b3 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -299,6 +299,12 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
     return state == SHPC_STATE_DISABLED && power == SHPC_LED_OFF;
 }
 
+static bool shpc_slot_is_on(uint8_t state, uint8_t power, uint8_t attn)
+{
+    return state == SHPC_STATE_ENABLED && power == SHPC_LED_ON &&
+        attn == SHPC_LED_OFF;
+}
+
 static void shpc_slot_command(PCIDevice *d, uint8_t target,
                               uint8_t state, uint8_t power, uint8_t attn)
 {
@@ -366,6 +372,12 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
             SHPC_SLOT_EVENT_MRL |
             SHPC_SLOT_EVENT_PRESENCE;
     }
+
+    if (!shpc_slot_is_on(old_state, old_power, old_attn) &&
+        shpc_slot_is_on(state, power, attn) && child_dev)
+    {
+        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
+    }
 }
 
 static void shpc_command(PCIDevice *d)
-- 
2.34.1


