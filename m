Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 28A3924B0ED
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Aug 2020 10:18:30 +0200 (CEST)
Received: from localhost ([::1]:39274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1k8fmH-0000CT-61
	for lists+qemu-devel@lfdr.de; Thu, 20 Aug 2020 04:18:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1k8flE-0007c9-3K
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 04:17:24 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c]:40019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1k8flB-0003G3-Ue
 for qemu-devel@nongnu.org; Thu, 20 Aug 2020 04:17:23 -0400
Received: by mail-pl1-x62c.google.com with SMTP id u10so685522plr.7
 for <qemu-devel@nongnu.org>; Thu, 20 Aug 2020 01:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id;
 bh=YOiBU0s4yU1BUld7E7RNQYJwKzqxVPPyliOfDa3bUPQ=;
 b=SewWIlJZo5I1BBn0QF2KAZ9i7bKJ26NdjMSm8V5D5sEUFPL+MWbtPszYbmFy6Z+hjg
 VkL4o32q9M8wXuJJCDG/qkGOEaDR0E0ZK/wa3S2Vww65piZ267vRbLk6wZP8kWSlO4Cl
 I8C7TBx9rBwdhsQEK3JJzdR2IAfxFhwMj8W5Ed/Mp/SBhyWQ+RBM9eu3biJftQnO7bH7
 68iApYQCuOG8DikoLvUkGifH5G1JTfR4IAZTYEIsK6ck2Ontj/IbHS7ibZi/3tGa3N/f
 uLtNSqaRXuY8NAJv5QNHxWGttYY198yvbkmTgX3ZV9XyKekQ3D2NglGSiwqnQ6bhGNtp
 1lCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=YOiBU0s4yU1BUld7E7RNQYJwKzqxVPPyliOfDa3bUPQ=;
 b=HFx3AU69zyW5f65avd3V5XAJqRsDnfuHLVqCYQodUxkJPJ+WBdOphXN6JqsEG97HJm
 oPaHL9+VlWh/WfjxRvKc+bYniI18K4uK1WHQir5r355GIbUvdJoZLmfL03ueL3LdZb9W
 CCNk+AL7meqlk2F967KoptEws1yDVyHuujZwtHMYqKARORh/boCcowhiYO+2Bgo7mxHk
 E16Ddm0ktj0zcjDpZ809FO2TOAgzg4kAiRo08shcrBlbeE4Lo821S+QgoSbZUW77VLy0
 Ni3NRqgYYiP7/S3bWQpwVEDtCF/TI1+7+ZFsJLI5T6wrUGoZrQ0TmKhLItCmTgDViYPF
 6msg==
X-Gm-Message-State: AOAM533OrXhY3ZiiGlONfrQ8LIurnJzzCTRQDyhTmOqEuwQ9kQUemhGv
 1iCjLFHx56ACLzOgRFTOYN2NPtRkC0QEfjrc
X-Google-Smtp-Source: ABdhPJw8Ab7p7w2JBUWoh7sHg1NclmJ9PbOn2fFL6cGmeulP6ZhIJ08d3iX3s5FoMlA+lLuNc3CZmg==
X-Received: by 2002:a17:90b:138d:: with SMTP id
 hr13mr1008643pjb.14.1597911439920; 
 Thu, 20 Aug 2020 01:17:19 -0700 (PDT)
Received: from localhost.localdomain ([115.96.156.17])
 by smtp.googlemail.com with ESMTPSA id m19sm1671339pgd.21.2020.08.20.01.17.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Aug 2020 01:17:18 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH V5] Introduce a new flag for i440fx to disable PCI hotplug on
 the root bus
Date: Thu, 20 Aug 2020 13:46:59 +0530
Message-Id: <20200820081659.17328-1-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
Received-SPF: none client-ip=2607:f8b0:4864:20::62c;
 envelope-from=ani@anisinha.ca; helo=mail-pl1-x62c.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We introduce a new global flag 'acpi-root-pci-hotplug' for i440fx with which
we can turn on or off PCI device hotplug on the root bus. This flag can be
used to prevent all PCI devices from getting hotplugged or unplugged from the
root PCI bus.
This feature is targetted mostly towards Windows VMs. It is useful in cases
where some hypervisor admins want to deploy guest VMs in a way so that the
users of the guest OSes are not able to hot-eject certain PCI devices from
the Windows system tray. Laine has explained the use case here in detail:
https://www.redhat.com/archives/libvir-list/2020-February/msg00110.html

Julia has resolved this issue for PCIE buses with the following commit:
530a0963184e57e71a5b538 ("pcie_root_port: Add hotplug disabling option")

This commit attempts to introduce similar behavior for PCI root buses used in
i440fx machine types (although in this case, we do not have a per-slot
capability to turn hotplug on or off).

Usage:
   -global PIIX4_PM.acpi-root-pci-hotplug=off

By default, this option is enabled which means that hotplug is turned on for
the PCI root bus.

The previously existing flag 'acpi-pci-hotplug-with-bridge-support' for PCI-PCI
bridges remain as is and can be used along with this new flag to control PCI
hotplug on PCI bridges.

This change has been tested using a Windows 2012R2 server guest image and also
with a Windows 2019 server guest image on a Ubuntu 18.04 host using the latest
master qemu from upstream.

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/piix4.c      |  8 ++++++--
 hw/i386/acpi-build.c | 26 +++++++++++++++++++-------
 2 files changed, 25 insertions(+), 9 deletions(-)

Change Log:
V4..V5: Updated commit message to reflect the fact that testing was also
performed on a Windows 2019 server guest image. Minor commit log formatting
to make sure 80 col rule is enforced.

diff --git a/hw/acpi/piix4.c b/hw/acpi/piix4.c
index 26bac4f16c..4f436e5bf3 100644
--- a/hw/acpi/piix4.c
+++ b/hw/acpi/piix4.c
@@ -78,6 +78,7 @@ typedef struct PIIX4PMState {
 
     AcpiPciHpState acpi_pci_hotplug;
     bool use_acpi_hotplug_bridge;
+    bool use_acpi_root_pci_hotplug;
 
     uint8_t disable_s3;
     uint8_t disable_s4;
@@ -595,8 +596,9 @@ static void piix4_acpi_system_hot_add_init(MemoryRegion *parent,
                           "acpi-gpe0", GPE_LEN);
     memory_region_add_subregion(parent, GPE_BASE, &s->io_gpe);
 
-    acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
-                    s->use_acpi_hotplug_bridge);
+    if (s->use_acpi_hotplug_bridge || s->use_acpi_root_pci_hotplug)
+        acpi_pcihp_init(OBJECT(s), &s->acpi_pci_hotplug, bus, parent,
+                        s->use_acpi_hotplug_bridge);
 
     s->cpu_hotplug_legacy = true;
     object_property_add_bool(OBJECT(s), "cpu-hotplug-legacy",
@@ -635,6 +637,8 @@ static Property piix4_pm_properties[] = {
     DEFINE_PROP_UINT8(ACPI_PM_PROP_S4_VAL, PIIX4PMState, s4_val, 2),
     DEFINE_PROP_BOOL("acpi-pci-hotplug-with-bridge-support", PIIX4PMState,
                      use_acpi_hotplug_bridge, true),
+    DEFINE_PROP_BOOL("acpi-root-pci-hotplug", PIIX4PMState,
+                     use_acpi_root_pci_hotplug, true),
     DEFINE_PROP_BOOL("memory-hotplug-support", PIIX4PMState,
                      acpi_memory_hotplug.is_enabled, true),
     DEFINE_PROP_END_OF_LIST(),
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index b7bcbbbb2a..19a1702ad1 100644
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
+        object_property_get_bool(obj, "acpi-root-pci-hotplug", NULL);
+
 }
 
 static void acpi_get_misc_info(AcpiMiscInfo *info)
@@ -337,15 +341,18 @@ static void build_append_pcihp_notify_entry(Aml *method, int slot)
 }
 
 static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
-                                         bool pcihp_bridge_en)
+                                         bool pcihp_bridge_en,
+                                         bool pcihp_root_en)
 {
     Aml *dev, *notify_method = NULL, *method;
     QObject *bsel;
     PCIBus *sec;
     int i;
+    bool root_bus = pci_bus_is_root(bus);
+    bool root_pcihp_disabled = (root_bus && !pcihp_root_en);
 
     bsel = object_property_get_qobject(OBJECT(bus), ACPI_PCIHP_PROP_BSEL, NULL);
-    if (bsel) {
+    if (bsel && !root_pcihp_disabled) {
         uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
         aml_append(parent_scope, aml_name_decl("BSEL", aml_int(bsel_val)));
@@ -361,6 +368,9 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
         bool bridge_in_acpi;
 
         if (!pdev) {
+            /* skip if pci hotplug for the root bus is disabled */
+            if (root_pcihp_disabled)
+                continue;
             if (bsel) { /* add hotplug slots for non present devices */
                 dev = aml_device("S%.02X", PCI_DEVFN(slot, 0));
                 aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
@@ -419,7 +429,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
             method = aml_method("_S3D", 0, AML_NOTSERIALIZED);
             aml_append(method, aml_return(aml_int(s3d)));
             aml_append(dev, method);
-        } else if (hotplug_enabled_dev) {
+        } else if (hotplug_enabled_dev && !root_pcihp_disabled) {
             /* add _SUN/_EJ0 to make slot hotpluggable  */
             aml_append(dev, aml_name_decl("_SUN", aml_int(slot)));
 
@@ -439,13 +449,14 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
              */
             PCIBus *sec_bus = pci_bridge_get_sec_bus(PCI_BRIDGE(pdev));
 
-            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en);
+            build_append_pci_bus_devices(dev, sec_bus, pcihp_bridge_en,
+                                         pcihp_root_en);
         }
         /* slot descriptor has been composed, add it into parent context */
         aml_append(parent_scope, dev);
     }
 
-    if (bsel) {
+    if (bsel && !root_pcihp_disabled) {
         aml_append(parent_scope, notify_method);
     }
 
@@ -455,7 +466,7 @@ static void build_append_pci_bus_devices(Aml *parent_scope, PCIBus *bus,
     method = aml_method("PCNT", 0, AML_NOTSERIALIZED);
 
     /* If bus supports hotplug select it and notify about local events */
-    if (bsel) {
+    if (bsel && !root_pcihp_disabled) {
         uint64_t bsel_val = qnum_get_uint(qobject_to(QNum, bsel));
 
         aml_append(method, aml_store(aml_int(bsel_val), aml_name("BNUM")));
@@ -1818,7 +1829,8 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         if (bus) {
             Aml *scope = aml_scope("PCI0");
             /* Scan all PCI buses. Generate tables to support hotplug. */
-            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en);
+            build_append_pci_bus_devices(scope, bus, pm->pcihp_bridge_en,
+                                         pm->pcihp_root_en);
 
             if (TPM_IS_TIS_ISA(tpm)) {
                 if (misc->tpm_version == TPM_VERSION_2_0) {
-- 
2.17.1


