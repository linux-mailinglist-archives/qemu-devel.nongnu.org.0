Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1129B6EAB7D
	for <lists+qemu-devel@lfdr.de>; Fri, 21 Apr 2023 15:26:48 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ppqlI-000120-Vr; Fri, 21 Apr 2023 09:25:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlG-00011Q-L9
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:14 -0400
Received: from mga05.intel.com ([192.55.52.43])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <fei2.wu@intel.com>) id 1ppqlF-0003KR-3n
 for qemu-devel@nongnu.org; Fri, 21 Apr 2023 09:25:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1682083513; x=1713619513;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=WNIo84hU1QQcPGj401Y32N/rh4tOgg/o7Vpt12k6Trk=;
 b=ZJbLap89BgBbG7pAHSyLWRhN78fkyc4ujjdp8x/UlKFLJLym2/knmNUg
 pQNB84mhAeoUuF8s2qLCLhr4CSbDuGtrb6i5l1/s1uiAAisKXcpAuofeq
 Ux1S4JUXKDyJ8LZ5u9dl4FDIqx0ckQwj2ZYhcLzETbV0XRE3Fv3xmXQFR
 Ofb9QcWRseWIKKBn2aLoPly8b1NzSorFGErdG/qw8vCUQbWAHO+4STl58
 AzDxqZMDqadv07Z9gDXLzHBhvtA/Vuqph/uUtZSZrqu1xHfXu/B4F/CyF
 UerwHxzcSOetu/2Xu5gLSc/J79SduXVnzXyZ/pue+36GhgV8KJ9ZsUwBk A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="432268326"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="432268326"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 21 Apr 2023 06:25:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10686"; a="756906025"
X-IronPort-AV: E=Sophos;i="5.99,214,1677571200"; d="scan'208";a="756906025"
Received: from wufei-optiplex-7090.sh.intel.com ([10.238.200.247])
 by fmsmga008.fm.intel.com with ESMTP; 21 Apr 2023 06:25:09 -0700
From: Fei Wu <fei2.wu@intel.com>
To: alex.bennee@linaro.org, richard.henderson@linaro.org, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>
Subject: [PATCH v11 05/14] accel/tcg: move profiler dev_time to tb_stats
Date: Fri, 21 Apr 2023 21:24:12 +0800
Message-Id: <20230421132421.1617479-6-fei2.wu@intel.com>
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

This shouldn't live in the monitor code anyway. While we are at it
make it an uint64_t as we won't be dealing in negative numbers.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 accel/tcg/monitor.c  | 2 --
 accel/tcg/tb-stats.c | 2 ++
 include/qemu/timer.h | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/accel/tcg/monitor.c b/accel/tcg/monitor.c
index 1450e160e9..c9eec426ff 100644
--- a/accel/tcg/monitor.c
+++ b/accel/tcg/monitor.c
@@ -68,8 +68,6 @@ HumanReadableText *qmp_x_query_opcount(Error **errp)
 
 #ifdef CONFIG_PROFILER
 
-int64_t dev_time;
-
 HumanReadableText *qmp_x_query_profile(Error **errp)
 {
     g_autoptr(GString) buf = g_string_new("");
diff --git a/accel/tcg/tb-stats.c b/accel/tcg/tb-stats.c
index 434b235edb..a2438a1f51 100644
--- a/accel/tcg/tb-stats.c
+++ b/accel/tcg/tb-stats.c
@@ -28,6 +28,8 @@ enum TBStatsStatus {
 static enum TBStatsStatus tcg_collect_tb_stats;
 static uint32_t default_tbstats_flag;
 
+uint64_t dev_time;
+
 struct jit_profile_info {
     uint64_t translations;
     uint64_t aborted;
diff --git a/include/qemu/timer.h b/include/qemu/timer.h
index ee071e07d1..d86fc73a17 100644
--- a/include/qemu/timer.h
+++ b/include/qemu/timer.h
@@ -995,7 +995,7 @@ static inline int64_t profile_getclock(void)
     return get_clock();
 }
 
-extern int64_t dev_time;
+extern uint64_t dev_time;
 #endif
 
 #endif
-- 
2.25.1


