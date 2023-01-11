Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6F66617A
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:12:29 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFecM-0002yU-MX; Wed, 11 Jan 2023 12:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec6-0002jb-Kg
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:12 -0500
Received: from mail-oo1-xc2a.google.com ([2607:f8b0:4864:20::c2a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec3-0006Mw-3q
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:09 -0500
Received: by mail-oo1-xc2a.google.com with SMTP id
 d2-20020a4ab202000000b004ae3035538bso4188821ooo.12
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WXzmrToZZL5mmObYmkR3If3a0yo0qiD6+VD6xsglhGY=;
 b=S6ZItws+t5NWDN5NaOX9uqQjaUMjm8rGOUmM+x+Xd67Xh4T/02nivupy7TdswCDPBO
 7Qlxr2cJblkG66LQQTplH22kmwZ+f7pbJEXlSwJfKbO4E4CzwZ3Me1ZsUFbTJVYZdnB9
 81bxu3oUMG8Ur5IYrSwcNzTTiCuGG5wn8OJ2wztAEZPLypIktcVbEMUm8Qf+0GAAuySP
 6P1bDqU2UqIY969pOnN+GounJtN1eHehr1oRyBj8l807U8piEVjDZH+B4vF7rHfymIyU
 GWrD6uWVqodKUtb9wlgOBHipE/2WNctswxAP+BrGnki5Q+IdnCq9g9MZ5tDv0T2qOcnI
 M31w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WXzmrToZZL5mmObYmkR3If3a0yo0qiD6+VD6xsglhGY=;
 b=h7ovFTxsgc5BP9IqnXNNOgP4nR8+uXaff4gip+eKRfCKSRqALPuEQ4upt6gJLkhAdM
 GgZ1uWNni4fEKuIHE7iRO/eiHd932AYwRaR8IFhBT5QVgE1VglQZFTmaQ75uuAkQQf2G
 te5DtsquzqXM+TImeABSZBOBtPGvD7eFQFFYjTc2kBfQnZieNPityVAlm/nL2FECPb4n
 nNP3NIRELwLOMgS0TvO6mRJV0ZNh66/AixddIRRbXklpyBU1MjqVcdMF/no+oLZXetIB
 izKMZuBqG1g3AmtxfrdHSawB+at94FpprH1pnb6r+42vtwqBhtK/t3ET+Q6CmzQuW5iK
 XDZQ==
X-Gm-Message-State: AFqh2kok7SsxM7kpB8uJ/9vPoHF6DR/277OWlI/KsV0ZO+kHRXq5eBP1
 aSfz0AK9PH6h9gGc1jMtf4RdoTDIK5u7AOrTixo=
X-Google-Smtp-Source: AMrXdXs2E2ogIcWYYDOeVqK+Dxea9nQmd0USIj4shw3pzn3n24sKVRB3LK0QEYke7PBGaX/yPpMf5w==
X-Received: by 2002:a4a:928f:0:b0:4f1:e1c7:2723 with SMTP id
 i15-20020a4a928f000000b004f1e1c72723mr8992048ooh.8.1673457005469; 
 Wed, 11 Jan 2023 09:10:05 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.10.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:05 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 05/10] hw/riscv: use MachineState::fdt in
 riscv_socket_fdt_write_id()
Date: Wed, 11 Jan 2023 14:09:43 -0300
Message-Id: <20230111170948.316276-6-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c2a;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oo1-xc2a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

There's no need to use a MachineState pointer and a fdt pointer now that
all RISC-V machines are using the FDT from the MachineState.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/numa.c         |  6 +++---
 hw/riscv/spike.c        |  6 +++---
 hw/riscv/virt.c         | 18 +++++++++---------
 include/hw/riscv/numa.h |  6 +++---
 4 files changed, 18 insertions(+), 18 deletions(-)

diff --git a/hw/riscv/numa.c b/hw/riscv/numa.c
index 7fe92d402f..f4343f5cde 100644
--- a/hw/riscv/numa.c
+++ b/hw/riscv/numa.c
@@ -156,11 +156,11 @@ uint64_t riscv_socket_mem_size(const MachineState *ms, int socket_id)
             ms->numa_state->nodes[socket_id].node_mem : 0;
 }
 
-void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
-                               const char *node_name, int socket_id)
+void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
+                               int socket_id)
 {
     if (numa_enabled(ms)) {
-        qemu_fdt_setprop_cell(fdt, node_name, "numa-node-id", socket_id);
+        qemu_fdt_setprop_cell(ms->fdt, node_name, "numa-node-id", socket_id);
     }
 }
 
diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 4a66016d69..05d34651cb 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
-            riscv_socket_fdt_write_id(mc, fdt, cpu_name, socket);
+            riscv_socket_fdt_write_id(mc, cpu_name, socket);
             qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
 
             intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
@@ -154,7 +154,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         qemu_fdt_setprop_cells(fdt, mem_name, "reg",
             addr >> 32, addr, size >> 32, size);
         qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, fdt, mem_name, socket);
+        riscv_socket_fdt_write_id(mc, mem_name, socket);
         g_free(mem_name);
 
         clint_addr = memmap[SPIKE_CLINT].base +
@@ -167,7 +167,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
             clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-        riscv_socket_fdt_write_id(mc, fdt, clint_name, socket);
+        riscv_socket_fdt_write_id(mc, clint_name, socket);
 
         g_free(clint_name);
         g_free(clint_cells);
diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 99a0a43a73..1d3bd25cb5 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -253,7 +253,7 @@ static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "reg",
             s->soc[socket].hartid_base + cpu);
         qemu_fdt_setprop_string(mc->fdt, cpu_name, "device_type", "cpu");
-        riscv_socket_fdt_write_id(mc, mc->fdt, cpu_name, socket);
+        riscv_socket_fdt_write_id(mc, cpu_name, socket);
         qemu_fdt_setprop_cell(mc->fdt, cpu_name, "phandle", cpu_phandle);
 
         intc_phandles[cpu] = (*phandle)++;
@@ -291,7 +291,7 @@ static void create_fdt_socket_memory(RISCVVirtState *s,
     qemu_fdt_setprop_cells(mc->fdt, mem_name, "reg",
         addr >> 32, addr, size >> 32, size);
     qemu_fdt_setprop_string(mc->fdt, mem_name, "device_type", "memory");
-    riscv_socket_fdt_write_id(mc, mc->fdt, mem_name, socket);
+    riscv_socket_fdt_write_id(mc, mem_name, socket);
     g_free(mem_name);
 }
 
@@ -327,7 +327,7 @@ static void create_fdt_socket_clint(RISCVVirtState *s,
         0x0, clint_addr, 0x0, memmap[VIRT_CLINT].size);
     qemu_fdt_setprop(mc->fdt, clint_name, "interrupts-extended",
         clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-    riscv_socket_fdt_write_id(mc, mc->fdt, clint_name, socket);
+    riscv_socket_fdt_write_id(mc, clint_name, socket);
     g_free(clint_name);
 
     g_free(clint_cells);
@@ -372,7 +372,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
             aclint_mswi_cells, aclint_cells_size);
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        riscv_socket_fdt_write_id(mc, name, socket);
         g_free(name);
     }
 
@@ -396,7 +396,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
         0x0, RISCV_ACLINT_DEFAULT_MTIME);
     qemu_fdt_setprop(mc->fdt, name, "interrupts-extended",
         aclint_mtimer_cells, aclint_cells_size);
-    riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+    riscv_socket_fdt_write_id(mc, name, socket);
     g_free(name);
 
     if (s->aia_type != VIRT_AIA_TYPE_APLIC_IMSIC) {
@@ -412,7 +412,7 @@ static void create_fdt_socket_aclint(RISCVVirtState *s,
             aclint_sswi_cells, aclint_cells_size);
         qemu_fdt_setprop(mc->fdt, name, "interrupt-controller", NULL, 0);
         qemu_fdt_setprop_cell(mc->fdt, name, "#interrupt-cells", 0);
-        riscv_socket_fdt_write_id(mc, mc->fdt, name, socket);
+        riscv_socket_fdt_write_id(mc, name, socket);
         g_free(name);
     }
 
@@ -471,7 +471,7 @@ static void create_fdt_socket_plic(RISCVVirtState *s,
         0x0, plic_addr, 0x0, memmap[VIRT_PLIC].size);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "riscv,ndev",
                           VIRT_IRQCHIP_NUM_SOURCES - 1);
-    riscv_socket_fdt_write_id(mc, mc->fdt, plic_name, socket);
+    riscv_socket_fdt_write_id(mc, plic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, plic_name, "phandle",
         plic_phandles[socket]);
 
@@ -663,7 +663,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
         aplic_s_phandle);
     qemu_fdt_setprop_cells(mc->fdt, aplic_name, "riscv,delegate",
         aplic_s_phandle, 0x1, VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    riscv_socket_fdt_write_id(mc, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_m_phandle);
     g_free(aplic_name);
 
@@ -691,7 +691,7 @@ static void create_fdt_socket_aplic(RISCVVirtState *s,
         0x0, aplic_addr, 0x0, memmap[VIRT_APLIC_S].size);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "riscv,num-sources",
         VIRT_IRQCHIP_NUM_SOURCES);
-    riscv_socket_fdt_write_id(mc, mc->fdt, aplic_name, socket);
+    riscv_socket_fdt_write_id(mc, aplic_name, socket);
     qemu_fdt_setprop_cell(mc->fdt, aplic_name, "phandle", aplic_s_phandle);
 
     if (!socket) {
diff --git a/include/hw/riscv/numa.h b/include/hw/riscv/numa.h
index 1a9cce3344..634df6673f 100644
--- a/include/hw/riscv/numa.h
+++ b/include/hw/riscv/numa.h
@@ -90,10 +90,10 @@ bool riscv_socket_check_hartids(const MachineState *ms, int socket_id);
  * @ms: pointer to machine state
  * @socket_id: socket index
  *
- * Write NUMA node-id FDT property for given FDT node
+ * Write NUMA node-id FDT property in MachineState->fdt
  */
-void riscv_socket_fdt_write_id(const MachineState *ms, void *fdt,
-                               const char *node_name, int socket_id);
+void riscv_socket_fdt_write_id(const MachineState *ms, const char *node_name,
+                               int socket_id);
 
 /**
  * riscv_socket_fdt_write_distance_matrix:
-- 
2.39.0


