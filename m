Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CF53E681B93
	for <lists+qemu-devel@lfdr.de>; Mon, 30 Jan 2023 21:32:56 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pMahm-0001vj-8i; Mon, 30 Jan 2023 15:24:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeS-0006c7-76
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1pMaeO-0007OP-ES
 for qemu-devel@nongnu.org; Mon, 30 Jan 2023 15:21:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1675110071;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=W+M6xZXrGjSGSNAi6gTmhEeD1/8TOi2IvGsD9BPSl7A=;
 b=COlfMXz1rBnMQPkrRE5QPH+2pcuvoII3a9zgqAZ8LrhNeaXuARWZMxDr1XRVdlvwQUkc3N
 6Tr7ogruNjzzdQuZValMudBIXLzluk8yHX6WZTRY7Ee+i6OyAqdgTjk52ci3Cj7e+9V0Jr
 Pe3X+GV6YRpepE1l5o4OOvMQqCbivcA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-449-R27_r16PNQ2BFayEdIc6OA-1; Mon, 30 Jan 2023 15:21:10 -0500
X-MC-Unique: R27_r16PNQ2BFayEdIc6OA-1
Received: by mail-ed1-f72.google.com with SMTP id
 h18-20020a05640250d200b0049e0e9382c2so9003935edb.13
 for <qemu-devel@nongnu.org>; Mon, 30 Jan 2023 12:21:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=W+M6xZXrGjSGSNAi6gTmhEeD1/8TOi2IvGsD9BPSl7A=;
 b=Iajlt2Zvo20PGIuHiLEpjnDQ6eaHyortVQyBTX+Pe75azAsRF6CdIOhlnZwonMJ8ml
 LfFA6OzKnQyxx1isOpx0eXqCMthwrbSwZgqCyN40a4tBuzRoGgHb3WJafPFo3xD/0Scb
 zDhzEsoZ+GojzeCqNnMfbN8qWhybwCQzLGyiYyh9DN3iAJbUC+73iIERjdBVuhZ4kXQY
 tOxv08tiH5u9vkrWyp2pHg0X3FWRHn0Y/USfvqZo+X6STxlpQ1I1pvmtH8v5HTDv6PQf
 cl46cA1wYjxPKkZfRoYiMaEIkFox6wMG93eAzxDST3++l/RmNXLkf85JhgSzaSekyzWf
 P+xA==
X-Gm-Message-State: AO0yUKX2oPAN5eSSTp8N/lrNFVNSLm4nUgqtoiNndUwDgvGQ/vAK4q3h
 izeBmAaRI3Ru48iMTAYhK1Gn8t0z1eTd8mgjH5ltv6pbcbo3FA/s53Hb2n9jSY6/vmLVEbv/lID
 YsH27eK7T+t6OZphQyn+qMDeKN2Znu1xVyWN4HSAYnRS0MRESs2L1j2lIhln4
X-Received: by 2002:a17:907:3f8b:b0:88a:673e:3669 with SMTP id
 hr11-20020a1709073f8b00b0088a673e3669mr3683529ejc.15.1675110068792; 
 Mon, 30 Jan 2023 12:21:08 -0800 (PST)
X-Google-Smtp-Source: AK7set/Hed31fOn44XcL7oPv8ZPECOxfsH8FHUCAL/O/mT+HPyGYOd1mdbLSYcrc2+0D18M922NdcA==
X-Received: by 2002:a17:907:3f8b:b0:88a:673e:3669 with SMTP id
 hr11-20020a1709073f8b00b0088a673e3669mr3683496ejc.15.1675110068457; 
 Mon, 30 Jan 2023 12:21:08 -0800 (PST)
Received: from redhat.com ([2.52.144.173]) by smtp.gmail.com with ESMTPSA id
 q18-20020a1709064c9200b0085ff3202ce7sm7366518eju.219.2023.01.30.12.21.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 30 Jan 2023 12:21:07 -0800 (PST)
Date: Mon, 30 Jan 2023 15:21:05 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Igor Mammedov <imammedo@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>
Subject: [PULL 43/56] pcihp: acpi: decouple hotplug and generic slots
 description
Message-ID: <20230130201810.11518-44-mst@redhat.com>
References: <20230130201810.11518-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230130201810.11518-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
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

From: Igor Mammedov <imammedo@redhat.com>

Split build_append_pci_bus_devices() onto generic part that builds
AML descriptions only for populated slots which is applicable to
both hotplug disabled and enabled bridges. And a hotplug only
part that complements generic AML with hotplug depended bits
(that depend on BSEL), like _SUN/_EJ0 entries, dynamic _DSM.

Hotplug part, will generate full 'Device' descriptors for
non-populated slots (like it used to be) and complementary
'Scope' descriptors for populated slots that are hotplug capable.
i.e. something like this:
  - ...
  +                Name (BSEL, 0x03)
  +                Scope (S00)
  +                {
  +                    Name (ASUN, Zero)
  +                    Method (_DSM, 4, Serialized)  // _DSM: Device-Specific Method
  +                    {
  +                        Local0 = Package (0x02)
  +                            {
  +                                BSEL,
  +                                ASUN
  +                            }
  +                        Return (PDSM (Arg0, Arg1, Arg2, Arg3, Local0))
  +                    }
  +  [ ... other hotplug depended bits ]
  +                }

While generic build_append_pci_bus_devices() still calls hotplug part at
its end it doesn't really depend on any hotplug bits anymore and later
both could be completely separated when it's necessary.

Main benefit though is that both build_append_pci_bus_devices() and
build_append_pcihp_slots() become more readable and it makes easier
to modify them with less risk of affecting another part. Also it opens
possibility to re-use generic part elsewhere (microvm, arm/virt).

Signed-off-by: Igor Mammedov <imammedo@redhat.com>
Message-Id: <20230112140312.3096331-34-imammedo@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 hw/i386/acpi-build.c | 121 +++++++++++++++++++++++++------------------
 1 file changed, 72 insertions(+), 49 deletions(-)

diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b4c9ff4794..2077efbee4 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -383,35 +383,40 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
     aml_append(method, if_ctx);
 }
 
-static bool is_devfn_ignored(const int devfn, const PCIBus *bus,
-                             bool bus_has_hotplug)
+static bool is_devfn_ignored_generic(const int devfn, const PCIBus *bus)
 {
     const PCIDevice *pdev = bus->devices[devfn];
 
-    if (pdev) {
-        if (PCI_FUNC(devfn)) {
-            if (IS_PCI_BRIDGE(pdev)) {
-                /*
-                 * Ignore only hotplugged PCI bridges on !0 functions, but
-                 * allow describing cold plugged bridges on all functions
-                 */
-                if (DEVICE(pdev)->hotplugged) {
-                    return true;
-                }
-            } else if (!get_dev_aml_func(DEVICE(pdev))) {
-                /*
-                 * Ignore all other devices on !0 functions unless they
-                 * have AML description (i.e have get_dev_aml_func() != 0)
-                 */
+    if (PCI_FUNC(devfn)) {
+        if (IS_PCI_BRIDGE(pdev)) {
+            /*
+             * Ignore only hotplugged PCI bridges on !0 functions, but
+             * allow describing cold plugged bridges on all functions
+             */
+            if (DEVICE(pdev)->hotplugged) {
                 return true;
             }
+        } else if (!get_dev_aml_func(DEVICE(pdev))) {
+            /*
+             * Ignore all other devices on !0 functions unless they
+             * have AML description (i.e have get_dev_aml_func() != 0)
+             */
+            return true;
         }
+    }
+    return false;
+}
+
+static bool is_devfn_ignored_hotplug(const int devfn, const PCIBus *bus)
+{
+    if (bus->devices[devfn]) {
+        return is_devfn_ignored_generic(devfn, bus);
     } else { /* non populated slots */
-        /*
+         /*
          * hotplug is supported only for non-multifunction device
          * so generate device description only for function 0
          */
-        if (!bus_has_hotplug || PCI_FUNC(devfn) ||
+        if (PCI_FUNC(devfn) ||
             (pci_bus_is_express(bus) && PCI_SLOT(devfn) > 0)) {
             return true;
         }
@@ -419,29 +424,23 @@ static bool is_devfn_ignored(const int devfn, const PCIBus *bus,
     return false;
 }
 
-void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
+static void build_append_pcihp_slots(Aml *parent_scope, PCIBus *bus,
+                                     QObject *bsel)
 {
-    Aml *dev, *notify_method = NULL, *method;
-    QObject *bsel;
     int devfn;
+    Aml *dev, *notify_method = NULL, *method;
+    uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
-    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-    if (bsel) {
-        uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
-
-        aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
-        notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
-    }
+    aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
+    notify_method = aml_method("DVNT", 2, AML_NOTSERIALIZED);
 
     for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
         PCIDevice *pdev = bus->devices[devfn];
         int slot = PCI_SLOT(devfn);
-        int func = PCI_FUNC(devfn);
-        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
-        int adr = slot << 16 | func;
+        int adr = slot << 16 | PCI_FUNC(devfn);
         bool hotpluggbale_slot = true;
 
-        if (is_devfn_ignored(devfn, bus, !!bsel)) {
+        if (is_devfn_ignored_hotplug(devfn, bus)) {
             continue;
         }
 
@@ -452,24 +451,20 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
              */
             bool cold_plugged_bridge = IS_PCI_BRIDGE(pdev) &&
                                   !DEVICE(pdev)->hotplugged;
-            hotpluggbale_slot = bsel && DEVICE_GET_CLASS(pdev)->hotpluggable &&
+            hotpluggbale_slot = DEVICE_GET_CLASS(pdev)->hotpluggable &&
                                 !cold_plugged_bridge;
+            dev = aml_scope("S%.02X", devfn);
+        } else {
+            dev = aml_device("S%.02X", devfn);
+            aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
         }
 
-        /* start to compose PCI device descriptor */
-        dev = aml_device("S%.02X", devfn);
-        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
-
-        if (bsel) {
-            /*
-             * Can't declare _SUN here for every device as it changes 'slot'
-             * enumeration order in linux kernel, so use another variable for it
-             */
-            aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
-            aml_append(dev, aml_pci_device_dsm());
-        }
-
-        call_dev_aml_func(DEVICE(pdev), dev);
+        /*
+         * Can't declare _SUN here for every device as it changes 'slot'
+         * enumeration order in linux kernel, so use another variable for it
+         */
+        aml_append(dev, aml_name_decl("ASUN", aml_int(slot)));
+        aml_append(dev, aml_pci_device_dsm());
 
         if (hotpluggbale_slot) {
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
@@ -486,9 +481,37 @@ void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
         /* device descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
+    aml_append(parent_scope, notify_method);
+}
+
+void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus)
+{
+    QObject *bsel;
+    int devfn;
+    Aml *dev;
+
+    bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
+
+    for (devfn = 0; devfn < ARRAY_SIZE(bus->devices); devfn++) {
+        /* ACPI spec: 1.0b: Table 6-2 _ADR Object Bus Types, PCI type */
+        int adr = PCI_SLOT(devfn) << 16 | PCI_FUNC(devfn);
+
+        if (!bus->devices[devfn] || is_devfn_ignored_generic(devfn, bus)) {
+            continue;
+        }
+
+        /* start to compose PCI device descriptor */
+        dev = aml_device("S%.02X", devfn);
+        aml_append(dev, aml_name_decl("_ADR", aml_int(adr)));
+
+        call_dev_aml_func(DEVICE(bus->devices[devfn]), dev);
+
+        /* device descriptor has been composed, add it into parent context */
+        aml_append(parent_scope, dev);
+    }
 
     if (bsel) {
-        aml_append(parent_scope, notify_method);
+        build_append_pcihp_slots(parent_scope, bus, bsel);
     }
 
     qobject_unref(bsel);
-- 
MST


