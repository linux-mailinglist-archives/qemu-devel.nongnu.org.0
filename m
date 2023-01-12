Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01AF966787F
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 16:04:38 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBP-0002Lm-VT; Thu, 12 Jan 2023 09:03:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBG-0002El-6p
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:46 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBB-0005uu-Mc
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532213;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=BtltWnpSd8SC3NoMRoDesq/JaByxUxGKbfhTdChR8L4=;
 b=MntU3281v3TVnk5RPRoY8itYdqifY0qPbIdS2WZs7nUwu+2Q47OdT1YDApcUV/FSIIp5CM
 V7JA71PXvF+/nwg5gni0mbUxVywN/2GAUOiR4M6HRQK/ohg9/9N+mDUuZE1PY9PIvTPwb4
 j8797zGWPjrANSH3wyCXlMyeY0b2Wzg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-647-o0iRLk9uP5a6CKnQ52znbg-1; Thu, 12 Jan 2023 09:03:31 -0500
X-MC-Unique: o0iRLk9uP5a6CKnQ52znbg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 34A07857A84;
 Thu, 12 Jan 2023 14:03:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A34ED4085720;
 Thu, 12 Jan 2023 14:03:30 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 21/40] pcihp: compose PCNT callchain right before its user
 _GPE._E01
Date: Thu, 12 Jan 2023 15:02:53 +0100
Message-Id: <20230112140312.3096331-22-imammedo@redhat.com>
In-Reply-To: <20230112140312.3096331-1-imammedo@redhat.com>
References: <20230112140312.3096331-1-imammedo@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
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

it's a stepping stone to making build_append_pci_bus_devices() suitable
for AcpiDevAmlIfClass:build_dev_aml callback and lets further simplify
it by separating PCNT generation from slots descriptions.

It also makes PCNT callchain ASL much more readable since callchain
not longer cluttered by slots descriptors.

Plus, move will let next patch easily drop empty PCNT (pc/q35)
when there is nothing hotpluggable.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 32 ++++++++++++++++++++++++++++++--
 1 file changed, 30 insertions(+), 2 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 146f48e4ac..509a4c500d 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -390,7 +390,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
 {
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
-    PCIBus *sec;
     int devfn;
 
     bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
@@ -496,12 +495,35 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         aml_append(parent_scope, notify_method);
     }
 
+    qobject_unref(bsel);
+}
+
+static void build_append_notfication_callback(Aml *parent_scope,
+                                              const PCIBus *bus)
+{
+    Aml *method;
+    PCIBus *sec;
+    QObject *bsel;
+
+    QLIST_FOREACH(sec, &bus->child, sibling) {
+        Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
+        if (pci_bus_is_root(sec) ||
+            !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
+            continue;
+        }
+        build_append_notfication_callback(br_scope, sec);
+        aml_append(parent_scope, br_scope);
+    }
+
     /*
      * Append PCNT method to notify about events on local and child buses.
+     * ps: hostbridge might not have hotplug (bsel) enabled but might have
+     * child bridges that do have bsel.
      */
     method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
 
     /* If bus supports hotplug select it and notify about local events */
+    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
     if (bsel) {
         uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
@@ -523,7 +545,6 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     }
 
     aml_append(parent_scope, method);
-
     qobject_unref(bsel);
 }
 
@@ -1723,6 +1744,13 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     aml_append(dsdt, sb_scope);
 
     if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+        Object *pci_host = acpi_get_i386_pci_host();
+        PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
+
+        scope = aml_scope("\\_SB.PCI0");
+        build_append_notfication_callback(scope, bus);
+        aml_append(dsdt, scope);
+
         scope =  aml_scope("_GPE");
         {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
-- 
2.31.1


