Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D301E372AD5
	for <lists+qemu-devel@lfdr.de>; Tue,  4 May 2021 15:19:49 +0200 (CEST)
Received: from localhost ([::1]:37180 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lduxo-0005rm-Cu
	for lists+qemu-devel@lfdr.de; Tue, 04 May 2021 09:19:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41252)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lduwY-0004zs-NK
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:18:30 -0400
Received: from mout.kundenserver.de ([212.227.17.13]:35943)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1lduwQ-0002dy-KS
 for qemu-devel@nongnu.org; Tue, 04 May 2021 09:18:28 -0400
Received: from quad ([82.142.20.222]) by mrelayeu.kundenserver.de (mreue108
 [212.227.15.183]) with ESMTPSA (Nemesis) id 1MQMqN-1lqmzL1CTZ-00MMZH; Tue, 04
 May 2021 15:18:18 +0200
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PATCH] m68k: virt: correctly set the initial PC
Date: Tue,  4 May 2021 15:18:16 +0200
Message-Id: <20210504131816.73272-1-laurent@vivier.eu>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:88GV03e8jN2Gr3Y8wfUkyt+AnADydcN6DqWLLgYBEHdsPZRbS4F
 /XLv2TQzKb61+yiNRUzcUtEETKiUXf5UGNxAbcBIbJDJ6kz3Ov0rK8Pa3lI4H9DzwgYjYeM
 8xnryczvzUp2OM6jameYSUPAEDo8IAiteZmtl5z1buUOec5r1s7dRoWTp4peY6htBwSGrIz
 cX5gdJ8JHivlsh/9UV1xA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:qc71tT/yIuM=:ZD+tVAaTy6zAtEU1mam849
 3dTiUiN0fzRO4GIIgW5lPvvxDJUjfB+7hHI07AeFhFxv33vJyPp6jJsmYLiUMzMP2NH8m6ntr
 /DPhCWvBVA9YibyUxC1G1hzf6tqsMuZcJd+gzAOQ49+o1B4qyrLfpZqXhNIOBDAG14U74HmL7
 1FoxjE0NJqWEF7WA41mE5e1RlWUCdamI+OS6NumTqYPFSIck7sUHwLZIsOq+KIIl45XgTPWy/
 Ne6ZrSVNhBtbhtTB8K6q7E2cZ3HEXr9WC5yoToJwmIGFIAxNjr9PUW0yqd9jm423sHbPOsxqP
 1+HYmoPiv90K4np+a7ukwlUc5wZYQzOhnavaIqHh4x/F0k0LEFt7C4ZjFEmuEi7MSJSqCD59E
 f6Ecovvur/WYvjKvKtegd6fMRo4oalpcr1uzPDp56DZ0lHpTnVa+vhe+DbMhue352P59qg1al
 o6SLbdOLusgR07YmW9dYQDzVlXNXz9t6d8beXCnlDufyI5wO/dmLYYInKvJrzYIeHpuiJonBq
 T6XUlimM51JNOxticLpgtM=
Received-SPF: none client-ip=212.227.17.13; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Set initial PC to the entry of the loaded kernel.

This fixes kernel reboot with "-kernel" parameter.

Signed-off-by: Laurent Vivier <laurent@vivier.eu>
---
 hw/m68k/virt.c | 22 +++++++++++++++++-----
 1 file changed, 17 insertions(+), 5 deletions(-)

diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
index e9a5d4c69b97..4fb3a7ebf0f2 100644
--- a/hw/m68k/virt.c
+++ b/hw/m68k/virt.c
@@ -88,14 +88,21 @@
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
@@ -116,6 +123,7 @@ static void virt_init(MachineState *machine)
     SysBusDevice *sysbus;
     hwaddr io_base;
     int i;
+    ResetInfo *reset_info;
 
     if (ram_size > 3399672 * KiB) {
         /*
@@ -127,9 +135,13 @@ static void virt_init(MachineState *machine)
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
@@ -209,7 +221,7 @@ static void virt_init(MachineState *machine)
             error_report("could not load kernel '%s'", kernel_filename);
             exit(1);
         }
-        stl_phys(cs->as, 4, elf_entry); /* reset initial PC */
+        reset_info->initial_pc = elf_entry;
         parameters_base = (high + 1) & ~1;
 
         BOOTINFO1(cs->as, parameters_base, BI_MACHTYPE, MACH_VIRT);
-- 
2.31.1


