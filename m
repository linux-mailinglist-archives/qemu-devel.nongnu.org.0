Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B84F841611A
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 16:34:31 +0200 (CEST)
Received: from localhost ([::1]:56136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTPny-0002Bm-QZ
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 10:34:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51802)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mTPko-0007ki-DF
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31364)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mTPkm-0004CJ-LN
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:31:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632407472;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=POLYk5IYGcafIaeP/MCHeGTr/D6PLSeCJxuZD+VJ2BM=;
 b=GIw1iIPWIB1lbcOZK+K0hBFYzMORfbHL2O+6VbN4cIHPa2S0qBlmoGte6kLWme1jZkztdh
 ztQZqyODFw10WROIO8Qxn5R4NdvmZq8HXLNp7jH+gaevLEsYdPuvfXzmbSKQnvq5dhnZix
 47jo/SPQTX/JYA9eT2/7YQS9xXZMi4E=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-409-oeFdVtfzMyiJnkfz5vSqdQ-1; Thu, 23 Sep 2021 10:31:08 -0400
X-MC-Unique: oeFdVtfzMyiJnkfz5vSqdQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9505619253C2;
 Thu, 23 Sep 2021 14:31:07 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id F2F6D197FC;
 Thu, 23 Sep 2021 14:31:05 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 2/3] linux-aio: add `dev_max_batch` parameter to
 laio_co_submit()
Date: Thu, 23 Sep 2021 16:30:59 +0200
Message-Id: <20210923143100.182979-3-sgarzare@redhat.com>
In-Reply-To: <20210923143100.182979-1-sgarzare@redhat.com>
References: <20210923143100.182979-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -42
X-Spam_score: -4.3
X-Spam_bar: ----
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.473,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

This new parameter can be used by block devices to limit the
Linux AIO batch size more than the limit set by the AIO context.

file-posix backend supports this, passing its `aio-max-batch` option
previously added.

Add an helper function to calculate the maximum batch size.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 include/block/raw-aio.h |  3 ++-
 block/file-posix.c      |  3 ++-
 block/linux-aio.c       | 30 ++++++++++++++++++++++--------
 3 files changed, 26 insertions(+), 10 deletions(-)

diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index 251b10d273..ebd042fa27 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -51,7 +51,8 @@ typedef struct LinuxAioState LinuxAioState;
 LinuxAioState *laio_init(Error **errp);
 void laio_cleanup(LinuxAioState *s);
 int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type);
+                                uint64_t offset, QEMUIOVector *qiov, int type,
+                                uint64_t dev_max_batch);
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
 void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
 void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
diff --git a/block/file-posix.c b/block/file-posix.c
index da50e94034..614c725235 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2066,7 +2066,8 @@ static int coroutine_fn raw_co_prw(BlockDriverState *bs, uint64_t offset,
     } else if (s->use_linux_aio) {
         LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
         assert(qiov->size == bytes);
-        return laio_co_submit(bs, aio, s->fd, offset, qiov, type);
+        return laio_co_submit(bs, aio, s->fd, offset, qiov, type,
+                              s->aio_max_batch);
 #endif
     }
 
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 0dab507b71..88b44fee72 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -334,6 +334,23 @@ static void ioq_submit(LinuxAioState *s)
     }
 }
 
+static uint64_t laio_max_batch(LinuxAioState *s, uint64_t dev_max_batch)
+{
+    uint64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
+
+    /*
+     * AIO context can be shared between multiple block devices, so
+     * `dev_max_batch` allows reducing the batch size for latency-sensitive
+     * devices.
+     */
+    max_batch = MIN_NON_ZERO(dev_max_batch, max_batch);
+
+    /* limit the batch with the number of available events */
+    max_batch = MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight, max_batch);
+
+    return max_batch;
+}
+
 void laio_io_plug(BlockDriverState *bs, LinuxAioState *s)
 {
     s->io_q.plugged++;
@@ -349,15 +366,11 @@ void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s)
 }
 
 static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
-                          int type)
+                          int type, uint64_t dev_max_batch)
 {
     LinuxAioState *s = laiocb->ctx;
     struct iocb *iocbs = &laiocb->iocb;
     QEMUIOVector *qiov = laiocb->qiov;
-    int64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
-
-    /* limit the batch with the number of available events */
-    max_batch = MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight, max_batch);
 
     switch (type) {
     case QEMU_AIO_WRITE:
@@ -378,7 +391,7 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     s->io_q.in_queue++;
     if (!s->io_q.blocked &&
         (!s->io_q.plugged ||
-         s->io_q.in_queue >= max_batch)) {
+         s->io_q.in_queue >= laio_max_batch(s, dev_max_batch))) {
         ioq_submit(s);
     }
 
@@ -386,7 +399,8 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
 }
 
 int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
-                                uint64_t offset, QEMUIOVector *qiov, int type)
+                                uint64_t offset, QEMUIOVector *qiov, int type,
+                                uint64_t dev_max_batch)
 {
     int ret;
     struct qemu_laiocb laiocb = {
@@ -398,7 +412,7 @@ int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
         .qiov       = qiov,
     };
 
-    ret = laio_do_submit(fd, &laiocb, offset, type);
+    ret = laio_do_submit(fd, &laiocb, offset, type, dev_max_batch);
     if (ret < 0) {
         return ret;
     }
-- 
2.31.1


