Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 74BB36EE298
	for <lists+qemu-devel@lfdr.de>; Tue, 25 Apr 2023 15:15:46 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1prIVI-0006Vi-Nq; Tue, 25 Apr 2023 09:14:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUo-0006FM-Kc
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1prIUm-0006XM-LM
 for qemu-devel@nongnu.org; Tue, 25 Apr 2023 09:14:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1682428452;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wD7WjN5MqtLw+Ywbd0kEmPtkDFlNLgkgcildmGprRrM=;
 b=DXCf8jUPWwQWTRuko+HoH3VQJo5whbvahOgtCdpz4A5pMewJDeTTu5B9PL+LNj0b8YUfXg
 t3s74Syq53gu7mMxnLz8l49j2m/sfmG9gmJAYg9KVJlvQmsV9wjlPJkwlHvdfvXGalFfJn
 tZdkVWnSlka0u693qOHDt/0gwckPgv8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-235-iDzd8UDMNcq7A1Bvtxbzdg-1; Tue, 25 Apr 2023 09:14:08 -0400
X-MC-Unique: iDzd8UDMNcq7A1Bvtxbzdg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 57F128828D2;
 Tue, 25 Apr 2023 13:14:08 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9CF9640C2064;
 Tue, 25 Apr 2023 13:14:07 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	richard.henderson@linaro.org,
	qemu-devel@nongnu.org
Subject: [PULL 04/25] block: don't acquire AioContext lock in bdrv_drain_all()
Date: Tue, 25 Apr 2023 15:13:38 +0200
Message-Id: <20230425131359.259007-5-kwolf@redhat.com>
In-Reply-To: <20230425131359.259007-1-kwolf@redhat.com>
References: <20230425131359.259007-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -22
X-Spam_score: -2.3
X-Spam_bar: --
X-Spam_report: (-2.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.171,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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

From: Stefan Hajnoczi <stefanha@redhat.com>

There is no need for the AioContext lock in bdrv_drain_all() because
nothing in AIO_WAIT_WHILE() needs the lock and the condition is atomic.

AIO_WAIT_WHILE_UNLOCKED() has no use for the AioContext parameter other
than performing a check that is nowadays already done by the
GLOBAL_STATE_CODE()/IO_CODE() macros. Set the ctx argument to NULL here
to help us keep track of all converted callers. Eventually all callers
will have been converted and then the argument can be dropped entirely.

Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
Message-Id: <20230309190855.414275-2-stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Reviewed-by: Wilfred Mallawa <wilfred.mallawa@wdc.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 block/block-backend.c | 8 +-------
 1 file changed, 1 insertion(+), 7 deletions(-)

diff --git a/block/block-backend.c b/block/block-backend.c
index 47e006c645..fc530ded6a 100644
--- a/block/block-backend.c
+++ b/block/block-backend.c
@@ -1874,14 +1874,8 @@ void blk_drain_all(void)
     bdrv_drain_all_begin();
 
     while ((blk = blk_all_next(blk)) != NULL) {
-        AioContext *ctx = blk_get_aio_context(blk);
-
-        aio_context_acquire(ctx);
-
         /* We may have -ENOMEDIUM completions in flight */
-        AIO_WAIT_WHILE(ctx, qatomic_read(&blk->in_flight) > 0);
-
-        aio_context_release(ctx);
+        AIO_WAIT_WHILE_UNLOCKED(NULL, qatomic_read(&blk->in_flight) > 0);
     }
 
     bdrv_drain_all_end();
-- 
2.40.0


