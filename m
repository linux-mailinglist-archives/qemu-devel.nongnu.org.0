Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C14F86B76C4
	for <lists+qemu-devel@lfdr.de>; Mon, 13 Mar 2023 12:53:01 +0100 (CET)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pbgeM-0003qS-4Y; Mon, 13 Mar 2023 07:47:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgeG-0003Cv-SU
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marcandre.lureau@redhat.com>)
 id 1pbgeF-0004Ra-9I
 for qemu-devel@nongnu.org; Mon, 13 Mar 2023 07:47:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1678708046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ctK4P0EoigpL6m8TzkfXT3GOpy1xxNQXZQbM5oEWJQs=;
 b=Dcoj7Z74CxHEe94mT4XQZ/IS0j2dqhhIqQfbDD85aY1jsppvTLhY5e6iGwgKk+CzabBcXd
 CcCHRIqVHQQGugbUsyzXgpAgQLaCRmcBijZRiVaNIF+vjSmOxd9IQs+kiNgDKl7VXLvo+d
 gq+eixDO/dmVknrXsv8DaRjC7rQMNqw=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-534-3MRgM9vJNA6nr-hhT6Sc7w-1; Mon, 13 Mar 2023 07:47:23 -0400
X-MC-Unique: 3MRgM9vJNA6nr-hhT6Sc7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
 [10.11.54.3])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 10B6D86C164;
 Mon, 13 Mar 2023 11:47:23 +0000 (UTC)
Received: from localhost (unknown [10.39.208.8])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F0BE41121318;
 Mon, 13 Mar 2023 11:47:21 +0000 (UTC)
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
Subject: [PULL v2 07/25] win32/socket: introduce qemu_socket_unselect() helper
Date: Mon, 13 Mar 2023 15:46:30 +0400
Message-Id: <20230313114648.426607-8-marcandre.lureau@redhat.com>
In-Reply-To: <20230313114648.426607-1-marcandre.lureau@redhat.com>
References: <20230313114648.426607-1-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Received-SPF: pass client-ip=170.10.133.124;
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

A more explicit version of qemu_socket_select() with no events.

Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
Message-Id: <20230221124802.4103554-8-marcandre.lureau@redhat.com>
---
 include/sysemu/os-win32.h | 2 ++
 io/channel-socket.c       | 4 ++--
 util/oslib-win32.c        | 7 ++++++-
 3 files changed, 10 insertions(+), 3 deletions(-)

diff --git a/include/sysemu/os-win32.h b/include/sysemu/os-win32.h
index 9f842ae643..504a8966c3 100644
--- a/include/sysemu/os-win32.h
+++ b/include/sysemu/os-win32.h
@@ -169,6 +169,8 @@ static inline void qemu_funlockfile(FILE *f)
 bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
                         long lNetworkEvents, Error **errp);
 
+bool qemu_socket_unselect(SOCKET s, Error **errp);
+
 /* We wrap all the sockets functions so that we can
  * set errno based on WSAGetLastError()
  */
diff --git a/io/channel-socket.c b/io/channel-socket.c
index 0bc29c4808..03757c7a7e 100644
--- a/io/channel-socket.c
+++ b/io/channel-socket.c
@@ -442,7 +442,7 @@ static void qio_channel_socket_finalize(Object *obj)
             }
         }
 #ifdef WIN32
-        qemu_socket_select(ioc->fd, NULL, 0, NULL);
+        qemu_socket_unselect(ioc->fd, NULL);
 #endif
         closesocket(ioc->fd);
         ioc->fd = -1;
@@ -846,7 +846,7 @@ qio_channel_socket_close(QIOChannel *ioc,
 
     if (sioc->fd != -1) {
 #ifdef WIN32
-        qemu_socket_select(sioc->fd, NULL, 0, NULL);
+        qemu_socket_unselect(sioc->fd, NULL);
 #endif
         if (qio_channel_has_feature(ioc, QIO_CHANNEL_FEATURE_LISTEN)) {
             socket_listen_cleanup(sioc->fd, errp);
diff --git a/util/oslib-win32.c b/util/oslib-win32.c
index df752fc762..dbd32acc98 100644
--- a/util/oslib-win32.c
+++ b/util/oslib-win32.c
@@ -180,7 +180,7 @@ static int socket_error(void)
 void qemu_socket_set_block(int fd)
 {
     unsigned long opt = 0;
-    qemu_socket_select(fd, NULL, 0, NULL);
+    qemu_socket_unselect(fd, NULL);
     ioctlsocket(fd, FIONBIO, &opt);
 }
 
@@ -298,6 +298,11 @@ bool qemu_socket_select(SOCKET s, WSAEVENT hEventObject,
     return true;
 }
 
+bool qemu_socket_unselect(SOCKET s, Error **errp)
+{
+    return qemu_socket_select(s, NULL, 0, errp);
+}
+
 #undef connect
 int qemu_connect_wrap(int sockfd, const struct sockaddr *addr,
                       socklen_t addrlen)
-- 
2.39.2


