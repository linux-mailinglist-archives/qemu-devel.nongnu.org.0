Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 603726EAB72
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:24:41 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqkW-0008Ri-3f; Fri, 21 Apr 2023 09:24:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqkT-0008Ot-Nl
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:24:25 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqkR-00031X-Pc
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:24:25 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083463; x=1713619463;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2y6eTh+T2h7CTvGAt1vg+tJlcEZdPnhrXy6WKPHFr1Q=;
 b=SBUTBfT8zoi2tO4PSTmY5IdaFIpQfKwf9MMoUQvRmGEx0SwHLg7aihm6
 29X2zNEdyYp9WQos5h7dVSkF8OgkYPosB+Hvwtaop9BG4vUkrgaq/YEeU
 q4VBj1nPDQsWDv0W+dGS+6EjyHbYA6arErljgA/84EB4Iw7e2UCooODxd
 1cV1RhI1L1aC9R4mO9obB6nIljQ1YUCxgR6OGFCWB3zfvwW0MBB6IHETv
 4yy4q7dEL4F2j4ivuff2jLMWAEDexzICJp15dP5wDlYTJbxZYmWdllHXa
 O7PsyriX/AuOEAyEtyxbqQViC56x12AeWqQKMifMjYjkvYTjOE3TaWA+S w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268168"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268168"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:24:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756905883"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756905883"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:24:20 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 02/14] accel: collecting TB execution count
Date: Fri, 21 Apr 2023 21:24:09 +0800
Message-Id: <20230421132421.1617479-3-fei2.wu@intel.com>
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

If a TB has a TBS (TBStatistics) with the TB_EXEC_STATS
enabled, then we instrument the start code of this TB
to atomically count the number of times it is executed.
We count both the number of "normal" executions and atomic
executions of a TB.

The execution count of the TB is stored in its respective
TBS.

All TBStatistics are created by default with the flags from
default_tbstats_flag.

Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-3-vandersonmr2@gmail.com>
[AJB: Fix author]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/cpu-exec.c      |  6 ++++++
 accel/tcg/tb-stats.c      |  6 ++++++
 accel/tcg/tcg-runtime.c   |  8 ++++++++
 accel/tcg/tcg-runtime.h   |  2 ++
 accel/tcg/translate-all.c |  7 +++++--
 accel/tcg/translator.c    | 10 ++++++++++
 include/exec/gen-icount.h |  1 +
 include/exec/tb-stats.h   | 18 ++++++++++++++++++
 8 files changed, 56 insertions(+), 2 deletions(-)

diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
index c815f2dbfd..d89f9fe493 100644
--- a/accel/tcg/cpu-exec.c
+++ b/accel/tcg/cpu-exec.c
@@ -25,6 +25,7 @@
 #include "trace.h"
 #include "disas/disas.h"
 #include "exec/exec-all.h"
+#include "exec/tb-stats.h"
 #include "tcg/tcg.h"
 #include "qemu/atomic.h"
 #include "qemu/rcu.h"
@@ -564,7 +565,12 @@ void cpu_exec_step_atomic(CPUState *cpu)
             mmap_unlock();
         }
 
+        if (tb_stats_enabled(tb, TB_EXEC_STATS)) {
+            tb->tb_stats->executions.atomic++;
+        }
+
         cpu_exec_enter(cpu);
+
         /* execute the generated code */
         trace_exec_tb(tb, pc);
         cpu_tb_exec(cpu, tb, &tb_exit);
diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index f78a21f522..b1d4341b6f 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -22,6 +22,7 @@ enum TBStatsStatus {
 };
 
 static enum TBStatsStatus tcg_collect_tb_stats;
+static uint32_t default_tbstats_flag;
 
 void init_tb_stats_htable(void)
 {
@@ -56,3 +57,8 @@ bool tb_stats_collection_paused(void)
 {
     return tcg_collect_tb_stats == TB_STATS_PAUSED;
 }
+
+uint32_t get_default_tbstats_flag(void)
+{
+    return default_tbstats_flag;
+}
diff --git a/accel/tcg/tcg-runtime.c b/accel/tcg/tcg-runtime.c
index e4e030043f..44a349b334 100644
--- a/accel/tcg/tcg-runtime.c
+++ b/accel/tcg/tcg-runtime.c
@@ -27,6 +27,7 @@
 #include "exec/helper-proto.h"
 #include "exec/cpu_ldst.h"
 #include "exec/exec-all.h"
+#include "exec/tb-stats.h"
 #include "disas/disas.h"
 #include "exec/log.h"
 #include "tcg/tcg.h"
@@ -148,3 +149,10 @@ void HELPER(exit_atomic)(CPUArchState *env)
 {
     cpu_loop_exit_atomic(env_cpu(env), GETPC());
 }
+
+void HELPER(inc_exec_freq)(void *ptr)
+{
+    TBStatistics *stats = (TBStatistics *) ptr;
+    tcg_debug_assert(stats);
+    qatomic_inc(&stats->executions.normal);
+}
diff --git a/accel/tcg/tcg-runtime.h b/accel/tcg/tcg-runtime.h
index e141a6ab24..66954aa210 100644
--- a/accel/tcg/tcg-runtime.h
+++ b/accel/tcg/tcg-runtime.h
@@ -39,6 +39,8 @@ DEF_HELPER_FLAGS_1(exit_atomic, TCG_CALL_NO_WG, noreturn, env)
 DEF_HELPER_FLAGS_3(memset, TCG_CALL_NO_RWG, ptr, ptr, int, ptr)
 #endif /* IN_HELPER_PROTO */
 
+DEF_HELPER_FLAGS_1(inc_exec_freq, TCG_CALL_NO_RWG, void, ptr)
+
 DEF_HELPER_FLAGS_5(atomic_cmpxchgb, TCG_CALL_NO_WG,
                    i32, env, tl, i32, i32, i32)
 DEF_HELPER_FLAGS_5(atomic_cmpxchgw_be, TCG_CALL_NO_WG,
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 0fcde2e84a..afc89d5692 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -308,6 +308,7 @@ static TBStatistics *tb_get_stats(tb_page_addr_t phys_pc, target_ulong pc,
     new_stats->pc = pc;
     new_stats->cs_base = cs_base;
     new_stats->flags = flags;
+    new_stats->stats_enabled = get_default_tbstats_flag();
 
     /*
      * All initialisation must be complete before we insert into qht
@@ -397,9 +398,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
     /*
      * We want to fetch the stats structure before we start code
      * generation so we can count interesting things about this
-     * generation.
+     * generation. If dfilter is in effect we will only collect stats
+     * for the specified range.
      */
-    if (tb_stats_collection_enabled()) {
+    if (tb_stats_collection_enabled() &&
+        qemu_log_in_addr_range(tb->pc)) {
         tb->tb_stats = tb_get_stats(phys_pc, pc, cs_base, flags);
     } else {
         tb->tb_stats = NULL;
diff --git a/accel/tcg/translator.c b/accel/tcg/translator.c
index 7bda43ff61..165072c8c3 100644
--- a/accel/tcg/translator.c
+++ b/accel/tcg/translator.c
@@ -18,6 +18,15 @@
 #include "exec/plugin-gen.h"
 #include "exec/replay-core.h"
 
+static inline void gen_tb_exec_count(TranslationBlock *tb)
+{
+    if (tb_stats_enabled(tb, TB_EXEC_STATS)) {
+        TCGv_ptr ptr = tcg_temp_new_ptr();
+        tcg_gen_movi_ptr(ptr, (intptr_t)tb->tb_stats);
+        gen_helper_inc_exec_freq(ptr);
+    }
+}
+
 bool translator_use_goto_tb(DisasContextBase *db, target_ulong dest)
 {
     /* Suppress goto_tb if requested. */
@@ -56,6 +65,7 @@ void translator_loop(CPUState *cpu, TranslationBlock *tb, int *max_insns,
 
     /* Start translating.  */
     gen_tb_start(db->tb);
+    gen_tb_exec_count(tb);
     ops->tb_start(db, cpu);
     tcg_debug_assert(db->is_jmp == DISAS_NEXT);  /* no early exit */
 
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index f6de79a6b4..20e7835ff0 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -2,6 +2,7 @@
 #define GEN_ICOUNT_H
 
 #include "exec/exec-all.h"
+#include "exec/tb-stats.h"
 
 /* Helpers for instruction counting code generation.  */
 
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index 606f643723..27a233b7f8 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -30,6 +30,9 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 
+#define tb_stats_enabled(tb, JIT_STATS) \
+    (tb && tb->tb_stats && (tb->tb_stats->stats_enabled & JIT_STATS))
+
 typedef struct TBStatistics TBStatistics;
 
 /*
@@ -46,16 +49,31 @@ struct TBStatistics {
     uint32_t     flags;
     /* cs_base isn't included in the hash but we do check for matches */
     target_ulong cs_base;
+
+    /* which stats are enabled for this TBStats */
+    uint32_t stats_enabled;
+
+    /* Execution stats */
+    struct {
+        unsigned long normal;
+        unsigned long atomic;
+    } executions;
+
 };
 
 bool tb_stats_cmp(const void *ap, const void *bp);
 
 void init_tb_stats_htable(void);
 
+#define TB_NOTHING    (1 << 0)
+#define TB_EXEC_STATS (1 << 1)
+
 void enable_collect_tb_stats(void);
 void disable_collect_tb_stats(void);
 void pause_collect_tb_stats(void);
 bool tb_stats_collection_enabled(void);
 bool tb_stats_collection_paused(void);
 
+uint32_t get_default_tbstats_flag(void);
+
 #endif
-- 
2.25.1


