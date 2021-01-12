Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F02692F3808
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:13:54 +0100 (CET)
Received: from localhost ([::1]:42350 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOAz-0006Qv-P1
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:13:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48022)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzO0y-0005KN-7W
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:03:35 -0500
Received: from mx2.suse.de ([195.135.220.15]:33552)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzO0q-0004vj-AV
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:03:31 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 0CFF5AD6A;
 Tue, 12 Jan 2021 18:03:23 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v12 07/22] cpu: Move debug_excp_handler to tcg_ops
Date: Tue, 12 Jan 2021 19:02:57 +0100
Message-Id: <20210112180312.26043-8-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112180312.26043-1-cfontana@suse.de>
References: <20210112180312.26043-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
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
Cc: Laurent Vivier <lvivier@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Paul Durrant <paul@xen.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Colin Xu <colin.xu@intel.com>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Claudio Fontana <cfontana@suse.de>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Eduardo Habkost <ehabkost@redhat.com>

Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
Signed-off-by: Claudio Fontana <cfontana@suse.de>
Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/cpu.h     | 4 ++--
 accel/tcg/cpu-exec.c      | 4 ++--
 target/arm/cpu.c          | 2 +-
 target/i386/tcg/tcg-cpu.c | 2 +-
 target/lm32/cpu.c         | 2 +-
 target/s390x/cpu.c        | 2 +-
 target/xtensa/cpu.c       | 2 +-
 7 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index aa464c9633..a0e040c617 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -116,6 +116,8 @@ typedef struct TcgCpuOperations {
     bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
                      MMUAccessType access_type, int mmu_idx,
                      bool probe, uintptr_t retaddr);
+    /** @debug_excp_handler: Callback for handling debug exceptions */
+    void (*debug_excp_handler)(CPUState *cpu);
 
 } TcgCpuOperations;
 #endif /* CONFIG_TCG */
@@ -161,7 +163,6 @@ typedef struct TcgCpuOperations {
  * @gdb_write_register: Callback for letting GDB write a register.
  * @debug_check_watchpoint: Callback: return true if the architectural
  *       watchpoint whose address has matched should really fire.
- * @debug_excp_handler: Callback for handling debug exceptions.
  * @write_elf64_note: Callback for writing a CPU-specific ELF note to a
  * 64-bit VM coredump.
  * @write_elf32_qemunote: Callback for writing a CPU- and QEMU-specific ELF
@@ -224,7 +225,6 @@ struct CPUClass {
     int (*gdb_read_register)(CPUState *cpu, GByteArray *buf, int reg);
     int (*gdb_write_register)(CPUState *cpu, uint8_t *buf, int reg);
     bool (*debug_check_watchpoint)(CPUState *cpu, CPUWatchpoint *wp);
-    void (*debug_excp_handler)(CPUState *cpu);
 
     int (*write_elf64_note)(WriteCoreDumpFunction f, CPUState *cpu,
                             int cpuid, void *opaque);
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index f3943fe732..b4d863b927 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -505,8 +505,8 @@ static inline void cpu_handle_debug_exception(CPUState *cpu)
         }
     }
 
-    if (cc->debug_excp_handler) {
-        cc->debug_excp_handler(cpu);
+    if (cc->tcg_ops.debug_excp_handler) {
+        cc->tcg_ops.debug_excp_handler(cpu);
     }
 }
 
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index fff6eec13b..e0dfa9ca4e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2267,7 +2267,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->tcg_ops.cpu_exec_interrupt = arm_cpu_exec_interrupt;
     cc->tcg_ops.synchronize_from_tb = arm_cpu_synchronize_from_tb;
     cc->tcg_ops.tlb_fill = arm_cpu_tlb_fill;
-    cc->debug_excp_handler = arm_debug_excp_handler;
+    cc->tcg_ops.debug_excp_handler = arm_debug_excp_handler;
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
 #if !defined(CONFIG_USER_ONLY)
diff --git a/target/i386/tcg/tcg-cpu.c b/target/i386/tcg/tcg-cpu.c
index 85b69224a9..6c1ebbdcc6 100644
--- a/target/i386/tcg/tcg-cpu.c
+++ b/target/i386/tcg/tcg-cpu.c
@@ -67,6 +67,6 @@ void tcg_cpu_common_class_init(CPUClass *cc)
     cc->tcg_ops.initialize = tcg_x86_init;
     cc->tcg_ops.tlb_fill = x86_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->debug_excp_handler = breakpoint_handler;
+    cc->tcg_ops.debug_excp_handler = breakpoint_handler;
 #endif
 }
diff --git a/target/lm32/cpu.c b/target/lm32/cpu.c
index 76dc728858..bbe1405e32 100644
--- a/target/lm32/cpu.c
+++ b/target/lm32/cpu.c
@@ -235,7 +235,7 @@ static void lm32_cpu_class_init(ObjectClass *oc, void *data)
 #endif
     cc->gdb_num_core_regs = 32 + 7;
     cc->gdb_stop_before_watchpoint = true;
-    cc->debug_excp_handler = lm32_debug_excp_handler;
+    cc->tcg_ops.debug_excp_handler = lm32_debug_excp_handler;
     cc->disas_set_info = lm32_cpu_disas_set_info;
     cc->tcg_ops.initialize = lm32_translate_init;
 }
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index ceee62ddca..8ade66178e 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -509,7 +509,7 @@ static void s390_cpu_class_init(ObjectClass *oc, void *data)
     cc->write_elf64_note = s390_cpu_write_elf64_note;
 #ifdef CONFIG_TCG
     cc->tcg_ops.cpu_exec_interrupt = s390_cpu_exec_interrupt;
-    cc->debug_excp_handler = s390x_cpu_debug_excp_handler;
+    cc->tcg_ops.debug_excp_handler = s390x_cpu_debug_excp_handler;
     cc->do_unaligned_access = s390x_cpu_do_unaligned_access;
 #endif
 #endif
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index e764dbeb73..b6f13ceb32 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -207,7 +207,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
     cc->do_transaction_failed = xtensa_cpu_do_transaction_failed;
 #endif
-    cc->debug_excp_handler = xtensa_breakpoint_handler;
+    cc->tcg_ops.debug_excp_handler = xtensa_breakpoint_handler;
     cc->disas_set_info = xtensa_cpu_disas_set_info;
     cc->tcg_ops.initialize = xtensa_translate_init;
     dc->vmsd = &vmstate_xtensa_cpu;
-- 
2.26.2


