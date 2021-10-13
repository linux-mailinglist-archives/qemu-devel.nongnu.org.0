Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 383FF42B2FA
	for <lists+qemu-devel@lfdr.de>; Wed, 13 Oct 2021 04:57:39 +0200 (CEST)
Received: from localhost ([::1]:50342 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1maUSX-0004kY-VD
	for lists+qemu-devel@lfdr.de; Tue, 12 Oct 2021 22:57:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56738)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHe-0004M2-RE
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:22 -0400
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d]:35757)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1maUHc-0004qG-VU
 for qemu-devel@nongnu.org; Tue, 12 Oct 2021 22:46:22 -0400
Received: by mail-pg1-x52d.google.com with SMTP id e7so901432pgk.2
 for <qemu-devel@nongnu.org>; Tue, 12 Oct 2021 19:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=tQ9zUqcauybUZbu3B5IksrNIUQen6fZFWQH9MsgW1Ec=;
 b=ss3VVbZb2IVBkTVenP1QZlOdi0h4LhETNbfnfynF8zg4LS9ygzAq/nDQxWRrZlaoYB
 R2rrlCzdaHL8DRzWeWSqfimieXsV4eagEDQmkKAadedJ6SiqsWobz5Jts7GMTHTn5bd9
 KlLTzQ7q+5XkMj5LZ00DSBuSLWIDW2lRFVwnHk9XZWYdxKRLEEmOY7PEp9ACLFNOVLNX
 WPwWwarlSQEflHmUvu56WU/wteh+ur0Sm4ZvbtoR4dYxv8fuFSccvtsEmC8IGC/0cJyc
 sw7TLMhPSE/Wn3H940WdF3v+CGANL0Ddz8jj405Z/tvLxXfc/qQNOCTsXdgQt41TWPyE
 1Tyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tQ9zUqcauybUZbu3B5IksrNIUQen6fZFWQH9MsgW1Ec=;
 b=bJ1mUlk/S65BHpcQdDy+0xLAng3OZqUmJ/ofg+AfHMH/Adm/x49lex4kBqLHWz9yak
 JWo96oPRDoh6h/TR9qWZ624UKdMJ68ND2WTnnZtqKnZmoliAh01QMk0Dlp1TlmiZJXGZ
 VDt0UTEt/1FD8A/LyDQ2c5XvIwoqcgDqJNoqUMPcziehtwngrNSFp+LOCexcjxjbN5Po
 9S59NvMRWTjCkxdqY8zppBEf2EMkiuOzVh6FSzBVdp9oUrqg+4i+JHXV+pIbJPmaUfVJ
 7jOWknrWbpytudTzmbdPu4OYoKmab7zVdlRIiPn8zqFF01fGQeYTPxRSGfhIJwmvYVOB
 E6dA==
X-Gm-Message-State: AOAM532syrn2J3YyAyNc4Ne8KBdqDX+SDXcYGKWbYHA8fjHFGQ6zNJQD
 AUYaU6SxMHt7LpycjgI4P5jW7S3ucIo=
X-Google-Smtp-Source: ABdhPJztG0Qx7fQ8YZPBuokypG+LfDv3lImpSCXH70yPSvf2DlE5iAbZZAX97QqxAP47NlRq9bmU+g==
X-Received: by 2002:a63:3481:: with SMTP id
 b123mr17704811pga.230.1634093179541; 
 Tue, 12 Oct 2021 19:46:19 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id qe17sm4855014pjb.39.2021.10.12.19.46.18
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 12 Oct 2021 19:46:19 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 10/48] target/s390x: Implement s390x_cpu_record_sigbus
Date: Tue, 12 Oct 2021 19:45:29 -0700
Message-Id: <20211013024607.731881-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211013024607.731881-1-richard.henderson@linaro.org>
References: <20211013024607.731881-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::52d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x52d.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

For s390x, the only unaligned accesses that are signaled are atomic,
and we don't actually want to raise SIGBUS for those, but instead
raise a SPECIFICATION error, which the kernel will report as SIGILL.

Split out a do_unaligned_access function to share between the user-only
s390x_cpu_record_sigbus and the sysemu s390x_do_unaligned_access.

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


