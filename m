Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 165A64E326D
	for <lists+qemu-devel@lfdr.de>; Mon, 21 Mar 2022 22:47:30 +0100 (CET)
Received: from localhost ([::1]:58194 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nWPs9-0002vc-6O
	for lists+qemu-devel@lfdr.de; Mon, 21 Mar 2022 17:47:29 -0400
Received: from eggs.gnu.org ([209.51.188.92]:54872)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmk-00050k-9Z
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:29620)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eblake@redhat.com>) id 1nWPmf-0006M5-UW
 for qemu-devel@nongnu.org; Mon, 21 Mar 2022 17:41:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647898906;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=YFUkW4449ePvuDQ+5BOXtvf2hWWsWgUMixtARwJpjXE=;
 b=aysUvwkaSPdjZn2d8ZEFMpruy6ScPaoSqrdeFOohwmIt5oiVISZflAIkBkX9JUdCC4q/A4
 erv6A4hHzBbaxahGXgwXF6H3wKXhTs059ln9coO61zCJ+HvFXAE8H62cUmrm79ce3mnth4
 iohWfpk3/PGUoIqiYIdf20R5varWeNo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-393-LHo12okxMlWJEK7_HXbzUg-1; Mon, 21 Mar 2022 17:41:43 -0400
X-MC-Unique: LHo12okxMlWJEK7_HXbzUg-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com
 [10.11.54.9])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 727C4851785;
 Mon, 21 Mar 2022 21:41:40 +0000 (UTC)
Received: from blue.redhat.com (unknown [10.2.16.194])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C7D9344198F;
 Mon, 21 Mar 2022 21:41:38 +0000 (UTC)
From: Eric Blake <eblake@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PULL 3/3] block/nbd.c: Fixed IO request coroutine not being wakeup
 when kill NBD server
Date: Mon, 21 Mar 2022 16:41:34 -0500
Message-Id: <20220321214134.597006-4-eblake@redhat.com>
In-Reply-To: <20220321214134.597006-1-eblake@redhat.com>
References: <20220321214134.597006-1-eblake@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.9
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.129.124; envelope-from=eblake@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
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
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "open list:Network Block Dev..." <qemu-block@nongnu.org>,
 Rao Lei <lei.rao@intel.com>, Hanna Reitz <hreitz@redhat.com>,
 Vladimir Sementsov-Ogievskiy <v.sementsov-og@mail.ru>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Rao Lei <lei.rao@intel.com>

During the IO stress test, the IO request coroutine has a probability that is
can't be awakened when the NBD server is killed.

The GDB stack is as follows:
(gdb) bt
0  0x00007f2ff990cbf6 in __ppoll (fds=0x55575de85000, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
1  0x000055575c302e7c in qemu_poll_ns (fds=0x55575de85000, nfds=1, timeout=599999603140) at ../util/qemu-timer.c:348
2  0x000055575c2d3c34 in fdmon_poll_wait (ctx=0x55575dc480f0, ready_list=0x7ffd9dd1dae0, timeout=599999603140) at ../util/fdmon-poll.c:80
3  0x000055575c2d350d in aio_poll (ctx=0x55575dc480f0, blocking=true) at ../util/aio-posix.c:655
4  0x000055575c16eabd in bdrv_do_drained_begin(bs=0x55575dee7fe0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true)at ../block/io.c:474
5  0x000055575c16eba6 in bdrv_drained_begin (bs=0x55575dee7fe0) at ../block/io.c:480
6  0x000055575c1aff33 in quorum_del_child (bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block/quorum.c:1130
7  0x000055575c14239b in bdrv_del_child (parent_bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block.c:7705
8  0x000055575c12da28 in qmp_x_blockdev_change(parent=0x55575df404c0 "colo-disk0", has_child=true, child=0x55575de867f0 "children.1", has_node=false, no   de=0x0, errp=0x7ffd9dd1dd08) at ../blockdev.c:3676
9  0x000055575c258435 in qmp_marshal_x_blockdev_change (args=0x7f2fec008190, ret=0x7f2ff7b0bd98, errp=0x7f2ff7b0bd90) at qapi/qapi-commands-block-core.c   :1675
10 0x000055575c2c6201 in do_qmp_dispatch_bh (opaque=0x7f2ff7b0be30) at ../qapi/qmp-dispatch.c:129
11 0x000055575c2ebb1c in aio_bh_call (bh=0x55575dc429c0) at ../util/async.c:141
12 0x000055575c2ebc2a in aio_bh_poll (ctx=0x55575dc480f0) at ../util/async.c:169
13 0x000055575c2d2d96 in aio_dispatch (ctx=0x55575dc480f0) at ../util/aio-posix.c:415
14 0x000055575c2ec07f in aio_ctx_dispatch (source=0x55575dc480f0, callback=0x0, user_data=0x0) at ../util/async.c:311
15 0x00007f2ff9e7cfbd in g_main_context_dispatch () at /lib/x86_64-linux-gnu/libglib-2.0.so.0
16 0x000055575c2fd581 in glib_pollfds_poll () at ../util/main-loop.c:232
17 0x000055575c2fd5ff in os_host_main_loop_wait (timeout=0) at ../util/main-loop.c:255
18 0x000055575c2fd710 in main_loop_wait (nonblocking=0) at ../util/main-loop.c:531
19 0x000055575bfa7588 in qemu_main_loop () at ../softmmu/runstate.c:726
20 0x000055575bbee57a in main (argc=60, argv=0x7ffd9dd1e0e8, envp=0x7ffd9dd1e2d0) at ../softmmu/main.c:50

(gdb) qemu coroutine 0x55575e16aac0
0  0x000055575c2ee7dc in qemu_coroutine_switch (from_=0x55575e16aac0, to_=0x7f2ff830fba0, action=COROUTINE_YIELD) at ../util/coroutine-ucontext.c:302
1  0x000055575c2fe2a9 in qemu_coroutine_yield () at ../util/qemu-coroutine.c:195
2  0x000055575c2fe93c in qemu_co_queue_wait_impl (queue=0x55575dc46170, lock=0x7f2b32ad9850) at ../util/qemu-coroutine-lock.c:56
3  0x000055575c17ddfb in nbd_co_send_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, qiov=0x55575dfc15d8) at ../block/nbd.c:478
4  0x000055575c17f931 in nbd_co_request (bs=0x55575ebfaf20, request=0x7f2b32ad9920, write_qiov=0x55575dfc15d8) at ../block/nbd.c:1182
5  0x000055575c17fe14 in nbd_client_co_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/nbd.c:1284
6  0x000055575c170d25 in bdrv_driver_pwritev (bs=0x55575ebfaf20, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
    at ../block/io.c:1264
7  0x000055575c1733b4 in bdrv_aligned_pwritev
    (child=0x55575dff6890, req=0x7f2b32ad9ad0, offset=403487858688, bytes=4538368, align=1, qiov=0x55575dfc15d8, qiov_offset=0, flags=0) at ../block/io.c:2126
8  0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
    at ../block/io.c:2314
9  0x000055575c17391b in bdrv_co_pwritev (child=0x55575dff6890, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
10 0x000055575c1ee506 in replication_co_writev (bs=0x55575e9824f0, sector_num=788062224, remaining_sectors=8864, qiov=0x55575dfc15d8, flags=0)
    at ../block/replication.c:270
11 0x000055575c170eed in bdrv_driver_pwritev (bs=0x55575e9824f0, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
    at ../block/io.c:1297
12 0x000055575c1733b4 in bdrv_aligned_pwritev
    (child=0x55575dcea690, req=0x7f2b32ad9e00, offset=403487858688, bytes=4538368, align=512, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
    at ../block/io.c:2126
13 0x000055575c173c67 in bdrv_co_pwritev_part (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, qiov_offset=0, flags=0)
    at ../block/io.c:2314
14 0x000055575c17391b in bdrv_co_pwritev (child=0x55575dcea690, offset=403487858688, bytes=4538368, qiov=0x55575dfc15d8, flags=0) at ../block/io.c:2233
15 0x000055575c1aeffa in write_quorum_entry (opaque=0x7f2fddaf8c50) at ../block/quorum.c:699
16 0x000055575c2ee4db in coroutine_trampoline (i0=1578543808, i1=21847) at ../util/coroutine-ucontext.c:173
17 0x00007f2ff9855660 in __start_context () at ../sysdeps/unix/sysv/linux/x86_64/__start_context.S:91

When we do failover in COLO mode, QEMU will hang while it is waiting for
the in-flight IO. From the call trace, we can see the IO request coroutine
has yielded in nbd_co_send_request(). When we kill the NBD server, it will never
be wake up. Actually, when we do IO stress test, it will have a lot of
requests in free_sema queue. When the NBD server is killed, current
MAX_NBD_REQUESTS finishes with errors but they wake up at most
MAX_NBD_REQEUSTS from the queue. So, let's move qemu_co_queue_next out
to fix this issue.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Message-Id: <20220309074844.275450-1-lei.rao@intel.com>
Reviewed-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Signed-off-by: Eric Blake <eblake@redhat.com>
---
 block/nbd.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/block/nbd.c b/block/nbd.c
index 34b9429de387..567872ac5338 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -533,8 +533,8 @@ err:
         if (i != -1) {
             s->requests[i].coroutine = NULL;
             s->in_flight--;
-            qemu_co_queue_next(&s->free_sema);
         }
+        qemu_co_queue_next(&s->free_sema);
     }
     qemu_co_mutex_unlock(&s->send_mutex);
     return rc;
-- 
2.35.1


