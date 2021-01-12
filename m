Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8725E2F38F1
	for <lists+qemu-devel@lfdr.de>; Tue, 12 Jan 2021 19:35:10 +0100 (CET)
Received: from localhost ([::1]:48242 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kzOVZ-0000Ho-Lo
	for lists+qemu-devel@lfdr.de; Tue, 12 Jan 2021 13:35:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48164)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzO1L-0005Sg-2y
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:03:55 -0500
Received: from mx2.suse.de ([195.135.220.15]:33762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1kzO15-0004wP-PM
 for qemu-devel@nongnu.org; Tue, 12 Jan 2021 13:03:53 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 4D465AD5C;
 Tue, 12 Jan 2021 18:03:28 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefano Stabellini <sstabellini@kernel.org>,
 Wenchao Wang <wenchao.wang@intel.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>,
 Sunil Muthuswamy <sunilmut@microsoft.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v12 12/22] physmem: make watchpoint checking code TCG-only
Date: Tue, 12 Jan 2021 19:03:02 +0100
Message-Id: <20210112180312.26043-13-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210112180312.26043-1-cfontana@suse.de>
References: <20210112180312.26043-1-cfontana@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=195.135.220.15; envelope-from=cfontana@suse.de;
 helo=mx2.suse.de
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
 Jason Wang <jasowang@redhat.com>, Marcelo Tosatti <mtosatti@redhat.com>,
 qemu-devel@nongnu.org, Peter Xu <peterx@redhat.com>,
 Dario Faggioli <dfaggioli@suse.com>, Cameron Esfahani <dirty@apple.com>,
 haxm-team@intel.com, Claudio Fontana <cfontana@suse.de>,
 Anthony Perard <anthony.perard@citrix.com>, Bruce Rogers <brogers@suse.com>,
 Olaf Hering <ohering@suse.de>, "Emilio G . Cota" <cota@braap.org>,
 Colin Xu <colin.xu@intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

cpu_check_watchpoint, watchpoint_address_matches are TCG-only.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 softmmu/physmem.c | 141 +++++++++++++++++++++++-----------------------
 1 file changed, 72 insertions(+), 69 deletions(-)

diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index 6301f4f0a5..9e7c50e0db 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -840,6 +840,7 @@ void cpu_watchpoint_remove_all(CPUState *cpu, int mask)
     }
 }
 
+#ifdef CONFIG_TCG
 /* Return true if this watchpoint address matches the specified
  * access (ie the address range covered by the watchpoint overlaps
  * partially or completely with the address range covered by the
@@ -873,6 +874,77 @@ int cpu_watchpoint_address_matches(CPUState *cpu, vaddr addr, vaddr len)
     return ret;
 }
 
+/* Generate a debug exception if a watchpoint has been hit.  */
+void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
+                          MemTxAttrs attrs, int flags, uintptr_t ra)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUWatchpoint *wp;
+
+    assert(tcg_enabled());
+    if (cpu->watchpoint_hit) {
+        /*
+         * We re-entered the check after replacing the TB.
+         * Now raise the debug interrupt so that it will
+         * trigger after the current instruction.
+         */
+        qemu_mutex_lock_iothread();
+        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
+        qemu_mutex_unlock_iothread();
+        return;
+    }
+
+    addr = cc->adjust_watchpoint_address(cpu, addr, len);
+    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
+        if (watchpoint_address_matches(wp, addr, len)
+            && (wp->flags & flags)) {
+            if (replay_running_debug()) {
+                /*
+                 * Don't process the watchpoints when we are
+                 * in a reverse debugging operation.
+                 */
+                replay_breakpoint();
+                return;
+            }
+            if (flags == BP_MEM_READ) {
+                wp->flags |= BP_WATCHPOINT_HIT_READ;
+            } else {
+                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
+            }
+            wp->hitaddr = MAX(addr, wp->vaddr);
+            wp->hitattrs = attrs;
+            if (!cpu->watchpoint_hit) {
+                if (wp->flags & BP_CPU &&
+                    !cc->debug_check_watchpoint(cpu, wp)) {
+                    wp->flags &= ~BP_WATCHPOINT_HIT;
+                    continue;
+                }
+                cpu->watchpoint_hit = wp;
+
+                mmap_lock();
+                tb_check_watchpoint(cpu, ra);
+                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
+                    cpu->exception_index = EXCP_DEBUG;
+                    mmap_unlock();
+                    cpu_loop_exit_restore(cpu, ra);
+                } else {
+                    /* Force execution of one insn next time.  */
+                    cpu->cflags_next_tb = 1 | curr_cflags();
+                    mmap_unlock();
+                    if (ra) {
+                        cpu_restore_state(cpu, ra, true);
+                    }
+                    cpu_loop_exit_noexc(cpu);
+                }
+            }
+        } else {
+            wp->flags &= ~BP_WATCHPOINT_HIT;
+        }
+    }
+}
+
+#endif /* CONFIG_TCG */
+
 /* Called from RCU critical section */
 static RAMBlock *qemu_get_ram_block(ram_addr_t addr)
 {
@@ -2355,75 +2427,6 @@ ram_addr_t qemu_ram_addr_from_host(void *ptr)
     return block->offset + offset;
 }
 
-/* Generate a debug exception if a watchpoint has been hit.  */
-void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
-                          MemTxAttrs attrs, int flags, uintptr_t ra)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUWatchpoint *wp;
-
-    assert(tcg_enabled());
-    if (cpu->watchpoint_hit) {
-        /*
-         * We re-entered the check after replacing the TB.
-         * Now raise the debug interrupt so that it will
-         * trigger after the current instruction.
-         */
-        qemu_mutex_lock_iothread();
-        cpu_interrupt(cpu, CPU_INTERRUPT_DEBUG);
-        qemu_mutex_unlock_iothread();
-        return;
-    }
-
-    addr = cc->adjust_watchpoint_address(cpu, addr, len);
-    QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
-        if (watchpoint_address_matches(wp, addr, len)
-            && (wp->flags & flags)) {
-            if (replay_running_debug()) {
-                /*
-                 * Don't process the watchpoints when we are
-                 * in a reverse debugging operation.
-                 */
-                replay_breakpoint();
-                return;
-            }
-            if (flags == BP_MEM_READ) {
-                wp->flags |= BP_WATCHPOINT_HIT_READ;
-            } else {
-                wp->flags |= BP_WATCHPOINT_HIT_WRITE;
-            }
-            wp->hitaddr = MAX(addr, wp->vaddr);
-            wp->hitattrs = attrs;
-            if (!cpu->watchpoint_hit) {
-                if (wp->flags & BP_CPU &&
-                    !cc->debug_check_watchpoint(cpu, wp)) {
-                    wp->flags &= ~BP_WATCHPOINT_HIT;
-                    continue;
-                }
-                cpu->watchpoint_hit = wp;
-
-                mmap_lock();
-                tb_check_watchpoint(cpu, ra);
-                if (wp->flags & BP_STOP_BEFORE_ACCESS) {
-                    cpu->exception_index = EXCP_DEBUG;
-                    mmap_unlock();
-                    cpu_loop_exit_restore(cpu, ra);
-                } else {
-                    /* Force execution of one insn next time.  */
-                    cpu->cflags_next_tb = 1 | curr_cflags();
-                    mmap_unlock();
-                    if (ra) {
-                        cpu_restore_state(cpu, ra, true);
-                    }
-                    cpu_loop_exit_noexc(cpu);
-                }
-            }
-        } else {
-            wp->flags &= ~BP_WATCHPOINT_HIT;
-        }
-    }
-}
-
 static MemTxResult flatview_read(FlatView *fv, hwaddr addr,
                                  MemTxAttrs attrs, void *buf, hwaddr len);
 static MemTxResult flatview_write(FlatView *fv, hwaddr addr, MemTxAttrs attrs,
-- 
2.26.2


