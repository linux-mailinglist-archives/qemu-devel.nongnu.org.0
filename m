Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7914414F5
	for <lists+qemu-devel@lfdr.de>; Mon,  1 Nov 2021 09:07:16 +0100 (CET)
Received: from localhost ([::1]:41460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhSLa-0005uX-G9
	for lists+qemu-devel@lfdr.de; Mon, 01 Nov 2021 04:07:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60904)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJs-0003BJ-2q
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:46959)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mhSJl-0004Gy-M9
 for qemu-devel@nongnu.org; Mon, 01 Nov 2021 04:05:26 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10154"; a="228421360"
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="228421360"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Nov 2021 01:05:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,198,1631602800"; d="scan'208";a="488541503"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.156.105])
 by orsmga007.jf.intel.com with ESMTP; 01 Nov 2021 01:05:13 -0700
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, lukasstraub2@web.de,
 dgilbert@redhat.com
Subject: [PATCH v2 1/7] Some minor optimizations for COLO
Date: Mon,  1 Nov 2021 15:56:59 +0800
Message-Id: <1635753425-11756-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
References: <1635753425-11756-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=192.55.52.93; envelope-from=lei.rao@intel.com;
 helo=mga11.intel.com
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

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Dr. David Alan Gilbert <dgilbert@redhat.com>
---
 migration/colo.c   | 2 +-
 net/colo-compare.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 79fa1f6619..616dc00af7 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -152,7 +152,7 @@ static void primary_vm_do_failover(void)
      * kick COLO thread which might wait at
      * qemu_sem_wait(&s->colo_checkpoint_sem).
      */
-    colo_checkpoint_notify(migrate_get_current());
+    colo_checkpoint_notify(s);
 
     /*
      * Wake up COLO thread which may blocked in recv() or send(),
diff --git a/net/colo-compare.c b/net/colo-compare.c
index b100e7b51f..4a64a5d386 100644
--- a/net/colo-compare.c
+++ b/net/colo-compare.c
@@ -170,7 +170,7 @@ static bool packet_matches_str(const char *str,
         return false;
     }
 
-    return !memcmp(str, buf, strlen(str));
+    return !memcmp(str, buf, packet_len);
 }
 
 static void notify_remote_frame(CompareState *s)
-- 
2.30.2


