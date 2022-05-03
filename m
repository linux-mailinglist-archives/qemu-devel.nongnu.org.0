Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id AC40251904D
	for <lists+qemu-devel@lfdr.de>; Tue,  3 May 2022 23:38:50 +0200 (CEST)
Received: from localhost ([::1]:38712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nm0EL-0000XO-MT
	for lists+qemu-devel@lfdr.de; Tue, 03 May 2022 17:38:49 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44748)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyuG-0000TJ-TY
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:14:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:44478)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nlyuD-0002xC-TT
 for qemu-devel@nongnu.org; Tue, 03 May 2022 16:14:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1651608833;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WzRy/RaI9MhxFyECgyDG//yYxBQzB5Yathm3QqKh3CA=;
 b=MKFRuLm6CexA8du5ZcX4YJOLTcULfWVbTtxrGJWTUars9dRp9y29RbwKqWWLY5lzAkGJn0
 Sgh+2WoPKZMOBMYJu52w8tZJChnWN434zWTQlr8c4QrTQVeFPQj0VvqUoRJDKJuqfb5HS7
 +87W4uRFJNmeC/ExzHeV3YG7I97h6hk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-410-xhPpL0M0MBS0z9QrtI8eZA-1; Tue, 03 May 2022 11:33:59 -0400
X-MC-Unique: xhPpL0M0MBS0z9QrtI8eZA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 9DE09131A708;
 Tue,  3 May 2022 13:01:01 +0000 (UTC)
Received: from localhost (unknown [10.39.208.46])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 97EB753CD;
 Tue,  3 May 2022 13:00:57 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>
Subject: [PULL 05/23] Use g_unix_set_fd_nonblocking()
Date: Tue,  3 May 2022 17:00:05 +0400
Message-Id: <20220503130023.180544-6-marcandre.lureau@redhat.com>
In-Reply-To: <20220503130023.180544-1-marcandre.lureau@redhat.com>
References: <20220503130023.180544-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=marcandre.lureau@redhat.com;
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

API available since glib 2.30. It also preserves errno.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 hw/misc/ivshmem.c           | 2 +-
 util/event_notifier-posix.c | 6 ++----
 util/main-loop.c            | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index e7c0099bdaf6..8270db53cda7 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -537,7 +537,7 @@ static void process_msg_connect(IVShmemState *s, uint16_t posn, int fd,
 
     IVSHMEM_DPRINTF("eventfds[%d][%d] = %d\n", posn, vector, fd);
     event_notifier_init_fd(&peer->eventfds[vector], fd);
-    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
+    g_unix_set_fd_nonblocking(fd, true, NULL); /* msix/irqfd poll non block */
 
     if (posn == s->vm_id) {
         setup_interrupt(s, vector, errp);
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index 8dc30c51414d..2aa14eabb38e 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -52,13 +52,11 @@ int event_notifier_init(EventNotifier *e, int active)
         if (qemu_pipe(fds) < 0) {
             return -errno;
         }
-        ret = fcntl_setfl(fds[0], O_NONBLOCK);
-        if (ret < 0) {
+        if (!g_unix_set_fd_nonblocking(fds[0], true, NULL)) {
             ret = -errno;
             goto fail;
         }
-        ret = fcntl_setfl(fds[1], O_NONBLOCK);
-        if (ret < 0) {
+        if (!g_unix_set_fd_nonblocking(fds[1], true, NULL)) {
             ret = -errno;
             goto fail;
         }
diff --git a/util/main-loop.c b/util/main-loop.c
index b7b0ce4ca087..9afac10dff0f 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -114,7 +114,7 @@ static int qemu_signal_init(Error **errp)
         return -errno;
     }
 
-    fcntl_setfl(sigfd, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(sigfd, true, NULL);
 
     qemu_set_fd_handler(sigfd, sigfd_handler, NULL, (void *)(intptr_t)sigfd);
 
-- 
2.36.0.44.g0f828332d5ac


