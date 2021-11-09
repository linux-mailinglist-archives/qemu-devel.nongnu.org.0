Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5FE44A540
	for <lists+qemu-devel@lfdr.de>; Tue,  9 Nov 2021 04:14:54 +0100 (CET)
Received: from localhost ([::1]:36408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkHb3-0006xu-Cr
	for lists+qemu-devel@lfdr.de; Mon, 08 Nov 2021 22:14:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:49776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkHZk-0005aU-4v
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 22:13:32 -0500
Received: from mga07.intel.com ([134.134.136.100]:45864)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkHZh-0005I9-Eq
 for qemu-devel@nongnu.org; Mon, 08 Nov 2021 22:13:30 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10162"; a="295808364"
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="295808364"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2021 19:13:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,219,1631602800"; d="scan'208";a="491490332"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 08 Nov 2021 19:13:23 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 lukasstraub2@web.de, dgilbert@redhat.com
Subject: [PATCH v7 1/2] Reset the auto-converge counter at every checkpoint.
Date: Tue,  9 Nov 2021 11:04:54 +0800
Message-Id: <1636427095-11739-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
References: <1636427095-11739-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.100; envelope-from=lei.rao@intel.com;
 helo=mga07.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

if we don't reset the auto-converge counter,
it will continue to run with COLO running,
and eventually the system will hang due to the
CPU throttle reaching DEFAULT_MIGRATE_MAX_CPU_THROTTLE.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/colo.c | 4 ++++
 migration/ram.c  | 9 +++++++++
 migration/ram.h  | 1 +
 3 files changed, 14 insertions(+)

diff --git a/migration/colo.c b/migration/colo.c
index e3b1f13..2415325 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -459,6 +459,10 @@ static int colo_do_checkpoint_transaction(MigrationState *s,
     if (ret < 0) {
         goto out;
     }
+
+    if (migrate_auto_converge()) {
+        mig_throttle_counter_reset();
+    }
     /*
      * Only save VM's live state, which not including device state.
      * TODO: We may need a timeout mechanism to prevent COLO process
diff --git a/migration/ram.c b/migration/ram.c
index 847af46..d5f98e6 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -641,6 +641,15 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
     }
 }
 
+void mig_throttle_counter_reset(void)
+{
+    RAMState *rs = ram_state;
+
+    rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    rs->num_dirty_pages_period = 0;
+    rs->bytes_xfer_prev = ram_counters.transferred;
+}
+
 /**
  * xbzrle_cache_zero_page: insert a zero page in the XBZRLE cache
  *
diff --git a/migration/ram.h b/migration/ram.h
index dda1988..c515396 100644
--- a/migration/ram.h
+++ b/migration/ram.h
@@ -50,6 +50,7 @@ bool ramblock_is_ignored(RAMBlock *block);
 int xbzrle_cache_resize(uint64_t new_size, Error **errp);
 uint64_t ram_bytes_remaining(void);
 uint64_t ram_bytes_total(void);
+void mig_throttle_counter_reset(void);
 
 uint64_t ram_pagesize_summary(void);
 int ram_save_queue_pages(const char *rbname, ram_addr_t start, ram_addr_t len);
-- 
1.8.3.1


