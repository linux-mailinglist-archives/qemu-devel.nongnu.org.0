Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BC11459204C
	for <lists+qemu-devel@lfdr.de>; Sun, 14 Aug 2022 16:58:24 +0200 (CEST)
Received: from localhost ([::1]:44196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oNF4J-0006iw-S9
	for lists+qemu-devel@lfdr.de; Sun, 14 Aug 2022 10:58:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF26-0002EG-Io
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:06 -0400
Received: from mail.xen0n.name ([115.28.160.31]:54610
 helo=mailbox.box.xen0n.name)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <i.qemu@xen0n.name>) id 1oNF22-0007Ov-Bp
 for qemu-devel@nongnu.org; Sun, 14 Aug 2022 10:56:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xen0n.name; s=mail;
 t=1660488953; bh=zWrIL0lZGhOH7n7egt4bN5g9dwIoAJ4aiT0lHuWmZIo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H23lnpAinse//L01CqBG21iykm+hxwA8bnWkdG8vtairn0Qfy1fECGZGtXkADqDSj
 KkUhP1sSMO8Aa1d7u6IPH56hcf2LxzM39jwDWnqa0pWgA2WkSDVYbVHZwDtEEzwMgJ
 rs1n+9qj0/D+xzsHJxMqNF6SQyVSRGmE1EdNKWRA=
Received: from ld50.lan (unknown [101.88.24.16])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mailbox.box.xen0n.name (Postfix) with ESMTPSA id DEB8560689;
 Sun, 14 Aug 2022 22:55:52 +0800 (CST)
From: WANG Xuerui <i.qemu@xen0n.name>
To: qemu-devel@nongnu.org
Cc: WANG Xuerui <i.qemu@xen0n.name>,
 Richard Henderson <richard.henderson@linaro.org>,
 Song Gao <gaosong@loongson.cn>, Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 WANG Xuerui <git@xen0n.name>
Subject: [PATCH for-7.1 3/4] target/loongarch: rename the TCG CPU "la464" to
 "qemu64-v1.00"
Date: Sun, 14 Aug 2022 22:55:21 +0800
Message-Id: <20220814145522.1474927-4-i.qemu@xen0n.name>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220814145351.1474753-1-git@xen0n.name>
References: <20220814145351.1474753-1-git@xen0n.name>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=115.28.160.31; envelope-from=i.qemu@xen0n.name;
 helo=mailbox.box.xen0n.name
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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

From: WANG Xuerui <git@xen0n.name>

The only LoongArch CPU implemented is modeled after the Loongson 3A5000,
but it is not the real thing, and at least one feature [1] is missing
that actually made the model incompatible with the real 3A5000. What's
more, the model is currently named "la464", while none of the
micro-architecture-specific things are currently present, further making
things needlessly complex.

In general, high-fidelity models can and should be named after the real
hardware model, while generic emulation-oriented models should be named
after ISA levels. For now, the best reference for LoongArch ISA levels
is the revision number of the LoongArch ISA Manual, of which v1.00 is
still the latest. (v1.01 and v1.02 are minor revisions without
substantive change.)

As defined by various specs, the vendor and model names are also
reflected in respective CSRs, and are 8 bytes long. So, rename "la464"
to "qemu64-v1.00", with "QEMU64" as vendor name and "v1.00" as model
name.

As the QEMU 7.1 hasn't been officially released, no downstream is
expected to depend on the old name, so this change should be safe for
7.1.

[1]: https://lore.kernel.org/loongarch/20220726094049.7200-2-maobibo@loongson.cn/

Signed-off-by: WANG Xuerui <git@xen0n.name>
---
 hw/loongarch/virt.c    | 14 ++------------
 target/loongarch/cpu.c |  6 +++---
 2 files changed, 5 insertions(+), 15 deletions(-)

diff --git a/hw/loongarch/virt.c b/hw/loongarch/virt.c
index 5cc0b05538..35e2174a17 100644
--- a/hw/loongarch/virt.c
+++ b/hw/loongarch/virt.c
@@ -626,7 +626,6 @@ static void loongarch_direct_kernel_boot(LoongArchMachineState *lams)
 static void loongarch_init(MachineState *machine)
 {
     LoongArchCPU *lacpu;
-    const char *cpu_model = machine->cpu_type;
     ram_addr_t offset = 0;
     ram_addr_t ram_size = machine->ram_size;
     uint64_t highram_size = 0;
@@ -634,15 +633,6 @@ static void loongarch_init(MachineState *machine)
     LoongArchMachineState *lams = LOONGARCH_MACHINE(machine);
     int i;
 
-    if (!cpu_model) {
-        cpu_model = LOONGARCH_CPU_TYPE_NAME("la464");
-    }
-
-    if (!strstr(cpu_model, "la464")) {
-        error_report("LoongArch/TCG needs cpu type la464");
-        exit(1);
-    }
-
     if (ram_size < 1 * GiB) {
         error_report("ram_size must be greater than 1G.");
         exit(1);
@@ -749,10 +739,10 @@ static void loongarch_class_init(ObjectClass *oc, void *data)
 {
     MachineClass *mc = MACHINE_CLASS(oc);
 
-    mc->desc = "Loongson-3A5000 LS7A1000 machine";
+    mc->desc = "LoongArch64 v1.00-compatible LS7A1000 machine";
     mc->init = loongarch_init;
     mc->default_ram_size = 1 * GiB;
-    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("la464");
+    mc->default_cpu_type = LOONGARCH_CPU_TYPE_NAME("qemu64-v1.00");
     mc->default_ram_id = "loongarch.ram";
     mc->max_cpus = LOONGARCH_MAX_VCPUS;
     mc->is_default = 1;
diff --git a/target/loongarch/cpu.c b/target/loongarch/cpu.c
index 4663539443..0a41509a0c 100644
--- a/target/loongarch/cpu.c
+++ b/target/loongarch/cpu.c
@@ -527,9 +527,9 @@ static uint64_t loongarch_qemu_read(void *opaque, hwaddr addr, unsigned size)
         return 1ULL << IOCSRF_MSI | 1ULL << IOCSRF_EXTIOI |
                1ULL << IOCSRF_CSRIPI;
     case VENDOR_REG:
-        return 0x6e6f73676e6f6f4cULL; /* "Loongson" */
+        return 0x3436554d4551ULL; /* "QEMU64" */
     case CPUNAME_REG:
-        return 0x303030354133ULL;     /* "3A5000" */
+        return 0x30302e3176ULL;   /* "v1.00" */
     case MISC_FUNC_REG:
         return 1ULL << IOCSRM_EXTIOI_EN;
     }
@@ -715,7 +715,7 @@ static const TypeInfo loongarch_cpu_type_infos[] = {
         .class_size = sizeof(LoongArchCPUClass),
         .class_init = loongarch_cpu_class_init,
     },
-    DEFINE_LOONGARCH_CPU_TYPE("la464", loongarch_la464_initfn),
+    DEFINE_LOONGARCH_CPU_TYPE("qemu64-v1.00", loongarch_la464_initfn),
 };
 
 DEFINE_TYPES(loongarch_cpu_type_infos)
-- 
2.35.1


