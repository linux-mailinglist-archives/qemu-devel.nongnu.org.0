Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 45652469906
	for <lists+qemu-devel@lfdr.de>; Mon,  6 Dec 2021 15:31:54 +0100 (CET)
Received: from localhost ([::1]:35754 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1muF21-0008Hh-4Q
	for lists+qemu-devel@lfdr.de; Mon, 06 Dec 2021 09:31:53 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExJ-0007Fc-Hy
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:27:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:44674)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1muExE-0002xJ-Lz
 for qemu-devel@nongnu.org; Mon, 06 Dec 2021 09:26:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638800816;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mG/4/c6JahFepUvT35nbK2boHd5C0dHum/iIdDDWEzU=;
 b=a5y+UTyW4bkyEusbs9xrxmi8x5fmhhrDiYP4FTX5okgdZ9DV5sWiA2fYM9oiV2Tjem/7NG
 KgrhBPLVYwD/QBxNa9w7Q9jwUYhtgc12l3jgra4AfHJfYHNiLWJfP5NgH4fOeMLKDot3tW
 /A/st19SENXdBQhAX8vuMQam55C7r4g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-372-GT_yvqc7N1qs5MX5y5Qq7A-1; Mon, 06 Dec 2021 09:26:53 -0500
X-MC-Unique: GT_yvqc7N1qs5MX5y5Qq7A-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D9FEC81EE60;
 Mon,  6 Dec 2021 14:26:51 +0000 (UTC)
Received: from localhost (unknown [10.39.193.226])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 780315F4E1;
 Mon,  6 Dec 2021 14:26:51 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v3 2/4] util/async: replace __thread with QEMU TLS macros
Date: Mon,  6 Dec 2021 14:26:30 +0000
Message-Id: <20211206142632.116925-3-stefanha@redhat.com>
In-Reply-To: <20211206142632.116925-1-stefanha@redhat.com>
References: <20211206142632.116925-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.619,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Fam Zheng <fam@euphon.net>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Warner Losh <imp@bsdimp.com>,
 sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU TLS macros must be used to make TLS variables safe with coroutines.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/async.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/util/async.c b/util/async.c
index 6f6717a34b..ddd9f24419 100644
--- a/util/async.c
+++ b/util/async.c
@@ -32,6 +32,7 @@
 #include "qemu/rcu_queue.h"
 #include "block/raw-aio.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
 #include "trace.h"
 
 /***********************************************************/
@@ -669,12 +670,13 @@ void aio_context_release(AioContext *ctx)
     qemu_rec_mutex_unlock(&ctx->lock);
 }
 
-static __thread AioContext *my_aiocontext;
+QEMU_DEFINE_STATIC_CO_TLS(AioContext *, my_aiocontext)
 
 AioContext *qemu_get_current_aio_context(void)
 {
-    if (my_aiocontext) {
-        return my_aiocontext;
+    AioContext *ctx = get_my_aiocontext();
+    if (ctx) {
+        return ctx;
     }
     if (qemu_mutex_iothread_locked()) {
         /* Possibly in a vCPU thread.  */
@@ -685,6 +687,6 @@ AioContext *qemu_get_current_aio_context(void)
 
 void qemu_set_current_aio_context(AioContext *ctx)
 {
-    assert(!my_aiocontext);
-    my_aiocontext = ctx;
+    assert(!get_my_aiocontext());
+    set_my_aiocontext(ctx);
 }
-- 
2.33.1


