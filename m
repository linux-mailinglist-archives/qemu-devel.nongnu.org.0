Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B0F5A3462CD
	for <lists+qemu-devel@lfdr.de>; Tue, 23 Mar 2021 16:28:13 +0100 (CET)
Received: from localhost ([::1]:36256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lOix2-0004BZ-P1
	for lists+qemu-devel@lfdr.de; Tue, 23 Mar 2021 11:28:12 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60236)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOisL-000737-TH
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:23:21 -0400
Received: from mx2.suse.de ([195.135.220.15]:55132)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1lOisI-0004hN-H8
 for qemu-devel@nongnu.org; Tue, 23 Mar 2021 11:23:21 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 461EFACBF;
 Tue, 23 Mar 2021 15:23:17 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RFC v11 07/55] target/arm: tcg: split tlb_helper user-only and
 sysemu-only parts
Date: Tue, 23 Mar 2021 16:17:01 +0100
Message-Id: <20210323151749.21299-8-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210323151749.21299-1-cfontana@suse.de>
References: <20210323151749.21299-1-cfontana@suse.de>
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
Cc: Paolo Bonzini <pbonzini@redhat.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 target/arm/tcg/tlb_helper.h        | 17 ++++++
 target/arm/tcg/sysemu/tlb_helper.c | 83 ++++++++++++++++++++++++++
 target/arm/tcg/tlb_helper.c        | 96 ++----------------------------
 target/arm/tcg/user/tlb_helper.c   | 31 ++++++++++
 target/arm/tcg/sysemu/meson.build  |  1 +
 target/arm/tcg/user/meson.build    |  1 +
 6 files changed, 137 insertions(+), 92 deletions(-)
 create mode 100644 target/arm/tcg/tlb_helper.h
 create mode 100644 target/arm/tcg/sysemu/tlb_helper.c
 create mode 100644 target/arm/tcg/user/tlb_helper.c

diff --git a/target/arm/tcg/tlb_helper.h b/target/arm/tcg/tlb_helper.h
new file mode 100644
index 0000000000..6ce3d315cf
--- /dev/null
+++ b/target/arm/tcg/tlb_helper.h
@@ -0,0 +1,17 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef TLB_HELPER_H
+#define TLB_HELPER_H
+
+#include "cpu.h"
+
+void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, ARMMMUFaultInfo *fi);
+
+#endif /* TLB_HELPER_H */
diff --git a/target/arm/tcg/sysemu/tlb_helper.c b/target/arm/tcg/sysemu/tlb_helper.c
new file mode 100644
index 0000000000..586f602989
--- /dev/null
+++ b/target/arm/tcg/sysemu/tlb_helper.c
@@ -0,0 +1,83 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "tcg/tlb_helper.h"
+
+/*
+ * arm_cpu_do_transaction_failed: handle a memory system error response
+ * (eg "no device/memory present at address") by raising an external abort
+ * exception
+ */
+void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
+                                   vaddr addr, unsigned size,
+                                   MMUAccessType access_type,
+                                   int mmu_idx, MemTxAttrs attrs,
+                                   MemTxResult response, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+
+    fi.ea = arm_extabort_type(response);
+    fi.type = ARMFault_SyncExternal;
+    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
+}
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+    hwaddr phys_addr;
+    target_ulong page_size;
+    int prot, ret;
+    MemTxAttrs attrs = {};
+    ARMCacheAttrs cacheattrs = {};
+
+    /*
+     * Walk the page table and (if the mapping exists) add the page
+     * to the TLB.  On success, return true.  Otherwise, if probing,
+     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
+     * register format, and signal the fault.
+     */
+    ret = get_phys_addr(&cpu->env, address, access_type,
+                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
+                        &phys_addr, &attrs, &prot, &page_size,
+                        &fi, &cacheattrs);
+    if (likely(!ret)) {
+        /*
+         * Map a single [sub]page. Regions smaller than our declared
+         * target page size are handled specially, so for those we
+         * pass in the exact addresses.
+         */
+        if (page_size >= TARGET_PAGE_SIZE) {
+            phys_addr &= TARGET_PAGE_MASK;
+            address &= TARGET_PAGE_MASK;
+        }
+        /* Notice and record tagged memory. */
+        if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
+            arm_tlb_mte_tagged(&attrs) = true;
+        }
+
+        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
+                                prot, mmu_idx, page_size);
+        return true;
+    } else if (probe) {
+        return false;
+    } else {
+        /* now we have a real cpu fault */
+        cpu_restore_state(cs, retaddr, true);
+        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+    }
+}
diff --git a/target/arm/tcg/tlb_helper.c b/target/arm/tcg/tlb_helper.c
index 9609333cbd..77aefc274d 100644
--- a/target/arm/tcg/tlb_helper.c
+++ b/target/arm/tcg/tlb_helper.c
@@ -9,6 +9,7 @@
 #include "cpu.h"
 #include "internals.h"
 #include "exec/exec-all.h"
+#include "tcg/tlb_helper.h"
 
 static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
                                             unsigned int target_el,
@@ -49,9 +50,9 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
     return syn;
 }
 
-static void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
-                                            MMUAccessType access_type,
-                                            int mmu_idx, ARMMMUFaultInfo *fi)
+void QEMU_NORETURN arm_deliver_fault(ARMCPU *cpu, vaddr addr,
+                                     MMUAccessType access_type,
+                                     int mmu_idx, ARMMMUFaultInfo *fi)
 {
     CPUARMState *env = &cpu->env;
     int target_el;
@@ -122,92 +123,3 @@ void arm_cpu_do_unaligned_access(CPUState *cs, vaddr vaddr,
     fi.type = ARMFault_Alignment;
     arm_deliver_fault(cpu, vaddr, access_type, mmu_idx, &fi);
 }
-
-#if !defined(CONFIG_USER_ONLY)
-
-/*
- * arm_cpu_do_transaction_failed: handle a memory system error response
- * (eg "no device/memory present at address") by raising an external abort
- * exception
- */
-void arm_cpu_do_transaction_failed(CPUState *cs, hwaddr physaddr,
-                                   vaddr addr, unsigned size,
-                                   MMUAccessType access_type,
-                                   int mmu_idx, MemTxAttrs attrs,
-                                   MemTxResult response, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-
-    fi.ea = arm_extabort_type(response);
-    fi.type = ARMFault_SyncExternal;
-    arm_deliver_fault(cpu, addr, access_type, mmu_idx, &fi);
-}
-
-#endif /* !defined(CONFIG_USER_ONLY) */
-
-bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                      MMUAccessType access_type, int mmu_idx,
-                      bool probe, uintptr_t retaddr)
-{
-    ARMCPU *cpu = ARM_CPU(cs);
-    ARMMMUFaultInfo fi = {};
-
-#ifdef CONFIG_USER_ONLY
-    int flags = page_get_flags(useronly_clean_ptr(address));
-    if (flags & PAGE_VALID) {
-        fi.type = ARMFault_Permission;
-    } else {
-        fi.type = ARMFault_Translation;
-    }
-
-    /* now we have a real cpu fault */
-    cpu_restore_state(cs, retaddr, true);
-    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-#else
-    hwaddr phys_addr;
-    target_ulong page_size;
-    int prot, ret;
-    MemTxAttrs attrs = {};
-    ARMCacheAttrs cacheattrs = {};
-
-    /*
-     * Walk the page table and (if the mapping exists) add the page
-     * to the TLB.  On success, return true.  Otherwise, if probing,
-     * return false.  Otherwise populate fsr with ARM DFSR/IFSR fault
-     * register format, and signal the fault.
-     */
-    ret = get_phys_addr(&cpu->env, address, access_type,
-                        core_to_arm_mmu_idx(&cpu->env, mmu_idx),
-                        &phys_addr, &attrs, &prot, &page_size,
-                        &fi, &cacheattrs);
-    if (likely(!ret)) {
-        /*
-         * Map a single [sub]page. Regions smaller than our declared
-         * target page size are handled specially, so for those we
-         * pass in the exact addresses.
-         */
-        if (page_size >= TARGET_PAGE_SIZE) {
-            phys_addr &= TARGET_PAGE_MASK;
-            address &= TARGET_PAGE_MASK;
-        }
-        /* Notice and record tagged memory. */
-        if (cpu_isar_feature(aa64_mte, cpu) && cacheattrs.attrs == 0xf0) {
-            arm_tlb_mte_tagged(&attrs) = true;
-        }
-
-        tlb_set_page_with_attrs(cs, address, phys_addr, attrs,
-                                prot, mmu_idx, page_size);
-        return true;
-    } else if (probe) {
-        return false;
-    } else {
-        /* now we have a real cpu fault */
-        cpu_restore_state(cs, retaddr, true);
-        arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
-    }
-#endif
-}
diff --git a/target/arm/tcg/user/tlb_helper.c b/target/arm/tcg/user/tlb_helper.c
new file mode 100644
index 0000000000..727dfb09c3
--- /dev/null
+++ b/target/arm/tcg/user/tlb_helper.c
@@ -0,0 +1,31 @@
+/*
+ * ARM TLB (Translation lookaside buffer) helpers.
+ *
+ * This code is licensed under the GNU GPL v2 or later.
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#include "qemu/osdep.h"
+#include "cpu.h"
+#include "internals.h"
+#include "exec/exec-all.h"
+#include "tcg/tlb_helper.h"
+
+bool arm_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
+                      MMUAccessType access_type, int mmu_idx,
+                      bool probe, uintptr_t retaddr)
+{
+    ARMCPU *cpu = ARM_CPU(cs);
+    ARMMMUFaultInfo fi = {};
+
+    int flags = page_get_flags(useronly_clean_ptr(address));
+    if (flags & PAGE_VALID) {
+        fi.type = ARMFault_Permission;
+    } else {
+        fi.type = ARMFault_Translation;
+    }
+
+    /* now we have a real cpu fault */
+    cpu_restore_state(cs, retaddr, true);
+    arm_deliver_fault(cpu, address, access_type, mmu_idx, &fi);
+}
diff --git a/target/arm/tcg/sysemu/meson.build b/target/arm/tcg/sysemu/meson.build
index 1d5e593c20..11ef4b7987 100644
--- a/target/arm/tcg/sysemu/meson.build
+++ b/target/arm/tcg/sysemu/meson.build
@@ -2,4 +2,5 @@
 arm_softmmu_ss.add(when: ['CONFIG_TCG','CONFIG_SOFTMMU'], if_true: files(
   'mte_helper.c',
   'debug_helper.c',
+  'tlb_helper.c',
 ))
diff --git a/target/arm/tcg/user/meson.build b/target/arm/tcg/user/meson.build
index 2bdf37663d..2acc52b2a3 100644
--- a/target/arm/tcg/user/meson.build
+++ b/target/arm/tcg/user/meson.build
@@ -1,4 +1,5 @@
 
 arm_user_ss.add(when: ['CONFIG_TCG','CONFIG_USER_ONLY'], if_true: files(
   'mte_helper.c',
+  'tlb_helper.c',
 ))
-- 
2.26.2


