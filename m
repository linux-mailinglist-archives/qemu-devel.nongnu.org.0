Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 01738442D46
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 12:55:16 +0100 (CET)
Received: from localhost ([::1]:51594 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhsNn-00018I-4O
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 07:55:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44538)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrhA-0001Ms-5X
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:12 -0400
Received: from mail-qt1-x829.google.com ([2607:f8b0:4864:20::829]:45797)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mhrh5-0001uI-SY
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 07:11:11 -0400
Received: by mail-qt1-x829.google.com with SMTP id r2so17174874qtw.12
 for <qemu-devel@nongnu.org>; Tue, 02 Nov 2021 04:11:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=FxzYCT3fu1jbNUPtE8I1elT6f+dE0iCYIb6Clzj8VIVRaXZTZUmlRg5HL8IN8m276n
 pU6iSM1MH06P15z/oo2u1wcBgZctGMPg04ysg6NLAM51npmIm2mt4AI/Sj3mJZfyw3/f
 +dZsHLgXDShBvP/rrQAjIHcTFeL2tCFFPGSGbWaDusMhrEtmaj1DltyQK0pU/ePYbKR9
 LEMzyRI5+k00SgLOax1xPeVypfUFgSvdSfd5mQxCouSTTZCo8sOrstNKybwy3J7so7zx
 QXmB7WDBwzouYvGBHjICJKD3oYIx07puBJggklZyuiJx1unhIIvQ/BjcJNn0tXIl2AbK
 xTxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AlAKO3pHLk0w42dzpdqlCWgmBC5kkngUdLfuQLXO9ho=;
 b=Jqb/dlCtUzbH5sfKMdA4eikgXyUqNys5KPBbm+ivtYIEhTmgn4B2PxS+0dI3hvYkSf
 KRkuEjh2tUlaSrVG/3H/njQkmdSsnuSMbL/aTVqBfPbiz8gF8raxQghPyegH4BIhjlqC
 91JDmbWHcHxh+/gyt3GG7+rRcmZdPFt5OQNpWx7eOyXTitpXojgXHSni6C6Lr58Jk80J
 HIEJCNBLzgzJu2qW5oBt5Kd+NtxxhFOwDAx2lPSRoHNXTGSRRLsDWzxS84jcrsY5jrAy
 oxFJ/l4eyV3EAj/+zr9+q0PgsK2Dq0YlvwONNczN/NDwORZhssz2murT93hN0qWXXTEz
 KuvQ==
X-Gm-Message-State: AOAM533JTi4/H5OWlq0Kbl9+2KPWBamoCIV1Oa1uQw1fuN0pt+5c4Sea
 yjPqC75i4RSIuCwRwYGiHVQUqJHO7ZIRCQ==
X-Google-Smtp-Source: ABdhPJzTGEESlICCikOdBKLo5Z8bF0yRDj89MXD7dI7cOHzgYPkCFOqYrCcZ0z5BxRbdspBhgFZMUg==
X-Received: by 2002:ac8:5d49:: with SMTP id g9mr16196522qtx.380.1635851466265; 
 Tue, 02 Nov 2021 04:11:06 -0700 (PDT)
Received: from localhost.localdomain (rrcs-172-254-253-57.nyc.biz.rr.com.
 [172.254.253.57])
 by smtp.gmail.com with ESMTPSA id bm25sm12730854qkb.4.2021.11.02.04.11.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 04:11:05 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 41/60] accel/tcg: Restrict TCGCPUOps::tlb_fill() to sysemu
Date: Tue,  2 Nov 2021 07:07:21 -0400
Message-Id: <20211102110740.215699-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102110740.215699-1-richard.henderson@linaro.org>
References: <20211102110740.215699-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::829;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x829.google.com
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


