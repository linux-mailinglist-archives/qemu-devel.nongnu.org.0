Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DEB06A75B9
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Mar 2023 21:59:42 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pXTX3-0003OS-4J; Wed, 01 Mar 2023 15:58:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTX1-0003Nt-AX
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:35 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1pXTWz-0003zh-5m
 for qemu-devel@nongnu.org; Wed, 01 Mar 2023 15:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1677704312;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=A/TobBksR8XjbrP3bHhTfUZS09aM4kuJxHipMzY0CJI=;
 b=aHn3LDZEWGS/gMnhpCV3V0RnkVCirqx2EaVKJUDgWfdI4kYJhlndvTIAf8zje9Iyx00QNx
 Qpjj/bHkr0PYGiv+Kfey7i86QD2kdSEoPhpjWOVGhtz9gG6Y6H/HAbS50Bb1wL3wjySSbn
 ewLoqDOkWrQNCBl0G7rs9TSU0juE0R0=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-158-NE4KwpkTMTGl9XbEwNEvqg-1; Wed, 01 Mar 2023 15:58:27 -0500
X-MC-Unique: NE4KwpkTMTGl9XbEwNEvqg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5F6D9181E3EF;
 Wed,  1 Mar 2023 20:58:26 +0000 (UTC)
Received: from localhost (unknown [10.39.192.234])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D3815C15BAD;
 Wed,  1 Mar 2023 20:58:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, qemu-block@nongnu.org,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>
Subject: [PATCH 1/6] block: don't acquire AioContext lock in bdrv_drain_all()
Date: Wed,  1 Mar 2023 15:57:56 -0500
Message-Id: <20230301205801.2453491-2-stefanha@redhat.com>
In-Reply-To: <20230301205801.2453491-1-stefanha@redhat.com>
References: <20230301205801.2453491-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no need for the AioContext lock in bdrv_drain_all() because
nothing in AIO_WAIT_WHILE() needs the lock and the condition is atomic.

Note that the NULL AioContext argument to AIO_WAIT_WHILE() is odd. In
the future it can be removed. There is an assertion in
AIO_WAIT_WHILE() that checks that we're in the main loop AioContext and
we would lose that check by dropping the argument. However, that was a
precursor to the GLOBAL_STATE_CODE()/IO_CODE() macros and is now a
duplicate check. So I think we won't lose much by dropping it, but let's
do a few more AIO_WAIT_WHILE_UNLOCKED() coversions of this sort to
confirm this is the case.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/block-backend.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 278b04ce69..d2b6b3652d 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1835,14 +1835,8 @@ void blk_drain_all(void)
     bdrv_drain_all_begin();
 
     while ((blk = blk_all_next(blk)) != NULL) {
-        AioContext *ctx = blk_get_aio_context(blk);
-
-        aio_context_acquire(ctx);
-
         /* We may have -ENOMEDIUM completions in flight */
-        AIO_WAIT_WHILE(ctx, qatomic_mb_read(&blk->in_flight) > 0);
-
-        aio_context_release(ctx);
+        AIO_WAIT_WHILE_UNLOCKED(NULL, qatomic_mb_read(&blk->in_flight) > 0);
     }
 
     bdrv_drain_all_end();
-- 
2.39.2


