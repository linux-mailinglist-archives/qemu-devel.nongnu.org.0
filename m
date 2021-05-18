Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 84C18387697
	for <lists+qemu-devel@lfdr.de>; Tue, 18 May 2021 12:33:48 +0200 (CEST)
Received: from localhost ([::1]:46038 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lix2p-0003mH-KC
	for lists+qemu-devel@lfdr.de; Tue, 18 May 2021 06:33:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweb-00034K-0K
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:46088)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1liweX-0007pY-Kl
 for qemu-devel@nongnu.org; Tue, 18 May 2021 06:08:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621332519;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FYDo54qY83IwJhQYjq5Rxgz+9nMMFeAafRwA+Be84us=;
 b=To0pbxYoDu6AjidFsOP441ILPEoqUl6c6Lg3P91J+aTTYXt3Syisn9qLWcsF11AaqkyIY9
 iB9z+GafULGsdM0qN6EFgMf1XMvGFTVc+jIiZWBkW4n1m94rX9ay5fJrXj201CLACR9ij+
 aEH5vXjkKJgBB6QjIgWbQhfXcjGgG4M=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-444-LQoZIBCfMdCHY89pbQQxtw-1; Tue, 18 May 2021 06:08:36 -0400
X-MC-Unique: LQoZIBCfMdCHY89pbQQxtw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A22A7100945E;
 Tue, 18 May 2021 10:08:35 +0000 (UTC)
Received: from localhost.localdomain (ovpn-114-236.ams2.redhat.com
 [10.36.114.236])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 1770C687D4;
 Tue, 18 May 2021 10:08:32 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v2 7/7] block-copy: protect BlockCopyState .method fields
Date: Tue, 18 May 2021 12:07:57 +0200
Message-Id: <20210518100757.31243-8-eesposit@redhat.com>
In-Reply-To: <20210518100757.31243-1-eesposit@redhat.com>
References: <20210518100757.31243-1-eesposit@redhat.com>
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
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.374,
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

With tasks and calls lock protecting all State fields,
.method is the last BlockCopyState field left unprotected.
Set it as atomic.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 37 ++++++++++++++++++-------------------
 1 file changed, 18 insertions(+), 19 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 573e96fefb..ebccb7fbc6 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -108,7 +108,7 @@ typedef struct BlockCopyState {
 
     /* State */
     int64_t in_flight_bytes; /* protected by tasks_lock */
-    BlockCopyMethod method;
+    BlockCopyMethod method; /* atomic */
     CoMutex tasks_lock;
     QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
     QemuMutex calls_lock;
@@ -184,7 +184,7 @@ static bool coroutine_fn block_copy_wait_one(BlockCopyState *s, int64_t offset,
 
 static inline int64_t block_copy_chunk_size(BlockCopyState *s)
 {
-    switch (s->method) {
+    switch (qatomic_read(&s->method)) {
     case COPY_READ_WRITE_CLUSTER:
         return s->cluster_size;
     case COPY_READ_WRITE:
@@ -338,16 +338,17 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
          * buffered copying (read and write respect max_transfer on their
          * behalf).
          */
-        s->method = COPY_READ_WRITE_CLUSTER;
+        qatomic_set(&s->method, COPY_READ_WRITE_CLUSTER);
     } else if (write_flags & BDRV_REQ_WRITE_COMPRESSED) {
         /* Compression supports only cluster-size writes and no copy-range. */
-        s->method = COPY_READ_WRITE_CLUSTER;
+        qatomic_set(&s->method, COPY_READ_WRITE_CLUSTER);
     } else {
         /*
          * We enable copy-range, but keep small copy_size, until first
          * successful copy_range (look at block_copy_do_copy).
          */
-        s->method = use_copy_range ? COPY_RANGE_SMALL : COPY_READ_WRITE;
+        qatomic_set(&s->method, use_copy_range ? COPY_RANGE_SMALL :
+                                                 COPY_READ_WRITE);
     }
 
     ratelimit_init(&s->rate_limit);
@@ -432,26 +433,24 @@ static int coroutine_fn block_copy_do_copy(BlockCopyState *s,
         return ret;
     }
 
-    if (s->method >= COPY_RANGE_SMALL) {
+    if (qatomic_read(&s->method) >= COPY_RANGE_SMALL) {
         ret = bdrv_co_copy_range(s->source, offset, s->target, offset, nbytes,
                                  0, s->write_flags);
         if (ret < 0) {
             trace_block_copy_copy_range_fail(s, offset, ret);
-            s->method = COPY_READ_WRITE;
+            qatomic_set(&s->method, COPY_READ_WRITE);
             /* Fallback to read+write with allocated buffer */
         } else {
-            if (s->method == COPY_RANGE_SMALL) {
-                /*
-                 * Successful copy-range. Now increase copy_size.  copy_range
-                 * does not respect max_transfer (it's a TODO), so we factor
-                 * that in here.
-                 *
-                 * Note: we double-check s->method for the case when
-                 * parallel block-copy request unsets it during previous
-                 * bdrv_co_copy_range call.
-                 */
-                s->method = COPY_RANGE_FULL;
-            }
+            /*
+             * Successful copy-range. Now increase copy_size.  copy_range
+             * does not respect max_transfer (it's a TODO), so we factor
+             * that in here.
+             *
+             * Note: we double-check s->method for the case when
+             * parallel block-copy request unsets it during previous
+             * bdrv_co_copy_range call.
+             */
+            qatomic_cmpxchg(&s->method, COPY_RANGE_SMALL, COPY_RANGE_FULL);
             goto out;
         }
     }
-- 
2.30.2


