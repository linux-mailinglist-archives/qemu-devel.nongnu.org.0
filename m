Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CCA16B76DD
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:53:55 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgeR-0004UV-A7; Mon, 13 Mar 2023 07:47:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgeN-0004Ff-67
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:35 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgeL-0004UT-CL
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708052;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+WQwSwzIT10nPJnT3+0kLlVrIxZlCbistZ5wXabtCUE=;
 b=da4k5bl0HPkRK5wCkLFTchemLfvvAfdJhrxiy/yBDtxqmZg99+ZsZKIKjvpi2nrMN5DoxN
 9LgHJZT6PcdXXHTDvp2NGCnsN8wsUYHyK3ZxAHpet2/CBi2JBm3Ros+xOti0GponPEalsQ
 FFDOzkJ1CqwJ33ECXVKfN3QLe9+QVL8=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-215-FeLLXPnzPzyNMe7x3XRYBQ-1; Mon, 13 Mar 2023 07:47:29 -0400
X-MC-Unique: FeLLXPnzPzyNMe7x3XRYBQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com
 [10.11.54.1])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 921B129DD987;
 Mon, 13 Mar 2023 11:47:28 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D8894042AC0;
 Mon, 13 Mar 2023 11:47:26 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Eric Blake <eblake@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Hanna Reitz <hreitz@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Thomas Huth <thuth@redhat.com>, Fam Zheng <fam@euphon.net>,
 Beraldo Leal <bleal@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Jason Wang <jasowang@redhat.com>, Michael Roth <michael.roth@amd.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, qemu-arm@nongnu.org,
 Joel Stanley <joel@jms.id.au>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, Laurent Vivier <lvivier@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>
Subject: [PULL v2 08/25] aio: make aio_set_fd_poll() static to aio-posix.c
Date: Mon, 13 Mar 2023 15:46:31 +0400
Message-Id: <20230313114648.426607-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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

From: Marc-André Lureau <marcandre.lureau@redhat.com>

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-9-marcandre.lureau@redhat.com>
---
 include/block/aio.h | 8 --------
 util/aio-posix.c    | 6 +++---
 util/aio-win32.c    | 7 -------
 3 files changed, 3 insertions(+), 18 deletions(-)

diff --git a/include/block/aio.h b/include/block/aio.h
index 8fba6a3584..543717f294 100644
--- a/include/block/aio.h
+++ b/include/block/aio.h
@@ -482,14 +482,6 @@ void aio_set_fd_handler(AioContext *ctx,
                         IOHandler *io_poll_ready,
                         void *opaque);
 
-/* Set polling begin/end callbacks for a file descriptor that has already been
- * registered with aio_set_fd_handler.  Do nothing if the file descriptor is
- * not registered.
- */
-void aio_set_fd_poll(AioContext *ctx, int fd,
-                     IOHandler *io_poll_begin,
-                     IOHandler *io_poll_end);
-
 /* Register an event notifier and associated callbacks.  Behaves very similarly
  * to event_notifier_set_handler.  Unlike event_notifier_set_handler, these callbacks
  * will be invoked when using aio_poll().
diff --git a/util/aio-posix.c b/util/aio-posix.c
index 6cc6256d53..a8be940f76 100644
--- a/util/aio-posix.c
+++ b/util/aio-posix.c
@@ -180,9 +180,9 @@ void aio_set_fd_handler(AioContext *ctx,
     }
 }
 
-void aio_set_fd_poll(AioContext *ctx, int fd,
-                     IOHandler *io_poll_begin,
-                     IOHandler *io_poll_end)
+static void aio_set_fd_poll(AioContext *ctx, int fd,
+                            IOHandler *io_poll_begin,
+                            IOHandler *io_poll_end)
 {
     AioHandler *node = find_aio_handler(ctx, fd);
 
diff --git a/util/aio-win32.c b/util/aio-win32.c
index be5136e486..74d63fa21e 100644
--- a/util/aio-win32.c
+++ b/util/aio-win32.c
@@ -125,13 +125,6 @@ void aio_set_fd_handler(AioContext *ctx,
     aio_notify(ctx);
 }
 
-void aio_set_fd_poll(AioContext *ctx, int fd,
-                     IOHandler *io_poll_begin,
-                     IOHandler *io_poll_end)
-{
-    /* Not implemented */
-}
-
 void aio_set_event_notifier(AioContext *ctx,
                             EventNotifier *e,
                             bool is_external,
-- 
2.39.2


