Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B144BFA73
	for <lists+qemu-devel@lfdr.de>; Tue, 22 Feb 2022 15:10:48 +0100 (CET)
Received: from localhost ([::1]:60710 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nMVsM-0002wS-3N
	for lists+qemu-devel@lfdr.de; Tue, 22 Feb 2022 09:10:46 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60718)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMVkp-0003OI-EQ
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:03:01 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:45089)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1nMVki-00064Y-1n
 for qemu-devel@nongnu.org; Tue, 22 Feb 2022 09:02:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1645538564;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ydAFJulO1fktYGT+VeP4DNbUV9UD3tPDkgP+u0FXbQ0=;
 b=T7vSJc4kP/3AM6ZaZeB9tyE4iQZfixcwV2Hh95dsjCoYayR4XMRHVKpO1lzarHpZsrxC9n
 7NZQVjnLg0p3H1L6yrd6iOEL2nYbcXJLFS5hpRs+oGof2TvDDt/4yImMDLgVa8ONl7O6Mp
 YT40TjDY9+aqu2q5iLOnrH0egUBhRh0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-118-WX21vylYO86HRzGIXMuDeA-1; Tue, 22 Feb 2022 09:02:41 -0500
X-MC-Unique: WX21vylYO86HRzGIXMuDeA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 26751193578B;
 Tue, 22 Feb 2022 14:02:40 +0000 (UTC)
Received: from localhost (unknown [10.39.195.202])
 by smtp.corp.redhat.com (Postfix) with ESMTP id AF10D832AF;
 Tue, 22 Feb 2022 14:02:39 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 2/4] util/async: replace __thread with QEMU TLS macros
Date: Tue, 22 Feb 2022 14:01:48 +0000
Message-Id: <20220222140150.27240-3-stefanha@redhat.com>
In-Reply-To: <20220222140150.27240-1-stefanha@redhat.com>
References: <20220222140150.27240-1-stefanha@redhat.com>
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
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 Florian Weimer <fweimer@redhat.com>, qemu-block@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Serge Guelton <sguelton@redhat.com>
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


