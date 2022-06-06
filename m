Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B382553F2D8
	for <lists+qemu-devel@lfdr.de>; Tue,  7 Jun 2022 01:57:43 +0200 (CEST)
Received: from localhost ([::1]:53242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nyMbO-0000hy-Qo
	for lists+qemu-devel@lfdr.de; Mon, 06 Jun 2022 19:57:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35326)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwj-00020f-Pc
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:41 -0400
Received: from mail-qv1-xf32.google.com ([2607:f8b0:4864:20::f32]:46607)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyLwi-0004Dt-4J
 for qemu-devel@nongnu.org; Mon, 06 Jun 2022 19:15:41 -0400
Received: by mail-qv1-xf32.google.com with SMTP id i19so11219392qvu.13
 for <qemu-devel@nongnu.org>; Mon, 06 Jun 2022 16:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uZjEvo9GMFlkuMLkq+K2BJi7c5aSV3GulJEu6QszExE=;
 b=VCKnCysrMvr5mY5CPue62+5vmcgev7/RLQaLkr1Qa7AoaICgQoGZiTtz3CKi1RrlVr
 Bi7rHzs78osVccrZtbJ0a88xqsI3dYWTFsLtrUvX0Ep5z63IECqE2WTfAH7sSmGQDX5X
 BL1+F5qNt4MKenGXLo03ghNBTamvygZlNOxdwa24hZNL3c8rWtYMFqHb1OXdvczxxVl+
 2tbzoHBNIoW0sOGrL9XMjqiDsaKXRevsiEW0QpWbP4zt8GOGTRrjVLBRwiUuh7IL1CYr
 6SalJx8Tsp8JSfqNPrCjpsTC9BzChemYAwVTnYUwSFjoWBtS+MRuEMWvzXJ3o7ZOUtin
 DjBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uZjEvo9GMFlkuMLkq+K2BJi7c5aSV3GulJEu6QszExE=;
 b=Zuzmk4KJ9RSGjfw5JC/KVjpZL7VCpfMfnX+FDLJOmXLIVjXhAA9X+iX/GLrYqXKWt1
 dfu6omMATIdK7/CC3cJ0u/EMJn92Ggsp66a7GiG3JlF87cfzMy7drl61aeru2MV29rCC
 FmZKtw3yWEWVq9VmJpNMipjGsyGrCDrcLq0QdFZQVkK69EaqzFXlkA+Om5FG3ptOFYs8
 wOEJCPjITVLAn99dngfYdQW0ERqPxGi6FCCrHNx0WgUjBIZyKM0ww5tzLopL3ZtBOWwS
 eWCVl7KNap8N15Dld9IwU0mTlafolaJytD1bAh+Rpn3OyR1L4o4NtdLn+Je/qglK9+Q7
 ctiA==
X-Gm-Message-State: AOAM533fiq9r8h1h6GcmAv4x5evEjrDk3/GRr7V6T0HRYak7iWsD5oDT
 G+IWlHzVG+DLVOJwkh5wniZrx+5FrNgF6g==
X-Google-Smtp-Source: ABdhPJzQojLvdx8Fl2MK7qxvjTJ6NDE3BDc9lGDUg0hGf5bwWWYxEYoyxsQXUTafvDAEuMp0Zjb5XA==
X-Received: by 2002:a17:902:8492:b0:167:6cbf:145b with SMTP id
 c18-20020a170902849200b001676cbf145bmr12220375plo.26.1654557328811; 
 Mon, 06 Jun 2022 16:15:28 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:dd1c:9738:3e40:ffe0])
 by smtp.gmail.com with ESMTPSA id
 2-20020a170902c24200b00162523fdb8fsm10954623plg.252.2022.06.06.16.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 Jun 2022 16:15:28 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: =gaosong@loongson.cn, yangxiaojuan@loongson.cn,
 Song Gao <gaosong@loongson.cn>
Subject: [PULL 39/43] hw/loongarch: Add LoongArch load elf function.
Date: Mon,  6 Jun 2022 16:14:46 -0700
Message-Id: <20220606231450.448443-40-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220606231450.448443-1-richard.henderson@linaro.org>
References: <20220606231450.448443-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::f32;
 envelope-from=richard.henderson@linaro.org; helo=mail-qv1-xf32.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Xiaojuan Yang <yangxiaojuan@loongson.cn>

Signed-off-by: Xiaojuan Yang <yangxiaojuan@loongson.cn>
Signed-off-by: Song Gao <gaosong@loongson.cn>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20220606124333.2060567-40-yangxiaojuan@loongson.cn>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/loongarch/cpu.h   |  2 ++
 hw/loongarch/loongson3.c | 61 ++++++++++++++++++++++++++++++++++++++--
 2 files changed, 61 insertions(+), 2 deletions(-)

diff --git a/target/loongarch/cpu.h b/target/loongarch/cpu.h
index 03cc96ee9b..71a5036c3c 100644
--- a/target/loongarch/cpu.h
+++ b/target/loongarch/cpu.h
@@ -308,6 +308,8 @@ typedef struct CPUArchState {
     AddressSpace address_space_iocsr;
     MemoryRegion system_iocsr;
     MemoryRegion iocsr_mem;
+    bool load_elf;
+    uint64_t elf_address;
 } CPULoongArchState;
 
 /**
diff --git a/hw/loongarch/loongson3.c b/hw/loongarch/loongson3.c
index 95984c9086..3c8fcb828c 100644
--- a/hw/loongarch/loongson3.c
+++ b/hw/loongarch/loongson3.c
@@ -19,6 +19,8 @@
 #include "exec/address-spaces.h"
 #include "hw/irq.h"
 #include "net/net.h"
+#include "hw/loader.h"
+#include "elf.h"
 #include "hw/intc/loongarch_ipi.h"
 #include "hw/intc/loongarch_extioi.h"
 #include "hw/intc/loongarch_pch_pic.h"
@@ -29,6 +31,36 @@
 
 #include "target/loongarch/cpu.h"
 
+static struct _loaderparams {
+    uint64_t ram_size;
+    const char *kernel_filename;
+} loaderparams;
+
+static uint64_t cpu_loongarch_virt_to_phys(void *opaque, uint64_t addr)
+{
+    return addr & 0x1fffffffll;
+}
+
+static int64_t load_kernel_info(void)
+{
+    uint64_t kernel_entry, kernel_low, kernel_high;
+    ssize_t kernel_size;
+
+    kernel_size = load_elf(loaderparams.kernel_filename, NULL,
+                           cpu_loongarch_virt_to_phys, NULL,
+                           &kernel_entry, &kernel_low,
+                           &kernel_high, NULL, 0,
+                           EM_LOONGARCH, 1, 0);
+
+    if (kernel_size < 0) {
+        error_report("could not load kernel '%s': %s",
+                     loaderparams.kernel_filename,
+                     load_elf_strerror(kernel_size));
+        exit(1);
+    }
+    return kernel_entry;
+}
+
 static void loongarch_devices_init(DeviceState *pch_pic)
 {
     DeviceState *gpex_dev;
@@ -200,15 +232,29 @@ static void loongarch_irq_init(LoongArchMachineState *lams)
     loongarch_devices_init(pch_pic);
 }
 
+static void reset_load_elf(void *opaque)
+{
+    LoongArchCPU *cpu = opaque;
+    CPULoongArchState *env = &cpu->env;
+
+    cpu_reset(CPU(cpu));
+    if (env->load_elf) {
+        cpu_set_pc(CPU(cpu), env->elf_address);
+    }
+}
+
 static void loongarch_init(MachineState *machine)
 {
     const char *cpu_model = machine->cpu_type;
+    const char *kernel_filename = machine->kernel_filename;
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
     MemoryRegion *address_space_mem = get_system_memory();
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
+    LoongArchCPU *lacpu;
     int i;
+    int64_t kernel_addr = 0;
 
     if (!cpu_model) {
         cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
@@ -234,17 +280,28 @@ static void loongarch_init(MachineState *machine)
                              machine->ram, 0, 256 * MiB);
     memory_region_add_subregion(address_space_mem, offset, &lams->lowmem);
     offset += 256 * MiB;
-
     highram_size = ram_size - 256 * MiB;
     memory_region_init_alias(&lams->highmem, NULL, "loongarch.highmem",
                              machine->ram, offset, highram_size);
     memory_region_add_subregion(address_space_mem, 0x90000000, &lams->highmem);
-
     /* Add isa io region */
     memory_region_init_alias(&lams->isa_io, NULL, "isa-io",
                              get_system_io(), 0, LOONGARCH_ISA_IO_SIZE);
     memory_region_add_subregion(address_space_mem, LOONGARCH_ISA_IO_BASE,
                                 &lams->isa_io);
+    if (kernel_filename) {
+        loaderparams.ram_size = ram_size;
+        loaderparams.kernel_filename = kernel_filename;
+        kernel_addr = load_kernel_info();
+        if (!machine->firmware) {
+            for (i = 0; i < machine->smp.cpus; i++) {
+                lacpu = LOONGARCH_CPU(qemu_get_cpu(i));
+                lacpu->env.load_elf = true;
+                lacpu->env.elf_address = kernel_addr;
+                qemu_register_reset(reset_load_elf, lacpu);
+            }
+        }
+    }
     /* Initialize the IO interrupt subsystem */
     loongarch_irq_init(lams);
 }
-- 
2.34.1


