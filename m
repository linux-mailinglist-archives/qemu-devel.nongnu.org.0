Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C1F5F42E7D9
	for <lists+qemu-devel@lfdr.de>; Fri, 15 Oct 2021 06:25:54 +0200 (CEST)
Received: from localhost ([::1]:41116 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mbEn3-0004QQ-Qm
	for lists+qemu-devel@lfdr.de; Fri, 15 Oct 2021 00:25:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39028)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ2-0007OK-Ph
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:26 -0400
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a]:38456)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mbEZ0-0000Pb-Bk
 for qemu-devel@nongnu.org; Fri, 15 Oct 2021 00:11:23 -0400
Received: by mail-pj1-x102a.google.com with SMTP id
 g13-20020a17090a3c8d00b00196286963b9so8450178pjc.3
 for <qemu-devel@nongnu.org>; Thu, 14 Oct 2021 21:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uF38/TBQjdWDQM8FyXjqkWfqx61a2FgTbzu2sn+FnBE=;
 b=jF3RtzXzt5MZzqir004gfvqFOPQopXnZQNA1a5y917Sy5Vq/K35jRfw9abd1JuYe0g
 3/ais4O6lVkzC+eGfHxRleTx9PBqlS6uhSctPcdkD1J3CftPCP6yBVdSD4vIgSpMxO7l
 CGm4NOOZdRu5qDg/mvmHCvlk80I4F4jaPDZ8hD3mUA6ZGx1FJbKRtARTLKh/aYXYChxZ
 VbKTEY0xszS//0ar/w4CLNM5ex24zd2ziiMaZ4ZCyMQSjKhJXq/g+Wkls6goxWTXQOsJ
 T0O1CqzygQuQZbW9XMayxJbGkv8PDdf4Z8xMXY3bAPSg7h4/Xa2K0dimsRCttvvH2Zp7
 fQKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uF38/TBQjdWDQM8FyXjqkWfqx61a2FgTbzu2sn+FnBE=;
 b=N9OQskrcwkay3qWzoOzcS4bkrv/SB/lFw8XSW1Dsmb2AUoYvTR6SEpM3Ivg+IGgpBd
 Lrjhw7cFrGMzXnFLjMVDeqnxT6WB7WtmNEG5z9WntozJLnYnXZZ2iZ9PVBYR6AKgWmna
 oRHH2kQGr8039Y0oLERD01BiJVAKWdK9FI73gBpfmbFgEyjHkUcMI2VVMa+xsjEo6mum
 tvhICd+pLsfb9fzKWWoiezn8hb7HpX0s7Td71tMwzQNkabZ5eqozy0NVBJZIt+1Fl2L6
 QxU5AQirnTmPf3gH0coeWnhsYBeJG8u/5b4dUKXaEHnUJT/qac/dCGS/blglNIXjlw8o
 PtBw==
X-Gm-Message-State: AOAM531xmEc+SwWgWwi2GNPgkO3ljHElN1HcYcXiTq7fC2swQ6f/yuyB
 a2aApgZ7yok3z7jJq+4cd4QyWLMaAxu2og==
X-Google-Smtp-Source: ABdhPJzYa3GYjMDs9UV21DhsTEtne9J0MV/hAVK9fFdd+qV8H+L4RGu5NMr4SiwqIC3NensgrklJIw==
X-Received: by 2002:a17:902:f54c:b0:13f:1e7:e467 with SMTP id
 h12-20020a170902f54c00b0013f01e7e467mr8958318plf.40.1634271080682; 
 Thu, 14 Oct 2021 21:11:20 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id me12sm5718006pjb.27.2021.10.14.21.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Oct 2021 21:11:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 31/67] target/nios2: Implement nios2_cpu_record_sigsegv
Date: Thu, 14 Oct 2021 21:10:17 -0700
Message-Id: <20211015041053.2769193-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211015041053.2769193-1-richard.henderson@linaro.org>
References: <20211015041053.2769193-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu, imp@bsdimp.com,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the linux-user kuser page handling is currently implemented
by detecting magic addresses in the unnamed 0xaa trap, we cannot
simply remove nios2_cpu_tlb_fill and rely on the fallback code.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/nios2/cpu.h    | 6 ++++++
 target/nios2/cpu.c    | 6 ++++--
 target/nios2/helper.c | 7 ++++---
 3 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/target/nios2/cpu.h b/target/nios2/cpu.h
index a80587338a..1a69ed7a49 100644
--- a/target/nios2/cpu.h
+++ b/target/nios2/cpu.h
@@ -218,9 +218,15 @@ static inline int cpu_mmu_index(CPUNios2State *env, bool ifetch)
                                                   MMU_SUPERVISOR_IDX;
 }
 
+#ifdef CONFIG_USER_ONLY
+void nios2_cpu_record_sigsegv(CPUState *cpu, vaddr addr,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t ra);
+#else
 bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
                         MMUAccessType access_type, int mmu_idx,
                         bool probe, uintptr_t retaddr);
+#endif
 
 static inline int cpu_interrupts_enabled(CPUNios2State *env)
 {
diff --git a/target/nios2/cpu.c b/target/nios2/cpu.c
index 947bb09bc1..421cad114a 100644
--- a/target/nios2/cpu.c
+++ b/target/nios2/cpu.c
@@ -220,9 +220,11 @@ static const struct SysemuCPUOps nios2_sysemu_ops = {
 
 static const struct TCGCPUOps nios2_tcg_ops = {
     .initialize = nios2_tcg_init,
-    .tlb_fill = nios2_cpu_tlb_fill,
 
-#ifndef CONFIG_USER_ONLY
+#ifdef CONFIG_USER_ONLY
+    .record_sigsegv = nios2_cpu_record_sigsegv,
+#else
+    .tlb_fill = nios2_cpu_tlb_fill,
     .cpu_exec_interrupt = nios2_cpu_exec_interrupt,
     .do_interrupt = nios2_cpu_do_interrupt,
     .do_unaligned_access = nios2_cpu_do_unaligned_access,
diff --git a/target/nios2/helper.c b/target/nios2/helper.c
index 53be8398e9..e5c98650e1 100644
--- a/target/nios2/helper.c
+++ b/target/nios2/helper.c
@@ -38,10 +38,11 @@ void nios2_cpu_do_interrupt(CPUState *cs)
     env->regs[R_EA] = env->regs[R_PC] + 4;
 }
 
-bool nios2_cpu_tlb_fill(CPUState *cs, vaddr address, int size,
-                        MMUAccessType access_type, int mmu_idx,
-                        bool probe, uintptr_t retaddr)
+void nios2_cpu_record_sigsegv(CPUState *cs, vaddr addr,
+                              MMUAccessType access_type,
+                              bool maperr, uintptr_t retaddr)
 {
+    /* FIXME: Disentangle kuser page from linux-user sigsegv handling. */
     cs->exception_index = 0xaa;
     cpu_loop_exit_restore(cs, retaddr);
 }
-- 
2.25.1


