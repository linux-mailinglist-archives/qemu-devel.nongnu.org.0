Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD7F2442D5E
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 13:01:35 +0100 (CET)
Received: from localhost ([::1]:49612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsTv-0002Vg-1w
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 08:01:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44630)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhD-0001YP-0b
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:15 -0400
Received: from mail-qk1-x72d.google.com ([2607:f8b0:4864:20::72d]:43614)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhB-0001zb-7k
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:14 -0400
Received: by mail-qk1-x72d.google.com with SMTP id bp7so13985427qkb.10
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjnbfjA/SuXJ4jF6cq76qF1xRJpDxH7O+xJW5W8IXoI=;
 b=hP+qHktsRrJXjdqG2J4tf/0l3r+C9myl+rms1F+FRA1xpOrFGHv6ET84vWfi/iJLEZ
 Hd2Nzf5yDxBjJrwA9++LQVuLLEEHY7VmqGsn6d/DSdT5ob/N/FrGMx1LWFJE8xbtbcfB
 /7UkoLXb5UeSqsmzBMEmfs9rWPhNVyQaO5iPqLrA63r6tbQAdLGYPLfpsbz7xSUwlSHF
 lw3b9Ywyb8SBsoLvSYcq2txsXEaC5G474KbtCawYqlcrpWoQ6ofJDpD4IW+28NS8YJkv
 i5N63ya/iUg4BW3H+4SBakXMHOOyY87EC7c/UkzA7dwQQvza1vxwM+JueLX3HXWXiLke
 nNSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjnbfjA/SuXJ4jF6cq76qF1xRJpDxH7O+xJW5W8IXoI=;
 b=WlS+8mfK0BxLc/YDonz/XqHM8I6FLaRe6IyGuXt2IsuLuOlw1epM8GAZzLy7+kKWgU
 QE0OEt7AyJEkgsH0iTzPgN4c2u3iUqF8uxFZqMpi4UO12S6dzL074azex9kvCOERdUXH
 zVZ+jBE3e93BSULV3cWRV1G/ePPJpWXn5egFyvhOOij+1u167j0OT/Yg6MAv7q7z1u4Y
 0qBp+9vNPtD1sfiP82I4RNqxKauZvPy7sWZls6R7kRdHOScn7LphGNclAFRSl5heYDYk
 las4G2fiorlPPZpdpviLWLU7+u2VzGBElq1dt9NsBSVNmi4JTYobXAx471fYGiiXH6yD
 bqbw==
X-Gm-Message-State: AOAM530zq1TM75ugce+Y7Q+W+rmoqdldy9PzYAFEKEhEAuvZa5Te90Ao
 FXBAITCPHUG87mvpFawPOFenQM6XNaPbtQ==
X-Google-Smtp-Source: ABdhPJyOKGUDUZV4+i0EMGWgHH+8gEpdUXP1YQRVZB+mrBQkr77sh1P+U3CbJzC1G3n4v1xJO1HXhg==
X-Received: by 2002:a05:620a:2093:: with SMTP id
 e19mr2767374qka.475.1635851472401; 
 Tue, 02 Nov 2021 04:11:12 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:12 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 52/60] target/s390x: Implement s390x_cpu_record_sigbus
Date: Tue,  2 Nov 2021 07:07:32 -0400
Message-Id: <20211102110740.215699-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::72d;
 envelope-from=richard.henderson@linaro.org; helo=mail-qk1-x72d.google.com
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
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


