Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B481A39EFD0
	for <lists+qemu-devel@lfdr.de>; Tue,  8 Jun 2021 09:38:10 +0200 (CEST)
Received: from localhost ([::1]:48518 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lqWJN-0003eQ-RP
	for lists+qemu-devel@lfdr.de; Tue, 08 Jun 2021 03:38:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51670)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFM-00039R-HA
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:34:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:55860)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lqWFK-0005Bl-Sj
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 03:34:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623137637;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vI/v1vJhwHUv3ayb0ieVDpXi6kMQ53a/rw7SR748b9U=;
 b=D5q7jbQtvQ5srXIJZtImn0xASwaPUU3uZuihyh53sXMvH0zLJhQctY5eDJJ0uqKrSqtlPz
 n5skDHOov8I4PjrPnhbyRvflD9w5SSfdlYaBn/7AOTSgTtlCb/sCviZvHZOhWOVsW3RpFW
 Z6wRmR3ezqBQo853H+lHHCOO3ZF650k=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-272-lXIGh390MK-W0dio3Sl3RQ-1; Tue, 08 Jun 2021 03:33:56 -0400
X-MC-Unique: lXIGh390MK-W0dio3Sl3RQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B649080F042;
 Tue,  8 Jun 2021 07:33:55 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-225.ams2.redhat.com
 [10.36.113.225])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 84A91608BA;
 Tue,  8 Jun 2021 07:33:53 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v3 3/5] block-copy: move progress_set_remaining in
 block_copy_task_end
Date: Tue,  8 Jun 2021 09:33:42 +0200
Message-Id: <20210608073344.53637-4-eesposit@redhat.com>
In-Reply-To: <20210608073344.53637-1-eesposit@redhat.com>
References: <20210608073344.53637-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.2,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-devel@nongnu.org,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Moving this function in task_end ensures to update the progress
anyways, even if there is an error.

It also helps in next patch, allowing task_end to have only
one critical section.

Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index b3533a3003..e2adb5b2ea 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -263,6 +263,9 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
     }
     QLIST_REMOVE(task, list);
+    progress_set_remaining(task->s->progress,
+                           bdrv_get_dirty_count(task->s->copy_bitmap) +
+                           task->s->in_flight_bytes);
     qemu_co_queue_restart_all(&task->wait_queue);
 }
 
@@ -647,9 +650,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
         }
         if (s->skip_unallocated && !(ret & BDRV_BLOCK_ALLOCATED)) {
             block_copy_task_end(task, 0);
-            progress_set_remaining(s->progress,
-                                   bdrv_get_dirty_count(s->copy_bitmap) +
-                                   s->in_flight_bytes);
             trace_block_copy_skip_range(s, task->offset, task->bytes);
             offset = task_end(task);
             bytes = end - offset;
-- 
2.30.2


