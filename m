Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 4574A2EE6F1
	for <lists+qemu-devel@lfdr.de>; Thu,  7 Jan 2021 21:32:19 +0100 (CET)
Received: from localhost ([::1]:37258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kxbxC-0003sZ-AO
	for lists+qemu-devel@lfdr.de; Thu, 07 Jan 2021 15:32:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48352)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh5-0001My-Ni
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:39 -0500
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432]:35542)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kxbh2-0001eM-4e
 for qemu-devel@nongnu.org; Thu, 07 Jan 2021 15:15:39 -0500
Received: by mail-pf1-x432.google.com with SMTP id c79so4568731pfc.2
 for <qemu-devel@nongnu.org>; Thu, 07 Jan 2021 12:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mXWHgXR1rPfUzE1DKblo9sXuzDnTJrCai9FRrekni9s=;
 b=EErs6906kvld8FM8W274jv0PmgycNKG2n94Mqx0krDWl3v8y+s2ZEfDcRoY9ezom3u
 Vk9sWAsLYJJFpRraWe5T6NKaqhYm171VhSWTWxyNBllJxeVyeKgWwnSziLiX3tSnMN7L
 /LNDWQ2DNTXaI6n1b9aXAI++ZjhuVxUHxujhTer3N+wimu5QvVTVLKQ+T558yAnMA9R0
 EHItjM/1YDmHC7f7XNgb/6zLaljXhOr66N6zjEH64/OwsyW+Zx/nuoPgvoCkpnYlNJMQ
 o4E1vLQON4RanQ0G6bTs9A3v+Ku9d6CKWWC39fAVe04D59BnhIdJjENQY0nIoeQUEfyR
 GjJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mXWHgXR1rPfUzE1DKblo9sXuzDnTJrCai9FRrekni9s=;
 b=ImeSKLXji7iZHw9ooml1P10vHfCNiVqXajSFFZA+GHRtyKdYYU7nCSzdfgIeAkPKlt
 DKDAtlUFNsie5p/y4F/CDpS9deJA9MwcystRFRjCKAGZP/crmgVdm8W9nQH//WvGvUsa
 Z1n8yfLD2miz4VhQLD95wLcd5yV1xEfDbX2hqASerpZNrNj00SQnyPTtUwwF/10b5Gq/
 8RTaVtlHp81faKmgYM6L7zZhz9D1n8s8wxbvLRG/VRoWDmTaevhoDnyv7Y4v835/tYpI
 u+WpsZNlXi/5OBU77vVTeV5D5LOd5zWPb/AIvfHsNiYmedSMPN+K4D8xqY3oKs13SAhU
 nNLg==
X-Gm-Message-State: AOAM530/DEy8iYjel/6FfPaQOM9MXlqp11MDABG8iVVDhlv5uLF5dyeI
 MfFImEdHAzZyXlP7ZXcNLDj+nCg9xmOK/Q==
X-Google-Smtp-Source: ABdhPJx09j8DsP27X/tJBBgKgKuXZxLF/w4wyZP9WsY3aHyfz3QMxAFqzRsrnj+M8vYwsqbf48EWUw==
X-Received: by 2002:a62:8fca:0:b029:1a9:39bc:ed37 with SMTP id
 n193-20020a628fca0000b02901a939bced37mr310446pfd.61.1610050534445; 
 Thu, 07 Jan 2021 12:15:34 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id v6sm6516265pfi.31.2021.01.07.12.15.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Jan 2021 12:15:33 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PULL 24/47] tcg: Return the TB pointer from the rx region from
 exit_tb
Date: Thu,  7 Jan 2021 10:14:25 -1000
Message-Id: <20210107201448.1152301-25-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210107201448.1152301-1-richard.henderson@linaro.org>
References: <20210107201448.1152301-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::432;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x432.google.com
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
Cc: peter.maydell@linaro.org, Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This produces a small pc-relative displacement within the
generated code to the TB structure that preceeds it.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 35 +++++++++++++++++++++--------------
 tcg/tcg-op.c         | 13 ++++++++++++-
 2 files changed, 33 insertions(+), 15 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 29294f2804..e0df9b6a1d 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -154,13 +154,12 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
  * TCG is not considered a security-sensitive part of QEMU so this does not
  * affect the impact of CFI in environment with high security requirements
  */
-QEMU_DISABLE_CFI
-static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
+static inline TranslationBlock * QEMU_DISABLE_CFI
+cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
 {
     CPUArchState *env = cpu->env_ptr;
     uintptr_t ret;
     TranslationBlock *last_tb;
-    int tb_exit;
     const void *tb_ptr = itb->tc.ptr;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
@@ -188,11 +187,20 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 
     ret = tcg_qemu_tb_exec(env, tb_ptr);
     cpu->can_do_io = 1;
-    last_tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
-    tb_exit = ret & TB_EXIT_MASK;
-    trace_exec_tb_exit(last_tb, tb_exit);
+    /*
+     * TODO: Delay swapping back to the read-write region of the TB
+     * until we actually need to modify the TB.  The read-only copy,
+     * coming from the rx region, shares the same host TLB entry as
+     * the code that executed the exit_tb opcode that arrived here.
+     * If we insist on touching both the RX and the RW pages, we
+     * double the host TLB pressure.
+     */
+    last_tb = tcg_splitwx_to_rw((void *)(ret & ~TB_EXIT_MASK));
+    *tb_exit = ret & TB_EXIT_MASK;
 
-    if (tb_exit > TB_EXIT_IDX1) {
+    trace_exec_tb_exit(last_tb, *tb_exit);
+
+    if (*tb_exit > TB_EXIT_IDX1) {
         /* We didn't start executing this TB (eg because the instruction
          * counter hit zero); we must restore the guest PC to the address
          * of the start of the TB.
@@ -210,7 +218,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
             cc->set_pc(cpu, last_tb->pc);
         }
     }
-    return ret;
+    return last_tb;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -221,6 +229,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
 {
     TranslationBlock *tb;
     uint32_t cflags = curr_cflags() | CF_NOCACHE;
+    int tb_exit;
 
     if (ignore_icount) {
         cflags &= ~CF_USE_ICOUNT;
@@ -238,7 +247,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
 
     /* execute the generated code */
     trace_exec_tb_nocache(tb, tb->pc);
-    cpu_tb_exec(cpu, tb);
+    cpu_tb_exec(cpu, tb, &tb_exit);
 
     mmap_lock();
     tb_phys_invalidate(tb, -1);
@@ -272,6 +281,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     uint32_t flags;
     uint32_t cflags = 1;
     uint32_t cf_mask = cflags & CF_HASH_MASK;
+    int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
         start_exclusive();
@@ -288,7 +298,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_exec_enter(cpu);
         /* execute the generated code */
         trace_exec_tb(tb, pc);
-        cpu_tb_exec(cpu, tb);
+        cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
         /*
@@ -684,13 +694,10 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
 static inline void cpu_loop_exec_tb(CPUState *cpu, TranslationBlock *tb,
                                     TranslationBlock **last_tb, int *tb_exit)
 {
-    uintptr_t ret;
     int32_t insns_left;
 
     trace_exec_tb(tb, tb->pc);
-    ret = cpu_tb_exec(cpu, tb);
-    tb = (TranslationBlock *)(ret & ~TB_EXIT_MASK);
-    *tb_exit = ret & TB_EXIT_MASK;
+    tb = cpu_tb_exec(cpu, tb, tb_exit);
     if (*tb_exit != TB_EXIT_REQUESTED) {
         *last_tb = tb;
         return;
diff --git a/tcg/tcg-op.c b/tcg/tcg-op.c
index 19fa8e4691..0374b5d56d 100644
--- a/tcg/tcg-op.c
+++ b/tcg/tcg-op.c
@@ -2666,7 +2666,18 @@ void tcg_gen_extr32_i64(TCGv_i64 lo, TCGv_i64 hi, TCGv_i64 arg)
 
 void tcg_gen_exit_tb(const TranslationBlock *tb, unsigned idx)
 {
-    uintptr_t val = (uintptr_t)tb + idx;
+    /*
+     * Let the jit code return the read-only version of the
+     * TranslationBlock, so that we minimize the pc-relative
+     * distance of the address of the exit_tb code to TB.
+     * This will improve utilization of pc-relative address loads.
+     *
+     * TODO: Move this to translator_loop, so that all const
+     * TranslationBlock pointers refer to read-only memory.
+     * This requires coordination with targets that do not use
+     * the translator_loop.
+     */
+    uintptr_t val = (uintptr_t)tcg_splitwx_to_rx((void *)tb) + idx;
 
     if (tb == NULL) {
         tcg_debug_assert(idx == 0);
-- 
2.25.1


