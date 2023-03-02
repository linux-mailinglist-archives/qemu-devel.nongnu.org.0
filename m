Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71BAB6A8603
	for <lists+qemu-devel@lfdr.de>; Thu,  2 Mar 2023 17:17:06 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXlbS-0006Ob-1P; Thu, 02 Mar 2023 11:16:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbF-0006Ez-Q2
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pXlbB-0000KP-0c
 for qemu-devel@nongnu.org; Thu, 02 Mar 2023 11:16:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677773756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ReV0hvvdkgmMSEuYEmCAe8D4YAda79mJMlseI4n3wns=;
 b=hNMBKiqRyCR3tmS2mTZ9mKo3Mfo8oyQTUuM46Pm/BpMSm0Ewgn2ww4TOmyyqQGkfkNotAA
 upabN7/us33w92EiwYlCi7cA3XIPL9sR/v2v6p6LVy4cZcoBayxT5Jg53Gck9/z4Kuf7K6
 pii6/K+Gisx6wgXl0tmG/hSGSIf5lIU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-646-p-Mz9-GYMluX_usuAlKsUQ-1; Thu, 02 Mar 2023 11:15:55 -0500
X-MC-Unique: p-Mz9-GYMluX_usuAlKsUQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 259DD1C3D380
 for <qemu-devel@nongnu.org>; Thu,  2 Mar 2023 16:15:55 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 939EC140EBF6;
 Thu,  2 Mar 2023 16:15:54 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: mst@redhat.com,
	berrange@redhat.com
Subject: [PATCH v2 12/34] pci: fix 'hotplugglable' property behavior
Date: Thu,  2 Mar 2023 17:15:21 +0100
Message-Id: <20230302161543.286002-13-imammedo@redhat.com>
In-Reply-To: <20230302161543.286002-1-imammedo@redhat.com>
References: <20230302161543.286002-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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

Currently the property may flip its state
during VM bring up or just doesn't work as
the name implies.

In particular with PCIE root port that has
'hotplug={on|off}' property, and when it's
turned off, one would expect
  'hotpluggable' == false
for any devices attached to it.
Which is not the case since qbus_is_hotpluggable()
used by the property just checks for presence
of any hotplug_handler set on bus.

The problem is that name BusState::hotplug_handler
from its inception is misnomer, as it handles
not only hotplug but also in many cases coldplug
as well (i.e. generic wiring interface), and
it's fine to have hotplug_handler set on bus
while it doesn't support hotplug (ex. pcie-slot
with hotplug=off).

Another case of root port flipping 'hotpluggable'
state when ACPI PCI hotplug is enabled in this
case root port with 'hotplug=off' starts as
hotpluggable and then later on, pcihp
hotplug_handler clears hotplug_handler
explicitly after checking root port's 'hotplug'
property.

So root-port hotpluggablity check sort of works
if pcihp is enabled but is broken if pcihp is
disabled.

One way to deal with the issue is to ask
hotplug_handler if bus it controls is hotpluggable
or not. To do that add is_hotpluggable_bus()
hook to HotplugHandler interface and use it in
'hotpluggable' property + teach pcie-slot to
actually look into 'hotplug' property state
before deciding if bus is hotpluggable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/hotplug.h   |  2 ++
 include/hw/qdev-core.h | 13 ++++++++++++-
 hw/pci/pcie_port.c     |  8 ++++++++
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/include/hw/hotplug.h b/include/hw/hotplug.h
index e15f59c8b3..a9840ed485 100644
--- a/include/hw/hotplug.h
+++ b/include/hw/hotplug.h
@@ -48,6 +48,7 @@ typedef void (*hotplug_fn)(HotplugHandler *plug_handler,
  * @unplug: unplug callback.
  *          Used for device removal with devices that implement
  *          asynchronous and synchronous (surprise) removal.
+ * @is_hotpluggable_bus: called to check if bus/its parent allow hotplug on bus
  */
 struct HotplugHandlerClass {
     /* <private> */
@@ -58,6 +59,7 @@ struct HotplugHandlerClass {
     hotplug_fn plug;
     hotplug_fn unplug_request;
     hotplug_fn unplug;
+    bool (*is_hotpluggable_bus)(HotplugHandler *plug_handler, BusState *bus);
 };
 
 /**
diff --git a/include/hw/qdev-core.h b/include/hw/qdev-core.h
index f5b3b2f89a..bd50ad5ee1 100644
--- a/include/hw/qdev-core.h
+++ b/include/hw/qdev-core.h
@@ -812,7 +812,18 @@ void qbus_set_bus_hotplug_handler(BusState *bus);
 
 static inline bool qbus_is_hotpluggable(BusState *bus)
 {
-   return bus->hotplug_handler;
+    HotplugHandler *plug_handler = bus->hotplug_handler;
+    bool ret = !!plug_handler;
+
+    if (plug_handler) {
+        HotplugHandlerClass *hdc;
+
+        hdc = HOTPLUG_HANDLER_GET_CLASS(plug_handler);
+        if (hdc->is_hotpluggable_bus) {
+            ret = hdc->is_hotpluggable_bus(plug_handler, bus);
+        }
+    }
+    return ret;
 }
 
 /**
diff --git a/hw/pci/pcie_port.c b/hw/pci/pcie_port.c
index 65a397ad23..000633fec1 100644
--- a/hw/pci/pcie_port.c
+++ b/hw/pci/pcie_port.c
@@ -161,6 +161,13 @@ PCIDevice *pcie_find_port_by_pn(PCIBus *bus, uint8_t pn)
     return NULL;
 }
 
+static bool pcie_slot_is_hotpluggbale_bus(HotplugHandler *plug_handler,
+                                          BusState *bus)
+{
+    PCIESlot *s = PCIE_SLOT(bus->parent);
+    return s->hotplug;
+}
+
 static const TypeInfo pcie_port_type_info = {
     .name = TYPE_PCIE_PORT,
     .parent = TYPE_PCI_BRIDGE,
@@ -188,6 +195,7 @@ static void pcie_slot_class_init(ObjectClass *oc, void *data)
     hc->plug = pcie_cap_slot_plug_cb;
     hc->unplug = pcie_cap_slot_unplug_cb;
     hc->unplug_request = pcie_cap_slot_unplug_request_cb;
+    hc->is_hotpluggable_bus = pcie_slot_is_hotpluggbale_bus;
 }
 
 static const TypeInfo pcie_slot_type_info = {
-- 
2.39.1


