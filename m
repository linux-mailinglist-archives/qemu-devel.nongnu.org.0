Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FF31304115
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:57:17 +0100 (CET)
Received: from localhost ([::1]:46060 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4PmO-0000Ao-HX
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:57:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEW-0001GJ-Sh
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:18 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:45979)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PEP-0006ZL-05
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:22:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670925;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=daRcalrVm3uKbSr6EUiYp8XTRQIUZ6P1NN/8tJRayZM=;
 b=B2hxEThKcaeEwIHNaeUhR6qFCOun6pDSFuEjMLpLeuBDihEqI2us2xX4/jVhu9h0QQiOIt
 JnIA3OIHItCPyNzD1Ob8iK3sQkBjMVVZXYIsIYxk5yhvcg6QUZ0V5G3cwYKYLdkWzO9UDy
 sy2jxUl7bQWazd6FjwXIruXpUhzkMXA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-88-jK0EHOl5MseB7eW1rKmHxQ-1; Tue, 26 Jan 2021 09:22:02 -0500
X-MC-Unique: jK0EHOl5MseB7eW1rKmHxQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9BDDE9CC09;
 Tue, 26 Jan 2021 14:22:01 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3E62B6F816;
 Tue, 26 Jan 2021 14:22:01 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 45/53] block/block-copy: drop unused
 block_copy_set_progress_callback()
Date: Tue, 26 Jan 2021 15:20:08 +0100
Message-Id: <20210126142016.806073-46-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Drop unused code.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-20-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 include/block/block-copy.h |  6 ------
 block/block-copy.c         | 15 ---------------
 2 files changed, 21 deletions(-)

diff --git a/include/block/block-copy.h b/include/block/block-copy.h
index 7821850f88..1cbea0b79b 100644
--- a/include/block/block-copy.h
+++ b/include/block/block-copy.h
@@ -18,7 +18,6 @@
 #include "block/block.h"
 #include "qemu/co-shared-resource.h"
 
-typedef void (*ProgressBytesCallbackFunc)(int64_t bytes, void *opaque);
 typedef void (*BlockCopyAsyncCallbackFunc)(void *opaque);
 typedef struct BlockCopyState BlockCopyState;
 typedef struct BlockCopyCallState BlockCopyCallState;
@@ -28,11 +27,6 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
                                      BdrvRequestFlags write_flags,
                                      Error **errp);
 
-void block_copy_set_progress_callback(
-        BlockCopyState *s,
-        ProgressBytesCallbackFunc progress_bytes_callback,
-        void *progress_opaque);
-
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm);
 
 void block_copy_state_free(BlockCopyState *s);
diff --git a/block/block-copy.c b/block/block-copy.c
index 61d82d9a1c..2ea8b28684 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -110,9 +110,6 @@ typedef struct BlockCopyState {
     bool skip_unallocated;
 
     ProgressMeter *progress;
-    /* progress_bytes_callback: called when some copying progress is done. */
-    ProgressBytesCallbackFunc progress_bytes_callback;
-    void *progress_opaque;
 
     SharedResource *mem;
 
@@ -298,15 +295,6 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     return s;
 }
 
-void block_copy_set_progress_callback(
-        BlockCopyState *s,
-        ProgressBytesCallbackFunc progress_bytes_callback,
-        void *progress_opaque)
-{
-    s->progress_bytes_callback = progress_bytes_callback;
-    s->progress_opaque = progress_opaque;
-}
-
 void block_copy_set_progress_meter(BlockCopyState *s, ProgressMeter *pm)
 {
     s->progress = pm;
@@ -454,9 +442,6 @@ static coroutine_fn int block_copy_task_entry(AioTask *task)
         t->call_state->error_is_read = error_is_read;
     } else {
         progress_work_done(t->s->progress, t->bytes);
-        if (t->s->progress_bytes_callback) {
-            t->s->progress_bytes_callback(t->bytes, t->s->progress_opaque);
-        }
     }
     co_put_to_shres(t->s->mem, t->bytes);
     block_copy_task_end(t, ret);
-- 
2.29.2


