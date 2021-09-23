Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A948416120
	for <lists+qemu-devel@lfdr.de>; Thu, 23 Sep 2021 16:36:45 +0200 (CEST)
Received: from localhost ([::1]:60338 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1mTPq8-000593-If
	for lists+qemu-devel@lfdr.de; Thu, 23 Sep 2021 10:36:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:51804)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mTPkp-0007ks-9n
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:31:15 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32621)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1mTPkm-0004CD-I6
 for qemu-devel@nongnu.org; Thu, 23 Sep 2021 10:31:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632407471;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JZi5383jlzG0/6auTb7p4D700iujhWdEQdKvszV7ntE=;
 b=QIgec3bP4u1nh4/07oYMY5DptTQ5lS5od2XsmvjyWQ1E3MhtBRUM8ODyTCRu9SI8xnsHII
 kYRtZMiyBovJ1eyY4gU5H25M2Yo4RmjcJ/ctA+QJkTNF8D957BNSVkjbcL/wn8djK35OTM
 u/O8x64qzRDXj4KW4R6vKA7K5WwJTW8=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-QbH-77BHOJa5IcdpEbg1bg-1; Thu, 23 Sep 2021 10:31:10 -0400
X-MC-Unique: QbH-77BHOJa5IcdpEbg1bg-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 89800100CCC5;
 Thu, 23 Sep 2021 14:31:09 +0000 (UTC)
Received: from steredhat.redhat.com (unknown [10.39.193.145])
 by smtp.corp.redhat.com (Postfix) with ESMTP id E5081652A1;
 Thu, 23 Sep 2021 14:31:07 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-aio: add `dev_max_batch` parameter to
 laio_io_unplug()
Date: Thu, 23 Sep 2021 16:31:00 +0200
Message-Id: <20210923143100.182979-4-sgarzare@redhat.com>
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
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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

Between the submission of a request and the unplug, other devices
with larger limits may have been queued new requests without flushing
the batch.

Using the new `dev_max_batch` parameter, laio_io_unplug() can check
if the batch exceeds the device limit to flush the current batch.

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
index 614c725235..f31a75a715 100644
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


