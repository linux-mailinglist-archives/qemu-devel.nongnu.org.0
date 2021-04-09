Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D52359363
	for <lists+qemu-devel@lfdr.de>; Fri,  9 Apr 2021 05:48:11 +0200 (CEST)
Received: from localhost ([::1]:52204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lUi7u-0001ky-Pb
	for lists+qemu-devel@lfdr.de; Thu, 08 Apr 2021 23:48:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52008)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2k-0003Tp-UV
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:50 -0400
Received: from mga05.intel.com ([192.55.52.43]:12420)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1lUi2i-0007T4-Ew
 for qemu-devel@nongnu.org; Thu, 08 Apr 2021 23:42:50 -0400
IronPort-SDR: uVkaCUTywj4LSQu2+NHz1Me/T9wopNd7btKs2GZQw9TXyyyzSm8Kw2b1DRbSOynST8OXH1xszG
 3Rfdhv86J2UQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9948"; a="278957347"
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="278957347"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2021 20:42:47 -0700
IronPort-SDR: F7mdidMqOUK9Gy8QdljmJLkGsObHGdaNnp6IE0kbngQe9FhucgkSJd21jT1qaTNTH6bVoiPKTY
 sxWkuCZh3t1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,208,1613462400"; d="scan'208";a="416081128"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.240.192.103])
 by fmsmga008.fm.intel.com with ESMTP; 08 Apr 2021 20:42:45 -0700
From: leirao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 quintela@redhat.com, dgilbert@redhat.com, pbonzini@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH v6 07/10] Reset the auto-converge counter at every checkpoint.
Date: Thu,  8 Apr 2021 23:20:53 -0400
Message-Id: <1617938456-315058-8-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
References: <1617938456-315058-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
Reviewed-by: Lukas Straub <lukasstraub2@web.de>
Tested-by: Lukas Straub <lukasstraub2@web.de>
---
 migration/colo.c | 4 ++++
 migration/ram.c  | 9 +++++++++
 migration/ram.h  | 1 +
 3 files changed, 14 insertions(+)

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
index 4682f36..f9d60f0 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -652,6 +652,15 @@ static void mig_throttle_guest_down(uint64_t bytes_dirty_period,
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
index 4833e9f..cb6f58a 100644
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


