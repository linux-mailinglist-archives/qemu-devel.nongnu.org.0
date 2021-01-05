Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id CD52E2EB182
	for <lists+qemu-devel@lfdr.de>; Tue,  5 Jan 2021 18:39:01 +0100 (CET)
Received: from localhost ([::1]:53324 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kwqIO-0000Lu-S0
	for lists+qemu-devel@lfdr.de; Tue, 05 Jan 2021 12:39:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0Y-0002P4-RA
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:36 -0500
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634]:45509)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kwq0W-0006c4-F3
 for qemu-devel@nongnu.org; Tue, 05 Jan 2021 12:20:34 -0500
Received: by mail-pl1-x634.google.com with SMTP id e2so41153plt.12
 for <qemu-devel@nongnu.org>; Tue, 05 Jan 2021 09:20:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FZ00kItmZ47N3S02niGICD6Ulwts3rlbBFeGNjnPxC0=;
 b=UFN8wyIwB1zAxcIdKE8yBVrmyrPiqDxs7xKgQ6xCBXeib8wwi6yRloZFC5nhZtUBxN
 T7TGcRClJ03IbpXUUWV8t3GdA7Q/uvuDMStwQP+A1uhedZFJbVuLvicMql/6XwrwDN/k
 bAMV09b74yJrnNZp84yDeTCCgZX9lWSPcruzeFefnb15qKA1HO2jmI7CMkeMp55QA+C1
 1rLmLUzZSlDWAw0s6LaPi7JFRuHGWOjhrm34bE+G1WUHSJjG2iqLhYitC+RZ55C33rMO
 D2AyVgKeyHkNFaXTmG4mU8VNUJ2aiPL5HyDKldAS91TEY/4CsUGP0ovtz461OYKisJ2x
 +Ngg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FZ00kItmZ47N3S02niGICD6Ulwts3rlbBFeGNjnPxC0=;
 b=oi2eApOCrAiznv6V+7SmgLGKTBOw5MotROZq5d2DXJnx4wr6kYoulZgFXQ7ZNGN05e
 UzQ8elE41fTNGxYOYQiMfyh97/f0z9i+KTJ693jfQxWTkId4jvJ5+Tq96fb4PTpUYvfv
 iOD49vTV6KJ2muQGRQc/HE18JaHqPCon/a00nbgRY5WoLhRUOnWcvTcz5S3iGNSh2xC1
 Fud9c2eHipD8/fZN0uY5DMba0oaT8GNMfi7k+zGjlyjZh8sQ2UqEL6fAbZmMrH4NwAqg
 RJ0KDCGmmyIn3X2OuAK5lAHSnlgHmwDNIW7xxnwTle3wMFE3IupXBtxX+JoNAq6+AdiP
 2uzQ==
X-Gm-Message-State: AOAM530WPYefIqgrQheqx6aGoFxc32AlsnMWFfpdy+dEmjj22yGLPavB
 RRTzmULat/9dBC3HSfbyz5JXlNLuh+i2Ag==
X-Google-Smtp-Source: ABdhPJwyp/scJ2vpM/TVY8llMd454yoQwUtDy1yBSCzaupTTwtig2HxOH4YGqgKn92CnAaHIb/oR0A==
X-Received: by 2002:a17:902:8c85:b029:dc:2f27:c684 with SMTP id
 t5-20020a1709028c85b02900dc2f27c684mr557105plo.44.1609867230886; 
 Tue, 05 Jan 2021 09:20:30 -0800 (PST)
Received: from localhost.localdomain (rrcs-173-197-107-21.west.biz.rr.com.
 [173.197.107.21])
 by smtp.gmail.com with ESMTPSA id u12sm2010pfh.98.2021.01.05.09.20.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Jan 2021 09:20:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 20/43] tcg: Return the TB pointer from the rx region from
 exit_tb
Date: Tue,  5 Jan 2021 07:19:27 -1000
Message-Id: <20210105171950.415486-21-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210105171950.415486-1-richard.henderson@linaro.org>
References: <20210105171950.415486-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::634;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x634.google.com
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
Cc: Joelle van Dyne <j@getutm.app>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This produces a small pc-relative displacement within the
generated code to the TB structure that preceeds it.

Reviewed-by: Joelle van Dyne <j@getutm.app>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/cpu-exec.c | 35 ++++++++++++++++++++++-------------
 tcg/tcg-op.c         | 13 ++++++++++++-
 2 files changed, 34 insertions(+), 14 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index 8b74ad8d97..17343d2a83 100644
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
@@ -261,6 +272,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
     uint32_t flags;
     uint32_t cflags = 1;
     uint32_t cf_mask = cflags & CF_HASH_MASK;
+    int tb_exit;
 
     if (sigsetjmp(cpu->jmp_env, 0) == 0) {
         start_exclusive();
@@ -277,7 +289,7 @@ void cpu_exec_step_atomic(CPUState *cpu)
         cpu_exec_enter(cpu);
         /* execute the generated code */
         trace_exec_tb(tb, pc);
-        cpu_tb_exec(cpu, tb);
+        cpu_tb_exec(cpu, tb, &tb_exit);
         cpu_exec_exit(cpu);
     } else {
         /*
@@ -673,13 +685,10 @@ static inline bool cpu_handle_interrupt(CPUState *cpu,
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


