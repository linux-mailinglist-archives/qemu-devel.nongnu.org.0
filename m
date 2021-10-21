Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C726435FBE
	for <lists+qemu-devel@lfdr.de>; Thu, 21 Oct 2021 12:54:28 +0200 (CEST)
Received: from localhost ([::1]:58266 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mdViN-0008Ix-5T
	for lists+qemu-devel@lfdr.de; Thu, 21 Oct 2021 06:54:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37358)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVY8-0002TG-LT
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35598)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peterx@redhat.com>) id 1mdVY6-0003b7-JA
 for qemu-devel@nongnu.org; Thu, 21 Oct 2021 06:43:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634813028;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Xh54kiHT0i6I588s5LcRb0tKQb3jeRCY3nUsIqN63CM=;
 b=NBVps8Uye+x1qFyl2kMmxgfRQQ8vszM5JFLgRzZ4raAGqd75c6+gqbS2pjMx5nXbZVHjsn
 NpY5VNqjYRs7sQTyM63Fe0bZDjkJ97GfyyQ3OPDwQVB3OyqD5rygSC93DuBbPaOxije4Zx
 /FGtycnSLd8Fa2YI9+be4QuVmQrkl2M=
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-gowHznN6NOyoBe3bnC3dhg-1; Thu, 21 Oct 2021 06:43:47 -0400
X-MC-Unique: gowHznN6NOyoBe3bnC3dhg-1
Received: by mail-pg1-f199.google.com with SMTP id
 i14-20020a63d44e000000b002955652e9deso14899217pgj.16
 for <qemu-devel@nongnu.org>; Thu, 21 Oct 2021 03:43:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Xh54kiHT0i6I588s5LcRb0tKQb3jeRCY3nUsIqN63CM=;
 b=7QMihlj2mjxkxTJIhEPX1C2v/HXRmLP1YAbg8AGDZDemXbuRb/NhOtnTkdOIhyeu9R
 IPSlUf92d2Yt7NMTFO7tyLSq5R5w9aRkZZRfz3ffSvqyYls8/5XA4t+bnizfcM5PinZ0
 q6zpQsdQ6wDOkWVi9aVqPYyRDfXO9VHM+n0MMtrHrCaHvQ4jDNnCzoKPZq7MosphafI2
 8Va1DMzdBjwAgzL+GCVDk9XZnXIzaKrAFt9IDlkyp9BLkqo/DJotPP7Gp4m+x5diRLuB
 m2QNVaFWxKDrn/aiQA3Ior2kjudSZYpRqo31elY1+/5/SqyOvxoZzcxZU5wG6YWitJuu
 NGxw==
X-Gm-Message-State: AOAM531fsOWgqdeoJcxqixHNEimS0BR5FY0WFvLYWgMe35KNk83z/h7z
 edq+sr2HjHIgXVG4R7RQJLZMQXzIF7OkCW3HMA/y/ZvHv7V1NuVvazXnDycY2cYYIcURsrou5S4
 XXHFLb/oN266eBkXUkF5zsnbzUffovyOOjlq5LDqRVgGv/47Jz/jXrdvf4F4Lr04a
X-Received: by 2002:a05:6a00:190d:b0:46d:516c:4ed9 with SMTP id
 y13-20020a056a00190d00b0046d516c4ed9mr2959429pfi.57.1634813025967; 
 Thu, 21 Oct 2021 03:43:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw+t+eyvqxBEilF1qSUacufCy9dHNU7uvmc3/r+uEL5av1niKBR+Uxg9P01vkICIpRddJcgOQ==
X-Received: by 2002:a05:6a00:190d:b0:46d:516c:4ed9 with SMTP id
 y13-20020a056a00190d00b0046d516c4ed9mr2959383pfi.57.1634813025597; 
 Thu, 21 Oct 2021 03:43:45 -0700 (PDT)
Received: from localhost.localdomain ([84.17.34.135])
 by smtp.gmail.com with ESMTPSA id e1sm5246893pgi.43.2021.10.21.03.43.40
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Oct 2021 03:43:45 -0700 (PDT)
From: Peter Xu <peterx@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 6/8] pci: Use pci_for_each_root_bus() in current code
Date: Thu, 21 Oct 2021 18:42:57 +0800
Message-Id: <20211021104259.57754-7-peterx@redhat.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211021104259.57754-1-peterx@redhat.com>
References: <20211021104259.57754-1-peterx@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=peterx@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=peterx@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S . Tsirkin" <mst@redhat.com>,
 Jason Wang <jasowang@redhat.com>, David Hildenbrand <david@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, peterx@redhat.com,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eric Auger <eric.auger@redhat.com>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There're three places that can be rewritten with the pci_for_each_root_bus()
helper that we just introduced.  De-dup the code.

Signed-off-by: Peter Xu <peterx@redhat.com>
---
 hw/arm/virt-acpi-build.c | 31 +++++++++++--------------------
 hw/i386/acpi-build.c     | 38 ++++++++++----------------------------
 2 files changed, 21 insertions(+), 48 deletions(-)

diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index 6cec97352b..54b82aa863 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -263,28 +263,20 @@ struct AcpiIortIdMapping {
 typedef struct AcpiIortIdMapping AcpiIortIdMapping;
 
 /* Build the iort ID mapping to SMMUv3 for a given PCI host bridge */
-static int
-iort_host_bridges(Object *obj, void *opaque)
+static void
+iort_host_bridges(PCIBus *bus, void *opaque)
 {
-    GArray *idmap_blob = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
-        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
-
-        if (bus && !pci_bus_bypass_iommu(bus)) {
-            int min_bus, max_bus;
+    if (!pci_bus_bypass_iommu(bus)) {
+        int min_bus, max_bus;
 
-            pci_bus_range(bus, &min_bus, &max_bus);
+        pci_bus_range(bus, &min_bus, &max_bus);
 
-            AcpiIortIdMapping idmap = {
-                .input_base = min_bus << 8,
-                .id_count = (max_bus - min_bus + 1) << 8,
-            };
-            g_array_append_val(idmap_blob, idmap);
-        }
+        AcpiIortIdMapping idmap = {
+            .input_base = min_bus << 8,
+            .id_count = (max_bus - min_bus + 1) << 8,
+        };
+        g_array_append_val((GArray *)opaque, idmap);
     }
-
-    return 0;
 }
 
 static int iort_idmap_compare(gconstpointer a, gconstpointer b)
@@ -318,8 +310,7 @@ build_iort(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
     if (vms->iommu == VIRT_IOMMU_SMMUV3) {
         AcpiIortIdMapping next_range = {0};
 
-        object_child_foreach_recursive(object_get_root(),
-                                       iort_host_bridges, smmu_idmaps);
+        pci_for_each_root_bus(iort_host_bridges, smmu_idmaps);
 
         /* Sort the smmu idmap by input_base */
         g_array_sort(smmu_idmaps, iort_idmap_compare);
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index a76b17ed92..3e50acfe35 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -2123,20 +2123,12 @@ insert_scope(PCIBus *bus, PCIDevice *dev, void *opaque)
 }
 
 /* For a given PCI host bridge, walk and insert DMAR scope */
-static int
-dmar_host_bridges(Object *obj, void *opaque)
+static void
+dmar_host_bridges(PCIBus *bus, void *opaque)
 {
-    GArray *scope_blob = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
-        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
-
-        if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device_under_bus(bus, insert_scope, scope_blob);
-        }
+    if (!pci_bus_bypass_iommu(bus)) {
+        pci_for_each_device_under_bus(bus, insert_scope, opaque);
     }
-
-    return 0;
 }
 
 /*
@@ -2165,8 +2157,7 @@ build_dmar_q35(GArray *table_data, BIOSLinker *linker, const char *oem_id,
      * Insert scope for each PCI bridge and endpoint device which
      * is attached to a bus with iommu enabled.
      */
-    object_child_foreach_recursive(object_get_root(),
-                                   dmar_host_bridges, scope_blob);
+    pci_for_each_root_bus(dmar_host_bridges, scope_blob);
 
     assert(iommu);
     if (x86_iommu_ir_supported(iommu)) {
@@ -2329,20 +2320,12 @@ insert_ivhd(PCIBus *bus, PCIDevice *dev, void *opaque)
 }
 
 /* For all PCI host bridges, walk and insert IVHD entries */
-static int
-ivrs_host_bridges(Object *obj, void *opaque)
+static void
+ivrs_host_bridges(PCIBus *bus, void *opaque)
 {
-    GArray *ivhd_blob = opaque;
-
-    if (object_dynamic_cast(obj, TYPE_PCI_HOST_BRIDGE)) {
-        PCIBus *bus = PCI_HOST_BRIDGE(obj)->bus;
-
-        if (bus && !pci_bus_bypass_iommu(bus)) {
-            pci_for_each_device_under_bus(bus, insert_ivhd, ivhd_blob);
-        }
+    if (!pci_bus_bypass_iommu(bus)) {
+        pci_for_each_device_under_bus(bus, insert_ivhd, opaque);
     }
-
-    return 0;
 }
 
 static void
@@ -2380,8 +2363,7 @@ build_amd_iommu(GArray *table_data, BIOSLinker *linker, const char *oem_id,
      * blob further below.  Fall back to an entry covering all devices, which
      * is sufficient when no aliases are present.
      */
-    object_child_foreach_recursive(object_get_root(),
-                                   ivrs_host_bridges, ivhd_blob);
+    pci_for_each_root_bus(ivrs_host_bridges, ivhd_blob);
 
     if (!ivhd_blob->len) {
         /*
-- 
2.32.0


