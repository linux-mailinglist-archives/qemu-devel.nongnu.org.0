Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id BF23829ED32
	for <lists+qemu-devel@lfdr.de>; Thu, 29 Oct 2020 14:41:52 +0100 (CET)
Received: from localhost ([::1]:42256 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1kY8Bb-0008Kv-Rw
	for lists+qemu-devel@lfdr.de; Thu, 29 Oct 2020 09:41:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41118)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88e-0005ot-FE
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:48 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:22645)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <armbru@redhat.com>) id 1kY88c-0008JB-CO
 for qemu-devel@nongnu.org; Thu, 29 Oct 2020 09:38:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603978724;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=aAvrY18gsWhtfCs+PRf6YPZnkLAFlXIFr47Ukhgadd8=;
 b=Y5jLrmiFooNN5DKB5Avatf4dkwILNPm9obqYFNz5+s/7ygf3zz5fwydQ3UCibYsOK1BI7n
 kmhFmjEdC9OlH3qknosvQuOUFkLvZeFtV3DqJ40AkGEOljPM9sY5A/XZ9H2xkYu7Q/KnG9
 I7axUUU1fT7Gdm4w9F40pTRq4d+d7BY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-470-lB-KYrK1M62iTnnQAF4m4A-1; Thu, 29 Oct 2020 09:38:42 -0400
X-MC-Unique: lB-KYrK1M62iTnnQAF4m4A-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 09BCE1018F79;
 Thu, 29 Oct 2020 13:38:41 +0000 (UTC)
Received: from blackfin.pond.sub.org (ovpn-112-182.ams2.redhat.com
 [10.36.112.182])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 2D19E19930;
 Thu, 29 Oct 2020 13:38:35 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 9FD241138468; Thu, 29 Oct 2020 14:38:33 +0100 (CET)
From: Markus Armbruster <armbru@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 03/11] test-util-sockets: Clean up SocketAddress construction
Date: Thu, 29 Oct 2020 14:38:25 +0100
Message-Id: <20201029133833.3450220-4-armbru@redhat.com>
In-Reply-To: <20201029133833.3450220-1-armbru@redhat.com>
References: <20201029133833.3450220-1-armbru@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=armbru@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=armbru@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/10/29 01:47:28
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, berrange@redhat.com, zxq_yx_007@163.com,
 kraxel@redhat.com, pbonzini@redhat.com, marcandre.lureau@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

The thread functions build the SocketAddress from global variable
@abstract_sock_name and the tight flag passed as pointer
argument (either NULL or (gpointer)1).  There is no need for such
hackery; simply pass the SocketAddress instead.

While there, dumb down g_rand_int_range() to g_random_int().

Signed-off-by: Markus Armbruster <armbru@redhat.com>
---
 tests/test-util-sockets.c | 62 +++++++++++++++------------------------
 1 file changed, 24 insertions(+), 38 deletions(-)

diff --git a/tests/test-util-sockets.c b/tests/test-util-sockets.c
index 9d317e73a6..b1b5628bd5 100644
--- a/tests/test-util-sockets.c
+++ b/tests/test-util-sockets.c
@@ -230,25 +230,14 @@ static void test_socket_fd_pass_num_nocli(void)
 #endif
 
 #ifdef __linux__
-static gchar *abstract_sock_name;
-
 static gpointer unix_server_thread_func(gpointer user_data)
 {
-    SocketAddress addr;
-    Error *err = NULL;
-    int fd = -1;
-    int connfd = -1;
+    int fd;
+    int connfd;
     struct sockaddr_un un;
     socklen_t len = sizeof(un);
 
-    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
-    addr.u.q_unix.path = abstract_sock_name;
-    addr.u.q_unix.has_tight = true;
-    addr.u.q_unix.tight = user_data != NULL;
-    addr.u.q_unix.has_abstract = true;
-    addr.u.q_unix.abstract = true;
-
-    fd = socket_listen(&addr, 1, &err);
+    fd = socket_listen(user_data, 1, &error_abort);
     g_assert_cmpint(fd, >=, 0);
     g_assert(fd_is_socket(fd));
 
@@ -257,69 +246,66 @@ static gpointer unix_server_thread_func(gpointer user_data)
     close(connfd);
 
     close(fd);
-
     return NULL;
 }
 
 static gpointer unix_client_thread_func(gpointer user_data)
 {
-    SocketAddress addr;
-    Error *err = NULL;
-    int fd = -1;
-
-    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
-    addr.u.q_unix.path = abstract_sock_name;
-    addr.u.q_unix.has_tight = true;
-    addr.u.q_unix.tight = user_data != NULL;
-    addr.u.q_unix.has_abstract = true;
-    addr.u.q_unix.abstract = true;
-
-    fd = socket_connect(&addr, &err);
+    int fd;
 
+    fd = socket_connect(user_data, &error_abort);
     g_assert_cmpint(fd, >=, 0);
-
     close(fd);
-
     return NULL;
 }
 
 static void test_socket_unix_abstract_good(void)
 {
-    GRand *r = g_rand_new();
+    SocketAddress addr;
 
-    abstract_sock_name = g_strdup_printf("unix-%d-%d", getpid(),
-                                         g_rand_int_range(r, 100, 1000));
+    addr.type = SOCKET_ADDRESS_TYPE_UNIX;
+    addr.u.q_unix.path = g_strdup_printf("unix-%d-%u",
+                                         getpid(), g_random_int());
+    addr.u.q_unix.has_abstract = true;
+    addr.u.q_unix.abstract = true;
 
     /* non tight socklen serv and cli */
+
+    addr.u.q_unix.has_tight = false;
+    addr.u.q_unix.tight = false;
+
     GThread *serv = g_thread_new("abstract_unix_server",
                                  unix_server_thread_func,
-                                 NULL);
+                                 &addr);
 
     sleep(1);
 
     GThread *cli = g_thread_new("abstract_unix_client",
                                 unix_client_thread_func,
-                                NULL);
+                                &addr);
 
     g_thread_join(cli);
     g_thread_join(serv);
 
     /* tight socklen serv and cli */
+
+    addr.u.q_unix.has_tight = true;
+    addr.u.q_unix.tight = true;
+
     serv = g_thread_new("abstract_unix_server",
                         unix_server_thread_func,
-                        (gpointer)1);
+                        &addr);
 
     sleep(1);
 
     cli = g_thread_new("abstract_unix_client",
                        unix_client_thread_func,
-                       (gpointer)1);
+                       &addr);
 
     g_thread_join(cli);
     g_thread_join(serv);
 
-    g_free(abstract_sock_name);
-    g_rand_free(r);
+    g_free(addr.u.q_unix.path);
 }
 #endif
 
-- 
2.26.2


