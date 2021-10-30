Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 12562440B4A
	for <lists+qemu-devel@lfdr.de>; Sat, 30 Oct 2021 20:36:17 +0200 (CEST)
Received: from localhost ([::1]:56164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgtDE-0001oV-6T
	for lists+qemu-devel@lfdr.de; Sat, 30 Oct 2021 14:36:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58578)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1i-0001R5-RR
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:21 -0400
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d]:44871)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mgs1g-00029A-6x
 for qemu-devel@nongnu.org; Sat, 30 Oct 2021 13:20:18 -0400
Received: by mail-pl1-x62d.google.com with SMTP id t11so8905724plq.11
 for <qemu-devel@nongnu.org>; Sat, 30 Oct 2021 10:20:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=ZvF1MOcVZbocKmC7qpDsXhuxKuOHCT5JbfKFaZToefSxL/a03CFtfaUXNRcVKJXmnI
 VQqp9F23iW/wMKNapCdnJNhmFtvRoFANksM5xSWIe5L36ncWq8/gvdOxESu24x+yFEuU
 iPS4V1LrvkHC6AZnCZZ53M9Gnt57lU51p4QCYWMZujGKgS0PB419vQrhwsQxYAldsm13
 kb/owWrOkYKaBkNvGSDYotv0/g2J83Fs0qlCyibtvYe9w3nbXtKZa6rhY+FEQLOOspL9
 htK/CB560/pPkfHexuR1bjqbG6kCI0AIXw3kaJm5duzCvoYP9yqcrXqh936bRD7xQAub
 Ke4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=lf/kkvMG85580zETlbX15DOX2eGsitrE9bhU8PkO3atvgZUdiAjz8l+TXvhoXbFiVV
 qqvRDLtbrVQJ1hSFhvXoAUxBjJIMAyfD+B0pFiaYFFQdNQ7rKsoQuXqDvA/GPVKYVOe8
 RCyBVJ73ZzCZ6locQMRJsOIzB9/by1WSuuzIUD0i2RQ1UIYfZXQJbMxusN4S9pBy5Oix
 NaIad2MY20zuKo3MSXKSy46P+qM0bKV516202KsxaBDRhWwnQo5KdsUs86DrGo2sg+4K
 RrPbmLsugR8k/R/AQz7NVQw+EoOx7TFkeThymbTvk4mrW7WHuWemx4tD8H+K7oeE8KUL
 Oc4A==
X-Gm-Message-State: AOAM532EiHiM3WaXXMnxw41nEkS2znJgDQhKc2IGNV8kbviR/RPUhUNL
 FbPBpRfH7mLPwdMC95/+nC4aW/n8P5gc8Q==
X-Google-Smtp-Source: ABdhPJwR4mVILa6P3G3TeuAEDwJhJEjc/5v8fYUoYBlfVWcQnInY8GtU1sSTS82ls2eqIYDawlozYA==
X-Received: by 2002:a17:902:728b:b0:13f:c086:bdfe with SMTP id
 d11-20020a170902728b00b0013fc086bdfemr15957427pll.6.1635614414757; 
 Sat, 30 Oct 2021 10:20:14 -0700 (PDT)
Received: from localhost.localdomain (174-21-75-75.tukw.qwest.net.
 [174.21.75.75])
 by smtp.gmail.com with ESMTPSA id k14sm9584798pji.45.2021.10.30.10.20.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Oct 2021 10:20:14 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 41/66] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Sat, 30 Oct 2021 10:16:10 -0700
Message-Id: <20211030171635.1689530-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211030171635.1689530-1-richard.henderson@linaro.org>
References: <20211030171635.1689530-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62d.google.com
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

We have replaced tlb_fill with record_sigsegv for user mode.
Move the declaration to restrict it to system emulation.

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 include/hw/core/tcg-cpu-ops.h | 22 ++++++++++------------
 linux-user/signal.c           |  3 ---
 2 files changed, 10 insertions(+), 15 deletions(-)

diff --git a/include/hw/core/tcg-cpu-ops.h b/include/hw/core/tcg-cpu-ops.h
index 41718b695b..8eadd404c8 100644
--- a/include/hw/core/tcg-cpu-ops.h
+++ b/include/hw/core/tcg-cpu-ops.h
@@ -35,18 +35,6 @@ struct TCGCPUOps {
     void (*cpu_exec_enter)(CPUState *cpu);
     /** @cpu_exec_exit: Callback for cpu_exec cleanup */
     void (*cpu_exec_exit)(CPUState *cpu);
-    /**
-     * @tlb_fill: Handle a softmmu tlb miss or user-only address fault
-     *
-     * For system mode, if the access is valid, call tlb_set_page
-     * and return true; if the access is invalid, and probe is
-     * true, return false; otherwise raise an exception and do
-     * not return.  For user-only mode, always raise an exception
-     * and do not return.
-     */
-    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
-                     MMUAccessType access_type, int mmu_idx,
-                     bool probe, uintptr_t retaddr);
     /** @debug_excp_handler: Callback for handling debug exceptions */
     void (*debug_excp_handler)(CPUState *cpu);
 
@@ -68,6 +56,16 @@ struct TCGCPUOps {
 #ifdef CONFIG_SOFTMMU
     /** @cpu_exec_interrupt: Callback for processing interrupts in cpu_exec */
     bool (*cpu_exec_interrupt)(CPUState *cpu, int interrupt_request);
+    /**
+     * @tlb_fill: Handle a softmmu tlb miss
+     *
+     * If the access is valid, call tlb_set_page and return true;
+     * if the access is invalid and probe is true, return false;
+     * otherwise raise an exception and do not return.
+     */
+    bool (*tlb_fill)(CPUState *cpu, vaddr address, int size,
+                     MMUAccessType access_type, int mmu_idx,
+                     bool probe, uintptr_t retaddr);
     /**
      * @do_transaction_failed: Callback for handling failed memory transactions
      * (ie bus faults or external aborts; not MMU faults)
diff --git a/linux-user/signal.c b/linux-user/signal.c
index 135983747d..9d60abc038 100644
--- a/linux-user/signal.c
+++ b/linux-user/signal.c
@@ -697,9 +697,6 @@ void cpu_loop_exit_sigsegv(CPUState *cpu, target_ulong addr,
 
     if (tcg_ops->record_sigsegv) {
         tcg_ops->record_sigsegv(cpu, addr, access_type, maperr, ra);
-    } else if (tcg_ops->tlb_fill) {
-        tcg_ops->tlb_fill(cpu, addr, 0, access_type, MMU_USER_IDX, false, ra);
-        g_assert_not_reached();
     }
 
     force_sig_fault(TARGET_SIGSEGV,
-- 
2.25.1


