Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 05DD13C1EF5
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Jul 2021 07:34:37 +0200 (CEST)
Received: from localhost ([::1]:57472 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1j9n-0001o7-W8
	for lists+qemu-devel@lfdr.de; Fri, 09 Jul 2021 01:34:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iuB-0002K4-EB; Fri, 09 Jul 2021 01:18:27 -0400
Received: from ozlabs.org ([2401:3900:2:1::2]:46199)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dgibson@ozlabs.org>)
 id 1m1iu4-00022q-RE; Fri, 09 Jul 2021 01:18:26 -0400
Received: by ozlabs.org (Postfix, from userid 1007)
 id 4GLhHf2bySz9t54; Fri,  9 Jul 2021 15:17:34 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=gibson.dropbear.id.au; s=201602; t=1625807854;
 bh=k+SjY7N+vRIvuLJ58PF040X0VFJCAjFCVMxXdc3Q+hM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o55WkjC78NLQgXyEDBpBS1v6lMCsj7sWmQmhUY8iRC0oVidL9EetPhlJVPTYikxIZ
 MxkmON2KPTrMrGJy0Tl3ZrVXyu4JbId45u4aRCbdkqrZ2GbaVJUmWqQ9i2xFpqbXwJ
 yY9Cg/LQQDtj0mGt0uOF8fkOgpA6bMNUkQ6RP1Uc=
From: David Gibson <david@gibson.dropbear.id.au>
To: peter.maydell@linaro.org,
	groug@kaod.org
Subject: [PULL 22/33] spapr: Implement Open Firmware client interface
Date: Fri,  9 Jul 2021 15:17:17 +1000
Message-Id: <20210709051728.170203-23-david@gibson.dropbear.id.au>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210709051728.170203-1-david@gibson.dropbear.id.au>
References: <20210709051728.170203-1-david@gibson.dropbear.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2401:3900:2:1::2; envelope-from=dgibson@ozlabs.org;
 helo=ozlabs.org
X-Spam_score_int: -19
X-Spam_score: -2.0
X-Spam_bar: --
X-Spam_report: (-2.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, HEADER_FROM_DIFFERENT_DOMAINS=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: aik@ozlabs.ru, David Gibson <david@gibson.dropbear.id.au>,
 qemu-ppc@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Alexey Kardashevskiy <aik@ozlabs.ru>

The PAPR platform describes an OS environment that's presented by
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
0..e60 - the initial firmware
8000..10000 - stack
400000.. - kernel
3ea0000.. - initramdisk

This OF CI does not implement "interpret".

Unlike SLOF, this does not format uninitialized nvram. Instead, this
includes a disk image with pre-formatted nvram.

With this basic support, this can only boot into kernel directly.
However this is just enough for the petitboot kernel and initradmdisk to
boot from any possible source. Note this requires reasonably recent guest
kernel with:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=df5be5be8735

The immediate benefit is much faster booting time which especially
crucial with fully emulated early CPU bring up environments. Also this
may come handy when/if GRUB-in-the-userspace sees light of the day.

This separates VOF and sPAPR in a hope that VOF bits may be reused by
other POWERPC boards which do not support pSeries.

This assumes potential support for booting from QEMU backends
such as blockdev or netdev without devices/drivers used.

Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
Message-Id: <20210625055155.2252896-1-aik@ozlabs.ru>
Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>
[dwg: Adjusted some includes which broke compile in some more obscure
 compilation setups]
Signed-off-by: David Gibson <david@gibson.dropbear.id.au>
---
 MAINTAINERS             |   12 +
 hw/ppc/Kconfig          |    4 +
 hw/ppc/meson.build      |    3 +
 hw/ppc/spapr.c          |   67 ++-
 hw/ppc/spapr_hcall.c    |   25 +-
 hw/ppc/spapr_vof.c      |  153 ++++++
 hw/ppc/trace-events     |   24 +
 hw/ppc/vof.c            | 1049 +++++++++++++++++++++++++++++++++++++++
 include/hw/ppc/spapr.h  |   19 +-
 include/hw/ppc/vof.h    |   58 +++
 pc-bios/README          |    4 +
 pc-bios/vof-nvram.bin   |  Bin 0 -> 16384 bytes
 pc-bios/vof.bin         |  Bin 0 -> 3784 bytes
 pc-bios/vof/Makefile    |   23 +
 pc-bios/vof/bootmem.c   |   14 +
 pc-bios/vof/ci.c        |   91 ++++
 pc-bios/vof/entry.S     |   49 ++
 pc-bios/vof/libc.c      |   92 ++++
 pc-bios/vof/main.c      |   21 +
 pc-bios/vof/vof.h       |   43 ++
 pc-bios/vof/vof.lds     |   48 ++
 tests/qtest/rtas-test.c |   15 +-
 22 files changed, 1801 insertions(+), 13 deletions(-)
 create mode 100644 hw/ppc/spapr_vof.c
 create mode 100644 hw/ppc/vof.c
 create mode 100644 include/hw/ppc/vof.h
 create mode 100644 pc-bios/vof-nvram.bin
 create mode 100755 pc-bios/vof.bin
 create mode 100644 pc-bios/vof/Makefile
 create mode 100644 pc-bios/vof/bootmem.c
 create mode 100644 pc-bios/vof/ci.c
 create mode 100644 pc-bios/vof/entry.S
 create mode 100644 pc-bios/vof/libc.c
 create mode 100644 pc-bios/vof/main.c
 create mode 100644 pc-bios/vof/vof.h
 create mode 100644 pc-bios/vof/vof.lds

diff --git a/MAINTAINERS b/MAINTAINERS
index 684142e12e..ce122eeced 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1360,6 +1360,18 @@ F: hw/pci-host/mv64361.c
 F: hw/pci-host/mv643xx.h
 F: include/hw/pci-host/mv64361.h
 
+Virtual Open Firmware (VOF)
+M: Alexey Kardashevskiy <aik@ozlabs.ru>
+M: David Gibson <david@gibson.dropbear.id.au>
+M: Greg Kurz <groug@kaod.org>
+L: qemu-ppc@nongnu.org
+S: Maintained
+F: hw/ppc/spapr_vof*
+F: hw/ppc/vof*
+F: include/hw/ppc/vof*
+F: pc-bios/vof/*
+F: pc-bios/vof*
+
 RISC-V Machines
 ---------------
 OpenTitan
diff --git a/hw/ppc/Kconfig b/hw/ppc/Kconfig
index 66e0b15d9e..67630f80e1 100644
--- a/hw/ppc/Kconfig
+++ b/hw/ppc/Kconfig
@@ -13,6 +13,7 @@ config PSERIES
     select MSI_NONBROKEN
     select FDT_PPC
     select CHRP_NVRAM
+    select VOF
 
 config SPAPR_RNG
     bool
@@ -144,3 +145,6 @@ config FW_CFG_PPC
 
 config FDT_PPC
     bool
+
+config VOF
+    bool
diff --git a/hw/ppc/meson.build b/hw/ppc/meson.build
index 597d974dd4..aa4c8e6a2e 100644
--- a/hw/ppc/meson.build
+++ b/hw/ppc/meson.build
@@ -84,4 +84,7 @@ ppc_ss.add(when: 'CONFIG_VIRTEX', if_true: files('virtex_ml507.c'))
 # Pegasos2
 ppc_ss.add(when: 'CONFIG_PEGASOS2', if_true: files('pegasos2.c'))
 
+ppc_ss.add(when: 'CONFIG_VOF', if_true: files('vof.c'))
+ppc_ss.add(when: ['CONFIG_VOF', 'CONFIG_PSERIES'], if_true: files('spapr_vof.c'))
+
 hw_arch += {'ppc': ppc_ss}
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index 9e19c57032..e9b6d0f587 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -101,6 +101,7 @@
 #define FDT_MAX_ADDR            0x80000000 /* FDT must stay below that */
 #define FW_MAX_SIZE             0x400000
 #define FW_FILE_NAME            "slof.bin"
+#define FW_FILE_NAME_VOF        "vof.bin"
 #define FW_OVERHEAD             0x2800000
 #define KERNEL_LOAD_ADDR        FW_MAX_SIZE
 
@@ -1643,22 +1644,37 @@ static void spapr_machine_reset(MachineState *machine)
     fdt_addr = MIN(spapr->rma_size, FDT_MAX_ADDR) - FDT_MAX_SIZE;
 
     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
+    if (spapr->vof) {
+        target_ulong stack_ptr = 0;
 
-    rc = fdt_pack(fdt);
+        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
 
-    /* Should only fail if we've built a corrupted tree */
-    assert(rc == 0);
+        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                                  stack_ptr, spapr->initrd_base,
+                                  spapr->initrd_size);
+        /* VOF is 32bit BE so enforce MSR here */
+        first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
+        /*
+         * Do not pack the FDT as the client may change properties.
+         * VOF client does not expect the FDT so we do not load it to the VM.
+         */
+    } else {
+        rc = fdt_pack(fdt);
+        /* Should only fail if we've built a corrupted tree */
+        assert(rc == 0);
 
-    /* Load the fdt */
+        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                                  0, fdt_addr, 0);
+        cpu_physical_memory_write(fdt_addr, fdt, fdt_totalsize(fdt));
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
 
     spapr->fwnmi_system_reset_addr = -1;
@@ -2661,7 +2677,8 @@ static void spapr_machine_init(MachineState *machine)
     SpaprMachineState *spapr = SPAPR_MACHINE(machine);
     SpaprMachineClass *smc = SPAPR_MACHINE_GET_CLASS(machine);
     MachineClass *mc = MACHINE_GET_CLASS(machine);
-    const char *bios_name = machine->firmware ?: FW_FILE_NAME;
+    const char *bios_default = spapr->vof ? FW_FILE_NAME_VOF : FW_FILE_NAME;
+    const char *bios_name = machine->firmware ?: bios_default;
     const char *kernel_filename = machine->kernel_filename;
     const char *initrd_filename = machine->initrd_filename;
     PCIHostState *phb;
@@ -3018,6 +3035,10 @@ static void spapr_machine_init(MachineState *machine)
     }
 
     qemu_cond_init(&spapr->fwnmi_machine_check_interlock_cond);
+    if (spapr->vof) {
+        spapr->vof->fw_size = fw_size; /* for claim() on itself */
+        spapr_register_hypercall(KVMPPC_H_VOF_CLIENT, spapr_h_vof_client);
+    }
 }
 
 #define DEFAULT_KVM_TYPE "auto"
@@ -3208,6 +3229,28 @@ static void spapr_set_resize_hpt(Object *obj, const char *value, Error **errp)
     }
 }
 
+static bool spapr_get_vof(Object *obj, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    return spapr->vof != NULL;
+}
+
+static void spapr_set_vof(Object *obj, bool value, Error **errp)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(obj);
+
+    if (spapr->vof) {
+        vof_cleanup(spapr->vof);
+        g_free(spapr->vof);
+        spapr->vof = NULL;
+    }
+    if (!value) {
+        return;
+    }
+    spapr->vof = g_malloc0(sizeof(*spapr->vof));
+}
+
 static char *spapr_get_ic_mode(Object *obj, Error **errp)
 {
     SpaprMachineState *spapr = SPAPR_MACHINE(obj);
@@ -3333,6 +3376,11 @@ static void spapr_instance_init(Object *obj)
                                     stringify(KERNEL_LOAD_ADDR)
                                     " for -kernel is the default");
     spapr->kernel_addr = KERNEL_LOAD_ADDR;
+
+    object_property_add_bool(obj, "x-vof", spapr_get_vof, spapr_set_vof);
+    object_property_set_description(obj, "x-vof",
+                                    "Enable Virtual Open Firmware (experimental)");
+
     /* The machine class defines the default interrupt controller mode */
     spapr->irq = smc->irq;
     object_property_add_str(obj, "ic-mode", spapr_get_ic_mode,
@@ -4496,6 +4544,7 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     XICSFabricClass *xic = XICS_FABRIC_CLASS(oc);
     InterruptStatsProviderClass *ispc = INTERRUPT_STATS_PROVIDER_CLASS(oc);
     XiveFabricClass *xfc = XIVE_FABRIC_CLASS(oc);
+    VofMachineIfClass *vmc = VOF_MACHINE_CLASS(oc);
 
     mc->desc = "pSeries Logical Partition (PAPR compliant)";
     mc->ignore_boot_device_suffixes = true;
@@ -4584,6 +4633,9 @@ static void spapr_machine_class_init(ObjectClass *oc, void *data)
     smc->smp_threads_vsmt = true;
     smc->nr_xirqs = SPAPR_NR_XIRQS;
     xfc->match_nvt = spapr_match_nvt;
+    vmc->client_architecture_support = spapr_vof_client_architecture_support;
+    vmc->quiesce = spapr_vof_quiesce;
+    vmc->setprop = spapr_vof_setprop;
 }
 
 static const TypeInfo spapr_machine_info = {
@@ -4603,6 +4655,7 @@ static const TypeInfo spapr_machine_info = {
         { TYPE_XICS_FABRIC },
         { TYPE_INTERRUPT_STATS_PROVIDER },
         { TYPE_XIVE_FABRIC },
+        { TYPE_VOF_MACHINE_IF },
         { }
     },
 };
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index f25014afda..03fc191599 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1080,7 +1080,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     SpaprOptionVector *ov1_guest, *ov5_guest;
     bool guest_radix;
     bool raw_mode_supported = false;
-    bool guest_xive;
+    bool guest_xive, reset_fdt = false;
     CPUState *cs;
     void *fdt;
     uint32_t max_compat = spapr->max_compat_pvr;
@@ -1233,8 +1233,8 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
         spapr_setup_hpt(spapr);
     }
 
-    fdt = spapr_build_fdt(spapr, false, fdt_bufsize);
-
+    reset_fdt = spapr->vof != NULL;
+    fdt = spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
     g_free(spapr->fdt_blob);
     spapr->fdt_size = fdt_totalsize(fdt);
     spapr->fdt_initial_size = spapr->fdt_size;
@@ -1277,6 +1277,25 @@ static target_ulong h_client_architecture_support(PowerPCCPU *cpu,
     return ret;
 }
 
+target_ulong spapr_vof_client_architecture_support(MachineState *ms,
+                                                   CPUState *cs,
+                                                   target_ulong ovec_addr)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
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
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
new file mode 100644
index 0000000000..131a03fec0
--- /dev/null
+++ b/hw/ppc/spapr_vof.c
@@ -0,0 +1,153 @@
+/*
+ * SPAPR machine hooks to Virtual Open Firmware,
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qapi/error.h"
+#include "hw/ppc/spapr.h"
+#include "hw/ppc/spapr_vio.h"
+#include "hw/ppc/fdt.h"
+#include "hw/ppc/vof.h"
+#include "sysemu/sysemu.h"
+#include "qom/qom-qobject.h"
+#include "trace.h"
+
+target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                target_ulong opcode, target_ulong *_args)
+{
+    int ret = vof_client_call(MACHINE(spapr), spapr->vof, spapr->fdt_blob,
+                              ppc64_phys_to_real(_args[0]));
+
+    if (ret) {
+        return H_PARAMETER;
+    }
+    return H_SUCCESS;
+}
+
+void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
+{
+    char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
+    int chosen;
+
+    vof_build_dt(fdt, spapr->vof);
+
+    _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
+    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
+                            spapr->vof->bootargs ? : ""));
+
+    /*
+     * SLOF-less setup requires an open instance of stdout for early
+     * kernel printk. By now all phandles are settled so we can open
+     * the default serial console.
+     */
+    if (stdout_path) {
+        _FDT(vof_client_open_store(fdt, spapr->vof, "/chosen", "stdout",
+                                   stdout_path));
+    }
+}
+
+void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
+                     target_ulong *stack_ptr, Error **errp)
+{
+    Vof *vof = spapr->vof;
+
+    vof_init(vof, spapr->rma_size, errp);
+
+    *stack_ptr = vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
+    if (*stack_ptr == -1) {
+        error_setg(errp, "Memory allocation for stack failed");
+        return;
+    }
+    /* Stack grows downwards plus reserve space for the minimum stack frame */
+    *stack_ptr += VOF_STACK_SIZE - 0x20;
+
+    if (spapr->kernel_size &&
+        vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) == -1) {
+        error_setg(errp, "Memory for kernel is in use");
+        return;
+    }
+
+    if (spapr->initrd_size &&
+        vof_claim(vof, spapr->initrd_base, spapr->initrd_size, 0) == -1) {
+        error_setg(errp, "Memory for initramdisk is in use");
+        return;
+    }
+
+    spapr_vof_client_dt_finalize(spapr, fdt);
+
+    /*
+     * At this point the expected allocation map is:
+     *
+     * 0..c38 - the initial firmware
+     * 8000..10000 - stack
+     * 400000.. - kernel
+     * 3ea0000.. - initramdisk
+     *
+     * We skip writing FDT as nothing expects it; OF client interface is
+     * going to be used for reading the device tree.
+     */
+}
+
+void spapr_vof_quiesce(MachineState *ms)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
+
+    spapr->fdt_size = fdt_totalsize(spapr->fdt_blob);
+    spapr->fdt_initial_size = spapr->fdt_size;
+}
+
+bool spapr_vof_setprop(MachineState *ms, const char *path, const char *propname,
+                       void *val, int vallen)
+{
+    SpaprMachineState *spapr = SPAPR_MACHINE(ms);
+
+    /*
+     * We only allow changing properties which we know how to update in QEMU
+     * OR
+     * the ones which we know that they need to survive during "quiesce".
+     */
+
+    if (strcmp(path, "/rtas") == 0) {
+        if (strcmp(propname, "linux,rtas-base") == 0 ||
+            strcmp(propname, "linux,rtas-entry") == 0) {
+            /* These need to survive quiesce so let them store in the FDT */
+            return true;
+        }
+    }
+
+    if (strcmp(path, "/chosen") == 0) {
+        if (strcmp(propname, "bootargs") == 0) {
+            Vof *vof = spapr->vof;
+
+            g_free(vof->bootargs);
+            vof->bootargs = g_strndup(val, vallen);
+            return true;
+        }
+        if (strcmp(propname, "linux,initrd-start") == 0) {
+            if (vallen == sizeof(uint32_t)) {
+                spapr->initrd_base = ldl_be_p(val);
+                return true;
+            }
+            if (vallen == sizeof(uint64_t)) {
+                spapr->initrd_base = ldq_be_p(val);
+                return true;
+            }
+            return false;
+        }
+        if (strcmp(propname, "linux,initrd-end") == 0) {
+            if (vallen == sizeof(uint32_t)) {
+                spapr->initrd_size = ldl_be_p(val) - spapr->initrd_base;
+                return true;
+            }
+            if (vallen == sizeof(uint64_t)) {
+                spapr->initrd_size = ldq_be_p(val) - spapr->initrd_base;
+                return true;
+            }
+            return false;
+        }
+    }
+
+    return true;
+}
diff --git a/hw/ppc/trace-events b/hw/ppc/trace-events
index 0ba3e40353..6e90a01072 100644
--- a/hw/ppc/trace-events
+++ b/hw/ppc/trace-events
@@ -71,6 +71,30 @@ spapr_rtas_ibm_configure_connector_invalid(uint32_t index) "DRC index: 0x%"PRIx3
 spapr_vio_h_reg_crq(uint64_t reg, uint64_t queue_addr, uint64_t queue_len) "CRQ for dev 0x%" PRIx64 " registered at 0x%" PRIx64 "/0x%" PRIx64
 spapr_vio_free_crq(uint32_t reg) "CRQ for dev 0x%" PRIx32 " freed"
 
+# vof.c
+vof_error_str_truncated(const char *s, int len) "%s truncated to %d"
+vof_error_param(const char *method, int nargscheck, int nretcheck, int nargs, int nret) "%s takes/returns %d/%d, not %d/%d"
+vof_error_unknown_service(const char *service, int nargs, int nret) "\"%s\" args=%d rets=%d"
+vof_error_unknown_method(const char *method) "\"%s\""
+vof_error_unknown_ihandle_close(uint32_t ih) "ih=0x%x"
+vof_error_unknown_path(const char *path) "\"%s\""
+vof_error_write(uint32_t ih) "ih=0x%x"
+vof_finddevice(const char *path, uint32_t ph) "\"%s\" => ph=0x%x"
+vof_claim(uint32_t virt, uint32_t size, uint32_t align, uint32_t ret) "virt=0x%x size=0x%x align=0x%x => 0x%x"
+vof_release(uint32_t virt, uint32_t size, uint32_t ret) "virt=0x%x size=0x%x => 0x%x"
+vof_method(uint32_t ihandle, const char *method, uint32_t param, uint32_t ret, uint32_t ret2) "ih=0x%x \"%s\"(0x%x) => 0x%x 0x%x"
+vof_getprop(uint32_t ph, const char *prop, uint32_t ret, const char *val) "ph=0x%x \"%s\" => len=%d [%s]"
+vof_getproplen(uint32_t ph, const char *prop, uint32_t ret) "ph=0x%x \"%s\" => len=%d"
+vof_setprop(uint32_t ph, const char *prop, const char *val, uint32_t vallen, uint32_t ret) "ph=0x%x \"%s\" [%s] len=%d => ret=%d"
+vof_open(const char *path, uint32_t ph, uint32_t ih) "%s ph=0x%x => ih=0x%x"
+vof_interpret(const char *cmd, uint32_t param1, uint32_t param2, uint32_t ret, uint32_t ret2) "[%s] 0x%x 0x%x => 0x%x 0x%x"
+vof_package_to_path(uint32_t ph, const char *tmp, uint32_t ret) "ph=0x%x => %s len=%d"
+vof_instance_to_path(uint32_t ih, uint32_t ph, const char *tmp, uint32_t ret) "ih=0x%x ph=0x%x => %s len=%d"
+vof_instance_to_package(uint32_t ih, uint32_t ph) "ih=0x%x => ph=0x%x"
+vof_write(uint32_t ih, unsigned cb, const char *msg) "ih=0x%x [%u] \"%s\""
+vof_avail(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
+vof_claimed(uint64_t start, uint64_t end, uint64_t size) "0x%"PRIx64"..0x%"PRIx64" size=0x%"PRIx64
+
 # ppc.c
 ppc_tb_adjust(uint64_t offs1, uint64_t offs2, int64_t diff, int64_t seconds) "adjusted from 0x%"PRIx64" to 0x%"PRIx64", diff %"PRId64" (%"PRId64"s)"
 
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
new file mode 100644
index 0000000000..47c86e394e
--- /dev/null
+++ b/hw/ppc/vof.c
@@ -0,0 +1,1049 @@
+/*
+ * QEMU PowerPC Virtual Open Firmware.
+ *
+ * This implements client interface from OpenFirmware IEEE1275 on the QEMU
+ * side to leave only a very basic firmware in the VM.
+ *
+ * Copyright (c) 2021 IBM Corporation.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+
+#include "qemu/osdep.h"
+#include "qemu-common.h"
+#include "qemu/timer.h"
+#include "qemu/range.h"
+#include "qemu/units.h"
+#include "qemu/log.h"
+#include "qapi/error.h"
+#include "exec/ram_addr.h"
+#include "exec/address-spaces.h"
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
+#define VOF_MAX_PATH        256
+#define VOF_MAX_SETPROPLEN  2048
+#define VOF_MAX_METHODLEN   256
+#define VOF_MAX_FORTHCODE   256
+#define VOF_VTY_BUF_SIZE    256
+
+typedef struct {
+    uint64_t start;
+    uint64_t size;
+} OfClaimed;
+
+typedef struct {
+    char *path; /* the path used to open the instance */
+    uint32_t phandle;
+} OfInstance;
+
+static int readstr(hwaddr pa, char *buf, int size)
+{
+    if (VOF_MEM_READ(pa, buf, size) != MEMTX_OK) {
+        return -1;
+    }
+    if (strnlen(buf, size) == size) {
+        buf[size - 1] = '\0';
+        trace_vof_error_str_truncated(buf, size);
+        return -1;
+    }
+    return 0;
+}
+
+static bool cmpservice(const char *s, unsigned nargs, unsigned nret,
+                       const char *s1, unsigned nargscheck, unsigned nretcheck)
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
+static int get_path(const void *fdt, int offset, char *buf, int len)
+{
+    int ret;
+
+    ret = fdt_get_path(fdt, offset, buf, len - 1);
+    if (ret < 0) {
+        return ret;
+    }
+
+    buf[len - 1] = '\0';
+
+    return strlen(buf) + 1;
+}
+
+static int phandle_to_path(const void *fdt, uint32_t ph, char *buf, int len)
+{
+    int ret;
+
+    ret = fdt_node_offset_by_phandle(fdt, ph);
+    if (ret < 0) {
+        return ret;
+    }
+
+    return get_path(fdt, ret, buf, len);
+}
+
+static int path_offset(const void *fdt, const char *path)
+{
+    g_autofree char *p = NULL;
+    char *at;
+
+    /*
+     * https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html#HDR16
+     *
+     * "Conversion from numeric representation to text representation shall use
+     * the lower case forms of the hexadecimal digits in the range a..f,
+     * suppressing leading zeros".
+     */
+    at = strchr(path, '@');
+    if (!at) {
+        return fdt_path_offset(fdt, path);
+    }
+
+    p = g_strdup(path);
+    for (at = at - path + p + 1; *at; ++at) {
+        *at = tolower(*at);
+    }
+    return fdt_path_offset(fdt, p);
+}
+
+static uint32_t vof_finddevice(const void *fdt, uint32_t nodeaddr)
+{
+    char fullnode[VOF_MAX_PATH];
+    uint32_t ret = -1;
+    int offset;
+
+    if (readstr(nodeaddr, fullnode, sizeof(fullnode))) {
+        return (uint32_t) ret;
+    }
+
+    offset = path_offset(fdt, fullnode);
+    if (offset >= 0) {
+        ret = fdt_get_phandle(fdt, offset);
+    }
+    trace_vof_finddevice(fullnode, ret);
+    return (uint32_t) ret;
+}
+
+static const void *getprop(const void *fdt, int nodeoff, const char *propname,
+                           int *proplen, bool *write0)
+{
+    const char *unit, *prop;
+    const void *ret = fdt_getprop(fdt, nodeoff, propname, proplen);
+
+    if (ret) {
+        if (write0) {
+            *write0 = false;
+        }
+        return ret;
+    }
+
+    if (strcmp(propname, "name")) {
+        return NULL;
+    }
+    /*
+     * We return a value for "name" from path if queried but property does not
+     * exist. @proplen does not include the unit part in this case.
+     */
+    prop = fdt_get_name(fdt, nodeoff, proplen);
+    if (!prop) {
+        *proplen = 0;
+        return NULL;
+    }
+
+    unit = memchr(prop, '@', *proplen);
+    if (unit) {
+        *proplen = unit - prop;
+    }
+    *proplen += 1;
+
+    /*
+     * Since it might be cut at "@" and there will be no trailing zero
+     * in the prop buffer, tell the caller to write zero at the end.
+     */
+    if (write0) {
+        *write0 = true;
+    }
+    return prop;
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
+    bool write0;
+
+    if (nodeoff < 0) {
+        return -1;
+    }
+    if (readstr(pname, propname, sizeof(propname))) {
+        return -1;
+    }
+    prop = getprop(fdt, nodeoff, propname, &proplen, &write0);
+    if (prop) {
+        const char zero = 0;
+        int cb = MIN(proplen, vallen);
+
+        if (VOF_MEM_WRITE(valaddr, prop, cb) != MEMTX_OK ||
+            /* if that was "name" with a unit address, overwrite '@' with '0' */
+            (write0 &&
+             cb == proplen &&
+             VOF_MEM_WRITE(valaddr + cb - 1, &zero, 1) != MEMTX_OK)) {
+            ret = -1;
+        } else {
+            /*
+             * OF1275 says:
+             * "Size is either the actual size of the property, or -1 if name
+             * does not exist", hence returning proplen instead of cb.
+             */
+            ret = proplen;
+            /* Do not format a value if tracepoint is silent, for performance */
+            if (trace_event_get_state(TRACE_VOF_GETPROP) &&
+                qemu_loglevel_mask(LOG_TRACE)) {
+                prop_format(trval, sizeof(trval), prop, ret);
+            }
+        }
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
+    if (nodeoff < 0) {
+        return -1;
+    }
+    if (readstr(pname, propname, sizeof(propname))) {
+        return -1;
+    }
+    prop = getprop(fdt, nodeoff, propname, &proplen, NULL);
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
+static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
+                            uint32_t nodeph, uint32_t pname,
+                            uint32_t valaddr, uint32_t vallen)
+{
+    char propname[OF_PROPNAME_LEN_MAX + 1];
+    uint32_t ret = -1;
+    int offset;
+    char trval[64] = "";
+    char nodepath[VOF_MAX_PATH] = "";
+    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
+    g_autofree char *val = NULL;
+
+    if (vallen > VOF_MAX_SETPROPLEN) {
+        goto trace_exit;
+    }
+    if (readstr(pname, propname, sizeof(propname))) {
+        goto trace_exit;
+    }
+    offset = fdt_node_offset_by_phandle(fdt, nodeph);
+    if (offset < 0) {
+        goto trace_exit;
+    }
+    ret = get_path(fdt, offset, nodepath, sizeof(nodepath));
+    if (ret <= 0) {
+        goto trace_exit;
+    }
+
+    val = g_malloc0(vallen);
+    if (VOF_MEM_READ(valaddr, val, vallen) != MEMTX_OK) {
+        goto trace_exit;
+    }
+
+    if (vmo) {
+        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
+
+        if (vmc->setprop &&
+            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
+            goto trace_exit;
+        }
+    }
+
+    ret = fdt_setprop(fdt, offset, propname, val, vallen);
+    if (ret) {
+        goto trace_exit;
+    }
+
+    if (trace_event_get_state(TRACE_VOF_SETPROP) &&
+        qemu_loglevel_mask(LOG_TRACE)) {
+        prop_format(trval, sizeof(trval), val, vallen);
+    }
+    ret = vallen;
+
+trace_exit:
+    trace_vof_setprop(nodeph, propname, trval, vallen, ret);
+
+    return ret;
+}
+
+static uint32_t vof_nextprop(const void *fdt, uint32_t phandle,
+                             uint32_t prevaddr, uint32_t nameaddr)
+{
+    int offset, nodeoff = fdt_node_offset_by_phandle(fdt, phandle);
+    char prev[OF_PROPNAME_LEN_MAX + 1];
+    const char *tmp;
+
+    if (readstr(prevaddr, prev, sizeof(prev))) {
+        return -1;
+    }
+
+    fdt_for_each_property_offset(offset, fdt, nodeoff) {
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
+            if (VOF_MEM_WRITE(nameaddr, tmp, strlen(tmp) + 1) != MEMTX_OK) {
+                return -1;
+            }
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
+static uint32_t vof_do_open(void *fdt, Vof *vof, int offset, const char *path)
+{
+    uint32_t ret = -1;
+    OfInstance *inst = NULL;
+
+    if (vof->of_instance_last == 0xFFFFFFFF) {
+        /* We do not recycle ihandles yet */
+        goto trace_exit;
+    }
+
+    inst = g_new0(OfInstance, 1);
+    inst->phandle = fdt_get_phandle(fdt, offset);
+    g_assert(inst->phandle);
+    ++vof->of_instance_last;
+
+    inst->path = g_strdup(path);
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
+uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
+                               const char *prop, const char *path)
+{
+    int node = fdt_path_offset(fdt, nodename);
+    int inst, offset;
+
+    offset = fdt_path_offset(fdt, path);
+    if (offset < 0) {
+        trace_vof_error_unknown_path(path);
+        return offset;
+    }
+
+    inst = vof_do_open(fdt, vof, offset, path);
+
+    return fdt_setprop_cell(fdt, node, prop, inst);
+}
+
+static uint32_t vof_open(void *fdt, Vof *vof, uint32_t pathaddr)
+{
+    char path[VOF_MAX_PATH];
+    int offset;
+
+    if (readstr(pathaddr, path, sizeof(path))) {
+        return -1;
+    }
+
+    offset = path_offset(fdt, path);
+    if (offset < 0) {
+        trace_vof_error_unknown_path(path);
+        return offset;
+    }
+
+    return vof_do_open(fdt, vof, offset, path);
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
+    char tmp[VOF_MAX_PATH] = "";
+
+    ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
+    if (ret > 0) {
+        if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
+            ret = -1;
+        }
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
+    char tmp[VOF_MAX_PATH] = "";
+
+    if (phandle != -1) {
+        ret = phandle_to_path(fdt, phandle, tmp, sizeof(tmp));
+        if (ret > 0) {
+            if (VOF_MEM_WRITE(buf, tmp, ret) != MEMTX_OK) {
+                ret = -1;
+            }
+        }
+    }
+    trace_vof_instance_to_path(ihandle, phandle, tmp, ret);
+
+    return ret;
+}
+
+static uint32_t vof_write(Vof *vof, uint32_t ihandle, uint32_t buf,
+                          uint32_t len)
+{
+    char tmp[VOF_VTY_BUF_SIZE];
+    unsigned cb;
+    OfInstance *inst = (OfInstance *)
+        g_hash_table_lookup(vof->of_instances, GINT_TO_POINTER(ihandle));
+
+    if (!inst) {
+        trace_vof_error_write(ihandle);
+        return -1;
+    }
+
+    for ( ; len > 0; len -= cb) {
+        cb = MIN(len, sizeof(tmp) - 1);
+        if (VOF_MEM_READ(buf, tmp, cb) != MEMTX_OK) {
+            return -1;
+        }
+
+        /* FIXME: there is no backend(s) yet so just call a trace */
+        if (trace_event_get_state(TRACE_VOF_WRITE) &&
+            qemu_loglevel_mask(LOG_TRACE)) {
+            tmp[cb] = '\0';
+            trace_vof_write(ihandle, cb, tmp);
+        }
+    }
+
+    return len;
+}
+
+static void vof_claimed_dump(GArray *claimed)
+{
+    int i;
+    OfClaimed c;
+
+    if (trace_event_get_state(TRACE_VOF_CLAIMED) &&
+        qemu_loglevel_mask(LOG_TRACE)) {
+
+        for (i = 0; i < claimed->len; ++i) {
+            c = g_array_index(claimed, OfClaimed, i);
+            trace_vof_claimed(c.start, c.start + c.size, c.size);
+        }
+    }
+}
+
+static bool vof_claim_avail(GArray *claimed, uint64_t virt, uint64_t size)
+{
+    int i;
+    OfClaimed c;
+
+    for (i = 0; i < claimed->len; ++i) {
+        c = g_array_index(claimed, OfClaimed, i);
+        if (ranges_overlap(c.start, c.size, virt, size)) {
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
+    int i, n, offset, proplen = 0, sc, ac;
+    target_ulong mem0_end;
+    const uint8_t *mem0_reg;
+    g_autofree uint8_t *avail = NULL;
+    uint8_t *availcur;
+
+    if (!fdt || !claimed) {
+        return;
+    }
+
+    offset = fdt_path_offset(fdt, "/");
+    _FDT(offset);
+    ac = fdt_address_cells(fdt, offset);
+    g_assert(ac == 1 || ac == 2);
+    sc = fdt_size_cells(fdt, offset);
+    g_assert(sc == 1 || sc == 2);
+
+    offset = fdt_path_offset(fdt, "/memory@0");
+    _FDT(offset);
+
+    mem0_reg = fdt_getprop(fdt, offset, "reg", &proplen);
+    g_assert(mem0_reg && proplen == sizeof(uint32_t) * (ac + sc));
+    if (sc == 2) {
+        mem0_end = be64_to_cpu(*(uint64_t *)(mem0_reg + sizeof(uint32_t) * ac));
+    } else {
+        mem0_end = be32_to_cpu(*(uint32_t *)(mem0_reg + sizeof(uint32_t) * ac));
+    }
+
+    g_array_sort(claimed, of_claimed_compare_func);
+    vof_claimed_dump(claimed);
+
+    /*
+     * VOF resides in the first page so we do not need to check if there is
+     * available memory before the first claimed block
+     */
+    g_assert(claimed->len && (g_array_index(claimed, OfClaimed, 0).start == 0));
+
+    avail = g_malloc0(sizeof(uint32_t) * (ac + sc) * claimed->len);
+    for (i = 0, n = 0, availcur = avail; i < claimed->len; ++i) {
+        OfClaimed c = g_array_index(claimed, OfClaimed, i);
+        uint64_t start, size;
+
+        start = c.start + c.size;
+        if (i < claimed->len - 1) {
+            OfClaimed cn = g_array_index(claimed, OfClaimed, i + 1);
+
+            size = cn.start - start;
+        } else {
+            size = mem0_end - start;
+        }
+
+        if (ac == 2) {
+            *(uint64_t *) availcur = cpu_to_be64(start);
+        } else {
+            *(uint32_t *) availcur = cpu_to_be32(start);
+        }
+        availcur += sizeof(uint32_t) * ac;
+        if (sc == 2) {
+            *(uint64_t *) availcur = cpu_to_be64(size);
+        } else {
+            *(uint32_t *) availcur = cpu_to_be32(size);
+        }
+        availcur += sizeof(uint32_t) * sc;
+
+        if (size) {
+            trace_vof_avail(c.start + c.size, c.start + c.size + size, size);
+            ++n;
+        }
+    }
+    _FDT((fdt_setprop(fdt, offset, "available", avail, availcur - avail)));
+}
+
+/*
+ * OF1275:
+ * "Allocates size bytes of memory. If align is zero, the allocated range
+ * begins at the virtual address virt. Otherwise, an aligned address is
+ * automatically chosen and the input argument virt is ignored".
+ *
+ * In other words, exactly one of @virt and @align is non-zero.
+ */
+uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size,
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
+        vof->claimed_base = QEMU_ALIGN_UP(vof->claimed_base, align);
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
+static void vof_instantiate_rtas(Error **errp)
+{
+    error_setg(errp, "The firmware should have instantiated RTAS");
+}
+
+static uint32_t vof_call_method(MachineState *ms, Vof *vof, uint32_t methodaddr,
+                                uint32_t ihandle, uint32_t param1,
+                                uint32_t param2, uint32_t param3,
+                                uint32_t param4, uint32_t *ret2)
+{
+    uint32_t ret = -1;
+    char method[VOF_MAX_METHODLEN] = "";
+    OfInstance *inst;
+
+    if (!ihandle) {
+        goto trace_exit;
+    }
+
+    inst = (OfInstance *)g_hash_table_lookup(vof->of_instances,
+                                             GINT_TO_POINTER(ihandle));
+    if (!inst) {
+        goto trace_exit;
+    }
+
+    if (readstr(methodaddr, method, sizeof(method))) {
+        goto trace_exit;
+    }
+
+    if (strcmp(inst->path, "/") == 0) {
+        if (strcmp(method, "ibm,client-architecture-support") == 0) {
+            Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
+
+            if (vmo) {
+                VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
+
+                g_assert(vmc->client_architecture_support);
+                ret = vmc->client_architecture_support(ms, first_cpu, param1);
+            }
+
+            *ret2 = 0;
+        }
+    } else if (strcmp(inst->path, "/rtas") == 0) {
+        if (strcmp(method, "instantiate-rtas") == 0) {
+            vof_instantiate_rtas(&error_fatal);
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
+    char cmd[VOF_MAX_FORTHCODE] = "";
+
+    /* No interpret implemented so just call a trace */
+    readstr(cmdaddr, cmd, sizeof(cmd));
+    trace_vof_interpret(cmd, param1, param2, ret, *ret2);
+
+    return ret;
+}
+
+static void vof_quiesce(MachineState *ms, void *fdt, Vof *vof)
+{
+    Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
+    /* After "quiesce", no change is expected to the FDT, pack FDT to ensure */
+    int rc = fdt_pack(fdt);
+
+    assert(rc == 0);
+
+    if (vmo) {
+        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
+
+        if (vmc->quiesce) {
+            vmc->quiesce(ms);
+        }
+    }
+
+    vof_claimed_dump(vof->claimed);
+}
+
+static uint32_t vof_client_handle(MachineState *ms, void *fdt, Vof *vof,
+                                  const char *service,
+                                  uint32_t *args, unsigned nargs,
+                                  uint32_t *rets, unsigned nrets)
+{
+    uint32_t ret = 0;
+
+    /* @nrets includes the value which this function returns */
+#define cmpserv(s, a, r) \
+    cmpservice(service, nargs, nrets, (s), (a), (r))
+
+    if (cmpserv("finddevice", 1, 1)) {
+        ret = vof_finddevice(fdt, args[0]);
+    } else if (cmpserv("getprop", 4, 1)) {
+        ret = vof_getprop(fdt, args[0], args[1], args[2], args[3]);
+    } else if (cmpserv("getproplen", 2, 1)) {
+        ret = vof_getproplen(fdt, args[0], args[1]);
+    } else if (cmpserv("setprop", 4, 1)) {
+        ret = vof_setprop(ms, fdt, vof, args[0], args[1], args[2], args[3]);
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
+    } else if (cmpserv("write", 3, 1)) {
+        ret = vof_write(vof, args[0], args[1], args[2]);
+    } else if (cmpserv("claim", 3, 1)) {
+        ret = vof_claim(vof, args[0], args[1], args[2]);
+        if (ret != -1) {
+            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
+        }
+    } else if (cmpserv("release", 2, 0)) {
+        ret = vof_release(vof, args[0], args[1]);
+        if (ret != -1) {
+            vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
+        }
+    } else if (cmpserv("call-method", 0, 0)) {
+        ret = vof_call_method(ms, vof, args[0], args[1], args[2], args[3],
+                              args[4], args[5], rets);
+    } else if (cmpserv("interpret", 0, 0)) {
+        ret = vof_call_interpret(args[0], args[1], args[2], rets);
+    } else if (cmpserv("milliseconds", 0, 1)) {
+        ret = qemu_clock_get_ms(QEMU_CLOCK_VIRTUAL);
+    } else if (cmpserv("quiesce", 0, 0)) {
+        vof_quiesce(ms, fdt, vof);
+    } else if (cmpserv("exit", 0, 0)) {
+        error_report("Stopped as the VM requested \"exit\"");
+        vm_stop(RUN_STATE_PAUSED);
+    } else {
+        trace_vof_error_unknown_service(service, nargs, nrets);
+        ret = -1;
+    }
+
+    return ret;
+}
+
+/* Defined as Big Endian */
+struct prom_args {
+    uint32_t service;
+    uint32_t nargs;
+    uint32_t nret;
+    uint32_t args[10];
+} QEMU_PACKED;
+
+int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
+                    target_ulong args_real)
+{
+    struct prom_args args_be;
+    uint32_t args[ARRAY_SIZE(args_be.args)];
+    uint32_t rets[ARRAY_SIZE(args_be.args)] = { 0 }, ret;
+    char service[64];
+    unsigned nargs, nret, i;
+
+    if (VOF_MEM_READ(args_real, &args_be, sizeof(args_be)) != MEMTX_OK) {
+        return -EINVAL;
+    }
+    nargs = be32_to_cpu(args_be.nargs);
+    if (nargs >= ARRAY_SIZE(args_be.args)) {
+        return -EINVAL;
+    }
+
+    if (VOF_MEM_READ(be32_to_cpu(args_be.service), service, sizeof(service)) !=
+        MEMTX_OK) {
+        return -EINVAL;
+    }
+    if (strnlen(service, sizeof(service)) == sizeof(service)) {
+        /* Too long service name */
+        return -EINVAL;
+    }
+
+    for (i = 0; i < nargs; ++i) {
+        args[i] = be32_to_cpu(args_be.args[i]);
+    }
+
+    nret = be32_to_cpu(args_be.nret);
+    ret = vof_client_handle(ms, fdt, vof, service, args, nargs, rets, nret);
+    if (!nret) {
+        return 0;
+    }
+
+    args_be.args[nargs] = cpu_to_be32(ret);
+    for (i = 1; i < nret; ++i) {
+        args_be.args[nargs + i] = cpu_to_be32(rets[i - 1]);
+    }
+
+    if (VOF_MEM_WRITE(args_real + offsetof(struct prom_args, args[nargs]),
+                      args_be.args + nargs, sizeof(args_be.args[0]) * nret) !=
+        MEMTX_OK) {
+        return -EINVAL;
+    }
+
+    return 0;
+}
+
+static void vof_instance_free(gpointer data)
+{
+    OfInstance *inst = (OfInstance *)data;
+
+    g_free(inst->path);
+    g_free(inst);
+}
+
+void vof_init(Vof *vof, uint64_t top_addr, Error **errp)
+{
+    vof_cleanup(vof);
+
+    vof->of_instances = g_hash_table_new_full(g_direct_hash, g_direct_equal,
+                                              NULL, vof_instance_free);
+    vof->claimed = g_array_new(false, false, sizeof(OfClaimed));
+
+    /* Keep allocations in 32bit as CLI ABI can only return cells==32bit */
+    vof->top_addr = MIN(top_addr, 4 * GiB);
+    if (vof_claim(vof, 0, vof->fw_size, 0) == -1) {
+        error_setg(errp, "Memory for firmware is in use");
+    }
+}
+
+void vof_cleanup(Vof *vof)
+{
+    if (vof->claimed) {
+        g_array_unref(vof->claimed);
+    }
+    if (vof->of_instances) {
+        g_hash_table_unref(vof->of_instances);
+    }
+    vof->claimed = NULL;
+    vof->of_instances = NULL;
+}
+
+void vof_build_dt(void *fdt, Vof *vof)
+{
+    uint32_t phandle = fdt_get_max_phandle(fdt);
+    int offset, proplen = 0;
+    const void *prop;
+
+    /* Assign phandles to nodes without predefined phandles (like XICS/XIVE) */
+    for (offset = fdt_next_node(fdt, -1, NULL);
+         offset >= 0;
+         offset = fdt_next_node(fdt, offset, NULL)) {
+        prop = fdt_getprop(fdt, offset, "phandle", &proplen);
+        if (prop) {
+            continue;
+        }
+        ++phandle;
+        _FDT(fdt_setprop_cell(fdt, offset, "phandle", phandle));
+    }
+
+    vof_dt_memory_available(fdt, vof->claimed, vof->claimed_base);
+}
+
+static const TypeInfo vof_machine_if_info = {
+    .name = TYPE_VOF_MACHINE_IF,
+    .parent = TYPE_INTERFACE,
+    .class_size = sizeof(VofMachineIfClass),
+};
+
+static void vof_machine_if_register_types(void)
+{
+    type_register_static(&vof_machine_if_info);
+}
+type_init(vof_machine_if_register_types)
diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index 5697327e4c..1e63f33e9a 100644
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
+    Vof *vof;
     uint64_t rtc_offset; /* Now used only during incoming migration */
     struct PPCTimebase tb;
     bool has_graphics;
@@ -558,7 +560,9 @@ struct SpaprMachineState {
 /* Client Architecture support */
 #define KVMPPC_H_CAS            (KVMPPC_HCALL_BASE + 0x2)
 #define KVMPPC_H_UPDATE_DT      (KVMPPC_HCALL_BASE + 0x3)
-#define KVMPPC_HCALL_MAX        KVMPPC_H_UPDATE_DT
+/* 0x4 was used for KVMPPC_H_UPDATE_PHANDLE in SLOF */
+#define KVMPPC_H_VOF_CLIENT     (KVMPPC_HCALL_BASE + 0x5)
+#define KVMPPC_HCALL_MAX        KVMPPC_H_VOF_CLIENT
 
 /*
  * The hcall range 0xEF00 to 0xEF80 is reserved for use in facilitating
@@ -956,4 +960,17 @@ bool spapr_check_pagesize(SpaprMachineState *spapr, hwaddr pagesize,
 void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
 hwaddr spapr_get_rtas_addr(void);
 bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
+
+void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
+                     target_ulong *stack_ptr, Error **errp);
+void spapr_vof_quiesce(MachineState *ms);
+bool spapr_vof_setprop(MachineState *ms, const char *path, const char *propname,
+                       void *val, int vallen);
+target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
+                                target_ulong opcode, target_ulong *args);
+target_ulong spapr_vof_client_architecture_support(MachineState *ms,
+                                                   CPUState *cs,
+                                                   target_ulong ovec_addr);
+void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt);
+
 #endif /* HW_SPAPR_H */
diff --git a/include/hw/ppc/vof.h b/include/hw/ppc/vof.h
new file mode 100644
index 0000000000..640be46163
--- /dev/null
+++ b/include/hw/ppc/vof.h
@@ -0,0 +1,58 @@
+/*
+ * Virtual Open Firmware
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef HW_VOF_H
+#define HW_VOF_H
+
+typedef struct Vof {
+    uint64_t top_addr; /* copied from rma_size */
+    GArray *claimed; /* array of SpaprOfClaimed */
+    uint64_t claimed_base;
+    GHashTable *of_instances; /* ihandle -> SpaprOfInstance */
+    uint32_t of_instance_last;
+    char *bootargs;
+    long fw_size;
+} Vof;
+
+int vof_client_call(MachineState *ms, Vof *vof, void *fdt,
+                    target_ulong args_real);
+uint64_t vof_claim(Vof *vof, uint64_t virt, uint64_t size, uint64_t align);
+void vof_init(Vof *vof, uint64_t top_addr, Error **errp);
+void vof_cleanup(Vof *vof);
+void vof_build_dt(void *fdt, Vof *vof);
+uint32_t vof_client_open_store(void *fdt, Vof *vof, const char *nodename,
+                               const char *prop, const char *path);
+
+#define TYPE_VOF_MACHINE_IF "vof-machine-if"
+
+typedef struct VofMachineIfClass VofMachineIfClass;
+DECLARE_CLASS_CHECKERS(VofMachineIfClass, VOF_MACHINE, TYPE_VOF_MACHINE_IF)
+
+struct VofMachineIfClass {
+    InterfaceClass parent;
+    target_ulong (*client_architecture_support)(MachineState *ms, CPUState *cs,
+                                                target_ulong vec);
+    void (*quiesce)(MachineState *ms);
+    bool (*setprop)(MachineState *ms, const char *path, const char *propname,
+                    void *val, int vallen);
+};
+
+/*
+ * Initial stack size is from
+ * https://www.devicetree.org/open-firmware/bindings/ppc/release/ppc-2_1.html#REF27292
+ *
+ * "Client programs shall be invoked with a valid stack pointer (r1) with
+ * at least 32K bytes of memory available for stack growth".
+ */
+#define VOF_STACK_SIZE       0x8000
+
+#define VOF_MEM_READ(pa, buf, size) \
+    address_space_read(&address_space_memory, \
+    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
+#define VOF_MEM_WRITE(pa, buf, size) \
+    address_space_write(&address_space_memory, \
+    (pa), MEMTXATTRS_UNSPECIFIED, (buf), (size))
+
+#endif /* HW_VOF_H */
diff --git a/pc-bios/README b/pc-bios/README
index c101c9a04f..d344e3bc1b 100644
--- a/pc-bios/README
+++ b/pc-bios/README
@@ -16,6 +16,10 @@
   https://github.com/aik/SLOF, and the image currently in qemu is
   built from git tag qemu-slof-20210217.
 
+- VOF (Virtual Open Firmware) is a minimalistic firmware to work with
+  -machine pseries,x-vof=on. When enabled, the firmware acts as a slim shim and
+  QEMU implements parts of the IEEE 1275 Open Firmware interface.
+
 - sgabios (the Serial Graphics Adapter option ROM) provides a means for
   legacy x86 software to communicate with an attached serial console as
   if a video card were attached.  The master sources reside in a subversion
diff --git a/pc-bios/vof-nvram.bin b/pc-bios/vof-nvram.bin
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

diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
new file mode 100755
index 0000000000000000000000000000000000000000..1ec670be82134adcb5ae128732aff6e371281360
GIT binary patch
literal 3784
zcmeHIL1-Lh6n>lC=%gLW9QLr#l}v1e-6f$B_K?xg-PA2?k`e+EC^WLWX18WB$*##L
zqwKgdDcGd6vY{31LDNGBdJsJHpr=+43D`ppJ*-fhdMkMGXwf=;Z|0vS*)$~>4}u-|
znVJ88^S<}K_ue-||L<!cO_V?RF=dHv`_EUqoW_-3XsZ68Z7oY}m-C>g{vfz^9((;=
zR2{WQtrd?N131V}{??u$da-4X{5^achQIqYsco$hpzbT*Q3SrDwbWtb<O;Rd*W1=o
z_bBk{z02W7outMJ$&H(&Sap)E6;kXI7MU-N7<P&zGag(UwL)DSk5(tuI!vLOgt&fm
zen0=K^QT!jYj7O<!@IOvD<3tMQzUCD5$;lL=@`F<#k*p09GetIED~aovlM!0eQ1TU
z6#Q}@F>HvOlgK%SoO^cXd?|*UBR(E-jM#A^vwOq<4r<c=3CGyeK{U9)aXJp_bXVBP
z!VdAY&pg5I27E|}^$q4#OOeuli$ct$^|>W;PMn9Gb2(NRw{|F-PFs(0bb%9Qj!*~J
zMtsklfRFZNVH1L%$aq|N#Y_x`wK#mF!RZi@e~!HX+t|YtwmXGw%(G=X=D<8QVxX>l
z2dnGFJDe|YCH6Ps{Pq5JZV<OL;ygOFkNWkA`rSeO)=|IPyX$vx3Rq{*vlHmqd}EWQ
z8xB>MJ4pv;#&V8o>5r(pnIfy1qs3;O8qF2@w0V=RH#g~vrbA!<)JfkU)-x{0DVo4t
z!FwKe?!(}<6s4IP+y_y^CiXM9^LbYE4eCh6CD_F}==njLy1{dn-?a`3j7!g*xYkK&
zzc#RC{~2wFLWnP8do_~yT<Zj9UQHBHJBjNCED1iD(+Ttl4O-6CZP-biP2f!8+Pi*W
zEBZj$)(5S=^1|2m$Vc{S^~YD7JNJ9qCYAA8{c)cn2Z`}Tzib?=Ulv!nU;3{T^;<-k
znaJrMUS2@o1oHH6=*(h<{X<6>BLIv5FrpsDqtCcEMIHy#vkP|_$JbBvVi^4KtSOcQ
zE#1No0bdpPFYFWlmY9VMW}zRmFtB?TE?B^i0lx>c&<Fe^a0op9%yFT{tUrp-kB~Qq
zPMq=4w@P|}deBFTU8k@)b(Zy>-;?I4*A3P=Gx!>2`Qf)*dr_D4Q|i9q>n*T-edRfc
z!tYierf}x<cLe*9CG?itdkYS0tg9caN3H)B_;&waKHu=0Wcwv=mSpzhYUu*ncqg7L
z@MPCs;6d9tF84cuf5Xqyw=)y&KhU)?<6~of&$Pt0BX86qidyg-MKQyS8R1!mZ`KG|
zOSrS`#==?w-IA7up*3C}sy5^}%Q;fr|Bvl#@b?0@m6N@2T|6HjxMO(U#S`-97$xSd
zHBX=0$2x>OwsF`R<LWkD*k6n}m-~qL_caiQ3T~pTU%0#b&{Xb6Rf{_g@9~+diCcTF
zJ##E{Q9;~&9>?I&<6hD_@Vt{_MdYHumUUSbnz)YdSyOlLx7+tq>$j(G_WMujh?u<j
z83Jz3{U=1nhw*=Ta=$e9!hx(lyPh%dpJX7BNT{O~_038}SM|c&TP0n^)*+fKOi%aD
zl=P`ek;=34dSO;C7xYr^oL-pcM2?FGzV*(RKPX|ZWR!J2J6E197EAAyC$R~K)wxQQ
zj!#Zi=1a5mPHE=d9!BeZyEHdjnr3^VfJ}5m!HQueu`qf^#;~8qI*sQEtRhww%fPb!
E2HT5NwEzGB

literal 0
HcmV?d00001

diff --git a/pc-bios/vof/Makefile b/pc-bios/vof/Makefile
new file mode 100644
index 0000000000..aa1678c4d8
--- /dev/null
+++ b/pc-bios/vof/Makefile
@@ -0,0 +1,23 @@
+all: build-all
+
+build-all: vof.bin
+
+CROSS ?=
+CC = $(CROSS)gcc
+LD = $(CROSS)ld
+OBJCOPY = $(CROSS)objcopy
+
+%.o: %.S
+	$(CC) -m32 -mbig-endian -mcpu=power4 -c -o $@ $<
+
+%.o: %.c
+	$(CC) -m32 -mbig-endian -mcpu=power4 -c -fno-stack-protector -o $@ $<
+
+vof.elf: entry.o main.o ci.o bootmem.o libc.o
+	$(LD) -nostdlib -e_start -Tvof.lds -EB -o $@ $^
+
+%.bin: %.elf
+	$(OBJCOPY) -O binary -j .text -j .data -j .toc -j .got2 $^ $@
+
+clean:
+	rm -f *.o vof.bin vof.elf *~
diff --git a/pc-bios/vof/bootmem.c b/pc-bios/vof/bootmem.c
new file mode 100644
index 0000000000..771b9e95f9
--- /dev/null
+++ b/pc-bios/vof/bootmem.c
@@ -0,0 +1,14 @@
+#include "vof.h"
+
+void boot_from_memory(uint64_t initrd, uint64_t initrdsize)
+{
+    uint64_t kern[2];
+    phandle chosen = ci_finddevice("/chosen");
+
+    if (ci_getprop(chosen, "qemu,boot-kernel", kern, sizeof(kern)) !=
+        sizeof(kern)) {
+        return;
+    }
+
+    do_boot(kern[0], initrd, initrdsize);
+}
diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
new file mode 100644
index 0000000000..2b56050238
--- /dev/null
+++ b/pc-bios/vof/ci.c
@@ -0,0 +1,91 @@
+#include "vof.h"
+
+struct prom_args {
+    uint32_t service;
+    uint32_t nargs;
+    uint32_t nret;
+    uint32_t args[10];
+};
+
+typedef unsigned long prom_arg_t;
+
+#define ADDR(x) (uint32_t)(x)
+
+static int prom_handle(struct prom_args *pargs)
+{
+    void *rtasbase;
+    uint32_t rtassize = 0;
+    phandle rtas;
+
+    if (strcmp("call-method", (void *)(unsigned long)pargs->service)) {
+        return -1;
+    }
+
+    if (strcmp("instantiate-rtas", (void *)(unsigned long)pargs->args[0])) {
+        return -1;
+    }
+
+    rtas = ci_finddevice("/rtas");
+    /* rtas-size is set by QEMU depending of FWNMI support */
+    ci_getprop(rtas, "rtas-size", &rtassize, sizeof(rtassize));
+    if (rtassize < hv_rtas_size) {
+        return -1;
+    }
+
+    rtasbase = (void *)(unsigned long) pargs->args[2];
+
+    memcpy(rtasbase, hv_rtas, hv_rtas_size);
+    pargs->args[pargs->nargs] = 0;
+    pargs->args[pargs->nargs + 1] = pargs->args[2];
+
+    return 0;
+}
+
+void prom_entry(uint32_t args)
+{
+    if (prom_handle((void *)(unsigned long) args)) {
+        ci_entry(args);
+    }
+}
+
+static int call_ci(const char *service, int nargs, int nret, ...)
+{
+    int i;
+    struct prom_args args;
+    va_list list;
+
+    args.service = ADDR(service);
+    args.nargs = nargs;
+    args.nret = nret;
+
+    va_start(list, nret);
+    for (i = 0; i < nargs; i++) {
+        args.args[i] = va_arg(list, prom_arg_t);
+    }
+    va_end(list);
+
+    for (i = 0; i < nret; i++) {
+        args.args[nargs + i] = 0;
+    }
+
+    if (ci_entry((uint32_t)(&args)) < 0) {
+        return PROM_ERROR;
+    }
+
+    return (nret > 0) ? args.args[nargs] : 0;
+}
+
+void ci_panic(const char *str)
+{
+    call_ci("exit", 0, 0);
+}
+
+phandle ci_finddevice(const char *path)
+{
+    return call_ci("finddevice", 1, 1, path);
+}
+
+uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len)
+{
+    return call_ci("getprop", 4, 1, ph, propname, prop, len);
+}
diff --git a/pc-bios/vof/entry.S b/pc-bios/vof/entry.S
new file mode 100644
index 0000000000..10a101fb6d
--- /dev/null
+++ b/pc-bios/vof/entry.S
@@ -0,0 +1,49 @@
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
+	LOAD32(2, __toc_start)
+	b entry_c
+
+ENTRY(_prom_entry)
+	LOAD32(2, __toc_start)
+	stwu    %r1,-112(%r1)
+	stw     %r31,104(%r1)
+	mflr    %r31
+	bl prom_entry
+	nop
+	mtlr    %r31
+	lwz     %r31,104(%r1)
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
diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
new file mode 100644
index 0000000000..00c10e6e7d
--- /dev/null
+++ b/pc-bios/vof/libc.c
@@ -0,0 +1,92 @@
+#include "vof.h"
+
+int strlen(const char *s)
+{
+    int len = 0;
+
+    while (*s != 0) {
+        len += 1;
+        s += 1;
+    }
+
+    return len;
+}
+
+int strcmp(const char *s1, const char *s2)
+{
+    while (*s1 != 0 && *s2 != 0) {
+        if (*s1 != *s2) {
+            break;
+        }
+        s1 += 1;
+        s2 += 1;
+    }
+
+    return *s1 - *s2;
+}
+
+void *memcpy(void *dest, const void *src, size_t n)
+{
+    char *cdest;
+    const char *csrc = src;
+
+    cdest = dest;
+    while (n-- > 0) {
+        *cdest++ = *csrc++;
+    }
+
+    return dest;
+}
+
+int memcmp(const void *ptr1, const void *ptr2, size_t n)
+{
+    const unsigned char *p1 = ptr1;
+    const unsigned char *p2 = ptr2;
+
+    while (n-- > 0) {
+        if (*p1 != *p2) {
+            return *p1 - *p2;
+        }
+        p1 += 1;
+        p2 += 1;
+    }
+
+    return 0;
+}
+
+void *memmove(void *dest, const void *src, size_t n)
+{
+    char *cdest;
+    const char *csrc;
+    int i;
+
+    /* Do the buffers overlap in a bad way? */
+    if (src < dest && src + n >= dest) {
+        /* Copy from end to start */
+        cdest = dest + n - 1;
+        csrc = src + n - 1;
+        for (i = 0; i < n; i++) {
+            *cdest-- = *csrc--;
+        }
+    } else {
+        /* Normal copy is possible */
+        cdest = dest;
+        csrc = src;
+        for (i = 0; i < n; i++) {
+            *cdest++ = *csrc++;
+        }
+    }
+
+    return dest;
+}
+
+void *memset(void *dest, int c, size_t size)
+{
+    unsigned char *d = (unsigned char *)dest;
+
+    while (size-- > 0) {
+        *d++ = (unsigned char)c;
+    }
+
+    return dest;
+}
diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
new file mode 100644
index 0000000000..9fc30d2d09
--- /dev/null
+++ b/pc-bios/vof/main.c
@@ -0,0 +1,21 @@
+#include "vof.h"
+
+void do_boot(unsigned long addr, unsigned long _r3, unsigned long _r4)
+{
+    register unsigned long r3 __asm__("r3") = _r3;
+    register unsigned long r4 __asm__("r4") = _r4;
+    register unsigned long r5 __asm__("r5") = (unsigned long) _prom_entry;
+
+    ((client *)(uint32_t)addr)();
+}
+
+void entry_c(void)
+{
+    register unsigned long r3 __asm__("r3");
+    register unsigned long r4 __asm__("r4");
+    register unsigned long r5 __asm__("r5");
+    uint64_t initrd = r3, initrdsize = r4;
+
+    boot_from_memory(initrd, initrdsize);
+    ci_panic("*** No boot target ***\n");
+}
diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
new file mode 100644
index 0000000000..2d89580769
--- /dev/null
+++ b/pc-bios/vof/vof.h
@@ -0,0 +1,43 @@
+/*
+ * Virtual Open Firmware
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include <stdarg.h>
+
+typedef unsigned char uint8_t;
+typedef unsigned short uint16_t;
+typedef unsigned long uint32_t;
+typedef unsigned long long uint64_t;
+#define NULL (0)
+#define PROM_ERROR (-1u)
+typedef unsigned long ihandle;
+typedef unsigned long phandle;
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
+/* CI wrappers */
+void ci_panic(const char *str);
+phandle ci_finddevice(const char *path);
+uint32_t ci_getprop(phandle ph, const char *propname, void *prop, int len);
+
+/* booting from -kernel */
+void boot_from_memory(uint64_t initrd, uint64_t initrdsize);
+
+/* Entry points for CI and RTAS */
+extern uint32_t ci_entry(uint32_t params);
+extern unsigned long hv_rtas(unsigned long params);
+extern unsigned int hv_rtas_size;
diff --git a/pc-bios/vof/vof.lds b/pc-bios/vof/vof.lds
new file mode 100644
index 0000000000..1506ab4b01
--- /dev/null
+++ b/pc-bios/vof/vof.lds
@@ -0,0 +1,48 @@
+OUTPUT_FORMAT("elf32-powerpc")
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
diff --git a/tests/qtest/rtas-test.c b/tests/qtest/rtas-test.c
index 16751dbd2f..5f1194a6eb 100644
--- a/tests/qtest/rtas-test.c
+++ b/tests/qtest/rtas-test.c
@@ -5,7 +5,7 @@
 #include "libqos/libqos-spapr.h"
 #include "libqos/rtas.h"
 
-static void test_rtas_get_time_of_day(void)
+static void run_test_rtas_get_time_of_day(const char *machine)
 {
     QOSState *qs;
     struct tm tm;
@@ -13,7 +13,7 @@ static void test_rtas_get_time_of_day(void)
     uint64_t ret;
     time_t t1, t2;
 
-    qs = qtest_spapr_boot("-machine pseries");
+    qs = qtest_spapr_boot(machine);
 
     t1 = time(NULL);
     ret = qrtas_get_time_of_day(qs->qts, &qs->alloc, &tm, &ns);
@@ -24,6 +24,16 @@ static void test_rtas_get_time_of_day(void)
     qtest_shutdown(qs);
 }
 
+static void test_rtas_get_time_of_day(void)
+{
+    run_test_rtas_get_time_of_day("-machine pseries");
+}
+
+static void test_rtas_get_time_of_day_vof(void)
+{
+    run_test_rtas_get_time_of_day("-machine pseries,x-vof=on");
+}
+
 int main(int argc, char *argv[])
 {
     const char *arch = qtest_get_arch();
@@ -35,6 +45,7 @@ int main(int argc, char *argv[])
         exit(EXIT_FAILURE);
     }
     qtest_add_func("rtas/get-time-of-day", test_rtas_get_time_of_day);
+    qtest_add_func("rtas/get-time-of-day-vof", test_rtas_get_time_of_day_vof);
 
     return g_test_run();
 }
-- 
2.31.1


