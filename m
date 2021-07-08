Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ABF63BF5E3
	for <lists+qemu-devel@lfdr.de>; Thu,  8 Jul 2021 08:57:47 +0200 (CEST)
Received: from localhost ([::1]:43772 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m1Nyj-0003In-Sr
	for lists+qemu-devel@lfdr.de; Thu, 08 Jul 2021 02:57:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56188)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <aik@ozlabs.ru>)
 id 1m1Nxf-0002UO-0y; Thu, 08 Jul 2021 02:56:39 -0400
Received: from ozlabs.ru ([107.174.27.60]:39756)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <aik@ozlabs.ru>)
 id 1m1Nxb-0008F7-Ri; Thu, 08 Jul 2021 02:56:38 -0400
Received: from fstn1-p1.ozlabs.ibm.com. (localhost [IPv6:::1])
 by ozlabs.ru (Postfix) with ESMTP id 99521AE801D4;
 Thu,  8 Jul 2021 02:56:28 -0400 (EDT)
From: Alexey Kardashevskiy <aik@ozlabs.ru>
To: qemu-ppc@nongnu.org
Subject: [PATCH qemu v23] spapr: Fix implementation of Open Firmware client
 interface
Date: Thu,  8 Jul 2021 16:56:25 +1000
Message-Id: <20210708065625.548396-1-aik@ozlabs.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
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
Cc: Alexey Kardashevskiy <aik@ozlabs.ru>,
 David Gibson <david@gibson.dropbear.id.au>, qemu-devel@nongnu.org,
 Greg Kurz <groug@kaod.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This addresses the comments from v22.

The functional changes are (the VOF ones need retesting with Pegasos2):

(VOF) setprop will start failing if the machine class callback
did not handle it;
(VOF) unit addresses are lowered in path_offset();
(SPAPR) /chosen/bootargs is initialized from kernel_cmdline if
the client did not change it.

Fixes: 5c991e5d4378 ("spapr: Implement Open Firmware client interface")
Cc: BALATON Zoltan <balaton@eik.bme.hu>
Signed-off-by: Alexey Kardashevskiy <aik@ozlabs.ru>
---
 include/hw/ppc/spapr.h |   3 +--
 pc-bios/vof/vof.h      |   2 --
 hw/ppc/spapr.c         |  10 +---------
 hw/ppc/spapr_hcall.c   |   5 ++---
 hw/ppc/spapr_vof.c     |  32 +++++++++++++++++++++++---------
 hw/ppc/vof.c           |  30 +++++++++++++++++-------------
 pc-bios/vof/ci.c       |   2 +-
 pc-bios/vof/libc.c     |  26 --------------------------
 pc-bios/vof/main.c     |   2 +-
 MAINTAINERS            |   4 ++--
 pc-bios/vof.bin        | Bin 3784 -> 3456 bytes
 11 files changed, 48 insertions(+), 68 deletions(-)

diff --git a/include/hw/ppc/spapr.h b/include/hw/ppc/spapr.h
index a25e69fe4cf4..779f707fb8b9 100644
--- a/include/hw/ppc/spapr.h
+++ b/include/hw/ppc/spapr.h
@@ -964,8 +964,7 @@ void spapr_set_all_lpcrs(target_ulong value, target_ulong mask);
 hwaddr spapr_get_rtas_addr(void);
 bool spapr_memory_hot_unplug_supported(SpaprMachineState *spapr);
 
-void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
-                     target_ulong *stack_ptr, Error **errp);
+void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp);
 void spapr_vof_quiesce(MachineState *ms);
 bool spapr_vof_setprop(MachineState *ms, const char *path, const char *propname,
                        void *val, int vallen);
diff --git a/pc-bios/vof/vof.h b/pc-bios/vof/vof.h
index 2d8958076907..5f12c077f513 100644
--- a/pc-bios/vof/vof.h
+++ b/pc-bios/vof/vof.h
@@ -10,11 +10,9 @@ typedef unsigned short uint16_t;
 typedef unsigned long uint32_t;
 typedef unsigned long long uint64_t;
 #define NULL (0)
-#define PROM_ERROR (-1u)
 typedef unsigned long ihandle;
 typedef unsigned long phandle;
 typedef int size_t;
-typedef void client(void);
 
 /* globals */
 extern void _prom_entry(void); /* OF CI entry point (i.e. this firmware) */
diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
index e9b6d0f58756..3808d4705304 100644
--- a/hw/ppc/spapr.c
+++ b/hw/ppc/spapr.c
@@ -1645,15 +1645,7 @@ static void spapr_machine_reset(MachineState *machine)
 
     fdt = spapr_build_fdt(spapr, true, FDT_MAX_SIZE);
     if (spapr->vof) {
-        target_ulong stack_ptr = 0;
-
-        spapr_vof_reset(spapr, fdt, &stack_ptr, &error_fatal);
-
-        spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
-                                  stack_ptr, spapr->initrd_base,
-                                  spapr->initrd_size);
-        /* VOF is 32bit BE so enforce MSR here */
-        first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
+        spapr_vof_reset(spapr, fdt, &error_fatal);
         /*
          * Do not pack the FDT as the client may change properties.
          * VOF client does not expect the FDT so we do not load it to the VM.
diff --git a/hw/ppc/spapr_hcall.c b/hw/ppc/spapr_hcall.c
index 80ae8eaadd34..0e9a5b2e4053 100644
--- a/hw/ppc/spapr_hcall.c
+++ b/hw/ppc/spapr_hcall.c
@@ -1080,7 +1080,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
     SpaprOptionVector *ov1_guest, *ov5_guest;
     bool guest_radix;
     bool raw_mode_supported = false;
-    bool guest_xive, reset_fdt = false;
+    bool guest_xive;
     CPUState *cs;
     void *fdt;
     uint32_t max_compat = spapr->max_compat_pvr;
@@ -1233,8 +1233,7 @@ target_ulong do_client_architecture_support(PowerPCCPU *cpu,
         spapr_setup_hpt(spapr);
     }
 
-    reset_fdt = spapr->vof != NULL;
-    fdt = spapr_build_fdt(spapr, reset_fdt, fdt_bufsize);
+    fdt = spapr_build_fdt(spapr, spapr->vof != NULL, fdt_bufsize);
     g_free(spapr->fdt_blob);
     spapr->fdt_size = fdt_totalsize(fdt);
     spapr->fdt_initial_size = spapr->fdt_size;
diff --git a/hw/ppc/spapr_vof.c b/hw/ppc/spapr_vof.c
index 1d5bec146c49..951fed0e191d 100644
--- a/hw/ppc/spapr_vof.c
+++ b/hw/ppc/spapr_vof.c
@@ -9,6 +9,7 @@
 #include "qapi/error.h"
 #include "hw/ppc/spapr.h"
 #include "hw/ppc/spapr_vio.h"
+#include "hw/ppc/spapr_cpu_core.h"
 #include "hw/ppc/fdt.h"
 #include "hw/ppc/vof.h"
 #include "sysemu/sysemu.h"
@@ -30,13 +31,19 @@ target_ulong spapr_h_vof_client(PowerPCCPU *cpu, SpaprMachineState *spapr,
 void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
 {
     char *stdout_path = spapr_vio_stdout_path(spapr->vio_bus);
-    int chosen;
 
     vof_build_dt(fdt, spapr->vof);
 
-    _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
-    _FDT(fdt_setprop_string(fdt, chosen, "bootargs",
-                            spapr->vof->bootargs ? : ""));
+    if (spapr->vof->bootargs) {
+        int chosen;
+
+        _FDT(chosen = fdt_path_offset(fdt, "/chosen"));
+        /*
+         * If the client did not change "bootargs", spapr_dt_chosen() must have
+         * stored machine->kernel_cmdline in it before getting here.
+         */
+        _FDT(fdt_setprop_string(fdt, chosen, "bootargs", spapr->vof->bootargs));
+    }
 
     /*
      * SLOF-less setup requires an open instance of stdout for early
@@ -49,20 +56,21 @@ void spapr_vof_client_dt_finalize(SpaprMachineState *spapr, void *fdt)
     }
 }
 
-void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
-                     target_ulong *stack_ptr, Error **errp)
+void spapr_vof_reset(SpaprMachineState *spapr, void *fdt, Error **errp)
 {
+    target_ulong stack_ptr;
     Vof *vof = spapr->vof;
+    PowerPCCPU *first_ppc_cpu = POWERPC_CPU(first_cpu);
 
     vof_init(vof, spapr->rma_size, errp);
 
-    *stack_ptr = vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
-    if (*stack_ptr == -1) {
+    stack_ptr = vof_claim(vof, 0, VOF_STACK_SIZE, VOF_STACK_SIZE);
+    if (stack_ptr == -1) {
         error_setg(errp, "Memory allocation for stack failed");
         return;
     }
     /* Stack grows downwards plus reserve space for the minimum stack frame */
-    *stack_ptr += VOF_STACK_SIZE - 0x20;
+    stack_ptr += VOF_STACK_SIZE - 0x20;
 
     if (spapr->kernel_size &&
         vof_claim(vof, spapr->kernel_addr, spapr->kernel_size, 0) == -1) {
@@ -78,6 +86,12 @@ void spapr_vof_reset(SpaprMachineState *spapr, void *fdt,
 
     spapr_vof_client_dt_finalize(spapr, fdt);
 
+    spapr_cpu_set_entry_state(first_ppc_cpu, SPAPR_ENTRY_POINT,
+                              stack_ptr, spapr->initrd_base,
+                              spapr->initrd_size);
+    /* VOF is 32bit BE so enforce MSR here */
+    first_ppc_cpu->env.msr &= ~((1ULL << MSR_SF) | (1ULL << MSR_LE));
+
     /*
      * At this point the expected allocation map is:
      *
diff --git a/hw/ppc/vof.c b/hw/ppc/vof.c
index a17fd9d2fe94..8d307cd048ba 100644
--- a/hw/ppc/vof.c
+++ b/hw/ppc/vof.c
@@ -144,15 +144,16 @@ static int path_offset(const void *fdt, const char *path)
      * the lower case forms of the hexadecimal digits in the range a..f,
      * suppressing leading zeros".
      */
-    at = strchr(path, '@');
-    if (!at) {
-        return fdt_path_offset(fdt, path);
-    }
-
     p = g_strdup(path);
-    for (at = at - path + p + 1; *at; ++at) {
-        *at = tolower(*at);
+    for (at = strchr(p, '@'); at && *at; ) {
+            if (*at == '/') {
+                at = strchr(at, '@');
+            } else {
+                *at = tolower(*at);
+                ++at;
+            }
     }
+
     return fdt_path_offset(fdt, p);
 }
 
@@ -300,6 +301,7 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
     char trval[64] = "";
     char nodepath[VOF_MAX_PATH] = "";
     Object *vmo = object_dynamic_cast(OBJECT(ms), TYPE_VOF_MACHINE_IF);
+    VofMachineIfClass *vmc;
     g_autofree char *val = NULL;
 
     if (vallen > VOF_MAX_SETPROPLEN) {
@@ -322,13 +324,13 @@ static uint32_t vof_setprop(MachineState *ms, void *fdt, Vof *vof,
         goto trace_exit;
     }
 
-    if (vmo) {
-        VofMachineIfClass *vmc = VOF_MACHINE_GET_CLASS(vmo);
+    if (!vmo) {
+        goto trace_exit;
+    }
 
-        if (vmc->setprop &&
-            !vmc->setprop(ms, nodepath, propname, val, vallen)) {
-            goto trace_exit;
-        }
+    vmc = VOF_MACHINE_GET_CLASS(vmo);
+    if (!vmc->setprop || !vmc->setprop(ms, nodepath, propname, val, vallen)) {
+        goto trace_exit;
     }
 
     ret = fdt_setprop(fdt, offset, propname, val, vallen);
@@ -919,6 +921,8 @@ static uint32_t vof_client_handle(MachineState *ms, void *fdt, Vof *vof,
         ret = -1;
     }
 
+#undef cmpserv
+
     return ret;
 }
 
diff --git a/pc-bios/vof/ci.c b/pc-bios/vof/ci.c
index 2b56050238a3..fc4821b3e970 100644
--- a/pc-bios/vof/ci.c
+++ b/pc-bios/vof/ci.c
@@ -69,7 +69,7 @@ static int call_ci(const char *service, int nargs, int nret, ...)
     }
 
     if (ci_entry((uint32_t)(&args)) < 0) {
-        return PROM_ERROR;
+        return -1;
     }
 
     return (nret > 0) ? args.args[nargs] : 0;
diff --git a/pc-bios/vof/libc.c b/pc-bios/vof/libc.c
index 00c10e6e7da1..fdbc30f777d4 100644
--- a/pc-bios/vof/libc.c
+++ b/pc-bios/vof/libc.c
@@ -54,32 +54,6 @@ int memcmp(const void *ptr1, const void *ptr2, size_t n)
     return 0;
 }
 
-void *memmove(void *dest, const void *src, size_t n)
-{
-    char *cdest;
-    const char *csrc;
-    int i;
-
-    /* Do the buffers overlap in a bad way? */
-    if (src < dest && src + n >= dest) {
-        /* Copy from end to start */
-        cdest = dest + n - 1;
-        csrc = src + n - 1;
-        for (i = 0; i < n; i++) {
-            *cdest-- = *csrc--;
-        }
-    } else {
-        /* Normal copy is possible */
-        cdest = dest;
-        csrc = src;
-        for (i = 0; i < n; i++) {
-            *cdest++ = *csrc++;
-        }
-    }
-
-    return dest;
-}
-
 void *memset(void *dest, int c, size_t size)
 {
     unsigned char *d = (unsigned char *)dest;
diff --git a/pc-bios/vof/main.c b/pc-bios/vof/main.c
index 9fc30d2d0957..0f0f6b4cb194 100644
--- a/pc-bios/vof/main.c
+++ b/pc-bios/vof/main.c
@@ -6,7 +6,7 @@ void do_boot(unsigned long addr, unsigned long _r3, unsigned long _r4)
     register unsigned long r4 __asm__("r4") = _r4;
     register unsigned long r5 __asm__("r5") = (unsigned long) _prom_entry;
 
-    ((client *)(uint32_t)addr)();
+    ((void (*)(void))(uint32_t)addr)();
 }
 
 void entry_c(void)
diff --git a/MAINTAINERS b/MAINTAINERS
index ce122eeced16..89d71b42b24f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1362,8 +1362,8 @@ F: include/hw/pci-host/mv64361.h
 
 Virtual Open Firmware (VOF)
 M: Alexey Kardashevskiy <aik@ozlabs.ru>
-M: David Gibson <david@gibson.dropbear.id.au>
-M: Greg Kurz <groug@kaod.org>
+R: David Gibson <david@gibson.dropbear.id.au>
+R: Greg Kurz <groug@kaod.org>
 L: qemu-ppc@nongnu.org
 S: Maintained
 F: hw/ppc/spapr_vof*
diff --git a/pc-bios/vof.bin b/pc-bios/vof.bin
index 1ec670be82134adcb5ae128732aff6e371281360..300cb7c7f9d9d77ffa7cbb7f0f26919246ef2d14 100755
GIT binary patch
delta 151
zcmX>h+aSGxjghy9!GnR}jEw^WLxNM!WMRf~rtUM7dl>VWx??8)VQgaRda${HDTtA&
zvuE-Z<}9X8h0P8uhZvdKV<xk(#WA)0nViCw#?&@t@)@=|rZ$VsKI~hWCdYEJZ`R>H
uz%*HauS<{T1Oo%l10a6Gz`)A@#2gF^j0r&O17wQ;u?!Gv0I>lOTL1tL)F-q6

delta 369
zcmZpWJ|Vk-jghyH!GnR}jEw^WLxNM^WMRf~re2ZBJ&buwJxeD4VQgaR(b(L;6vW8X
zb!GAu<}9YJjLi-#hZvbUmP}@0i(~3=nViCw#?*di@)@=|ruK%-KI~hW>f;$?8toY*
zYPdWc92yuV0NDzSK(SgaFA*RO7I$o9r~rvuYX1KZ5(CLiv}fQz5(BFTit$(~FfagV
z0iZ(-fNFUxwf_GHi38PgSaJf{@(diEUJMK~JsB8)VgeSHnhcB}4M4>LAOnF8VQ_5t
ze*$Pg43IAYlml5L12P2J@X0?olqCgl>7J~^X|b7u>j2Y40hP%oc)IlX1Q;0jG=SIy
dh=FGF1u!r$CIGPykR1cWDL`BR#1%l?005cvU&jCd

-- 
2.30.2


