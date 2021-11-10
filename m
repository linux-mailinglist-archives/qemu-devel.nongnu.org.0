Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EE7F44BD44
	for <lists+qemu-devel@lfdr.de>; Wed, 10 Nov 2021 09:47:13 +0100 (CET)
Received: from localhost ([::1]:53234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mkjGB-0002Pe-UE
	for lists+qemu-devel@lfdr.de; Wed, 10 Nov 2021 03:47:11 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37664)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkjF1-0001Bm-Ow
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:45:59 -0500
Received: from mga06.intel.com ([134.134.136.31]:28905)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mkjEy-0004ri-Vg
 for qemu-devel@nongnu.org; Wed, 10 Nov 2021 03:45:59 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10163"; a="293459868"
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="293459868"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2021 00:45:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,223,1631602800"; d="scan'208";a="533980321"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga001.jf.intel.com with ESMTP; 10 Nov 2021 00:45:51 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH 2/2] migration/ram.c: Remove the qemu_mutex_lock in
 colo_flush_ram_cache.
Date: Wed, 10 Nov 2021 16:37:36 +0800
Message-Id: <1636533456-5374-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
References: <1636533456-5374-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.31; envelope-from=lei.rao@intel.com;
 helo=mga06.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

The code to acquire bitmap_mutex is added in the commit of
"63268c4970a5f126cc9af75f3ccb8057abef5ec0". There is no
need to acquire bitmap_mutex in colo_flush_ram_cache(). This
is because the colo_flush_ram_cache only be called on the COLO
secondary VM, which is the destination side.
On the COLO secondary VM, only the COLO thread will touch
the bitmap of ram cache.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/ram.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/migration/ram.c b/migration/ram.c
index 863035d..2c688f5 100644
--- a/migration/ram.c
+++ b/migration/ram.c
@@ -3918,7 +3918,6 @@ void colo_flush_ram_cache(void)
     unsigned long offset = 0;
 
     memory_global_dirty_log_sync();
-    qemu_mutex_lock(&ram_state->bitmap_mutex);
     WITH_RCU_READ_LOCK_GUARD() {
         RAMBLOCK_FOREACH_NOT_IGNORED(block) {
             ramblock_sync_dirty_bitmap(ram_state, block);
@@ -3954,7 +3953,6 @@ void colo_flush_ram_cache(void)
         }
     }
     trace_colo_flush_ram_cache_end();
-    qemu_mutex_unlock(&ram_state->bitmap_mutex);
 }
 
 /**
-- 
1.8.3.1


