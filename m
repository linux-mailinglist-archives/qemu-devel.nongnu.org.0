Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BC2A62C3AC
	for <lists+qemu-devel@lfdr.de>; Wed, 16 Nov 2022 17:14:15 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ovL24-0007es-2H; Wed, 16 Nov 2022 11:13:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovL22-0007dz-HG
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:12:58 -0500
Received: from forwardcorp1a.mail.yandex.net ([178.154.239.72])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <vsementsov@yandex-team.ru>)
 id 1ovL1z-0000da-7b
 for qemu-devel@nongnu.org; Wed, 16 Nov 2022 11:12:57 -0500
Received: from vla5-b2806cb321eb.qloud-c.yandex.net
 (vla5-b2806cb321eb.qloud-c.yandex.net
 [IPv6:2a02:6b8:c18:3e0d:0:640:b280:6cb3])
 by forwardcorp1a.mail.yandex.net (Yandex) with ESMTP id 84294600F6;
 Wed, 16 Nov 2022 19:12:46 +0300 (MSK)
Received: from vsementsov-win.yandex-team.ru (unknown
 [2a02:6b8:b081:8128::1:3])
 by vla5-b2806cb321eb.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 6qDkL1QYoB-CjO0mh7k; Wed, 16 Nov 2022 19:12:45 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1668615165; bh=pxy8SoZKMYQOtt4zyvcYm1JwSwGd6OKGn9O3dAAlZPQ=;
 h=Message-Id:Date:In-Reply-To:Cc:Subject:References:To:From;
 b=oP10KNchVcHLB7r7Dt1hNnBaMtilxD+VgRMqAPnCIS4auk/Uv6bpTgj6YLfKO4GVv
 gOuvyesUv7DsFqo3pz5XeGBD7rzICYeqn0HrMKNKLVn9u+y+q1BObbawXxGMk2IomZ
 rglpsMGbHn+W4i04hbfmvyx+IRQ/OLkLmsXY+RWs=
Authentication-Results: vla5-b2806cb321eb.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
From: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
To: qemu-devel@nongnu.org
Cc: eduardo@habkost.net, berrange@redhat.com, pbonzini@redhat.com,
 armbru@redhat.com, eblake@redhat.com, marcel.apfelbaum@gmail.com,
 mst@redhat.com, imammedo@redhat.com, ani@anisinha.ca,
 den-plotnikov@yandex-team.ru, vsementsov@yandex-team.ru
Subject: [PATCH 2/2] qapi: introduce DEVICE_POWER_ON for SHPC hotplug
Date: Wed, 16 Nov 2022 19:12:34 +0300
Message-Id: <20221116161234.44206-3-vsementsov@yandex-team.ru>
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

Hi all! That's an RFC patch.

The problem is that SHPC protocol says that power-led is blinking for 5
seconds before actual turning-on the device. If we call device-del
during this time the attention button press is ignored and we never get
DEVICE_DELETED event, which is unexpected for the user.

I suggest add a pair for DEVICE_DELETED: DEVICE_POWER_ON. So user
should wait for DEVICE_POWER_ON after device-add before making any
other operations with the device (incluing device-del).

What I'm unsure is what about other types of hotplug - PCIE and
ACPI.. Do they suffer from similar problems? Seems not.. Should we sent
for them this event at some moment of should the user be aware of which
kind of hotplug is in use to determine to wait for the DEVICE_POWER_ON
or not to wait.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 hw/pci/shpc.c  | 16 ++++++++++++++++
 qapi/qdev.json | 23 +++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/hw/pci/shpc.c b/hw/pci/shpc.c
index ba241e2818..7c53971c1c 100644
--- a/hw/pci/shpc.c
+++ b/hw/pci/shpc.c
@@ -1,5 +1,6 @@
 #include "qemu/osdep.h"
 #include "qapi/error.h"
+#include "qapi/qapi-events-qdev.h"
 #include "qemu/host-utils.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
@@ -273,6 +274,18 @@ static void shpc_free_devices_in_slot(SHPCDevice *shpc, int slot)
     }
 }
 
+static void shpc_devices_power_on_in_slot(SHPCDevice *shpc, int slot)
+{
+    int devfn;
+    PCIDevice *dev;
+
+    FOR_EACH_DEVICE_IN_SLOT(shpc, slot, dev, devfn) {
+        DeviceState *ds = DEVICE(dev);
+
+        qapi_event_send_device_power_on(!!ds->id, ds->id, ds->canonical_path);
+    }
+}
+
 static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
                               uint8_t state, uint8_t power, uint8_t attn)
 {
@@ -291,6 +304,9 @@ static void shpc_slot_command(SHPCDevice *shpc, uint8_t target,
     switch (power) {
     case SHPC_LED_NO:
         break;
+    case SHPC_LED_ON:
+        shpc_devices_power_on_in_slot(shpc, slot);
+        __attribute__ ((fallthrough));
     default:
         /* TODO: send event to monitor */
         shpc_set_status(shpc, slot, power, SHPC_SLOT_PWR_LED_MASK);
diff --git a/qapi/qdev.json b/qapi/qdev.json
index 2708fb4e99..360dcf8ba6 100644
--- a/qapi/qdev.json
+++ b/qapi/qdev.json
@@ -158,3 +158,26 @@
 ##
 { 'event': 'DEVICE_UNPLUG_GUEST_ERROR',
   'data': { '*device': 'str', 'path': 'str' } }
+
+##
+# @DEVICE_POWER_ON:
+#
+# Emitted whenever power is on for the devices plugged into pci slot.
+# At this point it's safe to remove the device.
+#
+# @device: the device's ID if it has one
+#
+# @path: the device's QOM path
+#
+# Since: 7.2
+#
+# Example:
+#
+# <- { "event": "DEVICE_POWER_ON",
+#      "data": { "device": "virtio-disk-0",
+#                "path": "/machine/peripheral/virtio-disk-0" },
+#      "timestamp": { "seconds": 1265044230, "microseconds": 450486 } }
+#
+##
+{ 'event': 'DEVICE_POWER_ON',
+  'data': { '*device': 'str', 'path': 'str' } }
-- 
2.34.1


