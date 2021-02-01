Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 98DB430A547
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Feb 2021 11:25:13 +0100 (CET)
Received: from localhost ([::1]:51816 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l6WOO-000876-MI
	for lists+qemu-devel@lfdr.de; Mon, 01 Feb 2021 05:25:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:59636)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W9A-0000be-9W
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:28 -0500
Received: from mx2.suse.de ([195.135.220.15]:55692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <cfontana@suse.de>) id 1l6W98-0005qJ-Ff
 for qemu-devel@nongnu.org; Mon, 01 Feb 2021 05:09:28 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 16ADBAFF8;
 Mon,  1 Feb 2021 10:09:13 +0000 (UTC)
From: Claudio Fontana <cfontana@suse.de>
To: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v15 13/23] cpu: move adjust_watchpoint_address to tcg_ops
Date: Mon,  1 Feb 2021 11:08:53 +0100
Message-Id: <20210201100903.17309-14-cfontana@suse.de>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20210201100903.17309-1-cfontana@suse.de>
References: <20210201100903.17309-1-cfontana@suse.de>
MIME-Version: 1.0
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

commit 40612000599e ("arm: Correctly handle watchpoints for BE32 CPUs")

introduced this ARM-specific, TCG-specific hack to adjust the address,
before checking it with cpu_check_watchpoint.

Make adjust_watchpoint_address optional and move it to tcg_ops.

Signed-off-by: Claudio Fontana <cfontana@suse.de>
---
 include/hw/core/cpu.h | 6 +++++-
 hw/core/cpu.c         | 6 ------
 softmmu/physmem.c     | 5 ++++-
 target/arm/cpu.c      | 2 +-
 4 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
index 9e0ca2a875..e0a1a8feb5 100644
--- a/include/hw/core/cpu.h
+++ b/include/hw/core/cpu.h
@@ -134,6 +134,11 @@ typedef struct TcgCpuOperations {
     void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
                                 MMUAccessType access_type,
                                 int mmu_idx, uintptr_t retaddr);
+    /**
+     * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
+     */
+    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
+
 } TcgCpuOperations;
 
 /**
@@ -242,7 +247,6 @@ struct CPUClass {
     const char * (*gdb_get_dynamic_xml)(CPUState *cpu, const char *xmlname);
 
     void (*disas_set_info)(CPUState *cpu, disassemble_info *info);
-    vaddr (*adjust_watchpoint_address)(CPUState *cpu, vaddr addr, int len);
 
     const char *deprecation_note;
     /* Keep non-pointer data at the end to minimize holes.  */
diff --git a/hw/core/cpu.c b/hw/core/cpu.c
index 57542b6906..3d5bf9fe02 100644
--- a/hw/core/cpu.c
+++ b/hw/core/cpu.c
@@ -383,11 +383,6 @@ static int64_t cpu_common_get_arch_id(CPUState *cpu)
     return cpu->cpu_index;
 }
 
-static vaddr cpu_adjust_watchpoint_address(CPUState *cpu, vaddr addr, int len)
-{
-    return addr;
-}
-
 static Property cpu_common_props[] = {
 #ifndef CONFIG_USER_ONLY
     /* Create a memory property for softmmu CPU object,
@@ -421,7 +416,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
     k->gdb_write_register = cpu_common_gdb_write_register;
     k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
     k->debug_check_watchpoint = cpu_common_debug_check_watchpoint;
-    k->adjust_watchpoint_address = cpu_adjust_watchpoint_address;
     set_bit(DEVICE_CATEGORY_CPU, dc->categories);
     dc->realize = cpu_common_realizefn;
     dc->unrealize = cpu_common_unrealizefn;
diff --git a/softmmu/physmem.c b/softmmu/physmem.c
index ef94e32583..c5cf9b839e 100644
--- a/softmmu/physmem.c
+++ b/softmmu/physmem.c
@@ -894,7 +894,10 @@ void cpu_check_watchpoint(CPUState *cpu, vaddr addr, vaddr len,
         return;
     }
 
-    addr = cc->adjust_watchpoint_address(cpu, addr, len);
+    if (cc->tcg_ops.adjust_watchpoint_address) {
+        /* this is currently used only by ARM BE32 */
+        addr = cc->tcg_ops.adjust_watchpoint_address(cpu, addr, len);
+    }
     QTAILQ_FOREACH(wp, &cpu->watchpoints, entry) {
         if (watchpoint_address_matches(wp, addr, len)
             && (wp->flags & flags)) {
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index aa264eec0a..2a14431065 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -2284,7 +2284,7 @@ static void arm_cpu_class_init(ObjectClass *oc, void *data)
 #if !defined(CONFIG_USER_ONLY)
     cc->tcg_ops.do_transaction_failed = arm_cpu_do_transaction_failed;
     cc->tcg_ops.do_unaligned_access = arm_cpu_do_unaligned_access;
-    cc->adjust_watchpoint_address = arm_adjust_watchpoint_address;
+    cc->tcg_ops.adjust_watchpoint_address = arm_adjust_watchpoint_address;
     cc->tcg_ops.do_interrupt = arm_cpu_do_interrupt;
 #endif /* CONFIG_TCG && !CONFIG_USER_ONLY */
 #endif /* CONFIG_TCG */
-- 
2.26.2


