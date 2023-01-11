Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 87AD8666198
	for <lists+qemu-devel@lfdr.de>; Wed, 11 Jan 2023 18:19:10 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pFecM-0002qI-EN; Wed, 11 Jan 2023 12:10:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec4-0002in-6U
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:08 -0500
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pFec2-0006MI-Go
 for qemu-devel@nongnu.org; Wed, 11 Jan 2023 12:10:07 -0500
Received: by mail-oa1-x29.google.com with SMTP id
 586e51a60fabf-12c8312131fso16216271fac.4
 for <qemu-devel@nongnu.org>; Wed, 11 Jan 2023 09:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=3Dkt8d3SpLodgKfYwmKReWsLo4BoLEeY7LR0KGeK3q0=;
 b=NlWShxDXsW+93CsfYq174mztRukMpbkfKqqgKWdMNucAqeovFx8qPOYlEXbDYV7biS
 ckttsNqmjrE3lwn9u4pZhuT8F70NxqwpjmP2P+9wvwq6aNW1OWYN4VmvmygpqHMZJJJT
 8JtUPb57n/msVQ64XlqJ65g15vR8I8z8moGozxOdZP1YcE4CjB1mqmnSGmMdK67m4xRN
 EhWdweojEgyHysqqeP/SrTJrwSJzET3nch+vdAe0wEusU8Rf9WiMdmjaTYbJW455Lp8J
 XFgF3mAdGEWkzo1v1MywqV5PtZnQIdIuuQJ4qC5/kPXep5t5RmRU3ZQdibIyw81APsfh
 Ju/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3Dkt8d3SpLodgKfYwmKReWsLo4BoLEeY7LR0KGeK3q0=;
 b=2YqpbWjjiRyh2scwXoq4ZEkyX62AuMz6eMn/ya1V+7McIOiq6pSjGJ1n55XZRK38xx
 AOiOOeVKXArP8Mb/6IRLnsJctPWL3FW4tL8Kctmcjdi6UmhAFrVG7Hvj33N6nmsOrdeO
 T6r1UpdDCGdVq/XKpCM8Gb0atb0yhz94sTe29r0hky+QbREI7EY9QbockQWU94GoMxY0
 /P5BFq2PBKVRd0fV0K4r0kKfu7eBrgLaGcjd57lx5wilnlKp3gn5yA44H/7Uea1vsqEe
 atyqxS4yNM7QpJprnrBZGEZWkllNnmHaQdmsbyRUKC2RnYozJRrF7U7O+tGBNrMH0xN+
 PaIQ==
X-Gm-Message-State: AFqh2koH2UF9ZShExS22RWxYGMmgKmL+87mMs+ndgI4KYka6Kn7lu/QP
 OxB3jm9jTdXXLORq/zPMmdmW+Hx/gIlejql38U4=
X-Google-Smtp-Source: AMrXdXsF08KcX6PHEOHd90nt35sn+52H1ZAiT3xeihfvSH/jQniOvnXYV6kPrBqvH+kwIWaoqr9GgA==
X-Received: by 2002:a05:6870:9a14:b0:144:7a85:63ce with SMTP id
 fo20-20020a0568709a1400b001447a8563cemr42291578oab.54.1673457003354; 
 Wed, 11 Jan 2023 09:10:03 -0800 (PST)
Received: from grind.. ([191.17.222.2]) by smtp.gmail.com with ESMTPSA id
 x18-20020a4ac592000000b004a3543fbfbbsm7214974oop.14.2023.01.11.09.10.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 09:10:02 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>
Subject: [PATCH 04/10] hw/riscv/virt.c: remove 'is_32_bit' param from
 create_fdt_socket_cpus()
Date: Wed, 11 Jan 2023 14:09:42 -0300
Message-Id: <20230111170948.316276-5-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230111170948.316276-1-dbarboza@ventanamicro.com>
References: <20230111170948.316276-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::29;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x29.google.com
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

create_fdt_socket_cpus() writes a different 'mmu-type' value if we're
running in 32 or 64 bits. However, the flag is being calculated during
virt_machine_init(), and is passed around in create_fdt(), then
create_fdt_socket(), and then finally create_fdt_socket_cpus(). None of
the intermediate functions are using the flag, which is a bit
misleading.

Remove 'is_32_bit' flag from create_fdt_socket_cpus() and calculate it
using the already available RISCVVirtState pointer. This will also
change the signature of create_fdt_socket() and create_fdt(), making it
clear that these functions don't do anything special when we're running
in 32 bit mode.

Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/virt.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
index 89c99ec1af..99a0a43a73 100644
--- a/hw/riscv/virt.c
+++ b/hw/riscv/virt.c
@@ -223,12 +223,13 @@ static void create_pcie_irq_map(RISCVVirtState *s, void *fdt, char *nodename,
 
 static void create_fdt_socket_cpus(RISCVVirtState *s, int socket,
                                    char *clust_name, uint32_t *phandle,
-                                   bool is_32_bit, uint32_t *intc_phandles)
+                                   uint32_t *intc_phandles)
 {
     int cpu;
     uint32_t cpu_phandle;
     MachineState *mc = MACHINE(s);
     char *name, *cpu_name, *core_name, *intc_name;
+    bool is_32_bit = riscv_is_32bit(&s->soc[0]);
 
     for (cpu = s->soc[socket].num_harts - 1; cpu >= 0; cpu--) {
         cpu_phandle = (*phandle)++;
@@ -721,7 +722,7 @@ static void create_fdt_pmu(RISCVVirtState *s)
 }
 
 static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
-                               bool is_32_bit, uint32_t *phandle,
+                               uint32_t *phandle,
                                uint32_t *irq_mmio_phandle,
                                uint32_t *irq_pcie_phandle,
                                uint32_t *irq_virtio_phandle,
@@ -750,7 +751,7 @@ static void create_fdt_sockets(RISCVVirtState *s, const MemMapEntry *memmap,
         qemu_fdt_add_subnode(mc->fdt, clust_name);
 
         create_fdt_socket_cpus(s, socket, clust_name, phandle,
-            is_32_bit, &intc_phandles[phandle_pos]);
+                               &intc_phandles[phandle_pos]);
 
         create_fdt_socket_memory(s, memmap, socket);
 
@@ -998,8 +999,7 @@ static void create_fdt_fw_cfg(RISCVVirtState *s, const MemMapEntry *memmap)
     g_free(nodename);
 }
 
-static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
-                       bool is_32_bit)
+static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap)
 {
     MachineState *mc = MACHINE(s);
     uint32_t phandle = 1, irq_mmio_phandle = 1, msi_pcie_phandle = 1;
@@ -1031,9 +1031,9 @@ static void create_fdt(RISCVVirtState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#size-cells", 0x2);
     qemu_fdt_setprop_cell(mc->fdt, "/soc", "#address-cells", 0x2);
 
-    create_fdt_sockets(s, memmap, is_32_bit, &phandle,
-        &irq_mmio_phandle, &irq_pcie_phandle, &irq_virtio_phandle,
-        &msi_pcie_phandle);
+    create_fdt_sockets(s, memmap, &phandle, &irq_mmio_phandle,
+                       &irq_pcie_phandle, &irq_virtio_phandle,
+                       &msi_pcie_phandle);
 
     create_fdt_virtio(s, memmap, irq_virtio_phandle);
 
@@ -1499,7 +1499,7 @@ static void virt_machine_init(MachineState *machine)
     virt_flash_map(s, system_memory);
 
     /* create device tree */
-    create_fdt(s, memmap, riscv_is_32bit(&s->soc[0]));
+    create_fdt(s, memmap);
 
     s->machine_done.notify = virt_machine_done;
     qemu_add_machine_init_done_notifier(&s->machine_done);
-- 
2.39.0


