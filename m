Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 71E24473A20
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Dec 2021 02:21:58 +0100 (CET)
Received: from localhost ([::1]:50716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mwwVx-0003SM-3F
	for lists+qemu-devel@lfdr.de; Mon, 13 Dec 2021 20:21:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54932)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mwwUH-0002l0-HU
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 20:20:13 -0500
Received: from mga17.intel.com ([192.55.52.151]:51817)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>) id 1mwwUE-00040I-Uy
 for qemu-devel@nongnu.org; Mon, 13 Dec 2021 20:20:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639444810; x=1670980810;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=fbjQZrGEb3Emvkaigy3Cy+WkEWBnqMHKEvohWL1vFf4=;
 b=eQCKiIpRvX5KM3hU/lYG2YnRglFVj9SYs7VdphOwpBP4rwTK4bF+3nU4
 KqxCnUegBgsg3rYOK6rlEfKi4n8Dq0qiXisMeq65zXP/O467nNI3Em3s2
 7f71FVZ5KGw7ZbZUTrnsz6PiguYcrsu/DWpfmolOrCU6No+uyZjKEr9Qi
 0r0nLVvhiqvBsP+0GQyqfge3VKx4cDpJZodJA++UJyXq189PInjuLMLUN
 syWm0EN8oZn3TAStRT54Jnc4jRARZ7TDyHoQlR7LQmCaJqGA79zzuRVQG
 j2xSx5op270wKcwDurGoSTj2fwX3qRv8S7pGRhp2gMVlrbFOEkQhWZIGP Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10197"; a="219553960"
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="219553960"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2021 17:20:06 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,204,1635231600"; d="scan'208";a="464868819"
Received: from unknown (HELO leirao-pc.bj.intel.com) ([10.238.156.139])
 by orsmga006.jf.intel.com with ESMTP; 13 Dec 2021 17:20:04 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com,
	quintela@redhat.com,
	dgilbert@redhat.com
Subject: [PATCH v2] COLO: Move some trace code behind
 qemu_mutex_unlock_iothread()
Date: Wed, 15 Dec 2021 01:19:45 +0800
Message-Id: <20211214171945.217843-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.151; envelope-from=lei.rao@intel.com;
 helo=mga17.intel.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, DATE_IN_FUTURE_12_24=3.199,
 DKIMWL_WL_HIGH=-0.713, DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1,
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

There is no need to put some trace code in the critical section.
So, moving it behind qemu_mutex_unlock_iothread() can reduce the
lock time.

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


