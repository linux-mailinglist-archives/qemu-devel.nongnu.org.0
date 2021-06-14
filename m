Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A6BB3A5DC7
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 09:37:26 +0200 (CEST)
Received: from localhost ([::1]:41774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsh9x-0002Su-HU
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 03:37:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35208)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsh6t-0005aT-UV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:34:16 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27565)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsh6p-00052u-UM
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:34:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623656051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=bIie6F9dWto4e5Jw17Q4JRM5sd51ihjSQQl1VCmyr6k=;
 b=XfSZf7NZveGOdlCA1mvnOOextD1O1PmKUV4VWCSNNjAc7iphjfsaNEiNYDFHSzkJb0XqY0
 ayhjNmY9oX3hSKOmfZxkxuLtlAS6Z82qiMBtjl1A9esqkD7Bkj5R2FUlxwLbQ+rivQEpwi
 X4Jb7tcQX2bJxmxEDPG6S9O5vnzQFrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-529-vs7Xg0o7Nryecva-n2_xcQ-1; Mon, 14 Jun 2021 03:34:09 -0400
X-MC-Unique: vs7Xg0o7Nryecva-n2_xcQ-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A2BA91850600;
 Mon, 14 Jun 2021 07:34:08 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 903335D6A8;
 Mon, 14 Jun 2021 07:34:06 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 4/6] block-copy: move progress_set_remaining in
 block_copy_task_end
Date: Mon, 14 Jun 2021 09:33:48 +0200
Message-Id: <20210614073350.17048-5-eesposit@redhat.com>
In-Reply-To: <20210614073350.17048-1-eesposit@redhat.com>
References: <20210614073350.17048-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.199,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=-0.01, RCVD_IN_MSPIKE_WL=-0.01,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
index 5ff7764e87..afa2f484f0 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -261,6 +261,9 @@ static void coroutine_fn block_copy_task_end(BlockCopyTask *task, int ret)
         bdrv_set_dirty_bitmap(task->s->copy_bitmap, task->offset, task->bytes);
     }
     QLIST_REMOVE(task, list);
+    progress_set_remaining(task->s->progress,
+                           bdrv_get_dirty_count(task->s->copy_bitmap) +
+                           task->s->in_flight_bytes);
     qemu_co_queue_restart_all(&task->wait_queue);
 }
 
@@ -651,9 +654,6 @@ block_copy_dirty_clusters(BlockCopyCallState *call_state)
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
2.31.1


