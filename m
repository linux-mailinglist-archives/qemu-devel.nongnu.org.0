Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF1A56C0E65
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:24 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTb-0003mR-KL; Mon, 20 Mar 2023 06:10:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTU-0003l4-Pm
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0000Dc-2s
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: by mail-wm1-x32a.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso7100673wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DLYB3843FF7GnXqw2uZL62dMpE0zmO1Pq0/V+yySmyc=;
 b=tsGUSQCeACRFIz7OGFa4rQgpCLODKhLW2IkVHWthOFOdfzuX8D6BhStoczeCT/LBIk
 FaLCibdY1ctY1InlCQsgIwLkl0Hoe1YuzhLFmOxPOrvgi6FUDeqbkc1vNE73SIYVrWDa
 0Op8FYGelfIb7yeB/Kj3nSukroyJWvyi1TlL5bkj23RQ4bc3Ji2IstVwyBNvjTf28sbk
 KVPHRQz/rcvv5hCel2Pl1pIP8fRQZFU9USzP1F3pji6nPr70jRmiV8Upv+ZIJClh1q0F
 I7Wt4L7FLqolfOd5zuxuBOt6IdxJsxM8lrJoHx9ZgaZ5B5mgoYoLisYdAx91+Q08bZvc
 Sb/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307041;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DLYB3843FF7GnXqw2uZL62dMpE0zmO1Pq0/V+yySmyc=;
 b=XfKkI6egbwy/u2IDNv9JhOSg2a2djgq1opE/wpy4Ztp767u0M+ZfGIKtQMSBDveF17
 XaQNS8vrsYHHQNPIQzVGspqFptMrseq3qBXUSp/lhaVHrWZ+PQsmUofKSdVzGaBcjVzB
 Y+4VEpr63Z+cMTbyhVZgquKXkITLn/2u3qts/1wlCz3N/tB7X3GkTCVYh5Vc/Y3Stf57
 axQq3RAWcnG5uUiWey3H4v2eDoTeV/n8aJJVdR/kLr2doz8cGCT1SPayV2mtOleVxAy5
 iACXbZQJM9jL82AEs7GAA5QK0y0xT0kxchu+GnH2r4eKMLyKWoGqtA/ZWu0xpQ1/JVoO
 JjQw==
X-Gm-Message-State: AO0yUKWS+MXj1cfkiVL6WtGN4H7PgLzJppOpa0apqCFEfxQnpcQv4Rb9
 77eIia3toRDaZBWAdnX7qyv+iA==
X-Google-Smtp-Source: AK7set8Jre+gC9YyZMgkPg6FTd25Z5W1a5W9QDQJPT2PU5k+ToIrr/DdP1mijVWqkso+r/Or+hBM1g==
X-Received: by 2002:a05:600c:350f:b0:3eb:3843:9f31 with SMTP id
 h15-20020a05600c350f00b003eb38439f31mr32018972wmq.10.1679307040592; 
 Mon, 20 Mar 2023 03:10:40 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a7bca59000000b003ed341d2d68sm9910364wml.16.2023.03.20.03.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id AD1611FFB7;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 08/10] accel/tcg: push i386 specific hacks into
 handle_cpu_interrupt callback
Date: Mon, 20 Mar 2023 10:10:33 +0000
Message-Id: <20230320101035.2214196-9-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32a;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x32a.google.com
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

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/sysemu-cpu-ops.h | 11 +++++++++++
 target/i386/cpu-internal.h       |  1 +
 accel/tcg/cpu-exec-softmmu.c     | 16 ++++++++++++++++
 accel/tcg/cpu-exec.c             | 31 ++++++++++---------------------
 target/i386/cpu-sysemu.c         | 17 +++++++++++++++++
 target/i386/cpu.c                |  1 +
 6 files changed, 56 insertions(+), 21 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index c9d30172c4..d53907b517 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -53,6 +53,15 @@ typedef struct SysemuCPUOps {
      * @cs: The CPUState
      */
     void (*handle_cpu_halt)(CPUState *cpu);
+    /**
+     * @handle_cpu_interrupt: handle init/reset interrupts
+     * @cs: The CPUState
+     * @irq_request: the interrupt request
+     *
+     * Most architectures share a common handler. Returns true if the
+     * handler did indeed handle and interrupt.
+     */
+    bool (*handle_cpu_interrupt)(CPUState *cpu,  int irq_request);
     /**
      * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
      * 32-bit VM coredump.
@@ -94,4 +103,6 @@ typedef struct SysemuCPUOps {
 
 } SysemuCPUOps;
 
+bool common_cpu_handle_interrupt(CPUState *cpu,  int irq_request);
+
 #endif /* SYSEMU_CPU_OPS_H */
diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index 75b302fb33..4fee4e125e 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -66,6 +66,7 @@ void x86_cpu_apic_create(X86CPU *cpu, Error **errp);
 void x86_cpu_apic_realize(X86CPU *cpu, Error **errp);
 void x86_cpu_machine_reset_cb(void *opaque);
 void x86_cpu_handle_halt(CPUState *cs);
+bool x86_cpu_handle_interrupt(CPUState *cpu,  int irq_request);
 #endif /* !CONFIG_USER_ONLY */
 
 #endif /* I386_CPU_INTERNAL_H */
diff --git a/accel/tcg/cpu-exec-softmmu.c b/accel/tcg/cpu-exec-softmmu.c
index 2318dd8c7d..89e6cb2e3a 100644
--- a/accel/tcg/cpu-exec-softmmu.c
+++ b/accel/tcg/cpu-exec-softmmu.c
@@ -18,7 +18,11 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
+#include "exec/replay-core.h"
+#include "exec/cpu-irq.h"
 #include "hw/core/cpu.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #include "sysemu/cpus.h"
 
 void cpu_reloading_memory_map(void)
@@ -48,3 +52,15 @@ void cpu_reloading_memory_map(void)
         rcu_read_lock();
     }
 }
+
+/* Called with BQL held */
+bool common_cpu_handle_interrupt(CPUState *cpu,  int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_RESET) {
+        replay_interrupt();
+        cpu_reset(cpu);
+        return true;
+    } else {
+        return false;
+    }
+}
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index daa6e24daf..8fa19b7222 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -797,28 +797,17 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
             cpu->exception_index = EXCP_HLT;
             return true;
         }
-#if defined(TARGET_I386)
-        else if (interrupt_request & CPU_INTERRUPT_INIT) {
-            X86CPU *x86_cpu = X86_CPU(cpu);
-            CPUArchState *env = &x86_cpu->env;
-            replay_interrupt();
-            cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
-            do_cpu_init(x86_cpu);
-            cpu->exception_index = EXCP_HALTED;
-            return true;
-        }
-#else
-        else if (interrupt_request & CPU_INTERRUPT_RESET) {
-            replay_interrupt();
-            cpu_reset(cpu);
+        else if (cpu->cc->sysemu_ops->handle_cpu_interrupt &&
+                 cpu->cc->sysemu_ops->handle_cpu_interrupt(cpu, interrupt_request)) {
+                return true;
+        } else if (common_cpu_handle_interrupt(cpu, interrupt_request)) {
             return true;
-        }
-#endif /* !TARGET_I386 */
-        /* The target hook has 3 exit conditions:
-           False when the interrupt isn't processed,
-           True when it is, and we should restart on a new TB,
-           and via longjmp via cpu_loop_exit.  */
-        else {
+        } else {
+            /*
+             * The target hook has 3 exit conditions: False when the
+             * interrupt isn't processed, True when it is, and we should
+             * restart on a new TB, and via longjmp via cpu_loop_exit.
+             */
             CPUClass *cc = CPU_GET_CLASS(cpu);
 
             if (cc->tcg_ops->cpu_exec_interrupt &&
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index e545bf7590..5638ed4aa4 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -31,6 +31,7 @@
 #include "hw/qdev-properties.h"
 
 #include "exec/address-spaces.h"
+#include "exec/replay-core.h"
 #include "hw/i386/apic_internal.h"
 
 #include "cpu-internal.h"
@@ -322,6 +323,22 @@ void x86_cpu_handle_halt(CPUState *cpu)
     }
 }
 
+/* Called with BQL held */
+bool x86_cpu_handle_interrupt(CPUState *cpu, int interrupt_request)
+{
+    if (interrupt_request & CPU_INTERRUPT_INIT) {
+        X86CPU *x86_cpu = X86_CPU(cpu);
+        CPUArchState *env = &x86_cpu->env;
+        replay_interrupt();
+        cpu_svm_check_intercept_param(env, SVM_EXIT_INIT, 0, 0);
+        do_cpu_init(x86_cpu);
+        cpu->exception_index = EXCP_HALTED;
+        return true;
+    } else {
+        return false;
+    }
+}
+
 GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 67027d28b0..1b66583987 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7242,6 +7242,7 @@ static const struct SysemuCPUOps i386_sysemu_ops = {
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
     .handle_cpu_halt = x86_cpu_handle_halt,
+    .handle_cpu_interrupt = x86_cpu_handle_interrupt,
     .write_elf32_note = x86_cpu_write_elf32_note,
     .write_elf64_note = x86_cpu_write_elf64_note,
     .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,
-- 
2.39.2


