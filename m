Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 189196947A8
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Feb 2023 15:05:59 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pRZPL-000705-D2; Mon, 13 Feb 2023 09:02:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOu-0006gb-P3
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:51 -0500
Received: from forwardcorp1b.mail.yandex.net ([178.154.239.136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1pRZOo-0005wA-8p
 for qemu-devel@nongnu.org; Mon, 13 Feb 2023 09:01:45 -0500
Received: from myt6-23a5e62c0090.qloud-c.yandex.net
 (myt6-23a5e62c0090.qloud-c.yandex.net
 [IPv6:2a02:6b8:c12:1da3:0:640:23a5:e62c])
 by forwardcorp1b.mail.yandex.net (Yandex) with ESMTP id 489606149F;
 Mon, 13 Feb 2023 17:01:29 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:6527::1:3a])
 by myt6-23a5e62c0090.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 51j9w00QYCg1-a0CJMT1s; Mon, 13 Feb 2023 17:01:28 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1676296888; bh=yzDhgcNkqICMbL34gOlg3udb8Nz2rfVgiYTAETF4QKU=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=bRYzP2hRWf1udenLnacfFbiKEbdKRztPW77kcjS+/ojvQPqobkeGUnwgTN9yhUbyQ
 1N0SU4u5VNPr8V0ESgt/xz9V+Fs6MGwH3PfrfToZtrWKmVlQiSjXwsVVvvucRuzp2V
 586/4VoQEfgtjCAkH0zrsXFa7Y18MT57mnLVaOfE=
Authentication-Results: myt6-23a5e62c0090.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: armbru@redhat.com, eblake@redhat.com, eduardo@habkost.net,
 berrange@redhat.com, pbonzini@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, philmd@linaro.org, vsementsov@yandex-team.ru,
 den-plotnikov@yandex-team.ru, antonkuchin@yandex-team.ru
Subject: [PATCH v4 16/16] qapi: introduce DEVICE_ON event
Date: Mon, 13 Feb 2023 17:01:03 +0300
Message-Id: <20230213140103.1518173-17-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
References: <20230213140103.1518173-1-vsementsov@yandex-team.ru>
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
actually completed. But we don't have a counter-part for device_add.
Still it's sensible for SHPC and PCIe-native hotplug, as there are time
when the device in some intermediate state. Let's add an event that say
that the device is finally powered on, power indicator is on and
everything is OK for next manipulation on that device.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 qapi/qdev.json | 13 +++++++++++++
 hw/pci/pcie.c  | 13 +++++++++++++
 hw/pci/shpc.c  | 12 ++++++++++++
 3 files changed, 38 insertions(+)

diff --git a/qapi/qdev.json b/qapi/qdev.json
index b6ad311dd4..2143bb2792 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -341,3 +341,16 @@
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
+# @path: the hotplugged device's QOM path
+#
+# Since: 8.0
+##
+{ 'event': 'DEVICE_ON',
+  'data': { 'path': 'str' } }
diff --git a/hw/pci/pcie.c b/hw/pci/pcie.c
index 08ac37581e..efa90e9e6e 100644
--- a/hw/pci/pcie.c
+++ b/hw/pci/pcie.c
@@ -47,6 +47,13 @@ static bool pcie_sltctl_powered_off(uint16_t sltctl)
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
@@ -816,6 +823,12 @@ void pcie_cap_slot_write_config(PCIDevice *dev,
         qdev_hotplug_state_event(DEVICE(dev), NULL, child_dev, &changed_state);
     }
 
+    if ((sltsta & PCI_EXP_SLTSTA_PDS) && pcie_sltctl_powered_on(val) &&
+        !pcie_sltctl_powered_on(old_slt_ctl) && child_dev)
+    {
+        qapi_event_send_device_on(child_dev->canonical_path);
+    }
+
     /*
      * If the slot is populated, power indicator is off and power
      * controller is off, it is safe to detach the devices.
diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index 70447bba08..105be8f1c1 100644
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
+        qapi_event_send_device_on(child_dev->canonical_path);
+    }
 }
 
 static void shpc_command(PCIDevice *d)
-- 
2.34.1


