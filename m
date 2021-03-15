Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CCA6233C558
	for <lists+qemu-devel@lfdr.de>; Mon, 15 Mar 2021 19:15:23 +0100 (CET)
Received: from localhost ([::1]:51896 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lLrkQ-0001lV-R1
	for lists+qemu-devel@lfdr.de; Mon, 15 Mar 2021 14:15:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34354)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX7-0001QS-08
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:24592)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1lLrX4-0008UY-G4
 for qemu-devel@nongnu.org; Mon, 15 Mar 2021 14:01:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615831293;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LTjtKhVyccdrs+NK4uuVWt3Q+46eNlxQFeKHIpcboq0=;
 b=M64Zushe9aB2wsVTc9NXUdwczAacGrmpQ0Hw5Fv5gK3DjTcTo57+gof5rcnob6ABbeamLN
 lLTJpMyMkqNbTvymBJJnuo28/FSxn9sWPInZIvuu5bVISq9UBGZKPJGbq4ItGdQlZXk5kW
 cZsEc3zZGEjbuA1jU3opepcgtSo6ed4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-304-Mygt6-evOQeJRiznab9R8Q-1; Mon, 15 Mar 2021 14:01:32 -0400
X-MC-Unique: Mygt6-evOQeJRiznab9R8Q-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id C9EEBA0C13
 for <qemu-devel@nongnu.org>; Mon, 15 Mar 2021 18:01:16 +0000 (UTC)
Received: from dell-r430-03.lab.eng.brq.redhat.com
 (dell-r430-03.lab.eng.brq.redhat.com [10.37.153.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id B13405B4A8;
 Mon, 15 Mar 2021 18:01:15 +0000 (UTC)
From: Igor Mammedov <imammedo@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 5/6] pci: acpi: add _DSM method to PCI devices
Date: Mon, 15 Mar 2021 14:01:01 -0400
Message-Id: <20210315180102.3008391-6-imammedo@redhat.com>
In-Reply-To: <20210315180102.3008391-1-imammedo@redhat.com>
References: <20210315180102.3008391-1-imammedo@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.25,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
      $QEMU -device e1000,acpi-index=100
         => 'eno100'
  - hot-plugged
      (monitor) device_add e1000,acpi-index=200,id=remove_me
         => 'eno200'
  - re-plugged
      (monitor) device_del remove_me
      (monitor) device_add e1000,acpi-index=1
         => 'eno1'

Windows also sees index under "PCI Label Id" field in properties
dialog but otherwise it doesn't seem to have any effect.

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
---
v1:
   * drop optional text label
   * do not report capability if PIDX is not supported (i.e. old QEMU)
---
 include/hw/acpi/pci.h |   1 +
 hw/i386/acpi-build.c  | 105 ++++++++++++++++++++++++++++++++++++++++--
 2 files changed, 103 insertions(+), 3 deletions(-)

diff --git a/include/hw/acpi/pci.h b/include/hw/acpi/pci.h
index e514f179d8..b5deee0a9d 100644
--- a/include/hw/acpi/pci.h
+++ b/include/hw/acpi/pci.h
@@ -35,4 +35,5 @@ typedef struct AcpiMcfgInfo {
 
 void build_mcfg(GArray *table_data, BIOSLinker *linker, AcpiMcfgInfo *info,
                 const char *oem_id, const char *oem_table_id);
+Aml *aml_pci_device_dsm(void);
 #endif
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e49fae2bfd..d14a5fab62 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -397,6 +397,13 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
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
@@ -424,6 +431,16 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
         aml_append(dev, aml_name_decl("_ADR", aml_int(slot << 16)));
 
+        if (bsel) {
+            aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
+            method = aml_method("_DSM", 4, AML_SERIALIZED);
+            aml_append(method, aml_return(
+                aml_call6("PDSM", aml_arg(0), aml_arg(1), aml_arg(2),
+                          aml_arg(3), aml_name("BSEL"), aml_name("_SUN"))
+            ));
+            aml_append(dev, method);
+        }
+
         if (pc->class_id == PCI_CLASS_DISPLAY_VGA) {
             /* add VGA specific AML methods */
             int s3d;
@@ -446,9 +463,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
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
@@ -511,6 +526,88 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     qobject_unref(bsel);
 }
 
+Aml *aml_pci_device_dsm(void)
+{
+    Aml *method, *UUID, *ifctx, *ifctx1, *ifctx2, *ifctx3, *elsectx;
+    Aml *acpi_index = aml_local(0);
+    Aml *zero = aml_int(0);
+    Aml *bnum = aml_arg(4);
+    Aml *func = aml_arg(2);
+    Aml *rev = aml_arg(1);
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
+        ifctx1 = aml_if(aml_equal(func, zero));
+        {
+            uint8_t byte_list[1];
+
+            ifctx2 = aml_if(aml_equal(rev, aml_int(2)));
+            {
+                /*
+                 * advertise function 7 if device has acpi-index
+                 * acpi_index values:
+                 *            0: not present (default value)
+                 *     FFFFFFFF: not supported (old QEMU without PIDX reg)
+                 *        other: device's acpi-index
+                 */
+                ifctx3 = aml_if(aml_lnot(
+                    aml_or(aml_equal(acpi_index, zero),
+                           aml_equal(acpi_index, aml_int(0xFFFFFFFF)), NULL)
+                ));
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
+         ifctx1 = aml_if(aml_equal(func, aml_int(7)));
+         {
+             Aml *pkg = aml_package(2);
+             Aml *ret = aml_local(1);
+
+             aml_append(pkg, zero);
+             /*
+              * optional, if not impl. should return null string
+              */
+             aml_append(pkg, aml_string("%s", ""));
+             aml_append(ifctx1, aml_store(pkg, ret));
+             /*
+              * update apci-index to actual value
+              */
+             aml_append(ifctx1, aml_store(acpi_index, aml_index(ret, zero)));
+             aml_append(ifctx1, aml_return(ret));
+         }
+         aml_append(elsectx, ifctx1);
+         aml_append(ifctx, elsectx);
+    }
+    aml_append(method, ifctx);
+    return method;
+}
+
 /**
  * build_prt_entry:
  * @link_name: link name for PCI route entry
@@ -1195,6 +1292,8 @@ static void build_piix4_pci_hotplug(Aml *table)
     aml_append(method, aml_return(aml_local(0)));
     aml_append(scope, method);
 
+    aml_append(scope, aml_pci_device_dsm());
+
     aml_append(table, scope);
 }
 
-- 
2.27.0


