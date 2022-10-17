Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F953600878
	for <lists+qemu-devel@lfdr.de>; Mon, 17 Oct 2022 10:13:47 +0200 (CEST)
Received: from localhost ([::1]:44290 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1okLFq-0003ux-8r
	for lists+qemu-devel@lfdr.de; Mon, 17 Oct 2022 04:13:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59570)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1okL5X-0005i9-Qo
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:03:12 -0400
Received: from mga18.intel.com ([134.134.136.126]:53117)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <zhenzhong.duan@intel.com>)
 id 1okL5V-0006oT-2o
 for qemu-devel@nongnu.org; Mon, 17 Oct 2022 04:03:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665993785; x=1697529785;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OkPyWkfU9eQjTDrvU7iF3wCSQxL9KvvKhWzAtV3NB4w=;
 b=mKM1vTu4NnuBS2EEcGuQms1wLHSvXwvIu1uoitLbRpe+fZTaRJbrOO0S
 x0Jf95K3HF6OolnDN0v4sqj+9jqc/mZbNFP8ylKIVJzYK3WowQp8Kaw0+
 Uxpth0hyxa9cl41BwbwbOkTN5VKSj/SlXFB1C1iTj7PIu5EoaBOJhJudF
 mx9t93Zl7A/63KC5DU30dzgDJ3puc1EGuPUgJBOpPeTx3pJLJza7YbEYx
 cc3oKlw73sODo+mWZahgi1XW4QdpaX5aSwyzjaLLVcyZIL0IS7I2dA3r0
 GL4NSXIU7H5hOHJRPuSbs2YLSr+6Lzzb1LbD01c1pO5j/7jrpYc9GUEts Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="289024593"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="289024593"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 01:03:02 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10502"; a="630595702"
X-IronPort-AV: E=Sophos;i="5.95,190,1661842800"; d="scan'208";a="630595702"
Received: from duan-server-s2600bt.bj.intel.com ([10.240.192.143])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2022 01:03:01 -0700
From: Zhenzhong Duan <zhenzhong.duan@intel.com>
To: qemu-devel@nongnu.org
Cc: quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH 2/2] multifd: Fix flush of zero copy page send request
Date: Mon, 17 Oct 2022 15:53:51 +0800
Message-Id: <20221017075351.2974642-2-zhenzhong.duan@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221017075351.2974642-1-zhenzhong.duan@intel.com>
References: <20221017075351.2974642-1-zhenzhong.duan@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126;
 envelope-from=zhenzhong.duan@intel.com; helo=mga18.intel.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.256,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Make IO channel flush call after the inflight request has been drained
in multifd thread, or else we may missed to flush the inflight request.

Signed-off-by: Zhenzhong Duan <zhenzhong.duan@intel.com>
---
 migration/multifd.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/migration/multifd.c b/migration/multifd.c
index 36e2139995cf..1e01873128f6 100644
--- a/migration/multifd.c
+++ b/migration/multifd.c
@@ -618,6 +618,12 @@ int multifd_send_sync_main(QEMUFile *f)
         ram_counters.transferred += p->packet_len;
         qemu_mutex_unlock(&p->mutex);
         qemu_sem_post(&p->sem);
+    }
+    for (i = 0; i < migrate_multifd_channels(); i++) {
+        MultiFDSendParams *p = &multifd_send_state->params[i];
+
+        trace_multifd_send_sync_main_wait(p->id);
+        qemu_sem_wait(&p->sem_sync);
 
         if (flush_zero_copy && p->c) {
             int ret;
@@ -632,12 +638,6 @@ int multifd_send_sync_main(QEMUFile *f)
             }
         }
     }
-    for (i = 0; i < migrate_multifd_channels(); i++) {
-        MultiFDSendParams *p = &multifd_send_state->params[i];
-
-        trace_multifd_send_sync_main_wait(p->id);
-        qemu_sem_wait(&p->sem_sync);
-    }
     trace_multifd_send_sync_main(multifd_send_state->packet_num);
 
     return 0;
-- 
2.25.1


