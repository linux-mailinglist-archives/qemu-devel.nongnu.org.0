Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 146FD26A90F
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Sep 2020 17:48:25 +0200 (CEST)
Received: from localhost ([::1]:40236 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kIDBv-0006K9-RH
	for lists+qemu-devel@lfdr.de; Tue, 15 Sep 2020 11:48:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kID36-0004qI-NI
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 11:39:17 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:39075)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <ani@anisinha.ca>) id 1kID33-0004b3-Uh
 for qemu-devel@nongnu.org; Tue, 15 Sep 2020 11:39:15 -0400
Received: by mail-pj1-x1044.google.com with SMTP id v14so1889103pjd.4
 for <qemu-devel@nongnu.org>; Tue, 15 Sep 2020 08:39:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=anisinha-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=ZKPQsZCn3AYXjeQ8NqWVPFgmNOPtgRDQWeIWuU60oWk=;
 b=C/8MT0a/ZLR3z9VOAKliS5/wOMrG1rExgwzTQiNeP9q5kZ+7wjwjmTCt9qd3EFnxzB
 C6V+OYXA9YUL2PKycQ+qdE1+Z0Xg6L8ntRNEo2Zyl/Zin3Dxazch+zzA9ONtu4r9rLa/
 xc7rv0S25trrs+Hk7uXSLu6b1BPIn+m6XRI7eEboj07vdE2swITx7QmrPIME1BLyiufG
 YKTFUHt7ovR7fxSLNRpr6r0w3U9CmaMwKGnUWKRvzzLFr2+7XW7VAT/DAPw63uBu1+m0
 EPytVa3nE1ojvxzoR+yKn/sK92cC+2aHimdoKNx9bkn1LgigTxq9cQUMebb2Ro+lyi35
 u4Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=ZKPQsZCn3AYXjeQ8NqWVPFgmNOPtgRDQWeIWuU60oWk=;
 b=Z7H7N/AyvDRaek1niLFE8qCUZB4nmaFXYyomsk8CpcgwEJW/8krKcv5RIyIAdJryAJ
 N1cX16dm8xVQDVpxksoSxIsvvk6DxEJdVr+HuRT+tsSeY/IL/BVCFSW270FRYrupKtw5
 J3SVQezFuiqE/bXr4NGiREdW9KPMD5zGjaubfCl5kF3PvopkhJhXIpcPlk1//mf+v1ZK
 5Issoa79UWpVDjtakqTQs2JvyqPwUpfKvPHy+S7rEQzhoMCbIlySRMptDdJl3nB0IvGY
 fkqXmRlbyqSz+59Q/3oQ+leHdUZdX5NPLeNWnhaM6Fm81loo7RNLCjodoZwSvZztot1D
 ayyg==
X-Gm-Message-State: AOAM530vLQNSRhC2EVmozo/3mPnLE1OkBVhfy7hqsjFbJWgblTq9IjS9
 HbbtM+U3IgKfpF64plK79jv9HIsidBvf5EYa
X-Google-Smtp-Source: ABdhPJyy0EnD2JE1i7ZIyoGnOz7Dr6XEEFhcLGnp0wwMtWRzhSUTIapiu00TZSmFGzna8/j7boymgQ==
X-Received: by 2002:a17:90a:a78d:: with SMTP id
 f13mr4813437pjq.69.1600184351827; 
 Tue, 15 Sep 2020 08:39:11 -0700 (PDT)
Received: from localhost.localdomain ([115.96.130.76])
 by smtp.googlemail.com with ESMTPSA id 194sm13283547pfy.44.2020.09.15.08.39.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 08:39:10 -0700 (PDT)
From: Ani Sinha <ani@anisinha.ca>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 9/9] piix4: don't reserve hw resources when hotplug is off
 globally
Date: Tue, 15 Sep 2020 21:08:18 +0530
Message-Id: <20200915153818.13020-10-ani@anisinha.ca>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200915153818.13020-1-ani@anisinha.ca>
References: <20200915153818.13020-1-ani@anisinha.ca>
Received-SPF: none client-ip=2607:f8b0:4864:20::1044;
 envelope-from=ani@anisinha.ca; helo=mail-pj1-x1044.google.com
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
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
 Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Ani Sinha <ani@anisinha.ca>,
 Igor Mammedov <imammedo@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When acpi hotplug is turned off for both root pci bus as well as for pci
bridges, we should not generate the related amls for DSDT table or initialize
related hw ports or reserve hw resources. This change makes sure all those
operations are turned off in the case acpi pci hotplug is off globally.

In this change, we also make sure AMLs for the PCNT method are only added when
bsel is enabled for the corresponding pci bus or bridge hotplug is turned on.
As a result, when the hotplug for both the root pci device and bridge are
disabled, this AML in the DSDT acpi table is turned off.

As q35 machines do not use bsel for it's pci buses at this point in time, this
change affects DSDT acpi table for q35 machines as well. Therefore, we also
commit the updated golden master DSDT table acpi binary blobs as well.

Following is a typical diff between the q35 acpi DSDT table blobs:

@@ -1,30 +1,30 @@
 /*
  * Intel ACPI Component Architecture
  * AML/ASL+ Disassembler version 20180105 (64-bit version)
  * Copyright (c) 2000 - 2018 Intel Corporation
  *
  * Disassembling to symbolic ASL+ operators
  *
- * Disassembly of tests/data/acpi/q35/DSDT, Tue Sep 15 18:52:47 2020
+ * Disassembly of /tmp/aml-3O0DR0, Tue Sep 15 18:52:47 2020
  *
  * Original Table Header:
  *     Signature        "DSDT"
- *     Length           0x00001DFE (7678)
+ *     Length           0x00001DF6 (7670)
  *     Revision         0x01 **** 32-bit table (V1), no 64-bit math support
- *     Checksum         0xAC
+ *     Checksum         0x17
  *     OEM ID           "BOCHS "
  *     OEM Table ID     "BXPCDSDT"
  *     OEM Revision     0x00000001 (1)
  *     Compiler ID      "BXPC"
  *     Compiler Version 0x00000001 (1)
  */
 DefinitionBlock ("", "DSDT", 1, "BOCHS ", "BXPCDSDT", 0x00000001)
 {
     Scope (\)
     {
         OperationRegion (DBG, SystemIO, 0x0402, One)
         Field (DBG, ByteAcc, NoLock, Preserve)
         {
             DBGB,   8
         }

@@ -3113,24 +3113,20 @@
                 Name (_ADR, 0x00010000)  // _ADR: Address
                 Method (_S1D, 0, NotSerialized)  // _S1D: S1 Device State
                 {
                     Return (Zero)
                 }

                 Method (_S2D, 0, NotSerialized)  // _S2D: S2 Device State
                 {
                     Return (Zero)
                 }

                 Method (_S3D, 0, NotSerialized)  // _S3D: S3 Device State
                 {
                     Return (Zero)
                 }
             }
-
-            Method (PCNT, 0, NotSerialized)
-            {
-            }
         }
     }
 }

Signed-off-by: Ani Sinha <ani@anisinha.ca>
---
 hw/acpi/piix4.c                   |   6 ++++--
 hw/i386/acpi-build.c              |  25 ++++++++++++++++++-------
 tests/data/acpi/q35/DSDT          | Bin 7678 -> 7670 bytes
 tests/data/acpi/q35/DSDT.acpihmat | Bin 9002 -> 8994 bytes
 tests/data/acpi/q35/DSDT.bridge   | Bin 7695 -> 7688 bytes
 tests/data/acpi/q35/DSDT.cphp     | Bin 8141 -> 8133 bytes
 tests/data/acpi/q35/DSDT.dimmpxm  | Bin 9331 -> 9323 bytes
 tests/data/acpi/q35/DSDT.ipmibt   | Bin 7753 -> 7745 bytes
 tests/data/acpi/q35/DSDT.memhp    | Bin 9037 -> 9029 bytes
 tests/data/acpi/q35/DSDT.mmio64   | Bin 8808 -> 8801 bytes
 tests/data/acpi/q35/DSDT.numamem  | Bin 7684 -> 7676 bytes
 tests/data/acpi/q35/DSDT.tis      | Bin 8283 -> 8276 bytes
 12 files changed, 22 insertions(+), 9 deletions(-)

change log:
v1: initial patch.
v2: fixed a bug and added acpi DSDT table blobs for q35 to make unit tests pass.
v3: fixed another bug.

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
diff --git a/tests/data/acpi/q35/DSDT b/tests/data/acpi/q35/DSDT
index bba8884073a27427b88ac0d733c9c87330a59366..4fad91b72e279b744b0528fd687c862d3a3d5cfa 100644
GIT binary patch
delta 33
pcmexo{mq)oCD<k8n=AtZqxeRyWwM-ZEHUxHPVoYElXuD50sy=Q3Pb<^

delta 42
ycmexn{m+`qCD<k8pDY6d<C=|J%VfFySYqOXo#F-DSSIh3wPhD!3vl)eVE_Owj0{Tv

diff --git a/tests/data/acpi/q35/DSDT.acpihmat b/tests/data/acpi/q35/DSDT.acpihmat
index 9cac92418b5fcc2767dc74603d599642b59623fe..e4df7d1ca89578dd81be3539c8f83f073bb8db25 100644
GIT binary patch
delta 33
pcmZ4Gw#bdkCD<iINtuCx@ySN6OG=z>EHUxHPVoYElb<Qs0syHh3KIYT

delta 42
xcmZ4Fw#tpmCD<iIOPPUzv2r8VB_%FDmYDcpr+5K3mdQ_*Y}rNF0-XIq7y$jZ3mO0b

diff --git a/tests/data/acpi/q35/DSDT.bridge b/tests/data/acpi/q35/DSDT.bridge
index f08b7245f59aad491fcaa60e2bab1085c369ea1c..065399174575442201cc09ffa4939ddf90ac81b4 100644
GIT binary patch
delta 33
ocmeCT>9FB)33dtLkYiwAT)&ZPnJlLVYfOBwQ@nt~<ejqq0G06xDgXcg

delta 41
wcmeCM>9^r>33dtLmt$aH^xnv|OqSE1H6}jTDPF*R@=jTQb`iD!XTJ~z0NaZSF#rGn

diff --git a/tests/data/acpi/q35/DSDT.cphp b/tests/data/acpi/q35/DSDT.cphp
index 57d859cef9fa16a8f125c4b338611c8472699f38..8d2395e3cb4383b30e3840caed0d09ccad0c7323 100644
GIT binary patch
delta 33
ocmX?Wf7G7KCD<k8s5}D$<AjY|rShC^EHUxHPVoYElRM>Y0kO^r)&Kwi

delta 42
xcmX?Vf7YJMCD<k8tULn)qv}SkQh6>vmYDcpr+5K3mdPFRw(KHo0nUCQ3;+bB3f%wz

diff --git a/tests/data/acpi/q35/DSDT.dimmpxm b/tests/data/acpi/q35/DSDT.dimmpxm
index 9d5bd5744e2ba2e0f6126c3aba0bb36af865e499..df7422051c6feadeaa3b6733ad7efa67c339b49d 100644
GIT binary patch
delta 33
ocmezD@!EsSCD<h-TZMsvF>)i9v<jyiOH6#QQ@nuPWPKG|0ILxQ{r~^~

delta 42
xcmaFu@!5mRCD<jTScQRs@!du)X%#L%mYDcpr+5K3mdSc5w(KHo0nUCQ3;+_P3k3iG

diff --git a/tests/data/acpi/q35/DSDT.ipmibt b/tests/data/acpi/q35/DSDT.ipmibt
index 5cd11de6a8fe47324e5f922823a22746882f19f5..c4ce5cc0ede822ea82656d078d7a8b7eee4a7516 100644
GIT binary patch
delta 33
ocmX?UbI^v%CD<jzQI3Iu(Q6~uM_EocmYDcpr+5Lo$*gj=0Hl8i@&Et;

delta 42
xcmX?TbJB*(CD<jzQ;vaw@%~1xkFs2TEHUxHPVoY6ER$K}Y}rNF0-XIq7yt{`3i$v4

diff --git a/tests/data/acpi/q35/DSDT.memhp b/tests/data/acpi/q35/DSDT.memhp
index 05a7a73ec43130d5c3018bb462fd84981bfb151c..84614ffc1452358053b4c2be4b2edcb4d56a9ae6 100644
GIT binary patch
delta 33
ocmX@>cGQi_CD<jzRhfZ-kz*s*S0zq2mYDcpr+5Lo$(+iz0Hk>c=Kufz

delta 42
xcmX@=cGiu{CD<jzSDAr<aqdR0uS#5gEHUxHPVoY6ER#8uZP`WG0-XIq7yt`p3hn>^

diff --git a/tests/data/acpi/q35/DSDT.mmio64 b/tests/data/acpi/q35/DSDT.mmio64
index efd3f1188f2b55da1514212d4be081a61c2a96e9..d8dd702b69cc24a6b58b8eaa79ea02439a2a7dd9 100644
GIT binary patch
delta 33
ocmaFi^3a9LCD<h-QHg<paqmX1|B9R*tTFMyPVoW`lZBN00lUBo5&!@I

delta 41
wcmaFp^1_A7CD<h-Ly3WbF>)i<e??Az)|mKUr+5MP$wEs0>>_Ld&VC^b00^lI82|tP

diff --git a/tests/data/acpi/q35/DSDT.numamem b/tests/data/acpi/q35/DSDT.numamem
index 1978b55f1255402bf9bade0b91150b5cb49789a4..f36d22063a6eed4fb107ffd0e10477a2d6d7a983 100644
GIT binary patch
delta 33
pcmZp%`D4xH66_N4N0xzs@!&?THL{#;EHUxHPVoYElMl$+0sy+k3XK2&

delta 42
xcmexk-D1P#66_MfBFDhM7`l;bjVzZROH6#QQ@ns1%jEsCw(KHo0nUCQ3;^@W3X}i<

diff --git a/tests/data/acpi/q35/DSDT.tis b/tests/data/acpi/q35/DSDT.tis
index 638de3872673d17b1958497d0e62c83653de1602..203030a61a92c204bb93c43fe79e546471ae2985 100644
GIT binary patch
delta 38
ucmccZaK(YkCD<h-M1g^U@x?~2O|qOGnlbUgPVoW`laI>UZRU~-WC8&31`DbH

delta 45
zcmccOaNB{)CD<h-T7iLqv1KFICRt8@&6xOLr+5MP$wy`F*hJU@oc%&JGsy)p0RTF+
B45<JB

-- 
2.17.1


