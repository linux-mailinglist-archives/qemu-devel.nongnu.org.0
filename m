Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 677DA3F0BB5
	for <lists+qemu-devel@lfdr.de>; Wed, 18 Aug 2021 21:24:22 +0200 (CEST)
Received: from localhost ([::1]:47378 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mGRAj-0000C3-DK
	for lists+qemu-devel@lfdr.de; Wed, 18 Aug 2021 15:24:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57646)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR62-0008Tm-6K
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:30 -0400
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:46929)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mGR60-0008Iw-L6
 for qemu-devel@nongnu.org; Wed, 18 Aug 2021 15:19:29 -0400
Received: by mail-pf1-x432.google.com with SMTP id y11so3175092pfl.13
 for <qemu-devel@nongnu.org>; Wed, 18 Aug 2021 12:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=1lb9h/c+bmG196/5FGLHF3i+4kSk9vOzZf2+vv32aas=;
 b=VSeJNFQslSmDYiGokeWByPU94xJ0t5+aUfg834PiHJZF9RhVzkyP4D//U+5+FxgWtm
 fttoFg8n8fM0SRbBgsZ6xtCKs6LyuvdtDAJBx3T6jdi/ZioN17AQ2YeAcRONpr6VpU51
 HzPxvhwTldd1dZoh+7iAaMdusB42JoQcHpXKVEgRo3OIdP7WC2Ol/rCRCByApPBRMUQE
 EFLW3Uxt+64tszUnUmQwyjfa+OZR14B3VqGVLnnbKa3rUDfEYiSj+MWCwiQPzBE7FnHF
 a3exp0clbq5rf/n5TOscmqwbefbfiPUhFdIpEHjtvm6vJIwS3Brw8NdMiIbMiw1gp0Co
 JABQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=1lb9h/c+bmG196/5FGLHF3i+4kSk9vOzZf2+vv32aas=;
 b=FJXZyK9m8kZEDsfvvxlRXjH48eKXijoUsG+S9tSX5WWLQMmI/eIjJRKvmWLqcBKW2h
 LeZ5D+rrGKJ0WerTAuhI1zAAJsr7DWB6bVC5v01/j5XvWMnLrQirthmTtho4VRCJG0mP
 2ujwvVIe9ENzzufBsmynrETM4PgN4RvTlZ+VZfI0yi8j08U//bi4LE67+lK1PdvXsljf
 UCamW4sh+rdt925OsFghC9EeCCsztAB/Pq+34TmwvoaWXBEB3QKykVoORp4OyrRh/ZXQ
 INSQpZ5WF0sYH7WlwxHS3cVUCZO+tlQwuZdSLXHhWwQdPZr5D9cKLWuyuAIrDmfeel4r
 WPWw==
X-Gm-Message-State: AOAM5338l/rRJFoA0btTPC7lBs/FzwbrgwLvLNfSBGxCfJOgY68FtxEZ
 1orDun25w/wlsUe5tTGYHU36L5jjU7Is3Q==
X-Google-Smtp-Source: ABdhPJxjhRdKBPipt3JOheswehP6fm0VNHd8cJBe8gJeXcJ/Qf9INE/RPwfFHoDXzWN20RgXQZ/BfQ==
X-Received: by 2002:aa7:9904:0:b0:3e1:a79a:222e with SMTP id
 z4-20020aa79904000000b003e1a79a222emr10970251pff.41.1629314367455; 
 Wed, 18 Aug 2021 12:19:27 -0700 (PDT)
Received: from localhost.localdomain ([173.197.107.15])
 by smtp.gmail.com with ESMTPSA id a6sm524108pjs.40.2021.08.18.12.19.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 12:19:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 03/66] hw/core: Make do_unaligned_access available to
 user-only
Date: Wed, 18 Aug 2021 09:18:17 -1000
Message-Id: <20210818191920.390759-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818191920.390759-1-richard.henderson@linaro.org>
References: <20210818191920.390759-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We shouldn't be ignoring SIGBUS for user-only.

Move our existing TCGCPUOps hook out from CONFIG_SOFTMMU.
Move the wrapper, cpu_unaligned_access, to cpu-exec-common.c.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h          |  4 ++++
 include/hw/core/tcg-cpu-ops.h | 16 ++++++++--------
 accel/tcg/cpu-exec-common.c   | 12 ++++++++++++
 accel/tcg/cputlb.c            |  9 ---------
 4 files changed, 24 insertions(+), 17 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 881bc1ede0..a5e70cd91d 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -19,4 +19,8 @@ void QEMU_NORETURN cpu_io_recompile(CPUState *cpu, uintptr_t retaddr);
 void page_init(void);
 void tb_htable_init(void);
 
+void QEMU_NORETURN cpu_unaligned_access(CPUState *cpu, vaddr addr,
+                                        MMUAccessType access_type,
+                                        int mmu_idx, uintptr_t retaddr);
+
 #endif /* ACCEL_TCG_INTERNAL_H */
diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index ee0795def4..3753af03d8 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -60,6 +60,14 @@ struct TCGCPUOps {
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
+    /**
+     * @do_unaligned_access: Callback for unaligned access handling
+     * The callback must exit via raising an exception.
+     */
+    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
+                                MMUAccessType access_type,
+                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
+
 #ifdef NEED_CPU_H
 #ifdef CONFIG_SOFTMMU
     /**
@@ -70,14 +78,6 @@ struct TCGCPUOps {
                                   unsigned size, MMUAccessType access_type,
                                   int mmu_idx, MemTxAttrs attrs,
                                   MemTxResult response, uintptr_t retaddr);
-    /**
-     * @do_unaligned_access: Callback for unaligned access handling
-     * The callback must exit via raising an exception.
-     */
-    void (*do_unaligned_access)(CPUState *cpu, vaddr addr,
-                                MMUAccessType access_type,
-                                int mmu_idx, uintptr_t retaddr) QEMU_NORETURN;
-
     /**
      * @adjust_watchpoint_address: hack for cpu_check_watchpoint used by ARM
      */
diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
index be6fe45aa5..eeff20a347 100644
--- a/accel/tcg/cpu-exec-common.c
+++ b/accel/tcg/cpu-exec-common.c
@@ -21,6 +21,8 @@
 #include "sysemu/cpus.h"
 #include "sysemu/tcg.h"
 #include "exec/exec-all.h"
+#include "hw/core/tcg-cpu-ops.h"
+#include "internal.h"
 
 bool tcg_allowed;
 
@@ -81,3 +83,13 @@ void cpu_loop_exit_atomic(CPUState *cpu, uintptr_t pc)
     cpu->exception_index = EXCP_ATOMIC;
     cpu_loop_exit_restore(cpu, pc);
 }
+
+void cpu_unaligned_access(CPUState *cpu, vaddr addr,
+                          MMUAccessType access_type,
+                          int mmu_idx, uintptr_t retaddr)
+{
+    CPUClass *cc = CPU_GET_CLASS(cpu);
+
+    assert(cc->tcg_ops->do_unaligned_access != NULL);
+    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
+}
diff --git a/accel/tcg/cputlb.c b/accel/tcg/cputlb.c
index b1e5471f94..116b289907 100644
--- a/accel/tcg/cputlb.c
+++ b/accel/tcg/cputlb.c
@@ -1306,15 +1306,6 @@ static void tlb_fill(CPUState *cpu, target_ulong addr, int size,
     assert(ok);
 }
 
-static inline void cpu_unaligned_access(CPUState *cpu, vaddr addr,
-                                        MMUAccessType access_type,
-                                        int mmu_idx, uintptr_t retaddr)
-{
-    CPUClass *cc = CPU_GET_CLASS(cpu);
-
-    cc->tcg_ops->do_unaligned_access(cpu, addr, access_type, mmu_idx, retaddr);
-}
-
 static inline void cpu_transaction_failed(CPUState *cpu, hwaddr physaddr,
                                           vaddr addr, unsigned size,
                                           MMUAccessType access_type,
-- 
2.25.1


