Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id EF60D3AA940
	for <lists+qemu-devel@lfdr.de>; Thu, 17 Jun 2021 04:57:59 +0200 (CEST)
Received: from localhost ([::1]:41030 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ltiEB-0003Kq-2K
	for lists+qemu-devel@lfdr.de; Wed, 16 Jun 2021 22:57:59 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37470)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAb-0003Rm-I6
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:17 -0400
Received: from mga02.intel.com ([134.134.136.20]:12080)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1ltiAW-0000WF-8H
 for qemu-devel@nongnu.org; Wed, 16 Jun 2021 22:54:17 -0400
IronPort-SDR: bLHgxVLaxY6IjAXUhryxHK7/wdUYJpefBB35+NoA7J90rUP6/a79YDZKVjIcvnsIZBWwxkABxI
 jAKNzWxhY2Ow==
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="193414092"
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="193414092"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2021 19:54:10 -0700
IronPort-SDR: 8V5XrbXKSKf/yNBj5igBXZvG6SM3Safgj0GJNfUBgCu7SkZcOr6gqG1JcThSAMB3X9mX/J1H7o
 mnr7xS9MVdwQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,278,1616482800"; d="scan'208";a="485121984"
Received: from unknown (HELO localhost.localdomain.bj.intel.com)
 ([10.238.157.59])
 by orsmga001.jf.intel.com with ESMTP; 16 Jun 2021 19:54:07 -0700
From: Lei Rao <lei.rao@intel.com>
To: chen.zhang@intel.com, lizhijian@cn.fujitsu.com, jasowang@redhat.com,
 zhang.zhanghailiang@huawei.com, quintela@redhat.com, dgilbert@redhat.com,
 lukasstraub2@web.de
Subject: [PATCH 4/7] colo: fixed 'Segmentation fault' when the simplex mode
 PVM poweroff
Date: Thu, 17 Jun 2021 10:47:12 +0800
Message-Id: <1623898035-18533-5-git-send-email-lei.rao@intel.com>
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
 qemu-devel@nongnu.org, Like Xu <like.xu@linux.intel.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

When a PVM completed its SVM failover steps and begins to run in
the simplex mode, QEMU would encounter a 'Segmentation fault' if
the guest poweroff with the following calltrace:

Program received signal SIGSEGV, Segmentation fault.

This is because primary_vm_do_failover() would call "qemu_file_shutdown
(s->rp_state.from_dst_file);" and later the migration_shutdown() would
do it again. So, we should set the s->rp_state.from_dst_file to NULL.

Signed-off-by: Like Xu <like.xu@linux.intel.com>
Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 616dc00..c25e488 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -156,14 +156,15 @@ static void primary_vm_do_failover(void)
 
     /*
      * Wake up COLO thread which may blocked in recv() or send(),
-     * The s->rp_state.from_dst_file and s->to_dst_file may use the
-     * same fd, but we still shutdown the fd for twice, it is harmless.
+     * The s->to_dst_file may use the same fd, but we still shutdown
+     * the fd for twice, it is harmless.
      */
     if (s->to_dst_file) {
         qemu_file_shutdown(s->to_dst_file);
     }
     if (s->rp_state.from_dst_file) {
         qemu_file_shutdown(s->rp_state.from_dst_file);
+        s->rp_state.from_dst_file = NULL;
     }
 
     old_state = failover_set_state(FAILOVER_STATUS_ACTIVE,
-- 
1.8.3.1


