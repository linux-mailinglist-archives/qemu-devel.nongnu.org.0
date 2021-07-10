Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 658B73C3541
	for <lists+qemu-devel@lfdr.de>; Sat, 10 Jul 2021 17:43:17 +0200 (CEST)
Received: from localhost ([::1]:53600 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m2F8O-0001Qs-DG
	for lists+qemu-devel@lfdr.de; Sat, 10 Jul 2021 11:43:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59298)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2F0d-0007xx-G9
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:35:15 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:37434)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1m2F0b-0004Ev-SO
 for qemu-devel@nongnu.org; Sat, 10 Jul 2021 11:35:15 -0400
Received: by mail-pg1-x536.google.com with SMTP id t9so13198515pgn.4
 for <qemu-devel@nongnu.org>; Sat, 10 Jul 2021 08:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=E/MTlm5POUZQMp7Vf72rfKOh2eap4oJEXTCEaGTp+rQ=;
 b=n5dQdGQaSiKXYF7ql9LUYN7V4c77oIDJLu7nrR+z695H+Czap24F+rIlgeCGnSN4cL
 4/ssu/Eg38amNfS9MmH3JZbmBeG3GY6UAQ5ZIKFJrIgM1gKMTxE8gaw5NNYY35Jefkxs
 OSun7FQ4jKoyfLnFIaNGGzoul+2iZQMSkCfqKH3MqMLni4TBCYl/DBmslB6mGTan28u5
 hXGwN4jMfM0d5GggnaeyEL7cSFN7yuxKfAXjtLPyqY8QO1sWbk8Lno+NuSS8ceURdZHD
 Di47xA5QTYCRcGVPOZ06kNMhM5dhbO+V1pg9zfBdOVgnF22a2+oybP82fp5AtzwVOwFw
 cVkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=E/MTlm5POUZQMp7Vf72rfKOh2eap4oJEXTCEaGTp+rQ=;
 b=BNWfrddjIxzUWtssJOgilC5CXitxKLYmqbjanMppm4mbHx0Ndq6mxUl3SWRtH9eIf/
 rnchiwxT6hM4ZOd3TcfMpd8+fo3IwtYJJbjDKbrHrBBYd0O3n2fZMNtD04LRnmm7+umO
 WbMHr9KwK4g8kEa2eADa0Y0o3hIowogCoaCVr70W+MEI6IZ9noVO99n2wa7p03Z3B64D
 9aOzSkVpHVxcSBEj6NpiieKigVyHLNdJgufJ639PSVxD7qdjrmziwQWDWll++dzDFniG
 SzRiQqjkVbqXOZsAX20/X0rOz13QEazWcNVrs6sC/LFlPKteaKneLrO72pHfSTi5hRhV
 WvVg==
X-Gm-Message-State: AOAM530zgQe9G/xhLYi3fYypHIc15LrC3fsVBPi07/p6R3qTYInTG7eP
 j6oTfAecdqf5K69somNtuxlgcqq8aC0FzA==
X-Google-Smtp-Source: ABdhPJz6ijAW8RZ3nwmQLJ5rtCHDyFEA9WuYL7ILlFYgz0l3Rq1jl0VtXMUTB+K911rmIYGWrUV6Ew==
X-Received: by 2002:a62:a107:0:b029:328:a1c6:5736 with SMTP id
 b7-20020a62a1070000b0290328a1c65736mr11158412pff.61.1625931312449; 
 Sat, 10 Jul 2021 08:35:12 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id cx4sm7966136pjb.53.2021.07.10.08.35.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 08:35:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 41/41] cpu: Add breakpoint tracepoints
Date: Sat, 10 Jul 2021 08:31:43 -0700
Message-Id: <20210710153143.1320521-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210710153143.1320521-1-richard.henderson@linaro.org>
References: <20210710153143.1320521-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu.c        | 13 +++++++++----
 trace-events |  5 +++++
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/cpu.c b/cpu.c
index 164fefeaa3..83059537d7 100644
--- a/cpu.c
+++ b/cpu.c
@@ -38,6 +38,7 @@
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
+#include "trace/trace-root.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -285,6 +286,8 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
     if (breakpoint) {
         *breakpoint = bp;
     }
+
+    trace_breakpoint_insert(cpu->cpu_index, pc, flags);
     return 0;
 }
 
@@ -303,13 +306,14 @@ int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 }
 
 /* Remove a specific breakpoint by reference.  */
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint)
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
 {
-    QTAILQ_REMOVE(&cpu->breakpoints, breakpoint, entry);
+    QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
 
-    breakpoint_invalidate(cpu, breakpoint->pc);
+    breakpoint_invalidate(cpu, bp->pc);
 
-    g_free(breakpoint);
+    trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
+    g_free(bp);
 }
 
 /* Remove all matching breakpoints. */
@@ -337,6 +341,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
             /* XXX: only flush what is necessary */
             tb_flush(cpu);
         }
+        trace_breakpoint_singlestep(cpu->cpu_index, enabled);
     }
 }
 
diff --git a/trace-events b/trace-events
index 765fe251e6..c4cca29939 100644
--- a/trace-events
+++ b/trace-events
@@ -25,6 +25,11 @@
 #
 # The <format-string> should be a sprintf()-compatible format string.
 
+# cpu.c
+breakpoint_insert(int cpu_index, uint64_t pc, int flags) "cpu=%d pc=0x%" PRIx64 " flags=0x%x"
+breakpoint_remove(int cpu_index, uint64_t pc, int flags) "cpu=%d pc=0x%" PRIx64 " flags=0x%x"
+breakpoint_singlestep(int cpu_index, int enabled) "cpu=%d enable=%d"
+
 # dma-helpers.c
 dma_blk_io(void *dbs, void *bs, int64_t offset, bool to_dev) "dbs=%p bs=%p offset=%" PRId64 " to_dev=%d"
 dma_aio_cancel(void *dbs) "dbs=%p"
-- 
2.25.1


