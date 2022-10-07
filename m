Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3258D5F7856
	for <lists+qemu-devel@lfdr.de>; Fri,  7 Oct 2022 14:53:07 +0200 (CEST)
Received: from localhost ([::1]:48390 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1ogmqf-0004Fp-8T
	for lists+qemu-devel@lfdr.de; Fri, 07 Oct 2022 08:53:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuD-0005ez-2i
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:37 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:47809)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1ogkuA-0003E4-9O
 for qemu-devel@nongnu.org; Fri, 07 Oct 2022 06:48:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1665139713;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fD7SsacDltC4lVcXn6LNGXSfRXOcskpa9bdilaKw6Hg=;
 b=egtogKAiZN7ca8jFZKiZURgQewT/Jq5bKGKidmKTfcF81WZQSxo+rVC/60mplnjvu0pWS4
 79ptByqSB1q+TnKC/AftyrmwfBzs6LDlAk4Uqfg4JgRGpSt+nSGc2tb05LtkSLf9cr6U7/
 z9wpSrvmubiUIJN6FclAYGu6dLCJ2yY=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-UdbEz8SUMeSBSwkG8bogsw-1; Fri, 07 Oct 2022 06:48:32 -0400
X-MC-Unique: UdbEz8SUMeSBSwkG8bogsw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 06854382624C;
 Fri,  7 Oct 2022 10:48:32 +0000 (UTC)
Received: from merkur.fritz.box (unknown [10.39.192.109])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 454C72028DC1;
 Fri,  7 Oct 2022 10:48:31 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Cc: kwolf@redhat.com,
	stefanha@redhat.com,
	qemu-devel@nongnu.org
Subject: [PULL 32/50] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Date: Fri,  7 Oct 2022 12:47:34 +0200
Message-Id: <20221007104752.141361-33-kwolf@redhat.com>
In-Reply-To: <20221007104752.141361-1-kwolf@redhat.com>
References: <20221007104752.141361-1-kwolf@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.129.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Emanuele Giuseppe Esposito <eesposit@redhat.com>

Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
do not release and then acquire ctx_ 's aiocontext.

Once all Aiocontext locks go away, this macro will replace
AIO_WAIT_WHILE.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@yandex-team.ru>
Message-Id: <20220926093214.506243-5-eesposit@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/aio-wait.h | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index 54840f8622..dd9a7f6461 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -59,10 +59,13 @@ typedef struct {
 extern AioWait global_aio_wait;
 
 /**
- * AIO_WAIT_WHILE:
+ * AIO_WAIT_WHILE_INTERNAL:
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
+#define AIO_WAIT_WHILE_INTERNAL(ctx, cond, unlock) ({              \
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
+    AIO_WAIT_WHILE_INTERNAL(ctx, cond, true)
+
+#define AIO_WAIT_WHILE_UNLOCKED(ctx, cond)                         \
+    AIO_WAIT_WHILE_INTERNAL(ctx, cond, false)
+
 /**
  * aio_wait_kick:
  * Wake up the main thread if it is waiting on AIO_WAIT_WHILE().  During
-- 
2.37.3


