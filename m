Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BCD483A5DC2
	for <lists+qemu-devel@lfdr.de>; Mon, 14 Jun 2021 09:36:32 +0200 (CEST)
Received: from localhost ([::1]:38440 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lsh95-0000GU-MU
	for lists+qemu-devel@lfdr.de; Mon, 14 Jun 2021 03:36:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35120)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsh6l-0005SZ-EV
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:34:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1lsh6j-0004xB-T8
 for qemu-devel@nongnu.org; Mon, 14 Jun 2021 03:34:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623656045;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=XJskv7PwmFtVED6joTZIFTWoa8EePTwK/hxu88B8IHc=;
 b=HQGAFR8lnUgwHuc33IEd2xU4VAjEGt58vsBqTw65L3YQUFFOI16ZE4aQu7OpGZqohguh03
 1Nh99Q8CKqKvN70uQMz13vuufsmYFznuYvuW10m7cM+uyUyq4lOpSkuR13BtqLdKt24AYs
 Jdrr4NH3f8+EZk3alVFAM3wgsByfz7g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-543-VNaD8g_kPvOouX5GXhfPmw-1; Mon, 14 Jun 2021 03:34:02 -0400
X-MC-Unique: VNaD8g_kPvOouX5GXhfPmw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D833F100C660;
 Mon, 14 Jun 2021 07:34:00 +0000 (UTC)
Received: from localhost.localdomain (ovpn-113-49.ams2.redhat.com
 [10.36.113.49])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79B4E5D6A8;
 Mon, 14 Jun 2021 07:33:58 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [PATCH v4 1/6] block-copy: small refactor in block_copy_task_entry
 and block_copy_common
Date: Mon, 14 Jun 2021 09:33:45 +0200
Message-Id: <20210614073350.17048-2-eesposit@redhat.com>
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

Use a local variable instead of referencing BlockCopyState through a
BlockCopyCallState or BlockCopyTask every time.
This is in preparation for next patches.

No functional change intended.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 block/block-copy.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 943e30b7e6..f0dbb4912b 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -452,14 +452,15 @@ static void block_copy_handle_copy_range_result(BlockCopyState *s,
 static coroutine_fn int block_copy_task_entry(AioTask *task)
 {
     BlockCopyTask *t = container_of(task, BlockCopyTask, task);
+    BlockCopyState *s = t->s;
     bool error_is_read = false;
     bool copy_range = t->copy_range;
     int ret;
 
-    ret = block_copy_do_copy(t->s, t->offset, t->bytes, t->zeroes,
+    ret = block_copy_do_copy(s, t->offset, t->bytes, t->zeroes,
                              &copy_range, &error_is_read);
     if (t->copy_range) {
-        block_copy_handle_copy_range_result(t->s, copy_range);
+        block_copy_handle_copy_range_result(s, copy_range);
     }
     if (ret < 0) {
         if (!t->call_state->ret) {
@@ -467,9 +468,9 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
             t->call_state->error_is_read = error_is_read;
         }
     } else {
-        progress_work_done(t->s->progress, t->bytes);
+        progress_work_done(s->progress, t->bytes);
     }
-    co_put_to_shres(t->s->mem, t->bytes);
+    co_put_to_shres(s->mem, t->bytes);
     block_copy_task_end(t, ret);
 
     return ret;
@@ -714,14 +715,15 @@ void block_copy_kick(BlockCopyCallState *call_state)
 static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
+    BlockCopyState *s = call_state->s;
 
-    QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+    QLIST_INSERT_HEAD(&s->calls, call_state, list);
 
     do {
         ret = block_copy_dirty_clusters(call_state);
 
         if (ret == 0 && !call_state->cancelled) {
-            ret = block_copy_wait_one(call_state->s, call_state->offset,
+            ret = block_copy_wait_one(s, call_state->offset,
                                       call_state->bytes);
         }
 
-- 
2.31.1


