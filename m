Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EB75142D90
	for <lists+qemu-devel@lfdr.de>; Mon, 20 Jan 2020 15:30:44 +0100 (CET)
Received: from localhost ([::1]:37526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1itY4h-0003Sf-0e
	for lists+qemu-devel@lfdr.de; Mon, 20 Jan 2020 09:30:43 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40079)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1itXv3-0007mI-06
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1itXuz-0006eS-3E
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:44 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:33373
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1itXuy-0006dU-70
 for qemu-devel@nongnu.org; Mon, 20 Jan 2020 09:20:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579530039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=o8BVFrFEfvciksl8D9jN4lPgkp/gkSTZlJEjXrcQiRE=;
 b=i7azWVgXjplOrPxGwA84Hiv2nJgX+MmhHlh27sVy7luf6IJwYhdmSJ9eKxjx0m5Gpzvxh+
 tgcr56OBxrolqlPyPPyVe2pOSBE4P73f1yVfEXuVewRyzm9UbOuYrRFOES85YsQo5JeApf
 VrNdwdOpFaYDEG0ko/6kcci2YMA1EX4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-251-XBgoGrL3PhmUy1H5WZYtkg-1; Mon, 20 Jan 2020 09:20:38 -0500
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 45CBFDB61;
 Mon, 20 Jan 2020 14:20:37 +0000 (UTC)
Received: from localhost (ovpn-117-223.ams2.redhat.com [10.36.117.223])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 9B83C7DB5D;
 Mon, 20 Jan 2020 14:20:29 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v5 10/15] block/io_uring: adds userspace completion polling
Date: Mon, 20 Jan 2020 14:18:53 +0000
Message-Id: <20200120141858.587874-11-stefanha@redhat.com>
In-Reply-To: <20200120141858.587874-1-stefanha@redhat.com>
References: <20200120141858.587874-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-MC-Unique: XBgoGrL3PhmUy1H5WZYtkg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.81
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
Cc: oleksandr@redhat.com, Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Fam Zheng <fam@euphon.net>,
 Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 block/io_uring.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/block/io_uring.c b/block/io_uring.c
index a5c0d16220..56892fd1ab 100644
--- a/block/io_uring.c
+++ b/block/io_uring.c
@@ -274,6 +274,21 @@ static void qemu_luring_completion_cb(void *opaque)
     luring_process_completions_and_submit(s);
 }
=20
+static bool qemu_luring_poll_cb(void *opaque)
+{
+    LuringState *s =3D opaque;
+    struct io_uring_cqe *cqes;
+
+    if (io_uring_peek_cqe(&s->ring, &cqes) =3D=3D 0) {
+        if (cqes) {
+            luring_process_completions_and_submit(s);
+            return true;
+        }
+    }
+
+    return false;
+}
+
 static void ioq_init(LuringQueue *io_q)
 {
     QSIMPLEQ_INIT(&io_q->submit_queue);
@@ -387,7 +402,7 @@ void luring_attach_aio_context(LuringState *s, AioConte=
xt *new_context)
     s->aio_context =3D new_context;
     s->completion_bh =3D aio_bh_new(new_context, qemu_luring_completion_bh=
, s);
     aio_set_fd_handler(s->aio_context, s->ring.ring_fd, false,
-                       qemu_luring_completion_cb, NULL, NULL, s);
+                       qemu_luring_completion_cb, NULL, qemu_luring_poll_c=
b, s);
 }
=20
 LuringState *luring_init(Error **errp)
--=20
2.24.1


