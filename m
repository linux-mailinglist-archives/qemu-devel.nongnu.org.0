Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 3199D380E9B
	for <lists+qemu-devel@lfdr.de>; Fri, 14 May 2021 19:07:33 +0200 (CEST)
Received: from localhost ([::1]:56470 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1lhbHg-0002nH-8T
	for lists+qemu-devel@lfdr.de; Fri, 14 May 2021 13:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawd-0005cJ-LR
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43523)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mreitz@redhat.com>) id 1lhawX-0005rZ-94
 for qemu-devel@nongnu.org; Fri, 14 May 2021 12:45:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1621010738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=j/Xmi534/nKfJZjl1RrDQuVc7rLp99kkdByqN6WNn88=;
 b=L91eJrqKJiLloEVsoD6yWms7UeY8ZQvmRcBW2/xsXb76jCvgpx8ghCtiqlY0ZveXJoK2dp
 2OvgfsSnYWsxoqABBXRmxrWkxzkdrmN/+GlfxTVHhYv7GoZ98rQFG8aX66Pd4Z+EniaI+F
 rPC+FyJK80BQhVmBSIt9fjG2gfHdSP8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-113-ZrYkJMLCOwu7VAHoG5Hrjw-1; Fri, 14 May 2021 12:45:24 -0400
X-MC-Unique: ZrYkJMLCOwu7VAHoG5Hrjw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D4F6A501E8;
 Fri, 14 May 2021 16:45:22 +0000 (UTC)
Received: from localhost (ovpn-114-49.ams2.redhat.com [10.36.114.49])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 56CFC5C241;
 Fri, 14 May 2021 16:45:22 +0000 (UTC)
From: Max Reitz <mreitz@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 03/19] monitor: hmp_qemu_io: acquire aio contex, fix crash
Date: Fri, 14 May 2021 18:44:58 +0200
Message-Id: <20210514164514.1057680-4-mreitz@redhat.com>
In-Reply-To: <20210514164514.1057680-1-mreitz@redhat.com>
References: <20210514164514.1057680-1-mreitz@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mreitz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=mreitz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.699,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-devel@nongnu.org, Max Reitz <mreitz@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>

Max reported the following bug:

$ ./qemu-img create -f raw src.img 1G
$ ./qemu-img create -f raw dst.img 1G

$ (echo '
   {"execute":"qmp_capabilities"}
   {"execute":"blockdev-mirror",
    "arguments":{"job-id":"mirror",
                 "device":"source",
                 "target":"target",
                 "sync":"full",
                 "filter-node-name":"mirror-top"}}
'; sleep 3; echo '
   {"execute":"human-monitor-command",
    "arguments":{"command-line":
                 "qemu-io mirror-top \"write 0 1G\""}}') \
| x86_64-softmmu/qemu-system-x86_64 \
   -qmp stdio \
   -blockdev file,node-name=source,filename=src.img \
   -blockdev file,node-name=target,filename=dst.img \
   -object iothread,id=iothr0 \
   -device virtio-blk,drive=source,iothread=iothr0

crashes:

0  raise () at /usr/lib/libc.so.6
1  abort () at /usr/lib/libc.so.6
2  error_exit
   (err=<optimized out>,
   msg=msg@entry=0x55fbb1634790 <__func__.27> "qemu_mutex_unlock_impl")
   at ../util/qemu-thread-posix.c:37
3  qemu_mutex_unlock_impl
   (mutex=mutex@entry=0x55fbb25ab6e0,
   file=file@entry=0x55fbb1636957 "../util/async.c",
   line=line@entry=650)
   at ../util/qemu-thread-posix.c:109
4  aio_context_release (ctx=ctx@entry=0x55fbb25ab680) at ../util/async.c:650
5  bdrv_do_drained_begin
   (bs=bs@entry=0x55fbb3a87000, recursive=recursive@entry=false,
   parent=parent@entry=0x0,
   ignore_bds_parents=ignore_bds_parents@entry=false,
   poll=poll@entry=true) at ../block/io.c:441
6  bdrv_do_drained_begin
   (poll=true, ignore_bds_parents=false, parent=0x0, recursive=false,
   bs=0x55fbb3a87000) at ../block/io.c:448
7  blk_drain (blk=0x55fbb26c5a00) at ../block/block-backend.c:1718
8  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:498
9  blk_unref (blk=0x55fbb26c5a00) at ../block/block-backend.c:491
10 hmp_qemu_io (mon=0x7fffaf3fc7d0, qdict=<optimized out>)
   at ../block/monitor/block-hmp-cmds.c:628

man pthread_mutex_unlock
...
    EPERM  The  mutex type is PTHREAD_MUTEX_ERRORCHECK or
    PTHREAD_MUTEX_RECURSIVE, or the mutex is a robust mutex, and the
    current thread does not own the mutex.

So, thread doesn't own the mutex. And we have iothread here.

Next, note that AIO_WAIT_WHILE() documents that ctx must be acquired
exactly once by caller. But where is it acquired in the call stack?
Seems nowhere.

qemuio_command do acquire aio context.. But we need context acquired
around blk_unref() as well and actually around blk_insert_bs() too.

Let's refactor qemuio_command so that it doesn't acquire aio context
but callers do that instead. This way we can cleanly acquire aio
context in hmp_qemu_io() around all three calls.

Reported-by: Max Reitz <mreitz@redhat.com>
Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Message-Id: <20210423134233.51495-1-vsementsov@virtuozzo.com>
[mreitz: Fixed comment]
Signed-off-by: Max Reitz <mreitz@redhat.com>
---
 block/monitor/block-hmp-cmds.c | 31 +++++++++++++++++++++----------
 qemu-io-cmds.c                 |  8 ++++----
 qemu-io.c                      | 17 +++++++++++++++--
 3 files changed, 40 insertions(+), 16 deletions(-)

diff --git a/block/monitor/block-hmp-cmds.c b/block/monitor/block-hmp-cmds.c
index ebf1033f31..3e6670c963 100644
--- a/block/monitor/block-hmp-cmds.c
+++ b/block/monitor/block-hmp-cmds.c
@@ -557,8 +557,10 @@ void hmp_eject(Monitor *mon, const QDict *qdict)
 
 void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 {
-    BlockBackend *blk;
+    BlockBackend *blk = NULL;
+    BlockDriverState *bs = NULL;
     BlockBackend *local_blk = NULL;
+    AioContext *ctx = NULL;
     bool qdev = qdict_get_try_bool(qdict, "qdev", false);
     const char *device = qdict_get_str(qdict, "device");
     const char *command = qdict_get_str(qdict, "command");
@@ -573,20 +575,24 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
     } else {
         blk = blk_by_name(device);
         if (!blk) {
-            BlockDriverState *bs = bdrv_lookup_bs(NULL, device, &err);
-            if (bs) {
-                blk = local_blk = blk_new(bdrv_get_aio_context(bs),
-                                          0, BLK_PERM_ALL);
-                ret = blk_insert_bs(blk, bs, &err);
-                if (ret < 0) {
-                    goto fail;
-                }
-            } else {
+            bs = bdrv_lookup_bs(NULL, device, &err);
+            if (!bs) {
                 goto fail;
             }
         }
     }
 
+    ctx = blk ? blk_get_aio_context(blk) : bdrv_get_aio_context(bs);
+    aio_context_acquire(ctx);
+
+    if (bs) {
+        blk = local_blk = blk_new(bdrv_get_aio_context(bs), 0, BLK_PERM_ALL);
+        ret = blk_insert_bs(blk, bs, &err);
+        if (ret < 0) {
+            goto fail;
+        }
+    }
+
     /*
      * Notably absent: Proper permission management. This is sad, but it seems
      * almost impossible to achieve without changing the semantics and thereby
@@ -616,6 +622,11 @@ void hmp_qemu_io(Monitor *mon, const QDict *qdict)
 
 fail:
     blk_unref(local_blk);
+
+    if (ctx) {
+        aio_context_release(ctx);
+    }
+
     hmp_handle_error(mon, err);
 }
 
diff --git a/qemu-io-cmds.c b/qemu-io-cmds.c
index 97611969cb..998b67186d 100644
--- a/qemu-io-cmds.c
+++ b/qemu-io-cmds.c
@@ -2457,9 +2457,12 @@ static const cmdinfo_t help_cmd = {
     .oneline    = "help for one or all commands",
 };
 
+/*
+ * Called with aio context of blk acquired. Or with qemu_get_aio_context()
+ * context acquired if blk is NULL.
+ */
 int qemuio_command(BlockBackend *blk, const char *cmd)
 {
-    AioContext *ctx;
     char *input;
     const cmdinfo_t *ct;
     char **v;
@@ -2471,10 +2474,7 @@ int qemuio_command(BlockBackend *blk, const char *cmd)
     if (c) {
         ct = find_command(v[0]);
         if (ct) {
-            ctx = blk ? blk_get_aio_context(blk) : qemu_get_aio_context();
-            aio_context_acquire(ctx);
             ret = command(blk, ct, c, v);
-            aio_context_release(ctx);
         } else {
             fprintf(stderr, "command \"%s\" not found\n", v[0]);
             ret = -EINVAL;
diff --git a/qemu-io.c b/qemu-io.c
index bf902302e9..57f07501df 100644
--- a/qemu-io.c
+++ b/qemu-io.c
@@ -411,6 +411,19 @@ static void prep_fetchline(void *opaque)
     *fetchable= 1;
 }
 
+static int do_qemuio_command(const char *cmd)
+{
+    int ret;
+    AioContext *ctx =
+        qemuio_blk ? blk_get_aio_context(qemuio_blk) : qemu_get_aio_context();
+
+    aio_context_acquire(ctx);
+    ret = qemuio_command(qemuio_blk, cmd);
+    aio_context_release(ctx);
+
+    return ret;
+}
+
 static int command_loop(void)
 {
     int i, fetchable = 0, prompted = 0;
@@ -418,7 +431,7 @@ static int command_loop(void)
     char *input;
 
     for (i = 0; !quit_qemu_io && i < ncmdline; i++) {
-        ret = qemuio_command(qemuio_blk, cmdline[i]);
+        ret = do_qemuio_command(cmdline[i]);
         if (ret < 0) {
             last_error = ret;
         }
@@ -446,7 +459,7 @@ static int command_loop(void)
         if (input == NULL) {
             break;
         }
-        ret = qemuio_command(qemuio_blk, input);
+        ret = do_qemuio_command(input);
         g_free(input);
 
         if (ret < 0) {
-- 
2.31.1


