Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B849D5694B2
	for <lists+qemu-devel@lfdr.de>; Wed,  6 Jul 2022 23:50:42 +0200 (CEST)
Received: from localhost ([::1]:56478 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1o9Cuv-0002Yt-E5
	for lists+qemu-devel@lfdr.de; Wed, 06 Jul 2022 17:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39216)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BRB-0005En-8Z
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:53 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:55337)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1o9BR7-0007ET-0S
 for qemu-devel@nongnu.org; Wed, 06 Jul 2022 16:15:52 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657138548;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=pXXEWuTZjbY86kMHhS2xb1I9DX+F+DsvFH6sb6NeVxc=;
 b=WuTqkr2GHQOAvwUJm5giWYcvZs1y82AtEnHo5rnTw5xhrzWschYF9IoR0EgN/K/H6K6w6/
 Un++nRdyRc30fuAff2o915z5/jRYxrrZ/dlFWv93ZIK/UmDxlHI55LIIUYTHXWeoKTxpWI
 pGSlLpwQvHT6R2Bxh0fCrIaf/dynhR4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-673-x8_kpHriP6iI9R3Q3p2Snw-1; Wed, 06 Jul 2022 16:15:44 -0400
X-MC-Unique: x8_kpHriP6iI9R3Q3p2Snw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 44B55101A59F;
 Wed,  6 Jul 2022 20:15:43 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id DDD6C1121320;
 Wed,  6 Jul 2022 20:15:42 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Cc: Kevin Wolf <kwolf@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Markus Armbruster <armbru@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-devel@nongnu.org, Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Subject: [PATCH v9 04/21] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Date: Wed,  6 Jul 2022 16:15:16 -0400
Message-Id: <20220706201533.289775-5-eesposit@redhat.com>
In-Reply-To: <20220706201533.289775-1-eesposit@redhat.com>
References: <20220706201533.289775-1-eesposit@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
do not release and then acquire ctx_ 's aiocontext.

Once all Aiocontext locks go away, this macro will replace
AIO_WAIT_WHILE.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
---
 include/block/aio-wait.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index 54840f8622..a61f82c617 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -59,10 +59,13 @@ typedef struct {
 extern AioWait global_aio_wait;
 
 /**
- * AIO_WAIT_WHILE:
+ * _AIO_WAIT_WHILE:
  * @ctx: the aio context, or NULL if multiple aio contexts (for which the
  *       caller does not hold a lock) are involved in the polling condition.
  * @cond: wait while this conditional expression is true
+ * @unlock: whether to unlock and then lock again @ctx. This apples
+ * only when waiting for another AioContext from the main loop.
+ * Otherwise it's ignored.
  *
  * Wait while a condition is true.  Use this to implement synchronous
  * operations that require event loop activity.
@@ -75,7 +78,7 @@ extern AioWait global_aio_wait;
  * wait on conditions between two IOThreads since that could lead to deadlock,
  * go via the main loop instead.
  */
-#define AIO_WAIT_WHILE(ctx, cond) ({                               \
+#define _AIO_WAIT_WHILE(ctx, cond, unlock) ({                      \
     bool waited_ = false;                                          \
     AioWait *wait_ = &global_aio_wait;                             \
     AioContext *ctx_ = (ctx);                                      \
@@ -92,11 +95,11 @@ extern AioWait global_aio_wait;
         assert(qemu_get_current_aio_context() ==                   \
                qemu_get_aio_context());                            \
         while ((cond)) {                                           \
-            if (ctx_) {                                            \
+            if (unlock && ctx_) {                                  \
                 aio_context_release(ctx_);                         \
             }                                                      \
             aio_poll(qemu_get_aio_context(), true);                \
-            if (ctx_) {                                            \
+            if (unlock && ctx_) {                                  \
                 aio_context_acquire(ctx_);                         \
             }                                                      \
             waited_ = true;                                        \
@@ -105,6 +108,12 @@ extern AioWait global_aio_wait;
     qatomic_dec(&wait_->num_waiters);                              \
     waited_; })
 
+#define AIO_WAIT_WHILE(ctx, cond)                                  \
+    _AIO_WAIT_WHILE(ctx, cond, true)
+
+#define AIO_WAIT_WHILE_UNLOCKED(ctx, cond)                         \
+    _AIO_WAIT_WHILE(ctx, cond, false)
+
 /**
  * aio_wait_kick:
  * Wake up the main thread if it is waiting on AIO_WAIT_WHILE().  During
-- 
2.31.1


