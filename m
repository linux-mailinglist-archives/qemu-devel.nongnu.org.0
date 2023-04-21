Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8760A6EAB88
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:27:13 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlZ-0001W8-C8; Fri, 21 Apr 2023 09:25:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlX-0001RY-RK
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:31 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlR-0003Mk-F9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083525; x=1713619525;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HVODCArhp7liLYjXpQOB7FWY5zTcDqnOCLQcS+/4CzU=;
 b=TpquWloFqc6yDaL3SwrGU+PkM3AFX20wPsZ1ywJabN8TmhbGBDns4sFD
 b4M68rd+an2b0YOzuOWKdfD6JBkhpaVSwhbqnt3IWyiYVNouMV7unK/2C
 zRU5zqEWP1vsQ42IeCn4j4U7CY8BCufYx7x+RhzunxJWUF3WnLV1XCbEl
 vEtSvorVgPVcvzUuKHjxH86apTsGaaG85jQwEfwAK9HSP2Du5Q5HX4q/1
 x1tdENXRjOd65taqosYoFiVZguUeImzGPo6P4hxBZ9NwUTh1QVGJXzWeC
 vmV7kLSXKBGgxWOBch/64mqeKK+pi5hleQtCC29GkIyTIiJpd+amiwzuj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268404"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268404"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:24 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906039"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906039"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:23 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: "Vanderson M. do Rosario" <vandersonmr2@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 09/14] debug: add -d tb_stats to control TBStatistics
 collection:
Date: Fri, 21 Apr 2023 21:24:16 +0800
Message-Id: <20230421132421.1617479-10-fei2.wu@intel.com>
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

 -d tb_stats[[,level=(+all+jit+exec+time)][,dump_limit=<number>]]

"dump_limit" is used to limit the number of dumped TBStats in
linux-user mode.

[all+jit+exec+time] control the profilling level used
by the TBStats. Can be used as follow:

-d tb_stats
-d tb_stats,level=jit+time
-d tb_stats,dump_limit=15
...

Signed-off-by: Vanderson M. do Rosario <vandersonmr2@gmail.com>
Message-Id: <20190829173437.5926-7-vandersonmr2@gmail.com>
[AJB: fix authorship, reword title]
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/tb-stats.c          |  5 +++++
 include/exec/gen-icount.h     |  1 +
 include/exec/tb-stats-flags.h | 30 ++++++++++++++++++++++++++++
 include/exec/tb-stats.h       | 15 +++-----------
 include/qemu/log.h            |  1 +
 stubs/meson.build             |  1 +
 stubs/tb-stats.c              | 27 +++++++++++++++++++++++++
 util/log.c                    | 37 +++++++++++++++++++++++++++++++++++
 8 files changed, 105 insertions(+), 12 deletions(-)
 create mode 100644 include/exec/tb-stats-flags.h
 create mode 100644 stubs/tb-stats.c

diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index 3cd7f6fc06..4d24ac2472 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -208,3 +208,8 @@ uint32_t get_default_tbstats_flag(void)
 {
     return default_tbstats_flag;
 }
+
+void set_default_tbstats_flag(uint32_t flags)
+{
+    default_tbstats_flag = flags;
+}
diff --git a/include/exec/gen-icount.h b/include/exec/gen-icount.h
index 20e7835ff0..4372817951 100644
--- a/include/exec/gen-icount.h
+++ b/include/exec/gen-icount.h
@@ -3,6 +3,7 @@
 
 #include "exec/exec-all.h"
 #include "exec/tb-stats.h"
+#include "tb-stats-flags.h"
 
 /* Helpers for instruction counting code generation.  */
 
diff --git a/include/exec/tb-stats-flags.h b/include/exec/tb-stats-flags.h
new file mode 100644
index 0000000000..559d819b6b
--- /dev/null
+++ b/include/exec/tb-stats-flags.h
@@ -0,0 +1,30 @@
+/*
+ * QEMU System Emulator, Code Quality Monitor System
+ *
+ * We define the flags and control bits here to avoid complications of
+ * including TCG/CPU information in common code.
+ *
+ * Copyright (c) 2019 Vanderson M. do Rosario <vandersonmr2@gmail.com>
+ *
+ * SPDX-License-Identifier: GPL-2.0-or-later
+ */
+#ifndef TB_STATS_FLAGS
+#define TB_STATS_FLAGS
+
+#define TB_NOTHING    (1 << 0)
+#define TB_EXEC_STATS (1 << 1)
+#define TB_JIT_STATS  (1 << 2)
+#define TB_JIT_TIME   (1 << 3)
+#define TB_ALL_STATS  (TB_EXEC_STATS | TB_JIT_STATS | TB_JIT_TIME)
+
+/* TBStatistic collection controls */
+void enable_collect_tb_stats(void);
+void disable_collect_tb_stats(void);
+void pause_collect_tb_stats(void);
+bool tb_stats_collection_enabled(void);
+bool tb_stats_collection_paused(void);
+
+uint32_t get_default_tbstats_flag(void);
+void set_default_tbstats_flag(uint32_t);
+
+#endif
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index a23b6320bd..ad60662f78 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -30,6 +30,8 @@
 #include "exec/exec-all.h"
 #include "tcg/tcg.h"
 
+#include "exec/tb-stats-flags.h"
+
 #define tb_stats_enabled(tb, JIT_STATS) \
     (tb && tb->tb_stats && (tb->tb_stats->stats_enabled & JIT_STATS))
 
@@ -111,17 +113,6 @@ void init_tb_stats_htable(void);
 void dump_jit_profile_info(TCGProfile *s, GString *buf);
 void dump_jit_exec_time_info(uint64_t dev_time);
 
-#define TB_NOTHING    (1 << 0)
-#define TB_EXEC_STATS (1 << 1)
-#define TB_JIT_STATS  (1 << 2)
-#define TB_JIT_TIME   (1 << 3)
-
-void enable_collect_tb_stats(void);
-void disable_collect_tb_stats(void);
-void pause_collect_tb_stats(void);
-bool tb_stats_collection_enabled(void);
-bool tb_stats_collection_paused(void);
-
-uint32_t get_default_tbstats_flag(void);
+void set_tbstats_flags(uint32_t flags);
 
 #endif
diff --git a/include/qemu/log.h b/include/qemu/log.h
index c5643d8dd5..6f3b8091cd 100644
--- a/include/qemu/log.h
+++ b/include/qemu/log.h
@@ -35,6 +35,7 @@ bool qemu_log_separate(void);
 /* LOG_STRACE is used for user-mode strace logging. */
 #define LOG_STRACE         (1 << 19)
 #define LOG_PER_THREAD     (1 << 20)
+#define CPU_LOG_TB_STATS   (1 << 21)
 
 /* Lock/unlock output. */
 
diff --git a/stubs/meson.build b/stubs/meson.build
index b2b5956d97..ecce77a01f 100644
--- a/stubs/meson.build
+++ b/stubs/meson.build
@@ -63,3 +63,4 @@ else
 endif
 stub_ss.add(files('semihost-all.c'))
 stub_ss.add(when: 'CONFIG_VFIO_USER_SERVER', if_false: files('vfio-user-obj.c'))
+stub_ss.add(files('tb-stats.c'))
diff --git a/stubs/tb-stats.c b/stubs/tb-stats.c
new file mode 100644
index 0000000000..d212c2a1fa
--- /dev/null
+++ b/stubs/tb-stats.c
@@ -0,0 +1,27 @@
+/*
+ * TB Stats Stubs
+ *
+ * Copyright (c) 2019
+ * Written by Alex Bennée <alex.bennee@linaro.org>
+ *
+ * This code is licensed under the GNU GPL v2, or later.
+ */
+
+
+#include "qemu/osdep.h"
+#include "exec/tb-stats-flags.h"
+
+void enable_collect_tb_stats(void)
+{
+    return;
+}
+
+bool tb_stats_collection_enabled(void)
+{
+    return false;
+}
+
+void set_default_tbstats_flag(uint32_t flags)
+{
+    return;
+}
diff --git a/util/log.c b/util/log.c
index 53b4f6c58e..7ae471d97c 100644
--- a/util/log.c
+++ b/util/log.c
@@ -19,6 +19,7 @@
 
 #include "qemu/osdep.h"
 #include "qemu/log.h"
+#include "qemu/qemu-print.h"
 #include "qemu/range.h"
 #include "qemu/error-report.h"
 #include "qapi/error.h"
@@ -27,6 +28,7 @@
 #include "qemu/thread.h"
 #include "qemu/lockable.h"
 #include "qemu/rcu.h"
+#include "exec/tb-stats-flags.h"
 #ifdef CONFIG_LINUX
 #include <sys/syscall.h>
 #endif
@@ -47,6 +49,7 @@ static __thread Notifier qemu_log_thread_cleanup_notifier;
 int qemu_loglevel;
 static bool log_per_thread;
 static GArray *debug_regions;
+int32_t max_num_hot_tbs_to_dump;
 
 /* Returns true if qemu_log() will really write somewhere. */
 bool qemu_log_enabled(void)
@@ -495,6 +498,10 @@ const QEMULogItem qemu_log_items[] = {
       "log every user-mode syscall, its input, and its result" },
     { LOG_PER_THREAD, "tid",
       "open a separate log file per thread; filename must contain '%d'" },
+    { CPU_LOG_TB_STATS,
+      "tb_stats[[,level=(+all+jit+exec+time)][,dump_limit=<number>]]",
+      "enable collection of TBs statistics"
+      "(and dump until given a limit if in user mode).\n" },
     { 0, NULL, NULL },
 };
 
@@ -516,6 +523,36 @@ int qemu_str_to_log_mask(const char *str)
             trace_enable_events((*tmp) + 6);
             mask |= LOG_TRACE;
 #endif
+        } else if (g_str_has_prefix(*tmp, "tb_stats")) {
+            mask |= CPU_LOG_TB_STATS;
+            set_default_tbstats_flag(TB_ALL_STATS);
+            enable_collect_tb_stats();
+        } else if (tb_stats_collection_enabled() &&
+                   g_str_has_prefix(*tmp, "dump_limit=")) {
+            max_num_hot_tbs_to_dump = atoi((*tmp) + 11);
+        } else if (tb_stats_collection_enabled() &&
+                   g_str_has_prefix(*tmp, "level=")) {
+            uint32_t flags = 0;
+            char **level_parts = g_strsplit(*tmp + 6, "+", 0);
+            char **level_tmp;
+            for (level_tmp = level_parts; level_tmp && *level_tmp;
+                    level_tmp++) {
+                if (g_str_equal(*level_tmp, "jit")) {
+                    flags |= TB_JIT_STATS;
+                } else if (g_str_equal(*level_tmp, "exec")) {
+                    flags |= TB_EXEC_STATS;
+                } else if (g_str_equal(*level_tmp, "time")) {
+                    flags |= TB_JIT_TIME;
+                } else if (g_str_equal(*level_tmp, "all")) {
+                    flags |= TB_ALL_STATS;
+                } else {
+                    /* FIXME: set errp */
+                    fprintf(stderr, "no option level=%s, valid options are:"
+                            "all, jit, exec or/and time\n", *level_tmp);
+                    exit(1);
+                }
+                set_default_tbstats_flag(flags);
+            }
         } else {
             for (item = qemu_log_items; item->mask != 0; item++) {
                 if (g_str_equal(*tmp, item->name)) {
-- 
2.25.1


