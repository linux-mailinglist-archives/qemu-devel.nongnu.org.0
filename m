Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 1347934137B
	for <lists+qemu-devel@lfdr.de>; Fri, 19 Mar 2021 04:33:17 +0100 (CET)
Received: from localhost ([::1]:52918 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lN5sy-0002cq-2N
	for lists+qemu-devel@lfdr.de; Thu, 18 Mar 2021 23:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34106)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5qy-0000uo-97
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:12 -0400
Received: from mga12.intel.com ([192.55.52.136]:34596)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lN5qv-00030p-58
 for qemu-devel@nongnu.org; Thu, 18 Mar 2021 23:31:11 -0400
IronPort-SDR: WO4D9gFL+XiXyOGWLg2z3Ts3P7eM12Vy2MqLD+9fqD5LiXbJ52vPovS4MpiHWPihZPzO5gDe56
 dtTCj2UvsAzg==
X-IronPort-AV: E=McAfee;i="6000,8403,9927"; a="169117133"
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="169117133"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Mar 2021 20:31:08 -0700
IronPort-SDR: RLYiOFYiWWAg/OUwMylHbUBB9V3ha0v8CQw0ANhvfHbNMFTXingT071b0/2WHyY4/j1UVm3HfH
 K6ZNthChi6EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,259,1610438400"; d="scan'208";a="606448973"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga005.fm.intel.com with ESMTP; 18 Mar 2021 20:31:05 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v3 07/10] Reset the auto-converge counter at every checkpoint.
Date: Fri, 19 Mar 2021 11:07:45 +0800
Message-Id: <1616123268-89517-8-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
References: <1616123268-89517-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.136; envelope-from=lei.rao@intel.com;
 helo=mga12.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
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
---
 migration/colo.c |  4 ++++
 migration/ram.c  | 10 ++++++++++
 migration/ram.h  |  1 +
 3 files changed, 15 insertions(+)

diff --git a/migration/colo.c b/migration/colo.c
index 1aaf316..723ffb8 100644
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
index 72143da..e795a8d 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -652,6 +652,16 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
     }
 }
 
+void mig_throttle_counter_reset(void)
+{
+    RAMState *rs = ram_state;
+
+    rs->time_last_bitmap_sync = qemu_clock_get_ms(QEMU_CLOCK_REALTIME);
+    rs->num_dirty_pages_period = 0;
+    rs->bytes_xfer_prev = ram_counters.transferred;
+    cpu_throttle_stop();
+}
+
 /**
  * xbzrle_cache_zero_page: insert a zero page in the XBZRLE cache
  *
diff --git a/migration/ram.h b/migration/ram.h
index 6378bb3..3f78175 100644
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


