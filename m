Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C0F06EAB7C
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:26:37 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlU-0001Ji-CN; Fri, 21 Apr 2023 09:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlR-0001GZ-1o
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:25 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlO-0003Mk-PE
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083522; x=1713619522;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yyFTNUm6M0HhhGT46v3pdyLFtB2Kq1+fn6D9XVjT9sI=;
 b=JDxGEA1jd5PkuDtHqjYohk5Epr2CxCrjjR+PiDgNMbcwYMfmxArK61fu
 Mzz5CwuTTVeFWweLsiaaKDrl6+cpXpzO3wQNSPZH7BSnEVGHuOEUwHRAW
 EweivQi3/LNySmy8El/KSVIfbkko/J+5cC1Simr7uPZOxLaCTkXbCx4lV
 fLA8JNVmn9NNUwZJwgZU/GYyvaFZEDn5E6K+aW5d6OW+VGgxQIwLdnHB+
 7uwY2+6aPXJcH7odRrJ4nqbCN8Recp3gLQgAVbPp4YyN3uknTnX+0kppt
 EfRQwsbP1RMOUdet2juavI4s3R8gYgLYVaGnpzic0cD9N0gwXUZbSaZLu A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268385"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268385"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:22 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906036"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906036"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:20 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 08/14] accel: adding TB_JIT_TIME and full replacing
 CONFIG_PROFILER
Date: Fri, 21 Apr 2023 21:24:15 +0800
Message-Id: <20230421132421.1617479-9-fei2.wu@intel.com>
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

Replace all others CONFIG_PROFILER statistics and migrate it to
TBStatistics system. However, TCGProfiler still exists and can
be use to store global statistics and times. All TB related
statistics goes to TBStatistics.

Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-6-vandersonmr2@gmail.com>
[AJB: fix authorship]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/monitor.c       |  29 +++--------
 accel/tcg/tb-stats.c      |  78 +++++++++++++++++++++++++++++
 accel/tcg/tcg-accel-ops.c |  15 +++---
 include/tcg/tcg.h         |   5 +-
 softmmu/runstate.c        |   8 +--
 tcg/tcg.c                 | 100 ++++++++++----------------------------
 6 files changed, 123 insertions(+), 112 deletions(-)

diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index c9eec426ff..5f9dba56e3 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -14,6 +14,7 @@
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
+#include "exec/tb-stats.h"
 #include "internal.h"
 
 
@@ -55,6 +56,11 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
 
+    if (!tb_stats_collection_enabled()) {
+        error_report("TB information not being recorded.");
+        return NULL;
+    }
+
     if (!tcg_enabled()) {
         error_setg(errp,
                    "Opcode count information is only available with accel=tcg");
@@ -66,34 +72,15 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
     return human_readable_text_from_str(buf);
 }
 
-#ifdef CONFIG_PROFILER
-
 HumanReadableText *qmp_x_query_profile(Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
-    static int64_t last_cpu_exec_time;
-    int64_t cpu_exec_time;
-    int64_t delta;
-
-    cpu_exec_time = tcg_cpu_exec_time();
-    delta = cpu_exec_time - last_cpu_exec_time;
-
-    g_string_append_printf(buf, "async time  %" PRId64 " (%0.3f)\n",
-                           dev_time, dev_time / (double)NANOSECONDS_PER_SECOND);
-    g_string_append_printf(buf, "qemu time   %" PRId64 " (%0.3f)\n",
-                           delta, delta / (double)NANOSECONDS_PER_SECOND);
-    last_cpu_exec_time = cpu_exec_time;
+
+    dump_jit_exec_time_info(dev_time);
     dev_time = 0;
 
     return human_readable_text_from_str(buf);
 }
-#else
-HumanReadableText *qmp_x_query_profile(Error **errp)
-{
-    error_setg(errp, "Internal profiler not compiled");
-    return NULL;
-}
-#endif
 
 static void hmp_tcg_register(void)
 {
diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index 01adbac2a0..3cd7f6fc06 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -13,6 +13,7 @@
 #include "tcg/tcg.h"
 
 #include "qemu/qemu-print.h"
+#include "qemu/timer.h"
 
 #include "exec/tb-stats.h"
 #include "tb-context.h"
@@ -41,6 +42,13 @@ struct jit_profile_info {
     uint64_t host;
     uint64_t guest;
     uint64_t search_data;
+
+    uint64_t interm_time;
+    uint64_t code_time;
+    uint64_t restore_count;
+    uint64_t restore_time;
+    uint64_t opt_time;
+    uint64_t la_time;
 };
 
 /* accumulate the statistics from all TBs */
@@ -62,6 +70,35 @@ static void collect_jit_profile_info(void *p, uint32_t hash, void *userp)
     jpi->host += tbs->code.out_len;
     jpi->guest += tbs->code.in_len;
     jpi->search_data += tbs->code.search_out_len;
+
+    jpi->interm_time += stat_per_translation(tbs, gen_times.ir);
+    jpi->opt_time += stat_per_translation(tbs, gen_times.ir_opt);
+    jpi->la_time += stat_per_translation(tbs, gen_times.la);
+    jpi->code_time += stat_per_translation(tbs, gen_times.code);
+
+    /*
+     * The restore time covers how long we have spent restoring state
+     * from a given TB (e.g. recovering from a fault). It is therefor
+     * not related to the number of translations we have done.
+     */
+    jpi->restore_time += tbs->tb_restore_time;
+    jpi->restore_count += tbs->tb_restore_count;
+}
+
+void dump_jit_exec_time_info(uint64_t dev_time)
+{
+    static uint64_t last_cpu_exec_time;
+    uint64_t cpu_exec_time;
+    uint64_t delta;
+
+    cpu_exec_time = tcg_cpu_exec_time();
+    delta = cpu_exec_time - last_cpu_exec_time;
+
+    qemu_printf("async time  %" PRId64 " (%0.3f)\n",
+                   dev_time, dev_time / (double) NANOSECONDS_PER_SECOND);
+    qemu_printf("qemu time   %" PRId64 " (%0.3f)\n",
+                   delta, delta / (double) NANOSECONDS_PER_SECOND);
+    last_cpu_exec_time = cpu_exec_time;
 }
 
 /* dump JIT statisticis using TCGProfile and TBStats */
@@ -88,6 +125,47 @@ void dump_jit_profile_info(TCGProfile *s, GString *buf)
                 jpi->host / (double) jpi->translations);
         g_string_append_printf(buf, "avg search data/TB  %0.1f\n",
                 jpi->search_data / (double) jpi->translations);
+
+        uint64_t tot = jpi->interm_time + jpi->code_time;
+
+        g_string_append_printf(buf, "JIT cycles          %" PRId64
+                " (%0.3fs at 2.4 GHz)\n",
+                tot, tot / 2.4e9);
+        g_string_append_printf(buf, "  cycles/op           %0.1f\n",
+                jpi->ops ? (double)tot / jpi->ops : 0);
+        g_string_append_printf(buf, "  cycles/in byte      %0.1f\n",
+                jpi->guest ? (double)tot / jpi->guest : 0);
+        g_string_append_printf(buf, "  cycles/out byte     %0.1f\n",
+                jpi->host ? (double)tot / jpi->host : 0);
+        g_string_append_printf(buf, "  cycles/search byte  %0.1f\n",
+                jpi->search_data ? (double)tot / jpi->search_data : 0);
+        if (tot == 0) {
+            tot = 1;
+        }
+
+        g_string_append_printf(buf, "  gen_interm time     %0.1f%%\n",
+                (double)jpi->interm_time / tot * 100.0);
+        g_string_append_printf(buf, "  gen_code time       %0.1f%%\n",
+                (double)jpi->code_time / tot * 100.0);
+
+        g_string_append_printf(buf, "    optim./code time    %0.1f%%\n",
+                (double)jpi->opt_time / (jpi->code_time ? jpi->code_time : 1)
+                    * 100.0);
+        g_string_append_printf(buf, "    liveness/code time  %0.1f%%\n",
+                (double)jpi->la_time / (jpi->code_time ? jpi->code_time : 1)
+                    * 100.0);
+
+        g_string_append_printf(buf, "cpu_restore count   %" PRId64 "\n",
+                jpi->restore_count);
+        g_string_append_printf(buf, "  avg cycles        %0.1f\n",
+                jpi->restore_count ?
+                    (double)jpi->restore_time / jpi->restore_count : 0);
+
+        if (s) {
+            g_string_append_printf(buf, "cpu exec time  %" PRId64 " (%0.3fs)\n",
+                s->cpu_exec_time,
+                s->cpu_exec_time / (double) NANOSECONDS_PER_SECOND);
+        }
     }
     g_free(jpi);
 }
diff --git a/accel/tcg/tcg-accel-ops.c b/accel/tcg/tcg-accel-ops.c
index af35e0d092..fb33ebe310 100644
--- a/accel/tcg/tcg-accel-ops.c
+++ b/accel/tcg/tcg-accel-ops.c
@@ -70,20 +70,17 @@ void tcg_cpus_destroy(CPUState *cpu)
 int tcg_cpus_exec(CPUState *cpu)
 {
     int ret;
-#ifdef CONFIG_PROFILER
-    int64_t ti;
-#endif
+    uint64_t ti;
+
     assert(tcg_enabled());
-#ifdef CONFIG_PROFILER
     ti = profile_getclock();
-#endif
+
     cpu_exec_start(cpu);
     ret = cpu_exec(cpu);
     cpu_exec_end(cpu);
-#ifdef CONFIG_PROFILER
-    qatomic_set(&tcg_ctx->prof.cpu_exec_time,
-                tcg_ctx->prof.cpu_exec_time + profile_getclock() - ti);
-#endif
+
+    qatomic_add(&tcg_ctx->prof.cpu_exec_time, profile_getclock() - ti);
+
     return ret;
 }
 
diff --git a/include/tcg/tcg.h b/include/tcg/tcg.h
index abad5d6a70..2a47e75ee5 100644
--- a/include/tcg/tcg.h
+++ b/include/tcg/tcg.h
@@ -564,6 +564,9 @@ typedef struct TCGProfile {
     uint64_t gen_opt_done_time;
     uint64_t gen_la_done_time;
     uint64_t gen_code_done_time;
+
+    /* Lifetime count of TCGOps per TCGContext */
+    uint64_t table_op_count[NB_OPS];
 } TCGProfile;
 
 struct TCGContext {
@@ -925,7 +928,7 @@ static inline TCGv_ptr tcg_temp_new_ptr(void)
     return temp_tcgv_ptr(t);
 }
 
-int64_t tcg_cpu_exec_time(void);
+uint64_t tcg_cpu_exec_time(void);
 void tcg_dump_info(GString *buf);
 void tcg_dump_op_count(GString *buf);
 
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index d1e04586db..48f46283f1 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -720,18 +720,12 @@ static bool main_loop_should_exit(int *status)
 int qemu_main_loop(void)
 {
     int status = EXIT_SUCCESS;
-#ifdef CONFIG_PROFILER
-    int64_t ti;
-#endif
+    uint64_t ti;
 
     while (!main_loop_should_exit(&status)) {
-#ifdef CONFIG_PROFILER
         ti = profile_getclock();
-#endif
         main_loop_wait(false);
-#ifdef CONFIG_PROFILER
         dev_time += profile_getclock() - ti;
-#endif
     }
 
     return status;
diff --git a/tcg/tcg.c b/tcg/tcg.c
index 716afbd980..337fc0dcab 100644
--- a/tcg/tcg.c
+++ b/tcg/tcg.c
@@ -4816,25 +4816,13 @@ static void tcg_reg_alloc_call(TCGContext *s, TCGOp *op)
     }
 }
 
-#ifdef CONFIG_PROFILER
-
 /* avoid copy/paste errors */
 #define PROF_ADD(to, from, field)                       \
     do {                                                \
         (to)->field += qatomic_read(&((from)->field));  \
     } while (0)
 
-#define PROF_MAX(to, from, field)                                       \
-    do {                                                                \
-        typeof((from)->field) val__ = qatomic_read(&((from)->field));   \
-        if (val__ > (to)->field) {                                      \
-            (to)->field = val__;                                        \
-        }                                                               \
-    } while (0)
-
-/* Pass in a zero'ed @prof */
-static inline
-void tcg_profile_snapshot(TCGProfile *prof, bool counters, bool table)
+static void collect_tcg_profiler(TCGProfile *prof)
 {
     unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
@@ -4843,55 +4831,19 @@ void tcg_profile_snapshot(TCGProfile *prof, bool counters, bool table)
         TCGContext *s = qatomic_read(&tcg_ctxs[i]);
         const TCGProfile *orig = &s->prof;
 
-        if (counters) {
-            PROF_ADD(prof, orig, cpu_exec_time);
-            PROF_ADD(prof, orig, interm_time);
-            PROF_ADD(prof, orig, code_time);
-            PROF_ADD(prof, orig, la_time);
-            PROF_ADD(prof, orig, opt_time);
-            PROF_ADD(prof, orig, restore_count);
-            PROF_ADD(prof, orig, restore_time);
-        }
-        if (table) {
-            int i;
+        PROF_ADD(prof, orig, cpu_exec_time);
 
-            for (i = 0; i < NB_OPS; i++) {
-                PROF_ADD(prof, orig, table_op_count[i]);
-            }
+        for (i = 0; i < NB_OPS; i++) {
+            PROF_ADD(prof, orig, table_op_count[i]);
         }
     }
 }
 
-#undef PROF_ADD
-#undef PROF_MAX
-
-static void tcg_profile_snapshot_counters(TCGProfile *prof)
-{
-    tcg_profile_snapshot(prof, true, false);
-}
-
-static void tcg_profile_snapshot_table(TCGProfile *prof)
-{
-    tcg_profile_snapshot(prof, false, true);
-}
-
-void tcg_dump_op_count(GString *buf)
-{
-    TCGProfile prof = {};
-    int i;
-
-    tcg_profile_snapshot_table(&prof);
-    for (i = 0; i < NB_OPS; i++) {
-        g_string_append_printf(buf, "%s %" PRId64 "\n", tcg_op_defs[i].name,
-                               prof.table_op_count[i]);
-    }
-}
-
-int64_t tcg_cpu_exec_time(void)
+uint64_t tcg_cpu_exec_time(void)
 {
     unsigned int n_ctxs = qatomic_read(&tcg_cur_ctxs);
     unsigned int i;
-    int64_t ret = 0;
+    uint64_t ret = 0;
 
     for (i = 0; i < n_ctxs; i++) {
         const TCGContext *s = qatomic_read(&tcg_ctxs[i]);
@@ -4901,19 +4853,6 @@ int64_t tcg_cpu_exec_time(void)
     }
     return ret;
 }
-#else
-void tcg_dump_op_count(GString *buf)
-{
-    g_string_append_printf(buf, "[TCG profiler not compiled]\n");
-}
-
-int64_t tcg_cpu_exec_time(void)
-{
-    error_report("%s: TCG profiler not compiled", __func__);
-    exit(EXIT_FAILURE);
-}
-#endif
-
 
 int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
 {
@@ -5029,14 +4968,17 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     s->pool_labels = NULL;
 #endif
 
+    if (tb_stats_collection_enabled()) {
+        QTAILQ_FOREACH(op, &s->ops, link) {
+            TCGOpcode opc = op->opc;
+            s->prof.table_op_count[opc]++;
+        }
+    }
+
     num_insns = -1;
     QTAILQ_FOREACH(op, &s->ops, link) {
         TCGOpcode opc = op->opc;
 
-#ifdef CONFIG_PROFILER
-        qatomic_set(&prof->table_op_count[opc], prof->table_op_count[opc] + 1);
-#endif
-
         switch (opc) {
         case INDEX_op_mov_i32:
         case INDEX_op_mov_i64:
@@ -5136,14 +5078,24 @@ int tcg_gen_code(TCGContext *s, TranslationBlock *tb, target_ulong pc_start)
     return tcg_current_code_size(s);
 }
 
+void tcg_dump_op_count(GString *buf)
+{
+    TCGProfile prof = {};
+    int i;
+
+    collect_tcg_profiler(&prof);
+    for (i = 0; i < NB_OPS; i++) {
+        g_string_append_printf(buf, "%s %" PRId64 "\n",
+                tcg_op_defs[i].name, prof.table_op_count[i]);
+    }
+}
+
 void tcg_dump_info(GString *buf)
 {
     TCGProfile *s = NULL;
-#ifdef CONFIG_PROFILER
     TCGProfile prof = {};
-    tcg_profile_snapshot_counters(&prof);
     s = &prof;
-#endif
+    collect_tcg_profiler(s);
     dump_jit_profile_info(s, buf);
 }
 
-- 
2.25.1


