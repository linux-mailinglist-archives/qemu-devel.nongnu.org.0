Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A6FF612FD2
	for <lists+qemu-devel@lfdr.de>; Mon, 31 Oct 2022 06:41:41 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1opNXG-0001c0-Qo; Mon, 31 Oct 2022 01:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNXB-0001br-JA
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:29 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1opNX9-0003oM-Od
 for qemu-devel@nongnu.org; Mon, 31 Oct 2022 01:40:29 -0400
Received: by mail-ot1-x329.google.com with SMTP id
 br15-20020a056830390f00b0061c9d73b8bdso6249833otb.6
 for <qemu-devel@nongnu.org>; Sun, 30 Oct 2022 22:40:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CHYIC5asuArw95radfcZ/rVfrHssHUSuePR3hcbF0+I=;
 b=rXZI88JHIyPKKzulnhgYCMJlmE1ED8mkDCBJXdHhGhTAEluGTEOH5n+pBLThV9+dfx
 MfmlcLXjqah9Pg8S2/GjYkTDEY5Wa8lbwJy8FQ1dMrD653Xqyxnvfu5u0efJY7chlxxF
 GyrNVCpJZ8xtmV74pQ0TE8RCkQxpBjMUMnOeitspBFxjVbEIzlIjERKPedcp/XdAaaUC
 U7sA35SsnnrL3PN4vcDY9rA5EgnABlkF0F0dIAZkCvPMPY5FEQHtE3tmaij2EfW5/jGU
 wEBUnwy3+88i2Kt1ywFDvb/u13f/k3XiRJlbxoWG6vfzh+KIvC+jqMRW87eesMcf/Iux
 q4GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CHYIC5asuArw95radfcZ/rVfrHssHUSuePR3hcbF0+I=;
 b=x2lbjZEARgFfbzv+gkhqkzqTD2auehCcF6lYcsA6rMomUDaJD+mz9Vh3BGkigyiKFT
 +CrHo3yIxOgUP/CqUVq+c8PTUULOsmfmjtuiFzb7tTKGR6Yw+ni1lYoILTaEff3pgTsa
 eUDKwXRiVH0BL0pofyWzyLLxhqp/QfjRTs1IgxHK4o+G+16hAoptIedSHBdkMnxXYGmt
 NKwFzhaiJOtsNoOBr6Wl7LX3B3W8tzOX4e9bdgDR29K4JIdkm9UqRxJ/JmwZwYJYRCva
 yYbqbkmTnCplEcYJNpUhAqjmAOOv3cPis0OMmFchcltDKQAMM8WQHbcFL4xnmIcxds+Y
 DQXg==
X-Gm-Message-State: ACrzQf3yfgkdiGt/s2w/4Sk4STrisOpiZchbdzTuuIQvNg7/I7nDyKdX
 J+FurtixyjMoDEuClv+ZTbUMZwzePjPhmg==
X-Google-Smtp-Source: AMsMyM5fU64W/ocriClbQOTyBz5VeZFdGEWUS+ZEqYtDCX9ROoWsc1Ul41zFs/cFHtlOn+Q83D69Lw==
X-Received: by 2002:a05:6830:1f58:b0:66c:3e5e:3ee8 with SMTP id
 u24-20020a0568301f5800b0066c3e5e3ee8mr4707792oth.45.1667194826042; 
 Sun, 30 Oct 2022 22:40:26 -0700 (PDT)
Received: from stoup.. ([172.58.176.235]) by smtp.gmail.com with ESMTPSA id
 u8-20020a9d4d88000000b006618586b850sm2473857otk.46.2022.10.30.22.40.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Oct 2022 22:40:25 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: Claudio Fontana <cfontana@suse.de>
Subject: [PULL 05/11] accel/tcg: Introduce cpu_unwind_state_data
Date: Mon, 31 Oct 2022 16:39:42 +1100
Message-Id: <20221031053948.3408-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221031053948.3408-1-richard.henderson@linaro.org>
References: <20221031053948.3408-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::329;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x329.google.com
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

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


