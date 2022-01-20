Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D80B4494B1C
	for <lists+qemu-devel@lfdr.de>; Thu, 20 Jan 2022 10:52:49 +0100 (CET)
Received: from localhost ([::1]:32976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nAU7a-0005hA-R6
	for lists+qemu-devel@lfdr.de; Thu, 20 Jan 2022 04:52:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59662)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASve-0006VJ-9Z
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:22 -0500
Received: from mout.kundenserver.de ([212.227.126.187]:34099)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>) id 1nASvb-0001eX-7M
 for qemu-devel@nongnu.org; Thu, 20 Jan 2022 03:36:21 -0500
Received: from quad ([82.142.13.186]) by mrelayeu.kundenserver.de (mreue009
 [212.227.15.167]) with ESMTPSA (Nemesis) id 1MBUuV-1n0rT90sUJ-00Czga; Thu, 20
 Jan 2022 09:36:12 +0100
From: Laurent Vivier <laurent@vivier.eu>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] m68k: virt: correctly set the initial PC
Date: Thu, 20 Jan 2022 09:36:07 +0100
Message-Id: <20220120083607.1672319-4-laurent@vivier.eu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120083607.1672319-1-laurent@vivier.eu>
References: <20220120083607.1672319-1-laurent@vivier.eu>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mpLr6PiZmsJlecnnqac9h4/jR0Hp12BnwW6zhRCSZId2tiu9idn
 48ZqxWgpUm5r30h+dK51XHOguz9ahShBGfKrud7YnajNLCvokLZwYarJ/pWYYZUV9Z5SH7d
 FqTucM9zRtsonI0kY1vX9Y0lNInTohboQk/vlHKIn1E3vd8+JUigBC5auZYlQJMEPTLnkyh
 whCEVCoxsJspdYCd1rqCQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:CGJ7NzeoXbE=:yGBWzN9Xxmfu0rVDiZlLg6
 XUFHSIgCdY0LsxzI4YQ0cv0EycQN1DoSLgkzmGBvA7nm8LM5cYdwvroIOtyKEqAxJA28F2q7U
 SO7RsGyW2C3e3MzGrDVwbMvZdoA5oxb5Nxd/AxoPGUo5pwiwBJ7y3qr07UwLtolG8zxPCw2jw
 GCslYq4z8CIeob2jU5E7UIs3de3cIkGrhuw9y5lcve4tIneBMyWQASznhQp9XDauoWeK2H1UL
 KuGgsaUkUbxvTVS1n2r/QxgbSANI0vlGjlqXJTBxIAWM0xR0WBcQN8GBmNixhp9oEjqi3uelm
 Gr76dCnvvr37G5h589oR2IvGfK9V6Nyp6MOvnZX7J51FbHaco7VtSi9mEiAIiGPITdDGCNO4n
 WZCjmc7y7+OE7aytK1RLHmAfWfn3XpjfsiH3alz+L9EhkSa26yOoG6yyHKLhDnOAbkhS+vwTT
 OD/GCa6stgNf8kS+LCQ5OWdTYNfCbliRKK6MsF7L3upCOP5w/FoSdpTnhNJctjdomAV1Wt1Gy
 Vp6bFv336+cF0MtL/U6Z77KQ3k06wjHZUYJ2uWBI4JyhqM7XyU9rs6gjIVbzxlYRRrEkL92jM
 5wLTJpXggk+ob97Eq10GyIB57Ro7+bZTM5zn5pEtU/nR1WE3C+SuxdGm3IE8US52tetyph5QC
 yw0ZjlEtOSS54z73KQ0i74qFM3ljwYMeM28TFmr+JE9FDubzB/X2G2WWkyUYkLTOuBBE=
Received-SPF: none client-ip=212.227.126.187; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Message-Id: <20220115203725.3834712-4-laurent@vivier.eu>
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


