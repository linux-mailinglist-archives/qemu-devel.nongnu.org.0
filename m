Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD26155824
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Feb 2020 14:09:20 +0100 (CET)
Received: from localhost ([::1]:56198 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1j03Nn-0004JO-HR
	for lists+qemu-devel@lfdr.de; Fri, 07 Feb 2020 08:09:19 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:54101)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1j03KY-0008G5-Tp
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 08:06:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1j03KW-0007qr-OU
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 08:05:58 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:49648
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1j03KW-0007qY-I9
 for qemu-devel@nongnu.org; Fri, 07 Feb 2020 08:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581080756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N8Xoh5s8LJEjO3LCsLIAY/YyM+Zf8x3iKkAuoUtGlSY=;
 b=QkL0l0Zf3ocS5wtYIT1KbloisX3Rpw6kOu7/I6MlQ3G7lhhtK981YVakrzPGnEfPBS1o/B
 qwWEw9KVi0nkRK0nq35DEB8Zqlz+y20SVsmrzt8ilpMHg//SgdQZZcMe0BagwkK0/1d9Rj
 VcdgpfIJ8AQj2HZPznuU4c7kTMp88to=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-97-74WzZh0oOj2wj27KxUA4OA-1; Fri, 07 Feb 2020 08:05:54 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED1111081FB5;
 Fri,  7 Feb 2020 13:05:49 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-120.brq.redhat.com [10.40.204.120])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id B0BC75C6DC;
 Fri,  7 Feb 2020 13:05:38 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/3] hw: Make MachineClass::is_default a boolean type
Date: Fri,  7 Feb 2020 14:04:52 +0100
Message-Id: <20200207130453.16666-3-philmd@redhat.com>
In-Reply-To: <20200207130453.16666-1-philmd@redhat.com>
References: <20200207130453.16666-1-philmd@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-MC-Unique: 74WzZh0oOj2wj27KxUA4OA-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Chris Wulff <crwulff@gmail.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
 Jia Liu <proljc@gmail.com>, qemu-trivial@nongnu.org,
 Helge Deller <deller@gmx.de>, "Michael S. Tsirkin" <mst@redhat.com>,
 Magnus Damm <magnus.damm@gmail.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 Richard Henderson <rth@twiddle.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Thomas Huth <huth@tuxfamily.org>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

There's no good reason for it to be type int, change it to bool.

Suggested-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
---
v3: new patch
---
 include/hw/boards.h                      |  2 +-
 hw/alpha/dp264.c                         |  2 +-
 hw/cris/axis_dev88.c                     |  2 +-
 hw/hppa/machine.c                        |  2 +-
 hw/i386/pc_piix.c                        | 10 +++++-----
 hw/lm32/lm32_boards.c                    |  2 +-
 hw/m68k/mcf5208.c                        |  2 +-
 hw/microblaze/petalogix_s3adsp1800_mmu.c |  2 +-
 hw/mips/mips_malta.c                     |  2 +-
 hw/moxie/moxiesim.c                      |  2 +-
 hw/nios2/10m50_devboard.c                |  2 +-
 hw/openrisc/openrisc_sim.c               |  2 +-
 hw/ppc/mac_oldworld.c                    |  2 +-
 hw/ppc/spapr.c                           |  2 +-
 hw/riscv/spike.c                         |  2 +-
 hw/s390x/s390-virtio-ccw.c               |  2 +-
 hw/sh4/shix.c                            |  2 +-
 hw/sparc/sun4m.c                         |  2 +-
 hw/sparc64/niagara.c                     |  2 +-
 hw/sparc64/sun4u.c                       |  4 ++--
 hw/unicore32/puv3.c                      |  2 +-
 21 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/include/hw/boards.h b/include/hw/boards.h
index fb1b43d5b9..30498cb367 100644
--- a/include/hw/boards.h
+++ b/include/hw/boards.h
@@ -200,7 +200,7 @@ struct MachineClass {
         no_sdcard:1,
         pci_allow_0_address:1,
         legacy_fw_cfg_order:1;
-    int is_default;
+    bool is_default;
     const char *default_machine_opts;
     const char *default_boot_order;
     const char *default_display;
diff --git a/hw/alpha/dp264.c b/hw/alpha/dp264.c
index a8f9a89cc4..083a198a64 100644
--- a/hw/alpha/dp264.c
+++ b/hw/alpha/dp264.c
@@ -181,7 +181,7 @@ static void clipper_machine_init(MachineClass *mc)
     mc->init =3D clipper_init;
     mc->block_default_type =3D IF_IDE;
     mc->max_cpus =3D 4;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D ALPHA_CPU_TYPE_NAME("ev67");
 }
=20
diff --git a/hw/cris/axis_dev88.c b/hw/cris/axis_dev88.c
index be7760476a..de7b49188b 100644
--- a/hw/cris/axis_dev88.c
+++ b/hw/cris/axis_dev88.c
@@ -349,7 +349,7 @@ static void axisdev88_machine_init(MachineClass *mc)
 {
     mc->desc =3D "AXIS devboard 88";
     mc->init =3D axisdev88_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D CRIS_CPU_TYPE_NAME("crisv32");
 }
=20
diff --git a/hw/hppa/machine.c b/hw/hppa/machine.c
index d8755ec422..83ae87f565 100644
--- a/hw/hppa/machine.c
+++ b/hw/hppa/machine.c
@@ -295,7 +295,7 @@ static void machine_hppa_machine_init(MachineClass *mc)
     mc->block_default_type =3D IF_SCSI;
     mc->max_cpus =3D HPPA_MAX_CPUS;
     mc->default_cpus =3D 1;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_ram_size =3D 512 * MiB;
     mc->default_boot_order =3D "cd";
 }
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index fa12203079..9088db8fb6 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -423,7 +423,7 @@ static void pc_i440fx_5_0_machine_options(MachineClass =
*m)
     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
     pc_i440fx_machine_options(m);
     m->alias =3D "pc";
-    m->is_default =3D 1;
+    m->is_default =3D true;
     pcmc->default_cpu_version =3D 1;
 }
=20
@@ -434,7 +434,7 @@ static void pc_i440fx_4_2_machine_options(MachineClass =
*m)
 {
     pc_i440fx_5_0_machine_options(m);
     m->alias =3D NULL;
-    m->is_default =3D 0;
+    m->is_default =3D false;
     compat_props_add(m->compat_props, hw_compat_4_2, hw_compat_4_2_len);
     compat_props_add(m->compat_props, pc_compat_4_2, pc_compat_4_2_len);
 }
@@ -446,7 +446,7 @@ static void pc_i440fx_4_1_machine_options(MachineClass =
*m)
 {
     pc_i440fx_4_2_machine_options(m);
     m->alias =3D NULL;
-    m->is_default =3D 0;
+    m->is_default =3D false;
     compat_props_add(m->compat_props, hw_compat_4_1, hw_compat_4_1_len);
     compat_props_add(m->compat_props, pc_compat_4_1, pc_compat_4_1_len);
 }
@@ -459,7 +459,7 @@ static void pc_i440fx_4_0_machine_options(MachineClass =
*m)
     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
     pc_i440fx_4_1_machine_options(m);
     m->alias =3D NULL;
-    m->is_default =3D 0;
+    m->is_default =3D false;
     pcmc->default_cpu_version =3D CPU_VERSION_LEGACY;
     compat_props_add(m->compat_props, hw_compat_4_0, hw_compat_4_0_len);
     compat_props_add(m->compat_props, pc_compat_4_0, pc_compat_4_0_len);
@@ -473,7 +473,7 @@ static void pc_i440fx_3_1_machine_options(MachineClass =
*m)
     PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
=20
     pc_i440fx_4_0_machine_options(m);
-    m->is_default =3D 0;
+    m->is_default =3D false;
     pcmc->do_not_add_smb_acpi =3D true;
     m->smbus_no_migration_support =3D true;
     m->alias =3D NULL;
diff --git a/hw/lm32/lm32_boards.c b/hw/lm32/lm32_boards.c
index 156b050abc..352f69532e 100644
--- a/hw/lm32/lm32_boards.c
+++ b/hw/lm32/lm32_boards.c
@@ -286,7 +286,7 @@ static void lm32_evr_class_init(ObjectClass *oc, void *=
data)
=20
     mc->desc =3D "LatticeMico32 EVR32 eval system";
     mc->init =3D lm32_evr_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D LM32_CPU_TYPE_NAME("lm32-full");
 }
=20
diff --git a/hw/m68k/mcf5208.c b/hw/m68k/mcf5208.c
index a999c21982..5f8f6e4475 100644
--- a/hw/m68k/mcf5208.c
+++ b/hw/m68k/mcf5208.c
@@ -352,7 +352,7 @@ static void mcf5208evb_machine_init(MachineClass *mc)
 {
     mc->desc =3D "MCF5208EVB";
     mc->init =3D mcf5208evb_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D M68K_CPU_TYPE_NAME("m5208");
 }
=20
diff --git a/hw/microblaze/petalogix_s3adsp1800_mmu.c b/hw/microblaze/petal=
ogix_s3adsp1800_mmu.c
index 849bafc186..0bb6cdea8d 100644
--- a/hw/microblaze/petalogix_s3adsp1800_mmu.c
+++ b/hw/microblaze/petalogix_s3adsp1800_mmu.c
@@ -132,7 +132,7 @@ static void petalogix_s3adsp1800_machine_init(MachineCl=
ass *mc)
 {
     mc->desc =3D "PetaLogix linux refdesign for xilinx Spartan 3ADSP1800";
     mc->init =3D petalogix_s3adsp1800_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
 }
=20
 DEFINE_MACHINE("petalogix-s3adsp1800", petalogix_s3adsp1800_machine_init)
diff --git a/hw/mips/mips_malta.c b/hw/mips/mips_malta.c
index 34b76bb6a1..499eac8d33 100644
--- a/hw/mips/mips_malta.c
+++ b/hw/mips/mips_malta.c
@@ -1442,7 +1442,7 @@ static void mips_malta_machine_init(MachineClass *mc)
     mc->init =3D mips_malta_init;
     mc->block_default_type =3D IF_IDE;
     mc->max_cpus =3D 16;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
 #ifdef TARGET_MIPS64
     mc->default_cpu_type =3D MIPS_CPU_TYPE_NAME("20Kc");
 #else
diff --git a/hw/moxie/moxiesim.c b/hw/moxie/moxiesim.c
index 1d06e39fcb..51a98287b5 100644
--- a/hw/moxie/moxiesim.c
+++ b/hw/moxie/moxiesim.c
@@ -150,7 +150,7 @@ static void moxiesim_machine_init(MachineClass *mc)
 {
     mc->desc =3D "Moxie simulator platform";
     mc->init =3D moxiesim_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D MOXIE_CPU_TYPE_NAME("MoxieLite");
 }
=20
diff --git a/hw/nios2/10m50_devboard.c b/hw/nios2/10m50_devboard.c
index ad8b2fc670..33dc2bf511 100644
--- a/hw/nios2/10m50_devboard.c
+++ b/hw/nios2/10m50_devboard.c
@@ -120,7 +120,7 @@ static void nios2_10m50_ghrd_machine_init(struct Machin=
eClass *mc)
 {
     mc->desc =3D "Altera 10M50 GHRD Nios II design";
     mc->init =3D nios2_10m50_ghrd_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
 }
=20
 DEFINE_MACHINE("10m50-ghrd", nios2_10m50_ghrd_machine_init);
diff --git a/hw/openrisc/openrisc_sim.c b/hw/openrisc/openrisc_sim.c
index ad5371250f..d08ce61811 100644
--- a/hw/openrisc/openrisc_sim.c
+++ b/hw/openrisc/openrisc_sim.c
@@ -176,7 +176,7 @@ static void openrisc_sim_machine_init(MachineClass *mc)
     mc->desc =3D "or1k simulation";
     mc->init =3D openrisc_sim_init;
     mc->max_cpus =3D 2;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D OPENRISC_CPU_TYPE_NAME("or1200");
 }
=20
diff --git a/hw/ppc/mac_oldworld.c b/hw/ppc/mac_oldworld.c
index 7318d7e9b4..1630663bc2 100644
--- a/hw/ppc/mac_oldworld.c
+++ b/hw/ppc/mac_oldworld.c
@@ -438,7 +438,7 @@ static void heathrow_class_init(ObjectClass *oc, void *=
data)
     mc->block_default_type =3D IF_IDE;
     mc->max_cpus =3D MAX_CPUS;
 #ifndef TARGET_PPC64
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
 #endif
     /* TOFIX "cad" when Mac floppy is implemented */
     mc->default_boot_order =3D "cd";
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index c9b2e0a5e0..e3e3208cd8 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -4493,7 +4493,7 @@ static const TypeInfo spapr_machine_info =3D {
         spapr_machine_##suffix##_class_options(mc);                  \
         if (latest) {                                                \
             mc->alias =3D "pseries";                                   \
-            mc->is_default =3D 1;                                      \
+            mc->is_default =3D true;                                   \
         }                                                            \
     }                                                                \
     static const TypeInfo spapr_machine_##suffix##_info =3D {          \
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 8823681783..6f03857660 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -448,7 +448,7 @@ static void spike_machine_init(MachineClass *mc)
     mc->desc =3D "RISC-V Spike Board";
     mc->init =3D spike_board_init;
     mc->max_cpus =3D 1;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D SPIKE_V1_10_0_CPU;
 }
=20
diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
index e759eb5f83..c4b291e434 100644
--- a/hw/s390x/s390-virtio-ccw.c
+++ b/hw/s390x/s390-virtio-ccw.c
@@ -631,7 +631,7 @@ bool css_migration_enabled(void)
         mc->desc =3D "VirtIO-ccw based S390 machine v" verstr;            =
      \
         if (latest) {                                                     =
    \
             mc->alias =3D "s390-ccw-virtio";                              =
      \
-            mc->is_default =3D 1;                                         =
      \
+            mc->is_default =3D true;                                      =
      \
         }                                                                 =
    \
     }                                                                     =
    \
     static void ccw_machine_##suffix##_instance_init(Object *obj)         =
    \
diff --git a/hw/sh4/shix.c b/hw/sh4/shix.c
index 2fc2915428..68b14ee5e7 100644
--- a/hw/sh4/shix.c
+++ b/hw/sh4/shix.c
@@ -82,7 +82,7 @@ static void shix_machine_init(MachineClass *mc)
 {
     mc->desc =3D "shix card";
     mc->init =3D shix_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D TYPE_SH7750R_CPU;
 }
=20
diff --git a/hw/sparc/sun4m.c b/hw/sparc/sun4m.c
index 25e96db5ca..d6c9772f95 100644
--- a/hw/sparc/sun4m.c
+++ b/hw/sparc/sun4m.c
@@ -1411,7 +1411,7 @@ static void ss5_class_init(ObjectClass *oc, void *dat=
a)
     mc->desc =3D "Sun4m platform, SPARCstation 5";
     mc->init =3D ss5_init;
     mc->block_default_type =3D IF_SCSI;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Fujitsu-MB86904");
     mc->default_display =3D "tcx";
diff --git a/hw/sparc64/niagara.c b/hw/sparc64/niagara.c
index 5eb2d097b9..81a1748fad 100644
--- a/hw/sparc64/niagara.c
+++ b/hw/sparc64/niagara.c
@@ -170,7 +170,7 @@ static void niagara_class_init(ObjectClass *oc, void *d=
ata)
=20
     mc->desc =3D "Sun4v platform, Niagara";
     mc->init =3D niagara_init;
-    mc->max_cpus =3D 1; /* XXX for now */
+    mc->max_cpus =3D true; /* XXX for now */
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
 }
diff --git a/hw/sparc64/sun4u.c b/hw/sparc64/sun4u.c
index b7ac42f7a5..3c2c9d2eb0 100644
--- a/hw/sparc64/sun4u.c
+++ b/hw/sparc64/sun4u.c
@@ -816,7 +816,7 @@ static void sun4u_class_init(ObjectClass *oc, void *dat=
a)
     mc->init =3D sun4u_init;
     mc->block_default_type =3D IF_IDE;
     mc->max_cpus =3D 1; /* XXX for now */
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("TI-UltraSparc-IIi");
     mc->ignore_boot_device_suffixes =3D true;
@@ -841,7 +841,7 @@ static void sun4v_class_init(ObjectClass *oc, void *dat=
a)
     mc->desc =3D "Sun4v platform";
     mc->init =3D sun4v_init;
     mc->block_default_type =3D IF_IDE;
-    mc->max_cpus =3D 1; /* XXX for now */
+    mc->max_cpus =3D true; /* XXX for now */
     mc->default_boot_order =3D "c";
     mc->default_cpu_type =3D SPARC_CPU_TYPE_NAME("Sun-UltraSparc-T1");
     mc->default_display =3D "std";
diff --git a/hw/unicore32/puv3.c b/hw/unicore32/puv3.c
index 7e933de228..7f9c0238fe 100644
--- a/hw/unicore32/puv3.c
+++ b/hw/unicore32/puv3.c
@@ -140,7 +140,7 @@ static void puv3_machine_init(MachineClass *mc)
 {
     mc->desc =3D "PKUnity Version-3 based on UniCore32";
     mc->init =3D puv3_init;
-    mc->is_default =3D 1;
+    mc->is_default =3D true;
     mc->default_cpu_type =3D UNICORE32_CPU_TYPE_NAME("UniCore-II");
 }
=20
--=20
2.21.1


