Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D322112470F
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Dec 2019 13:39:50 +0100 (CET)
Received: from localhost ([::1]:53602 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ihYcH-00063X-AT
	for lists+qemu-devel@lfdr.de; Wed, 18 Dec 2019 07:39:49 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51266)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3S-0006iR-5S
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <paolo.bonzini@gmail.com>) id 1ihY3Q-0001cy-79
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:49 -0500
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d]:51664)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <paolo.bonzini@gmail.com>)
 id 1ihY3P-0001ZW-TB
 for qemu-devel@nongnu.org; Wed, 18 Dec 2019 07:03:48 -0500
Received: by mail-wm1-x32d.google.com with SMTP id d73so1563189wmd.1
 for <qemu-devel@nongnu.org>; Wed, 18 Dec 2019 04:03:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:subject:date:message-id:in-reply-to:references;
 bh=ToK2OtnJ76oO0K5jmaY8PLTL4AZ+PoZe2UIvk4xI5zw=;
 b=MNPZIVg0oGlWOD0hmb+ikmSFSYW4gGOR3FHSr4+CshFYOw6nw/lDu9IZ3D172zOCe0
 rp9I+lmZcBh1nBigPg+bA/Ige+q3xPVhoHakcCq3B4+s2s2P/glKkU7ZL6qaHjdiSMcP
 vteokl8k6zniom70oQanHVkxlYfD1hBGPpC8WlG+qpSZb4UTF9eYW+lo8y9jvcylc+dX
 6/PCpbvpLzQohVPwMT/AJ3g90Z1KQFOStQZPIbITPxeH1mRL/kRWyzxojON8T8YZEceS
 +rs27Eq4jx5mX7D/GA0yvVcRnHE5SlJaRL0ptcFkq1h2Zw+raDY8/5I3Dq0rpHKsKBO9
 6I2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:subject:date:message-id
 :in-reply-to:references;
 bh=ToK2OtnJ76oO0K5jmaY8PLTL4AZ+PoZe2UIvk4xI5zw=;
 b=kf0PNPEIzARCi/+2ldaxQ5l9cCK/wJM1Gw/ibR5y78JXCKGCyFujLOWgIBHTp2sStf
 fsSndD6d31BmxAl+aA3sJFFObdMOeOnVSvWfqFh1znS8iENRYvEcbnk9cHvM5z4gq1Qw
 x1XxAp8Xe1R3MVLB/jj08rWscDgELhfofAePHD0S2NAD2Rq/qMSMuuR2zFMbJaaOFwB6
 oIzt8tC2saB3hs3lqzCuazmaM9sstlLyfKRWzHURhB23gD68hHWY72hF07zzRS74hPlm
 AEyat+FLvJf2KmsAtsID8YIF7DAOLkBpGtYcYaYDUHZbMJ4di1q1aBjdnhhwQQXXl1/v
 Qn3Q==
X-Gm-Message-State: APjAAAWUZUb89QVtMt709d8z3dpTkOuZ8iO6eIjxPdjjzIi68cr0TMD2
 QEzgRhZ0yT4C6auEhll+5nUB9/PB
X-Google-Smtp-Source: APXvYqxB8FIepv2qpRk/TyhDtGNEk222N3LHB9WQr0bzYGBHZ6gCAVhI2iSxo+vzeBXtu3YBvG4IEg==
X-Received: by 2002:a1c:8116:: with SMTP id c22mr2790240wmd.27.1576670626486; 
 Wed, 18 Dec 2019 04:03:46 -0800 (PST)
Received: from 640k.lan ([93.56.166.5])
 by smtp.gmail.com with ESMTPSA id n67sm2236838wmf.46.2019.12.18.04.03.45
 for <qemu-devel@nongnu.org>
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 18 Dec 2019 04:03:45 -0800 (PST)
From: Paolo Bonzini <pbonzini@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 48/87] x86: move SMM property to X86MachineState
Date: Wed, 18 Dec 2019 13:02:14 +0100
Message-Id: <1576670573-48048-49-git-send-email-pbonzini@redhat.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
References: <1576670573-48048-1-git-send-email-pbonzini@redhat.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::32d
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Add it to microvm as well, it is a generic property of the x86
architecture.

Suggested-by: Sergio Lopez <slp@redhat.com>
Signed-off-by: Paolo Bonzini <pbonzini@redhat.com>
---
 hw/i386/pc.c          | 49 -------------------------------------------------
 hw/i386/pc_piix.c     |  6 +++---
 hw/i386/pc_q35.c      |  2 +-
 hw/i386/x86.c         | 50 +++++++++++++++++++++++++++++++++++++++++++++++++-
 include/hw/i386/pc.h  |  3 ---
 include/hw/i386/x86.h |  5 +++++
 target/i386/kvm.c     |  3 +--
 7 files changed, 59 insertions(+), 59 deletions(-)

diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index b4384e2..e330a91 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -2031,48 +2031,6 @@ static void pc_machine_set_vmport(Object *obj, Visitor *v, const char *name,
     visit_type_OnOffAuto(v, name, &pcms->vmport, errp);
 }
 
-bool pc_machine_is_smm_enabled(PCMachineState *pcms)
-{
-    bool smm_available = false;
-
-    if (pcms->smm == ON_OFF_AUTO_OFF) {
-        return false;
-    }
-
-    if (tcg_enabled() || qtest_enabled()) {
-        smm_available = true;
-    } else if (kvm_enabled()) {
-        smm_available = kvm_has_smm();
-    }
-
-    if (smm_available) {
-        return true;
-    }
-
-    if (pcms->smm == ON_OFF_AUTO_ON) {
-        error_report("System Management Mode not supported by this hypervisor.");
-        exit(1);
-    }
-    return false;
-}
-
-static void pc_machine_get_smm(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
-{
-    PCMachineState *pcms = PC_MACHINE(obj);
-    OnOffAuto smm = pcms->smm;
-
-    visit_type_OnOffAuto(v, name, &smm, errp);
-}
-
-static void pc_machine_set_smm(Object *obj, Visitor *v, const char *name,
-                               void *opaque, Error **errp)
-{
-    PCMachineState *pcms = PC_MACHINE(obj);
-
-    visit_type_OnOffAuto(v, name, &pcms->smm, errp);
-}
-
 static bool pc_machine_get_smbus(Object *obj, Error **errp)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
@@ -2119,7 +2077,6 @@ static void pc_machine_initfn(Object *obj)
 {
     PCMachineState *pcms = PC_MACHINE(obj);
 
-    pcms->smm = ON_OFF_AUTO_AUTO;
 #ifdef CONFIG_VMPORT
     pcms->vmport = ON_OFF_AUTO_AUTO;
 #else
@@ -2226,12 +2183,6 @@ static void pc_machine_class_init(ObjectClass *oc, void *data)
         pc_machine_get_device_memory_region_size, NULL,
         NULL, NULL, &error_abort);
 
-    object_class_property_add(oc, PC_MACHINE_SMM, "OnOffAuto",
-        pc_machine_get_smm, pc_machine_set_smm,
-        NULL, NULL, &error_abort);
-    object_class_property_set_description(oc, PC_MACHINE_SMM,
-        "Enable SMM (pc & q35)", &error_abort);
-
     object_class_property_add(oc, PC_MACHINE_VMPORT, "OnOffAuto",
         pc_machine_get_vmport, pc_machine_set_vmport,
         NULL, NULL, &error_abort);
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index ffb30c3..b3f0304 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -281,7 +281,7 @@ else {
         /* TODO: Populate SPD eeprom data.  */
         pcms->smbus = piix4_pm_init(pci_bus, piix3_devfn + 3, 0xb100,
                                     x86ms->gsi[9], smi_irq,
-                                    pc_machine_is_smm_enabled(pcms),
+                                    x86_machine_is_smm_enabled(x86ms),
                                     &piix4_pm);
         smbus_eeprom_init(pcms->smbus, 8, NULL, 0);
 
@@ -309,9 +309,9 @@ else {
 
 static void pc_compat_2_3_fn(MachineState *machine)
 {
-    PCMachineState *pcms = PC_MACHINE(machine);
+    X86MachineState *x86ms = X86_MACHINE(machine);
     if (kvm_enabled()) {
-        pcms->smm = ON_OFF_AUTO_OFF;
+        x86ms->smm = ON_OFF_AUTO_OFF;
     }
 }
 
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 7398d7b..52f4573 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -276,7 +276,7 @@ static void pc_q35_init(MachineState *machine)
                          0xff0104);
 
     /* connect pm stuff to lpc */
-    ich9_lpc_pm_init(lpc, pc_machine_is_smm_enabled(pcms));
+    ich9_lpc_pm_init(lpc, x86_machine_is_smm_enabled(x86ms));
 
     if (pcms->sata_enabled) {
         /* ahci and SATA device, for q35 1 ahci controller is built-in */
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 3e4aee5..6fb01e4 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -746,10 +746,53 @@ static void x86_machine_set_max_ram_below_4g(Object *obj, Visitor *v,
     x86ms->max_ram_below_4g = value;
 }
 
+bool x86_machine_is_smm_enabled(X86MachineState *x86ms)
+{
+    bool smm_available = false;
+
+    if (x86ms->smm == ON_OFF_AUTO_OFF) {
+        return false;
+    }
+
+    if (tcg_enabled() || qtest_enabled()) {
+        smm_available = true;
+    } else if (kvm_enabled()) {
+        smm_available = kvm_has_smm();
+    }
+
+    if (smm_available) {
+        return true;
+    }
+
+    if (x86ms->smm == ON_OFF_AUTO_ON) {
+        error_report("System Management Mode not supported by this hypervisor.");
+        exit(1);
+    }
+    return false;
+}
+
+static void x86_machine_get_smm(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+    OnOffAuto smm = x86ms->smm;
+
+    visit_type_OnOffAuto(v, name, &smm, errp);
+}
+
+static void x86_machine_set_smm(Object *obj, Visitor *v, const char *name,
+                               void *opaque, Error **errp)
+{
+    X86MachineState *x86ms = X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms = X86_MACHINE(obj);
 
+    x86ms->smm = ON_OFF_AUTO_AUTO;
     x86ms->max_ram_below_4g = 0; /* use default */
     x86ms->smp_dies = 1;
 }
@@ -770,9 +813,14 @@ static void x86_machine_class_init(ObjectClass *oc, void *data)
     object_class_property_add(oc, X86_MACHINE_MAX_RAM_BELOW_4G, "size",
         x86_machine_get_max_ram_below_4g, x86_machine_set_max_ram_below_4g,
         NULL, NULL, &error_abort);
-
     object_class_property_set_description(oc, X86_MACHINE_MAX_RAM_BELOW_4G,
         "Maximum ram below the 4G boundary (32bit boundary)", &error_abort);
+
+    object_class_property_add(oc, X86_MACHINE_SMM, "OnOffAuto",
+        x86_machine_get_smm, x86_machine_set_smm,
+        NULL, NULL, &error_abort);
+    object_class_property_set_description(oc, X86_MACHINE_SMM,
+        "Enable SMM", &error_abort);
 }
 
 static const TypeInfo x86_machine_info = {
diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index e2cd453..ade5a85 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -43,7 +43,6 @@ struct PCMachineState {
 
     /* Configuration options: */
     OnOffAuto vmport;
-    OnOffAuto smm;
 
     bool acpi_build_enabled;
     bool smbus_enabled;
@@ -61,7 +60,6 @@ struct PCMachineState {
 #define PC_MACHINE_ACPI_DEVICE_PROP "acpi-device"
 #define PC_MACHINE_DEVMEM_REGION_SIZE "device-memory-region-size"
 #define PC_MACHINE_VMPORT           "vmport"
-#define PC_MACHINE_SMM              "smm"
 #define PC_MACHINE_SMBUS            "smbus"
 #define PC_MACHINE_SATA             "sata"
 #define PC_MACHINE_PIT              "pit"
@@ -165,7 +163,6 @@ void vmmouse_set_data(const uint32_t *data);
 /* pc.c */
 extern int fd_bootchk;
 
-bool pc_machine_is_smm_enabled(PCMachineState *pcms);
 void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
 
 void pc_hot_add_cpu(MachineState *ms, const int64_t id, Error **errp);
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 4b84917..97d1575 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -60,6 +60,8 @@ typedef struct {
     uint16_t boot_cpus;
     unsigned smp_dies;
 
+    OnOffAuto smm;
+
     /*
      * Address space used by IOAPIC device. All IOAPIC interrupts
      * will be translated to MSI messages in the address space.
@@ -68,6 +70,7 @@ typedef struct {
 } X86MachineState;
 
 #define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
+#define X86_MACHINE_SMM              "smm"
 
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 #define X86_MACHINE(obj) \
@@ -95,4 +98,6 @@ void x86_load_linux(X86MachineState *x86ms,
                     bool pvh_enabled,
                     bool linuxboot_dma_enabled);
 
+bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
+
 #endif
diff --git a/target/i386/kvm.c b/target/i386/kvm.c
index ef63f3a..c7ff67a 100644
--- a/target/i386/kvm.c
+++ b/target/i386/kvm.c
@@ -2173,8 +2173,7 @@ int kvm_arch_init(MachineState *ms, KVMState *s)
     }
 
     if (kvm_check_extension(s, KVM_CAP_X86_SMM) &&
-        object_dynamic_cast(OBJECT(ms), TYPE_PC_MACHINE) &&
-        pc_machine_is_smm_enabled(PC_MACHINE(ms))) {
+        x86_machine_is_smm_enabled(X86_MACHINE(ms))) {
         smram_machine_done.notify = register_smram_listener;
         qemu_add_machine_init_done_notifier(&smram_machine_done);
     }
-- 
1.8.3.1



