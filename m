Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD09648F958
	for <lists+qemu-devel@lfdr.de>; Sat, 15 Jan 2022 21:43:26 +0100 (CET)
Received: from localhost ([::1]:55742 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1n8ptV-0007WH-NN
	for lists+qemu-devel@lfdr.de; Sat, 15 Jan 2022 15:43:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8po0-0002Ee-Ak
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:44 -0500
Received: from mout.kundenserver.de ([217.72.192.74]:37937)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1n8pny-0002NV-CP
 for qemu-devel@nongnu.org; Sat, 15 Jan 2022 15:37:44 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue106
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MsIbU-1mJu8h37eM-00tnFT; Sat, 15
 Jan 2022 21:37:29 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] m68k: virt: correctly set the initial PC
Date: Sat, 15 Jan 2022 21:37:25 +0100
Message-Id: <20220115203725.3834712-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220115203725.3834712-1-laurent@vivier.eu>
References: <20220115203725.3834712-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:PNvMk2kj/1S4BuGK/D+PahYg7YfpK0e+mJj2ng/oNrhMdOzsBzp
 eWqJ4JYfSy3t2mCyUGWgiamuSIadUma8YXrorvLS6dGDZ1WyrNgC09S8L8IdJLtKyLBVrAa
 KifCM0erv4xzDUw9yIZYxwcsTsbl32mrFXVMjcstGfVWqkfD5qLF2OK+nxLos+YQ1jURQOU
 DEfR26w0GWF6CGwfB5vCw==
X-UI-Out-Filterresults: notjunk:1;V03:K0:gE1zFdVpLH8=:xg7Ur3MfCPZrwg0EqGpyhp
 ZmneaTOSvyRYFca2yIdnio9kNytsQ41sO5/ns5rxtIA+CWdGFxeK18tYkGZuCtrPoSdmB0Uy8
 INk2NLpTGYqKqXWtKwhEFIblJYBLqrDMccoj/fgn7ZmjZomeOPC71VeXed8cXJY17rCDbw1/7
 /CICosaaPh+diVjLRVXk5IXFdiv8RhI2aykKTKegUIsff1ujd3pvHKsw8Drg9pDuEKKTUPeNl
 qUGXv2pv2AmiDIou0pTKhntf4i6/eYX7pTliTvUrmZ4XGIw9Am1E7k7ZRLm7eZ+oRbFoLoXjk
 ckgbKG5j56RHw7ODV0ahQ6vvFRiHZB1hKkctXicYqNamNvrJjBPA1WFalIxUp2T1C/BJQ7mrQ
 EGMETaI8G9yb+1wAPtXc+/mO1GHpZtm8/+3pJk5JYE4+OvTHidh/zipDqMzOUMs6yrlJSImvC
 orLvrJlOizmD5v3mUax3Tm0qzl6mIptLVn/qz3Rj1JL+XES9qIzqmn1skTMjwL2I9pPlh+RCl
 Jm0ZKFasYM4TnIJm8shn18vLHsIkeN3NEYd1rRA8tuWIHd4vieZMj9q8wSoSKlMslBatm6u1L
 UDhdnCsZjVIOzwGK7w5HoVT2jV6dTlbAhuVISfpuISkP3PyhSRg7w3CgrQO3bHgVtX8XucJyR
 t2ILxE9N2lLkyANruO7Bjt0q6MqdPj++ZadNx6HCPqLVmBPFzBlaoThBa9n9lkuc7/RM=
Received-SPF: none client-ip=217.72.192.74; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Peter Xu <peterx@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

According to QEMU parameter, set initial PC to the entry of
the loaded kernel.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index 78e926a55457..bbaf630bbf20 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -85,14 +85,21 @@
 #define VIRT_VIRTIO_MMIO_BASE 0xff010000     /* MMIO: 0xff010000 - 0xff01ffff */
 #define VIRT_VIRTIO_IRQ_BASE  PIC_IRQ(2, 1)  /* PIC: 2, 3, 4, 5, IRQ: ALL */
 
+typedef struct {
+    M68kCPU *cpu;
+    hwaddr initial_pc;
+    hwaddr initial_stack;
+} ResetInfo;
+
 static void main_cpu_reset(void *opaque)
 {
-    M68kCPU *cpu = opaque;
+    ResetInfo *reset_info = opaque;
+    M68kCPU *cpu = reset_info->cpu;
     CPUState *cs = CPU(cpu);
 
     cpu_reset(cs);
-    cpu->env.aregs[7] = ldl_phys(cs->as, 0);
-    cpu->env.pc = ldl_phys(cs->as, 4);
+    cpu->env.aregs[7] = reset_info->initial_stack;
+    cpu->env.pc = reset_info->initial_pc;
 }
 
 static void virt_init(MachineState *machine)
@@ -113,6 +120,7 @@ static void virt_init(MachineState *machine)
     SysBusDevice *sysbus;
     hwaddr io_base;
     int i;
+    ResetInfo *reset_info;
 
     if (ram_size > 3399672 * KiB) {
         /*
@@ -124,9 +132,13 @@ static void virt_init(MachineState *machine)
         exit(1);
     }
 
+    reset_info = g_malloc0(sizeof(ResetInfo));
+
     /* init CPUs */
     cpu = M68K_CPU(cpu_create(machine->cpu_type));
-    qemu_register_reset(main_cpu_reset, cpu);
+
+    reset_info->cpu = cpu;
+    qemu_register_reset(main_cpu_reset, reset_info);
 
     /* RAM */
     memory_region_add_subregion(get_system_memory(), 0, machine->ram);
@@ -206,7 +218,7 @@ static void virt_init(MachineState *machine)
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
+        reset_info->initial_pc = elf_entry;
         parameters_base = (high + 1) & ~1;
 
         BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_VIRT);
-- 
2.34.1


