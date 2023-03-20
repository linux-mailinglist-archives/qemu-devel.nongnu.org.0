Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 56D306C0E69
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Mar 2023 11:12:44 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1peCTd-0003nF-2y; Mon, 20 Mar 2023 06:10:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTT-0003l0-B4
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:44 -0400
Received: from mail-wm1-x334.google.com ([2a00:1450:4864:20::334])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <alex.bennee@linaro.org>)
 id 1peCTP-0000CR-LG
 for qemu-devel@nongnu.org; Mon, 20 Mar 2023 06:10:41 -0400
Received: by mail-wm1-x334.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso7100573wmq.5
 for <qemu-devel@nongnu.org>; Mon, 20 Mar 2023 03:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679307038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NlG2WYAuWf1MF90p6NWRpZT5faSFXPhuXyYZFUB3mGE=;
 b=ffefsSjPL0EcON5++v02JF+/iBRfzqP3dZCOcz3HrMx01UOXpH8sUSi0klS1vEHoj8
 bT0BhNk7DgPs3hEE0ZCUHYWREvBv3f/iA+zKSiRbKiCheL1Xa35hFxueejR82/ghvsbi
 wHjQsxMzSanRYIuLSs+alMoPkykEVGLq/xSJa/sZKFgVJL3XX+jQ2vEda9vRkJ4TO265
 LwhzrF0o1HOamlVUCq8zDuLg6jypNDUlRY/hGD4ZJKfGY0cIjUaDEyeYwooo48NUftFU
 7j81bMUjiIDl2qCER/Kf76nwE3wfDjt/HJkVzxKsJxmGCBeaZ5dBaLZe1mlvdEz/vXjK
 dXgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679307038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NlG2WYAuWf1MF90p6NWRpZT5faSFXPhuXyYZFUB3mGE=;
 b=18Pkew18Yofgn5e0+7V+s7vALd+au1Nd4yrAJC6Yg2H1j5Wo/ZNdxIyPBNHwxzr44l
 5r2DTrxR9xJsHrlm4LBOT1P63RyuNVpZ9Pl5jb9zEE2GniE2y6Df++l/vDJ6XZkyHjZO
 JRzxQXwHjP+aZUCcg1QGeCTdsN/jgDR/nku5jdHTbjqC/XJbL9IdtKFJdn/JwtVTlYSh
 tEAC/C8hShZbDPTvHm7bravOs41hhINVs4kdngUZz5sNzJFKH9trgNhfulLeHRpjZv3f
 ytEB09WPWklozpCEnvc7oyDPlkrPRUg9WfBy5n2XCjtSBQIL91Vlpsp98q0QgjqHDDgE
 c+Pg==
X-Gm-Message-State: AO0yUKUI43k4ciXh/G9u40CLZVgXFLthDYajC9u9fqkzivskYFlMPYBX
 r8tewYvxwqnZQdDRkKUxMjb5VlyuPJrrn3o2Dnw=
X-Google-Smtp-Source: AK7set+MJW4By7vZH7WQkmtw0WKZcgiKPZy6bK7xFrSQyNlr0K/Ossuqsb1LEv02PmTe1RRmuo6EGg==
X-Received: by 2002:a05:600c:22cc:b0:3ed:e6c8:f11d with SMTP id
 12-20020a05600c22cc00b003ede6c8f11dmr3146272wmg.7.1679307038036; 
 Mon, 20 Mar 2023 03:10:38 -0700 (PDT)
Received: from zen.linaroharston ([85.9.250.243])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4251000000b002d1801018e2sm8509503wrr.63.2023.03.20.03.10.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Mar 2023 03:10:36 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
 by zen.linaroharston (Postfix) with ESMTP id 2B2F81FFBB;
 Mon, 20 Mar 2023 10:10:36 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Alessandro Di Federico <ale@rev.ng>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <eduardo@habkost.net>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH 03/10] accel/tcg: move i386 halt handling to sysemu_ops
Date: Mon, 20 Mar 2023 10:10:28 +0000
Message-Id: <20230320101035.2214196-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230320101035.2214196-1-alex.bennee@linaro.org>
References: <20230320101035.2214196-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::334;
 envelope-from=alex.bennee@linaro.org; helo=mail-wm1-x334.google.com
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

We don't want to be polluting the core run loop code with target
specific handling, punt it to sysemu_ops where it belongs.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 include/hw/core/sysemu-cpu-ops.h |  5 +++++
 target/i386/cpu-internal.h       |  1 +
 accel/tcg/cpu-exec.c             | 14 +++-----------
 target/i386/cpu-sysemu.c         | 12 ++++++++++++
 target/i386/cpu.c                |  1 +
 5 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/include/hw/core/sysemu-cpu-ops.h b/include/hw/core/sysemu-cpu-ops.h
index ee169b872c..c9d30172c4 100644
--- a/include/hw/core/sysemu-cpu-ops.h
+++ b/include/hw/core/sysemu-cpu-ops.h
@@ -48,6 +48,11 @@ typedef struct SysemuCPUOps {
      * GUEST_PANICKED events.
      */
     GuestPanicInformation* (*get_crash_info)(CPUState *cpu);
+    /**
+     * @handle_cpu_halt: Callback for special handling during cpu_handle_halt()
+     * @cs: The CPUState
+     */
+    void (*handle_cpu_halt)(CPUState *cpu);
     /**
      * @write_elf32_note: Callback for writing a CPU-specific ELF note to a
      * 32-bit VM coredump.
diff --git a/target/i386/cpu-internal.h b/target/i386/cpu-internal.h
index 9baac5c0b4..75b302fb33 100644
--- a/target/i386/cpu-internal.h
+++ b/target/i386/cpu-internal.h
@@ -65,6 +65,7 @@ void x86_cpu_get_crash_info_qom(Object *obj, Visitor *v,
 void x86_cpu_apic_create(X86CPU *cpu, Error **errp);
 void x86_cpu_apic_realize(X86CPU *cpu, Error **errp);
 void x86_cpu_machine_reset_cb(void *opaque);
+void x86_cpu_handle_halt(CPUState *cs);
 #endif /* !CONFIG_USER_ONLY */
 
 #endif /* I386_CPU_INTERNAL_H */
diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c815f2dbfd..5e5906e199 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -22,6 +22,7 @@
 #include "qapi/error.h"
 #include "qapi/type-helpers.h"
 #include "hw/core/tcg-cpu-ops.h"
+#include "hw/core/sysemu-cpu-ops.h"
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
@@ -30,9 +31,6 @@
 #include "qemu/rcu.h"
 #include "exec/log.h"
 #include "qemu/main-loop.h"
-#if defined(TARGET_I386) && !defined(CONFIG_USER_ONLY)
-#include "hw/i386/apic.h"
-#endif
 #include "sysemu/cpus.h"
 #include "exec/cpu-all.h"
 #include "sysemu/cpu-timers.h"
@@ -650,15 +648,9 @@ static inline bool cpu_handle_halt(CPUState *cpu)
 {
 #ifndef CONFIG_USER_ONLY
     if (cpu->halted) {
-#if defined(TARGET_I386)
-        if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
-            X86CPU *x86_cpu = X86_CPU(cpu);
-            qemu_mutex_lock_iothread();
-            apic_poll_irq(x86_cpu->apic_state);
-            cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
-            qemu_mutex_unlock_iothread();
+        if (cpu->cc->sysemu_ops->handle_cpu_halt) {
+            cpu->cc->sysemu_ops->handle_cpu_halt(cpu);
         }
-#endif /* TARGET_I386 */
         if (!cpu_has_work(cpu)) {
             return true;
         }
diff --git a/target/i386/cpu-sysemu.c b/target/i386/cpu-sysemu.c
index 28115edf44..e545bf7590 100644
--- a/target/i386/cpu-sysemu.c
+++ b/target/i386/cpu-sysemu.c
@@ -18,6 +18,7 @@
  */
 
 #include "qemu/osdep.h"
+#include "qemu/main-loop.h"
 #include "cpu.h"
 #include "sysemu/xen.h"
 #include "sysemu/whpx.h"
@@ -310,6 +311,17 @@ void x86_cpu_apic_realize(X86CPU *cpu, Error **errp)
      }
 }
 
+void x86_cpu_handle_halt(CPUState *cpu)
+{
+    if (cpu->interrupt_request & CPU_INTERRUPT_POLL) {
+        X86CPU *x86_cpu = X86_CPU(cpu);
+        qemu_mutex_lock_iothread();
+        apic_poll_irq(x86_cpu->apic_state);
+        cpu_reset_interrupt(cpu, CPU_INTERRUPT_POLL);
+        qemu_mutex_unlock_iothread();
+    }
+}
+
 GuestPanicInformation *x86_cpu_get_crash_info(CPUState *cs)
 {
     X86CPU *cpu = X86_CPU(cs);
diff --git a/target/i386/cpu.c b/target/i386/cpu.c
index 6576287e5b..67027d28b0 100644
--- a/target/i386/cpu.c
+++ b/target/i386/cpu.c
@@ -7241,6 +7241,7 @@ static const struct SysemuCPUOps i386_sysemu_ops = {
     .get_phys_page_attrs_debug = x86_cpu_get_phys_page_attrs_debug,
     .asidx_from_attrs = x86_asidx_from_attrs,
     .get_crash_info = x86_cpu_get_crash_info,
+    .handle_cpu_halt = x86_cpu_handle_halt,
     .write_elf32_note = x86_cpu_write_elf32_note,
     .write_elf64_note = x86_cpu_write_elf64_note,
     .write_elf32_qemunote = x86_cpu_write_elf32_qemunote,
-- 
2.39.2


