Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A0A163D744
	for <lists+qemu-devel@lfdr.de>; Wed, 30 Nov 2022 14:54:09 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p0NWu-0004qZ-Um; Wed, 30 Nov 2022 08:53:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWq-0004me-Hh
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:36 -0500
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1p0NWl-0003d8-Gn
 for qemu-devel@nongnu.org; Wed, 30 Nov 2022 08:53:35 -0500
Received: by mail-wr1-x436.google.com with SMTP id bs21so27190060wrb.4
 for <qemu-devel@nongnu.org>; Wed, 30 Nov 2022 05:53:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i26w1+Nc68c0mRJL8cSUmFt0Pqis/V1/amcsjWFUuSM=;
 b=l62qh5h4hzqWEJdH6UzhDtdxP+G6po2JzvJjNXwQjOP64pwr3kvTv0Xu4tbXPjIWT9
 BIWY3EFBOO2wVUiQ+tlZADUIB8VN9GAwupN0vcn7BRGidOj3LegBKFN7RZb4X+QuCDDZ
 LQr44ZnyMY6EYQTfgZd9qd+N0Hu//7V6J2C5kGHOdETdPlsJKZIM0HNGUYqJMd0v5Jku
 aCk/BgrI5N3w9PyWbKBTAl7IXBl6ZQ33BL5CS28CyaIBhb1ibfZ3eLGeCIY8L/mWp7b+
 A1zRY6XGg3KLQrH4de0+mKbO4EGDO3JN6TKB25W9h75Pa+s6nrc67p1Kq5rq9UIGNaan
 eFgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i26w1+Nc68c0mRJL8cSUmFt0Pqis/V1/amcsjWFUuSM=;
 b=wr5ejuch1G4EUKWgnA/3uTYkt1qj7UzkF/fLkJCdaePXnR3dg8psEOjofM548qK4Pp
 iJAwYpejoPqtp5I+dSxwoIsCYxRwKB5G7JzhdSkEarR4oRPqUbwbCSRXVAAstm2jTNGd
 r+neOa4cIN331PPw22cfWHD5C8FBWwceoyisMNrClpTzn/RK22Rn5nKbOkQW9Zot4yxZ
 Q+AIJaigZNYq3TtTT6KWbiHnXTBDk2ku824pO/Xs4L0LDJHCK/XvbQLVqMah5vDh4JoT
 F/rBlaezgZbW3Lnsg4uFfAmW3iulQ3iCO7Da31ysK/GQ+9G+PsGsmCRaBnTKJWyzQ2j1
 5cww==
X-Gm-Message-State: ANoB5pnn2bzQlv5P8yBEa/CGVSmZulCKfFhurFInCvZdfdZLuMOJk+5y
 eVa4NJdTd92gf+5C+VNhgIONXRqEMxBK0V0j
X-Google-Smtp-Source: AA0mqf5srt9P9xjQPo0cLWXJFOEUktuS3A9GVZ5+bkb1ACFeOA/oMSE+vi97XrgFt9fn/iYZid8rZw==
X-Received: by 2002:a5d:6646:0:b0:242:164b:c58a with SMTP id
 f6-20020a5d6646000000b00242164bc58amr10022103wrw.45.1669816379438; 
 Wed, 30 Nov 2022 05:52:59 -0800 (PST)
Received: from localhost.localdomain ([81.0.6.76])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b003c6b7f5567csm5001397wms.0.2022.11.30.05.52.58
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 30 Nov 2022 05:52:59 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Yanan Wang <wangyanan55@huawei.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Thomas Huth <thuth@redhat.com>
Subject: [PATCH-for-8.0 3/5] cpu: Move breakpoint helpers to common code
Date: Wed, 30 Nov 2022 14:52:39 +0100
Message-Id: <20221130135241.85060-4-philmd@linaro.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20221130135241.85060-1-philmd@linaro.org>
References: <20221130135241.85060-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x436.google.com
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
---
 cpu.c         | 71 --------------------------------------------------
 cpus-common.c | 72 +++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 72 insertions(+), 71 deletions(-)

diff --git a/cpu.c b/cpu.c
index d4b24ea39a..385e72e140 100644
--- a/cpu.c
+++ b/cpu.c
@@ -257,77 +257,6 @@ void tb_invalidate_phys_addr(AddressSpace *as, hwaddr addr, MemTxAttrs attrs)
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
index 9151cf4240..8fdb34740e 100644
--- a/cpus-common.c
+++ b/cpus-common.c
@@ -25,6 +25,7 @@
 #include "hw/core/cpu.h"
 #include "sysemu/cpus.h"
 #include "qemu/lockable.h"
+#include "trace/trace-root.h"
 
 static QemuMutex qemu_cpu_list_lock;
 static QemuCond exclusive_cond;
@@ -413,3 +414,74 @@ void cpu_class_init_props(DeviceClass *dc)
                                    cpu_get_start_powered_off,
                                    cpu_set_start_powered_off);
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


