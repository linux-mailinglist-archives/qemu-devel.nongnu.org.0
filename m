Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id A011D43982D
	for <lists+qemu-devel@lfdr.de>; Mon, 25 Oct 2021 16:10:45 +0200 (CEST)
Received: from localhost ([::1]:34746 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mf0gW-0000Ke-Nk
	for lists+qemu-devel@lfdr.de; Mon, 25 Oct 2021 10:10:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53984)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mf0e0-0005jO-Rx
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:08:08 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:22523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1mf0dz-0007BQ-5i
 for qemu-devel@nongnu.org; Mon, 25 Oct 2021 10:08:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635170886;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KVOZarH7FxXwDtHRZjgxDqcMnaa6ic4D8J0+jqzi6cY=;
 b=GHhFR5snbcSTQhlkitSaWaDp7HHnoNaEtfAa2qhnYoXC3UIfAqQl1zgt6/fhMtY9tDbt9r
 tOUvuRwFuoddap/lEB2oYkRqxduLuMT4xcMSVsWD6K3LDJTJUqyrtpSY0Hw6mA3f2F0lOX
 ul3g+AjN9x275ylwh1fcVBulwYTH070=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-_JZRSp8pNxe8hqLipNs0Bw-1; Mon, 25 Oct 2021 10:08:03 -0400
X-MC-Unique: _JZRSp8pNxe8hqLipNs0Bw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0DA34806698;
 Mon, 25 Oct 2021 14:08:02 +0000 (UTC)
Received: from localhost (unknown [10.39.192.215])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2268419C79;
 Mon, 25 Oct 2021 14:07:57 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [RFC 2/2] util/async: replace __thread with QEMU TLS macros
Date: Mon, 25 Oct 2021 15:07:16 +0100
Message-Id: <20211025140716.166971-3-stefanha@redhat.com>
In-Reply-To: <20211025140716.166971-1-stefanha@redhat.com>
References: <20211025140716.166971-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=stefanha@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=stefanha@redhat.com;
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
Cc: fweimer@redhat.com, Kevin Wolf <kwolf@redhat.com>, thuth@redhat.com,
 qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Fam Zheng <fam@euphon.net>, sguelton@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

QEMU TLS macros must be used to make TLS variables safe with coroutines.

Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/async.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/util/async.c b/util/async.c
index 6f6717a34b..9033f22a20 100644
--- a/util/async.c
+++ b/util/async.c
@@ -32,6 +32,7 @@
 #include "qemu/rcu_queue.h"
 #include "block/raw-aio.h"
 #include "qemu/coroutine_int.h"
+#include "qemu/tls.h"
 #include "trace.h"
 
 /***********************************************************/
@@ -669,12 +670,13 @@ void aio_context_release(AioContext *ctx)
     qemu_rec_mutex_unlock(&ctx->lock);
 }
 
-static __thread AioContext *my_aiocontext;
+QEMU_DEFINE_STATIC_TLS(AioContext *, my_aiocontext)
 
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
2.31.1


