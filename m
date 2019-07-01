Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 267AD5903D
	for <lists+qemu-devel@lfdr.de>; Fri, 28 Jun 2019 04:07:42 +0200 (CEST)
Received: from localhost ([::1]:55654 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1hggIf-0002ib-BC
	for lists+qemu-devel@lfdr.de; Thu, 27 Jun 2019 22:07:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49786)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <ehabkost@redhat.com>) id 1hgg7o-00005d-9W
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:56:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <ehabkost@redhat.com>) id 1hgg7m-0007e6-Nv
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:56:28 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34308)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <ehabkost@redhat.com>) id 1hgg7m-0007cC-Fj
 for qemu-devel@nongnu.org; Thu, 27 Jun 2019 21:56:26 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id A8B28369A0;
 Fri, 28 Jun 2019 01:56:25 +0000 (UTC)
Received: from localhost (ovpn-116-7.gru2.redhat.com [10.97.116.7])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 24BB760126;
 Fri, 28 Jun 2019 01:56:24 +0000 (UTC)
From: Eduardo Habkost <ehabkost@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Date: Thu, 27 Jun 2019 22:55:42 -0300
Message-Id: <20190628015606.32107-6-ehabkost@redhat.com>
In-Reply-To: <20190628015606.32107-1-ehabkost@redhat.com>
References: <20190628015606.32107-1-ehabkost@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.30]); Fri, 28 Jun 2019 01:56:25 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-devel] [PULL 05/29] hw/riscv: Replace global smp variables
 with machine smp properties
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, Like Xu <like.xu@linux.intel.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Like Xu <like.xu@linux.intel.com>

The global smp variables in riscv are replaced with smp machine properties.

A local variable of the same name would be introduced in the declaration
phase if it's used widely in the context OR replace it on the spot if it's
only used once. No semantic changes.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Message-Id: <20190518205428.90532-6-like.xu@linux.intel.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
[ehabkost: fix spike_board_init()]
Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
---
 hw/riscv/sifive_e.c    | 6 ++++--
 hw/riscv/sifive_plic.c | 3 +++
 hw/riscv/sifive_u.c    | 6 ++++--
 hw/riscv/spike.c       | 3 +++
 hw/riscv/virt.c        | 1 +
 5 files changed, 15 insertions(+), 4 deletions(-)

diff --git a/hw/riscv/sifive_e.c b/hw/riscv/sifive_e.c
index 80ac56fa7d..bd25e11a87 100644
--- a/hw/riscv/sifive_e.c
+++ b/hw/riscv/sifive_e.c
@@ -137,6 +137,7 @@ static void riscv_sifive_e_init(MachineState *machine)
 
 static void riscv_sifive_e_soc_init(Object *obj)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveESoCState *s = RISCV_E_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus,
@@ -144,7 +145,7 @@ static void riscv_sifive_e_soc_init(Object *obj)
                             &error_abort, NULL);
     object_property_set_str(OBJECT(&s->cpus), SIFIVE_E_CPU, "cpu-type",
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
+    object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
                             &error_abort);
     sysbus_init_child_obj(obj, "riscv.sifive.e.gpio0",
                           &s->gpio, sizeof(s->gpio),
@@ -153,6 +154,7 @@ static void riscv_sifive_e_soc_init(Object *obj)
 
 static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     const struct MemmapEntry *memmap = sifive_e_memmap;
     Error *err = NULL;
 
@@ -183,7 +185,7 @@ static void riscv_sifive_e_soc_realize(DeviceState *dev, Error **errp)
         SIFIVE_E_PLIC_CONTEXT_STRIDE,
         memmap[SIFIVE_E_PLIC].size);
     sifive_clint_create(memmap[SIFIVE_E_CLINT].base,
-        memmap[SIFIVE_E_CLINT].size, smp_cpus,
+        memmap[SIFIVE_E_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
     sifive_mmio_emulate(sys_mem, "riscv.sifive.e.aon",
         memmap[SIFIVE_E_AON].base, memmap[SIFIVE_E_AON].size);
diff --git a/hw/riscv/sifive_plic.c b/hw/riscv/sifive_plic.c
index 70a4413599..0950e89e15 100644
--- a/hw/riscv/sifive_plic.c
+++ b/hw/riscv/sifive_plic.c
@@ -24,6 +24,7 @@
 #include "qemu/error-report.h"
 #include "hw/sysbus.h"
 #include "hw/pci/msi.h"
+#include "hw/boards.h"
 #include "target/riscv/cpu.h"
 #include "sysemu/sysemu.h"
 #include "hw/riscv/sifive_plic.h"
@@ -439,6 +440,8 @@ static void sifive_plic_irq_request(void *opaque, int irq, int level)
 
 static void sifive_plic_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
+    unsigned int smp_cpus = ms->smp.cpus;
     SiFivePLICState *plic = SIFIVE_PLIC(dev);
     int i;
 
diff --git a/hw/riscv/sifive_u.c b/hw/riscv/sifive_u.c
index 5ecc47cea3..43bf256946 100644
--- a/hw/riscv/sifive_u.c
+++ b/hw/riscv/sifive_u.c
@@ -321,13 +321,14 @@ static void riscv_sifive_u_init(MachineState *machine)
 
 static void riscv_sifive_u_soc_init(Object *obj)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveUSoCState *s = RISCV_U_SOC(obj);
 
     object_initialize_child(obj, "cpus", &s->cpus, sizeof(s->cpus),
                             TYPE_RISCV_HART_ARRAY, &error_abort, NULL);
     object_property_set_str(OBJECT(&s->cpus), SIFIVE_U_CPU, "cpu-type",
                             &error_abort);
-    object_property_set_int(OBJECT(&s->cpus), smp_cpus, "num-harts",
+    object_property_set_int(OBJECT(&s->cpus), ms->smp.cpus, "num-harts",
                             &error_abort);
 
     sysbus_init_child_obj(obj, "gem", &s->gem, sizeof(s->gem),
@@ -336,6 +337,7 @@ static void riscv_sifive_u_soc_init(Object *obj)
 
 static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
 {
+    MachineState *ms = MACHINE(qdev_get_machine());
     SiFiveUSoCState *s = RISCV_U_SOC(dev);
     const struct MemmapEntry *memmap = sifive_u_memmap;
     MemoryRegion *system_memory = get_system_memory();
@@ -371,7 +373,7 @@ static void riscv_sifive_u_soc_realize(DeviceState *dev, Error **errp)
     sifive_uart_create(system_memory, memmap[SIFIVE_U_UART1].base,
         serial_hd(1), qdev_get_gpio_in(DEVICE(s->plic), SIFIVE_U_UART1_IRQ));
     sifive_clint_create(memmap[SIFIVE_U_CLINT].base,
-        memmap[SIFIVE_U_CLINT].size, smp_cpus,
+        memmap[SIFIVE_U_CLINT].size, ms->smp.cpus,
         SIFIVE_SIP_BASE, SIFIVE_TIMECMP_BASE, SIFIVE_TIME_BASE);
 
     for (i = 0; i < SIFIVE_U_PLIC_NUM_SOURCES; i++) {
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 5b33d4be3b..d91d49dcae 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -172,6 +172,7 @@ static void spike_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     /* Initialize SOC */
     object_initialize_child(OBJECT(machine), "soc", &s->soc, sizeof(s->soc),
@@ -254,6 +255,7 @@ static void spike_v1_10_0_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     if (!qtest_enabled()) {
         info_report("The Spike v1.10.0 machine has been deprecated. "
@@ -342,6 +344,7 @@ static void spike_v1_09_1_board_init(MachineState *machine)
     MemoryRegion *main_mem = g_new(MemoryRegion, 1);
     MemoryRegion *mask_rom = g_new(MemoryRegion, 1);
     int i;
+    unsigned int smp_cpus = machine->smp.cpus;
 
     if (!qtest_enabled()) {
         info_report("The Spike v1.09.1 machine has been deprecated. "
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 84d94d0c42..8e11fe5f2f 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -394,6 +394,7 @@ static void riscv_virt_board_init(MachineState *machine)
     char *plic_hart_config;
     size_t plic_hart_config_len;
     int i;
+    unsigned int smp_cpus = machine->smp.cpus;
     void *fdt;
 
     /* Initialize SOC */
-- 
2.18.0.rc1.1.g3f1ff2140


