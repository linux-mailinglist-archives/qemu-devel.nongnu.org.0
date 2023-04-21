Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EB1BE6EAB8D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:27:26 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlI-00011o-JZ; Fri, 21 Apr 2023 09:25:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlH-00011X-01
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:15 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlE-0003L0-9m
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083512; x=1713619512;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=aXne+aKGunUFhE/02GHgjRla235HHudCqIvIYevBZPA=;
 b=YAC7udczJ6fobMW5qUVlxY98zMJAucZJ/4ap+xr9K8pCyD1x1fsA1ZEN
 OWtF13vBRph2gw5ekMdha/2YJGAsQ7XzR2lUXrJOdQYZGKXs0kHX4xB7V
 eBSjIPAwiormTJAZ/aa3l1sPSNrQgECTY/lIw8Qkflfcrf6iTaCqvLIMu
 GzhNGxSvmfA25aUavk2mKPHBsiEUTfmvIeRIMz/KiZ1FV1iEucsaLhjr+
 pHEb5+x7Qe726xyvz2D5ApH6cH/boCIuvksrgUBlVkUeFCAT1Yesy4GeQ
 qswbTalKIs7FulH+MEOfvz8LDPraRzIqHY+8j7zP6q973YxXCJdwvTVzJ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268315"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268315"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906024"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906024"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:04 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 04/14] accel: replacing part of CONFIG_PROFILER with
 TBStats
Date: Fri, 21 Apr 2023 21:24:11 +0800
Message-Id: <20230421132421.1617479-5-fei2.wu@intel.com>
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

We add some of the statistics collected in the TCGProfiler into the
TBStats, having the statistics not only for the whole emulation but
for each TB. Then, we removed these stats from TCGProfiler and
reconstruct the information for the "info jit" using the sum of all
TBStats statistics.

The goal is to have one unique and better way of collecting emulation
statistics. Moreover, checking dynamiclly if the profiling is enabled
showed to have an insignificant impact on the performance:
https://wiki.qemu.org/Internships/ProjectIdeas/TCGCodeQuality#Overheads.

Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-5-vandersonmr2@gmail.com>
[AJB: fix authorship, use prof structure]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/tb-stats.c      |  99 +++++++++++++++++++++++++++++++++
 accel/tcg/translate-all.c |  10 ++--
 include/exec/tb-stats.h   |  11 ++++
 include/tcg/tcg.h         |   9 +--
 tcg/tcg.c                 | 112 ++++----------------------------------
 5 files changed, 129 insertions(+), 112 deletions(-)

diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index b1d4341b6f..434b235edb 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -9,6 +9,10 @@
 #include "qemu/osdep.h"
 
 #include "disas/disas.h"
+#include "exec/exec-all.h"
+#include "tcg/tcg.h"
+
+#include "qemu/qemu-print.h"
 
 #include "exec/tb-stats.h"
 #include "tb-context.h"
@@ -24,6 +28,101 @@ enum TBStatsStatus {
 static enum TBStatsStatus tcg_collect_tb_stats;
 static uint32_t default_tbstats_flag;
 
+struct jit_profile_info {
+    uint64_t translations;
+    uint64_t aborted;
+    uint64_t ops;
+    unsigned ops_max;
+    uint64_t del_ops;
+    uint64_t temps;
+    unsigned temps_max;
+    uint64_t host;
+    uint64_t guest;
+    uint64_t search_data;
+};
+
+/* accumulate the statistics from all TBs */
+static void collect_jit_profile_info(void *p, uint32_t hash, void *userp)
+{
+    struct jit_profile_info *jpi = userp;
+    TBStatistics *tbs = p;
+
+    jpi->translations += tbs->translations.total;
+    jpi->ops += tbs->code.num_tcg_ops;
+    if (stat_per_translation(tbs, code.num_tcg_ops) > jpi->ops_max) {
+        jpi->ops_max = stat_per_translation(tbs, code.num_tcg_ops);
+    }
+    jpi->del_ops += tbs->code.deleted_ops;
+    jpi->temps += tbs->code.temps;
+    if (stat_per_translation(tbs, code.temps) > jpi->temps_max) {
+        jpi->temps_max = stat_per_translation(tbs, code.temps);
+    }
+    jpi->host += tbs->code.out_len;
+    jpi->guest += tbs->code.in_len;
+    jpi->search_data += tbs->code.search_out_len;
+}
+
+/* dump JIT statisticis using TCGProfile and TBStats */
+void dump_jit_profile_info(TCGProfile *s, GString *buf)
+{
+    if (!tb_stats_collection_enabled()) {
+        return;
+    }
+
+    struct jit_profile_info *jpi = g_new0(struct jit_profile_info, 1);
+
+    qht_iter(&tb_ctx.tb_stats, collect_jit_profile_info, jpi);
+
+    if (jpi->translations) {
+        g_string_append_printf(buf, "translated TBs      %" PRId64 "\n",
+                jpi->translations);
+        g_string_append_printf(buf, "avg ops/TB          %0.1f max=%d\n",
+                jpi->ops / (double) jpi->translations, jpi->ops_max);
+        g_string_append_printf(buf, "deleted ops/TB      %0.2f\n",
+                jpi->del_ops / (double) jpi->translations);
+        g_string_append_printf(buf, "avg temps/TB        %0.2f max=%d\n",
+                jpi->temps / (double) jpi->translations, jpi->temps_max);
+        g_string_append_printf(buf, "avg host code/TB    %0.1f\n",
+                jpi->host / (double) jpi->translations);
+        g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
+                jpi->search_data / (double) jpi->translations);
+
+        if (s) {
+            int64_t tot = s->interm_time + s->code_time;
+            g_string_append_printf(buf, "JIT cycles          %" PRId64
+                    " (%0.3f s at 2.4 GHz)\n",
+                    tot, tot / 2.4e9);
+            g_string_append_printf(buf, "cycles/op           %0.1f\n",
+                    jpi->ops ? (double)tot / jpi->ops : 0);
+            g_string_append_printf(buf, "cycles/in byte      %0.1f\n",
+                    jpi->guest ? (double)tot / jpi->guest : 0);
+            g_string_append_printf(buf, "cycles/out byte     %0.1f\n",
+                    jpi->host ? (double)tot / jpi->host : 0);
+            g_string_append_printf(buf, "cycles/search byte     %0.1f\n",
+                    jpi->search_data ? (double)tot / jpi->search_data : 0);
+            if (tot == 0) {
+                tot = 1;
+            }
+            g_string_append_printf(buf, "  gen_interm time   %0.1f%%\n",
+                    (double)s->interm_time / tot * 100.0);
+            g_string_append_printf(buf, "  gen_code time     %0.1f%%\n",
+                    (double)s->code_time / tot * 100.0);
+            g_string_append_printf(buf, "optim./code time    %0.1f%%\n",
+                    (double)s->opt_time / (s->code_time ? s->code_time : 1)
+                        * 100.0);
+            g_string_append_printf(buf, "liveness/code time  %0.1f%%\n",
+                    (double)s->la_time / (s->code_time ? s->code_time : 1)
+                        * 100.0);
+            g_string_append_printf(buf, "cpu_restore count   %" PRId64 "\n",
+                    s->restore_count);
+            g_string_append_printf(buf, "  avg cycles        %0.1f\n",
+                    s->restore_count ?
+                        (double)s->restore_time / s->restore_count : 0);
+        }
+    }
+    g_free(jpi);
+}
+
 void init_tb_stats_htable(void)
 {
     if (!tb_ctx.tb_stats.map && tb_stats_collection_enabled()) {
diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 1cd051ca7c..8a51c291d8 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -289,7 +289,6 @@ static int setjmp_gen_code(CPUArchState *env, TranslationBlock *tb,
     *max_insns = tb->icount;
 
 #ifdef CONFIG_PROFILER
-    qatomic_set(&tcg_ctx->prof.tb_count, tcg_ctx->prof.tb_count + 1);
     qatomic_set(&tcg_ctx->prof.interm_time,
                 tcg_ctx->prof.interm_time + profile_getclock() - *ti);
     *ti = profile_getclock();
@@ -389,8 +388,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
  tb_overflow:
 
 #ifdef CONFIG_PROFILER
-    /* includes aborted translations because of exceptions */
-    qatomic_set(&prof->tb_count1, prof->tb_count1 + 1);
     ti = profile_getclock();
 #endif
 
@@ -463,9 +460,6 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
 
 #ifdef CONFIG_PROFILER
     qatomic_set(&prof->code_time, prof->code_time + profile_getclock() - ti);
-    qatomic_set(&prof->code_in_len, prof->code_in_len + tb->size);
-    qatomic_set(&prof->code_out_len, prof->code_out_len + gen_code_size);
-    qatomic_set(&prof->search_out_len, prof->search_out_len + search_size);
 #endif
 
 #ifdef DEBUG_DISAS
@@ -584,7 +578,11 @@ TranslationBlock *tb_gen_code(CPUState *cpu,
         ts->code.num_tcg_ops += prof->translation.nb_ops_pre_opt;
         ts->code.num_tcg_ops_opt += tcg_ctx->nb_ops;
         ts->code.spills += prof->translation.nb_spills;
+        ts->code.temps += prof->translation.temp_count;
+        ts->code.deleted_ops += prof->translation.del_op_count;
+        ts->code.in_len += tb->size;
         ts->code.out_len += tb->tc.size;
+        ts->code.search_out_len += search_size;
 
         ts->translations.total++;
         if (tb_page_addr1(tb) != -1) {
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index 3506c8d4f7..0ccf025ae4 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -33,6 +33,9 @@
 #define tb_stats_enabled(tb, JIT_STATS) \
     (tb && tb->tb_stats && (tb->tb_stats->stats_enabled & JIT_STATS))
 
+#define stat_per_translation(stat, name) \
+    (stat->translations.total ? stat->name / stat->translations.total : 0)
+
 typedef struct TBStatistics TBStatistics;
 
 /*
@@ -68,7 +71,13 @@ struct TBStatistics {
         unsigned num_tcg_ops;
         unsigned num_tcg_ops_opt;
         unsigned spills;
+
+        /* CONFIG_PROFILE */
+        unsigned temps;
+        unsigned deleted_ops;
+        unsigned in_len;
         unsigned out_len;
+        unsigned search_out_len;
     } code;
 
     struct {
@@ -88,6 +97,8 @@ bool tb_stats_cmp(const void *ap, const void *bp);
 
 void init_tb_stats_htable(void);
 
+void dump_jit_profile_info(TCGProfile *s, GString *buf);
+
 #define TB_NOTHING    (1 << 0)
 #define TB_EXEC_STATS (1 << 1)
 #define TB_JIT_STATS  (1 << 2)
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index 0fdd62bf4a..645dbaa563 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -547,16 +547,13 @@ typedef struct TCGProfile {
         int nb_guest_insns;
         int nb_spills;
         int nb_ops_pre_opt;
+
+        int del_op_count;
+        int temp_count;
     } translation;
 
     int64_t cpu_exec_time;
-    int64_t tb_count1;
-    int64_t tb_count;
     int64_t op_count; /* total insn count */
-    int op_count_max; /* max insn per TB */
-    int temp_count_max;
-    int64_t temp_count;
-    int64_t del_op_count;
     int64_t code_in_len;
     int64_t code_out_len;
     int64_t search_out_len;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index f2d0243384..6f46c87dc1 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -44,6 +44,7 @@
 #define NO_CPU_IO_DEFS
 
 #include "exec/exec-all.h"
+#include "exec/tb-stats.h"
 #include "tcg/tcg-op.h"
 
 #if UINTPTR_MAX == UINT32_MAX
@@ -1138,6 +1139,8 @@ void tcg_func_start(TCGContext *s)
     s->current_frame_offset = s->frame_start;
 
     s->prof.translation.nb_spills = 0;
+    s->prof.translation.del_op_count = 0;
+    s->prof.translation.temp_count = 0;
 #ifdef CONFIG_DEBUG_TCG
     s->goto_tb_issue_mask = 0;
 #endif
@@ -2582,10 +2585,8 @@ void tcg_op_remove(TCGContext *s, TCGOp *op)
     QTAILQ_REMOVE(&s->ops, op, link);
     QTAILQ_INSERT_TAIL(&s->free_ops, op, link);
     s->nb_ops--;
-
-#ifdef CONFIG_PROFILER
-    qatomic_set(&s->prof.del_op_count, s->prof.del_op_count + 1);
-#endif
+    /* ? won't this end up op_opt - op = del_op_count ? */
+    s->prof.translation.del_op_count++;
 }
 
 void tcg_remove_ops_after(TCGOp *op)
@@ -4844,16 +4845,6 @@ void tcg_profile_snapshot(TCGProfile *prof, bool counters, bool table)
 
         if (counters) {
             PROF_ADD(prof, orig, cpu_exec_time);
-            PROF_ADD(prof, orig, tb_count1);
-            PROF_ADD(prof, orig, tb_count);
-            PROF_ADD(prof, orig, op_count);
-            PROF_MAX(prof, orig, op_count_max);
-            PROF_ADD(prof, orig, temp_count);
-            PROF_MAX(prof, orig, temp_count_max);
-            PROF_ADD(prof, orig, del_op_count);
-            PROF_ADD(prof, orig, code_in_len);
-            PROF_ADD(prof, orig, code_out_len);
-            PROF_ADD(prof, orig, search_out_len);
             PROF_ADD(prof, orig, interm_time);
             PROF_ADD(prof, orig, code_time);
             PROF_ADD(prof, orig, la_time);
@@ -4931,26 +4922,9 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     TCGOp *op;
 
     s->current_tb = tb;
-
-#ifdef CONFIG_PROFILER
-    {
-        int n = 0;
-
-        QTAILQ_FOREACH(op, &s->ops, link) {
-            n++;
-        }
-        qatomic_set(&prof->op_count, prof->op_count + n);
-        if (n > prof->op_count_max) {
-            qatomic_set(&prof->op_count_max, n);
-        }
-
-        n = s->nb_temps;
-        qatomic_set(&prof->temp_count, prof->temp_count + n);
-        if (n > prof->temp_count_max) {
-            qatomic_set(&prof->temp_count_max, n);
-        }
-    }
-#endif
+    /* save pre-optimisation op count */
+    prof->translation.nb_ops_pre_opt = s->nb_ops;
+    prof->translation.temp_count = s->nb_temps;
 
 #ifdef DEBUG_DISAS
     if (unlikely(qemu_loglevel_mask(CPU_LOG_TB_OP)
@@ -4965,8 +4939,6 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     }
 #endif
 
-    /* save pre-optimisation op count */
-    prof->translation.nb_ops_pre_opt = s->nb_ops;
 
 #ifdef CONFIG_DEBUG_TCG
     /* Ensure all labels referenced have been emitted.  */
@@ -5169,76 +5141,16 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     return tcg_current_code_size(s);
 }
 
-#ifdef CONFIG_PROFILER
 void tcg_dump_info(GString *buf)
 {
+    TCGProfile *s = NULL;
+#ifdef CONFIG_PROFILER
     TCGProfile prof = {};
-    const TCGProfile *s;
-    int64_t tb_count;
-    int64_t tb_div_count;
-    int64_t tot;
-
     tcg_profile_snapshot_counters(&prof);
     s = &prof;
-    tb_count = s->tb_count;
-    tb_div_count = tb_count ? tb_count : 1;
-    tot = s->interm_time + s->code_time;
-
-    g_string_append_printf(buf, "JIT cycles          %" PRId64
-                           " (%0.3f s at 2.4 GHz)\n",
-                           tot, tot / 2.4e9);
-    g_string_append_printf(buf, "translated TBs      %" PRId64
-                           " (aborted=%" PRId64 " %0.1f%%)\n",
-                           tb_count, s->tb_count1 - tb_count,
-                           (double)(s->tb_count1 - s->tb_count)
-                           / (s->tb_count1 ? s->tb_count1 : 1) * 100.0);
-    g_string_append_printf(buf, "avg ops/TB          %0.1f max=%d\n",
-                           (double)s->op_count / tb_div_count, s->op_count_max);
-    g_string_append_printf(buf, "deleted ops/TB      %0.2f\n",
-                           (double)s->del_op_count / tb_div_count);
-    g_string_append_printf(buf, "avg temps/TB        %0.2f max=%d\n",
-                           (double)s->temp_count / tb_div_count,
-                           s->temp_count_max);
-    g_string_append_printf(buf, "avg host code/TB    %0.1f\n",
-                           (double)s->code_out_len / tb_div_count);
-    g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
-                           (double)s->search_out_len / tb_div_count);
-
-    g_string_append_printf(buf, "cycles/op           %0.1f\n",
-                           s->op_count ? (double)tot / s->op_count : 0);
-    g_string_append_printf(buf, "cycles/in byte      %0.1f\n",
-                           s->code_in_len ? (double)tot / s->code_in_len : 0);
-    g_string_append_printf(buf, "cycles/out byte     %0.1f\n",
-                           s->code_out_len ? (double)tot / s->code_out_len : 0);
-    g_string_append_printf(buf, "cycles/search byte     %0.1f\n",
-                           s->search_out_len ?
-                           (double)tot / s->search_out_len : 0);
-    if (tot == 0) {
-        tot = 1;
-    }
-    g_string_append_printf(buf, "  gen_interm time   %0.1f%%\n",
-                           (double)s->interm_time / tot * 100.0);
-    g_string_append_printf(buf, "  gen_code time     %0.1f%%\n",
-                           (double)s->code_time / tot * 100.0);
-    g_string_append_printf(buf, "optim./code time    %0.1f%%\n",
-                           (double)s->opt_time / (s->code_time ?
-                                                  s->code_time : 1)
-                           * 100.0);
-    g_string_append_printf(buf, "liveness/code time  %0.1f%%\n",
-                           (double)s->la_time / (s->code_time ?
-                                                 s->code_time : 1) * 100.0);
-    g_string_append_printf(buf, "cpu_restore count   %" PRId64 "\n",
-                           s->restore_count);
-    g_string_append_printf(buf, "  avg cycles        %0.1f\n",
-                           s->restore_count ?
-                           (double)s->restore_time / s->restore_count : 0);
-}
-#else
-void tcg_dump_info(GString *buf)
-{
-    g_string_append_printf(buf, "[TCG profiler not compiled]\n");
-}
 #endif
+    dump_jit_profile_info(s, buf);
+}
 
 #ifdef ELF_HOST_MACHINE
 /* In order to use this feature, the backend needs to do three things:
-- 
2.25.1


