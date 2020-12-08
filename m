Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDD62D3508
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Dec 2020 22:16:04 +0100 (CET)
Received: from localhost ([::1]:51316 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kmkL5-000130-Gv
	for lists+qemu-devel@lfdr.de; Tue, 08 Dec 2020 16:16:03 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmizD-0001Z6-4L
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:23 -0500
Received: from mx2.suse.de ([195.135.220.15]:44162)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kmiz7-0000zt-8r
 for qemu-devel@nongnu.org; Tue, 08 Dec 2020 14:49:22 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 29E88AEC6;
 Tue,  8 Dec 2020 19:49:05 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [RFC v9 24/32] cpu: move cc->transaction_failed to tcg_ops
Date: Tue,  8 Dec 2020 20:48:31 +0100
Message-Id: <20201208194839.31305-25-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201208194839.31305-1-cfontana@suse.de>
References: <20201208194839.31305-1-cfontana@suse.de>
MIME-Version: 1.0
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
Cc: Laurent Vivier <lvivier@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Paul Durrant <paul@xen.org>, Jason Wang <jasowang@redhat.com>,
 Marcelo Tosatti <mtosatti@redhat.com>, qemu-devel@nongnu.org,
 Peter Xu <peterx@redhat.com>, Dario Faggioli <dfaggioli@suse.com>,
 Cameron Esfahani <dirty@apple.com>, haxm-team@intel.com,
 Claudio Fontana <cfontana@suse.de>, Anthony Perard <anthony.perard@citrix.com>,
 Bruce Rogers <brogers@suse.com>, Olaf Hering <ohering@suse.de>,
 "Emilio G . Cota" <cota@braap.org>, Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 hw/mips/jazz.c                |  4 ++--
 include/hw/core/cpu.h         | 18 +++++++-----------
 include/hw/core/tcg-cpu-ops.h |  9 +++++++++
 target/alpha/cpu.c            |  2 +-
 target/arm/cpu.c              |  4 ++--
 target/m68k/cpu.c             |  2 +-
 target/microblaze/cpu.c       |  2 +-
 target/mips/cpu.c             |  2 +-
 target/riscv/cpu.c            |  2 +-
 target/sparc/cpu.c            |  2 +-
 target/xtensa/cpu.c           |  2 +-
 11 files changed, 27 insertions(+), 22 deletions(-)

diff --git a/hw/mips/jazz.c b/hw/mips/jazz.c
index 71448f72ac..53e195b406 100644
--- a/hw/mips/jazz.c
+++ b/hw/mips/jazz.c
@@ -204,8 +204,8 @@ static void mips_jazz_init(MachineState *machine,
      * memory region that catches all memory accesses, as we do on Malta.
      */
     cc = CPU_GET_CLASS(cpu);
-    real_do_transaction_failed = cc->do_transaction_failed;
-    cc->do_transaction_failed = mips_jazz_do_transaction_failed;
+    real_do_transaction_failed = cc->tcg_ops.do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = mips_jazz_do_transaction_failed;
 
     /* allocate RAM */
     memory_region_add_subregion(address_space, 0, machine->ram);
diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index b178549d48..0c6c17fb48 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -89,8 +89,6 @@ struct TranslationBlock;
  * @has_work: Callback for checking if there is work to do.
  * @do_unaligned_access: Callback for unaligned access handling, if
  * the target defines #TARGET_ALIGNED_ONLY.
- * @do_transaction_failed: Callback for handling failed memory transactions
- * (ie bus faults or external aborts; not MMU faults)
  * @virtio_is_big_endian: Callback to return %true if a CPU which supports
  * runtime configurable endianness is currently big-endian. Non-configurable
  * CPUs can use the default implementation of this method. This method should
@@ -159,10 +157,6 @@ struct CPUClass {
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
-    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
-                                  unsigned size, MMUAccessType access_type,
-                                  int mmu_idx, MemTxAttrs attrs,
-                                  MemTxResult response, uintptr_t retaddr);
     bool (*virtio_is_big_endian)(CPUState *cpu);
     int (*memory_rw_debug)(CPUState *cpu, vaddr addr,
                            uint8_t *buf, int len, bool is_write);
@@ -848,7 +842,7 @@ static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
 
     cc->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
 }
-
+#ifdef CONFIG_TCG
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
@@ -858,12 +852,14 @@ static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
 {
     CPUClass *cc = CPU_GET_CLASS(cpu);
 
-    if (!cpu->ignore_memory_transaction_failures && cc->do_transaction_failed) {
-        cc->do_transaction_failed(cpu, physaddr, addr, size, access_type,
-                                  mmu_idx, attrs, response, retaddr);
+    if (!cpu->ignore_memory_transaction_failures &&
+        cc->tcg_ops.do_transaction_failed) {
+        cc->tcg_ops.do_transaction_failed(cpu, physaddr, addr, size, access_type,
+                                          mmu_idx, attrs, response, retaddr);
     }
 }
-#endif
+#endif /* CONFIG_TCG */
+#endif /* CONFIG_SOFTMMU */
 
 #endif /* NEED_CPU_H */
 
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 6b9b72e785..0cc0927738 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -40,6 +40,15 @@ typedef struct TcgCpuOperations {
     /** @do_interrupt: Callback for interrupt handling. */
     void (*do_interrupt)(CPUState *cpu);
 
+    /**
+     * @do_transaction_failed: Callback for handling failed memory transactions
+     * (ie bus faults or external aborts; not MMU faults)
+     */
+    void (*do_transaction_failed)(CPUState *cpu, hwaddr physaddr, vaddr addr,
+                                  unsigned size, MMUAccessType access_type,
+                                  int mmu_idx, MemTxAttrs attrs,
+                                  MemTxResult response, uintptr_t retaddr);
+
     /**
      * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
      *
diff --git a/target/alpha/cpu.c b/target/alpha/cpu.c
index fde5825ebc..3e651b246f 100644
--- a/target/alpha/cpu.c
+++ b/target/alpha/cpu.c
@@ -224,7 +224,7 @@ static void alpha_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = alpha_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = alpha_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = alpha_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = alpha_cpu_do_transaction_failed;
     cc->do_unaligned_access = alpha_cpu_do_unaligned_access;
     cc->get_phys_page_debug = alpha_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_alpha_cpu;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 826cf8351b..5e9202ed86 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2268,11 +2268,11 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
     cc->debug_check_watchpoint = arm_debug_check_watchpoint;
     cc->do_unaligned_access = arm_cpu_do_unaligned_access;
 #if !defined(CONFIG_USER_ONLY)
-    cc->do_transaction_failed = arm_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
     cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
-#endif
+#endif /* CONFIG_TCG */
 }
 
 #ifdef CONFIG_KVM
diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
index 3e84de772c..3f60c99865 100644
--- a/target/m68k/cpu.c
+++ b/target/m68k/cpu.c
@@ -285,7 +285,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_write_register = m68k_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = m68k_cpu_tlb_fill;
 #if defined(CONFIG_SOFTMMU)
-    cc->do_transaction_failed = m68k_cpu_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = m68k_cpu_transaction_failed;
     cc->get_phys_page_debug = m68k_cpu_get_phys_page_debug;
 #endif
     cc->disas_set_info = m68k_cpu_disas_set_info;
diff --git a/target/microblaze/cpu.c b/target/microblaze/cpu.c
index 4f95248b2e..fa57a324dc 100644
--- a/target/microblaze/cpu.c
+++ b/target/microblaze/cpu.c
@@ -327,7 +327,7 @@ static void mb_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = mb_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = mb_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = mb_cpu_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = mb_cpu_transaction_failed;
     cc->get_phys_page_debug = mb_cpu_get_phys_page_debug;
     dc->vmsd = &vmstate_mb_cpu;
 #endif
diff --git a/target/mips/cpu.c b/target/mips/cpu.c
index dd5fb78e6c..259bb791f7 100644
--- a/target/mips/cpu.c
+++ b/target/mips/cpu.c
@@ -239,7 +239,6 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_read_register = mips_cpu_gdb_read_register;
     cc->gdb_write_register = mips_cpu_gdb_write_register;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = mips_cpu_do_transaction_failed;
     cc->do_unaligned_access = mips_cpu_do_unaligned_access;
     cc->get_phys_page_debug = mips_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_mips_cpu;
@@ -252,6 +251,7 @@ static void mips_cpu_class_init(ObjectClass *c, void *data)
     cc->tcg_ops.tlb_fill = mips_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
     cc->tcg_ops.do_interrupt = mips_cpu_do_interrupt;
+    cc->tcg_ops.do_transaction_failed = mips_cpu_do_transaction_failed;
 #endif /* CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
 
diff --git a/target/riscv/cpu.c b/target/riscv/cpu.c
index 6a815569cc..7dfd8d7339 100644
--- a/target/riscv/cpu.c
+++ b/target/riscv/cpu.c
@@ -555,7 +555,7 @@ static void riscv_cpu_class_init(ObjectClass *c, void *data)
     cc->gdb_stop_before_watchpoint = true;
     cc->disas_set_info = riscv_cpu_disas_set_info;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = riscv_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = riscv_cpu_do_transaction_failed;
     cc->do_unaligned_access = riscv_cpu_do_unaligned_access;
     cc->get_phys_page_debug = riscv_cpu_get_phys_page_debug;
     /* For now, mark unmigratable: */
diff --git a/target/sparc/cpu.c b/target/sparc/cpu.c
index 3f23aa5962..009d0f07c3 100644
--- a/target/sparc/cpu.c
+++ b/target/sparc/cpu.c
@@ -873,7 +873,7 @@ static void sparc_cpu_class_init(ObjectClass *oc, void *data)
     cc->gdb_write_register = sparc_cpu_gdb_write_register;
     cc->tcg_ops.tlb_fill = sparc_cpu_tlb_fill;
 #ifndef CONFIG_USER_ONLY
-    cc->do_transaction_failed = sparc_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = sparc_cpu_do_transaction_failed;
     cc->do_unaligned_access = sparc_cpu_do_unaligned_access;
     cc->get_phys_page_debug = sparc_cpu_get_phys_page_debug;
     cc->vmsd = &vmstate_sparc_cpu;
diff --git a/target/xtensa/cpu.c b/target/xtensa/cpu.c
index 3ff025f0fe..fc52fde696 100644
--- a/target/xtensa/cpu.c
+++ b/target/xtensa/cpu.c
@@ -205,7 +205,7 @@ static void xtensa_cpu_class_init(ObjectClass *oc, void *data)
 #ifndef CONFIG_USER_ONLY
     cc->do_unaligned_access = xtensa_cpu_do_unaligned_access;
     cc->get_phys_page_debug = xtensa_cpu_get_phys_page_debug;
-    cc->do_transaction_failed = xtensa_cpu_do_transaction_failed;
+    cc->tcg_ops.do_transaction_failed = xtensa_cpu_do_transaction_failed;
 #endif
     cc->tcg_ops.debug_excp_handler = xtensa_breakpoint_handler;
     cc->disas_set_info = xtensa_cpu_disas_set_info;
-- 
2.26.2


