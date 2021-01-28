Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id E91E7307F5F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:18:10 +0100 (CET)
Received: from localhost ([::1]:32796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5Dk1-0006Ji-Sm
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:18:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5Dgb-0004U8-FC; Thu, 28 Jan 2021 15:14:37 -0500
Received: from forwardcorp1p.mail.yandex.net
 ([2a02:6b8:0:1472:2741:0:8b6:217]:45074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5DgU-0002kA-TK; Thu, 28 Jan 2021 15:14:37 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1p.mail.yandex.net (Yandex) with ESMTP id 8DAEF2E1AC0;
 Thu, 28 Jan 2021 23:14:25 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 f265UETGZn-EPwSqL8c; Thu, 28 Jan 2021 23:14:25 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611864865; bh=KRyR0vXaSOGmYq/LWT3lr62EA7h3B5scd73hSVpIApU=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=10EXSasudhHnARESPuQZz8xJPZI6RtVtT6D9zphEJnx8I2GRZhUitGr9deJ1FYWSU
 mWArIehEfp80W3MH9HRmfbKzeYe+ktRTxD30GxzefoiHjSZJkdPYp0l384rCyiJ4gO
 xypZcLD5yEE9y54mBet8j0BO+TTi3OGVr8fX0GUA=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:420::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 fjMENJuJUJ-EOmWAkcj; Thu, 28 Jan 2021 23:14:25 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] block/nbd: only enter connection coroutine if it's present
Date: Thu, 28 Jan 2021 23:14:17 +0300
Message-Id: <20210128201418.607640-3-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128201418.607640-1-rvkagan@yandex-team.ru>
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a02:6b8:0:1472:2741:0:8b6:217;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1p.mail.yandex.net
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>, qemu-block@nongnu.org,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When an NBD block driver state is moved from one aio_context to another
(e.g. when doing a drain in a migration thread),
nbd_client_attach_aio_context_bh is executed that enters the connection
coroutine.

However, the assumption that ->connection_co is always present here
appears incorrect: the connection may have encountered an error other
than -EIO in the underlying transport, and thus may have decided to quit
rather than keep trying to reconnect, and therefore it may have
terminated the connection coroutine.  As a result an attempt to reassign
the client in this state (NBD_CLIENT_QUIT) to a different aio_context
leads to a null pointer dereference:

    at /build/qemu-6MF7tq/qemu-5.0.1/util/qemu-coroutine.c:109
    opaque=0x561805ed4c00) at /build/qemu-6MF7tq/qemu-5.0.1/block/nbd.c:164
    at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-wait.c:55
    at /build/qemu-6MF7tq/qemu-5.0.1/util/async.c:136
    at /build/qemu-6MF7tq/qemu-5.0.1/util/async.c:164
    blocking=blocking@entry=true)
    at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-posix.c:650
    cb=<optimized out>, opaque=<optimized out>)
    at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-wait.c:71
    bs=0x561805ed4c00) at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6172
    new_context=new_context@entry=0x5618056c7580,
    ignore=ignore@entry=0x7f60e1e63780)
    at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6237
    bs=bs@entry=0x561805ed4c00, ctx=0x5618056c7580,
    ignore_child=<optimized out>, errp=<optimized out>)
    at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6332
    new_context=0x5618056c7580, update_root_node=update_root_node@entry=true,
    errp=errp@entry=0x0)
    at /build/qemu-6MF7tq/qemu-5.0.1/block/block-backend.c:1989
    new_context=<optimized out>, errp=errp@entry=0x0)
    at /build/qemu-6MF7tq/qemu-5.0.1/block/block-backend.c:2010
    at /build/qemu-6MF7tq/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
    at /build/qemu-6MF7tq/qemu-5.0.1/hw/virtio/virtio-bus.c:245
    running=0, state=<optimized out>)
    at /build/qemu-6MF7tq/qemu-5.0.1/hw/virtio/virtio.c:3220
    state=state@entry=RUN_STATE_FINISH_MIGRATE)
    at /build/qemu-6MF7tq/qemu-5.0.1/softmmu/vl.c:1275
    send_stop=<optimized out>) at /build/qemu-6MF7tq/qemu-5.0.1/cpus.c:1032
    at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:2914
    at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:3275
    at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:3439
    at /build/qemu-6MF7tq/qemu-5.0.1/util/qemu-thread-posix.c:519
   from /lib/x86_64-linux-gnu/libpthread.so.0

Fix it by checking that the connection coroutine is non-null before
trying to enter it.  If it is null, no entering is needed, as the
connection is probably going down anyway.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index bcd6641e90..b3cbbeb4b0 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -250,13 +250,15 @@ static void nbd_client_attach_aio_context_bh(void *opaque)
     BlockDriverState *bs = opaque;
     BDRVNBDState *s = (BDRVNBDState *)bs->opaque;
 
-    /*
-     * The node is still drained, so we know the coroutine has yielded in
-     * nbd_read_eof(), the only place where bs->in_flight can reach 0, or it is
-     * entered for the first time. Both places are safe for entering the
-     * coroutine.
-     */
-    qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
+    if (s->connection_co) {
+        /*
+         * The node is still drained, so we know the coroutine has yielded in
+         * nbd_read_eof(), the only place where bs->in_flight can reach 0, or
+         * it is entered for the first time. Both places are safe for entering
+         * the coroutine.
+         */
+        qemu_aio_coroutine_enter(bs->aio_context, s->connection_co);
+    }
     bdrv_dec_in_flight(bs);
 }
 
-- 
2.29.2


