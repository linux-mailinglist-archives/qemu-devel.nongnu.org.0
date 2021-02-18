Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CEA1731E429
	for <lists+qemu-devel@lfdr.de>; Thu, 18 Feb 2021 03:02:33 +0100 (CET)
Received: from localhost ([::1]:36454 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lCYeG-000888-Sn
	for lists+qemu-devel@lfdr.de; Wed, 17 Feb 2021 21:02:32 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbt-0006N7-Sg
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:05 -0500
Received: from esa6.hgst.iphmx.com ([216.71.154.45]:40586)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1)
 (envelope-from <prvs=6763bdb70=alistair.francis@wdc.com>)
 id 1lCYbo-0008Jj-Oq
 for qemu-devel@nongnu.org; Wed, 17 Feb 2021 21:00:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1613613601; x=1645149601;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=MxxErviSFL4sQLlXwiV0nJ9t4fyQKIFMVx6LDbNqKbA=;
 b=UH0P0qPNHBmbG56mF4+WwosqUPaFFENsSZbYUhWC/6JRMc0h8teZyLVD
 qCJPb3yCNkl+SBs0fs1HK3ALmlPuYN3mnVsS9778BfiuwwKvgxiGT3qDu
 tkJOY8idAi08fvwJrn/IsFh7zm+n1576zNRc0rSi6+e0BTxKwqKr+j95Q
 sb31T9YfSFqV6lu6L6zrJaKL5o3dK2GxWPlAZvgXXiymSTkTDp8/L1V0i
 XBbxr+hJ+/PIqkP8KQvaXiAX7G/PSiV1ioph1ElQuIdTtVl2dUOtPJtdQ
 CdNQ3DicAjsiflyzGnlZ4q2SNRSmqH6TAm/xuEMx8fTDuaFdFpDgYtKOF A==;
IronPort-SDR: PITcWSiTO2ltfDCjBbgmioqMsjQ8rjqbU3jwKmx+4wfsyEDArUxDdpYhurUFROz4W3bCQ88zpD
 Lim+59VippI1VjTAnLl+95aqF0TmhiKdDMiNOq7YFeZax3895peUnCIB9LJ+KGZh+hBswi9FD+
 vDNYW5LfDcaB+6nI+ettHg5x13WLsVw3En6kJYM8YTVURXrbGtDxcWR0u4JR/d4l57fyIYZzm3
 jIDVsKZBewOQ7X56e2tq8V9iaWgU/kZj6ZzC60RmPFWDmVY/6UoEH4mk+188O+EfhIVR6aUqJe
 9pg=
X-IronPort-AV: E=Sophos;i="5.81,185,1610380800"; d="scan'208";a="161392118"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 18 Feb 2021 09:59:58 +0800
IronPort-SDR: s/NZeSar+cxwx5L7WloXbdqyb15PftzbTGMusSKoZYo3MUcXK5cB5oHAkGR43VryLluWRBzN4c
 sDch9zKXkD73cO9CzA+kJ0+MyQ1LIyVlsMhzkSKxbHO88ehKU51KzkOYRDeWKsajBE+mqN0nLJ
 zCzxTuZrtXyhq8mhTtbEneqCMmBZlETCl2RW8XcuHLpyogOtmy14MgUsDxtPLV9IxP0lcrSEiV
 /bl/Kmc8tcxc7AKIckusp1mdMitOL5anf2Ov9MkouJ+yyx6nFhZ7mtgk5GBKiqPyx65+MFKCBI
 byugDQMPHEVHe9BHec+Zwc2y
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Feb 2021 17:43:28 -0800
IronPort-SDR: PxvXyEswN2BIEkAUCkDUF60yg6r/r/J+3wHXaA+0y2Vtzk3/h5R0oJE1dH0tGHX7DDEzTaGuAM
 /ZdH+pa+YY4NdRU4gvvlv2bkiw6tbNxK6P6a4aghG2faPt4XH1tiwG9Gl35FXu2ILhtRNuXyuV
 Qx+vANd6THU9WoOOBNF/UijkNdgz2jlz80LEsOUm9x4VY0HPgk5zIISG5X3QTJVPip3sBIZpZp
 94uroXZAwUl+sGLmTWHdpgl3BUcwOzKBsa59CsqGchyw3jYmjg5dCpohlEYtrJ72lbjmjvc+r7
 DVM=
WDCIronportException: Internal
Received: from cn57xfd72.ad.shared (HELO alistair-risc6-laptop.hgst.com)
 ([10.86.48.43])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Feb 2021 17:59:58 -0800
From: Alistair Francis <alistair.francis@wdc.com>
To: peter.maydell@linaro.org
Subject: [PULL 04/19] target-riscv: support QMP dump-guest-memory
Date: Wed, 17 Feb 2021 17:59:19 -0800
Message-Id: <20210218015934.1623959-5-alistair.francis@wdc.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210218015934.1623959-1-alistair.francis@wdc.com>
References: <20210218015934.1623959-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.71.154.45;
 envelope-from=prvs=6763bdb70=alistair.francis@wdc.com;
 helo=esa6.hgst.iphmx.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Andrew Jones <drjones@redhat.com>, Mingwang Li <limingwang@huawei.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, qemu-devel@nongnu.org,
 Alistair Francis <alistair.francis@wdc.com>, alistair23@gmail.com,
 Yifei Jiang <jiangyifei@huawei.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Yifei Jiang <jiangyifei@huawei.com>

Add the support needed for creating prstatus elf notes. This allows
us to use QMP dump-guest-memory.

Now ELF notes of RISC-V only contain prstatus elf notes.

Signed-off-by: Yifei Jiang <jiangyifei@huawei.com>
Signed-off-by: Mingwang Li <limingwang@huawei.com>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Andrew Jones <drjones@redhat.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
Message-id: 20210201124458.1248-2-jiangyifei@huawei.com
Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
---
 target/riscv/cpu.h       |   4 +
 target/riscv/cpu_bits.h  |   1 +
 target/riscv/arch_dump.c | 202 +++++++++++++++++++++++++++++++++++++++
 target/riscv/cpu.c       |   2 +
 target/riscv/meson.build |   1 +
 5 files changed, 210 insertions(+)
 create mode 100644 target/riscv/arch_dump.c

diff --git a/target/riscv/cpu.h b/target/riscv/cpu.h
index 419a21478c..0edb2826a2 100644
--- a/target/riscv/cpu.h
+++ b/target/riscv/cpu.h
@@ -323,6 +323,10 @@ extern const char * const riscv_intr_names[];
 
 const char *riscv_cpu_get_trap_name(target_ulong cause, bool async);
 void riscv_cpu_do_interrupt(CPUState *cpu);
+int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque);
+int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque);
 int riscv_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
 int riscv_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
 bool riscv_cpu_exec_interrupt(CPUState *cs, int interrupt_request);
diff --git a/target/riscv/cpu_bits.h b/target/riscv/cpu_bits.h
index 4196ef8b69..caf4599207 100644
--- a/target/riscv/cpu_bits.h
+++ b/target/riscv/cpu_bits.h
@@ -368,6 +368,7 @@
 #define MSTATUS_MIE         0x00000008
 #define MSTATUS_UPIE        0x00000010
 #define MSTATUS_SPIE        0x00000020
+#define MSTATUS_UBE         0x00000040
 #define MSTATUS_MPIE        0x00000080
 #define MSTATUS_SPP         0x00000100
 #define MSTATUS_MPP         0x00001800
diff --git a/target/riscv/arch_dump.c b/target/riscv/arch_dump.c
new file mode 100644
index 0000000000..709f621d82
--- /dev/null
+++ b/target/riscv/arch_dump.c
@@ -0,0 +1,202 @@
+/* Support for writing ELF notes for RISC-V architectures
+ *
+ * Copyright (C) 2021 Huawei Technologies Co., Ltd
+ *
+ * This program is free software; you can redistribute it and/or modify it
+ * under the terms and conditions of the GNU General Public License,
+ * version 2 or later, as published by the Free Software Foundation.
+ *
+ * This program is distributed in the hope it will be useful, but WITHOUT
+ * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
+ * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License for
+ * more details.
+ *
+ * You should have received a copy of the GNU General Public License along with
+ * this program.  If not, see <http://www.gnu.org/licenses/>.
+ */
+
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "elf.h"
+#include "sysemu/dump.h"
+
+/* struct user_regs_struct from arch/riscv/include/uapi/asm/ptrace.h */
+struct riscv64_user_regs {
+    uint64_t pc;
+    uint64_t regs[31];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv64_user_regs) != 256);
+
+/* struct elf_prstatus from include/linux/elfcore.h */
+struct riscv64_elf_prstatus {
+    char pad1[32]; /* 32 == offsetof(struct elf_prstatus, pr_pid) */
+    uint32_t pr_pid;
+    char pad2[76]; /* 76 == offsetof(struct elf_prstatus, pr_reg) -
+                            offsetof(struct elf_prstatus, pr_ppid) */
+    struct riscv64_user_regs pr_reg;
+    char pad3[8];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv64_elf_prstatus) != 376);
+
+struct riscv64_note {
+    Elf64_Nhdr hdr;
+    char name[8]; /* align_up(sizeof("CORE"), 4) */
+    struct riscv64_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+#define RISCV64_NOTE_HEADER_SIZE offsetof(struct riscv64_note, prstatus)
+#define RISCV64_PRSTATUS_NOTE_SIZE \
+            (RISCV64_NOTE_HEADER_SIZE + sizeof(struct riscv64_elf_prstatus))
+
+static void riscv64_note_init(struct riscv64_note *note, DumpState *s,
+                              const char *name, Elf64_Word namesz,
+                              Elf64_Word type, Elf64_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, name, namesz);
+}
+
+int riscv_cpu_write_elf64_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque)
+{
+    struct riscv64_note note;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    DumpState *s = opaque;
+    int ret, i = 0;
+    const char name[] = "CORE";
+
+    riscv64_note_init(&note, s, name, sizeof(name),
+                      NT_PRSTATUS, sizeof(note.prstatus));
+
+    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+
+    note.prstatus.pr_reg.pc = cpu_to_dump64(s, env->pc);
+
+    for (i = 0; i < 31; i++) {
+        note.prstatus.pr_reg.regs[i] = cpu_to_dump64(s, env->gpr[i + 1]);
+    }
+
+    ret = f(&note, RISCV64_PRSTATUS_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return ret;
+}
+
+struct riscv32_user_regs {
+    uint32_t pc;
+    uint32_t regs[31];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv32_user_regs) != 128);
+
+struct riscv32_elf_prstatus {
+    char pad1[24]; /* 24 == offsetof(struct elf_prstatus, pr_pid) */
+    uint32_t pr_pid;
+    char pad2[44]; /* 44 == offsetof(struct elf_prstatus, pr_reg) -
+                            offsetof(struct elf_prstatus, pr_ppid) */
+    struct riscv32_user_regs pr_reg;
+    char pad3[4];
+} QEMU_PACKED;
+
+QEMU_BUILD_BUG_ON(sizeof(struct riscv32_elf_prstatus) != 204);
+
+struct riscv32_note {
+    Elf32_Nhdr hdr;
+    char name[8]; /* align_up(sizeof("CORE"), 4) */
+    struct riscv32_elf_prstatus prstatus;
+} QEMU_PACKED;
+
+#define RISCV32_NOTE_HEADER_SIZE offsetof(struct riscv32_note, prstatus)
+#define RISCV32_PRSTATUS_NOTE_SIZE \
+            (RISCV32_NOTE_HEADER_SIZE + sizeof(struct riscv32_elf_prstatus))
+
+static void riscv32_note_init(struct riscv32_note *note, DumpState *s,
+                              const char *name, Elf32_Word namesz,
+                              Elf32_Word type, Elf32_Word descsz)
+{
+    memset(note, 0, sizeof(*note));
+
+    note->hdr.n_namesz = cpu_to_dump32(s, namesz);
+    note->hdr.n_descsz = cpu_to_dump32(s, descsz);
+    note->hdr.n_type = cpu_to_dump32(s, type);
+
+    memcpy(note->name, name, namesz);
+}
+
+int riscv_cpu_write_elf32_note(WriteCoreDumpFunction f, CPUState *cs,
+                               int cpuid, void *opaque)
+{
+    struct riscv32_note note;
+    RISCVCPU *cpu = RISCV_CPU(cs);
+    CPURISCVState *env = &cpu->env;
+    DumpState *s = opaque;
+    int ret, i;
+    const char name[] = "CORE";
+
+    riscv32_note_init(&note, s, name, sizeof(name),
+                      NT_PRSTATUS, sizeof(note.prstatus));
+
+    note.prstatus.pr_pid = cpu_to_dump32(s, cpuid);
+
+    note.prstatus.pr_reg.pc = cpu_to_dump32(s, env->pc);
+
+    for (i = 0; i < 31; i++) {
+        note.prstatus.pr_reg.regs[i] = cpu_to_dump32(s, env->gpr[i + 1]);
+    }
+
+    ret = f(&note, RISCV32_PRSTATUS_NOTE_SIZE, s);
+    if (ret < 0) {
+        return -1;
+    }
+
+    return ret;
+}
+
+int cpu_get_dump_info(ArchDumpInfo *info,
+                      const GuestPhysBlockList *guest_phys_blocks)
+{
+    RISCVCPU *cpu;
+    CPURISCVState *env;
+
+    if (first_cpu == NULL) {
+        return -1;
+    }
+    cpu = RISCV_CPU(first_cpu);
+    env = &cpu->env;
+
+    info->d_machine = EM_RISCV;
+
+#if defined(TARGET_RISCV64)
+    info->d_class = ELFCLASS64;
+#else
+    info->d_class = ELFCLASS32;
+#endif
+
+    info->d_endian = (env->mstatus & MSTATUS_UBE) != 0
+                     ? ELFDATA2MSB : ELFDATA2LSB;
+
+    return 0;
+}
+
+ssize_t cpu_get_note_size(int class, int machine, int nr_cpus)
+{
+    size_t note_size;
+
+    if (class == ELFCLASS64) {
+        note_size = RISCV64_PRSTATUS_NOTE_SIZE;
+    } else {
+        note_size = RISCV32_PRSTATUS_NOTE_SIZE;
+    }
+
+    return note_size * nr_cpus;
+}
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 16f1a34238..ddea8fbeeb 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -624,6 +624,8 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
+    cc->write_elf64_note = riscv_cpu_write_elf64_note;
+    cc->write_elf32_note = riscv_cpu_write_elf32_note;
 #endif
     cc->gdb_arch_name = riscv_gdb_arch_name;
     cc->gdb_get_dynamic_xml = riscv_gdb_get_dynamic_xml;
diff --git a/target/riscv/meson.build b/target/riscv/meson.build
index 14a5c62dac..88ab850682 100644
--- a/target/riscv/meson.build
+++ b/target/riscv/meson.build
@@ -26,6 +26,7 @@ riscv_ss.add(files(
 
 riscv_softmmu_ss = ss.source_set()
 riscv_softmmu_ss.add(files(
+  'arch_dump.c',
   'pmp.c',
   'monitor.c',
   'machine.c'
-- 
2.30.0


