Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C2AF3AA933
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:55:40 +0200 (CEST)
Received: from localhost ([::1]:60092 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiBv-0005cr-GG
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:55:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37530)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAk-0003Zv-Tz
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:26 -0400
Received: from mga02.intel.com ([134.134.136.20]:12085)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAY-0000Yo-On
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:26 -0400
IronPort-SDR: +9Lprl/cebPdlpkzmcYtTaBIw8nJqyRTYX9xisL95y+dBf5h7DRhVIelfSD3g8MJhYfr+uwtoH
 7+Jj7CjmzCLA==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414095"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414095"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:54:13 -0700
IronPort-SDR: rSJPXVuu+SCD/waiHj0I0/14nN3XuKv3e0jkbcR+tkHm+QLZZiBZZ8FO5rHMgkSxfwcXfibKmq
 1j5MMu/5+CBg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485121991"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:54:11 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 5/7] Removed the qemu_fclose() in colo_process_incoming_thread
Date: Thu, 17 Jun 2021 10:47:13 +0800
Message-Id: <1623898035-18533-6-git-send-email-lei.rao@intel.com>
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

After the live migration, the related fd will be cleanup in
migration_incoming_state_destroy(). So, the qemu_close()
in colo_process_incoming_thread is not necessary.

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index c25e488..e2ab349 100644
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
1.8.3.1


