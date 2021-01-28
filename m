Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D60D307F6F
	for <lists+qemu-devel@lfdr.de>; Thu, 28 Jan 2021 21:21:37 +0100 (CET)
Received: from localhost ([::1]:41778 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5DnM-0001ot-IY
	for lists+qemu-devel@lfdr.de; Thu, 28 Jan 2021 15:21:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58290)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5Dgc-0004Ur-S5; Thu, 28 Jan 2021 15:14:39 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:40016)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5DgV-0002k1-6v; Thu, 28 Jan 2021 15:14:38 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id E4D732E1E8A;
 Thu, 28 Jan 2021 23:14:24 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 JvOtNJJxGH-EOw4KhQq; Thu, 28 Jan 2021 23:14:24 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611864864; bh=9aKmtPPJWdynmvROmuUuyxx7m8OedJwSFiN5+GXjT3k=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=P+DMxrsm6mmjW6CBD+tv8E1drH6qF8p7OiatjR5GkzHvC3JvlHFDiT2X19AcFm1eQ
 1kwUG1aon35HPLt3UKSK73D8+2fnoSvZy593vob7yjJJUwyxoOZJLxMtk1YsJR3LgB
 PSASZDxMX6DdrgMDlIxrzfeNFzLD4dw4Ab+v0NoI=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-vpn.dhcp.yndx.net (dynamic-vpn.dhcp.yndx.net
 [2a02:6b8:b081:420::1:f])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 fjMENJuJUJ-ENmWuBqU; Thu, 28 Jan 2021 23:14:24 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH 1/3] block/nbd: only detach existing iochannel from aio_context
Date: Thu, 28 Jan 2021 23:14:16 +0300
Message-Id: <20210128201418.607640-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210128201418.607640-1-rvkagan@yandex-team.ru>
References: <20210128201418.607640-1-rvkagan@yandex-team.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=95.108.205.193;
 envelope-from=rvkagan@yandex-team.ru; helo=forwardcorp1o.mail.yandex.net
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, SPF_HELO_NONE=0.001,
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

When the reconnect in NBD client is in progress, the iochannel used for
NBD connection doesn't exist.  Therefore an attempt to detach it from
the aio_context of the parent BlockDriverState results in a NULL pointer
dereference.

The problem is triggerable, in particular, when an outgoing migration is
about to finish, and stopping the dataplane tries to move the
BlockDriverState from the iothread aio_context to the main loop.  If the
NBD connection is lost before this point, and the NBD client has entered
the reconnect procedure, QEMU crashes:

    at /build/qemu-gYtjVn/qemu-5.0.1/io/channel.c:452
    at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6151
    new_context=new_context@entry=0x562a260c9580,
    ignore=ignore@entry=0x7feeadc9b780)
    at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6230
    (bs=bs@entry=0x562a268d6a00, ctx=0x562a260c9580,
    ignore_child=<optimized out>, errp=<optimized out>)
    at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6332
    new_context=0x562a260c9580,
    update_root_node=update_root_node@entry=true, errp=errp@entry=0x0)
    at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:1989
    new_context=<optimized out>, errp=errp@entry=0x0)
    at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:2010
    out>)
    at /build/qemu-gYtjVn/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
    at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio-bus.c:245
    running=0, state=<optimized out>)
    at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio.c:3220
    state=state@entry=RUN_STATE_FINISH_MIGRATE)
    at /build/qemu-gYtjVn/qemu-5.0.1/softmmu/vl.c:1275
    send_stop=<optimized out>)
    at /build/qemu-gYtjVn/qemu-5.0.1/cpus.c:1032
    at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:2914
    at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3275
    at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3439
    at /build/qemu-gYtjVn/qemu-5.0.1/util/qemu-thread-posix.c:519
    at pthread_create.c:333
    oldval=0x562a2452b138, oldlenp=0x0, newval=0x562a2452c5e0
    <__func__.28102>, newlen=0)
    at ../sysdeps/unix/sysv/linux/sysctl.c:30

Fix it by checking that the iochannel is non-null before trying to
detach it from the aio_context.  If it is null, no detaching is needed,
and it will get reattached in the proper aio_context once the connection
is reestablished.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
---
 block/nbd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 42e10c7c93..bcd6641e90 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -235,7 +235,14 @@ static void nbd_client_detach_aio_context(BlockDriverState *bs)
 
     /* Timer is deleted in nbd_client_co_drain_begin() */
     assert(!s->reconnect_delay_timer);
-    qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+    /*
+     * If reconnect is in progress we may have no ->ioc.  It will be
+     * re-instantiated in the proper aio context once the connection is
+     * reestablished.
+     */
+    if (s->ioc) {
+        qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
+    }
 }
 
 static void nbd_client_attach_aio_context_bh(void *opaque)
-- 
2.29.2


