Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 237586EAB75
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:25:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlF-000119-UV; Fri, 21 Apr 2023 09:25:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlE-000110-Pq
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:12 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlC-0003KR-Et
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083510; x=1713619510;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZtHylB7AxRAZ58bxRepp/7rcF6VI2dOHzygwvctdj1M=;
 b=nIsLDMRuw//eW8M8/pqzPTmvVU9FKymYOpV37ysDFcmYBrrsv8zcMIg4
 jjJqPiiMR+tZNpc5Wve5gSth309BkNwv8Vftj94CkAVDXRFZmfcpkJ+5H
 0anqAhGwyVYA4hoSv21qQ7atcMZiTU76OBm93/3hYUTIEgVWFNYx52/bb
 4xBqTYmEa1GMPYn8CBpBUaLsuCmiwToNbnnaPlqlm9Jk3tQitcDFjf+7o
 /b5eflfRMTxos7hO4WrE/N+GNeFzIKBmF1ANsAepibDIwI3AI7IAfDhPt
 6hW9wOLo3XgXfpMiDZNqUiM1eMB3bWdd/fKF/IByKwA/pDZpWpD5KEY6s A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268274"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268274"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906013"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906013"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:24:59 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 03/14] accel: collecting JIT statistics
Date: Fri, 21 Apr 2023 21:24:10 +0800
Message-Id: <20230421132421.1617479-4-fei2.wu@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230421132421.1617479-1-fei2.wu@intel.com>
References: <20230421132421.1617479-1-fei2.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=fei2.wu@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -43
X-Spam_score: -4.4
X-Spam_bar: ----
X-Spam_report: (-4.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

From: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>

If a TB has a TBS (TBStatistics) with the TB_JIT_STATS enabled then we
collect statistics of its translation processes and code translation.

To help with collection we include the TCGProfile structure
unconditionally. It will have further alterations in future commits.

Collecting the number of host instructions seems to be not simple as
it would imply in having to modify several target source files. So,
for now, we are only collecting the size of the host gen code.

Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-4-vandersonmr2@gmail.com>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 29 +++++++++++++++++++++++++++--
 accel/tcg/translator.c    |  3 +++
 include/exec/tb-stats.h   | 24 ++++++++++++++++++++++++
 include/tcg/tcg.h         | 22 ++++++++++++++++++++--
 tcg/tcg.c                 |  9 +++++++--
 5 files changed, 81 insertions(+), 6 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index afc89d5692..1cd051ca7c 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -309,6 +309,8 @@ static TBStatistics *tb_get_stats(tb_page_addr_t phys_pc, target_ulong pc,
     new_stats->cs_base = cs_base;
     new_stats->flags = flags;
     new_stats->stats_enabled = get_default_tbstats_flag();
+    new_stats->tbs = g_ptr_array_sized_new(4);
+    qemu_mutex_init(&new_stats->jit_stats_lock);
 
     /*
      * All initialisation must be complete before we insert into qht
@@ -322,6 +324,7 @@ static TBStatistics *tb_get_stats(tb_page_addr_t phys_pc, target_ulong pc,
          * If there is already a TBStatistic for this TB from a previous flush
          * then just make the new TB point to the older TBStatistic
          */
+        g_ptr_array_free(new_stats->tbs, true);
         g_free(new_stats);
         return existing_stats;
     } else {
@@ -340,9 +343,7 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     tb_page_addr_t phys_pc;
     tcg_insn_unit *gen_code_buf;
     int gen_code_size, search_size, max_insns;
-#ifdef CONFIG_PROFILER
     TCGProfile *prof = &tcg_ctx->prof;
-#endif
     int64_t ti;
     void *host_pc;
 
@@ -571,6 +572,30 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         return tb;
     }
 
+    /*
+     * Collect JIT stats when enabled. We batch them all up here to
+     * avoid spamming the cache with atomic accesses
+     */
+    if (tb_stats_enabled(tb, TB_JIT_STATS)) {
+        TBStatistics *ts = tb->tb_stats;
+        qemu_mutex_lock(&ts->jit_stats_lock);
+
+        ts->code.num_guest_inst += prof->translation.nb_guest_insns;
+        ts->code.num_tcg_ops += prof->translation.nb_ops_pre_opt;
+        ts->code.num_tcg_ops_opt += tcg_ctx->nb_ops;
+        ts->code.spills += prof->translation.nb_spills;
+        ts->code.out_len += tb->tc.size;
+
+        ts->translations.total++;
+        if (tb_page_addr1(tb) != -1) {
+            ts->translations.spanning++;
+        }
+
+        g_ptr_array_add(ts->tbs, tb);
+
+        qemu_mutex_unlock(&ts->jit_stats_lock);
+    }
+
     /*
      * Insert TB into the corresponding region tree before publishing it
      * through QHT. Otherwise rewinding happened in the TB might fail to
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 165072c8c3..40a56962b1 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -132,6 +132,9 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
     tb->size = db->pc_next - db->pc_first;
     tb->icount = db->num_insns;
 
+    /* Save number of guest instructions for TB_JIT_STATS */
+    tcg_ctx->prof.translation.nb_guest_insns = db->num_insns;
+
 #ifdef DEBUG_DISAS
     if (qemu_loglevel_mask(CPU_LOG_TB_IN_ASM)
         && qemu_log_in_addr_range(db->pc_first)) {
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index 27a233b7f8..3506c8d4f7 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -59,6 +59,29 @@ struct TBStatistics {
         unsigned long atomic;
     } executions;
 
+    /* JIT Stats - protected by lock */
+    QemuMutex jit_stats_lock;
+
+    /* Sum of all operations for all translations */
+    struct {
+        unsigned num_guest_inst;
+        unsigned num_tcg_ops;
+        unsigned num_tcg_ops_opt;
+        unsigned spills;
+        unsigned out_len;
+    } code;
+
+    struct {
+        unsigned long total;
+        unsigned long uncached;
+        unsigned long spanning;
+    } translations;
+
+    /*
+     * All persistent (cached) TranslationBlocks using
+     * this TBStats structure. Has to be reset on a tb_flush.
+     */
+    GPtrArray *tbs;
 };
 
 bool tb_stats_cmp(const void *ap, const void *bp);
@@ -67,6 +90,7 @@ void init_tb_stats_htable(void);
 
 #define TB_NOTHING    (1 << 0)
 #define TB_EXEC_STATS (1 << 1)
+#define TB_JIT_STATS  (1 << 2)
 
 void enable_collect_tb_stats(void);
 void disable_collect_tb_stats(void);
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 5cfaa53938..0fdd62bf4a 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -529,7 +529,26 @@ static inline TCGRegSet output_pref(const TCGOp *op, unsigned i)
     return i < ARRAY_SIZE(op->output_pref) ? op->output_pref[i] : 0;
 }
 
+/*
+ * The TCGProfile structure holds data for analysing the quality of
+ * the code generation. The data is split between stuff that is valid
+ * for the lifetime of a single translation and things that are valid
+ * for the lifetime of the translator. As the former is reset for each
+ * new translation so it should be copied elsewhere if you want to
+ * keep it.
+ *
+ * The structure is safe to access within the context of translation
+ * but accessing the data from elsewhere should be done with safe
+ * work.
+ */
 typedef struct TCGProfile {
+
+    struct {
+        int nb_guest_insns;
+        int nb_spills;
+        int nb_ops_pre_opt;
+    } translation;
+
     int64_t cpu_exec_time;
     int64_t tb_count1;
     int64_t tb_count;
@@ -569,9 +588,7 @@ struct TCGContext {
     tcg_insn_unit *code_buf;      /* pointer for start of tb */
     tcg_insn_unit *code_ptr;      /* pointer for running end of tb */
 
-#ifdef CONFIG_PROFILER
     TCGProfile prof;
-#endif
 
 #ifdef CONFIG_DEBUG_TCG
     int goto_tb_issue_mask;
@@ -633,6 +650,7 @@ struct TCGContext {
 
     /* Exit to translator on overflow. */
     sigjmp_buf jmp_trans;
+    TranslationBlock *current_tb;
 };
 
 static inline bool temp_readonly(TCGTemp *ts)
diff --git a/tcg/tcg.c b/tcg/tcg.c
index bb52bc060b..f2d0243384 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -1137,6 +1137,7 @@ void tcg_func_start(TCGContext *s)
     s->nb_labels = 0;
     s->current_frame_offset = s->frame_start;
 
+    s->prof.translation.nb_spills = 0;
 #ifdef CONFIG_DEBUG_TCG
     s->goto_tb_issue_mask = 0;
 #endif
@@ -3750,6 +3751,7 @@ static TCGReg tcg_reg_alloc(TCGContext *s, TCGRegSet required_regs,
     }
 
     /* We must spill something.  */
+    s->prof.translation.nb_spills++;
     for (j = f; j < 2; j++) {
         TCGRegSet set = reg_ct[j];
 
@@ -4924,12 +4926,12 @@ int64_t tcg_cpu_exec_time(void)
 
 int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 {
-#ifdef CONFIG_PROFILER
     TCGProfile *prof = &s->prof;
-#endif
     int i, num_insns;
     TCGOp *op;
 
+    s->current_tb = tb;
+
 #ifdef CONFIG_PROFILER
     {
         int n = 0;
@@ -4963,6 +4965,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     }
 #endif
 
+    /* save pre-optimisation op count */
+    prof->translation.nb_ops_pre_opt = s->nb_ops;
+
 #ifdef CONFIG_DEBUG_TCG
     /* Ensure all labels referenced have been emitted.  */
     {
-- 
2.25.1


