Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 405E7DE71A
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Oct 2019 10:52:06 +0200 (CEST)
Received: from localhost ([::1]:35950 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1iMTQ5-0002o3-B1
	for lists+qemu-devel@lfdr.de; Mon, 21 Oct 2019 04:52:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58189)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <dietmar@proxmox.com>) id 1iMTP9-0002MH-Cz
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:51:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1iMTP8-0005CV-6k
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:51:07 -0400
Received: from 212-186-127-178.static.upcbusiness.at ([212.186.127.178]:53884
 helo=rtest1.maurer-it.com) by eggs.gnu.org with esmtp (Exim 4.71)
 (envelope-from <dietmar@proxmox.com>) id 1iMTP8-0005C3-09
 for qemu-devel@nongnu.org; Mon, 21 Oct 2019 04:51:06 -0400
Received: by rtest1.maurer-it.com (Postfix, from userid 0)
 id 34675506A0C; Mon, 21 Oct 2019 10:51:04 +0200 (CEST)
From: Dietmar Maurer <dietmar@proxmox.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v3] yield_until_fd_readable: make it work with any AioContect
Date: Mon, 21 Oct 2019 10:50:55 +0200
Message-Id: <20191021085055.30852-1-dietmar@proxmox.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 212.186.127.178
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
Cc: Dietmar Maurer <dietmar@proxmox.com>, stefanha@redhat.com
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Simply use qemu_get_current_aio_context().

Signed-off-by: Dietmar Maurer <dietmar@proxmox.com>
---

Changelog for v3:

- use (IOHandler *) instead of ((void (*)(void *))
- coding style: fix max line length

Changelog for v2:

- use correct read handler in aio_set_fd_handler (instead of write handle=
r)

 util/qemu-coroutine-io.c | 21 ++++-----------------
 1 file changed, 4 insertions(+), 17 deletions(-)

diff --git a/util/qemu-coroutine-io.c b/util/qemu-coroutine-io.c
index 44a8969a69..dbbe817464 100644
--- a/util/qemu-coroutine-io.c
+++ b/util/qemu-coroutine-io.c
@@ -66,25 +66,12 @@ qemu_co_send_recv(int sockfd, void *buf, size_t bytes=
, bool do_send)
     return qemu_co_sendv_recvv(sockfd, &iov, 1, 0, bytes, do_send);
 }
=20
-typedef struct {
-    Coroutine *co;
-    int fd;
-} FDYieldUntilData;
-
-static void fd_coroutine_enter(void *opaque)
-{
-    FDYieldUntilData *data =3D opaque;
-    qemu_set_fd_handler(data->fd, NULL, NULL, NULL);
-    qemu_coroutine_enter(data->co);
-}
-
 void coroutine_fn yield_until_fd_readable(int fd)
 {
-    FDYieldUntilData data;
-
     assert(qemu_in_coroutine());
-    data.co =3D qemu_coroutine_self();
-    data.fd =3D fd;
-    qemu_set_fd_handler(fd, fd_coroutine_enter, NULL, &data);
+    AioContext *ctx =3D qemu_get_current_aio_context();
+    aio_set_fd_handler(ctx, fd, false, (IOHandler *)qemu_coroutine_enter=
,
+                       NULL, NULL, qemu_coroutine_self());
     qemu_coroutine_yield();
+    aio_set_fd_handler(ctx, fd, false, NULL, NULL, NULL, NULL);
 }
--=20
2.20.1


