Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6341F69E0D0
	for <lists+qemu-devel@lfdr.de>; Tue, 21 Feb 2023 13:52:34 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUS53-0005cH-UD; Tue, 21 Feb 2023 07:49:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4f-0005JI-CK
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:50 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pUS4d-0007w0-QG
 for qemu-devel@nongnu.org; Tue, 21 Feb 2023 07:48:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676983727;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Yq3kv8hzjcp9gr0Ec7g4WVQw2n4/K/1xTE48tBGBpBQ=;
 b=AF1orNNfr6oyk8/nBschJS8ZBHLIwzHePGhsKtxuoQxrncs6y1HWsmqUQex4wkVcGu9QGf
 IbFVE5bBRVebXw42VREGePFy/1U5nIkIsSuihvTluYZN1EyJh+nUzEwd38sCe+FjSgfYKZ
 XMIskh+L3YQCyburX8iiKnhvV6z6azQ=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-369-0UWjF0yXPFGgl6JZDYnaSQ-1; Tue, 21 Feb 2023 07:48:41 -0500
X-MC-Unique: 0UWjF0yXPFGgl6JZDYnaSQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 446022A5957F;
 Tue, 21 Feb 2023 12:48:41 +0000 (UTC)
Received: from localhost (unknown [10.39.208.31])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 2149E492B00;
 Tue, 21 Feb 2023 12:48:39 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Samuel Thibault <samuel.thibault@ens-lyon.org>,
 Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Michael Roth <michael.roth@amd.com>, qemu-arm@nongnu.org,
 Laurent Vivier <lvivier@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org, armbru@redhat.com,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Hajnoczi <stefanha@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Stefan Weil <sw@weilnetz.de>, Fam Zheng <fam@euphon.net>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Joel Stanley <joel@jms.id.au>,
 Hanna Reitz <hreitz@redhat.com>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PATCH v3 08/16] aio: make aio_set_fd_poll() static to aio-posix.c
Date: Tue, 21 Feb 2023 16:47:53 +0400
Message-Id: <20230221124802.4103554-9-marcandre.lureau@redhat.com>
In-Reply-To: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
References: <20230221124802.4103554-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
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


