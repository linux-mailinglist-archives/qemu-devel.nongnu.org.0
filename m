Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F1C1F67A4EC
	for <lists+qemu-devel@lfdr.de>; Tue, 24 Jan 2023 22:24:00 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKQkm-0004VS-No; Tue, 24 Jan 2023 16:22:52 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pKQkk-0004UA-8o
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:22:50 -0500
Received: from mail-oa1-x33.google.com ([2001:4860:4864:20::33])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <dbarboza@ventanamicro.com>)
 id 1pKQkh-0006wp-M9
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 16:22:50 -0500
Received: by mail-oa1-x33.google.com with SMTP id
 586e51a60fabf-15bb8ec196aso19215649fac.3
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 13:22:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ventanamicro.com; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4rcy7RleHLW71LrubQ0IIOd3Tz8Ha7NuXovJo1YjIDM=;
 b=cY5iYKCv+zZjlfpNxbgj0u72QoDHNDHp3X/xO2+162QT0yHhKg3swLfrZ5PrNUXxYL
 PsapH31798RK4lWpNmsgCcaXM7zjI6CklbRUByzLCa/cjaDIxqJ/iit6WgHjHM3+UcBh
 G1ax6HEST8SuM2oZig4WnLsieZL2rxFGkMgCs/ub+REPbDHxoERiiY0eOYOKMsosWNED
 Utz8yXtySTv325jWMBslIOfZEh4GMbnuwFRZKJ1GLQIjhBDHUQ0G74MaPwKIJnsOtjzn
 +7jofnv3DPcZzqg4GPnQPWz8bsTDl2GYyqPydXrji6vdotZc27GGHrX/ibcP28nWaO3l
 Z/BQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4rcy7RleHLW71LrubQ0IIOd3Tz8Ha7NuXovJo1YjIDM=;
 b=IqQNYFF/ZHvtZDnaa/+2+VSoxXYXd/oXR+llbd2TogaAVf7NpoLqTyCH5UgcH6bHmQ
 CSGJJ4xAv9IxMJIpk/ZyH3/HcN0e299KJjIVaHNseNTVy3zd+d4bgk4bPq1sp9MCv2/S
 8oszwORuG2z66bOadnCysrqqHbSmgNYPFjhUzcF017IxQ9vJpG2ql9zNxg+xyXAyp3Of
 jDf9wu5j8XPq/MA+seQv/qay0ucUydePMOLJZiANAXn7Rpz+EO6Z1NVSqxm+wip72BQA
 rL6Cech0WQKbL4bV6FzVbIZ6cmuciOwuFnnGpJQ60VvKBuhesXaDCK4g2WZ2778DhhRK
 rAmw==
X-Gm-Message-State: AFqh2kr1lSlGFQWr3g2vy9vjCVCdvtqRX6ZMzRK3Li5LCQJKQCbhsqRY
 Aj/PYibXamcpaClMJSjERrKBLmYHT+RsPsegwps=
X-Google-Smtp-Source: AMrXdXsk6HyoIva76mmUihlrPRfZhVV8kIvHI/sYKbM063NLfYoMfFhSeZ6a7fOgRN0vYp7XF/hrgA==
X-Received: by 2002:a05:6870:6c1c:b0:15f:1c2:230b with SMTP id
 na28-20020a0568706c1c00b0015f01c2230bmr19263916oab.43.1674595366273; 
 Tue, 24 Jan 2023 13:22:46 -0800 (PST)
Received: from grind.dc1.ventanamicro.com (200-148-13-157.dsl.telesp.net.br.
 [200.148.13.157]) by smtp.gmail.com with ESMTPSA id
 go3-20020a056870da0300b0014474019e50sm1212306oab.24.2023.01.24.13.22.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 Jan 2023 13:22:45 -0800 (PST)
From: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
To: qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, alistair.francis@wdc.com,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v4 3/3] hw/riscv/spike.c: rename MachineState 'mc' pointers
 to' ms'
Date: Tue, 24 Jan 2023 18:22:34 -0300
Message-Id: <20230124212234.412630-4-dbarboza@ventanamicro.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230124212234.412630-1-dbarboza@ventanamicro.com>
References: <20230124212234.412630-1-dbarboza@ventanamicro.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::33;
 envelope-from=dbarboza@ventanamicro.com; helo=mail-oa1-x33.google.com
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

Follow the QEMU convention of naming MachineState pointers as 'ms' by
renaming the instances where we're calling it 'mc'.

Suggested-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Signed-off-by: Daniel Henrique Barboza <dbarboza@ventanamicro.com>
---
 hw/riscv/spike.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/hw/riscv/spike.c b/hw/riscv/spike.c
index 483581e05f..4cc877bea9 100644
--- a/hw/riscv/spike.c
+++ b/hw/riscv/spike.c
@@ -56,7 +56,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     uint64_t addr, size;
     unsigned long clint_addr;
     int cpu, socket;
-    MachineState *mc = MACHINE(s);
+    MachineState *ms = MACHINE(s);
     uint32_t *clint_cells;
     uint32_t cpu_phandle, intc_phandle, phandle = 1;
     char *name, *mem_name, *clint_name, *clust_name;
@@ -65,7 +65,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
         "sifive,clint0", "riscv,clint0"
     };
 
-    fdt = mc->fdt = create_device_tree(&fdt_size);
+    fdt = ms->fdt = create_device_tree(&fdt_size);
     if (!fdt) {
         error_report("create_device_tree() failed");
         exit(1);
@@ -96,7 +96,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
     qemu_fdt_setprop_cell(fdt, "/cpus", "#address-cells", 0x1);
     qemu_fdt_add_subnode(fdt, "/cpus/cpu-map");
 
-    for (socket = (riscv_socket_count(mc) - 1); socket >= 0; socket--) {
+    for (socket = (riscv_socket_count(ms) - 1); socket >= 0; socket--) {
         clust_name = g_strdup_printf("/cpus/cpu-map/cluster%d", socket);
         qemu_fdt_add_subnode(fdt, clust_name);
 
@@ -121,7 +121,7 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             qemu_fdt_setprop_cell(fdt, cpu_name, "reg",
                 s->soc[socket].hartid_base + cpu);
             qemu_fdt_setprop_string(fdt, cpu_name, "device_type", "cpu");
-            riscv_socket_fdt_write_id(mc, cpu_name, socket);
+            riscv_socket_fdt_write_id(ms, cpu_name, socket);
             qemu_fdt_setprop_cell(fdt, cpu_name, "phandle", cpu_phandle);
 
             intc_name = g_strdup_printf("%s/interrupt-controller", cpu_name);
@@ -147,14 +147,14 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             g_free(cpu_name);
         }
 
-        addr = memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(mc, socket);
-        size = riscv_socket_mem_size(mc, socket);
+        addr = memmap[SPIKE_DRAM].base + riscv_socket_mem_offset(ms, socket);
+        size = riscv_socket_mem_size(ms, socket);
         mem_name = g_strdup_printf("/memory@%lx", (long)addr);
         qemu_fdt_add_subnode(fdt, mem_name);
         qemu_fdt_setprop_cells(fdt, mem_name, "reg",
             addr >> 32, addr, size >> 32, size);
         qemu_fdt_setprop_string(fdt, mem_name, "device_type", "memory");
-        riscv_socket_fdt_write_id(mc, mem_name, socket);
+        riscv_socket_fdt_write_id(ms, mem_name, socket);
         g_free(mem_name);
 
         clint_addr = memmap[SPIKE_CLINT].base +
@@ -167,14 +167,14 @@ static void create_fdt(SpikeState *s, const MemMapEntry *memmap,
             0x0, clint_addr, 0x0, memmap[SPIKE_CLINT].size);
         qemu_fdt_setprop(fdt, clint_name, "interrupts-extended",
             clint_cells, s->soc[socket].num_harts * sizeof(uint32_t) * 4);
-        riscv_socket_fdt_write_id(mc, clint_name, socket);
+        riscv_socket_fdt_write_id(ms, clint_name, socket);
 
         g_free(clint_name);
         g_free(clint_cells);
         g_free(clust_name);
     }
 
-    riscv_socket_fdt_write_distance_matrix(mc);
+    riscv_socket_fdt_write_distance_matrix(ms);
 
     qemu_fdt_add_subnode(fdt, "/chosen");
     qemu_fdt_setprop_string(fdt, "/chosen", "stdout-path", "/htif");
-- 
2.39.1


