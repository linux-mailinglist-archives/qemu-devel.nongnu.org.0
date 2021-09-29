Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A115B41C1AD
	for <lists+qemu-devel@lfdr.de>; Wed, 29 Sep 2021 11:35:54 +0200 (CEST)
Received: from localhost ([::1]:47958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mVW0H-0000hd-Lr
	for lists+qemu-devel@lfdr.de; Wed, 29 Sep 2021 05:35:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44928)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtX-0001qg-9A
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from mout.kundenserver.de ([212.227.126.187]:37851)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1mVVtS-0005kr-9p
 for qemu-devel@nongnu.org; Wed, 29 Sep 2021 05:28:55 -0400
Received: from quad ([82.142.21.142]) by mrelayeu.kundenserver.de (mreue010
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MRTAj-1m8kDT451Z-00NUpC; Wed, 29
 Sep 2021 11:28:47 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 05/20] nubus: move slot bitmap checks from NubusDevice
 realize() to BusClass check_address()
Date: Wed, 29 Sep 2021 11:28:28 +0200
Message-Id: <20210929092843.2686234-6-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210929092843.2686234-1-laurent@vivier.eu>
References: <20210929092843.2686234-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CUJ/J4uF2iaoVj70WBiThgw+Sj7VYK8vRxTQmPnbFp9LSYXZMSd
 4nFu7mhmz8Q5ZADPHPOpzfr6WhNtzNdJ3QyDAO6wbXiW0YLt6mNnbpHyTNxPtbUP/LxE1Xs
 3POKsa6OW5bH4RnK9PpZYG3IE/M/GUWrZlAtaCEEXLzO938FAH8MGhxm+UBTXnZ0Lv257s1
 1I8pw/aXnJZZr1SGJh51w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:5Kg0lQvqvMU=:KqvkAmC5p36Asef9puvtGI
 7gKrMKr+BsNEiqXggXoBwywRhTFcDG4ifnBv0rOsKld2GRpz4yrZ12hvmH/i/0q81Kdfs8duS
 erzC44ocZ71eNGY1vAEpy5/sFNg2sMDMcEqN2PC/BP9laQBzkCllluJczr55/Me3tsvY3ovaZ
 phqosD1n0xNiK/caLB8EtB1I5Pjla1k6ikTHhHdignz7lE7Wk2oRMwx/lG9Brq8H+o7gSmL3z
 g0syi0GPrYTm+fq2PQnlyTvWYQQvn21Ir+BzBFmpLVNPxe1kZr/81+/rCV4vWg2dVKFiod5Ml
 N53TCMdc9uv4BvLRjaAP6+0EBRl/CWQdz8k9TjKuP7yesFIfVBiCojX50uTeqGA8FwBFjs05J
 dphMDDMANC3nsLChgaZ/e0U2OV7oB6tY2deBG2HEzlHcBsvwH4Fs8+kPcP0QsAMVNSu4QE+uN
 0BPD3Z5AY7MvY19617TeGA5rNBTMcztu5Vs47VaFkCSCQsFeoQ42AcEoSnGeYYWP+413qyXrw
 aMXSJ9mY2EEpMp/2K2qA2ILlOSZUuZMQLklTCilh/SIWLNuuOZxNk6f5T7HCpYWPO5h+o4Fs1
 H25jhcEXNhe4NMuJ8z1V0fO0mU38t3hEdESudlpoSWLzoKiEeu/QbxJR5oLvR+ybPaJFO04C1
 CAu5fi8j9GG8xYb2RYJyo9BEQZ/5zVqyjLfwDBcG0d9Fa8gR6kQOg9yK+TkIHzHPcvpNIdc/l
 HyZ0H2d+vhatzVVe3bh06n0GNVllCeBCGrsQJA==
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Laurent Vivier <laurent@vivier.eu>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>

Allow Nubus to manage the slot allocations itself using the BusClass check_address()
virtual function rather than managing this during NubusDevice realize().

Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Reviewed-by: Laurent Vivier <laurent@vivier.eu>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Message-Id: <20210924073808.1041-6-mark.cave-ayland@ilande.co.uk>
Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/nubus/nubus-bus.c    | 29 +++++++++++++++++++++++++++++
 hw/nubus/nubus-device.c | 21 ---------------------
 2 files changed, 29 insertions(+), 21 deletions(-)

diff --git a/hw/nubus/nubus-bus.c b/hw/nubus/nubus-bus.c
index 3cd75348646b..96ef027bad26 100644
--- a/hw/nubus/nubus-bus.c
+++ b/hw/nubus/nubus-bus.c
@@ -96,11 +96,40 @@ static void nubus_init(Object *obj)
                                                  NUBUS_SLOT_NB);
 }
 
+static bool nubus_check_address(BusState *bus, DeviceState *dev, Error **errp)
+{
+    NubusDevice *nd = NUBUS_DEVICE(dev);
+    NubusBus *nubus = NUBUS_BUS(bus);
+
+    if (nd->slot == -1) {
+        /* No slot specified, find first available free slot */
+        int s = ctz32(nubus->slot_available_mask);
+        if (s != 32) {
+            nd->slot = s;
+        } else {
+            error_setg(errp, "Cannot register nubus card, no free slot "
+                             "available");
+            return false;
+        }
+    } else {
+        /* Slot specified, make sure the slot is available */
+        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
+            error_setg(errp, "Cannot register nubus card, slot %d is "
+                             "unavailable or already occupied", nd->slot);
+            return false;
+        }
+    }
+
+    nubus->slot_available_mask &= ~BIT(nd->slot);
+    return true;
+}
+
 static void nubus_class_init(ObjectClass *oc, void *data)
 {
     BusClass *bc = BUS_CLASS(oc);
 
     bc->realize = nubus_realize;
+    bc->check_address = nubus_check_address;
 }
 
 static const TypeInfo nubus_bus_info = {
diff --git a/hw/nubus/nubus-device.c b/hw/nubus/nubus-device.c
index 2e96d6b4fc39..516b13d2d53d 100644
--- a/hw/nubus/nubus-device.c
+++ b/hw/nubus/nubus-device.c
@@ -161,27 +161,6 @@ static void nubus_device_realize(DeviceState *dev, Error **errp)
     char *name;
     hwaddr slot_offset;
 
-    if (nd->slot == -1) {
-        /* No slot specified, find first available free slot */
-        int s = ctz32(nubus->slot_available_mask);
-        if (s != 32) {
-            nd->slot = s;
-        } else {
-            error_setg(errp, "Cannot register nubus card, no free slot "
-                             "available");
-            return;
-        }
-    } else {
-        /* Slot specified, make sure the slot is available */
-        if (!(nubus->slot_available_mask & BIT(nd->slot))) {
-            error_setg(errp, "Cannot register nubus card, slot %d is "
-                             "unavailable or already occupied", nd->slot);
-            return;
-        }
-    }
-
-    nubus->slot_available_mask &= ~BIT(nd->slot);
-
     /* Super */
     slot_offset = nd->slot * NUBUS_SUPER_SLOT_SIZE;
 
-- 
2.31.1


