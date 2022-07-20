Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 926AA57B17A
	for <lists+qemu-devel@lfdr.de>; Wed, 20 Jul 2022 09:14:42 +0200 (CEST)
Received: from localhost ([::1]:34924 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1oE3ur-0001k2-Bo
	for lists+qemu-devel@lfdr.de; Wed, 20 Jul 2022 03:14:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35398)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oE3s1-0004yE-IX
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:11:46 -0400
Received: from szxga01-in.huawei.com ([45.249.212.187]:4514)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hogan.wang@huawei.com>)
 id 1oE3ry-00083n-HW
 for qemu-devel@nongnu.org; Wed, 20 Jul 2022 03:11:45 -0400
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4LnmyJ6MY6zjXLk;
 Wed, 20 Jul 2022 15:08:40 +0800 (CST)
Received: from kwepemm600015.china.huawei.com (7.193.23.52) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Wed, 20 Jul 2022 15:11:02 +0800
Received: from localhost (10.174.149.172) by kwepemm600015.china.huawei.com
 (7.193.23.52) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Wed, 20 Jul
 2022 15:11:02 +0800
To: <marcandre.lureau@redhat.com>, <berrange@redhat.com>,
 <qemu-devel@nongnu.org>
CC: <pbonzini@redhat.com>, <armbru@redhat.com>, <wangxinxin.wang@huawei.com>, 
 <hogan.wang@huawei.com>
Subject: [PATCH v2] chardev: avoid use-after-free when client disconnect
Date: Wed, 20 Jul 2022 15:10:57 +0800
Message-ID: <20220720071057.1745-1-hogan.wang@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.149.172]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600015.china.huawei.com (7.193.23.52)
X-CFilter-Loop: Reflected
Received-SPF: pass client-ip=45.249.212.187;
 envelope-from=hogan.wang@huawei.com; helo=szxga01-in.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
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
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
Reply-to:  Hogan Wang <hogan.wang@huawei.com>
From:  Hogan Wang via <qemu-devel@nongnu.org>

IOWatchPoll object did not hold the @ioc and @src objects reference,
then io_watch_poll_prepare execute in IO thread, if IOWatchPoll
removed by mian thread, then io_watch_poll_prepare access @ioc or
@src concurrently lead to coredump.

In IO thread monitor scene, the IO thread used to accept client,
receive qmp request and handle hung-up event. Main thread used to
handle qmp request and send response, it will remove IOWatchPoll
and free @ioc when send response fail, then cause use-after-free
like this:

(gdb) bt
0  0x00007f4d121c8edf in g_source_remove_child_source (source=0x7f4c58003560, child_source=0x7f4c58009b10)
1  0x00007f4d11e0705c in io_watch_poll_prepare (source=0x7f4c58003560, timeout=timeout@entry=0x7f4c7fffed94
2  0x00007f4d121ca419 in g_main_context_prepare (context=context@entry=0x55a1463f8260, priority=priority@entry=0x7f4c7fffee20)
3  0x00007f4d121cadeb in g_main_context_iterate (context=0x55a1463f8260, block=block@entry=1, dispatch=dispatch@entry=1, self=self@entry=0x7f4c94002260)
4  0x00007f4d121cb21d in g_main_loop_run (loop=0x55a146c90920)
5  0x00007f4d11de3ea1 in iothread_run (opaque=0x55a146411820)
6  0x00007f4d11d77470 in qemu_thread_start (args=0x55a146b1f3c0)
7  0x00007f4d11f2ef3b in ?? () from /usr/lib64/libpthread.so.0
8  0x00007f4d120ba550 in clone () from /usr/lib64/libc.so.6
(gdb) p	iwp
$1 = (IOWatchPoll *) 0x7f4c58003560
(gdb) p	*iwp
$2 = {parent = {callback_data = 0x0,
                callback_funcs = 0x0,
                source_funcs = 0x7f4d11f10760 <io_watch_poll_funcs>,
                ref_count = 1,
                context = 0x55a1463f8260,
                priority = 0,
                flags = 0,
                source_id = 544,
                poll_fds = 0x0,
                prev = 0x55a147a47a30,
                next = 0x55a14712fb80,
                name = 0x7f4c580036d0 "chardev-iowatch-charmonitor",
                priv = 0x7f4c58003060},
       ioc = 0x7f4c580033f0,
       src = 0x7f4c58009b10,
       fd_can_read = 0x7f4d11e0a5d0 <tcp_chr_read_poll>,
       fd_read = 0x7f4d11e0a380 <tcp_chr_read>,
       opaque = 0x55a1463aeea0 }
(gdb) p	iwp->ioc
$3 = (QIOChannel *) 0x7f4c580033f0
(gdb) p	*iwp->ioc
$4 = {parent = {class = 0x55a14707f400,
                free = 0x55a146313010,
                properties = 0x55a147b37b60,
                ref = 0,
                parent = 0x0},
      features = 3,
      name = 0x7f4c580085f0 "\240F",
      ctx = 0x0,
      read_coroutine = 0x0,
      write_coroutine = 0x0}

Solution: IOWatchPoll object hold the @ioc and @src objects reference
and release the reference in GSource finalize callback function.

Signed-off-by: Hogan Wang <hogan.wang@huawei.com>
---
 chardev/char-io.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/chardev/char-io.c b/chardev/char-io.c
index 4451128cba..6b10217a70 100644
--- a/chardev/char-io.c
+++ b/chardev/char-io.c
@@ -55,9 +55,9 @@ static gboolean io_watch_poll_prepare(GSource *source,
             iwp->ioc, G_IO_IN | G_IO_ERR | G_IO_HUP | G_IO_NVAL);
         g_source_set_callback(iwp->src, iwp->fd_read, iwp->opaque, NULL);
         g_source_add_child_source(source, iwp->src);
-        g_source_unref(iwp->src);
     } else {
         g_source_remove_child_source(source, iwp->src);
+        g_source_unref(iwp->src);
         iwp->src = NULL;
     }
     return FALSE;
@@ -69,9 +69,17 @@ static gboolean io_watch_poll_dispatch(GSource *source, GSourceFunc callback,
     return G_SOURCE_CONTINUE;
 }
 
+static void io_watch_poll_finalize(GSource *source)
+{
+    IOWatchPoll *iwp = io_watch_poll_from_source(source);
+    g_clear_pointer(&iwp->src, g_source_unref);
+    g_clear_pointer(&iwp->ioc, object_unref);
+}
+
 static GSourceFuncs io_watch_poll_funcs = {
     .prepare = io_watch_poll_prepare,
     .dispatch = io_watch_poll_dispatch,
+    .finalize = io_watch_poll_finalize,
 };
 
 GSource *io_add_watch_poll(Chardev *chr,
@@ -88,7 +96,7 @@ GSource *io_add_watch_poll(Chardev *chr,
                                        sizeof(IOWatchPoll));
     iwp->fd_can_read = fd_can_read;
     iwp->opaque = user_data;
-    iwp->ioc = ioc;
+    iwp->ioc = object_ref(ioc);
     iwp->fd_read = (GSourceFunc) fd_read;
     iwp->src = NULL;
 
-- 
2.33.0


