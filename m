Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 906B06675F6
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:27:52 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBe-0002jV-Kd; Thu, 12 Jan 2023 09:04:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBP-0002M4-NH
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBO-00064J-1B
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532233;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7brEE8KbU/icKbuJywLodwZB28Qr2jpZI5OqQ0Eti9s=;
 b=dWJhYQoBY36PHhlgY5VmNZAZAT8pm7sK78/O/0VqBM0eF779Vu0AtMHQmlGqB7wuzDF9w9
 QKkC0O9Gy3zyAv2iz3uNsrKzL9zDeyIuXFZo9DBp2Hp6J/+HSP6SDrkTr/BBr0VhtsHNvE
 UDNz5rsf6Z+w+P1myPPrjZeZtMyC6ks=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-16-AjC1-yrqOA6I0NCtwngTpg-1; Thu, 12 Jan 2023 09:03:51 -0500
X-MC-Unique: AjC1-yrqOA6I0NCtwngTpg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D8D392807D77;
 Thu, 12 Jan 2023 14:03:44 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 530C84085720;
 Thu, 12 Jan 2023 14:03:44 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 39/40] pcihp: generate populated non-hotpluggble slot
 descriptions on non-hotplug path
Date: Thu, 12 Jan 2023 15:03:11 +0100
Message-Id: <20230112140312.3096331-40-imammedo@redhat.com>
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

Generating slots descriptions populated by non-hotpluggable devices
is akward at best and complicates hotplug path (build_append_pcihp_slots)
needlessly, and builds only dynamic _DSM for such slots which is overlkill.
Clean it up and let non-hotplug path (build_append_pci_bus_devices)
to handle that task.

Such clean up effectively drops dynamic _DSM methods on non-hotpluggable
slots (even though bus itself is hotpluggable), but in practice it
affects only built-in devices (ide controllers/various bridges) that don't
use acpi-index anyways so effectively it doesn't matter (NICs are hotpluggble).

Follow up series will add static _DSM for non-hotpluggble devices/buses
that will not depend on ACPI PCI hotplug at all, and potentially would
allows us to reuse non-hotplug path elsewhere (PBX/microvm/arm-virt),
including new support for acpi-index for non-hotpluggable devices.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 50504578b9..c085bf7812 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -414,6 +414,7 @@ static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
     PCIDevice *pdev = bus->devices[devfn];
     if (pdev) {
         return is_devfn_ignored_generic(devfn, bus) ||
+               !DEVICE_GET_CLASS(pdev)->hotpluggable ||
                /* Cold plugged bridges aren't themselves hot-pluggable */
                (IS_PCI_BRIDGE(pdev) && !DEVICE(pdev)->hotplugged);
     } else { /* non populated slots */
@@ -440,17 +441,14 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
     notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
-        PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
         int adr = slot << 16 | PCI_FUNC(devfn);
-        bool hotpluggbale_slot = true;
 
         if (is_devfn_ignored_hotplug(devfn, bus)) {
             continue;
         }
 
-        if (pdev) {
-            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable;
+        if (bus->devices[devfn]) {
             dev = aml_scope("S%.02X", devfn);
         } else {
             dev = aml_device("S%.02X", devfn);
@@ -464,17 +462,15 @@ static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
         aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
         aml_append(dev, aml_pci_device_dsm());
 
-        if (hotpluggbale_slot) {
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-            /* add _EJ0 to make slot hotpluggable  */
-            method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
-            );
-            aml_append(dev, method);
+        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+        /* add _EJ0 to make slot hotpluggable  */
+        method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
+        aml_append(method,
+            aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
+        );
+        aml_append(dev, method);
 
-            build_append_pcihp_notify_entry(notify_method, slot);
-        }
+        build_append_pcihp_notify_entry(notify_method, slot);
 
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
@@ -493,8 +489,9 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
         int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
+        PCIDevice *pdev = bus->devices[devfn];
 
-        if (!bus->devices[devfn] || is_devfn_ignored_generic(devfn, bus)) {
+        if (!pdev || is_devfn_ignored_generic(devfn, bus)) {
             continue;
         }
 
-- 
2.31.1


