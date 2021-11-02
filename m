Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5014432A5
	for <lists+qemu-devel@lfdr.de>; Tue,  2 Nov 2021 17:23:32 +0100 (CET)
Received: from localhost ([::1]:41880 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mhwZP-0004OQ-Qh
	for lists+qemu-devel@lfdr.de; Tue, 02 Nov 2021 12:23:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53330)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIY-0007fi-Oo
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28072)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <kwolf@redhat.com>) id 1mhwIT-0004JE-Hk
 for qemu-devel@nongnu.org; Tue, 02 Nov 2021 12:06:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635869159;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=guAJMG8oI2MZrQtjylIKoBdrk3+2eeShAuLN7VCqv84=;
 b=ZP8L6cNHWSmi8qxbYH9/qDaxFR/ZULabTqzhSDZ+MVT++5PkjUgjzhKIOhEIX/Nr4XAHyC
 m4VgXnpS8xnjNX5n1KHi3epugGzgg1rMGDttsArAdxwL76x6smghu3VFAxO88EkTF6DobW
 Sie/BWF3WnEve7UCG7TBMGi7H7jlEdw=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-561-QwZh3FWsMlyAp1VNugi-7Q-1; Tue, 02 Nov 2021 12:05:56 -0400
X-MC-Unique: QwZh3FWsMlyAp1VNugi-7Q-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 75FB51006AA8;
 Tue,  2 Nov 2021 16:05:55 +0000 (UTC)
Received: from merkur.redhat.com (unknown [10.39.193.81])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 7D3E15D9D5;
 Tue,  2 Nov 2021 16:05:54 +0000 (UTC)
From: Kevin Wolf <kwolf@redhat.com>
To: qemu-block@nongnu.org
Subject: [PULL 08/12] linux-aio: add `dev_max_batch` parameter to
 laio_io_unplug()
Date: Tue,  2 Nov 2021 17:05:24 +0100
Message-Id: <20211102160528.206766-9-kwolf@redhat.com>
In-Reply-To: <20211102160528.206766-1-kwolf@redhat.com>
References: <20211102160528.206766-1-kwolf@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kwolf@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124; envelope-from=kwolf@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.702,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: kwolf@redhat.com, peter.maydell@linaro.org, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

From: Stefano Garzarella <sgarzare@redhat.com>

Between the submission of a request and the unplug, other devices
with larger limits may have been queued new requests without flushing
the batch.

Using the new `dev_max_batch` parameter, laio_io_unplug() can check
if the batch exceeds the device limit to flush the current batch.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
Message-Id: <20211026162346.253081-4-sgarzare@redhat.com>
Signed-off-by: Kevin Wolf <kwolf@redhat.com>
---
 include/block/raw-aio.h | 3 ++-
 block/file-posix.c      | 2 +-
 block/linux-aio.c       | 8 +++++---
 3 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/block/raw-aio.h b/include/block/raw-aio.h
index ebd042fa27..21fc10c4c9 100644
--- a/include/block/raw-aio.h
+++ b/include/block/raw-aio.h
@@ -56,7 +56,8 @@ int coroutine_fn laio_co_submit(BlockDriverState *bs, LinuxAioState *s, int fd,
 void laio_detach_aio_context(LinuxAioState *s, AioContext *old_context);
 void laio_attach_aio_context(LinuxAioState *s, AioContext *new_context);
 void laio_io_plug(BlockDriverState *bs, LinuxAioState *s);
-void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s);
+void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
+                    uint64_t dev_max_batch);
 #endif
 /* io_uring.c - Linux io_uring implementation */
 #ifdef CONFIG_LINUX_IO_URING
diff --git a/block/file-posix.c b/block/file-posix.c
index c2c94fca66..7a27c83060 100644
--- a/block/file-posix.c
+++ b/block/file-posix.c
@@ -2125,7 +2125,7 @@ static void raw_aio_unplug(BlockDriverState *bs)
 #ifdef CONFIG_LINUX_AIO
     if (s->use_linux_aio) {
         LinuxAioState *aio = aio_get_linux_aio(bdrv_get_aio_context(bs));
-        laio_io_unplug(bs, aio);
+        laio_io_unplug(bs, aio, s->aio_max_batch);
     }
 #endif
 #ifdef CONFIG_LINUX_IO_URING
diff --git a/block/linux-aio.c b/block/linux-aio.c
index 88b44fee72..f53ae72e21 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -356,11 +356,13 @@ void laio_io_plug(BlockDriverState *bs, LinuxAioState *s)
     s->io_q.plugged++;
 }
 
-void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s)
+void laio_io_unplug(BlockDriverState *bs, LinuxAioState *s,
+                    uint64_t dev_max_batch)
 {
     assert(s->io_q.plugged);
-    if (--s->io_q.plugged == 0 &&
-        !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending)) {
+    if (s->io_q.in_queue >= laio_max_batch(s, dev_max_batch) ||
+        (--s->io_q.plugged == 0 &&
+         !s->io_q.blocked && !QSIMPLEQ_EMPTY(&s->io_q.pending))) {
         ioq_submit(s);
     }
 }
-- 
2.31.1


