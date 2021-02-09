Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F4B0314DCE
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Feb 2021 12:05:08 +0100 (CET)
Received: from localhost ([::1]:59904 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l9QpP-0005au-Ja
	for lists+qemu-devel@lfdr.de; Tue, 09 Feb 2021 06:05:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34890)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1l9Qna-0004EA-DB; Tue, 09 Feb 2021 06:03:14 -0500
Received: from ozlabs.ru ([107.174.27.60]:44664)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1l9QnT-0000Zm-FS; Tue, 09 Feb 2021 06:03:13 -0500
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 116D0AE80110;
 Tue,  9 Feb 2021 06:02:59 -0500 (EST)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu v13] spapr: Implement Open Firmware client interface
Date: Tue,  9 Feb 2021 22:02:52 +1100
Message-Id: <20210209110252.110107-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>, qemu-ppc@nongnu.org,
 Greg Kurz <groug@kaod.org>, David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The PAPR platform which describes an OS environment that's presented by
a combination of a hypervisor and firmware. The features it specifies
require collaboration between the firmware and the hypervisor.

Since the beginning, the runtime component of the firmware (RTAS) has
been implemented as a 20 byte shim which simply forwards it to
a hypercall implemented in qemu. The boot time firmware component is
SLOF - but a build that's specific to qemu, and has always needed to be
updated in sync with it. Even though we've managed to limit the amount
of runtime communication we need between qemu and SLOF, there's some,
and it has become increasingly awkward to handle as we've implemented
new features.

This implements a boot time OF client interface (CI) which is
enabled by a new "x-vof" pseries machine option (stands for "Virtual Open
Firmware). When enabled, QEMU implements the custom H_OF_CLIENT hcall
which implements Open Firmware Client Interface (OF CI). This allows
using a smaller stateless firmware which does not have to manage
the device tree.

The new "vof.bin" firmware image is included with source code under
pc-bios/. It also includes RTAS blob.

This implements a handful of CI methods just to get -kernel/-initrd
working. In particular, this implements the device tree fetching and
simple memory allocator - "claim" (an OF CI memory allocator) and updates
"/memory@0/available" to report the client about available memory.

This implements changing some device tree properties which we know how
to deal with, the rest is ignored. To allow changes, this skips
fdt_pack() when x-vof=on as not packing the blob leaves some room for
appending.

In absence of SLOF, this assigns phandles to device tree nodes to make
device tree traversing work.

When x-vof=on, this adds "/chosen" every time QEMU (re)builds a tree.

This adds basic instances support which are managed by a hash map
ihandle -> [phandle].

Before the guest started, the used memory is:
0..4000 - the initial firmware
10000..180000 - stack

This OF CI does not implement "interpret".

Unlike SLOF, this does not format uninitialized nvram. Instead, this
includes a disk image with pre-formatted nvram.

With this basic support, this can only boot into kernel directly.
However this is just enough for the petitboot kernel and initradmdisk to
boot from any possible source. Note this requires reasonably recent guest
kernel with:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735

This does not use the QEMU coding style for the firmware as using
it for assemler is rather strange in the POWERPC world, according
to POWERPC veterans; mixing styles in the firmware's .c and .s is
weird too IMO.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The example command line is:

-c 0 /home/aik/pbuild/qemu-killslof-localhost-ppc64/qemu-system-ppc64 \
-nodefaults \
-chardev stdio,id=STDIO0,signal=off,mux=on \
-device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
-mon id=MON0,chardev=STDIO0,mode=readline \
-nographic \
-vga none \
-enable-kvm \
-m 2G \
-machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
-kernel pbuild/kernel-le-guest/vmlinux \
-initrd t/le.cpio \
-drive id=DRIVE0,if=none,file=./p/qemu-killslof/pc-bios/vof/nvram.bin,format=raw \
-global spapr-nvram.drive=DRIVE0 \
-snapshot \
-smp 8,threads=8 \
-L /home/aik/t/qemu-ppc64-bios/ \
-trace events=qemu_trace_events \
-d guest_errors \
-chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.tmux26 \
-mon chardev=SOCKET0,mode=control



---
Changes:
v13:
* rebase on latest ppc-for-6.0
* shuffled code around to touch spapr.c less

v12:
* split VOF and SPAPR

v11:
* added g_autofree
* fixed gcc warnings
* fixed few leaks
* added nvram image to make "nvram --print-config" not crash;
Note that contrary to  MIN_NVRAM_SIZE (8 * KiB), the actual minimum size
is 16K, or it just does not work (empty output from "nvram")

v10:
* now rebased to compile with meson

v9:
* remove special handling of /rtas/rtas-size as now we always add it in QEMU
* removed leftovers from scsi/grub/stdout/stdin/...

v8:
* no read/write/seek
* no @dev in instances
* the machine flag is "x-vof" for now

v7:
* now we have a small firmware which loads at 0 as SLOF and starts from
0x100 as SLOF
* no MBR/ELF/GRUB business in QEMU anymore
* blockdev is a separate patch
* networking is a separate patch

v6:
* borrowed a big chunk of commit log introduction from David
* fixed initial stack pointer (points to the highest address of stack)
* traces for "interpret" and others
* disabled  translate_kernel_address() hack so grub can load (work in
progress)
* added "milliseconds" for grub
* fixed "claim" allocator again
* moved FDT_MAX_SIZE to spapr.h as spapr_of_client.c wants it too for CAS
* moved the most code possible from spapr.c to spapr_of_client.c, such as
RTAS, prom entry and FDT build/finalize
* separated blobs
* GRUB now proceeds to its console prompt (there are still other issues)
* parse MBR/GPT to find PReP and load GRUB

v5:
* made instances keep device and chardev pointers
* removed VIO dependencies
* print error if RTAS memory is not claimed as it should have been
* pack FDT as "quiesce"

v4:
* fixed open
* validate ihandles in "call-method"

v3:
* fixed phandles allocation
* s/__be32/uint32_t/ as we do not normally have __be32 type in qemu
* fixed size of /chosen/stdout
* bunch of renames
* do not create rtas properties at all, let the client deal with it;
instead setprop allows changing these in the FDT
* no more packing FDT when bios=off - nobody needs it and getprop does not
work otherwise
* allow updating initramdisk device tree properties (for zImage)
* added instances
* fixed stdout on OF's "write"
* removed special handling for stdout in OF client, spapr-vty handles it
instead

v2:
* fixed claim()
* added "setprop"
* cleaner client interface and RTAS blobs management
* boots to petitboot and further to the target system
* more trace points
---
 pc-bios/vof/Makefile      |  18 +
 hw/ppc/vof.h              |  44 ++
 include/hw/ppc/spapr.h    |  21 +-
 pc-bios/vof/vof.h         |  44 ++
 hw/ppc/spapr.c            |  75 +++-
 hw/ppc/spapr_hcall.c      |  26 +-
 hw/ppc/spapr_vof_client.c | 125 ++++++
 hw/ppc/vof.c              | 905 ++++++++++++++++++++++++++++++++++++++
 pc-bios/vof/bootmem.c     |  13 +
 pc-bios/vof/ci.c          | 108 +++++
 pc-bios/vof/libc.c        |  91 ++++
 pc-bios/vof/main.c        |  22 +
 hw/ppc/meson.build        |   2 +
 hw/ppc/trace-events       |  21 +
 pc-bios/README            |   2 +
 pc-bios/vof.bin           | Bin 0 -> 3680 bytes
 pc-bios/vof/entry.S       |  51 +++
 pc-bios/vof/l.lds         |  48 ++
 pc-bios/vof/nvram.bin     | Bin 0 -> 16384 bytes
 19 files changed, 1607 insertions(+), 9 deletions(-)
 create mode 100644 pc-bios/vof/Makefile
 create mode 100644 hw/ppc/vof.h
 create mode 100644 pc-bios/vof/vof.h
 create mode 100644 hw/ppc/spapr_vof_client.c
 create mode 100644 hw/ppc/vof.c
 create mode 100644 pc-bios/vof/bootmem.c
 create mode 100644 pc-bios/vof/ci.c
 create mode 100644 pc-bios/vof/libc.c
 create mode 100644 pc-bios/vof/main.c
 create mode 100755 pc-bios/vof.bin
 create mode 100644 pc-bios/vof/entry.S
 create mode 100644 pc-bios/vof/l.lds
 create mode 100644 pc-bios/vof/nvram.bin

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
new file mode 100644
index 000000000000..49f7e240eeff
--- /dev/null
+++ b/pc-bios/vof/Makefile
@@ -0,0 +1,18 @@
+all: build-all
+
+build-all: vof.bin
+
+%.o: %.S
+	cc -m32 -mbig-endian -c -o $@ $<
+
+%.o: %.c
+	cc -m32 -mbig-endian -c -fno-stack-protector -Wno-builtin-declaration-mismatch -o $@ $<
+
+vof.elf: entry.o main.o libc.o ci.o bootmem.o
+	ld -nostdlib -e_start -Tl.lds -EB -o $@ $^
+
+%.bin: %.elf
+	objcopy -O binary -j .text -j .data -j .toc -j .got2 $^ $@
+
+clean:
+	rm -f *.o *.bin *.elf *~
diff --git a/hw/ppc/vof.h b/hw/ppc/vof.h
new file mode 100644
index 000000000000..5964693c0de8
--- /dev/null
+++ b/hw/ppc/vof.h
@@ -0,0 +1,44 @@
+ /* Virtual Open Firmware */
+#ifndef HW_VOF_H
+#define HW_VOF_H
+
+typedef struct Vof {
+    bool on;
+    uint32_t rtas_base;
+    uint32_t top_addr; /* copied from rma_size */
+    GArray *claimed; /* array of SpaprOfClaimed */
+    uint64_t claimed_base;
+    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
+    uint32_t of_instance_last;
+    char *bootargs;
+    uint32_t initrd_base; /* Updated in spapr at CAS */
+    long initrd_size; /* Updated in spapr at CAS */
+} Vof;
+
+void vof_reset(Vof *vof, uint32_t top_addr);
+uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
+                         uint32_t *args, unsigned nargs,
+                         uint32_t *rets, unsigned nrets);
+uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
+                   uint64_t align);
+void vof_build_dt(void *fdt, Vof *vof);
+uint32_t vof_client_open(void *fdt, Vof *vof, const char *nodename,
+                         const char *prop, const char *path);
+
+/* ibm,client-architecture-support */
+#define TYPE_CLIENT_ARCHITECTURE_SUPPORT "client-architecture-support"
+#define CLIENT_ARCHITECTURE_SUPPORT(obj) \
+    INTERFACE_CHECK(ClientArchitectureSupport, (obj), TYPE_CLIENT_ARCHITECTURE_SUPPORT)
+
+typedef struct ClientArchitectureSupportClass ClientArchitectureSupportClass;
+DECLARE_CLASS_CHECKERS(ClientArchitectureSupportClass,
+                       CLIENT_ARCHITECTURE_SUPPORT,
+                       TYPE_CLIENT_ARCHITECTURE_SUPPORT)
+
+struct ClientArchitectureSupportClass {
+    InterfaceClass parent;
+    target_ulong (*cas)(CPUState *cs, target_ulong vec);
+    void (*quiesce)(void);
+};
+
+#endif /* HW_VOF_H */
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index ccbeeca1de84..e8c49e5a828c 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -12,6 +12,7 @@
 #include "hw/ppc/spapr_xive.h"  /* For SpaprXive */
 #include "hw/ppc/xics.h"        /* For ICSState */
 #include "hw/ppc/spapr_tpm_proxy.h"
+#include "hw/ppc/vof.h"
 
 struct SpaprVioBus;
 struct SpaprPhbState;
@@ -180,6 +181,7 @@ struct SpaprMachineState {
     uint64_t kernel_addr;
     uint32_t initrd_base;
     long initrd_size;
+    Vof vof;
     uint64_t rtc_offset; /* Now used only during incoming migration */
     struct PPCTimebase tb;
     bool has_graphics;
@@ -554,7 +556,8 @@ struct SpaprMachineState {
 /* Client Architecture support */
 #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
 #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
-#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
+#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
+#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
 
 /*
  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
@@ -944,4 +947,20 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
 void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
 hwaddr spapr_get_rtas_addr(void);
 bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
+
+void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
+                     target_ulong *stack_ptr);
+void spapr_vof_quiesce(void);
+target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                target_ulong opcode, target_ulong *args);
+target_ulong spapr_vof_client_architecture_support(CPUState *cs,
+                                                   target_ulong ovec_addr);
+void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
+
+/* Copied from SLOF, and 4K is definitely not enough for GRUB */
+#define OF_STACK_SIZE       0x8000
+
+/* 0..10000 is reserved for the VOF fw */
+#define OF_STACK_ADDR       0x10000
+
 #endif /* HW_SPAPR_H */
diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
new file mode 100644
index 000000000000..cd5989952a98
--- /dev/null
+++ b/pc-bios/vof/vof.h
@@ -0,0 +1,44 @@
+#include <stdarg.h>
+
+typedef unsigned char uint8_t;
+typedef unsigned short uint16_t;
+typedef unsigned long uint32_t;
+typedef unsigned long long uint64_t;
+#define NULL (0)
+#define PROM_ERROR (-1u)
+typedef unsigned char bool;
+typedef unsigned long ihandle;
+typedef unsigned long phandle;
+#define false ((bool)0)
+#define true ((bool)1)
+typedef int size_t;
+typedef void client(void);
+
+/* globals */
+extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware) */
+
+void do_boot(unsigned long addr, unsigned long r3, unsigned long r4);
+
+/* libc */
+int strlen(const char *s);
+int strcmp(const char *s1, const char *s2);
+void *memcpy(void *dest, const void *src, size_t n);
+int memcmp(const void *ptr1, const void *ptr2, size_t n);
+void *memmove(void *dest, const void *src, size_t n);
+void *memset(void *dest, int c, size_t size);
+
+/* Prom */
+typedef unsigned long prom_arg_t;
+int call_prom(const char *service, int nargs, int nret, ...);
+
+/* CI wrappers */
+void ci_panic(const char *str);
+phandle ci_finddevice(const char *path);
+uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len);
+ihandle ci_open(const char *path);
+void ci_close(ihandle ih);
+void *ci_claim(void *virt, uint32_t size, uint32_t align);
+uint32_t ci_release(void *virt, uint32_t size);
+
+/* booting from -kernel */
+void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 2e2ac20193fb..547b2bd8ac77 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -101,6 +101,7 @@
 #define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that */
 #define FW_MAX_SIZE             0x400000
 #define FW_FILE_NAME            "slof.bin"
+#define FW_FILE_NAME_VOF        "vof.bin"
 #define FW_OVERHEAD             0x2800000
 #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
 
@@ -1561,6 +1562,7 @@ static void spapr_machine_reset(MachineState *machine)
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
     PowerPCCPU *first_ppc_cpu;
     hwaddr fdt_addr;
+    target_ulong stack_ptr = 0;
     void *fdt;
     int rc;
 
@@ -1621,24 +1623,48 @@ static void spapr_machine_reset(MachineState *machine)
      */
     fdt_addr = MIN(spapr->rma_size, RTAS_MAX_ADDR) - FDT_MAX_SIZE;
 
+    if (spapr->vof.on) {
+        /* Resets the VOF's internal state */
+        vof_reset(&spapr->vof, spapr->rma_size);
+    }
+
     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
 
-    rc = fdt_pack(fdt);
+    if (spapr->vof.on) {
+        /*
+         * Claims initramdisk and stack which changes "available" so
+         * doing it befofe packing.
+         */
+        spapr_vof_reset(spapr, fdt, &stack_ptr);
 
-    /* Should only fail if we've built a corrupted tree */
-    assert(rc == 0);
+        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                                  stack_ptr, spapr->initrd_base,
+                                  spapr->initrd_size);
+        /*
+         * We do not pack the FDT as the client may change properties and
+         * do not write FDT to the VM as the client does not expect it.
+         */
+    } else {
+        rc = fdt_pack(fdt);
+        /* Should only fail if we've built a corrupted tree */
+        assert(rc == 0);
 
-    /* Load the fdt */
+        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                                  0, fdt_addr, 0);
+    }
     qemu_fdt_dumpdtb(fdt, fdt_totalsize(fdt));
-    cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
+
     g_free(spapr->fdt_blob);
     spapr->fdt_size = fdt_totalsize(fdt);
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
     /* Set up the entry state */
-    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT, 0, fdt_addr, 0);
     first_ppc_cpu->env.gpr[5] = 0;
+    if (!spapr->vof.on) {
+        /* Load the fdt */
+        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_size);
+    }
 
     spapr->fwnmi_system_reset_addr = -1;
     spapr->fwnmi_machine_check_addr = -1;
@@ -2638,7 +2664,8 @@ static void spapr_machine_init(MachineState *machine)
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
+    const char *bios_default = spapr->vof.on ? FW_FILE_NAME_VOF : FW_FILE_NAME;
+    const char *bios_name = machine->firmware ?: bios_default;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     PCIHostState *phb;
@@ -2990,6 +3017,10 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
+
+    if (spapr->vof.on) {
+        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
+    }
 }
 
 #define DEFAULT_KVM_TYPE "auto"
@@ -3180,6 +3211,20 @@ static void spapr_set_resize_hpt(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool spapr_get_vof(Object *obj, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    return spapr->vof.on;
+}
+
+static void spapr_set_vof(Object *obj, bool value, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    spapr->vof.on = value;
+}
+
 static char *spapr_get_ic_mode(Object *obj, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
@@ -3305,6 +3350,10 @@ static void spapr_instance_init(Object *obj)
                                     stringify(KERNEL_LOAD_ADDR)
                                     " for -kernel is the default");
     spapr->kernel_addr = KERNEL_LOAD_ADDR;
+    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
+    object_property_set_description(obj, "x-vof",
+                                    "Enable Virtual Open Firmware");
+
     /* The machine class defines the default interrupt controller mode */
     spapr->irq = smc->irq;
     object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
@@ -4402,6 +4451,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     XICSFabricClass *xic = XICS_FABRIC_CLASS(oc);
     InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
     XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
+    ClientArchitectureSupportClass *casc = CLIENT_ARCHITECTURE_SUPPORT_CLASS(oc);
 
     mc->desc = "pSeries Logical Partition (PAPR compliant)";
     mc->ignore_boot_device_suffixes = true;
@@ -4481,6 +4531,9 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     smc->smp_threads_vsmt = true;
     smc->nr_xirqs = SPAPR_NR_XIRQS;
     xfc->match_nvt = spapr_match_nvt;
+
+    casc->cas = spapr_vof_client_architecture_support;
+    casc->quiesce = spapr_vof_quiesce;
 }
 
 static const TypeInfo spapr_machine_info = {
@@ -4500,6 +4553,7 @@ static const TypeInfo spapr_machine_info = {
         { TYPE_XICS_FABRIC },
         { TYPE_INTERRUPT_STATS_PROVIDER },
         { TYPE_XIVE_FABRIC },
+        { TYPE_CLIENT_ARCHITECTURE_SUPPORT },
         { }
     },
 };
@@ -4968,9 +5022,16 @@ static void spapr_machine_2_1_class_options(MachineClass *mc)
 }
 DEFINE_SPAPR_MACHINE(2_1, "2.1", false);
 
+static const TypeInfo client_archivecture_support_info = {
+    .name = TYPE_CLIENT_ARCHITECTURE_SUPPORT,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(ClientArchitectureSupportClass),
+};
+
 static void spapr_machine_register_types(void)
 {
     type_register_static(&spapr_machine_info);
+    type_register_static(&client_archivecture_support_info);
 }
 
 type_init(spapr_machine_register_types)
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 7b5cd3553c26..0043ca057ba5 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1806,7 +1806,13 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
         spapr_setup_hpt(spapr);
     }
 
-    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
+    if (spapr->vof.on && spapr->vof.initrd_base && spapr->vof.initrd_size) {
+        /* Update initramdisk location so the right area gets reserved below */
+        spapr->initrd_base = spapr->vof.initrd_base;
+        spapr->initrd_size = spapr->vof.initrd_size;
+    }
+
+    fdt = spapr_build_fdt(spapr, spapr->vof.on, fdt_bufsize);
 
     g_free(spapr->fdt_blob);
     spapr->fdt_size = fdt_totalsize(fdt);
@@ -1850,6 +1856,24 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
     return ret;
 }
 
+target_ulong spapr_vof_client_architecture_support(CPUState *cs,
+                                                  target_ulong ovec_addr)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+
+    target_ulong ret = do_client_architecture_support(POWERPC_CPU(cs), spapr,
+                                                      ovec_addr, FDT_MAX_SIZE);
+
+    /*
+     * This adds stdout and generates phandles for boottime and CAS FDTs.
+     * It is alright to update the FDT here as do_client_architecture_support()
+     * does not pack it.
+     */
+    spapr_vof_client_dt_finalize(spapr, spapr->fdt_blob);
+
+    return ret;
+}
+
 static target_ulong h_get_cpu_characteristics(PowerPCCPU *cpu,
                                               SpaprMachineState *spapr,
                                               target_ulong opcode,
diff --git a/hw/ppc/spapr_vof_client.c b/hw/ppc/spapr_vof_client.c
new file mode 100644
index 000000000000..a8f056938b31
--- /dev/null
+++ b/hw/ppc/spapr_vof_client.c
@@ -0,0 +1,125 @@
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include <sys/ioctl.h>
+#include "qapi/error.h"
+#include "hw/ppc/spapr.h"
+#include "hw/ppc/spapr_vio.h"
+#include "hw/ppc/fdt.h"
+#include "sysemu/sysemu.h"
+#include "qom/qom-qobject.h"
+#include "trace.h"
+
+/* Defined as Big Endian */
+struct prom_args {
+    uint32_t service;
+    uint32_t nargs;
+    uint32_t nret;
+    uint32_t args[10];
+} QEMU_PACKED;
+
+target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                target_ulong opcode, target_ulong *args)
+{
+    target_ulong of_client_args = ppc64_phys_to_real(args[0]);
+    struct prom_args pargs = { 0 };
+    char service[64];
+    unsigned nargs, nret, i;
+
+    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
+    nargs = be32_to_cpu(pargs.nargs);
+    if (nargs >= ARRAY_SIZE(pargs.args)) {
+        return H_PARAMETER;
+    }
+
+    cpu_physical_memory_read(be32_to_cpu(pargs.service), service,
+                             sizeof(service));
+    if (strnlen(service, sizeof(service)) == sizeof(service)) {
+        /* Too long service name */
+        return H_PARAMETER;
+    }
+
+    for (i = 0; i < nargs; ++i) {
+        pargs.args[i] = be32_to_cpu(pargs.args[i]);
+    }
+
+    nret = be32_to_cpu(pargs.nret);
+    pargs.args[nargs] = vof_client_call(spapr->fdt_blob, &spapr->vof, service,
+                                        pargs.args, nargs,
+                                        pargs.args + nargs + 1, nret);
+    if (!nret) {
+        return H_SUCCESS;
+    }
+
+    for (i = 0; i < nret; ++i) {
+        pargs.args[nargs + i] = cpu_to_be32(pargs.args[nargs + i]);
+    }
+    cpu_physical_memory_write(of_client_args + sizeof(uint32_t) * (3 + nargs),
+                              pargs.args + nargs, sizeof(uint32_t) * nret);
+
+    return H_SUCCESS;
+}
+
+void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
+{
+    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
+
+    /* Creates phandles, required by vof_client_open below */
+    vof_build_dt(fdt, &spapr->vof);
+
+    /*
+     * SLOF-less setup requires an open instance of stdout for early
+     * kernel printk. By now all phandles are settled so we can open
+     * the default serial console.
+     */
+    if (stdout_path) {
+        _FDT(vof_client_open(fdt, &spapr->vof, "/chosen", "stdout",
+                             stdout_path));
+    }
+}
+
+void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
+                     target_ulong *stack_ptr)
+{
+    Vof *vof = &spapr->vof;
+
+    spapr_vof_client_dt_finalize(spapr, fdt);
+
+    *stack_ptr = vof_claim(spapr->fdt_blob, vof, OF_STACK_ADDR, OF_STACK_SIZE,
+                           OF_STACK_SIZE);
+    if (*stack_ptr == -1) {
+        error_report("Memory allocation for stack failed");
+        exit(1);
+    }
+    /*
+     * Stack grows downwards and we also reserve here space for
+     * the minimum stack frame.
+     */
+    *stack_ptr += OF_STACK_SIZE - 0x20;
+
+    if (spapr->kernel_size &&
+        vof_claim(spapr->fdt_blob, vof, spapr->kernel_addr, spapr->kernel_size,
+                  0) == -1) {
+        error_report("Memory for kernel is in use");
+        exit(1);
+    }
+
+    if (spapr->initrd_size &&
+        vof_claim(spapr->fdt_blob, vof, spapr->initrd_base, spapr->initrd_size,
+                  0) == -1) {
+        error_report("Memory for initramdisk is in use");
+        exit(1);
+    }
+
+    /*
+     * We skip writing FDT as nothing expects it; OF client interface is
+     * going to be used for reading the device tree.
+     */
+}
+
+void spapr_vof_quiesce(void)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(qdev_get_machine());
+
+    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
+    spapr->fdt_initial_size = spapr->fdt_size;
+}
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
new file mode 100644
index 000000000000..8aea2450762d
--- /dev/null
+++ b/hw/ppc/vof.c
@@ -0,0 +1,905 @@
+/*
+ * QEMU PowerPC Virtual Open Firmware.
+ *
+ * This implements client interface from OpenFirmware IEEE1275 on the QEMU
+ * side to leave only a very basic firmware in the VM.
+ *
+ * Copyright (c) 2020 IBM Corporation.
+ *
+ * Permission is hereby granted, free of charge, to any person obtaining a copy
+ * of this software and associated documentation files (the "Software"), to deal
+ * in the Software without restriction, including without limitation the rights
+ * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
+ * copies of the Software, and to permit persons to whom the Software is
+ * furnished to do so, subject to the following conditions:
+ *
+ * The above copyright notice and this permission notice shall be included in
+ * all copies or substantial portions of the Software.
+ *
+ * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
+ * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
+ * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
+ * THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
+ * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
+ * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
+ * THE SOFTWARE.
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include <sys/ioctl.h>
+#include "exec/ram_addr.h"
+#include "qemu/timer.h"
+#include "hw/ppc/vof.h"
+#include "hw/ppc/fdt.h"
+#include "sysemu/runstate.h"
+#include "qom/qom-qobject.h"
+#include "trace.h"
+
+#include <libfdt.h>
+
+/*
+ * OF 1275 "nextprop" description suggests is it 32 bytes max but
+ * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars long.
+ */
+#define OF_PROPNAME_LEN_MAX 64
+
+#define ALIGN(x, a) (((x) + (a) - 1) & ~((a) - 1))
+
+typedef struct {
+    uint64_t start;
+    uint64_t size;
+} OfClaimed;
+
+typedef struct {
+    char *params;
+    char *path; /* the path used to open the instance */
+    uint32_t phandle;
+} OfInstance;
+
+static void readstr(hwaddr pa, char *buf, int size)
+{
+    cpu_physical_memory_read(pa, buf, size);
+    if (strnlen(buf, size) == size) {
+        buf[size - 1] = '\0';
+        trace_vof_error_str_truncated(buf, size);
+    }
+}
+
+static bool cmpservice(const char *s, size_t len,
+                       unsigned nargs, unsigned nret,
+                       const char *s1, size_t len1,
+                       unsigned nargscheck, unsigned nretcheck)
+{
+    if (strcmp(s, s1)) {
+        return false;
+    }
+    if ((nargscheck && (nargs != nargscheck)) ||
+        (nretcheck && (nret != nretcheck))) {
+        trace_vof_error_param(s, nargscheck, nretcheck, nargs, nret);
+        return false;
+    }
+
+    return true;
+}
+
+static void split_path(const char *fullpath, char **node, char **unit,
+                       char **part)
+{
+    const char *c, *p = NULL, *u = NULL;
+
+    *node = *unit = *part = NULL;
+
+    if (fullpath[0] == '\0') {
+        *node = g_strdup(fullpath);
+        return;
+    }
+
+    for (c = fullpath + strlen(fullpath) - 1; c > fullpath; --c) {
+        if (*c == '/') {
+            break;
+        }
+        if (*c == ':') {
+            p = c + 1;
+            continue;
+        }
+        if (*c == '@') {
+            u = c + 1;
+            continue;
+        }
+    }
+
+    if (p && u && p < u) {
+        p = NULL;
+    }
+
+    if (u && p) {
+        *node = g_strndup(fullpath, u - fullpath - 1);
+        *unit = g_strndup(u, p - u - 1);
+        *part = g_strdup(p);
+    } else if (!u && p) {
+        *node = g_strndup(fullpath, p - fullpath - 1);
+        *part = g_strdup(p);
+    } else if (!p && u) {
+        *node = g_strndup(fullpath, u - fullpath - 1);
+        *unit = g_strdup(u);
+    } else {
+        *node = g_strdup(fullpath);
+    }
+}
+
+static void prop_format(char *tval, int tlen, const void *prop, int len)
+{
+    int i;
+    const unsigned char *c;
+    char *t;
+    const char bin[] = "...";
+
+    for (i = 0, c = prop; i < len; ++i, ++c) {
+        if (*c == '\0' && i == len - 1) {
+            strncpy(tval, prop, tlen - 1);
+            return;
+        }
+        if (*c < 0x20 || *c >= 0x80) {
+            break;
+        }
+    }
+
+    for (i = 0, c = prop, t = tval; i < len; ++i, ++c) {
+        if (t >= tval + tlen - sizeof(bin) - 1 - 2 - 1) {
+            strcpy(t, bin);
+            return;
+        }
+        if (i && i % 4 == 0 && i != len - 1) {
+            strcat(t, " ");
+            ++t;
+        }
+        t += sprintf(t, "%02X", *c & 0xFF);
+    }
+}
+
+static int vof_fdt_path_offset(const void *fdt, const char *node,
+                               const char *unit)
+{
+    int offset;
+
+    offset = fdt_path_offset(fdt, node);
+
+    if (offset < 0 && unit) {
+        g_autofree char *tmp = g_strdup_printf("%s@%s", node, unit);
+
+        offset = fdt_path_offset(fdt, tmp);
+    }
+
+    return offset;
+}
+
+static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
+{
+    g_autofree char *node = NULL, *unit = NULL, *part = NULL;
+    char fullnode[1024];
+    uint32_t ret = -1;
+    int offset;
+
+    readstr(nodeaddr, fullnode, sizeof(fullnode));
+
+    split_path(fullnode, &node, &unit, &part);
+    offset = vof_fdt_path_offset(fdt, node, unit);
+    if (offset >= 0) {
+        ret = fdt_get_phandle(fdt, offset);
+    }
+    trace_vof_finddevice(fullnode, ret);
+    return (uint32_t) ret;
+}
+
+static uint32_t vof_getprop(const void *fdt, uint32_t nodeph, uint32_t pname,
+                            uint32_t valaddr, uint32_t vallen)
+{
+    char propname[OF_PROPNAME_LEN_MAX + 1];
+    uint32_t ret = 0;
+    int proplen = 0;
+    const void *prop;
+    char trval[64] = "";
+    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
+
+    readstr(pname, propname, sizeof(propname));
+    if (strcmp(propname, "name") == 0) {
+        prop = fdt_get_name(fdt, nodeoff, &proplen);
+        proplen += 1;
+    } else {
+        prop = fdt_getprop(fdt, nodeoff, propname, &proplen);
+    }
+
+    if (prop) {
+        int cb = MIN(proplen, vallen);
+
+        cpu_physical_memory_write(valaddr, prop, cb);
+        /*
+         * OF1275 says:
+         * "Size is either the actual size of the property, or –1 if name
+         * does not exist", hence returning proplen instead of cb.
+         */
+        ret = proplen;
+        prop_format(trval, sizeof(trval), prop, ret);
+    } else {
+        ret = -1;
+    }
+    trace_vof_getprop(nodeph, propname, ret, trval);
+
+    return ret;
+}
+
+static uint32_t vof_getproplen(const void *fdt, uint32_t nodeph, uint32_t pname)
+{
+    char propname[OF_PROPNAME_LEN_MAX + 1];
+    uint32_t ret = 0;
+    int proplen = 0;
+    const void *prop;
+    int nodeoff = fdt_node_offset_by_phandle(fdt, nodeph);
+
+    readstr(pname, propname, sizeof(propname));
+    if (strcmp(propname, "name") == 0) {
+        prop = fdt_get_name(fdt, nodeoff, &proplen);
+        proplen += 1;
+    } else {
+        prop = fdt_getprop(fdt, nodeoff, propname, &proplen);
+    }
+
+    if (prop) {
+        ret = proplen;
+    } else {
+        ret = -1;
+    }
+    trace_vof_getproplen(nodeph, propname, ret);
+
+    return ret;
+}
+
+static uint32_t vof_setprop(void *fdt, Vof *vof,
+                            uint32_t nodeph, uint32_t pname,
+                            uint32_t valaddr, uint32_t vallen)
+{
+    char propname[OF_PROPNAME_LEN_MAX + 1];
+    uint32_t ret = -1;
+    int offset;
+    char trval[64] = "";
+
+    readstr(pname, propname, sizeof(propname));
+    /*
+     * We only allow changing properties which we know how to update on
+     * the QEMU side.
+     */
+    if (vallen == sizeof(uint32_t)) {
+        uint32_t val32 = ldl_be_phys(first_cpu->as, valaddr);
+
+        if ((strcmp(propname, "linux,rtas-base") == 0) ||
+            (strcmp(propname, "linux,rtas-entry") == 0)) {
+            vof->rtas_base = val32;
+        } else if (strcmp(propname, "linux,initrd-start") == 0) {
+            vof->initrd_base = val32;
+        } else if (strcmp(propname, "linux,initrd-end") == 0) {
+            vof->initrd_size = val32 - vof->initrd_base;
+        } else {
+            goto trace_exit;
+        }
+    } else if (vallen == sizeof(uint64_t)) {
+        uint64_t val64 = ldq_be_phys(first_cpu->as, valaddr);
+
+        if (strcmp(propname, "linux,initrd-start") == 0) {
+            vof->initrd_base = val64;
+        } else if (strcmp(propname, "linux,initrd-end") == 0) {
+            vof->initrd_size = val64 - vof->initrd_base;
+        } else {
+            goto trace_exit;
+        }
+    } else if (strcmp(propname, "bootargs") == 0) {
+        char val[1024];
+
+        readstr(valaddr, val, sizeof(val));
+        g_free(vof->bootargs);
+        vof->bootargs = g_strdup(val);
+    } else {
+        goto trace_exit;
+    }
+
+    offset = fdt_node_offset_by_phandle(fdt, nodeph);
+    if (offset >= 0) {
+        uint8_t data[vallen];
+
+        cpu_physical_memory_read(valaddr, data, vallen);
+        if (!fdt_setprop(fdt, offset, propname, data, vallen)) {
+            ret = vallen;
+            prop_format(trval, sizeof(trval), data, ret);
+        }
+    }
+
+trace_exit:
+    trace_vof_setprop(nodeph, propname, trval, ret);
+
+    return ret;
+}
+
+static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
+                             uint32_t prevaddr, uint32_t nameaddr)
+{
+    int offset = fdt_node_offset_by_phandle(fdt, phandle);
+    char prev[OF_PROPNAME_LEN_MAX + 1];
+    const char *tmp;
+
+    readstr(prevaddr, prev, sizeof(prev));
+    for (offset = fdt_first_property_offset(fdt, offset);
+         offset >= 0;
+         offset = fdt_next_property_offset(fdt, offset)) {
+
+        if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
+            return 0;
+        }
+        if (prev[0] == '\0' || strcmp(prev, tmp) == 0) {
+            if (prev[0] != '\0') {
+                offset = fdt_next_property_offset(fdt, offset);
+                if (offset < 0) {
+                    return 0;
+                }
+            }
+            if (!fdt_getprop_by_offset(fdt, offset, &tmp, NULL)) {
+                return 0;
+            }
+
+            cpu_physical_memory_write(nameaddr, tmp, strlen(tmp) + 1);
+            return 1;
+        }
+    }
+
+    return 0;
+}
+
+static uint32_t vof_peer(const void *fdt, uint32_t phandle)
+{
+    int ret;
+
+    if (phandle == 0) {
+        ret = fdt_path_offset(fdt, "/");
+    } else {
+        ret = fdt_next_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
+    }
+
+    if (ret < 0) {
+        ret = 0;
+    } else {
+        ret = fdt_get_phandle(fdt, ret);
+    }
+
+    return ret;
+}
+
+static uint32_t vof_child(const void *fdt, uint32_t phandle)
+{
+    int ret = fdt_first_subnode(fdt, fdt_node_offset_by_phandle(fdt, phandle));
+
+    if (ret < 0) {
+        ret = 0;
+    } else {
+        ret = fdt_get_phandle(fdt, ret);
+    }
+
+    return ret;
+}
+
+static uint32_t vof_parent(const void *fdt, uint32_t phandle)
+{
+    int ret = fdt_parent_offset(fdt, fdt_node_offset_by_phandle(fdt, phandle));
+
+    if (ret < 0) {
+        ret = 0;
+    } else {
+        ret = fdt_get_phandle(fdt, ret);
+    }
+
+    return ret;
+}
+
+static uint32_t vof_do_open(void *fdt, Vof *vof, const char *path)
+{
+    int offset;
+    uint32_t ret = 0;
+    OfInstance *inst = NULL;
+    g_autofree char *node = NULL, *unit = NULL, *part = NULL;
+
+    if (vof->of_instance_last == 0xFFFFFFFF) {
+        /* We do not recycle ihandles yet */
+        goto trace_exit;
+    }
+
+    split_path(path, &node, &unit, &part);
+
+    offset = vof_fdt_path_offset(fdt, node, unit);
+    if (offset < 0) {
+        trace_vof_error_unknown_path(path);
+        goto trace_exit;
+    }
+
+    inst = g_new0(OfInstance, 1);
+    inst->phandle = fdt_get_phandle(fdt, offset);
+    g_assert(inst->phandle);
+    ++vof->of_instance_last;
+
+    inst->path = g_strdup(path);
+    inst->params = part;
+    g_hash_table_insert(vof->of_instances,
+                        GINT_TO_POINTER(vof->of_instance_last),
+                        inst);
+    ret = vof->of_instance_last;
+
+trace_exit:
+    trace_vof_open(path, inst ? inst->phandle : 0, ret);
+
+    return ret;
+}
+
+uint32_t vof_client_open(void *fdt, Vof *vof, const char *nodename,
+                         const char *prop, const char *path)
+{
+    int node = fdt_path_offset(fdt, nodename);
+    uint32_t inst = vof_do_open(fdt, vof, path);
+
+    return fdt_setprop_cell(fdt, node, prop, inst);
+}
+
+static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
+{
+    char path[256];
+
+    readstr(pathaddr, path, sizeof(path));
+
+    return vof_do_open(fdt, vof, path);
+}
+
+static void vof_close(Vof *vof, uint32_t ihandle)
+{
+    if (!g_hash_table_remove(vof->of_instances, GINT_TO_POINTER(ihandle))) {
+        trace_vof_error_unknown_ihandle_close(ihandle);
+    }
+}
+
+static uint32_t vof_instance_to_package(Vof *vof, uint32_t ihandle)
+{
+    gpointer instp = g_hash_table_lookup(vof->of_instances,
+                                         GINT_TO_POINTER(ihandle));
+    uint32_t ret = -1;
+
+    if (instp) {
+        ret = ((OfInstance *)instp)->phandle;
+    }
+    trace_vof_instance_to_package(ihandle, ret);
+
+    return ret;
+}
+
+static uint32_t vof_package_to_path(const void *fdt, uint32_t phandle,
+                                    uint32_t buf, uint32_t len)
+{
+    uint32_t ret = -1;
+    char tmp[256] = "";
+
+    if (!fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle), tmp,
+                      sizeof(tmp))) {
+        tmp[sizeof(tmp) - 1] = 0;
+        ret = MIN(len, strlen(tmp) + 1);
+        cpu_physical_memory_write(buf, tmp, ret);
+    }
+
+    trace_vof_package_to_path(phandle, tmp, ret);
+
+    return ret;
+}
+
+static uint32_t vof_instance_to_path(void *fdt, Vof *vof, uint32_t ihandle,
+                                     uint32_t buf, uint32_t len)
+{
+    uint32_t ret = -1;
+    uint32_t phandle = vof_instance_to_package(vof, ihandle);
+    char tmp[256] = "";
+
+    if (phandle != -1) {
+        if (!fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle),
+                          tmp, sizeof(tmp))) {
+            tmp[sizeof(tmp) - 1] = 0;
+            ret = MIN(len, strlen(tmp) + 1);
+            cpu_physical_memory_write(buf, tmp, ret);
+        }
+    }
+    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
+
+    return ret;
+}
+
+static void vof_clamed_dump(GArray *claimed)
+{
+#ifdef DEBUG
+    int i;
+    OfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, OfClaimed, i);
+        error_printf("CLAIMED %lx..%lx size=%ld\n", c.start, c.start + c.size,
+                     c.size);
+    }
+#endif
+}
+
+static bool vof_claim_avail(GArray *claimed, uint64_t virt, uint64_t size)
+{
+    int i;
+    OfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, OfClaimed, i);
+        if ((c.start <= virt && virt < c.start + c.size) ||
+            (virt <= c.start && c.start < virt + size)) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+static void vof_claim_add(GArray *claimed, uint64_t virt, uint64_t size)
+{
+    OfClaimed newclaim;
+
+    newclaim.start = virt;
+    newclaim.size = size;
+    g_array_append_val(claimed, newclaim);
+}
+
+static gint of_claimed_compare_func(gconstpointer a, gconstpointer b)
+{
+    return ((OfClaimed *)a)->start - ((OfClaimed *)b)->start;
+}
+
+static void vof_dt_memory_available(void *fdt, GArray *claimed, uint64_t base)
+{
+    int i, n, offset, proplen = 0;
+    uint64_t *mem0_reg;
+    struct { uint64_t start, size; } *avail;
+
+    if (!fdt || !claimed) {
+        return;
+    }
+
+    offset = fdt_path_offset(fdt, "/memory@0");
+    _FDT(offset);
+
+    mem0_reg = (uint64_t *) fdt_getprop(fdt, offset, "reg", &proplen);
+    if (!mem0_reg || proplen != 2 * sizeof(uint64_t)) {
+        return;
+    }
+
+    g_array_sort(claimed, of_claimed_compare_func);
+    vof_clamed_dump(claimed);
+
+    avail = g_malloc0(sizeof(uint64_t) * 2 * claimed->len);
+    for (i = 0, n = 0; i < claimed->len; ++i) {
+        OfClaimed c = g_array_index(claimed, OfClaimed, i);
+
+        avail[n].start = c.start + c.size;
+        if (i < claimed->len - 1) {
+            OfClaimed cn = g_array_index(claimed, OfClaimed, i + 1);
+
+            avail[n].size = cn.start - avail[n].start;
+        } else {
+            avail[n].size = be64_to_cpu(mem0_reg[1]) - avail[n].start;
+        }
+
+        if (avail[n].size) {
+#ifdef DEBUG
+            error_printf("AVAIL %lx..%lx size=%ld\n", avail[n].start,
+                         avail[n].start + avail[n].size, avail[n].size);
+#endif
+            avail[n].start = cpu_to_be64(avail[n].start);
+            avail[n].size = cpu_to_be64(avail[n].size);
+            ++n;
+        }
+    }
+    _FDT((fdt_setprop(fdt, offset, "available", avail,
+                      sizeof(uint64_t) * 2 * n)));
+    g_free(avail);
+}
+
+/*
+ * "claim" claims memory at @virt if @align==0; otherwise it allocates
+ * memory at the requested alignment.
+ */
+uint64_t vof_claim(void *fdt, Vof *vof, uint64_t virt, uint64_t size,
+                   uint64_t align)
+{
+    uint64_t ret;
+
+    if (size == 0) {
+        ret = -1;
+    } else if (align == 0) {
+        if (!vof_claim_avail(vof->claimed, virt, size)) {
+            ret = -1;
+        } else {
+            ret = virt;
+        }
+    } else {
+        vof->claimed_base = ALIGN(vof->claimed_base, align);
+        while (1) {
+            if (vof->claimed_base >= vof->top_addr) {
+                error_report("Out of RMA memory for the OF client");
+                return -1;
+            }
+            if (vof_claim_avail(vof->claimed, vof->claimed_base, size)) {
+                break;
+            }
+            vof->claimed_base += size;
+        }
+        ret = vof->claimed_base;
+    }
+
+    if (ret != -1) {
+        vof->claimed_base = MAX(vof->claimed_base, ret + size);
+        vof_claim_add(vof->claimed, ret, size);
+        /* The client reads "/memory@0/available" to know where it can claim */
+        vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
+    }
+    trace_vof_claim(virt, size, align, ret);
+
+    return ret;
+}
+
+static uint32_t vof_release(Vof *vof, uint64_t virt, uint64_t size)
+{
+    uint32_t ret = -1;
+    int i;
+    GArray *claimed = vof->claimed;
+    OfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, OfClaimed, i);
+        if (c.start == virt && c.size == size) {
+            g_array_remove_index(claimed, i);
+            ret = 0;
+            break;
+        }
+    }
+
+    trace_vof_release(virt, size, ret);
+
+    return ret;
+}
+
+static void vof_instantiate_rtas(void)
+{
+    error_report("The firmware should have instantiated RTAS");
+    exit(1);
+}
+
+static uint32_t vof_call_method(Vof *vof, uint32_t methodaddr,
+                                uint32_t ihandle,
+                                uint32_t param1, uint32_t param2,
+                                uint32_t param3, uint32_t param4,
+                                uint32_t *ret2)
+{
+    uint32_t ret = -1;
+    char method[256] = "";
+    OfInstance *inst;
+
+    if (!ihandle) {
+        goto trace_exit;
+    }
+
+    inst = (OfInstance *) g_hash_table_lookup(vof->of_instances,
+                                              GINT_TO_POINTER(ihandle));
+    if (!inst) {
+        goto trace_exit;
+    }
+
+    readstr(methodaddr, method, sizeof(method));
+
+    if (strcmp(inst->path, "/") == 0) {
+        if (strcmp(method, "ibm,client-architecture-support") == 0) {
+            Object *cas_if = object_dynamic_cast(
+                    qdev_get_machine(), TYPE_CLIENT_ARCHITECTURE_SUPPORT);
+
+            if (cas_if) {
+                ClientArchitectureSupportClass *casc =
+                    CLIENT_ARCHITECTURE_SUPPORT_GET_CLASS(cas_if);
+
+                ret = casc->cas(first_cpu, param1);
+            }
+
+            *ret2 = 0;
+        }
+    } else if (strcmp(inst->path, "/rtas") == 0) {
+        if (strcmp(method, "instantiate-rtas") == 0) {
+            vof_instantiate_rtas();
+            ret = 0;
+            *ret2 = param1; /* rtas-base */
+        }
+    } else {
+        trace_vof_error_unknown_method(method);
+    }
+
+trace_exit:
+    trace_vof_method(ihandle, method, param1, ret, *ret2);
+
+    return ret;
+}
+
+static uint32_t vof_call_interpret(uint32_t cmdaddr, uint32_t param1,
+                                   uint32_t param2, uint32_t *ret2)
+{
+    uint32_t ret = -1;
+    char cmd[256] = "";
+
+    /* No interpret implemented */
+    readstr(cmdaddr, cmd, sizeof(cmd));
+    trace_vof_interpret(cmd, param1, param2, ret, *ret2);
+
+    return ret;
+}
+
+static void vof_quiesce(void *fdt, Vof *vof)
+{
+    Object *cas_if = object_dynamic_cast(
+        qdev_get_machine(), TYPE_CLIENT_ARCHITECTURE_SUPPORT);
+
+    int rc = fdt_pack(fdt);
+
+    assert(rc == 0);
+
+    if (cas_if) {
+        ClientArchitectureSupportClass *casc =
+            CLIENT_ARCHITECTURE_SUPPORT_GET_CLASS(cas_if);
+
+        casc->quiesce();
+    }
+
+    vof_clamed_dump(vof->claimed);
+}
+
+uint32_t vof_client_call(void *fdt, Vof *vof, const char *service,
+                         uint32_t *args, unsigned nargs,
+                         uint32_t *rets, unsigned nrets)
+{
+    int servicelen = strlen(service);
+    uint32_t ret = 0;
+
+    /* @nrets includes the value which this function returns */
+#define cmpserv(s, a, r) \
+    cmpservice(service, servicelen, nargs, nrets, (s), sizeof(s), (a), (r))
+
+    if (cmpserv("finddevice", 1, 1)) {
+        ret = vof_finddevice(fdt, args[0]);
+    } else if (cmpserv("getprop", 4, 1)) {
+        ret = vof_getprop(fdt, args[0], args[1], args[2], args[3]);
+    } else if (cmpserv("getproplen", 2, 1)) {
+        ret = vof_getproplen(fdt, args[0], args[1]);
+    } else if (cmpserv("setprop", 4, 1)) {
+        ret = vof_setprop(fdt, vof, args[0], args[1], args[2], args[3]);
+    } else if (cmpserv("nextprop", 3, 1)) {
+        ret = vof_nextprop(fdt, args[0], args[1], args[2]);
+    } else if (cmpserv("peer", 1, 1)) {
+        ret = vof_peer(fdt, args[0]);
+    } else if (cmpserv("child", 1, 1)) {
+        ret = vof_child(fdt, args[0]);
+    } else if (cmpserv("parent", 1, 1)) {
+        ret = vof_parent(fdt, args[0]);
+    } else if (cmpserv("open", 1, 1)) {
+        ret = vof_open(fdt, vof, args[0]);
+    } else if (cmpserv("close", 1, 0)) {
+        vof_close(vof, args[0]);
+    } else if (cmpserv("instance-to-package", 1, 1)) {
+        ret = vof_instance_to_package(vof, args[0]);
+    } else if (cmpserv("package-to-path", 3, 1)) {
+        ret = vof_package_to_path(fdt, args[0], args[1], args[2]);
+    } else if (cmpserv("instance-to-path", 3, 1)) {
+        ret = vof_instance_to_path(fdt, vof, args[0], args[1], args[2]);
+    } else if (cmpserv("claim", 3, 1)) {
+        ret = vof_claim(fdt, vof, args[0], args[1], args[2]);
+    } else if (cmpserv("release", 2, 0)) {
+        ret = vof_release(vof, args[0], args[1]);
+    } else if (cmpserv("call-method", 0, 0)) {
+        ret = vof_call_method(vof, args[0], args[1], args[2], args[3], args[4],
+                              args[5], rets);
+    } else if (cmpserv("interpret", 0, 0)) {
+        ret = vof_call_interpret(args[0], args[1], args[2], rets);
+    } else if (cmpserv("milliseconds", 0, 1)) {
+        ret = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    } else if (cmpserv("quiesce", 0, 0)) {
+        vof_quiesce(fdt, vof);
+    } else if (cmpserv("exit", 0, 0)) {
+        error_report("Stopped as the VM requested \"exit\"");
+        vm_stop(RUN_STATE_PAUSED); /* Or qemu_system_guest_panicked(NULL); ? */
+    } else {
+        trace_vof_error_unknown_service(service, nargs, nrets);
+        ret = -1;
+    }
+
+    return ret;
+}
+
+static void of_instance_free(gpointer data)
+{
+    OfInstance *inst = (OfInstance *) data;
+
+    g_free(inst->params);
+    g_free(inst->path);
+    g_free(inst);
+}
+
+void vof_reset(Vof *vof, uint32_t top_addr)
+{
+    if (vof->claimed) {
+        g_array_unref(vof->claimed);
+    }
+    if (vof->of_instances) {
+        g_hash_table_unref(vof->of_instances);
+    }
+
+    vof->claimed = g_array_new(false, false, sizeof(OfClaimed));
+    vof->of_instances = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                              NULL, of_instance_free);
+    vof->top_addr = top_addr;
+}
+
+void vof_build_dt(void *fdt, Vof *vof)
+{
+    uint32_t phandle;
+    int i, offset, proplen = 0;
+    const void *prop;
+    bool found = false;
+    GArray *phandles = g_array_new(false, false, sizeof(uint32_t));
+
+    /* Add options now, doing it at the end of this __func__ breaks it :-/ */
+    offset = fdt_add_subnode(fdt, 0, "options");
+    if (offset > 0) {
+        struct winsize ws;
+
+        if (ioctl(1, TIOCGWINSZ, &ws) != -1) {
+            _FDT(fdt_setprop_cell(fdt, offset, "screen-#columns", ws.ws_col));
+            _FDT(fdt_setprop_cell(fdt, offset, "screen-#rows", ws.ws_row));
+        }
+        _FDT(fdt_setprop_cell(fdt, offset, "real-mode?", 1));
+    }
+
+    /* Find all predefined phandles */
+    for (offset = fdt_next_node(fdt, -1, NULL);
+         offset >= 0;
+         offset = fdt_next_node(fdt, offset, NULL)) {
+        prop = fdt_getprop(fdt, offset, "phandle", &proplen);
+        if (prop && proplen == sizeof(uint32_t)) {
+            phandle = fdt32_ld(prop);
+            g_array_append_val(phandles, phandle);
+        }
+    }
+
+    /* Assign phandles skipping the predefined ones */
+    for (offset = fdt_next_node(fdt, -1, NULL), phandle = 1;
+         offset >= 0;
+         offset = fdt_next_node(fdt, offset, NULL), ++phandle) {
+
+        prop = fdt_getprop(fdt, offset, "phandle", &proplen);
+        if (prop) {
+            continue;
+        }
+        /* Check if the current phandle is not allocated already */
+        for ( ; ; ++phandle) {
+            for (i = 0, found = false; i < phandles->len; ++i) {
+                if (phandle == g_array_index(phandles, uint32_t, i)) {
+                    found = true;
+                    break;
+                }
+            }
+            if (!found) {
+                break;
+            }
+        }
+        _FDT(fdt_setprop_cell(fdt, offset, "phandle", phandle));
+    }
+    g_array_unref(phandles);
+
+    vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
+}
diff --git a/pc-bios/vof/bootmem.c b/pc-bios/vof/bootmem.c
new file mode 100644
index 000000000000..de7d5fc76431
--- /dev/null
+++ b/pc-bios/vof/bootmem.c
@@ -0,0 +1,13 @@
+#include "vof.h"
+
+void boot_from_memory(uint64_t initrd, uint64_t initrdsize)
+{
+	uint64_t kern[2];
+	phandle chosen = ci_finddevice("/chosen");
+
+	if (ci_getprop(chosen, "qemu,boot-kernel", kern, sizeof(kern)) !=
+			sizeof(kern))
+		return;
+
+	do_boot(kern[0], initrd, initrdsize);
+}
diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
new file mode 100644
index 000000000000..4880b3d2047c
--- /dev/null
+++ b/pc-bios/vof/ci.c
@@ -0,0 +1,108 @@
+#include "vof.h"
+
+struct prom_args {
+        uint32_t service;
+        uint32_t nargs;
+        uint32_t nret;
+        uint32_t args[10];
+};
+
+#define ADDR(x) (uint32_t)(x)
+
+extern uint32_t ci_entry(uint32_t params);
+
+extern unsigned long hv_rtas(unsigned long params);
+extern unsigned int hv_rtas_size;
+
+bool prom_handle(struct prom_args *pargs)
+{
+	void *rtasbase;
+	uint32_t rtassize = 0;
+	phandle rtas;
+
+	if (strcmp("call-method", (void *)(unsigned long) pargs->service))
+		return false;
+
+	if (strcmp("instantiate-rtas", (void *)(unsigned long) pargs->args[0]))
+		return false;
+
+	rtas = ci_finddevice("/rtas");
+	ci_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));
+	if (rtassize < hv_rtas_size)
+		return false;
+
+	rtasbase = (void *)(unsigned long) pargs->args[2];
+
+	memcpy(rtasbase, hv_rtas, hv_rtas_size);
+	pargs->args[pargs->nargs] = 0;
+	pargs->args[pargs->nargs + 1] = pargs->args[2];
+
+	return true;
+}
+
+void prom_entry(uint32_t args)
+{
+	if (!prom_handle((void *)(unsigned long) args))
+		ci_entry(args);
+}
+
+int call_prom(const char *service, int nargs, int nret, ...)
+{
+        int i;
+        struct prom_args args;
+        va_list list;
+
+        args.service = ADDR(service);
+        args.nargs = nargs;
+        args.nret = nret;
+
+        va_start(list, nret);
+        for (i = 0; i < nargs; i++)
+                args.args[i] = va_arg(list, prom_arg_t);
+        va_end(list);
+
+        for (i = 0; i < nret; i++)
+                args.args[nargs+i] = 0;
+
+        if (ci_entry((uint32_t)(&args)) < 0)
+                return PROM_ERROR;
+
+        return (nret > 0) ? args.args[nargs] : 0;
+}
+
+void ci_panic(const char *str)
+{
+	call_prom("exit", 0, 0);
+}
+
+phandle ci_finddevice(const char *path)
+{
+	return call_prom("finddevice", 1, 1, path);
+}
+
+uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len)
+{
+	return call_prom("getprop", 4, 1, ph, propname, prop, len);
+}
+
+ihandle ci_open(const char *path)
+{
+	return call_prom("open", 1, 1, path);
+}
+
+void ci_close(ihandle ih)
+{
+	call_prom("close", 1, 0, ih);
+}
+
+void *ci_claim(void *virt, uint32_t size, uint32_t align)
+{
+	uint32_t ret = call_prom("claim", 3, 1, ADDR(virt), size, align);
+
+	return (void *) (unsigned long) ret;
+}
+
+uint32_t ci_release(void *virt, uint32_t size)
+{
+	return call_prom("release", 2, 1, ADDR(virt), size);
+}
diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
new file mode 100644
index 000000000000..8603aedcb32c
--- /dev/null
+++ b/pc-bios/vof/libc.c
@@ -0,0 +1,91 @@
+#include "vof.h"
+
+int strlen(const char *s)
+{
+	int len = 0;
+
+	while (*s != 0) {
+		len += 1;
+		s += 1;
+	}
+
+	return len;
+}
+
+int strcmp(const char *s1, const char *s2)
+{
+        while (*s1 != 0 && *s2 != 0) {
+                if (*s1 != *s2)
+                        break;
+                s1 += 1;
+                s2 += 1;
+        }
+
+        return *s1 - *s2;
+}
+
+void *memcpy(void *dest, const void *src, size_t n)
+{
+        char *cdest;
+        const char *csrc = src;
+
+        cdest = dest;
+        while (n-- > 0) {
+                *cdest++ = *csrc++;
+        }
+
+        return dest;
+}
+
+int memcmp(const void *ptr1, const void *ptr2, size_t n)
+{
+        const unsigned char *p1 = ptr1;
+        const unsigned char *p2 = ptr2;
+
+        while (n-- > 0) {
+                if (*p1 != *p2)
+                        return (*p1 - *p2);
+                p1 += 1;
+                p2 += 1;
+        }
+
+        return 0;
+}
+
+void *memmove(void *dest, const void *src, size_t n)
+{
+        char *cdest;
+        const char *csrc;
+        int i;
+
+        /* Do the buffers overlap in a bad way? */
+        if (src < dest && src + n >= dest) {
+                /* Copy from end to start */
+                cdest = dest + n - 1;
+                csrc = src + n - 1;
+                for (i = 0; i < n; i++) {
+                        *cdest-- = *csrc--;
+                }
+        }
+        else {
+                /* Normal copy is possible */
+                cdest = dest;
+                csrc = src;
+                for (i = 0; i < n; i++) {
+                        *cdest++ = *csrc++;
+                }
+        }
+
+        return dest;
+}
+
+void *memset(void *dest, int c, size_t size)
+{
+        unsigned char *d = (unsigned char *)dest;
+
+        while (size-- > 0) {
+                *d++ = (unsigned char)c;
+        }
+
+        return dest;
+}
diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
new file mode 100644
index 000000000000..34299a9cc5ad
--- /dev/null
+++ b/pc-bios/vof/main.c
@@ -0,0 +1,22 @@
+#include "vof.h"
+
+
+void do_boot(unsigned long addr, unsigned long _r3, unsigned long _r4)
+{
+	register unsigned long r3 __asm__("r3") = _r3;
+	register unsigned long r4 __asm__("r4") = _r4;
+	register unsigned long r5 __asm__("r5") = (unsigned long) _prom_entry;
+
+	((client *)(uint32_t)addr)();
+}
+
+void entry_c(void)
+{
+	register unsigned long r3 __asm__("r3");
+	register unsigned long r4 __asm__("r4");
+	register unsigned long r5 __asm__("r5");
+	uint64_t initrd = r3, initrdsize = r4;
+
+	boot_from_memory(initrd, initrdsize);
+	ci_panic("*** No boot target ***\n");
+}
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index ffa2ec37fa25..5776cc8d955a 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -27,6 +27,8 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_nvdimm.c',
   'spapr_rtas_ddw.c',
   'spapr_numa.c',
+  'spapr_vof_client.c',
+  'vof.c',
 ))
 ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
 ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 1e91984526a3..017c48624f96 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -71,6 +71,27 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0x%"PRIx3
 spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_len) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
 spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
 
+# vof.c
+vof_error_str_truncated(const char *s, int len) "%s truncated to %d"
+vof_error_param(const char *method, int nargscheck, int nretcheck, int nargs, int nret) "%s takes/returns %d/%d, not %d/%d"
+vof_error_unknown_service(const char *service, int nargs, int nret) "\"%s\" args=%d rets=%d"
+vof_error_unknown_method(const char *method) "\"%s\""
+vof_error_unknown_ihandle_close(uint32_t ih) "ih=0x%x"
+vof_error_unknown_path(const char *path) "\"%s\""
+vof_finddevice(const char *path, uint32_t ph) "\"%s\" => ph=0x%x"
+vof_canon(const char *path) "\"%s\""
+vof_claim(uint32_t virt, uint32_t size, uint32_t align, uint32_t ret) "virt=0x%x size=0x%x align=0x%x => 0x%x"
+vof_release(uint32_t virt, uint32_t size, uint32_t ret) "virt=0x%x size=0x%x => 0x%x"
+vof_method(uint32_t ihandle, const char *method, uint32_t param, uint32_t ret, uint32_t ret2) "ih=0x%x \"%s\"(0x%x) => 0x%x 0x%x"
+vof_getprop(uint32_t ph, const char *prop, uint32_t ret, const char *val) "ph=0x%x \"%s\" => len=%d [%s]"
+vof_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=0x%x \"%s\" => len=%d"
+vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t ret) "ph=0x%x \"%s\" [%s] => len=%d"
+vof_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=0x%x => ih=0x%x"
+vof_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_t ret, uint32_t ret2) "[%s] 0x%x 0x%x => 0x%x 0x%x"
+vof_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=0x%x => %s len=%d"
+vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t ret) "ih=0x%x ph=0x%x => %s len=%d"
+vof_instance_to_package(uint32_t ih, uint32_t ph) "ih=0x%x => ph=0x%x"
+
 # ppc.c
 ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seconds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
 
diff --git a/pc-bios/README b/pc-bios/README
index 33f9754ad30f..7839ab5364c5 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -16,6 +16,8 @@
   https://github.com/aik/SLOF, and the image currently in qemu is
   built from git tag qemu-slof-20200717.
 
+- vof is a minimalistic firmware to work with -machine pseries,x-vof=on.
+
 - sgabios (the Serial Graphics Adapter option ROM) provides a means for
   legacy x86 software to communicate with an attached serial console as
   if a video card were attached.  The master sources reside in a subversion
diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
new file mode 100755
index 0000000000000000000000000000000000000000..0606d9451c6bff39b32879c2a3369406a6a0d07d
GIT binary patch
literal 3680
zcmd^BUuauZ82{2_+ue2@_aP6FMSANxX==+V^r6wxq_aZW%u<<!iXBNzt}d80wap}x
z#N4z}S8<TCJvivU2Pyj2hY5XKg&_s^u!ji|bnD&*d)b3vWu4dGckj6_{g=h<(ZJ!H
zob#RU_kF+b&$&eZ?_Xe@C~goH)*Xq?AW`(>B?=MUwAULA#>}I8bhdE6ZYf0j&qP62
z;l6X}0rol?XtZA^HJ3P=?ZiPe{%~Ip(aYQR$lk+M_mu|YR!*v0DmkeA@{iPX`5v|8
z0*A9F7ieE$t!^oBha7L*`MOjpkW^YAxpbWry+E?QKuWPor~L77wiqBO?{hBo>#hd2
z$6uf}{V=(5l5=VDXJcdXfw7s7y`N<}YQ$4>$)nks0Lgxp2(y%%KF0su;=iJ^9e2qM
zTO`;bhv?8H{d3(Fq5~Idv7ype_~x;3z_pkC@%zZZxLA9{+QaK<AJK_vqTsyoo9Xwl
zaF+eu#m{wMc)+KZ`Ly|i{&v1M-Aja7W_^XPLc!oX1$n;$R~Bp8loz<&^QL{~Jz>W+
z=#<!JTQ1*h#>AA#`vwN`mW}EzHm<_P4%pZ!Z1f<;Uc^|1E-&+s*~2^lqp=u4Jeo~j
zOq=`%v95<NeMDC+e^h_3Va!BGW!t*vj9YwP;0OOBzKLtw0sH~1ckl*2*j9;o-0ru{
z^&XsVxAj}jfoHNcV#dT{#&MQPutx<~-h6YP8?(9JJx5$8s^4cAyvJuEzwA9zo;kO3
z9QL<aoP$#<7LxxU)>}DOgntTT6~=%a)IDpg;r=lGZ{cyL?yB+JQ#b2<Ca#1%u+6Ho
zUf@SiXW(nFZ-3Vwc~pK1UJX6$%i9%o&OCXFoHLE#Ecyn8jm>ws=a_jrZ^ZyMa*eZ`
zEaY5}^X(#c4LVRG&NE!+{s1W*tK{O|sL$)Njy;@xZ^oxfR~T31iWzI*WCRZ9gp9sw
z%82{i<7D6t3K<vlcm{pS>zqS~z3dO7NA{Za&$hZaA6TZ?NA6<1kZrPLSq?ei5V5P)
zr`N^1&{)~Ww!RBfI{OQ|B-R%;{=Q&ygMMcE9X9?t&%FsfQmyhPv<a-+z*<8;y1DZW
znsNhc2>odo{V7_yOR17Uqo{=pILppNC>NZf#&Ur4a)d6H3sfpE&^P7lv{=4N-<1to
z{<WS~VC#^mrD4pR2T{!Yt~jp-D9H7Jxf?MoW4{M8pNB-<a34%eL+;gSI)Iwyo*3f)
z+zSUK<ZnF%?btw;_4oLD$p!m*idKvyKKIvyGb<*Fh~1OkA2B%{7Il230=pe}T+<TA
z-qZtGkq1ge9&FbY6}oP~AK8l4pTD#3<{L6+_R!(&`Z!PFgT(kEUv5>2VGa56#Q^6^
z$0AXOPK28Aocigt3FM6<N>9y^8uU*-Wc~OqU<?N^9Ki5e7?0;TH-#V7a<PV9GI^14
z?C&Auq8nUtttq;Jynll40=_EnU#h@=&bphFcJZ^(!rA<x0;igvHSjsHSb@VaV?LV%
z&f7J_Y*o~CPvv*U)*dp^35?3`4i9)#!J{|-N;oUx=mc(yh5P6i_764rZ{I<02|iz5
z7FX<ea&2)8E3oT;-6pW#tC8Df;rF}nJA{6AYG*$y@;6}<a;OFUtPMHT4jjBgk6&b4
zP^bKcDB=xp>Da@W#`x$x3i@jcY~?rKoe!PnZ;KYJ+w*Uo&hlH8cfN^!{Ks*wUlFH)
zy*NVYQFC*%+MiZGNT)MuCN}nwmQk^Fh~lwSs`Z?fIh#&Ua%4Oc8_6VN8Lf3J6C3Ay
zC&YrM*74+L8uqkoGQ(#dCPxwp?bBo&n@~79mL8?_s5Zi9@l<-8W#g$>@*L(dEv3b<
zb0U5g2P5=}cJ6!&ThscnHa4QA_zsc7L-axxql7Vwv5c{TeVjXnu)cwD6Qhi=j&UF3
NA;t#L5!^o_{R4q+IM@IH

literal 0
HcmV?d00001

diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
new file mode 100644
index 000000000000..90f4b859a059
--- /dev/null
+++ b/pc-bios/vof/entry.S
@@ -0,0 +1,51 @@
+#define LOAD32(rn, name)    \
+	lis     rn,name##@h;    \
+	ori     rn,rn,name##@l
+
+#define ENTRY(func_name)    \
+	.text;                  \
+	.align  2;              \
+	.globl  .func_name;     \
+	.func_name:             \
+	.globl  func_name;      \
+	func_name:
+
+#define KVMPPC_HCALL_BASE       0xf000
+#define KVMPPC_H_RTAS           (KVMPPC_HCALL_BASE + 0x0)
+#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
+
+	. = 0x100 /* Do exactly as SLOF does */
+
+ENTRY(_start)
+	LOAD32(%r31, 0) /* Go 32bit mode */
+	mtmsrd %r31,0
+	LOAD32(2, __toc_start)
+	b entry_c
+
+ENTRY(_prom_entry)
+	LOAD32(2, __toc_start)
+	stdu    %r1,-112(%r1)
+	std     %r31,104(%r1)
+	mflr    %r31
+	bl prom_entry
+	nop
+	mtlr    %r31
+	ld      %r31,104(%r1)
+	addi    %r1,%r1,112
+	blr
+
+ENTRY(ci_entry)
+	mr	4,3
+	LOAD32(3,KVMPPC_H_VOF_CLIENT)
+	sc	1
+	blr
+
+/* This is the actual RTAS blob copied to the OS at instantiate-rtas */
+ENTRY(hv_rtas)
+	mr      %r4,%r3
+	LOAD32(3,KVMPPC_H_RTAS)
+	sc	1
+	blr
+	.globl hv_rtas_size
+hv_rtas_size:
+	.long . - hv_rtas;
diff --git a/pc-bios/vof/l.lds b/pc-bios/vof/l.lds
new file mode 100644
index 000000000000..10b557a81f78
--- /dev/null
+++ b/pc-bios/vof/l.lds
@@ -0,0 +1,48 @@
+OUTPUT_FORMAT("elf32-powerpc", "elf32-powerpc", "elf32-powerpc")
+OUTPUT_ARCH(powerpc:common)
+
+/* set the entry point */
+ENTRY ( __start )
+
+SECTIONS {
+	__executable_start = .;
+
+	.text : {
+		*(.text)
+	}
+
+	__etext = .;
+
+	. = ALIGN(8);
+
+	.data : {
+		*(.data)
+		*(.rodata .rodata.*)
+		*(.got1)
+		*(.sdata)
+		*(.opd)
+	}
+
+	/* FIXME bss at end ??? */
+
+	. = ALIGN(8);
+	__bss_start = .;
+	.bss : {
+		*(.sbss) *(.scommon)
+		*(.dynbss)
+		*(.bss)
+	}
+
+	. = ALIGN(8);
+	__bss_end = .;
+	__bss_size = (__bss_end - __bss_start);
+
+	. = ALIGN(256);
+	__toc_start = DEFINED (.TOC.) ? .TOC. : ADDR (.got) + 0x8000;
+	.got :
+	{
+		 *(.toc .got)
+	}
+	. = ALIGN(8);
+	__toc_end = .;
+}
diff --git a/pc-bios/vof/nvram.bin b/pc-bios/vof/nvram.bin
new file mode 100644
index 0000000000000000000000000000000000000000..d183901cf980a91d81c4348bb20487c7bb62a2ec
GIT binary patch
literal 16384
zcmeI%Jx;?g6bEpZJ8*)oSZeqZi&Z2pKnD)sI4{AHlNb4;RW}a70XPHaW57uo=-#R7
zKSLBhJJ0sdixY3IuY@hzo0r$OmE%T;XE9uh@s1k=AOHafKmY;|fB*y_009U<00Izz
z00bZa0SG_<0uX=z1Rwwb2tWV=XCbip6d#B4{{rX#XR%}$Bm^J;0SG|gWP$!?Aq=-I
zcT+0Ix{{?1q>9J8r+eW^JK1tYYZZMWQCUwW%0S*~w^p@wfkX-<yRFx)H*+YEt0RRd
zmn}6xtwbP`yp4O=>kxMAEA<~5@*g)@mb%KD5!;O~8c)>8rRQBx55=trhk#+1+T3J_
zaf*G4vZAduqy$qda{``6Gnc2DQg<Es<GLxL#9<Oj*zP!8ZSnwf@-j7l47!nFXQO$a
z^Hes6YU^_M<KsM*k~zwOSa+2g3Sx{*Eyu^XrB0FM5IJ-*?8`VvpBc4}vS(+_UKJ;=
xITAns0uX=z1Rwwb2tWV=5P-nt34DD||Nni|VfbXeJORuY0uX=z1R!vE0>7B^s4f5i

literal 0
HcmV?d00001

-- 
2.17.1


