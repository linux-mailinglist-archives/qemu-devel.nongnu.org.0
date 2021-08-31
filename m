Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F057B3FCCFE
	for <lists+qemu-devel@lfdr.de>; Tue, 31 Aug 2021 20:34:03 +0200 (CEST)
Received: from localhost ([::1]:41620 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mL8aA-00075T-KZ
	for lists+qemu-devel@lfdr.de; Tue, 31 Aug 2021 14:34:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37620)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL8Sx-0005vj-GZ; Tue, 31 Aug 2021 14:26:35 -0400
Received: from isrv.corpit.ru ([86.62.121.231]:45923)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mjt@tls.msk.ru>)
 id 1mL8Sv-0008NM-Ck; Tue, 31 Aug 2021 14:26:35 -0400
Received: from tsrv.corpit.ru (tsrv.tls.msk.ru [192.168.177.2])
 by isrv.corpit.ru (Postfix) with ESMTP id 79AC840835;
 Tue, 31 Aug 2021 21:26:29 +0300 (MSK)
Received: from tls.msk.ru (mjt.wg.tls.msk.ru [192.168.177.130])
 by tsrv.corpit.ru (Postfix) with SMTP id 599FC71;
 Tue, 31 Aug 2021 21:26:29 +0300 (MSK)
Received: (nullmailer pid 1792658 invoked by uid 1000);
 Tue, 31 Aug 2021 18:26:29 -0000
From: Michael Tokarev <mjt@tls.msk.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH] qemu-sockets: fix unix socket path copy (again)
Date: Tue, 31 Aug 2021 21:26:23 +0300
Message-Id: <20210831182623.1792608-1-mjt@msgid.tls.msk.ru>
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
 qemu-stable@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

We test whenever the path of unix-domain socket
address is non-empty and strictly-less than
the length of the path buffer. Both these
conditions are wrong: the socket can be unnamed,
with empty path, or socket can have pathname
null-terminated _after_ the sun_path buffer,
since we provided more room when asking kernel.

So on one side, allow empty, unnamed sockets
(and adjust the test for abstract socket too -
only do that if the socket is not unnamed),
and on another side, allow path length to be
up to our own maximum, - we have up to size
of sockaddr_storage there.

While at it, fix the duplication of regular
pathname socket to not require trailing \0
(since it can be missing for unnamed sockets).

Fixes: 4cfd970ec188558daa6214f26203fe553fb1e01f (first in 6.1.0)
Fixes: http://bugs.debian.org/993145
Signed-off-by: Michael Tokarev <mjt@tls.msk.ru>
Cc: qemu-stable@nongnu.org
--
Two questions.
1. Why do we store the name of the socket to start with?
2. The code in the abstract socket case should not use
   g_strndup but g_memdup instead, since the whole thing
   is a blob of the given length, not a \0-terminated string.
---
 util/qemu-sockets.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/util/qemu-sockets.c b/util/qemu-sockets.c
index f2f3676d1f..7c83d81792 100644
--- a/util/qemu-sockets.c
+++ b/util/qemu-sockets.c
@@ -1345,13 +1345,20 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     SocketAddress *addr;
     struct sockaddr_un *su = (struct sockaddr_un *)sa;
 
-    assert(salen >= sizeof(su->sun_family) + 1 &&
-           salen <= sizeof(struct sockaddr_un));
+    /* there's a corner case when trailing \0 does not fit into
+     * sockaddr_un. Compare length with sizeof(sockaddr_storage),
+     * not with sizeof(sockaddr_un), since this is what we actually
+     * provide, to ensure we had no truncation and a room for
+     * the trailing \0 which we add below.
+     * When salen == sizeof(sun_family) it is unnamed socket,
+     * and when first byte of sun_path is \0, it is abstract. */
+    assert(salen >= sizeof(su->sun_family) &&
+           salen <= sizeof(struct sockaddr_storage));
 
     addr = g_new0(SocketAddress, 1);
     addr->type = SOCKET_ADDRESS_TYPE_UNIX;
 #ifdef CONFIG_LINUX
-    if (!su->sun_path[0]) {
+    if (salen > sizeof(su->sun_family) && !su->sun_path[0]) {
         /* Linux abstract socket */
         addr->u.q_unix.path = g_strndup(su->sun_path + 1,
                                         salen - sizeof(su->sun_family) - 1);
@@ -1363,7 +1370,7 @@ socket_sockaddr_to_address_unix(struct sockaddr_storage *sa,
     }
 #endif
 
-    addr->u.q_unix.path = g_strndup(su->sun_path, sizeof(su->sun_path));
+    addr->u.q_unix.path = g_strndup(su->sun_path, salen - sizeof(su->sun_family));
     return addr;
 }
 #endif /* WIN32 */
-- 
2.30.2


