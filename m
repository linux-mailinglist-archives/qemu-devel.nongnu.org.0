Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E0C5F66618A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:16:40 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFecR-00036R-2E; Wed, 11 Jan 2023 12:10:31 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFecB-0002ky-W7
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:17 -0500
Received: from mail-oo1-xc29.google.com ([2607:f8b0:4864:20::c29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec8-00068c-OM
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:14 -0500
Received: by mail-oo1-xc29.google.com with SMTP id
 m23-20020a4abc97000000b004bfe105c580so4197489oop.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:10:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nD7aC9DgA+b4W9/7h4R4JLYyeierlW3YAI6BlnUrPb4=;
 b=ifL1C94Ttt3ZY4J4dDn0JJHBiU1nsRrdhIPhfPVgWeXqCxQLlFtUl8lMBlNKz6dMNg
 FAsIYgS4RuEIs9dax/b7AJhuWVNWYEiamlyq3iMPEpQFr8Ml9h07LOdX1GN4tTnANGMp
 Hj5K8y+jTePrYMzViHoEWKkIBOhd89Z+xNN+CjSdaGROzWvJvt9T8+Ent9ALGlFyZszr
 5m+7G+LfZO/iup73ZQCKXpXnEfZnkZ/GiB+pkTveQ5/PtiTbv8DT7QeidS6kT1BaHKcT
 7BjbL6/fW7W/V5Y4eQVmV+0tuOGZtZrUKYdYaArksefDBXFqpusJb66ox5SDmkX38ZBa
 oMSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nD7aC9DgA+b4W9/7h4R4JLYyeierlW3YAI6BlnUrPb4=;
 b=xFI9RrrI8v/EIPGbNGxt6tXjT1CY9L5kjTFdxUt62lVpNLEoj1npzYqKG0PulF0Jli
 7xn86b+VUv1xUzis3ZMlvtFN2E+eXnholYqmkuxuUzqB6zCWjnD/ppa2SDdvoNYGTpoO
 4NX9PLxyQqd0sa3BpXm6afHTnxaDGHkz9FukA2ZwjTPDi/p0Lob/ZjEO3OQWew6gZ+eq
 p6jx48gpnF3sl7AQC8KVxclUru5jjPwe9jeReHCs3WpUN5tWpm3ctynGU74miBo1tQd/
 3WpJXGafLB8//W8SlEG1mwgIP29pfKAZOaqJcyt7zcyCGBncWAh80mcqgEKaF509vSiB
 CNcQ==
X-Gm-Message-State: AFqh2koy7NI36f4w9szTMHQc0ry7rwsLWih2Oz3Y8ehnqF90FHG1c9zs
 SoBT08dxcentXdw2eCAArPIGanZjZORRMS3+iy8=
X-Google-Smtp-Source: AMrXdXvHKjSXUNItqrNxSGZ6g/OXIPnLqjrDcZdm+ws7JM6x0BB9g4PDudATd10ma/IxCvnZqN733A==
X-Received: by 2002:a4a:9613:0:b0:4a3:9f7a:add0 with SMTP id
 q19-20020a4a9613000000b004a39f7aadd0mr31930815ooi.5.1673457011612; 
 Wed, 11 Jan 2023 09:10:11 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.10.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:11 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 08/10] hw/riscv/virt.c: calculate socket count once in
 create_fdt_imsic()
Date: Wed, 11 Jan 2023 14:09:46 -0300
Message-Id: <20230111170948.316276-9-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

riscv_socket_count() returns either ms->numa_state->num_nodes or 1
depending on NUMA support. In any case the value can be retrieved only
once and used in the rest of the function.

This will also alleviate the rename we're going to do next by reducing
the instances of MachineState 'mc' inside hw/riscv/virt.c.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 34 +++++++++++++++++++---------------
 1 file changed, 19 insertions(+), 15 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 0a0252368e..f9bdf2a70b 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -505,13 +505,14 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     int cpu, socket;
     char *imsic_name;
     MachineState *mc = MACHINE(s);
+    int socket_count = riscv_socket_count(mc);
     uint32_t imsic_max_hart_per_socket, imsic_guest_bits;
     uint32_t *imsic_cells, *imsic_regs, imsic_addr, imsic_size;
 
     *msi_m_phandle = (*phandle)++;
     *msi_s_phandle = (*phandle)++;
     imsic_cells = g_new0(uint32_t, mc->smp.cpus * 2);
-    imsic_regs = g_new0(uint32_t, riscv_socket_count(mc) * 4);
+    imsic_regs = g_new0(uint32_t, socket_count * 4);
 
     /* M-level IMSIC node */
     for (cpu = 0; cpu < mc->smp.cpus; cpu++) {
@@ -519,7 +520,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
         imsic_cells[cpu * 2 + 1] = cpu_to_be32(IRQ_M_EXT);
     }
     imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket = 0; socket < socket_count; socket++) {
         imsic_addr = memmap[VIRT_IMSIC_M].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(0) * s->soc[socket].num_harts;
@@ -545,14 +546,14 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
         imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
-    if (riscv_socket_count(mc) > 1) {
+    if (socket_count > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
+            imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
@@ -567,7 +568,7 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     }
     imsic_guest_bits = imsic_num_bits(s->aia_guests + 1);
     imsic_max_hart_per_socket = 0;
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket = 0; socket < socket_count; socket++) {
         imsic_addr = memmap[VIRT_IMSIC_S].base +
                      socket * VIRT_IMSIC_GROUP_MAX_SIZE;
         imsic_size = IMSIC_HART_SIZE(imsic_guest_bits) *
@@ -594,18 +595,18 @@ static void create_fdt_imsic(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop(mc->fdt, imsic_name, "interrupts-extended",
         imsic_cells, mc->smp.cpus * sizeof(uint32_t) * 2);
     qemu_fdt_setprop(mc->fdt, imsic_name, "reg", imsic_regs,
-        riscv_socket_count(mc) * sizeof(uint32_t) * 4);
+        socket_count * sizeof(uint32_t) * 4);
     qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,num-ids",
         VIRT_IRQCHIP_NUM_MSIS);
     if (imsic_guest_bits) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,guest-index-bits",
             imsic_guest_bits);
     }
-    if (riscv_socket_count(mc) > 1) {
+    if (socket_count > 1) {
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,hart-index-bits",
             imsic_num_bits(imsic_max_hart_per_socket));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-bits",
-            imsic_num_bits(riscv_socket_count(mc)));
+            imsic_num_bits(socket_count));
         qemu_fdt_setprop_cell(mc->fdt, imsic_name, "riscv,group-index-shift",
             IMSIC_MMIO_GROUP_MIN_SHIFT);
     }
@@ -733,6 +734,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     MachineState *mc = MACHINE(s);
     uint32_t msi_m_phandle = 0, msi_s_phandle = 0;
     uint32_t *intc_phandles, xplic_phandles[MAX_NODES];
+    int socket_count = riscv_socket_count(mc);
 
     qemu_fdt_add_subnode(mc->fdt, "/cpus");
     qemu_fdt_setprop_cell(mc->fdt, "/cpus", "timebase-frequency",
@@ -744,7 +746,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     intc_phandles = g_new0(uint32_t, mc->smp.cpus);
 
     phandle_pos = mc->smp.cpus;
-    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+    for (socket = (socket_count - 1); socket >= 0; socket--) {
         phandle_pos -= s->soc[socket].num_harts;
 
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
@@ -775,7 +777,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
     }
 
     phandle_pos = mc->smp.cpus;
-    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+    for (socket = (socket_count - 1); socket >= 0; socket--) {
         phandle_pos -= s->soc[socket].num_harts;
 
         if (s->aia_type == VIRT_AIA_TYPE_NONE) {
@@ -790,7 +792,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
 
     g_free(intc_phandles);
 
-    for (socket = 0; socket < riscv_socket_count(mc); socket++) {
+    for (socket = 0; socket < socket_count; socket++) {
         if (socket == 0) {
             *irq_mmio_phandle = xplic_phandles[socket];
             *irq_virtio_phandle = xplic_phandles[socket];
@@ -1051,7 +1053,8 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 
     /* Pass seed to RNG */
     qemu_guest_getrandom_nofail(rng_seed, sizeof(rng_seed));
-    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed", rng_seed, sizeof(rng_seed));
+    qemu_fdt_setprop(mc->fdt, "/chosen", "rng-seed",
+                     rng_seed, sizeof(rng_seed));
 }
 
 static inline DeviceState *gpex_pcie_init(MemoryRegion *sys_mem,
@@ -1326,9 +1329,10 @@ static void virt_machine_init(MachineState *machine)
     char *soc_name;
     DeviceState *mmio_irqchip, *virtio_irqchip, *pcie_irqchip;
     int i, base_hartid, hart_count;
+    int socket_count = riscv_socket_count(machine);
 
     /* Check socket count limit */
-    if (VIRT_SOCKETS_MAX < riscv_socket_count(machine)) {
+    if (VIRT_SOCKETS_MAX < socket_count) {
         error_report("number of sockets/nodes should be less than %d",
             VIRT_SOCKETS_MAX);
         exit(1);
@@ -1336,7 +1340,7 @@ static void virt_machine_init(MachineState *machine)
 
     /* Initialize sockets */
     mmio_irqchip = virtio_irqchip = pcie_irqchip = NULL;
-    for (i = 0; i < riscv_socket_count(machine); i++) {
+    for (i = 0; i < socket_count; i++) {
         if (!riscv_socket_check_hartids(machine, i)) {
             error_report("discontinuous hartids in socket%d", i);
             exit(1);
-- 
2.39.0


