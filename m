Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F2A3BEA46
	for <lists+qemu-devel@lfdr.de>; Wed,  7 Jul 2021 17:04:37 +0200 (CEST)
Received: from localhost ([::1]:52608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m196K-0002ps-7L
	for lists+qemu-devel@lfdr.de; Wed, 07 Jul 2021 11:04:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35642)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m192f-00047a-RE
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:00:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:32019)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m192e-0006G7-B4
 for qemu-devel@nongnu.org; Wed, 07 Jul 2021 11:00:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1625670047;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=xv6E6Wt35ZNlndkXnnhHZQ4H/tCu5PIDlmg+Hy6dgJk=;
 b=WtoSNtzyBneDB0uhQws7j9pBjx6Ifv/WMhLRmg1P0JT3S95Ezbx0hLQ3wNiaL6uW/sfhoV
 3N7XwzPe0/qHy9zBGuDTdDPKP0c4rssNl22EKyRJQF7CxbXNqNJbWN12wpdV5MmpsNkd/c
 ndaSY74qFZdVqnrvBahWAuF0hxe1kmI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-U2ccUlGoP3mDCzoET_id3Q-1; Wed, 07 Jul 2021 11:00:44 -0400
X-MC-Unique: U2ccUlGoP3mDCzoET_id3Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
 [10.5.11.16])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 797A91934119;
 Wed,  7 Jul 2021 15:00:43 +0000 (UTC)
Received: from steredhat.tendawifi.com (ovpn-112-132.ams2.redhat.com
 [10.36.112.132])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 720FA5FC07;
 Wed,  7 Jul 2021 15:00:40 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH 3/3] linux-aio: limit the batch size using `aio-max-batch`
 parameter
Date: Wed,  7 Jul 2021 17:00:19 +0200
Message-Id: <20210707150019.201442-4-sgarzare@redhat.com>
In-Reply-To: <20210707150019.201442-1-sgarzare@redhat.com>
References: <20210707150019.201442-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=sgarzare@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.439,
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
Cc: Kevin Wolf <kwolf@redhat.com>, Fam Zheng <fam@euphon.net>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eric Blake <eblake@redhat.com>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>
Errors-To: qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>

When there are multiple queues attached to the same AIO context,
some requests may experience high latency, since in the worst case
the AIO engine queue is only flushed when it is full (MAX_EVENTS) or
there are no more queues plugged.

Commit 2558cb8dd4 ("linux-aio: increasing MAX_EVENTS to a larger
hardcoded value") changed MAX_EVENTS from 128 to 1024, to increase
the number of in-flight requests. But this change also increased
the potential maximum batch to 1024 elements.

When there is a single queue attached to the AIO context, the issue
is mitigated from laio_io_unplug() that will flush the queue every
time is invoked since there can't be others queue plugged.

Let's use the new `aio-max-batch` IOThread parameter to mitigate
this issue, limiting the number of requests in a batch.

We also define a default value (32): this value is obtained running
some benchmarks and it represents a good tradeoff between the latency
increase while a request is queued and the cost of the io_submit(2)
system call.

Signed-off-by: Stefano Garzarella <sgarzare@redhat.com>
---
 block/linux-aio.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/block/linux-aio.c b/block/linux-aio.c
index 3c0527c2bf..8a7bb136fc 100644
--- a/block/linux-aio.c
+++ b/block/linux-aio.c
@@ -28,6 +28,9 @@
  */
 #define MAX_EVENTS 1024
 
+/* Maximum number of requests in a batch. (default value) */
+#define DEFAULT_MAX_BATCH 32
+
 struct qemu_laiocb {
     Coroutine *co;
     LinuxAioState *ctx;
@@ -351,6 +354,7 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     LinuxAioState *s = laiocb->ctx;
     struct iocb *iocbs = &laiocb->iocb;
     QEMUIOVector *qiov = laiocb->qiov;
+    int64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
 
     switch (type) {
     case QEMU_AIO_WRITE:
@@ -371,7 +375,7 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     s->io_q.in_queue++;
     if (!s->io_q.blocked &&
         (!s->io_q.plugged ||
-         s->io_q.in_flight + s->io_q.in_queue >= MAX_EVENTS)) {
+         s->io_q.in_queue >= max_batch)) {
         ioq_submit(s);
     }
 
-- 
2.31.1


