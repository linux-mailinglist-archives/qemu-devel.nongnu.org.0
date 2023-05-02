Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CA686F49D9
	for <lists+qemu-devel@lfdr.de>; Tue,  2 May 2023 20:43:02 +0200 (CEST)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1ptuwk-0000Da-Te; Tue, 02 May 2023 14:41:54 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptuwc-0000C5-Vg
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:41:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <stefanha@redhat.com>)
 id 1ptuwa-0006VL-QB
 for qemu-devel@nongnu.org; Tue, 02 May 2023 14:41:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1683052902;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=H7vIks9UEFqTKFtvrEQHkkXCD/De6mk/vvL9W/5hg1o=;
 b=AHWhTKHf2pcOIezWdaIOKn3vGhYGBufNwyDtg2oK8wJrL0Pe20zwuWhp60BGfdzhFvn8kO
 bLxvidLp8auqplfcTkv4rzn94cq91AwSJso1fMhytUDwfoS9HrDtp6vxj6WrEW946hAPeF
 zv6hSPAc2ZTcjZv4SkMGsHH2NaZY42I=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-315-3tRhBOUhMrWU1Rt5WFRQJg-1; Tue, 02 May 2023 14:41:39 -0400
X-MC-Unique: 3tRhBOUhMrWU1Rt5WFRQJg-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D36F800B35;
 Tue,  2 May 2023 18:41:39 +0000 (UTC)
Received: from localhost (unknown [10.39.192.230])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BA3A340BC798;
 Tue,  2 May 2023 18:41:38 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Cc: Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, qemu-block@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>,
 Emanuele Giuseppe Esposito <eesposit@redhat.com>
Subject: [PATCH 1/2] aio-posix: do not nest poll handlers
Date: Tue,  2 May 2023 14:41:33 -0400
Message-Id: <20230502184134.534703-2-stefanha@redhat.com>
In-Reply-To: <20230502184134.534703-1-stefanha@redhat.com>
References: <20230502184134.534703-1-stefanha@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.2
Received-SPF: pass client-ip=170.10.129.124; envelope-from=stefanha@redhat.com;
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

QEMU's event loop supports nesting, which means that event handler
functions may themselves call aio_poll(). The condition that triggered a
handler must be reset before the nested aio_poll() call, otherwise the
same handler will be called and immediately re-enter aio_poll. This
leads to an infinite loop and stack exhaustion.

Poll handlers are especially prone to this issue, because they typically
reset their condition by finishing the processing of pending work.
Unfortunately it is during the processing of pending work that nested
aio_poll() calls typically occur and the condition has not yet been
reset.

Disable a poll handler during ->io_poll_ready() so that a nested
aio_poll() call cannot invoke ->io_poll_ready() again. As a result, the
disabled poll handler and its associated fd handler do not run during
the nested aio_poll(). Calling aio_set_fd_handler() from inside nested
aio_poll() could cause it to run again. If the fd handler is pending
inside nested aio_poll(), then it will also run again.

In theory fd handlers can be affected by the same issue, but they are
more likely to reset the condition before calling nested aio_poll().

This is a special case and it's somewhat complex, but I don't see a way
around it as long as nested aio_poll() is supported.

Buglink: https://bugzilla.redhat.com/show_bug.cgi?id=2186181
Fixes: c38270692593 ("block: Mark bdrv_co_io_(un)plug() and callers GRAPH_RDLOCK")
Cc: Kevin Wolf <kwolf@redhat.com>
Cc: Emanuele Giuseppe Esposito <eesposit@redhat.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/aio-posix.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/util/aio-posix.c b/util/aio-posix.c
index a8be940f76..34bc2a64d8 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -353,8 +353,19 @@ static bool aio_dispatch_handler(AioContext *ctx, AioHandler *node)
         poll_ready && revents == 0 &&
         aio_node_check(ctx, node->is_external) &&
         node->io_poll_ready) {
+        /*
+         * Remove temporarily to avoid infinite loops when ->io_poll_ready()
+         * calls aio_poll() before clearing the condition that made the poll
+         * handler become ready.
+         */
+        QLIST_SAFE_REMOVE(node, node_poll);
+
         node->io_poll_ready(node->opaque);
 
+        if (!QLIST_IS_INSERTED(node, node_poll)) {
+            QLIST_INSERT_HEAD(&ctx->poll_aio_handlers, node, node_poll);
+        }
+
         /*
          * Return early since revents was zero. aio_notify() does not count as
          * progress.
-- 
2.40.1


