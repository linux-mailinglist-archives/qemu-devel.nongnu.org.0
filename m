Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C5A6B7671
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:47:20 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgbv-0004Iw-CX; Mon, 13 Mar 2023 07:45:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgbV-0003Fr-5F
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:44:39 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgbT-0003Xw-FE
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:44:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678707872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZoKqTSXrt6BQL8awns9NXpQ2ZsLtrEmc/UBtlwS1+8=;
 b=Gg25bJmZgK95AI/A6pYf3rocBpq/mRD02NWEoQl/06cW8ohX1UVDWzuWqRGUT+eeiCvxoY
 MB4fDycqWRU2mVYctDWclkB1quuqWsW6TiTk+5GbXBJDeeQ/fbO/59IgsZbmJQ1ZRyk404
 hSvuskEPUqcvPoOHpyHWB3UozLPqdFM=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-74-WY_-AvWeP8mv0jJwWuGc8Q-1; Mon, 13 Mar 2023 07:44:26 -0400
X-MC-Unique: WY_-AvWeP8mv0jJwWuGc8Q-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com
 [10.11.54.7])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E7713101A52E;
 Mon, 13 Mar 2023 11:44:25 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D22B21410F1D;
 Mon, 13 Mar 2023 11:44:24 +0000 (UTC)
From: marcandre.lureau@redhat.com
To: qemu-devel@nongnu.org
Cc: qemu-block@nongnu.org, Stefan Hajnoczi <stefanha@redhat.com>,
 Samuel Thibault <samuel.thibault@ens-lyon.org>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Stefan Weil <sw@weilnetz.de>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <lvivier@redhat.com>, Joel Stanley <joel@jms.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
 =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Michael Roth <michael.roth@amd.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Beraldo Leal <bleal@redhat.com>,
 Stefan Berger <stefanb@linux.vnet.ibm.com>, Fam Zheng <fam@euphon.net>,
 Hanna Reitz <hreitz@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>
Subject: [PULL 10/25] main-loop: remove qemu_fd_register(),
 win32/slirp/socket specific
Date: Mon, 13 Mar 2023 15:43:20 +0400
Message-Id: <20230313114335.424093-11-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114335.424093-1-marcandre.lureau@redhat.com>
References: <20230313114335.424093-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=marcandre.lureau@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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

Open-code the socket registration where it's needed, to avoid
artificially used or unclear generic interface.

Furthermore, the following patches are going to make socket handling use
FD-only inside QEMU, but we need to handle win32 SOCKET from libslirp.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-12-marcandre.lureau@redhat.com>
---
 include/qemu/main-loop.h |  2 --
 net/slirp.c              |  8 +++++++-
 util/main-loop.c         | 11 -----------
 3 files changed, 7 insertions(+), 14 deletions(-)

diff --git a/include/qemu/main-loop.h b/include/qemu/main-loop.h
index c25f390696..b3e54e00bc 100644
--- a/include/qemu/main-loop.h
+++ b/include/qemu/main-loop.h
@@ -387,8 +387,6 @@ void qemu_cond_timedwait_iothread(QemuCond *cond, int ms);
 
 /* internal interfaces */
 
-void qemu_fd_register(int fd);
-
 #define qemu_bh_new(cb, opaque) \
     qemu_bh_new_full((cb), (opaque), (stringify(cb)))
 QEMUBH *qemu_bh_new_full(QEMUBHFunc *cb, void *opaque, const char *name);
diff --git a/net/slirp.c b/net/slirp.c
index 2ee3f1a0d7..0730a935ba 100644
--- a/net/slirp.c
+++ b/net/slirp.c
@@ -248,7 +248,13 @@ static void net_slirp_timer_mod(void *timer, int64_t expire_timer,
 
 static void net_slirp_register_poll_fd(int fd, void *opaque)
 {
-    qemu_fd_register(fd);
+#ifdef WIN32
+    AioContext *ctxt = qemu_get_aio_context();
+
+    qemu_socket_select(fd, event_notifier_get_handle(&ctxt->notifier),
+                       FD_READ | FD_ACCEPT | FD_CLOSE |
+                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
+#endif
 }
 
 static void net_slirp_unregister_poll_fd(int fd, void *opaque)
diff --git a/util/main-loop.c b/util/main-loop.c
index 16e837fb12..e180c85145 100644
--- a/util/main-loop.c
+++ b/util/main-loop.c
@@ -252,10 +252,6 @@ static int max_priority;
 static int glib_pollfds_idx;
 static int glib_n_poll_fds;
 
-void qemu_fd_register(int fd)
-{
-}
-
 static void glib_pollfds_fill(int64_t *cur_timeout)
 {
     GMainContext *context = g_main_context_default();
@@ -414,13 +410,6 @@ void qemu_del_wait_object(HANDLE handle, WaitObjectFunc *func, void *opaque)
     }
 }
 
-void qemu_fd_register(int fd)
-{
-    qemu_socket_select(fd, event_notifier_get_handle(&qemu_aio_context->notifier),
-                       FD_READ | FD_ACCEPT | FD_CLOSE |
-                       FD_CONNECT | FD_WRITE | FD_OOB, NULL);
-}
-
 static int pollfds_fill(GArray *pollfds, fd_set *rfds, fd_set *wfds,
                         fd_set *xfds)
 {
-- 
2.39.2


