Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FE203AA932
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:55:34 +0200 (CEST)
Received: from localhost ([::1]:59662 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiBp-0005L3-GP
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:55:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37418)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAV-0003NB-8T
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:11 -0400
Received: from mga02.intel.com ([134.134.136.20]:12080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAR-0000WF-4R
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:11 -0400
IronPort-SDR: 65gGfd1kQEoC1I+Nw1ODBhLSnrO8cebNuHKWoHm6z41SKw6hZLkmJWRUIUUJUTz/MdRruSWgju
 M5nKEUFEPzJg==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414073"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414073"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:53:59 -0700
IronPort-SDR: HzGyDcsrEos6HP8Fkf24V/WvQeIVvu1YvENReHsUfYxpmNSkI/J+ZRfcELzACw9+nGILHNrni4
 ipGkzwP1tx/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485121914"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:53:57 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 1/7] Some minor optimizations for COLO
Date: Thu, 17 Jun 2021 10:47:09 +0800
Message-Id: <1623898035-18533-2-git-send-email-lei.rao@intel.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
References: <1623898035-18533-1-git-send-email-lei.rao@intel.com>
Received-SPF: pass client-ip=134.134.136.20; envelope-from=lei.rao@intel.com;
 helo=mga02.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: like.xu.linux@gmail.com, "Rao, Lei" <lei.rao@intel.com>,
 qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c   | 2 +-
 net/colo-compare.c | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 79fa1f6..616dc00 100644
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
index b100e7b..4a64a5d 100644
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
1.8.3.1


