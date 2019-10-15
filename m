Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C9CD74FF
	for <lists+qemu-devel@lfdr.de>; Tue, 15 Oct 2019 13:31:12 +0200 (CEST)
Received: from localhost ([::1]:41552 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iKL2k-0005kK-OU
	for lists+qemu-devel@lfdr.de; Tue, 15 Oct 2019 07:31:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56396)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <slp@redhat.com>) id 1iKKwf-0000Sr-Mr
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:24:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <slp@redhat.com>) id 1iKKwa-0004KA-Ng
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:24:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:49670)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <slp@redhat.com>) id 1iKKwa-0004JJ-BM
 for qemu-devel@nongnu.org; Tue, 15 Oct 2019 07:24:48 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 93CE610DCC8C;
 Tue, 15 Oct 2019 11:24:47 +0000 (UTC)
Received: from dritchie.redhat.com (unknown [10.33.36.106])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6A0071001E91;
 Tue, 15 Oct 2019 11:24:44 +0000 (UTC)
From: Sergio Lopez <slp@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 07/15] hw/i386/pc: move shared x86 functions to x86.c and
 export them
Date: Tue, 15 Oct 2019 13:23:38 +0200
Message-Id: <20191015112346.45554-8-slp@redhat.com>
In-Reply-To: <20191015112346.45554-1-slp@redhat.com>
References: <20191015112346.45554-1-slp@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.64]); Tue, 15 Oct 2019 11:24:47 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: ehabkost@redhat.com, Sergio Lopez <slp@redhat.com>, mst@redhat.com,
 lersek@redhat.com, kraxel@redhat.com, pbonzini@redhat.com, imammedo@redhat.com,
 sgarzare@redhat.com, philmd@redhat.com, rth@twiddle.net
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Move x86 functions that will be shared between PC and non-PC machine
types to x86.c, along with their helpers.

Signed-off-by: Sergio Lopez <slp@redhat.com>
Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
---
 include/hw/i386/pc.h  |   1 -
 include/hw/i386/x86.h |  35 +++
 hw/i386/pc.c          | 587 +----------------------------------
 hw/i386/pc_piix.c     |   1 +
 hw/i386/pc_q35.c      |   1 +
 hw/i386/pc_sysfw.c    |  56 +---
 hw/i386/x86.c         | 690 ++++++++++++++++++++++++++++++++++++++++++
 hw/i386/Makefile.objs |   1 +
 8 files changed, 730 insertions(+), 642 deletions(-)
 create mode 100644 include/hw/i386/x86.h
 create mode 100644 hw/i386/x86.c

diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
index d12f42e9e5..73e2847e87 100644
--- a/include/hw/i386/pc.h
+++ b/include/hw/i386/pc.h
@@ -195,7 +195,6 @@ bool pc_machine_is_smm_enabled(PCMachineState *pcms);
 void pc_register_ferr_irq(qemu_irq irq);
 void pc_acpi_smi_interrupt(void *opaque, int irq, int level);
=20
-void x86_cpus_init(PCMachineState *pcms);
 void pc_hot_add_cpu(MachineState *ms, const int64_t id, Error **errp);
 void pc_smp_parse(MachineState *ms, QemuOpts *opts);
=20
diff --git a/include/hw/i386/x86.h b/include/hw/i386/x86.h
new file mode 100644
index 0000000000..71e2b6985d
--- /dev/null
+++ b/include/hw/i386/x86.h
@@ -0,0 +1,35 @@
+/*
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * This program is free software; you can redistribute it and/or modify =
it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOU=
T
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License alo=
ng with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#ifndef HW_I386_X86_H
+#define HW_I386_X86_H
+
+#include "hw/boards.h"
+
+uint32_t x86_cpu_apic_id_from_index(PCMachineState *pcms,
+                                    unsigned int cpu_index);
+void x86_cpu_new(PCMachineState *pcms, int64_t apic_id, Error **errp);
+void x86_cpus_init(PCMachineState *pcms);
+CpuInstanceProperties x86_cpu_index_to_props(MachineState *ms,
+                                             unsigned cpu_index);
+int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx);
+const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms);
+
+void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw);
+
+void x86_load_linux(PCMachineState *x86ms, FWCfgState *fw_cfg);
+
+#endif
diff --git a/hw/i386/pc.c b/hw/i386/pc.c
index 612bfe9c95..05de536a2b 100644
--- a/hw/i386/pc.c
+++ b/hw/i386/pc.c
@@ -24,6 +24,7 @@
=20
 #include "qemu/osdep.h"
 #include "qemu/units.h"
+#include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "hw/char/serial.h"
 #include "hw/char/parallel.h"
@@ -103,9 +104,6 @@
=20
 struct hpet_fw_config hpet_cfg =3D {.count =3D UINT8_MAX};
=20
-/* Physical Address of PVH entry point read from kernel ELF NOTE */
-static size_t pvh_start_addr;
-
 GlobalProperty pc_compat_4_1[] =3D {};
 const size_t pc_compat_4_1_len =3D G_N_ELEMENTS(pc_compat_4_1);
=20
@@ -867,481 +865,6 @@ static void handle_a20_line_change(void *opaque, in=
t irq, int level)
     x86_cpu_set_a20(cpu, level);
 }
=20
-/*
- * Calculates initial APIC ID for a specific CPU index
- *
- * Currently we need to be able to calculate the APIC ID from the CPU in=
dex
- * alone (without requiring a CPU object), as the QEMU<->Seabios interfa=
ces have
- * no concept of "CPU index", and the NUMA tables on fw_cfg need the API=
C ID of
- * all CPUs up to max_cpus.
- */
-static uint32_t x86_cpu_apic_id_from_index(PCMachineState *pcms,
-                                           unsigned int cpu_index)
-{
-    MachineState *ms =3D MACHINE(pcms);
-    PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
-    uint32_t correct_id;
-    static bool warned;
-
-    correct_id =3D x86_apicid_from_cpu_idx(pcms->smp_dies, ms->smp.cores=
,
-                                         ms->smp.threads, cpu_index);
-    if (pcmc->compat_apic_id_mode) {
-        if (cpu_index !=3D correct_id && !warned && !qtest_enabled()) {
-            error_report("APIC IDs set in compatibility mode, "
-                         "CPU topology won't match the configuration");
-            warned =3D true;
-        }
-        return cpu_index;
-    } else {
-        return correct_id;
-    }
-}
-
-static long get_file_size(FILE *f)
-{
-    long where, size;
-
-    /* XXX: on Unix systems, using fstat() probably makes more sense */
-
-    where =3D ftell(f);
-    fseek(f, 0, SEEK_END);
-    size =3D ftell(f);
-    fseek(f, where, SEEK_SET);
-
-    return size;
-}
-
-struct setup_data {
-    uint64_t next;
-    uint32_t type;
-    uint32_t len;
-    uint8_t data[0];
-} __attribute__((packed));
-
-
-/*
- * The entry point into the kernel for PVH boot is different from
- * the native entry point.  The PVH entry is defined by the x86/HVM
- * direct boot ABI and is available in an ELFNOTE in the kernel binary.
- *
- * This function is passed to load_elf() when it is called from
- * load_elfboot() which then additionally checks for an ELF Note of
- * type XEN_ELFNOTE_PHYS32_ENTRY and passes it to this function to
- * parse the PVH entry address from the ELF Note.
- *
- * Due to trickery in elf_opts.h, load_elf() is actually available as
- * load_elf32() or load_elf64() and this routine needs to be able
- * to deal with being called as 32 or 64 bit.
- *
- * The address of the PVH entry point is saved to the 'pvh_start_addr'
- * global variable.  (although the entry point is 32-bit, the kernel
- * binary can be either 32-bit or 64-bit).
- */
-static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
-{
-    size_t *elf_note_data_addr;
-
-    /* Check if ELF Note header passed in is valid */
-    if (arg1 =3D=3D NULL) {
-        return 0;
-    }
-
-    if (is64) {
-        struct elf64_note *nhdr64 =3D (struct elf64_note *)arg1;
-        uint64_t nhdr_size64 =3D sizeof(struct elf64_note);
-        uint64_t phdr_align =3D *(uint64_t *)arg2;
-        uint64_t nhdr_namesz =3D nhdr64->n_namesz;
-
-        elf_note_data_addr =3D
-            ((void *)nhdr64) + nhdr_size64 +
-            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
-    } else {
-        struct elf32_note *nhdr32 =3D (struct elf32_note *)arg1;
-        uint32_t nhdr_size32 =3D sizeof(struct elf32_note);
-        uint32_t phdr_align =3D *(uint32_t *)arg2;
-        uint32_t nhdr_namesz =3D nhdr32->n_namesz;
-
-        elf_note_data_addr =3D
-            ((void *)nhdr32) + nhdr_size32 +
-            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
-    }
-
-    pvh_start_addr =3D *elf_note_data_addr;
-
-    return pvh_start_addr;
-}
-
-static bool load_elfboot(const char *kernel_filename,
-                   int kernel_file_size,
-                   uint8_t *header,
-                   size_t pvh_xen_start_addr,
-                   FWCfgState *fw_cfg)
-{
-    uint32_t flags =3D 0;
-    uint32_t mh_load_addr =3D 0;
-    uint32_t elf_kernel_size =3D 0;
-    uint64_t elf_entry;
-    uint64_t elf_low, elf_high;
-    int kernel_size;
-
-    if (ldl_p(header) !=3D 0x464c457f) {
-        return false; /* no elfboot */
-    }
-
-    bool elf_is64 =3D header[EI_CLASS] =3D=3D ELFCLASS64;
-    flags =3D elf_is64 ?
-        ((Elf64_Ehdr *)header)->e_flags : ((Elf32_Ehdr *)header)->e_flag=
s;
-
-    if (flags & 0x00010004) { /* LOAD_ELF_HEADER_HAS_ADDR */
-        error_report("elfboot unsupported flags =3D %x", flags);
-        exit(1);
-    }
-
-    uint64_t elf_note_type =3D XEN_ELFNOTE_PHYS32_ENTRY;
-    kernel_size =3D load_elf(kernel_filename, read_pvh_start_addr,
-                           NULL, &elf_note_type, &elf_entry,
-                           &elf_low, &elf_high, 0, I386_ELF_MACHINE,
-                           0, 0);
-
-    if (kernel_size < 0) {
-        error_report("Error while loading elf kernel");
-        exit(1);
-    }
-    mh_load_addr =3D elf_low;
-    elf_kernel_size =3D elf_high - elf_low;
-
-    if (pvh_start_addr =3D=3D 0) {
-        error_report("Error loading uncompressed kernel without PVH ELF =
Note");
-        exit(1);
-    }
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, pvh_start_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, mh_load_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, elf_kernel_size);
-
-    return true;
-}
-
-static void x86_load_linux(PCMachineState *pcms,
-                           FWCfgState *fw_cfg)
-{
-    uint16_t protocol;
-    int setup_size, kernel_size, cmdline_size;
-    int dtb_size, setup_data_offset;
-    uint32_t initrd_max;
-    uint8_t header[8192], *setup, *kernel;
-    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr =3D 0;
-    FILE *f;
-    char *vmode;
-    MachineState *machine =3D MACHINE(pcms);
-    PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
-    struct setup_data *setup_data;
-    const char *kernel_filename =3D machine->kernel_filename;
-    const char *initrd_filename =3D machine->initrd_filename;
-    const char *dtb_filename =3D machine->dtb;
-    const char *kernel_cmdline =3D machine->kernel_cmdline;
-
-    /* Align to 16 bytes as a paranoia measure */
-    cmdline_size =3D (strlen(kernel_cmdline) + 16) & ~15;
-
-    /* load the kernel header */
-    f =3D fopen(kernel_filename, "rb");
-    if (!f) {
-        fprintf(stderr, "qemu: could not open kernel file '%s': %s\n",
-                kernel_filename, strerror(errno));
-        exit(1);
-    }
-
-    kernel_size =3D get_file_size(f);
-    if (!kernel_size ||
-        fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=3D
-        MIN(ARRAY_SIZE(header), kernel_size)) {
-        fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
-                kernel_filename, strerror(errno));
-        exit(1);
-    }
-
-    /* kernel protocol version */
-    if (ldl_p(header + 0x202) =3D=3D 0x53726448) {
-        protocol =3D lduw_p(header + 0x206);
-    } else {
-        /*
-         * This could be a multiboot kernel. If it is, let's stop treati=
ng it
-         * like a Linux kernel.
-         * Note: some multiboot images could be in the ELF format (the s=
ame of
-         * PVH), so we try multiboot first since we check the multiboot =
magic
-         * header before to load it.
-         */
-        if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
-                           kernel_cmdline, kernel_size, header)) {
-            return;
-        }
-        /*
-         * Check if the file is an uncompressed kernel file (ELF) and lo=
ad it,
-         * saving the PVH entry point used by the x86/HVM direct boot AB=
I.
-         * If load_elfboot() is successful, populate the fw_cfg info.
-         */
-        if (pcmc->pvh_enabled &&
-            load_elfboot(kernel_filename, kernel_size,
-                         header, pvh_start_addr, fw_cfg)) {
-            fclose(f);
-
-            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
-                strlen(kernel_cmdline) + 1);
-            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdlin=
e);
-
-            fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, sizeof(header));
-            fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA,
-                             header, sizeof(header));
-
-            /* load initrd */
-            if (initrd_filename) {
-                GMappedFile *mapped_file;
-                gsize initrd_size;
-                gchar *initrd_data;
-                GError *gerr =3D NULL;
-
-                mapped_file =3D g_mapped_file_new(initrd_filename, false=
, &gerr);
-                if (!mapped_file) {
-                    fprintf(stderr, "qemu: error reading initrd %s: %s\n=
",
-                            initrd_filename, gerr->message);
-                    exit(1);
-                }
-                pcms->initrd_mapped_file =3D mapped_file;
-
-                initrd_data =3D g_mapped_file_get_contents(mapped_file);
-                initrd_size =3D g_mapped_file_get_length(mapped_file);
-                initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_data=
_size - 1;
-                if (initrd_size >=3D initrd_max) {
-                    fprintf(stderr, "qemu: initrd is too large, cannot s=
upport."
-                            "(max: %"PRIu32", need %"PRId64")\n",
-                            initrd_max, (uint64_t)initrd_size);
-                    exit(1);
-                }
-
-                initrd_addr =3D (initrd_max - initrd_size) & ~4095;
-
-                fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
-                fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-                fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data=
,
-                                 initrd_size);
-            }
-
-            option_rom[nb_option_roms].bootindex =3D 0;
-            option_rom[nb_option_roms].name =3D "pvh.bin";
-            nb_option_roms++;
-
-            return;
-        }
-        protocol =3D 0;
-    }
-
-    if (protocol < 0x200 || !(header[0x211] & 0x01)) {
-        /* Low kernel */
-        real_addr    =3D 0x90000;
-        cmdline_addr =3D 0x9a000 - cmdline_size;
-        prot_addr    =3D 0x10000;
-    } else if (protocol < 0x202) {
-        /* High but ancient kernel */
-        real_addr    =3D 0x90000;
-        cmdline_addr =3D 0x9a000 - cmdline_size;
-        prot_addr    =3D 0x100000;
-    } else {
-        /* High and recent kernel */
-        real_addr    =3D 0x10000;
-        cmdline_addr =3D 0x20000;
-        prot_addr    =3D 0x100000;
-    }
-
-    /* highest address for loading the initrd */
-    if (protocol >=3D 0x20c &&
-        lduw_p(header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
-        /*
-         * Linux has supported initrd up to 4 GB for a very long time (2=
007,
-         * long before XLF_CAN_BE_LOADED_ABOVE_4G which was added in 201=
3),
-         * though it only sets initrd_max to 2 GB to "work around bootlo=
ader
-         * bugs". Luckily, QEMU firmware(which does something like bootl=
oader)
-         * has supported this.
-         *
-         * It's believed that if XLF_CAN_BE_LOADED_ABOVE_4G is set, init=
rd can
-         * be loaded into any address.
-         *
-         * In addition, initrd_max is uint32_t simply because QEMU doesn=
't
-         * support the 64-bit boot protocol (specifically the ext_ramdis=
k_image
-         * field).
-         *
-         * Therefore here just limit initrd_max to UINT32_MAX simply as =
well.
-         */
-        initrd_max =3D UINT32_MAX;
-    } else if (protocol >=3D 0x203) {
-        initrd_max =3D ldl_p(header + 0x22c);
-    } else {
-        initrd_max =3D 0x37ffffff;
-    }
-
-    if (initrd_max >=3D pcms->below_4g_mem_size - pcmc->acpi_data_size) =
{
-        initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_data_size - =
1;
-    }
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) +=
 1);
-    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
-
-    if (protocol >=3D 0x202) {
-        stl_p(header + 0x228, cmdline_addr);
-    } else {
-        stw_p(header + 0x20, 0xA33F);
-        stw_p(header + 0x22, cmdline_addr - real_addr);
-    }
-
-    /* handle vga=3D parameter */
-    vmode =3D strstr(kernel_cmdline, "vga=3D");
-    if (vmode) {
-        unsigned int video_mode;
-        int ret;
-        /* skip "vga=3D" */
-        vmode +=3D 4;
-        if (!strncmp(vmode, "normal", 6)) {
-            video_mode =3D 0xffff;
-        } else if (!strncmp(vmode, "ext", 3)) {
-            video_mode =3D 0xfffe;
-        } else if (!strncmp(vmode, "ask", 3)) {
-            video_mode =3D 0xfffd;
-        } else {
-            ret =3D qemu_strtoui(vmode, NULL, 0, &video_mode);
-            if (ret !=3D 0) {
-                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\n=
",
-                        strerror(-ret));
-                exit(1);
-            }
-        }
-        stw_p(header + 0x1fa, video_mode);
-    }
-
-    /* loader type */
-    /*
-     * High nybble =3D B reserved for QEMU; low nybble is revision numbe=
r.
-     * If this code is substantially changed, you may want to consider
-     * incrementing the revision.
-     */
-    if (protocol >=3D 0x200) {
-        header[0x210] =3D 0xB0;
-    }
-    /* heap */
-    if (protocol >=3D 0x201) {
-        header[0x211] |=3D 0x80; /* CAN_USE_HEAP */
-        stw_p(header + 0x224, cmdline_addr - real_addr - 0x200);
-    }
-
-    /* load initrd */
-    if (initrd_filename) {
-        GMappedFile *mapped_file;
-        gsize initrd_size;
-        gchar *initrd_data;
-        GError *gerr =3D NULL;
-
-        if (protocol < 0x200) {
-            fprintf(stderr, "qemu: linux kernel too old to load a ram di=
sk\n");
-            exit(1);
-        }
-
-        mapped_file =3D g_mapped_file_new(initrd_filename, false, &gerr)=
;
-        if (!mapped_file) {
-            fprintf(stderr, "qemu: error reading initrd %s: %s\n",
-                    initrd_filename, gerr->message);
-            exit(1);
-        }
-        pcms->initrd_mapped_file =3D mapped_file;
-
-        initrd_data =3D g_mapped_file_get_contents(mapped_file);
-        initrd_size =3D g_mapped_file_get_length(mapped_file);
-        if (initrd_size >=3D initrd_max) {
-            fprintf(stderr, "qemu: initrd is too large, cannot support."
-                    "(max: %"PRIu32", need %"PRId64")\n",
-                    initrd_max, (uint64_t)initrd_size);
-            exit(1);
-        }
-
-        initrd_addr =3D (initrd_max - initrd_size) & ~4095;
-
-        fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
-        fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
-        fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd=
_size);
-
-        stl_p(header + 0x218, initrd_addr);
-        stl_p(header + 0x21c, initrd_size);
-    }
-
-    /* load kernel and setup */
-    setup_size =3D header[0x1f1];
-    if (setup_size =3D=3D 0) {
-        setup_size =3D 4;
-    }
-    setup_size =3D (setup_size + 1) * 512;
-    if (setup_size > kernel_size) {
-        fprintf(stderr, "qemu: invalid kernel header\n");
-        exit(1);
-    }
-    kernel_size -=3D setup_size;
-
-    setup  =3D g_malloc(setup_size);
-    kernel =3D g_malloc(kernel_size);
-    fseek(f, 0, SEEK_SET);
-    if (fread(setup, 1, setup_size, f) !=3D setup_size) {
-        fprintf(stderr, "fread() failed\n");
-        exit(1);
-    }
-    if (fread(kernel, 1, kernel_size, f) !=3D kernel_size) {
-        fprintf(stderr, "fread() failed\n");
-        exit(1);
-    }
-    fclose(f);
-
-    /* append dtb to kernel */
-    if (dtb_filename) {
-        if (protocol < 0x209) {
-            fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n"=
);
-            exit(1);
-        }
-
-        dtb_size =3D get_image_size(dtb_filename);
-        if (dtb_size <=3D 0) {
-            fprintf(stderr, "qemu: error reading dtb %s: %s\n",
-                    dtb_filename, strerror(errno));
-            exit(1);
-        }
-
-        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
-        kernel_size =3D setup_data_offset + sizeof(struct setup_data) + =
dtb_size;
-        kernel =3D g_realloc(kernel, kernel_size);
-
-        stq_p(header + 0x250, prot_addr + setup_data_offset);
-
-        setup_data =3D (struct setup_data *)(kernel + setup_data_offset)=
;
-        setup_data->next =3D 0;
-        setup_data->type =3D cpu_to_le32(SETUP_DTB);
-        setup_data->len =3D cpu_to_le32(dtb_size);
-
-        load_image_size(dtb_filename, setup_data->data, dtb_size);
-    }
-
-    memcpy(setup, header, MIN(sizeof(header), setup_size));
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
-
-    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
-    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
-    fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
-
-    option_rom[nb_option_roms].bootindex =3D 0;
-    option_rom[nb_option_roms].name =3D "linuxboot.bin";
-    if (pcmc->linuxboot_dma_enabled && fw_cfg_dma_enabled(fw_cfg)) {
-        option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";
-    }
-    nb_option_roms++;
-}
-
 #define NE2000_NB_MAX 6
=20
 static const int ne2000_io[NE2000_NB_MAX] =3D { 0x300, 0x320, 0x340, 0x3=
60,
@@ -1378,24 +901,6 @@ void pc_acpi_smi_interrupt(void *opaque, int irq, i=
nt level)
     }
 }
=20
-static void x86_cpu_new(PCMachineState *pcms, int64_t apic_id, Error **e=
rrp)
-{
-    Object *cpu =3D NULL;
-    Error *local_err =3D NULL;
-    CPUX86State *env =3D NULL;
-
-    cpu =3D object_new(MACHINE(pcms)->cpu_type);
-
-    env =3D &X86_CPU(cpu)->env;
-    env->nr_dies =3D pcms->smp_dies;
-
-    object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
-    object_property_set_bool(cpu, true, "realized", &local_err);
-
-    object_unref(cpu);
-    error_propagate(errp, local_err);
-}
-
 /*
  * This function is very similar to smp_parse()
  * in hw/core/machine.c but includes CPU die support.
@@ -1501,32 +1006,6 @@ void pc_hot_add_cpu(MachineState *ms, const int64_=
t id, Error **errp)
     }
 }
=20
-void x86_cpus_init(PCMachineState *pcms)
-{
-    int i;
-    const CPUArchIdList *possible_cpus;
-    MachineState *ms =3D MACHINE(pcms);
-    MachineClass *mc =3D MACHINE_GET_CLASS(pcms);
-    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(mc);
-
-    x86_cpu_set_default_version(pcmc->default_cpu_version);
-
-    /*
-     * Calculates the limit to CPU APIC ID values
-     *
-     * Limit for the APIC ID value, so that all
-     * CPU APIC IDs are < pcms->apic_id_limit.
-     *
-     * This is used for FW_CFG_MAX_CPUS. See comments on fw_cfg_arch_cre=
ate().
-     */
-    pcms->apic_id_limit =3D x86_cpu_apic_id_from_index(pcms,
-                                                     ms->smp.max_cpus - =
1) + 1;
-    possible_cpus =3D mc->possible_cpu_arch_ids(ms);
-    for (i =3D 0; i < ms->smp.cpus; i++) {
-        x86_cpu_new(pcms, possible_cpus->cpus[i].arch_id, &error_fatal);
-    }
-}
-
 static void rtc_set_cpus_count(ISADevice *rtc, uint16_t cpus_count)
 {
     if (cpus_count > 0xff) {
@@ -2682,70 +2161,6 @@ static void pc_machine_wakeup(MachineState *machin=
e)
     cpu_synchronize_all_post_reset();
 }
=20
-static CpuInstanceProperties
-x86_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
-{
-    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
-    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(ms)=
;
-
-    assert(cpu_index < possible_cpus->len);
-    return possible_cpus->cpus[cpu_index].props;
-}
-
-static int64_t x86_get_default_cpu_node_id(const MachineState *ms, int i=
dx)
-{
-   X86CPUTopoInfo topo;
-   PCMachineState *pcms =3D PC_MACHINE(ms);
-
-   assert(idx < ms->possible_cpus->len);
-   x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
-                            pcms->smp_dies, ms->smp.cores,
-                            ms->smp.threads, &topo);
-   return topo.pkg_id % ms->numa_state->num_nodes;
-}
-
-static const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
-{
-    PCMachineState *pcms =3D PC_MACHINE(ms);
-    int i;
-    unsigned int max_cpus =3D ms->smp.max_cpus;
-
-    if (ms->possible_cpus) {
-        /*
-         * make sure that max_cpus hasn't changed since the first use, i=
.e.
-         * -smp hasn't been parsed after it
-         */
-        assert(ms->possible_cpus->len =3D=3D max_cpus);
-        return ms->possible_cpus;
-    }
-
-    ms->possible_cpus =3D g_malloc0(sizeof(CPUArchIdList) +
-                                  sizeof(CPUArchId) * max_cpus);
-    ms->possible_cpus->len =3D max_cpus;
-    for (i =3D 0; i < ms->possible_cpus->len; i++) {
-        X86CPUTopoInfo topo;
-
-        ms->possible_cpus->cpus[i].type =3D ms->cpu_type;
-        ms->possible_cpus->cpus[i].vcpus_count =3D 1;
-        ms->possible_cpus->cpus[i].arch_id =3D
-            x86_cpu_apic_id_from_index(pcms, i);
-        x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
-                                 pcms->smp_dies, ms->smp.cores,
-                                 ms->smp.threads, &topo);
-        ms->possible_cpus->cpus[i].props.has_socket_id =3D true;
-        ms->possible_cpus->cpus[i].props.socket_id =3D topo.pkg_id;
-        if (pcms->smp_dies > 1) {
-            ms->possible_cpus->cpus[i].props.has_die_id =3D true;
-            ms->possible_cpus->cpus[i].props.die_id =3D topo.die_id;
-        }
-        ms->possible_cpus->cpus[i].props.has_core_id =3D true;
-        ms->possible_cpus->cpus[i].props.core_id =3D topo.core_id;
-        ms->possible_cpus->cpus[i].props.has_thread_id =3D true;
-        ms->possible_cpus->cpus[i].props.thread_id =3D topo.smt_id;
-    }
-    return ms->possible_cpus;
-}
-
 static void x86_nmi(NMIState *n, int cpu_index, Error **errp)
 {
     /* cpu index isn't used */
diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
index de09e076cd..1396451abf 100644
--- a/hw/i386/pc_piix.c
+++ b/hw/i386/pc_piix.c
@@ -27,6 +27,7 @@
=20
 #include "qemu/units.h"
 #include "hw/loader.h"
+#include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/apic.h"
 #include "hw/display/ramfb.h"
diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
index 894989b64e..8920bd8978 100644
--- a/hw/i386/pc_q35.c
+++ b/hw/i386/pc_q35.c
@@ -41,6 +41,7 @@
 #include "hw/pci-host/q35.h"
 #include "hw/qdev-properties.h"
 #include "exec/address-spaces.h"
+#include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "hw/i386/ich9.h"
 #include "hw/i386/amd_iommu.h"
diff --git a/hw/i386/pc_sysfw.c b/hw/i386/pc_sysfw.c
index 28cb1f63c9..f5f3f466b0 100644
--- a/hw/i386/pc_sysfw.c
+++ b/hw/i386/pc_sysfw.c
@@ -31,6 +31,7 @@
 #include "qemu/option.h"
 #include "qemu/units.h"
 #include "hw/sysbus.h"
+#include "hw/i386/x86.h"
 #include "hw/i386/pc.h"
 #include "hw/loader.h"
 #include "hw/qdev-properties.h"
@@ -38,8 +39,6 @@
 #include "hw/block/flash.h"
 #include "sysemu/kvm.h"
=20
-#define BIOS_FILENAME "bios.bin"
-
 /*
  * We don't have a theoretically justifiable exact lower bound on the ba=
se
  * address of any flash mapping. In practice, the IO-APIC MMIO range is
@@ -211,59 +210,6 @@ static void pc_system_flash_map(PCMachineState *pcms=
,
     }
 }
=20
-static void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_f=
w)
-{
-    char *filename;
-    MemoryRegion *bios, *isa_bios;
-    int bios_size, isa_bios_size;
-    int ret;
-
-    /* BIOS load */
-    if (bios_name =3D=3D NULL) {
-        bios_name =3D BIOS_FILENAME;
-    }
-    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
-    if (filename) {
-        bios_size =3D get_image_size(filename);
-    } else {
-        bios_size =3D -1;
-    }
-    if (bios_size <=3D 0 ||
-        (bios_size % 65536) !=3D 0) {
-        goto bios_error;
-    }
-    bios =3D g_malloc(sizeof(*bios));
-    memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fata=
l);
-    if (!isapc_ram_fw) {
-        memory_region_set_readonly(bios, true);
-    }
-    ret =3D rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
-    if (ret !=3D 0) {
-    bios_error:
-        fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name=
);
-        exit(1);
-    }
-    g_free(filename);
-
-    /* map the last 128KB of the BIOS in ISA space */
-    isa_bios_size =3D MIN(bios_size, 128 * KiB);
-    isa_bios =3D g_malloc(sizeof(*isa_bios));
-    memory_region_init_alias(isa_bios, NULL, "isa-bios", bios,
-                             bios_size - isa_bios_size, isa_bios_size);
-    memory_region_add_subregion_overlap(rom_memory,
-                                        0x100000 - isa_bios_size,
-                                        isa_bios,
-                                        1);
-    if (!isapc_ram_fw) {
-        memory_region_set_readonly(isa_bios, true);
-    }
-
-    /* map all the bios at the top of memory */
-    memory_region_add_subregion(rom_memory,
-                                (uint32_t)(-bios_size),
-                                bios);
-}
-
 void pc_system_firmware_init(PCMachineState *pcms,
                              MemoryRegion *rom_memory)
 {
diff --git a/hw/i386/x86.c b/hw/i386/x86.c
new file mode 100644
index 0000000000..71fb093983
--- /dev/null
+++ b/hw/i386/x86.c
@@ -0,0 +1,690 @@
+/*
+ * Copyright (c) 2003-2004 Fabrice Bellard
+ * Copyright (c) 2019 Red Hat, Inc.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining=
 a copy
+ * of this software and associated documentation files (the "Software"),=
 to deal
+ * in the Software without restriction, including without limitation the=
 rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or =
sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be includ=
ed in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRE=
SS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILI=
TY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHA=
LL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR =
OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISI=
NG FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALING=
S IN
+ * THE SOFTWARE.
+ */
+#include "qemu/osdep.h"
+#include "qemu/error-report.h"
+#include "qemu/option.h"
+#include "qemu/cutils.h"
+#include "qemu/units.h"
+#include "qemu-common.h"
+#include "qapi/error.h"
+#include "qapi/qmp/qerror.h"
+#include "qapi/qapi-visit-common.h"
+#include "qapi/visitor.h"
+#include "sysemu/qtest.h"
+#include "sysemu/numa.h"
+#include "sysemu/replay.h"
+#include "sysemu/sysemu.h"
+
+#include "hw/i386/x86.h"
+#include "hw/i386/pc.h"
+#include "target/i386/cpu.h"
+#include "hw/i386/topology.h"
+#include "hw/i386/fw_cfg.h"
+
+#include "hw/acpi/cpu_hotplug.h"
+#include "hw/nmi.h"
+#include "hw/loader.h"
+#include "multiboot.h"
+#include "elf.h"
+#include "standard-headers/asm-x86/bootparam.h"
+
+#define BIOS_FILENAME "bios.bin"
+
+/* Physical Address of PVH entry point read from kernel ELF NOTE */
+static size_t pvh_start_addr;
+
+/*
+ * Calculates initial APIC ID for a specific CPU index
+ *
+ * Currently we need to be able to calculate the APIC ID from the CPU in=
dex
+ * alone (without requiring a CPU object), as the QEMU<->Seabios interfa=
ces have
+ * no concept of "CPU index", and the NUMA tables on fw_cfg need the API=
C ID of
+ * all CPUs up to max_cpus.
+ */
+uint32_t x86_cpu_apic_id_from_index(PCMachineState *pcms,
+                                    unsigned int cpu_index)
+{
+    MachineState *ms =3D MACHINE(pcms);
+    PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
+    uint32_t correct_id;
+    static bool warned;
+
+    correct_id =3D x86_apicid_from_cpu_idx(pcms->smp_dies, ms->smp.cores=
,
+                                         ms->smp.threads, cpu_index);
+    if (pcmc->compat_apic_id_mode) {
+        if (cpu_index !=3D correct_id && !warned && !qtest_enabled()) {
+            error_report("APIC IDs set in compatibility mode, "
+                         "CPU topology won't match the configuration");
+            warned =3D true;
+        }
+        return cpu_index;
+    } else {
+        return correct_id;
+    }
+}
+
+void x86_cpu_new(PCMachineState *pcms, int64_t apic_id, Error **errp)
+{
+    Object *cpu =3D NULL;
+    Error *local_err =3D NULL;
+    CPUX86State *env =3D NULL;
+
+    cpu =3D object_new(MACHINE(pcms)->cpu_type);
+
+    env =3D &X86_CPU(cpu)->env;
+    env->nr_dies =3D pcms->smp_dies;
+
+    object_property_set_uint(cpu, apic_id, "apic-id", &local_err);
+    object_property_set_bool(cpu, true, "realized", &local_err);
+
+    object_unref(cpu);
+    error_propagate(errp, local_err);
+}
+
+void x86_cpus_init(PCMachineState *pcms)
+{
+    int i;
+    const CPUArchIdList *possible_cpus;
+    MachineState *ms =3D MACHINE(pcms);
+    MachineClass *mc =3D MACHINE_GET_CLASS(pcms);
+    PCMachineClass *pcmc =3D PC_MACHINE_CLASS(mc);
+
+    x86_cpu_set_default_version(pcmc->default_cpu_version);
+
+    /*
+     * Calculates the limit to CPU APIC ID values
+     *
+     * Limit for the APIC ID value, so that all
+     * CPU APIC IDs are < pcms->apic_id_limit.
+     *
+     * This is used for FW_CFG_MAX_CPUS. See comments on fw_cfg_arch_cre=
ate().
+     */
+    pcms->apic_id_limit =3D x86_cpu_apic_id_from_index(pcms,
+                                                     ms->smp.max_cpus - =
1) + 1;
+    possible_cpus =3D mc->possible_cpu_arch_ids(ms);
+    for (i =3D 0; i < ms->smp.cpus; i++) {
+        x86_cpu_new(pcms, possible_cpus->cpus[i].arch_id, &error_fatal);
+    }
+}
+
+CpuInstanceProperties
+x86_cpu_index_to_props(MachineState *ms, unsigned cpu_index)
+{
+    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
+    const CPUArchIdList *possible_cpus =3D mc->possible_cpu_arch_ids(ms)=
;
+
+    assert(cpu_index < possible_cpus->len);
+    return possible_cpus->cpus[cpu_index].props;
+}
+
+int64_t x86_get_default_cpu_node_id(const MachineState *ms, int idx)
+{
+   X86CPUTopoInfo topo;
+   PCMachineState *pcms =3D PC_MACHINE(ms);
+
+   assert(idx < ms->possible_cpus->len);
+   x86_topo_ids_from_apicid(ms->possible_cpus->cpus[idx].arch_id,
+                            pcms->smp_dies, ms->smp.cores,
+                            ms->smp.threads, &topo);
+   return topo.pkg_id % ms->numa_state->num_nodes;
+}
+
+const CPUArchIdList *x86_possible_cpu_arch_ids(MachineState *ms)
+{
+    PCMachineState *pcms =3D PC_MACHINE(ms);
+    int i;
+    unsigned int max_cpus =3D ms->smp.max_cpus;
+
+    if (ms->possible_cpus) {
+        /*
+         * make sure that max_cpus hasn't changed since the first use, i=
.e.
+         * -smp hasn't been parsed after it
+         */
+        assert(ms->possible_cpus->len =3D=3D max_cpus);
+        return ms->possible_cpus;
+    }
+
+    ms->possible_cpus =3D g_malloc0(sizeof(CPUArchIdList) +
+                                  sizeof(CPUArchId) * max_cpus);
+    ms->possible_cpus->len =3D max_cpus;
+    for (i =3D 0; i < ms->possible_cpus->len; i++) {
+        X86CPUTopoInfo topo;
+
+        ms->possible_cpus->cpus[i].type =3D ms->cpu_type;
+        ms->possible_cpus->cpus[i].vcpus_count =3D 1;
+        ms->possible_cpus->cpus[i].arch_id =3D
+            x86_cpu_apic_id_from_index(pcms, i);
+        x86_topo_ids_from_apicid(ms->possible_cpus->cpus[i].arch_id,
+                                 pcms->smp_dies, ms->smp.cores,
+                                 ms->smp.threads, &topo);
+        ms->possible_cpus->cpus[i].props.has_socket_id =3D true;
+        ms->possible_cpus->cpus[i].props.socket_id =3D topo.pkg_id;
+        if (pcms->smp_dies > 1) {
+            ms->possible_cpus->cpus[i].props.has_die_id =3D true;
+            ms->possible_cpus->cpus[i].props.die_id =3D topo.die_id;
+        }
+        ms->possible_cpus->cpus[i].props.has_core_id =3D true;
+        ms->possible_cpus->cpus[i].props.core_id =3D topo.core_id;
+        ms->possible_cpus->cpus[i].props.has_thread_id =3D true;
+        ms->possible_cpus->cpus[i].props.thread_id =3D topo.smt_id;
+    }
+    return ms->possible_cpus;
+}
+
+static long get_file_size(FILE *f)
+{
+    long where, size;
+
+    /* XXX: on Unix systems, using fstat() probably makes more sense */
+
+    where =3D ftell(f);
+    fseek(f, 0, SEEK_END);
+    size =3D ftell(f);
+    fseek(f, where, SEEK_SET);
+
+    return size;
+}
+
+struct setup_data {
+    uint64_t next;
+    uint32_t type;
+    uint32_t len;
+    uint8_t data[0];
+} __attribute__((packed));
+
+
+/*
+ * The entry point into the kernel for PVH boot is different from
+ * the native entry point.  The PVH entry is defined by the x86/HVM
+ * direct boot ABI and is available in an ELFNOTE in the kernel binary.
+ *
+ * This function is passed to load_elf() when it is called from
+ * load_elfboot() which then additionally checks for an ELF Note of
+ * type XEN_ELFNOTE_PHYS32_ENTRY and passes it to this function to
+ * parse the PVH entry address from the ELF Note.
+ *
+ * Due to trickery in elf_opts.h, load_elf() is actually available as
+ * load_elf32() or load_elf64() and this routine needs to be able
+ * to deal with being called as 32 or 64 bit.
+ *
+ * The address of the PVH entry point is saved to the 'pvh_start_addr'
+ * global variable.  (although the entry point is 32-bit, the kernel
+ * binary can be either 32-bit or 64-bit).
+ */
+static uint64_t read_pvh_start_addr(void *arg1, void *arg2, bool is64)
+{
+    size_t *elf_note_data_addr;
+
+    /* Check if ELF Note header passed in is valid */
+    if (arg1 =3D=3D NULL) {
+        return 0;
+    }
+
+    if (is64) {
+        struct elf64_note *nhdr64 =3D (struct elf64_note *)arg1;
+        uint64_t nhdr_size64 =3D sizeof(struct elf64_note);
+        uint64_t phdr_align =3D *(uint64_t *)arg2;
+        uint64_t nhdr_namesz =3D nhdr64->n_namesz;
+
+        elf_note_data_addr =3D
+            ((void *)nhdr64) + nhdr_size64 +
+            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
+    } else {
+        struct elf32_note *nhdr32 =3D (struct elf32_note *)arg1;
+        uint32_t nhdr_size32 =3D sizeof(struct elf32_note);
+        uint32_t phdr_align =3D *(uint32_t *)arg2;
+        uint32_t nhdr_namesz =3D nhdr32->n_namesz;
+
+        elf_note_data_addr =3D
+            ((void *)nhdr32) + nhdr_size32 +
+            QEMU_ALIGN_UP(nhdr_namesz, phdr_align);
+    }
+
+    pvh_start_addr =3D *elf_note_data_addr;
+
+    return pvh_start_addr;
+}
+
+static bool load_elfboot(const char *kernel_filename,
+                         int kernel_file_size,
+                         uint8_t *header,
+                         size_t pvh_xen_start_addr,
+                         FWCfgState *fw_cfg)
+{
+    uint32_t flags =3D 0;
+    uint32_t mh_load_addr =3D 0;
+    uint32_t elf_kernel_size =3D 0;
+    uint64_t elf_entry;
+    uint64_t elf_low, elf_high;
+    int kernel_size;
+
+    if (ldl_p(header) !=3D 0x464c457f) {
+        return false; /* no elfboot */
+    }
+
+    bool elf_is64 =3D header[EI_CLASS] =3D=3D ELFCLASS64;
+    flags =3D elf_is64 ?
+        ((Elf64_Ehdr *)header)->e_flags : ((Elf32_Ehdr *)header)->e_flag=
s;
+
+    if (flags & 0x00010004) { /* LOAD_ELF_HEADER_HAS_ADDR */
+        error_report("elfboot unsupported flags =3D %x", flags);
+        exit(1);
+    }
+
+    uint64_t elf_note_type =3D XEN_ELFNOTE_PHYS32_ENTRY;
+    kernel_size =3D load_elf(kernel_filename, read_pvh_start_addr,
+                           NULL, &elf_note_type, &elf_entry,
+                           &elf_low, &elf_high, 0, I386_ELF_MACHINE,
+                           0, 0);
+
+    if (kernel_size < 0) {
+        error_report("Error while loading elf kernel");
+        exit(1);
+    }
+    mh_load_addr =3D elf_low;
+    elf_kernel_size =3D elf_high - elf_low;
+
+    if (pvh_start_addr =3D=3D 0) {
+        error_report("Error loading uncompressed kernel without PVH ELF =
Note");
+        exit(1);
+    }
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ENTRY, pvh_start_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, mh_load_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, elf_kernel_size);
+
+    return true;
+}
+
+void x86_load_linux(PCMachineState *pcms,
+                    FWCfgState *fw_cfg)
+{
+    uint16_t protocol;
+    int setup_size, kernel_size, cmdline_size;
+    int dtb_size, setup_data_offset;
+    uint32_t initrd_max;
+    uint8_t header[8192], *setup, *kernel;
+    hwaddr real_addr, prot_addr, cmdline_addr, initrd_addr =3D 0;
+    FILE *f;
+    char *vmode;
+    MachineState *machine =3D MACHINE(pcms);
+    PCMachineClass *pcmc =3D PC_MACHINE_GET_CLASS(pcms);
+    struct setup_data *setup_data;
+    const char *kernel_filename =3D machine->kernel_filename;
+    const char *initrd_filename =3D machine->initrd_filename;
+    const char *dtb_filename =3D machine->dtb;
+    const char *kernel_cmdline =3D machine->kernel_cmdline;
+
+    /* Align to 16 bytes as a paranoia measure */
+    cmdline_size =3D (strlen(kernel_cmdline) + 16) & ~15;
+
+    /* load the kernel header */
+    f =3D fopen(kernel_filename, "rb");
+    if (!f) {
+        fprintf(stderr, "qemu: could not open kernel file '%s': %s\n",
+                kernel_filename, strerror(errno));
+        exit(1);
+    }
+
+    kernel_size =3D get_file_size(f);
+    if (!kernel_size ||
+        fread(header, 1, MIN(ARRAY_SIZE(header), kernel_size), f) !=3D
+        MIN(ARRAY_SIZE(header), kernel_size)) {
+        fprintf(stderr, "qemu: could not load kernel '%s': %s\n",
+                kernel_filename, strerror(errno));
+        exit(1);
+    }
+
+    /* kernel protocol version */
+    if (ldl_p(header + 0x202) =3D=3D 0x53726448) {
+        protocol =3D lduw_p(header + 0x206);
+    } else {
+        /*
+         * This could be a multiboot kernel. If it is, let's stop treati=
ng it
+         * like a Linux kernel.
+         * Note: some multiboot images could be in the ELF format (the s=
ame of
+         * PVH), so we try multiboot first since we check the multiboot =
magic
+         * header before to load it.
+         */
+        if (load_multiboot(fw_cfg, f, kernel_filename, initrd_filename,
+                           kernel_cmdline, kernel_size, header)) {
+            return;
+        }
+        /*
+         * Check if the file is an uncompressed kernel file (ELF) and lo=
ad it,
+         * saving the PVH entry point used by the x86/HVM direct boot AB=
I.
+         * If load_elfboot() is successful, populate the fw_cfg info.
+         */
+        if (pcmc->pvh_enabled &&
+            load_elfboot(kernel_filename, kernel_size,
+                         header, pvh_start_addr, fw_cfg)) {
+            fclose(f);
+
+            fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE,
+                strlen(kernel_cmdline) + 1);
+            fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdlin=
e);
+
+            fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, sizeof(header));
+            fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA,
+                             header, sizeof(header));
+
+            /* load initrd */
+            if (initrd_filename) {
+                GMappedFile *mapped_file;
+                gsize initrd_size;
+                gchar *initrd_data;
+                GError *gerr =3D NULL;
+
+                mapped_file =3D g_mapped_file_new(initrd_filename, false=
, &gerr);
+                if (!mapped_file) {
+                    fprintf(stderr, "qemu: error reading initrd %s: %s\n=
",
+                            initrd_filename, gerr->message);
+                    exit(1);
+                }
+                pcms->initrd_mapped_file =3D mapped_file;
+
+                initrd_data =3D g_mapped_file_get_contents(mapped_file);
+                initrd_size =3D g_mapped_file_get_length(mapped_file);
+                initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_data=
_size - 1;
+                if (initrd_size >=3D initrd_max) {
+                    fprintf(stderr, "qemu: initrd is too large, cannot s=
upport."
+                            "(max: %"PRIu32", need %"PRId64")\n",
+                            initrd_max, (uint64_t)initrd_size);
+                    exit(1);
+                }
+
+                initrd_addr =3D (initrd_max - initrd_size) & ~4095;
+
+                fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
+                fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
+                fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data=
,
+                                 initrd_size);
+            }
+
+            option_rom[nb_option_roms].bootindex =3D 0;
+            option_rom[nb_option_roms].name =3D "pvh.bin";
+            nb_option_roms++;
+
+            return;
+        }
+        protocol =3D 0;
+    }
+
+    if (protocol < 0x200 || !(header[0x211] & 0x01)) {
+        /* Low kernel */
+        real_addr    =3D 0x90000;
+        cmdline_addr =3D 0x9a000 - cmdline_size;
+        prot_addr    =3D 0x10000;
+    } else if (protocol < 0x202) {
+        /* High but ancient kernel */
+        real_addr    =3D 0x90000;
+        cmdline_addr =3D 0x9a000 - cmdline_size;
+        prot_addr    =3D 0x100000;
+    } else {
+        /* High and recent kernel */
+        real_addr    =3D 0x10000;
+        cmdline_addr =3D 0x20000;
+        prot_addr    =3D 0x100000;
+    }
+
+    /* highest address for loading the initrd */
+    if (protocol >=3D 0x20c &&
+        lduw_p(header + 0x236) & XLF_CAN_BE_LOADED_ABOVE_4G) {
+        /*
+         * Linux has supported initrd up to 4 GB for a very long time (2=
007,
+         * long before XLF_CAN_BE_LOADED_ABOVE_4G which was added in 201=
3),
+         * though it only sets initrd_max to 2 GB to "work around bootlo=
ader
+         * bugs". Luckily, QEMU firmware(which does something like bootl=
oader)
+         * has supported this.
+         *
+         * It's believed that if XLF_CAN_BE_LOADED_ABOVE_4G is set, init=
rd can
+         * be loaded into any address.
+         *
+         * In addition, initrd_max is uint32_t simply because QEMU doesn=
't
+         * support the 64-bit boot protocol (specifically the ext_ramdis=
k_image
+         * field).
+         *
+         * Therefore here just limit initrd_max to UINT32_MAX simply as =
well.
+         */
+        initrd_max =3D UINT32_MAX;
+    } else if (protocol >=3D 0x203) {
+        initrd_max =3D ldl_p(header + 0x22c);
+    } else {
+        initrd_max =3D 0x37ffffff;
+    }
+
+    if (initrd_max >=3D pcms->below_4g_mem_size - pcmc->acpi_data_size) =
{
+        initrd_max =3D pcms->below_4g_mem_size - pcmc->acpi_data_size - =
1;
+    }
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_ADDR, cmdline_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_CMDLINE_SIZE, strlen(kernel_cmdline) +=
 1);
+    fw_cfg_add_string(fw_cfg, FW_CFG_CMDLINE_DATA, kernel_cmdline);
+
+    if (protocol >=3D 0x202) {
+        stl_p(header + 0x228, cmdline_addr);
+    } else {
+        stw_p(header + 0x20, 0xA33F);
+        stw_p(header + 0x22, cmdline_addr - real_addr);
+    }
+
+    /* handle vga=3D parameter */
+    vmode =3D strstr(kernel_cmdline, "vga=3D");
+    if (vmode) {
+        unsigned int video_mode;
+        int ret;
+        /* skip "vga=3D" */
+        vmode +=3D 4;
+        if (!strncmp(vmode, "normal", 6)) {
+            video_mode =3D 0xffff;
+        } else if (!strncmp(vmode, "ext", 3)) {
+            video_mode =3D 0xfffe;
+        } else if (!strncmp(vmode, "ask", 3)) {
+            video_mode =3D 0xfffd;
+        } else {
+            ret =3D qemu_strtoui(vmode, NULL, 0, &video_mode);
+            if (ret !=3D 0) {
+                fprintf(stderr, "qemu: can't parse 'vga' parameter: %s\n=
",
+                        strerror(-ret));
+                exit(1);
+            }
+        }
+        stw_p(header + 0x1fa, video_mode);
+    }
+
+    /* loader type */
+    /*
+     * High nybble =3D B reserved for QEMU; low nybble is revision numbe=
r.
+     * If this code is substantially changed, you may want to consider
+     * incrementing the revision.
+     */
+    if (protocol >=3D 0x200) {
+        header[0x210] =3D 0xB0;
+    }
+    /* heap */
+    if (protocol >=3D 0x201) {
+        header[0x211] |=3D 0x80; /* CAN_USE_HEAP */
+        stw_p(header + 0x224, cmdline_addr - real_addr - 0x200);
+    }
+
+    /* load initrd */
+    if (initrd_filename) {
+        GMappedFile *mapped_file;
+        gsize initrd_size;
+        gchar *initrd_data;
+        GError *gerr =3D NULL;
+
+        if (protocol < 0x200) {
+            fprintf(stderr, "qemu: linux kernel too old to load a ram di=
sk\n");
+            exit(1);
+        }
+
+        mapped_file =3D g_mapped_file_new(initrd_filename, false, &gerr)=
;
+        if (!mapped_file) {
+            fprintf(stderr, "qemu: error reading initrd %s: %s\n",
+                    initrd_filename, gerr->message);
+            exit(1);
+        }
+        pcms->initrd_mapped_file =3D mapped_file;
+
+        initrd_data =3D g_mapped_file_get_contents(mapped_file);
+        initrd_size =3D g_mapped_file_get_length(mapped_file);
+        if (initrd_size >=3D initrd_max) {
+            fprintf(stderr, "qemu: initrd is too large, cannot support."
+                    "(max: %"PRIu32", need %"PRId64")\n",
+                    initrd_max, (uint64_t)initrd_size);
+            exit(1);
+        }
+
+        initrd_addr =3D (initrd_max - initrd_size) & ~4095;
+
+        fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_ADDR, initrd_addr);
+        fw_cfg_add_i32(fw_cfg, FW_CFG_INITRD_SIZE, initrd_size);
+        fw_cfg_add_bytes(fw_cfg, FW_CFG_INITRD_DATA, initrd_data, initrd=
_size);
+
+        stl_p(header + 0x218, initrd_addr);
+        stl_p(header + 0x21c, initrd_size);
+    }
+
+    /* load kernel and setup */
+    setup_size =3D header[0x1f1];
+    if (setup_size =3D=3D 0) {
+        setup_size =3D 4;
+    }
+    setup_size =3D (setup_size + 1) * 512;
+    if (setup_size > kernel_size) {
+        fprintf(stderr, "qemu: invalid kernel header\n");
+        exit(1);
+    }
+    kernel_size -=3D setup_size;
+
+    setup  =3D g_malloc(setup_size);
+    kernel =3D g_malloc(kernel_size);
+    fseek(f, 0, SEEK_SET);
+    if (fread(setup, 1, setup_size, f) !=3D setup_size) {
+        fprintf(stderr, "fread() failed\n");
+        exit(1);
+    }
+    if (fread(kernel, 1, kernel_size, f) !=3D kernel_size) {
+        fprintf(stderr, "fread() failed\n");
+        exit(1);
+    }
+    fclose(f);
+
+    /* append dtb to kernel */
+    if (dtb_filename) {
+        if (protocol < 0x209) {
+            fprintf(stderr, "qemu: Linux kernel too old to load a dtb\n"=
);
+            exit(1);
+        }
+
+        dtb_size =3D get_image_size(dtb_filename);
+        if (dtb_size <=3D 0) {
+            fprintf(stderr, "qemu: error reading dtb %s: %s\n",
+                    dtb_filename, strerror(errno));
+            exit(1);
+        }
+
+        setup_data_offset =3D QEMU_ALIGN_UP(kernel_size, 16);
+        kernel_size =3D setup_data_offset + sizeof(struct setup_data) + =
dtb_size;
+        kernel =3D g_realloc(kernel, kernel_size);
+
+        stq_p(header + 0x250, prot_addr + setup_data_offset);
+
+        setup_data =3D (struct setup_data *)(kernel + setup_data_offset)=
;
+        setup_data->next =3D 0;
+        setup_data->type =3D cpu_to_le32(SETUP_DTB);
+        setup_data->len =3D cpu_to_le32(dtb_size);
+
+        load_image_size(dtb_filename, setup_data->data, dtb_size);
+    }
+
+    memcpy(setup, header, MIN(sizeof(header), setup_size));
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_ADDR, prot_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_KERNEL_SIZE, kernel_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_KERNEL_DATA, kernel, kernel_size);
+
+    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_ADDR, real_addr);
+    fw_cfg_add_i32(fw_cfg, FW_CFG_SETUP_SIZE, setup_size);
+    fw_cfg_add_bytes(fw_cfg, FW_CFG_SETUP_DATA, setup, setup_size);
+
+    option_rom[nb_option_roms].bootindex =3D 0;
+    option_rom[nb_option_roms].name =3D "linuxboot.bin";
+    if (pcmc->linuxboot_dma_enabled && fw_cfg_dma_enabled(fw_cfg)) {
+        option_rom[nb_option_roms].name =3D "linuxboot_dma.bin";
+    }
+    nb_option_roms++;
+}
+
+void x86_bios_rom_init(MemoryRegion *rom_memory, bool isapc_ram_fw)
+{
+    char *filename;
+    MemoryRegion *bios, *isa_bios;
+    int bios_size, isa_bios_size;
+    int ret;
+
+    /* BIOS load */
+    if (bios_name =3D=3D NULL) {
+        bios_name =3D BIOS_FILENAME;
+    }
+    filename =3D qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
+    if (filename) {
+        bios_size =3D get_image_size(filename);
+    } else {
+        bios_size =3D -1;
+    }
+    if (bios_size <=3D 0 ||
+        (bios_size % 65536) !=3D 0) {
+        goto bios_error;
+    }
+    bios =3D g_malloc(sizeof(*bios));
+    memory_region_init_ram(bios, NULL, "pc.bios", bios_size, &error_fata=
l);
+    if (!isapc_ram_fw) {
+        memory_region_set_readonly(bios, true);
+    }
+    ret =3D rom_add_file_fixed(bios_name, (uint32_t)(-bios_size), -1);
+    if (ret !=3D 0) {
+    bios_error:
+        fprintf(stderr, "qemu: could not load PC BIOS '%s'\n", bios_name=
);
+        exit(1);
+    }
+    g_free(filename);
+
+    /* map the last 128KB of the BIOS in ISA space */
+    isa_bios_size =3D MIN(bios_size, 128 * KiB);
+    isa_bios =3D g_malloc(sizeof(*isa_bios));
+    memory_region_init_alias(isa_bios, NULL, "isa-bios", bios,
+                             bios_size - isa_bios_size, isa_bios_size);
+    memory_region_add_subregion_overlap(rom_memory,
+                                        0x100000 - isa_bios_size,
+                                        isa_bios,
+                                        1);
+    if (!isapc_ram_fw) {
+        memory_region_set_readonly(isa_bios, true);
+    }
+
+    /* map all the bios at the top of memory */
+    memory_region_add_subregion(rom_memory,
+                                (uint32_t)(-bios_size),
+                                bios);
+}
diff --git a/hw/i386/Makefile.objs b/hw/i386/Makefile.objs
index d3374e0831..7ed80a4853 100644
--- a/hw/i386/Makefile.objs
+++ b/hw/i386/Makefile.objs
@@ -1,5 +1,6 @@
 obj-$(CONFIG_KVM) +=3D kvm/
 obj-y +=3D e820_memory_layout.o multiboot.o
+obj-y +=3D x86.o
 obj-y +=3D pc.o
 obj-$(CONFIG_I440FX) +=3D pc_piix.o
 obj-$(CONFIG_Q35) +=3D pc_q35.o
--=20
2.21.0


