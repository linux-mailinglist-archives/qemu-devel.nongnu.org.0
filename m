Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D1272D99B6
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Dec 2020 15:22:10 +0100 (CET)
Received: from localhost ([::1]:39442 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1koojp-00077h-Nw
	for lists+qemu-devel@lfdr.de; Mon, 14 Dec 2020 09:22:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36406)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooSB-0001rz-DU
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:55 -0500
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b]:37238)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kooS8-0003xm-KX
 for qemu-devel@nongnu.org; Mon, 14 Dec 2020 09:03:55 -0500
Received: by mail-ot1-x32b.google.com with SMTP id o11so15760047ote.4
 for <qemu-devel@nongnu.org>; Mon, 14 Dec 2020 06:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=PE5zDJYupwBF6LFLJEA3Vgnp30HPDgVW1boJkF7byFo=;
 b=Wa68fek1X12CUOK+gMbuQ/TFhZrtUUcTu8d13SdLArDPFpOF1WN/DYYHl5gh7GnM+3
 Ju03VB+HMsG3HFp4ewb2i3EghKpKBc38fIMRlmAXROHvCLjREmErTKNZsFLhWEtG9Yxd
 38+N1chOFLuQrmwnDdnfUzvY36+tzY+4NcXUpJf1fbRpcOq6VdY6J3tPOjU4wN6w301Y
 caLyzOm58Yz+J2SZbJCy4kmnoKOwllel0uhrutrT9k36Brmd4R9uxk8KZ8ym82POd7vW
 liySuTRPLhKyzNXlC3yavgAsfFNdDhG/NX2t/I4pT/zzaiJ197lmWDOBFxtaLBQNGwDz
 kNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PE5zDJYupwBF6LFLJEA3Vgnp30HPDgVW1boJkF7byFo=;
 b=gXjJsiHKOuLx/MzegPxFlw8ESvsT+02WDV9sH7ZF25NSOk3m76b/lafCd123wLUPM9
 ahgjVvH2jGLjIDQdvJD3FTQSMUf9aFy4BQB58I6Ni64bGLAn4RfRjGTfsWAaVFwC64F+
 coH5ZoR8E8XhZCoguctQCYIRw2YrO9viW4Z7Vkm8n6Lq0LNvXBt4aBWLrRmyokhAyaSI
 GYClnBt8Zm893wWMgi8HhBGVXS0uPb9f5gYRqRI6g2sZyIbQJBv0BbbUP96GOuX78zPm
 bGkCtcppHcip7+tciFI1Tm06YmxarDCdqh6CrOSKHsoOjUhX+3HNrHDPQrPrIcXZbDEC
 CPhQ==
X-Gm-Message-State: AOAM5317K02LMsTtiobDijD3zWmUX5VH7Zmei787Co5lZtCnceIOo6w8
 Voe3E27G2evjfrI1Kia5rRB16K8bAT4captk
X-Google-Smtp-Source: ABdhPJzDyfJTTk46nOXZllp+EIetReafEfZXcot+0UQP9yaB71ffODP7o4Yaj/M8p1f1i06SVNci4w==
X-Received: by 2002:a05:6830:114e:: with SMTP id
 x14mr19411679otq.253.1607954630753; 
 Mon, 14 Dec 2020 06:03:50 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id t24sm3940146oou.4.2020.12.14.06.03.49
 for <qemu-devel@nongnu.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 06:03:50 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 20/43] tcg: Return the TB pointer from the rx region from
 exit_tb
Date: Mon, 14 Dec 2020 08:02:51 -0600
Message-Id: <20201214140314.18544-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201214140314.18544-1-richard.henderson@linaro.org>
References: <20201214140314.18544-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::32b;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x32b.google.com
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

This produces a small pc-relative displacement within the
generated code to the TB structure that preceeds it.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 35 ++++++++++++++++++++++-------------
 tcg/tcg-op.c         | 13 ++++++++++++-
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 272d596e0c..8df0a1782e 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -144,12 +144,13 @@ static void init_delay_params(SyncClocks *sc, const CPUState *cpu)
 #endif /* CONFIG USER ONLY */
 
 /* Execute a TB, and fix up the CPU state afterwards if necessary */
-static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
+static inline TranslationBlock *cpu_tb_exec(CPUState *cpu,
+                                            TranslationBlock *itb,
+                                            int *tb_exit)
 {
     CPUArchState *env = cpu->env_ptr;
     uintptr_t ret;
     TranslationBlock *last_tb;
-    int tb_exit;
     const void *tb_ptr = itb->tc.ptr;
 
     qemu_log_mask_and_addr(CPU_LOG_EXEC, itb->pc,
@@ -177,11 +178,20 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
 
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
@@ -199,7 +209,7 @@ static inline tcg_target_ulong cpu_tb_exec(CPUState *cpu, TranslationBlock *itb)
             cc->set_pc(cpu, last_tb->pc);
         }
     }
-    return ret;
+    return last_tb;
 }
 
 #ifndef CONFIG_USER_ONLY
@@ -210,6 +220,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
 {
     TranslationBlock *tb;
     uint32_t cflags = curr_cflags() | CF_NOCACHE;
+    int tb_exit;
 
     if (ignore_icount) {
         cflags &= ~CF_USE_ICOUNT;
@@ -227,7 +238,7 @@ static void cpu_exec_nocache(CPUState *cpu, int max_cycles,
 
     /* execute the generated code */
     trace_exec_tb_nocache(tb, tb->pc);
-    cpu_tb_exec(cpu, tb);
+    cpu_tb_exec(cpu, tb, &tb_exit);
 
     mmap_lock();
     tb_phys_invalidate(tb, -1);
@@ -244,6 +255,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     uint32_t flags;
     uint32_t cflags = 1;
     uint32_t cf_mask = cflags & CF_HASH_MASK;
+    int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
         start_exclusive();
@@ -260,7 +272,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cc->cpu_exec_enter(cpu);
         /* execute the generated code */
         trace_exec_tb(tb, pc);
-        cpu_tb_exec(cpu, tb);
+        cpu_tb_exec(cpu, tb, &tb_exit);
         cc->cpu_exec_exit(cpu);
     } else {
         /*
@@ -653,13 +665,10 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
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
index e3dc0cb4cb..56bb8db040 100644
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


