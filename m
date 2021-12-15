Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B6670476059
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 19:12:25 +0100 (CET)
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxYlM-0001oa-JJ
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 13:12:24 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39678)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiU-0005PI-GP; Wed, 15 Dec 2021 12:05:22 -0500
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:34750)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <clg@kaod.org>)
 id 1mxXiS-0004o1-GG; Wed, 15 Dec 2021 12:05:22 -0500
Received: from pps.filterd (m0127361.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BFGfah4012860; 
 Wed, 15 Dec 2021 17:04:52 GMT
Received: from ppma04ams.nl.ibm.com (63.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.99])
 by mx0a-001b2d01.pphosted.com with ESMTP id 3cyjgfk6pe-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:51 +0000
Received: from pps.filterd (ppma04ams.nl.ibm.com [127.0.0.1])
 by ppma04ams.nl.ibm.com (8.16.1.2/8.16.1.2) with SMTP id 1BFH3KW2024948;
 Wed, 15 Dec 2021 17:04:49 GMT
Received: from b06cxnps4076.portsmouth.uk.ibm.com
 (d06relay13.portsmouth.uk.ibm.com [9.149.109.198])
 by ppma04ams.nl.ibm.com with ESMTP id 3cy7qvydgy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 15 Dec 2021 17:04:47 +0000
Received: from d06av23.portsmouth.uk.ibm.com (d06av23.portsmouth.uk.ibm.com
 [9.149.105.59])
 by b06cxnps4076.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 1BFH4hGS41156898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 17:04:43 GMT
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id C8443A406F;
 Wed, 15 Dec 2021 17:04:43 +0000 (GMT)
Received: from d06av23.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 8CEB3A4057;
 Wed, 15 Dec 2021 17:04:43 +0000 (GMT)
Received: from smtp.tlslab.ibm.com (unknown [9.101.4.1])
 by d06av23.portsmouth.uk.ibm.com (Postfix) with SMTP;
 Wed, 15 Dec 2021 17:04:43 +0000 (GMT)
Received: from yukon.home (unknown [9.171.19.61])
 by smtp.tlslab.ibm.com (Postfix) with ESMTP id D509C220247;
 Wed, 15 Dec 2021 18:04:42 +0100 (CET)
From: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
To: qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Subject: [PULL 071/102] ppc/ppc405: Fix boot from kernel
Date: Wed, 15 Dec 2021 18:03:26 +0100
Message-Id: <20211215170357.321643-59-clg@kaod.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211215170357.321643-1-clg@kaod.org>
References: <20211215165847.321042-1-clg@kaod.org>
 <20211215170357.321643-1-clg@kaod.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: PTYaCM2AtcU_OBKXdIOs4Re8Swkj360E
X-Proofpoint-ORIG-GUID: PTYaCM2AtcU_OBKXdIOs4Re8Swkj360E
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.11.62.513
 definitions=2021-12-15_10,2021-12-14_01,2021-12-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 mlxscore=0
 adultscore=0 lowpriorityscore=0 clxscore=1034 suspectscore=0
 impostorscore=0 malwarescore=0 phishscore=0 mlxlogscore=999
 priorityscore=1501 bulkscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2110150000 definitions=main-2112150098
Received-SPF: softfail client-ip=148.163.158.5; envelope-from=clg@kaod.org;
 helo=mx0b-001b2d01.pphosted.com
X-Spam_score_int: -11
X-Spam_score: -1.2
X-Spam_bar: -
X-Spam_report: (-1.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_SOFTFAIL=0.665 autolearn=no autolearn_force=no
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The machine can already boot with kernel and initrd U-boot images if a
firmware is loaded first. Adapt and improve the load sequence to let
the machine boot directly from a Linux kernel ELF image and a usual
initrd image if a firmware image is not provided. For that, install a
custom CPU reset handler to setup the registers and to start the CPU
from the Linux kernel entry point.

Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
Message-Id: <20211206103712.1866296-12-clg@kaod.org>
Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
---
 hw/ppc/ppc405_boards.c | 145 +++++++++++++++++++++++++++++------------
 1 file changed, 102 insertions(+), 43 deletions(-)

diff --git a/hw/ppc/ppc405_boards.c b/hw/ppc/ppc405_boards.c
index 71a652e2d846..3ae2b36373a5 100644
--- a/hw/ppc/ppc405_boards.c
+++ b/hw/ppc/ppc405_boards.c
@@ -41,6 +41,7 @@
 #include "qemu/error-report.h"
 #include "hw/loader.h"
 #include "qemu/cutils.h"
+#include "elf.h"
=20
 #define BIOS_FILENAME "ppc405_rom.bin"
 #define BIOS_SIZE (2 * MiB)
@@ -136,25 +137,101 @@ static void ref405ep_fpga_init(MemoryRegion *sysme=
m, uint32_t base)
     qemu_register_reset(&ref405ep_fpga_reset, fpga);
 }
=20
+/*
+ * CPU reset handler when booting directly from a loaded kernel
+ */
+static struct boot_info {
+    uint32_t entry;
+    uint32_t bdloc;
+    uint32_t initrd_base;
+    uint32_t initrd_size;
+    uint32_t cmdline_base;
+    uint32_t cmdline_size;
+} boot_info;
+
+static void main_cpu_reset(void *opaque)
+{
+    PowerPCCPU *cpu =3D opaque;
+    CPUPPCState *env =3D &cpu->env;
+    struct boot_info *bi =3D env->load_info;
+
+    cpu_reset(CPU(cpu));
+
+    /* stack: top of sram */
+    env->gpr[1] =3D PPC405EP_SRAM_BASE + PPC405EP_SRAM_SIZE - 8;
+
+    /* Tune our boot state */
+    env->gpr[3] =3D bi->bdloc;
+    env->gpr[4] =3D bi->initrd_base;
+    env->gpr[5] =3D bi->initrd_base + bi->initrd_size;
+    env->gpr[6] =3D bi->cmdline_base;
+    env->gpr[7] =3D bi->cmdline_size;
+
+    env->nip =3D bi->entry;
+}
+
+static void boot_from_kernel(MachineState *machine, PowerPCCPU *cpu)
+{
+    CPUPPCState *env =3D &cpu->env;
+    hwaddr boot_entry;
+    hwaddr kernel_base;
+    int kernel_size;
+    hwaddr initrd_base;
+    int initrd_size;
+    ram_addr_t bdloc;
+    int len;
+
+    bdloc =3D ppc405_set_bootinfo(env, machine->ram_size);
+    boot_info.bdloc =3D bdloc;
+
+    kernel_size =3D load_elf(machine->kernel_filename, NULL, NULL, NULL,
+                           &boot_entry, &kernel_base, NULL, NULL,
+                           1, PPC_ELF_MACHINE, 0, 0);
+    if (kernel_size < 0) {
+        error_report("Could not load kernel '%s' : %s",
+                     machine->kernel_filename, load_elf_strerror(kernel_=
size));
+        exit(1);
+    }
+    boot_info.entry =3D boot_entry;
+
+    /* load initrd */
+    if (machine->initrd_filename) {
+        initrd_base =3D INITRD_LOAD_ADDR;
+        initrd_size =3D load_image_targphys(machine->initrd_filename, in=
itrd_base,
+                                          machine->ram_size - initrd_bas=
e);
+        if (initrd_size < 0) {
+            error_report("could not load initial ram disk '%s'",
+                         machine->initrd_filename);
+            exit(1);
+        }
+
+        boot_info.initrd_base =3D initrd_base;
+        boot_info.initrd_size =3D initrd_size;
+    }
+
+    if (machine->kernel_cmdline) {
+        len =3D strlen(machine->kernel_cmdline);
+        bdloc -=3D ((len + 255) & ~255);
+        cpu_physical_memory_write(bdloc, machine->kernel_cmdline, len + =
1);
+        boot_info.cmdline_base =3D bdloc;
+        boot_info.cmdline_size =3D bdloc + len;
+    }
+
+    /* Install our custom reset handler to start from Linux */
+    qemu_register_reset(main_cpu_reset, cpu);
+    env->load_info =3D &boot_info;
+}
+
 static void ref405ep_init(MachineState *machine)
 {
     MachineClass *mc =3D MACHINE_GET_CLASS(machine);
     const char *kernel_filename =3D machine->kernel_filename;
-    const char *kernel_cmdline =3D machine->kernel_cmdline;
-    const char *initrd_filename =3D machine->initrd_filename;
     PowerPCCPU *cpu;
-    CPUPPCState *env;
     DeviceState *dev;
     SysBusDevice *s;
     MemoryRegion *sram =3D g_new(MemoryRegion, 1);
-    ram_addr_t bdloc;
     MemoryRegion *ram_memories =3D g_new(MemoryRegion, 2);
     hwaddr ram_bases[2], ram_sizes[2];
-    long bios_size =3D -1;
-    target_ulong kernel_base, initrd_base;
-    long kernel_size, initrd_size;
-    int linux_boot;
-    int len;
     MemoryRegion *sysmem =3D get_system_memory();
     DeviceState *uicdev;
=20
@@ -176,7 +253,6 @@ static void ref405ep_init(MachineState *machine)
=20
     cpu =3D ppc405ep_init(sysmem, ram_memories, ram_bases, ram_sizes,
                         33333333, &uicdev, kernel_filename =3D=3D NULL ?=
 0 : 1);
-    env =3D &cpu->env;
=20
     /* allocate SRAM */
     memory_region_init_ram(sram, NULL, "ef405ep.sram", PPC405EP_SRAM_SIZ=
E,
@@ -187,6 +263,7 @@ static void ref405ep_init(MachineState *machine)
     if (machine->firmware) {
         MemoryRegion *bios =3D g_new(MemoryRegion, 1);
         g_autofree char *filename;
+        long bios_size;
=20
         memory_region_init_rom(bios, NULL, "ef405ep.bios", BIOS_SIZE,
                                &error_fatal);
@@ -217,54 +294,36 @@ static void ref405ep_init(MachineState *machine)
     s =3D SYS_BUS_DEVICE(dev);
     sysbus_realize_and_unref(s, &error_fatal);
     sysbus_mmio_map(s, 0, PPC405EP_NVRAM_BASE);
-    /* Load kernel */
-    linux_boot =3D (kernel_filename !=3D NULL);
-    if (linux_boot) {
-        bdloc =3D ppc405_set_bootinfo(env, machine->ram_size);
-        env->gpr[3] =3D bdloc;
+
+    /* Load kernel and initrd using U-Boot images */
+    if (kernel_filename && machine->firmware) {
+        target_ulong kernel_base, initrd_base;
+        long kernel_size, initrd_size;
+
         kernel_base =3D KERNEL_LOAD_ADDR;
-        /* now we can load the kernel */
         kernel_size =3D load_image_targphys(kernel_filename, kernel_base=
,
                                           machine->ram_size - kernel_bas=
e);
         if (kernel_size < 0) {
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        printf("Load kernel size %ld at " TARGET_FMT_lx,
-               kernel_size, kernel_base);
+
         /* load initrd */
-        if (initrd_filename) {
+        if (machine->initrd_filename) {
             initrd_base =3D INITRD_LOAD_ADDR;
-            initrd_size =3D load_image_targphys(initrd_filename, initrd_=
base,
+            initrd_size =3D load_image_targphys(machine->initrd_filename=
,
+                                              initrd_base,
                                               machine->ram_size - initrd=
_base);
             if (initrd_size < 0) {
                 error_report("could not load initial ram disk '%s'",
-                             initrd_filename);
+                             machine->initrd_filename);
                 exit(1);
             }
-        } else {
-            initrd_base =3D 0;
-            initrd_size =3D 0;
-        }
-        env->gpr[4] =3D initrd_base;
-        env->gpr[5] =3D initrd_size;
-        if (kernel_cmdline !=3D NULL) {
-            len =3D strlen(kernel_cmdline);
-            bdloc -=3D ((len + 255) & ~255);
-            cpu_physical_memory_write(bdloc, kernel_cmdline, len + 1);
-            env->gpr[6] =3D bdloc;
-            env->gpr[7] =3D bdloc + len;
-        } else {
-            env->gpr[6] =3D 0;
-            env->gpr[7] =3D 0;
         }
-        env->nip =3D KERNEL_LOAD_ADDR;
-    } else {
-        kernel_base =3D 0;
-        kernel_size =3D 0;
-        initrd_base =3D 0;
-        initrd_size =3D 0;
-        bdloc =3D 0;
+
+    /* Load ELF kernel and rootfs.cpio */
+    } else if (kernel_filename && !machine->firmware) {
+        boot_from_kernel(machine, cpu);
     }
 }
=20
--=20
2.31.1


