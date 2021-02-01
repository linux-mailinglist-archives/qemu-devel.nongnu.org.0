Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DE16130A533
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:17:52 +0100 (CET)
Received: from localhost ([::1]:35196 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WHH-0000tC-TS
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:17:51 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9E-0000d4-Jz
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:32 -0500
Received: from mx2.suse.de ([195.135.220.15]:55656)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W98-0005q0-FR
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:32 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id E40C7AFFB;
 Mon,  1 Feb 2021 10:09:11 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 11/23] cpu: move do_unaligned_access to tcg_ops
Date: Mon,  1 Feb 2021 11:08:51 +0100
Message-Id: <20210201100903.17309-12-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=-0.01, RCVD_IN_MSPIKE_WL=-0.01, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 qemu-devel@nongnu.org, Roman Bolshakov <r.bolshakov@yadro.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

make it consistently SOFTMMU-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

[claudio: make the field presence in cpu.h unconditional, removing the ifdefs]
---
 include/hw/core/cpu.h           | 13 +++++++------
 target/alpha/cpu.c              |  2 +-
 target/arm/cpu.c                |  2 +-
 target/hppa/cpu.c               |  4 +++-
 target/microblaze/cpu.c         |  2 +-
 target/mips/cpu.c               |  3 ++-
 target/nios2/cpu.c              |  2 +-
 target/riscv/cpu.c              |  2 +-
 target/s390x/cpu.c              |  2 +-
 target/s390x/excp_helper.c      |  2 +-
 target/sh4/cpu.c                |  2 +-
 target/sparc/cpu.c              |  2 +-
 target/xtensa/cpu.c             |  2 +-
 target/ppc/translate_init.c.inc |  2 +-
 14 files changed, 23 insertions(+), 19 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 644ecbe959..9e0ca2a875 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -128,6 +128,12 @@ typedef struct TcgCpuOperations {
                                   unsigned size, MMUAccessType access_type,
                                   int mmu_idx, MemTxAttrs attrs,
                                   MemTxResult response, uintptr_t retaddr);
+    /**
+     * @do_unaligned_access: Callback for unaligned access handling
+     */
+    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr);
 } TcgCpuOperations;
 
 /**
@@ -137,8 +143,6 @@ typedef struct TcgCpuOperations {
  * @parse_features: Callback to parse command line arguments.
  * @reset_dump_flags: #CPUDumpFlags to use for reset logging.
  * @has_work: Callback for checking if there is work to do.
- * @do_unaligned_access: Callback for unaligned access handling, if
- * the target defines #TARGET_ALIGNED_ONLY.
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
  * runtime configurable endianness is currently big-endian. Non-configurable
  * CPUs can use the default implementation of this method. This method should
@@ -204,9 +208,6 @@ struct CPUClass {
 
     int reset_dump_flags;
     bool (*has_work)(CPUState *cpu);
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -885,7 +886,7 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+    cc->tcg_ops.do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
 }
 
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index a1696bebeb..0710298e5a 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -226,7 +226,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.tlb_fill = alpha_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.do_transaction_failed = alpha_cpu_do_transaction_failed;
-    cc->do_unaligned_access = alpha_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = alpha_cpu_do_unaligned_access;
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
 #endif
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index bd1882944c..aa264eec0a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2281,9 +2281,9 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
     cc->tcg_ops.debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
-    cc->do_unaligned_access = arm_cpu_do_unaligned_access;
 #if !defined(CONFIG_USER_ONLY)
     cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
+    cc->tcg_ops.do_unaligned_access = arm_cpu_do_unaligned_access;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
     cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
diff --git a/target/hppa/cpu.c b/target/hppa/cpu.c
index 68233acf53..fd7f849a1c 100644
--- a/target/hppa/cpu.c
+++ b/target/hppa/cpu.c
@@ -71,6 +71,7 @@ static void hppa_cpu_disas_set_info(CPUState *cs, disassemble_info *info)
     info->print_insn = print_insn_hppa;
 }
 
+#ifndef CONFIG_USER_ONLY
 static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                          MMUAccessType access_type,
                                          int mmu_idx, uintptr_t retaddr)
@@ -87,6 +88,7 @@ static void hppa_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
 
     cpu_loop_exit_restore(cs, retaddr);
 }
+#endif /* CONFIG_USER_ONLY */
 
 static void hppa_cpu_realizefn(DeviceState *dev, Error **errp)
 {
@@ -150,9 +152,9 @@ static void hppa_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.tlb_fill = hppa_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = hppa_cpu_get_phys_page_debug;
+    cc->tcg_ops.do_unaligned_access = hppa_cpu_do_unaligned_access;
     dc->vmsd = &vmstate_hppa_cpu;
 #endif
-    cc->do_unaligned_access = hppa_cpu_do_unaligned_access;
     cc->disas_set_info = hppa_cpu_disas_set_info;
     cc->tcg_ops.initialize = hppa_translate_init;
 
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index e405f6422d..6678310f51 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -365,7 +365,6 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->class_by_name = mb_cpu_class_by_name;
     cc->has_work = mb_cpu_has_work;
     cc->tcg_ops.do_interrupt = mb_cpu_do_interrupt;
-    cc->do_unaligned_access = mb_cpu_do_unaligned_access;
     cc->tcg_ops.cpu_exec_interrupt = mb_cpu_exec_interrupt;
     cc->dump_state = mb_cpu_dump_state;
     cc->set_pc = mb_cpu_set_pc;
@@ -375,6 +374,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.tlb_fill = mb_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.do_transaction_failed = mb_cpu_transaction_failed;
+    cc->tcg_ops.do_unaligned_access = mb_cpu_do_unaligned_access;
     cc->get_phys_page_attrs_debug = mb_cpu_get_phys_page_attrs_debug;
     dc->vmsd = &vmstate_mb_cpu;
 #endif
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index ed2a7664e9..1e93e295cc 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -681,7 +681,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->do_unaligned_access = mips_cpu_do_unaligned_access;
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_mips_cpu;
 #endif
@@ -694,6 +693,8 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.do_transaction_failed = mips_cpu_do_transaction_failed;
+    cc->tcg_ops.do_unaligned_access = mips_cpu_do_unaligned_access;
+
 #endif /* CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index b5fe779ceb..c43aa3d4c4 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -228,7 +228,7 @@ static void nios2_cpu_class_init(ObjectClass *oc, void *data)
     cc->disas_set_info = nios2_cpu_disas_set_info;
     cc->tcg_ops.tlb_fill = nios2_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_unaligned_access = nios2_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = nios2_cpu_do_unaligned_access;
     cc->get_phys_page_debug = nios2_cpu_get_phys_page_debug;
 #endif
     cc->gdb_read_register = nios2_cpu_gdb_read_register;
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 9a23af9a9d..5e85fd58b6 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -610,7 +610,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.do_transaction_failed = riscv_cpu_do_transaction_failed;
-    cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
     cc->vmsd = &vmstate_riscv_cpu;
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index e6cf933594..a723ede8d1 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -510,7 +510,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
 #ifdef CONFIG_TCG
     cc->tcg_ops.cpu_exec_interrupt = s390_cpu_exec_interrupt;
     cc->tcg_ops.debug_excp_handler = s390x_cpu_debug_excp_handler;
-    cc->do_unaligned_access = s390x_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = s390x_cpu_do_unaligned_access;
 #endif
 #endif
     cc->disas_set_info = s390_cpu_disas_set_info;
diff --git a/target/s390x/excp_helper.c b/target/s390x/excp_helper.c
index 9cf66d3690..ce16af394b 100644
--- a/target/s390x/excp_helper.c
+++ b/target/s390x/excp_helper.c
@@ -634,4 +634,4 @@ void HELPER(monitor_call)(CPUS390XState *env, uint64_t monitor_code,
     }
 }
 
-#endif /* CONFIG_USER_ONLY */
+#endif /* !CONFIG_USER_ONLY */
diff --git a/target/sh4/cpu.c b/target/sh4/cpu.c
index f69360fc16..292152b562 100644
--- a/target/sh4/cpu.c
+++ b/target/sh4/cpu.c
@@ -228,7 +228,7 @@ static void superh_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = superh_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = superh_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_unaligned_access = superh_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = superh_cpu_do_unaligned_access;
     cc->get_phys_page_debug = superh_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = superh_cpu_disas_set_info;
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 8d6d7c1f83..1b785f60df 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -876,7 +876,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.tlb_fill = sparc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.do_transaction_failed = sparc_cpu_do_transaction_failed;
-    cc->do_unaligned_access = sparc_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = sparc_cpu_do_unaligned_access;
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_sparc_cpu;
 #endif
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index fc52fde696..4b6381569f 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -203,7 +203,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->tcg_ops.tlb_fill = xtensa_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_unaligned_access = xtensa_cpu_do_unaligned_access;
+    cc->tcg_ops.do_unaligned_access = xtensa_cpu_do_unaligned_access;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     cc->tcg_ops.do_transaction_failed = xtensa_cpu_do_transaction_failed;
 #endif
diff --git a/target/ppc/translate_init.c.inc b/target/ppc/translate_init.c.inc
index b16430a9d4..27ab243c6e 100644
--- a/target/ppc/translate_init.c.inc
+++ b/target/ppc/translate_init.c.inc
@@ -10850,7 +10850,6 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
     cc->set_pc = ppc_cpu_set_pc;
     cc->gdb_read_register = ppc_cpu_gdb_read_register;
     cc->gdb_write_register = ppc_cpu_gdb_write_register;
-    cc->do_unaligned_access = ppc_cpu_do_unaligned_access;
 #ifndef CONFIG_USER_ONLY
     cc->get_phys_page_debug = ppc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_ppc_cpu;
@@ -10887,6 +10886,7 @@ static void ppc_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.cpu_exec_enter = ppc_cpu_exec_enter;
     cc->tcg_ops.cpu_exec_exit = ppc_cpu_exec_exit;
+    cc->tcg_ops.do_unaligned_access = ppc_cpu_do_unaligned_access;
 #endif /* !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
-- 
2.26.2


