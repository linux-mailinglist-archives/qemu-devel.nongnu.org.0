Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E8344201C
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 19:36:24 +0100 (CET)
Received: from localhost ([::1]:33082 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhcAR-000434-Om
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 14:36:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60178)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9I-0008Ee-N1
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:08 -0400
Received: from mail-qt1-x82f.google.com ([2607:f8b0:4864:20::82f]:39762)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhb9D-0001Du-7k
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 13:31:08 -0400
Received: by mail-qt1-x82f.google.com with SMTP id t40so16520362qtc.6
 for <qemu-devel@nongnu.org>; Mon, 01 Nov 2021 10:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RjnbfjA/SuXJ4jF6cq76qF1xRJpDxH7O+xJW5W8IXoI=;
 b=plXXNTYXSncNiHlCX8GbBY6YZCcG94D72J67+5hUA7rcmOTrqy/5YBsj8kuyK4PoCr
 OVBlENimqVc9BQt7O3tgNqf+hwV79U3HWYVFWRR2F4RO883QfATUeYiPwaQc6SXPZ104
 k6QGLbXhcf18OEcu01R4zp0NtKN67p7c5dEZ4oniL22QMVqwuJV3c018MKFFryvgoNu0
 +3tXzbvh5SBJiK8LpwjmyDtamW1KbNC5rb50Q7Rq/b7pjk+e1VtBXXHyO1a6VhtMwyBr
 KMLkGaAkJL1O5iHvdmm3CKAAHzDj95a8wb4Zo/07BjBc3FZLUCGKkotM17f5HyC9np68
 8opA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RjnbfjA/SuXJ4jF6cq76qF1xRJpDxH7O+xJW5W8IXoI=;
 b=Gs1T9o0q0GgFyKtj71+YcDcUEBOQceZO834hTZm6wfE/wIx2qOb6FKJuafp3HVTL3s
 UPw7wTTGyUVUVozyZJpct8TamyxVxZwdOjvtjYHQqXAfocdbLwPHS5ZUXM+mf9wGzRtn
 67hfs61qqnMQua1H/tmwBb2QhWMDIbibnzhhjuCYSt3TDMTz/A6znL5WtpciETeY02p2
 t7vxB+20gRmG1Uzru5EnAr1Vwpqqmm+0w0lRNAoh7c0cciF42m4RGeJoU8HkFuZCj9Ww
 7gEqDQUI0vVEYFgnl91tpostxwYYGRY4CMufMjch3hgV2jcQso/uDFgxpHV6Y1IHaJVi
 fodg==
X-Gm-Message-State: AOAM5300U/1LsdbFrxhMXtazgLSXe1mEA3BHqrTQfABZStdR/IXIWvqt
 +SLeX1mrZ1dIKS2G5V4nxKXhgsinm89K6g==
X-Google-Smtp-Source: ABdhPJwRRI9sjklJE6SJV29tBtbncXppR4qz4eZs9OSDMo4izo43SlGBY79w+nhXapU6zyUArOczgg==
X-Received: by 2002:a05:622a:30a:: with SMTP id
 q10mr9636222qtw.296.1635787861665; 
 Mon, 01 Nov 2021 10:31:01 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id 13sm1222289qkc.40.2021.11.01.10.31.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Nov 2021 10:31:01 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v7 52/60] target/s390x: Implement s390x_cpu_record_sigbus
Date: Mon,  1 Nov 2021 13:27:21 -0400
Message-Id: <20211101172729.23149-53-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211101172729.23149-1-richard.henderson@linaro.org>
References: <20211101172729.23149-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82f;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=ham autolearn_force=no
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


