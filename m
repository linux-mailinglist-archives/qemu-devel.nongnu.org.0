Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C74953040D4
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Jan 2021 15:49:38 +0100 (CET)
Received: from localhost ([::1]:49460 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l4Pez-0006Xo-My
	for lists+qemu-devel@lfdr.de; Tue, 26 Jan 2021 09:49:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46962)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDt-0000dF-6Z
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55331)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1l4PDp-0006LQ-41
 for qemu-devel@nongnu.org; Tue, 26 Jan 2021 09:21:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1611670892;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lc5utZMvYxADvJCqpJc4/a5X8q+YDhMe72BYCGP0KQg=;
 b=bUj8R8IAJOfT62ACc7WIJkOJL1AIYGf8gaPAeogtQXDwm5D3WDcNJHIdr/lgguLqnP0oNA
 HWZjqcgnUkBnyKbWcUW6KidxQN0mzBg9S6lVqxYQbogxfy40d6w2T4yTdqhfBXgCWxzV8Y
 euL1HFDT0QVYqLVvMmIstg1LxSgi42I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-p99pGX-3N3WMerQL7iS8ZQ-1; Tue, 26 Jan 2021 09:21:28 -0500
X-MC-Unique: p99pGX-3N3WMerQL7iS8ZQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 10EA08143E5;
 Tue, 26 Jan 2021 14:21:27 +0000 (UTC)
Received: from localhost (ovpn-114-175.ams2.redhat.com [10.36.114.175])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id A840760C47;
 Tue, 26 Jan 2021 14:21:26 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 30/53] block/block-copy: add list of all call-states
Date: Tue, 26 Jan 2021 15:19:53 +0100
Message-Id: <20210126142016.806073-31-mreitz@redhat.com>
In-Reply-To: <20210126142016.806073-1-mreitz@redhat.com>
References: <20210126142016.806073-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -30
X-Spam_score: -3.1
X-Spam_bar: ---
X-Spam_report: (-3.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.255,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

It simplifies debugging.

Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Reviewed-by: Max Reitz <mreitz@redhat.com>
Message-Id: <20210116214705.822267-6-vsementsov@virtuozzo.com>
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/block-copy.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/block/block-copy.c b/block/block-copy.c
index 35213bd832..6bf1735b93 100644
--- a/block/block-copy.c
+++ b/block/block-copy.c
@@ -42,6 +42,9 @@ typedef struct BlockCopyCallState {
     /* Coroutine where async block-copy is running */
     Coroutine *co;
 
+    /* To reference all call states from BlockCopyState */
+    QLIST_ENTRY(BlockCopyCallState) list;
+
     /* State */
     int ret;
     bool finished;
@@ -81,7 +84,8 @@ typedef struct BlockCopyState {
     bool use_copy_range;
     int64_t copy_size;
     uint64_t len;
-    QLIST_HEAD(, BlockCopyTask) tasks;
+    QLIST_HEAD(, BlockCopyTask) tasks; /* All tasks from all block-copy calls */
+    QLIST_HEAD(, BlockCopyCallState) calls;
 
     BdrvRequestFlags write_flags;
 
@@ -282,6 +286,7 @@ BlockCopyState *block_copy_state_new(BdrvChild *source, BdrvChild *target,
     }
 
     QLIST_INIT(&s->tasks);
+    QLIST_INIT(&s->calls);
 
     return s;
 }
@@ -669,6 +674,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
 {
     int ret;
 
+    QLIST_INSERT_HEAD(&call_state->s->calls, call_state, list);
+
     do {
         ret = block_copy_dirty_clusters(call_state);
 
@@ -694,6 +701,8 @@ static int coroutine_fn block_copy_common(BlockCopyCallState *call_state)
         call_state->cb(call_state->cb_opaque);
     }
 
+    QLIST_REMOVE(call_state, list);
+
     return ret;
 }
 
-- 
2.29.2


