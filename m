Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2558E424527
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Oct 2021 19:49:12 +0200 (CEST)
Received: from localhost ([::1]:38846 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mYB2V-0003K6-5U
	for lists+qemu-devel@lfdr.de; Wed, 06 Oct 2021 13:49:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48680)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdl-0007Rk-AB
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:37 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c]:47087)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mYAdj-0008Gs-H6
 for qemu-devel@nongnu.org; Wed, 06 Oct 2021 13:23:37 -0400
Received: by mail-pf1-x42c.google.com with SMTP id u7so2931524pfg.13
 for <qemu-devel@nongnu.org>; Wed, 06 Oct 2021 10:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uF38/TBQjdWDQM8FyXjqkWfqx61a2FgTbzu2sn+FnBE=;
 b=JX5WeZupJtbivecqqVplLlXBZT+Wo/pglvQ90JsJY/qAMeDxTSxtCyUpo/6AaFzs1V
 CTSKGqLwjnWfi8g2JwNuFLlt/56LpVtc/o1nOplaX0oEuzZpct+8kKfBbRhJruCIfJk1
 A3jsXdW8D08AZ4jMC6JjV4oadexY6gXJiiYiCzwc2eh21W3DXU/bhr+pyg1UoFxeK3+N
 vj3W8am7Kilb1Tnksw1RuSWNw5m+/tnmKa5BFVV/XcdP+lO8P/fRH4cmPmrbDY7lTry9
 1m0SUO+cvbr46unUsr9iyqTJP8EzPDOeIqvWAYjBAp9YiR/lfrwd8Y63eyUL3vfgIbOT
 KTlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uF38/TBQjdWDQM8FyXjqkWfqx61a2FgTbzu2sn+FnBE=;
 b=nvKPhJDgUxqLJt2xjZOSSQcEl34nT1GINj83AbLP8UU4XfiRSp8l4/t0+RlA6durRc
 9/B2Ikt6R9KSvixn1X15Kgq+2qr3tS7tnhpAwNP86OrVeGXBEPT4wTuBXtlzLEPr4Wyn
 R2RTNDAl0qreGVv1adqQCNeGehuafRCTLWAa4gIiYXHblTB/D0SopRqddEMWOUdNCjBD
 LATKZDAtK4eWRkTuNFud4hwURZ2myDFuF0rtH4uTpXyQhPzBgkShPjiA3cEbWn8X6FAY
 IhGAJ80v1XxazW1hjqgggkz569Jene2r66TBsnJdyjO4GAIFP1jPfmcNUQqaJCYYX1UC
 pvdA==
X-Gm-Message-State: AOAM531aQCN8eF6M0ADpSv+lVYkOoQ9jUYdCFfgT43c0fB8z9MxSRtpP
 2rzgwm5DqNA7QFwE+4NJrEso4q/7GQ7MJA==
X-Google-Smtp-Source: ABdhPJwwGWVypa/KZD+ORS7hB+Key4v+jymiBKbJNGL7yGzHNpuWXCOwQ2NRnsCRJIR3RNLb/YWlbw==
X-Received: by 2002:a63:ff11:: with SMTP id k17mr21351386pgi.405.1633541014131; 
 Wed, 06 Oct 2021 10:23:34 -0700 (PDT)
Received: from localhost.localdomain ([71.212.134.125])
 by smtp.gmail.com with ESMTPSA id w7sm21606929pfj.189.2021.10.06.10.23.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Oct 2021 10:23:33 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 31/41] target/nios2: Implement nios2_cpu_record_sigsegv
Date: Wed,  6 Oct 2021 10:22:57 -0700
Message-Id: <20211006172307.780893-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211006172307.780893-1-richard.henderson@linaro.org>
References: <20211006172307.780893-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
X-Spam_score_int: -1
X-Spam_score: -0.2
X-Spam_bar: /
X-Spam_report: (-0.2 / 5.0 requ) DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: alex.bennee@linaro.org, laurent@vivier.eu,
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


