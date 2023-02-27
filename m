Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 564286A41D5
	for <lists+qemu-devel@lfdr.de>; Mon, 27 Feb 2023 13:40:49 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pWcmg-0002IG-Vm; Mon, 27 Feb 2023 07:39:15 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcma-0002Fa-4n
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:09 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1pWcmX-00018F-Ei
 for qemu-devel@nongnu.org; Mon, 27 Feb 2023 07:39:07 -0500
Received: by mail-wr1-x42c.google.com with SMTP id l1so2998622wry.12
 for <qemu-devel@nongnu.org>; Mon, 27 Feb 2023 04:39:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kQn8V5ukITd1WExNVx9+ppeZt/Ds+9QWujFEFkVK6u4=;
 b=SzkAd6CtplJmvrWxTseE2CvHzGwRskqyhHpH/GIptL8RTs6VM92+Q9ZZuIgBW01gRf
 6chRx/ioAfWF0TldHS8n+gDZLNQzghfSKvVcFm+64kA+dHAvDYRNBNnXSPLw911JtVXi
 psHRF6kdzxIuj7yCb/nxKuWQRQuyVeHPiPlUY5zZWPgvWSsDFE2ZsuQ/EITkAT9YF+Do
 7vxQH9mye+yYthiOGz9hZiaN0lC6YeMqP/GgMJXZaj3/Wpp2sU+FtrScjWxX8Tp9YAo3
 FGUDYMOxvwPClqlNqk6Ue+BMUg7Zyquydp6ZTCK00X78jYFKu/rsKSVDeCCVU+TBhrCw
 UGog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kQn8V5ukITd1WExNVx9+ppeZt/Ds+9QWujFEFkVK6u4=;
 b=wEU/f6rytzHy8WeXNFGiYz7xjoIPlu/GW8IuR+PBvRFdIgPd7RkIRHgKF55p2Id5Vq
 MuGDfdVVAWViGjGQnVCZ+ABlI1bkXXZAx57AP4h4bOER38i3cdsiSkmweShYOG5XLn+y
 7XZAylfkWBgM5wgEqhxThnc1MozOqr1jIupuHcxfWYrSqzn0ml1YnPwovyMP6wnJ/KN2
 E4aQwaDSsypy72qMWvHmSU+zC5+rnWB/7EfHBd0QaTAFoxpBbFLyCh5ZH5N6JfIcXyO7
 meldyGF4qjHkYZW4GmKmlBrWj7YODXWhLKFEcMDQZ5MblbeTRnn0B46RAZLxaS+qrrGy
 qY1A==
X-Gm-Message-State: AO0yUKXc+EIdVrJ1375c8j4859T1UX5dok0AfUm2Mita/ugqO9DMrX4I
 /AChH1jQPycR4Elhh0mPPkWsIvjftRs5Kwvx
X-Google-Smtp-Source: AK7set8zk8Sivc3w/Pl8YMkCQurdzDMXJyc2b6p3w05aYlluWGNAsaqTTlR/rmG3+sJPEWBM/OWcOA==
X-Received: by 2002:a5d:58ea:0:b0:2c7:d56:7d72 with SMTP id
 f10-20020a5d58ea000000b002c70d567d72mr13643661wrd.19.1677501544414; 
 Mon, 27 Feb 2023 04:39:04 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l16-20020adfe590000000b002c70e60eb40sm7030353wrm.11.2023.02.27.04.39.02
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Feb 2023 04:39:03 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>
Subject: [PULL 002/123] cpu: Move breakpoint helpers to common code
Date: Mon, 27 Feb 2023 13:36:46 +0100
Message-Id: <20230227123847.27110-3-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230227123847.27110-1-philmd@linaro.org>
References: <20230227123847.27110-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

This code is not target-specific.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Message-Id: <20221130135241.85060-4-philmd@linaro.org>
---
 cpu.c         | 71 --------------------------------------------------
 cpus-common.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 71 deletions(-)

diff --git a/cpu.c b/cpu.c
index 21cf809614..44df16231f 100644
--- a/cpu.c
+++ b/cpu.c
@@ -319,77 +319,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
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
diff --git a/cpus-common.c b/cpus-common.c
index 39f355de98..b0047e456f 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -23,6 +23,7 @@
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
+#include "trace/trace-root.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -368,3 +369,74 @@ void process_queued_cpu_work(CPUState *cpu)
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
-- 
2.38.1


