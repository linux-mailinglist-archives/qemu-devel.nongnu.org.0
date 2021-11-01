Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7762444150B
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:09:24 +0100 (CET)
Received: from localhost ([::1]:49786 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSNf-0002zH-Kl
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:09:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32776)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSK2-0003Vb-IH
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:38 -0400
Received: from mga14.intel.com ([192.55.52.115]:3675)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSK0-0004O6-Ln
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:38 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="231231355"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="231231355"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 01:05:35 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488541619"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 01:05:32 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v2 5/7] Removed the qemu_fclose() in
 colo_process_incoming_thread
Date: Mon,  1 Nov 2021 15:57:03 +0800
Message-Id: <1635753425-11756-6-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.115; envelope-from=lei.rao@intel.com;
 helo=mga14.intel.com
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
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

After the live migration, the related fd will be cleanup in
migration_incoming_state_destroy(). So, the qemu_close()
in colo_process_incoming_thread is not necessary.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 907241ab5c..71fc82a040 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -919,11 +919,6 @@ out:
     /* Hope this not to be too long to loop here */
     qemu_sem_wait(&mis->colo_incoming_sem);
     qemu_sem_destroy(&mis->colo_incoming_sem);
-    /* Must be called after failover BH is completed */
-    if (mis->to_src_file) {
-        qemu_fclose(mis->to_src_file);
-        mis->to_src_file = NULL;
-    }
 
     rcu_unregister_thread();
     return NULL;
-- 
2.30.2


