Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6AE475700
	for <lists+qemu-devel@lfdr.de>; Wed, 15 Dec 2021 11:57:03 +0100 (CET)
Received: from localhost ([::1]:60502 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mxRy2-0000M4-RL
	for lists+qemu-devel@lfdr.de; Wed, 15 Dec 2021 05:57:02 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39114)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRav-0003t0-OV
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:33:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32166)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <quintela@redhat.com>)
 id 1mxRat-0007OP-B7
 for qemu-devel@nongnu.org; Wed, 15 Dec 2021 05:33:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1639564386;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lhLHBVnrBgjWy1Oe70JIm3oFvnrlvx9QVzfbhdnZThs=;
 b=X58qmVq3d1r3wYiN13wNtIgVLCIMvoNEb5Nddb20nemwK7u8gzxSkXTMIW8C4tWakh5zsv
 qMSU68V2Rsl7QB7AWg1iYKtZSQHMvxOqtRYL7UTSwb/ZWYv8refX6SLIFnNVxKQgIZpHKr
 +4UBR6QgocEAIjeeoeh9WLcSajrYu98=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-ld_gjcVhNuOUlZ-oqczpgw-1; Wed, 15 Dec 2021 05:32:58 -0500
X-MC-Unique: ld_gjcVhNuOUlZ-oqczpgw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 76C51801962;
 Wed, 15 Dec 2021 10:32:57 +0000 (UTC)
Received: from secure.mitica (unknown [10.39.192.37])
 by smtp.corp.redhat.com (Postfix) with ESMTP id CC4016E978;
 Wed, 15 Dec 2021 10:32:55 +0000 (UTC)
From: Juan Quintela <quintela@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 16/18] COLO: Move some trace code behind
 qemu_mutex_unlock_iothread()
Date: Wed, 15 Dec 2021 11:32:16 +0100
Message-Id: <20211215103218.17527-17-quintela@redhat.com>
In-Reply-To: <20211215103218.17527-1-quintela@redhat.com>
References: <20211215103218.17527-1-quintela@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=quintela@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=quintela@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.719,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Hailiang Zhang <zhang.zhanghailiang@huawei.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, "Rao, Lei" <lei.rao@intel.com>,
 Juan Quintela <quintela@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: "Rao, Lei" <lei.rao@intel.com>

There is no need to put some trace code in the critical section.
So, moving it behind qemu_mutex_unlock_iothread() can reduce the
lock time.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Reviewed-by: Juan Quintela <quintela@redhat.com>
Signed-off-by: Juan Quintela <quintela@redhat.com>
---
 migration/colo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/migration/colo.c b/migration/colo.c
index 4a772afe78..5f7071b3cd 100644
--- a/migration/colo.c
+++ b/migration/colo.c
@@ -680,8 +680,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
 
     qemu_mutex_lock_iothread();
     vm_stop_force_state(RUN_STATE_COLO);
-    trace_colo_vm_state_change("run", "stop");
     qemu_mutex_unlock_iothread();
+    trace_colo_vm_state_change("run", "stop");
 
     /* FIXME: This is unnecessary for periodic checkpoint mode */
     colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_REPLY,
@@ -783,8 +783,8 @@ static void colo_incoming_process_checkpoint(MigrationIncomingState *mis,
 
     vmstate_loading = false;
     vm_start();
-    trace_colo_vm_state_change("stop", "run");
     qemu_mutex_unlock_iothread();
+    trace_colo_vm_state_change("stop", "run");
 
     if (failover_get_state() == FAILOVER_STATUS_RELAUNCH) {
         return;
@@ -887,8 +887,8 @@ void *colo_process_incoming_thread(void *opaque)
         abort();
 #endif
     vm_start();
-    trace_colo_vm_state_change("stop", "run");
     qemu_mutex_unlock_iothread();
+    trace_colo_vm_state_change("stop", "run");
 
     colo_send_message(mis->to_src_file, COLO_MESSAGE_CHECKPOINT_READY,
                       &local_err);
-- 
2.33.1


