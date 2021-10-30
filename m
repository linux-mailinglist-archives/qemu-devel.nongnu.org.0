Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD2F440AE3
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:06:30 +0200 (CEST)
Received: from localhost ([::1]:33156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgskP-0008Gp-88
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:06:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58762)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1u-0001Vs-Iv
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:30 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533]:37753)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1q-0002Cg-Gy
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:29 -0400
Received: by mail-pg1-x533.google.com with SMTP id s136so12999171pgs.4
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjnbfjA/SuXJ4jF6cq76qF1xRJpDxH7O+xJW5W8IXoI=;
 b=kDp7EotzZACyF3SS+FYFA1VutgNiis3RGFwomzqFtaYPOrybNEE9ztKj08ZL01GaCQ
 fL0f1vreOznnNz9pbKRu6Hqdh9qVqaaIbjNi8+A9of3+GhRQopO0v2rmDAfL7bt2A/hr
 0FgD4JmbLqBaK2ohLNAksus14gt5jnyMxEpYuReEeesCQhCQ/kp8g4mKxsUhQs1YqlQD
 JW1ucClD7XPFvx1hxr3LMZ7bETqbItSayDSVyWMgH4kXpCb/nPA0uihApPnFgiRIzYqw
 G4pXu24RRnDbPhJ09kt7DOMoDvf4iC2QcKPx5ikc5YOAR6JEVzYKv1a+7XoiVOoViGrk
 P78Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjnbfjA/SuXJ4jF6cq76qF1xRJpDxH7O+xJW5W8IXoI=;
 b=vo62B0YbJcU5EM5TYgiqTbsYifIc8z2mNI7L3ovUztd3LMlftO045UkIGpY4x5dqCm
 TLwDbnAzXfkBrJhJAIYaUhuVhoCu/GjGf6IyEmfX/6zKQh+otb/vVPI1pjc96wvC9Klk
 2LUxNz3C41zZo9gRNDZU8wA7Xy2bmTXNfAYLguaQ+7aTrBrUoIIePpvGstrxRPhC97DC
 KQ7DAR1mdm8k0VY4DlcpRHxuCTIK1YXk6mBVuStIwZVprNv0SWOx8L8zirLmIr191uPh
 7tHJGGnVsREu1UUFdv3KUdn+ZIwXmS8PBKkEqalzObOtsLcn6DXu9BYEs/Rrn8RR1SIh
 6b2g==
X-Gm-Message-State: AOAM531hbOBxB4d6ul81ygHbXgg0DD7y+T7gw9TEyUThWjDyZ2dgWoBm
 QS+fKp0K4CLxvdEu5zWCoS8uqHTzXEcRjQ==
X-Google-Smtp-Source: ABdhPJx/6mqiUr12ygcIyfQxZ78u1wTwz9rB3pP8RI5iP0wmLKZRG9J8evf3PUO+Qn3Sm7viLE72Sg==
X-Received: by 2002:a05:6a00:230e:b0:44c:4f2d:9b00 with SMTP id
 h14-20020a056a00230e00b0044c4f2d9b00mr18461349pfh.24.1635614424408; 
 Sat, 30 Oct 2021 10:20:24 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:24 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 52/66] target/s390x: Implement s390x_cpu_record_sigbus
Date: Sat, 30 Oct 2021 10:16:21 -0700
Message-Id: <20211030171635.1689530-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x533.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com, f4bug@amsat.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For s390x, the only unaligned accesses that are signaled are atomic,
and we don't actually want to raise SIGBUS for those, but instead
raise a SPECIFICATION error, which the kernel will report as SIGILL.

Split out a do_unaligned_access function to share between the user-only
s390x_cpu_record_sigbus and the sysemu s390x_do_unaligned_access.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/s390x/s390x-internal.h  |  8 +++++---
 target/s390x/cpu.c             |  1 +
 target/s390x/tcg/excp_helper.c | 27 ++++++++++++++++++++-------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/target/s390x/s390x-internal.h b/target/s390x/s390x-internal.h
index 163aa4f94a..1a178aed41 100644
--- a/target/s390x/s390x-internal.h
+++ b/target/s390x/s390x-internal.h
@@ -270,18 +270,20 @@ ObjectClass *s390_cpu_class_by_name(const char *name);
 void s390x_cpu_debug_excp_handler(CPUState *cs);
 void s390_cpu_do_interrupt(CPUState *cpu);
 bool s390_cpu_exec_interrupt(CPUState *cpu, int int_req);
-void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
-                                   MMUAccessType access_type, int mmu_idx,
-                                   uintptr_t retaddr) QEMU_NORETURN;
 
 #ifdef CONFIG_USER_ONLY
 void s390_cpu_record_sigsegv(CPUState *cs, vaddr address,
                              MMUAccessType access_type,
                              bool maperr, uintptr_t retaddr);
+void s390_cpu_record_sigbus(CPUState *cs, vaddr address,
+                            MMUAccessType access_type, uintptr_t retaddr);
 #else
 bool s390_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                        MMUAccessType access_type, int mmu_idx,
                        bool probe, uintptr_t retaddr);
+void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
+                                   MMUAccessType access_type, int mmu_idx,
+                                   uintptr_t retaddr) QEMU_NORETURN;
 #endif
 
 
diff --git a/target/s390x/cpu.c b/target/s390x/cpu.c
index 593dda75c4..ccdbaf84d5 100644
--- a/target/s390x/cpu.c
+++ b/target/s390x/cpu.c
@@ -269,6 +269,7 @@ static const struct TCGCPUOps s390_tcg_ops = {
 
 #ifdef CONFIG_USER_ONLY
     .record_sigsegv = s390_cpu_record_sigsegv,
+    .record_sigbus = s390_cpu_record_sigbus,
 #else
     .tlb_fill = s390_cpu_tlb_fill,
     .cpu_exec_interrupt = s390_cpu_exec_interrupt,
diff --git a/target/s390x/tcg/excp_helper.c b/target/s390x/tcg/excp_helper.c
index b923d080fc..4e7648f301 100644
--- a/target/s390x/tcg/excp_helper.c
+++ b/target/s390x/tcg/excp_helper.c
@@ -82,6 +82,19 @@ void HELPER(data_exception)(CPUS390XState *env, uint32_t dxc)
     tcg_s390_data_exception(env, dxc, GETPC());
 }
 
+/*
+ * Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
+ * this is only for the atomic operations, for which we want to raise a
+ * specification exception.
+ */
+static void QEMU_NORETURN do_unaligned_access(CPUState *cs, uintptr_t retaddr)
+{
+    S390CPU *cpu = S390_CPU(cs);
+    CPUS390XState *env = &cpu->env;
+
+    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
+}
+
 #if defined(CONFIG_USER_ONLY)
 
 void s390_cpu_do_interrupt(CPUState *cs)
@@ -106,6 +119,12 @@ void s390_cpu_record_sigsegv(CPUState *cs, vaddr address,
     cpu_loop_exit_restore(cs, retaddr);
 }
 
+void s390_cpu_record_sigbus(CPUState *cs, vaddr address,
+                            MMUAccessType access_type, uintptr_t retaddr)
+{
+    do_unaligned_access(cs, retaddr);
+}
+
 #else /* !CONFIG_USER_ONLY */
 
 static inline uint64_t cpu_mmu_idx_to_asc(int mmu_idx)
@@ -593,17 +612,11 @@ void s390x_cpu_debug_excp_handler(CPUState *cs)
     }
 }
 
-/* Unaligned accesses are only diagnosed with MO_ALIGN.  At the moment,
-   this is only for the atomic operations, for which we want to raise a
-   specification exception.  */
 void s390x_cpu_do_unaligned_access(CPUState *cs, vaddr addr,
                                    MMUAccessType access_type,
                                    int mmu_idx, uintptr_t retaddr)
 {
-    S390CPU *cpu = S390_CPU(cs);
-    CPUS390XState *env = &cpu->env;
-
-    tcg_s390_program_interrupt(env, PGM_SPECIFICATION, retaddr);
+    do_unaligned_access(cs, retaddr);
 }
 
 static void QEMU_NORETURN monitor_event(CPUS390XState *env,
-- 
2.25.1


