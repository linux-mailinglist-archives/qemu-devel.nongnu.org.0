Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 695D73FD9F2
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Sep 2021 15:07:12 +0200 (CEST)
Received: from localhost ([::1]:52430 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mLPxP-0001A8-8d
	for lists+qemu-devel@lfdr.de; Wed, 01 Sep 2021 09:07:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41076)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLPhy-0005zB-Lq; Wed, 01 Sep 2021 08:51:14 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:35687)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mLPhw-0005u2-Dc; Wed, 01 Sep 2021 08:51:14 -0400
Received: from tls.msk.ru (mjt-x200la.wg.tls.msk.ru [192.168.177.132])
 by isrv.corpit.ru (Postfix) with SMTP id B2A4A4000A;
 Wed,  1 Sep 2021 15:51:08 +0300 (MSK)
Received: (nullmailer pid 42110 invoked by uid 1000);
 Wed, 01 Sep 2021 12:51:08 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v2] qemu-sockets: fix unix socket path copy (again)
Date: Wed,  1 Sep 2021 15:50:55 +0300
Message-Id: <20210901125055.41915-1-mjt@msgid.tls.msk.ru>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: none client-ip=86.62.121.231; envelope-from=mjt@tls.msk.ru;
 helo=isrv.corpit.ru
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_HI=-5,
 SPF_HELO_NONE=0.001, SPF_NONE=0.001 autolearn=ham autolearn_force=no
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
Cc: =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Michael Tokarev <mjt@tls.msk.ru>,
 =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-stable@nongnu.org, Peter Maydell <peter.maydell@linaro.org>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Commit 4cfd970ec188558daa6214f26203fe553fb1e01f added an
assert which ensures the path within an address of a unix
socket returned from the kernel is at least one byte and
does not exceed sun_path buffer. Both of this constraints
are wrong:

A unix socket can be unnamed, in this case the path is
completely empty (not even \0)

And some implementations (notable linux) can add extra
trailing byte (\0) _after_ the sun_path buffer if we
passed buffer larger than it (and we do).

So remove the assertion (since it causes real-life breakage)
but at the same time fix the usage of sun_path. Namely,
we should not access sun_path[0] if kernel did not return
it at all (this is the case for unnamed sockets),
and use the returned salen when copyig actual path as an
upper constraint for the amount of bytes to copy - this
will ensure we wont exceed the information provided by
the kernel, regardless whenever there is a trailing \0
or not. This also helps with unnamed sockets.

Note the case of abstract socket, the sun_path is actually
a blob and can contain \0 characters, - it should not be
passed to g_strndup and the like, it should be accessed by
memcpy-like functions.

Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f
Fixes: http://bugs.debian.org/993145
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
CC: qemu-stable@nongnu.org
---
 util/qemu-sockets.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..842bd707ac 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1345,13 +1345,11 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     SocketAddress *addr;
     struct sockaddr_un *su = (struct sockaddr_un *)sa;
 
-    assert(salen >= sizeof(su->sun_family) + 1 &&
-           salen <= sizeof(struct sockaddr_un));
-
     addr = g_new0(SocketAddress, 1);
     addr->type = SOCKET_ADDRESS_TYPE_UNIX;
+    salen -= offsetof(struct sockaddr_un, sun_path);
 #ifdef CONFIG_LINUX
-    if (!su->sun_path[0]) {
+    if (salen > 0 && !su->sun_path[0]) {
         /* Linux abstract socket */
         addr->u.q_unix.path = g_strndup(su->sun_path + 1,
                                         salen - sizeof(su->sun_family) - 1);
@@ -1363,7 +1361,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     }
 #endif
 
-    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
+    addr->u.q_unix.path = g_strndup(su->sun_path, salen);
     return addr;
 }
 #endif /* WIN32 */
-- 
2.30.2


