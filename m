Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C404B50F79B
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Apr 2022 11:40:25 +0200 (CEST)
Received: from localhost ([::1]:59234 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1njHgG-00083e-RP
	for lists+qemu-devel@lfdr.de; Tue, 26 Apr 2022 05:40:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52020)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHUs-0003Un-S2
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:28:38 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:49343)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1njHUr-0006Hs-7x
 for qemu-devel@nongnu.org; Tue, 26 Apr 2022 05:28:38 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1650965316;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=q9bbYvJWLT9BBbgM1NVuoRbdhNEVGg4NKYM/okrT8iE=;
 b=NJVKREG6LwTUInqrlZJ73/7Y0Nxh/7dHeelYQ9rdrwaNw7NUtbBYnn6Yexedwv91N02Ngr
 JmtKFrrcB/6Xmx8oA2HlQ4P/Ff13IjL7j4AZBAcKMQUqhit45O00dwpYGbi3y2T5ioezyZ
 9mT92IrNQo6ZhPOx+zMRxpHT/tnKaQE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-34-YAtSpn9bP2izVoCpoZEV1Q-1; Tue, 26 Apr 2022 05:28:35 -0400
X-MC-Unique: YAtSpn9bP2izVoCpoZEV1Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id DAB3A8038E3
 for <qemu-devel@nongnu.org>; Tue, 26 Apr 2022 09:28:34 +0000 (UTC)
Received: from localhost (unknown [10.39.208.22])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 0E8BCC27EAB;
 Tue, 26 Apr 2022 09:28:33 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Subject: [PATCH v2 08/26] Use g_unix_set_fd_nonblocking()
Date: Tue, 26 Apr 2022 13:26:57 +0400
Message-Id: <20220426092715.3931705-9-marcandre.lureau@redhat.com>
In-Reply-To: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
References: <20220426092715.3931705-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Received-SPF: pass client-ip=170.10.133.124;
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
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
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
2.36.0


