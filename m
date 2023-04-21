Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B476EAB79
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:26:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlO-0001Dl-JD; Fri, 21 Apr 2023 09:25:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlL-00014A-Or
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:19 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlJ-0003Mk-IP
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083517; x=1713619517;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Y0ZpXw5w1L+wV1VOoDF+rpMnJxQnje3Ws+zndxkNz9Q=;
 b=n13T56XKNa4Ufo4/1kCSODfalGFQnCxRjV9kfzIoYtYr13MOwawVaFHh
 b17aXjBszQh3v33xMxeJh/cFeyVSWkUm8Be6NOAsOTjVU8hw9FQhq6mcx
 Ibs1Jrz377uegOIO6UAW/b/6c9+BjH52y4kyNXuSoriaUAjKiWqpfgzZf
 /5ebsP4Na0s6oDWo7nHdJIeBI/Ekg0AtZ9rq52F1sDqVBvo82HFbT79ml
 LYqXWd1qx9kDQLzsWttgqkHQnW4nF2grLLDt+u2vRL6j0T5rIsCK1AqRY
 vSDI9f0LnNj9QOMcJ9UAkGVbM6AqTuchQRB//mj1jOudIpFqQhvdDk+4a Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268350"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268350"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906026"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906026"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:15 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 06/14] accel/tcg: convert profiling of restore operations
 to TBStats
Date: Fri, 21 Apr 2023 21:24:13 +0800
Message-Id: <20230421132421.1617479-7-fei2.wu@intel.com>
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

From: Alex Bennée <alex.bennee@linaro.org>

This starts the conversion of CONFIG_PROFILER data collection to under
the TBStats system. We introduce a new flag TB_JIT_TIME and start
tracking how much time is spent restoring execution state from a given
TB.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/translate-all.c | 23 ++++++++++++++---------
 include/exec/tb-stats.h   |  6 ++++++
 include/qemu/timer.h      |  3 ---
 3 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/accel/tcg/translate-all.c b/accel/tcg/translate-all.c
index 8a51c291d8..bf10987450 100644
--- a/accel/tcg/translate-all.c
+++ b/accel/tcg/translate-all.c
@@ -200,10 +200,12 @@ void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
                                uintptr_t host_pc)
 {
     uint64_t data[TARGET_INSN_START_WORDS];
-#ifdef CONFIG_PROFILER
-    TCGProfile *prof = &tcg_ctx->prof;
-    int64_t ti = profile_getclock();
-#endif
+    uint64_t ti = 0;
+
+    if (tb_stats_enabled(tb, TB_JIT_TIME)) {
+        ti = profile_getclock();
+    }
+
     int insns_left = cpu_unwind_data_from_tb(tb, host_pc, data);
 
     if (insns_left < 0) {
@@ -221,11 +223,14 @@ void cpu_restore_state_from_tb(CPUState *cpu, TranslationBlock *tb,
 
     cpu->cc->tcg_ops->restore_state_to_opc(cpu, tb, data);
 
-#ifdef CONFIG_PROFILER
-    qatomic_set(&prof->restore_time,
-                prof->restore_time + profile_getclock() - ti);
-    qatomic_set(&prof->restore_count, prof->restore_count + 1);
-#endif
+    if (tb_stats_enabled(tb, TB_JIT_TIME)) {
+        TBStatistics *ts = tb->tb_stats;
+        uint64_t elapsed = profile_getclock() - ti;
+        qemu_mutex_lock(&ts->jit_stats_lock);
+        ts->tb_restore_time += elapsed;
+        ts->tb_restore_count++;
+        qemu_mutex_unlock(&ts->jit_stats_lock);
+    }
 }
 
 bool cpu_restore_state(CPUState *cpu, uintptr_t host_pc)
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index 0ccf025ae4..80314c50f9 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -91,6 +91,11 @@ struct TBStatistics {
      * this TBStats structure. Has to be reset on a tb_flush.
      */
     GPtrArray *tbs;
+
+    /* Recover state from TB */
+    uint64_t tb_restore_time;
+    uint64_t tb_restore_count;
+
 };
 
 bool tb_stats_cmp(const void *ap, const void *bp);
@@ -102,6 +107,7 @@ void dump_jit_profile_info(TCGProfile *s, GString *buf);
 #define TB_NOTHING    (1 << 0)
 #define TB_EXEC_STATS (1 << 1)
 #define TB_JIT_STATS  (1 << 2)
+#define TB_JIT_TIME   (1 << 3)
 
 void enable_collect_tb_stats(void);
 void disable_collect_tb_stats(void);
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index d86fc73a17..ad0da18a5f 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -989,7 +989,6 @@ static inline int64_t cpu_get_host_ticks(void)
 }
 #endif
 
-#ifdef CONFIG_PROFILER
 static inline int64_t profile_getclock(void)
 {
     return get_clock();
@@ -997,5 +996,3 @@ static inline int64_t profile_getclock(void)
 
 extern uint64_t dev_time;
 #endif
-
-#endif
-- 
2.25.1


