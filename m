Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 22F2B18CB0E
	for <lists+qemu-devel@lfdr.de>; Fri, 20 Mar 2020 11:03:00 +0100 (CET)
Received: from localhost ([::1]:50268 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1jFEUV-0003uz-6t
	for lists+qemu-devel@lfdr.de; Fri, 20 Mar 2020 06:02:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59956)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <kraxel@redhat.com>) id 1jFETV-0003Ux-Dm
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 06:01:59 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1jFETT-0002Xz-8I
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 06:01:57 -0400
Received: from us-smtp-delivery-74.mimecast.com ([216.205.24.74]:58216)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1jFETT-0002Wd-3w
 for qemu-devel@nongnu.org; Fri, 20 Mar 2020 06:01:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584698514;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=wI+oraMvM1mrVDVKHIqBnkcOZarhaJVb1ZpGEvNZl40=;
 b=D5gi2ktaoHXqzlAgVz7Et8eh4hNLs25BiPEAwOMYJ/U+9k9MFXj+dPqqkJFtv/X0xdvAEU
 FuJB86TFCz1sqfwoHt7YMjt3vxkQratGPJBgpuJoIjKzsiEREiwNjc6zs8X709XlL5mrUe
 C3Elqoqtf/O/pM2chocYuLqy+/dgXAk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-ONmxjewQN8G5FHuX8TmhdA-1; Fri, 20 Mar 2020 06:01:50 -0400
X-MC-Unique: ONmxjewQN8G5FHuX8TmhdA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 530CB107B7DC;
 Fri, 20 Mar 2020 10:01:38 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-112-49.ams2.redhat.com
 [10.36.112.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 8FD4660BFB;
 Fri, 20 Mar 2020 10:01:37 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 9ACDC9DB3; Fri, 20 Mar 2020 11:01:36 +0100 (CET)
From: Gerd Hoffmann <kraxel@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH] acpi: add acpi=OnOffAuto machine property to x86 and arm virt
Date: Fri, 20 Mar 2020 11:01:36 +0100
Message-Id: <20200320100136.11717-1-kraxel@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 216.205.24.74
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
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Remove the global acpi_enabled bool and replace it with an
acpi OnOffAuto machine property.

qemu throws an error now if you use -no-acpi while the machine
type you are using doesn't support acpi in the first place.

Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
---
 include/hw/acpi/acpi.h   |  1 -
 include/hw/arm/virt.h    |  2 ++
 include/hw/i386/x86.h    |  3 +++
 hw/arm/virt-acpi-build.c |  2 +-
 hw/arm/virt.c            | 36 ++++++++++++++++++++++++++++++++++--
 hw/i386/acpi-build.c     |  2 +-
 hw/i386/pc.c             |  4 ++--
 hw/i386/pc_piix.c        |  2 +-
 hw/i386/x86.c            | 32 ++++++++++++++++++++++++++++++++
 softmmu/vl.c             |  4 ++--
 10 files changed, 78 insertions(+), 10 deletions(-)

diff --git a/include/hw/acpi/acpi.h b/include/hw/acpi/acpi.h
index 1f2dafbd7db6..4bef57531229 100644
--- a/include/hw/acpi/acpi.h
+++ b/include/hw/acpi/acpi.h
@@ -181,7 +181,6 @@ void acpi_send_gpe_event(ACPIREGS *ar, qemu_irq irq,
 void acpi_update_sci(ACPIREGS *acpi_regs, qemu_irq irq);
=20
 /* acpi.c */
-extern int acpi_enabled;
 extern char unsigned *acpi_tables;
 extern size_t acpi_tables_len;
=20
diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
index 893796d3b06b..60b2f521eb47 100644
--- a/include/hw/arm/virt.h
+++ b/include/hw/arm/virt.h
@@ -131,6 +131,7 @@ typedef struct {
     bool highmem_ecam;
     bool its;
     bool virt;
+    OnOffAuto acpi;
     VirtGICType gic_version;
     VirtIOMMUType iommu;
     uint16_t virtio_iommu_bdf;
@@ -163,6 +164,7 @@ typedef struct {
     OBJECT_CLASS_CHECK(VirtMachineClass, klass, TYPE_VIRT_MACHINE)
=20
 void virt_acpi_setup(VirtMachineState *vms);
+bool virt_is_acpi_enabled(VirtMachineState *vms);
=20
 /* Return the number of used redistributor regions  */
 static inline int virt_gicv3_redist_region_count(VirtMachineState *vms)
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
index 22babcb3bb8d..54af8ab5cfae 100644
--- a/include/hw/i386/x86.h
+++ b/include/hw/i386/x86.h
@@ -64,6 +64,7 @@ typedef struct {
     unsigned smp_dies;
=20
     OnOffAuto smm;
+    OnOffAuto acpi;
=20
     /*
      * Address space used by IOAPIC device. All IOAPIC interrupts
@@ -74,6 +75,7 @@ typedef struct {
=20
 #define X86_MACHINE_MAX_RAM_BELOW_4G "max-ram-below-4g"
 #define X86_MACHINE_SMM              "smm"
+#define X86_MACHINE_ACPI             "acpi"
=20
 #define TYPE_X86_MACHINE   MACHINE_TYPE_NAME("x86")
 #define X86_MACHINE(obj) \
@@ -104,6 +106,7 @@ void x86_load_linux(X86MachineState *x86ms,
                     bool linuxboot_dma_enabled);
=20
 bool x86_machine_is_smm_enabled(X86MachineState *x86ms);
+bool x86_machine_is_acpi_enabled(X86MachineState *x86ms);
=20
 /* Global System Interrupts */
=20
diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
index fb4b166f82c7..7ef0733d7147 100644
--- a/hw/arm/virt-acpi-build.c
+++ b/hw/arm/virt-acpi-build.c
@@ -910,7 +910,7 @@ void virt_acpi_setup(VirtMachineState *vms)
         return;
     }
=20
-    if (!acpi_enabled) {
+    if (!virt_is_acpi_enabled(vms)) {
         trace_virt_acpi_setup();
         return;
     }
diff --git a/hw/arm/virt.c b/hw/arm/virt.c
index 94f93dda54f2..7dc96abf72cf 100644
--- a/hw/arm/virt.c
+++ b/hw/arm/virt.c
@@ -67,6 +67,7 @@
 #include "kvm_arm.h"
 #include "hw/firmware/smbios.h"
 #include "qapi/visitor.h"
+#include "qapi/qapi-visit-common.h"
 #include "standard-headers/linux/input.h"
 #include "hw/arm/smmuv3.h"
 #include "hw/acpi/acpi.h"
@@ -1844,7 +1845,7 @@ static void machvirt_init(MachineState *machine)
=20
     create_pcie(vms);
=20
-    if (has_ged && aarch64 && firmware_loaded && acpi_enabled) {
+    if (has_ged && aarch64 && firmware_loaded && virt_is_acpi_enabled(vms)=
) {
         vms->acpi_dev =3D create_acpi_ged(vms);
     } else {
         create_gpio(vms);
@@ -1934,6 +1935,31 @@ static void virt_set_its(Object *obj, bool value, Er=
ror **errp)
     vms->its =3D value;
 }
=20
+bool virt_is_acpi_enabled(VirtMachineState *vms)
+{
+    if (vms->acpi =3D=3D ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void virt_get_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+    OnOffAuto acpi =3D vms->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void virt_set_acpi(Object *obj, Visitor *v, const char *name,
+                          void *opaque, Error **errp)
+{
+    VirtMachineState *vms =3D VIRT_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &vms->acpi, errp);
+}
+
 static char *virt_get_gic_version(Object *obj, Error **errp)
 {
     VirtMachineState *vms =3D VIRT_MACHINE(obj);
@@ -2113,7 +2139,7 @@ static HotplugHandler *virt_machine_get_hotplug_handl=
er(MachineState *machine,
     if (object_dynamic_cast(OBJECT(dev), TYPE_VIRTIO_IOMMU_PCI)) {
         VirtMachineState *vms =3D VIRT_MACHINE(machine);
=20
-        if (!vms->bootinfo.firmware_loaded || !acpi_enabled) {
+        if (!vms->bootinfo.firmware_loaded || !virt_is_acpi_enabled(vms)) =
{
             return HOTPLUG_HANDLER(machine);
         }
     }
@@ -2184,6 +2210,12 @@ static void virt_machine_class_init(ObjectClass *oc,=
 void *data)
     mc->numa_mem_supported =3D true;
     mc->auto_enable_numa_with_memhp =3D true;
     mc->default_ram_id =3D "mach-virt.ram";
+
+    object_class_property_add(oc, "acpi", "OnOffAuto",
+        virt_get_acpi, virt_set_acpi,
+        NULL, NULL, &error_abort);
+    object_class_property_set_description(oc, "acpi",
+        "Enable ACPI", &error_abort);
 }
=20
 static void virt_instance_init(Object *obj)
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 9a19c14e661b..2a7e55bae765 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -3024,7 +3024,7 @@ void acpi_setup(void)
         return;
     }
=20
-    if (!acpi_enabled) {
+    if (!x86_machine_is_acpi_enabled(X86_MACHINE(pcms))) {
         ACPI_BUILD_DPRINTF("ACPI disabled. Bailing out.\n");
         return;
     }
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 98ee763f68f8..0bf0aaca5201 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -1297,7 +1297,7 @@ static void pc_memory_pre_plug(HotplugHandler *hotplu=
g_dev, DeviceState *dev,
      * but pcms->acpi_dev is still created. Check !acpi_enabled in
      * addition to cover this case.
      */
-    if (!pcms->acpi_dev || !acpi_enabled) {
+    if (!pcms->acpi_dev || !x86_machine_is_acpi_enabled(X86_MACHINE(pcms))=
) {
         error_setg(errp,
                    "memory hotplug is not enabled: missing acpi device or =
acpi disabled");
         return;
@@ -1351,7 +1351,7 @@ static void pc_memory_unplug_request(HotplugHandler *=
hotplug_dev,
      * but pcms->acpi_dev is still created. Check !acpi_enabled in
      * addition to cover this case.
      */
-    if (!pcms->acpi_dev || !acpi_enabled) {
+    if (!pcms->acpi_dev || !x86_machine_is_acpi_enabled(X86_MACHINE(pcms))=
) {
         error_setg(&local_err,
                    "memory hotplug is not enabled: missing acpi device or =
acpi disabled");
         goto out;
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index e6756216f9f4..9cceae3e2c35 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -275,7 +275,7 @@ static void pc_init1(MachineState *machine,
         pci_create_simple(pci_bus, piix3_devfn + 2, "piix3-usb-uhci");
     }
=20
-    if (pcmc->pci_enabled && acpi_enabled) {
+    if (pcmc->pci_enabled && x86_machine_is_acpi_enabled(X86_MACHINE(pcms)=
)) {
         DeviceState *piix4_pm;
=20
         smi_irq =3D qemu_allocate_irq(pc_acpi_smi_interrupt, first_cpu, 0)=
;
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
index 87b73fe33cd2..6ca3cf936f38 100644
--- a/hw/i386/x86.c
+++ b/hw/i386/x86.c
@@ -904,11 +904,37 @@ static void x86_machine_set_smm(Object *obj, Visitor =
*v, const char *name,
     visit_type_OnOffAuto(v, name, &x86ms->smm, errp);
 }
=20
+bool x86_machine_is_acpi_enabled(X86MachineState *x86ms)
+{
+    if (x86ms->acpi =3D=3D ON_OFF_AUTO_OFF) {
+        return false;
+    }
+    return true;
+}
+
+static void x86_machine_get_acpi(Object *obj, Visitor *v, const char *name=
,
+                                 void *opaque, Error **errp)
+{
+    X86MachineState *x86ms =3D X86_MACHINE(obj);
+    OnOffAuto acpi =3D x86ms->acpi;
+
+    visit_type_OnOffAuto(v, name, &acpi, errp);
+}
+
+static void x86_machine_set_acpi(Object *obj, Visitor *v, const char *name=
,
+                                 void *opaque, Error **errp)
+{
+    X86MachineState *x86ms =3D X86_MACHINE(obj);
+
+    visit_type_OnOffAuto(v, name, &x86ms->acpi, errp);
+}
+
 static void x86_machine_initfn(Object *obj)
 {
     X86MachineState *x86ms =3D X86_MACHINE(obj);
=20
     x86ms->smm =3D ON_OFF_AUTO_AUTO;
+    x86ms->acpi =3D ON_OFF_AUTO_AUTO;
     x86ms->max_ram_below_4g =3D 0; /* use default */
     x86ms->smp_dies =3D 1;
 }
@@ -937,6 +963,12 @@ static void x86_machine_class_init(ObjectClass *oc, vo=
id *data)
         NULL, NULL, &error_abort);
     object_class_property_set_description(oc, X86_MACHINE_SMM,
         "Enable SMM", &error_abort);
+
+    object_class_property_add(oc, X86_MACHINE_ACPI, "OnOffAuto",
+        x86_machine_get_acpi, x86_machine_set_acpi,
+        NULL, NULL, &error_abort);
+    object_class_property_set_description(oc, X86_MACHINE_ACPI,
+        "Enable ACPI", &error_abort);
 }
=20
 static const TypeInfo x86_machine_info =3D {
diff --git a/softmmu/vl.c b/softmmu/vl.c
index 1d33a2834037..9f06bd4bf0a7 100644
--- a/softmmu/vl.c
+++ b/softmmu/vl.c
@@ -144,7 +144,6 @@ static Chardev **serial_hds;
 Chardev *parallel_hds[MAX_PARALLEL_PORTS];
 int win2k_install_hack =3D 0;
 int singlestep =3D 0;
-int acpi_enabled =3D 1;
 int no_hpet =3D 0;
 int fd_bootchk =3D 1;
 static int no_reboot;
@@ -3513,7 +3512,8 @@ void qemu_init(int argc, char **argv, char **envp)
                 vnc_parse(optarg, &error_fatal);
                 break;
             case QEMU_OPTION_no_acpi:
-                acpi_enabled =3D 0;
+                olist =3D qemu_find_opts("machine");
+                qemu_opts_parse_noisily(olist, "acpi=3Doff", false);
                 break;
             case QEMU_OPTION_no_hpet:
                 no_hpet =3D 1;
--=20
2.18.2


