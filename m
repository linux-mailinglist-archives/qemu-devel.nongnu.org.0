Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A42C72E10A6
	for <lists+qemu-devel@lfdr.de>; Wed, 23 Dec 2020 00:50:57 +0100 (CET)
Received: from localhost ([::1]:55782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1krrQe-0007io-Nf
	for lists+qemu-devel@lfdr.de; Tue, 22 Dec 2020 18:50:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrGR-0000Zp-TC
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:31 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34706)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1krrGO-0005QW-Vk
 for qemu-devel@nongnu.org; Tue, 22 Dec 2020 18:40:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1608680420;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vG6Nf4uLUP1oDiFldWPLguPrfZcpaMKpYzFOBkRd4yI=;
 b=ZHN0JXOdd3dISl8tSWx7yYPDzlh2yAPQOgWBQNvCJWnwvI8DeDITUuvgV0OsPYOPpm7BHU
 kIYkzRj41uV4nyF2SRwLBYtWqBTTp960UWBOGUrrG7bcRRVlQKmnwiZnXgfKn14gBybWLh
 v87LII1ZdrJ/Znki/J3BoKul9zldyoA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-421-OW4vXeubNaCa0o8QtpKIaw-1; Tue, 22 Dec 2020 18:40:18 -0500
X-MC-Unique: OW4vXeubNaCa0o8QtpKIaw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FC22EC1A2;
 Tue, 22 Dec 2020 23:40:17 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6093F5D9CC;
 Tue, 22 Dec 2020 23:39:57 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 4/5] pci: acpi: add _DSM method to PCI devices
Date: Tue, 22 Dec 2020 18:39:33 -0500
Message-Id: <20201222233934.451578-5-imammedo@redhat.com>
In-Reply-To: <20201222233934.451578-1-imammedo@redhat.com>
References: <20201222233934.451578-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: jusual@redhat.com, laine@redhat.com, mst@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Implement _DSM according to:
    PCI Firmware Specification 3.1
    4.6.7.  DSM for Naming a PCI or PCI Express Device Under
            Operating Systems
and wire it up to cold and hot-plugged PCI devices.
Feature depends on ACPI hotplug being enabled (as that provides
PCI devices descriptions in ACPI and MMIO registers that are
reused to fetch acpi-index).

acpi-index should work for
  - cold plugged NICs:
      $QEMU -evice e1000,acpi-index=100
         => 'eno100'
  - hot-plugged
      (monitor) device_add e1000,acpi-index=200,id=remove_me
         => 'eno200'
  - replugged
      (monitor) device_del remove_me
      (monitor) device_add e1000,acpi-index=1
         => 'eno1'

Windows also sees index under "PCI Label Id" field in properties
dialog but otherwise it doesn't seem to have any effect.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
 include/hw/acpi/pci.h |  1 +
 hw/acpi/pci.c         | 78 +++++++++++++++++++++++++++++++++++++++++++
 hw/i386/acpi-build.c  | 21 ++++++++++--
 3 files changed, 97 insertions(+), 3 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index bf2a3ed0ba..5e1eb2a96a 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -34,4 +34,5 @@ typedef struct AcpiMcfgInfo {
 } AcpiMcfgInfo;
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info);
+Aml *aml_pci_device_dsm(void);
 #endif
diff --git a/hw/acpi/pci.c b/hw/acpi/pci.c
index 07d5101d83..6d49d515d3 100644
--- a/hw/acpi/pci.c
+++ b/hw/acpi/pci.c
@@ -65,3 +65,81 @@ bool vmstate_acpi_pcihp_use_acpi_index(void *opaque, int version_id)
      AcpiPciHpState *s = opaque;
      return s->acpi_index;
 }
+
+Aml *aml_pci_device_dsm(void)
+{
+    Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
+    Aml *acpi_index = aml_local(0);
+    Aml *zero = aml_int(0);
+    Aml *bnum = aml_arg(4);
+    Aml *sun = aml_arg(5);
+
+    method = aml_method("PDSM", 6, AML_SERIALIZED);
+
+    /*
+     * PCI Firmware Specification 3.1
+     * 4.6.  _DSM Definitions for PCI
+     */
+    UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
+    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
+    {
+        aml_append(ifctx, aml_store(aml_call2("AIDX", bnum, sun), acpi_index));
+        ifctx1 = aml_if(aml_equal(aml_arg(2), zero));
+        {
+            uint8_t byte_list[1];
+
+            ifctx2 = aml_if(aml_equal(aml_arg(1), aml_int(2)));
+            {
+                /*
+                 * advertise function 7 if device has acpi-index
+                 */
+                ifctx3 = aml_if(aml_lnot(aml_equal(acpi_index, zero)));
+                {
+                    byte_list[0] =
+                        1 /* have supported functions */ |
+                        1 << 7 /* support for function 7 */
+                    ;
+                    aml_append(ifctx3, aml_return(aml_buffer(1, byte_list)));
+                }
+                aml_append(ifctx2, ifctx3);
+             }
+             aml_append(ifctx1, ifctx2);
+
+             byte_list[0] = 0; /* nothing supported */
+             aml_append(ifctx1, aml_return(aml_buffer(1, byte_list)));
+         }
+         aml_append(ifctx, ifctx1);
+         elsectx = aml_else();
+         /*
+          * PCI Firmware Specification 3.1
+          * 4.6.7. _DSM for Naming a PCI or PCI Express Device Under
+          *        Operating Systems
+          */
+         ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(7)));
+         {
+             Aml *pkg = aml_package(2);
+             Aml *label = aml_local(2);
+             Aml *ret = aml_local(1);
+
+             aml_append(ifctx1, aml_concatenate(aml_string("PCI Device "),
+                 aml_to_decimalstring(acpi_index, NULL), label));
+
+             aml_append(pkg, zero);
+             aml_append(pkg, aml_string("placeholder"));
+             aml_append(ifctx1, aml_store(pkg, ret));
+             /*
+              * update apci-index to actual value
+              */
+             aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
+             /*
+              * update device label to actual value
+              */
+             aml_append(ifctx1, aml_store(label, aml_index(ret, aml_int(1))));
+             aml_append(ifctx1, aml_return(ret));
+         }
+         aml_append(elsectx, ifctx1);
+         aml_append(ifctx, elsectx);
+    }
+    aml_append(method, ifctx);
+    return method;
+}
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 27d2958e25..447ad39c35 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -385,6 +385,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
                     aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
                 );
                 aml_append(dev, method);
+                method = aml_method("_DSM", 4, AML_SERIALIZED);
+                aml_append(method,
+                    aml_return(aml_call6("PDSM", aml_arg(0), aml_arg(1),
+                                         aml_arg(2), aml_arg(3),
+                                         aml_name("BSEL"), aml_name("_SUN")))
+                );
+                aml_append(dev, method);
                 aml_append(parent_scope, dev);
 
                 build_append_pcihp_notify_entry(notify_method, slot);
@@ -412,6 +419,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
         aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
 
+        aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+        method = aml_method("_DSM", 4, AML_SERIALIZED);
+        aml_append(method,
+           aml_return(aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
+                                aml_arg(3), aml_name("BSEL"), aml_name("_SUN")))
+        );
+        aml_append(dev, method);
+
         if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
             /* add VGA specific AML methods */
             int s3d;
@@ -434,9 +449,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
         } else if (hotplug_enabled_dev) {
-            /* add _SUN/_EJ0 to make slot hotpluggable  */
-            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
-
+            /* add _EJ0 to make slot hotpluggable  */
             method = aml_method("_EJ0", 1, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_call2("PCEJ", aml_name("BSEL"), aml_name("_SUN"))
@@ -1142,6 +1155,8 @@ static void build_piix4_pci_hotplug(Aml *table)
     aml_append(method, aml_return(aml_local(0)));
     aml_append(scope, method);
 
+    aml_append(scope, aml_pci_device_dsm());
+
     aml_append(table, scope);
 }
 
-- 
2.27.0


