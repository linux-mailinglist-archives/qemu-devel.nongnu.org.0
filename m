Return-Path: <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>
X-Original-To: lists+qemu-devel@lfdr.de
Delivered-To: lists+qemu-devel@lfdr.de
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	by mail.lfdr.de (Postfix) with ESMTPS id B293C3D0B8E
	for <lists+qemu-devel@lfdr.de>; Wed, 21 Jul 2021 11:45:46 +0200 (CEST)
Received: from localhost ([::1]:36136 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+lists+qemu-devel=lfdr.de@nongnu.org>)
	id 1m68nR-0008Lm-NP
	for lists+qemu-devel@lfdr.de; Wed, 21 Jul 2021 05:45:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44068)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m68kT-0005uZ-Hx
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:42:41 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:27011)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1m68kR-0003MN-Mb
 for qemu-devel@nongnu.org; Wed, 21 Jul 2021 05:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1626860559;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+Y0MVXSBI9lM9tZrqQKyrXak/hxN23BmyOZhZ8bm93g=;
 b=aXkAy2QWfV5guB/lhD0fDM+mQI94hx4amNcnFRY775rdWQ2IrYyLP/X3Fvh4tL17JtInY7
 n+LgWbmUBgvZjT8IG0w6geGARRjQj+K+Y+Ho+sUxif5MC0r1BjwFtgsZ5EFtZYcdDsP33X
 5evZi812pvaeyTzmnn13lCQtWIKdFlU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-566-1PnUgoPbPAKtaApy1kh_8A-1; Wed, 21 Jul 2021 05:42:35 -0400
X-MC-Unique: 1PnUgoPbPAKtaApy1kh_8A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B33388C7AC1;
 Wed, 21 Jul 2021 09:42:34 +0000 (UTC)
Received: from steredhat.redhat.com (ovpn-113-80.ams2.redhat.com
 [10.36.113.80])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A0C2E60E1C;
 Wed, 21 Jul 2021 09:42:28 +0000 (UTC)
From: Stefano Garzarella <sgarzare@redhat.com>
To: Stefan Hajnoczi <stefanha@redhat.com>,
	qemu-devel@nongnu.org
Subject: [PATCH for-6.1? v2 3/3] linux-aio: limit the batch size using
 `aio-max-batch` parameter
Date: Wed, 21 Jul 2021 11:42:11 +0200
Message-Id: <20210721094211.69853-4-sgarzare@redhat.com>
In-Reply-To: <20210721094211.69853-1-sgarzare@redhat.com>
References: <20210721094211.69853-1-sgarzare@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
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
X-Spam_report: (-4.3 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.474,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: Fam Zheng <fam@euphon.net>, Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?q?Daniel=20P=2E=20Berrang=C3=A9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 Stefan Weil <sw@weilnetz.de>, Markus Armbruster <armbru@redhat.com>,
 Max Reitz <mreitz@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Eric Blake <eblake@redhat.com>, "Dr. David Alan Gilbert" <dgilbert@redhat.com>
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

Notes:
    v2:
    - limit the batch with the number of available events [stefanha]

 block/linux-aio.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/block/linux-aio.c b/block/linux-aio.c
index 3c0527c2bf..0dab507b71 100644
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
@@ -351,6 +354,10 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     LinuxAioState *s = laiocb->ctx;
     struct iocb *iocbs = &laiocb->iocb;
     QEMUIOVector *qiov = laiocb->qiov;
+    int64_t max_batch = s->aio_context->aio_max_batch ?: DEFAULT_MAX_BATCH;
+
+    /* limit the batch with the number of available events */
+    max_batch = MIN_NON_ZERO(MAX_EVENTS - s->io_q.in_flight, max_batch);
 
     switch (type) {
     case QEMU_AIO_WRITE:
@@ -371,7 +378,7 @@ static int laio_do_submit(int fd, struct qemu_laiocb *laiocb, off_t offset,
     s->io_q.in_queue++;
     if (!s->io_q.blocked &&
         (!s->io_q.plugged ||
-         s->io_q.in_flight + s->io_q.in_queue >= MAX_EVENTS)) {
+         s->io_q.in_queue >= max_batch)) {
         ioq_submit(s);
     }
 
-- 
2.31.1


