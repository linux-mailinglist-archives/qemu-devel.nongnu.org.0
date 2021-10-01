Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B3BFB41F40B
	for <lists+qemu-devel@lfdr.de>; Fri,  1 Oct 2021 19:57:04 +0200 (CEST)
Received: from localhost ([::1]:44192 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mWMmN-0003Cy-PT
	for lists+qemu-devel@lfdr.de; Fri, 01 Oct 2021 13:57:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55130)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5F-0005D9-GQ
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:29 -0400
Received: from mail-qt1-x82c.google.com ([2607:f8b0:4864:20::82c]:41506)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mWM5A-0005IN-CR
 for qemu-devel@nongnu.org; Fri, 01 Oct 2021 13:12:29 -0400
Received: by mail-qt1-x82c.google.com with SMTP id t2so9610480qtx.8
 for <qemu-devel@nongnu.org>; Fri, 01 Oct 2021 10:12:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=g+FO3WUb/++tC//nR4BBTKuJptT+iDAQAdjiSDu9yJ4=;
 b=tNv6UJvR/q/twh/HuK2f6V2vcbWw+nyQYBqovb6Yqx6QD29mQ6Fq8vmNLkqCgeZwgn
 LcXvhKs/sZ8pSxXQQmwWT3JwMePRiyxaSqXpG6KgH0ThkkzslKzyHFrlAIGUIkNWl5sf
 8CFqtZe6/H5UM2uVI5uDiv8NX+bg0fEgbnffXDumWWhATNw0JqnUmE4CDK0EWPM7elhq
 AmGextJ1FokF9NwvB8YZin9e2Tf1sYwqyMCEzaDrYAtyvDlWtY3Sb3IdoURtXJ+EyG8P
 TP/q0ySrl0y7ZvXMMQwBqHAgq0Rpe2QL2SBrz5L+nhIuM9vK8eBSqSopqmJH2BTNDIok
 smEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=g+FO3WUb/++tC//nR4BBTKuJptT+iDAQAdjiSDu9yJ4=;
 b=B00K3Z57iMJirecRBpaF7yyQ16QY6V/CWePWfosSRg1mD/Up/vlrATpfW88JaUhJo8
 ZEcG3OAoqEuSRLpgYdGg4RF+OBNtmlSdeyytHQ1vp8jbmDb9oDKoIqdloFlsUtG12O0H
 PUXP5QkYayGxhXNRCsl1xa3vDtsoCQ3SJYV5gFwJZ0V8w+T+QyZFeRpVebp0MSqF5kDU
 Ue8ZT0lVZY13pUdf3gz55TdgZ37k1WpjcwVwuujg8Mi7IGeJOFfZkxN7j0Cf2QIidbDA
 9pirRL68CdUCpTIymiC5QuxndRn6rGONbFzR5rSo4IG1V84AIwGoscPLAWouc7XNvTJz
 JhKg==
X-Gm-Message-State: AOAM53153cZirZjtWZwL98ktuLNOEuCVkRkVhUByj4vRLwy+CHXJQyjn
 secMaXtaFkBBrWMyurp8lOGRcH9QjOw2vw==
X-Google-Smtp-Source: ABdhPJxcWh/H9Oz3iyT3FO63JSePwL7VsG8EaF6QeS2hJM0XA2gaQ/knRhIRZ4Yt/xqMLq75rzUU4g==
X-Received: by 2002:ac8:429a:: with SMTP id o26mr14382995qtl.317.1633108340454; 
 Fri, 01 Oct 2021 10:12:20 -0700 (PDT)
Received: from localhost.localdomain (c-67-174-166-185.hsd1.ga.comcast.net.
 [67.174.166.185])
 by smtp.gmail.com with ESMTPSA id y15sm3557250qko.78.2021.10.01.10.12.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:12:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 31/41] target/nios2: Implement nios2_cpu_record_sigsegv
Date: Fri,  1 Oct 2021 13:11:41 -0400
Message-Id: <20211001171151.1739472-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001171151.1739472-1-richard.henderson@linaro.org>
References: <20211001171151.1739472-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82c;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82c.google.com
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Because the linux-user kuser page handling is currently implemented
by detecting magic addresses in the unnamed 0xaa trap, we cannot
simply remove nios2_cpu_tlb_fill and rely on the fallback code.

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


