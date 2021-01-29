Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DFF9930868A
	for <lists+qemu-devel@lfdr.de>; Fri, 29 Jan 2021 08:41:59 +0100 (CET)
Received: from localhost ([::1]:45098 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1l5OPm-0000X5-MB
	for lists+qemu-devel@lfdr.de; Fri, 29 Jan 2021 02:41:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5OMz-0007LY-Uw; Fri, 29 Jan 2021 02:39:05 -0500
Received: from forwardcorp1o.mail.yandex.net ([95.108.205.193]:51006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <rvkagan@yandex-team.ru>)
 id 1l5OMx-0004LS-Su; Fri, 29 Jan 2021 02:39:05 -0500
Received: from vla1-fdfb804fb3f3.qloud-c.yandex.net
 (vla1-fdfb804fb3f3.qloud-c.yandex.net
 [IPv6:2a02:6b8:c0d:3199:0:640:fdfb:804f])
 by forwardcorp1o.mail.yandex.net (Yandex) with ESMTP id 9DD182E1E11;
 Fri, 29 Jan 2021 10:39:01 +0300 (MSK)
Received: from vla1-81430ab5870b.qloud-c.yandex.net
 (vla1-81430ab5870b.qloud-c.yandex.net [2a02:6b8:c0d:35a1:0:640:8143:ab5])
 by vla1-fdfb804fb3f3.qloud-c.yandex.net (mxbackcorp/Yandex) with ESMTP id
 iKJDzONt78-d0waNa8Y; Fri, 29 Jan 2021 10:39:01 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex-team.ru;
 s=default; 
 t=1611905941; bh=JnuoYilODbCdaWsV5gPSIV0qw3rSuchMIyJ5xvvg2Nc=;
 h=In-Reply-To:Message-Id:References:Date:Subject:To:From:Cc;
 b=wHWWaBJIbcdXYrAmyvwt6VhlRkC1a0KUCBe3JIynn8k2QqWzZEezH8SpobZgFLzAE
 a2JJ0BrOQStnqpfJ4seNMbfXqDDiu0fWqE2BNzK26uGQEBO8ddlLZPVYHGzaFpQqS1
 yfQ2eR/jboQfN5RkfN3/vqIUkYlLdgcPpgHkw9V4=
Authentication-Results: vla1-fdfb804fb3f3.qloud-c.yandex.net;
 dkim=pass header.i=@yandex-team.ru
Received: from dynamic-red3.dhcp.yndx.net (dynamic-red3.dhcp.yndx.net
 [2a02:6b8:0:419:7359:4dc3:71d:4c5a])
 by vla1-81430ab5870b.qloud-c.yandex.net (smtpcorp/Yandex) with ESMTPSA id
 jIpaBE76QG-d0mWLGOf; Fri, 29 Jan 2021 10:39:00 +0300
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (Client certificate not present)
From: Roman Kagan <rvkagan@yandex-team.ru>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 1/3] block/nbd: only detach existing iochannel from
 aio_context
Date: Fri, 29 Jan 2021 10:38:57 +0300
Message-Id: <20210129073859.683063-2-rvkagan@yandex-team.ru>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210129073859.683063-1-rvkagan@yandex-team.ru>
References: <20210129073859.683063-1-rvkagan@yandex-team.ru>
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

  #0  qemu_aio_coroutine_enter (ctx=0x5618056c7580, co=0x0)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/qemu-coroutine.c:109
  #1  0x00005618034b1b68 in nbd_client_attach_aio_context_bh (
      opaque=0x561805ed4c00) at /build/qemu-6MF7tq/qemu-5.0.1/block/nbd.c:164
  #2  0x000056180353116b in aio_wait_bh (opaque=0x7f60e1e63700)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-wait.c:55
  #3  0x0000561803530633 in aio_bh_call (bh=0x7f60d40a7e80)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/async.c:136
  #4  aio_bh_poll (ctx=ctx@entry=0x5618056c7580)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/async.c:164
  #5  0x0000561803533e5a in aio_poll (ctx=ctx@entry=0x5618056c7580,
      blocking=blocking@entry=true)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-posix.c:650
  #6  0x000056180353128d in aio_wait_bh_oneshot (ctx=0x5618056c7580,
      cb=<optimized out>, opaque=<optimized out>)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/aio-wait.c:71
  #7  0x000056180345c50a in bdrv_attach_aio_context (new_context=0x5618056c7580,
      bs=0x561805ed4c00) at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6172
  #8  bdrv_set_aio_context_ignore (bs=bs@entry=0x561805ed4c00,
      new_context=new_context@entry=0x5618056c7580,
      ignore=ignore@entry=0x7f60e1e63780)
      at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6237
  #9  0x000056180345c969 in bdrv_child_try_set_aio_context (
      bs=bs@entry=0x561805ed4c00, ctx=0x5618056c7580,
      ignore_child=<optimized out>, errp=<optimized out>)
      at /build/qemu-6MF7tq/qemu-5.0.1/block.c:6332
  #10 0x00005618034957db in blk_do_set_aio_context (blk=0x56180695b3f0,
      new_context=0x5618056c7580, update_root_node=update_root_node@entry=true,
      errp=errp@entry=0x0)
      at /build/qemu-6MF7tq/qemu-5.0.1/block/block-backend.c:1989
  #11 0x00005618034980bd in blk_set_aio_context (blk=<optimized out>,
      new_context=<optimized out>, errp=errp@entry=0x0)
      at /build/qemu-6MF7tq/qemu-5.0.1/block/block-backend.c:2010
  #12 0x0000561803197953 in virtio_blk_data_plane_stop (vdev=<optimized out>)
      at /build/qemu-6MF7tq/qemu-5.0.1/hw/block/dataplane/virtio-blk.c:292
  #13 0x00005618033d67bf in virtio_bus_stop_ioeventfd (bus=0x5618056d9f08)
      at /build/qemu-6MF7tq/qemu-5.0.1/hw/virtio/virtio-bus.c:245
  #14 0x00005618031c9b2e in virtio_vmstate_change (opaque=0x5618056d9f90,
      running=0, state=<optimized out>)
      at /build/qemu-6MF7tq/qemu-5.0.1/hw/virtio/virtio.c:3220
  #15 0x0000561803208bfd in vm_state_notify (running=running@entry=0,
      state=state@entry=RUN_STATE_FINISH_MIGRATE)
      at /build/qemu-6MF7tq/qemu-5.0.1/softmmu/vl.c:1275
  #16 0x0000561803155c02 in do_vm_stop (state=RUN_STATE_FINISH_MIGRATE,
      send_stop=<optimized out>) at /build/qemu-6MF7tq/qemu-5.0.1/cpus.c:1032
  #17 0x00005618033e3765 in migration_completion (s=0x5618056e6960)
      at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:2914
  #18 migration_iteration_run (s=0x5618056e6960)
      at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:3275
  #19 migration_thread (opaque=opaque@entry=0x5618056e6960)
      at /build/qemu-6MF7tq/qemu-5.0.1/migration/migration.c:3439
  #20 0x0000561803536ad6 in qemu_thread_start (args=<optimized out>)
      at /build/qemu-6MF7tq/qemu-5.0.1/util/qemu-thread-posix.c:519
  #21 0x00007f61085d06ba in start_thread ()
     from /lib/x86_64-linux-gnu/libpthread.so.0
  #22 0x00007f610830641d in sysctl () from /lib/x86_64-linux-gnu/libc.so.6
  #23 0x0000000000000000 in ?? ()

Fix it by checking that the iochannel is non-null before trying to
detach it from the aio_context.  If it is null, no detaching is needed,
and it will get reattached in the proper aio_context once the connection
is reestablished.

Signed-off-by: Roman Kagan <rvkagan@yandex-team.ru>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
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


