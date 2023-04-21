Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 613CE6EAB77
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:25:49 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlc-0001nE-2Z; Fri, 21 Apr 2023 09:25:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlZ-0001dD-M2
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:33 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlX-0003Mk-Eu
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:33 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083531; x=1713619531;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fPxmkhsLPlX50PVitpi/DDe9PJnkieReSJZlY/xMaWk=;
 b=l2xSOxpqaTDdXop2HJCyR+/reJjoNRWM5bJWbPQMFUSnrNLfTW+CRp0+
 fcX4J625Ni7JjsT8XOB8dW4zCz0cT8ihfCOTHLfesxsQ6U31ub2t35Uk6
 JYBJ3mt9ByNOYcsam1PTT5O13Tk5SNC8et3hjXAgliw6Kycn/Xb7WjAwh
 lg4P1CzRQm4okToJPSkXGCbVth6h9zM3pHBipgMn0OQfnYrTw5LDJwQRX
 NQY7cDBVue4LIRg6ipcS+pHG/fjil8ZofcngGZFEt4NR6d6ggQC8naJwz
 0Lg3mLEbP5dfpfbUXP+rY+FK7rSnFpvpR65Mjb8ZxzWKNU59wLmnZMXvl w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268422"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268422"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906043"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906043"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:27 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 "Dr . David Alan Gilbert" <dgilbert@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 10/14] monitor: adding tb_stats hmp command
Date: Fri, 21 Apr 2023 21:24:17 +0800
Message-Id: <20230421132421.1617479-11-fei2.wu@intel.com>
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

Adding tb_stats [start|pause|stop|filter] command to hmp.
This allows controlling the collection of statistics.
It is also possible to set the level of collection:
all, jit, or exec.

tb_stats filter allow to only collect statistics for the TB
in the last_search list.

The goal of this command is to allow the dynamic exploration
of the TCG behavior and quality. Therefore, for now, a
corresponding QMP command is not worthwhile.

Acked-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-8-vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-9-vandersonmr2@gmail.com>
[AJB: fix authorship]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/monitor.c           |  51 ++++++++++++++++
 accel/tcg/tb-stats.c          | 112 ++++++++++++++++++++++++++++++++++
 hmp-commands.hx               |  16 +++++
 include/exec/tb-stats-flags.h |   1 +
 include/exec/tb-stats.h       |  10 +++
 include/monitor/hmp.h         |   1 +
 softmmu/runstate.c            |   6 ++
 7 files changed, 197 insertions(+)

diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index 5f9dba56e3..b342727262 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -10,7 +10,9 @@
 #include "qapi/error.h"
 #include "qapi/type-helpers.h"
 #include "qapi/qapi-commands-machine.h"
+#include "qapi/qmp/qdict.h"
 #include "monitor/monitor.h"
+#include "monitor/hmp.h"
 #include "sysemu/cpus.h"
 #include "sysemu/cpu-timers.h"
 #include "sysemu/tcg.h"
@@ -72,12 +74,61 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
     return human_readable_text_from_str(buf);
 }
 
+#ifdef CONFIG_TCG
+void hmp_tbstats(Monitor *mon, const QDict *qdict)
+{
+    if (!tcg_enabled()) {
+        error_report("TB information is only available with accel=tcg");
+        return;
+    }
+
+    char *cmd = (char *) qdict_get_try_str(qdict, "command");
+    enum TbstatsCmd icmd = -1;
+
+    if (strcmp(cmd, "start") == 0) {
+        icmd = START;
+    } else if (strcmp(cmd, "pause") == 0) {
+        icmd = PAUSE;
+    } else if (strcmp(cmd, "stop") == 0) {
+        icmd = STOP;
+    } else if (strcmp(cmd, "filter") == 0) {
+        icmd = FILTER;
+    } else {
+        error_report("invalid command!");
+        return;
+    }
+
+    char *slevel = (char *) qdict_get_try_str(qdict, "level");
+    uint32_t level = TB_EXEC_STATS | TB_JIT_STATS | TB_JIT_TIME;
+    if (slevel) {
+        if (strcmp(slevel, "jit") == 0) {
+            level = TB_JIT_STATS;
+        } else if (strcmp(slevel, "exec") == 0) {
+            level = TB_EXEC_STATS;
+        } else if (strcmp(slevel, "time") == 0) {
+            level = TB_JIT_TIME;
+        }
+    }
+
+    struct TbstatsCommand *tbscommand = g_new0(struct TbstatsCommand, 1);
+    tbscommand->cmd = icmd;
+    tbscommand->level = level;
+    async_safe_run_on_cpu(first_cpu, do_hmp_tbstats_safe,
+                          RUN_ON_CPU_HOST_PTR(tbscommand));
+
+}
+#endif
+
 HumanReadableText *qmp_x_query_profile(Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
 
+#ifdef CONFIG_TCG
     dump_jit_exec_time_info(dev_time);
     dev_time = 0;
+#else
+    error_report("TCG should be enabled!");
+#endif
 
     return human_readable_text_from_str(buf);
 }
diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index 4d24ac2472..61bfbe96fc 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -16,6 +16,7 @@
 #include "qemu/timer.h"
 
 #include "exec/tb-stats.h"
+#include "exec/tb-flush.h"
 #include "tb-context.h"
 
 /* TBStatistic collection controls */
@@ -28,6 +29,8 @@ enum TBStatsStatus {
 
 static enum TBStatsStatus tcg_collect_tb_stats;
 static uint32_t default_tbstats_flag;
+/* only accessed in safe work */
+static GList *last_search;
 
 uint64_t dev_time;
 
@@ -170,6 +173,102 @@ void dump_jit_profile_info(TCGProfile *s, GString *buf)
     g_free(jpi);
 }
 
+static void free_tbstats(void *p, uint32_t hash, void *userp)
+{
+    g_free(p);
+}
+
+static void clean_tbstats(void)
+{
+    /* remove all tb_stats */
+    qht_iter(&tb_ctx.tb_stats, free_tbstats, NULL);
+    qht_destroy(&tb_ctx.tb_stats);
+}
+
+void do_hmp_tbstats_safe(CPUState *cpu, run_on_cpu_data icmd)
+{
+    struct TbstatsCommand *cmdinfo = icmd.host_ptr;
+    int cmd = cmdinfo->cmd;
+    uint32_t level = cmdinfo->level;
+
+    switch (cmd) {
+    case START:
+        if (tb_stats_collection_paused()) {
+            set_tbstats_flags(level);
+        } else {
+            if (tb_stats_collection_enabled()) {
+                qemu_printf("TB information already being recorded");
+                return;
+            }
+            qht_init(&tb_ctx.tb_stats, tb_stats_cmp, CODE_GEN_HTABLE_SIZE,
+                        QHT_MODE_AUTO_RESIZE);
+        }
+
+        set_default_tbstats_flag(level);
+        enable_collect_tb_stats();
+        tb_flush(cpu);
+        break;
+    case PAUSE:
+        if (!tb_stats_collection_enabled()) {
+            qemu_printf("TB information not being recorded");
+            return;
+        }
+
+        /*
+         * Continue to create TBStatistic structures but stop collecting
+         * statistics
+         */
+        pause_collect_tb_stats();
+        set_default_tbstats_flag(TB_NOTHING);
+        set_tbstats_flags(TB_PAUSED);
+        tb_flush(cpu);
+        break;
+    case STOP:
+        if (!tb_stats_collection_enabled()) {
+            qemu_printf("TB information not being recorded");
+            return;
+        }
+
+        /* Dissalloc all TBStatistics structures and stop creating new ones */
+        disable_collect_tb_stats();
+        clean_tbstats();
+        tb_flush(cpu);
+        break;
+    case FILTER:
+        if (!tb_stats_collection_enabled()) {
+            qemu_printf("TB information not being recorded");
+            return;
+        }
+        if (!last_search) {
+            qemu_printf(
+                    "no search on record! execute info tbs before filtering!");
+            return;
+        }
+
+        set_default_tbstats_flag(TB_NOTHING);
+
+        /*
+         * Set all tbstats as paused, then return only the ones from last_search
+         */
+        pause_collect_tb_stats();
+        set_tbstats_flags(TB_PAUSED);
+
+        for (GList *iter = last_search; iter; iter = g_list_next(iter)) {
+            TBStatistics *tbs = iter->data;
+            tbs->stats_enabled = level;
+        }
+
+        tb_flush(cpu);
+
+        break;
+    default: /* INVALID */
+        g_assert_not_reached();
+        break;
+    }
+
+    g_free(cmdinfo);
+}
+
 void init_tb_stats_htable(void)
 {
     if (!tb_ctx.tb_stats.map && tb_stats_collection_enabled()) {
@@ -204,6 +303,19 @@ bool tb_stats_collection_paused(void)
     return tcg_collect_tb_stats == TB_STATS_PAUSED;
 }
 
+static void reset_tbstats_flag(void *p, uint32_t hash, void *userp)
+{
+    uint32_t flag = *((int *)userp);
+    TBStatistics *tbs = p;
+    tbs->stats_enabled = flag;
+}
+
+void set_tbstats_flags(uint32_t flag)
+{
+    /* iterate over tbstats setting their flag as TB_NOTHING */
+    qht_iter(&tb_ctx.tb_stats, reset_tbstats_flag, &flag);
+}
+
 uint32_t get_default_tbstats_flag(void)
 {
     return default_tbstats_flag;
diff --git a/hmp-commands.hx b/hmp-commands.hx
index bb85ee1d26..473544ed3d 100644
--- a/hmp-commands.hx
+++ b/hmp-commands.hx
@@ -1651,6 +1651,22 @@ SRST
   Executes a qemu-io command on the given block device.
 ERST
 
+#if defined(CONFIG_TCG)
+    {
+        .name       = "tb_stats",
+        .args_type  = "command:s,level:s?",
+        .params     = "command [stats_level]",
+        .help       = "Control tb statistics collection:"
+                        "tb_stats (start|pause|stop|filter) [all|jit_stats|exec_stats]",
+        .cmd        = hmp_tbstats,
+    },
+#endif
+
+SRST
+``tb_stats`` *command* *stats_level*
+  Control recording tb statistics
+ERST
+
     {
         .name       = "qom-list",
         .args_type  = "path:s?",
diff --git a/include/exec/tb-stats-flags.h b/include/exec/tb-stats-flags.h
index 559d819b6b..e64fe8caf1 100644
--- a/include/exec/tb-stats-flags.h
+++ b/include/exec/tb-stats-flags.h
@@ -16,6 +16,7 @@
 #define TB_JIT_STATS  (1 << 2)
 #define TB_JIT_TIME   (1 << 3)
 #define TB_ALL_STATS  (TB_EXEC_STATS | TB_JIT_STATS | TB_JIT_TIME)
+#define TB_PAUSED     (1 << 4)
 
 /* TBStatistic collection controls */
 void enable_collect_tb_stats(void);
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index ad60662f78..33eed8d385 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -32,6 +32,9 @@
 
 #include "exec/tb-stats-flags.h"
 
+enum SortBy { SORT_BY_HOTNESS, SORT_BY_HG /* Host/Guest */, SORT_BY_SPILLS };
+enum TbstatsCmd { START, PAUSE, STOP, FILTER };
+
 #define tb_stats_enabled(tb, JIT_STATS) \
     (tb && tb->tb_stats && (tb->tb_stats->stats_enabled & JIT_STATS))
 
@@ -115,4 +118,11 @@ void dump_jit_exec_time_info(uint64_t dev_time);
 
 void set_tbstats_flags(uint32_t flags);
 
+struct TbstatsCommand {
+    enum TbstatsCmd cmd;
+    uint32_t level;
+};
+
+void do_hmp_tbstats_safe(CPUState *cpu, run_on_cpu_data icmd);
+
 #endif
diff --git a/include/monitor/hmp.h b/include/monitor/hmp.h
index fdb69b7f9c..207ec19b34 100644
--- a/include/monitor/hmp.h
+++ b/include/monitor/hmp.h
@@ -181,5 +181,6 @@ void hmp_ioport_write(Monitor *mon, const QDict *qdict);
 void hmp_boot_set(Monitor *mon, const QDict *qdict);
 void hmp_info_mtree(Monitor *mon, const QDict *qdict);
 void hmp_info_cryptodev(Monitor *mon, const QDict *qdict);
+void hmp_tbstats(Monitor *mon, const QDict *qdict);
 
 #endif
diff --git a/softmmu/runstate.c b/softmmu/runstate.c
index 48f46283f1..d168b82469 100644
--- a/softmmu/runstate.c
+++ b/softmmu/runstate.c
@@ -720,12 +720,18 @@ static bool main_loop_should_exit(int *status)
 int qemu_main_loop(void)
 {
     int status = EXIT_SUCCESS;
+#ifdef CONFIG_TCG
     uint64_t ti;
+#endif
 
     while (!main_loop_should_exit(&status)) {
+#ifdef CONFIG_TCG
         ti = profile_getclock();
+#endif
         main_loop_wait(false);
+#ifdef CONFIG_TCG
         dev_time += profile_getclock() - ti;
+#endif
     }
 
     return status;
-- 
2.25.1


