Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 27F0B46FA98
	for <lists+qemu-devel@lfdr.de>; Fri, 10 Dec 2021 07:17:49 +0100 (CET)
Received: from localhost ([::1]:57488 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mvZE3-0001yq-PW
	for lists+qemu-devel@lfdr.de; Fri, 10 Dec 2021 01:17:47 -0500
Received: from eggs.gnu.org ([209.51.188.92]:34956)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mvZBQ-00010M-FF
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:15:04 -0500
Received: from mga05.intel.com ([192.55.52.43]:12530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mvZBN-0007Gx-F7
 for qemu-devel@nongnu.org; Fri, 10 Dec 2021 01:15:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639116901; x=1670652901;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rBSiC4iRoQKGtjtmD7AQBEmc1JcX6byiC0AnDlaWVi4=;
 b=JDoDfF8ePscNPujoiC2cc8c/YU4KHQ9VfsXoXe7N1J6aRYS+u7cLQX8r
 lw2zp9bZkD6iWKYPUk0Wubtp3CDKdaVutOB650KNid05h0qJPvobaRew8
 Xer41ZUw2KWJOgpge2L7/CJy3G45PZ/oIANtG6yq2J2bYTXdw6s1bIaEh
 kEh6jCDK0AFUP5t1RnoHQkhuisV4d3NCMYjultxGJYU3uWsZN20UvIU1n
 OU8v59Y6EXJupFW5jWN/4HSRCUa34MRhsnzQQDTResrG0+Iq5P8VGWXjL
 pa0tTmq59wT/2D4RWYRP73wqVXCHNUtnyVUvzqOXK4Jb6TjVE2sxXfMcx A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10193"; a="324546513"
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="324546513"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Dec 2021 22:14:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,194,1635231600"; d="scan'208";a="612822670"
Received: from unknown (HELO leirao-pc.bj.intel.com) ([10.238.156.139])
 by orsmga004.jf.intel.com with ESMTP; 09 Dec 2021 22:14:53 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, zhang.zhanghailiang@huawei.com, quintela@redhat.com,
 dgilbert@redhat.com
Subject: [PATCH] COLO: Move some trace code behind qemu_mutex_unlock_iothread()
Date: Sat, 11 Dec 2021 06:14:35 +0800
Message-Id: <20211210221435.142472-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -17
X-Spam_score: -1.8
X-Spam_bar: -
X-Spam_report: (-1.8 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 DKIMWL_WL_HIGH=-0.619, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
 DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001,
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

Signed-off-by: Lei Rao <lei.rao@intel.com>
---
 migration/colo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 2415325262..3ccacb29c8 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -683,8 +683,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
 
     qemu_mutex_lock_iothread();
     vm_stop_force_state(RUN_STATE_COLO);
-    trace_colo_vm_state_change("run", "stop");
     qemu_mutex_unlock_iothread();
+    trace_colo_vm_state_change("run", "stop");
 
     /* FIXME: This is unnecessary for periodic checkpoint mode */
     colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_REPLY,
@@ -786,8 +786,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
 
     vmstate_loading = false;
     vm_start();
-    trace_colo_vm_state_change("stop", "run");
     qemu_mutex_unlock_iothread();
+    trace_colo_vm_state_change("stop", "run");
 
     if (failover_get_state() == FAILOVER_STATUS_RELAUNCH) {
         return;
@@ -870,8 +870,8 @@ void *colo_process_incoming_thread(void *opaque)
         abort();
 #endif
     vm_start();
-    trace_colo_vm_state_change("stop", "run");
     qemu_mutex_unlock_iothread();
+    trace_colo_vm_state_change("stop", "run");
 
     colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
                       &local_err);
-- 
2.32.0


