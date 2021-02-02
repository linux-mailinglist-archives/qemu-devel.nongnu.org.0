Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 2729D30CF9E
	for <lists+qemu-devel@lfdr.de>; Wed,  3 Feb 2021 00:07:19 +0100 (CET)
Received: from localhost ([::1]:42262 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l74lR-0006h0-Vk
	for lists+qemu-devel@lfdr.de; Tue, 02 Feb 2021 18:07:18 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:40614)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74R1-0007le-AK
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:11 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:28957)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1l74Qk-000616-3s
 for qemu-devel@nongnu.org; Tue, 02 Feb 2021 17:46:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1612305953;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KOZFc9bz/hcIsbzsDKAZFtT1DFZGGsw4V/mb0laT+B8=;
 b=NDiXGE9vW2ScUuz2EPzDvp57f6jjIrHoK4LvcSrdD/ndIEMLK+6kBp3TRAd1Zi91A1FcJ/
 +arvqbtDRw7BspgCzwqnBOZdtEggLjFoJjPNly+5rT2AH1Ify4rtyDKzKDOj5MlFhlkvO0
 SZ6LPHhSXQb8V50BKp5U6BES/OqJFaE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-318-zvxDZejDMdGl3MrMv_Fi9w-1; Tue, 02 Feb 2021 17:45:51 -0500
X-MC-Unique: zvxDZejDMdGl3MrMv_Fi9w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EE87C59;
 Tue,  2 Feb 2021 22:45:49 +0000 (UTC)
Received: from blue.redhat.com (ovpn-112-103.phx2.redhat.com [10.3.112.103])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 72B9810016F5;
 Tue,  2 Feb 2021 22:45:49 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 19/20] block/nbd: only enter connection coroutine if it's
 present
Date: Tue,  2 Feb 2021 16:45:28 -0600
Message-Id: <20210202224529.642055-20-eblake@redhat.com>
In-Reply-To: <20210202224529.642055-1-eblake@redhat.com>
References: <20210202224529.642055-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=63.128.21.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -31
X-Spam_score: -3.2
X-Spam_bar: ---
X-Spam_report: (-3.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.386,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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
Cc: Roman Kagan <rvkagan@yandex-team.ru>, Kevin Wolf <kwolf@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Roman Kagan <rvkagan@yandex-team.ru>

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

  #0  qio_channel_detach_aio_context (ioc=0x0)
      at /build/qemu-gYtjVn/qemu-5.0.1/io/channel.c:452
  #1  0x0000562a242824b3 in bdrv_detach_aio_context (bs=0x562a268d6a00)
      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6151
  #2  bdrv_set_aio_context_ignore (bs=bs@entry=0x562a268d6a00,
      new_context=new_context@entry=0x562a260c9580,
      ignore=ignore@entry=0x7feeadc9b780)
      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6230
  #3  0x0000562a24282969 in bdrv_child_try_set_aio_context
      (bs=bs@entry=0x562a268d6a00, ctx=0x562a260c9580,
      ignore_child=<optimized out>, errp=<optimized out>)
      at /build/qemu-gYtjVn/qemu-5.0.1/block.c:6332
  #4  0x0000562a242bb7db in blk_do_set_aio_context (blk=0x562a2735d0d0,
      new_context=0x562a260c9580,
      update_root_node=update_root_node@entry=true, errp=errp@entry=0x0)
      at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:1989
  #5  0x0000562a242be0bd in blk_set_aio_context (blk=<optimized out>,
      new_context=<optimized out>, errp=errp@entry=0x0)
      at /build/qemu-gYtjVn/qemu-5.0.1/block/block-backend.c:2010
  #6  0x0000562a23fbd953 in virtio_blk_data_plane_stop (vdev=<optimized
      out>)
      at /build/qemu-gYtjVn/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
  #7  0x0000562a241fc7bf in virtio_bus_stop_ioeventfd (bus=0x562a260dbf08)
      at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio-bus.c:245
  #8  0x0000562a23fefb2e in virtio_vmstate_change (opaque=0x562a260dbf90,
      running=0, state=<optimized out>)
      at /build/qemu-gYtjVn/qemu-5.0.1/hw/virtio/virtio.c:3220
  #9  0x0000562a2402ebfd in vm_state_notify (running=running@entry=0,
      state=state@entry=RUN_STATE_FINISH_MIGRATE)
      at /build/qemu-gYtjVn/qemu-5.0.1/softmmu/vl.c:1275
  #10 0x0000562a23f7bc02 in do_vm_stop (state=RUN_STATE_FINISH_MIGRATE,
      send_stop=<optimized out>)
      at /build/qemu-gYtjVn/qemu-5.0.1/cpus.c:1032
  #11 0x0000562a24209765 in migration_completion (s=0x562a260e83a0)
      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:2914
  #12 migration_iteration_run (s=0x562a260e83a0)
      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3275
  #13 migration_thread (opaque=opaque@entry=0x562a260e83a0)
      at /build/qemu-gYtjVn/qemu-5.0.1/migration/migration.c:3439
  #14 0x0000562a2435ca96 in qemu_thread_start (args=<optimized out>)
      at /build/qemu-gYtjVn/qemu-5.0.1/util/qemu-thread-posix.c:519
  #15 0x00007feed31466ba in start_thread (arg=0x7feeadc9c700)
      at pthread_create.c:333
  #16 0x00007feed2e7c41d in __GI___sysctl (name=0x0, nlen=608471908,
      oldval=0x562a2452b138, oldlenp=0x0, newval=0x562a2452c5e0
      <__func__.28102>, newlen=0)
      at ../sysdeps/unix/sysv/linux/sysctl.c:30
  #17 0x0000000000000000 in ?? ()

Fix it by checking that the connection coroutine is non-null before
trying to enter it.  If it is null, no entering is needed, as the
connection is probably going down anyway.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210129073859.683063-3-rvkagan@yandex-team.ru>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/block/nbd.c b/block/nbd.c
index bcd6641e90f5..b3cbbeb4b0cb 100644
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
2.30.0


