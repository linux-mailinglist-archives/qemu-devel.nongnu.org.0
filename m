Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.47])
	by mail.lfdr.de (Postfix) with ESMTPS id 557F338520
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Jun 2019 09:36:01 +0200 (CEST)
Received: from localhost ([::1]:46448 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hZ9Pr-0001K8-KU
	for lists+qemu-devel@lfdr.de; Fri, 07 Jun 2019 03:35:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43132)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <kraxel@redhat.com>) id 1hZ9PH-0000tN-R5
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 03:35:25 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <kraxel@redhat.com>) id 1hZ9PG-0003Im-J4
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 03:35:23 -0400
Received: from mx1.redhat.com ([209.132.183.28]:59572)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <kraxel@redhat.com>) id 1hZ9PG-0002eG-Az
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 03:35:22 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F007C1EB20C;
 Fri,  7 Jun 2019 07:35:00 +0000 (UTC)
Received: from sirius.home.kraxel.org (ovpn-117-25.ams2.redhat.com
 [10.36.117.25])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 340FF78417;
 Fri,  7 Jun 2019 07:34:55 +0000 (UTC)
Received: by sirius.home.kraxel.org (Postfix, from userid 1000)
 id 72E7116E1A; Fri,  7 Jun 2019 09:34:54 +0200 (CEST)
From: Gerd Hoffmann <kraxel@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Date: Fri,  7 Jun 2019 09:34:29 +0200
Message-Id: <20190607073429.3436-1-kraxel@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.32]); Fri, 07 Jun 2019 07:35:00 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PATCH v2] q35: fix mmconfig and PCI0._CRS
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
 "open list:All patches CC here" <qemu-devel@nongnu.org>,
 Gerd Hoffmann <kraxel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>,
 =?UTF-8?q?L=C3=A1szl=C3=B3=20=C3=89rsek?= <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This patch changes the handling of the mmconfig area.  Thanks to the
pci(e) expander devices we already have the logic to exclude address
ranges from PCI0._CRS.  We can simply add the mmconfig address range
to the list get it excluded as well.

With that in place we can go with a fixed pci hole which covers the
whole area from the end of (low) ram to the ioapic.

This will make the whole logic alot less fragile.  No matter where the
firmware places the mmconfig xbar, things should work correctly.  The
guest also gets a bit more PCI address space (seabios boot):

    # cat /proc/iomem
    [ ... ]
    7ffdd000-7fffffff : reserved
    80000000-afffffff : PCI Bus 0000:00            <<-- this is new
    b0000000-bfffffff : PCI MMCONFIG 0000 [bus 00-ff]
      b0000000-bfffffff : reserved
    c0000000-febfffff : PCI Bus 0000:00
      f8000000-fbffffff : 0000:00:01.0
    [ ... ]

So this is a guest visible change.

Cc: L=C3=A1szl=C3=B3 =C3=89rsek <lersek@redhat.com>
Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
Reviewed-by: Igor Mammedov <imammedo@redhat.com>
---
 tests/bios-tables-test-allowed-diff.h |  8 +++++++
 hw/i386/acpi-build.c                  | 14 ++++++++++++
 hw/pci-host/q35.c                     | 31 +++++++--------------------
 3 files changed, 30 insertions(+), 23 deletions(-)

diff --git a/tests/bios-tables-test-allowed-diff.h b/tests/bios-tables-te=
st-allowed-diff.h
index dfb8523c8bf4..3bbd22c62a3b 100644
--- a/tests/bios-tables-test-allowed-diff.h
+++ b/tests/bios-tables-test-allowed-diff.h
@@ -1 +1,9 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/q35/DSDT",
+"tests/data/acpi/q35/DSDT.bridge",
+"tests/data/acpi/q35/DSDT.mmio64",
+"tests/data/acpi/q35/DSDT.ipmibt",
+"tests/data/acpi/q35/DSDT.cphp",
+"tests/data/acpi/q35/DSDT.memhp",
+"tests/data/acpi/q35/DSDT.numamem",
+"tests/data/acpi/q35/DSDT.dimmpxm",
diff --git a/hw/i386/acpi-build.c b/hw/i386/acpi-build.c
index 85dc1640bc67..8e4f26977619 100644
--- a/hw/i386/acpi-build.c
+++ b/hw/i386/acpi-build.c
@@ -122,6 +122,8 @@ typedef struct FwCfgTPMConfig {
     uint8_t tpmppi_version;
 } QEMU_PACKED FwCfgTPMConfig;
=20
+static bool acpi_get_mcfg(AcpiMcfgInfo *mcfg);
+
 static void init_common_fadt_data(Object *o, AcpiFadtData *data)
 {
     uint32_t io =3D object_property_get_uint(o, ACPI_PM_PROP_PM_IO_BASE,=
 NULL);
@@ -1807,6 +1809,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
     CrsRangeSet crs_range_set;
     PCMachineState *pcms =3D PC_MACHINE(machine);
     PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(machine);
+    AcpiMcfgInfo mcfg;
     uint32_t nr_mem =3D machine->ram_slots;
     int root_bus_limit =3D 0xFF;
     PCIBus *bus =3D NULL;
@@ -1921,6 +1924,17 @@ build_dsdt(GArray *table_data, BIOSLinker *linker,
         }
     }
=20
+    /*
+     * At this point crs_range_set has all the ranges used by pci
+     * busses *other* than PCI0.  These ranges will be excluded from
+     * the PCI0._CRS.  Add mmconfig to the set so it will be excluded
+     * too.
+     */
+    if (acpi_get_mcfg(&mcfg)) {
+        crs_range_insert(crs_range_set.mem_ranges,
+                         mcfg.base, mcfg.base + mcfg.size - 1);
+    }
+
     scope =3D aml_scope("\\_SB.PCI0");
     /* build PCI0._CRS */
     crs =3D aml_resource_template();
diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
index 960939f5ed3e..72093320befe 100644
--- a/hw/pci-host/q35.c
+++ b/hw/pci-host/q35.c
@@ -258,15 +258,6 @@ static void q35_host_initfn(Object *obj)
     object_property_add_link(obj, MCH_HOST_PROP_IO_MEM, TYPE_MEMORY_REGI=
ON,
                              (Object **) &s->mch.address_space_io,
                              qdev_prop_allow_set_link_before_realize, 0,=
 NULL);
-
-    /* Leave enough space for the biggest MCFG BAR */
-    /* TODO: this matches current bios behaviour, but
-     * it's not a power of two, which means an MTRR
-     * can't cover it exactly.
-     */
-    range_set_bounds(&s->mch.pci_hole,
-            MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT + MCH_HOST_BRIDGE_PCIEXBAR_=
MAX,
-            IO_APIC_DEFAULT_ADDRESS - 1);
 }
=20
 static const TypeInfo q35_host_info =3D {
@@ -338,20 +329,6 @@ static void mch_update_pciexbar(MCHPCIState *mch)
     }
     addr =3D pciexbar & addr_mask;
     pcie_host_mmcfg_update(pehb, enable, addr, length);
-    /* Leave enough space for the MCFG BAR */
-    /*
-     * TODO: this matches current bios behaviour, but it's not a power o=
f two,
-     * which means an MTRR can't cover it exactly.
-     */
-    if (enable) {
-        range_set_bounds(&mch->pci_hole,
-                         addr + length,
-                         IO_APIC_DEFAULT_ADDRESS - 1);
-    } else {
-        range_set_bounds(&mch->pci_hole,
-                         MCH_HOST_BRIDGE_PCIEXBAR_DEFAULT,
-                         IO_APIC_DEFAULT_ADDRESS - 1);
-    }
 }
=20
 /* PAM */
@@ -484,6 +461,14 @@ static void mch_update(MCHPCIState *mch)
     mch_update_pam(mch);
     mch_update_smram(mch);
     mch_update_ext_tseg_mbytes(mch);
+
+    /*
+     * pci hole goes from end-of-low-ram to io-apic.
+     * mmconfig will be excluded by the dsdt builder.
+     */
+    range_set_bounds(&mch->pci_hole,
+                     mch->below_4g_mem_size,
+                     IO_APIC_DEFAULT_ADDRESS - 1);
 }
=20
 static int mch_post_load(void *opaque, int version_id)
--=20
2.18.1


