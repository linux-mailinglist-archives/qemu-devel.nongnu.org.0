Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DCB916EAB89
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:27:19 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqld-0001un-KB; Fri, 21 Apr 2023 09:25:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlb-0001oJ-OL
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:35 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqla-0003Mk-0D
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083534; x=1713619534;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=XNnCNPqtiqglf9cd5+XkKNUU7zTYSnGEAAtNJCADK4M=;
 b=D+BmXccbn2dlByYbpPClOOIhYWuwq4vPHH5Fp0QCJuZnLTHEfK0/+PcR
 yV1ctz2V0LVJvfgSVS8QBN4gB2Q29cd0r2TUn/larJkG2B1jSXnoeOsWa
 pJD16UUiETXnsNrYMc0CQwi3rtG+V+lrA7TEL5hnAsSielDoL3+B6XddG
 ez97/WU3vdMQDPoXHCPH3w1lDZyRSfdIMuiXrHNZFptIhAx/KI5naIG0O
 G8+4CFm+qqAcvEu317C8zffbc6fzxyLmN0uEg//HSzWKhuJOzArX53I8E
 tA4RmdlpKJfg1/XHoHG2d5/shGPPFrP1h2qfkHTUAJ6kug3As4sZHXHLZ w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268434"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268434"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906076"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906076"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:32 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 11/14] tb-stats: reset the tracked TBs on a tb_flush
Date: Fri, 21 Apr 2023 21:24:18 +0800
Message-Id: <20230421132421.1617479-12-fei2.wu@intel.com>
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

We keep track of translations but can only do so up until the
translation cache is flushed. At that point we really have no idea if
we can re-create a translation because all the active tracking
information has been reset.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 accel/tcg/tb-maint.c    |  1 +
 accel/tcg/tb-stats.c    | 19 +++++++++++++++++++
 include/exec/tb-stats.h |  8 ++++++++
 3 files changed, 28 insertions(+)

diff --git a/accel/tcg/tb-maint.c b/accel/tcg/tb-maint.c
index ba1635aa4b..5f946e0285 100644
--- a/accel/tcg/tb-maint.c
+++ b/accel/tcg/tb-maint.c
@@ -762,6 +762,7 @@ static void do_tb_flush(CPUState *cpu, run_on_cpu_data tb_flush_count)
     qht_reset_size(&tb_ctx.htable, CODE_GEN_HTABLE_SIZE);
     tb_remove_all();
 
+    tbstats_reset_tbs();
     tcg_region_reset_all();
     /* XXX: flush processor icache at this point if cache flush is expensive */
     qatomic_mb_set(&tb_ctx.tb_flush_count, tb_ctx.tb_flush_count + 1);
diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index 61bfbe96fc..56e944b225 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -269,6 +269,25 @@ void do_hmp_tbstats_safe(CPUState *cpu, run_on_cpu_data icmd)
     g_free(cmdinfo);
 }
 
+/*
+ * We have to reset the tbs array on a tb_flush as those
+ * TranslationBlocks no longer exist and we no loner know if the
+ * current mapping is still valid.
+ */
+
+static void reset_tbs_array(void *p, uint32_t hash, void *userp)
+{
+    TBStatistics *tbs = p;
+    g_ptr_array_set_size(tbs->tbs, 0);
+}
+
+void tbstats_reset_tbs(void)
+{
+    if (tb_ctx.tb_stats.map) {
+        qht_iter(&tb_ctx.tb_stats, reset_tbs_array, NULL);
+    }
+}
+
 void init_tb_stats_htable(void)
 {
     if (!tb_ctx.tb_stats.map && tb_stats_collection_enabled()) {
diff --git a/include/exec/tb-stats.h b/include/exec/tb-stats.h
index 33eed8d385..ec47cbecc2 100644
--- a/include/exec/tb-stats.h
+++ b/include/exec/tb-stats.h
@@ -125,4 +125,12 @@ struct TbstatsCommand {
 
 void do_hmp_tbstats_safe(CPUState *cpu, run_on_cpu_data icmd);
 
+/**
+ * tbstats_reset_tbs: reset the linked array of TBs
+ *
+ * Reset the list of tbs for a given array. Should be called from
+ * safe work during tb_flush.
+ */
+void tbstats_reset_tbs(void);
+
 #endif
-- 
2.25.1


