Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A56C5BC5E4
	for <lists+qemu-devel@lfdr.de>; Mon, 19 Sep 2022 11:57:29 +0200 (CEST)
Received: from localhost ([::1]:55074 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oaDWq-0005eC-NW
	for lists+qemu-devel@lfdr.de; Mon, 19 Sep 2022 05:57:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54558)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oaDHA-0003cj-6q
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:41:16 -0400
Received: from mga14.intel.com ([192.55.52.115]:34588)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1oaDH7-0006ST-5k
 for qemu-devel@nongnu.org; Mon, 19 Sep 2022 05:41:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1663580473; x=1695116473;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=v9z23O3MmbIAjZcPfd+/R/pBmVPmjCX1J44nBACW9cE=;
 b=PwQs4OmwvaxxG/56e8DuDueo5khAQjereDdcIf/LyPK2hmfjriiBqJYJ
 sugZdkycjk2peHSwAB4yMpja8mavbbUqTbGik45gKU356P5/zDp/X3QTE
 MM3wG3KAwHHiCDoRdAJcePQu1TGy4fuDt6slzQrzlRvxA1CU2OsuG050G
 IGI+fMI6pyyMIGyRj8ksNeQiKvOjZZZZ/RRFOCwEnvYLGPPy8coloOqXh
 bKto6CbOmbtYRQBIkGiG8VY54X4D/5UcP2V4hQ8DETfcPFX+ruRs1GRHv
 aohQI9XO1UD4UzUX8jn1Vt/AIXIygdabP7kqahpsViKXNIKcuvREU4jXb A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10474"; a="299345701"
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="299345701"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 02:41:09 -0700
X-IronPort-AV: E=Sophos;i="5.93,327,1654585200"; d="scan'208";a="680780299"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Sep 2022 02:41:08 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH] migration: Fix a potential guest memory corruption
Date: Mon, 19 Sep 2022 17:32:37 +0800
Message-Id: <20220919093237.2219892-1-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.115;
 envelope-from=zhenzhong.duan@intel.com; helo=mga14.intel.com
X-Spam_score_int: -70
X-Spam_score: -7.1
X-Spam_bar: -------
X-Spam_report: (-7.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_HI=-5, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Imagine a rare case, after a dirty page is sent to compression threads's
ring, dirty bitmap sync trigger right away and mark the same page dirty
again and sent. Then the new page may be overwriten by stale page in
compression threads's ring in the destination.

So we need to ensure there is only one copy of the same dirty page either
by flushing the ring after every bitmap sync or avoiding processing same
dirty page continuously.

I choose the 2nd which avoids the time consuming flush operation.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 migration/ram.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index dc1de9ddbc68..67b2035586bd 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -1551,7 +1551,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
     pss->postcopy_requested = false;
     pss->postcopy_target_channel = RAM_CHANNEL_PRECOPY;
 
-    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page);
+    pss->page = migration_bitmap_find_dirty(rs, pss->block, pss->page + 1);
     if (pss->complete_round && pss->block == rs->last_seen_block &&
         pss->page >= rs->last_page) {
         /*
@@ -1564,7 +1564,7 @@ static bool find_dirty_block(RAMState *rs, PageSearchStatus *pss, bool *again)
     if (!offset_in_ramblock(pss->block,
                             ((ram_addr_t)pss->page) << TARGET_PAGE_BITS)) {
         /* Didn't find anything in this RAM Block */
-        pss->page = 0;
+        pss->page = -1;
         pss->block = QLIST_NEXT_RCU(pss->block, next);
         if (!pss->block) {
             /*
@@ -2694,7 +2694,7 @@ static void ram_state_reset(RAMState *rs)
 {
     rs->last_seen_block = NULL;
     rs->last_sent_block = NULL;
-    rs->last_page = 0;
+    rs->last_page = -1;
     rs->last_version = ram_list.version;
     rs->xbzrle_enabled = false;
     postcopy_preempt_reset(rs);
@@ -2889,7 +2889,7 @@ void ram_postcopy_send_discard_bitmap(MigrationState *ms)
     /* Easiest way to make sure we don't resume in the middle of a host-page */
     rs->last_seen_block = NULL;
     rs->last_sent_block = NULL;
-    rs->last_page = 0;
+    rs->last_page = -1;
 
     postcopy_each_ram_send_discard(ms);
 
-- 
2.25.1


