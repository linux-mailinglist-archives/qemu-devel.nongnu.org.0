Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8929A4BDA49
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Feb 2022 15:40:57 +0100 (CET)
Received: from localhost ([::1]:55254 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nM9s0-0005Z8-AL
	for lists+qemu-devel@lfdr.de; Mon, 21 Feb 2022 09:40:56 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58816)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9h0-0004fz-6N
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:22202)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nM9gv-0003Qd-0m
 for qemu-devel@nongnu.org; Mon, 21 Feb 2022 09:29:32 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645453758;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydAFJulO1fktYGT+VeP4DNbUV9UD3tPDkgP+u0FXbQ0=;
 b=inwUcmtHGh3nllqzIzXKK++is7ncis5DLql2y6IOpCi/R/BXikggDV2h3UcSGJxVA1CmMq
 IeU9pFflqYr7scejBreOFuunFrm+Etuh2G4lvs2hwSHdEC6Amrhu86rfM01YwIOtchm2eT
 /eVjjsgv1t7Z3JiHX+kvN1ipy5hBsrw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-583-sAol9aGzNJ6dVdW-UsKNNw-1; Mon, 21 Feb 2022 09:29:15 -0500
X-MC-Unique: sAol9aGzNJ6dVdW-UsKNNw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9F8021006AA3;
 Mon, 21 Feb 2022 14:29:14 +0000 (UTC)
Received: from localhost (unknown [10.39.195.91])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2A3214EC78;
 Mon, 21 Feb 2022 14:29:13 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 2/4] util/async: replace __thread with QEMU TLS macros
Date: Mon, 21 Feb 2022 14:29:05 +0000
Message-Id: <20220221142907.346035-3-stefanha@redhat.com>
In-Reply-To: <20220221142907.346035-1-stefanha@redhat.com>
References: <20220221142907.346035-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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
Cc: Florian Weimer <fweimer@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Serge Guelton <sguelton@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU TLS macros must be used to make TLS variables safe with coroutines.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/async.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/util/async.c b/util/async.c
index 08d25feef5..2ea1172f3e 100644
--- a/util/async.c
+++ b/util/async.c
@@ -32,6 +32,7 @@
 #include "qemu/rcu_queue.h"
 #include "block/raw-aio.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/coroutine-tls.h"
 #include "trace.h"
 
 /***********************************************************/
@@ -675,12 +676,13 @@ void aio_context_release(AioContext *ctx)
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
@@ -691,6 +693,6 @@ AioContext *qemu_get_current_aio_context(void)
 
 void qemu_set_current_aio_context(AioContext *ctx)
 {
-    assert(!my_aiocontext);
-    my_aiocontext = ctx;
+    assert(!get_my_aiocontext());
+    set_my_aiocontext(ctx);
 }
-- 
2.34.1


