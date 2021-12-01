Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 222364653A4
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 18:07:18 +0100 (CET)
Received: from localhost ([::1]:46792 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msT4e-00060V-D4
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 12:07:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:48142)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzS-0000bP-VL
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:54 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:37283)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1msSzQ-0001L8-0i
 for qemu-devel@nongnu.org; Wed, 01 Dec 2021 12:01:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1638378110;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=mG/4/c6JahFepUvT35nbK2boHd5C0dHum/iIdDDWEzU=;
 b=derxCbGmrnFIqU/z40VAv1NgLccqp+gyNEe8SCpDRCNQVK2uJMMDlOKKD8X0dKuVRUAgQU
 mf9cQmdcTQH8m1yQTA2Nut8myUH338hvc38wcF2WCmsdb/5Uv2uJz5rk7+8oanAlCiFGhI
 rX57yj8w4D+2X62sBqV45AN6YX9/bHU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-461-RlwB8DHAPKmZkrHq8nprHg-1; Wed, 01 Dec 2021 12:01:48 -0500
X-MC-Unique: RlwB8DHAPKmZkrHq8nprHg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id F094564168;
 Wed,  1 Dec 2021 17:01:25 +0000 (UTC)
Received: from localhost (unknown [10.39.193.115])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9768D45D67;
 Wed,  1 Dec 2021 17:01:25 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC v2 2/4] util/async: replace __thread with QEMU TLS macros
Date: Wed,  1 Dec 2021 17:01:18 +0000
Message-Id: <20211201170120.286139-3-stefanha@redhat.com>
In-Reply-To: <20211201170120.286139-1-stefanha@redhat.com>
References: <20211201170120.286139-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.716,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, fweimer@redhat.com, thuth@redhat.com,
 Daniel Berrange <berrange@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Warner Losh <imp@bsdimp.com>, sguelton@redhat.com
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


