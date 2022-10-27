Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0245E60F472
	for <lists+qemu-devel@lfdr.de>; Thu, 27 Oct 2022 12:06:54 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1onzja-0007VX-LN; Thu, 27 Oct 2022 06:03:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzjA-0006sZ-Tl
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:09 -0400
Received: from mail-pf1-x434.google.com ([2607:f8b0:4864:20::434])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1onzj8-0004Ef-Iz
 for qemu-devel@nongnu.org; Thu, 27 Oct 2022 06:03:08 -0400
Received: by mail-pf1-x434.google.com with SMTP id g62so974409pfb.10
 for <qemu-devel@nongnu.org>; Thu, 27 Oct 2022 03:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSG/K4mlF2KPY6JS4R2kh3NiVBne+gqPMQQ357pKXcA=;
 b=u1ktNpJ4RM7TK79E1Gk+5LixuoKLqNpIzJkYHsMmmgwwyZqxT//d/yia5tYUPc8kMF
 gSOiSoo+WLL5LqdV20bc5l3dG00tRJzZ1uGXji76eCqcHX14m06GOg+brRFUsdyNYR93
 ellQuaw78vTNGkkXrRMmPwEPkZ1pq/8BcCYbb7/QVU1QBfCPkvvyAX1kCrQYoYIa68b8
 L1UBhv8mpyCDhwnD7j4dPFyid5nk1u8uj2goczv0UYTamVnme92pxIwFqVI1U5qDM81b
 WmHXLTos8e73saRJ3/2587qPq/uO9xzem/IskCSN2XbAj1FkoGlQIl+xLS2IuT/cS32T
 tEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSG/K4mlF2KPY6JS4R2kh3NiVBne+gqPMQQ357pKXcA=;
 b=PMD5+4R+ioo22/jlGdcTLA7lbBbX6tHw2d0N8y+9JbFs1W0kMWhqfVHgEnqTVAmGDe
 pQnme0NrBjoL1XsLR40d9vF4Me1vMYxkqsgXi5RTYw26aC1C1s8GYYo3jzNK+WbWqDnO
 L1XvLOtpWJ5fG0d+yiIhsXK0KGB0NuAykb8HmagVs6OL2j2gcdhuGrWsnOVgUNOGxfbb
 iuo3n32POcWfW5ZH9cMQqmbXEii7g14sxHTv2XDjow40CocJZbuUKiGtyxLn2C9aT1uO
 LbEQSJ3cc05vos1dQKy4yXBc2bJRsIa8kzCtRyzrn20NOFimTAneLMDC0VnTqaBVFhTf
 PQlw==
X-Gm-Message-State: ACrzQf0nX0ZIJxS9H1IemF+7Px7HFDIiOuBNv6j7UeyTgKCedgPYMVM2
 QFpOQAfnq1pKl8RlmGqh0k/FYku2uAg4B/9E
X-Google-Smtp-Source: AMsMyM4PHxmlc6CzeCa74ZElq65mOdOHCi3C2/wJtrty9b2TKbeyObcdxyBbqB6vAg2XNTxes97e4w==
X-Received: by 2002:a65:6158:0:b0:46f:55fe:9be6 with SMTP id
 o24-20020a656158000000b0046f55fe9be6mr1078594pgv.301.1666864984528; 
 Thu, 27 Oct 2022 03:03:04 -0700 (PDT)
Received: from localhost.localdomain ([2001:8003:501a:d301:3a91:9408:3918:55a])
 by smtp.gmail.com with ESMTPSA id
 n13-20020a17090a2bcd00b0020a825fc912sm2354631pje.45.2022.10.27.03.03.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Oct 2022 03:03:03 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: cfontana@suse.de
Subject: [PATCH v2 1/6] accel/tcg: Introduce cpu_unwind_state_data
Date: Thu, 27 Oct 2022 21:02:49 +1100
Message-Id: <20221027100254.215253-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221027100254.215253-1-richard.henderson@linaro.org>
References: <20221027100254.215253-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::434;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x434.google.com
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


