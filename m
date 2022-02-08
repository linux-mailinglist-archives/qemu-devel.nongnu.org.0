Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F128A4AE04D
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Feb 2022 19:04:52 +0100 (CET)
Received: from localhost ([::1]:34342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nHUrB-0002c3-Ur
	for lists+qemu-devel@lfdr.de; Tue, 08 Feb 2022 13:04:51 -0500
Received: from eggs.gnu.org ([209.51.188.92]:43098)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLQ-00019g-Ma
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:52 -0500
Received: from [2607:f8b0:4864:20::102c] (port=45666
 helo=mail-pj1-x102c.google.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1nHSLL-0000Me-9J
 for qemu-devel@nongnu.org; Tue, 08 Feb 2022 10:23:52 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 g15-20020a17090a67cf00b001b7d5b6bedaso3130255pjm.4
 for <qemu-devel@nongnu.org>; Tue, 08 Feb 2022 07:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=U6WJMSm90Sje6r4lVIrM5fq/n6jsW1aCmXrufIszTA8=;
 b=CPjCjXu7NCrMU6xdqc7266zC2xfw1j+mxGhNdoBbAstgW0OM8C24EvVOE0OBXoMEKN
 k8tvxyIMvI2HhNGjDnZh35SoTGDhM9gwn87rzrgU4qo8KnjiHcB02Uy5SPdFAfucvsVJ
 t+DybV3ZdTZPU2jRxoF//mgFSEnVF/ba/dkzqPC5p0wwmxwCKdqAALqaFR8oIMoayhg5
 jx2s0dr7rM3+am4t4xKraLrB+KdJgz9qXS5cJdd2bRu6ataU/hl3WGb0ccV2pkq4MqyY
 sfzGWBYd38D4aTPRVBdgFKNu0GeHjUHIedaeTqRLX4aPkPmrZyfH7u59ccbWoq1nuzNH
 NqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=U6WJMSm90Sje6r4lVIrM5fq/n6jsW1aCmXrufIszTA8=;
 b=OuOHmXp1yR5HfklwS0rh/MoZ/rgh169XeSFMm5k6lksMpR/gvTb/LCSZCumhPoZ7Bk
 CIFhknxTFhV+cLOsQl5NYEkCSSTNZBdSp2gHAhnz4AwwFtcQwsJaTAWsW4mwF/IRZxsc
 Pc2Kj0xMT661yqMglBaUnsGDcCx3JclaCNi9kYNZ/g5KnjGl+GisicOrWax62tRFQKDG
 5kSwTb06J5NUt3Nx6G3PbK52lSPcV5B21FMhw3gZFu1qVakXqUMMmOcTUjOJR+Bgdq/V
 0cUZZFwzDb0apc2P1/qjJhlsecHtKL4lEcVv7f953qukoam0CLo+uIYWPEjF/yKCypR1
 5k9Q==
X-Gm-Message-State: AOAM532pPPV21lLVC2PCO+ypefTYpLlHyiWXhOZ6697O6Ln4ENzW0+zH
 dW2DbsRYkjRr4JsWUKhNkDmVfSe4+mA=
X-Google-Smtp-Source: ABdhPJz1PxphHYulHUy5qXLfS/QRJr03u6bBBHLvX2YHxNJZOV8pycUFvD5cdytANmrZF2RuLDvRXA==
X-Received: by 2002:a17:90b:1d0d:: with SMTP id
 on13mr1900896pjb.171.1644333825851; 
 Tue, 08 Feb 2022 07:23:45 -0800 (PST)
Received: from localhost.localdomain (154.red-83-50-83.dynamicip.rima-tde.net.
 [83.50.83.154])
 by smtp.gmail.com with ESMTPSA id t1sm16905613pfj.115.2022.02.08.07.23.43
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 08 Feb 2022 07:23:45 -0800 (PST)
To: qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 07/13] cpu: Move common code to cpu-common
Date: Tue,  8 Feb 2022 16:22:37 +0100
Message-Id: <20220208152243.16452-8-f4bug@amsat.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220208152243.16452-1-f4bug@amsat.org>
References: <20220208152243.16452-1-f4bug@amsat.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Host-Lookup-Failed: Reverse DNS lookup failed for 2607:f8b0:4864:20::102c
 (failed)
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-pj1-x102c.google.com
X-Spam_score_int: -6
X-Spam_score: -0.7
X-Spam_bar: /
X-Spam_report: (-0.7 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.248,
 PDS_HP_HELO_NORDNS=0.001, RCVD_IN_DNSWL_NONE=-0.0001, RDNS_NONE=0.793,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=no autolearn_force=no
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
Reply-to:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
From:  =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= via <qemu-devel@nongnu.org>

cpu_abort() and cpu_breakpoint*() don't use target-specific API.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 cpu.c         | 109 ------------------------------------------------
 cpus-common.c | 112 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 112 insertions(+), 109 deletions(-)

diff --git a/cpu.c b/cpu.c
index a728f3e762..c4ad6cb22e 100644
--- a/cpu.c
+++ b/cpu.c
@@ -34,10 +34,8 @@
 #endif
 #include "sysemu/tcg.h"
 #include "sysemu/kvm.h"
-#include "sysemu/replay.h"
 #include "exec/exec-all.h"
 #include "exec/translate-all.h"
-#include "exec/log.h"
 #include "hw/core/accel-cpu.h"
 #include "trace/trace-root.h"
 #include "qemu/accel.h"
@@ -275,77 +273,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
 }
 #endif
 
-/* Add a breakpoint.  */
-int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
-                          CPUBreakpoint **breakpoint)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUBreakpoint *bp;
-
-    if (cc->gdb_adjust_breakpoint) {
-        pc = cc->gdb_adjust_breakpoint(cpu, pc);
-    }
-
-    bp = g_malloc(sizeof(*bp));
-
-    bp->pc = pc;
-    bp->flags = flags;
-
-    /* keep all GDB-injected breakpoints in front */
-    if (flags & BP_GDB) {
-        QTAILQ_INSERT_HEAD(&cpu->breakpoints, bp, entry);
-    } else {
-        QTAILQ_INSERT_TAIL(&cpu->breakpoints, bp, entry);
-    }
-
-    if (breakpoint) {
-        *breakpoint = bp;
-    }
-
-    trace_breakpoint_insert(cpu->cpu_index, pc, flags);
-    return 0;
-}
-
-/* Remove a specific breakpoint.  */
-int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-    CPUBreakpoint *bp;
-
-    if (cc->gdb_adjust_breakpoint) {
-        pc = cc->gdb_adjust_breakpoint(cpu, pc);
-    }
-
-    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
-        if (bp->pc == pc && bp->flags == flags) {
-            cpu_breakpoint_remove_by_ref(cpu, bp);
-            return 0;
-        }
-    }
-    return -ENOENT;
-}
-
-/* Remove a specific breakpoint by reference.  */
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
-{
-    QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
-
-    trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
-    g_free(bp);
-}
-
-/* Remove all matching breakpoints. */
-void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
-{
-    CPUBreakpoint *bp, *next;
-
-    QTAILQ_FOREACH_SAFE(bp, &cpu->breakpoints, entry, next) {
-        if (bp->flags & mask) {
-            cpu_breakpoint_remove_by_ref(cpu, bp);
-        }
-    }
-}
-
 /* enable or disable single step mode. EXCP_DEBUG is returned by the
    CPU loop after each instruction */
 void cpu_single_step(CPUState *cpu, int enabled)
@@ -359,42 +286,6 @@ void cpu_single_step(CPUState *cpu, int enabled)
     }
 }
 
-void cpu_abort(CPUState *cpu, const char *fmt, ...)
-{
-    va_list ap;
-    va_list ap2;
-
-    va_start(ap, fmt);
-    va_copy(ap2, ap);
-    fprintf(stderr, "qemu: fatal: ");
-    vfprintf(stderr, fmt, ap);
-    fprintf(stderr, "\n");
-    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-    if (qemu_log_separate()) {
-        FILE *logfile = qemu_log_lock();
-        qemu_log("qemu: fatal: ");
-        qemu_log_vprintf(fmt, ap2);
-        qemu_log("\n");
-        log_cpu_state(cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
-        qemu_log_flush();
-        qemu_log_unlock(logfile);
-        qemu_log_close();
-    }
-    va_end(ap2);
-    va_end(ap);
-    replay_finish();
-#if defined(CONFIG_USER_ONLY)
-    {
-        struct sigaction act;
-        sigfillset(&act.sa_mask);
-        act.sa_handler = SIG_DFL;
-        act.sa_flags = 0;
-        sigaction(SIGABRT, &act, NULL);
-    }
-#endif
-    abort();
-}
-
 /* physical memory access (slow version, mainly for debug) */
 #if defined(CONFIG_USER_ONLY)
 int cpu_memory_rw_debug(CPUState *cpu, vaddr addr,
diff --git a/cpus-common.c b/cpus-common.c
index 6e73d3e58d..fbd66a9704 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -20,9 +20,14 @@
 #include "qemu/osdep.h"
 #include "qemu/main-loop.h"
 #include "exec/cpu-common.h"
+#include "exec/log.h"
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
+#include "sysemu/tcg.h"
+#include "sysemu/kvm.h"
+#include "sysemu/replay.h"
 #include "qemu/lockable.h"
+#include "trace/trace-root.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -352,3 +357,110 @@ void process_queued_cpu_work(CPUState *cpu)
     qemu_mutex_unlock(&cpu->work_mutex);
     qemu_cond_broadcast(&qemu_work_cond);
 }
+
+/* Add a breakpoint.  */
+int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
+                          CPUBreakpoint **breakpoint)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUBreakpoint *bp;
+
+    if (cc->gdb_adjust_breakpoint) {
+        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    }
+
+    bp = g_malloc(sizeof(*bp));
+
+    bp->pc = pc;
+    bp->flags = flags;
+
+    /* keep all GDB-injected breakpoints in front */
+    if (flags & BP_GDB) {
+        QTAILQ_INSERT_HEAD(&cpu->breakpoints, bp, entry);
+    } else {
+        QTAILQ_INSERT_TAIL(&cpu->breakpoints, bp, entry);
+    }
+
+    if (breakpoint) {
+        *breakpoint = bp;
+    }
+
+    trace_breakpoint_insert(cpu->cpu_index, pc, flags);
+    return 0;
+}
+
+/* Remove a specific breakpoint.  */
+int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+    CPUBreakpoint *bp;
+
+    if (cc->gdb_adjust_breakpoint) {
+        pc = cc->gdb_adjust_breakpoint(cpu, pc);
+    }
+
+    QTAILQ_FOREACH(bp, &cpu->breakpoints, entry) {
+        if (bp->pc == pc && bp->flags == flags) {
+            cpu_breakpoint_remove_by_ref(cpu, bp);
+            return 0;
+        }
+    }
+    return -ENOENT;
+}
+
+/* Remove a specific breakpoint by reference.  */
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
+{
+    QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
+
+    trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
+    g_free(bp);
+}
+
+/* Remove all matching breakpoints. */
+void cpu_breakpoint_remove_all(CPUState *cpu, int mask)
+{
+    CPUBreakpoint *bp, *next;
+
+    QTAILQ_FOREACH_SAFE(bp, &cpu->breakpoints, entry, next) {
+        if (bp->flags & mask) {
+            cpu_breakpoint_remove_by_ref(cpu, bp);
+        }
+    }
+}
+
+void cpu_abort(CPUState *cpu, const char *fmt, ...)
+{
+    va_list ap;
+    va_list ap2;
+
+    va_start(ap, fmt);
+    va_copy(ap2, ap);
+    fprintf(stderr, "qemu: fatal: ");
+    vfprintf(stderr, fmt, ap);
+    fprintf(stderr, "\n");
+    cpu_dump_state(cpu, stderr, CPU_DUMP_FPU | CPU_DUMP_CCOP);
+    if (qemu_log_separate()) {
+        FILE *logfile = qemu_log_lock();
+        qemu_log("qemu: fatal: ");
+        qemu_log_vprintf(fmt, ap2);
+        qemu_log("\n");
+        log_cpu_state(cpu, CPU_DUMP_FPU | CPU_DUMP_CCOP);
+        qemu_log_flush();
+        qemu_log_unlock(logfile);
+        qemu_log_close();
+    }
+    va_end(ap2);
+    va_end(ap);
+    replay_finish();
+#if defined(CONFIG_USER_ONLY)
+    {
+        struct sigaction act;
+        sigfillset(&act.sa_mask);
+        act.sa_handler = SIG_DFL;
+        act.sa_flags = 0;
+        sigaction(SIGABRT, &act, NULL);
+    }
+#endif
+    abort();
+}
-- 
2.34.1


