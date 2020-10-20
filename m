Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B76A028C719
	for <lists+qemu-devel@lfdr.de>; Tue, 13 Oct 2020 04:21:26 +0200 (CEST)
Received: from localhost ([::1]:37566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kS9wL-0001Iv-P8
	for lists+qemu-devel@lfdr.de; Mon, 12 Oct 2020 22:21:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45502)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1kS9us-0000lB-24; Mon, 12 Oct 2020 22:19:54 -0400
Received: from ozlabs.ru ([107.174.27.60]:57618)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1kS9un-0000c2-9x; Mon, 12 Oct 2020 22:19:53 -0400
Received: from fstn1-p1.ozlabs.ibm.com (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id BDEBFAE80026;
 Mon, 12 Oct 2020 22:18:39 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH qemu v10] spapr: Implement Open Firmware client interface
Date: Tue, 13 Oct 2020 13:19:11 +1100
Message-Id: <20201013021911.28701-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=107.174.27.60; envelope-from=aik@ozlabs.ru;
 helo=ozlabs.ru
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/12 22:19:45
X-ACL-Warn: Detected OS   = Linux 3.1-3.10 [fuzzy]
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

With this basic support, this can only boot into kernel directly.
However this is just enough for the petitboot kernel and initradmdisk to
boot from any possible source. Note this requires reasonably recent guest
kernel with:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---

The example command line is:

pbuild/qemu-killslof-localhost-ppc64/ppc64-softmmu/qemu-system-ppc64 \
-nodefaults \
-chardev stdio,id=STDIO0,signal=off,mux=on \
-device spapr-vty,id=svty0,reg=0x71000110,chardev=STDIO0 \
-mon id=MON0,chardev=STDIO0,mode=readline \
-nographic \
-vga none \
-machine pseries,x-vof=on,cap-cfpc=broken,cap-sbbc=broken,cap-ibs=broken,cap-ccf-assist=off \
-m 16G \
-kernel pbuild/kernel-le-guest/vmlinux \
-initrd pb/rootfs.cpio.xz \
-device virtio-scsi-pci,id=vscsi0 \
-drive id=DRIVE0,if=none,file=img/f30le.qcow2,format=qcow2 \
-device scsi-hd,id=scsi-hd0,drive=DRIVE0 \
-enable-kvm \
-bios p/qemu-killslof/pc-bios/vof.bin \
-snapshot \
-smp 1 \
-L /home/aik/t/qemu-ppc64-bios/ \
-trace events=qemu_trace_events \
-d guest_errors \
-chardev socket,id=SOCKET0,server,nowait,path=qemu.mon.ssh55056 \
-mon chardev=SOCKET0,mode=control

---
Changes:
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
 pc-bios/vof/Makefile     |   18 +
 include/hw/ppc/spapr.h   |   14 +-
 pc-bios/vof/vof.h        |   44 ++
 hw/ppc/spapr.c           |   59 ++-
 hw/ppc/spapr_hcall.c     |    6 +-
 hw/ppc/spapr_of_client.c | 1011 ++++++++++++++++++++++++++++++++++++++
 pc-bios/vof/bootmem.c    |   13 +
 pc-bios/vof/ci.c         |  108 ++++
 pc-bios/vof/libc.c       |   91 ++++
 pc-bios/vof/main.c       |   22 +
 hw/ppc/meson.build       |    1 +
 hw/ppc/trace-events      |   21 +
 pc-bios/README           |    2 +
 pc-bios/vof.bin          |  Bin 0 -> 3680 bytes
 pc-bios/vof/entry.S      |   51 ++
 pc-bios/vof/l.lds        |   48 ++
 16 files changed, 1498 insertions(+), 11 deletions(-)
 create mode 100644 pc-bios/vof/Makefile
 create mode 100644 pc-bios/vof/vof.h
 create mode 100644 hw/ppc/spapr_of_client.c
 create mode 100644 pc-bios/vof/bootmem.c
 create mode 100644 pc-bios/vof/ci.c
 create mode 100644 pc-bios/vof/libc.c
 create mode 100644 pc-bios/vof/main.c
 create mode 100755 pc-bios/vof.bin
 create mode 100644 pc-bios/vof/entry.S
 create mode 100644 pc-bios/vof/l.lds

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
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index bb47896f173b..720209e9d5c9 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -175,6 +175,13 @@ struct SpaprMachineState {
     long kernel_size;
     bool kernel_le;
     uint64_t kernel_addr;
+    bool vof; /* Virtual Open Firmware */
+    uint32_t rtas_base;
+    GArray *claimed; /* array of SpaprOfClaimed */
+    uint64_t claimed_base;
+    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
+    uint32_t of_instance_last;
+    char *bootargs;
     uint32_t initrd_base;
     long initrd_size;
     uint64_t rtc_offset; /* Now used only during incoming migration */
@@ -551,7 +558,8 @@ struct SpaprMachineState {
 /* Client Architecture support */
 #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
 #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
-#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
+#define KVMPPC_H_OF_CLIENT      (KVMPPC_HCALL_BASE + 0x5)
+#define KVMPPC_HCALL_MAX        KVMPPC_H_OF_CLIENT
 
 /*
  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
@@ -819,6 +827,10 @@ struct SpaprEventLogEntry {
 void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space);
 void spapr_events_init(SpaprMachineState *sm);
 void spapr_dt_events(SpaprMachineState *sm, void *fdt);
+void spapr_setup_of_client(SpaprMachineState *spapr, target_ulong *stack_ptr);
+void spapr_of_client_dt(SpaprMachineState *spapr, void *fdt);
+void spapr_of_client_dt_finalize(SpaprMachineState *spapr);
+void spapr_of_client_machine_init(SpaprMachineState *spapr);
 void close_htab_fd(SpaprMachineState *spapr);
 void spapr_setup_hpt(SpaprMachineState *spapr);
 void spapr_free_hpt(SpaprMachineState *spapr);
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
index 63315f2d0fa9..a1858bc22eee 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -100,6 +100,7 @@
 #define RTAS_MAX_ADDR           0x80000000 /* RTAS must stay below that */
 #define FW_MAX_SIZE             0x400000
 #define FW_FILE_NAME            "slof.bin"
+#define FW_FILE_NAME_VOF        "vof.bin"
 #define FW_OVERHEAD             0x2800000
 #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
 
@@ -1244,6 +1245,9 @@ void *spapr_build_fdt(SpaprMachineState *spapr, bool reset, size_t space)
     if (mc->nvdimm_supported) {
         spapr_dt_persistent_memory(spapr, fdt);
     }
+    if (spapr->vof) {
+        spapr_of_client_dt(spapr, fdt);
+    }
 
     return fdt;
 }
@@ -1646,22 +1650,36 @@ static void spapr_machine_reset(MachineState *machine)
 
     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
 
-    rc = fdt_pack(fdt);
-
-    /* Should only fail if we've built a corrupted tree */
-    assert(rc == 0);
-
-    /* Load the fdt */
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
+    if (spapr->vof) {
+        target_ulong stack_ptr = 0;
+
+        spapr_setup_of_client(spapr, &stack_ptr);
+        spapr_of_client_dt_finalize(spapr);
+        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                                  stack_ptr, spapr->initrd_base,
+                                  spapr->initrd_size);
+    } else {
+        /* Load the fdt */
+        rc = fdt_pack(spapr->fdt_blob);
+        /* Should only fail if we've built a corrupted tree */
+        assert(rc == 0);
+
+        spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
+        spapr->fdt_initial_size = spapr->fdt_size;
+        cpu_physical_memory_write(fdt_addr, spapr->fdt_blob, spapr->fdt_size);
+
+        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                                  0, fdt_addr, 0);
+    }
 
     spapr->fwnmi_system_reset_addr = -1;
     spapr->fwnmi_machine_check_addr = -1;
@@ -2971,7 +2989,7 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     if (bios_name == NULL) {
-        bios_name = FW_FILE_NAME;
+        bios_name = spapr->vof ? FW_FILE_NAME_VOF : FW_FILE_NAME;
     }
     filename = qemu_find_file(QEMU_FILE_TYPE_BIOS, bios_name);
     if (!filename) {
@@ -2985,6 +3003,10 @@ static void spapr_machine_init(MachineState *machine)
     }
     g_free(filename);
 
+    if (spapr->vof) {
+        spapr_of_client_machine_init(spapr);
+    }
+
     /* FIXME: Should register things through the MachineState's qdev
      * interface, this is a legacy from the sPAPREnvironment structure
      * which predated MachineState but had a similar function */
@@ -3189,6 +3211,20 @@ static void spapr_set_resize_hpt(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool spapr_get_vof(Object *obj, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    return spapr->vof;
+}
+
+static void spapr_set_vof(Object *obj, bool value, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    spapr->vof = value;
+}
+
 static char *spapr_get_ic_mode(Object *obj, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
@@ -3296,6 +3332,11 @@ static void spapr_instance_init(Object *obj)
                                     stringify(KERNEL_LOAD_ADDR)
                                     " for -kernel is the default");
     spapr->kernel_addr = KERNEL_LOAD_ADDR;
+    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
+    object_property_set_description(obj, "x-vof",
+                                    "Enable Virtual Open Firmware");
+    spapr->vof = false;
+
     /* The machine class defines the default interrupt controller mode */
     spapr->irq = smc->irq;
     object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 607740150fa2..9150e1cf0693 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1825,13 +1825,17 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
         spapr_setup_hpt(spapr);
     }
 
-    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
+    fdt = spapr_build_fdt(spapr, spapr->vof, fdt_bufsize);
 
     g_free(spapr->fdt_blob);
     spapr->fdt_size = fdt_totalsize(fdt);
     spapr->fdt_initial_size = spapr->fdt_size;
     spapr->fdt_blob = fdt;
 
+    if (spapr->vof) {
+        spapr_of_client_dt_finalize(spapr);
+    }
+
     return H_SUCCESS;
 }
 
diff --git a/hw/ppc/spapr_of_client.c b/hw/ppc/spapr_of_client.c
new file mode 100644
index 000000000000..04b1543696b0
--- /dev/null
+++ b/hw/ppc/spapr_of_client.c
@@ -0,0 +1,1011 @@
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
+/*
+ * OF 1275 "nextprop" description suggests is it 32 bytes max but
+ * LoPAPR defines "ibm,query-interrupt-source-number" which is 33 chars long.
+ */
+#define OF_PROPNAME_LEN_MAX 64
+
+/* Copied from SLOF, and 4K is definitely not enough for GRUB */
+#define OF_STACK_SIZE       0x8000
+
+/* 0..10000 is reserved for the VOF fw */
+#define OF_STACK_ADDR       0x10000
+
+#define ALIGN(x, a) (((x) + (a) - 1) & ~((a) - 1))
+
+typedef struct {
+    uint64_t start;
+    uint64_t size;
+} SpaprOfClaimed;
+
+typedef struct {
+    char *params;
+    char *path; /* the path used to open the instance */
+    uint32_t phandle;
+} SpaprOfInstance;
+
+/* Defined as Big Endian */
+struct prom_args {
+    uint32_t service;
+    uint32_t nargs;
+    uint32_t nret;
+    uint32_t args[10];
+} QEMU_PACKED;
+
+static void readstr(hwaddr pa, char *buf, int size)
+{
+    cpu_physical_memory_read(pa, buf, size);
+    if (buf[size - 1] != '\0') {
+        buf[size - 1] = '\0';
+        if (strlen(buf) == size - 1) {
+            trace_spapr_of_client_error_str_truncated(buf, size);
+        }
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
+        trace_spapr_of_client_error_param(s, nargscheck, nretcheck, nargs,
+                                          nret);
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
+    const char *c;
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
+static int of_client_fdt_path_offset(const void *fdt, const char *node,
+                                     const char *unit)
+{
+    int offset;
+
+    offset = fdt_path_offset(fdt, node);
+
+    if (offset < 0 && unit) {
+        char *tmp = g_strdup_printf("%s@%s", node, unit);
+
+        offset = fdt_path_offset(fdt, tmp);
+        g_free(tmp);
+    }
+
+    return offset;
+}
+
+static uint32_t of_client_finddevice(const void *fdt, uint32_t nodeaddr)
+{
+    char *node, *unit, *part;
+    char fullnode[1024];
+    uint32_t ret = -1;
+    int offset;
+
+    readstr(nodeaddr, fullnode, sizeof(fullnode));
+
+    split_path(fullnode, &node, &unit, &part);
+    offset = of_client_fdt_path_offset(fdt, node, unit);
+    if (offset >= 0) {
+        ret = fdt_get_phandle(fdt, offset);
+    }
+    trace_spapr_of_client_finddevice(fullnode, ret);
+    g_free(node);
+    g_free(unit);
+    g_free(part);
+    return (uint32_t) ret;
+}
+
+static uint32_t of_client_getprop(const void *fdt, uint32_t nodeph,
+                                  uint32_t pname, uint32_t valaddr,
+                                  uint32_t vallen)
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
+    trace_spapr_of_client_getprop(nodeph, propname, ret, trval);
+
+    return ret;
+}
+
+static uint32_t of_client_getproplen(const void *fdt, uint32_t nodeph,
+                                     uint32_t pname)
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
+    trace_spapr_of_client_getproplen(nodeph, propname, ret);
+
+    return ret;
+}
+
+static uint32_t of_client_setprop(SpaprMachineState *spapr,
+                                  uint32_t nodeph, uint32_t pname,
+                                  uint32_t valaddr, uint32_t vallen)
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
+            spapr->rtas_base = val32;
+        } else if (strcmp(propname, "linux,initrd-start") == 0) {
+            spapr->initrd_base = val32;
+        } else if (strcmp(propname, "linux,initrd-end") == 0) {
+            spapr->initrd_size = val32 - spapr->initrd_base;
+        } else {
+            goto trace_exit;
+        }
+    } else if (vallen == sizeof(uint64_t)) {
+        uint64_t val64 = ldq_be_phys(first_cpu->as, valaddr);
+
+        if (strcmp(propname, "linux,initrd-start") == 0) {
+            spapr->initrd_base = val64;
+        } else if (strcmp(propname, "linux,initrd-end") == 0) {
+            spapr->initrd_size = val64 - spapr->initrd_base;
+        } else {
+            goto trace_exit;
+        }
+    } else if (strcmp(propname, "bootargs") == 0) {
+        char val[1024];
+
+        readstr(valaddr, val, sizeof(val));
+        g_free(spapr->bootargs);
+        spapr->bootargs = g_strdup(val);
+    } else {
+        goto trace_exit;
+    }
+
+    offset = fdt_node_offset_by_phandle(spapr->fdt_blob, nodeph);
+    if (offset >= 0) {
+        uint8_t data[vallen];
+
+        cpu_physical_memory_read(valaddr, data, vallen);
+        if (!fdt_setprop(spapr->fdt_blob, offset, propname, data, vallen)) {
+            ret = vallen;
+            prop_format(trval, sizeof(trval), data, ret);
+        }
+    }
+
+trace_exit:
+    trace_spapr_of_client_setprop(nodeph, propname, trval, ret);
+
+    return ret;
+}
+
+static uint32_t of_client_nextprop(const void *fdt, uint32_t phandle,
+                                   uint32_t prevaddr, uint32_t nameaddr)
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
+static uint32_t of_client_peer(const void *fdt, uint32_t phandle)
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
+static uint32_t of_client_child(const void *fdt, uint32_t phandle)
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
+static uint32_t of_client_parent(const void *fdt, uint32_t phandle)
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
+static uint32_t spapr_of_client_open(SpaprMachineState *spapr, const char *path)
+{
+    int offset;
+    uint32_t ret = 0;
+    SpaprOfInstance *inst = NULL;
+    char *node, *unit, *part;
+
+    if (spapr->of_instance_last == 0xFFFFFFFF) {
+        /* We do not recycle ihandles yet */
+        goto trace_exit;
+    }
+
+    split_path(path, &node, &unit, &part);
+
+    offset = of_client_fdt_path_offset(spapr->fdt_blob, node, unit);
+    if (offset < 0) {
+        trace_spapr_of_client_error_unknown_path(path);
+        goto trace_exit;
+    }
+
+    inst = g_new0(SpaprOfInstance, 1);
+    inst->phandle = fdt_get_phandle(spapr->fdt_blob, offset);
+    g_assert(inst->phandle);
+    ++spapr->of_instance_last;
+
+    inst->path = g_strdup(path);
+    inst->params = part;
+    g_hash_table_insert(spapr->of_instances,
+                        GINT_TO_POINTER(spapr->of_instance_last),
+                        inst);
+    ret = spapr->of_instance_last;
+
+trace_exit:
+    trace_spapr_of_client_open(path, inst ? inst->phandle : 0, ret);
+    g_free(node);
+    g_free(unit);
+
+    return ret;
+}
+
+static uint32_t of_client_open(SpaprMachineState *spapr, uint32_t pathaddr)
+{
+    char path[256];
+
+    readstr(pathaddr, path, sizeof(path));
+
+    return spapr_of_client_open(spapr, path);
+}
+
+static void of_client_close(SpaprMachineState *spapr, uint32_t ihandle)
+{
+    if (!g_hash_table_remove(spapr->of_instances, GINT_TO_POINTER(ihandle))) {
+        trace_spapr_of_client_error_unknown_ihandle_close(ihandle);
+    }
+}
+
+static uint32_t of_client_instance_to_package(SpaprMachineState *spapr,
+                                              uint32_t ihandle)
+{
+    gpointer instp = g_hash_table_lookup(spapr->of_instances,
+                                         GINT_TO_POINTER(ihandle));
+    uint32_t ret = -1;
+
+    if (instp) {
+        ret = ((SpaprOfInstance *)instp)->phandle;
+    }
+    trace_spapr_of_client_instance_to_package(ihandle, ret);
+
+    return ret;
+}
+
+static uint32_t of_client_package_to_path(const void *fdt, uint32_t phandle,
+                                          uint32_t buf, uint32_t len)
+{
+    uint32_t ret = -1;
+    char tmp[256] = "";
+
+    if (0 == fdt_get_path(fdt, fdt_node_offset_by_phandle(fdt, phandle), tmp,
+                          sizeof(tmp))) {
+        tmp[sizeof(tmp) - 1] = 0;
+        ret = MIN(len, strlen(tmp) + 1);
+        cpu_physical_memory_write(buf, tmp, ret);
+    }
+
+    trace_spapr_of_client_package_to_path(phandle, tmp, ret);
+
+    return ret;
+}
+
+static uint32_t of_client_instance_to_path(SpaprMachineState *spapr,
+                                           uint32_t ihandle, uint32_t buf,
+                                           uint32_t len)
+{
+    uint32_t ret = -1;
+    uint32_t phandle = of_client_instance_to_package(spapr, ihandle);
+    char tmp[256] = "";
+
+    if (phandle != -1) {
+        if (0 == fdt_get_path(spapr->fdt_blob,
+                              fdt_node_offset_by_phandle(spapr->fdt_blob,
+                                                         phandle),
+                              tmp, sizeof(tmp))) {
+            tmp[sizeof(tmp) - 1] = 0;
+            ret = MIN(len, strlen(tmp) + 1);
+            cpu_physical_memory_write(buf, tmp, ret);
+        }
+    }
+    trace_spapr_of_client_instance_to_path(ihandle, phandle, tmp, ret);
+
+    return ret;
+}
+
+static void of_client_clamed_dump(GArray *claimed)
+{
+#ifdef DEBUG
+    int i;
+    SpaprOfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, SpaprOfClaimed, i);
+        error_printf("CLAIMED %lx..%lx size=%ld\n", c.start, c.start + c.size,
+                     c.size);
+    }
+#endif
+}
+
+static bool of_client_claim_avail(GArray *claimed, uint64_t virt, uint64_t size)
+{
+    int i;
+    SpaprOfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, SpaprOfClaimed, i);
+        if ((c.start <= virt && virt < c.start + c.size) ||
+            (virt <= c.start && c.start < virt + size)) {
+            return false;
+        }
+    }
+
+    return true;
+}
+
+static void of_client_claim_add(GArray *claimed, uint64_t virt, uint64_t size)
+{
+    SpaprOfClaimed newclaim;
+
+    newclaim.start = virt;
+    newclaim.size = size;
+    g_array_append_val(claimed, newclaim);
+}
+
+/*
+ * "claim" claims memory at @virt if @align==0; otherwise it allocates
+ * memory at the requested alignment.
+ */
+static void of_client_dt_memory_available(void *fdt, GArray *claimed,
+                                          uint64_t base);
+
+static uint64_t of_client_claim(SpaprMachineState *spapr, uint64_t virt,
+                                uint64_t size, uint64_t align)
+{
+    uint64_t ret;
+
+    if (size == 0) {
+        ret = -1;
+    } else if (align == 0) {
+        if (!of_client_claim_avail(spapr->claimed, virt, size)) {
+            ret = -1;
+        } else {
+            ret = virt;
+        }
+    } else {
+        spapr->claimed_base = ALIGN(spapr->claimed_base, align);
+        while (1) {
+            if (spapr->claimed_base >= spapr->rma_size) {
+                error_report("Out of RMA memory for the OF client");
+                return -1;
+            }
+            if (of_client_claim_avail(spapr->claimed, spapr->claimed_base,
+                                      size)) {
+                break;
+            }
+            spapr->claimed_base += size;
+        }
+        ret = spapr->claimed_base;
+    }
+
+    if (ret != -1) {
+        spapr->claimed_base = MAX(spapr->claimed_base, ret + size);
+        of_client_claim_add(spapr->claimed, ret, size);
+        /* The client reads "/memory@0/available" to know where it can claim */
+        of_client_dt_memory_available(spapr->fdt_blob, spapr->claimed,
+                                      spapr->claimed_base);
+    }
+    trace_spapr_of_client_claim(virt, size, align, ret);
+
+    return ret;
+}
+
+static uint32_t of_client_release(SpaprMachineState *spapr, uint64_t virt,
+                                  uint64_t size)
+{
+    uint32_t ret = -1;
+    int i;
+    GArray *claimed = spapr->claimed;
+    SpaprOfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, SpaprOfClaimed, i);
+        if (c.start == virt && c.size == size) {
+            g_array_remove_index(claimed, i);
+            ret = 0;
+            break;
+        }
+    }
+
+    trace_spapr_of_client_release(virt, size, ret);
+
+    return ret;
+}
+
+static void of_client_instantiate_rtas(SpaprMachineState *spapr, uint32_t base)
+{
+    error_report("The firmware should have instantiated RTAS");
+    exit(1);
+}
+
+static uint32_t of_client_call_method(SpaprMachineState *spapr,
+                                      uint32_t methodaddr, uint32_t ihandle,
+                                      uint32_t param1, uint32_t param2,
+                                      uint32_t param3, uint32_t param4,
+                                      uint32_t *ret2)
+{
+    uint32_t ret = -1;
+    char method[256] = "";
+    SpaprOfInstance *inst = NULL;
+
+    if (!ihandle) {
+        goto trace_exit;
+    }
+
+    inst = (SpaprOfInstance *) g_hash_table_lookup(spapr->of_instances,
+                                                   GINT_TO_POINTER(ihandle));
+    if (!inst) {
+        goto trace_exit;
+    }
+
+    readstr(methodaddr, method, sizeof(method));
+
+    if (strcmp(inst->path, "/") == 0) {
+        if (strcmp(method, "ibm,client-architecture-support") == 0) {
+            ret = do_client_architecture_support(POWERPC_CPU(first_cpu), spapr,
+                                                 param1, FDT_MAX_SIZE);
+            *ret2 = 0;
+        }
+    } else if (strcmp(inst->path, "/rtas") == 0) {
+        if (strcmp(method, "instantiate-rtas") == 0) {
+            of_client_instantiate_rtas(spapr, param1);
+            ret = 0;
+            *ret2 = param1; /* rtasbase */
+        }
+    } else {
+        trace_spapr_of_client_error_unknown_method(method);
+    }
+
+trace_exit:
+    trace_spapr_of_client_method(ihandle, method, param1, ret, *ret2);
+
+    return ret;
+}
+
+static uint32_t of_client_call_interpret(SpaprMachineState *spapr,
+                                         uint32_t cmdaddr, uint32_t param1,
+                                         uint32_t param2, uint32_t *ret2)
+{
+    uint32_t ret = -1;
+    char cmd[256] = "";
+
+    readstr(cmdaddr, cmd, sizeof(cmd));
+    trace_spapr_of_client_interpret(cmd, param1, param2, ret, *ret2);
+
+    return ret;
+}
+
+static void of_client_quiesce(SpaprMachineState *spapr)
+{
+    int rc = fdt_pack(spapr->fdt_blob);
+
+    assert(rc == 0);
+
+    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
+    spapr->fdt_initial_size = spapr->fdt_size;
+    of_client_clamed_dump(spapr->claimed);
+}
+
+static target_ulong spapr_h_of_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                      target_ulong opcode, target_ulong *args)
+{
+    target_ulong of_client_args = ppc64_phys_to_real(args[0]);
+    struct prom_args pargs = { 0 };
+    char service[64];
+    unsigned nargs, nret;
+    int i, servicelen;
+
+    cpu_physical_memory_read(of_client_args, &pargs, sizeof(pargs));
+    nargs = be32_to_cpu(pargs.nargs);
+    nret = be32_to_cpu(pargs.nret);
+    readstr(be32_to_cpu(pargs.service), service, sizeof(service));
+    servicelen = strlen(service);
+
+    if (nargs >= ARRAY_SIZE(pargs.args)) {
+        return H_PARAMETER;
+    }
+
+#define cmpserv(s, a, r) \
+    cmpservice(service, servicelen, nargs, nret, (s), sizeof(s), (a), (r))
+
+    if (cmpserv("finddevice", 1, 1)) {
+        pargs.args[nargs] =
+            of_client_finddevice(spapr->fdt_blob,
+                                 be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("getprop", 4, 1)) {
+        pargs.args[nargs] =
+            of_client_getprop(spapr->fdt_blob,
+                              be32_to_cpu(pargs.args[0]),
+                              be32_to_cpu(pargs.args[1]),
+                              be32_to_cpu(pargs.args[2]),
+                              be32_to_cpu(pargs.args[3]));
+    } else if (cmpserv("getproplen", 2, 1)) {
+        pargs.args[nargs] =
+            of_client_getproplen(spapr->fdt_blob,
+                                 be32_to_cpu(pargs.args[0]),
+                                 be32_to_cpu(pargs.args[1]));
+    } else if (cmpserv("setprop", 4, 1)) {
+        pargs.args[nargs] =
+            of_client_setprop(spapr,
+                              be32_to_cpu(pargs.args[0]),
+                              be32_to_cpu(pargs.args[1]),
+                              be32_to_cpu(pargs.args[2]),
+                              be32_to_cpu(pargs.args[3]));
+    } else if (cmpserv("nextprop", 3, 1)) {
+        pargs.args[nargs] =
+            of_client_nextprop(spapr->fdt_blob,
+                               be32_to_cpu(pargs.args[0]),
+                               be32_to_cpu(pargs.args[1]),
+                               be32_to_cpu(pargs.args[2]));
+    } else if (cmpserv("peer", 1, 1)) {
+        pargs.args[nargs] =
+            of_client_peer(spapr->fdt_blob,
+                           be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("child", 1, 1)) {
+        pargs.args[nargs] =
+            of_client_child(spapr->fdt_blob,
+                            be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("parent", 1, 1)) {
+        pargs.args[nargs] =
+            of_client_parent(spapr->fdt_blob,
+                             be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("open", 1, 1)) {
+        pargs.args[nargs] = of_client_open(spapr, be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("close", 1, 0)) {
+        of_client_close(spapr, be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("instance-to-package", 1, 1)) {
+        pargs.args[nargs] =
+            of_client_instance_to_package(spapr,
+                                          be32_to_cpu(pargs.args[0]));
+    } else if (cmpserv("package-to-path", 3, 1)) {
+        pargs.args[nargs] =
+            of_client_package_to_path(spapr->fdt_blob,
+                                      be32_to_cpu(pargs.args[0]),
+                                      be32_to_cpu(pargs.args[1]),
+                                      be32_to_cpu(pargs.args[2]));
+    } else if (cmpserv("instance-to-path", 3, 1)) {
+        pargs.args[nargs] =
+            of_client_instance_to_path(spapr,
+                                       be32_to_cpu(pargs.args[0]),
+                                       be32_to_cpu(pargs.args[1]),
+                                       be32_to_cpu(pargs.args[2]));
+    } else if (cmpserv("claim", 3, 1)) {
+        pargs.args[nargs] =
+            of_client_claim(spapr,
+                            be32_to_cpu(pargs.args[0]),
+                            be32_to_cpu(pargs.args[1]),
+                            be32_to_cpu(pargs.args[2]));
+    } else if (cmpserv("release", 2, 0)) {
+        pargs.args[nargs] =
+            of_client_release(spapr,
+                              be32_to_cpu(pargs.args[0]),
+                              be32_to_cpu(pargs.args[1]));
+    } else if (cmpserv("call-method", 0, 0)) {
+        pargs.args[nargs] =
+            of_client_call_method(spapr,
+                                  be32_to_cpu(pargs.args[0]),
+                                  be32_to_cpu(pargs.args[1]),
+                                  be32_to_cpu(pargs.args[2]),
+                                  be32_to_cpu(pargs.args[3]),
+                                  be32_to_cpu(pargs.args[4]),
+                                  be32_to_cpu(pargs.args[5]),
+                                  &pargs.args[nargs + 1]);
+    } else if (cmpserv("interpret", 0, 0)) {
+        pargs.args[nargs] =
+            of_client_call_interpret(spapr,
+                                     be32_to_cpu(pargs.args[0]),
+                                     be32_to_cpu(pargs.args[1]),
+                                     be32_to_cpu(pargs.args[2]),
+                                     &pargs.args[nargs + 1]);
+    } else if (cmpserv("milliseconds", 0, 1)) {
+        pargs.args[nargs] = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    } else if (cmpserv("quiesce", 0, 0)) {
+        of_client_quiesce(spapr);
+    } else if (cmpserv("exit", 0, 0)) {
+        error_report("Stopped as the VM requested \"exit\"");
+        vm_stop(RUN_STATE_PAUSED); /* Or qemu_system_guest_panicked(NULL); ? */
+    } else {
+        trace_spapr_of_client_error_unknown_service(service, nargs, nret);
+        pargs.args[nargs] = -1;
+    }
+
+    for (i = 0; i < nret; ++i) {
+        pargs.args[nargs + i] = be32_to_cpu(pargs.args[nargs + i]);
+    }
+
+    cpu_physical_memory_write(of_client_args, &pargs,
+                              sizeof(uint32_t) * (3 + nargs + nret));
+
+    return H_SUCCESS;
+}
+
+static void of_instance_free(gpointer data)
+{
+    SpaprOfInstance *inst = (SpaprOfInstance *) data;
+
+    g_free(inst->params);
+    g_free(inst->path);
+    g_free(inst);
+}
+
+void spapr_setup_of_client(SpaprMachineState *spapr, target_ulong *stack_ptr)
+{
+    if (spapr->claimed) {
+        g_array_unref(spapr->claimed);
+    }
+    if (spapr->of_instances) {
+        g_hash_table_unref(spapr->of_instances);
+    }
+
+    spapr->claimed = g_array_new(false, false, sizeof(SpaprOfClaimed));
+    spapr->of_instances = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                                NULL, of_instance_free);
+
+    *stack_ptr = of_client_claim(spapr, OF_STACK_ADDR, OF_STACK_SIZE,
+                                 OF_STACK_SIZE);
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
+        of_client_claim(spapr, spapr->kernel_addr,
+                        spapr->kernel_size, 0) == -1) {
+        error_report("Memory for kernel is in use");
+        exit(1);
+    }
+
+    if (spapr->initrd_size &&
+        of_client_claim(spapr, spapr->initrd_base,
+                        spapr->initrd_size, 0) == -1) {
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
+static gint of_claimed_compare_func(gconstpointer a, gconstpointer b)
+{
+    return ((SpaprOfClaimed *)a)->start - ((SpaprOfClaimed *)b)->start;
+}
+
+static void of_client_dt_memory_available(void *fdt, GArray *claimed,
+                                          uint64_t base)
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
+    of_client_clamed_dump(claimed);
+
+    avail = g_malloc0(sizeof(uint64_t) * 2 * claimed->len);
+    for (i = 0, n = 0; i < claimed->len; ++i) {
+        SpaprOfClaimed c = g_array_index(claimed, SpaprOfClaimed, i);
+
+        avail[n].start = c.start + c.size;
+        if (i < claimed->len - 1) {
+            SpaprOfClaimed cn = g_array_index(claimed, SpaprOfClaimed, i + 1);
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
+void spapr_of_client_dt(SpaprMachineState *spapr, void *fdt)
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
+    of_client_dt_memory_available(fdt, spapr->claimed, spapr->claimed_base);
+}
+
+void spapr_of_client_dt_finalize(SpaprMachineState *spapr)
+{
+    void *fdt = spapr->fdt_blob;
+    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
+    int chosen = fdt_path_offset(fdt, "/chosen");
+
+    /*
+     * SLOF-less setup requires an open instance of stdout for early
+     * kernel printk. By now all phandles are settled so we can open
+     * the default serial console.
+     */
+    if (stdout_path) {
+        _FDT(fdt_setprop_cell(fdt, chosen, "stdout",
+                              spapr_of_client_open(spapr, stdout_path)));
+    }
+}
+
+void spapr_of_client_machine_init(SpaprMachineState *spapr)
+{
+    spapr_register_hypercall(KVMPPC_H_OF_CLIENT, spapr_h_of_client);
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
index ffa2ec37fa25..782d3f2aaf4d 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -27,6 +27,7 @@ ppc_ss.add(when: 'CONFIG_PSERIES', if_true: files(
   'spapr_nvdimm.c',
   'spapr_rtas_ddw.c',
   'spapr_numa.c',
+  'spapr_of_client.c',
 ))
 ppc_ss.add(when: 'CONFIG_SPAPR_RNG', if_true: files('spapr_rng.c'))
 ppc_ss.add(when: ['CONFIG_PSERIES', 'CONFIG_LINUX'], if_true: files(
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index dcc06d49b5a2..d913c5cc8390 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -71,6 +71,27 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0x%"PRIx3
 spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_len) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
 spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
 
+# spapr_of_client.c
+spapr_of_client_error_str_truncated(const char *s, int len) "%s truncated to %d"
+spapr_of_client_error_param(const char *method, int nargscheck, int nretcheck, int nargs, int nret) "%s takes/returns %d/%d, not %d/%d"
+spapr_of_client_error_unknown_service(const char *service, int nargs, int nret) "\"%s\" args=%d rets=%d"
+spapr_of_client_error_unknown_method(const char *method) "\"%s\""
+spapr_of_client_error_unknown_ihandle_close(uint32_t ih) "ih=0x%x"
+spapr_of_client_error_unknown_path(const char *path) "\"%s\""
+spapr_of_client_finddevice(const char *path, uint32_t ph) "\"%s\" => ph=0x%x"
+spapr_of_client_canon(const char *path) "\"%s\""
+spapr_of_client_claim(uint32_t virt, uint32_t size, uint32_t align, uint32_t ret) "virt=0x%x size=0x%x align=0x%x => 0x%x"
+spapr_of_client_release(uint32_t virt, uint32_t size, uint32_t ret) "virt=0x%x size=0x%x => 0x%x"
+spapr_of_client_method(uint32_t ihandle, const char *method, uint32_t param, uint32_t ret, uint32_t ret2) "ih=0x%x \"%s\"(0x%x) => 0x%x 0x%x"
+spapr_of_client_getprop(uint32_t ph, const char *prop, uint32_t ret, const char *val) "ph=0x%x \"%s\" => len=%d [%s]"
+spapr_of_client_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=0x%x \"%s\" => len=%d"
+spapr_of_client_setprop(uint32_t ph, const char *prop, const char *val, uint32_t ret) "ph=0x%x \"%s\" [%s] => len=%d"
+spapr_of_client_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=0x%x => ih=0x%x"
+spapr_of_client_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_t ret, uint32_t ret2) "[%s] 0x%x 0x%x => 0x%x 0x%x"
+spapr_of_client_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=0x%x => %s len=%d"
+spapr_of_client_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t ret) "ih=0x%x ph=0x%x => %s len=%d"
+spapr_of_client_instance_to_package(uint32_t ih, uint32_t ph) "ih=0x%x => ph=0x%x"
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
index 000000000000..39b333779514
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
+#define KVMPPC_H_OF_CLIENT      (KVMPPC_HCALL_BASE + 0x5)
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
+	LOAD32(3,KVMPPC_H_OF_CLIENT)
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
-- 
2.17.1


