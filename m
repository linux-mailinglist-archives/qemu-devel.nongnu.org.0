Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECE926DF7B
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Sep 2020 17:21:13 +0200 (CEST)
Received: from localhost ([::1]:57728 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIvih-0007O4-RJ
	for lists+qemu-devel@lfdr.de; Thu, 17 Sep 2020 11:21:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54666)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kIvPv-0001q7-NY
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 11:01:47 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:39359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kIvPp-00012o-AE
 for qemu-devel@nongnu.org; Thu, 17 Sep 2020 11:01:47 -0400
Received: by mail-pg1-x544.google.com with SMTP id d13so1515187pgl.6
 for <qemu-devel@nongnu.org>; Thu, 17 Sep 2020 08:01:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=Z7aNfB07N+MFsUa81RQnN73KV/KvOUxUEf7AXGwE9A4=;
 b=Uv2mj0YLdpPdqY05fsBpc5Yj81CkLoJlK56sdxv9QPUGBxOiTUBiGk9hUCrYclWSk/
 bUO9j+91P6QhpBS4MG5GslBS2aDqzK7ZEuPzPLBiOBotc3dCCEwqVuldP+2Yu8I/npQj
 KpiVM90Qns7mp3as2EgcP72wP8oJj8JzFy7kjb0LozWDeoyBgke86pd6OXNYi6p1JJS5
 GGUEKnxQktU/7Y0yc1L6Fjep+eAdjKNzdXvn5cdt/hU1WPe0/OPPsyB7nr5wF2YTKe9v
 GUXujNvJrJX7fHe+eAwZiCtyxMwlcivO500uRi53HdPfvT2TErGVCQwuCxBLntbCn9n8
 Bj7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=Z7aNfB07N+MFsUa81RQnN73KV/KvOUxUEf7AXGwE9A4=;
 b=jHVxvnlyurPsjBwF0Ekq3OgIkxirBI3TGLkKtj1Heka5jxJuuha5AaaA3/8FtSvG+8
 CN4Rzr0Pqymqw9trvJSXHu9t7nZzGosokrNJ6z8opyvw5vVVGZh4isFljV10IZfnqLfT
 bWGk+vTT823UmBbJgcl8QN8KZfW7i6pdbay5QcxVKynAV3lSSsPXeEqNq25ZTOxWsOO9
 iL6fJdAYqU4THz6rY6QpCqxkFGGgStctaXXT44DD+gBZ+f0p2N+zmCrX/PIXZgVcimJ2
 G4dVV7abN95X6vpJTkgfyAOwlO0nLcPOlaa9SMtIv19H0b+MgNPXgTTvCmuBWiLBrjzh
 KwYA==
X-Gm-Message-State: AOAM533kE+uIhnmWe/M5pxKfo47JCwg7HGDx1y21W+Q7Mug/ON4vuveL
 94ojC3xlvQy6eNUjgbxRWBe33u4sIHeUNyia
X-Google-Smtp-Source: ABdhPJykf3O0FrJ21ySjUd4VAXsyc48q0qBud/XDSkt360/UMo6kEYKNq3grDLS8XngJy/B+PCiD6w==
X-Received: by 2002:aa7:8249:0:b029:142:2501:34db with SMTP id
 e9-20020aa782490000b0290142250134dbmr11833603pfn.52.1600354895955; 
 Thu, 17 Sep 2020 08:01:35 -0700 (PDT)
Received: from localhost.localdomain ([115.96.151.231])
 by smtp.googlemail.com with ESMTPSA id e10sm17674374pgb.45.2020.09.17.08.01.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Sep 2020 08:01:35 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v8 09/12] piix4: don't reserve hw resources when hotplug is
 off globally
Date: Thu, 17 Sep 2020 20:30:41 +0530
Message-Id: <20200917150044.23159-10-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200917150044.23159-1-ani@anisinha.ca>
References: <20200917150044.23159-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::544;
 envelope-from=ani@anisinha.ca; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 jusual@redhat.com, =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When acpi hotplug is turned off for both root pci bus as well as for pci
bridges, we should not generate the related ACPI code for DSDT table or
initialize related hw ports or reserve hw resources. This change makes
sure all those operations are turned off in the case ACPI pci hotplug is
off globally.

In this change, we also make sure ACPI code for the PCNT method are only
added when bsel is enabled for the corresponding pci bus or bridge hotplug
is turned on.

As q35 machines do not use bsel for it's pci buses at this point in time, this
change affects DSDT acpi table for q35 machines as well. Therefore, we will
also need to commit the updated golden master DSDT table acpi binary blobs as
well. Follwoing is the list of blobs which needs updating:

 tests/data/acpi/q35/DSDT
 tests/data/acpi/q35/DSDT.acpihmat
 tests/data/acpi/q35/DSDT.bridge
 tests/data/acpi/q35/DSDT.cphp
 tests/data/acpi/q35/DSDT.dimmpxm
 tests/data/acpi/q35/DSDT.ipmibt
 tests/data/acpi/q35/DSDT.memhp
 tests/data/acpi/q35/DSDT.mmio64
 tests/data/acpi/q35/DSDT.numamem
 tests/data/acpi/q35/DSDT.tis

These tables are updated in the following commit. Without the updated table
blobs, the unit tests would fail with this patch.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/piix4.c      |  6 ++++--
 hw/i386/acpi-build.c | 25 ++++++++++++++++++-------
 2 files changed, 22 insertions(+), 9 deletions(-)

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index e6163bb6ce..b70b1f98af 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -596,8 +596,10 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                           "acpi-gpe0", GPE_LEN);
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
-    acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                    s->use_acpi_hotplug_bridge);
+    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug) {
+        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
+                        s->use_acpi_hotplug_bridge);
+    }
 
     s->cpu_hotplug_legacy = true;
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index e079b686f5..e41bb0992b 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -95,6 +95,7 @@ typedef struct AcpiPmInfo {
     bool s3_disabled;
     bool s4_disabled;
     bool pcihp_bridge_en;
+    bool pcihp_root_en;
     uint8_t s4_val;
     AcpiFadtData fadt;
     uint16_t cpu_hp_io_base;
@@ -245,6 +246,9 @@ static void acpi_get_pm_info(MachineState *machine, AcpiPmInfo *pm)
     pm->pcihp_bridge_en =
         object_property_get_bool(obj, "acpi-pci-hotplug-with-bridge-support",
                                  NULL);
+    pm->pcihp_root_en =
+        object_property_get_bool(obj, "acpi-root-pci-hotplug",
+                                 NULL);
 }
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
@@ -450,10 +454,12 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     }
 
     /* Append PCNT method to notify about events on local and child buses.
-     * Add unconditionally for root since DSDT expects it.
+     * Add this method for root bus only when hotplug is enabled since DSDT
+     * expects it.
      */
-    method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
-
+    if (bsel || pcihp_bridge_en) {
+        method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
+    }
     /* If bus supports hotplug select it and notify about local events */
     if (bsel) {
         uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
@@ -479,7 +485,10 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             aml_append(method, aml_name("^S%.02X.PCNT", devfn));
         }
     }
-    aml_append(parent_scope, method);
+
+    if (bsel || pcihp_bridge_en) {
+        aml_append(parent_scope, method);
+    }
     qobject_unref(bsel);
 }
 
@@ -1504,7 +1513,9 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         build_hpet_aml(dsdt);
         build_piix4_isa_bridge(dsdt);
         build_isa_devices_aml(dsdt);
-        build_piix4_pci_hotplug(dsdt);
+        if (pm->pcihp_bridge_en || pm->pcihp_root_en) {
+            build_piix4_pci_hotplug(dsdt);
+        }
         build_piix4_pci0_int(dsdt);
     } else {
         sb_scope = aml_scope("_SB");
@@ -1546,7 +1557,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     {
         aml_append(scope, aml_name_decl("_HID", aml_string("ACPI0006")));
 
-        if (misc->is_piix4) {
+        if (misc->is_piix4 && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
             method = aml_method("_E01", 0, AML_NOTSERIALIZED);
             aml_append(method,
                 aml_acquire(aml_name("\\_SB.PCI0.BLCK"), 0xFFFF));
@@ -1698,7 +1709,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     crs_range_set_free(&crs_range_set);
 
     /* reserve PCIHP resources */
-    if (pm->pcihp_io_len) {
+    if (pm->pcihp_io_len && (pm->pcihp_bridge_en || pm->pcihp_root_en)) {
         dev = aml_device("PHPR");
         aml_append(dev, aml_name_decl("_HID", aml_string("PNP0A06")));
         aml_append(dev,
-- 
2.17.1


