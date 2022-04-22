Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A3B50B347
	for <lists+qemu-devel@lfdr.de>; Fri, 22 Apr 2022 10:51:09 +0200 (CEST)
Received: from localhost ([::1]:45994 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nhp0O-0006pb-VN
	for lists+qemu-devel@lfdr.de; Fri, 22 Apr 2022 04:51:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42016)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhonx-00079O-3b
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:38:17 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:60427)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1nhonv-0006LK-Cy
 for qemu-devel@nongnu.org; Fri, 22 Apr 2022 04:38:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650616694;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yCXQKip3hTURUTda60npDjuwyxTUET7AbGFj3ReYmm8=;
 b=NoW8YULVyAfBsGL01aGr9vcb9mKK903vGI/74lGfAc5ccmsCThJZa836btAjR25Juqbs70
 26SjinlMLF5TimMNzZsWK8XPMjM/Ojs7v/TSRynEn9xaHf5R0AMQGf4SGA7KrIWQpgFm1W
 VxUHv26Yma+Wx5fWsxp9AeHkDZ7fCeo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-353-mniw_D9AM9uhzedLLrWaXw-1; Fri, 22 Apr 2022 04:38:13 -0400
X-MC-Unique: mniw_D9AM9uhzedLLrWaXw-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4436B185A79C
 for <qemu-devel@nongnu.org>; Fri, 22 Apr 2022 08:38:13 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 6CB90434822;
 Fri, 22 Apr 2022 08:38:12 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH 08/10] Use g_unix_set_fd_nonblocking()
Date: Fri, 22 Apr 2022 12:36:37 +0400
Message-Id: <20220422083639.3156978-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
References: <20220422083639.3156978-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Marc-André Lureau <marcandre.lureau@redhat.com>

API available since glib 2.30. It also preserves errno.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
---
 hw/misc/ivshmem.c           | 2 +-
 util/event_notifier-posix.c | 6 ++----
 util/main-loop.c            | 2 +-
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/hw/misc/ivshmem.c b/hw/misc/ivshmem.c
index e7c0099bdaf6..a1cd3dcc51cf 100644
--- a/hw/misc/ivshmem.c
+++ b/hw/misc/ivshmem.c
@@ -537,7 +537,7 @@ static void process_msg_connect(IVShmemState *s, uint16_t posn, int fd,
 
     IVSHMEM_DPRINTF("eventfds[%d][%d] = %d\n", posn, vector, fd);
     event_notifier_init_fd(&peer->eventfds[vector], fd);
-    fcntl_setfl(fd, O_NONBLOCK); /* msix/irqfd poll non block */
+    g_unix_set_fd_nonblocking(fd, TRUE, NULL); /* msix/irqfd poll non block */
 
     if (posn == s->vm_id) {
         setup_interrupt(s, vector, errp);
diff --git a/util/event_notifier-posix.c b/util/event_notifier-posix.c
index df21c2583e1f..21d40b2f1154 100644
--- a/util/event_notifier-posix.c
+++ b/util/event_notifier-posix.c
@@ -52,13 +52,11 @@ int event_notifier_init(EventNotifier *e, int active)
         if (!g_unix_open_pipe(fds, FD_CLOEXEC, NULL)) {
             return -errno;
         }
-        ret = fcntl_setfl(fds[0], O_NONBLOCK);
-        if (ret < 0) {
+        if (!g_unix_set_fd_nonblocking(fds[0], TRUE, NULL)) {
             ret = -errno;
             goto fail;
         }
-        ret = fcntl_setfl(fds[1], O_NONBLOCK);
-        if (ret < 0) {
+        if (!g_unix_set_fd_nonblocking(fds[1], TRUE, NULL)) {
             ret = -errno;
             goto fail;
         }
diff --git a/util/main-loop.c b/util/main-loop.c
index b7b0ce4ca087..60ac77602bbb 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -114,7 +114,7 @@ static int qemu_signal_init(Error **errp)
         return -errno;
     }
 
-    fcntl_setfl(sigfd, O_NONBLOCK);
+    g_unix_set_fd_nonblocking(sigfd, TRUE, NULL);
 
     qemu_set_fd_handler(sigfd, sigfd_handler, NULL, (void *)(intptr_t)sigfd);
 
-- 
2.36.0


