Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id F19724CB4C8
	for <lists+qemu-devel@lfdr.de>; Thu,  3 Mar 2022 03:25:40 +0100 (CET)
Received: from localhost ([::1]:57716 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1nPb9v-0008B2-Fh
	for lists+qemu-devel@lfdr.de; Wed, 02 Mar 2022 21:25:39 -0500
Received: from eggs.gnu.org ([209.51.188.92]:60036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1nPb8A-0007Kq-M2; Wed, 02 Mar 2022 21:23:50 -0500
Received: from mga05.intel.com ([192.55.52.43]:19822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1nPb82-0006Qe-5N; Wed, 02 Mar 2022 21:23:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1646274222; x=1677810222;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=yZHTR0+ETdX7iJz6d46y5qOi0kqILuW+TaM/JOCTioA=;
 b=cpMYVJ9BmSJYXhKLQH02qxqlYMp95yf7zUddrk3+/wjFgdYS7vm2P6a6
 Rp6m50UbMuoOyE68WORP0pvLd51ZAHAC6AsYoXz0ucdAqgjU3vTWejstF
 J4Y8hIUJ8MUMxF7wNObW5LyhlxKytcqLhbo8mz9DQaP9dffkkAbu1tONz
 E3w1S+eYBDUaZ3OW2YDMf3dcjTHnlXm5xxhKITwKLCvoknZqmG7/wBkLn
 OIwzsHKuu0rWdcr1BtRX3t3qCEtcs4pVPSm6T8YZR8E3e8HMqZ7xw4ETf
 Dc/tbVY0+B+d2r+lRuVxTKM8tlytDoSJgXtID/qk2crA1qlu1/srNZH7F g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10274"; a="339986872"
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="339986872"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Mar 2022 18:23:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,150,1643702400"; d="scan'208";a="535626766"
Received: from leirao-pc.bj.intel.com ([10.238.156.103])
 by orsmga007.jf.intel.com with ESMTP; 02 Mar 2022 18:23:33 -0800
From: Rao Lei <lei.rao@intel.com>
To: eblake@redhat.com, vsementsov@virtuozzo.com, kwolf@redhat.com,
 hreitz@redhat.com, chen.zhang@intel.com
Subject: [PATCH] block/nbd.c: Fixed IO request coroutine not being wakeup when
 kill NBD server.
Date: Thu,  3 Mar 2022 10:21:45 +0800
Message-Id: <20220303022145.328112-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=192.55.52.43; envelope-from=lei.rao@intel.com;
 helo=mga05.intel.com
X-Spam_score_int: -44
X-Spam_score: -4.5
X-Spam_bar: ----
X-Spam_report: (-4.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Rao Lei <lei.rao@intel.com>, qemu-devel@nongnu.org, qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

During the stress test, the IO request coroutine has a probability that it
can't be awakened when the NBD server is killed.

The GDB statck is as follows:
(gdb) bt
0  0x00007f2ff990cbf6 in __ppoll (fds=0x55575de85000, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
1  0x000055575c302e7c in qemu_poll_ns (fds=0x55575de85000, nfds=1, timeout=599999603140) at ../util/qemu-timer.c:348
2  0x000055575c2d3c34 in fdmon_poll_wait (ctx=0x55575dc480f0, ready_list=0x7ffd9dd1dae0, timeout=599999603140) at ../util/fdmon-poll.c:80
3  0x000055575c2d350d in aio_poll (ctx=0x55575dc480f0, blocking=true) at ../util/aio-posix.c:655
4  0x000055575c16eabd in bdrv_do_drained_begin (bs=0x55575dee7fe0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at ../block/io.c:474
5  0x000055575c16eba6 in bdrv_drained_begin (bs=0x55575dee7fe0) at ../block/io.c:480
6  0x000055575c1aff33 in quorum_del_child (bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block/quorum.c:1130
7  0x000055575c14239b in bdrv_del_child (parent_bs=0x55575dee7fe0, child=0x55575dcea690, errp=0x7ffd9dd1dd08) at ../block.c:7705
8  0x000055575c12da28 in qmp_x_blockdev_change
    (parent=0x55575df404c0 "colo-disk0", has_child=true, child=0x55575de867f0 "children.1", has_node=false, node=0x0, errp=0x7ffd9dd1dd08)
    at ../blockdev.c:3676
9  0x000055575c258435 in qmp_marshal_x_blockdev_change (args=0x7f2fec008190, ret=0x7f2ff7b0bd98, errp=0x7f2ff7b0bd90) at qapi/qapi-commands-block-core.c:1675
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

When we do failover in COLO mode, QEMU will hang while it is waiting for the in flight IO.
From the call trace, we can see the IO request coroutine which is waiting for send_mutex
has yield in nbd_co_send_request(). When we kill nbd server, it will never be wake up.
So, it is necessary to wake up the coroutine in nbd_channel_error().

Signed-off-by: Rao Lei <lei.rao@intel.com>
---
 block/nbd.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5853d85d60..cf9dda537c 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -167,6 +167,7 @@ static void nbd_channel_error(BDRVNBDState *s, int ret)
         s->state = NBD_CLIENT_QUIT;
     }
 
+    qemu_co_queue_restart_all(&s->free_sema);
     nbd_recv_coroutines_wake(s, true);
 }
 
-- 
2.32.0


