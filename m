Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5569B66785D
	for <lists+qemu-devel@lfdr.de>; Thu, 12 Jan 2023 15:58:43 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFyBS-0002Nq-0y; Thu, 12 Jan 2023 09:03:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyBC-00028j-25
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:44 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1pFyB8-0005vf-91
 for qemu-devel@nongnu.org; Thu, 12 Jan 2023 09:03:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1673532215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=cpd+L+e8tfIbdW2dfBneIXiktjk4fSoDV822NGXpYHE=;
 b=hSZaMKskvuSJSMq31xcj3xBmQPeCpB0vtf98glFJXehMqhCI2qDmYMsW1uLuozpIF60OQs
 rO51zpW+ujnXOJ1hvThMDgBO4zamK8xxp1hup8wDhjnbrGcJZib5U2jYzIoVSgsdalWyfz
 VKLPvOk3RfF1Pq1g5Hyj4ofu6Ar3tfg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-Mg7Q9klJP1KBUEjSJ2Kz7w-1; Thu, 12 Jan 2023 09:03:32 -0500
X-MC-Unique: Mg7Q9klJP1KBUEjSJ2Kz7w-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E996C802D2A;
 Thu, 12 Jan 2023 14:03:31 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq2.redhat.com
 (dell-r430-03.lab.eng.brq2.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 64AAB4085720;
 Thu, 12 Jan 2023 14:03:31 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
	Ani Sinha <ani@anisinha.ca>
Subject: [PATCH 22/40] pcihp: do not put empty PCNT in DSDT
Date: Thu, 12 Jan 2023 15:02:54 +0100
Message-Id: <20230112140312.3096331-23-imammedo@redhat.com>
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

count number of PCNT methods that actually call Notify
and if there aren't any, drop PCNT altogether.
It mostly affects 'Q35' tests where there is no root-ports
/bridges attached and 'PC' machine when ACPI PCI hotplug is
completely disabled.

Expected ASL change:

-            Method (PCNT, 0, NotSerialized)
-            {
-            }
...
         Method (_E01, 0, NotSerialized)  // _Exx: Edge-Triggered GPE
         {
-            Acquire (\_SB.PCI0.BLCK, 0xFFFF)
-            \_SB.PCI0.PCNT ()
-            Release (\_SB.PCI0.BLCK)
         }

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 hw/i386/acpi-build.c | 26 ++++++++++++++++++--------
 1 file changed, 18 insertions(+), 8 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 509a4c500d..9edd7bf38e 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -498,12 +498,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     qobject_unref(bsel);
 }
 
-static void build_append_notfication_callback(Aml *parent_scope,
+static bool build_append_notfication_callback(Aml *parent_scope,
                                               const PCIBus *bus)
 {
     Aml *method;
     PCIBus *sec;
     QObject *bsel;
+    int nr_notifiers = 0;
 
     QLIST_FOREACH(sec, &bus->child, sibling) {
         Aml *br_scope = aml_scope("S%.02X", sec->parent_dev->devfn);
@@ -511,7 +512,8 @@ static void build_append_notfication_callback(Aml *parent_scope,
             !object_property_find(OBJECT(sec), ACPI_PCIHP_PROP_BSEL)) {
             continue;
         }
-        build_append_notfication_callback(br_scope, sec);
+        nr_notifiers = nr_notifiers +
+                       build_append_notfication_callback(br_scope, sec);
         aml_append(parent_scope, br_scope);
     }
 
@@ -532,6 +534,7 @@ static void build_append_notfication_callback(Aml *parent_scope,
                                      aml_int(1))); /* Device Check */
         aml_append(method, aml_call2("DVNT", aml_name("PCID"),
                                      aml_int(3))); /* Eject Request */
+        nr_notifiers++;
     }
 
     /* Notify about child bus events in any case */
@@ -546,6 +549,7 @@ static void build_append_notfication_callback(Aml *parent_scope,
 
     aml_append(parent_scope, method);
     qobject_unref(bsel);
+    return !!nr_notifiers;
 }
 
 static Aml *aml_pci_pdsm(void)
@@ -1744,20 +1748,26 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     aml_append(dsdt, sb_scope);
 
     if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+        bool has_pcnt;
+
         Object *pci_host = acpi_get_i386_pci_host();
         PCIBus *bus = PCI_HOST_BRIDGE(pci_host)->bus;
 
         scope = aml_scope("\\_SB.PCI0");
-        build_append_notfication_callback(scope, bus);
-        aml_append(dsdt, scope);
+        has_pcnt = build_append_notfication_callback(scope, bus);
+        if (has_pcnt) {
+            aml_append(dsdt, scope);
+        }
 
         scope =  aml_scope("_GPE");
         {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
-            aml_append(method,
-                aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
-            aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
-            aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+            if (has_pcnt) {
+                aml_append(method,
+                    aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
+                aml_append(method, aml_call0("\\_SB.PCI0.PCNT"));
+                aml_append(method, aml_release(aml_name("\\_SB.PCI0.BLCK")));
+            }
             aml_append(scope, method);
         }
         aml_append(dsdt, scope);
-- 
2.31.1


