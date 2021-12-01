Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 94AB8464931
	for <lists+qemu-devel@lfdr.de>; Wed,  1 Dec 2021 08:53:26 +0100 (CET)
Received: from localhost ([::1]:45558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1msKQf-0003E1-B1
	for lists+qemu-devel@lfdr.de; Wed, 01 Dec 2021 02:53:25 -0500
Received: from eggs.gnu.org ([209.51.188.92]:39566)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1msKOq-0001qk-B7; Wed, 01 Dec 2021 02:51:32 -0500
Received: from mga18.intel.com ([134.134.136.126]:12294)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lei.rao@intel.com>)
 id 1msKOn-0004ez-8O; Wed, 01 Dec 2021 02:51:31 -0500
X-IronPort-AV: E=McAfee;i="6200,9189,10184"; a="223285450"
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="223285450"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Nov 2021 23:51:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.87,278,1631602800"; d="scan'208";a="459153914"
Received: from leirao.bj.intel.com ([10.238.157.52])
 by orsmga003.jf.intel.com with ESMTP; 30 Nov 2021 23:51:18 -0800
From: "Rao, Lei" <lei.rao@intel.com>
To: chen.zhang@intel.com, eblake@redhat.com, vsementsov@virtuozzo.com,
 kwolf@redhat.com, hreitz@redhat.com, berrange@redhat.com
Subject: [PATCH] QIO: Add force_quit to the QIOChannel to ensure QIO exits
 cleanly in some corner case
Date: Wed,  1 Dec 2021 15:54:27 +0800
Message-Id: <20211201075427.155702-1-lei.rao@intel.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=134.134.136.126; envelope-from=lei.rao@intel.com;
 helo=mga18.intel.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: "Rao, Lei" <lei.rao@intel.com>, qemu-devel@nongnu.org,
 qemu-block@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

    We found that the QIO channel coroutine could not be awakened in some corner cases during our stress test for COLO.
    The patch fixes as follow:
        #0  0x00007fad72e24bf6 in __ppoll (fds=0x5563d75861f0, nfds=1, timeout=<optimized out>, sigmask=0x0) at ../sysdeps/unix/sysv/linux/ppoll.c:44
        #1  0x00005563d6977c68 in qemu_poll_ns (fds=0x5563d75861f0, nfds=1, timeout=599999697630) at util/qemu-timer.c:348
        #2  0x00005563d697ac44 in aio_poll (ctx=0x5563d755dfa0, blocking=true) at util/aio-posix.c:669
        #3  0x00005563d68ba24f in bdrv_do_drained_begin (bs=0x5563d75ea0c0, recursive=false, parent=0x0, ignore_bds_parents=false, poll=true) at block/io.c:432
        #4  0x00005563d68ba338 in bdrv_drained_begin (bs=0x5563d75ea0c0) at block/io.c:438
        #5  0x00005563d689c6d2 in quorum_del_child (bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block/quorum.c:1063
        #6  0x00005563d684328f in bdrv_del_child (parent_bs=0x5563d75ea0c0, child=0x5563d7908600, errp=0x7fff3cf5b960) at block.c:6568
        #7  0x00005563d658499e in qmp_x_blockdev_change (parent=0x5563d80ec4c0 "colo-disk0", has_child=true, child=0x5563d7577d30 "children.1", has_node=false, node=0x0,errp=0x7fff3cf5b960) at blockdev.c:4494
        #8  0x00005563d67e8b4e in qmp_marshal_x_blockdev_change (args=0x7fad6400ada0, ret=0x7fff3cf5b9f8, errp=0x7fff3cf5b9f0) at qapi/qapi-commands-block-core.c:1538
        #9  0x00005563d691cd9e in do_qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true, errp=0x7fff3cf5ba98)
            at qapi/qmp-dispatch.c:132
        #10 0x00005563d691cfab in qmp_dispatch (cmds=0x5563d719a4f0 <qmp_commands>, request=0x7fad64009d80, allow_oob=true) at qapi/qmp-dispatch.c:175
        #11 0x00005563d67b7787 in monitor_qmp_dispatch (mon=0x5563d7605d40, req=0x7fad64009d80) at monitor/qmp.c:145
        #12 0x00005563d67b7b24 in monitor_qmp_bh_dispatcher (data=0x0) at monitor/qmp.c:234
        #13 0x00005563d69754c2 in aio_bh_call (bh=0x5563d7473230) at util/async.c:89
        #14 0x00005563d697555e in aio_bh_poll (ctx=0x5563d7471da0) at util/async.c:117
        #15 0x00005563d697a423 in aio_dispatch (ctx=0x5563d7471da0) at util/aio-posix.c:459
        #16 0x00005563d6975917 in aio_ctx_dispatch (source=0x5563d7471da0, callback=0x0, user_data=0x0) at util/async.c:260
        #17 0x00007fad730e1fbd in g_main_context_dispatch () from /lib/x86_64-linux-gnu/libglib-2.0.so.0
        #18 0x00005563d6978cda in glib_pollfds_poll () at util/main-loop.c:219
        #19 0x00005563d6978d58 in os_host_main_loop_wait (timeout=977650) at util/main-loop.c:242
        #20 0x00005563d6978e69 in main_loop_wait (nonblocking=0) at util/main-loop.c:518
        #21 0x00005563d658f5ed in main_loop () at vl.c:1814
        #22 0x00005563d6596bb7 in main (argc=61, argv=0x7fff3cf5c0c8, envp=0x7fff3cf5c2b8) at vl.c:450

    From the call trace, we can see that the QEMU main thread is waiting for the in_flight return to zero. But the in_filght never reaches 0.
    After analysis, the root cause is that the coroutine of NBD was not awakened. Although this bug was found in the COLO test, I think this is a
    universal problem in the QIO module. This issue also affects other modules depending on QIO such as NBD. We dump the following data:
    $2 = {
      in_flight = 2,
      state = NBD_CLIENT_QUIT,
      connect_status = 0,
      connect_err = 0x0,
      wait_in_flight = false,
      requests = {{
          coroutine = 0x0,
          offset = 273077071872,
          receiving = false,
        }, {
          coroutine = 0x7f1164571df0,
          offset = 498792529920,
          receiving = false,
        }, {
          coroutine = 0x0,
          offset = 500663590912,
          receiving = false,
        }, {
          ...
        } },
      reply = {
        simple = {
          magic = 1732535960,
          error = 0,
          handle = 0
        },
        structured = {
          magic = 1732535960,
          flags = 0,
          type = 0,
          handle = 0,
          length = 0
        },
        {
          magic = 1732535960,
          _skip = 0,
          handle = 0
        }
      },
      bs = 0x7f11640e2140,
      reconnect_delay = 0,
      saddr = 0x7f11640e1f80,
      export = 0x7f11640dc560 "parent0",
    }
    From the data, we can see the coroutine of NBD does not exit normally when killing the NBD server(we kill the Secondary VM in the COLO stress test).
    Then it will not execute in_flight--. So, the QEMU main thread will hang here. Further analysis, I found the coroutine of NBD will yield
    in nbd_send_request() or qio_channel_write_all() in nbd_co_send_request. By the way, the yield is due to the kernel return EAGAIN(under the stress test).
    However, NBD didn't know it would yield here. So, the nbd_recv_coroutines_wake won't wake it up because req->receiving is false. if the NBD server
    is terminated abnormally at the same time. The G_IO_OUT will be invalid, the coroutine will never be awakened. In addition, the s->ioc will be released
    immediately. if we force to wake up the coroutine of NBD, access to the ioc->xxx will cause segment fault. Finally, I add a state named force_quit to
    the QIOChannel to ensure that QIO will exit immediately. And I add the function of qio_channel_coroutines_wake to wake it up.

Signed-off-by: Lei Rao <lei.rao@intel.com>
Signed-off-by: Zhang Chen <chen.zhang@intel.com>
---
 block/nbd.c          |  5 +++++
 include/io/channel.h | 19 +++++++++++++++++++
 io/channel.c         | 22 ++++++++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/block/nbd.c b/block/nbd.c
index 5ef462db1b..5ee4eaaf57 100644
--- a/block/nbd.c
+++ b/block/nbd.c
@@ -208,6 +208,8 @@ static void nbd_teardown_connection(BlockDriverState *bs)
     assert(!s->in_flight);
 
     if (s->ioc) {
+        qio_channel_set_force_quit(s->ioc, true);
+        qio_channel_coroutines_wake(s->ioc);
         qio_channel_shutdown(s->ioc, QIO_CHANNEL_SHUTDOWN_BOTH, NULL);
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
@@ -315,6 +317,7 @@ int coroutine_fn nbd_co_do_establish_connection(BlockDriverState *bs,
 
     /* successfully connected */
     s->state = NBD_CLIENT_CONNECTED;
+    qio_channel_set_force_quit(s->ioc, false);
     qemu_co_queue_restart_all(&s->free_sema);
 
     return 0;
@@ -345,6 +348,8 @@ static coroutine_fn void nbd_reconnect_attempt(BDRVNBDState *s)
 
     /* Finalize previous connection if any */
     if (s->ioc) {
+        qio_channel_set_force_quit(s->ioc, true);
+        qio_channel_coroutines_wake(s->ioc);
         qio_channel_detach_aio_context(QIO_CHANNEL(s->ioc));
         yank_unregister_function(BLOCKDEV_YANK_INSTANCE(s->bs->node_name),
                                  nbd_yank, s->bs);
diff --git a/include/io/channel.h b/include/io/channel.h
index 88988979f8..bc5af8cdd6 100644
--- a/include/io/channel.h
+++ b/include/io/channel.h
@@ -78,6 +78,7 @@ struct QIOChannel {
     AioContext *ctx;
     Coroutine *read_coroutine;
     Coroutine *write_coroutine;
+    bool force_quit;
 #ifdef _WIN32
     HANDLE event; /* For use with GSource on Win32 */
 #endif
@@ -484,6 +485,24 @@ int qio_channel_set_blocking(QIOChannel *ioc,
                              bool enabled,
                              Error **errp);
 
+/**
+ * qio_channel_force_quit:
+ * @ioc: the channel object
+ * @quit: the new flag state
+ *
+ * Set the new flag state
+ */
+void qio_channel_set_force_quit(QIOChannel *ioc, bool quit);
+
+/**
+ * qio_channel_coroutines_wake:
+ * @ioc: the channel object
+ *
+ * Wake up the coroutines to ensure that they will exit normally
+ * when the server terminated abnormally
+ */
+void qio_channel_coroutines_wake(QIOChannel *ioc);
+
 /**
  * qio_channel_close:
  * @ioc: the channel object
diff --git a/io/channel.c b/io/channel.c
index e8b019dc36..bc1a9e055c 100644
--- a/io/channel.c
+++ b/io/channel.c
@@ -136,6 +136,9 @@ int qio_channel_readv_full_all_eof(QIOChannel *ioc,
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_IN);
+                if (ioc->force_quit) {
+                    goto cleanup;
+                }
             } else {
                 qio_channel_wait(ioc, G_IO_IN);
             }
@@ -242,6 +245,9 @@ int qio_channel_writev_full_all(QIOChannel *ioc,
         if (len == QIO_CHANNEL_ERR_BLOCK) {
             if (qemu_in_coroutine()) {
                 qio_channel_yield(ioc, G_IO_OUT);
+                if (ioc->force_quit) {
+                    goto cleanup;
+                }
             } else {
                 qio_channel_wait(ioc, G_IO_OUT);
             }
@@ -543,6 +549,9 @@ void coroutine_fn qio_channel_yield(QIOChannel *ioc,
     }
     qio_channel_set_aio_fd_handlers(ioc);
     qemu_coroutine_yield();
+    if (ioc->force_quit) {
+        return;
+    }
 
     /* Allow interrupting the operation by reentering the coroutine other than
      * through the aio_fd_handlers. */
@@ -555,6 +564,19 @@ void coroutine_fn qio_channel_yield(QIOChannel *ioc,
     }
 }
 
+void qio_channel_set_force_quit(QIOChannel *ioc, bool quit)
+{
+    ioc->force_quit = quit;
+}
+
+void qio_channel_coroutines_wake(QIOChannel *ioc)
+{
+    if (ioc->read_coroutine) {
+        qio_channel_restart_read(ioc);
+    } else if (ioc->write_coroutine) {
+        qio_channel_restart_write(ioc);
+    }
+}
 
 static gboolean qio_channel_wait_complete(QIOChannel *ioc,
                                           GIOCondition condition,
-- 
2.32.0


