Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE900667712
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:39:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBP-0002L8-7n; Thu, 12 Jan 2023 09:03:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBG-0002Ea-42
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005tt-MW
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532212;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rnkNn5C/1yFkMatHbixrCzwP9G2an3F9waSDwdE8/ts=;
 b=Kk4cvY7o0ERGY4h13Gv3ti0DgHQWXzr/pknn+RbZ7KCq3IRp5TwJPcljAu1Jxn2JYW1DJK
 wOIX/QqBdi6ztvo0COGNpK4XFL8pvMg4FSu4oLA5Zb+U/e9E3b/WHTPSlslmnDhmNxk8o/
 ZWGLHm0vnRSTE0vW6FRMVPO9sxnd/8Y=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-180-H-2H_1U7M3CU4SNgYc813Q-1; Thu, 12 Jan 2023 09:03:24 -0500
X-MC-Unique: H-2H_1U7M3CU4SNgYc813Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 59A743C4221A;
 Thu, 12 Jan 2023 14:03:23 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C93AB4085720;
 Thu, 12 Jan 2023 14:03:22 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 11/40] pci: acpihp: assign BSEL only to coldplugged bridges
Date: Thu, 12 Jan 2023 15:02:43 +0100
Message-Id: <20230112140312.3096331-12-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
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

ACPI PCI hotplug would broken after bridge hotplug and then migration
if hotplugged bridge were specified on target at command line.
Currently it's not possible since, 'hotplugged' property was made
read-only for some time now.

The issue would happen due to BSEL being assigned to all bridges
during 1st 'reset':
 source seq:
   1. start 'pc' machine => sets BSEL to 0 on pci.0 (host-bridge)
   2. hotplug bridge, no bsel is assigned (so far is ok)
 target seq:
   1. start 'pc' machine with
        -S -device pci-bridge,id=hp_br,hotplugged=on
      BSEL gets assigned to as follows
        hp_br: 0
        pci.0: 1
as result hotplug requests with migrated AML generated on source
would be misdirected to 'hp_br' instead of intended pci.0

While it's not issue at the moment, it's based on implicit assumptions
 * 'hotplugged' property is read-only
 * 1st reset happens before QEMU drops into monitor mode
   which lets add hotplugged on source bridges as hotplugged ones
   (anything added at that stage counts as hotplugged
    (yet another assumption))

All of it looks too fragile to me, so lets restrict BSEL only
to cold-plugged bridges explicitly.

Migration wise it shouldn't break anything since assignment order
stays the same:
  * user can't specify 'hotplugged=on' on CLI
  * user can't specify 'hotplugged=off' at monitor stage or later
on older QEMU versions where 'hotplugged' is RW, hotplug is broken
after migration anyways and we cannot do anything to fix that.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/acpi/pcihp.c | 35 ++++++++++++++++++++++-------------
 1 file changed, 22 insertions(+), 13 deletions(-)

diff --git a/hw/acpi/pcihp.c b/hw/acpi/pcihp.c
index 99a898d9ae..5dc7377411 100644
--- a/hw/acpi/pcihp.c
+++ b/hw/acpi/pcihp.c
@@ -85,31 +85,40 @@ static int acpi_pcihp_get_bsel(PCIBus *bus)
     }
 }
 
-/* Assign BSEL property to all buses.  In the future, this can be changed
- * to only assign to buses that support hotplug.
- */
+typedef struct {
+    unsigned bsel_alloc;
+    bool has_bridge_hotplug;
+} BSELInfo;
+
+/* Assign BSEL property only to buses that support hotplug. */
 static void *acpi_set_bsel(PCIBus *bus, void *opaque)
 {
-    unsigned *bsel_alloc = opaque;
+    BSELInfo *info = opaque;
     unsigned *bus_bsel;
+    DeviceState *br = bus->qbus.parent;
+    bool is_bridge = IS_PCI_BRIDGE(br);
 
+    /* hotplugged bridges can't be described in ACPI ignore them */
     if (qbus_is_hotpluggable(BUS(bus))) {
-        bus_bsel = g_malloc(sizeof *bus_bsel);
+        if (!is_bridge || (!br->hotplugged && info->has_bridge_hotplug)) {
+            bus_bsel = g_malloc(sizeof *bus_bsel);
 
-        *bus_bsel = (*bsel_alloc)++;
-        object_property_add_uint32_ptr(OBJECT(bus), ACPI_PCIHP_PROP_BSEL,
-                                       bus_bsel, OBJ_PROP_FLAG_READ);
+            *bus_bsel = info->bsel_alloc++;
+            object_property_add_uint32_ptr(OBJECT(bus), ACPI_PCIHP_PROP_BSEL,
+                                           bus_bsel, OBJ_PROP_FLAG_READ);
+        }
     }
 
-    return bsel_alloc;
+    return info;
 }
 
-static void acpi_set_pci_info(void)
+static void acpi_set_pci_info(bool has_bridge_hotplug)
 {
     static bool bsel_is_set;
     Object *host = acpi_get_i386_pci_host();
     PCIBus *bus;
-    unsigned bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT;
+    BSELInfo info = { .bsel_alloc = ACPI_PCIHP_BSEL_DEFAULT,
+                      .has_bridge_hotplug = has_bridge_hotplug };
 
     if (bsel_is_set) {
         return;
@@ -123,7 +132,7 @@ static void acpi_set_pci_info(void)
     bus = PCI_HOST_BRIDGE(host)->bus;
     if (bus) {
         /* Scan all PCI buses. Set property to enable acpi based hotplug. */
-        pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &bsel_alloc);
+        pci_for_each_bus_depth_first(bus, acpi_set_bsel, NULL, &info);
     }
 }
 
@@ -287,7 +296,7 @@ void acpi_pcihp_reset(AcpiPciHpState *s, bool acpihp_root_off)
     if (acpihp_root_off) {
         acpi_pcihp_disable_root_bus();
     }
-    acpi_set_pci_info();
+    acpi_set_pci_info(!s->legacy_piix);
     acpi_pcihp_update(s);
 }
 
-- 
2.31.1


