Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CE35645AAF
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Dec 2022 14:20:50 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p2uKk-0007aQ-QC; Wed, 07 Dec 2022 08:19:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKg-0007Xn-4B
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:30 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1p2uKd-0006Pe-BA
 for qemu-devel@nongnu.org; Wed, 07 Dec 2022 08:19:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670419166;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/7u3892ZE2owK2iUVTYikKIwaiVWR1DcL/eNbuw6D6M=;
 b=a59m0JlsptZmVvK1lS6DkMVD/Pz/ERxaixc+4DTtn2tBtsBKAp1T7kY0K6mSYYiobDUMke
 HSqO0XlxkFE6Yun2nPs1eD5akRg++ojm6zqp5Si7wtjOAzqvHh0TCq8oEiWK86dyp87Q8x
 TjtlFSB46xsUOO0/ipL/C0gb1hafSvw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-542-4qVSh8JSOHeLZdQgFgFfLg-1; Wed, 07 Dec 2022 08:19:23 -0500
X-MC-Unique: 4qVSh8JSOHeLZdQgFgFfLg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6A04685A588;
 Wed,  7 Dec 2022 13:19:23 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.194.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 377C21121314;
 Wed,  7 Dec 2022 13:19:22 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com, hreitz@redhat.com, eesposit@redhat.com,
 pbonzini@redhat.com, vsementsov@yandex-team.ru, qemu-devel@nongnu.org
Subject: [PATCH 01/18] block: Factor out bdrv_drain_all_begin_nopoll()
Date: Wed,  7 Dec 2022 14:18:21 +0100
Message-Id: <20221207131838.239125-2-kwolf@redhat.com>
In-Reply-To: <20221207131838.239125-1-kwolf@redhat.com>
References: <20221207131838.239125-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124; envelope-from=kwolf@redhat.com;
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

Provide a separate function that just quiesces the users of a node to
prevent new requests from coming in, but without waiting for the already
in-flight I/O to complete.

This function can be used in contexts where polling is not allowed.

Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/block-global-state.h |  1 +
 block/io.c                         | 19 +++++++++++++------
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/include/block/block-global-state.h b/include/block/block-global-state.h
index 1f8b54f2df..b0a3cfe6b8 100644
--- a/include/block/block-global-state.h
+++ b/include/block/block-global-state.h
@@ -152,6 +152,7 @@ int bdrv_inactivate_all(void);
 int bdrv_flush_all(void);
 void bdrv_close_all(void);
 void bdrv_drain_all_begin(void);
+void bdrv_drain_all_begin_nopoll(void);
 void bdrv_drain_all_end(void);
 void bdrv_drain_all(void);
 
diff --git a/block/io.c b/block/io.c
index f4444b7777..d160d2e273 100644
--- a/block/io.c
+++ b/block/io.c
@@ -466,16 +466,11 @@ static bool bdrv_drain_all_poll(void)
  * NOTE: no new block jobs or BlockDriverStates can be created between
  * the bdrv_drain_all_begin() and bdrv_drain_all_end() calls.
  */
-void bdrv_drain_all_begin(void)
+void bdrv_drain_all_begin_nopoll(void)
 {
     BlockDriverState *bs = NULL;
     GLOBAL_STATE_CODE();
 
-    if (qemu_in_coroutine()) {
-        bdrv_co_yield_to_drain(NULL, true, NULL, true);
-        return;
-    }
-
     /*
      * bdrv queue is managed by record/replay,
      * waiting for finishing the I/O requests may
@@ -500,6 +495,18 @@ void bdrv_drain_all_begin(void)
         bdrv_do_drained_begin(bs, NULL, false);
         aio_context_release(aio_context);
     }
+}
+
+void bdrv_drain_all_begin(void)
+{
+    BlockDriverState *bs = NULL;
+
+    if (qemu_in_coroutine()) {
+        bdrv_co_yield_to_drain(NULL, true, NULL, true);
+        return;
+    }
+
+    bdrv_drain_all_begin_nopoll();
 
     /* Now poll the in-flight requests */
     AIO_WAIT_WHILE(NULL, bdrv_drain_all_poll());
-- 
2.38.1


