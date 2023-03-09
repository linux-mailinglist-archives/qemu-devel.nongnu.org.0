Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A196B2D61
	for <lists+qemu-devel@lfdr.de>; Thu,  9 Mar 2023 20:10:16 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1paLda-0006Or-Ra; Thu, 09 Mar 2023 14:09:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paLdT-0006NK-LW
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:09:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1paLdR-00085f-14
 for qemu-devel@nongnu.org; Thu, 09 Mar 2023 14:09:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678388943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=SM3fBLQ31B1m+raAafKAtbmhbbEZMPjYFKg7Q8w6CMQ=;
 b=aglJe/ojDB0dBavADE5rTmoaFd/I5FVCVGA6U945AajupF5YlEOcZNpqtVMwDZu+jwIP8E
 jcQXjTFQi10QjJDq9Li9EtlZG+msRkH3w2h/RIMK4C/WfymW5tvSFzlMhiKiycYVgPCdwY
 4qDZQ0hq7EsiqVTYrFpmhTPW8CK08fA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-489-y1wqKnvUPw2TFrtv46F0VA-1; Thu, 09 Mar 2023 14:09:01 -0500
X-MC-Unique: y1wqKnvUPw2TFrtv46F0VA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A5E4803503;
 Thu,  9 Mar 2023 19:09:01 +0000 (UTC)
Received: from localhost (unknown [10.39.192.63])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DD5402166B26;
 Thu,  9 Mar 2023 19:09:00 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, armbru@redhat.com,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
 Fam Zheng <fam@euphon.net>, Stefan Hajnoczi <stefanha@redhat.com>
Subject: [PATCH v2 1/6] block: don't acquire AioContext lock in
 bdrv_drain_all()
Date: Thu,  9 Mar 2023 14:08:50 -0500
Message-Id: <20230309190855.414275-2-stefanha@redhat.com>
In-Reply-To: <20230309190855.414275-1-stefanha@redhat.com>
References: <20230309190855.414275-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org

There is no need for the AioContext lock in bdrv_drain_all() because
nothing in AIO_WAIT_WHILE() needs the lock and the condition is atomic.

AIO_WAIT_WHILE_UNLOCKED() has no use for the AioContext parameter other
than performing a check that is nowadays already done by the
GLOBAL_STATE_CODE()/IO_CODE() macros. Set the ctx argument to NULL here
to help us keep track of all converted callers. Eventually all callers
will have been converted and then the argument can be dropped entirely.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
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


