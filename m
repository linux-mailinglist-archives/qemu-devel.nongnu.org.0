Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 203A96911E7
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Feb 2023 21:09:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pQDDz-0001gc-1E; Thu, 09 Feb 2023 15:08:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDq-0001cr-GO
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:46 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pQDDn-0002j9-GS
 for qemu-devel@nongnu.org; Thu, 09 Feb 2023 15:08:46 -0500
Received: from myt5-8800bd68420f.qloud-c.yandex.net
 (myt5-8800bd68420f.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:4615:0:640:8800:bd68])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id EAC6461C5D;
 Thu,  9 Feb 2023 23:08:35 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6518::1:1])
 by myt5-8800bd68420f.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 A8lCI60OTGk1-LTuA0rbT; Thu, 09 Feb 2023 23:08:35 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1675973315; bh=wuxw4m3aS/CxFzYuJG41QbEdShNl70VxWIdILZrdVFI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=lNOtVYLM/AXwPW0InSzpBS9a2WD5cZ+FcZWxKzkY3EUhJv1w72RPeJiIBCOl4JVdx
 KsguZEnU9ULWC5a3o80HcCb5moRAcNltBIeX5H0ryP2BPUYWSJfoxObdI6nJWUpHAO
 7SiInpt5oE55qP/J8mp1fD4XKvUYGG+LW0Mp1YQ4=
Authentication-Results: myt5-8800bd68420f.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, vsementsov@yandex-team.ru, den-plotnikov@yandex-team.ru
Subject: [PATCH v3 14/15] qapi: introduce DEVICE_ON event
Date: Thu,  9 Feb 2023 23:08:07 +0300
Message-Id: <20230209200808.869275-15-vsementsov@yandex-team.ru>
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

We have DEVICE_DELETED event, that signals that device_del command is
actually complited. But we don't have a counter-part for device_add.
Still it's sensible for SHPC and PCIe-native hotplug, as there are time
when the device in some intermediate state. Let's add an event that say
that the device is finally powered on, power indicator is on and
everything is OK for next manipulation on that device.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json | 24 ++++++++++++++++++++++++
 hw/pci/pcie.c  | 12 ++++++++++++
 hw/pci/shpc.c  | 12 ++++++++++++
 3 files changed, 48 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index 40dc34f091..94da7ca228 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -220,3 +220,27 @@
 ##
 { 'event': 'HOTPLUG_STATE',
   'data': 'HotplugState' }
+
+
+##
+# @DEVICE_ON:
+#
+# Emitted whenever the device insertion completion is acknowledged by the guest.
+# For now only emitted for SHPC and PCIe-native hotplug.
+#
+# @device: device name
+#
+# @path: device path
+#
+# Since: 8.0
+#
+# Example:
+#
+# <- { "event": "DEVICE_ON",
+#      "data": { "device": "virtio-net-pci-0",
+#                "path": "/machine/peripheral/virtio-net-pci-0" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'DEVICE_ON',
+  'data': { '*device': 'str', 'path': 'str' } }
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 37e2979b3c..bc7e60ff9d 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -45,6 +45,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
         (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_OFF;
 }
 
+static bool pcie_sltctl_powered_on(uint16_t sltctl)
+{
+    return (sltctl & PCI_EXP_SLTCTL_PCC) == PCI_EXP_SLTCTL_PWR_ON &&
+        (sltctl & PCI_EXP_SLTCTL_PIC) == PCI_EXP_SLTCTL_PWR_IND_ON &&
+        (sltctl & PCI_EXP_SLTCTL_AIC) == PCI_EXP_SLTCTL_ATTN_IND_OFF;
+}
+
 static HotplugLedState pcie_led_state_to_qapi(uint16_t value)
 {
     switch (value) {
@@ -816,6 +823,11 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
                             0, 0, /* no state */
                             pcie_power_state_to_qapi(old_pcc),
                             pcie_power_state_to_qapi(pcc));
+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
+        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
+    {
+        qapi_event_send_device_on(child_dev->id, child_dev->canonical_path);
+    }
 
     /*
      * If the slot is populated, power indicator is off and power
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 3c62d6b054..cce9cf19b5 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -293,6 +293,12 @@ static bool shpc_slot_is_off(uint8_t state, uint8_t power, uint8_t attn)
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
@@ -355,6 +361,12 @@ static void shpc_slot_command(PCIDevice *d, uint8_t target,
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


