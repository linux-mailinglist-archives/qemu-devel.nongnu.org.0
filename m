Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D5323655EB
	for <lists+qemu-devel@lfdr.de>; Tue, 20 Apr 2021 12:09:48 +0200 (CEST)
Received: from localhost ([::1]:57964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lYnKF-00081B-KW
	for lists+qemu-devel@lfdr.de; Tue, 20 Apr 2021 06:09:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46042)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYnFG-0003Kk-DK
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:04:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43474)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lYnF7-0001mt-Lv
 for qemu-devel@nongnu.org; Tue, 20 Apr 2021 06:04:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618913069;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=T/My3AtkkpcT9ANcA2UNoa81j7RQLAySsD3JTR+u7XY=;
 b=A/yq6aqVh4XIb+7tvuVDzZwtp4GKvSy+yET0J6gA+5Y7PcX879g1KZqxNPJXrQp7D95bq3
 8WCBYexs5ezFq2QUzfen8DMat/mexarCLtByNW718MU3bfKTEx1MuTXlx1MfB3Ap50J+RT
 QS3wpIYnRim2bBZKvqooQU+X4fdhuFk=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-422-_EYQY6B9PHSoSKiDocGoGw-1; Tue, 20 Apr 2021 06:04:25 -0400
X-MC-Unique: _EYQY6B9PHSoSKiDocGoGw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 431431922960;
 Tue, 20 Apr 2021 10:04:24 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-114-20.ams2.redhat.com
 [10.36.114.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 676115C1C4;
 Tue, 20 Apr 2021 10:04:22 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 1/3] block-copy: improve documentation for BlockCopyTask
 type and functions
Date: Tue, 20 Apr 2021 12:04:14 +0200
Message-Id: <20210420100416.30713-2-eesposit@redhat.com>
In-Reply-To: <20210420100416.30713-1-eesposit@redhat.com>
References: <20210420100416.30713-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

As done in BlockCopyCallState, categorize BlockCopyTask
in IN, State and OUT fields. This is just to understand
which field has to be protected with a lock.

Also add coroutine_fn attribute to block_copy_task_create,
because it is only usedn block_copy_dirty_clusters, a coroutine
function itself.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 39ae481c8b..03df50a354 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -48,25 +48,32 @@ typedef struct BlockCopyCallState {
     QLIST_ENTRY(BlockCopyCallState) list;
 
     /* State */
-    int ret;
     bool finished;
     QemuCoSleepState *sleep_state;
     bool cancelled;
 
     /* OUT parameters */
+    int ret;
     bool error_is_read;
 } BlockCopyCallState;
 
 typedef struct BlockCopyTask {
+    /* IN parameters. Initialized in block_copy_task_create()
+     * and never changed.
+     */
     AioTask task;
-
     BlockCopyState *s;
     BlockCopyCallState *call_state;
+
+    /* State */
     int64_t offset;
     int64_t bytes;
     bool zeroes;
-    QLIST_ENTRY(BlockCopyTask) list;
     CoQueue wait_queue; /* coroutines blocked on this task */
+
+    /* To reference all call states from BlockCopyTask */
+    QLIST_ENTRY(BlockCopyTask) list;
+
 } BlockCopyTask;
 
 static int64_t task_end(BlockCopyTask *task)
@@ -153,7 +160,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
  * Search for the first dirty area in offset/bytes range and create task at
  * the beginning of it.
  */
-static BlockCopyTask *block_copy_task_create(BlockCopyState *s,
+static BlockCopyTask *coroutine_fn block_copy_task_create(BlockCopyState *s,
                                              BlockCopyCallState *call_state,
                                              int64_t offset, int64_t bytes)
 {
-- 
2.30.2


