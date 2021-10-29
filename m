Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B775C440091
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Oct 2021 18:48:29 +0200 (CEST)
Received: from localhost ([::1]:58216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mgV3M-0001Nk-Pf
	for lists+qemu-devel@lfdr.de; Fri, 29 Oct 2021 12:48:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48758)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUvE-0006sl-2n
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58321)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eesposit@redhat.com>)
 id 1mgUv2-0003Wq-GH
 for qemu-devel@nongnu.org; Fri, 29 Oct 2021 12:40:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635525590;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hx3r2KUL5QHtcRGIVt9AjkqkTKKz9o4kc1FoO1ja1LY=;
 b=imU9gTgoLBWLj/evx9cOrNopIvgma0qXZWwBYhnsuYUo9N0xyjHnvifnJeIj8Bgm2AqC74
 XV9BSb+kWoLo7DCx1qdiDdxJF26LtXx3KVB3VA8MRqW0xvzEsBWp3F6GlxPhX2cwHZ4tkw
 xN9ElRXK0BtY0LKIJCTM3vsH6sUD30I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-311-UJfaxHEFM8W2gtw3XWMAqw-1; Fri, 29 Oct 2021 12:39:47 -0400
X-MC-Unique: UJfaxHEFM8W2gtw3XWMAqw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 05053362FB;
 Fri, 29 Oct 2021 16:39:46 +0000 (UTC)
Received: from virtlab701.virt.lab.eng.bos.redhat.com
 (virtlab701.virt.lab.eng.bos.redhat.com [10.19.152.228])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 137FF69117;
 Fri, 29 Oct 2021 16:39:45 +0000 (UTC)
From: Emanuele Giuseppe Esposito <eesposit@redhat.com>
To: qemu-block@nongnu.org
Subject: [RFC PATCH 10/15] aio-wait.h: introduce AIO_WAIT_WHILE_UNLOCKED
Date: Fri, 29 Oct 2021 12:39:09 -0400
Message-Id: <20211029163914.4044794-11-eesposit@redhat.com>
In-Reply-To: <20211029163914.4044794-1-eesposit@redhat.com>
References: <20211029163914.4044794-1-eesposit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eesposit@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=eesposit@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Wen Congyang <wencongyang2@huawei.com>,
 Xie Changlong <xiechanglong.d@gmail.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>,
 Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Hanna Reitz <hreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Same as AIO_WAIT_WHILE macro, but if we are in the Main loop
do not release and then acquire ctx_ 's aiocontext.

Once all Aiocontext locks go away, this macro will replace
AIO_WAIT_WHILE.

Signed-off-by: Emanuele Giuseppe Esposito <eesposit@redhat.com>
---
 include/block/aio-wait.h | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/include/block/aio-wait.h b/include/block/aio-wait.h
index b39eefb38d..ff27fe4eab 100644
--- a/include/block/aio-wait.h
+++ b/include/block/aio-wait.h
@@ -59,10 +59,11 @@ typedef struct {
 extern AioWait global_aio_wait;
 
 /**
- * AIO_WAIT_WHILE:
+ * _AIO_WAIT_WHILE:
  * @ctx: the aio context, or NULL if multiple aio contexts (for which the
  *       caller does not hold a lock) are involved in the polling condition.
  * @cond: wait while this conditional expression is true
+ * @unlock: whether to unlock and then lock again @ctx
  *
  * Wait while a condition is true.  Use this to implement synchronous
  * operations that require event loop activity.
@@ -75,7 +76,7 @@ extern AioWait global_aio_wait;
  * wait on conditions between two IOThreads since that could lead to deadlock,
  * go via the main loop instead.
  */
-#define AIO_WAIT_WHILE(ctx, cond) ({                               \
+#define _AIO_WAIT_WHILE(ctx, cond, unlock) ({                      \
     bool waited_ = false;                                          \
     AioWait *wait_ = &global_aio_wait;                             \
     AioContext *ctx_ = (ctx);                                      \
@@ -90,11 +91,11 @@ extern AioWait global_aio_wait;
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
@@ -103,6 +104,12 @@ extern AioWait global_aio_wait;
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
2.27.0


