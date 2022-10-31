Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A2F0C614059
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 23:03:51 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opcql-0005J3-Km; Mon, 31 Oct 2022 18:01:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpo-00057g-6T
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:01:00 -0400
Received: from mail-io1-xd2f.google.com ([2607:f8b0:4864:20::d2f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opcpk-0000yg-J4
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 18:00:43 -0400
Received: by mail-io1-xd2f.google.com with SMTP id o65so10935950iof.4
 for <qemu-devel@nongnu.org>; Mon, 31 Oct 2022 15:00:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHYIC5asuArw95radfcZ/rVfrHssHUSuePR3hcbF0+I=;
 b=IP99DDCUfaYdniiTe8XKeFuq0li6K5LIR/EcZ9DyoltzQTRTgMagOouV4mloihyAs2
 j2wT4+Nx+X0mDoYJInhnRvrOdyx5R3fT3dJt14Qa/x4RkNBuc0RcA8fEFqPQs9QBm/Yl
 fQQqOHDzQu0J4H+oUSFERdrykXsbh8WZlCZTM6+7alwP5AhVAELkhFOfc1xIPo+adD3R
 qx6AnTGvej2kgaRZaCYViZ0lOh1I63j2otrYie7P/slGgZtRhJZe3FV6QtjWfAVdsdvV
 eWqxZQXrPOTPeZ64C8TfIVVtqmHyB8neRsuFP1alFER3dPG2TgxN1VxuedZM/+XMKanq
 IT/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHYIC5asuArw95radfcZ/rVfrHssHUSuePR3hcbF0+I=;
 b=NuKmg4e9NG6TjrsjA3Y0rbfNzum9Z3i8ZL8Vm0Lz1xmBEgy4x1xdJfYSnU2dLm52iE
 Dtg3SL5VmLFzDK2QrfwzvIxCS027NHm93OfTRUhkHsHqZGaXXvgRjFiDYTS9zak6gTz6
 WfI/F33QE/xGxK77etMFP7qL9GmrmsbYqkrQslczY7CV1KleUOadyu+S7sSHohTRQRgE
 KxXBLVUhzQTBBau7vMa+v77ruz+TQs7H4xS3XXNWZuLCMNQ1wbx/JBtLwSjMP7KQD8O4
 dfIe3HsgMZdRImBiVKJqODqExB/XB5KKsYpws2KZh4XEfGzVirg2G7K9tEsKV+XlXwsW
 EXWg==
X-Gm-Message-State: ACrzQf2OUKkcx5frTL70KFbSZULmrn4Ap2yvs0iZuQZYhR41e0ayYX0C
 W2iOwmU4USLRMfN+T6JbJvkI2axQqbkGLw==
X-Google-Smtp-Source: AMsMyM7b6JVF2wdqIAxsQmueNWWlUDoR55ZfUCjB95ZukbtwS/UNVWWWXmUpfW/4Y9ixzUEChe8a3Q==
X-Received: by 2002:a02:3346:0:b0:375:4c11:ee4d with SMTP id
 k6-20020a023346000000b003754c11ee4dmr6698591jak.207.1667253639468; 
 Mon, 31 Oct 2022 15:00:39 -0700 (PDT)
Received: from stoup.. ([172.58.176.58]) by smtp.gmail.com with ESMTPSA id
 d6-20020a926806000000b002f9537986f3sm2916853ilc.24.2022.10.31.15.00.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 15:00:38 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: stefanha@gmail.com,
	Claudio Fontana <cfontana@suse.de>
Subject: [PULL v2 05/13] accel/tcg: Introduce cpu_unwind_state_data
Date: Tue,  1 Nov 2022 09:00:16 +1100
Message-Id: <20221031220020.414768-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031220020.414768-1-richard.henderson@linaro.org>
References: <20221031215723.414467-1-richard.henderson@linaro.org>
 <20221031220020.414768-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::d2f;
 envelope-from=richard.henderson@linaro.org; helo=mail-io1-xd2f.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces@nongnu.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de+lists+qemu-devel=lfdr.de@nongnu.org

Add a way to examine the unwind data without actually
restoring the data back into env.

Reviewed-by: Claudio Fontana <cfontana@suse.de>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/internal.h      |  4 +--
 include/exec/exec-all.h   | 21 ++++++++---
 accel/tcg/translate-all.c | 74 ++++++++++++++++++++++++++-------------
 3 files changed, 68 insertions(+), 31 deletions(-)

diff --git a/accel/tcg/internal.h b/accel/tcg/internal.h
index 1227bb69bd..9c06b320b7 100644
--- a/accel/tcg/internal.h
+++ b/accel/tcg/internal.h
@@ -106,8 +106,8 @@ void tb_reset_jump(TranslationBlock *tb, int n);
 TranslationBlock *tb_link_page(TranslationBlock *tb, tb_page_addr_t phys_pc,
                                tb_page_addr_t phys_page2);
 bool tb_invalidate_phys_page_unwind(tb_page_addr_t addr, uintptr_t pc);
-int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                              uintptr_t searched_pc, bool reset_icount);
+void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
+                               uintptr_t host_pc, bool reset_icount);
 
 /* Return the current PC from CPU, which may be cached in TB. */
 static inline target_ulong log_pc(CPUState *cpu, const TranslationBlock *tb)
diff --git a/include/exec/exec-all.h b/include/exec/exec-all.h
index e948992a80..7d851f5907 100644
--- a/include/exec/exec-all.h
+++ b/include/exec/exec-all.h
@@ -39,20 +39,33 @@ typedef ram_addr_t tb_page_addr_t;
 #define TB_PAGE_ADDR_FMT RAM_ADDR_FMT
 #endif
 
+/**
+ * cpu_unwind_state_data:
+ * @cpu: the cpu context
+ * @host_pc: the host pc within the translation
+ * @data: output data
+ *
+ * Attempt to load the the unwind state for a host pc occurring in
+ * translated code.  If @host_pc is not in translated code, the
+ * function returns false; otherwise @data is loaded.
+ * This is the same unwind info as given to restore_state_to_opc.
+ */
+bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data);
+
 /**
  * cpu_restore_state:
- * @cpu: the vCPU state is to be restore to
- * @searched_pc: the host PC the fault occurred at
+ * @cpu: the cpu context
+ * @host_pc: the host pc within the translation
  * @will_exit: true if the TB executed will be interrupted after some
                cpu adjustments. Required for maintaining the correct
                icount valus
  * @return: true if state was restored, false otherwise
  *
  * Attempt to restore the state for a fault occurring in translated
- * code. If the searched_pc is not in translated code no state is
+ * code. If @host_pc is not in translated code no state is
  * restored and the function returns false.
  */
-bool cpu_restore_state(CPUState *cpu, uintptr_t searched_pc, bool will_exit);
+bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit);
 
 G_NORETURN void cpu_loop_exit_noexc(CPUState *cpu);
 G_NORETURN void cpu_loop_exit(CPUState *cpu);
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index f185356a36..319becb698 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -247,52 +247,66 @@ static int encode_search(TranslationBlock *tb, uint8_t *block)
     return p - block;
 }
 
-/* The cpu state corresponding to 'searched_pc' is restored.
- * When reset_icount is true, current TB will be interrupted and
- * icount should be recalculated.
- */
-int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
-                              uintptr_t searched_pc, bool reset_icount)
+static int cpu_unwind_data_from_tb(TranslationBlock *tb, uintptr_t host_pc,
+                                   uint64_t *data)
 {
-    uint64_t data[TARGET_INSN_START_WORDS];
-    uintptr_t host_pc = (uintptr_t)tb->tc.ptr;
+    uintptr_t iter_pc = (uintptr_t)tb->tc.ptr;
     const uint8_t *p = tb->tc.ptr + tb->tc.size;
     int i, j, num_insns = tb->icount;
-#ifdef CONFIG_PROFILER
-    TCGProfile *prof = &tcg_ctx->prof;
-    int64_t ti = profile_getclock();
-#endif
 
-    searched_pc -= GETPC_ADJ;
+    host_pc -= GETPC_ADJ;
 
-    if (searched_pc < host_pc) {
+    if (host_pc < iter_pc) {
         return -1;
     }
 
-    memset(data, 0, sizeof(data));
+    memset(data, 0, sizeof(uint64_t) * TARGET_INSN_START_WORDS);
     if (!TARGET_TB_PCREL) {
         data[0] = tb_pc(tb);
     }
 
-    /* Reconstruct the stored insn data while looking for the point at
-       which the end of the insn exceeds the searched_pc.  */
+    /*
+     * Reconstruct the stored insn data while looking for the point
+     * at which the end of the insn exceeds host_pc.
+     */
     for (i = 0; i < num_insns; ++i) {
         for (j = 0; j < TARGET_INSN_START_WORDS; ++j) {
             data[j] += decode_sleb128(&p);
         }
-        host_pc += decode_sleb128(&p);
-        if (host_pc > searched_pc) {
-            goto found;
+        iter_pc += decode_sleb128(&p);
+        if (iter_pc > host_pc) {
+            return num_insns - i;
         }
     }
     return -1;
+}
+
+/*
+ * The cpu state corresponding to 'host_pc' is restored.
+ * When reset_icount is true, current TB will be interrupted and
+ * icount should be recalculated.
+ */
+void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
+                               uintptr_t host_pc, bool reset_icount)
+{
+    uint64_t data[TARGET_INSN_START_WORDS];
+#ifdef CONFIG_PROFILER
+    TCGProfile *prof = &tcg_ctx->prof;
+    int64_t ti = profile_getclock();
+#endif
+    int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
+
+    if (insns_left < 0) {
+        return;
+    }
 
- found:
     if (reset_icount && (tb_cflags(tb) & CF_USE_ICOUNT)) {
         assert(icount_enabled());
-        /* Reset the cycle counter to the start of the block
-           and shift if to the number of actually executed instructions */
-        cpu_neg(cpu)->icount_decr.u16.low += num_insns - i;
+        /*
+         * Reset the cycle counter to the start of the block and
+         * shift if to the number of actually executed instructions.
+         */
+        cpu_neg(cpu)->icount_decr.u16.low += insns_left;
     }
 
     cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
@@ -302,7 +316,6 @@ int cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                 prof->restore_time + profile_getclock() - ti);
     qatomic_set(&prof->restore_count, prof->restore_count + 1);
 #endif
-    return 0;
 }
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
@@ -335,6 +348,17 @@ bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc, bool will_exit)
     return false;
 }
 
+bool cpu_unwind_state_data(CPUState *cpu, uintptr_t host_pc, uint64_t *data)
+{
+    if (in_code_gen_buffer((const void *)(host_pc - tcg_splitwx_diff))) {
+        TranslationBlock *tb = tcg_tb_lookup(host_pc);
+        if (tb) {
+            return cpu_unwind_data_from_tb(tb, host_pc, data) >= 0;
+        }
+    }
+    return false;
+}
+
 void page_init(void)
 {
     page_size_init();
-- 
2.34.1


