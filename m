Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AA113A7FA
	for <lists+qemu-devel@lfdr.de>; Tue, 14 Jan 2020 12:09:26 +0100 (CET)
Received: from localhost ([::1]:37018 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1irK4b-0000bq-54
	for lists+qemu-devel@lfdr.de; Tue, 14 Jan 2020 06:09:25 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:47707)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <stefanha@redhat.com>) id 1irJw0-0008MN-KW
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <stefanha@redhat.com>) id 1irJvw-0006eS-Ku
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:32 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:23823
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <stefanha@redhat.com>) id 1irJvw-0006eB-Gs
 for qemu-devel@nongnu.org; Tue, 14 Jan 2020 06:00:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1578999628;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=a3+DyTGEcN2TwzdQ2sDklxF9uNtETYiLnrP9Dbk3Nys=;
 b=ODHJ9oyAu2kfNN6D4i40SqYEKDeBqPfQFT1SwX74TNNcL0fHFj26EeSE2/frsGvBrjG9Pk
 FQ0vLn4KlbBWQqDkT2rxsbt7sgZD331w9zmS52QS/UzGf9NeE40lMR0CJTZItc8HZMSrFK
 VXY5qOTOq84G4N6u1wyPJG1VtQOBS9E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-MR72rQuDPMqbh44TWf13aA-1; Tue, 14 Jan 2020 06:00:24 -0500
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 55425DB34;
 Tue, 14 Jan 2020 11:00:23 +0000 (UTC)
Received: from localhost (unknown [10.36.118.18])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5E6126FB9;
 Tue, 14 Jan 2020 11:00:14 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 06/15] util/async: add aio interfaces for io_uring
Date: Tue, 14 Jan 2020 10:59:12 +0000
Message-Id: <20200114105921.131880-7-stefanha@redhat.com>
In-Reply-To: <20200114105921.131880-1-stefanha@redhat.com>
References: <20200114105921.131880-1-stefanha@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-MC-Unique: MR72rQuDPMqbh44TWf13aA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 qemu-block@nongnu.org, oleksandr@redhat.com,
 Julia Suvorova <jusual@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Aarushi Mehta <mehta.aaru20@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Aarushi Mehta <mehta.aaru20@gmail.com>

Signed-off-by: Aarushi Mehta <mehta.aaru20@gmail.com>
Acked-by: Stefano Garzarella <sgarzare@redhat.com>
Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
---
 util/async.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/util/async.c b/util/async.c
index b1fa5319e5..c192a24a61 100644
--- a/util/async.c
+++ b/util/async.c
@@ -276,6 +276,14 @@ aio_ctx_finalize(GSource     *source)
     }
 #endif
=20
+#ifdef CONFIG_LINUX_IO_URING
+    if (ctx->linux_io_uring) {
+        luring_detach_aio_context(ctx->linux_io_uring, ctx);
+        luring_cleanup(ctx->linux_io_uring);
+        ctx->linux_io_uring =3D NULL;
+    }
+#endif
+
     assert(QSLIST_EMPTY(&ctx->scheduled_coroutines));
     qemu_bh_delete(ctx->co_schedule_bh);
=20
@@ -340,6 +348,29 @@ LinuxAioState *aio_get_linux_aio(AioContext *ctx)
 }
 #endif
=20
+#ifdef CONFIG_LINUX_IO_URING
+LuringState *aio_setup_linux_io_uring(AioContext *ctx, Error **errp)
+{
+    if (ctx->linux_io_uring) {
+        return ctx->linux_io_uring;
+    }
+
+    ctx->linux_io_uring =3D luring_init(errp);
+    if (!ctx->linux_io_uring) {
+        return NULL;
+    }
+
+    luring_attach_aio_context(ctx->linux_io_uring, ctx);
+    return ctx->linux_io_uring;
+}
+
+LuringState *aio_get_linux_io_uring(AioContext *ctx)
+{
+    assert(ctx->linux_io_uring);
+    return ctx->linux_io_uring;
+}
+#endif
+
 void aio_notify(AioContext *ctx)
 {
     /* Write e.g. bh->scheduled before reading ctx->notify_me.  Pairs
@@ -434,6 +465,11 @@ AioContext *aio_context_new(Error **errp)
 #ifdef CONFIG_LINUX_AIO
     ctx->linux_aio =3D NULL;
 #endif
+
+#ifdef CONFIG_LINUX_IO_URING
+    ctx->linux_io_uring =3D NULL;
+#endif
+
     ctx->thread_pool =3D NULL;
     qemu_rec_mutex_init(&ctx->lock);
     timerlistgroup_init(&ctx->tlg, aio_timerlist_notify, ctx);
--=20
2.24.1


