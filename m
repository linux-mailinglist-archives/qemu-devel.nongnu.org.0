Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 13B7062C3AE
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovL2E-0007gS-3L; Wed, 16 Nov 2022 11:13:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovL26-0007fn-R5
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:13:02 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovL25-0000ey-85
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:13:02 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id AC52F600F5;
 Wed, 16 Nov 2022 19:12:45 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8128::1:3])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6qDkL1QYoB-CjO0pUUi; Wed, 16 Nov 2022 19:12:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668615165; bh=pXL2EsPAT+iu0OJdzb46Em8htiMdE0Ui/fug/j2J5HI=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=Qqi19rsxBMEoDiY/v5LqhDhpO+ultO3rmWxAwY+9m4dJh79dYt6R2S9Fo1eFg7ktN
 DBc1RBYqsiaf/nYBYpZn4vBBarPrIcasCQH7Z60a/Iiv3TSgyvEhtGw12ePIu7b4JZ
 O7g+NfZ14qnBQ1rvFl7n7yaPugp24mVhq3Af+2xA=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru, vsementsov@yandex-team.ru
Subject: [PATCH 1/2] hw/pci/shpc: introduce FOR_EACH_DEVICE_IN_SLOT
Date: Wed, 16 Nov 2022 19:12:33 +0300
Message-Id: <20221116161234.44206-2-vsementsov@yandex-team.ru>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221116161234.44206-1-vsementsov@yandex-team.ru>
References: <20221116161234.44206-1-vsementsov@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=178.154.239.72;
 envelope-from=vsementsov@yandex-team.ru; helo=forwardcorp1a.mail.yandex.net
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

Introduce a macro to loop through devices like in
shpc_free_devices_in_slot(), as we are going to add one more similar
function.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/shpc.c | 37 ++++++++++++++++++++++++++++---------
 1 file changed, 28 insertions(+), 9 deletions(-)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index e71f3a7483..ba241e2818 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -236,22 +236,41 @@ static void shpc_invalid_command(SHPCDevice *shpc)
                                SHPC_CMD_STATUS_INVALID_CMD);
 }
 
-static void shpc_free_devices_in_slot(SHPCDevice *shpc, int slot)
+static PCIDevice *shpc_next_device_in_slot(SHPCDevice *shpc, int slot,
+                                           int *start_devfn)
 {
-    HotplugHandler *hotplug_ctrl;
     int devfn;
     int pci_slot = SHPC_IDX_TO_PCI(slot);
-    for (devfn = PCI_DEVFN(pci_slot, 0);
+
+    for (devfn = *start_devfn ?: PCI_DEVFN(pci_slot, 0);
          devfn <= PCI_DEVFN(pci_slot, PCI_FUNC_MAX - 1);
          ++devfn) {
-        PCIDevice *affected_dev = shpc->sec_bus->devices[devfn];
-        if (affected_dev) {
-            hotplug_ctrl = qdev_get_hotplug_handler(DEVICE(affected_dev));
-            hotplug_handler_unplug(hotplug_ctrl, DEVICE(affected_dev),
-                                   &error_abort);
-            object_unparent(OBJECT(affected_dev));
+        PCIDevice *dev = shpc->sec_bus->devices[devfn];
+        if (dev) {
+            *start_devfn = devfn + 1; /* for next iteration */
+            return dev;
         }
     }
+
+    return NULL;
+}
+
+#define FOR_EACH_DEVICE_IN_SLOT(shpc, slot, dev, devfn) \
+    for ((devfn) = 0, \
+         (dev) = shpc_next_device_in_slot((shpc), (slot), &(devfn)); \
+         (dev); (dev) = shpc_next_device_in_slot((shpc), (slot), &(devfn)))
+
+static void shpc_free_devices_in_slot(SHPCDevice *shpc, int slot)
+{
+    HotplugHandler *hotplug_ctrl;
+    int devfn;
+    PCIDevice *dev;
+
+    FOR_EACH_DEVICE_IN_SLOT(shpc, slot, dev, devfn) {
+        hotplug_ctrl = qdev_get_hotplug_handler(DEVICE(dev));
+        hotplug_handler_unplug(hotplug_ctrl, DEVICE(dev), &error_abort);
+        object_unparent(OBJECT(dev));
+    }
 }
 
 static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
-- 
2.34.1


