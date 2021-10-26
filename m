Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id C532D43B723
	for <lists+qemu-devel@lfdr.de>; Tue, 26 Oct 2021 18:27:08 +0200 (CEST)
Received: from localhost ([::1]:40612 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mfPI3-00023A-TX
	for lists+qemu-devel@lfdr.de; Tue, 26 Oct 2021 12:27:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33328)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mfPF8-0007WI-DE
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:24:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:43191)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mfPF6-0003A1-Qv
 for qemu-devel@nongnu.org; Tue, 26 Oct 2021 12:24:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635265444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DhOZ62ranQNh21yilkyo4UeYEip9qs2hjLz0LKNEa3Q=;
 b=BoAxtuRwGtis+fylsnT02gEHHMnqBGwhK5h7hC5k3kYm3PIvfqWsbC1nDIrkt8jbjqW5yb
 +a+lBuGaDKMNkOGEX0Sg5bw2yhtt6yx4gdwcHsLFw4fME+toaXcD9n5ZokQMObNxLcvqBe
 cJ3JT72POP7/6cM67D4zPnCX1ratZ4I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-308-5OYJpZxXOuWTU-6-rNpn8g-1; Tue, 26 Oct 2021 12:24:02 -0400
X-MC-Unique: 5OYJpZxXOuWTU-6-rNpn8g-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id CAB1B1006AA4;
 Tue, 26 Oct 2021 16:24:01 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.194.96])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 48B7D69203;
 Tue, 26 Oct 2021 16:24:00 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 3/3] linux-aio: add `dev_max_batch` parameter to
 laio_io_unplug()
Date: Tue, 26 Oct 2021 18:23:46 +0200
Message-Id: <20211026162346.253081-4-sgarzare@redhat.com>
In-Reply-To: <20211026162346.253081-1-sgarzare@redhat.com>
References: <20211026162346.253081-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: Kevin Wolf <kwolf@redhat.com>, qemu-block@nongnu.org,
 Markus Armbruster <armbru@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Eric Blake <eblake@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

Between the submission of a request and the unplug, other devices
with larger limits may have been queued new requests without flushing
the batch.

Using the new `dev_max_batch` parameter, laio_io_unplug() can check
if the batch exceeds the device limit to flush the current batch.

Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
Reviewed-by: Kevin Wolf <kwolf@redhat.com>
Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
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
index baf4197e88..966eab8d0b 100644
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


