Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id ED8D53B9412
	for <lists+qemu-devel@lfdr.de>; Thu,  1 Jul 2021 17:38:45 +0200 (CEST)
Received: from localhost ([::1]:45158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lyym5-0005yo-23
	for lists+qemu-devel@lfdr.de; Thu, 01 Jul 2021 11:38:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZn-0004ms-Qb
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:05 -0400
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636]:41845)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lyyZb-0008Jx-Mr
 for qemu-devel@nongnu.org; Thu, 01 Jul 2021 11:26:03 -0400
Received: by mail-pl1-x636.google.com with SMTP id z4so3843958plg.8
 for <qemu-devel@nongnu.org>; Thu, 01 Jul 2021 08:25:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dVAJMlBLnkdiQ0OFyNnG82kaYtMH2wkH/dVTgpA0DcY=;
 b=wRwBt6H6gaOb13z7lIBrrIeZAcgr4l05FIcKSbWkc2eXHaUvRmyA1SGrNJet4xsA/O
 Lr9MdzmCcmDP+wAoCOgb0gqMyp19vVGb+G4Vcl5SHewFbexorTtIWSzTLvbwnBffiErs
 lmDs1WkL7hXklTPvKKuGKiMEfuvIllIZE7xCsJg5nxM/GOXEu65pBX4YeRrNKKuNgBst
 Azhk0DUXe3aEPPNsP0x4gdjeab9I81mIqOqVK4ACq2QVbb9SJ8wiMKPzEoQhNuEAI7s6
 H1Lctrwbv4HuXICFOwNHULO6LHaNvRjss8vcQM5aFxCE316NG61OkG7ffchbt9qL39mq
 3/XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dVAJMlBLnkdiQ0OFyNnG82kaYtMH2wkH/dVTgpA0DcY=;
 b=nxM7vSvshmUbAPsBmloAmDU/YvG19vdzRGkSmrZwW9Ng+cZe3wF7Vcnw/AbxlNL2dL
 thYPiuyWIKzLvptFRAFu1nlMCrpmDNNniF0PJdTBrWWmK4L1I6+9Q8bcYZV5QOemsj4x
 AAbL9LZEmCHYKTzBDoSVHv7S/rROOOlpZ4ipLNLS8RX2TFJvI05JS0lL2mgy14MW4gEa
 PGDSW7c/4lUFzD/aKirNBC5TvxfTZfmcDI9c/7cv84sghPqJih43VFyojdBL8rA367dh
 acnjh8hKbQpBmzYZzIMA/Oscoh2uy8HDzeKsSiUclj6vaPEPp82Z2+2l6iszwYA+tUgr
 EwpA==
X-Gm-Message-State: AOAM533wYH9EGRa2c1uHs0zoqHGG9dGyUvoQXC1E7DfRFZjZyq0QksNH
 pGAzgegK56dd/MOoX6YsZnWbnNauQWD/3Q==
X-Google-Smtp-Source: ABdhPJxocOGzEk/P+z/f+tZsTc6cPUl59NDh4dRX42S1WO8sc3bvcMOECWOP0TsYc3Bu/94WfnZLjg==
X-Received: by 2002:a17:90a:c58d:: with SMTP id
 l13mr10614736pjt.186.1625153149047; 
 Thu, 01 Jul 2021 08:25:49 -0700 (PDT)
Received: from localhost.localdomain ([71.212.149.176])
 by smtp.gmail.com with ESMTPSA id j4sm10213197pjv.7.2021.07.01.08.25.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Jul 2021 08:25:48 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 17/17] cpu: Add breakpoint tracepoints
Date: Thu,  1 Jul 2021 08:25:37 -0700
Message-Id: <20210701152537.3330420-18-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210701152537.3330420-1-richard.henderson@linaro.org>
References: <20210701152537.3330420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::636;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x636.google.com
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
Cc: peter.maydell@linaro.org, mark.cave-ayland@ilande.co.uk,
 alex.bennee@linaro.org, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 cpu.c        | 11 ++++++++---
 trace-events |  5 +++++
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/cpu.c b/cpu.c
index 2c9da10d0f..addcb5db9c 100644
--- a/cpu.c
+++ b/cpu.c
@@ -38,6 +38,7 @@
 #include "exec/translate-all.h"
 #include "exec/log.h"
 #include "hw/core/accel-cpu.h"
+#include "trace/trace-root.h"
 
 uintptr_t qemu_host_page_size;
 intptr_t qemu_host_page_mask;
@@ -267,6 +268,8 @@ int cpu_breakpoint_insert(CPUState *cpu, vaddr pc, int flags,
     if (breakpoint) {
         *breakpoint = bp;
     }
+
+    trace_breakpoint_insert(cpu->cpu_index, pc, flags);
     return 0;
 }
 
@@ -285,11 +288,12 @@ int cpu_breakpoint_remove(CPUState *cpu, vaddr pc, int flags)
 }
 
 /* Remove a specific breakpoint by reference.  */
-void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *breakpoint)
+void cpu_breakpoint_remove_by_ref(CPUState *cpu, CPUBreakpoint *bp)
 {
-    QTAILQ_REMOVE(&cpu->breakpoints, breakpoint, entry);
+    QTAILQ_REMOVE(&cpu->breakpoints, bp, entry);
 
-    g_free(breakpoint);
+    trace_breakpoint_remove(cpu->cpu_index, bp->pc, bp->flags);
+    g_free(bp);
 }
 
 /* Remove all matching breakpoints. */
@@ -313,6 +317,7 @@ void cpu_single_step(CPUState *cpu, int enabled)
         if (kvm_enabled()) {
             kvm_update_guest_debug(cpu, 0);
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


